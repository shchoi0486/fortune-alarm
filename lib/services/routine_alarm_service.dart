import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';
import 'package:fortune_alarm/l10n/app_localizations.dart';

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

    final box = await Hive.openBox('alarm_settings');
    final enabled = box.get('routine_notification_enabled', defaultValue: true);
    
    if (!enabled) {
      await cancelAll();
      return;
    }

    final morningTimeStr = box.get('morning_routine_time', defaultValue: '08:00');
    final eveningTimeStr = box.get('evening_routine_time', defaultValue: '21:00');

    final morningParts = morningTimeStr.split(':');
    final eveningParts = eveningTimeStr.split(':');

    // 오전 알림
    await _scheduleOne(
      int.parse(morningParts[0]), 
      int.parse(morningParts[1]), 
      _morningId, 
      'morning'
    );
    // 오후 알림
    await _scheduleOne(
      int.parse(eveningParts[0]), 
      int.parse(eveningParts[1]), 
      _eveningId, 
      'evening'
    );
  }

  static Future<void> cancelAll() async {
    if (Platform.isAndroid) {
      await AndroidAlarmManager.cancel(_morningId);
      await AndroidAlarmManager.cancel(_eveningId);
    } else if (Platform.isIOS) {
      await NotificationService().cancelNotification(_morningId);
      await NotificationService().cancelNotification(_eveningId);
    }
    debugPrint('[RoutineAlarm] All routine alarms canceled');
  }

  static Future<void> _scheduleOne(int hour, int minute, int id, String type) async {
    final now = DateTime.now();
    var scheduledTime = DateTime(now.year, now.month, now.day, hour, minute);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    debugPrint('[RoutineAlarm] Scheduling $type at $scheduledTime (ID: $id)');

    if (Platform.isAndroid) {
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
    } else if (Platform.isIOS) {
      final l10n = await NotificationService().getL10n();

      String title = l10n.routineCheckTitle;
      String body = l10n.routineCheckBody;
      
      if (id == _morningId) {
        title = l10n.routineMorningTitle;
        body = l10n.routineMorningBody;
      } else if (id == _eveningId) {
        title = l10n.routineEveningTitle;
        body = l10n.routineEveningBody;
      }

      await NotificationService().scheduleAlarmNotification(
        id: id,
        title: title,
        body: body,
        scheduledDate: scheduledTime,
        payload: 'routine_daily',
      );
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _routineCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[RoutineAlarm] Fired! ID: $id');

    final notificationService = NotificationService();
    await notificationService.init(null);

    final l10n = await notificationService.getL10n();

    String title = l10n.routineCheckTitle;
    String body = l10n.routineCheckBody;
    
    if (id == _morningId) {
      title = l10n.routineMorningTitle;
      body = l10n.routineMorningBody;
    } else if (id == _eveningId) {
      title = l10n.routineEveningTitle;
      body = l10n.routineEveningBody;
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
