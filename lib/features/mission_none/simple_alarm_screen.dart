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

import '../../providers/alarm_list_provider.dart';
import '../../services/notification_service.dart';
import '../../data/models/alarm_model.dart';

class SimpleAlarmScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const SimpleAlarmScreen({super.key, this.alarmId});

  @override
  ConsumerState<SimpleAlarmScreen> createState() => _SimpleAlarmScreenState();
}

class _SimpleAlarmScreenState extends ConsumerState<SimpleAlarmScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _timeTimer;
  DateTime _now = DateTime.now();
  AlarmModel? _alarm;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAlarm();
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

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      setState(() => _isLoading = false);
      return;
    }
    
    try {
      final alarmBox = await Hive.openBox<AlarmModel>('alarms');
      final alarm = alarmBox.get(widget.alarmId);
      if (mounted) {
        setState(() {
          _alarm = alarm;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading alarm in SimpleAlarmScreen: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _volumeTimer?.cancel();
    _timeTimer?.cancel();
    _audioPlayer.dispose();
    _stopAlarm();
    super.dispose();
  }

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    try {
              if (alarm.isSoundEnabled) {
                // 'default' ringtone with gradual volume enabled -> fallback to AudioPlayer 'alarm_sound'
                // to ensure volume fade-in works correctly.
                bool useAudioPlayer = alarm.ringtonePath != 'default' || alarm.isGradualVolume;

                if (!useAudioPlayer) {
                   await FlutterRingtonePlayer().playAlarm(
                     looping: true, 
                     volume: alarm.volume, 
                     asAlarm: true
                   );
                } else {
                   String path = alarm.ringtonePath ?? 'alarm_sound';
                   if (path == 'default') path = 'alarm_sound';
                   
                   String ext = 'ogg';
                   
                   await _audioPlayer.setReleaseMode(ReleaseMode.loop);
                   await _audioPlayer.setSource(AssetSource('sounds/$path.$ext'));
                   
                   double initialVolume = alarm.isGradualVolume ? 0.1 : alarm.volume;
                   await _audioPlayer.setVolume(initialVolume);
                   await _audioPlayer.resume();
                   
                   if (alarm.isGradualVolume) {
                     _startVolumeFadeIn(alarm.volume);
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
      if (widget.alarmId != null) {
        await NotificationService().cancelNotification(widget.alarmId!.hashCode);
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  void _handleDismiss() {
    _stopAlarm();
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
      body: Container(
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
                DateFormat('a', 'ko_KR').format(_now) == 'AM' ? '오전' : '오후',
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
              const Text(
                '일어날 시간입니다!',
                style: TextStyle(
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.close, color: Colors.white),
                      SizedBox(width: 8),
                      Text("알람 끄기", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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
                  text: '밀어서 끄기',
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
    );
  }
}
