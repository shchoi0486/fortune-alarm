import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart'; // [추가]
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/theme_provider.dart';
import '../../providers/locale_provider.dart';
import '../../services/ad_service.dart';
import '../../services/notification_service.dart';
import '../../services/routine_alarm_service.dart';
import '../../services/supplement_alarm_service.dart';
import '../../services/water_alarm_service.dart';
import '../mission/supplement/models/supplement_settings.dart';
import '../mission/water/models/water_settings.dart';
import 'package:hive/hive.dart';
import 'notice_screen.dart';
import 'faq_screen.dart';
import 'support_screen.dart';
import 'alarm_settings_screen.dart';
import 'policy_screen.dart';
import '../../widgets/ad_banner_widget.dart';

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
    final themeState = ref.watch(themeProvider);
    final isDark = themeState.themeMode == ThemeMode.dark;
    final primaryColor = themeState.primaryColor;
    final currentLocale = ref.watch(localeProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: ListTileTheme(
          data: const ListTileThemeData(
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: -1),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildSectionHeader(AppLocalizations.of(context)!.general, isFirst: true),
            SwitchListTile(
              dense: true,
              title: Text(AppLocalizations.of(context)!.darkMode),
              subtitle: Text(AppLocalizations.of(context)!.darkModeDescription),
              activeColor: primaryColor,
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
            
            _buildSectionHeader(AppLocalizations.of(context)!.supportSection, isFirst: false),
            ListTile(
              leading: const Icon(Icons.sentiment_satisfied_alt_outlined),
              title: Text(AppLocalizations.of(context)!.rateApp),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final url = Uri.parse('https://play.google.com/store/apps/details?id=com.seriessnap.fortunealarm');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: Text(AppLocalizations.of(context)!.shareWithFriends),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Share.share(AppLocalizations.of(context)!.shareAppMessage);
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(thickness: 1),
            ),
            
            // 광고 배너 추가 (Information 섹션 위)
            const AdBannerWidget(
              useCardStyle: true,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        debugPrint('Privacy options form error: ${error.errorCode} - ${error.message}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AppLocalizations.of(context)!.adLoadError)),
                        );
                      }
                    });
                  },
                );
              }
              return const SizedBox.shrink(); // 대상이 아니면 버튼 숨김
            },
          ),
          // 설정 화면 하단 네이티브 광고 - Removed and moved to bottom of MainScreen
          
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
          const SizedBox(height: 100), // 120 -> 100 축소
        ],
      ),
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
    final themeState = ref.read(themeProvider);
    final isDark = themeState.themeMode == ThemeMode.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  l10n.language,
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Divider(height: 1, color: isDark ? Colors.white10 : Colors.black12),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
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
    final themeState = ref.watch(themeProvider);
    final isDark = themeState.themeMode == ThemeMode.dark;
    final primaryColor = themeState.primaryColor;
    
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected ? Icon(Icons.check_circle_rounded, color: primaryColor) : null,
      onTap: () async {
      await ref.read(localeProvider.notifier).setLocale(code);
      
      // 1. 운세 알림 재스케줄링
      await NotificationService().scheduleDefaultFortuneNotifications();
      
      // 2. 루틴 알림 재스케줄링
      await RoutineAlarmService.scheduleDailyReminders();
      
      // 3. 영양제 알림 재스케줄링
      try {
        final supplementBox = await Hive.openBox<SupplementSettings>('supplement_settings');
        final supplementSettings = supplementBox.get('settings');
        if (supplementSettings != null && supplementSettings.isAlarmEnabled) {
          await SupplementAlarmService.scheduleAlarms(supplementSettings.reminderTimes);
        }
      } catch (e) {
        debugPrint('[Settings] Supplement reschedule error: $e');
      }
      
      // 4. 물 마시기 알림 재스케줄링
      try {
        final waterBox = await Hive.openBox<WaterSettings>('water_settings');
        final waterSettings = waterBox.get('settings');
        if (waterSettings != null && waterSettings.isAlarmEnabled) {
          await WaterAlarmService.scheduleAlarms(waterSettings);
        }
      } catch (e) {
        debugPrint('[Settings] Water reschedule error: $e');
      }

      if (context.mounted) Navigator.pop(context);
    },
    );
  }

  Widget _buildSectionHeader(String title, {bool isFirst = false}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, isFirst ? 8 : 16, 16, 4), // 12->8, 24->16, 8->4 축소
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13, // 14 -> 13 조정
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
          leading: Icon(Icons.rocket_launch, color: allGranted ? Colors.green : ref.watch(themeProvider).primaryColor),
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

class _OptimizationBottomSheetContent extends ConsumerStatefulWidget {
  @override
  ConsumerState<_OptimizationBottomSheetContent> createState() => _OptimizationBottomSheetContentState();
}

class _OptimizationBottomSheetContentState extends ConsumerState<_OptimizationBottomSheetContent> with WidgetsBindingObserver {
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
    final primaryColor = ref.watch(themeProvider).primaryColor;
    final l10n = AppLocalizations.of(context)!;
    
    if (_isLoading) {
      return SizedBox(
        height: 300,
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      );
    }

    final isNotificationGranted = _statuses[Permission.notification]?.isGranted ?? false;
    final isBatteryOptimized = _statuses[Permission.ignoreBatteryOptimizations]?.isGranted ?? false;
    final isExactAlarmGranted = _statuses[Permission.scheduleExactAlarm]?.isGranted ?? false;
    final isSystemAlertGranted = _statuses[Permission.systemAlertWindow]?.isGranted ?? false;
    final allGranted = isNotificationGranted && isBatteryOptimized && isExactAlarmGranted && isSystemAlertGranted;

    // [추가] 저장된 권한 문제 확인
    Widget? permissionWarningBanner;
    if (!allGranted) {
      permissionWarningBanner = Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.orange),
        ),
        child: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                l10n.optimizationDescription,
                style: TextStyle(
                  color: isDark ? Colors.orange[200] : Colors.orange[800],
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      );
    }

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
          if (permissionWarningBanner != null) permissionWarningBanner,
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
        activeColor: Colors.white,
        activeTrackColor: const Color(0xFFF97316),
      ),
    );
  }
}

