import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../models/water_log.dart';
import '../models/water_settings.dart';
import '../../../../providers/mission_provider.dart';
import '../../../../services/water_alarm_service.dart';

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

  /// 연속 탭(따닥) 으로 인한 read-modify-write 경합을 직렬화한다.
  ///
  /// 이전 구현은 addWater() 가 currentIntake 를 읽고 await 로 Hive 를 기다리는 동안
  /// 두 번째 탭이 같은 값을 읽어 +cupSize 하나가 유실되었다.
  Future<void> _intakeQueue = Future<void>.value();

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

    // 예외를 삼켜야 한다. 이전에는 try/catch 가 없어서, water_settings 레코드가
    // 손상되었을 때 (adapter 가 기본값 없이 as int 로 캐스팅) 예외가 전파되어
    // state.isLoading 이 영구히 true 로 남고 물 미션 화면이 무한 스피너에 갇혔다.
    try {
      _logBox = await Hive.openBox<WaterLog>('water_logs');
      _settingsBox = await Hive.openBox<WaterSettings>('water_settings');
    } catch (e) {
      debugPrint('[Water] Failed to open boxes: $e');
      state = state.copyWith(isLoading: false);
      return;
    }

    try {
      final todayKey = _todayKey();

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
    } catch (e) {
      debugPrint('[Water] Failed to initialize: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  static String _todayKey() => DateFormat('yyyy-MM-dd').format(DateTime.now());

  /// 앱이 살아있는 상태로 자정을 넘길 수 있으므로, 기록 직전에 날짜를 확인한다.
  ///
  /// 이전 구현은 [_init] 에서 계산한 dateKey 를 영원히 재사용해서,
  /// 00:05 에 마신 물이 **어제** 기록에 쌓이고 타일에 어제 컵 수가 표시되었다.
  Future<bool> _rollOverIfDayChanged() async {
    final todayKey = _todayKey();
    if (state.log.dateKey == todayKey) return false;

    final created = WaterLog(dateKey: todayKey);
    if (_logBox != null) {
      await _logBox!.put(todayKey, created);
    }
    state = state.copyWith(log: created, isGoalAchieved: false);
    await _syncWaterMissionStatus(false);
    debugPrint('[Water] Day rolled over to $todayKey');
    return true;
  }

  /// 복합 상태 변경(읽기→쓰기)을 직렬화한다.
  Future<void> _enqueue(Future<void> Function() action) {
    final result = _intakeQueue.then((_) => action());
    _intakeQueue = result.then<void>((_) {}, onError: (Object _, StackTrace __) {});
    return result;
  }

  Future<void> addWater() => _enqueue(() async {
        await _rollOverIfDayChanged();
        final current = state.log.currentIntake;
        final cupSize = state.settings.cupSize;
        final goal = state.settings.dailyGoal;

        final rawNext = current + cupSize;
        final next = (current < goal && rawNext > goal) ? goal : rawNext;
        await updateIntake(next);
      });

  Future<void> removeWater() => _enqueue(() async {
        await _rollOverIfDayChanged();
        final newIntake = (state.log.currentIntake - state.settings.cupSize).clamp(0, 99999);
        await updateIntake(newIntake);
      });

  Future<void> resetIntake() => _enqueue(() async {
        await _rollOverIfDayChanged();
        await updateIntake(0);
      });

  Future<void> updateIntake(int intake) async {
    await _rollOverIfDayChanged();

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
        // 제목 매칭은 정확히 하나일 때만 사용한다. 여러 개가 매칭되면
        // 엉뚱한 미션이 완료 처리되는 것을 막기 위해 기본값을 유지한다.
        final matches = missions
            .where((m) => m.title.contains('물') && (m.title.contains('2L') || m.title.contains('1L')))
            .toList();
        if (matches.length == 1) {
          targetId = matches.first.id;
        }
      }

      await missionNotifier.setMissionCompleted(targetId, isAchieved);
      debugPrint('Syncing water mission status: $targetId -> $isAchieved');
    } catch (e) {
      debugPrint('Error syncing water mission status: $e');
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
    // 제자리 변이를 하면 Hive 가 관리하는 객체와 state 객체가 같은 인스턴스가 되어
    // 동일성 비교로 변화를 감지하지 못하는 곳에서 문제가 생긴다. 항상 새 객체로 만든다.
    final newSettings = state.settings.copyWith(
      dailyGoal: dailyGoal,
      cupSize: cupSize,
      isAlarmEnabled: isAlarmEnabled,
      startTime: startTime,
      endTime: endTime,
      intervalMinutes: intervalMinutes,
    );

    await newSettings.save();
    state = state.copyWith(settings: newSettings);
    
    // 목표 수치가 변경되었으면 달성 여부 재확인
    if (dailyGoal != null) {
      await _enqueue(() => updateIntake(state.log.currentIntake));
    }

    if (isAlarmEnabled != null || startTime != null || endTime != null || intervalMinutes != null) {
      await _scheduleAlarms();
    }
  }
  
  Future<void> _scheduleAlarms() async {
    await WaterAlarmService.scheduleAlarms(state.settings);
    debugPrint("Scheduling water alarms: ${state.settings.isAlarmEnabled}");
  }
}
