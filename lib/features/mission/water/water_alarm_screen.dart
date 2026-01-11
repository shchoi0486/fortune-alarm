import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/water_provider.dart';

class WaterAlarmScreen extends ConsumerWidget {
  const WaterAlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waterState = ref.watch(waterProvider);
    final notifier = ref.read(waterProvider.notifier);
    final settings = waterState.settings;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text('알림', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
          const Text('알림 시간', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildTimeRow(context, '시작', settings.startTime, (newTime) {
                  notifier.updateSettings(startTime: newTime);
                }),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildTimeRow(context, '종료', settings.endTime, (newTime) {
                  notifier.updateSettings(endTime: newTime);
                }),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text('알림 간격', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildIntervalOption(notifier, settings.intervalMinutes, 15),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(notifier, settings.intervalMinutes, 30),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(notifier, settings.intervalMinutes, 60),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(notifier, settings.intervalMinutes, 90),
                Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey[200]),
                _buildIntervalOption(notifier, settings.intervalMinutes, 120),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(BuildContext context, String label, String timeStr, Function(String) onSave) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          _formatTime(timeStr),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () async {
        // Parse timeStr "HH:mm"
        final parts = timeStr.split(':');
        final initialTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
        
        final picked = await showTimePicker(
          context: context,
          initialTime: initialTime,
        );
        
        if (picked != null) {
          final formatted = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
          onSave(formatted);
        }
      },
    );
  }

  String _formatTime(String time24) {
    final parts = time24.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final period = hour >= 12 ? '오후' : '오전';
    final h = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$h:${minute.toString().padLeft(2, '0')} $period';
  }

  Widget _buildIntervalOption(dynamic notifier, int currentInterval, int value) {
    final isSelected = currentInterval == value;
    return ListTile(
      title: Text('$value분', style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
      onTap: () {
        notifier.updateSettings(intervalMinutes: value);
      },
    );
  }
}
