import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/notification_service.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'add_alarm_screen.dart';
import '../../data/models/alarm_model.dart';
import '../../core/constants/mission_type.dart';
import '../../widgets/ad_widgets.dart';

class AlarmScreen extends ConsumerStatefulWidget {
  const AlarmScreen({super.key});

  @override
  ConsumerState<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends ConsumerState<AlarmScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
    // 10초마다 화면 갱신 (남은 시간 텍스트 업데이트)
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted) setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 시스템 바 설정 (메인 화면용 - 밝은 테마일 때 검은색 아이콘)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark 
          ? Brightness.light 
          : Brightness.dark,
      statusBarBrightness: Theme.of(context).brightness == Brightness.dark 
          ? Brightness.dark 
          : Brightness.light,
    ));
  }

  Future<void> _checkPermissions() async {
    if (Platform.isAndroid) {
      // 1. 알림 권한 (Android 13+)
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }

      // 2. 정확한 알람 스케줄링 권한 (Android 12+)
      // 이 권한은 사용자에게 설정 화면으로 이동하도록 요청해야 할 수도 있습니다.
      if (await Permission.scheduleExactAlarm.isDenied) {
        // 바로 요청하거나, 설명 후 설정으로 유도
        final status = await Permission.scheduleExactAlarm.request();
        if (status.isDenied && mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text(AppLocalizations.of(context)!.exactAlarmPermissionRequired),
               action: SnackBarAction(
                 label: AppLocalizations.of(context)!.settings,
                 onPressed: () => openAppSettings(),
               ),
               duration: const Duration(seconds: 5),
             ),
           );
        }
      }
      
      // 3. 다른 앱 위에 그리기 권한 (선택 사항이지만 전체 화면 알림에 도움됨)
      PermissionStatus systemAlertWindowStatus = await Permission.systemAlertWindow.status;
      if (systemAlertWindowStatus.isDenied) {
          systemAlertWindowStatus = await Permission.systemAlertWindow.request();
          if (systemAlertWindowStatus.isPermanentlyDenied && mounted) {
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                 content: Text(AppLocalizations.of(context)!.overlayPermissionRequired),
                 action: SnackBarAction(
                   label: AppLocalizations.of(context)!.settings,
                   onPressed: () => openAppSettings(),
                 ),
                 duration: const Duration(seconds: 5),
               ),
             );
          }
      }
  }
}

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alarms = ref.watch(alarmListProvider);
    final nextAlarmStr = _getNextAlarmString(alarms);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Header (Minimized Padding)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.alarm,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_rounded, color: textColor),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert, color: textColor),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onSelected: (value) {
                        if (value == 'delete_all') {
                          ref.read(alarmListProvider.notifier).clearAllAlarms();
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'delete_all',
                            child: Text(AppLocalizations.of(context)!.deleteAllAlarms),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Native Ad (Top)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: DetailedAdWidget(),
          ),

          // Next Alarm Banner
          if (nextAlarmStr.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Text(
                nextAlarmStr,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            const SizedBox(height: 16),
          
          Expanded(
            child: alarms.isEmpty
                ? Column(
                    children: [
                      const Spacer(),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.noAlarms,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Spacer(),

                      SizedBox(height: 80),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    itemCount: alarms.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {

                      final alarm = alarms[index];
                      return Dismissible(
                        key: Key(alarm.id.toString()),
                        confirmDismiss: (direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('알람 삭제'),
                                content: const Text('정말 삭제하시겠습니까?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    child: const Text('아니요', style: TextStyle(color: Colors.grey)),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(true),
                                    child: const Text('예', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onDismissed: (direction) {
                          // 알람을 제거하기 전에 스케줄된 알람과 알림을 취소합니다.
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE57373),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
          );
        },
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildAlarmCard(BuildContext context, WidgetRef ref, AlarmModel alarm) {
    final timeFormat = DateFormat('h:mm');
    final amPmFormat = DateFormat('a'); // AM/PM
    
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 활성화 여부에 따른 배경색 및 테두리 설정
    final cardColor = alarm.isEnabled 
        ? (isDark ? const Color(0xFF1C1C1E) : Colors.white) 
        : (isDark ? const Color(0xFF0A0A0B) : const Color(0xFFF0F0F2)); // 조금 더 어두운 톤으로 조정
    
    final borderColor = alarm.isEnabled
        ? (isDark ? Colors.grey[800]! : const Color(0xFFD1D1D6))
        : (isDark ? Colors.grey[900]! : const Color(0xFFE2E2E7)); // 비활성 시 테두리도 미세하게 조정
    
    final primaryTextColor = isDark ? Colors.white : Colors.black;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black87;
    // 비활성 시에도 정보가 잘 보이도록 적절한 명도의 회색 사용
    final disabledTextColor = isDark ? Colors.white54 : Colors.black54;

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // 높이 조절
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
          opacity: alarm.isEnabled ? 1.0 : 0.85, // 0.85로 높여 가독성 확보
          child: Row(
            children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Days or Date Row
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        if (alarm.repeatDays.any((d) => d))
                          _buildDaysRow(alarm.repeatDays, isDark)
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.grey[800] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              DateFormat.MMMEd(Localizations.localeOf(context).toString()).format(alarm.time),
                              style: TextStyle(color: primaryTextColor, fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        const SizedBox(width: 12),
                          if (alarm.snoozeInterval > 0 && alarm.maxSnoozeCount > 0)
                            Text(
                              AppLocalizations.of(context)!.snoozeInfo(alarm.snoozeInterval, alarm.maxSnoozeCount),
                              style: TextStyle(
                                color: alarm.isEnabled ? secondaryTextColor : disabledTextColor,
                                fontSize: 13,
                              ),
                            ),
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timeFormat.format(alarm.time),
                        style: TextStyle(
                          color: alarm.isEnabled ? primaryTextColor : disabledTextColor,
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (alarm.missionType != MissionType.none)
                        Transform.translate(
                          offset: const Offset(0, 4), // Adjust vertical position
                          child: Icon(
                            _getMissionIcon(alarm.missionType),
                            color: alarm.isEnabled ? Colors.cyan : disabledTextColor.withOpacity(0.7),
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                  
                  // Label if exists
                  if (alarm.label.isNotEmpty)
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
                activeTrackColor: Colors.cyan,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: isDark ? Colors.grey[800] : Colors.grey[300],
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



  Widget _buildDaysRow(List<bool> repeatDays, bool isDark) {
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
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            days[index],
            style: TextStyle(
              color: isActive ? Colors.cyan : (isDark ? Colors.grey[700] : Colors.grey[400]),
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 13,
            ),
          ),
        );
      }),
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
        // 이미 저장된 시간을 사용 (AddAlarmScreen에서 내일로 넘기는 로직이 적용되어 있음)
        if (alarm.time.isBefore(now)) {
          // 이미 지난 알람은 제외 (1분 미만 표시 방지)
          continue;
        }
        alarmTime = alarm.time;
      }

      if (nextAlarmTime == null || alarmTime.isBefore(nextAlarmTime)) {
        nextAlarmTime = alarmTime;
      }
    }

    if (nextAlarmTime == null) return '';

    final difference = nextAlarmTime.difference(now);
    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;

    // 0분 0초 ~ 0분 59초 사이인 경우
    if (hours == 0 && minutes == 0) return AppLocalizations.of(context)!.lessThanAMinuteRemaining;
    if (hours > 0) return AppLocalizations.of(context)!.hoursMinutesRemaining(hours, minutes);
    return AppLocalizations.of(context)!.minutesRemaining(minutes);
  }
}
