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
import '../../data/models/math_difficulty.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../mission/widgets/mission_success_overlay.dart';

class HiddenButtonMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;
  final int colorDelta;
  final int itemCount;

  const HiddenButtonMissionScreen({
    super.key,
    this.alarmId,
    this.colorDelta = 10,
    this.itemCount = 48,
  });

  @override
  ConsumerState<HiddenButtonMissionScreen> createState() => _HiddenButtonMissionScreenState();
}

class _HiddenButtonMissionScreenState extends ConsumerState<HiddenButtonMissionScreen> {
  final Random _random = Random();
  final AudioPlayer _audioPlayer = AudioPlayer();

  AlarmModel? _alarm;
  bool _isLoading = true;

  Timer? _inactivityTimer;
  Timer? _showTimer;
  Timer? _countdownTimer;
  Timer? _inputTimer;
  List<int> _sequence = const [];
  int _showIndex = 0;
  int _countdown = 3;
  int _inputIndex = 0;
  int _timeLeft = 10;

  bool _wrongFlash = false;
  bool _isShowing = true;
  bool _isCountdown = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _loadAlarm();
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    _showTimer?.cancel();
    _countdownTimer?.cancel();
    _inputTimer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      if (mounted) setState(() => _isLoading = false);
      _startRound();
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
      _startRound();
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
      _startRound();
    }
  }

  int _sequenceLength() {
    final d = _alarm?.mathDifficulty;
    if (d == MathDifficulty.easy) return 3;
    if (d == MathDifficulty.hard) return 5;
    return 4;
  }

  int _gridSide() {
    final d = _alarm?.mathDifficulty;
    if (d == MathDifficulty.easy) return 4;
    if (d == MathDifficulty.hard) return 7;
    return 5;
  }

  int _gridItemCount() => _gridSide() * _gridSide();

  String _difficultyLabel(AppLocalizations l10n) {
    final d = _alarm?.mathDifficulty;
    if (d == MathDifficulty.easy) return l10n.difficultyEasy;
    if (d == MathDifficulty.hard) return l10n.difficultyHard;
    return l10n.difficultyNormal;
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
    return const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/alarm_bg.png'), fit: BoxFit.cover),
    );
  }

  Future<void> _vibrateWrong() async {
    try {
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 110, 45, 110]);
      }
    } catch (_) {}
  }

  void _playTickFeedback() {
    try {
      SystemSound.play(SystemSoundType.click);
    } catch (_) {}
    try {
      HapticFeedback.selectionClick();
    } catch (_) {}
  }

  void _playSuccessFeedback() {
    try {
      HapticFeedback.heavyImpact();
      _audioPlayer.play(AssetSource('sounds/morning.ogg'), volume: 0.25);
      if (Platform.isAndroid || Platform.isIOS) {
         Vibration.vibrate(pattern: [0, 100, 50, 100]);
      }
    } catch (_) {}
  }

  Future<void> _playNote(int index) async {
    try {
      final total = _gridItemCount();
      // 인덱스에 따라 재생 속도(피치) 조절 (0.8 ~ 1.8)
      final rate = 0.8 + (index / total) * 1.0;
      
      await _audioPlayer.stop();
      await _audioPlayer.setPlaybackRate(rate);
      // 비교적 짧고 맑은 소리인 birds.ogg 사용
      await _audioPlayer.play(AssetSource('sounds/birds.ogg'), volume: 0.3);
      
      // 햅틱 진동
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(duration: 50, amplitude: 128);
      }
    } catch (e) {
      debugPrint('Error playing note: $e');
    }
  }

  Duration _showStepDuration() {
    final len = _sequenceLength();
    final ms = (1100 - ((len - 2) * 90)).clamp(750, 1100);
    return Duration(milliseconds: ms);
  }

  void _startRound() {
    _showTimer?.cancel();
    _countdownTimer?.cancel();
    _inputTimer?.cancel();

    final len = _sequenceLength();
    final set = <int>{};
    while (set.length < len) {
      set.add(_random.nextInt(_gridItemCount()));
    }
    final seq = set.toList(growable: false)..shuffle(_random);
    setState(() {
      _sequence = seq;
      _showIndex = 0;
      _countdown = 3;
      _inputIndex = 0;
      _timeLeft = 10;
      _isShowing = false;
      _isCountdown = true;
      _wrongFlash = false;
    });
    _beginCountdown();
  }

  void _scheduleNextShow() {
    _showTimer?.cancel();
    if (!mounted) return;

    if (_showIndex >= _sequence.length) {
      _finishShowAndBeginInput();
      return;
    }

    _playTickFeedback();
    _showTimer = Timer(_showStepDuration(), () {
      if (!mounted) return;
      setState(() {
        _showIndex += 1;
      });
      _scheduleNextShow();
    });
  }

  void _beginCountdown() {
    _showTimer?.cancel();
    _countdownTimer?.cancel();
    if (!mounted) return;

    setState(() {
      _isCountdown = true;
      _countdown = 3;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_countdown <= 1) {
        t.cancel();
        _beginShow();
        return;
      }
      setState(() {
        _countdown -= 1;
      });
      _playTickFeedback(); // 카운트다운 틱 피드백 추가
    });
  }

  void _beginShow() {
    _showTimer?.cancel();
    if (!mounted) return;
    setState(() {
      _isCountdown = false;
      _isShowing = true;
      _showIndex = 0;
    });
    _scheduleNextShow();
  }

  void _finishShowAndBeginInput() {
    _showTimer?.cancel();
    if (!mounted) return;
    setState(() {
      _isShowing = false;
    });
    Future.delayed(const Duration(milliseconds: 420), () {
      if (!mounted) return;
      _beginInput();
    });
  }

  void _beginInput() {
    _inputTimer?.cancel();
    if (!mounted) return;
    setState(() {
      _isCountdown = false;
      _timeLeft = 10;
      _inputIndex = 0;
    });
    _inputTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _timeLeft -= 1;
      });
      if (_timeLeft <= 0) {
        t.cancel();
        _onFail();
      }
    });
  }

  void _onFail() async {
    await _vibrateWrong();
    if (!mounted) return;
    setState(() => _wrongFlash = true);
    Future.delayed(const Duration(milliseconds: 260), () {
      if (!mounted) return;
      setState(() => _wrongFlash = false);
    });
    Future.delayed(const Duration(milliseconds: 420), () {
      if (!mounted) return;
      _startRound();
    });
  }

  void _onTapIndex(int index) async {
    _resetInactivityTimer();
    if (_isLoading || _isShowing || _isCountdown || _isSuccess) return;
    if (_sequence.isEmpty) return;

    final expected = _sequence[_inputIndex];
    if (index == expected) {
      if (!mounted) return;
      
      // 피아노 건반 느낌의 소리와 햅틱 효과 재생
      _playNote(index);
      
      if (_inputIndex + 1 >= _sequence.length) {
        _inputTimer?.cancel();
        _playSuccessFeedback(); // 성공 피드백 호출
        setState(() {
          _isSuccess = true;
        });
        return;
      }
      setState(() {
        _inputIndex += 1;
      });
      return;
    }
    _onFail();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final side = _gridSide();
    final spacing = side >= 8 ? 6.0 : 10.0;

    final base = const Color(0xFF2B6BE6);
    final lit = const Color(0xFF80D8FF);
    final done = const Color(0xFF00C853);
    final overlay = _wrongFlash ? Colors.redAccent.withValues(alpha: 0.18) : Colors.transparent;

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
                  Colors.black.withValues(alpha: isDarkMode ? 0.55 : 0.45),
                  Colors.black.withValues(alpha: isDarkMode ? 0.72 : 0.62),
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
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.visibility, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.missionHiddenButton,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.missionHiddenButtonDescription,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withValues(alpha: 0.85),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        if (_isLoading) const Center(child: CircularProgressIndicator(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      GridView.builder(
                                        padding: const EdgeInsets.all(14),
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: side,
                                          crossAxisSpacing: spacing,
                                          mainAxisSpacing: spacing,
                                        ),
                                        itemCount: side * side,
                                        itemBuilder: (context, index) {
                                          final showing = _isShowing && _showIndex < _sequence.length && _sequence[_showIndex] == index;
                                          final isDone = !_isShowing && !_isCountdown && _inputIndex > 0 && _inputIndex <= _sequence.length && _sequence.take(_inputIndex).contains(index);
                                          final color = isDone ? done : (showing ? lit : base);
                                          return GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () => _onTapIndex(index),
                                            child: AnimatedScale(
                                              scale: showing ? 1.06 : 1.0,
                                              duration: const Duration(milliseconds: 120),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: color,
                                                  borderRadius: BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.white.withValues(alpha: showing ? 0.28 : 0.08),
                                                    width: showing ? 2 : 1,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withValues(alpha: showing ? 0.24 : 0.15),
                                                      blurRadius: showing ? 16 : 10,
                                                      offset: const Offset(0, 6),
                                                    ),
                                                  ],
                                                ),
                                                child: null,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      IgnorePointer(
                                        ignoring: true,
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 160),
                                          decoration: BoxDecoration(
                                            color: overlay,
                                            borderRadius: BorderRadius.circular(18),
                                          ),
                                        ),
                                      ),
                                      if (_isCountdown)
                                        Positioned.fill(
                                          child: Center(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withValues(alpha: 0.35),
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                                              ),
                                              child: Text(
                                                '$_countdown',
                                                style: const TextStyle(
                                                  fontSize: 52,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withValues(alpha: 0.18),
                                              borderRadius: BorderRadius.circular(999),
                                              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                                            ),
                                            child: Text(
                                              '${_difficultyLabel(l10n)} ${_sequenceLength()}  ${side}x$side',
                                              style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
                                            ),
                                          ),
                                          const Spacer(),
                                          if (!_isLoading && !_isShowing && !_isCountdown)
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withValues(alpha: 0.18),
                                                borderRadius: BorderRadius.circular(999),
                                                border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                                              ),
                                              child: Text(
                                                '$_timeLeft',
                                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (!_isLoading && !_isShowing && !_isCountdown) ...[
                                        const SizedBox(height: 10),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(999),
                                          child: LinearProgressIndicator(
                                            value: (_timeLeft.clamp(0, 10)) / 10,
                                            minHeight: 10,
                                            backgroundColor: Colors.white.withValues(alpha: 0.10),
                                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.cyanAccent),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
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
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.65), fontSize: 11),
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
