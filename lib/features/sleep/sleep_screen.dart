import 'package:flutter/material.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("수면 분석")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("오늘의 수면", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSleepStat("수면 시간", "7시간 30분", Icons.bedtime),
                  _buildSleepStat("기상 시간", "07:30 AM", Icons.wb_sunny),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text("주간 수면 패턴", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBar("월", 0.6),
                  _buildBar("화", 0.8),
                  _buildBar("수", 0.5),
                  _buildBar("목", 0.7),
                  _buildBar("금", 0.9),
                  _buildBar("토", 0.8),
                  _buildBar("일", 0.7),
                ],
              ),
            ),
             const SizedBox(height: 20),
             const Text(
              "규칙적인 수면 습관을 유지하고 있습니다. 어제보다 30분 더 일찍 잠자리에 들었어요!",
              style: TextStyle(color: Colors.grey),
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
