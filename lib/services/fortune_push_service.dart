import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:math';

import 'notification_service.dart';
import '../core/constants/push_messages.dart';

@pragma('vm:entry-point')
class FortunePushService {
  static const int _morningId = 40001;
  static const int _afternoonId = 40002;
  static const int _lunchId = 40003;

  // 상황 기반 운세 푸시 알람 스케줄링
  static Future<void> scheduleDailyPush() async {
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await Permission.scheduleExactAlarm.request();
      }
    }

    final box = await Hive.openBox('alarm_settings');
    final enabled = box.get('daily_fortune_enabled', defaultValue: true);
    
    if (enabled) {
      // 세 타임라인 스케줄링 (오전, 점심, 오후)
      // 사용자 설정 시간이 있으면 가져오고 없으면 기본값 사용
      final time1Str = box.get('daily_fortune_time1', defaultValue: '08:00');
      final time2Str = box.get('daily_fortune_time2', defaultValue: '13:30');
      
      final parts1 = time1Str.split(':');
      final parts2 = time2Str.split(':');
      
      await _scheduleOne(int.parse(parts1[0]), int.parse(parts1[1]), _morningId);
      await _scheduleOne(12, 30, _lunchId);
      await _scheduleOne(int.parse(parts2[0]), int.parse(parts2[1]), _afternoonId);
    } else {
      await cancelAll();
    }
  }

  // 알람 취소
  static Future<void> cancelAll() async {
    if (Platform.isAndroid) {
      await AndroidAlarmManager.cancel(_morningId);
      await AndroidAlarmManager.cancel(_afternoonId);
      await AndroidAlarmManager.cancel(_lunchId);
    } else if (Platform.isIOS) {
      await NotificationService().cancelNotification(_morningId);
      await NotificationService().cancelNotification(_afternoonId);
      await NotificationService().cancelNotification(_lunchId);
    }
    debugPrint('[FortunePush] Canceled all fortune push alarms.');
  }

  static Future<void> _scheduleOne(int hour, int minute, int id) async {
    final now = DateTime.now();
    var baseTime = DateTime(now.year, now.month, now.day, hour, minute);

    if (baseTime.isBefore(now)) {
      baseTime = baseTime.add(const Duration(days: 1));
    }

    // 0~45분 사이의 랜덤 지터를 추가하여 기계적인 느낌을 줄임 (사용자 요청 반영)
    final random = Random();
    final jitter = random.nextInt(46); 
    final scheduledTime = baseTime.add(Duration(minutes: jitter));

    debugPrint('[FortunePush] Scheduling ID $id at $scheduledTime (Base: $hour:$minute, Jitter: +$jitter min)');

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
      // iOS는 NotificationService를 통해 스케줄링 (단일 예약)
      // 메시지는 예약 시점에 랜덤으로 하나 뽑음
      String langCode = 'ko';
      try {
        final settingsBox = await Hive.openBox('settings');
        langCode = settingsBox.get('language', defaultValue: 'ko');
      } catch (_) {}
      
      final msg = PushMessages.getRandomFortuneMessage(langCode);

      await NotificationService().scheduleAlarmNotification(
        id: id,
        title: msg['title']!,
        body: msg['body']!,
        scheduledDate: scheduledTime,
        payload: 'fortune_daily_$id',
      );
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _fortunePushCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[FortunePush] Fired! ID: $id');

    final notificationService = NotificationService();
    
    // getL10n()을 호출하여 Hive 초기화 및 언어 설정 로드 보장
    // (L10n 객체 자체는 여기서 안 써도 되지만 초기화를 위해 호출)
    await notificationService.getL10n();
    
    // 오늘 날짜 문자열
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    // 상태 확인
    final box = await Hive.openBox('user_activity');
    final lastFortuneViewDate = box.get('last_fortune_view_date', defaultValue: '');
    
    if (lastFortuneViewDate != todayStr) {
      await notificationService.init(null);

      // 2. 언어 설정 가져오기 (시스템 언어를 기본값으로)
      String langCode = Platform.localeName.split('_')[0];
      try {
        final settingsBox = await Hive.openBox('settings');
        final savedLang = settingsBox.get('language');
        if (savedLang != null && savedLang.isNotEmpty) {
          langCode = savedLang;
          debugPrint('[FortunePush] Found saved language in Hive: $langCode');
        }
      } catch (e) {
        debugPrint('[FortunePush] Error reading settings box: $e');
      }

      // 지원하지 않는 언어일 경우 영어로 폴백
      if (!['ko', 'en', 'ja', 'zh', 'ru', 'hi', 'fr', 'es', 'de'].contains(langCode)) {
        langCode = 'en';
      }
      debugPrint('[FortunePush] Final langCode for push: $langCode');

      final msg = PushMessages.getRandomFortuneMessage(langCode);

      // 기존 notification_service의 show 함수를 직접 호출하거나, schedule 대신 show를 사용해야 함
      // NotificationService에 showFortuneNotification이 없으므로 새로 만들어야 할 수도 있음.
      // 일단 일반적인 방식으로 호출하기 위해 notificationService.flutterLocalNotificationsPlugin.show를 사용
      
      const String channelId = 'fortune_channel_v1';
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        channelId,
        '포춘 알람',
        importance: Importance.max,
        priority: Priority.max,
        category: AndroidNotificationCategory.reminder,
        visibility: NotificationVisibility.public,
        fullScreenIntent: false,
        autoCancel: true,
        groupKey: 'com.fortune_alarm.NOTIFICATION_GROUP',
      );

      const DarwinNotificationDetails iosPlatformChannelSpecifics =
          DarwinNotificationDetails(threadIdentifier: 'com.fortunealarm.NOTIFICATION_GROUP');

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

    // 다음 날 같은 시간으로 재예약 (랜덤 지터 포함)
    final boxSettings = await Hive.openBox('alarm_settings');
    String baseTimeStr = '12:30';
    if (id == _morningId) baseTimeStr = boxSettings.get('daily_fortune_time1', defaultValue: '08:00');
    else if (id == _afternoonId) baseTimeStr = boxSettings.get('daily_fortune_time2', defaultValue: '13:30');
    
    final parts = baseTimeStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    
    final nextDay = DateTime.now().add(const Duration(days: 1));
    var nextBaseTime = DateTime(nextDay.year, nextDay.month, nextDay.day, hour, minute);
    
    final random = Random();
    final jitter = random.nextInt(46); 
    final nextScheduledTime = nextBaseTime.add(Duration(minutes: jitter));

    await AndroidAlarmManager.oneShotAt(
      nextScheduledTime,
      id,
      _fortunePushCallback,
      exact: true,
      wakeup: true,
      alarmClock: true,
      rescheduleOnReboot: true,
      allowWhileIdle: true,
    );
    debugPrint('[FortunePush] Rescheduled ID $id for tomorrow at $nextScheduledTime');
  }
}
