import 'package:flutter/material.dart';

class GenericFortuneScreen extends StatelessWidget {
  final String title;

  const GenericFortuneScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white70 : Colors.black54;
    final subTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 80,
              color: subTextColor,
            ),
            const SizedBox(height: 20),
            Text(
              "$title\n서비스 준비 중입니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "더 정확하고 유용한 운세 정보를 위해\n열심히 준비하고 있어요!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: subTextColor,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("돌아가기"),
            ),
          ],
        ),
      ),
    );
  }
}
