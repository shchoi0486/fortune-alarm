// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Удачный Бу디льник';

  @override
  String get morningGreeting => 'Доброе утро! Начните свой счастливый день.';

  @override
  String get missionWakeUp => 'Миссия Пробуждение';

  @override
  String get missionSupplement => 'Витамины';

  @override
  String get missionWater => 'Вода 2л+';

  @override
  String get fortuneCookie => 'Печенье с предсказанием';

  @override
  String get settings => 'Настройки';

  @override
  String get alarm => 'Будильник';

  @override
  String get calendar => 'Календарь';

  @override
  String get mission => 'Миссия';

  @override
  String get fortune => 'Фортуна';

  @override
  String get congratulations => 'Поздравляем!';

  @override
  String get allMissionsCompleted => 'Вы выполнили все 5 миссий на сегодня.';

  @override
  String get rewardReceived =>
      'В награду вы получили 1 печенье с предсказанием! 🥠';

  @override
  String get confirm => 'ОК';
}
