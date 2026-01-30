import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'providers/water_provider.dart';

class WaterAlarmScreen extends ConsumerWidget {
  const WaterAlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final waterState = ref.watch(waterProvider);
    final notifier = ref.read(waterProvider.notifier);
    final settings = waterState.settings;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(l10n.notifications, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l10n.notificationTime, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildTimeRow(context, l10n.start, settings.startTime, (newTime) {
                  notifier.updateSettings(startTime: newTime);
                }),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildTimeRow(context, l10n.end, settings.endTime, (newTime) {
                  notifier.updateSettings(endTime: newTime);
                }),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Text(l10n.notificationInterval, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildIntervalOption(context, notifier, settings.intervalMinutes, 15),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(context, notifier, settings.intervalMinutes, 30),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(context, notifier, settings.intervalMinutes, 60),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(context, notifier, settings.intervalMinutes, 90),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(context, notifier, settings.intervalMinutes, 120),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(BuildContext context, String label, String timeStr, Function(String) onSave) {
    final l10n = AppLocalizations.of(context)!;
    return ListTile(
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _formatTime(context, timeStr),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        // Parse timeStr "HH:mm"
        final parts = timeStr.split(':');
        final initialTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
        
        showCupertinoModalPopup(
          context: context,
          builder: (context) => Container(
            height: 300,
            padding: const EdgeInsets.only(top: 6.0),
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        child: Text(AppLocalizations.of(context)!.cancel),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoButton(
                        child: Text(AppLocalizations.of(context)!.confirm),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime(2024, 1, 1, initialTime.hour, initialTime.minute),
                      use24hFormat: false,
                      onDateTimeChanged: (DateTime newDateTime) {
                        final formatted = '${newDateTime.hour.toString().padLeft(2, '0')}:${newDateTime.minute.toString().padLeft(2, '0')}';
                        onSave(formatted);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatTime(BuildContext context, String time24) {
    final l10n = AppLocalizations.of(context)!;
    final parts = time24.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final period = hour >= 12 ? l10n.afternoon : l10n.morning;
    final h = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$h:${minute.toString().padLeft(2, '0')} $period';
  }

  Widget _buildIntervalOption(BuildContext context, dynamic notifier, int currentInterval, int value) {
    final l10n = AppLocalizations.of(context)!;
    final isSelected = currentInterval == value;
    return ListTile(
      title: Text(l10n.minutesFormat(value.toString()), style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
      onTap: () {
        notifier.updateSettings(intervalMinutes: value);
      },
    );
  }
}
