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

class WalkMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const WalkMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<WalkMissionScreen> createState() => _WalkMissionScreenState();
}

class _WalkMissionScreenState extends ConsumerState<WalkMissionScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _inactivityTimer;
  AlarmModel? _alarm;
  
  // Walk Logic
  StreamSubscription<UserAccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroSubscription;
  double _lastGyroMagnitude = 0.0;
  int _targetStepCount = 20;
  int _currentStepCount = 0;
  DateTime _lastStepTime = DateTime.now();
  final double _stepThreshold = 2.5; // Sensitivity for walking (UserAccelerometer excludes gravity)
  final double _shakeThreshold = 4.0; // Max rotation speed (rad/s) to consider as valid walking (prevents violent shaking)
  
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

  late AnimationController _animationController;
  late Animation<double> _walkAnimation;
  late AnimationController _waddleController;
  late Animation<double> _waddleAnimation;
  bool _useFirstFrame = true;
  Timer? _frameTimer;

  @override
  void initState() {
    super.initState();
    
    // 미션 진입 시 알람 진동이 남아있을 수 있으므로 명시적으로 정지
    Vibration.cancel();
    
    WidgetsBinding.instance.addObserver(this);
    
    _loadAlarmSettings();
    _startWalkDetection();
    _startInactivityTimer();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _walkAnimation = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _waddleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _waddleAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _waddleController, curve: Curves.easeInOut),
    );

    // Swap frames every 400ms for walking effect
    _frameTimer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (mounted) {
        setState(() {
          _useFirstFrame = !_useFirstFrame;
        });
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      if (mounted) {
        Navigator.of(context).pop('timeout');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _frameTimer?.cancel();
    _animationController.dispose();
    _waddleController.dispose();
    _accelerometerSubscription?.cancel();
    _gyroSubscription?.cancel();
    _volumeTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    _stopAlarm();
    super.dispose();
  }

  Future<void> _playSfx(String assetPath) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('sounds/$assetPath'));
    } catch (e) {
      debugPrint('Error playing SFX: $e');
    }
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) {
        debugPrint('[WalkMissionScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  Future<void> _loadAlarmSettings() async {
    if (widget.alarmId == null) return;
    
    final alarmList = ref.read(alarmListProvider);
    var alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
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
        _targetStepCount = alarm!.walkStepCount;
      });
    }
  }

  void _startWalkDetection() {
    // Monitor Gyroscope to filter out violent shaking
    _gyroSubscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      // Calculate angular velocity magnitude
      _lastGyroMagnitude = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
    });

    // UserAccelerometerEvent is the acceleration WITHOUT gravity.
    // For walking, we look for periodic vertical or horizontal movement.
    _accelerometerSubscription = userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      // Calculate magnitude of acceleration change
      double magnitude = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

      if (magnitude > _stepThreshold) {
        // Anti-Cheat: If rotation is too violent, it's likely shaking, not walking.
        // Walking typically has smooth rotation (under 3-4 rad/s), while frantic shaking has higher peaks.
        if (_lastGyroMagnitude > _shakeThreshold) {
          return; 
        }

        final now = DateTime.now();
        // Walking frequency is typically 1-2 steps per second.
        // Debounce steps to prevent multiple counts (min 400ms between steps for anti-cheat)
        if (now.difference(_lastStepTime).inMilliseconds > 400) {
          _lastStepTime = now;
          _resetInactivityTimer();
          
          try {
            HapticFeedback.selectionClick();
            _playSfx('ui_click.ogg');
          } catch (_) {}

          setState(() {
            _currentStepCount++;
          });

          if (_currentStepCount >= _targetStepCount) {
            _handleSuccess();
          }
        }
      }
    });
  }

  void _handleSuccess() {
    if (_isSuccess) return;
    
    final random = Random();
    _lastMessage = PositiveMessages.messages[random.nextInt(PositiveMessages.messages.length)];
    
    setState(() {
      _isSuccess = true;
    });
    
    _accelerometerSubscription?.cancel();
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
      bgDecoration = const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF009688), Color(0xFF004D40)],
        ),
      );
    }

    double progress = (_currentStepCount / _targetStepCount).clamp(0.0, 1.0);

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: bgWidget ??
                Container(
                  decoration: bgDecoration,
                ),
          ),
          
          // Content Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
                
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        l10n.missionWalk,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.missionWalkDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Walking Animation
                AnimatedBuilder(
                  animation: Listenable.merge([_walkAnimation, _waddleAnimation]),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _walkAnimation.value),
                      child: Transform.rotate(
                        angle: _waddleAnimation.value,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              _useFirstFrame ? 'assets/icon/fortuni1_trans.webp' : 'assets/icon/fortuni2_trans.webp',
                              width: 120,
                              height: 120,
                              gaplessPlayback: true, // Prevents flickering when switching images
                              errorBuilder: (context, error, stackTrace) => 
                                  const Icon(Icons.directions_walk, size: 80, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // Progress Area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.walkSteps(_currentStepCount),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            l10n.walkSteps(_targetStepCount),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 12,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.tealAccent),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),
                
                // Bottom Message
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.info_outline, color: Colors.tealAccent, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          "스마트폰을 들고 걸어주세요",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Success Overlay
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
    );
  }
}
