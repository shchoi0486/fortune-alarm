import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'providers/supplement_provider.dart';
import '../../../services/supplement_alarm_service.dart';
import '../../../services/notification_service.dart';
import '../../../services/ad_service.dart';
import '../../../widgets/ad_widgets.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';

class SupplementRingingScreen extends ConsumerStatefulWidget {
  final int alarmId;

  const SupplementRingingScreen({super.key, required this.alarmId});

  @override
  ConsumerState<SupplementRingingScreen> createState() => _SupplementRingingScreenState();
}

class _SupplementRingingScreenState extends ConsumerState<SupplementRingingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  Timer? _timeTimer;
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _audioGeneration = 0;
  bool _stopped = false;

  @override
  void initState() {
    super.initState();
    debugPrint('[SupplementRingingScreen] initState. AlarmID: ${widget.alarmId}');
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _timeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });

    // 알람 소리 재생 (세대 토큰: 500ms 대기 중 정지되면 재생하지 않음)
    final int generation = ++_audioGeneration;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint('[SupplementRingingScreen] Starting alarm sequence');

      // 1. 먼저 시스템 알림을 취소하여 알림 소리를 중단합니다.
      // 알림이 소리를 재생 중일 때 이를 취소하면 오디오 세션이 정리됩니다.
      await NotificationService().cancelNotification(widget.alarmId);
      debugPrint('[SupplementRingingScreen] Notification cancelled');

      // 2. 시스템 오디오 세션이 완전히 정리될 때까지 잠시 대기
      await Future.delayed(const Duration(milliseconds: 500));

      // 3. 앱 자체 오디오 플레이어로 루핑 재생 시작
      if (mounted && generation == _audioGeneration && !_stopped) {
        _playAlarm();
      }
    });
  }

  Future<void> _playAlarm() async {
    if (_stopped) return;
    final settings = ref.read(supplementProvider).settings;
    debugPrint('[SupplementRingingScreen] Playing alarm. Path: ${settings.ringtonePath}, Vol: ${settings.volume}');

    // 무음 설정이어도 진동은 울린다 (기존에는 소리 return 시 진동도 안 울림)
    try {
      final path = settings.ringtonePath;
      if (path != null) {
        if (path == 'default') {
          await FlutterRingtonePlayer().playAlarm(
            looping: true,
            volume: settings.volume,
            asAlarm: true,
          );
        } else {
          await _audioPlayer.setAudioContext(AudioContext(
            android: AudioContextAndroid(
              isSpeakerphoneOn: true,
              stayAwake: true,
              contentType: AndroidContentType.sonification,
              usageType: AndroidUsageType.alarm,
              audioFocus: AndroidAudioFocus.gain,
            ),
            iOS: AudioContextIOS(
              category: AVAudioSessionCategory.playback,
              options: {
                AVAudioSessionOptions.duckOthers,
                AVAudioSessionOptions.mixWithOthers,
                AVAudioSessionOptions.defaultToSpeaker,
              },
            ),
          ));

          await _audioPlayer.stop();
          await _audioPlayer.setReleaseMode(ReleaseMode.loop);
          await _audioPlayer.setVolume(settings.volume);

          final assetPath = 'sounds/$path.ogg';
          debugPrint('[SupplementRingingScreen] AudioPlayer playing asset: $assetPath');
          await _audioPlayer.play(AssetSource(assetPath));
        }
      }

      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 1000, 1000], repeat: 0);
      }
      debugPrint('[SupplementRingingScreen] Alarm sound/vibration started successfully');
    } catch (e) {
      debugPrint('[SupplementRingingScreen] Error playing supplement alarm: $e');
    }
  }

  Future<void> _stopAlarm() async {
    _stopped = true;
    _audioGeneration++;
    try {
      await _audioPlayer.stop();
    } catch (_) {}
    try {
      await FlutterRingtonePlayer().stop();
    } catch (_) {}
    try {
      Vibration.cancel();
    } catch (_) {}
  }

  @override
  void dispose() {
    _timeTimer?.cancel();
    // _stopAlarm()은 _audioPlayer를 사용하므로 dispose()보다 먼저 정리한다.
    _stopped = true;
    _audioGeneration++;
    try {
      Vibration.cancel();
    } catch (_) {}
    try {
      FlutterRingtonePlayer().stop();
    } catch (_) {}
    try {
      _controller.dispose();
    } catch (_) {}
    try {
      _audioPlayer.dispose();
    } catch (_) {}
    super.dispose();
  }

  void _takeNow() async {
    await _stopAlarm();
    // ref.read(supplementProvider.notifier).takeSupplement(); // 자동 섭취 처리 제거
    if (mounted) {
      // 알람 화면을 스택에서 완전히 제거하고 영양제 미션 화면으로 이동
      Navigator.of(context).pushNamedAndRemoveUntil('/supplement', (route) => route.isFirst);
    }
  }

  void _showSnoozeOptions() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.snoozeQuestion,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _snoozeButton(5),
                _snoozeButton(10),
                _snoozeButton(20),
                _snoozeButton(30),
                _snoozeButton(60),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _snoozeButton(int minutes) {
    final l10n = AppLocalizations.of(context)!;
    final label = minutes >= 60 ? '${minutes ~/ 60}${l10n.hoursShort}' : '$minutes${l10n.minutesShort}';
    return InkWell(
      onTap: () async {
        final l10n = AppLocalizations.of(context)!;
        await _stopAlarm();
        if (!mounted) return;
        _snooze(minutes, l10n);
        // 모든 화면을 닫고 메인으로 돌아감
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 72) / 3,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF334155),
              ),
            ),
            Text(
              l10n.after,
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
          ],
        ),
      ),
    );
  }

  void _snooze(int minutes, AppLocalizations l10n) {
    final time = DateTime.now().add(Duration(minutes: minutes));
    // 스누즈용 ID 생성 (기존 ID + 50000). 이미 스누즈된 울림(60000대)에서
    // 또 미루면 ID가 무한 증가해 취소 범위를 벗어나므로 같은 ID를 재사용한다.
    final snoozeId = widget.alarmId >= 60000 ? widget.alarmId : widget.alarmId + 50000;
    SupplementAlarmService.scheduleOneTime(time, snoozeId);

    // popUntil 이후에는 context가 무효가 되므로 스낵바를 먼저 표시한다.
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snoozeMessageGeneric(minutes)),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final timeStr = DateFormat('hh:mm').format(now);
    final amPmStr = DateFormat('a').format(now);
    final dateStr = DateFormat.yMEd(l10n.localeName).format(now);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1E293B),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                dateStr,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    timeStr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    amPmStr,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.medication,
                      size: 80,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                l10n.takeSupplementNow,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.takeNowQuestion,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              if (!AdService.isSubscriber)
                ListAdWidget(
                  height: 215,
                  factoryId: 'dialogAd',
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  borderRadius: 16,
                  showBorder: true,
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.2),
                  showShadow: false,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _takeNow,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 64),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        l10n.eatNow,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _showSnoozeOptions,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white70,
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      child: Text(
                        l10n.eatLater,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
