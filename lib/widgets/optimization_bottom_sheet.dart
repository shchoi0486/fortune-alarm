import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class OptimizationBottomSheet extends StatefulWidget {
  const OptimizationBottomSheet({super.key});

  @override
  State<OptimizationBottomSheet> createState() => _OptimizationBottomSheetState();
}

class _OptimizationBottomSheetState extends State<OptimizationBottomSheet> with WidgetsBindingObserver {
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
    final isLocationGranted = _statuses[Permission.location]?.isGranted ?? false;
    
    final allGranted = isNotificationGranted && isBatteryOptimized && isExactAlarmGranted && isSystemAlertGranted && isLocationGranted;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
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
                      if (allGranted)
                        const Icon(Icons.check_circle, color: Colors.green, size: 24),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.optimizationDescription,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
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
                      title: l10n.excludeBatteryOptimization,
                      subtitle: l10n.batteryOptimizationDescription,
                      value: isBatteryOptimized,
                      onChanged: (value) async {
                        if (value) {
                          await Permission.ignoreBatteryOptimizations.request();
                          _refreshStatuses();
                        } else {
                          openAppSettings();
                        }
                      },
                    ),
                    _buildSwitchTile(
                      context: context,
                      title: l10n.allowExactAlarm,
                      subtitle: l10n.exactAlarmDescription,
                      value: isExactAlarmGranted,
                      onChanged: (value) async {
                        openAppSettings();
                      },
                    ),
                    _buildSwitchTile(
                      context: context,
                      title: l10n.drawOverOtherApps,
                      subtitle: l10n.overlayDescription,
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
                      title: l10n.locationPermissionTitle,
                      subtitle: l10n.locationPermissionDesc,
                      value: isLocationGranted,
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
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3894FF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    l10n.confirm,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : Colors.black87,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: isDark ? Colors.grey[400] : Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: const Color(0xFF3894FF),
              activeTrackColor: const Color(0xFF3894FF).withOpacity(0.3),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
