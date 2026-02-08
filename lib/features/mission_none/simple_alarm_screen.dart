import 'dart:io';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

import '../../providers/alarm_list_provider.dart';
import '../../services/notification_service.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../data/models/alarm_model.dart';
import '../mission/widgets/mission_success_overlay.dart';

class SimpleAlarmScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const SimpleAlarmScreen({super.key, this.alarmId});

  @override
  ConsumerState<SimpleAlarmScreen> createState() => _SimpleAlarmScreenState();
}

class _SimpleAlarmScreenState extends ConsumerState<SimpleAlarmScreen> with WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeEnforcementTimer;
  Timer? _volumeTimer;
  Timer? _timeTimer;
  Timer? _inactivityTimer;
  DateTime _now = DateTime.now();
  AlarmModel? _alarm;
  bool _isLoading = true;
  bool _isSuccess = false;

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
    
    _loadAlarm();
    _startInactivityTimer();
    _startVolumeEnforcement();
    
    // 미션 화면 진입 시 알람 소리를 직접 제어하지 않고 
    // AlarmRingingScreen에서 일시 정지된 상태로 진입함.
    _timeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) {
        debugPrint('[SimpleAlarmScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _startVolumeEnforcement() {
    if (Platform.isAndroid) {
      const channel = MethodChannel('com.seriessnap.fortunealarm/foreground');
      _volumeEnforcementTimer?.cancel();
      _volumeEnforcementTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (!mounted || _isSuccess) {
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

  DateTime? _backgroundTime;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _backgroundTime = DateTime.now();
      debugPrint('[SimpleAlarmScreen] App paused at: $_backgroundTime');
    } else if (state == AppLifecycleState.resumed) {
      if (_backgroundTime != null) {
        final now = DateTime.now();
        final diff = now.difference(_backgroundTime!).inMinutes;
        debugPrint('[SimpleAlarmScreen] App resumed. Background duration: $diff minutes');
        
        if (diff >= 15) {
          debugPrint('[SimpleAlarmScreen] Background duration exceeds 15 minutes. Closing mission.');
          if (mounted && !_isSuccess) {
            Navigator.of(context).pop('timeout');
          }
        }
      }
      _backgroundTime = null;
    }
  }

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      setState(() => _isLoading = false);
      return;
    }
    
    try {
      final alarmBox = await Hive.openBox<AlarmModel>('alarms');
      final alarm = await _applyResolvedRandomBackground(alarmBox.get(widget.alarmId));
      if (mounted) {
        setState(() {
          _alarm = alarm;
          _isLoading = false;
        });
        // 미션 진입 시 알람 소리 및 진동 중지
        _stopAlarm();
      }
    } catch (e) {
      debugPrint('Error loading alarm in SimpleAlarmScreen: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _volumeTimer?.cancel();
    _volumeEnforcementTimer?.cancel();
    _timeTimer?.cancel();
    _inactivityTimer?.cancel();
    _stopAlarm();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAlarm() async {
    if (widget.alarmId == null || _alarm == null) return;

    final alarm = _alarm!;

    try {
      if (alarm.isSoundEnabled) {
        String path = alarm.ringtonePath ?? 'default';
        debugPrint('[SimpleAlarm] Playing alarm sound: $path');
        
        if (path == 'default' || path.isEmpty) {
          await FlutterRingtonePlayer().playAlarm(
            looping: true, 
            volume: alarm.volume, 
            asAlarm: true
          );
        } else {
          // 커스텀 사운드 재생
          try {
            if (Platform.isAndroid) {
              await _audioPlayer.setAudioContext(AudioContext(
                android: AudioContextAndroid(
                  isSpeakerphoneOn: true,
                  stayAwake: true,
                  contentType: AndroidContentType.sonification,
                  usageType: AndroidUsageType.alarm,
                  audioFocus: AndroidAudioFocus.gain,
                ),
              ));
            }
            
            await _audioPlayer.stop();
            await _audioPlayer.setReleaseMode(ReleaseMode.loop);
            
            try {
              await _audioPlayer.setSource(AssetSource('sounds/$path.ogg'));
            } catch (e) {
              debugPrint('[SimpleAlarm] AssetSource failed, trying BytesSource fallback: $e');
              final ByteData data = await rootBundle.load('assets/sounds/$path.ogg');
              final Uint8List bytes = data.buffer.asUint8List();
              await _audioPlayer.setSource(BytesSource(bytes));
            }
            
            double targetVolume = alarm.volume;
            if (targetVolume <= 0) targetVolume = 0.5;
            
            await _audioPlayer.setVolume(targetVolume);
            await _audioPlayer.resume();
          } catch (ae) {
            debugPrint('[SimpleAlarm] AudioPlayer error: $ae. Falling back to system default.');
            await FlutterRingtonePlayer().playAlarm(
              looping: true, 
              volume: alarm.volume, 
              asAlarm: true
            );
          }
        }
      }

      if (alarm.isVibrationEnabled && await Vibration.hasVibrator() == true) {
         _playVibration(alarm.vibrationPattern);
      }
    } catch (e) {
      debugPrint('Error playing alarm: $e');
    }
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
      _volumeEnforcementTimer?.cancel();
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
      if (widget.alarmId != null) {
        final int stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
        await NotificationService().cancelNotification(stableId);
      }

      // 미션 상태 초기화
      if (_isSuccess) {
        try {
          final box = Hive.isBoxOpen('app_state') ? Hive.box('app_state') : await Hive.openBox('app_state');
          await box.delete('active_ringing_alarm_id');
          await box.delete('active_ringing_set_at');
          await box.delete('active_alarm_mission_base_id');
          await box.delete('active_alarm_mission_started_at');
          await box.delete('active_alarm_mission_background_path');
          await box.flush();
          debugPrint('[SimpleAlarm] Hive state cleared successfully');
        } catch (e) {
          debugPrint('[SimpleAlarm] Error clearing Hive state: $e');
        }
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  void _handleDismiss() {
    if (mounted) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  Future<void> _onFinish() async {
    await _stopAlarm();

    if (widget.alarmId != null) {
      ref.read(alarmListProvider.notifier).toggleAlarm(widget.alarmId!);
      Navigator.pop(context, true);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: bgDecoration,
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    DateFormat('h:mm').format(_now),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10, color: Colors.black54)],
                    ),
                  ),
                  Text(
                    _now.hour < 12 
                        ? AppLocalizations.of(context)!.am 
                        : AppLocalizations.of(context)!.pm,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 5, color: Colors.black45)],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Icon(
                    Icons.alarm,
                    size: 60,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black45)],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.itsTimeToWakeUp,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10, color: Colors.black45)],
                    ),
                  ),
                  const Spacer(),
                  // 알람 끄기 버튼 추가 (사용자 요청: 버튼 터치로도 끄기)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextButton(
                      onPressed: _handleDismiss,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        side: BorderSide(color: Colors.white.withOpacity(0.5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.close, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(AppLocalizations.of(context)!.dismissAlarm, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    child: SlideAction(
                      borderRadius: 24,
                      elevation: 0,
                      innerColor: Colors.white,
                      outerColor: Colors.white.withOpacity(0.2),
                      sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.black),
                      text: AppLocalizations.of(context)!.slideToDismiss,
                      textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      onSubmit: () {
                         _handleDismiss();
                         return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isSuccess)
            Positioned.fill(
              child: MissionSuccessOverlay(
                onFinish: _onFinish,
              ),
            ),
        ],
      ),
    );
  }
}
