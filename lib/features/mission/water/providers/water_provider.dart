import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../models/water_log.dart';
import '../models/water_settings.dart';
import '../../../../providers/mission_provider.dart';

// State class for Water Provider
class WaterState {
  final WaterLog log;
  final WaterSettings settings;
  final bool isLoading;
  final bool isGoalAchieved; // 상태 변경 감지를 위한 별도 필드

  WaterState({
    required this.log,
    required this.settings,
    this.isLoading = false,
    this.isGoalAchieved = false,
  });

  WaterState copyWith({
    WaterLog? log,
    WaterSettings? settings,
    bool? isLoading,
    bool? isGoalAchieved,
  }) {
    return WaterState(
      log: log ?? this.log,
      settings: settings ?? this.settings,
      isLoading: isLoading ?? this.isLoading,
      isGoalAchieved: isGoalAchieved ?? this.isGoalAchieved,
    );
  }
}

final waterProvider = StateNotifierProvider<WaterNotifier, WaterState>((ref) {
  return WaterNotifier(ref);
});

class WaterNotifier extends StateNotifier<WaterState> {
  final Ref _ref;
  Box<WaterLog>? _logBox;
  Box<WaterSettings>? _settingsBox;

  WaterNotifier(this._ref)
      : super(WaterState(
          log: WaterLog(dateKey: DateFormat('yyyy-MM-dd').format(DateTime.now())),
          settings: WaterSettings(),
          isLoading: true,
          isGoalAchieved: false,
        )) {
    _init();
  }

  Future<void> _init() async {
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(WaterLogAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(WaterSettingsAdapter());
    }

    _logBox = await Hive.openBox<WaterLog>('water_logs');
    _settingsBox = await Hive.openBox<WaterSettings>('water_settings');

    final todayKey = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    // Load Log
    WaterLog? log = _logBox!.get(todayKey);
    if (log == null) {
      final created = WaterLog(dateKey: todayKey);
      await _logBox!.put(todayKey, created);
      log = _logBox!.get(todayKey) ?? created;
    }

    // Load Settings
    WaterSettings? settings = _settingsBox!.get('settings');
    if (settings == null) {
      settings = WaterSettings();
      await _settingsBox!.put('settings', settings);
    }

    state = WaterState(
      log: log,
      settings: settings, 
      isLoading: false,
      isGoalAchieved: log.isGoalAchieved, // 초기 상태 설정
    );

    // 초기화 시 미션 상태 동기화
    _syncWaterMissionStatus(log.isGoalAchieved);
  }

  Future<void> addWater() async {
    final current = state.log.currentIntake;
    final cupSize = state.settings.cupSize;
    final goal = state.settings.dailyGoal;

    final rawNext = current + cupSize;
    final next = (current < goal && rawNext > goal) ? goal : rawNext;
    await updateIntake(next);
  }

  Future<void> removeWater() async {
    final newIntake = (state.log.currentIntake - state.settings.cupSize).clamp(0, 99999);
    await updateIntake(newIntake);
  }

  Future<void> resetIntake() async {
    await updateIntake(0);
  }

  Future<void> updateIntake(int intake) async {
    final dailyGoal = state.settings.dailyGoal;
    final isAchieved = intake >= dailyGoal;
    
    // Create a new log object to avoid mutating the current state object directly
    final newLog = WaterLog(
      dateKey: state.log.dateKey,
      currentIntake: intake,
      isGoalAchieved: isAchieved,
    );
    
    // Save to Hive
    if (_logBox != null) {
      await _logBox!.put(newLog.dateKey, newLog);
    }
    
    // Check if achievement status changed
    final wasAchieved = state.isGoalAchieved;
    
    // Update state first so UI reflects the change immediately
    state = state.copyWith(
      log: newLog,
      isGoalAchieved: isAchieved,
    );

    // Sync with MissionProvider
    // Always call sync to ensure MissionProvider state is up to date, 
    // especially if initial sync failed or mission was reset.
    await _syncWaterMissionStatus(isAchieved);
  }
  
  Future<void> _syncWaterMissionStatus(bool isAchieved) async {
    final missionNotifier = _ref.read(missionProvider);
    
    try {
      // 1. Find the actual mission ID from the current mission list.
      // It could be 'water_2l' or a custom ID if the user added it manually by title.
      String targetId = 'water_2l';
      
      final missions = missionNotifier.missions;
      final hasFixedId = missions.any((m) => m.id == 'water_2l');
      
      if (!hasFixedId) {
        // If 'water_2l' ID doesn't exist, try to find by title.
        try {
          final waterMission = missions.firstWhere(
            (m) => m.title.contains('물') && (m.title.contains('2L') || m.title.contains('1L')),
          );
          targetId = waterMission.id;
        } catch (_) {
          // If no mission found by title, stay with 'water_2l' (it might be added later)
        }
      }

      await missionNotifier.setMissionCompleted(targetId, isAchieved);
      print('Syncing water mission status: $targetId -> $isAchieved');
    } catch (e) {
      print('Error syncing water mission status: $e');
    }
  }

  Future<void> updateSettings({
    int? dailyGoal,
    int? cupSize,
    bool? isAlarmEnabled,
    String? startTime,
    String? endTime,
    int? intervalMinutes,
  }) async {
    final newSettings = state.settings;
    if (dailyGoal != null) newSettings.dailyGoal = dailyGoal;
    if (cupSize != null) newSettings.cupSize = cupSize;
    if (isAlarmEnabled != null) newSettings.isAlarmEnabled = isAlarmEnabled;
    if (startTime != null) newSettings.startTime = startTime;
    if (endTime != null) newSettings.endTime = endTime;
    if (intervalMinutes != null) newSettings.intervalMinutes = intervalMinutes;

    await newSettings.save();
    state = state.copyWith(settings: newSettings);
    
    // 목표 수치가 변경되었으면 달성 여부 재확인
    if (dailyGoal != null) {
      await updateIntake(state.log.currentIntake);
    }

    if (isAlarmEnabled != null || startTime != null || endTime != null || intervalMinutes != null) {
      _scheduleAlarms();
    }
  }
  
  void _scheduleAlarms() {
    // TODO: Implement actual notification scheduling
    print("Scheduling water alarms: ${state.settings.isAlarmEnabled}");
  }
}
