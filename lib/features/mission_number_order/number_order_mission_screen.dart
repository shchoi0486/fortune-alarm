import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:fortune_alarm/services/alarm_scheduler_service.dart';
import 'package:fortune_alarm/services/notification_service.dart';

import '../../data/models/alarm_model.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../mission/widgets/mission_success_overlay.dart';
import '../../widgets/video_background_widget.dart';

class NumberOrderMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const NumberOrderMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<NumberOrderMissionScreen> createState() => _NumberOrderMissionScreenState();
}

class _NumberOrderMissionScreenState extends ConsumerState<NumberOrderMissionScreen> with WidgetsBindingObserver {
  final Random _random = Random();
  final Map<int, Offset> _positions = {};
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _volumeEnforcementTimer;
  final AudioPlayer _sfxPlayer = AudioPlayer();
  Timer? _sfxStopTimer;

  AlarmModel? _alarm;
  bool _isLoading = true;

  Timer? _inactivityTimer;

  int _nextNumber = 1;
  final Set<int> _disabledNumbers = {};

  bool _wrongFlash = false;
  int? _wrongNumber;
  String _feedbackText = '';

  bool _isSuccess = false;
  Size? _lastSize;

  DateTime? _backgroundTime;

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

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    // Note: alarmListProvider needs to be defined in your providers
    // and IterableExtension from package:collection is needed for firstWhereOrNull
    // This follows the provided replacement logic.
    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    try {
      if (alarm.isSoundEnabled) {
        String path = alarm.ringtonePath ?? 'default';
        debugPrint('[NumberOrderMission] Playing alarm sound: $path');
        
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
              debugPrint('[NumberOrderMission] AssetSource failed, trying BytesSource fallback: $e');
              final ByteData data = await rootBundle.load('assets/sounds/$path.ogg');
              final Uint8List bytes = data.buffer.asUint8List();
              await _audioPlayer.setSource(BytesSource(bytes));
            }
            
            double targetVolume = alarm.volume;
            if (targetVolume <= 0) targetVolume = 0.5;
            
            await _audioPlayer.setVolume(targetVolume);
            await _audioPlayer.resume();
          } catch (ae) {
            debugPrint('[NumberOrderMission] AudioPlayer error: $ae. Falling back to system default.');
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _backgroundTime = DateTime.now();
      debugPrint('[NumberOrderMissionScreen] App paused at: $_backgroundTime');
    } else if (state == AppLifecycleState.resumed) {
      if (_backgroundTime != null) {
        final now = DateTime.now();
        final diff = now.difference(_backgroundTime!).inMinutes;
        debugPrint('[NumberOrderMissionScreen] App resumed. Background duration: $diff minutes');
        
        if (diff >= 15) {
          debugPrint('[NumberOrderMissionScreen] Background duration exceeds 15 minutes. Closing mission.');
          if (mounted) {
            Navigator.of(context).pop('timeout');
          }
        }
      }
      _backgroundTime = null;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _inactivityTimer?.cancel();
    _sfxStopTimer?.cancel();
    _volumeTimer?.cancel();
    _volumeEnforcementTimer?.cancel();
    _stopAlarm();
    _sfxPlayer.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _stopAlarm() async {
    try {
      // 소리/진동 정지
      _volumeTimer?.cancel();
      _volumeEnforcementTimer?.cancel();
      await _audioPlayer.stop();
      await _sfxPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
      
      // 알림(Notification) 제거
      if (widget.alarmId != null) {
        final stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
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
          debugPrint('[NumberOrderMission] Hive state cleared successfully');
        } catch (e) {
          debugPrint('[NumberOrderMission] Error clearing Hive state: $e');
        }
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  Future<void> _playSfx(String assetPath, {required double volume, Duration? maxDuration}) async {
    try {
      _sfxStopTimer?.cancel();
      await _sfxPlayer.stop();
      await _sfxPlayer.setReleaseMode(ReleaseMode.stop);
      await _sfxPlayer.play(AssetSource(assetPath), volume: volume);

      if (maxDuration != null) {
        _sfxStopTimer = Timer(maxDuration, () {
          _sfxPlayer.stop();
        });
      }
    } catch (_) {}
  }

  Future<void> _vibrateCorrect() async {
    try {
      HapticFeedback.mediumImpact(); // light -> medium
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(duration: 50);
      }
    } catch (_) {}
  }

  Future<void> _vibrateWrong() async {
    try {
      HapticFeedback.heavyImpact();
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 120, 60, 80]);
      }
    } catch (_) {}
  }

  void _onTapNumber(int n) async {
    _resetInactivityTimer();
    if (_disabledNumbers.contains(n)) return;

    const goal = 10;

    if (n == _nextNumber) {
      await _vibrateCorrect();
      _playSfx('sounds/ui_click.ogg', volume: 0.22, maxDuration: const Duration(milliseconds: 180));
      
      setState(() {
        _disabledNumbers.add(n);
        _feedbackText = '';
        _wrongFlash = false;
        _wrongNumber = null;
        _nextNumber++;
      });
      
      if (_nextNumber == goal && mounted) {
        _inactivityTimer?.cancel(); // 미션 성공 시 타이머 정지
        HapticFeedback.heavyImpact();
        if (await Vibration.hasVibrator() == true) {
          Vibration.vibrate(duration: 200);
        }
        await _playSfx('sounds/ui_success.ogg', volume: 0.5);
        if (mounted) {
          setState(() {
            _isSuccess = true;
          });
        }
      }
      return;
    }
    
    await _vibrateWrong();
    _playSfx('sounds/alarm_sound.ogg', volume: 0.16, maxDuration: const Duration(milliseconds: 200));
    
    if (!mounted) return;
    setState(() {
      _wrongNumber = n;
      _wrongFlash = true;
      _feedbackText = 'Wrong! Try number $_nextNumber';
    });
    Future.delayed(const Duration(milliseconds: 260), () {
      if (!mounted) return;
      setState(() {
        _wrongFlash = false;
        _wrongNumber = null;
      });
    });
  }

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      if (mounted) setState(() => _isLoading = false);
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
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) Navigator.of(context).pop('timeout');
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  Widget _backgroundLayer() {
    final path = _alarm?.backgroundPath;
    if (path != null) {
      final lower = path.toLowerCase();
      final isVideo = lower.endsWith('.mp4') || lower.endsWith('.webm');

      if (path.startsWith('color:')) {
        final colorValue = int.tryParse(path.split(':')[1]);
        if (colorValue != null) return Container(color: Color(colorValue));
      } else if (isVideo) {
        return VideoBackgroundWidget(
          videoPath: path,
          isAsset: path.startsWith('assets/'),
          play: false,
          loop: false,
          mute: true,
        );
      } else if (path.startsWith('assets/')) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          ),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover),
          ),
        );
      }
    }
    return const DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/splash/splash_bg.webp'), fit: BoxFit.cover),
      ),
    );
  }

  void _ensurePositions(Size size) {
    if (_lastSize == size && _positions.isNotEmpty) return;
    _lastSize = size;
    
    // 화면 크기가 너무 작으면(0,0 등) 나중에 다시 계산하도록 함
    if (size.width < 100 || size.height < 100) return;

    const double buttonSize = 76;
    const double padding = 22;
    final width = size.width;
    final height = size.height;

    final topSafe = 140.0;
    final bottomSafe = 120.0;

    final minX = padding;
    final maxX = max(padding, width - padding - buttonSize);
    final minY = topSafe;
    final maxY = max(topSafe, height - bottomSafe - buttonSize);

    final List<Offset> placedCenters = [];

    const goal = 10;
    _positions.clear(); // 새로 계산할 때 초기화

    for (int n = 1; n < goal; n++) {
      Offset? pos;
      for (int attempt = 0; attempt < 220; attempt++) {
        final x = minX + _random.nextDouble() * (maxX - minX);
        final y = minY + _random.nextDouble() * (maxY - minY);
        final center = Offset(x + buttonSize / 2, y + buttonSize / 2);
        final ok = placedCenters.every((c) => (c - center).distance > buttonSize * 0.92);
        if (ok) {
          pos = Offset(x, y);
          placedCenters.add(center);
          break;
        }
      }
      pos ??= Offset(
        minX + ((n - 1) % 3) * ((maxX - minX) / 2),
        minY + ((n - 1) ~/ 3) * ((maxY - minY) / 2),
      );
      _positions[n] = pos;
    }
  }

  Widget _buildNumberButton(int n) {
    final isDisabled = _disabledNumbers.contains(n);
    final isTarget = n == _nextNumber;
    final isWrong = _wrongFlash && _wrongNumber == n;

    final Color base = isDisabled
        ? Colors.white.withOpacity(0.12)
        : (isWrong ? Colors.redAccent : (isTarget ? Colors.cyanAccent : Colors.white.withOpacity(0.18)));

    final Color border = isDisabled
        ? Colors.white.withOpacity(0.15)
        : (isWrong ? Colors.redAccent.withOpacity(0.85) : Colors.white.withOpacity(0.55));

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 160),
      opacity: isDisabled ? 0.35 : 1,
      child: IgnorePointer(
        ignoring: isDisabled,
        child: GestureDetector(
          onTap: () => _onTapNumber(n),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: base,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: border, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '$n',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: isDisabled ? Colors.white70 : Colors.white,
                  shadows: [
                    Shadow(color: Colors.black.withOpacity(0.35), blurRadius: 8, offset: const Offset(0, 3)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: _backgroundLayer()),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(isDarkMode ? 0.55 : 0.45),
                      Colors.black.withOpacity(isDarkMode ? 0.72 : 0.62),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  _ensurePositions(constraints.biggest);
                  
                  return SizedBox.expand(
                    child: Stack(
                      children: [
                        // UI Header & Loader
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: Colors.white.withOpacity(0.18)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.cyanAccent, Colors.cyan],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.filter_9_plus, color: Colors.white),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              l10n.missionNumberOrder,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              l10n.missionNumberOrderGuide(_nextNumber),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white.withOpacity(0.85),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.12),
                                          borderRadius: BorderRadius.circular(999),
                                          border: Border.all(color: Colors.white.withOpacity(0.18)),
                                        ),
                                        child: Text(
                                          '${_disabledNumbers.length}/9',
                                          style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (_feedbackText.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent.withOpacity(0.22),
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
                                    ),
                                    child: Text(
                                      _feedbackText,
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        
                        // Loader
                        if (_isLoading || _positions.isEmpty)
                          const Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          ),

                        // Number Buttons
                        if (!_isLoading && _positions.isNotEmpty)
                          ...[
                            for (int n = 1; n <= 9; n++)
                              if (_positions.containsKey(n))
                                Positioned(
                                  left: _positions[n]!.dx,
                                  top: _positions[n]!.dy,
                                  child: _buildNumberButton(n),
                                ),
                          ],

                        // Success Overlay
                        if (_isSuccess)
                          Positioned.fill(
                            child: MissionSuccessOverlay(
                              onFinish: () async {
                                if (mounted) {
                                  _sfxPlayer.stop();
                                  _inactivityTimer?.cancel();
                                  Navigator.of(context).pop(true);
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
