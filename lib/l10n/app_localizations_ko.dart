// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '포춘알람';

  @override
  String get morningGreeting => '좋은 아침이에요! 행운의 하루를 시작하세요.';

  @override
  String get missionWakeUp => '기상 알람 미션';

  @override
  String get missionSupplement => '영양제 챙겨 먹기';

  @override
  String get missionWater => '물 2L 이상 마시기';

  @override
  String get fortuneCookie => '포춘쿠키';

  @override
  String get settings => '설정';

  @override
  String get alarm => '알람';

  @override
  String get calendar => '달력';

  @override
  String get mission => '미션';

  @override
  String get fortune => '운세';

  @override
  String get congratulations => '축하합니다!';

  @override
  String get allMissionsCompleted => '오늘의 미션 5개를 모두 달성했습니다.';

  @override
  String get rewardReceived => '보상으로 포춘쿠키 1개를 지급합니다! 🥠';

  @override
  String get confirm => '확인';
}
