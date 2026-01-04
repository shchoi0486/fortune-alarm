import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'notification_service.dart';

@pragma('vm:entry-point')
class RoutineAlarmService {
  static const int _morningId = 30001;
  static const int _eveningId = 30002;

  // 데일리 루틴 알람 스케줄링
  static Future<void> scheduleDailyReminders() async {
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await Permission.scheduleExactAlarm.request();
      }
    }

    // 오전 8시 알림
    await _scheduleOne(8, 0, _morningId, 'morning');
    // 오후 9시 알림
    await _scheduleOne(21, 0, _eveningId, 'evening');
  }

  static Future<void> _scheduleOne(int hour, int minute, int id, String type) async {
    final now = DateTime.now();
    var scheduledTime = DateTime(now.year, now.month, now.day, hour, minute);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    debugPrint('[RoutineAlarm] Scheduling $type at $scheduledTime (ID: $id)');

    await AndroidAlarmManager.oneShotAt(
      scheduledTime,
      id,
      _routineCallback,
      exact: true,
      wakeup: true,
      alarmClock: true,
      rescheduleOnReboot: true,
      allowWhileIdle: true,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> _routineCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[RoutineAlarm] Fired! ID: $id');

    final notificationService = NotificationService();
    await notificationService.init(null);

    String title = '오늘의 미션을 확인해보세요! 🚀';
    String body = '습관 루틴을 지키고 기분 좋은 하루를 만들어봐요.';
    
    if (id == _morningId) {
      title = '상쾌한 아침입니다! ☀️';
      body = '오늘 계획한 습관 미션들을 잊지 않으셨나요?';
    } else if (id == _eveningId) {
      title = '오늘 하루도 수고 많으셨어요! ✨';
      body = '오늘의 미션을 모두 수행하셨나요? 루틴을 마무리해보세요.';
    }

    await notificationService.showRoutineNotification(
      id: id,
      title: title,
      body: body,
      payload: 'routine_daily',
    );

    // 다음 날 같은 시간으로 재예약
    final now = DateTime.now();
    final nextTime = now.add(const Duration(days: 1));
    
    await AndroidAlarmManager.oneShotAt(
      nextTime,
      id,
      _routineCallback,
      exact: true,
      wakeup: true,
      alarmClock: true,
      rescheduleOnReboot: true,
      allowWhileIdle: true,
    );
  }
}
