import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

class UserActivityService {
  static const String _boxName = 'user_activity';
  static const String _keyLastRoutineCheck = 'last_routine_check_date';
  static const String _keyLastFortuneView = 'last_fortune_view_date';

  /// 루틴 완료(미션 1개 이상 완료 시)를 기록합니다.
  static Future<void> recordRoutineCheck() async {
    try {
      final box = await Hive.openBox(_boxName);
      final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
      await box.put(_keyLastRoutineCheck, todayStr);
      debugPrint('[UserActivityService] 루틴 체크 기록 완료: $todayStr');
    } catch (e) {
      debugPrint('[UserActivityService] 루틴 체크 기록 실패: $e');
    }
  }

  /// 운세 확인을 기록합니다.
  static Future<void> recordFortuneView() async {
    try {
      final box = await Hive.openBox(_boxName);
      final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
      await box.put(_keyLastFortuneView, todayStr);
      debugPrint('[UserActivityService] 운세 확인 기록 완료: $todayStr');
    } catch (e) {
      debugPrint('[UserActivityService] 운세 확인 기록 실패: $e');
    }
  }

  /// 오늘 루틴을 완료했는지 확인합니다.
  static Future<bool> hasCompletedRoutineToday() async {
    try {
      final box = await Hive.openBox(_boxName);
      final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final lastDate = box.get(_keyLastRoutineCheck, defaultValue: '');
      return lastDate == todayStr;
    } catch (e) {
      return false;
    }
  }

  /// 오늘 운세를 확인했는지 확인합니다.
  static Future<bool> hasViewedFortuneToday() async {
    try {
      final box = await Hive.openBox(_boxName);
      final todayStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final lastDate = box.get(_keyLastFortuneView, defaultValue: '');
      return lastDate == todayStr;
    } catch (e) {
      return false;
    }
  }
}
