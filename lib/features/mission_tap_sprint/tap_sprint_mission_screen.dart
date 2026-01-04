import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../data/models/alarm_model.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../mission/widgets/mission_success_overlay.dart';

class TapSprintMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;
  final int? goalTaps;

  const TapSprintMissionScreen({super.key, this.alarmId, this.goalTaps});

  @override
  ConsumerState<TapSprintMissionScreen> createState() => _TapSprintMissionScreenState();
}

class _TapSprintMissionScreenState extends ConsumerState<TapSprintMissionScreen> {
  AlarmModel? _alarm;
  bool _isLoading = true;

  Timer? _inactivityTimer;
  Timer? _decayTimer;
  DateTime _lastTapAt = DateTime.fromMillisecondsSinceEpoch(0);

  double _meter = 0;
  bool _pulse = false;
  bool _isSuccess = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<_TapEffectData> _effects = [];
  final Random _random = Random();

  static const List<String> _characters = [
    'assets/icon/fortuni1_trans.webp',
    'assets/icon/fortuni2_trans.webp',
    'assets/icon/fortuni3_angry_trans.webp',
    'assets/icon/fortuni4_joyful_trans.webp',
    'assets/icon/fortuni5_shame_trans.webp',
    'assets/icon/fortuni6_angry2_trans.webp',
    'assets/icon/rabit.webp',
    'assets/icon/panda.webp',
    'assets/icon/dog.webp',
    'assets/icon/tiger.webp',
  ];

  @override
  void initState() {
    super.initState();
    _loadAlarm();
    _startInactivityTimer();
    _decayTimer = Timer.periodic(const Duration(milliseconds: 180), (_) => _tickDecay());
  }

  @override
  void dispose() {
    _decayTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
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

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      if (mounted) setState(() => _isLoading = false);
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

  BoxDecoration _backgroundDecoration() {
    final path = _alarm?.backgroundPath;
    if (path != null) {
      if (path.startsWith('color:')) {
        final colorValue = int.tryParse(path.split(':')[1]);
        if (colorValue != null) return BoxDecoration(color: Color(colorValue));
      } else if (path.startsWith('assets/')) {
        return BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        );
      } else {
        return BoxDecoration(
          image: DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover),
        );
      }
    }
    // 기본 배경을 더 선명하고 밝은 그라데이션으로 변경
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF6DD5FA), Color(0xFF2980B9), Color(0xFFFFFFFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  Future<void> _vibrateSuccess() async {
    try {
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 60, 40, 60, 40, 120]);
      }
      await _playSfx('sounds/ui_success.ogg', volume: 0.5);
    } catch (_) {}
  }

  void _tickDecay() {
    if (!mounted) return;
    final now = DateTime.now();
    final idleMs = now.difference(_lastTapAt).inMilliseconds;
    if (idleMs < 700) return;
    if (_meter <= 0) return;
    final goal = widget.goalTaps ?? (_alarm?.shakeCount ?? 30);
    setState(() {
      _meter = (_meter - 0.22).clamp(0, goal.toDouble());
    });
  }

  void _onTapDown(TapDownDetails details) async {
    _resetInactivityTimer();
    if (_isSuccess) return;
    
    final now = DateTime.now();
    final goal = widget.goalTaps ?? (_alarm?.shakeCount ?? 30);

    // 터치 간격에 따른 크기 결정 (연타 속도가 빠를수록 큰 캐릭터)
    final double scale;
    final ms = now.difference(_lastTapAt).inMilliseconds;
    if (ms < 150) {
      scale = 1.35;
      HapticFeedback.heavyImpact();
      _playSfx('sounds/ui_click.ogg', volume: 0.15, maxDuration: const Duration(milliseconds: 200));
    } else if (ms < 300) {
      scale = 1.15;
      HapticFeedback.mediumImpact();
      _playSfx('sounds/ui_click.ogg', volume: 0.1, maxDuration: const Duration(milliseconds: 200));
    } else {
      scale = 1.0;
      HapticFeedback.lightImpact();
      _playSfx('sounds/ui_click.ogg', volume: 0.05, maxDuration: const Duration(milliseconds: 200));
    }

    final effect = _TapEffectData(
      id: DateTime.now().microsecondsSinceEpoch,
      position: details.localPosition,
      assetPath: _characters[_random.nextInt(_characters.length)],
      baseScale: scale,
    );

    setState(() {
      _lastTapAt = now;
      _meter = (_meter + 1).clamp(0, goal.toDouble());
      _pulse = !_pulse;
      _effects.add(effect);
    });

    if (_meter >= goal) {
      await _vibrateSuccess();
      setState(() {
        _isSuccess = true;
      });
    }
  }

  void _removeEffect(int id) {
    if (!mounted) return;
    setState(() {
      _effects.removeWhere((e) => e.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final goal = widget.goalTaps ?? (_alarm?.shakeCount ?? 30);
    final value = (_meter / goal).clamp(0.0, 1.0);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: _backgroundDecoration(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(isDarkMode ? 0.1 : 0.3),
                  Colors.black.withOpacity(isDarkMode ? 0.4 : 0.2),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5), // 투명도를 높여 배경을 더 밝게 (좌우 선택 미션과 통일)
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF84FB71), Color(0xFF16A085)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.touch_app, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.missionTapSprint,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF2C3E50), // 어두운 색으로 변경하여 가독성 확보
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.missionTapSprintDescription(goal),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF34495E), // 어두운 색으로 변경
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C3E50).withOpacity(0.1), // 텍스트와 어울리는 배경
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(color: const Color(0xFF2C3E50).withOpacity(0.2)),
                            ),
                            child: Text(
                              '${_meter.toInt()}/$goal',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF2C3E50), // 어두운 색으로 변경
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTapDown: _onTapDown,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2), // 배경이 덜 보이도록 불투명도 증가
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(999),
                                    child: SizedBox(
                                      height: 18,
                                      child: LinearProgressIndicator(
                                        value: value,
                                        backgroundColor: const Color(0xFF2C3E50).withOpacity(0.1),
                                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF16A085)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: AnimatedScale(
                                  scale: _pulse ? 1.03 : 1.0,
                                  duration: const Duration(milliseconds: 120),
                                  child: Container(
                                    width: 200,
                                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5), // 더 선명하게
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          l10n.missionTapSprintTapHere,
                                          style: const TextStyle(
                                            fontSize: 22, // 살짝 키움
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF2C3E50), // 어두운 색으로 가독성 확보
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          l10n.missionTapSprintHint,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF34495E),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ..._effects.map((effect) => TapEffectWidget(
                                key: ValueKey(effect.id),
                                position: effect.position,
                                assetPath: effect.assetPath,
                                baseScale: effect.baseScale,
                                onComplete: () => _removeEffect(effect.id),
                              )),
                              if (_isLoading) const Center(child: CircularProgressIndicator(color: Colors.white)),
                               if (_isSuccess)
                                 Positioned.fill(
                                   child: MissionSuccessOverlay(
                                     onFinish: () {
                                       if (mounted) Navigator.of(context).pop(true);
                                     },
                                   ),
                                 ),
                             ],
                           ),
                         ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                    child: Text(
                      l10n.missionHintInactivity,
                      style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 11),
                      textAlign: TextAlign.center,
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
}

class _TapEffectData {
  final int id;
  final Offset position;
  final String assetPath;
  final double baseScale;

  _TapEffectData({
    required this.id,
    required this.position,
    required this.assetPath,
    required this.baseScale,
  });
}

class TapEffectWidget extends StatefulWidget {
  final Offset position;
  final String assetPath;
  final double baseScale;
  final VoidCallback onComplete;

  const TapEffectWidget({
    super.key,
    required this.position,
    required this.assetPath,
    required this.baseScale,
    required this.onComplete,
  });

  @override
  State<TapEffectWidget> createState() => _TapEffectWidgetState();
}

class _TapEffectWidgetState extends State<TapEffectWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _rotation;
  late Animation<Offset> _movement;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final random = Random();
    final angle = random.nextDouble() * 2 * pi;
    final distance = 40.0 + random.nextDouble() * 40.0;
    
    // 커졌다가 다시 작아지는 애니메이션 (초기 크기를 0.25부터 시작하여 자연스럽게)
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.25, end: widget.baseScale * 1.2)
            .chain(CurveTween(curve: Curves.easeOutBack)), 
        weight: 35
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.baseScale * 1.2, end: widget.baseScale * 0.5)
            .chain(CurveTween(curve: Curves.easeIn)), 
        weight: 65
      ),
    ]).animate(_controller);

    _rotation = Tween<double>(
      begin: (random.nextDouble() - 0.5) * 0.5,
      end: (random.nextDouble() - 0.5) * 4.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _movement = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(cos(angle) * distance, sin(angle) * distance),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 40),
    ]).animate(_controller);

    _controller.forward().then((_) {
      if (mounted) widget.onComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx - 45,
      top: widget.position.dy - 45,
      child: IgnorePointer(
        child: FadeTransition(
          opacity: _opacity,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: _movement.value,
                child: Transform.rotate(
                  angle: _rotation.value,
                  child: Transform.scale(
                    scale: _scale.value,
                    child: child,
                  ),
                ),
              );
            },
            child: Image.asset(
              widget.assetPath,
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}


