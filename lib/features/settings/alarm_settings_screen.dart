import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../services/notification_service.dart';

class AlarmSettingsScreen extends ConsumerStatefulWidget {
  const AlarmSettingsScreen({super.key});

  @override
  ConsumerState<AlarmSettingsScreen> createState() => _AlarmSettingsScreenState();
}

class _AlarmSettingsScreenState extends ConsumerState<AlarmSettingsScreen> {
  late Box _settingsBox;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    _settingsBox = await Hive.openBox('alarm_settings');
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _saveFortuneSettings() async {
    final enabled = _settingsBox.get('daily_fortune_enabled', defaultValue: true);
    
    if (enabled) {
      final time1Str = _settingsBox.get('daily_fortune_time1', defaultValue: '08:00');
      final time2Str = _settingsBox.get('daily_fortune_time2', defaultValue: '13:00');
      
      final parts1 = time1Str.split(':');
      final time1 = TimeOfDay(hour: int.parse(parts1[0]), minute: int.parse(parts1[1]));
      
      final parts2 = time2Str.split(':');
      final time2 = TimeOfDay(hour: int.parse(parts2[0]), minute: int.parse(parts2[1]));

      await NotificationService().scheduleDailyFortuneNotification(
        id: 40001,
        time: time1,
        title: "오늘의 운세 (오전)",
        body: "오늘의 운세를 확인하고 활기차게 시작해 보세요!",
      );
      
      await NotificationService().scheduleDailyFortuneNotification(
        id: 40002,
        time: time2,
        title: "오늘의 운세 (오후)",
        body: "오후의 운세는 어떨까요? 지금 바로 확인해 보세요!",
      );
    } else {
      await NotificationService().cancelAllFortuneNotifications();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA);

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.alarmSettings, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            AppLocalizations.of(context)!.defaultAlarmBehavior,
            [
              _buildSliderTile(
                AppLocalizations.of(context)!.defaultAlarmVolume,
                AppLocalizations.of(context)!.defaultAlarmVolumeDescription,
                'default_volume',
                1.0,
                isDark,
              ),
              _buildSwitchTile(
                AppLocalizations.of(context)!.gradualVolume,
                AppLocalizations.of(context)!.gradualVolumeDescription,
                'default_gradual_volume',
                false,
                isDark,
              ),
              _buildSwitchTile(
                AppLocalizations.of(context)!.defaultVibration,
                AppLocalizations.of(context)!.defaultVibrationDescription,
                'default_vibration',
                true,
                isDark,
              ),
            ],
            isDark,
          ),
          const SizedBox(height: 24),
          _buildSection(
            AppLocalizations.of(context)!.snoozeSettings,
            [
              _buildDropdownTile(
                AppLocalizations.of(context)!.defaultInterval,
                'default_snooze_interval',
                5,
                [1, 3, 5, 10, 15, 30],
                AppLocalizations.of(context)!.minutes,
                isDark,
              ),
              _buildDropdownTile(
                AppLocalizations.of(context)!.maxSnoozeCountLabel,
                'default_max_snooze_count',
                3,
                [1, 3, 5, 10],
                AppLocalizations.of(context)!.times,
                isDark,
              ),
            ],
            isDark,
          ),
          const SizedBox(height: 24),
          _buildSection(
            "오늘의 운세 알림",
            [
              _buildSwitchTile(
                "알림 활성화",
                "지정한 시간에 오늘의 운세를 알려드립니다.",
                'daily_fortune_enabled',
                true,
                isDark,
                onChanged: (_) => _saveFortuneSettings(),
              ),
              if (_settingsBox.get('daily_fortune_enabled', defaultValue: true)) ...[
                _buildTimeTile(
                  "오전 알림 시간",
                  'daily_fortune_time1',
                  '08:00',
                  isDark,
                ),
                _buildTimeTile(
                  "오후 알림 시간",
                  'daily_fortune_time2',
                  '13:00',
                  isDark,
                ),
              ],
            ],
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeTile(String title, String key, String defaultValue, bool isDark) {
    final timeStr = _settingsBox.get(key, defaultValue: defaultValue);
    final parts = timeStr.split(':');
    final time = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));

    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
      ),
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: time,
        );
        if (picked != null) {
          setState(() {
            _settingsBox.put(key, "${picked.hour}:${picked.minute}");
          });
          _saveFortuneSettings();
        }
      },
    );
  }

  Widget _buildSection(String title, List<Widget> children, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSliderTile(String title, String subtitle, String key, double defaultValue, bool isDark) {
    double value = _settingsBox.get(key, defaultValue: defaultValue);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.volume_mute, size: 20, color: Colors.grey[400]),
              Expanded(
                child: Slider(
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      _settingsBox.put(key, newValue);
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
              ),
              Icon(Icons.volume_up, size: 20, color: Colors.grey[400]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, String key, bool defaultValue, bool isDark, {ValueChanged<bool>? onChanged}) {
    bool value = _settingsBox.get(key, defaultValue: defaultValue);
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
      value: value,
      onChanged: (newValue) {
        setState(() {
          _settingsBox.put(key, newValue);
        });
        if (onChanged != null) onChanged(newValue);
      },
      activeThumbColor: Colors.blueAccent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildDropdownTile(String title, String key, dynamic defaultValue, List<dynamic> options, String unit, bool isDark) {
    dynamic value = _settingsBox.get(key, defaultValue: defaultValue);
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      trailing: DropdownButton<dynamic>(
        value: options.contains(value) ? value : options.first,
        underline: Container(),
        onChanged: (newValue) {
          setState(() {
            _settingsBox.put(key, newValue);
          });
        },
        items: options.map((opt) {
          return DropdownMenuItem<dynamic>(
            value: opt,
            child: Text('$opt$unit'),
          );
        }).toList(),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
