import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import '../../providers/theme_provider.dart';
import '../../services/notification_service.dart';
import 'notice_screen.dart';
import 'faq_screen.dart';
import 'support_screen.dart';
import 'alarm_settings_screen.dart';
import 'policy_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> with WidgetsBindingObserver {
  bool _dailyFortuneEnabled = false;
  TimeOfDay _dailyFortuneTime = const TimeOfDay(hour: 8, minute: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadFortuneSettings();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _loadFortuneSettings() async {
    final box = await Hive.openBox('app_state');
    if (mounted) {
      setState(() {
        _dailyFortuneEnabled = box.get('daily_fortune_enabled', defaultValue: false);
        final timeStr = box.get('daily_fortune_time', defaultValue: '08:00');
        final parts = timeStr.split(':');
        _dailyFortuneTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      });
    }
  }

  Future<void> _saveFortuneSettings() async {
    final box = await Hive.openBox('app_state');
    await box.put('daily_fortune_enabled', _dailyFortuneEnabled);
    await box.put('daily_fortune_time', '${_dailyFortuneTime.hour}:${_dailyFortuneTime.minute}');

    if (_dailyFortuneEnabled) {
      await NotificationService().scheduleDailyFortuneNotification(
        time: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, _dailyFortuneTime.hour, _dailyFortuneTime.minute),
        title: "오늘의 운세",
        body: "오늘의 운세를 확인하고 하루를 시작하세요!",
      );
    } else {
      await NotificationService().cancelDailyFortuneNotification();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 앱으로 돌아왔을 때 UI 갱신
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              AppLocalizations.of(context)!.settings,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
          
          _buildSectionHeader("운세 알림 설정"),
          SwitchListTile(
            title: const Text("오늘의 운세 알림"),
            subtitle: const Text("매일 정해진 시간에 운세를 확인하라는 알림을 받습니다."),
            value: _dailyFortuneEnabled,
            onChanged: (value) {
              setState(() {
                _dailyFortuneEnabled = value;
              });
              _saveFortuneSettings();
            },
          ),
          if (_dailyFortuneEnabled)
            ListTile(
              title: const Text("알림 시간"),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${_dailyFortuneTime.hour.toString().padLeft(2, '0')}:${_dailyFortuneTime.minute.toString().padLeft(2, '0')}",
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
                  initialTime: _dailyFortuneTime,
                );
                if (picked != null && picked != _dailyFortuneTime) {
                  setState(() {
                    _dailyFortuneTime = picked;
                  });
                  _saveFortuneSettings();
                }
              },
            ),

          _buildSectionHeader(AppLocalizations.of(context)!.general),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.darkMode),
            subtitle: Text(AppLocalizations.of(context)!.darkModeDescription),
            value: isDark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).toggleTheme(value);
            },
          ),
          if (Platform.isAndroid)
            _buildOptimizationTile(context),
          ListTile(
            title: Text(AppLocalizations.of(context)!.alarmSettings),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AlarmSettingsScreen()),
              );
            },
          ),
          
          _buildSectionHeader(AppLocalizations.of(context)!.information),
          ListTile(
            title: Text(AppLocalizations.of(context)!.notice),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NoticeScreen()),
              );
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.faq),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FAQScreen()),
              );
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.support),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SupportScreen(
                    title: AppLocalizations.of(context)!.support,
                    description: AppLocalizations.of(context)!.feedbackDescription,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.policy),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PolicyScreen(
                    title: AppLocalizations.of(context)!.policy,
                    content: AppLocalizations.of(context)!.privacyPolicy,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.version("1.0.0")),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildOptimizationTile(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FutureBuilder<Map<Permission, PermissionStatus>>(
      future: Future.wait([
        Permission.notification.status,
        Permission.ignoreBatteryOptimizations.status,
        Permission.scheduleExactAlarm.status,
        Permission.systemAlertWindow.status,
      ]).then((statuses) => {
        Permission.notification: statuses[0],
        Permission.ignoreBatteryOptimizations: statuses[1],
        Permission.scheduleExactAlarm: statuses[2],
        Permission.systemAlertWindow: statuses[3],
      }),
      builder: (context, snapshot) {
        final statuses = snapshot.data;
        final isNotificationGranted = statuses?[Permission.notification]?.isGranted ?? false;
        final isBatteryOptimized = statuses?[Permission.ignoreBatteryOptimizations]?.isGranted ?? false;
        final isExactAlarmGranted = statuses?[Permission.scheduleExactAlarm]?.isGranted ?? false;
        final isSystemAlertGranted = statuses?[Permission.systemAlertWindow]?.isGranted ?? false;

        final allGranted = isNotificationGranted && isBatteryOptimized && isExactAlarmGranted && isSystemAlertGranted;

        return ListTile(
          title: Text(l10n.alarmOptimization),
          subtitle: Text(allGranted ? l10n.allOptimizationsCompleted : l10n.optimizationNeeded),
          leading: Icon(Icons.rocket_launch, color: allGranted ? Colors.green : Colors.orange),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _showOptimizationBottomSheet(context),
        );
      },
    );
  }

  void _showOptimizationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return _OptimizationBottomSheetContent();
      },
    ).then((_) {
      if (mounted) setState(() {});
    });
  }
}

class _OptimizationBottomSheetContent extends StatefulWidget {
  @override
  State<_OptimizationBottomSheetContent> createState() => _OptimizationBottomSheetContentState();
}

class _OptimizationBottomSheetContentState extends State<_OptimizationBottomSheetContent> with WidgetsBindingObserver {
  Map<Permission, PermissionStatus> _statuses = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshStatuses();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshStatuses();
    }
  }

  Future<void> _refreshStatuses() async {
    final statuses = await Future.wait([
      Permission.notification.status,
      Permission.ignoreBatteryOptimizations.status,
      Permission.scheduleExactAlarm.status,
      Permission.systemAlertWindow.status,
    ]);

    if (mounted) {
      setState(() {
        _statuses = {
          Permission.notification: statuses[0],
          Permission.ignoreBatteryOptimizations: statuses[1],
          Permission.scheduleExactAlarm: statuses[2],
          Permission.systemAlertWindow: statuses[3],
        };
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    
    if (_isLoading) {
      return SizedBox(
        height: 300,
        child: Center(
          child: CircularProgressIndicator(
            color: isDark ? Colors.blueAccent : null,
          ),
        ),
      );
    }

    final isNotificationGranted = _statuses[Permission.notification]?.isGranted ?? false;
    final isBatteryOptimized = _statuses[Permission.ignoreBatteryOptimizations]?.isGranted ?? false;
    final isExactAlarmGranted = _statuses[Permission.scheduleExactAlarm]?.isGranted ?? false;
    final isSystemAlertGranted = _statuses[Permission.systemAlertWindow]?.isGranted ?? false;
    final allGranted = isNotificationGranted && isBatteryOptimized && isExactAlarmGranted && isSystemAlertGranted;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.alarmOptimization,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              if (allGranted)
                const Icon(Icons.verified, color: Colors.green, size: 28),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.optimizationDescription,
            style: TextStyle(
              fontSize: 14, 
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          _buildPermissionItem(
            l10n.allowNotificationPermission,
            l10n.notificationPermissionDescription,
            _statuses[Permission.notification]!,
            () async {
              if (isNotificationGranted) {
                await openAppSettings();
              } else {
                final status = await Permission.notification.request();
                if (status.isPermanentlyDenied) {
                  await openAppSettings();
                }
              }
              _refreshStatuses();
            },
            isDark,
          ),
          Divider(color: isDark ? Colors.grey[800] : Colors.grey[200]),
          _buildPermissionItem(
            l10n.excludeBatteryOptimization,
            l10n.batteryOptimizationDescription,
            _statuses[Permission.ignoreBatteryOptimizations]!,
            () async {
              if (isBatteryOptimized) {
                await openAppSettings();
              } else {
                await Permission.ignoreBatteryOptimizations.request();
              }
              _refreshStatuses();
            },
            isDark,
          ),
          Divider(color: isDark ? Colors.grey[800] : Colors.grey[200]),
          _buildPermissionItem(
            l10n.allowExactAlarm,
            l10n.exactAlarmDescription,
            _statuses[Permission.scheduleExactAlarm]!,
            () async {
              if (isExactAlarmGranted) {
                await openAppSettings();
              } else {
                await Permission.scheduleExactAlarm.request();
              }
              _refreshStatuses();
            },
            isDark,
          ),
          Divider(color: isDark ? Colors.grey[800] : Colors.grey[200]),
          _buildPermissionItem(
            l10n.drawOverOtherApps,
            l10n.overlayDescription,
            _statuses[Permission.systemAlertWindow]!,
            () async {
              if (isSystemAlertGranted) {
                await openAppSettings();
              } else {
                await Permission.systemAlertWindow.request();
              }
              _refreshStatuses();
            },
            isDark,
          ),
          const SizedBox(height: 16),
          if (allGranted)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? Colors.green.withOpacity(0.1) : Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.allSettingsCompleted,
                          style: TextStyle(
                            color: isDark ? Colors.green[300] : Colors.green[700],
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.manualSettingsInfo,
                    style: TextStyle(
                      color: isDark ? Colors.grey[500] : Colors.grey[600],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPermissionItem(
    String title,
    String description,
    PermissionStatus status,
    VoidCallback onTap,
    bool isDark,
  ) {
    final isGranted = status.isGranted;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(
        title, 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 16,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      subtitle: Text(
        description, 
        style: TextStyle(
          fontSize: 12, 
          color: isDark ? Colors.grey[500] : Colors.grey,
        ),
      ),
      trailing: Switch(
        value: isGranted,
        onChanged: (_) => onTap(),
        activeThumbColor: Colors.green,
        activeTrackColor: Colors.green.withOpacity(0.3),
      ),
    );
  }
}

