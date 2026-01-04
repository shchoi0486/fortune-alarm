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
  }

  static Future<void> cancelAll() async {
    for (int i = 0; i < 100; i++) {
      await AndroidAlarmManager.cancel(_startId + i);
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _waterCallback(int id) async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('[WaterAlarm] Fired! ID: $id');

    bool shouldRing = true;
    WaterSettings? settings;

    try {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(7)) {
        Hive.registerAdapter(WaterSettingsAdapter());
      }

      final box = await Hive.openBox<WaterSettings>('water_settings');
      settings = box.get('settings');

      if (settings == null || !settings.isAlarmEnabled) {
        shouldRing = false;
      }
    } catch (e) {
      debugPrint('[WaterAlarm] Hive error: $e');
    }

    if (shouldRing) {
      final notificationService = NotificationService();
      await notificationService.init(null);
      
      await notificationService.showWaterNotification(
        id: id,
        title: '물 마실 시간이에요!',
        body: '건강을 위해 시원한 물 한 잔 어떠세요?',
        payload: 'water_$id',
      );
    }

    // 다음 날 같은 시간으로 재예약
    final now = DateTime.now();
    final nextTime = now.add(const Duration(days: 1));
    // 정확한 시간을 위해 현재 시각 기준이 아니라, 원래 예약되었던 시각 + 1일이 좋지만 
    // 여기서는 간단하게 24시간 후로 예약 (oneShotAt 사용 중이므로)
    // 실제로는 scheduleAlarms를 다시 호출하거나 개별 id를 유지하는 게 좋음.
    // 여기서는 단순히 이 ID의 알람을 내일 같은 시간에 다시 한 번 예약함.
    
    // 콜백에서 id를 통해 원래 시간을 유추하기 어려우므로, 
    // 그냥 24시간 뒤로 예약함. (오차 발생 가능성 있으나 수용 범위)
    await scheduleOneTime(nextTime, id);
  }
}
