import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/models/alarm_model.dart';
import '../services/alarm_scheduler_service.dart';

final alarmListProvider = StateNotifierProvider<AlarmListNotifier, List<AlarmModel>>((ref) {
  return AlarmListNotifier();
});

class AlarmListNotifier extends StateNotifier<List<AlarmModel>> {
  AlarmListNotifier() : super([]) {
    _loadAlarms();
  }

  Future<void> _loadAlarms() async {
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      final alarms = box.values.where((a) => !a.id.endsWith('_snooze')).toList();
      alarms.sort((a, b) => a.time.compareTo(b.time));
      state = alarms;
    } catch (e) {
      debugPrint('Error loading alarms: $e');
    }
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    // 1. 먼저 Hive에 저장 (데이터 보존)
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      await box.put(alarm.id, alarm);
      await box.flush(); // 즉시 디스크 기록
    } catch (e) {
      debugPrint('Error saving alarm to Hive: $e');
    }

    // 2. State 업데이트
    state = [...state, alarm];
    state.sort((a, b) => a.time.compareTo(b.time));
    
    // 스케줄링은 화면 단에서 처리
  }

  Future<void> updateAlarm(AlarmModel alarm) async {
    // 1. 먼저 Hive 업데이트
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      await box.put(alarm.id, alarm);
      await box.flush(); // 즉시 디스크 기록
    } catch (e) {
      debugPrint('Error updating alarm in Hive: $e');
    }

    // 2. State 업데이트
    state = [
      for (final a in state)
        if (a.id == alarm.id) alarm else a
    ];
    state.sort((a, b) => a.time.compareTo(b.time));

    // 스케줄링은 화면 단에서 처리
  }

  Future<void> completeAlarm(String id) async {
    final String originalId = id.endsWith('_snooze') 
        ? id.substring(0, id.indexOf('_snooze')) 
        : id;
    
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      final alarm = box.get(originalId);
      
      if (alarm != null) {
        // 1. 모든 관련 스케줄링 취소 (반복 알람이면 메인 ID는 유지하고 스누즈만 취소)
        bool hasRepeat = alarm.repeatDays.any((day) => day);
        await AlarmSchedulerService.cancelAlarm(alarm, cancelMain: !hasRepeat);
        
        // 2. 반복 설정이 없는 알람이면 비활성화
        if (!hasRepeat) {
          final newAlarm = alarm.copyWith(isEnabled: false);
          await box.put(originalId, newAlarm);
          await box.flush();
          
          // UI 상태 업데이트
          state = [
            for (final a in state)
              if (a.id == originalId) newAlarm else a
          ];
          debugPrint('[AlarmListNotifier] One-time alarm disabled: $originalId');
        } else {
          debugPrint('[AlarmListNotifier] Repeating alarm kept enabled: $originalId');
        }
      }
    } catch (e) {
      debugPrint('[AlarmListNotifier] Error completing alarm: $e');
    }
  }

  Future<void> toggleAlarm(String id) async {
    final newState = <AlarmModel>[];
    for (final alarm in state) {
      if (alarm.id == id) {
        newState.add(await _toggle(alarm));
      } else {
        newState.add(alarm);
      }
    }
    state = newState;
  }

  Future<AlarmModel> _toggle(AlarmModel alarm) async {
    DateTime newTime = alarm.time;
    
    // 알람을 켜는 경우(!alarm.isEnabled)이고, 일회성 알람인 경우
    // 저장된 시간이 과거라면 다음 유효한 시간(오늘 남은 시간 또는 내일)으로 업데이트
    if (!alarm.isEnabled && !alarm.repeatDays.any((d) => d)) {
      final now = DateTime.now();
      if (alarm.time.isBefore(now)) {
        // 오늘 날짜의 같은 시간으로 설정
        DateTime targetTime = DateTime(
          now.year,
          now.month,
          now.day,
          alarm.time.hour,
          alarm.time.minute,
        );
        
        // 만약 오늘 날짜로 설정했을 때도 과거라면
        if (targetTime.isBefore(now)) {
          // 1분 이내의 과거라면 오늘로 유지 (즉시 실행)
          final diff = now.difference(targetTime);
          if (diff.inMinutes >= 1) {
             targetTime = targetTime.add(const Duration(days: 1));
          } else {
             debugPrint('[AlarmListNotifier] Toggle time is within 1 minute grace period. Keeping today for immediate alarm.');
          }
        }
        newTime = targetTime;
        debugPrint('[AlarmListNotifier] Updated past one-time alarm time to: $newTime');
      }
    }

    final newAlarm = AlarmModel(
      id: alarm.id,
      time: newTime,
      isEnabled: !alarm.isEnabled,
      missionType: alarm.missionType,
      label: alarm.label,
      referenceImagePaths: alarm.referenceImagePaths,
      repeatDays: alarm.repeatDays,
      isVibrationEnabled: alarm.isVibrationEnabled,
      isSoundEnabled: alarm.isSoundEnabled,
      volume: alarm.volume,
      ringtonePath: alarm.ringtonePath,
      vibrationPattern: alarm.vibrationPattern,
      isGradualVolume: alarm.isGradualVolume,
      backgroundPath: alarm.backgroundPath,
      snoozeInterval: alarm.snoozeInterval,
      maxSnoozeCount: alarm.maxSnoozeCount,
    );
    
    if (newAlarm.isEnabled) {
      try {
        await AlarmSchedulerService.scheduleAlarm(newAlarm);
      } catch (e) {
         debugPrint('Error scheduling alarm: $e');
      }
    } else {
      try {
        await AlarmSchedulerService.cancelAlarm(newAlarm);
      } catch (e) {
        debugPrint('Error canceling alarm: $e');
      }
    }
    
    // Hive 업데이트
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      await box.put(newAlarm.id, newAlarm);
    } catch (e) {
      debugPrint('Error updating toggle to Hive: $e');
    }
    
    return newAlarm;
  }
  
  void removeAlarm(String id) {
     final alarm = state.firstWhere((element) => element.id == id, orElse: () => AlarmModel(id: '', time: DateTime.now()));
     if(alarm.id.isNotEmpty) {
       AlarmSchedulerService.cancelAlarm(alarm);
       // Hive 삭제
       Hive.box<AlarmModel>('alarms').delete(id);
     }
     state = state.where((alarm) => alarm.id != id).toList();
  }

  void clearAllAlarms() {
    for (final alarm in state) {
      AlarmSchedulerService.cancelAlarm(alarm);
    }
    Hive.box<AlarmModel>('alarms').clear();
    state = [];
  }
}
