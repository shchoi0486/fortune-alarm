import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';
import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/notification_service.dart';
import '../../data/models/alarm_model.dart';
import '../../providers/alarm_list_provider.dart';
import '../../core/constants/positive_messages.dart';
import '../mission/widgets/mission_success_overlay.dart';
import '../../widgets/video_background_widget.dart';

class ShakeMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const ShakeMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<ShakeMissionScreen> createState() => _ShakeMissionScreenState();
}

class _ShakeMissionScreenState extends ConsumerState<ShakeMissionScreen> with WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _inactivityTimer;
  AlarmModel? _alarm;
  
  // Shake Logic
  StreamSubscription<UserAccelerometerEvent>? _accelerometerSubscription;
  int _targetShakeCount = 20;
  int _currentShakeCount = 0;
  DateTime _lastShakeTime = DateTime.now();
  final double _shakeThreshold = 15.0; // Shake sensitivity
  
  bool _isSuccess = false;
  String _lastMessage = '';

  Future<AlarmModel?> _applyResolvedRandomBackground(AlarmModel? alarm) async {
    if (alarm == null) return null;
    if (alarm.backgroundPath != 'random_background') return alarm;
    try {
      final box = await Hive.openBox('app_state');
      final resolved = box.get('active_alarm_mission_background_path') as String?;
      if (resolved == null || resolved.isEmpty) return alarm;
      return alarm.copyWith(backgroundPath: resolved);
    } catch (_) {
      return alarm;
    }
  }

  @override
  void initState() {
    super.initState();
    
    // 미션 진입 시 알람 진동이 남아있을 수 있으므로 명시적으로 정지
    Vibration.cancel();
    
    WidgetsBinding.instance.addObserver(this);
    
    _loadAlarmSettings();
    _startShakeDetection();

    // 미션 화면 진입 시 알람 소리를 직접 제어하지 않고 
    // AlarmRingingScreen에서 일시 정지된 상태로 진입함.
    _startInactivityTimer();
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) {
        debugPrint('[ShakeMissionScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  Future<void> _loadAlarmSettings() async {
    if (widget.alarmId == null) return;
    
    // Try Provider first
    final alarmList = ref.read(alarmListProvider);
    var alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    // If not found in provider, try Hive
    if (alarm == null) {
       try {
         final box = await Hive.openBox<AlarmModel>('alarms');
         alarm = box.get(widget.alarmId);
       } catch (e) {
         debugPrint('Error loading alarm settings: $e');
       }
    }

    alarm = await _applyResolvedRandomBackground(alarm);

    if (alarm != null && mounted) {
      setState(() {
        _alarm = alarm;
        _targetShakeCount = alarm!.shakeCount;
      });
    }
  }

  void _startShakeDetection() {
    _accelerometerSubscription = userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      // Calculate magnitude of acceleration
      double acceleration = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

      if (acceleration > _shakeThreshold) {
        _resetInactivityTimer(); // 흔들림 감지 시 타이머 초기화
        final now = DateTime.now();
        // Debounce shakes to prevent multiple counts for a single motion
        if (now.difference(_lastShakeTime).inMilliseconds > 500) {
          _lastShakeTime = now;
          HapticFeedback.mediumImpact(); // 흔들림 감지 시 햅틱 추가
          _playSfx('sounds/ui_click.ogg', volume: 0.05, maxDuration: const Duration(milliseconds: 200));
          setState(() {
            _currentShakeCount++;
          });

          if (_currentShakeCount >= _targetShakeCount) {
            _handleSuccess();
          }
        }
      }
    });
  }

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    try {
      // 미션 수행 화면에서는 알람 소리 재생하지 않음
      // 알람 소리는 알람 울림 스크린(alarm_ringing_screen.dart)에서만 재생

      if (alarm.isVibrationEnabled && await Vibration.hasVibrator() == true) {
         _playVibration(alarm.vibrationPattern);
      }
    } catch (e) {
      debugPrint('Error playing alarm: $e');
    }
  }

  void _startVolumeFadeIn(double targetVolume) {
    _volumeTimer?.cancel();
    double currentVolume = 0.1;
    _volumeTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      currentVolume += 0.1;
      if (currentVolume >= targetVolume) {
        currentVolume = targetVolume;
        timer.cancel();
      }
      await _audioPlayer.setVolume(currentVolume);
    });
  }

  void _playVibration(String? pattern) {
    Vibration.cancel();
    switch (pattern) {
      case 'short':
        Vibration.vibrate(pattern: [0, 500, 500, 500, 500], repeat: 0);
        break;
      case 'long':
        Vibration.vibrate(pattern: [0, 2000, 2000, 2000, 2000], repeat: 0);
        break;
      case 'heartbeat':
        Vibration.vibrate(pattern: [0, 200, 100, 200, 1000, 200, 100, 200, 1000], repeat: 0);
        break;
      case 'sos':
        Vibration.vibrate(pattern: [0, 200, 100, 200, 100, 200, 500, 500, 200, 500, 200, 500, 500, 200, 100, 200, 100, 200], repeat: 0);
        break;
      case 'quick':
        Vibration.vibrate(pattern: [0, 100, 50, 100, 50, 100, 50, 100, 50, 100], repeat: 0);
        break;
      default:
        Vibration.vibrate(pattern: [0, 1000, 1000], repeat: 0);
    }
  }

  Future<void> _stopAlarm() async {
    try {
      _volumeTimer?.cancel();
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
      _accelerometerSubscription?.cancel();
      if (widget.alarmId != null) {
        final int stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
        await NotificationService().cancelNotification(stableId);
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  Future<void> _playSfx(String assetPath, {double volume = 0.5, Duration? maxDuration}) async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource(assetPath), volume: volume);
      if (maxDuration != null) {
        Future.delayed(maxDuration, () => player.stop());
      }
      player.onPlayerComplete.listen((_) => player.dispose());
    } catch (e) {
      debugPrint('Error playing SFX: $assetPath - $e');
    }
  }

  bool _isHandlingSuccess = false;
  void _handleSuccess() async {
    if (_isHandlingSuccess) return;
    _isHandlingSuccess = true;

    // 미션 성공 시 모든 타이머 중지
    _inactivityTimer?.cancel();
    _volumeTimer?.cancel();

    // 흔들기 미션은 단일 성공이므로 바로 성공 애니메이션
    final random = Random();
    _lastMessage = PositiveMessages.getMessage(context);
    
    try {
      HapticFeedback.heavyImpact();
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 100, 50, 100]);
      }
      await _playSfx('sounds/ui_success.ogg', volume: 0.5);
    } catch (_) {}

    if (mounted) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 미션 성공 후 결과 다이얼로그(광고)가 뜬 상태에서 앱이 일시정지되어도 
      // 다이얼로그가 닫히지 않도록 _isSuccess 상태 체크 추가
      if (mounted && !_isSuccess) {
        Navigator.of(context).pop('timeout');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _volumeTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    _accelerometerSubscription?.cancel();
    _stopAlarm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration bgDecoration;
    Widget? bgWidget;
    if (_alarm != null && _alarm!.backgroundPath != null) {
      final bgPath = _alarm!.backgroundPath!;
      final lower = bgPath.toLowerCase();
      final isVideo = lower.endsWith('.mp4') || lower.endsWith('.webm');

      if (bgPath.startsWith('color:')) {
        int colorValue = int.parse(bgPath.split(':')[1]);
        bgDecoration = BoxDecoration(color: Color(colorValue));
      } else if (isVideo) {
        bgDecoration = const BoxDecoration(color: Color(0xFF000000));
        bgWidget = VideoBackgroundWidget(
          videoPath: bgPath,
          isAsset: bgPath.startsWith('assets/'),
          play: false,
          loop: false,
          mute: true,
        );
      } else if (bgPath.startsWith('assets/')) {
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgPath),
            fit: BoxFit.cover,
          ),
        );
      } else {
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(bgPath)),
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      bgDecoration = const BoxDecoration(color: Color(0xFFFFD54F)); // Default Yellow
    }

    double progress = _currentShakeCount / _targetShakeCount;

    return Listener(
      onPointerDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        backgroundColor: Colors.black, // fallback
        body: Stack(
        children: [
          Positioned.fill(
            child: bgWidget ?? Container(decoration: bgDecoration),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.vibration, size: 100, color: Colors.white, shadows: [Shadow(blurRadius: 10, color: Colors.black45)]),
                    const SizedBox(height: 30),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        AppLocalizations.of(context)!.shakePhone,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 10, color: Colors.black, offset: Offset(2, 2))]
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 220,
                        height: 220,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 15,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                        ),
                      ),
                      Text(
                        '$_currentShakeCount / $_targetShakeCount',
                        style: const TextStyle(
                          fontSize: 40, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 10, color: Colors.black)]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
          
          // 성공 애니메이션 오버레이
          if (_isSuccess)
            Positioned.fill(
              child: MissionSuccessOverlay(
                onFinish: () async {
                  if (mounted) {
                    await _stopAlarm();
                    
                    if (mounted) {
                      Navigator.of(context).pop(true);
                    }
                  }
                },
              ),
            ),
        ],
      ),
    ),
    );
  }
}
