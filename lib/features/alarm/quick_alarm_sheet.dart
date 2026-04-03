import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/alarm_model.dart';
import '../../providers/alarm_list_provider.dart';
import '../../providers/theme_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/notification_service.dart';
import 'ringtone_select_screen.dart';
import 'dart:io';

class QuickAlarmSheet extends ConsumerStatefulWidget {
  const QuickAlarmSheet({super.key});

  @override
  ConsumerState<QuickAlarmSheet> createState() => _QuickAlarmSheetState();
}

class _QuickAlarmSheetState extends ConsumerState<QuickAlarmSheet> {
  int _minutes = 0;
  bool _isVibrationEnabled = true;
  double _volume = 0.7;
  String? _ringtonePath;
  String? _ringtoneName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDefaultRingtone();
    });
  }

  void _loadDefaultRingtone() {
    // 기본 벨소리 설정 로직 (필요시 구현)
    if (mounted) {
      _ringtoneName = AppLocalizations.of(context)!.defaultRingtone;
      setState(() {});
    }
  }

  DateTime get _targetTime => DateTime.now().add(Duration(minutes: _minutes));

  void _addMinutes(int mins) {
    setState(() {
      _minutes += mins;
    });
  }

  void _resetMinutes() {
    setState(() {
      _minutes = 0;
    });
  }

  Future<void> _saveQuickAlarm() async {
    if (_minutes <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.pleaseSetTime ?? '시간을 설정해주세요.')),
      );
      return;
    }

    final l10n = AppLocalizations.of(context)!;
    final id = const Uuid().v4();
    final alarm = AlarmModel(
      id: id,
      time: _targetTime,
      isEnabled: true,
      label: l10n.quickAlarm,
      isVibrationEnabled: _isVibrationEnabled,
      isSoundEnabled: true,
      volume: _volume,
      ringtonePath: _ringtonePath,
    );

    // 1. 알람 추가
    await ref.read(alarmListProvider.notifier).addAlarm(alarm);

    // 2. 알람 스케줄링
    await AlarmSchedulerService.scheduleAlarm(alarm);

    // 3. 알림 생성
    final stableId = AlarmSchedulerService.getStableId(alarm.id);
    await NotificationService().showNotification(
      id: stableId,
      title: l10n.alarmScheduledTitle,
      body: l10n.alarmScheduledBody(
        DateFormat('HH:mm').format(alarm.time),
      ),
    );

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.alarmSaved)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final primaryColor = themeState.primaryColor;
    final isDark = themeState.themeMode == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;
    final textColor = isDark ? Colors.white : Colors.black;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black87;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(20, 10, 20, MediaQuery.of(context).padding.bottom + 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? Colors.white24 : Colors.black12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 32),
              Text(
                l10n.quickAlarm,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close_rounded, color: textColor.withOpacity(0.5), size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Time Display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 32), // Spacer for balance
              Text(
                l10n.addMinutes(_minutes.toString()),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _resetMinutes,
                icon: Icon(Icons.refresh_rounded, color: primaryColor.withOpacity(0.6), size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          Text(
            l10n.ringingAt(DateFormat('ah:mm', l10n.localeName).format(_targetTime)),
            style: TextStyle(
              fontSize: 14,
              color: secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Quick Buttons Grid
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.4,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildQuickButton(l10n.addMinutes('1'), 1, isDark, primaryColor),
              _buildQuickButton(l10n.addMinutes('5'), 5, isDark, primaryColor),
              _buildQuickButton(l10n.addMinutes('10'), 10, isDark, primaryColor),
              _buildQuickButton(l10n.addMinutes('15'), 15, isDark, primaryColor),
              _buildQuickButton(l10n.addMinutes('30'), 30, isDark, primaryColor),
              _buildQuickButton(l10n.addMinutes('60'), 60, isDark, primaryColor),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Settings Section
          _buildSettingItem(
            icon: Icons.music_note_rounded,
            title: l10n.alarmSound,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _ringtoneName ?? '',
                  style: TextStyle(color: secondaryTextColor, fontSize: 13),
                ),
                Icon(Icons.chevron_right_rounded, color: secondaryTextColor, size: 18),
              ],
            ),
            onTap: () async {
              final result = await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: RingtoneSelectScreen(initialRingtonePath: _ringtonePath),
                ),
              );
              if (result != null && result is Map<String, String?>) {
                setState(() {
                  _ringtonePath = result['path'];
                  _ringtoneName = result['name'] ?? l10n.defaultRingtone;
                });
              }
            },
          ),
          
          const SizedBox(height: 8),
          
          // Volume & Vibration
          Row(
            children: [
              Icon(Icons.volume_up_rounded, color: secondaryTextColor, size: 20),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: primaryColor,
                    inactiveTrackColor: primaryColor.withOpacity(0.1),
                    thumbColor: primaryColor,
                    overlayColor: primaryColor.withOpacity(0.2),
                    trackHeight: 3,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                  ),
                  child: Slider(
                    value: _volume,
                    onChanged: (val) => setState(() => _volume = val),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                height: 18,
                width: 1,
                color: isDark ? Colors.white10 : Colors.black.withOpacity(0.1),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => setState(() => _isVibrationEnabled = !_isVibrationEnabled),
                child: Icon(
                  _isVibrationEnabled ? Icons.vibration_rounded : Icons.vibration_outlined,
                  color: _isVibrationEnabled ? primaryColor : secondaryTextColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 4),
              SizedBox(
                height: 32,
                child: Switch(
                  value: _isVibrationEnabled,
                  onChanged: (val) => setState(() => _isVibrationEnabled = val),
                  activeColor: Colors.white,
                  activeTrackColor: primaryColor,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Save Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _saveQuickAlarm,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: primaryColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text(
                l10n.save,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButton(String label, int mins, bool isDark, Color primaryColor) {
    return InkWell(
      onTap: () => _addMinutes(mins),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: isDark ? Colors.white70 : Colors.black54, size: 22),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
