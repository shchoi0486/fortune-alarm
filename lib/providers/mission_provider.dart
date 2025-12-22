import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import '../data/models/mission_model.dart';
import '../data/models/daily_mission_log.dart';
import '../core/constants/mission_category.dart';

final missionProvider = ChangeNotifierProvider<MissionNotifier>((ref) {
  return MissionNotifier();
});

class MissionNotifier extends ChangeNotifier {
  List<MissionModel> _missions = [];
  List<MissionModel> _customMissions = []; // 사용자가 직접 만든 미션 히스토리
  DailyMissionLog? _todayLog;
  bool _isLoading = true;
  int _fortuneCookieCount = 0;
  bool _showRewardDialog = false;

  List<MissionModel> get missions => _missions;
  List<MissionModel> get customMissions => _customMissions;
  DailyMissionLog? get todayLog => _todayLog;
  bool get isLoading => _isLoading;
  int get fortuneCookieCount => _fortuneCookieCount;
  bool get showRewardDialog => _showRewardDialog;

  void consumeRewardDialogEvent() {
    _showRewardDialog = false;
    notifyListeners();
  }

  // 오늘 완료한 미션 개수 (삭제된 미션 제외)
  int get completedCount {
    if (_todayLog == null) return 0;
    
    // 일반 미션 완료 ID들
    final completedIds = Set<String>.from(_todayLog!.completedMissionIds);
    
    // 특수 미션 완료 여부 확인 (물 2L, 영양제 등)
    // 이 부분은 Provider를 직접 참조할 수 없으므로, _missions를 순회하며 
    // 오늘 로그에 포함되어 있는지 확인해야 함.
    // 하지만 Provider의 상태에 따라 자동으로 업데이트되어야 하므로 
    // 외부(Screen)에서 이 값을 다시 계산하거나, 
    // 특수 미션 완료 시 setMissionCompleted(id, true)를 호출하도록 해야 함.
    
    final validMissionIds = _missions.map((m) => m.id).toSet();
    return completedIds.where((id) => validMissionIds.contains(id)).length;
  }
  
  // 목표 달성 여부 (5개 이상)
  bool get isGoalAchieved => completedCount >= 5;

  MissionNotifier() {
    _init();
  }

  // 미션 상태 변경 (완료/미완료)
  Future<void> setMissionCompleted(String missionId, bool completed) async {
    // _todayLog가 null이면 초기화 대기 (재시도 로직은 호출측에서 처리하거나 여기서 간단히 대기)
    if (_todayLog == null) {
      debugPrint('setMissionCompleted: _todayLog is null, waiting for init...');
      // 간단한 대기 (완벽하진 않지만)
      int retry = 0;
      while (_isLoading && retry < 10) {
        await Future.delayed(const Duration(milliseconds: 100));
        retry++;
      }
      if (_todayLog == null) {
         debugPrint('setMissionCompleted: Failed to load todayLog.');
         return;
      }
    }

    final List<String> currentCompleted = List.from(_todayLog!.completedMissionIds);
    bool changed = false;

    if (completed) {
      if (!currentCompleted.contains(missionId)) {
        currentCompleted.add(missionId);
        changed = true;
      }
    } else {
      if (currentCompleted.contains(missionId)) {
        currentCompleted.remove(missionId);
        changed = true;
      }
    }

    if (!changed) {
       debugPrint('setMissionCompleted: No change for $missionId (completed: $completed)');
       return;
    }

    debugPrint('setMissionCompleted: Updating $missionId to $completed');

    // 5개 이상이면 목표 달성 (삭제된 미션 제외하고 계산)
    final validMissionIds = _missions.map((m) => m.id).toSet();
    final validCompletedCount = currentCompleted.where((id) => validMissionIds.contains(id)).length;
    final isAchieved = validCompletedCount >= 5;

    final updatedLog = _todayLog!.copyWith(
      completedMissionIds: currentCompleted,
      isGoalAchieved: isAchieved,
    );

    final logBox = await Hive.openBox<DailyMissionLog>('mission_logs');
    await logBox.put(_todayLog!.dateKey, updatedLog);
    _todayLog = updatedLog;

    // 보상 지급 로직 (목표 달성 시 & 아직 보상 안 받았을 때)
    if (isAchieved) {
      final claimedBox = await Hive.openBox<String>('claimed_rewards');
      final todayKey = _todayLog!.dateKey;
      
      if (!claimedBox.values.contains(todayKey)) {
        // 보상 지급
        _fortuneCookieCount += 1;
        await Hive.openBox('user_wallet').then((box) => box.put('fortune_cookie_count', _fortuneCookieCount));
        
        // 지급 기록
        await claimedBox.add(todayKey);
        
        // 다이얼로그 트리거
        _showRewardDialog = true;
      }
    }

    notifyListeners();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    try {
      // 1. Mission Box 열기
      final missionBox = await Hive.openBox<MissionModel>('missions');
      
      // 마이그레이션 및 기본 미션 확인
      await _ensureDefaultMissions(missionBox);
      
      _missions = missionBox.values.toList();

      // 2. Custom Mission Box 열기 & 로드
      final customMissionBox = await Hive.openBox<MissionModel>('custom_missions');
      
      // 기존 '물 1L' 커스텀 미션이 있다면 업데이트
      for (var m in customMissionBox.values) {
        if (m.title == '물 1L 이상 마시기') {
          await customMissionBox.put(m.id, MissionModel(
            id: m.id,
            title: '물 2L 이상 마시기',
            icon: '🧊',
            category: m.category,
          ));
        }
      }
      _customMissions = customMissionBox.values.toList();

      // 3. Log Box 열기 & 오늘 로그 로드
      final logBox = await Hive.openBox<DailyMissionLog>('mission_logs');
      final todayKey = DateFormat('yyyy-MM-dd').format(DateTime.now());
      
      // 오늘 로그가 있는지 확인 (Box key를 날짜로 사용)
      if (logBox.containsKey(todayKey)) {
        _todayLog = logBox.get(todayKey);
      } else {
        // 없으면 새로 생성 (저장은 아직 안함, 첫 미션 완료 시 저장하거나 지금 빈값 저장)
        _todayLog = DailyMissionLog(dateKey: todayKey, completedMissionIds: []);
        // 바로 저장해두는 게 안전함 (참조를 위해)
        await logBox.put(todayKey, _todayLog!);
      }

    } catch (e) {
      debugPrint('Error initializing missions: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  static final List<MissionModel> defaultMissions = [
    MissionModel(
      id: 'supplement',
      title: '영양제 챙겨 먹기',
      icon: '💊',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'water_2l',
      title: '물 2L 이상 마시기',
      icon: '🧊',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'wakeup',
      title: '기상 알람 미션',
      icon: '⏰',
      isSystemMission: true,
      category: MissionCategory.routine,
    ),
    MissionModel(
      id: 'gym',
      title: '헬스장 가기',
      icon: '🏋️‍♂️',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'workout',
      title: '운동하러 가기',
      icon: '🏃‍♂️',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'diary',
      title: '일기 쓰기',
      icon: '📔',
      category: MissionCategory.routine,
    ),
    MissionModel(
      id: 'bed_making',
      title: '이불 정리하기',
      icon: '🛏️',
      category: MissionCategory.routine,
    ),
    MissionModel(
      id: 'stretching',
      title: '스트레칭 하기',
      icon: '🧘',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'reading',
      title: '책 10분 읽기',
      icon: '📚',
      category: MissionCategory.study,
    ),
    MissionModel(
      id: 'planning',
      title: '오늘의 할 일 계획하기',
      icon: '📝',
      category: MissionCategory.study,
    ),
    MissionModel(
      id: 'breakfast',
      title: '아침 식사 챙겨 먹기',
      icon: '🍳',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'meditation',
      title: '명상하기',
      icon: '🧘‍♂️',
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'english_words',
      title: '영단어 외우기',
      icon: '🅰️',
      category: MissionCategory.study,
    ),
    MissionModel(
      id: 'ventilation',
      title: '환기 시키기',
      icon: '🪟',
      category: MissionCategory.routine,
    ),
    MissionModel(
      id: 'cleaning',
      title: '방 정리정돈 하기',
      icon: '🧹',
      category: MissionCategory.routine,
    ),
    MissionModel(
      id: 'gratitude_diary',
      title: '감사 일기 쓰기',
      icon: '✨',
      category: MissionCategory.routine,
    ),
  ];

  Future<void> _ensureDefaultMissions(Box<MissionModel> box) async {
    final existingMissions = box.values.toList();
    
    // 1. 기존 '물 1L' 또는 '기상 알람 미션' 관련 업데이트 (마이그레이션)
    for (var m in existingMissions) {
      if (m.title == '물 1L 이상 마시기') {
        final updated = MissionModel(
          id: m.id,
          title: '물 2L 이상 마시기',
          icon: '🧊',
          category: m.category,
          isSystemMission: m.isSystemMission,
        );
        await box.put(m.id, updated);
      } else if (m.id == 'wakeup' || m.title == '기상 알람 미션 성공') {
        final updated = MissionModel(
          id: 'wakeup',
          title: '기상 알람 미션',
          icon: '⏰',
          category: m.category,
          isSystemMission: true,
        );
        await box.put('wakeup', updated);
      }
    }

    // 2. 필수 3종 미션 보장 (영양제, 기상, 물 2L)
    // 사용자가 직접 삭제했을 수도 있지만, 초기 설정 시에는 이 3가지가 기본으로 있어야 함.
    final mandatoryIds = ['supplement', 'wakeup', 'water_2l'];
    final existingIds = box.keys.toSet();
    final existingTitles = box.values.map((m) => m.title).toSet();

    for (var mId in mandatoryIds) {
      final mission = defaultMissions.firstWhere((m) => m.id == mId);
      // ID로도 없고 제목으로도 없으면 추가
      if (!existingIds.contains(mId) && !existingTitles.contains(mission.title)) {
        await box.put(mId, mission);
      }
    }
  }

  // 미션 추가 (커스텀 미션 포함)
  Future<void> addMission(String title, String icon, MissionCategory category, {bool isCustom = false}) async {
    final newMission = MissionModel(
      id: const Uuid().v4(),
      title: title,
      icon: icon,
      category: category,
    );

    final box = await Hive.openBox<MissionModel>('missions');
    await box.put(newMission.id, newMission);
    
    _missions = box.values.toList();

    // 사용자가 직접 만든 미션인 경우 히스토리에 저장 (중복 체크)
    if (isCustom) {
      final customBox = await Hive.openBox<MissionModel>('custom_missions');
      final exists = customBox.values.any((m) => m.title == title);
      if (!exists) {
        // ID는 새로 생성하거나 기존꺼 사용. 히스토리용이라 별도 저장.
        // 여기선 같은 객체를 저장하되, 나중에 불러올 때 ID가 겹칠 수 있으니 주의.
        // 하지만 'missions' 박스와 'custom_missions' 박스는 별개이므로 ID가 같아도 상관 없음.
        await customBox.put(newMission.id, newMission);
        _customMissions = customBox.values.toList();
      }
    }

    notifyListeners();
  }

  // 미션 삭제 (System 미션 제외)
  Future<void> deleteMission(String id) async {
    final box = await Hive.openBox<MissionModel>('missions');
    final mission = box.get(id);
    if (mission != null && !mission.isSystemMission) {
      await box.delete(id);
      _missions = box.values.toList();
      notifyListeners();
    }
  }

  // 모든 미션 초기화 (System 미션 제외)
  Future<void> resetAllMissions() async {
    final box = await Hive.openBox<MissionModel>('missions');
    final keysToDelete = box.values
        .where((m) => !m.isSystemMission)
        .map((m) => m.id)
        .toList();
    
    for (var key in keysToDelete) {
      await box.delete(key);
    }
    
    _missions = box.values.toList();
    notifyListeners();
  }

  // 미션 완료 토글
  Future<void> toggleMission(String missionId) async {
    if (_todayLog == null) return;

    final mission = _missions.firstWhere((m) => m.id == missionId);
    // 특수 미션은 토글로 완료 처리 불가 (상세 화면에서만 가능)
    if (mission.id == 'wakeup') return; // 기상 알람 미션 추가
    if (mission.title.contains('물') && mission.title.contains('2L')) return;
    if (mission.title.contains('영양제')) return;

    final isCompleted = _todayLog!.completedMissionIds.contains(missionId);
    await setMissionCompleted(missionId, !isCompleted);
  }

  // 기상 알람 성공 처리 (외부에서 호출)
  Future<void> completeWakeUpMission() async {
    // wakeup 미션 ID는 'wakeup'으로 고정
    if (_todayLog != null && !_todayLog!.completedMissionIds.contains('wakeup')) {
      await toggleMission('wakeup');
    }
  }

  // 통계 데이터 계산
  Future<Map<String, dynamic>> getMissionStatistics() async {
    final box = await Hive.openBox<DailyMissionLog>('mission_logs');
    final logs = box.values.toList();
    
    // 연속 성공일 계산
    final achievedDates = logs.where((l) => l.isGoalAchieved).map((l) => l.dateKey).toSet();
    int currentStreak = 0;
    DateTime d = DateTime.now();
    final todayKey = DateFormat('yyyy-MM-dd').format(d);
    
    // 오늘 성공했으면 스트릭 포함, 아니면 어제부터 체크
    if (achievedDates.contains(todayKey)) {
      currentStreak++;
      d = d.subtract(const Duration(days: 1));
    } else {
      d = d.subtract(const Duration(days: 1));
    }
    
    while (true) {
      if (achievedDates.contains(DateFormat('yyyy-MM-dd').format(d))) {
        currentStreak++;
        d = d.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    
    // 최근 30일 성공률
    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));
    int success30 = 0;
    int totalRecorded30 = 0;
    
    for (var log in logs) {
      try {
        final logDate = DateFormat('yyyy-MM-dd').parse(log.dateKey);
        // 오늘 포함 과거 30일
        if (logDate.isAfter(thirtyDaysAgo) && logDate.isBefore(now.add(const Duration(days: 1)))) {
          totalRecorded30++;
          if (log.isGoalAchieved) success30++;
        }
      } catch (e) {
        // 날짜 파싱 에러 무시
      }
    }
    
    double successRate = totalRecorded30 == 0 ? 0.0 : (success30 / totalRecorded30 * 100);
    
    return {
      'streak': currentStreak,
      'successRate': successRate,
      'totalSuccess': logs.where((l) => l.isGoalAchieved).length,
    };
  }
}
