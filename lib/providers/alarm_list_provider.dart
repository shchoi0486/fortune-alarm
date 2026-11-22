import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/models/alarm_model.dart';
import '../services/alarm_scheduler_service.dart';

final alarmListProvider = StateNotifierProvider<AlarmListNotifier, List<AlarmModel>>((ref) {
  return AlarmListNotifier();
});

class AlarmListNotifier extends StateNotifier<List<AlarmModel>> {
  StreamSubscription<BoxEvent>? _boxSubscription;

  /// 연속 토글을 직렬화하기 위한 체인.
  /// 이전에는 in-flight 가드가 없어 두 번의 빠른 탭이 같은 stale isEnabled 를 보고
  /// 모두 `true` 를 만들어, 최종 상태가 뒤집히고 OS 에는 알람이 하나만 남았다.
  Future<void> _toggleQueue = Future<void>.value();

  AlarmListNotifier() : super([]) {
    _loadAlarms();
  }

  @override
  void dispose() {
    _boxSubscription?.cancel();
    super.dispose();
  }

  Future<void> deleteAlarm(AlarmModel alarm) async {
    try {
      // OS 스케줄/노티를 먼저 취소해야 유령 울림이 남지 않는다.
      try {
        await AlarmSchedulerService.cancelAlarm(alarm, cancelMain: true, cancelSnooze: true);
      } catch (_) {}
      try {
        await AlarmSchedulerService.cancelSafetyAlarm(alarm.id);
      } catch (_) {}
      final box = await Hive.openBox<AlarmModel>('alarms');
      await box.delete(alarm.id);
      await box.flush();
      
      state = state.where((a) => a.id != alarm.id).toList();
    } catch (e) {
      debugPrint('Error deleting alarm from Hive: $e');
    }
  }

  Future<void> _loadAlarms() async {
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      _readIntoState(box);

      // 알람의 time/isEnabled 는 백그라운드 아이솔레이트와 알람 완료 처리에서
      // 박스 밖에서 갱신된다. 그 결과 state 는 영구히 낡아
      // "다음 알람" 카운트다운과 반복 알람 표시 시간이 틀어진다.
      _boxSubscription ??= box.watch().listen((_) => _readIntoState(box));
    } catch (e) {
      debugPrint('Error loading alarms: $e');
    }
  }

  /// 박스의 현재 내용을 (안전하게) state 에 반영한다.
  void _readIntoState(Box<AlarmModel> box) {
    if (!mounted) return;
    try {
      final alarms = box.values
          .where((a) => !a.id.endsWith('_snooze') && !a.id.endsWith('_safety'))
          .toList();
      alarms.sort((a, b) {
        // 시간순 정렬 (시, 분만 비교, 동점 시 ID)
        if (a.time.hour != b.time.hour) {
          return a.time.hour.compareTo(b.time.hour);
        }
        if (a.time.minute != b.time.minute) {
          return a.time.minute.compareTo(b.time.minute);
        }
        return a.id.compareTo(b.id);
      });
      state = alarms;
    } catch (e) {
      debugPrint('Error reading alarms from box: $e');
    }
  }

  /// 시간순 정렬 (시/분 동점 시 ID로 tiebreak — Dismissible 키 안정성)
  void _sortState() {
    state = [...state]..sort((a, b) {
      if (a.time.hour != b.time.hour) {
        return a.time.hour.compareTo(b.time.hour);
      }
      if (a.time.minute != b.time.minute) {
        return a.time.minute.compareTo(b.time.minute);
      }
      return a.id.compareTo(b.id);
    });
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

    // 2. State 업데이트 (같은 ID가 있으면 교체 — 연타 중복 생성 방지)
    state = [...state.where((a) => a.id != alarm.id), alarm];
    _sortState();
    
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
    _sortState();

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

  /// 알람 활성/비활성 토글.
  ///
  /// [_toggle] 은 `scheduleAlarm` 을 await 하는 동안 OS 권한 요청
  /// (배터리 최적화 해제 등)을 띄울 수 있어 수백 ms~수 초가 걸린다.
  /// 그동안 `state` 가 갱신되지 않으므로, 요청을 직렬화하고
  /// 먼저 [_readIntoState] 로 최신 상태를 읽은 뒤 그 값 기준으로 토글한다.
  Future<void> toggleAlarm(String id) {
    final result = _toggleQueue.then((_) => _toggleAlarm(id));
    _toggleQueue = result.then<void>((_) {}, onError: (Object _, StackTrace __) {});
    return result;
  }

  Future<void> _toggleAlarm(String id) async {
    if (!mounted) return;

    // 대기 중 다른 곳에서 박스가 갱신되었을 수 있으므로 최신 값으로 동기화한다.
    final box = Hive.isBoxOpen('alarms') ? Hive.box<AlarmModel>('alarms') : null;
    if (box != null) {
      _readIntoState(box);
    }

    final target = state.where((a) => a.id == id).firstOrNull;
    if (target == null) return;

    final newState = <AlarmModel>[];
    for (final alarm in state) {
      if (alarm.id == id) {
        newState.add(await _toggle(alarm));
      } else {
        newState.add(alarm);
      }
    }
    if (!mounted) return;
    state = newState;
    _sortState();
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
          // 과거 시간이면 즉시 실행을 시도하지 않고 다음 유효 시각으로 이동시켜
          // 토글 직후 예약 실패로 빠지는 케이스를 방지합니다.
          targetTime = targetTime.add(const Duration(days: 1));
        }
        newTime = targetTime;
        debugPrint('[AlarmListNotifier] Updated past one-time alarm time to: $newTime');
      }
    }

    // 반복 알람을 켜는데 저장된 시간이 과거라면 다음 회차로 갱신
    // (안 그러면 스케줄러 과거 가드에 걸려 켜진 채 등록 실패 = 유령 알람)
    if (!alarm.isEnabled && alarm.repeatDays.any((d) => d)) {
      final now = DateTime.now();
      if (alarm.time.isBefore(now)) {
        newTime = AlarmSchedulerService.calculateNextTime(alarm.time, alarm.repeatDays);
        debugPrint('[AlarmListNotifier] Updated stale repeating alarm time to: $newTime');
      }
    }

    final newAlarm = alarm.copyWith(
      id: alarm.id,
      time: newTime,
      isEnabled: !alarm.isEnabled,
    );
    
    if (newAlarm.isEnabled) {
      bool scheduled = false;
      try {
        scheduled = await AlarmSchedulerService.scheduleAlarm(newAlarm);
      } catch (e) {
         debugPrint('Error scheduling alarm: $e');
      }
      if (!scheduled) {
        // 등록 실패했는데 켜진 채로 두면 유령 알람이 된다. 다시 끈 상태로 저장.
        debugPrint('[AlarmListNotifier] Schedule failed on toggle-on. Keeping disabled.');
        final disabledAlarm = newAlarm.copyWith(isEnabled: false);
        try {
          final box = await Hive.openBox<AlarmModel>('alarms');
          await box.put(disabledAlarm.id, disabledAlarm);
          await box.flush();
        } catch (e) {
          debugPrint('Error persisting toggle-off to Hive: $e');
        }
        return disabledAlarm;
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
  
  Future<void> removeAlarm(String id) async {
     final alarm = state.firstWhere((element) => element.id == id, orElse: () => AlarmModel(id: '', time: DateTime.now()));
     if(alarm.id.isNotEmpty) {
       try {
         await AlarmSchedulerService.cancelAlarm(alarm);
       } catch (_) {}
       try {
         final box = await Hive.openBox<AlarmModel>('alarms');
         await box.delete(id);
         await box.flush();
       } catch (_) {}
     }
     state = state.where((alarm) => alarm.id != id).toList();
  }

  Future<void> clearAllAlarms() async {
    // state는 _snooze/_safety를 필터링하므로 Hive 전체를 순회해야 고아가 남지 않는다.
    try {
      final box = await Hive.openBox<AlarmModel>('alarms');
      for (final alarm in box.values.toList()) {
        try {
          await AlarmSchedulerService.cancelAlarm(alarm);
        } catch (_) {}
        try {
          await AlarmSchedulerService.cancelSafetyAlarm(alarm.id);
        } catch (_) {}
      }
      await box.clear();
      await box.flush();
    } catch (_) {}
    state = [];
  }
}
