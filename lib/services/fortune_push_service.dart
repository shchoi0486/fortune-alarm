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

  /// `"HH:mm"` 문자열을 (hour, minute) 로 파싱한다. 형식이 잘못되었으면 null.
  static (int, int)? _parseHhMm(Object? value) {
    if (value is! String) return null;
    final parts = value.split(':');
    if (parts.length < 2) return null;
    final hour = int.tryParse(parts[0].trim());
    final minute = int.tryParse(parts[1].trim());
    if (hour == null || minute == null) return null;
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;
    return (hour, minute);
  }

  // 상황 기반 운세 푸시 알람 스케줄링
  static Future<void> scheduleDailyPush() async {
    // [P0-3] 앱 시작 시 자동으로 권한 창을 띄우지 않는다.
    // 예약 자체는 권한 상태와 무관하게 시도하고, 권한이 없으면 조용히 실패한다.
    if (Platform.isAndroid) {
      final exactStatus = await Permission.scheduleExactAlarm.status;
      if (!exactStatus.isGranted) {
        debugPrint('[FortunePush] SCHEDULE_EXACT_ALARM not granted ($exactStatus). Scheduling anyway.');
      }
    }

    final box = await Hive.openBox('alarm_settings');
    final enabled = box.get('daily_fortune_enabled', defaultValue: true);
    
    if (enabled) {
      // [푸시 빈도 축소] 하루 1회 오전만 발송 (과다 푸시 방지).
      // 사용자 설정 시간이 있으면 가져오고 없으면 기본값(08:00) 사용.
      final time1Str = box.get('daily_fortune_time1', defaultValue: '08:00');

      // 저장된 값이 손상되었을 수 있으므로 방어적으로 파싱한다.
      // (이전 구현은 예외가 밖으로 전파되어 호출부 초기화 블록 전체를 중단시켰다)
      final time1 = _parseHhMm(time1Str);
      if (time1 == null) {
        debugPrint('[FortunePush] Invalid daily_fortune_time1: $time1Str. Using 08:00.');
      }

      await _scheduleOne(time1?.$1 ?? 8, time1?.$2 ?? 0, _morningId);

      // 기존 버전에서 예약된 점심/오후 푸시가 남아있으면 정리
      if (Platform.isAndroid) {
        await AndroidAlarmManager.cancel(_lunchId);
        await AndroidAlarmManager.cancel(_afternoonId);
      } else if (Platform.isIOS) {
        await NotificationService().cancelNotification(_lunchId);
        await NotificationService().cancelNotification(_afternoonId);
      }
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
      
      final msg = PushMessages.getRandomMorningMessage(langCode);

      await NotificationService().scheduleAlarmNotification(
        id: id,
        title: msg['title']!,
        body: msg['body']!,
        scheduledDate: scheduledTime,
        payload: 'fortune_daily_$id',
        // iOS 는 재예약 콜백이 AndroidAlarmManager 전용이라 OS 반복에 의존해야 한다.
        repeatDaily: true,
      );
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _fortunePushCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[FortunePush] Fired! ID: $id');

    final notificationService = NotificationService();
    
    // getL10n()을 호출하여 Hive 초기화 및 언어 설정 로드 보장
    final l10n = await notificationService.getL10n();
    
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
      if (!['ko', 'en', 'ja', 'zh', 'th', 'ru', 'hi', 'fr', 'es', 'de'].contains(langCode)) {
        langCode = 'en';
      }
      debugPrint('[FortunePush] Final langCode for push: $langCode');

      final msg = PushMessages.getRandomMorningMessage(langCode);

      // 기존 notification_service의 show 함수를 직접 호출하거나, schedule 대신 show를 사용해야 함
      // NotificationService에 showFortuneNotification이 없으므로 새로 만들어야 할 수도 있음.
      // 일단 일반적인 방식으로 호출하기 위해 notificationService.flutterLocalNotificationsPlugin.show를 사용
      
      const String channelId = 'fortune_channel_v1';
      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        channelId,
        l10n.fortuneChannelName,
        importance: Importance.max,
        priority: Priority.max,
        category: AndroidNotificationCategory.reminder,
        visibility: NotificationVisibility.public,
        fullScreenIntent: false,
        autoCancel: true,
        groupKey: 'com.fortunealarm.NOTIFICATION_GROUP',
      );

      const DarwinNotificationDetails iosPlatformChannelSpecifics =
          DarwinNotificationDetails(threadIdentifier: 'com.fortunealarm.NOTIFICATION_GROUP');

      final NotificationDetails platformChannelSpecifics = NotificationDetails(
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

    // 다음 날 같은 시간으로 재예약 (랜덤 지터 포함) — 오전 1회만 유지
    final boxSettings = await Hive.openBox('alarm_settings');
    final String baseTimeStr =
        boxSettings.get('daily_fortune_time1', defaultValue: '08:00');

    final parsedBase = _parseHhMm(baseTimeStr);
    final hour = parsedBase?.$1 ?? 8;
    final minute = parsedBase?.$2 ?? 0;

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
