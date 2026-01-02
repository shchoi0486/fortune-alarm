import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';

import '../../data/models/alarm_model.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../mission/widgets/mission_success_overlay.dart';

class TapSprintMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;
  final int goalTaps;

  const TapSprintMissionScreen({super.key, this.alarmId, this.goalTaps = 30});

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

  Future<void> _vibrateSuccess() async {
    try {
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 60, 40, 60, 40, 120]);
      }
    } catch (_) {}
  }

  void _tickDecay() {
    if (!mounted) return;
    final now = DateTime.now();
    final idleMs = now.difference(_lastTapAt).inMilliseconds;
    if (idleMs < 700) return;
    if (_meter <= 0) return;
    final goal = _alarm?.shakeCount ?? widget.goalTaps;
    setState(() {
      _meter = (_meter - 0.22).clamp(0, goal.toDouble());
    });
  }

  void _onTap() async {
    _resetInactivityTimer();
    if (_isSuccess) return;
    final now = DateTime.now();
    final goal = _alarm?.shakeCount ?? widget.goalTaps;
    setState(() {
      _lastTapAt = now;
      _meter = (_meter + 1).clamp(0, goal.toDouble());
      _pulse = !_pulse;
    });
    if (_meter >= goal) {
      await _vibrateSuccess();
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final goal = _alarm?.shakeCount ?? widget.goalTaps;
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
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.missionTapSprintDescription(goal),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.85),
                                  ),
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
                              '${_meter.toInt()}/$goal',
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
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _onTap,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white.withOpacity(0.12)),
                          ),
                          child: Stack(
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
                                        backgroundColor: Colors.white.withOpacity(0.12),
                                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.cyanAccent),
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
                                      color: Colors.white.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(color: Colors.white.withOpacity(0.18)),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          l10n.missionTapSprintTapHere,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          l10n.missionTapSprintHint,
                                          style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
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

