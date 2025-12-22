// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'フォーチュンアラーム';

  @override
  String get morningGreeting => 'おはようございます！幸運な一日를 시작하세요.';

  @override
  String get missionWakeUp => '起床ミッション';

  @override
  String get missionSupplement => 'サプリメント';

  @override
  String get missionWater => '水2L以上';

  @override
  String get fortuneCookie => 'フォーチュンクッキー';

  @override
  String get settings => '設定';

  @override
  String get alarm => 'アラーム';

  @override
  String get calendar => 'カレンダー';

  @override
  String get mission => 'ミッション';

  @override
  String get fortune => '運勢';

  @override
  String get congratulations => 'おめでとうございます！';

  @override
  String get allMissionsCompleted => '今日のミッション5つをすべて達成しました。';

  @override
  String get rewardReceived => '報酬としてフォーチュンクッキー1個を支給します！ 🥠';

  @override
  String get confirm => '確認';
}
