import 'dart:io';
import 'dart:ui';
import 'dart:isolate';
import 'package:permission_handler/permission_handler.dart';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../data/models/alarm_model.dart';
import '../data/models/math_difficulty.dart';
import '../core/constants/mission_type.dart';
import 'notification_service.dart';

import 'package:path_provider/path_provider.dart';

// 백그라운드 포트 이름 (main.dart와 동일해야 함)
const String kAlarmPortName = 'alarm_notification_port';

@pragma('vm:entry-point')
Future<void> alarmCallback(int id) async {
  // 1. Flutter 엔진 초기화 보장
  WidgetsFlutterBinding.ensureInitialized();
  
  debugPrint('[AlarmScheduler] --- Alarm Callback Start ---');
  debugPrint('[AlarmScheduler] ID (hashCode) received: $id');

  // 날짜/시간 포맷팅 초기화 (백그라운드 실행용)
  await initializeDateFormatting();

  final notificationService = NotificationService();
  Box<AlarmModel>? box;

  try {
    // 2. Hive 및 서비스 초기화
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    
    debugPrint('[AlarmScheduler] Isolate Hive Path: $path');
    
    // Hive 초기화 (이미 초기화되어 있을 수 있으므로 예외 처리)
    try {
      await Hive.initFlutter(path);
      
      if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(AlarmModelAdapter());
      if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(MissionTypeAdapter());
      if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(MathDifficultyAdapter());
    } catch (e) {
      debugPrint('[AlarmScheduler] Hive Init Note: $e');
    }
    
    await notificationService.init(null, isBackground: true);
    debugPrint('[AlarmScheduler] NotificationService Initialized.');

    // 3. 알람 데이터 가져오기
    box = await Hive.openBox<AlarmModel>('alarms');
    debugPrint('[AlarmScheduler] Hive Box Opened. Searching for ID: $id');

    AlarmModel? alarm;
    for (final a in box.values) {
      if (AlarmSchedulerService.getStableId(a.id) == id) {
        alarm = a;
        break;
      }
    }

    if (alarm == null) {
      debugPrint('[AlarmScheduler] ERROR: Alarm not found in Hive for ID: $id');
      return;
    }

    if (!alarm.isEnabled) {
      debugPrint('[AlarmScheduler] Alarm is disabled. Skipping.');
      return;
    }
    
    debugPrint('[AlarmScheduler] Found Alarm: ${alarm.id}, Scheduled Time: ${alarm.time}');

    // 4. 시간 검증 (Android 알람 오작동 및 중복 방지)
    final now = DateTime.now();
    final difference = now.difference(alarm.time);
    debugPrint('[AlarmScheduler] Current Time: $now, Scheduled Time: ${alarm.time}, Difference: ${difference.inSeconds}s');

    // 너무 늦게 울리는 경우 (15분 이상 늦게 울리면 무시 - 기존 10분에서 15분으로 완화)
    if (difference.inMinutes > 15) {
      debugPrint('[AlarmScheduler] Too late (>15m). Skipping.');
      return;
    }

    // 5. 알림 및 UI 신호
    String payload = alarm.id;
    String body = '일어날 시간입니다!';
    if (alarm.missionType != MissionType.none) {
      body = '미션을 수행하고 알람을 끄세요!';
    }

    bool suppressRinging = false;
    try {
      final stateBox = await Hive.openBox('app_state');
      final activeBaseId = stateBox.get('active_alarm_mission_base_id') as String?;
      final startedAtStr = stateBox.get('active_alarm_mission_started_at') as String?;
      if (activeBaseId != null && startedAtStr != null) {
        final startedAt = DateTime.tryParse(startedAtStr);
        if (startedAt != null) {
          final now = DateTime.now();
          if (now.difference(startedAt) < const Duration(minutes: 2)) {
            final baseId = alarm.id.replaceAll('_snooze', '');
            suppressRinging = baseId == activeBaseId;
          } else {
            await stateBox.delete('active_alarm_mission_base_id');
            await stateBox.delete('active_alarm_mission_started_at');
          }
        }
      }
    } catch (e) {
      debugPrint('[AlarmScheduler] Mission state check failed: $e');
    }

    if (!suppressRinging) {
      final SendPort? uiSendPort = IsolateNameServer.lookupPortByName(kAlarmPortName);
      if (uiSendPort != null) {
        debugPrint('[AlarmScheduler] Sending signal to Foreground UI Isolate.');
        uiSendPort.send(payload);
      }

      debugPrint('[AlarmScheduler] Showing Alarm Notification...');
      await notificationService.showAlarmNotification(
        id: id,
        title: '스냅 알람',
        body: body,
        payload: payload,
        soundName: alarm.ringtonePath,
        vibrationPattern: alarm.vibrationPattern,
        isGradualVolume: alarm.isGradualVolume,
        isVibrationEnabled: alarm.isVibrationEnabled,
      );
      debugPrint('[AlarmScheduler] Notification displayed successfully.');
    } else {
      debugPrint('[AlarmScheduler] Suppressing ringing due to active mission.');
    }

    // 6. 다음 알람 예약 (반복 알람인 경우)
    if (alarm.repeatDays.any((d) => d)) {
      debugPrint('[AlarmScheduler] Rescheduling next repeat...');
      
      // 시스템이 알람 시간보다 약간 일찍(예: 1초 전) 깨운 경우, 
      // now를 기준으로 다음 시간을 계산하면 '오늘'로 다시 잡히는 문제가 발생할 수 있음.
      // 따라서 기준 시간을 max(now, scheduledTime)으로 설정하여, 무조건 현재 스케줄 이후의 시간을 찾도록 함.
      DateTime referenceTime = DateTime.now();
      if (referenceTime.isBefore(alarm.time)) {
        referenceTime = alarm.time;
      }
      
      final nextTime = AlarmSchedulerService._calculateNextTime(alarm.time, alarm.repeatDays, referenceTime: referenceTime);
      final nextAlarm = alarm.copyWith(time: nextTime);
      await box.put(nextAlarm.id, nextAlarm);
      await AlarmSchedulerService.scheduleAlarm(nextAlarm);
    } else {
      // 일회성 알람은 비활성화
      debugPrint('[AlarmScheduler] Deactivating one-time alarm.');
      final updatedAlarm = alarm.copyWith(isEnabled: false);
      await box.put(updatedAlarm.id, updatedAlarm);
    }

  } catch (e, stackTrace) {
    debugPrint('[AlarmScheduler] FATAL in alarmCallback: $e');
    debugPrint(stackTrace.toString());
  } finally {
    if (box != null && box.isOpen) {
      await box.close();
    }
    debugPrint('[AlarmScheduler] --- Alarm Callback End ---');
  }
}

@pragma('vm:entry-point')
class AlarmSchedulerService {
  @pragma('vm:entry-point')
  static Future<void> init() async {
    await AndroidAlarmManager.initialize();
  }

  // String ID를 안정적인 int ID로 변환 (앱 재시작 후에도 동일한 ID 보장)
  static int getStableId(String id) {
    int h = 0;
    for (int i = 0; i < id.length; i++) {
      h = 31 * h + id.codeUnitAt(i);
      h &= 0xFFFFFFFF;
    }
    // 32-bit signed integer 변환
    if (h > 0x7FFFFFFF) {
       h -= 0x100000000;
    }
    return h;
  }

  @pragma('vm:entry-point')
  static Future<bool> scheduleAlarm(AlarmModel alarm) async {
    try {
      debugPrint('[AlarmScheduler] --- Scheduling Start ---');
      debugPrint('[AlarmScheduler] ID: ${alarm.id}');
      debugPrint('[AlarmScheduler] Time: ${alarm.time}');
      
      // 1. 기존 알람 취소 (중복 예약 방지)
      // 스누즈는 유지함 (메인 알람 예약 시 스누즈를 건드릴 필요가 없음)
      await cancelAlarm(alarm, cancelMain: false, cancelSnooze: false); 

      if (Platform.isAndroid) {
        // 정확한 알람 권한 확인 (Android 12+)
        // USE_EXACT_ALARM 권한이 매니페스트에 있으면 기본적으로 granted 상태여야 함
        var exactStatus = await Permission.scheduleExactAlarm.status;
        debugPrint('[AlarmScheduler] SCHEDULE_EXACT_ALARM status: $exactStatus');
        
        if (exactStatus.isDenied) {
          debugPrint('[AlarmScheduler] SCHEDULE_EXACT_ALARM permission denied. Requesting...');
          // 사용자가 명시적으로 거부한 경우가 아니면 요청 시도
          exactStatus = await Permission.scheduleExactAlarm.request();
          
          if (exactStatus.isDenied) {
            debugPrint('[AlarmScheduler] CRITICAL: SCHEDULE_EXACT_ALARM permission still denied. Alarm might not ring exactly.');
            // 여기서 false를 리턴하면 알람 저장이 아예 안 되므로, 
            // USE_EXACT_ALARM을 믿고 진행하되 로그를 남김 (또는 UI에서 처리하도록 유도)
            // 하지만 정확한 알람이 핵심 기능이므로 실패 처리하는 것이 안전할 수 있음.
            // 여기서는 일단 진행하되, oneShotAt이 실패할 수 있음을 인지.
          }
        }

        // 배터리 최적화 제외 권한 확인 (절전 모드에서 알람 보장)
        final batteryStatus = await Permission.ignoreBatteryOptimizations.status;
        debugPrint('[AlarmScheduler] ignoreBatteryOptimizations status: $batteryStatus');
        
        if (batteryStatus.isDenied) {
           debugPrint('[AlarmScheduler] Battery optimization is active. Requesting to ignore...');
           // 사용자에게 시스템 설정으로 이동하도록 요청
           await Permission.ignoreBatteryOptimizations.request();
        }
      }

      final int alarmId = getStableId(alarm.id);

      // Hive에 알람 저장
      var box = await Hive.openBox<AlarmModel>('alarms');
      await box.put(alarm.id, alarm);
      await box.flush();

      debugPrint('[AlarmScheduler] StableID: $alarmId');

      // 현재 시간보다 과거인지 확인 (안전장치)
      final now = DateTime.now();
      
      // 1분 이내의 과거라면 즉시 울리도록 처리 (사용자가 방금 설정한 것으로 간주)
      DateTime scheduleTime = alarm.time;
      if (scheduleTime.isBefore(now)) {
        final diff = now.difference(scheduleTime);
        if (diff.inMinutes < 1) {
          debugPrint('[AlarmScheduler] Alarm time is in the past but within 1 minute. Scheduling for immediate fire.');
          scheduleTime = now.add(const Duration(seconds: 2)); // 2초 뒤 실행
        } else {
          debugPrint('[AlarmScheduler] WARNING: Attempted to schedule alarm in the past (>1m)! Time: ${alarm.time}, Now: $now');
          return false;
        }
      }

      debugPrint('[AlarmScheduler] Calling AndroidAlarmManager.oneShotAt...');
      bool result = await AndroidAlarmManager.oneShotAt(
        scheduleTime,
        alarmId,
        alarmCallback,
        exact: true,
        wakeup: true,
        alarmClock: true,
        rescheduleOnReboot: true,
        allowWhileIdle: true,
      );

      if (result) {
        debugPrint('[AlarmScheduler] SUCCESSFULLY scheduled at: ${alarm.time}');
      } else {
        debugPrint('[AlarmScheduler] FAILED to schedule alarm.');
      }
      debugPrint('[AlarmScheduler] --- Scheduling End ---');
      return result;
    } catch (e, stackTrace) {
      debugPrint('[AlarmScheduler] FATAL Error in scheduleAlarm: $e');
      debugPrint(stackTrace.toString());
      return false;
    }
  }

  // 스누즈 알람 예약
  static Future<void> snoozeAlarm(AlarmModel alarm) async {
    // 스누즈 횟수가 남아있지 않거나, 간격이 설정되지 않았으면 실행하지 않음
    if (alarm.snoozeInterval <= 0 || alarm.maxSnoozeCount <= 0) return;

    bool isFirstSnooze = !alarm.id.endsWith('_snooze');
    // 첫 스누즈면 maxCount 사용, 아니면 현재 remaining 사용 (만약 remaining이 0보다 작으면 max로 보정)
    int currentRemaining = isFirstSnooze 
        ? alarm.maxSnoozeCount 
        : (alarm.remainingSnoozeCount > 0 ? alarm.remainingSnoozeCount : 0);
    
    int newRemainingCount = currentRemaining - 1;

    // 더 이상 스누즈할 수 없으면 종료
    if (newRemainingCount < 0) {
      debugPrint('[AlarmScheduler] No more snoozes left for alarm ${alarm.id}.');
      return;
    }

    final snoozeTime = DateTime.now().add(Duration(minutes: alarm.snoozeInterval));
    
    // ID 처리: 원본 ID 추출 후 _snooze 붙임
    String originalId = alarm.id.replaceAll('_snooze', '');
    final String snoozeId = '${originalId}_snooze';

    final snoozeAlarm = alarm.copyWith(
      id: snoozeId, 
      time: snoozeTime,
      repeatDays: [false, false, false, false, false, false, false], // 스누즈는 항상 일회성
      label: isFirstSnooze ? '[스누즈] ${alarm.label}' : alarm.label, // 이미 붙어있으면 유지
      remainingSnoozeCount: newRemainingCount,
      isEnabled: true, // [중요] 스누즈 알람은 무조건 활성화 상태로 예약 (이전 알람이 비활성화되었을 수 있음)
      referenceImagePaths: alarm.referenceImagePaths, // [추가] 미션 이미지 경로 복사
    );

    debugPrint('[AlarmScheduler] Snoozing alarm $originalId as $snoozeId for ${alarm.snoozeInterval} minutes. Remaining: $newRemainingCount');
    
    // 스케줄링 (scheduleAlarm은 내부적으로 Hive에 저장)
    await scheduleAlarm(snoozeAlarm);
  }

  static Future<void> cancelAlarm(AlarmModel alarm, {bool cancelMain = true, bool cancelSnooze = true}) async {
    final int alarmId = getStableId(alarm.id);
    
    if (cancelMain) {
      await AndroidAlarmManager.cancel(alarmId);
      // [수정] 스누즈 알람 취소 시 원본 메인 알람(내일 알람)은 유지해야 함
      // if (alarm.id.endsWith('_snooze')) {
      //   final String originalId = alarm.id.replaceAll('_snooze', '');
      //   await AndroidAlarmManager.cancel(getStableId(originalId));
      // }
    }

    // 알림도 함께 취소 (현재 울리고 있는 알림이 있을 수 있으므로)
    final notificationService = NotificationService();
    await notificationService.cancelNotification(alarmId);
    
    // 스누즈 알람 취소 여부 확인
    if (cancelSnooze && !alarm.id.endsWith('_snooze')) {
      final String snoozeId = '${alarm.id}_snooze';
      await AndroidAlarmManager.cancel(getStableId(snoozeId));
      await notificationService.cancelNotification(getStableId(snoozeId));
      
      // Hive에서도 스누즈 알람 삭제
      try {
        final box = await Hive.openBox<AlarmModel>('alarms');
        if (box.containsKey(snoozeId)) {
          await box.delete(snoozeId);
          debugPrint('[AlarmScheduler] Snooze alarm $snoozeId deleted from Hive.');
        }
      } catch (e) {
        debugPrint('[AlarmScheduler] Error deleting snooze from Hive: $e');
      }
    }
    
    debugPrint('Alarm schedule and notification canceled: ${alarm.id} (StableID: $alarmId, cancelMain: $cancelMain, cancelSnooze: $cancelSnooze)');
  }

  static Future<void> cancelAllAlarms() async {
    // 모든 알람을 취소하려면 모든 ID의 해시코드를 알아야 함.
    // Box를 열어서 각 알람의 해시코드로 취소 요청
    var box = await Hive.openBox<AlarmModel>('alarms'); // 박스 이름 통일
    if (box.isNotEmpty) {
      debugPrint('[AlarmScheduler] Found ${box.length} alarms. Canceling all...');
      for (final alarm in box.values) {
        await AndroidAlarmManager.cancel(getStableId(alarm.id));
      }
      await box.clear();
      debugPrint('[AlarmScheduler] All alarms have been canceled and cleared from Hive.');
    }
  }

  // 다음 반복 시간 계산 헬퍼
  static DateTime _calculateNextTime(DateTime alarmTime, List<bool> repeatDays, {DateTime? referenceTime}) {
    final now = referenceTime ?? DateTime.now();
    // 기준 시간 (오늘 날짜 + 알람 시간)
    DateTime candidate = DateTime(now.year, now.month, now.day, alarmTime.hour, alarmTime.minute);
    
    int dayOffset = 0;
    while (true) {
      final checkDate = candidate.add(Duration(days: dayOffset));
      final weekdayIndex = checkDate.weekday - 1;
      
      if (repeatDays[weekdayIndex]) {
        // 현재 시간 이후여야 함
        if (checkDate.isAfter(now)) {
           return checkDate;
        }
      }
      dayOffset++;
      if (dayOffset > 14) break; // 안전장치
    }
    return candidate.add(const Duration(days: 1)); // Fallback (내일)
  }
}
