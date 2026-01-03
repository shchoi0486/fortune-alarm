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

class ShakeMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const ShakeMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<ShakeMissionScreen> createState() => _ShakeMissionScreenState();
}

class _ShakeMissionScreenState extends ConsumerState<ShakeMissionScreen> {
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

  @override
  void initState() {
    super.initState();
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

  void _handleSuccess() {
    // 흔들기 미션은 단일 성공이므로 바로 성공 애니메이션
    final random = Random();
    _lastMessage = PositiveMessages.messages[random.nextInt(PositiveMessages.messages.length)];
    
    setState(() {
      _isSuccess = true;
    });
  }

  @override
  void dispose() {
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
    if (_alarm != null && _alarm!.backgroundPath != null) {
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
      bgDecoration = const BoxDecoration(color: Color(0xFFFFD54F)); // Default Yellow
    }

    double progress = _currentShakeCount / _targetShakeCount;

    return Listener(
      onPointerDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        body: Stack(
        children: [
          Container(
            decoration: bgDecoration,
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.vibration, size: 100, color: Colors.white, shadows: [Shadow(blurRadius: 10, color: Colors.black45)]),
                    const SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.shakePhone,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black, offset: Offset(2, 2))]
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
                onFinish: () {
                  if (mounted) {
                    _stopAlarm();
                    Navigator.of(context).pop(true);
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
