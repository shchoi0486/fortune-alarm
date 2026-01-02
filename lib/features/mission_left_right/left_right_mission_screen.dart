import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
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

class _LeftRightMissionScreenState extends ConsumerState<LeftRightMissionScreen> {
  final Random _random = Random();

  AlarmModel? _alarm;
  bool _isLoading = true;

  Timer? _inactivityTimer;

  bool _expectLeft = true;
  int _streak = 0;
  bool _wrongFlash = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _expectLeft = _random.nextBool();
    _loadAlarm();
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
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
    return const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/alarm_bg.png'), fit: BoxFit.cover),
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
  }

  void _onTap(bool isLeft) async {
    _resetInactivityTimer();
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
                  Colors.black.withOpacity(isDarkMode ? 0.55 : 0.45),
                  Colors.black.withOpacity(isDarkMode ? 0.74 : 0.64),
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
                                colors: [Color(0xFFFFC371), Color(0xFFFF5F6D)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.bolt, color: Colors.white),
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
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.missionLeftRightDescription(goal),
                                  style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.85)),
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
                              '$_streak/$goal',
                              style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
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
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white.withOpacity(0.12)),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 22),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                  margin: const EdgeInsets.symmetric(horizontal: 18),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: Colors.white.withOpacity(0.18)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _expectLeft ? l10n.missionLeftRightPromptLeft : l10n.missionLeftRightPromptRight,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
                                            height: 70,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: BorderRadius.circular(18),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.18),
                                                  blurRadius: 14,
                                                  offset: const Offset(0, 8),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                l10n.left,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => _onTap(false),
                                          child: Container(
                                            height: 70,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [Color(0xFFB721FF), Color(0xFF21D4FD)],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: BorderRadius.circular(18),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.18),
                                                  blurRadius: 14,
                                                  offset: const Offset(0, 8),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                l10n.right,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
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
