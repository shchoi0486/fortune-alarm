import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import '../data/models/mission_model.dart';
import '../data/models/daily_mission_log.dart';
import '../core/constants/mission_category.dart';
import '../services/cookie_service.dart';
import '../services/notification_service.dart';

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
  int? _lastRewardMissions;
  int? _lastRewardCookies;
  final CookieService _cookieService = CookieService();
  StreamSubscription<int>? _cookieCountSubscription;

  List<MissionModel> get missions => _missions;
  List<MissionModel> get customMissions => _customMissions;
  DailyMissionLog? get todayLog => _todayLog;
  bool get isLoading => _isLoading;
  int get fortuneCookieCount => _fortuneCookieCount;
  bool get showRewardDialog => _showRewardDialog;
  int? get lastRewardMissions => _lastRewardMissions;
  int? get lastRewardCookies => _lastRewardCookies;
  
  // 동시 처리 방지용 락 (따닥 방지)
  bool _isProcessingCompletion = false;

  void consumeRewardDialogEvent() {
    _showRewardDialog = false;
    _lastRewardMissions = null;
    _lastRewardCookies = null;
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
    _startCookieCountSync();
  }

  Future<void> _startCookieCountSync() async {
    try {
      _fortuneCookieCount = await _cookieService.getCookieCount();
      notifyListeners();
    } catch (_) {}

    await _cookieCountSubscription?.cancel();
    _cookieCountSubscription = _cookieService.cookieCountStream.listen((count) {
      if (_fortuneCookieCount == count) return;
      _fortuneCookieCount = count;
      notifyListeners();
    });
  }

  // 날짜 변경 확인 및 로그 갱신 (외부 호출용)
  Future<void> checkDayChange() async {
    await _checkDayChange();
  }

  // 날짜 변경 확인 및 로그 갱신
  Future<void> _checkDayChange() async {
    final todayKey = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    // 로그가 없거나 날짜가 변경된 경우
    if (_todayLog == null || _todayLog!.dateKey != todayKey) {
      debugPrint('MissionProvider: Date changed or log null. Refreshing log for $todayKey');
      
      final logBox = await Hive.openBox<DailyMissionLog>('mission_logs');
      
      if (logBox.containsKey(todayKey)) {
        _todayLog = logBox.get(todayKey);
      } else {
        // 새 로그 생성
        _todayLog = DailyMissionLog(dateKey: todayKey, completedMissionIds: []);
        await logBox.put(todayKey, _todayLog!);
      }
      notifyListeners();
    }
  }

  // 미션 상태 변경 (완료/미완료)
  Future<void> setMissionCompleted(String missionId, bool completed) async {
    // 날짜 변경 체크
    await _checkDayChange();

    // 동시 처리 방지 (따닥 방지)
    if (_isProcessingCompletion) return;
    _isProcessingCompletion = true;

    try {
      // _todayLog가 null이면 초기화 대기 (재시도 로직은 호출측에서 처리하거나 여기서 간단히 대기)
      if (_todayLog == null) {
        debugPrint('setMissionCompleted: _todayLog is null, waiting for init...');
        // 최대 3초까지 대기 (Hive 박스 오픈 등이 늦어질 수 있음)
        int retry = 0;
        while (_isLoading && retry < 30) {
          await Future.delayed(const Duration(milliseconds: 100));
          retry++;
        }
        if (_todayLog == null) {
           debugPrint('setMissionCompleted: Failed to load todayLog after waiting.');
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

      // 1. 먼저 상태와 DB를 업데이트하여 UI가 즉시 반응하게 함
      final validMissionIds = _missions.map((m) => m.id).toSet();
      final newCompletedCount = currentCompleted.where((id) => validMissionIds.contains(id)).length;
      
      // 보상 조건 확인 (업데이트 전 상태 기준)
      bool shouldRewardFive = newCompletedCount >= 5 && !(_todayLog!.isGoalAchieved);
      bool shouldRewardTen = newCompletedCount >= 10 && !(_todayLog!.isTenGoalAchieved ?? false);

      debugPrint('setMissionCompleted: count=$newCompletedCount, rewardFive=$shouldRewardFive, rewardTen=$shouldRewardTen');

      // 로그 객체 먼저 업데이트 및 저장
      final newLog = _todayLog!.copyWith(
        completedMissionIds: currentCompleted,
        isGoalAchieved: _todayLog!.isGoalAchieved || shouldRewardFive,
        isTenGoalAchieved: (_todayLog!.isTenGoalAchieved ?? false) || shouldRewardTen,
      );

      final logBox = await Hive.openBox<DailyMissionLog>('mission_logs');
      await logBox.put(_todayLog!.dateKey, newLog);
      _todayLog = newLog;
      
      // UI 즉시 갱신 (미션 이동)
      notifyListeners();

      // 2. 그 다음 보상 처리 (이미 업데이트된 상태이므로 중복 실행 안됨)
      int rewardCookies = 0;
      int? rewardMissions;

      if (shouldRewardFive) {
        rewardCookies += 1;
        rewardMissions = 5;
      }

      if (shouldRewardTen) {
        rewardCookies += 1;
        rewardMissions = 10;
      }

      if (rewardCookies > 0 && !_showRewardDialog) {
        _showRewardDialog = true;
        _lastRewardMissions = rewardMissions;
        _lastRewardCookies = rewardCookies;
        debugPrint('setMissionCompleted: Awarding $rewardCookies cookies for $rewardMissions missions');
        
        // 보상 다이얼로그가 뜨기 전에 UI를 먼저 업데이트하여 버튼 연타 방지
        notifyListeners();
        
        await _cookieService.addCookies(rewardCookies);
        // addCookies 이후에 다시 notify 하여 쿠키 숫자가 실시간 반영되도록 함
        notifyListeners();
      }
    } finally {
      _isProcessingCompletion = false;
    }
  }

  @override
  void dispose() {
    _cookieCountSubscription?.cancel();
    super.dispose();
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
      id: 'water_2l',
      title: '물 2L 이상 마시기',
      icon: '🧊',
      isSystemMission: true,
      category: MissionCategory.health,
    ),
    MissionModel(
      id: 'supplement',
      title: '영양제 챙겨 먹기',
      icon: '💊',
      isSystemMission: true,
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
    final initialMissionIds = {'wakeup', 'water_2l', 'supplement'};
    
    // 1. 기존 '물 1L' 또는 '기상 알람 미션' 관련 업데이트 (마이그레이션)
    for (var m in existingMissions) {
      if (m.title == '물 1L 이상 마시기') {
        final updated = MissionModel(
          id: m.id,
          title: '물 2L 이상 마시기',
          icon: '🧊',
          category: m.category,
          isSystemMission: true,
        );
        await box.put(m.id, updated);
      } else if (m.id == 'wakeup' || m.title == '기상 알람 미션 성공' || m.title == '기상 알람 미션') {
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

    // 2. 초기 3개 미션 외의 시스템 미션 제거 (사용자 요청: 초기에는 3개만 표시)
    // 기존에 자동으로 추가되었던 '헬스장 가기' 등의 미션을 제거합니다.
    final keysToDelete = <String>[];
    for (var m in box.values) {
      // 시스템 미션이면서, 기본 미션 목록에 있고, 초기 3개 미션이 아닌 경우 삭제
      final isDefaultMission = defaultMissions.any((dm) => dm.id == m.id);
      if (m.isSystemMission && isDefaultMission && !initialMissionIds.contains(m.id)) {
        keysToDelete.add(m.id);
      }
    }
    if (keysToDelete.isNotEmpty) {
      await box.deleteAll(keysToDelete);
    }

    final existingIds = box.keys.toSet();
    final existingTitles = box.values.map((m) => m.title).toSet();

    // 3. '영양제 챙겨 먹기' 미션이 없는 경우 추가 (마이그레이션)
    if (!existingIds.contains('supplement')) {
      final supplement = defaultMissions.firstWhere((m) => m.id == 'supplement');
      await box.put('supplement', supplement);
    }

    // 4. 초기 미션 추가 (최초 실행 시에만)
    // 앱 설정 박스를 열어서 초기 미션 추가 여부를 확인
    final prefs = await Hive.openBox('app_settings');
    final bool initialMissionsAdded = prefs.get('initial_missions_added', defaultValue: false);

    if (!initialMissionsAdded) {
      for (var mission in defaultMissions) {
        // 초기 미션 목록에 포함된 것만 자동 추가
        if (initialMissionIds.contains(mission.id)) {
          if (!existingIds.contains(mission.id) && !existingTitles.contains(mission.title)) {
            final systemMission = MissionModel(
              id: mission.id,
              title: mission.title,
              icon: mission.icon,
              category: mission.category,
              isSystemMission: true,
            );
            await box.put(mission.id, systemMission);
          }
        }
      }
      // 초기화 완료 플래그 저장
      await prefs.put('initial_missions_added', true);
    }
  }

  // 미션 추가 (커스텀 미션 포함)
  Future<void> addMission(String title, String icon, MissionCategory category, {
    bool isCustom = false, 
    String? id,
    String? alarmTime,
    bool isAlarmEnabled = false,
  }) async {
    final newMission = MissionModel(
      id: id ?? const Uuid().v4(),
      title: title,
      icon: icon,
      category: category,
      isSystemMission: !isCustom && (id != null && defaultMissions.any((m) => m.id == id)),
      alarmTime: alarmTime,
      isAlarmEnabled: isAlarmEnabled,
    );

    final box = await Hive.openBox<MissionModel>('missions');
    await box.put(newMission.id, newMission);
    
    _missions = box.values.toList();

    // 알림 스케줄링
    if (isAlarmEnabled && alarmTime != null) {
      final parts = alarmTime.split(':');
      final time = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      await NotificationService().scheduleMissionNotification(
        missionId: newMission.id,
        title: title,
        body: '미션을 수행할 시간입니다!',
        time: time,
      );
    }

    // 사용자가 직접 만든 미션인 경우 히스토리에 저장 (중복 체크)
    if (isCustom) {
      final customBox = await Hive.openBox<MissionModel>('custom_missions');
      final exists = customBox.values.any((m) => m.title == title);
      if (!exists) {
        // ID는 새로 생성하거나 기존꺼 사용. 히스토리용이라 별도 저장.
        await customBox.put(newMission.id, newMission);
        _customMissions = customBox.values.toList();
      }
    }

    notifyListeners();
  }

  // 미션 수정
  Future<void> updateMission(MissionModel mission) async {
    final box = await Hive.openBox<MissionModel>('missions');
    await box.put(mission.id, mission);
    _missions = box.values.toList();

    // 알림 스케줄링 업데이트
    if (mission.isAlarmEnabled && mission.alarmTime != null) {
      final parts = mission.alarmTime!.split(':');
      final time = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      await NotificationService().scheduleMissionNotification(
        missionId: mission.id,
        title: mission.title,
        body: '미션을 수행할 시간입니다!',
        time: time,
      );
    } else {
      await NotificationService().cancelMissionNotification(mission.id);
    }

    notifyListeners();
  }

  // 미션 삭제 (System 미션 제외)
  Future<void> deleteMission(String id) async {
    final box = await Hive.openBox<MissionModel>('missions');
    final mission = box.get(id);
    // 기상 알람 미션은 삭제 불가, 그 외(시스템 미션 포함)는 삭제 가능
    if (mission != null && mission.id != 'wakeup') {
      await box.delete(id);
      
      // 알림 취소
      await NotificationService().cancelMissionNotification(id);

      _missions = box.values.toList();
      notifyListeners();
    }
  }

  // 모든 미션 초기화 및 기본 미션 설정
  Future<void> resetAllMissions() async {
    // 1. 미션 목록 초기화 및 기본 미션 추가
    final box = await Hive.openBox<MissionModel>('missions');
    await box.clear();
    
    // 기본 미션 리스트
    final defaultMissions = [
      MissionModel(
        id: 'supplement',
        title: '영양제 챙겨 먹기',
        icon: '💊',
        isSystemMission: true,
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
        id: 'water_2l',
        title: '물 2L 이상 마시기',
        icon: '🧊',
        isSystemMission: true,
        category: MissionCategory.health,
      ),
    ];

    for (var m in defaultMissions) {
      await box.put(m.id, m);
    }
    _missions = box.values.toList();

    // 2. 오늘 로그 초기화
    if (_todayLog != null) {
      final newLog = _todayLog!.copyWith(
        completedMissionIds: [],
        // 보상 획득 여부는 초기화하지 않고 유지 (어뷰징 방지)
        isGoalAchieved: _todayLog!.isGoalAchieved,
        isTenGoalAchieved: _todayLog!.isTenGoalAchieved,
      );

      final logBox = await Hive.openBox<DailyMissionLog>('mission_logs');
      await logBox.put(_todayLog!.dateKey, newLog);
      _todayLog = newLog;
    }
    
    notifyListeners();
  }

  // 미션 완료 토글
  Future<void> toggleMission(String missionId) async {
    if (_todayLog == null) return;

    final mission = _missions.firstWhere((m) => m.id == missionId);
    // 특수 미션은 토글로 완료 처리 불가 (상세 화면에서만 가능)
    if (mission.id == 'wakeup' || mission.id == 'water_2l' || mission.id == 'supplement') return;

    final isCompleted = _todayLog!.completedMissionIds.contains(missionId);
    await setMissionCompleted(missionId, !isCompleted);
  }

  // 기상 알람 성공 처리 (외부에서 호출)
  Future<void> completeWakeUpMission() async {
    await _checkDayChange();
    
    // wakeup 미션 ID는 'wakeup'으로 고정
    if (_todayLog != null && !_todayLog!.completedMissionIds.contains('wakeup')) {
      await setMissionCompleted('wakeup', true);
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
