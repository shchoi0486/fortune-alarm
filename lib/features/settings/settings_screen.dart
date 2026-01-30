import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart'; // [추가]
import '../../providers/theme_provider.dart';
import '../../providers/locale_provider.dart';
import '../../services/ad_service.dart';
import '../../services/notification_service.dart';
import '../../widgets/ad_widgets.dart';
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
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _appVersion = '${packageInfo.version} (${packageInfo.buildNumber})';
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
    final currentLocale = ref.watch(localeProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildSectionHeader(AppLocalizations.of(context)!.general, isFirst: true),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.darkMode),
            subtitle: Text(AppLocalizations.of(context)!.darkModeDescription),
            value: isDark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).toggleTheme(value);
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            subtitle: Text(_getLanguageName(context, currentLocale?.languageCode)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showLanguagePicker(context, ref),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 1),
          ),
          _buildSectionHeader(AppLocalizations.of(context)!.information, isFirst: false),
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
          FutureBuilder<bool>(
            future: AdService.isPrivacyOptionsRequired(), // GDPR 대상 여부 확인
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return ListTile(
                  title: Text(AppLocalizations.of(context)!.privacySettings),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () async {
                    await AdService.showPrivacyOptionsForm((error) {
                      if (error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.message)),
                        );
                      }
                    });
                  },
                );
              }
              return const SizedBox.shrink(); // 대상이 아니면 버튼 숨김
            },
          ),
          // 설정 화면 하단 네이티브 광고 추가
          const DetailedAdWidget(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
            child: Text(
              AppLocalizations.of(context)!.version(_appVersion.isEmpty ? "1.0.0" : _appVersion),
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey[500] : Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    ),
  );
}

  String _getLanguageName(BuildContext context, String? languageCode) {
    final l10n = AppLocalizations.of(context)!;
    switch (languageCode) {
      case 'ko':
        return l10n.languageKorean;
      case 'en':
        return l10n.languageEnglish;
      case 'ja':
        return l10n.languageJapanese;
      case 'zh':
        return l10n.languageChinese;
      case 'ru':
        return l10n.languageRussian;
      case 'hi':
        return l10n.languageHindi;
      case 'es':
        return l10n.languageSpanish;
      case 'fr':
        return l10n.languageFrench;
      case 'de':
        return l10n.languageGerman;
      default:
        // 시스템 언어인 경우 현재 적용된 언어 이름을 반환
        final locale = Localizations.localeOf(context);
        return _getLanguageName(context, locale.languageCode);
    }
  }

  void _showLanguagePicker(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.read(localeProvider);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  l10n.language,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  children: [
                    _buildLanguageTile(context, ref, 'ko', l10n.languageKorean, currentLocale?.languageCode == 'ko'),
                    _buildLanguageTile(context, ref, 'en', l10n.languageEnglish, currentLocale?.languageCode == 'en'),
                    _buildLanguageTile(context, ref, 'ja', l10n.languageJapanese, currentLocale?.languageCode == 'ja'),
                    _buildLanguageTile(context, ref, 'zh', l10n.languageChinese, currentLocale?.languageCode == 'zh'),
                    _buildLanguageTile(context, ref, 'ru', l10n.languageRussian, currentLocale?.languageCode == 'ru'),
                    _buildLanguageTile(context, ref, 'hi', l10n.languageHindi, currentLocale?.languageCode == 'hi'),
                    _buildLanguageTile(context, ref, 'es', l10n.languageSpanish, currentLocale?.languageCode == 'es'),
                    _buildLanguageTile(context, ref, 'fr', l10n.languageFrench, currentLocale?.languageCode == 'fr'),
                    _buildLanguageTile(context, ref, 'de', l10n.languageGerman, currentLocale?.languageCode == 'de'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageTile(BuildContext context, WidgetRef ref, String code, String name, bool isSelected) {
    return ListTile(
      title: Text(name),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.blueAccent) : null,
      onTap: () async {
        await ref.read(localeProvider.notifier).setLocale(code);
        // 알림 다시 스케줄링하여 언어 반영
        await NotificationService().scheduleDefaultFortuneNotifications();
        if (context.mounted) Navigator.pop(context);
      },
    );
  }

  Widget _buildSectionHeader(String title, {bool isFirst = false}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, isFirst ? 12 : 24, 16, 8),
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

