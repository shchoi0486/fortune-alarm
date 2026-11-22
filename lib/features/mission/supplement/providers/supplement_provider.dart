import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../models/supplement_log.dart';
import '../models/supplement_settings.dart';
import '../../../../providers/mission_provider.dart';
import '../../../../services/supplement_alarm_service.dart';

class SupplementState {
  final SupplementLog log;
  final SupplementSettings settings;
  final bool isLoading;
  final bool isGoalAchieved;

  SupplementState({
    required this.log,
    required this.settings,
    this.isLoading = false,
    bool? isGoalAchieved,
  }) : isGoalAchieved = isGoalAchieved ?? log.isGoalAchieved;

  SupplementState copyWith({
    SupplementLog? log,
    SupplementSettings? settings,
    bool? isLoading,
    bool? isGoalAchieved,
  }) {
    return SupplementState(
      log: log ?? this.log,
      settings: settings ?? this.settings,
      isLoading: isLoading ?? this.isLoading,
      isGoalAchieved: isGoalAchieved ?? (log ?? this.log).isGoalAchieved,
    );
  }
}

final supplementProvider = StateNotifierProvider<SupplementNotifier, SupplementState>((ref) {
  return SupplementNotifier(ref);
});

class SupplementNotifier extends StateNotifier<SupplementState> {
  final Ref _ref;
  Box<SupplementLog>? _logBox;
  Box<SupplementSettings>? _settingsBox;

  SupplementNotifier(this._ref)
      : super(SupplementState(
          log: SupplementLog(dateKey: DateFormat('yyyy-MM-dd').format(DateTime.now())),
          settings: SupplementSettings(),
          isLoading: true,
        )) {
    _init();
  }

  Future<void> _init() async {
    try {
      // Adapter Registration Check
      if (!Hive.isAdapterRegistered(8)) {
        Hive.registerAdapter(SupplementLogAdapter());
      }
      if (!Hive.isAdapterRegistered(9)) {
        Hive.registerAdapter(SupplementSettingsAdapter());
      }

      // Box Opening Optimization
      if (Hive.isBoxOpen('supplement_logs')) {
        _logBox = Hive.box<SupplementLog>('supplement_logs');
      } else {
        _logBox = await Hive.openBox<SupplementLog>('supplement_logs');
      }

      if (Hive.isBoxOpen('supplement_settings')) {
        _settingsBox = Hive.box<SupplementSettings>('supplement_settings');
      } else {
        _settingsBox = await Hive.openBox<SupplementSettings>('supplement_settings');
      }

      final todayKey = DateFormat('yyyy-MM-dd').format(DateTime.now());
      
      SupplementLog? log = _logBox!.get(todayKey);
      if (log == null) {
        log = SupplementLog(dateKey: todayKey);
        await _logBox!.put(todayKey, log);
      }

      SupplementSettings? settings = _settingsBox!.get('settings');
      if (settings == null) {
        settings = SupplementSettings();
        await _settingsBox!.put('settings', settings);
      }

      state = SupplementState(log: log, settings: settings, isLoading: false);

      // 초기화 시 미션 상태 동기화
      _syncSupplementMissionStatus(log.isGoalAchieved);
    } catch (e) {
      print('Error initializing SupplementNotifier: $e');
      // 에러 발생 시 기본값으로 초기화하여 로딩 상태 해제
      state = SupplementState(
        log: SupplementLog(dateKey: DateFormat('yyyy-MM-dd').format(DateTime.now())),
        settings: SupplementSettings(),
        isLoading: false,
      );
    }
  }

  Future<void> updateSettings({
    int? dailyGoal,
    bool? isAlarmEnabled,
    List<String>? reminderTimes,
    int? defaultSnoozeInterval,
    String? ringtonePath,
    double? volume,
  }) async {
    if (state.isLoading) return;

    // Ensure box is open
    if (_settingsBox == null || !_settingsBox!.isOpen) {
      try {
        _settingsBox = await Hive.openBox<SupplementSettings>('supplement_settings');
      } catch (e) {
        print('Error opening settings box in updateSettings: $e');
      }
    }

    List<String>? newReminderTimes = reminderTimes;

    // 목표 횟수가 변경되었고, 구체적인 알람 시간이 제공되지 않았다면
    // 기존 시간을 보존하면서 개수만 맞춘다.
    if (dailyGoal != null && reminderTimes == null) {
      if (dailyGoal != state.settings.dailyGoal) {
        newReminderTimes = _resizeReminderTimes(state.settings.reminderTimes, dailyGoal);
      }
    }

    final newSettings = state.settings.copyWith(
      dailyGoal: dailyGoal,
      isAlarmEnabled: isAlarmEnabled,
      reminderTimes: newReminderTimes,
      defaultSnoozeInterval: defaultSnoozeInterval,
      ringtonePath: ringtonePath,
      volume: volume,
    );

    // Save to Hive if possible
    if (_settingsBox != null && _settingsBox!.isOpen) {
      try {
        await _settingsBox!.put('settings', newSettings);
      } catch (e) {
        print('Error saving settings to Hive: $e');
      }
    }

    state = state.copyWith(settings: newSettings);
    
    // 알람 스케줄링 업데이트 (알람 여부나 시간이 변경된 경우에만)
    if (isAlarmEnabled != null || reminderTimes != null || dailyGoal != null) {
      try {
        if (newSettings.isAlarmEnabled) {
           await SupplementAlarmService.scheduleAlarms(newSettings.reminderTimes);
        } else {
           await SupplementAlarmService.cancelAll();
        }
      } catch (e) {
        print('Error scheduling alarms: $e');
      }
    }
    
    // 목표 수치가 변경되었으면 달성 여부 재확인
    if (dailyGoal != null) {
      await _enqueue(() => updateCount(state.log.currentCount));
    }
  }

  /// goal 개 분량의 기본 알람 시간. 최대 10개까지 확장 가능.
  List<String> _getDefaultTimes(int goal) {
    const defaults = [
      '07:30', '12:30', '19:30', '21:00', '10:00', '15:00', '22:00', '08:00', '18:00', '20:00',
    ];
    return defaults.sublist(0, goal.clamp(1, defaults.length));
  }

  /// 목표 변경 시 기존 사용자 설정 시간을 최대한 보존하면서 개수를 맞춘다.
  ///
  /// 이전 구현은 목표가 바뀌면 사용자 지정 시간을 기본값으로 통째로 덮어써서
  /// SupplementAlarmScreen 에서 설정한 시간이 조용히 사라졌다.
  List<String> _resizeReminderTimes(List<String> existing, int goal) {
    if (existing.length > goal) {
      return existing.sublist(0, goal);
    }
    if (existing.length < goal) {
      final defaults = _getDefaultTimes(goal);
      // 뒤쪽을 기본값으로 채운다. 단, 이미 있는 시간대는 건너뛴다.
      final extras = defaults.where((d) => !existing.contains(d)).toList();
      final need = goal - existing.length;
      return [...existing, ...extras.take(need)];
    }
    return List<String>.from(existing);
  }

  /// 연속 탭(따닥) 으로 인한 read-modify-write 경합을 직렬화한다.
  Future<void> _countQueue = Future<void>.value();

  Future<void> _enqueue(Future<void> Function() action) {
    final result = _countQueue.then((_) => action());
    _countQueue = result.then<void>((_) {}, onError: (Object _, StackTrace __) {});
    return result;
  }

  Future<void> takeSupplement() => _enqueue(() async {
        await _rollOverIfDayChanged();
        final newCount = state.log.currentCount + 1;
        await updateCount(newCount);
      });

  Future<void> removeSupplement() => _enqueue(() async {
        await _rollOverIfDayChanged();
        final newCount = (state.log.currentCount - 1).clamp(0, 99);
        await updateCount(newCount);
      });

  Future<void> resetCount() => _enqueue(() async {
        await _rollOverIfDayChanged();
        await updateCount(0);
      });

  static String _todayKey() => DateFormat('yyyy-MM-dd').format(DateTime.now());

  /// 앱이 살아있는 상태로 자정을 넘길 수 있으므로, 기록 직전에 날짜를 확인한다.
  ///
  /// 이전 구현은 [_init] 에서 계산한 dateKey 를 영원히 재사용해서,
  /// 00:05 에 먹은 영양제가 **어제** 기록에 쌓였다.
  Future<bool> _rollOverIfDayChanged() async {
    final todayKey = _todayKey();
    if (state.log.dateKey == todayKey) return false;

    final created = SupplementLog(dateKey: todayKey);
    if (_logBox != null) {
      await _logBox!.put(todayKey, created);
    }
    state = state.copyWith(log: created, isGoalAchieved: false);
    await _syncSupplementMissionStatus(false);
    print('[Supplement] Day rolled over to $todayKey');
    return true;
  }

  Future<void> updateCount(int count) async {
    if (state.isLoading) return;

    await _rollOverIfDayChanged();

    final dailyGoal = state.settings.dailyGoal;
    final isAchieved = count >= dailyGoal;
    
    // Create a new log object to avoid mutating the current state object directly
    final newLog = SupplementLog(
      dateKey: state.log.dateKey,
      currentCount: count,
      isGoalAchieved: isAchieved,
    );
    
    // Save to Hive
    if (_logBox != null) {
      await _logBox!.put(newLog.dateKey, newLog);
    }
    
    state = state.copyWith(
      log: newLog,
      isGoalAchieved: isAchieved,
    );

    // Sync with MissionProvider
    await _syncSupplementMissionStatus(isAchieved);
  }

  Future<void> _syncSupplementMissionStatus(bool isAchieved) async {
    final missionNotifier = _ref.read(missionProvider);
    try {
      // 1. Find the actual mission ID from the current mission list.
      String targetId = 'supplement';
      
      final missions = missionNotifier.missions;
      final hasFixedId = missions.any((m) => m.id == 'supplement');
      
      if (!hasFixedId) {
        // If 'supplement' ID doesn't exist, try to find by title.
        try {
          final mission = missions.firstWhere(
            (m) => m.title.contains('영양제'),
          );
          targetId = mission.id;
        } catch (_) {
          // Stay with 'supplement'
        }
      }

      await missionNotifier.setMissionCompleted(targetId, isAchieved);
      print('Syncing supplement mission status: $targetId -> $isAchieved');
    } catch (e) {
      print('Error syncing supplement mission status: $e');
    }
  }
}
