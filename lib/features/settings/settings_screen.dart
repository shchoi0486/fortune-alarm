import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../../providers/theme_provider.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              "설정",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
          _buildSectionHeader("일반"),
          SwitchListTile(
            title: const Text("다크 모드"),
            subtitle: const Text("화면을 어둡게 설정합니다."),
            value: isDark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).toggleTheme(value);
            },
          ),
          if (Platform.isAndroid)
            _buildOptimizationTile(context),
          ListTile(
            title: const Text("알람 설정"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AlarmSettingsScreen()),
              );
            },
          ),
          
          _buildSectionHeader("정보"),
          ListTile(
            title: const Text("공지사항"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NoticeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("자주 묻는 질문"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FAQScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("의견 보내기"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SupportScreen(
                    title: '의견 보내기',
                    description: '포춘 알람을 사용하시면서 느낀 불편한 점이나 제안하고 싶은 기능이 있다면 언제든 말씀해 주세요.\n여러분의 소중한 의견이 더 나은 서비스를 만듭니다.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("저작권 침해 신고하기"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SupportScreen(
                    title: '저작권 침해 신고',
                    description: '포춘 알람 내의 콘텐츠가 저작권을 침해한다고 판단되는 경우, 해당 내용을 이메일로 신고해 주시기 바랍니다.\n확인 후 즉시 조치를 취하도록 하겠습니다.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("이용약관"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PolicyScreen(
                    title: '이용약관',
                    content: '제 1 조 (목적)\n본 약관은 "포춘 알람"(이하 "서비스")이 제공하는 모든 서비스의 이용조건 및 절차, 이용자와 서비스 운영자의 권리, 의무, 책임사항 등을 규정함을 목적으로 합니다.\n\n제 2 조 (약관의 효력 및 변경)\n1. 본 약관은 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지함으로써 효력이 발생합니다.\n2. 운영자는 필요한 경우 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.\n\n제 3 조 (서비스의 제공)\n서비스는 알람 설정, 미션 수행, 운세 정보 제공 등을 포함하며, 운영자의 사정에 따라 변경될 수 있습니다.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("개인정보 처리방침"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PolicyScreen(
                    title: '개인정보 처리방침',
                    content: '1. 수집하는 개인정보 항목\n서비스는 원활한 기능 제공을 위해 다음과 같은 정보를 수집할 수 있습니다.\n- 기기 식별 정보 (알람 동기화 및 푸시 알림용)\n- 알람 설정 데이터 (기기 로컬 저장)\n\n2. 개인정보의 수집 및 이용 목적\n수집된 정보는 서비스 제공 및 개선, 고객 응대를 위해서만 사용됩니다.\n\n3. 개인정보의 보유 및 이용 기간\n서비스 탈퇴 시 또는 수집 목적 달성 시 지체 없이 파기합니다.',
                  ),
                ),
              );
            },
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
          title: const Text("알람 울림 최적화"),
          subtitle: Text(allGranted ? "모든 최적화 설정 완료됨" : "정확한 알람을 위해 설정이 필요합니다."),
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
                '알람 울림 최적화',
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
            '안드로이드 시스템 설정으로 인해 알람이 지연되거나 울리지 않을 수 있습니다. 모든 항목을 허용으로 설정해주세요.',
            style: TextStyle(
              fontSize: 14, 
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          _buildPermissionItem(
            '알림 권한 허용',
            '알람 발생 시 알림을 띄우기 위해 필요합니다.',
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
            '배터리 최적화 제외',
            '절전 모드에서도 알람이 즉시 울리도록 합니다.',
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
            '정확한 알람 허용',
            '시스템에 의해 지연되지 않고 정시에 알람을 울립니다.',
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
            '다른 앱 위에 표시',
            '잠금 화면이나 다른 앱 사용 중에도 알람 화면을 띄웁니다.',
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
                          '모든 설정이 완료되었습니다.',
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
                    '설정 해제는 안드로이드 시스템 설정에서 직접 하실 수 있습니다.',
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
        activeColor: Colors.green,
        activeTrackColor: Colors.green.withOpacity(0.3),
      ),
    );
  }
}

