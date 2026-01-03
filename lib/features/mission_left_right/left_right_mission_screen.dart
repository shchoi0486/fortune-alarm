import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';

import '../../data/models/alarm_model.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../mission/widgets/mission_success_overlay.dart';

class LeftRightMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;
  final int targetStreak;

  const LeftRightMissionScreen({super.key, this.alarmId, this.targetStreak = 5});

  @override
  ConsumerState<LeftRightMissionScreen> createState() => _LeftRightMissionScreenState();
}

class _LeftRightMissionScreenState extends ConsumerState<LeftRightMissionScreen> with TickerProviderStateMixin {
  final Random _random = Random();

  AlarmModel? _alarm;
  bool _isLoading = true;

  Timer? _inactivityTimer;

  bool _expectLeft = true;
  int _streak = 0;
  bool _wrongFlash = false;
  bool _isSuccess = false;

  late AnimationController _characterController;
  late Animation<double> _characterMove;
  late Animation<double> _characterJump;
  late Animation<double> _characterRotate;
  late Animation<double> _characterScale;
  
  String _currentCharacter = 'assets/icon/fortuni1_trans.webp';
  static const List<String> _characters = [
    'assets/icon/fortuni1_trans.webp',
    'assets/icon/fortuni4_joyful_trans.webp',
    'assets/icon/rabit.webp',
    'assets/icon/panda.webp',
    'assets/icon/dog.webp',
  ];

  @override
  void initState() {
    super.initState();
    _expectLeft = _random.nextBool();
    _loadAlarm();
    _startInactivityTimer();

    _characterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _characterMove = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 20.0).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 0.0).chain(CurveTween(curve: Curves.easeIn)), weight: 50),
    ]).animate(_characterController);

    _characterJump = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -15.0).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -15.0, end: 0.0).chain(CurveTween(curve: Curves.bounceOut)), weight: 50),
    ]).animate(_characterController);

    _characterRotate = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.1).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -0.1, end: 0.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
    ]).animate(_characterController);

    _characterScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0), weight: 50),
    ]).animate(_characterController);
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    _characterController.dispose();
    super.dispose();
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
    // 기본 배경을 더 선명하고 밝은 오렌지-옐로우 그라데이션으로 변경
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFFDC830), Color(0xFFF37335), Color(0xFFFFFFFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  Future<void> _vibrateWrong() async {
    try {
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 110, 60, 110]);
      }
    } catch (_) {}
  }

  void _nextPrompt() {
    _expectLeft = _random.nextBool();
    _currentCharacter = _characters[_random.nextInt(_characters.length)];
  }

  void _onTap(bool isLeft) async {
    _resetInactivityTimer();
    HapticFeedback.lightImpact();
    
    final goal = _alarm?.shakeCount ?? widget.targetStreak;
    final correct = isLeft == _expectLeft;
    if (correct) {
      setState(() {
        _streak++;
        _wrongFlash = false;
      });
      if (_streak >= goal && mounted) {
      setState(() {
        _isSuccess = true;
      });
      return;
    }
      setState(_nextPrompt);
      return;
    }

    await _vibrateWrong();
    if (!mounted) return;
    setState(() {
      _streak = 0;
      _wrongFlash = true;
      _nextPrompt();
    });
    Future.delayed(const Duration(milliseconds: 240), () {
      if (!mounted) return;
      setState(() => _wrongFlash = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final overlay = _wrongFlash ? Colors.redAccent.withOpacity(0.18) : Colors.transparent;

    final goal = _alarm?.shakeCount ?? widget.targetStreak;

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
                  Colors.white.withOpacity(isDarkMode ? 0.1 : 0.25),
                  Colors.black.withOpacity(isDarkMode ? 0.35 : 0.15),
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
                        color: Colors.white.withOpacity(0.5), // 투명도를 높여 배경을 더 밝게 (가독성 확보)
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
                                colors: [Color(0xFFFFC371), Color(0xFFFF5F6D)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.compare_arrows, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.missionLeftRight,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF2C3E50), // 어두운 색으로 변경하여 가독성 확보
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.missionLeftRightDescription(goal),
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
                              '$_streak/$goal',
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
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.35), // 배경이 덜 보이도록 불투명도 증가
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                  margin: const EdgeInsets.symmetric(horizontal: 18),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5), // 더 선명하게
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _expectLeft ? l10n.missionLeftRightPromptLeft : l10n.missionLeftRightPromptRight,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF2C3E50), // 어두운 색으로 가독성 확보
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                AnimatedBuilder(
                                  animation: _characterController,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(
                                        _expectLeft ? -_characterMove.value : _characterMove.value,
                                        _characterJump.value,
                                      ),
                                      child: Transform.rotate(
                                        angle: _expectLeft ? _characterRotate.value : -_characterRotate.value,
                                        child: Transform.scale(
                                          scale: _characterScale.value,
                                          child: child,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Transform.scale(
                                      scaleX: _expectLeft ? 1.0 : -1.0,
                                      child: Image.asset(
                                        _currentCharacter,
                                        width: 180,
                                        height: 180,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => _onTap(true),
                                          child: Container(
                                            height: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.5), // 상단 박스와 동일하게
                                              borderRadius: BorderRadius.circular(22),
                                              border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                l10n.left,
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFF2C3E50), // 어두운 색으로 가독성 확보
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => _onTap(false),
                                          child: Container(
                                            height: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.5), // 상단 박스와 동일하게
                                              borderRadius: BorderRadius.circular(22),
                                              border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                l10n.right,
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFF2C3E50), // 어두운 색으로 가독성 확보
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                          IgnorePointer(
                            ignoring: true,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 160),
                              decoration: BoxDecoration(color: overlay),
                            ),
                          ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

