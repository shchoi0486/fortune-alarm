import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.sleepAnalysis)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.todaysSleep, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSleepStat(l10n.sleepDuration, l10n.defaultSleepDuration, Icons.bedtime),
                  _buildSleepStat(l10n.wakeUpTime, "07:30 AM", Icons.wb_sunny),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(l10n.weeklySleepPattern, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBar(l10n.monday, 0.6),
                  _buildBar(l10n.tuesday, 0.8),
                  _buildBar(l10n.wednesday, 0.5),
                  _buildBar(l10n.thursday, 0.7),
                  _buildBar(l10n.friday, 0.9),
                  _buildBar(l10n.saturday, 0.8),
                  _buildBar(l10n.sunday, 0.7),
                ],
              ),
            ),
             const SizedBox(height: 20),
             Text(
              l10n.sleepAdvice,
              style: const TextStyle(color: Colors.grey),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.indigo),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildBar(String label, double heightFactor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: 150 * heightFactor,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
