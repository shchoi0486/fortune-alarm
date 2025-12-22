import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        title: const Text('알람 설정', style: TextStyle(fontWeight: FontWeight.bold)),
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
            '기본 알람 동작',
            [
              _buildSliderTile(
                '기본 알람 음량',
                '새 알람 생성 시 적용되는 기본 음량입니다.',
                'default_volume',
                1.0,
                isDark,
              ),
              _buildSwitchTile(
                '점진적 음량 증가',
                '알람 소리가 서서히 커지도록 설정합니다.',
                'default_gradual_volume',
                false,
                isDark,
              ),
              _buildSwitchTile(
                '기본 진동',
                '새 알람 생성 시 진동을 기본으로 켭니다.',
                'default_vibration',
                true,
                isDark,
              ),
            ],
            isDark,
          ),
          const SizedBox(height: 24),
          _buildSection(
            '다시 울림(스누즈)',
            [
              _buildDropdownTile(
                '기본 간격',
                'default_snooze_interval',
                5,
                [1, 3, 5, 10, 15, 30],
                '분',
                isDark,
              ),
              _buildDropdownTile(
                '최대 횟수',
                'default_max_snooze_count',
                3,
                [1, 3, 5, 10],
                '회',
                isDark,
              ),
            ],
            isDark,
          ),
        ],
      ),
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

  Widget _buildSwitchTile(String title, String subtitle, String key, bool defaultValue, bool isDark) {
    bool value = _settingsBox.get(key, defaultValue: defaultValue);
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
      value: value,
      onChanged: (newValue) {
        setState(() {
          _settingsBox.put(key, newValue);
        });
      },
      activeColor: Colors.blueAccent,
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
