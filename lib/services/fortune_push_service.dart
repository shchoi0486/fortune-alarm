import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'notification_service.dart';
import '../core/constants/push_messages.dart';

@pragma('vm:entry-point')
class FortunePushService {
  static const int _lunchId = 40003; // 기존 40001, 40002와 겹치지 않게

  // 상황 기반 운세 푸시 알람 스케줄링 (매일 낮 12시 30분)
  static Future<void> scheduleDailyPush() async {
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await Permission.scheduleExactAlarm.request();
      }
    }

    final box = await Hive.openBox('alarm_settings');
    final enabled = box.get('daily_fortune_enabled', defaultValue: true);
    
    if (enabled) {
      // 낮 12시 30분 알림 1회만 등록
      await _scheduleOne(12, 30, _lunchId);
    } else {
      await cancelAll();
    }
  }

  // 알람 취소
  static Future<void> cancelAll() async {
    if (Platform.isAndroid) {
      await AndroidAlarmManager.cancel(_lunchId);
      // 기존 시간 기반 알람 취소
      await AndroidAlarmManager.cancel(40001);
      await AndroidAlarmManager.cancel(40002);
    } else if (Platform.isIOS) {
      await NotificationService().cancelNotification(_lunchId);
      await NotificationService().cancelAllFortuneNotifications();
    }
    debugPrint('[FortunePush] Canceled all fortune push alarms.');
  }

  static Future<void> _scheduleOne(int hour, int minute, int id) async {
    final now = DateTime.now();
    var scheduledTime = DateTime(now.year, now.month, now.day, hour, minute);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    debugPrint('[FortunePush] Scheduling at $scheduledTime (ID: $id)');

    if (Platform.isAndroid) {
      await AndroidAlarmManager.oneShotAt(
        scheduledTime,
        id,
        _fortunePushCallback,
        exact: true,
        wakeup: true,
        alarmClock: true,
        rescheduleOnReboot: true,
        allowWhileIdle: true,
      );
    } else if (Platform.isIOS) {
      final msg = PushMessages.getRandomFortuneMessage();

      await NotificationService().scheduleAlarmNotification(
        id: id,
        title: msg['title']!,
        body: msg['body']!,
        scheduledDate: scheduledTime,
        payload: 'fortune_daily',
      );
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _fortunePushCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[FortunePush] Fired! ID: $id');

    await Hive.initFlutter();
    
    // 오늘 날짜 문자열
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    // 상태 확인
    final box = await Hive.openBox('user_activity');
    final lastFortuneViewDate = box.get('last_fortune_view_date', defaultValue: '');
    
    if (lastFortuneViewDate != todayStr) {
      final notificationService = NotificationService();
      await notificationService.init(null);

      String langCode = 'ko';
      try {
        final settingsBox = await Hive.openBox('settings');
        langCode = settingsBox.get('language', defaultValue: 'ko');
      } catch (_) {}

      final msg = PushMessages.getRandomFortuneMessage(langCode);

      // 기존 notification_service의 show 함수를 직접 호출하거나, schedule 대신 show를 사용해야 함
      // NotificationService에 showFortuneNotification이 없으므로 새로 만들어야 할 수도 있음.
      // 일단 일반적인 방식으로 호출하기 위해 notificationService.flutterLocalNotificationsPlugin.show를 사용
      
      const String channelId = 'fortune_channel_v1';
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        channelId,
        'Fortune Alarms',
        importance: Importance.max,
        priority: Priority.max,
        category: AndroidNotificationCategory.reminder,
        visibility: NotificationVisibility.public,
        fullScreenIntent: false,
        autoCancel: true,
        groupKey: 'com.snapalarm.NOTIFICATION_GROUP',
      );

      const DarwinNotificationDetails iosPlatformChannelSpecifics =
          DarwinNotificationDetails(threadIdentifier: 'com.snapalarm.NOTIFICATION_GROUP');

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosPlatformChannelSpecifics,
      );

      await notificationService.flutterLocalNotificationsPlugin.show(
        id,
        msg['title']!,
        msg['body']!,
        platformChannelSpecifics,
        payload: 'fortune_daily_$id',
      );
    } else {
      debugPrint('[FortunePush] Fortune already viewed today ($todayStr). Skipping push.');
    }

    // 다음 날 같은 시간으로 재예약
    final now = DateTime.now();
    final nextTime = now.add(const Duration(days: 1));
    
    await AndroidAlarmManager.oneShotAt(
      nextTime,
      id,
      _fortunePushCallback,
      exact: true,
      wakeup: true,
      alarmClock: true,
      rescheduleOnReboot: true,
      allowWhileIdle: true,
    );
  }
}
