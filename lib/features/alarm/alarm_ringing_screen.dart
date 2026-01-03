import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
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

import 'package:flutter/services.dart' show rootBundle;

class AlarmRingingScreen extends ConsumerStatefulWidget {
  final String alarmId;

  const AlarmRingingScreen({super.key, required this.alarmId});

  @override
  ConsumerState<AlarmRingingScreen> createState() => _AlarmRingingScreenState();
}

class _AlarmRingingScreenState extends ConsumerState<AlarmRingingScreen> {
  AlarmModel? _alarm;
  BoxDecoration? _selectedBgDecoration;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _timeTimer;
  Timer? _missionTimeoutTimer;
  bool _isLoading = true;
  bool _isMissionStarted = false;
  
  @override
  void initState() {
    super.initState();
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

        // [수정] 스누즈 중복 예약 방지 ("알람 좀비" 현상 해결)
        // 미션 성공 시점에만 스누즈를 예약하도록 변경하여, 알람이 울리자마자 예약되는 것을 방지합니다.
        // _scheduleNextSnoozeIfNeeded();

        // 화면이 완전히 빌드된 후 소리를 재생하기 위해 약간의 딜레이를 줍니다.
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted && !_isMissionStarted) {
            _playAlarm();
          }
        });
      } else {
        debugPrint('Error: Alarm with ID ${widget.alarmId} not found!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorLoadingAlarm)),
        );
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) Navigator.pop(context);
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
    
    // 마지막 회차(1)이면 더 이상 스누즈 예약 안 함
    if (currentRemaining <= 1) {
      debugPrint('[AlarmRingingScreen] Final snooze round. No more auto-snooze.');
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

    BoxDecoration newDecoration;

    if (_alarm!.backgroundPath == 'random_background') {
      final random = math.Random();
      final List<String> options = [
        'assets/images/alarm_bg.png',
        'assets/images/alarm_bg_all.png',
        'assets/images/alarm_bg_dog.png',
        'assets/images/alarm_bg_panda.png',
        'assets/images/alarm_bg_tiger.png',
        'assets/images/alarm_bg_moon.jpg',
        'assets/images/alarm_bg_snow.jpg',
        'assets/images/alarm_bg_rabit.png',
      ];
      
      // Load user images
      try {
        final bgDir = await _getBackgroundImagesDir();
        if (await bgDir.exists()) {
          final userImages = bgDir.listSync()
              .whereType<File>()
              .map((f) => f.path)
              .where((p) => p.toLowerCase().endsWith('.jpg') || p.toLowerCase().endsWith('.png') || p.toLowerCase().endsWith('.jpeg'))
              .toList();
          options.addAll(userImages);
        }
      } catch (e) {
        debugPrint('Error loading user images: $e');
      }

      final selectedPath = options[random.nextInt(options.length)];
      
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
    } else if (_alarm!.backgroundPath != null) {
      if (_alarm!.backgroundPath!.startsWith('color:')) {
        int colorValue = int.parse(_alarm!.backgroundPath!.split(':')[1]);
        newDecoration = BoxDecoration(color: Color(colorValue));
      } else if (_alarm!.backgroundPath!.startsWith('assets/')) {
        newDecoration = BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_alarm!.backgroundPath!),
            fit: BoxFit.cover,
          ),
        );
      } else {
        newDecoration = BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(_alarm!.backgroundPath!)),
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      // 기본 배경 이미지
      newDecoration = const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/alarm_bg.png'),
          fit: BoxFit.cover,
        ),
      );
    }

    if (mounted) {
      setState(() {
        _selectedBgDecoration = newDecoration;
      });
    }
  }

  @override
  void dispose() {
    debugPrint('[AlarmRingingScreen] Dispose called. Cleaning up...');
    _stopAlarm(); // 화면이 사라질 때 모든 알람 관련 동작을 중지합니다.
    _volumeTimer?.cancel();
    _timeTimer?.cancel();
    _missionTimeoutTimer?.cancel();
    
    // 정상적으로 화면이 종료될 때 안전 장치 해제
    if (_alarm != null) {
      AlarmSchedulerService.cancelSafetyAlarm(_alarm!.id);
    }

    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAlarm() async {
    if (_alarm == null || _isMissionStarted) return;

    debugPrint('[AlarmRingingScreen] _playAlarm called. sound: ${_alarm!.isSoundEnabled}, volume: ${_alarm!.volume}');

    try {
      // 1. Notification 소리 중지 (소리 재생 전 미리 시도)
      final stableId = AlarmSchedulerService.getStableId(widget.alarmId);
      await NotificationService().cancelNotification(stableId);
      
      // 2. 잠시 대기하여 OS가 알림 소리 채널을 정리할 시간을 줌
      await Future.delayed(const Duration(milliseconds: 500));

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

  Future<void> _stopAlarm() async {
    try {
      _volumeTimer?.cancel();
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();

      final stableId = AlarmSchedulerService.getStableId(widget.alarmId);
      await NotificationService().cancelNotification(stableId);
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  Future<void> _setMissionActive(bool isActive) async {
    try {
      final box = await Hive.openBox('app_state');
      if (isActive) {
        final baseId = widget.alarmId.replaceAll('_snooze', '');
        await box.put('active_alarm_mission_base_id', baseId);
        await box.put('active_alarm_mission_started_at', DateTime.now().toIso8601String());
      } else {
        await box.delete('active_alarm_mission_base_id');
        await box.delete('active_alarm_mission_started_at');
      }
    } catch (e) {
      debugPrint('[AlarmRingingScreen] Failed to update mission state: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white, // Changed from amber to white for a cleaner look
        body: Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        ),
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
          image: AssetImage('assets/images/alarm_bg.png'),
          fit: BoxFit.cover,
        ),
      );
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
      body: Container(
        decoration: bgDecoration,
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
          child: SafeArea(
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
                      const SizedBox(height: 20),
                      // 스누즈 상태 표시 (반복알람 2/3)
                      if (_alarm!.snoozeInterval > 0 && _alarm!.maxSnoozeCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.3)),
                          ),
                          child: Text(
                            (() {
                              bool isFirstSnooze = !_alarm!.id.endsWith('_snooze');
                              int maxCount = _alarm!.maxSnoozeCount;
                              int currentRemaining = isFirstSnooze 
                                  ? maxCount 
                                  : (_alarm!.remainingSnoozeCount > 0 ? _alarm!.remainingSnoozeCount : 0);
                              int currentCount = maxCount - currentRemaining + 1;
                              if (currentCount < 1) currentCount = 1;
                              if (currentCount > maxCount) currentCount = maxCount;
                              return AppLocalizations.of(context)!.repeatAlarmCount(currentCount, maxCount);
                            })(),
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                    ],
                  ),
                ),
              
              // Center: Snooze Button Removed as per user request.
              // Snooze is now automatically scheduled upon alarm ringing.
              const SizedBox.shrink(),

              // Bottom: Mission Start or Dismiss
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_alarm!.missionType == MissionType.none) {
                        await _stopAlarm(); // 1. 소리/진동 중지
                        
                        // 2. 현재 알림을 정확한 ID로 취소
                        final stableId = AlarmSchedulerService.getStableId(widget.alarmId);
                        await NotificationService().cancelNotification(stableId);

                        // 3. 알람 끄기를 눌렀으므로 모든 스누즈 알람을 취소합니다.
                        // 반복 알람이면 메인 스케줄(내일)은 유지하고 스누즈만 취소합니다.
                        bool hasRepeat = _alarm!.repeatDays.any((d) => d);
                        await AlarmSchedulerService.cancelAlarm(_alarm!, cancelMain: !hasRepeat);
                        
                        debugPrint('[AlarmRingingScreen] Simple alarm turned off (Snooze cancelled).');

                        // 4. 기상 미션 성공 처리 연동
                        try {
                          await ref.read(missionProvider).completeWakeUpMission();
                        } catch (e) {
                          debugPrint('Error completing wakeup mission: $e');
                        }

                        // 5. 화면 닫기
                        if (context.mounted) {
                          Navigator.pop(context);
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
              ),
            ],
          ),
        ),
      ),
      ),
      ),
    );
  }

  void _startMission() async {
    if (_alarm == null) return;
    if (_isMissionStarted) return; // Prevent double taps
    _isMissionStarted = true;

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

    // 미션 시작 시 알람 소리/진동을 중지합니다. (UI 스레드 차단 방지를 위해 await 제거)
    _stopAlarm();

    // [추가] 미션 수행 중에는 자동 스누즈가 울리지 않도록 이미 예약된 스누즈를 취소합니다.
    // 미션 성공 후에 다시 예약할 것입니다.
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
      _playAlarm();
      
      // 다시 스누즈 예약 (활동 없을 때를 대비)
      _scheduleNextSnoozeIfNeeded();

    } else if (result == true) {
      // 미션 성공!
      debugPrint('[AlarmRingingScreen] Mission Success! Checking for next snooze...');
      
      if (_alarm != null) {
        bool isFirstSnooze = !_alarm!.id.endsWith('_snooze');
        int currentRemaining = isFirstSnooze 
            ? _alarm!.maxSnoozeCount 
            : (_alarm!.remainingSnoozeCount > 0 ? _alarm!.remainingSnoozeCount : 0);
        
        // 사용자 요청: 미션 성공 후 다음 알람은 설정된 간격(예: 3분) 후에 울려야 함
        if (currentRemaining > 1) {
          // 아직 남은 회차가 있음 -> 다음 스누즈 예약
          debugPrint('[AlarmRingingScreen] Scheduling next snooze (${currentRemaining - 1} left).');
          await AlarmSchedulerService.snoozeAlarm(_alarm!);
          
          // 메인 알람 스케줄 갱신 (반복 알람인 경우 내일 시간을 계산해두기 위함)
          // 단, 스누즈가 진행 중이므로 Hive의 isEnabled는 유지해야 함
          bool hasRepeat = _alarm!.repeatDays.any((d) => d);
          if (hasRepeat) {
             // 반복 알람은 다음 실행 시간을 계산해서 Hive에 업데이트만 해둠 (현재 스케줄은 이미 fire되었으므로)
             // cancelAlarm(cancelMain: false)를 호출하여 알림 등을 정리
             await AlarmSchedulerService.cancelAlarm(_alarm!, cancelMain: false, cancelSnooze: false);
          }
          
          if (mounted) Navigator.pop(context);
        } else {
          // 모든 회차 완료 -> 완전히 종료
          debugPrint('[AlarmRingingScreen] All snooze rounds completed. Turning off.');
          
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

          if (mounted) Navigator.pop(context);
        }
      }
    } else {
      // 뒤로가기 등으로 미션을 완료하지 않고 돌아온 경우 알람 다시 재생
      if (mounted) _playAlarm();
    }
  }
}
