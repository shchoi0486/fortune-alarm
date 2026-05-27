import 'dart:io';
import 'dart:ui';
import 'dart:isolate';
import 'package:permission_handler/permission_handler.dart';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../data/models/alarm_model.dart';
import '../data/models/math_difficulty.dart';
import '../core/constants/mission_type.dart';
import 'notification_service.dart';
import 'fortune_push_service.dart';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:path_provider/path_provider.dart';

// 백그라운드 포트 이름 (main.dart와 동일해야 함)
const String kAlarmPortName = 'alarm_notification_port';

void _registerBackgroundAdapters() {
  if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(AlarmModelAdapter());
  if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(MissionTypeAdapter());
  if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(MathDifficultyAdapter());
}

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
  
  // 로컬라이징 초기화
  AppLocalizations? l10n;
  try {
    l10n = await notificationService.getL10n();
    debugPrint('[AlarmScheduler] Localization loaded successfully.');
  } catch (e) {
    debugPrint('[AlarmScheduler] Localization load failed: $e');
    // 기본 로케일로 폴백
    try {
      String langCode = Platform.localeName.split('_')[0];
      Locale locale = Locale(langCode);
      if (!AppLocalizations.supportedLocales.contains(locale)) {
        locale = const Locale('en');
      }
      l10n = await AppLocalizations.delegate.load(locale);
    } catch (_) {}
  }

  try {
    await notificationService.init(null, isBackground: true);
    debugPrint('[AlarmScheduler] NotificationService Initialized Early.');
    
    // [핵심] 무엇이든 간에 일단 알람을 울려서 깨운다. (Fail-safe)
    // 상세 정보 로딩 전이라도 일단 기본 알림을 띄웁니다.
    await notificationService.showAlarmNotification(
      id: id,
      title: l10n?.appTitle ?? 'Fortune Alarm',
      body: l10n?.notificationWakeUpBody ?? 'Time to wake up!', // 초기 메시지 통일
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
        notificationTitle: l10n?.appTitle ?? 'Fortune Alarm',
        notificationText: l10n?.notificationWakeUpBody ?? 'Time to wake up!',
        notificationIcon: NotificationIcon(
          metaDataName: 'com.seriessnap.fortune_alarm.notification_icon',
        ),
        callback: startCallback,
      );
    }
    debugPrint('[AlarmScheduler] Foreground Service Started.');
    
    // 서비스가 시작된 후 앱 실행 시도 (전체 화면 알람을 위해)
    _launchAppWithRetry();
  } catch (e) {
    debugPrint('[AlarmScheduler] Foreground Service Start Failed: $e');
  }

  // 3. Hive 및 데이터 로드
  Box<AlarmModel>? box;
  try {
    _registerBackgroundAdapters();
    // [중요] NotificationService에서 이미 초기화되었으므로 바로 박스를 열 수 있음
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

    // 4. 알람 로직 수행 (데이터 로드 성공 시)
    if (alarm != null && alarm.isEnabled) {
      debugPrint('[AlarmScheduler] Found Alarm: ${alarm.id}.');

      // -------------------------------------------------------------------------
      // [CRITICAL FIX] 다음 알람 예약 로직을 최우선으로 이동 (선 예약, 후 실행)
      // 앱이 소리 재생 중 강제 종료되더라도 다음 알람은 이미 시스템에 등록되어 있어야 합니다.
      // -------------------------------------------------------------------------
      if (alarm.repeatDays.any((d) => d)) {
        debugPrint('[AlarmScheduler] [Priority] Rescheduling next repeat IMMEDIATELY...');
        DateTime referenceTime = DateTime.now();
        if (referenceTime.isBefore(alarm.time)) referenceTime = alarm.time;
        
        final nextTime = AlarmSchedulerService.calculateNextTime(alarm.time, alarm.repeatDays, referenceTime: referenceTime);
        final nextAlarm = alarm.copyWith(time: nextTime);
        
        // Hive 업데이트
        await box?.put(nextAlarm.id, nextAlarm);
        
        // AndroidAlarmManager에 다음 스케줄 등록
        // [중요] isRescheduling: true로 설정하여 현재 울리고 있는 소리(Notification)를 끄지 않도록 함
        await AlarmSchedulerService.scheduleAlarm(nextAlarm, isRescheduling: true);
        debugPrint('[AlarmScheduler] [Priority] Next alarm secured at $nextTime');
      } else {
        // 일회성 알람인 경우 UI에서 사용자가 해제할 때까지 활성화 상태 유지 (화면 팝업을 위해)
        debugPrint('[AlarmScheduler] [Priority] One-time alarm. Keeping enabled until dismissed by user.');
      }
      // -------------------------------------------------------------------------

      // 시간 검증 (너무 늦게 울린 경우)
      final now = DateTime.now();
      final difference = now.difference(alarm.time);
      if (difference.inMinutes > 90) {
        debugPrint('[AlarmScheduler] Too late (>90m). Cancelling notification.');
        await notificationService.cancelNotification(id); 
        return;
      }

      String payload = alarm.id;
      String body = l10n?.notificationWakeUpBody ?? 'Time to wake up!';
      if (alarm.missionType != MissionType.none) {
        body = l10n?.notificationMissionBody ?? 'Complete the mission to turn off the alarm!';
      }
      
      if (alarm.id.endsWith('_safety')) {
        body = l10n?.notificationSafetyBody ?? 'The alarm has been forced to close! Please complete the mission.';
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
          
          // 페이로드 저장 후 다시 한 번 앱 실행 시도
          _launchAppWithRetry();
        } catch (e) {
          debugPrint('[AlarmScheduler] Failed to store pending alarm flag: $e');
        }
        
        // UI Isolate로 신호 전송
        final SendPort? uiSendPort = IsolateNameServer.lookupPortByName(kAlarmPortName);
        uiSendPort?.send(payload);

        // 설정된 알람 정보로 새 알림 생성 (실제 소리와 진동으로 업데이트)
        await notificationService.showAlarmNotification(
          id: id,
          title: l10n?.appTitle ?? 'Fortune Alarm',
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
        await notificationService.cancelNotification(id); 
      }
      
    } else {
      debugPrint('[AlarmScheduler] Alarm not found or disabled. Keeping fallback notification.');
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
    // [추가] 앱 시작 시 자가 치유(Self-Healing): 
    // OS 업데이트나 강제 종료로 인해 사라진 알람 스케줄을 복구합니다.
    _rescheduleExistingAlarms();
  }

  /// 앱 시작 시 기존 알람 상태를 확인하고 필요한 경우 재스케줄링
  static Future<void> _rescheduleExistingAlarms() async {
    try {
      debugPrint('[AlarmScheduler] Checking for alarms to reschedule...');
      // Hive가 이미 초기화되었다고 가정 (main.dart에서 호출)
      // 만약 초기화되지 않았다면 에러가 날 수 있으므로 체크
      if (!Hive.isBoxOpen('alarms')) {
        // 경로를 알 수 없으므로 여기서는 안전하게 리턴하거나, 
        // main에서 init 호출 순서를 보장해야 함.
        // 보통 init()은 Hive.initFlutter() 이후에 호출됨.
        final dir = await getApplicationDocumentsDirectory();
        Hive.init(dir.path);
      }
      
      final box = await Hive.openBox<AlarmModel>('alarms');
      final now = DateTime.now();

      for (final alarm in box.values) {
        if (!alarm.isEnabled) continue;

        // 1. 이미 지난 알람인지 확인
        if (alarm.time.isBefore(now)) {
           // 반복 알람이면 다음 시간으로 갱신 후 예약
           if (alarm.repeatDays.any((d) => d)) {
             debugPrint('[AlarmScheduler] Found stale repeating alarm: ${alarm.id}. Updating to next occurrence.');
             final nextTime = calculateNextTime(alarm.time, alarm.repeatDays);
             final nextAlarm = alarm.copyWith(time: nextTime);
             await box.put(nextAlarm.id, nextAlarm);
             await scheduleAlarm(nextAlarm);
           } else {
             // [수정] 5분 -> 30분으로 조정 (사용자 피드백 반영)
             // 너무 긴 시간(예: 60분)은 이미 기상 시간이 한참 지나 의미가 없을 수 있으므로 30분으로 타협합니다.
             // 재부팅이나 시스템 업데이트 등 불가피한 지연 상황에서도 최소한의 신뢰성을 보장합니다.
             if (now.difference(alarm.time).inMinutes > 30) {
               debugPrint('[AlarmScheduler] Found stale one-time alarm: ${alarm.id}. Disabling.');
               final disabledAlarm = alarm.copyWith(isEnabled: false);
               await box.put(disabledAlarm.id, disabledAlarm);
             } else {
                // 최근(30분 이내)에 놓친거라면 약간 미래 시각으로 보정 후 즉시 복구 예약
                final recoveredAlarm = alarm.copyWith(
                  time: now.add(const Duration(seconds: 3)),
                );
                debugPrint(
                  '[AlarmScheduler] Found recently missed one-time alarm: ${alarm.id}. Recovering at ${recoveredAlarm.time}.',
                );
                await box.put(recoveredAlarm.id, recoveredAlarm);
                await scheduleAlarm(recoveredAlarm);
             }
           }
        } else {
          // 2. 미래의 알람이면, 시스템 AlarmManager에 다시 등록 (덮어쓰기)
          // OS가 알람을 날렸을 경우를 대비해 무조건 재등록
          debugPrint('[AlarmScheduler] Refreshing future alarm: ${alarm.id} at ${alarm.time}');
          await scheduleAlarm(alarm);
        }
      }

      // [추가] 데일리 운세 알림의 텍스트 언어를 최신 상태로 갱신하기 위해 재스케줄링
      // 상황 기반 운세 알림 갱신
      await FortunePushService.scheduleDailyPush();

    } catch (e) {
      debugPrint('[AlarmScheduler] Error during rescheduleExistingAlarms: $e');
    }
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
    
    // 로컬라이징 가져오기
    final l10n = await NotificationService().getL10n();

    // 1분 뒤에 울리는 안전 알람 생성
    final safetyTime = DateTime.now().add(const Duration(minutes: 1));
    final safetyAlarm = alarm.copyWith(
      id: safetyId,
      time: safetyTime,
      label: l10n.notificationSafetyBody,
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
        title: l10n.appTitle,
        body: l10n.notificationSafetyBody,
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
  // [수정] isRescheduling 옵션 추가: 알람이 울려서 다음 일정을 예약하는 경우, 기존 소리를 끄지 않기 위함
  static Future<bool> scheduleAlarm(AlarmModel alarm, {bool isRescheduling = false}) async {
    try {
      debugPrint('[AlarmScheduler] --- Scheduling Start ---');
      debugPrint('[AlarmScheduler] ID: ${alarm.id}');
      debugPrint('[AlarmScheduler] Time: ${alarm.time}');
      
      // 1. 기존 알람 취소 (중복 예약 방지)
      // 스누즈도 취소함 (메인 알람 예약 시 스누즈를 건드릴 필요가 없음)
      // [수정] 재스케줄링 중에는 취소를 건너뜀 (소리 끊김 방지, AlarmManager는 ID가 같으면 자동 덮어쓰기 함)
      if (!isRescheduling) {
        await cancelAlarm(alarm, cancelMain: true, cancelSnooze: true ); 
      }

      bool hasPermissionIssues = false;
      String permissionErrorMsg = '';

      if (Platform.isAndroid) {
        // [수정] 권한 상태를 먼저 확인하고 결과를 저장
        var exactStatus = await Permission.scheduleExactAlarm.status;
        debugPrint('[AlarmScheduler] SCHEDULE_EXACT_ALARM status: $exactStatus');
        
        if (exactStatus.isDenied) {
          debugPrint('[AlarmScheduler] SCHEDULE_EXACT_ALARM permission denied. Requesting...');
          exactStatus = await Permission.scheduleExactAlarm.request();
          
          if (exactStatus.isDenied) {
            debugPrint('[AlarmScheduler] CRITICAL: SCHEDULE_EXACT_ALARM permission still denied. Alarm might not ring exactly.');
            hasPermissionIssues = true;
            permissionErrorMsg = 'SCHEDULE_EXACT_ALARM';
          }
        }

        // 배터리 최적화 제외 권한 확인 (절전 모드에서 알람 보장)
        final batteryStatus = await Permission.ignoreBatteryOptimizations.status;
        debugPrint('[AlarmScheduler] ignoreBatteryOptimizations status: $batteryStatus');
        
        if (batteryStatus.isDenied) {
           debugPrint('[AlarmScheduler] Battery optimization is active. Requesting to ignore...');
           await Permission.ignoreBatteryOptimizations.request();
           
           // 요청 후에도 거부 상태면 문제 기록
           final newBatteryStatus = await Permission.ignoreBatteryOptimizations.status;
           if (newBatteryStatus.isDenied) {
             debugPrint('[AlarmScheduler] WARNING: Battery optimization still active. Alarms may be delayed.');
             hasPermissionIssues = true;
             permissionErrorMsg = permissionErrorMsg.isEmpty ? 'IGNORE_BATTERY_OPTIMIZATIONS' : '$permissionErrorMsg, IGNORE_BATTERY_OPTIMIZATIONS';
           }
        }
        
        // [수정] 권한 문제가 있을 때 사용자에게 알람 정보에 저장
        if (hasPermissionIssues) {
          try {
            final stateBox = await Hive.openBox('app_state');
            await stateBox.put('permission_issue_detected', true);
            await stateBox.put('permission_issue_time', DateTime.now().toIso8601String());
            await stateBox.put('permission_error_types', permissionErrorMsg);
            await stateBox.flush();
            debugPrint('[AlarmScheduler] Permission issue flag saved for UI notification');
          } catch (e) {
            debugPrint('[AlarmScheduler] Failed to save permission issue flag: $e');
          }
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
        // [수정] 무한 루프 방지 로직 개선
        // 1. 재스케줄링(반복 알람 자동 생성) 중일 때만 과거 시간 스케줄링을 엄격히 제한
        // 2. 수동 저장(isRescheduling = false) 시에도 과거라면 즉시 실행을 막아 재실행 버그 방지
        if (isRescheduling) {
          debugPrint('[AlarmScheduler] Alarm time is in the past ($scheduleTime) during rescheduling. Skipping to prevent loop.');
          return false;
        }

        final diff = now.difference(scheduleTime);
        if (diff.inMinutes < 1) {
          debugPrint('[AlarmScheduler] Alarm time is in the past but within 1 minute. Skipping to prevent instant re-ring bug.');
          // [Bug Fix] 1분 이내 과거라도 즉시 실행하지 않고 건너뜀 (알람을 껐을 때 1초 뒤 즉시 다시 울리는 치명적 버그 방지)
          return false;
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
          // 로컬라이징 가져오기
          final l10n = await NotificationService().getL10n();

          await NotificationService().scheduleAlarmNotification(
            id: alarmId,
            title: l10n.appTitle,
            body: alarm.label.isEmpty ? l10n.notificationRingingBody : alarm.label,
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
    
    // 무제한(999)이면 카운트를 줄이지 않음
    int newRemainingCount = (alarm.maxSnoozeCount == 999) 
        ? 999 
        : currentRemaining - 1;

    // 더 이상 스누즈할 수 없으면 종료 (무제한이 아닐 때만 체크)
    if (alarm.maxSnoozeCount != 999 && newRemainingCount < 0) {
      debugPrint('[AlarmScheduler] No more snoozes left for alarm ${alarm.id}.');
      return;
    }

    final resolvedSnoozeTime = snoozeTime ?? DateTime.now().add(Duration(minutes: alarm.snoozeInterval));
    
    // 로컬라이징 가져오기
    final l10n = await NotificationService().getL10n();

    // ID 처리: 원본 ID 추출 후 _snooze 붙임
    String originalId = alarm.id.replaceAll('_snooze', '');
    final String snoozeId = '${originalId}_snooze';

    final snoozeAlarm = alarm.copyWith(
      id: snoozeId, 
      time: resolvedSnoozeTime,
      repeatDays: [false, false, false, false, false, false, false], // 스누즈는 항상 일회성
      label: isFirstSnooze ? '${l10n.snoozePrefix} ${alarm.label}' : alarm.label, // 이미 붙어있으면 유지
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

    // [Bug Fix] 알람 취소 시 펜딩 플래그도 함께 삭제하여 앱 재시작 시 재울림 방지
    try {
      final stateBox = await Hive.openBox('app_state');
      final pendingPayload = stateBox.get('pending_alarm_payload');
      
      if (pendingPayload != null) {
        final String p = pendingPayload.toString();
        // payload가 현재 취소하는 알람 ID와 관련이 있는지 확인
        // 예: payload="123", alarm.id="123" 또는 "123_snooze"
        // loading_ 접두사 처리
        final String cleanPayload = p.replaceFirst('loading_', '');
        
        if (cleanPayload == alarm.id || 
            alarm.id.startsWith(cleanPayload) || 
            cleanPayload.startsWith(alarm.id.replaceAll('_snooze', ''))) {
          
          debugPrint('[AlarmScheduler] Clearing pending flag for canceled alarm: $alarm.id (Payload: $p)');
          await stateBox.delete('pending_alarm_payload');
          await stateBox.delete('pending_alarm_set_at');
          await stateBox.flush();
        }
      }
    } catch (e) {
      debugPrint('[AlarmScheduler] Error clearing pending flag in cancelAlarm: $e');
    }
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
  static DateTime calculateNextTime(DateTime alarmTime, List<bool> repeatDays, {DateTime? referenceTime}) {
    final now = referenceTime ?? DateTime.now();
    // 기준 시간 (오늘 날짜 + 알람 시간)
    DateTime candidate = DateTime(now.year, now.month, now.day, alarmTime.hour, alarmTime.minute);
    
    int dayOffset = 0;
    while (true) {
      final checkDate = candidate.add(Duration(days: dayOffset));
      final weekdayIndex = checkDate.weekday - 1;
      
      if (repeatDays[weekdayIndex]) {
        // 현재 시간(referenceTime)보다 충분히 이후여야 함 (1분 이내의 미래면 건너뛰)
        if (checkDate.isAfter(now.add(const Duration(minutes: 1)))) {
           return checkDate;
        }
      }
      dayOffset++;
      if (dayOffset > 14) break; // 안전장치
    }
    return candidate.add(const Duration(days: 1)); // Fallback (내일)
  }

  // [추가] 알람 권한 상태 진단 메서드 - UI에서 호출 가능
  static Future<Map<String, dynamic>> diagnoseAlarmPermissions() async {
    Map<String, dynamic> result = {
      'scheduleExactAlarm': 'unknown',
      'ignoreBatteryOptimizations': 'unknown',
      'hasIssues': false,
      'issues': <String>[],
    };

    if (!Platform.isAndroid) {
      result['message'] = 'iOS - permission check not applicable';
      return result;
    }

    try {
      // SCHEDULE_EXACT_ALARM 권한 확인
      final exactStatus = await Permission.scheduleExactAlarm.status;
      result['scheduleExactAlarm'] = exactStatus.name;
      if (exactStatus.isDenied) {
        result['hasIssues'] = true;
        result['issues'].add('SCHEDULE_EXACT_ALARM denied');
      }

      // 배터리 최적화 권한 확인
      final batteryStatus = await Permission.ignoreBatteryOptimizations.status;
      result['ignoreBatteryOptimizations'] = batteryStatus.name;
      if (batteryStatus.isDenied) {
        result['hasIssues'] = true;
        result['issues'].add('IGNORE_BATTERY_OPTIMIZATIONS denied');
      }

      // 저장된 문제 기록 확인
      try {
        final stateBox = await Hive.openBox('app_state');
        final savedIssue = stateBox.get('permission_issue_detected', defaultValue: false);
        final savedTime = stateBox.get('permission_issue_time');
        if (savedIssue == true && savedTime != null) {
          result['savedIssueDetectedAt'] = savedTime;
          result['savedIssueTypes'] = stateBox.get('permission_error_types', defaultValue: '');
        }
      } catch (_) {}

      debugPrint('[AlarmScheduler] Permission diagnosis: $result');
    } catch (e) {
      result['error'] = e.toString();
      debugPrint('[AlarmScheduler] Permission diagnosis failed: $e');
    }

    return result;
  }

  // [추가] 권한 문제 해결 시도 - 설정 화면으로 안내하기 전 마지막 시도
  static Future<bool> attemptPermissionRecovery() async {
    if (!Platform.isAndroid) return true;

    bool allRecovered = true;

    try {
      // 정각 알람 권한 재요청
      var exactStatus = await Permission.scheduleExactAlarm.status;
      if (exactStatus.isDenied) {
        exactStatus = await Permission.scheduleExactAlarm.request();
        if (exactStatus.isDenied) {
          debugPrint('[AlarmScheduler] Could not recover SCHEDULE_EXACT_ALARM permission');
          allRecovered = false;
        }
      }

      // 배터리 최적화 권한 재요청
      var batteryStatus = await Permission.ignoreBatteryOptimizations.status;
      if (batteryStatus.isDenied) {
        batteryStatus = await Permission.ignoreBatteryOptimizations.request();
        if (batteryStatus.isDenied) {
          debugPrint('[AlarmScheduler] Could not recover IGNORE_BATTERY_OPTIMIZATIONS permission');
          allRecovered = false;
        }
      }

      // 문제 기록 초기화
      if (allRecovered) {
        try {
          final stateBox = await Hive.openBox('app_state');
          await stateBox.delete('permission_issue_detected');
          await stateBox.delete('permission_issue_time');
          await stateBox.delete('permission_error_types');
          await stateBox.flush();
        } catch (_) {}
      }

      debugPrint('[AlarmScheduler] Permission recovery result: $allRecovered');
    } catch (e) {
      debugPrint('[AlarmScheduler] Permission recovery error: $e');
      allRecovered = false;
    }

return allRecovered;
  }
}
