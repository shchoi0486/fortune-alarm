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

    // 목표 횟수가 변경되었고, 구체적인 알람 시간이 제공되지 않았다면 자동으로 시간 설정
    if (dailyGoal != null && reminderTimes == null) {
      if (dailyGoal != state.settings.dailyGoal) {
        newReminderTimes = _getDefaultTimes(dailyGoal);
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
      await updateCount(state.log.currentCount);
    }
  }

  List<String> _getDefaultTimes(int goal) {
    switch (goal) {
      case 1: return ["07:30"];
      case 2: return ["07:30", "12:30"];
      case 3: return ["07:30", "12:30", "19:30"];
      case 4: return ["07:30", "12:30", "19:30", "21:00"];
      default: return ["07:30", "12:30", "19:30"];
    }
  }

  Future<void> takeSupplement() async {
    final newCount = state.log.currentCount + 1;
    await updateCount(newCount);
  }

  Future<void> removeSupplement() async {
    final newCount = (state.log.currentCount - 1).clamp(0, 99);
    await updateCount(newCount);
  }

  Future<void> resetCount() async {
    await updateCount(0);
  }

  Future<void> updateCount(int count) async {
    if (state.isLoading) return;
    
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
