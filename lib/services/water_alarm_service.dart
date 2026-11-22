import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'notification_service.dart';
import '../features/mission/water/models/water_settings.dart';

@pragma('vm:entry-point')
class WaterAlarmService {
  static const int _startId = 20000; // 물 마시기 알람 ID 시작점

  // 알람 스케줄링
  static Future<void> scheduleAlarms(WaterSettings settings) async {
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await Permission.scheduleExactAlarm.request();
      }
      if (await Permission.ignoreBatteryOptimizations.isDenied) {
        await Permission.ignoreBatteryOptimizations.request();
      }
    }

    // 기존 알람 취소
    await cancelAll();

    if (!settings.isAlarmEnabled) return;

    final now = DateTime.now();
    final startTimeParts = settings.startTime.split(':');
    final endTimeParts = settings.endTime.split(':');
    
    final startHour = int.parse(startTimeParts[0]);
    final startMinute = int.parse(startTimeParts[1]);
    final endHour = int.parse(endTimeParts[0]);
    final endMinute = int.parse(endTimeParts[1]);

    DateTime startTime = DateTime(now.year, now.month, now.day, startHour, startMinute);
    DateTime endTime = DateTime(now.year, now.month, now.day, endHour, endMinute);

    // 종료 시간이 시작 시간보다 빠르면 다음 날로 설정 (예: 22:00 ~ 08:00)
    if (endTime.isBefore(startTime)) {
      endTime = endTime.add(const Duration(days: 1));
    }

    int interval = settings.intervalMinutes;
    if (interval <= 0) interval = 60;

    int idOffset = 0;
    DateTime currentSchedule = startTime;

    while (currentSchedule.isBefore(endTime) || currentSchedule.isAtSameMomentAs(endTime)) {
      // 현재 시간보다 이전이면 내일로 설정할 필요 없이 오늘 이미 지난 시간은 스킵하고 내일부터 시작하게 하거나,
      // 혹은 단순히 현재 시간 이후의 첫 타임부터 잡음.
      // 여기서는 오늘 남은 시간들 + 내일 전체 시간을 예약하는 대신, 
      // 매번 "오늘의 스케줄"을 잡고 콜백에서 내일 걸 예약하는 방식이 더 안정적임.
      
      if (currentSchedule.isAfter(now)) {
        final id = _startId + idOffset;
        await scheduleOneTime(currentSchedule, id);
        idOffset++;
      } else {
        // 이미 지난 시간은 내일로 예약
        final id = _startId + idOffset;
        await scheduleOneTime(currentSchedule.add(const Duration(days: 1)), id);
        idOffset++;
      }

      currentSchedule = currentSchedule.add(Duration(minutes: interval));
      if (idOffset >= 100) break; // 최대 100개까지만 (안전장치)
    }
  }

  static Future<bool> scheduleOneTime(DateTime time, int id) async {
    debugPrint('[WaterAlarm] Scheduling at $time (ID: $id)');
    
    if (Platform.isAndroid) {
      return await AndroidAlarmManager.oneShotAt(
        time,
        id,
        _waterCallback,
        exact: true,
        wakeup: true,
        alarmClock: true,
        rescheduleOnReboot: true,
        allowWhileIdle: true,
      );
    } else if (Platform.isIOS) {
      try {
        final notificationService = NotificationService();
        final l10n = await notificationService.getL10n();
        await notificationService.scheduleAlarmNotification(
          id: id,
          title: l10n.waterAlarmTitle,
          body: l10n.waterAlarmBody,
          scheduledDate: time,
          payload: 'water_$id',
        );
        return true;
      } catch (e) {
        debugPrint('[WaterAlarm] iOS scheduling failed: $e');
        return false;
      }
    }
    return false;
  }

  static Future<void> cancelAll() async {
    final notificationService = NotificationService();
    for (int i = 0; i < 100; i++) {
      if (Platform.isAndroid) {
        await AndroidAlarmManager.cancel(_startId + i);
      } else if (Platform.isIOS) {
        await notificationService.cancelNotification(_startId + i);
      }
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _waterCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[WaterAlarm] Fired! ID: $id');

    bool shouldRing = true;
    WaterSettings? settings;

    final notificationService = NotificationService();
    
    try {
      // getL10n()을 호출하여 Hive 초기화 및 언어 설정 로드 보장
      await notificationService.getL10n();

      final box = await Hive.openBox<WaterSettings>('water_settings');
      settings = box.get('settings');

      if (settings == null || !settings.isAlarmEnabled) {
        shouldRing = false;
      }
    } catch (e) {
      debugPrint('[WaterAlarm] Hive error: $e');
    }

    if (shouldRing) {
      await notificationService.init(null);
      final l10n = await notificationService.getL10n();
      
      await notificationService.showWaterNotification(
        id: id,
        title: l10n.waterAlarmTitle,
        body: l10n.waterAlarmBody,
        payload: 'water_$id',
      );
    }

    // 다음 날 같은 시간으로 재예약.
    // 사용자가 알람을 끄거나 settings 가 사라진 경우(shouldRing == false)에는
    // 재예약하지 않는다. 이전 구현은 무조건 재예약해서, 알람이 잠든 상태로
    // 영원히 다시 울릴 수 있는 '불멸 알람'이 됐다.
    if (shouldRing) {
      final now = DateTime.now();
      final nextTime = now.add(const Duration(days: 1));
      await scheduleOneTime(nextTime, id);
    }
  }
}
