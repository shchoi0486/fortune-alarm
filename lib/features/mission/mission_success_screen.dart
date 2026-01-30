import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../main.dart';
import '../../providers/mission_provider.dart';

class MissionSuccessScreen extends ConsumerStatefulWidget {
  const MissionSuccessScreen({super.key});

  @override
  ConsumerState<MissionSuccessScreen> createState() => _MissionSuccessScreenState();
}

class _MissionSuccessScreenState extends ConsumerState<MissionSuccessScreen> {
  String? _randomMessage;

  @override
  void initState() {
    super.initState();
    // 화면 진입 시 기상 미션 자동 완료 처리
    Future.microtask(() {
      ref.read(missionProvider).completeWakeUpMission();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // 메시지가 아직 선택되지 않았다면 랜덤하게 선택
    if (_randomMessage == null) {
      final messages = [
        l10n.cheeringMessage1,
        l10n.cheeringMessage2,
        l10n.cheeringMessage3,
      ];
      _randomMessage = messages[Random().nextInt(messages.length)];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, size: 80, color: Colors.green),
                const SizedBox(height: 24),
                Text(
                  l10n.todaysCheering,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    _randomMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 4,
                      shadowColor: Colors.blueAccent.withOpacity(0.5),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.confirm,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
