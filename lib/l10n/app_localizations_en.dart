// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => 'Good morning! Start your lucky day.';

  @override
  String get missionWakeUp => 'Wake-up Mission';

  @override
  String get missionSupplement => 'Take Supplements';

  @override
  String get missionWater => 'Drink 2L Water';

  @override
  String get fortuneCookie => 'Fortune Cookie';

  @override
  String get settings => 'Settings';

  @override
  String get alarm => 'Alarm';

  @override
  String get calendar => 'Calendar';

  @override
  String get mission => 'Mission';

  @override
  String get fortune => 'Fortune';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String get allMissionsCompleted =>
      'You have completed all 5 missions for today.';

  @override
  String get rewardReceived => 'You received 1 Fortune Cookie as a reward! 🥠';

  @override
  String get confirm => 'Confirm';
}
