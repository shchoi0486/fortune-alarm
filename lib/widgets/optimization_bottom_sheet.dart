import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

class OptimizationBottomSheet extends ConsumerStatefulWidget {
  const OptimizationBottomSheet({super.key});

  @override
  ConsumerState<OptimizationBottomSheet> createState() => _OptimizationBottomSheetState();
}

class _OptimizationBottomSheetState extends ConsumerState<OptimizationBottomSheet> with WidgetsBindingObserver {
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
      Permission.location.status, // 날씨 정보를 위해 추가
    ]);

    if (mounted) {
      setState(() {
        _statuses = {
          Permission.notification: statuses[0],
          Permission.ignoreBatteryOptimizations: statuses[1],
          Permission.scheduleExactAlarm: statuses[2],
          Permission.systemAlertWindow: statuses[3],
          Permission.location: statuses[4],
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
    final size = MediaQuery.of(context).size;
    
    if (_isLoading) {
      return SizedBox(
        height: 350,
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
    final isLocationGranted = _statuses[Permission.location]?.isGranted ?? false;
    
    // [수정] 필수 권한들만 체크 (위치 권한은 선택 사항으로 변경)
    final isCriticalGranted = isNotificationGranted && isBatteryOptimized && isExactAlarmGranted && isSystemAlertGranted;
    
    // UI 표시용 (모든 항목 체크 여부)
    final allItemsChecked = isCriticalGranted && isLocationGranted;

    return WillPopScope(
      onWillPop: () async => isCriticalGranted, // 필수 권한 허용 전에는 뒤로가기 버튼으로 못 닫음
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 420,
            maxHeight: size.height * 0.85,
          ),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Fixed Header
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.alarmOptimization,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                            letterSpacing: -0.5,
                          ),
                        ),
                        if (isCriticalGranted)
                          const Icon(Icons.check_circle, color: Colors.green, size: 20)
                        else
                          Icon(Icons.info_outline_rounded, color: primaryColor, size: 20),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isCriticalGranted 
                        ? l10n.allOptimizationsCompleted 
                        : l10n.optimizationNeeded,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    if (!isCriticalGranted) ...[
                      const SizedBox(height: 4),
                      Text(
                        l10n.optimizationDescription,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.3,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildSwitchTile(
                      context: context,
                      ref: ref,
                      icon: Icons.notifications_active_rounded,
                      title: l10n.allowNotificationPermission,
                      subtitle: l10n.notificationPermissionDescription,
                      value: isNotificationGranted,
                      onChanged: (value) async {
                        if (value) {
                          await Permission.notification.request();
                          _refreshStatuses();
                        } else {
                          openAppSettings();
                        }
                      },
                    ),
                    _buildSwitchTile(
                      context: context,
                      ref: ref,
                      icon: Icons.battery_saver_rounded,
                      title: l10n.batteryOptimizationName,
                      subtitle: l10n.batteryOptimizationSubtitle.replaceAll('\n', ' '),
                      value: isBatteryOptimized,
                      onChanged: (value) async {
                        if (value) {
                          final status = await Permission.ignoreBatteryOptimizations.request();
                          // 요청이 거절되거나 시스템 정책상 바로 허용되지 않는 경우 설정 화면으로 이동
                          if (!status.isGranted) {
                            await openAppSettings();
                          }
                          _refreshStatuses();
                        } else {
                          await openAppSettings();
                        }
                      },
                    ),
                    _buildSwitchTile(
                      context: context,
                      ref: ref,
                      icon: Icons.alarm_on_rounded,
                      title: l10n.allowExactAlarm,
                      subtitle: l10n.exactAlarmDescription,
                      value: isExactAlarmGranted,
                      onChanged: (value) async {
                        openAppSettings();
                      },
                    ),
                    _buildSwitchTile(
                      context: context,
                      ref: ref,
                      icon: Icons.layers_rounded,
                      title: l10n.overlayPermissionName,
                      subtitle: l10n.overlayPermissionDesc.replaceAll('\n', ' '),
                      value: isSystemAlertGranted,
                      onChanged: (value) async {
                        if (value) {
                          await Permission.systemAlertWindow.request();
                          _refreshStatuses();
                        } else {
                          openAppSettings();
                        }
                      },
                    ),
                    _buildSwitchTile(
                      context: context,
                      ref: ref,
                      icon: Icons.location_on_rounded,
                      title: l10n.locationPermissionTitle,
                      subtitle: l10n.locationPermissionDesc,
                      value: isLocationGranted,
                      isOptional: true, // [추가] 선택 사항 표시
                      onChanged: (value) async {
                        if (value) {
                          await Permission.location.request();
                          _refreshStatuses();
                        } else {
                          openAppSettings();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            // Fixed Footer
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isCriticalGranted ? () => Navigator.pop(context) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCriticalGranted ? primaryColor : Colors.grey[400],
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                    disabledForegroundColor: isDark ? Colors.grey[600] : Colors.grey[500],
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    isCriticalGranted ? l10n.confirm : l10n.allowAllItems,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildSwitchTile({
    required BuildContext context,
    required WidgetRef ref,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isOptional = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = ref.watch(themeProvider).primaryColor;
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: value ? primaryColor.withOpacity(0.5) : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (value ? primaryColor : Colors.grey).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 22,
              color: value ? primaryColor : (isDark ? Colors.grey[400] : Colors.grey[500]),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: isDark ? Colors.white : Colors.black87,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    if (isOptional) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[800] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          l10n.optional,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Transform.scale(
            scale: 0.9,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
              activeColor: primaryColor,
              trackColor: isDark ? Colors.grey[800] : Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
