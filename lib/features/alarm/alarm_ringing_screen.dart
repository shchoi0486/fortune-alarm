import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../providers/alarm_list_provider.dart';
import '../../providers/mission_provider.dart';
import '../../services/notification_service.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/ml_service.dart';
import '../../data/models/alarm_model.dart';
import '../../core/constants/mission_type.dart';
import '../../services/camera_service.dart';
import '../mission_math/math_mission_screen.dart';
import '../fortune/fortune_mission_screen.dart';
import '../mission_shake/shake_mission_screen.dart';
import '../mission_none/simple_alarm_screen.dart';
import '../mission_camera/mission_camera_screen.dart';
import '../mission/supplement/supplement_mission_screen.dart';
import '../mission_fortune_catch/fortune_catch_mission_screen.dart';
import '../mission_number_order/number_order_mission_screen.dart';
import '../mission_hidden_button/hidden_button_mission_screen.dart';
import '../mission_tap_sprint/tap_sprint_mission_screen.dart';
import '../mission_left_right/left_right_mission_screen.dart';
import '../mission_walk/walk_mission_screen.dart';
import '../mission_face/face_detection_mission_screen.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../widgets/video_background_widget.dart';

import 'package:flutter/services.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class AlarmRingingScreen extends ConsumerStatefulWidget {
  final String alarmId;

  const AlarmRingingScreen({super.key, required this.alarmId});

  @override
  ConsumerState<AlarmRingingScreen> createState() => _AlarmRingingScreenState();
}

class _AlarmRingingScreenState extends ConsumerState<AlarmRingingScreen> with WidgetsBindingObserver {
  AlarmModel? _alarm;
  BoxDecoration? _selectedBgDecoration;
  bool _isVideo = false;
  String? _videoPath;
  bool _isVideoAsset = false;
  String? _resolvedMissionBackgroundPath;

  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _volumeEnforcementTimer;
  Timer? _timeTimer;
  Timer? _missionTimeoutTimer;
  bool _isLoading = true;
  bool _isMissionStarted = false;
  DateTime? _snoozeTargetTime;
  int? _snoozeRemainingAfterTap;
  
  bool _isMissionCompleted = false;

  void _closeToMain() {
    if (!mounted) return;
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    navigator.pushNamedAndRemoveUntil('/main', (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _markActiveRinging();
    
    _loadAlarm();
    
    // ML 서비스 미리 초기화 (카메라 미션 대비)
    MLService().initialize().catchError((e) {
      debugPrint('ML pre-initialization failed: $e');
    });

    // 카메라 미리 준비 (availableCameras 캐싱)
    ref.read(cameraControllerProvider.notifier).initializeCamera().catchError((e) {
      debugPrint('Camera pre-initialization failed: $e');
    });

    // 시간 업데이트
    _timeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });

    // 볼륨 강제 설정 (1초마다)
    _startVolumeEnforcement();
    _ensureForegroundServiceRunning();
  }

  Future<void> _markActiveRinging() async {
    try {
      final box = await Hive.openBox('app_state');
      await box.put('active_ringing_alarm_id', widget.alarmId);
      await box.put('active_ringing_set_at', DateTime.now().toIso8601String());
      await box.flush();
    } catch (_) {}
  }

  Future<void> _ensureForegroundServiceRunning() async {
    try {
      if (!await FlutterForegroundTask.isRunningService) {
        await FlutterForegroundTask.startService(
          serviceId: 256,
          notificationTitle: '스냅 알람',
          notificationText: '알람이 울리고 있습니다!',
          notificationIcon: NotificationIcon(
            metaDataName: 'com.seriessnap.fortunealarm.notification_icon',
            backgroundColor: const Color(0xFF5C6BC0),
          ),
          callback: startCallback,
        );
        debugPrint('[AlarmRingingScreen] Foreground Service STARTED.');
      } else {
        debugPrint('[AlarmRingingScreen] Foreground Service is already running.');
      }
    } catch (e) {
      debugPrint('[AlarmRingingScreen] Failed to start Foreground Service: $e');
    }
  }

  void _startVolumeEnforcement() {
    if (Platform.isAndroid) {
      const channel = MethodChannel('com.seriessnap.fortunealarm/foreground');
      _volumeEnforcementTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (!mounted || _isMissionCompleted) {
          timer.cancel();
          return;
        }
        try {
          await channel.invokeMethod('setMaxAlarmVolume');
        } catch (e) {
          debugPrint('Error setting max alarm volume: $e');
        }
      });
    }
  }

  Future<void> _loadAlarm() async {
    debugPrint('[AlarmRingingScreen] Loading alarm with ID: ${widget.alarmId}');
    final alarmBox = await Hive.openBox<AlarmModel>('alarms');
    final alarm = alarmBox.get(widget.alarmId);
    
    if (alarm != null) {
      debugPrint('[AlarmRingingScreen] Loaded alarm: ${alarm.id}, Ringtone: ${alarm.ringtonePath}');
    } else {
      debugPrint('[AlarmRingingScreen] Alarm not found for ID: ${widget.alarmId}');
    }

    if (mounted) {
      setState(() {
        _alarm = alarm;
      });

      if (_alarm != null) {
        // 배경 초기화 (랜덤 배경 등)
        await _initializeBackground();

        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }

        // 화면이 완전히 빌드된 후 소리를 재생하기 위해 약간의 딜레이를 줍니다.
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted && !_isMissionStarted && _snoozeTargetTime == null) {
            _playAlarm();
          }
        });
      } else {
        debugPrint('Error: Alarm with ID ${widget.alarmId} not found!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorLoadingAlarm)),
        );
        Future.delayed(const Duration(seconds: 2), () {
          _closeToMain();
        });
      }
    }
  }

  /// 스누즈가 필요한 경우 미리 다음 알람을 예약합니다.
  Future<void> _scheduleNextSnoozeIfNeeded() async {
    if (_alarm == null) return;
    
    // 스누즈 설정 확인
    if (_alarm!.snoozeInterval <= 0 || _alarm!.maxSnoozeCount <= 0) return;

    bool isFirstSnooze = !_alarm!.id.endsWith('_snooze');
    int currentRemaining = isFirstSnooze 
        ? _alarm!.maxSnoozeCount 
        : (_alarm!.remainingSnoozeCount > 0 ? _alarm!.remainingSnoozeCount : 0);
    
    // [수정] 남은 횟수가 0보다 크면 스누즈 예약 (기존 1에서 0으로 변경)
    if (currentRemaining <= 0) {
      debugPrint('[AlarmRingingScreen] No more snooze rounds left. No auto-snooze.');
      return;
    }

    debugPrint('[AlarmRingingScreen] Auto-scheduling next snooze (Remaining: $currentRemaining)');
    await AlarmSchedulerService.snoozeAlarm(_alarm!);
  }

  Future<Directory> _getBackgroundImagesDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final bgDir = Directory(path.join(appDir.path, 'background_images'));
    if (!await bgDir.exists()) {
      await bgDir.create(recursive: true);
    }
    return bgDir;
  }

  Future<void> _initializeBackground() async {
    if (_alarm == null) return;

    BoxDecoration? newDecoration;
    bool isVideo = false;
    String? videoPath;
    bool isVideoAsset = false;
    String? resolvedPath;

    if (_alarm!.backgroundPath == 'random_background') {
      final random = math.Random();
      final List<String> options = [];

      try {
        final manifestContent = await rootBundle.loadString('AssetManifest.json');
        final Map<String, dynamic> manifestMap = json.decode(manifestContent);

        const validExtensions = ['.mp4', '.webm', '.jpg', '.jpeg', '.png', '.webp'];

        bool isValidAsset(String key) {
          return validExtensions.any((ext) => key.toLowerCase().endsWith(ext));
        }

        bool isAllowedCategoryAsset(String key) {
          final decodedKey = Uri.decodeFull(key).toLowerCase();
          if (!decodedKey.startsWith('assets/images/')) return false;
          if (decodedKey.contains('/simple/')) return false;
          if (decodedKey.contains('/tarot/')) return false;
          return decodedKey.contains('/character/') ||
              decodedKey.contains('/animal/') ||
              decodedKey.contains('/illustration/') ||
              decodedKey.contains('/landscape/');
        }

        options.addAll(
          manifestMap.keys.where((key) => isAllowedCategoryAsset(key) && isValidAsset(key)),
        );
      } catch (e) {
        debugPrint('Error loading asset manifest for random background: $e');
      }

      if (options.isEmpty) {
        options.addAll([
          'assets/images/character/all.webp',
          'assets/images/character/dog.webp',
          'assets/images/character/panda.webp',
          'assets/images/character/rabbit.webp',
          'assets/images/character/tiger.webp',
          'assets/images/illustration/bear.webp',
          'assets/images/landscape/bridge.webp',
          'assets/images/landscape/road.webp',
          'assets/images/landscape/sea.webp',
          'assets/images/landscape/sky.webp',
        ]);
      }
      
      // Load user images
      try {
        final bgDir = await _getBackgroundImagesDir();
        if (await bgDir.exists()) {
          final userFiles = bgDir.listSync()
              .whereType<File>()
              .map((f) => f.path)
              .where((p) {
                final lower = p.toLowerCase();
                return lower.endsWith('.jpg') || lower.endsWith('.png') || lower.endsWith('.jpeg') ||
                       lower.endsWith('.mp4') || lower.endsWith('.webm');
              })
              .toList();
          options.addAll(userFiles);
        }
      } catch (e) {
        debugPrint('Error loading user images: $e');
      }

      final selectedPath = options[random.nextInt(options.length)];
      final lower = selectedPath.toLowerCase();
      resolvedPath = selectedPath;
      
      if (lower.endsWith('.mp4') || lower.endsWith('.webm')) {
        isVideo = true;
        videoPath = selectedPath;
        isVideoAsset = selectedPath.startsWith('assets/');
      } else {
        if (selectedPath.startsWith('assets/')) {
          newDecoration = BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedPath),
              fit: BoxFit.cover,
            ),
          );
        } else {
          newDecoration = BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(selectedPath)),
              fit: BoxFit.cover,
            ),
          );
        }
      }
    } else if (_alarm!.backgroundPath != null) {
      final path = _alarm!.backgroundPath!;
      final lower = path.toLowerCase();
      resolvedPath = path;
      
      if (path.startsWith('color:')) {
        int colorValue = int.parse(path.split(':')[1]);
        newDecoration = BoxDecoration(color: Color(colorValue));
      } else if (lower.endsWith('.mp4') || lower.endsWith('.webm')) {
        isVideo = true;
        videoPath = path;
        isVideoAsset = path.startsWith('assets/');
      } else if (path.startsWith('assets/')) {
        newDecoration = BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        );
      } else {
        newDecoration = BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(path)),
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      // 기본 배경 이미지
      newDecoration = const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash/splash_bg.webp'),
          fit: BoxFit.cover,
        ),
      );
    }

    if (mounted) {
      setState(() {
        _selectedBgDecoration = newDecoration;
        _isVideo = isVideo;
        _videoPath = videoPath;
        _isVideoAsset = isVideoAsset;
        _resolvedMissionBackgroundPath = resolvedPath;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final route = ModalRoute.of(context);
      if (route?.isCurrent ?? true) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      }
    }
  }

  @override
  void dispose() {
    debugPrint('[AlarmRingingScreen] Dispose called. Cleaning up...');
    WidgetsBinding.instance.removeObserver(this);
    _volumeTimer?.cancel();
    _volumeEnforcementTimer?.cancel();
    _timeTimer?.cancel();
    _missionTimeoutTimer?.cancel();
    
    // 미션이 완료되지 않은 상태에서 dispose가 호출된 경우 (예: 사용자가 앱을 강제로 끔)
    // 알람 소리를 끄지 않고 서비스가 유지되도록 하거나, 로그를 남겨 재실행을 유도할 수 있습니다.
    if (!_isMissionCompleted) {
      debugPrint('[AlarmRingingScreen] WARNING: UI disposed without mission completion!');
      // 여기서 소리를 끄지 않으면 앱이 죽어도 서비스 Isolate에서 소리가 계속 날 가능성이 높아집니다.
      // 하지만 현재 구조상 UI Isolate의 _audioPlayer는 앱 종료 시 함께 죽으므로,
      // 서비스 측에서 소리를 재생하는 로직으로의 전환이 궁극적인 해결책입니다.
      
      // 우선은 사용자가 알람을 우회했음을 기록하여 다음 앱 실행 시 바로 알람 화면으로 보내는 용도로 활용 가능
    } else {
      // 정상적으로 화면이 종료될 때 안전 장치 해제
      if (_alarm != null) {
        AlarmSchedulerService.cancelSafetyAlarm(_alarm!.id);
      }
      // 알람 소리 및 진동 중지 보장
      _stopAlarm();
    }

    _audioPlayer.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Future<void> _playAlarm() async {
    if (_alarm == null || _isMissionStarted || _snoozeTargetTime != null || !mounted) return;

    debugPrint('[AlarmRingingScreen] _playAlarm called. sound: ${_alarm!.isSoundEnabled}, volume: ${_alarm!.volume}');

    try {
      if (_alarm!.isSoundEnabled) {
        String path = _alarm!.ringtonePath ?? 'default';
        // 만약 예전 데이터가 남아있어서 하이픈이 포함되어 있다면 언더바로 교체
        debugPrint('[AlarmRingingScreen] Final ringtone path: $path');
        
        // 'default' 벨소리인 경우 FlutterRingtonePlayer를 우선 사용 (시스템 기본 알람음)
        if (path == 'default' || path.isEmpty) {
          debugPrint('[AlarmRingingScreen] Playing default alarm sound via FlutterRingtonePlayer');
          await FlutterRingtonePlayer().playAlarm(
            looping: true, 
            volume: _alarm!.volume, 
            asAlarm: true
          );
        } else {
          // 커스텀 사운드는 AudioPlayer 사용
          String ext = 'ogg';
          path = path.trim(); // 공백 제거 안전장치
          debugPrint('[AlarmRingingScreen] Playing custom sound: assets/sounds/$path.$ext');
          
          try {
            // 플랫폼별 AudioContext 설정
            if (Platform.isAndroid) {
              // Android 전용 설정
              await _audioPlayer.setAudioContext(AudioContext(
                android: AudioContextAndroid(
                  isSpeakerphoneOn: true,
                  stayAwake: true,
                  contentType: AndroidContentType.sonification,
                  usageType: AndroidUsageType.alarm,
                  audioFocus: AndroidAudioFocus.gain,
                ),
              ));
            } else if (Platform.isIOS) {
              // iOS/macOS 전용 설정
              await _audioPlayer.setAudioContext(AudioContext(
                iOS: AudioContextIOS(
                  category: AVAudioSessionCategory.playback,
                  options: {
                    AVAudioSessionOptions.duckOthers,
                    AVAudioSessionOptions.mixWithOthers,
                    AVAudioSessionOptions.defaultToSpeaker,
                  },
                ),
              ));
            }

            await _audioPlayer.stop();
            await _audioPlayer.setReleaseMode(ReleaseMode.loop);
            
            // assets/sounds/ 디렉토리 내의 파일을 AssetSource로 설정
            // ringtonePath가 파일명(확장자 제외)이라고 가정
            try {
               debugPrint('[AlarmRingingScreen] Attempting to set AssetSource: sounds/$path.ogg');
               await _audioPlayer.setSource(AssetSource('sounds/$path.ogg'));
            } catch (e) {
              debugPrint('[AlarmRingingScreen] AssetSource failed for $path.ogg: $e. Attempting BytesSource fallback.');
              
              try {
                // AssetSource가 실패하면 직접 바이트로 로드하여 재생 시도 (경로 문제 해결 가능성)
                final ByteData data = await rootBundle.load('assets/sounds/$path.ogg');
                final Uint8List bytes = data.buffer.asUint8List();
                await _audioPlayer.setSource(BytesSource(bytes));
                debugPrint('[AlarmRingingScreen] BytesSource set successfully for $path.ogg');
              } catch (bytesError) {
                 debugPrint('[AlarmRingingScreen] BytesSource fallback failed for $path.ogg: $bytesError');
                 rethrow; // Trigger outer catch for default fallback
              }
            }
            
            double targetVolume = _alarm!.volume;
            if (targetVolume <= 0) targetVolume = 0.5;
            
            double initialVolume = _alarm!.isGradualVolume ? 0.1 : targetVolume;
            await _audioPlayer.setVolume(initialVolume);
            
            await _audioPlayer.resume();
            debugPrint('[AlarmRingingScreen] AudioPlayer resume() success for $path');
            
            if (_alarm!.isGradualVolume) {
              _startVolumeFadeIn(targetVolume);
            }
          } catch (ae) {
            debugPrint('[AlarmRingingScreen] AudioPlayer error for $path: $ae. Falling back to system default alarm.');
            
            // 커스텀 벨소리 재생 실패 시 바로 시스템 기본 알람음 사용
            await FlutterRingtonePlayer().playAlarm(
              looping: true, 
              volume: _alarm!.volume, 
              asAlarm: true
            );
          }
        }
      }

      if (_alarm!.isVibrationEnabled && await Vibration.hasVibrator() == true) {
        debugPrint('[AlarmRingingScreen] Starting vibration');
        _playVibration(_alarm!.vibrationPattern);
      }
    } catch (e) {
      debugPrint('[AlarmRingingScreen] Error in _playAlarm: $e');
      // 최후의 수단으로 시스템 알람음 재생 시도
      try {
        await FlutterRingtonePlayer().playAlarm(asAlarm: true, looping: true);
      } catch (re) {
        debugPrint('[AlarmRingingScreen] Final fallback failed: $re');
      }
    }
  }

  void _startVolumeFadeIn(double targetVolume) {
    double currentVolume = 0.1;
    _volumeTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (!mounted || _isMissionStarted || _isMissionCompleted) {
        timer.cancel();
        return;
      }
      currentVolume += 0.1;
      if (currentVolume >= targetVolume) {
        currentVolume = targetVolume;
        timer.cancel();
      }
      await _audioPlayer.setVolume(currentVolume);
    });
  }

  Future<void> _playVibration(String? pattern) async {
    Vibration.cancel();
    List<int> vibrationPattern;
    switch (pattern) {
      case 'short':
        vibrationPattern = [0, 500, 500, 500, 500];
        break;
      case 'long':
        vibrationPattern = [0, 2000, 2000, 2000, 2000];
        break;
      case 'heartbeat':
        vibrationPattern = [0, 200, 100, 200, 1000, 200, 100, 200, 1000];
        break;
      case 'sos':
        vibrationPattern = [0, 200, 100, 200, 100, 200, 500, 500, 200, 500, 200, 500, 500, 200, 100, 200, 100, 200];
        break;
      case 'quick':
        vibrationPattern = [0, 100, 50, 100, 50, 100, 50, 100, 50, 100];
        break;
      default:
        vibrationPattern = [0, 1000, 1000];
    }
    // repeat: 0 (인덱스 0부터 반복)
    Vibration.vibrate(pattern: vibrationPattern, repeat: 0);
  }

  Future<void> _clearPendingAlarmFlag() async {
    try {
      final stateBox = await Hive.openBox('app_state');
      await stateBox.delete('pending_alarm_payload');
      await stateBox.delete('pending_alarm_set_at');
      await stateBox.flush();
      debugPrint('[AlarmRingingScreen] Pending alarm flag cleared.');
    } catch (e) {
      debugPrint('[AlarmRingingScreen] Failed to clear pending flag: $e');
    }
  }

  Future<void> _stopAlarm() async {
    debugPrint('[AlarmRingingScreen] _stopAlarm called');
    try {
      try {
        final box = await Hive.openBox('app_state');
        await box.delete('active_ringing_alarm_id');
        await box.delete('active_ringing_set_at');
        await box.delete('active_alarm_mission_base_id');
        await box.delete('active_alarm_mission_started_at');
        await box.delete('active_alarm_mission_background_path');
        await box.flush();
      } catch (_) {}

      _volumeTimer?.cancel();
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();

      final stableId = AlarmSchedulerService.getStableId(widget.alarmId);
      await NotificationService().cancelNotification(stableId);

      if (await FlutterForegroundTask.isRunningService) {
        debugPrint('[AlarmRingingScreen] Stopping Foreground Service...');
        await FlutterForegroundTask.stopService();
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  Future<void> _pauseAlarmRingingForMission() async {
    try {
      _volumeTimer?.cancel();
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
    } catch (e) {
      debugPrint('Error pausing alarm for mission: $e');
    }
  }

  Future<void> _setMissionActive(bool isActive) async {
    try {
      final box = await Hive.openBox('app_state');
      if (isActive) {
        final baseId = widget.alarmId.replaceAll('_snooze', '');
        await box.put('active_alarm_mission_base_id', baseId);
        await box.put('active_alarm_mission_started_at', DateTime.now().toIso8601String());
        if (_alarm?.backgroundPath == 'random_background' && _resolvedMissionBackgroundPath != null) {
          await box.put('active_alarm_mission_background_path', _resolvedMissionBackgroundPath);
        } else {
          await box.delete('active_alarm_mission_background_path');
        }
      } else {
        await box.delete('active_alarm_mission_base_id');
        await box.delete('active_alarm_mission_started_at');
        await box.delete('active_alarm_mission_background_path');
      }
    } catch (e) {
      debugPrint('[AlarmRingingScreen] Failed to update mission state: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox.shrink(), // 인디케이터 제거: 검은 화면만 유지
      );
    }

    if (_alarm == null) {
      // _loadAlarm에서 이미 처리하지만, 만약을 위한 안전장치
      return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text(AppLocalizations.of(context)!.alarmNotFound, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
      );
    }

    Widget backgroundWidget;
    if (_isVideo && _videoPath != null) {
      backgroundWidget = VideoBackgroundWidget(
        videoPath: _videoPath!,
        isAsset: _isVideoAsset,
        loop: true,
        mute: true,
      );
    } else {
      BoxDecoration bgDecoration;
      if (_selectedBgDecoration != null) {
        bgDecoration = _selectedBgDecoration!;
      } else if (_alarm!.backgroundPath != null) {
        if (_alarm!.backgroundPath!.startsWith('color:')) {
          int colorValue = int.parse(_alarm!.backgroundPath!.split(':')[1]);
          bgDecoration = BoxDecoration(color: Color(colorValue));
        } else if (_alarm!.backgroundPath!.startsWith('assets/')) {
          bgDecoration = BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_alarm!.backgroundPath!),
              fit: BoxFit.cover,
            ),
          );
        } else {
          bgDecoration = BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(_alarm!.backgroundPath!)),
              fit: BoxFit.cover,
            ),
          );
        }
      } else {
        // 기본 배경 이미지 설정 (사용자가 제공한 이미지)
        bgDecoration = const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/character/default.webp'),
            fit: BoxFit.cover,
          ),
        );
      }
      backgroundWidget = Container(decoration: bgDecoration);
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: backgroundWidget),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                // Top: App Title, Time, Date
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text(
                        "FORTUNE ALARM",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0,
                          shadows: const [Shadow(blurRadius: 10, color: Colors.black45, offset: Offset(0, 2))],
                        ),
                      ),
                      if (_snoozeTargetTime == null) ...[
                        const SizedBox(height: 8),
                        Text(
                          DateFormat('h:mm').format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            height: 1.0,
                            shadows: [Shadow(blurRadius: 15, color: Colors.black38, offset: Offset(0, 4))],
                          ),
                        ),
                        Text(
                          DateFormat('EEEE, MMMM d').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w400,
                            shadows: const [Shadow(blurRadius: 8, color: Colors.black38, offset: Offset(0, 2))],
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              
              if (_snoozeTargetTime != null)
                Builder(
                  builder: (context) {
                    final now = DateTime.now();
                    final target = _snoozeTargetTime!;
                    final seconds = target.difference(now).inSeconds;
                    final remainingSeconds = seconds < 0 ? 0 : seconds;
                    final mm = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
                    final ss = (remainingSeconds % 60).toString().padLeft(2, '0');

                    final alarm = _alarm!;
                    final l10n = AppLocalizations.of(context)!;
                    final remainingCountText = _snoozeRemainingAfterTap == null
                        ? ''
                        : (() {
                            if (alarm.maxSnoozeCount == 999) {
                              return '${l10n.alarmSnooze} ${alarm.snoozeInterval}분(무제한)';
                            }
                            final maxCount = alarm.maxSnoozeCount;
                            final remainingAfterTap = _snoozeRemainingAfterTap!;
                            final clampedRemaining = remainingAfterTap < 0
                                ? 0
                                : (remainingAfterTap > maxCount ? maxCount : remainingAfterTap);
                            var currentCount = maxCount - clampedRemaining;
                            if (currentCount < 1) currentCount = 1;
                            if (currentCount > maxCount) currentCount = maxCount;
                            return '${l10n.alarmSnooze} ${alarm.snoozeInterval}분($currentCount/$maxCount)';
                          })();

                    return Column(
                      children: [
                        const SizedBox(height: 40), // Z 아이콘 삭제 후 상단 여백 확보
                        Text(
                          '$mm:$ss',
                          style: const TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                            shadows: [Shadow(blurRadius: 15, color: Colors.black38, offset: Offset(0, 4))],
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (remainingCountText.isNotEmpty)
                          Text(
                            remainingCountText,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                              shadows: const [Shadow(blurRadius: 8, color: Colors.black38, offset: Offset(0, 2))],
                            ),
                          ),
                      ],
                    );
                  },
                ),

              // Bottom: Snooze & Mission Start
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 알람 미루기 버튼 (비중을 낮추기 위해 크기 축소)
                    if (_snoozeTargetTime == null && (_alarm!.snoozeInterval > 0 && _alarm!.maxSnoozeCount > 0) &&
                        (() {
                          final bool isFirstSnooze = !_alarm!.id.endsWith('_snooze');
                          final int currentRemaining = isFirstSnooze
                              ? _alarm!.maxSnoozeCount
                              : (_alarm!.remainingSnoozeCount > 0 ? _alarm!.remainingSnoozeCount : 0);
                          return currentRemaining > 0;
                        })())
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: OutlinedButton(
                          onPressed: () async {
                            final alarm = _alarm;
                            if (alarm == null) return;

                            final bool isFirstSnooze = !alarm.id.endsWith('_snooze');
                            final int currentRemaining = isFirstSnooze
                                ? alarm.maxSnoozeCount
                                : (alarm.remainingSnoozeCount > 0 ? alarm.remainingSnoozeCount : 0);
                            
                            // 무제한(999)이면 카운트를 줄이지 않음
                            final int newRemainingCount = (alarm.maxSnoozeCount == 999)
                                ? 999
                                : currentRemaining - 1;

                            final now = DateTime.now();
                            final targetTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              now.hour,
                              now.minute,
                              now.second,
                            ).add(Duration(minutes: alarm.snoozeInterval));
                            setState(() {
                              _snoozeTargetTime = targetTime;
                              _snoozeRemainingAfterTap = newRemainingCount < 0 ? 0 : newRemainingCount;
                            });

                            await _clearPendingAlarmFlag();
                            await _stopAlarm();

                            final stableId = AlarmSchedulerService.getStableId(widget.alarmId);
                            await NotificationService().cancelNotification(stableId);

                            await AlarmSchedulerService.snoozeAlarm(alarm, snoozeTime: targetTime);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.4),
                              width: 1.2,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.white.withOpacity(0.05),
                          ),
                          child: Text(
                            (() {
                              final bool isFirstSnooze = !_alarm!.id.endsWith('_snooze');
                              final int maxCount = _alarm!.maxSnoozeCount;
                              final int currentRemaining = isFirstSnooze
                                  ? maxCount
                                  : (_alarm!.remainingSnoozeCount > 0 ? _alarm!.remainingSnoozeCount : 0);
                              final minutes = _alarm!.snoozeInterval;

                              if (maxCount == 999) {
                                return '${AppLocalizations.of(context)!.alarmSnooze} $minutes분(무제한)';
                              }

                              int currentCount = maxCount - currentRemaining + 1;
                              if (currentCount < 1) currentCount = 1;
                              if (currentCount > maxCount) currentCount = maxCount;
                              return '${AppLocalizations.of(context)!.alarmSnooze} $minutes분($currentCount/$maxCount)';
                            })(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    
                    // 미션 시작 또는 알람 끄기 버튼
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_alarm!.missionType == MissionType.none) {
                            _isMissionCompleted = true;
                            await _clearPendingAlarmFlag();
                            await _stopAlarm(); // 1. 소리/진동 중지
                            
                            // 2. 현재 알림을 정확한 ID로 취소
                            final stableId = AlarmSchedulerService.getStableId(widget.alarmId);
                            await NotificationService().cancelNotification(stableId);

                            // 3. 알람 끄기를 눌렀으므로 모든 스누즈 알람을 취소합니다.
                            // 반복 알람이면 메인 스케줄(내일)은 유지하고 스누즈만 취소합니다.
                            bool hasRepeat = _alarm!.repeatDays.any((d) => d);
                            await AlarmSchedulerService.cancelAlarm(_alarm!, cancelMain: !hasRepeat);
                            
                            debugPrint('[AlarmRingingScreen] Simple alarm turned off (Snooze cancelled).');

                            // 4. 알람 리스트 업데이트 (단일 알람 비활성화 등)
                            try {
                              final notifier = ref.read(alarmListProvider.notifier);
                              await notifier.completeAlarm(widget.alarmId);
                              
                              await ref.read(missionProvider).completeWakeUpMission();
                            } catch (e) {
                              debugPrint('Error completing wakeup mission: $e');
                            }

                            // 5. 화면 닫기
                            if (context.mounted) {
                              _closeToMain();
                            }
                          } else {
                            _startMission();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _alarm!.missionType == MissionType.none 
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white.withOpacity(0.9),
                          foregroundColor: _alarm!.missionType == MissionType.none 
                              ? Colors.white 
                              : Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _alarm!.missionType == MissionType.none 
                              ? AppLocalizations.of(context)!.turnOffAlarm
                              : AppLocalizations.of(context)!.startMission, 
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
}

  void _startMission() async {
    if (_alarm == null) return;
    if (_isMissionStarted) return; // Prevent double taps
    _isMissionStarted = true;
    if (_snoozeTargetTime != null) {
      setState(() {
        _snoozeTargetTime = null;
        _snoozeRemainingAfterTap = null;
      });
    }

    final MissionType type = _alarm!.missionType;
    final List<String>? refPaths = _alarm!.referenceImagePaths;

    Widget nextScreen;
    switch (type) {
      case MissionType.math:
        nextScreen = MathMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.fortune:
        nextScreen = FortuneMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.shake:
        nextScreen = ShakeMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.fortuneCatch:
        nextScreen = FortuneCatchMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.numberOrder:
        nextScreen = NumberOrderMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.hiddenButton:
        nextScreen = HiddenButtonMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.tapSprint:
        nextScreen = TapSprintMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.leftRight:
        nextScreen = LeftRightMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.walk:
        nextScreen = WalkMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.faceDetection:
        nextScreen = FaceDetectionMissionScreen(alarmId: widget.alarmId);
        break;
      case MissionType.none:
        nextScreen = SimpleAlarmScreen(alarmId: widget.alarmId);
        break;
      // Camera missions
      case MissionType.cameraSink:
      case MissionType.cameraRefrigerator:
      case MissionType.cameraFace:
      case MissionType.cameraScale:
      case MissionType.cameraOther:
        nextScreen = MissionCameraScreen(
          missionType: type,
          referenceImagePaths: refPaths, // Pass list
          alarmId: widget.alarmId
        );
        break;
      case MissionType.supplement:
        nextScreen = const SupplementMissionScreen();
        break;
      default:
        nextScreen = SimpleAlarmScreen(alarmId: widget.alarmId);
    }

    debugPrint('[AlarmRingingScreen] Starting mission: $type');

    await _setMissionActive(true);
    await _clearPendingAlarmFlag();

    await _pauseAlarmRingingForMission();

    try {
      final String originalId = widget.alarmId.replaceAll('_snooze', '');
      final String snoozeId = '${originalId}_snooze';
      final box = await Hive.openBox<AlarmModel>('alarms');
      final snoozeAlarm = box.get(snoozeId);
      if (snoozeAlarm != null) {
        debugPrint('[AlarmRingingScreen] Cancelling auto-snooze for mission duration.');
        await AlarmSchedulerService.cancelAlarm(snoozeAlarm);
      }
    } catch (e) {
      debugPrint('Error cancelling snooze for mission: $e');
    }

    if (!mounted) return;

    // 미션 화면 실행 (2분 무반응 시 'timeout'을 반환하도록 각 미션 화면 수정 필요)
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );

    debugPrint('[AlarmRingingScreen] Mission screen returned result: $result');

    // 미션 화면에서 돌아왔으므로 플래그 해제
    _isMissionStarted = false;
    await _setMissionActive(false);

    if (result == 'timeout') {
      // 2분간 활동 없음 -> 다시 알람 울림
      debugPrint('[AlarmRingingScreen] Mission timeout - Resetting snooze and re-ringing');
      
      // 스누즈 횟수 초기화 (사용자 요청: 미션 실패 시 1회부터 다시 시작)
      final String originalId = widget.alarmId.replaceAll('_snooze', '');
      
      try {
        final alarmBox = await Hive.openBox<AlarmModel>('alarms');
        final mainAlarm = alarmBox.get(originalId);
        if (mainAlarm != null) {
          // 메인 알람의 남은 횟수를 최대로 초기화하여 저장
          final updatedAlarm = mainAlarm.copyWith(remainingSnoozeCount: mainAlarm.maxSnoozeCount);
          await alarmBox.put(originalId, updatedAlarm);
          
          // 현재 로컬 객체도 업데이트
          setState(() {
            _alarm = updatedAlarm;
          });
          
          // 2. 이미 예약된 다음 스누즈가 있다면 취소 (새로 예약은 아래에서 수행)
          final String snoozeId = '${originalId}_snooze';
          final snoozeAlarm = alarmBox.get(snoozeId);
          if (snoozeAlarm != null) {
            await AlarmSchedulerService.cancelAlarm(snoozeAlarm);
          }
        }
      } catch (e) {
        debugPrint('Error resetting snooze count: $e');
      }

      // 소리/진동 다시 시작
      await _ensureForegroundServiceRunning();
      _playAlarm();
      
      // 다시 스누즈 예약 (활동 없을 때를 대비)
      _scheduleNextSnoozeIfNeeded();

    } else if (result == true) {
      // 미션 성공!
      _isMissionCompleted = true;
      debugPrint('[AlarmRingingScreen] Mission Success! Alarm completed.');
      
      if (_alarm != null) {
        // 미션 성공 시에는 남은 스누즈 횟수와 상관없이 알람을 완전히 종료합니다.
        debugPrint('[AlarmRingingScreen] Mission cleared. Turning off alarm completely.');

        await _stopAlarm();
        
        // 미션 화면에서 제거했던 completeAlarm을 여기서 호출
        final notifier = ref.read(alarmListProvider.notifier);
        await notifier.completeAlarm(widget.alarmId);
        
        // 기상 미션 성공 처리 연동
        try {
          await ref.read(missionProvider).completeWakeUpMission();
          
          // 만약 영양제 미션이었다면 영양제 체크도 함께 완료
          if (_alarm?.missionType == MissionType.supplement) {
            await ref.read(missionProvider).setMissionCompleted('supplement', true);
          }
        } catch (e) {
          debugPrint('Error completing wakeup mission: $e');
        }

        _closeToMain();
      }
    } else {
      // 뒤로가기 등으로 미션을 완료하지 않고 돌아온 경우 알람 다시 재생
      if (mounted) {
        await _ensureForegroundServiceRunning();
        _playAlarm();
        _scheduleNextSnoozeIfNeeded();
      }
    }
  }
}
