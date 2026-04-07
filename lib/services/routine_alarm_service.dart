import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'notification_service.dart';
import '../core/constants/push_messages.dart';

@pragma('vm:entry-point')
class RoutineAlarmService {
  static const int _eveningId = 30002;

  // 데일리 루틴 알람 스케줄링 (상황 기반: 매일 저녁 8시 30분)
  static Future<void> scheduleDailyReminders() async {
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await Permission.scheduleExactAlarm.request();
      }
    }

    // 오후 8시 30분 알림 1회만 등록
    await _scheduleOne(20, 30, _eveningId, 'evening');
  }

  // 알람 취소
  static Future<void> cancelAll() async {
    if (Platform.isAndroid) {
      await AndroidAlarmManager.cancel(_eveningId);
      await AndroidAlarmManager.cancel(30001); // 기존 아침 알람 취소
    } else if (Platform.isIOS) {
      await NotificationService().cancelNotification(_eveningId);
      await NotificationService().cancelNotification(30001);
    }
    debugPrint('[RoutineAlarm] Canceled all routine alarms.');
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
      final msg = PushMessages.getRandomRoutineMessage();

      await NotificationService().scheduleAlarmNotification(
        id: id,
        title: msg['title']!,
        body: msg['body']!,
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
    
    // getL10n()을 호출하여 Hive 초기화 및 언어 설정 로드 보장
    await notificationService.getL10n();
    
    // 오늘 날짜 문자열
    final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    // 상태 확인
    final box = await Hive.openBox('user_activity');
    final lastRoutineCheckDate = box.get('last_routine_check_date', defaultValue: '');
    
    if (lastRoutineCheckDate != todayStr) {
      await notificationService.init(null);
      
      // 2. 언어 설정 가져오기 (시스템 언어를 기본값으로)
      String langCode = Platform.localeName.split('_')[0];
      try {
        final settingsBox = await Hive.openBox('settings');
        final savedLang = settingsBox.get('language');
        if (savedLang != null && savedLang.isNotEmpty) {
          langCode = savedLang;
          debugPrint('[RoutineAlarm] Found saved language in Hive: $langCode');
        }
      } catch (e) {
        debugPrint('[RoutineAlarm] Error reading settings box: $e');
      }

      // 지원하지 않는 언어일 경우 영어로 폴백
      if (!['ko', 'en', 'ja', 'zh', 'ru', 'hi', 'fr', 'es', 'de'].contains(langCode)) {
        langCode = 'en';
      }
      debugPrint('[RoutineAlarm] Final langCode for push: $langCode');

      final msg = PushMessages.getRandomRoutineMessage(langCode);
            await notificationService.showRoutineNotification(
        id: id,
        title: msg['title']!,
        body: msg['body']!,
        payload: 'routine_daily',
      );
    } else {
      debugPrint('[RoutineAlarm] Routine already checked today ($todayStr). Skipping push.');
    }

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
