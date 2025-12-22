// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '幸运闹钟';

  @override
  String get morningGreeting => '早上好！开启你幸运的一天。';

  @override
  String get missionWakeUp => '起床任务';

  @override
  String get missionSupplement => '营养补给';

  @override
  String get missionWater => '饮水2L以上';

  @override
  String get fortuneCookie => '幸运饼干';

  @override
  String get settings => '设置';

  @override
  String get alarm => '闹钟';

  @override
  String get calendar => '日历';

  @override
  String get mission => '任务';

  @override
  String get fortune => '运势';

  @override
  String get congratulations => '恭喜！';

  @override
  String get allMissionsCompleted => '您已完成今天的全部5项任务。';

  @override
  String get rewardReceived => '作为奖励，您获得1个幸运饼干！ 🥠';

  @override
  String get confirm => '确认';
}
