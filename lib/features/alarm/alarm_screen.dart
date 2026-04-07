import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/notification_service.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
import 'package:fortune_alarm/providers/theme_provider.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'add_alarm_screen.dart';
import 'quick_alarm_sheet.dart';
import 'first_alarm_step_screen.dart';
import '../../data/models/alarm_model.dart';
import '../../core/constants/mission_type.dart';

class AlarmScreen extends ConsumerStatefulWidget {
  const AlarmScreen({super.key});

  @override
  ConsumerState<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends ConsumerState<AlarmScreen> {
  Timer? _timer;
  bool _isFabMenuOpen = false;
  bool _isFirstRunCompleted = true; // 기본값은 완료된 것으로 간주하여 깜빡임 방지

  @override
  void initState() {
    super.initState();
    _loadFirstRunStatus();
    _checkPermissions();
    // 10초마다 화면 갱신 (남은 시간 텍스트 업데이트)
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _loadFirstRunStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        _isFirstRunCompleted = prefs.getBool('first_run_completed') ?? false;
      });
    }
  }

  Future<void> _checkPermissions() async {
    // 앱 시작 시 강제적인 권한 요청은 main.dart에서 최소화함 (알림 권한만)
    // 알람 설정 시 필요한 권한은 해당 시점에 가이드와 함께 요청하도록 변경
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alarms = ref.watch(alarmListProvider);
    final themeState = ref.watch(themeProvider);
    final primaryColor = themeState.primaryColor;
    final nextAlarmStr = _getNextAlarmString(alarms);
    final isDark = themeState.themeMode == ThemeMode.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom Header (Standardized)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 16),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/Fortune Icon_tran.png',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              AppLocalizations.of(context)!.appTitle,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                                leadingDistribution: TextLeadingDistribution.even,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          constraints: const BoxConstraints(),
                          icon: Icon(Icons.add_rounded, color: textColor, size: 28),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
                            );
                          },
                        ),
                        PopupMenuButton<String>(
                          padding: const EdgeInsets.fromLTRB(2, 4, 0, 4),
                          constraints: const BoxConstraints(),
                          offset: const Offset(0, -4),
                          position: PopupMenuPosition.under,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          icon: Icon(Icons.more_vert, color: textColor, size: 28),
                          onSelected: (value) {
                            if (value == 'delete_all') {
                              ref.read(alarmListProvider.notifier).clearAllAlarms();
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'delete_all',
                                height: 28,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.deleteAllAlarms, 
                                    style: const TextStyle(fontSize: 12)
                                  ),
                                ),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: alarms.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(flex: 2),
                            Text(
                              AppLocalizations.of(context)!.firstAlarmGuideTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                AppLocalizations.of(context)!.firstAlarmGuideDesc,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed: () {
                                if (_isFirstRunCompleted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const FirstAlarmStepScreen()),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 0,
                              ),
                              child: Text(
                                _isFirstRunCompleted 
                                    ? AppLocalizations.of(context)!.addAlarm 
                                    : AppLocalizations.of(context)!.addFirstAlarm,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(flex: 3),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
                        itemCount: alarms.length + 1,
                        separatorBuilder: (context, index) {
                          if (index == 0) return const SizedBox.shrink();
                          return const SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // 알람이 아예 없거나 다음 알람이 없을 때도 '예정된 알람 없음'을 표시
                            return Padding(
                              padding: const EdgeInsets.only(left: 6, bottom: 12),
                              child: Text(
                                nextAlarmStr,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }

                          final alarm = alarms[index - 1];
                          return Dismissible(
                            key: Key(alarm.id.toString()),
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(AppLocalizations.of(context)!.confirm),
                                    content: Text(AppLocalizations.of(context)!.deleteAlarmConfirm),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        child: Text(AppLocalizations.of(context)!.cancel),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(true),
                                        child: Text(
                                          AppLocalizations.of(context)!.delete,
                                          style: const TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onDismissed: (direction) {
                              AlarmSchedulerService.cancelAlarm(alarm); // 스케줄된 알람 취소
                              final stableId = AlarmSchedulerService.getStableId(alarm.id);
                              NotificationService().cancelNotification(stableId); // 알림 취소

                              ref.read(alarmListProvider.notifier).removeAlarm(alarm.id);
                              setState(() {});
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            child: _buildAlarmCard(context, ref, alarm),
                          );
                        },
                      ),
              ),
            ],
          ),
          
          // FAB Menu Overlay
          if (_isFabMenuOpen)
            GestureDetector(
              onTap: () => setState(() => _isFabMenuOpen = false),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            
          // FAB Menu Buttons
          if (_isFabMenuOpen)
            Positioned(
              right: 16,
              bottom: 100, // Adjusted for FAB height and padding
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildFabMenuItem(
                label: AppLocalizations.of(context)!.quickAlarm,
                icon: Icons.bolt_rounded,
                iconColor: const Color(0xFFFFD60A), // 밝은 노란색
                onTap: () {
                  setState(() => _isFabMenuOpen = false);
                  _showQuickAlarmSheet(context);
                },
                isDark: isDark,
              ),
              const SizedBox(height: 12),
              _buildFabMenuItem(
                label: AppLocalizations.of(context)!.alarm,
                icon: Icons.alarm_rounded,
                imageAsset: 'assets/icon/Fortune Icon_tran.png',
                onTap: () {
                  setState(() => _isFabMenuOpen = false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
                  );
                },
                isDark: isDark,
              ),
            ],
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          setState(() {
            _isFabMenuOpen = !_isFabMenuOpen;
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            _isFabMenuOpen ? Icons.close_rounded : Icons.add_rounded, 
            key: ValueKey(_isFabMenuOpen),
            color: Colors.white,
            size: 30
          ),
        ),
      ),
    ),
  );
}

  Widget _buildFabMenuItem({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required bool isDark,
    Color? iconColor,
    String? imageAsset,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130, // 너비를 고정하여 두 버튼 크기를 동일하게 맞춤
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14), // 내부 패딩
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 28,
              child: Center(
                child: imageAsset != null
                    ? Image.asset(imageAsset, width: 22, height: 22)
                    : Icon(icon,
                        color: iconColor ?? (isDark ? Colors.white : Colors.black87),
                        size: 22),
              ),
            ),
            const SizedBox(width: 10), // 아이콘과 텍스트 사이 적절한 간격
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuickAlarmSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const QuickAlarmSheet(),
    );
  }

  bool _isQuickAlarm(String label, BuildContext context) {
    if (label.isEmpty) return false;
    
    final l10n = AppLocalizations.of(context)!;
    // 현재 언어의 퀵 알람 문자열과 비교
    if (label == l10n.quickAlarm) return true;
    
    // 타 언어에서 생성된 퀵 알람 문자열들과도 비교 (하드코딩된 목록)
    const quickAlarmLabels = [
      'Quick',
      '퀵 알람',
      'Быстрый будильник',
      'त्वरित अलार्म',
      'Alarme rapide',
      'Alarma rápida',
    ];
    
    return quickAlarmLabels.any((l) => l.toLowerCase() == label.toLowerCase());
  }

  Widget _buildAlarmCard(BuildContext context, WidgetRef ref, AlarmModel alarm) {
    final timeFormat = DateFormat('h:mm');
    final amPmFormat = DateFormat('a'); // AM/PM
    
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = ref.watch(themeProvider).primaryColor;
    
    // 활성화 여부에 따른 배경색 및 테두리 설정
    final cardColor = alarm.isEnabled 
        ? (isDark ? const Color(0xFF2C2C2E) : Colors.white) 
        : (isDark ? const Color(0xFF1F1F21) : const Color(0xFFF0F0F2));
    
    final borderColor = alarm.isEnabled
        ? (isDark ? primaryColor.withOpacity(0.5) : const Color(0xFFD1D1D6))
        : (isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE2E2E7));
    
    final primaryTextColor = isDark ? Colors.white : Colors.black;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black87;
    // 비활성 시에도 정보가 잘 보이도록 적절한 명도의 회색 사용
    final Color disabledTextColor = isDark ? Colors.grey[400]! : Colors.black54;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddAlarmScreen(alarm: alarm),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // 높이 조절
        decoration: BoxDecoration(
          color: cardColor, 
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor, 
            width: isDark ? 1.0 : 0.5,
          ), 
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Opacity(
          opacity: alarm.isEnabled ? 1.0 : 1.0, // 비활성 시에도 투명도 낮추지 않음 (색상으로 구분)
          child: Row(
            children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Days or Date Row
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      children: [
                        if (alarm.repeatDays.any((d) => d))
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: _buildDaysRow(alarm.repeatDays, isDark, primaryColor),
                          )
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.grey[800] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              DateFormat.MEd(Localizations.localeOf(context).toString()).format(alarm.time),
                              style: TextStyle(color: primaryTextColor, fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),

                        // Snooze Info Display
                        if (alarm.maxSnoozeCount > 0) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 1,
                            height: 12,
                            color: isDark ? Colors.grey[700] : Colors.grey[400],
                          ),
                          const SizedBox(width: 8),
                          _buildSnoozeInfo(alarm, secondaryTextColor, disabledTextColor),
                        ],
                        const Spacer(),
                      ],
                    ),
                  ),

                  // Time and Mission Icon Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        amPmFormat.format(alarm.time) == 'AM' 
                            ? AppLocalizations.of(context)!.am 
                            : AppLocalizations.of(context)!.pm,
                        style: TextStyle(
                          color: alarm.isEnabled ? primaryTextColor : disabledTextColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timeFormat.format(alarm.time),
                        style: TextStyle(
                          color: alarm.isEnabled ? primaryTextColor : disabledTextColor,
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (_isQuickAlarm(alarm.label, context))
                        Baseline(
                          baseline: 29, // Adjust to align with time text baseline
                          baselineType: TextBaseline.alphabetic,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0.5),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: primaryColor.withOpacity(0.3), width: 0.5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.bolt_rounded, color: primaryColor, size: 9),
                                const SizedBox(width: 1),
                                Text(
                                  AppLocalizations.of(context)!.quickAlarm.toUpperCase(),
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 8.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(width: 4),
                      if (alarm.missionType != MissionType.none)
                        Baseline(
                          baseline: 30, // Adjust to align with time text baseline
                          baselineType: TextBaseline.alphabetic,
                          child: Icon(
                            _getMissionIcon(alarm.missionType),
                            color: alarm.isEnabled 
                                ? (isDark ? Colors.grey[300] : Colors.grey[700]) // 조금 더 진한 회색으로 조정
                                : disabledTextColor.withOpacity(0.7),
                            size: 18,
                          ),
                        ),
                    ],
                  ),
                  
                  // Label if exists
                  if (alarm.label.isNotEmpty && !_isQuickAlarm(alarm.label, context))
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        alarm.label,
                        style: TextStyle(
                          color: alarm.isEnabled ? (isDark ? Colors.grey[400] : Colors.grey[600]) : disabledTextColor.withOpacity(0.5),
                          fontSize: 13,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Transform.scale(
              scale: 0.9,
              child: Switch(
                value: alarm.isEnabled,
                activeThumbColor: Colors.white,
                activeTrackColor: primaryColor,
                inactiveThumbColor: Colors.grey[400],
                inactiveTrackColor: isDark ? Colors.grey[700] : Colors.grey[300],
                onChanged: (value) {
                  ref.read(alarmListProvider.notifier).toggleAlarm(alarm.id);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



  Widget _buildDaysRow(List<bool> repeatDays, bool isDark, Color primaryColor) {
    final l10n = AppLocalizations.of(context)!;
    final days = [
      l10n.daySun,
      l10n.dayMon,
      l10n.dayTue,
      l10n.dayWed,
      l10n.dayThu,
      l10n.dayFri,
      l10n.daySat,
    ];
    // Mapping: UI Index 0(Sun) -> Model Index 6, 1(Mon) -> 0, ...
    
    return Row(
      children: List.generate(7, (index) {
        final modelIndex = (index + 6) % 7;
        final isActive = repeatDays[modelIndex];
        
        // 요일별 색상 정의 (활성 상태일 때도 색상 유지)
        Color getDayColor() {
          return isActive ? primaryColor : (isDark ? Colors.grey[700]! : Colors.grey[400]!);
        }

        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            days[index],
            style: TextStyle(
              color: getDayColor(),
              fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              fontSize: 13,
              letterSpacing: -0.5,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSnoozeInfo(AlarmModel alarm, Color secondaryTextColor, Color disabledTextColor) {
    if (alarm.maxSnoozeCount == 0) return const SizedBox.shrink();
    
    final isInfinite = alarm.maxSnoozeCount == 999;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final snoozeColor = alarm.isEnabled 
        ? (isDark ? Colors.grey[300] : Colors.grey[700]) 
        : disabledTextColor;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.snooze,
          size: 14,
          color: snoozeColor,
        ),
        const SizedBox(width: 2),
        Text(
          isInfinite ? '∞' : '${alarm.maxSnoozeCount}',
          style: TextStyle(
            color: snoozeColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  IconData _getMissionIcon(MissionType type) {
    switch (type) {
      case MissionType.math:
        return Icons.calculate;
      case MissionType.fortune:
        return Icons.auto_awesome;
      case MissionType.shake:
        return Icons.vibration;
      case MissionType.fortuneCatch:
        return Icons.catching_pokemon; // Or any suitable icon
      case MissionType.numberOrder:
        return Icons.filter_9_plus;
      case MissionType.hiddenButton:
        return Icons.visibility;
      case MissionType.tapSprint:
        return Icons.touch_app;
      case MissionType.leftRight:
        return Icons.compare_arrows;
      case MissionType.walk:
        return Icons.directions_walk;
      case MissionType.faceDetection:
        return Icons.face_retouching_natural;
      case MissionType.cameraSink:
      case MissionType.cameraRefrigerator:
      case MissionType.cameraFace:
      case MissionType.cameraScale:
      case MissionType.cameraOther: // Snap Mission
        return Icons.camera_alt;
      case MissionType.supplement:
        return Icons.medication;
      default:
        return Icons.alarm;
    }
  }

  String _getNextAlarmString(List<AlarmModel> alarms) {
    final now = DateTime.now();
    DateTime? nextAlarmTime;

    for (final alarm in alarms) {
      if (!alarm.isEnabled) continue;

      DateTime alarmTime;

      if (alarm.repeatDays.any((d) => d)) {
        // 반복 알람 로직
        alarmTime = DateTime(
          now.year,
          now.month,
          now.day,
          alarm.time.hour,
          alarm.time.minute,
        );

        int currentWeekdayIndex = now.weekday - 1; // Mon=0
        int startOffset = 0;
        
        if (DateTime(now.year, now.month, now.day, alarm.time.hour, alarm.time.minute).isBefore(now)) {
           startOffset = 1;
        }

        bool found = false;
        for (int i = 0; i < 7; i++) {
          final checkIndex = (currentWeekdayIndex + startOffset + i) % 7;
          if (alarm.repeatDays[checkIndex]) {
            alarmTime = DateTime(
              now.year,
              now.month,
              now.day,
              alarm.time.hour,
              alarm.time.minute,
            ).add(Duration(days: startOffset + i));
            found = true;
            break;
          }
        }
        if (!found) continue;
      } else {
              // 일회성 알람 로직
              // 1분 이내의 과거 시간은 허용 (AddAlarmScreen에서 1분 이내 과거는 오늘로 저장하므로)
              if (alarm.time.isBefore(now.subtract(const Duration(minutes: 1)))) {
                // 이미 지난 알람은 제외
                continue;
              }
              alarmTime = alarm.time;
            }

            if (nextAlarmTime == null || alarmTime.isBefore(nextAlarmTime)) {
              nextAlarmTime = alarmTime;
            }
          }

          if (nextAlarmTime == null) return AppLocalizations.of(context)!.noActiveAlarms;

          final difference = nextAlarmTime.difference(now);
          
          // 이미 지났거나 0초 이상 1분 미만 남은 경우
          if (difference.isNegative || (difference.inHours == 0 && difference.inMinutes == 0)) {
             return AppLocalizations.of(context)!.lessThanAMinuteRemaining;
          }
          
          final hours = difference.inHours;
          final minutes = difference.inMinutes % 60;

          if (hours > 0) return AppLocalizations.of(context)!.hoursMinutesRemaining(hours.toString(), minutes.toString());
          return AppLocalizations.of(context)!.minutesRemaining(minutes.toString());
  }
}
