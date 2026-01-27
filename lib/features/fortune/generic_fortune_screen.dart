import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class GenericFortuneScreen extends StatelessWidget {
  final String title;

  const GenericFortuneScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
              l10n.fortuneUnderConstructionTitle(title),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.fortuneUnderConstructionSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: subTextColor,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.goBack),
            ),
          ],
        ),
      ),
    );
  }
}
