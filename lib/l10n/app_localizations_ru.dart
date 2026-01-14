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
  String get completedMissions => 'Выполненные миссии';

  @override
  String get noCompletedMissionsHint =>
      'Пока нет выполненных миссий. Достигните цели на сегодня.';

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
  String get totalFortune2026 => 'Прогноз на 2026 год';

  @override
  String get traditionalFortune => 'Тоджонбигёль';

  @override
  String get traditionalSaju => 'Традиционное Саджу';

  @override
  String get faceReading => 'Физиогномика';

  @override
  String get missionFaceReading => 'Миссия по физиогномике';

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
  String get weatherConditionSunny => 'Ясно';

  @override
  String get weatherConditionCloudy => 'Облачно';

  @override
  String get weatherConditionFoggy => 'Туман';

  @override
  String get weatherConditionRainy => 'Дождь';

  @override
  String get weatherConditionSnowy => 'Снег';

  @override
  String get weatherConditionThunderstorm => 'Гроза';

  @override
  String get airQualityGood => 'Хорошо';

  @override
  String get airQualityNormal => 'Нормально';

  @override
  String get airQualityBad => 'Плохо';

  @override
  String get airQualityVeryBad => 'Очень плохо';

  @override
  String get locationUnknown => 'Неизвестное местоположение';

  @override
  String get locationError => 'Ошибка местоположения';

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
  String get privacyPolicy =>
      'Условия использования и Политика конфиденциальности\n\n1. Общие положения\n\nСтатья 1 (Цель)\nНастоящие условия определяют порядок и условия использования сервиса «Fortune Alarm» (далее — «Сервис»), а также права, обязанности и ответственность пользователей и разработчика.\n\nСтатья 2 (Политика конфиденциальности)\n\n1. Сбор и обработка персональных данных\nСервис можно использовать без регистрации. Мы не собираем и не храним персональные данные пользователей на отдельном сервере.\nОднако в процессе использования на устройстве могут создаваться и храниться следующие данные:\n- настройки будильника, записи о выполнении миссий, история получения печенек удачи и т. п.\n\n2. Использование разрешений устройства\nСервис использует следующие разрешения в минимально необходимом объеме:\n- Уведомления (обязательно): для запуска будильника и уведомлений о печеньках удачи.\n- Точный будильник и исключение из оптимизации батареи (обязательно): чтобы будильник срабатывал вовремя даже в режиме энергосбережения.\n- Отображение поверх других приложений (обязательно): для показа экрана будильника на экране блокировки или поверх других приложений.\n- Камера (необязательно): используется только для миссии «Object Snap»; снятые изображения обрабатываются только на устройстве и не передаются на сервер.\n\n3. Реклама и обработка данных\nДля бесплатного предоставления Сервиса мы используем Google AdMob для показа рекламы.\nGoogle может собирать некоторые неперсонифицированные данные, например Advertising ID (ADID), для настройки рекламы.\n- Политика конфиденциальности Google: https://policies.google.com/privacy\n\nСтатья 3 (Хранение и удаление данных)\nСервис является локальным приложением и хранит данные на устройстве пользователя.\nПри удалении приложения все данные, сохраненные на устройстве (будильники, записи миссий и т. п.), будут немедленно удалены и не подлежат восстановлению.\n\nСтатья 4 (Отказ от ответственности)\n1. Информация о «удаче/гороскопе», предоставляемая Сервисом, носит развлекательный характер; ее точность и надежность не гарантируются.\n2. Разработчик не несет ответственности, если будильник не сработал из‑за изменений настроек устройства (отключение уведомлений, оптимизация батареи и т. п.) или системных ошибок.\n\nСтатья 5 (Контакты)\nЕсли у вас есть вопросы или замечания по работе Сервиса, свяжитесь с нами по адресу:\nEmail: seriessnap.co@gmail.com';

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
  String get snoozeSettings => 'Настройки повтора';

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
    return 'Поздравляем! Сегодня вы выполнили $missions миссий и получили $cookies печенье(я) удачи!';
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
  String get alarmNameAndBackground => 'Название и фон будильника';

  @override
  String get customStyle => 'Пользовательский стиль';

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
  String get missionFortuneCatch => 'Лови Фортуни';

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
  String get missionFortuneCatchDescription => 'Поймайте движущегося Фортуни!';

  @override
  String get missionWalk => 'Ходьба';

  @override
  String get missionWalkDescription => 'Пройдитесь, чтобы выключить будильник!';

  @override
  String get missionFaceDescription => 'Держите лицо в рамке 5 секунд.';

  @override
  String get walkStepCount => 'Целевое количество шагов';

  @override
  String walkSteps(int count) {
    return '$count шагов';
  }

  @override
  String get missionNumberOrder => 'Порядок чисел';

  @override
  String get missionNumberOrderDescription =>
      'Нажимайте числа от 1 до 9 по порядку.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Далее: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Запомни позиции';

  @override
  String get missionHiddenButtonDescription =>
      'Запомните подсвеченные плитки по порядку и нажмите их за 10 секунд.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Спринт тапами';

  @override
  String get missionTapSprintDescriptionShort =>
      'Тапайте, чтобы заполнить шкалу.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Тапните $goalTaps+ раз, чтобы заполнить шкалу.';
  }

  @override
  String get missionTapSprintTapHere => 'Тап';

  @override
  String get missionTapSprintHint =>
      'Быстро заполняется, но уменьшается при паузе.';

  @override
  String get missionLeftRight => 'Лево / Право';

  @override
  String get missionLeftRightDescriptionShort =>
      'Следуйте подсказке и выбирайте лево или право.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return '$targetStreak правильных подряд.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Нажмите ЛЕВО';

  @override
  String get missionLeftRightPromptRight => 'Нажмите ПРАВО';

  @override
  String get left => 'Лево';

  @override
  String get right => 'Право';

  @override
  String get missionHintInactivity =>
      'Если остановиться на 2 минуты, сбросится.';

  @override
  String fortuneCatchScore(int score) {
    return 'Счет: $score';
  }

  @override
  String get fortuneCatchGoal => 'Цель: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(Поймано: $count/$min)';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return 'Комбо x$combo!';
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
  String get shakeCount => 'Количество встряхиваний';

  @override
  String shakeTimes(int count) {
    return '$count раз(а)';
  }

  @override
  String missionNumber(int number) {
    return 'Миссия $number';
  }

  @override
  String get soundBirds => 'Звуки птиц';

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
  String get alarmSnooze => 'Отложить будильник';

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
      'Посмотреть новогоднее гадание на 2026 год';

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
  String get missionLearnWords => 'Выучить 5 слов';

  @override
  String get missionVentilation => 'Проветривание';

  @override
  String get missionCleaning => 'Уборка комнаты';

  @override
  String get missionGratitudeDiary => 'Дневник благодарности';

  @override
  String get faqQuestion1 => 'Будильник не звонит.';

  @override
  String get faqAnswer1 =>
      'Будильники могут задерживаться или блокироваться из-за функции оптимизации батареи системы Android. Пожалуйста, установите все разрешения на \'Разрешить\' в меню Настройки > Оптимизация будильника.';

  @override
  String get faqQuestion2 => 'Я хочу изменить миссию.';

  @override
  String get faqAnswer2 =>
      'Вы можете изменить миссию на желаемую (Математика, Фото, Тряска и т. д.) в меню выбора миссии, нажав на будильник, который вы хотите изменить в списке будильников.';

  @override
  String get faqQuestion3 => 'Как установить темную тему?';

  @override
  String get faqAnswer3 =>
      'Вы можете изменить тему экрана с помощью переключателя Настройки > Общие > Темная тема.';

  @override
  String get faqQuestion4 => 'Как собирать печенье с предсказаниями?';

  @override
  String get faqAnswer4 =>
      'Вы можете зарабатывать печенье с предсказаниями каждый раз, когда выключаете будильник утром или выполняете миссию. Проверяйте свою удачу на день с помощью собранного печенья!';

  @override
  String get faqQuestion5 => 'Исчезнут ли мои данные, если я удалю приложение?';

  @override
  String get faqAnswer5 =>
      'Да, Fortune Alarm хранит данные внутри устройства, поэтому удаление приложения приведет к удалению всех ваших установленных будильников и записей миссий. Пожалуйста, будьте осторожны.';

  @override
  String get noticeLabel => 'Объявления';

  @override
  String get notice1Title => 'Официальный запуск Fortune Alarm';

  @override
  String get notice1Content =>
      'Здравствуйте. Fortune Alarm был официально запущен.\n\nПроверяйте свою удачу на день с будильником каждое утро и начинайте счастливый день!\nМы продолжим предоставлять более разнообразные функции и улучшенные услуги.\n\nСпасибо.';

  @override
  String get notice2Title => 'Новости обновления версии 1.0.0';

  @override
  String get notice2Content =>
      'Вот содержание обновления версии 1.0.0.\n\n1. Улучшение интерфейса миссии с витаминами\n2. Интеграция системных настроек для точных будильников\n3. Поддержка темной темы\n4. Исправления ошибок и улучшения стабильности\n\nИспытайте последнюю версию прямо сейчас!';

  @override
  String get notice3Title => 'Уведомление об изменении Условий использования';

  @override
  String get notice3Content =>
      'Условия использования были пересмотрены.\n\nОсновные изменения:\n- Усиленная Политика конфиденциальности\n- Уточнен объем использования сервиса\n\nПодробности можно найти на странице Настройки > Условия.';

  @override
  String get supportContentTitle => 'Содержание запроса';

  @override
  String get supportHint => 'Пожалуйста, введите содержание.';

  @override
  String get supportRecipient => 'Получатель (Служба поддержки)';

  @override
  String get emailCopied => 'Адрес электронной почты скопирован.';

  @override
  String get copyTooltip => 'Копировать';

  @override
  String get supportWorkingDays =>
      'Мы постараемся ответить в течение 24 часов в будние дни.';

  @override
  String get supportEmptyError => 'Пожалуйста, введите содержание.';

  @override
  String get supportSubjectPrefix => 'Заголовок запроса';

  @override
  String get supportContentPrefix => 'Содержание запроса';

  @override
  String get supportCopySuccessTitle => 'Запрос скопирован';

  @override
  String supportCopySuccessMessage(String email) {
    return 'Содержание запроса скопировано в буфер обмена.\nХотите отправить письмо на $email?';
  }

  @override
  String get copyEmailAction => 'Копировать адрес эл. почты';

  @override
  String get copyEmailSuccessMessage =>
      'Адрес электронной почты скопирован. Пожалуйста, вставьте его в ваше почтовое приложение.';

  @override
  String get supportSubmitButton => 'Копировать запрос и отправить';

  @override
  String get shakePhone => 'Пожалуйста, потрясите телефон!';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get fortuneCheckButton => 'Узнать предсказание';

  @override
  String get fortuneSelectCards => 'Выберите 3 карты';

  @override
  String get fortuneDragCards => 'Перетащите и выберите 3 карты';

  @override
  String get fortuneDetailTitle => 'Подробное толкование';

  @override
  String get labelFineDust => 'Мелкая пыль';

  @override
  String get labelUltraFineDust => 'Ультрамелкая пыль';

  @override
  String get weatherToday => 'Погода сегодня';

  @override
  String get weatherUpdateMessage =>
      'Обновляем погоду для текущего местоположения.';

  @override
  String get weatherDisclaimer =>
      'Данные наблюдений могут отличаться в зависимости от местных условий или качества приема.';

  @override
  String get weatherSource =>
      'Источник: Метеорологическая администрация, Корейская корпорация окружающей среды';

  @override
  String get locationPermissionTitle => 'Разрешить доступ к местоположению';

  @override
  String get locationPermissionDesc =>
      'Необходимо для отображения информации о погоде.';
}
