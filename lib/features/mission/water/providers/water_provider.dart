import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../../../../data/models/mission_model.dart';
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
      log = WaterLog(dateKey: todayKey);
      await _logBox!.put(todayKey, log);
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
    final newIntake = state.log.currentIntake + state.settings.cupSize;
    await updateIntake(newIntake);
  }

  Future<void> removeWater() async {
    final newIntake = (state.log.currentIntake - state.settings.cupSize).clamp(0, 99999);
    await updateIntake(newIntake);
  }

  Future<void> resetIntake() async {
    await updateIntake(0);
  }

  Future<void> updateIntake(int intake) async {
    final newLog = state.log;
    newLog.currentIntake = intake;
    
    // Check Goal
    final wasAchieved = newLog.isGoalAchieved; // Hive 객체에서 읽어옴 (이전 값일 수도 있고 아닐 수도 있음)
    // 하지만 이미 state.isGoalAchieved에 정확한 이전 상태가 있음.
    
    final isAchieved = intake >= state.settings.dailyGoal;
    newLog.isGoalAchieved = isAchieved;
    
    await newLog.save();
    
    // Sync with MissionProvider if goal achieved status changed
    // state.isGoalAchieved(이전상태)와 현재 계산된 isAchieved 비교
    if (isAchieved != state.isGoalAchieved) {
       await _syncWaterMissionStatus(isAchieved);
    }
    
    state = state.copyWith(
      log: newLog,
      isGoalAchieved: isAchieved, // 명시적 업데이트
    );
  }
  
  Future<void> _syncWaterMissionStatus(bool isAchieved) async {
    final missionNotifier = _ref.read(missionProvider);
    
    // "물"이 포함된 미션을 찾아서 상태 동기화
    try {
      // 1. ID로 먼저 찾기 ('water_2l'가 기본 ID)
      MissionModel? waterMission;
      try {
        waterMission = missionNotifier.missions.firstWhere((m) => m.id == 'water_2l');
      } catch (_) {
         // pass
      }

      if (waterMission == null) {
          waterMission = missionNotifier.missions.firstWhere(
            (m) => m.title.contains('물') && m.title.contains('2L'),
          );
      }
      
       print('Syncing water mission status: ${waterMission.id} -> $isAchieved');
       await missionNotifier.setMissionCompleted(waterMission.id, isAchieved);
        } catch (e) {
      // 물 미션이 없을 수 있음
      print('Water mission not found for sync: $e');
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
