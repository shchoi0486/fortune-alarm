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

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:path_provider/path_provider.dart';

// 백그라운드 포트 이름 (main.dart와 동일해야 함)
const String kAlarmPortName = 'alarm_notification_port';

@pragma('vm:entry-point')
void startCallback() {
  // Foreground Task가 시작될 때 호출되는 콜백
  FlutterForegroundTask.setTaskHandler(AlarmTaskHandler());
}

class AlarmTaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    // Task가 시작될 때 수행할 작업 (예: 알람 소리 재생, 진동 등)
    // 여기서는 UI를 띄우거나 필요한 리소스를 초기화할 수 있음
    debugPrint('[AlarmTaskHandler] onStart: $timestamp');
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp) async {
    // 주기적으로 수행할 작업 (필요한 경우)
    // 여기서는 단순히 유지
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isServiceStopped) async {
    // Task가 종료될 때 정리 작업
    debugPrint('[AlarmTaskHandler] onDestroy: $timestamp');
  }

  @override
  void onNotificationPressed() {
    // 알림을 눌렀을 때 앱을 실행
    FlutterForegroundTask.launchApp();
  }

  // 최신 버전에서는 onNotificationDismissed도 구현해야 할 수 있음 (선택 사항)
  @override
  void onNotificationDismissed() {
    debugPrint('[AlarmTaskHandler] onNotificationDismissed');
  }
}

@pragma('vm:entry-point')
Future<void> alarmCallback(int id) async {
  // 1. Flutter 엔진 및 기본 서비스 초기화 (최우선 순위)
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('[AlarmScheduler] --- Alarm Callback Start ---');
  debugPrint('[AlarmScheduler] ID received: $id');

  // 즉시 알림 서비스 초기화 (Hive보다 먼저)
  final notificationService = NotificationService();
  try {
    await notificationService.init(null, isBackground: true);
    debugPrint('[AlarmScheduler] NotificationService Initialized Early.');
    
    // [핵심] 무엇이든 간에 일단 알람을 울려서 깨운다.
    // 상세 정보는 나중에 로드해서 업데이트하더라도, 소리와 진동은 즉시 시작해야 함.
    await notificationService.showAlarmNotification(
      id: id,
      title: '스냅 알람',
      body: '알람을 확인하세요!', // 기본 메시지
      payload: 'loading_$id', // 로딩 중임을 표시
      soundName: 'morning', // 기본 사운드 (안전장치)
      isVibrationEnabled: true,
    );
    debugPrint('[AlarmScheduler] IMMEDIATE ALARM FIRED (Fail-safe).');
  } catch (e) {
    debugPrint('[AlarmScheduler] CRITICAL: Failed to fire immediate alarm: $e');
  }

  // 날짜/시간 포맷팅 초기화
  await initializeDateFormatting();

  // 2. Foreground Service 시작 (앱 유지력 강화)
  try {
    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.restartService();
    } else {
      await FlutterForegroundTask.startService(
        serviceId: 256,
        notificationTitle: '스냅 알람',
        notificationText: '알람이 울리고 있습니다!',
        notificationIcon: NotificationIcon(
          metaDataName: 'com.seriessnap.fortunealarm.notification_icon',
          backgroundColor: const Color(0xFF5C6BC0),
        ),
        callback: startCallback,
      );
    }
    debugPrint('[AlarmScheduler] Foreground Service Started.');
    
    // 서비스가 시작된 후 앱 실행 시도 (전체 화면 알람을 위해)
    // 서비스가 활성화된 상태에서 launchApp()이 더 잘 작동함
    _launchAppWithRetry();
  } catch (e) {
    debugPrint('[AlarmScheduler] Foreground Service Start Failed: $e');
  }

  // 3. Hive 및 데이터 로드
  Box<AlarmModel>? box;
  try {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    debugPrint('[AlarmScheduler] Isolate Hive Path: $path');
    
    // Hive 초기화 (안전하게)
    try {
      if (!Hive.isBoxOpen('alarms')) {
        await Hive.initFlutter(path);
        if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(AlarmModelAdapter());
        if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(MissionTypeAdapter());
        if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(MathDifficultyAdapter());
      }
    } catch (e) {
      debugPrint('[AlarmScheduler] Hive Init Error: $e');
    }

    // 알람 데이터 검색
    AlarmModel? alarm;
    try {
      box = await Hive.openBox<AlarmModel>('alarms');
      for (final a in box.values) {
        if (AlarmSchedulerService.getStableId(a.id) == id) {
          alarm = a;
          break;
        }
      }
    } catch (e) {
      debugPrint('[AlarmScheduler] Error opening Hive box: $e');
    }

    // 4. 알람 상세 정보로 알림 업데이트 (데이터 로드 성공 시)
    if (alarm != null && alarm.isEnabled) {
      debugPrint('[AlarmScheduler] Found Alarm: ${alarm.id}, Updating Notification...');
      
      // 시간 검증
      final now = DateTime.now();
      final difference = now.difference(alarm.time);
      if (difference.inMinutes > 90) {
        debugPrint('[AlarmScheduler] Too late (>90m). Cancelling.');
        await notificationService.cancelNotification(id); // 늦었으면 취소
        return;
      }

      String payload = alarm.id;
      String body = '일어날 시간입니다!';
      if (alarm.missionType != MissionType.none) {
        body = '미션을 수행하고 알람을 끄세요!';
      }
      
      if (alarm.id.endsWith('_safety')) {
        body = '알람이 강제로 종료되었습니다! 미션을 완료해주세요.';
      }

      // 미션 상태 체크 (중복 실행 방지)
      bool suppressRinging = false;
      try {
        final stateBox = await Hive.openBox('app_state');
        final activeBaseId = stateBox.get('active_alarm_mission_base_id') as String?;
        final startedAtStr = stateBox.get('active_alarm_mission_started_at') as String?;
        if (activeBaseId != null && startedAtStr != null) {
          final startedAt = DateTime.tryParse(startedAtStr);
          if (startedAt != null && DateTime.now().difference(startedAt) < const Duration(minutes: 2)) {
             final baseId = alarm.id.replaceAll('_snooze', '');
             suppressRinging = baseId == activeBaseId;
          } else {
             await stateBox.delete('active_alarm_mission_base_id');
             await stateBox.delete('active_alarm_mission_started_at');
          }
        }
      } catch (e) {
        debugPrint('[AlarmScheduler] Mission state check failed: $e');
      }

      if (!suppressRinging) {
        try {
          final stateBox = await Hive.openBox('app_state');
          await stateBox.put('pending_alarm_payload', payload);
          await stateBox.put('pending_alarm_set_at', DateTime.now().toIso8601String());
          await stateBox.flush(); // [중요] 즉시 파일에 쓰기 보장
          debugPrint('[AlarmScheduler] Pending alarm flag stored and flushed for payload: $payload');
          
          // 페이로드 저장 후 다시 한 번 앱 실행 시도 (확실하게 하기 위해)
          _launchAppWithRetry();
        } catch (e) {
          debugPrint('[AlarmScheduler] Failed to store pending alarm flag: $e');
        }
        // 기존 즉시 알림 취소 (중복 방지)
        await notificationService.cancelNotification(id);
        
        // UI Isolate로 신호 전송
        final SendPort? uiSendPort = IsolateNameServer.lookupPortByName(kAlarmPortName);
        uiSendPort?.send(payload);

        // 설정된 알람 정보로 새 알림 생성
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
        debugPrint('[AlarmScheduler] Notification CREATED with real data (Sound: ${alarm.ringtonePath}, Vibration: ${alarm.isVibrationEnabled}).');
      } else {
        debugPrint('[AlarmScheduler] Suppressing ringing due to active mission.');
        await notificationService.cancelNotification(id); // 억제해야 하면 기존 알림 취소
      }

      // 다음 알람 예약
      if (alarm.repeatDays.any((d) => d)) {
        debugPrint('[AlarmScheduler] Rescheduling next repeat...');
        DateTime referenceTime = DateTime.now();
        if (referenceTime.isBefore(alarm.time)) referenceTime = alarm.time;
        final nextTime = AlarmSchedulerService._calculateNextTime(alarm.time, alarm.repeatDays, referenceTime: referenceTime);
        final nextAlarm = alarm.copyWith(time: nextTime);
        await box?.put(nextAlarm.id, nextAlarm);
        await AlarmSchedulerService.scheduleAlarm(nextAlarm);
      } else {
        final updatedAlarm = alarm.copyWith(isEnabled: false);
        await box?.put(updatedAlarm.id, updatedAlarm);
      }
    } else {
      debugPrint('[AlarmScheduler] Alarm not found or disabled. Keeping fallback notification.');
      // 데이터가 없어도 폴백 알림은 유지됨 (사용자가 깨야 하므로)
    }

  } catch (e, stackTrace) {
    debugPrint('[AlarmScheduler] FATAL in alarmCallback: $e');
    debugPrint(stackTrace.toString());
  } finally {
    if (box != null && box.isOpen) await box.close();
  debugPrint('[AlarmScheduler] --- Alarm Callback End ---');
  }
}

/// 앱 실행 시도 (실패 시 재시도 로직 포함)
@pragma('vm:entry-point')
Future<void> _launchAppWithRetry() async {
  int retries = 0;
  bool success = false;
  
  while (!success && retries < 5) {
    try {
      debugPrint('[AlarmScheduler] Attempting to launch app via FlutterForegroundTask.launchApp() (Retry: $retries)...');
      FlutterForegroundTask.launchApp();
      success = true;
      debugPrint('[AlarmScheduler] launchApp() call sent successfully.');
    } catch (e) {
      retries++;
      debugPrint('[AlarmScheduler] launchApp() failed: $e. Retrying in 500ms...');
      await Future.delayed(const Duration(milliseconds: 500));
    }
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

  /// 안전 장치 알람 예약 (앱 강제 종료 대응)
  static Future<void> scheduleSafetyAlarm(AlarmModel alarm) async {
    final safetyId = '${alarm.id}_safety';
    debugPrint('[AlarmScheduler] Scheduling Safety Alarm: $safetyId');
    
    // 1분 뒤에 울리는 안전 알람 생성
    final safetyTime = DateTime.now().add(const Duration(minutes: 1));
    final safetyAlarm = alarm.copyWith(
      id: safetyId,
      time: safetyTime,
      label: '알람이 강제로 종료되었습니다!',
      isEnabled: true,
    );

    // Hive에 임시 저장
    final box = await Hive.openBox<AlarmModel>('alarms');
    await box.put(safetyId, safetyAlarm);
    
    // 스케줄링 (기존 scheduleAlarm 사용)
    // 주의: 여기서 scheduleAlarm을 호출하면 cancelAlarm이 호출되어 
    // 기존 알람(만약 같은 ID라면)이 취소될 수 있으므로 ID가 달라야 함.
    // _safety 접미사로 구분되므로 안전함.
    
    // AndroidAlarmManager 직접 호출 (scheduleAlarm은 권한 체크 등 오버헤드가 있으므로)
    final int stableId = getStableId(safetyId);
    if (Platform.isAndroid) {
      await AndroidAlarmManager.oneShotAt(
        safetyTime,
        stableId,
        alarmCallback,
        exact: true,
        wakeup: true,
        alarmClock: true,
        rescheduleOnReboot: true,
        allowWhileIdle: true,
      );
    } else if (Platform.isIOS) {
      await NotificationService().scheduleAlarmNotification(
        id: stableId,
        title: '스냅 알람',
        body: '알람이 강제로 종료되었습니다!',
        scheduledDate: safetyTime,
        payload: 'safety_$safetyId',
      );
    }
  }

  /// 안전 장치 알람 취소
  static Future<void> cancelSafetyAlarm(String originalId) async {
    final safetyId = '${originalId}_safety';
    debugPrint('[AlarmScheduler] Cancelling Safety Alarm: $safetyId');
    
    final int stableId = getStableId(safetyId);
    if (Platform.isAndroid) {
      await AndroidAlarmManager.cancel(stableId);
    } else if (Platform.isIOS) {
      await NotificationService().cancelNotification(stableId);
    }
    
    // Hive에서 제거
    final box = await Hive.openBox<AlarmModel>('alarms');
    await box.delete(safetyId);
  }

  @pragma('vm:entry-point')
  static Future<bool> scheduleAlarm(AlarmModel alarm) async {
    try {
      debugPrint('[AlarmScheduler] --- Scheduling Start ---');
      debugPrint('[AlarmScheduler] ID: ${alarm.id}');
      debugPrint('[AlarmScheduler] Time: ${alarm.time}');
      
      // 1. 기존 알람 취소 (중복 예약 방지)
      // 스누즈도 취소함 (메인 알람 예약 시 스누즈를 건드릴 필요가 없음)
      await cancelAlarm(alarm, cancelMain: true, cancelSnooze: true ); 

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
          scheduleTime = now.add(const Duration(milliseconds: 500)); // 즉시 실행을 위해 0.5초 뒤로 설정
        } else {
          debugPrint('[AlarmScheduler] WARNING: Attempted to schedule alarm in the past (>1m)! Time: ${alarm.time}, Now: $now');
          return false;
        }
      } else {
        scheduleTime = DateTime(
          scheduleTime.year,
          scheduleTime.month,
          scheduleTime.day,
          scheduleTime.hour,
          scheduleTime.minute,
          scheduleTime.second
        );
        
        // 만약 보정 후 현재보다 과거가 되면(아주 근소한 차이), 1초 뒤로 설정
        if (scheduleTime.isBefore(now)) {
          scheduleTime = now.add(const Duration(seconds: 1));
        }
      }

      debugPrint('[AlarmScheduler] Calling scheduling service...');
      bool result = false;
      
      if (Platform.isAndroid) {
        // [수정] 스누즈/알람 신뢰성 강화 (Android Doze 모드 대응)
        // 3분과 같은 짧은 간격의 반복 알람을 Doze 모드(절전 모드)에서도 정확히 울리게 하려면
        // setExactAndAllowWhileIdle()은 9분의 쓰로틀링(제한)이 있어 부적합합니다.
        // 따라서 setAlarmClock() (alarmClock: true)을 사용하여 시스템에 알람 시계 이벤트임을 명시해야 합니다.
        // 이는 제한 없이 정확한 시간에 깨울 수 있는 유일한 방법입니다.
        result = await AndroidAlarmManager.oneShotAt(
          scheduleTime,
          alarmId,
          alarmCallback,
          exact: true,
          wakeup: true,
          alarmClock: true, // [중요] 3분 스누즈를 위해 true로 설정 (setAlarmClock 사용)
          rescheduleOnReboot: true,
          allowWhileIdle: true,
        );
      } else if (Platform.isIOS) {
        try {
          await NotificationService().scheduleAlarmNotification(
            id: alarmId,
            title: '스냅 알람',
            body: alarm.label.isEmpty ? '알람이 울리고 있습니다!' : alarm.label,
            scheduledDate: scheduleTime,
            payload: 'alarm_${alarm.id}',
            soundName: alarm.ringtonePath,
            isVibrationEnabled: alarm.isVibrationEnabled,
          );
          result = true;
        } catch (e) {
          debugPrint('[AlarmScheduler] iOS scheduling failed: $e');
          result = false;
        }
      }

      if (result) {
        debugPrint('[AlarmScheduler] SUCCESSFULLY scheduled at: $scheduleTime');
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
  static Future<void> snoozeAlarm(AlarmModel alarm, {DateTime? snoozeTime}) async {
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

    final resolvedSnoozeTime = snoozeTime ?? DateTime.now().add(Duration(minutes: alarm.snoozeInterval));
    
    // ID 처리: 원본 ID 추출 후 _snooze 붙임
    String originalId = alarm.id.replaceAll('_snooze', '');
    final String snoozeId = '${originalId}_snooze';

    final snoozeAlarm = alarm.copyWith(
      id: snoozeId, 
      time: resolvedSnoozeTime,
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
      if (Platform.isAndroid) {
        await AndroidAlarmManager.cancel(alarmId);
      } else if (Platform.isIOS) {
        await NotificationService().cancelNotification(alarmId);
      }
    }

    // 알림도 함께 취소 (현재 울리고 있는 알림이 있을 수 있으므로)
    final notificationService = NotificationService();
    await notificationService.cancelNotification(alarmId);
    
    // 스누즈 알람 취소 여부 확인
    if (cancelSnooze && !alarm.id.endsWith('_snooze')) {
      final String snoozeId = '${alarm.id}_snooze';
      final int snoozeStableId = getStableId(snoozeId);
      
      if (Platform.isAndroid) {
        await AndroidAlarmManager.cancel(snoozeStableId);
      } else if (Platform.isIOS) {
        await notificationService.cancelNotification(snoozeStableId);
      }
      await notificationService.cancelNotification(snoozeStableId);
      
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
      final notificationService = NotificationService();
      for (final alarm in box.values) {
        final int alarmId = getStableId(alarm.id);
        if (Platform.isAndroid) {
          await AndroidAlarmManager.cancel(alarmId);
        } else if (Platform.isIOS) {
          await notificationService.cancelNotification(alarmId);
        }
        await notificationService.cancelNotification(alarmId);
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
