// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => 'Доброе утро! Начните свой счастливый день.';

  @override
  String get missionWakeUp => 'Миссия Пробуждение';

  @override
  String get missionSupplement => 'Прием витаминов';

  @override
  String get missionWater => 'Пить более 2 л воды';

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
  String get fortune => 'Удача';

  @override
  String get congratulations => 'Поздравляем!';

  @override
  String get allMissionsCompleted => 'Вы выполнили все 5 миссий на сегодня.';

  @override
  String get rewardReceived =>
      'Вы получили 1 печенье с предсказанием в награду! 🥠';

  @override
  String get confirm => 'ОК';

  @override
  String get exactAlarmPermissionRequired =>
      'Для срабатывания будильника в точное время требуется разрешение \"Точный будильник\".';

  @override
  String get overlayPermissionRequired =>
      'Для полноэкранных уведомлений требуется разрешение \"Отображение поверх других приложений\".';

  @override
  String get deleteAllAlarms => 'Удалить все будильники';

  @override
  String get noAlarms => 'Нет зарегистрированных будильников.';

  @override
  String get lessThanAMinuteRemaining => 'Прозвенит менее чем через минуту';

  @override
  String hoursMinutesRemaining(int hours, int minutes) {
    return 'Прозвенит через $hours ч. $minutes мин.';
  }

  @override
  String minutesRemaining(int minutes) {
    return 'Прозвенит через $minutes мин.';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward => 'Ежедневная награда: Печенье';

  @override
  String get missionRewardInfo =>
      '1 печенье за 5 миссий, 2 печенья за 10 миссий!';

  @override
  String get dailyMission => 'Миссия дня';

  @override
  String goalAchieved(int completed) {
    return '🎉 Цель $completed/5 достигнута!';
  }

  @override
  String missionProgress(int completed) {
    return 'Выполнено $completed/5';
  }

  @override
  String get myMissionRecord => 'Мои рекорды';

  @override
  String get consecutiveSuccess => 'Серия побед';

  @override
  String get successRate30Days => 'Успех (30 дн.)';

  @override
  String get totalSuccess => 'Всего побед';

  @override
  String get inProgress => 'В процессе 🔥';

  @override
  String get resetMissions => 'Сбросить миссии';

  @override
  String get resetMissionsConfirm =>
      'Вы уверены, что хотите сбросить список миссий?\n(Системные миссии останутся)';

  @override
  String get cancel => 'Отмена';

  @override
  String get reset => 'Сброс';

  @override
  String get addMission => 'Добавить миссию';

  @override
  String get completedMissions => 'Завершенные миссии';

  @override
  String greeting(String userName) {
    return 'Здравствуйте, $userName';
  }

  @override
  String get welcomeFortune =>
      'Добро пожаловать в мир таинственных предсказаний';

  @override
  String get luckyColor => 'Счастливый цвет';

  @override
  String get luckyItem => 'Счастливый предмет';

  @override
  String get luckyDirection => 'Благоприятное направление';

  @override
  String get viewVariousFortunes => 'Разные предсказания';

  @override
  String get todaysRecommendation => 'Рекомендация дня';

  @override
  String get checkTodaysFortune => 'Узнать предсказание';

  @override
  String get todaysAdvice => 'Совет дня от таинственных звезд';

  @override
  String get viewSpecificDateFortune => 'Предсказание на дату';

  @override
  String get lottoRecommendation => 'Номера лото';

  @override
  String get luckyNumber => 'Счастливое число';

  @override
  String get specificDateFortune => 'Дата предсказания';

  @override
  String get specialDayFortune => 'Особый день';

  @override
  String get newYearFortune => 'Новогоднее предсказание';

  @override
  String get totalFortune2025 => 'Прогноз на 2025 год';

  @override
  String get traditionalFortune => 'Тоджонбигёль';

  @override
  String get traditionalSaju => 'Традиционное Саджу';

  @override
  String get faceReading => 'Физиогномика';

  @override
  String get missionFaceReading => 'Face Reading Mission';

  @override
  String get faceFate => 'Судьба по лицу';

  @override
  String get compatibility => 'Совместимость';

  @override
  String get relationshipHarmony => 'Гармония отношений';

  @override
  String get general => 'Общие';

  @override
  String get darkMode => 'Темная тема';

  @override
  String get darkModeDescription => 'Использовать темную цветовую схему.';

  @override
  String get alarmSettings => 'Настройки будильника';

  @override
  String get information => 'Информация';

  @override
  String get notice => 'Объявления';

  @override
  String get weatherConditionSunny => 'Sunny';

  @override
  String get weatherConditionCloudy => 'Cloudy';

  @override
  String get weatherConditionFoggy => 'Foggy';

  @override
  String get weatherConditionRainy => 'Rainy';

  @override
  String get weatherConditionSnowy => 'Snowy';

  @override
  String get weatherConditionThunderstorm => 'Thunderstorm';

  @override
  String get airQualityGood => 'Good';

  @override
  String get airQualityNormal => 'Normal';

  @override
  String get airQualityBad => 'Bad';

  @override
  String get airQualityVeryBad => 'Very Bad';

  @override
  String get locationUnknown => 'Unknown Location';

  @override
  String get locationError => 'Location Error';

  @override
  String get faq => 'Часто задаваемые вопросы';

  @override
  String get sendFeedback => 'Оставить отзыв';

  @override
  String get feedbackDescription =>
      'Пожалуйста, поделитесь любыми неудобствами или предложениями по улучшению Fortune Alarm.\nВаше мнение помогает нам стать лучше.';

  @override
  String get reportCopyright => 'Сообщить о нарушении авторских прав';

  @override
  String get copyrightDescription =>
      'Если вы считаете, что контент в Fortune Alarm нарушает авторские права, сообщите об этом по электронной почте.\nМы примем меры незамедлительно.';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get alarmOptimization => 'Оптимизация будильника';

  @override
  String get allOptimizationsCompleted => 'Все настройки оптимизированы';

  @override
  String get optimizationNeeded => 'Требуется настройка для точной работы.';

  @override
  String get optimizationDescription =>
      'Будильник может задерживаться или не звонить из-за настроек системы Android. Пожалуйста, разрешите все пункты.';

  @override
  String get allowNotificationPermission => 'Разрешить уведомления';

  @override
  String get notificationPermissionDescription =>
      'Необходимо для отображения уведомлений при срабатывании будильника.';

  @override
  String get excludeBatteryOptimization => 'Исключить из оптимизации батареи';

  @override
  String get batteryOptimizationDescription =>
      'Позволяет будильнику звонить вовремя даже в режиме энергосбережения.';

  @override
  String get allowExactAlarm => 'Разрешить точные будильники';

  @override
  String get exactAlarmDescription =>
      'Позволяет будильнику звонить точно в назначенное время.';

  @override
  String get drawOverOtherApps => 'Отображение поверх других приложений';

  @override
  String get overlayDescription =>
      'Позволяет показывать экран будильника поверх других приложений.';

  @override
  String get allSettingsCompleted => 'Все настройки завершены.';

  @override
  String get manualSettingsInfo =>
      'Вы можете изменить эти настройки в системных настройках Android.';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get selectPhoto => 'Выбрать фото';

  @override
  String get selectAlarmBackground => 'Фон будильника';

  @override
  String get defaultLabel => 'По умолчанию';

  @override
  String get howToAdd => 'Как добавить';

  @override
  String get addAssetInstructions =>
      'Добавьте изображения в папку assets/images/ и зарегистрируйте их в pubspec.yaml.';

  @override
  String get gallery => 'Галерея';

  @override
  String get ringingNow => 'Звонит сейчас';

  @override
  String get setTime => 'Установить время';

  @override
  String get repeatDays => 'Дни повтора';

  @override
  String get repeatDaily => 'Ежедневно';

  @override
  String get snoozeSettings => 'Повтор сигнала (Snooze)';

  @override
  String get interval => 'Интервал';

  @override
  String get wakeUpAlarm => 'Будильник';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval мин, $count раз';
  }

  @override
  String get daySun => 'Вс';

  @override
  String get dayMon => 'Пн';

  @override
  String get dayTue => 'Вт';

  @override
  String get dayWed => 'Ср';

  @override
  String get dayThu => 'Чт';

  @override
  String get dayFri => 'Пт';

  @override
  String get daySat => 'Сб';

  @override
  String get missionRewardEarned =>
      'Поздравляем! Вы выполнили 5 миссий сегодня и получили 1 печенье с предсказанием!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Congratulations! You completed $missions missions today and earned $cookies Fortune Cookie(s)!';
  }

  @override
  String daysCount(int count) {
    return '$count дн.';
  }

  @override
  String get user => 'Пользователь';

  @override
  String get none => 'Нет';

  @override
  String minutesLater(int minutes) {
    return 'через $minutes мин.';
  }

  @override
  String get countLabel => 'Количество';

  @override
  String timesCount(int count) {
    return '$count раз (Всего $count)';
  }

  @override
  String get wakeUpMission => 'Миссия Пробуждение';

  @override
  String get alarmSound => 'Звук будильника';

  @override
  String get gradualVolume => 'Постепенное усиление';

  @override
  String get vibration => 'Вибрация';

  @override
  String get alarmNameAndBackground => 'Название и фон';

  @override
  String get alarmName => 'Название будильника';

  @override
  String get enterAlarmName => 'Введите название будильника';

  @override
  String get save => 'Сохранить';

  @override
  String get missionNone => 'Без миссии';

  @override
  String get missionSnap => 'Snap';

  @override
  String get missionMath => 'Математика';

  @override
  String get missionFortune => 'Удача';

  @override
  String get missionShake => 'Тряска';

  @override
  String get missionFortuneCatch => 'Fortune Catch';

  @override
  String get missionNoDescription => 'Будильник прозвенит без миссии.';

  @override
  String get missionCameraDescription =>
      'Сфотографируйте указанные предметы по порядку, чтобы выключить будильник.';

  @override
  String get missionMathDescription =>
      'Решите математические примеры, чтобы выключить будильник.';

  @override
  String get missionFortuneDescription => 'Выбрана миссия-предсказание.';

  @override
  String get missionShakeDescription =>
      'Потрясите телефон, чтобы выключить будильник.';

  @override
  String get missionFortuneCatchDescription => 'Catch the moving Fortuni!';

  @override
  String get missionWalk => 'Walk';

  @override
  String get missionWalkDescription => 'Walk to turn off the alarm!';

  @override
  String get missionFaceDescription => 'Keep your face in the frame for 10s.';

  @override
  String get walkStepCount => 'Target Steps';

  @override
  String walkSteps(int count) {
    return '$count steps';
  }

  @override
  String get missionNumberOrder => 'Number Order';

  @override
  String get missionNumberOrderDescription =>
      'Tap numbers from 1 to 9 in order.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Next: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Position Memory';

  @override
  String get missionHiddenButtonDescription =>
      'Memorize the lit tiles in order and tap them within 10 seconds.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Tap Sprint';

  @override
  String get missionTapSprintDescriptionShort => 'Tap to fill the meter.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Tap $goalTaps+ times to fill the meter.';
  }

  @override
  String get missionTapSprintTapHere => 'Tap';

  @override
  String get missionTapSprintHint => 'Fills up fast, drains if you pause.';

  @override
  String get missionLeftRight => 'Left / Right';

  @override
  String get missionLeftRightDescriptionShort =>
      'Follow the prompt and pick left or right.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'Get $targetStreak correct in a row.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Tap LEFT';

  @override
  String get missionLeftRightPromptRight => 'Tap RIGHT';

  @override
  String get left => 'Left';

  @override
  String get right => 'Right';

  @override
  String get missionHintInactivity => 'If you stop for 2 minutes, it resets.';

  @override
  String fortuneCatchScore(int score) {
    return 'Score: $score';
  }

  @override
  String get fortuneCatchGoal => 'Goal: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(Catches: $count/$min)';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo Combo!';
  }

  @override
  String get difficulty => 'Сложность';

  @override
  String get difficultyEasy => 'Легко';

  @override
  String get difficultyNormal => 'Средне';

  @override
  String get difficultyHard => 'Сложно';

  @override
  String get problemCount => 'Кол-во задач';

  @override
  String problemsCount(int count) {
    return '$count задач';
  }

  @override
  String get shakeCount => 'Shake Count';

  @override
  String shakeTimes(int count) {
    return '$count times';
  }

  @override
  String missionNumber(int number) {
    return 'Mission $number';
  }

  @override
  String get soundBirds => 'Bird Sounds';

  @override
  String get shakeCountLabel => 'Кол-во встряхиваний';

  @override
  String missionIndex(int index) {
    return 'Миссия $index';
  }

  @override
  String get ringtoneSelect => 'Выбор мелодии';

  @override
  String get vibrationSelect => 'Выбор вибрации';

  @override
  String get defaultRingtone => 'Мелодия по умолчанию';

  @override
  String get classicAlarm => 'Классический будильник';

  @override
  String get digitalAlarm => 'Цифровой будильник';

  @override
  String get birdsSound => 'Пение птиц';

  @override
  String get wavesSound => 'Звук волн';

  @override
  String get defaultVibration => 'Вибрация по умолчанию';

  @override
  String get shortVibration => 'Короткие импульсы';

  @override
  String get longVibration => 'Длинные импульсы';

  @override
  String get heartbeatVibration => 'Сердцебиение';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'Быстрая пульсация';

  @override
  String get permissionRequired => 'Требуется разрешение';

  @override
  String get exactAlarmPermissionDesc =>
      'Для срабатывания будильника точно в срок требуется разрешение \"Расписание и напоминания\".';

  @override
  String get batteryOptimizationPermissionDesc =>
      'Для корректной работы будильника необходимо отключить оптимизацию батареи.';

  @override
  String get overlayPermissionDesc =>
      'Для отображения экрана миссии требуется разрешение \"Отображение поверх других приложений\".';

  @override
  String get cameraMissionFirstImageError =>
      'Пожалуйста, установите хотя бы первое изображение миссии.';

  @override
  String get cameraMissionSequentialImageError =>
      'Пожалуйста, устанавливайте изображения миссии по порядку.';

  @override
  String errorOccurred(String error) {
    return 'Произошла ошибка: $error';
  }

  @override
  String get openSettings => 'Открыть настройки';

  @override
  String get exactAlarmPermissionFail =>
      'Ошибка регистрации будильника. Требуется разрешение на точный будильник.';

  @override
  String get batteryOptimizationPermissionFail =>
      'Ошибка регистрации будильника. Требуется разрешение на исключение из оптимизации батареи.';

  @override
  String get overlayPermissionFail =>
      'Ошибка регистрации будильника. Требуется разрешение на отображение поверх других приложений.';

  @override
  String get unknownAlarmError =>
      'Не удалось зарегистрировать будильник. Произошла неизвестная ошибка.';

  @override
  String get resetTooltip => 'Сброс';

  @override
  String get errorLoadingAlarm =>
      'Не удалось загрузить информацию о будильнике.';

  @override
  String get alarmNotFound => 'Информация о будильнике не найдена.';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'Повтор будильника ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'Выключить будильник';

  @override
  String get startMission => 'Начать миссию';

  @override
  String get fortuneTitle => 'Проверить удачу';

  @override
  String get fortuneMessage =>
      'Проверьте результаты гадания\nи получите скрытые подарки!';

  @override
  String get fortuneAdButton => 'Посмотреть рекламу и узнать результат';

  @override
  String get fortuneLoadingMessage =>
      'Испытайте особое толкование карт таро от предсказателя.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Анализируем выбранные карты таро... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Подумайте о сегодняшней энергии\nи выберите 3 карты.';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return 'Подумайте об энергии $day.$month\nи выберите 3 карты.';
  }

  @override
  String get fortuneNewYearButton =>
      'Посмотреть новогоднее гадание на 2025 год';

  @override
  String get loveFortune => 'Любовь';

  @override
  String get wealthFortune => 'Богатство';

  @override
  String get successFortune => 'Успех';

  @override
  String get fortuneResultTitle => 'Вот ваш результат гадания на сегодня.';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return 'Гадание на $day.$month.$year';
  }

  @override
  String get startDayButton => 'Начать свой день';

  @override
  String get policy => 'Условия и политика конфиденциальности';

  @override
  String get support => 'Поддержка';

  @override
  String get defaultAlarmBehavior => 'Поведение будильника по умолчанию';

  @override
  String get defaultAlarmVolume => 'Громкость по умолчанию';

  @override
  String get defaultAlarmVolumeDescription =>
      'Громкость, применяемая при создании нового будильника.';

  @override
  String get gradualVolumeDescription =>
      'Постепенное увеличение громкости будильника.';

  @override
  String get defaultVibrationDescription =>
      'Включает вибрацию по умолчанию при создании нового будильника.';

  @override
  String get defaultInterval => 'Интервал по умолчанию';

  @override
  String get maxSnoozeCountLabel => 'Макс. количество повторов';

  @override
  String get minutes => 'мин';

  @override
  String get times => 'раз';

  @override
  String cupsCount(int current, int goal) {
    return '($current/$goal ст.)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current/$goal раз)';
  }

  @override
  String get missionGym => 'Сходить в спортзал';

  @override
  String get missionWorkout => 'Домашняя тренировка';

  @override
  String get missionDiary => 'Вести дневник';

  @override
  String get missionBedMaking => 'Заправить постель';

  @override
  String get missionStretching => 'Растяжка';

  @override
  String get missionReading => 'Чтение 10 мин';

  @override
  String get missionPlanning => 'План на день';

  @override
  String get missionBreakfast => 'Позавтракать';

  @override
  String get missionMeditation => 'Медитация 5 мин';

  @override
  String get missionEnglishWords => 'Выучить 5 слов';

  @override
  String get missionVentilation => 'Проветривание';

  @override
  String get missionCleaning => 'Уборка комнаты';

  @override
  String get missionGratitudeDiary => 'Дневник благодарности';

  @override
  String get faqQuestion1 => 'Alarms are not ringing.';

  @override
  String get faqAnswer1 =>
      'Alarms may be delayed or blocked due to the Android system\'s battery optimization feature. Please set all permissions to \'Allow\' in the Settings > Alarm Optimization menu.';

  @override
  String get faqQuestion2 => 'I want to change the mission.';

  @override
  String get faqAnswer2 =>
      'You can change it to the mission you want (Math, Photo, Shake, etc.) in the mission selection menu after tapping the alarm you want to edit in the alarm list.';

  @override
  String get faqQuestion3 => 'How do I set Dark Mode?';

  @override
  String get faqAnswer3 =>
      'You can change the screen theme through the Settings > General > Dark Mode toggle.';

  @override
  String get faqQuestion4 => 'How do I collect fortune cookies?';

  @override
  String get faqAnswer4 =>
      'You can earn fortune cookies every time you dismiss an alarm in the morning or complete a mission. Check your daily fortune with the cookies you\'ve collected!';

  @override
  String get faqQuestion5 => 'Will my data disappear if I delete the app?';

  @override
  String get faqAnswer5 =>
      'Yes, Fortune Alarm stores data inside the device, so deleting the app will delete all your set alarms and mission records. Please be careful.';

  @override
  String get noticeLabel => 'Notice';

  @override
  String get notice1Title => 'Fortune Alarm Official Launch';

  @override
  String get notice1Content =>
      'Hello. Fortune Alarm has been officially launched.\\n\\nCheck your daily fortune with your alarm every morning and start a happy day!\\nWe will continue to provide more diverse features and improved services.\\n\\nThank you.';

  @override
  String get notice2Title => 'Version 1.0.0 Update News';

  @override
  String get notice2Content =>
      'Here is the content of the version 1.0.0 update.\\n\\n1. Supplement mission UI improvement\\n2. System setting integration for accurate alarms\\n3. Dark mode support\\n4. Bug fixes and stability improvements\\n\\nExperience the latest version now!';

  @override
  String get notice3Title => 'Terms of Service Revision Notice';

  @override
  String get notice3Content =>
      'The Terms of Service have been revised.\\n\\nKey revisions:\\n- Strengthened Privacy Policy\\n- Specified service usage scope\\n\\nDetails can be found on the Settings > Terms page.';

  @override
  String get supportContentTitle => 'Inquiry Content';

  @override
  String get supportHint => 'Please enter the content.';

  @override
  String get supportRecipient => 'Recipient (Customer Support)';

  @override
  String get emailCopied => 'Email address copied.';

  @override
  String get copyTooltip => 'Copy';

  @override
  String get supportWorkingDays =>
      'We will try to respond within 24 hours on weekdays.';

  @override
  String get supportEmptyError => 'Please enter the content.';

  @override
  String get supportSubjectPrefix => 'Inquiry Title';

  @override
  String get supportContentPrefix => 'Inquiry Content';

  @override
  String get supportCopySuccessTitle => 'Inquiry Copied';

  @override
  String supportCopySuccessMessage(String email) {
    return 'Inquiry content has been copied to clipboard.\\nWould you like to send an email to $email?';
  }

  @override
  String get copyEmailAction => 'Copy Email Address';

  @override
  String get copyEmailSuccessMessage =>
      'Email address copied. Please paste it in your email app.';

  @override
  String get supportSubmitButton => 'Copy Inquiry and Send';

  @override
  String get shakePhone => 'Пожалуйста, потрясите телефон!';

  @override
  String get englishQuizMission => 'Английская викторина';

  @override
  String get quizInstruction =>
      'Нажимайте на слово слева и его перевод справа, чтобы сопоставить их.';

  @override
  String get missionSuccess => 'Миссия выполнена!';

  @override
  String get goHome => 'На главную';

  @override
  String get quizWord1 => 'Яблоко';

  @override
  String get quizWord1Ans => 'apple';

  @override
  String get quizWord2 => 'Банан';

  @override
  String get quizWord2Ans => 'banana';

  @override
  String get quizWord3 => 'Школа';

  @override
  String get quizWord3Ans => 'school';

  @override
  String get quizWord4 => 'Компьютер';

  @override
  String get quizWord4Ans => 'computer';

  @override
  String get quizWord5 => 'Вода';

  @override
  String get quizWord5Ans => 'water';

  @override
  String get quizWord6 => 'Друг';

  @override
  String get quizWord6Ans => 'friend';

  @override
  String get quizWord7 => 'Семья';

  @override
  String get quizWord7Ans => 'family';

  @override
  String get quizWord8 => 'Дом';

  @override
  String get quizWord8Ans => 'house';

  @override
  String get quizWord9 => 'Книга';

  @override
  String get quizWord9Ans => 'book';

  @override
  String get quizWord10 => 'Любовь';

  @override
  String get quizWord10Ans => 'love';

  @override
  String get quizWord11 => 'Солнце';

  @override
  String get quizWord11Ans => 'sun';

  @override
  String get quizWord12 => 'Луна';

  @override
  String get quizWord12Ans => 'moon';

  @override
  String get quizWord13 => 'Море';

  @override
  String get quizWord13Ans => 'sea';

  @override
  String get quizWord14 => 'Небо';

  @override
  String get quizWord14Ans => 'sky';

  @override
  String get quizWord15 => 'Дерево';

  @override
  String get quizWord15Ans => 'tree';

  @override
  String get missionComplete => 'Миссия завершена!';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get fortuneCheckButton => 'Check Fortune';

  @override
  String get fortuneSelectCards => 'Select 3 cards';

  @override
  String get fortuneDragCards => 'Drag and select 3 cards';

  @override
  String get fortuneDetailTitle => 'Detailed Interpretation';

  @override
  String get labelFineDust => 'Fine Dust';

  @override
  String get labelUltraFineDust => 'Ultra Fine Dust';

  @override
  String get weatherToday => 'Today\'s Weather';

  @override
  String get weatherUpdateMessage =>
      'Updating weather information for current location.';

  @override
  String get weatherDisclaimer =>
      'Observed data may vary depending on local conditions or reception status.';

  @override
  String get weatherSource =>
      'Provided by Meteorological Administration, Korea Environment Corporation';

  @override
  String get locationPermissionTitle => 'Allow Location Permission';

  @override
  String get locationPermissionDesc =>
      'Required to display weather information.';
}
