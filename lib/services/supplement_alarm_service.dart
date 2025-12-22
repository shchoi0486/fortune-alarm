import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';
import 'dart:ui';
import 'dart:isolate';

import 'notification_service.dart';
import '../features/mission/supplement/models/supplement_settings.dart';

@pragma('vm:entry-point')
class SupplementAlarmService {
  static const int _startId = 10000; // 영양제 알람 ID 시작점 (일반 알람과 겹치지 않게)
  
  // Hive 경로 저장용
  static String? _hivePath;
  static void init({String? hivePath}) {
    _hivePath = hivePath;
  }

  // 알람 스케줄링
  static Future<void> scheduleAlarms(List<String> reminderTimes) async {
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        debugPrint('[SupplementAlarm] Schedule Exact Alarm permission denied.');
        return;
      }
    }

    // 기존 알람 취소
    await cancelAll();

    final now = DateTime.now();
    // 레이스 컨디션 방지를 위한 여유 시간 (1초)
    final bufferTime = now.add(const Duration(seconds: 1)); 
    
    for (int i = 0; i < reminderTimes.length; i++) {
      final timeParts = reminderTimes[i].split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);

      var scheduleTime = DateTime(now.year, now.month, now.day, hour, minute);

      // 현재 시간(버퍼 포함)보다 이전이거나 같으면 내일로 설정
      if (!scheduleTime.isAfter(bufferTime)) {
        scheduleTime = scheduleTime.add(const Duration(days: 1));
      }
      
      final id = _startId + i;
      
      debugPrint('[SupplementAlarm] Scheduling ID: $id at $scheduleTime (Current: ${DateTime.now()})');

      // 더 정확한 실행을 위해 oneShotAt + alarmClock 사용
      // 콜백 내부에서 다음 날짜로 재예약 처리
      await scheduleOneTime(scheduleTime, id);
    }
  }

  // 단일 알람 스케줄링 (스누즈 등 일회성 및 정기 알람의 개별 회차)
  static Future<bool> scheduleOneTime(DateTime time, int id) async {
    final now = DateTime.now();
    
    // 과거 시간인 경우 내일로 설정
    // 핫리로드나 재부팅 시 불필요하게 즉시 울리는 것을 방지하기 위해 
    // "가까운 과거 즉시 실행" 로직을 제거하고 무조건 미래로 설정
    if (time.isBefore(now)) {
       time = time.add(const Duration(days: 1));
    }

    debugPrint('[SupplementAlarm] Scheduling at $time (ID: $id)');
    
    return await AndroidAlarmManager.oneShotAt(
      time,
      id,
      _supplementCallback,
      exact: true,
      wakeup: true,
      alarmClock: true, 
      rescheduleOnReboot: true,
      allowWhileIdle: true,
    );
  }

  // 모든 영양제 알람 취소
  static Future<void> cancelAll() async {
     for (int i = 0; i < 50; i++) {
        await AndroidAlarmManager.cancel(_startId + i);
        await AndroidAlarmManager.cancel(_startId + i + 50000);
     }
  }

  // 알람 콜백 (static)
  @pragma('vm:entry-point')
  static Future<void> _supplementCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[SupplementAlarm] Fired! ID: $id');
    
    // 0. 설정 확인 및 알람 유효성 검사
    bool shouldRing = true;
    String? ringtone;
    bool vibration = true;
    SupplementSettings? settings;
    Box<SupplementSettings>? box;

    try {
      // Hive 초기화 (백그라운드 격리된 Isolate이므로 초기화 필요)
      await Hive.initFlutter();
      
      if (!Hive.isAdapterRegistered(9)) {
        Hive.registerAdapter(SupplementSettingsAdapter());
      }

      if (Hive.isBoxOpen('supplement_settings')) {
        box = Hive.box<SupplementSettings>('supplement_settings');
      } else {
        box = await Hive.openBox<SupplementSettings>('supplement_settings');
      }
      
      settings = box.get('settings');
      
      // 알람이 비활성화 상태라면 울리지 않음
      if (settings != null && !settings.isAlarmEnabled) {
        debugPrint('[SupplementAlarm] Alarm is disabled in settings. Skipping.');
        shouldRing = false;
      }
      
      ringtone = settings?.ringtonePath;
    } catch (e) {
      debugPrint('[SupplementAlarm] Hive error during callback: $e');
    }

    if (!shouldRing) {
      if (box != null && box.isOpen) await box.close();
      return;
    }

    // 1. 알림 표시
    final notificationService = NotificationService();
    debugPrint('[SupplementAlarm] Initializing NotificationService in background...');
    try {
        await notificationService.init(null);
        debugPrint('[SupplementAlarm] NotificationService init success.');
    } catch (e) {
        debugPrint('[SupplementAlarm] Notification init error: $e');
    }

    final String payload = 'supplement_$id';

    // 포그라운드 Isolate로 신호 보내기 (앱이 켜져 있을 때 즉시 화면 전환)
    final SendPort? uiSendPort = IsolateNameServer.lookupPortByName('alarm_notification_port');
    if (uiSendPort != null) {
      debugPrint('[SupplementAlarm] Sending signal to Foreground UI Isolate.');
      uiSendPort.send(payload);
    }

    debugPrint('[SupplementAlarm] Calling showSupplementNotification. Payload: $payload');
    await notificationService.showSupplementNotification(
      id: id,
      title: '영양제 챙겨 드세요!',
      body: '지금 드시겠습니까?',
      payload: payload,
      soundName: ringtone,
      isVibrationEnabled: vibration,
    );
    debugPrint('[SupplementAlarm] showSupplementNotification call finished.');

    // 2. 다음 날 같은 시간으로 재예약 (정기 알람인 경우)
    // 스누즈 ID(기존 ID + 50000)가 아닌 경우에만 재예약
    if (id >= _startId && id < _startId + 50) {
      try {
        // 이미 위에서 box를 열어두었으므로, 사용
        // 만약 box가 닫혔거나 null이면 다시 열어야 함
        Box<SupplementSettings> settingsBox;
        if (box != null && box.isOpen) {
          settingsBox = box;
        } else if (Hive.isBoxOpen('supplement_settings')) {
          settingsBox = Hive.box<SupplementSettings>('supplement_settings');
        } else {
          settingsBox = await Hive.openBox<SupplementSettings>('supplement_settings');
        }
        
        final currentSettings = settingsBox.get('settings');
        
        if (currentSettings != null && currentSettings.isAlarmEnabled) {
          final index = id - _startId;
          if (index < currentSettings.reminderTimes.length) {
            final timeStr = currentSettings.reminderTimes[index];
            final timeParts = timeStr.split(':');
            final hour = int.parse(timeParts[0]);
            final minute = int.parse(timeParts[1]);

            final now = DateTime.now();
            var nextTime = DateTime(now.year, now.month, now.day, hour, minute);
            
            // 현재 시간보다 이전이면(방금 울린 알람 포함) 무조건 내일로 설정
            nextTime = nextTime.add(const Duration(days: 1));
            
            await scheduleOneTime(nextTime, id);
            debugPrint('[SupplementAlarm] Accurate Rescheduled for tomorrow: $nextTime (ID: $id)');
          }
        }
        await settingsBox.close();
      } catch (e) {
        debugPrint('[SupplementAlarm] Reschedule error: $e');
        // 에러 발생 시 차선책으로 24시간 뒤로 예약
        final fallbackTime = DateTime.now().add(const Duration(days: 1));
        await scheduleOneTime(fallbackTime, id);
        debugPrint('[SupplementAlarm] Fallback Rescheduled for tomorrow: $fallbackTime (ID: $id)');
      }
    }
  }
}