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
  String get morningGreeting =>
      'Доброе утро! Пусть этот день принесет вам удачу.';

  @override
  String get missionWakeUp => 'Миссия: Проснуться';

  @override
  String get missionSupplement => 'Прием витаминов';

  @override
  String get missionWater => 'Выпить 2л воды';

  @override
  String get fortuneCookie => 'Печенье с предсказанием';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get languageKorean => 'Корейский';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageJapanese => 'Японский';

  @override
  String get languageChinese => 'Китайский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageHindi => 'Хинди';

  @override
  String get languageSpanish => 'Испанский';

  @override
  String get languageFrench => 'Французский';

  @override
  String get languageGerman => 'Немецкий';

  @override
  String get languageThai => 'Тайский';

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
  String get allMissionsCompleted => 'Все миссии на сегодня выполнены!';

  @override
  String get rewardReceived => 'Ваша награда — печенье с предсказанием! 🥠';

  @override
  String get confirm => 'ОК';

  @override
  String get missionSuccess => 'Миссия выполнена!';

  @override
  String get cheeringMessage1 => 'Хорошего дня сегодня!';

  @override
  String get cheeringMessage2 => 'Я поддерживаю вас сегодня!';

  @override
  String get cheeringMessage3 => 'Это будет замечательный день.';

  @override
  String get todaysCheering => 'Сообщение дня';

  @override
  String get notificationWakeUpBody => 'Пора просыпаться!';

  @override
  String get notificationMissionBody =>
      'Выполните миссию и выключите будильник!';

  @override
  String get notificationSafetyBody =>
      'Будильник был принудительно закрыт! Пожалуйста, завершите миссию.';

  @override
  String get notificationRingingBody => 'Будильник звенит!';

  @override
  String get snoozePrefix => '[Повтор]';

  @override
  String get exactAlarmPermissionRequired =>
      'Для точного срабатывания будильника требуется разрешение «Точный будильник».';

  @override
  String get overlayPermissionRequired =>
      'Для отображения уведомлений поверх других приложений требуется соответствующее разрешение.';

  @override
  String get deleteAllAlarms => 'Удалить все будильники';

  @override
  String get noAlarms => 'Будильники не установлены.';

  @override
  String get lessThanAMinuteRemaining => 'Менее чем через минуту';

  @override
  String hoursMinutesRemaining(String hours, String minutes) {
    return 'Через $hours ч. $minutes мин.';
  }

  @override
  String minutesRemaining(String minutes) {
    return 'Через $minutes мин.';
  }

  @override
  String get am => 'УТР';

  @override
  String get pm => 'ВЕЧ';

  @override
  String get dailyFortuneCookieReward => 'Ежедневная награда';

  @override
  String get missionRewardInfo => '1 печенье за 5 миссий, 2 — за 10!';

  @override
  String get dailyMission => 'Миссия дня';

  @override
  String goalAchieved(int completed) {
    return '🎉 Цель $completed/5 достигнута!';
  }

  @override
  String missionProgress(int completed) {
    return 'Прогресс: $completed/5';
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
      'Вы уверены, что хотите сбросить список миссий?\\n(Системные миссии сохранятся)';

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
      'Выполненных миссий пока нет. Самое время начать!';

  @override
  String greeting(String userName) {
    return 'Привет, $userName!';
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
  String get viewVariousFortunes => 'Посмотреть все предсказания';

  @override
  String get todaysRecommendation => 'Рекомендация дня';

  @override
  String get checkTodaysFortune => 'Узнать предсказание на сегодня';

  @override
  String get todaysAdvice => 'Совет дня';

  @override
  String get viewSpecificDateFortune => 'Узнать прогноз на определенную дату';

  @override
  String get luckyNumberRecommendation => 'Рекомендация счастливых чисел';

  @override
  String get luckyNumber => 'Счастливое число';

  @override
  String get specificDateFortune => 'Прогноз на выбранную дату';

  @override
  String get specialDayFortune => 'Прогноз на особый день';

  @override
  String get newYearFortune => 'Новогодний прогноз';

  @override
  String get totalFortune2026 => 'Общий прогноз на 2026 год';

  @override
  String get traditionalFortune => 'Традиционное предсказание (Тоджон)';

  @override
  String get traditionalSaju => 'Традиционный анализ Саджу';

  @override
  String get faceReading => 'AI-анализ лица';

  @override
  String get missionFaceReading => 'Миссия: Физиогномика';

  @override
  String get faceFate => 'Судьба по лицу';

  @override
  String get compatibility => 'Совместимость';

  @override
  String get relationshipHarmony => 'Гармония отношений';

  @override
  String get ohaengWood => 'Дерево';

  @override
  String get ohaengFire => 'Огонь';

  @override
  String get ohaengEarth => 'Земля';

  @override
  String get ohaengMetal => 'Металл';

  @override
  String get ohaengWater => 'Вода';

  @override
  String get ohaengWoodSymbol => 'Дерево';

  @override
  String get ohaengFireSymbol => 'Огонь';

  @override
  String get ohaengEarthSymbol => 'Земля';

  @override
  String get ohaengMetalSymbol => 'Металл';

  @override
  String get ohaengWaterSymbol => 'Вода';

  @override
  String get ohaengWoodExplanation =>
      'Энергия Дерева наделяет вас стремлением к росту, состраданием и предприимчивым характером.';

  @override
  String get ohaengFireExplanation =>
      'Энергия Огня делает вас страстной и вежливой натурой, склонной к активности и любви к яркому.';

  @override
  String get ohaengEarthExplanation =>
      'Энергия Земли дарит вам надежность, терпимость и серьезный, неизменный характер.';

  @override
  String get ohaengMetalExplanation =>
      'Энергия Металла наделяет вас решительностью, верностью принципам и хладнокровием.';

  @override
  String get ohaengWaterExplanation =>
      'Энергия Воды дарит вам мудрость, гибкость и высокий интеллект с отличной адаптивностью.';

  @override
  String get cheonganGap => 'Гап';

  @override
  String get cheonganEul => 'Ыль';

  @override
  String get cheonganByeong => 'Пён';

  @override
  String get cheonganJeong => 'Чон';

  @override
  String get cheonganMu => 'Му';

  @override
  String get cheonganGi => 'Ги';

  @override
  String get cheonganGyeong => 'Кён';

  @override
  String get cheonganSin => 'Син';

  @override
  String get cheonganIm => 'Им';

  @override
  String get cheonganGye => 'Ке';

  @override
  String get jijiJa => 'Крыса';

  @override
  String get jijiChuk => 'Бык';

  @override
  String get jijiIn => 'Тигр';

  @override
  String get jijiMyo => 'Кролик';

  @override
  String get jijiJin => 'Дракон';

  @override
  String get jijiSa => 'Змея';

  @override
  String get jijiO => 'Лошадь';

  @override
  String get jijiMi => 'Коза';

  @override
  String get jijiSin => 'Обезьяна';

  @override
  String get jijiYu => 'Петух';

  @override
  String get jijiSul => 'Собака';

  @override
  String get jijiHae => 'Свинья';

  @override
  String get jijiAnimalRat => 'Крыса';

  @override
  String get jijiAnimalOx => 'Бык';

  @override
  String get jijiAnimalTiger => 'Тигр';

  @override
  String get jijiAnimalRabbit => 'Кролик';

  @override
  String get jijiAnimalDragon => 'Дракон';

  @override
  String get jijiAnimalSnake => 'Змея';

  @override
  String get jijiAnimalHorse => 'Лошадь';

  @override
  String get jijiAnimalSheep => 'Коза';

  @override
  String get jijiAnimalMonkey => 'Обезьяна';

  @override
  String get jijiAnimalRooster => 'Петух';

  @override
  String get jijiAnimalDog => 'Собака';

  @override
  String get jijiAnimalPig => 'Свинья';

  @override
  String get assetDefaultBackground => 'Фон по умолчанию';

  @override
  String get assetFortuneyFriends => 'Друзья удачи';

  @override
  String get assetMongchuny => 'Мончхуни';

  @override
  String get assetPanchuny => 'Панчхуни';

  @override
  String get assetTochuny => 'Точхуни';

  @override
  String get assetHochuny => 'Хочхуни';

  @override
  String get assetBear => 'Медведь';

  @override
  String get assetMoon => 'Луна';

  @override
  String get assetBridge => 'Мост';

  @override
  String get assetRoad => 'Дорога';

  @override
  String get assetSky => 'Небо';

  @override
  String get assetMinimalGray => 'Минимальный серый';

  @override
  String get assetDarkMode => 'Темная тема';

  @override
  String get assetSoftBlue => 'Нежно-голубой';

  @override
  String get assetWarmBeige => 'Теплый бежевый';

  @override
  String assetCat(int number) {
    return 'Кошка $number';
  }

  @override
  String assetDog(int number) {
    return 'Собака $number';
  }

  @override
  String assetSea(int number) {
    return 'Море $number';
  }

  @override
  String get categoryCharacter => 'Персонажи';

  @override
  String get categoryAnimal => 'Животные';

  @override
  String get categoryIllustration => 'Иллюстрации';

  @override
  String get categoryLandscape => 'Пейзажи';

  @override
  String get categorySimple => 'Минимализм';

  @override
  String get alarmBackground => 'Фон будильника';

  @override
  String get random => 'Случайный';

  @override
  String get gallery => 'Галерея';

  @override
  String get selectSolidColor => 'Выбрать цвет';

  @override
  String get deleteColor => 'Удалить цвет';

  @override
  String get deleteColorConfirm =>
      'Вы уверены, что хотите удалить этот цвет из списка?';

  @override
  String get deleteMission => 'Удалить миссию';

  @override
  String get deleteMissionConfirm =>
      'Вы уверены, что хотите удалить эту миссию?';

  @override
  String get randomBackgroundDesc =>
      'Новый фон при каждом срабатывании будильника!';

  @override
  String get backgroundDeleted => 'Изображение удалено.';

  @override
  String get pickFromDevice => 'Выбрать из устройства';

  @override
  String get alarmSaveError =>
      'Не удалось сохранить будильник. Произошла неизвестная ошибка.';

  @override
  String errorOccurred(String error) {
    return 'Произошла ошибка: $error';
  }

  @override
  String get openSettings => 'Настройки';

  @override
  String get videoLoadFailed =>
      'Не удалось загрузить видео\\nНажмите, чтобы повторить';

  @override
  String get itsTimeToWakeUp => 'Пора вставать!';

  @override
  String get dismissAlarm => 'Отключить';

  @override
  String get slideToDismiss => 'Смахните, чтобы отключить';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes мин x $count раз';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '$minutes мин · Без ограничений';
  }

  @override
  String get quickAlarm => 'Быстрый будильник';

  @override
  String get setQuickAlarm => 'Установить быстрый будильник';

  @override
  String addMinutes(String minutes) {
    return '+ $minutes мин.';
  }

  @override
  String ringingAt(String time) {
    return 'Прозвенит в $time';
  }

  @override
  String get pleaseSetTime => 'Пожалуйста, установите время.';

  @override
  String get alarmSaved => 'Будильник сохранен.';

  @override
  String get alarmScheduledTitle => 'Будильник установлен';

  @override
  String alarmScheduledBody(String time) {
    return 'Будильник прозвенит в $time.';
  }

  @override
  String get goodDay => 'Это будет чудесный день!';

  @override
  String get luckyDay => 'Желаю дня, полного удачи!';

  @override
  String get cheerUp => 'Желаю отличного и продуктивного дня!';

  @override
  String get stayHappy => 'Наслаждайтесь каждым моментом сегодня!';

  @override
  String get youCanDoIt => 'Сегодня вы можете все!';

  @override
  String get noActiveAlarms => 'Нет активных будильников';

  @override
  String get wealth => 'Богатство';

  @override
  String get love => 'Любовь';

  @override
  String get career => 'Карьера';

  @override
  String get health => 'Здоровье';

  @override
  String get faceAnalysisBasic => 'Анализ лица (базовый)';

  @override
  String get insufficientDataOverallImpression =>
      'Недостаточно данных для точного анализа. Оценка по общему впечатлению.';

  @override
  String get noseStabilityWealthAccuracy =>
      'Четкий контур носа повышает точность прогноза богатства.';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      'Четкий контур рта помогает лучше оценить коммуникацию.';

  @override
  String get improveAnalysisQualityAdvice =>
      'Хорошее освещение и взгляд прямо в камеру улучшат результат.';

  @override
  String get basicAnalysisDescription =>
      'Это базовый результат. Для более точного анализа обеспечьте хорошее освещение и смотрите прямо в камеру. Повторная попытка сделает прогноз более детальным.';

  @override
  String get defaultDailyFortune =>
      'Сегодня отличный день для новых начинаний. Улыбнитесь себе в зеркале — и удача не заставит себя ждать. Немного отдыха принесет неожиданную радость.';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '$vibeСегодня ваша удача в сфере «$topKey» на высоте. Однако стоит быть внимательнее к сфере «$bottomKey».';
  }

  @override
  String get faceShapeVLine => 'V-образное';

  @override
  String get faceShapeSquare => 'Квадратное';

  @override
  String get faceShapeBalanced => 'Сбалансированное';

  @override
  String get faceShapeRound => 'Круглое';

  @override
  String get faceShapeLong => 'Вытянутое';

  @override
  String get faceShapeOval => 'Овальное';

  @override
  String get titleWealthOriented => 'Лицо, притягивающее богатство';

  @override
  String get titleLoveStrong => 'Лицо с сильной любовной энергетикой';

  @override
  String get titleCareerNotable => 'Лицо успешного карьериста';

  @override
  String get titleStableEnergy => 'Лицо со стабильной энергией';

  @override
  String get faceAnalysisComplete => 'Анализ лица завершен!';

  @override
  String get chooseUnlockMethod =>
      'Чтобы узнать свои скрытые предсказания,\\nвыберите один из способов ниже.';

  @override
  String get watchAdForFreeResult => 'Посмотреть рекламу и узнать результат';

  @override
  String get useTwoCookies => 'Использовать 2 печенья';

  @override
  String get checkResult => 'Узнать результат';

  @override
  String get aiAnalyzingFace => 'ИИ анализирует ваше лицо...';

  @override
  String get faceRecognitionComplete => 'Лицо распознано';

  @override
  String get extractingFeatures => 'Извлечение черт...';

  @override
  String get matchingFortuneData => 'Сопоставление данных...';

  @override
  String get adLoadFailedFreeUnlock =>
      'Реклама не загрузилась, поэтому мы открыли результат бесплатно.';

  @override
  String get insufficientCookies => 'Недостаточно печенья';

  @override
  String get insufficientCookiesDesc =>
      'У вас закончились печенья с предсказанием.\\nПосмотрите рекламу, чтобы узнать результат бесплатно!';

  @override
  String get usingTwoCookiesToast =>
      'Использовано 2 печенья для получения результата.';

  @override
  String get todaysFaceAnalysis => 'Анализ лица на сегодня';

  @override
  String totalScoreWithPoints(int score) {
    return 'Общий счет: $score б.';
  }

  @override
  String get adLoadFailFreeAccess =>
      'Реклама не загрузилась. Открыто бесплатно.';

  @override
  String get insufficientCookiesTitle => 'Недостаточно печенья';

  @override
  String get insufficientCookiesMessage =>
      'У вас закончились печенья. Вы можете заработать их, выполняя миссии или просматривая рекламу.';

  @override
  String get useCookiesSnackbar =>
      'Используем 2 печенья для проверки результата.';

  @override
  String get faceAnalysisComplete_v2 => 'Анализ лица завершен!';

  @override
  String get chooseMethodToViewResult =>
      'Чтобы узнать свои скрытые предсказания,\\nвыберите один из способов ниже.';

  @override
  String get watchAdForFree => 'Посмотреть рекламу и узнать результат';

  @override
  String get useTwoCookies_v2 => 'Использовать 2 печенья';

  @override
  String get viewResult => 'Посмотреть результат';

  @override
  String get aiAnalyzingFace_v2 => 'ИИ анализирует ваше лицо...';

  @override
  String get faceRecognitionComplete_v2 => 'Распознавание завершено';

  @override
  String get extractingFeatures_v2 => 'Извлечение признаков...';

  @override
  String get matchingFortuneData_v2 => 'Сопоставление данных...';

  @override
  String get wealthLuck => '💰 Богатство';

  @override
  String get loveLuck => '❤️ Любовь';

  @override
  String get careerLuck => '💼 Карьера';

  @override
  String get healthLuck => '💪 Здоровье';

  @override
  String get tojeongMonthlyGood_0 =>
      'Благородный человек с востока принесет добрые вести. Долгожданные планы начнут сбываться.';

  @override
  String get tojeongMonthlyGood_1 =>
      'Богатство течет к вам рекой. Заботы исчезают, и всё идет как по маслу.';

  @override
  String get tojeongMonthlyGood_2 =>
      'Усилия приносят плоды, и вы получаете поздравления. Ожидается успех в делах или повышение.';

  @override
  String get tojeongMonthlyGood_3 =>
      'Солнце встает после долгой ночи. Трудности позади, наступает время счастья.';

  @override
  String get tojeongMonthlyGood_4 =>
      'Неожиданная удача наполнит ваш кошелек. Малые вложения приведут к большой прибыли.';

  @override
  String get tojeongMonthlyNeutral_0 =>
      'Спокойные будни продолжаются. Месяц пройдет без потрясений.';

  @override
  String get tojeongMonthlyNeutral_1 =>
      'Умеренность принесет мир в душе. Наслаждайтесь простыми радостями.';

  @override
  String get tojeongMonthlyNeutral_2 =>
      'Сделайте паузу в суете. Уделите внимание своему здоровью.';

  @override
  String get tojeongMonthlyNeutral_3 =>
      'Сейчас лучше сохранять текущее положение дел, чем начинать что-то новое.';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'Общение — ключ к успеху. Будьте осторожны в словах, чтобы избежать недопонимания.';

  @override
  String get tojeongMonthlyCaution_0 =>
      'Будьте осторожны во всём. Береженого бог бережет.';

  @override
  String get tojeongMonthlyCaution_1 =>
      'Следите за здоровьем и избегайте чрезмерных нагрузок.';

  @override
  String get tojeongMonthlyCaution_2 =>
      'Избегайте сплетен и не вмешивайтесь в чужие дела.';

  @override
  String get tojeongMonthlyCaution_3 =>
      'Излишняя жадность может привести к беде. Живите по средствам.';

  @override
  String get tojeongMonthlyCaution_4 =>
      'Будьте осторожны с деньгами, чтобы не разочароваться в людях, которым доверяете.';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      'Свежая энергия нового года поможет вам. Планы начнут осуществляться гладко.';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      'В начале года вы встретите помощника. Цените свои отношения с окружающими.';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'Если энтузиазма слишком много, можно совершить ошибку. Спокойно обдумайте долгосрочные планы.';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      'Хорошее начало — половина дела. Смело беритесь за то, что откладывали.';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      'Небольшие перемены в привычках изменят вашу удачу. Попробуйте вставать пораньше.';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      'Еще не время для активных действий. Накапливайте силы и ждите возможности.';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      'Могут всплыть старые проблемы. Не избегайте их, решайте всё сразу.';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      'Сейчас важнее суть, а не внешние результаты. Поспешность может навредить.';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      'Как мы ждем весну в конце зимы, так и возможности откроются перед терпеливыми.';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      'Идите своим путем спокойно, не отвлекаясь на шум вокруг.';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      'Энергия пробуждения природы дарит вам новые шансы. Не сомневайтесь и примите вызов.';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      'Месяц новых знакомств. Позитивный настрой принесет отличные плоды.';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      'В вихре перемен легко потерять фокус. Контролируйте свои эмоции.';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      'Ваш потенциал раскрывается, как росток из земли. Будьте уверены в себе.';

  @override
  String get tojeongMonthlySpecial_3_4 =>
      'К вам придут важные люди. Откройте свое сердце для новых связей.';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      'Ваше благосостояние вырастет. Усилия принесут финансовое вознаграждение.';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      'Удача в делах с документами. Контракты или экзамены пройдут успешно.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      'Возможны непредвиденные расходы. Уделите внимание управлению бюджетом.';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      'Ваше обаяние расцветает. Будьте инициативны в общении.';

  @override
  String get tojeongMonthlySpecial_4_4 =>
      'Хорошее время для инвестиций или сбережений — удача на вашей стороне.';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      'Гармония в доме принесет радость и стабильность в отношениях с близкими.';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      'Доброта к окружающим вернется к вам благословением. Помогайте другим.';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'Небольшое недопонимание может привести к ссоре. Будьте терпимее.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      'Семейный месяц. Проведите время с родными — это основа вашего благополучия.';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      'Оглянитесь вокруг со спокойной душой — вы заметите то важное, что упускали.';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      'Ваши труды будут замечены. Возможен карьерный рост или общественное признание.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      'Энергия действия растет. Хорошее время для смены деятельности или новой сферы.';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'Не забегайте слишком далеко вперед. Оставайтесь скромными и внимательными.';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      'Запаситесь силами перед летним зноем. Полезно будет проверить здоровье.';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      'Подведите итоги полугодия и наметьте планы на вторую половину года.';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      'Время, когда страсть ведет к результатам. Смело идите к своим целям.';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      'Новые возможности или важные встречи ждут вас в поездке.';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      'Здоровье может потребовать внимания. Избегайте переутомления.';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      'Сохраняйте энтузиазм даже в трудные моменты. Ваши усилия окупятся.';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      'Найдите время для восстановления сил. Путешествие принесет удачу.';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      'Терпение начинает приносить плоды. Не торопите события, всему свое время.';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      'Старые нерешенные вопросы наконец найдут ответы. Используйте свою мудрость.';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      'На финишной прямой легко расслабиться. Сохраняйте концентрацию до конца.';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      'Последний рывок перед сезоном урожая. Не сбавляйте темп.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      'Ожидайте помощи. Если трудно — не стесняйтесь просить совета.';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      'Время изобилия. И в деньгах, и в любви наступает прекрасная пора.';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      'Ваши старания принесут даже лучший результат, чем вы ожидали.';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'Доходы растут, но и расходы могут увеличиться. Планируйте бюджет разумно.';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      'Время щедрости. Поделитесь своим успехом — и получите еще больше.';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      'Отличный момент для примирения. Сделайте первый шаг.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      'Ваш авторитет растет, а имя становится известным. Вы заслужите доверие.';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      'Успех в интеллектуальной деятельности. Хорошее время для учебы и исследований.';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      'С ростом статуса растет и ответственность. Следите за словами и поступками.';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'Ваш успех возвышается до небес. Раскройте свои таланты в полной мере.';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      'Месяц для внутренней мудрости. Полезно глубокое размышление и чтение.';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      'Время мудрости и подготовки к будущему. Оглянитесь назад, чтобы сделать шаг вперед.';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      'Финансовая стабильность близко, но избегайте рискованных авантюр.';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      'Возможно чувство одиночества. Попробуйте первыми пойти навстречу людям.';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      'Укрепляйте свою внутреннюю силу и заботьтесь о практичности в делах.';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      'Подводя итоги года, проанализируйте ошибки и подготовьтесь к новым вызовам.';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      'Неожиданная удача под конец года. Ждите прибыли или хороших новостей.';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      'Награда за долгий и упорный труд. Месяц завершения важных дел.';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      'Частые встречи могут утомить или привести к лишним тратам. Знайте меру.';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      'Конец — это начало чего-то нового. Планируйте будущее с надеждой.';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      'Проявляйте душевную теплоту — она вернется к вам удачей в новом году.';

  @override
  String get todaysFaceFortune => 'Гадание по лицу на сегодня';

  @override
  String get detailedAnalysis => 'Подробный анализ';

  @override
  String get eyeInsight => '👁️ Глаза (Проницательность)';

  @override
  String get noseWealth => '👃 Нос (Богатство)';

  @override
  String get mouthLateLuck => '👄 Рот (Удача в будущем)';

  @override
  String get overallAnalysisTitle => 'Общий анализ';

  @override
  String get shareResultTitle => 'Мой результат анализа лица';

  @override
  String shareResultDesc(String title) {
    return 'Результат ИИ-анализа лица.\\n$title';
  }

  @override
  String get shareResultTotalScore => 'Общий счет';

  @override
  String get shareResultWealth => 'Удача в богатстве';

  @override
  String get shareResultLove => 'Удача в любви';

  @override
  String get shareResultCareer => 'Удача в карьере';

  @override
  String get shareResultHealth => 'Удача в здоровье';

  @override
  String get shareResultText => 'Поделиться результатом';

  @override
  String get wakeUpComplete => 'Пробуждение завершено!';

  @override
  String get collapseOptions => 'Свернуть настройки';

  @override
  String get expandOptions => 'Дополнительно';

  @override
  String get snoozeAlarm => 'Отложить';

  @override
  String get interval => 'Интервал';

  @override
  String get maxSnoozeCount => 'Макс. повторов';

  @override
  String get unlimited => 'Без ограничений';

  @override
  String get permissionRequired => 'Требуется разрешение';

  @override
  String get exactAlarmFailMessage =>
      'Не удалось установить будильник. Нужно включить разрешение на «Точный будильник».';

  @override
  String get batteryOptimFailMessage =>
      'Не удалось установить будильник. Нужно добавить приложение в исключения оптимизации батареи.';

  @override
  String get overlayFailMessage =>
      'Не удалось установить будильник. Нужно разрешение на отображение поверх других приложений.';

  @override
  String get loadingDelay => 'Загрузка...';

  @override
  String get loading => 'Загрузка...';

  @override
  String get previewFail => 'Ошибка предпросмотра';

  @override
  String get bgDefault => 'Фон по умолчанию';

  @override
  String get bgFortuneFriends => 'Друзья удачи';

  @override
  String get bgMongChuni => 'Мончхуни';

  @override
  String get bgPanChuni => 'Панчхуни';

  @override
  String get bgToChuni => 'Точхуни';

  @override
  String get bgHoChuni => 'Хочхуни';

  @override
  String get bgBear => 'Медведь';

  @override
  String get bgMoon => 'Луна';

  @override
  String get bgSea => 'Море';

  @override
  String get bgBridge => 'Мост';

  @override
  String get bgRoad => 'Дорога';

  @override
  String get bgSky => 'Небо';

  @override
  String get bgMinimalGray => 'Минимальный серый';

  @override
  String get bgDarkMode => 'Темная тема';

  @override
  String get bgSoftBlue => 'Нежно-голубой';

  @override
  String get bgWarmBeige => 'Теплый бежевый';

  @override
  String get dateFormatMdyE => 'd/M (E)';

  @override
  String get deleteAlarm => 'Удалить будильник';

  @override
  String get firstAlarmGuideTitle => 'Будильников пока нет';

  @override
  String get firstAlarmGuideDesc =>
      'Установите счастливый будильник и\nначните бодрый день!';

  @override
  String get addAlarm => 'Добавить будильник';

  @override
  String get addFirstAlarm => 'Создать первый будильник';

  @override
  String get deleteAlarmConfirm => 'Удалить этот будильник?';

  @override
  String get welcomeMessage => 'Приятно познакомиться!';

  @override
  String get whenToRing => 'Когда мне вас разбудить?';

  @override
  String get next => 'Далее';

  @override
  String get retryFortune => 'Попробовать еще раз';

  @override
  String get retryFortuneDesc =>
      'Не нравится результат?\nПосмотрите рекламу, чтобы попробовать еще раз!';

  @override
  String get tapToReveal => 'Нажмите, чтобы узнать судьбу';

  @override
  String get redrawButton => 'Перетянуть';

  @override
  String get defaultFortuneGreeting => 'Узнайте свое предсказание на сегодня!';

  @override
  String get registerProfile => 'Зарегистрировать профиль';

  @override
  String get todaysFortuneTitle => 'Предсказание на сегодня';

  @override
  String get fortuneCheckSubtitle =>
      'Каким будет ваш день? Узнайте прямо сейчас.';

  @override
  String get supportSection => 'Поддержка';

  @override
  String get rateApp => 'Оценить приложение';

  @override
  String get shareWithFriends => 'Поделиться с друзьями';

  @override
  String get shareAppMessage =>
      'Попробуйте \'Fortune Alarm\'! Просыпайтесь каждое утро со своим прогнозом на день. https://play.google.com/store/apps/details?id=com.seriessnap.fortunealarm';

  @override
  String get locationPermissionRequiredWeather =>
      'Для получения информации о погоде требуется разрешение на доступ к местоположению.';

  @override
  String get turnOnLocationService => 'Пожалуйста, включите службы геолокации';

  @override
  String get checkWeatherLocationRequired => 'Местоположение для погоды';

  @override
  String get themeColor => 'Цвет темы';

  @override
  String get confirmDelete => 'Вы уверены, что хотите удалить его?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get wealthLuckWithIcon => '💰 Богатство';

  @override
  String get loveLuckWithIcon => '❤️ Любовная удача';

  @override
  String get careerLuckWithIcon => '💼 Удача в карьере';

  @override
  String get healthLuckWithIcon => '💪 Здоровье и энергия';

  @override
  String get mouthFortune => '👄 Уста (удача зрелости)';

  @override
  String get comprehensiveAnalysis => 'Общий разбор';

  @override
  String get todaysFaceResult => 'Результат анализа лица за сегодня';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'Результат AI-анализа лица.\\n$title';
  }

  @override
  String get shareResult => 'Поделиться результатом';

  @override
  String get faceVibeSmile0 =>
      'Ваша яркая улыбка сегодня заряжает окружающих позитивом.';

  @override
  String get faceVibeSmile1 =>
      'Эта лучезарная улыбка говорит о бодрой и живой энергии дня.';

  @override
  String get faceVibeSmile2 =>
      'Мягкое выражение лица притягивает поддержку и доброжелательных людей.';

  @override
  String get faceVibeSmile3 =>
      'Уверенная улыбка поможет спокойно пройти любые сложности.';

  @override
  String get faceVibeSmile4 =>
      'Освежающая улыбка очищает застоявшуюся энергию и открывает путь удаче.';

  @override
  String get faceVibeEye0 =>
      'Искрящийся взгляд показывает сильную волю и готовность действовать.';

  @override
  String get faceVibeEye1 =>
      'Собранный взгляд — знак точного чутья и здравого суждения.';

  @override
  String get faceVibeEye2 =>
      'Чистый, глубокий взгляд говорит о искреннем сердце и хороших новостях.';

  @override
  String get faceVibeEye3 =>
      'Спокойный, уверенный взгляд вызывает уважение и доверие.';

  @override
  String get faceVibeEye4 =>
      'Огонь в глазах вдохновляет людей рядом и усиливает вашу харизму.';

  @override
  String get faceVibeNeutral0 =>
      'Спокойное выражение лица дарит внутреннюю устойчивость.';

  @override
  String get faceVibeNeutral1 =>
      'Ровный тон и спокойствие отражают рассудительную, мудрую энергию.';

  @override
  String get faceVibeNeutral2 =>
      'Сбалансированные черты обещают размеренный и ровный день.';

  @override
  String get faceVibeNeutral3 =>
      'Сдержанность помогает принимать важные решения без лишних эмоций.';

  @override
  String get faceVibeNeutral4 =>
      'Собранность успокаивает окружающих и облегчает сотрудничество.';

  @override
  String get dailyFortuneWealth0 =>
      'Небольшой порядок в делах и финансах сегодня даст хороший рост.';

  @override
  String get dailyFortuneWealth1 =>
      'Денежная удача сильна. Перепроверьте расчеты — это принесет выгоду.';

  @override
  String get dailyFortuneWealth2 =>
      'Внимание к деталям может привести к приятной неожиданной прибыли.';

  @override
  String get dailyFortuneWealth3 =>
      'Финансовые возможности могут появиться из неожиданных источников.';

  @override
  String get dailyFortuneWealth4 =>
      'Хороший день для взвешенных покупок и продуманных инвестиций.';

  @override
  String get dailyFortuneWealth5 =>
      'Энергия притяжения денег сильна — наведите порядок в кошельке и счетах.';

  @override
  String get dailyFortuneWealth6 =>
      'Удача накапливается постепенно: усилия начинают давать результат.';

  @override
  String get dailyFortuneWealth7 =>
      'Лучше стабильные сбережения, чем крупные траты. Держите курс ровно.';

  @override
  String get dailyFortuneWealth8 =>
      'Ваша наблюдательность заметит финансовый шанс — будьте внимательны.';

  @override
  String get dailyFortuneWealth9 =>
      'Щедрость сегодня вернется к вам умноженной.';

  @override
  String get dailyFortuneLove0 =>
      'Первый шаг и мягкие слова помогут снять напряжение в отношениях.';

  @override
  String get dailyFortuneLove1 =>
      'Честный и ясный разговор сегодня лучше любых догадок.';

  @override
  String get dailyFortuneLove2 =>
      'Доброжелательность притягивает хорошие связи. Маленькая забота — большой эффект.';

  @override
  String get dailyFortuneLove3 =>
      'Ваша естественная харизма особенно заметна. Возможны приятные знакомства.';

  @override
  String get dailyFortuneLove4 =>
      'День примирений: старые недопонимания проще решить спокойно.';

  @override
  String get dailyFortuneLove5 =>
      'Слушайте внимательнее — это ваш главный козырь в отношениях.';

  @override
  String get dailyFortuneLove6 =>
      'Не переживайте в одиночку: попросить совет сегодня особенно вовремя.';

  @override
  String get dailyFortuneLove7 =>
      'Искренность укрепляет доверие. Держите слово — это усилит связь.';

  @override
  String get dailyFortuneLove8 =>
      'Гармония в доме и на работе. Больше смеха — больше удачи.';

  @override
  String get dailyFortuneLove9 =>
      'Поблагодарите тех, кто вам дорог: это раскроет поток теплых эмоций.';

  @override
  String get dailyFortuneCareer0 =>
      'Собранность и фокус помогут сделать главное без лишней суеты.';

  @override
  String get dailyFortuneCareer1 =>
      'Наблюдательность и простые решения дадут лучший результат.';

  @override
  String get dailyFortuneCareer2 =>
      'Энергии хватит довести задачи до конца. Делайте шаг за шагом.';

  @override
  String get dailyFortuneCareer3 =>
      'Лидерские качества заметны: к вашему мнению сегодня прислушиваются.';

  @override
  String get dailyFortuneCareer4 =>
      'Отличный день для сложных задач — решения приходят яснее обычного.';

  @override
  String get dailyFortuneCareer5 =>
      'Ваша эффективность заметна. Возможны признание и хорошие новости по работе.';

  @override
  String get dailyFortuneCareer6 =>
      'Смело начинайте новое: старт сегодня особенно удачный.';

  @override
  String get dailyFortuneCareer7 =>
      'Производительность растет. Самое время закрыть отложенные дела.';

  @override
  String get dailyFortuneCareer8 =>
      'Идеи приходят легко — записывайте, чтобы не упустить шанс.';

  @override
  String get dailyFortuneCareer9 =>
      'Терпение будет вознаграждено. Дойдите до финиша — и получите результат.';

  @override
  String get dailyFortuneHealth0 =>
      'Стабильное самочувствие: держите режим — и быстро восстановитесь.';

  @override
  String get dailyFortuneHealth1 =>
      'Энергии много, но не перегружайтесь. Комфортный темп — лучший выбор.';

  @override
  String get dailyFortuneHealth2 =>
      'Короткий отдых заметно улучшит настроение и концентрацию.';

  @override
  String get dailyFortuneHealth3 =>
      'Легкая физическая активность усилит бодрость и ясность.';

  @override
  String get dailyFortuneHealth4 =>
      'Заряда хватит на весь день — вы выносливее, чем обычно.';

  @override
  String get dailyFortuneHealth5 =>
      'Поддержите нервную систему: дыхание, медитация или тишина пойдут на пользу.';

  @override
  String get dailyFortuneHealth6 =>
      'Восстановление быстрое: даже небольшая усталость пройдет легко.';

  @override
  String get dailyFortuneHealth7 =>
      'Здоровый вид заметен — возможны комплименты и приятное внимание.';

  @override
  String get dailyFortuneHealth8 =>
      'Питание и сон укрепят удачу. Позаботьтесь о базовых вещах.';

  @override
  String get dailyFortuneHealth9 =>
      'Свежий воздух и вода — лучший «витамин» сегодня.';

  @override
  String get dailyFortuneTipWealth0 =>
      'Перепроверьте подписки и мелкие расходы — там часто прячется лишнее.';

  @override
  String get dailyFortuneTipWealth1 =>
      'Не покупайте на эмоциях. Лучше взять то, что действительно нужно.';

  @override
  String get dailyFortuneTipWealth2 =>
      'Фиксируйте важные договоренности — так вы избежите недоразумений.';

  @override
  String get dailyFortuneTipWealth3 =>
      'Ищите «утечки» бюджета: мелочи складываются в сумму.';

  @override
  String get dailyFortuneTipWealth4 =>
      'Перед покупкой подождите 10 минут — импульс уйдет, решение станет яснее.';

  @override
  String get dailyFortuneTipWealth5 =>
      'Крупные сделки лучше делать осторожно. Если нужно — советуйтесь со специалистом.';

  @override
  String get dailyFortuneTipWealth6 =>
      'Закройте долги или напомните о том, что вам должны.';

  @override
  String get dailyFortuneTipWealth7 =>
      'Будьте внимательны к деньгам: сегодня есть риск лишних трат или потерь.';

  @override
  String get dailyFortuneTipWealth8 =>
      'Практичность важнее показухи. Не тратьтесь ради впечатления.';

  @override
  String get dailyFortuneTipWealth9 =>
      'Играйте честно: обходные пути сегодня могут испортить удачу.';

  @override
  String get dailyFortuneTipLove0 =>
      'Если вы на взводе — сначала вдохните, потом отвечайте.';

  @override
  String get dailyFortuneTipLove1 =>
      'Короткое уточнение лучше длинных объяснений при недопонимании.';

  @override
  String get dailyFortuneTipLove2 =>
      'Пунктуальность сегодня особенно укрепляет доверие.';

  @override
  String get dailyFortuneTipLove3 =>
      'Говорите по делу — так вы сбережете силы и эмоции.';

  @override
  String get dailyFortuneTipLove4 => 'Вежливость важна даже с самыми близкими.';

  @override
  String get dailyFortuneTipLove5 =>
      'Сначала комплимент, потом замечание — это откроет больше дверей.';

  @override
  String get dailyFortuneTipLove6 =>
      'Думайте перед словами. Важные детали лучше закрепить письменно.';

  @override
  String get dailyFortuneTipLove7 =>
      'Не делайте выводов по одному эпизоду — дайте ситуации время.';

  @override
  String get dailyFortuneTipLove8 =>
      'Если тема тяжелая — перенесите разговор на более спокойный момент.';

  @override
  String get dailyFortuneTipLove9 =>
      'Соблюдайте границы: уважение сегодня важнее правоты.';

  @override
  String get dailyFortuneTipCareer0 =>
      'Начните с самого важного: первое действие задает темп всему дню.';

  @override
  String get dailyFortuneTipCareer1 =>
      'Не распыляйтесь — лучше меньше задач, но качественно.';

  @override
  String get dailyFortuneTipCareer2 =>
      'Сделайте короткий план на 3 пункта — это ускорит работу.';

  @override
  String get dailyFortuneTipCareer3 =>
      'Перепроверьте сроки и детали — мелкая ошибка может стоить времени.';

  @override
  String get dailyFortuneTipCareer4 =>
      'Попросите помощь, если застряли. Сегодня это сэкономит силы.';

  @override
  String get dailyFortuneTipCareer5 =>
      'Не спорьте ради спора: лучше предложите решение.';

  @override
  String get dailyFortuneTipCareer6 =>
      'Закройте «хвосты» — они сильнее всего съедают энергию.';

  @override
  String get dailyFortuneTipCareer7 =>
      'Избегайте многозадачности: одно дело за раз даст лучший результат.';

  @override
  String get dailyFortuneTipCareer8 =>
      'Идеи записывайте сразу — мозг сегодня быстро переключается.';

  @override
  String get dailyFortuneTipCareer9 =>
      'Поставьте точку в начатом: завершение принесет уверенность.';

  @override
  String get dailyFortuneTipHealth0 =>
      'Вода и сон — ваш главный ресурс сегодня.';

  @override
  String get dailyFortuneTipHealth1 =>
      'Не пропускайте приемы пищи: стабильный уровень энергии важнее всего.';

  @override
  String get dailyFortuneTipHealth2 =>
      'Сделайте разминку: спина и шея скажут спасибо.';

  @override
  String get dailyFortuneTipHealth3 =>
      'Снижение стресса важнее скорости. Не загоняйте себя.';

  @override
  String get dailyFortuneTipHealth4 =>
      'Короткая прогулка даст лучший эффект, чем кофе.';

  @override
  String get dailyFortuneTipHealth5 =>
      'Не перенапрягайтесь: сегодня лучше «в меру», чем «на максимум».';

  @override
  String get dailyFortuneTipHealth6 =>
      'Если устали — сделайте паузу без чувства вины.';

  @override
  String get dailyFortuneTipHealth7 =>
      'Следите за осанкой: это влияет и на настроение, и на самочувствие.';

  @override
  String get dailyFortuneTipHealth8 =>
      'Легкая еда и теплый чай помогут держать ритм.';

  @override
  String get dailyFortuneTipHealth9 =>
      'Свежий воздух и дыхание — быстрый способ перезагрузиться.';

  @override
  String get eyeAnalysisTypeSharp => 'Острый взгляд';

  @override
  String get eyeAnalysisTypeDeep => 'Глубокий взгляд';

  @override
  String get eyeAnalysisTypeBalanced => 'Сбалансированный взгляд';

  @override
  String get eyeExpressionBright => 'Светлый и открытый';

  @override
  String get eyeExpressionGentle => 'Мягкий и добрый';

  @override
  String get eyeExpressionStrong => 'Сильный и уверенный';

  @override
  String get eyeExpressionSteady => 'Спокойный и устойчивый';

  @override
  String get eyePostureTilt => 'С легким наклоном';

  @override
  String get eyePostureStraight => 'Прямой';

  @override
  String get noseInsufficient => 'Недостаточно выражено';

  @override
  String get noseWealthRich => 'Сильный денежный потенциал';

  @override
  String get noseWealthPlanner => 'Рациональный финансовый стиль';

  @override
  String get noseWealthBalanced => 'Стабильная денежная удача';

  @override
  String get mouthExpressionBlessing => 'Добрые слова приносят удачу';

  @override
  String get mouthExpressionReliable => 'Речь вызывает доверие';

  @override
  String get mouthExpressionLucky => 'Слова притягивают возможности';

  @override
  String get supplementAlarmTitle => 'Пора принять витамины! 💊';

  @override
  String get alarmVolume => 'Громкость будильника';

  @override
  String get alarmTimeList => 'Список времени будильников';

  @override
  String get noAlarmTimesAdded => 'Время будильника не добавлено';

  @override
  String get alarmTimeDeleted => 'Время будильника удалено';

  @override
  String get addAlarmTime => 'Добавить время будильника';

  @override
  String get editAlarmTime => 'Изменить время будильника';

  @override
  String get defaultRingtone => 'Мелодия по умолчанию';

  @override
  String get takeSupplementsNow =>
      'Пожалуйста, примите свои добавки и запишите это!';

  @override
  String get nextTime => 'Принять позже';

  @override
  String get take => 'Принять';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationTime => 'Время уведомления';

  @override
  String get start => 'Начать';

  @override
  String get end => 'Конец';

  @override
  String get notificationInterval => 'Интервал уведомлений';

  @override
  String get waterDrankToday => 'Вода, выпитая сегодня';

  @override
  String get goal => 'Цель';

  @override
  String get cup => 'Чашка';

  @override
  String get waterIntakeRecord => 'Запись потребления воды';

  @override
  String get remainingAmount => 'Оставшееся количество';

  @override
  String get ml => 'мл';

  @override
  String minutesFormat(String minutes) {
    return '$minutes мин';
  }

  @override
  String get drinkWater => 'Пить воду';

  @override
  String get supplement => 'Добавка';

  @override
  String get water => 'Вода';

  @override
  String get morning => 'Утро';

  @override
  String get afternoon => 'День';

  @override
  String get evening => 'Вечер';

  @override
  String get takeSupplement => 'Принять добавку';

  @override
  String get goalAchievedTitle => 'Цель достигнута!';

  @override
  String get waterIntake => 'Потребление воды';

  @override
  String get remindTime => 'Время напоминания';

  @override
  String get alarmRingtone => 'Мелодия будильника';

  @override
  String get snoozeTime => 'Время повтора';

  @override
  String get snoozeDescription =>
      'Время по умолчанию при выборе \'Принять позже\'';

  @override
  String get oneHour => '1 час';

  @override
  String get mouthExpressionOpen => 'Открытость и искренность';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'Сегодня в центре внимания — $topKey, а обратить внимание стоит на $bottomKey.';
  }

  @override
  String get overallVibeWealthRich => 'Энергия достатка';

  @override
  String get overallVibeWealthSteady => 'Стабильность в финансах';

  @override
  String get overallVibeLoveCharisma => 'Привлекательность и харизма';

  @override
  String get overallVibeLoveTrust => 'Доверие и тепло';

  @override
  String get overallVibeCareerSmart => 'Умная стратегия';

  @override
  String get overallVibeCareerSteady => 'Уверенный темп';

  @override
  String get overallVibeHealth => 'Ровная энергия';

  @override
  String get overallActionPrudent => 'Действуйте осмотрительно';

  @override
  String get overallActionConfident => 'Действуйте уверенно';

  @override
  String get adviceHealth0 =>
      'Сделайте паузу и восстановите дыхание — это быстро вернет ясность.';

  @override
  String get adviceHealth1 =>
      'Сегодня лучше мягкий режим: сон и вода дадут максимум эффекта.';

  @override
  String get adviceHealth2 =>
      'Легкая активность и свежий воздух помогут держать тонус.';

  @override
  String get adviceWealth0 =>
      'Проверьте мелкие расходы: там чаще всего скрывается лишнее.';

  @override
  String get adviceWealth1 =>
      'Ставьте приоритет на надежность: сегодня выигрывает аккуратный расчет.';

  @override
  String get adviceWealth2 =>
      'Не гонитесь за быстрым: стабильный шаг принесет больше прибыли.';

  @override
  String get adviceLove0 =>
      'Слушайте внимательнее — люди сегодня особенно ценят заботу.';

  @override
  String get adviceLove1 =>
      'Скажите прямо и мягко: честность сейчас важнее красивых слов.';

  @override
  String get adviceLove2 =>
      'Не спешите с выводами — дайте чувствам успокоиться.';

  @override
  String get adviceCareer0 =>
      'Упростите задачи и действуйте по плану — эффективность будет высокой.';

  @override
  String get adviceCareer1 =>
      'Держите фокус на главном: сегодня это принесет быстрый прогресс.';

  @override
  String get adviceCareer2 =>
      'Закрывайте начатое до конца — результат заметят.';

  @override
  String get sajuFortune2024Gap =>
      '🌿 Общий прогноз на 2024 год (Гапджин, год Синего Дракона): \'Год новых начинаний и мощного рывка вперед\'. Год Гапджин символизирует рост и процветание. Это время, когда ваши идеи начнут приносить плоды. Энергия Дерева (Гап) встречается с силой Дракона (Джин), создавая идеальные условия для смелых решений и расширения горизонтов. Будьте готовы к динамичным переменам и верьте в свои силы.';

  @override
  String get sajuFortune2024Eul =>
      '🍃 Прогноз на 2024 год (Ыль, энергия дерева): год гибкости и роста. Выиграют те, кто умеет подстраиваться и учиться новому. Делайте ставку на развитие навыков и укрепление связей.';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 Прогноз на 2024 год (Пён, энергия огня): время активности и смелых шагов. Инициатива принесет результаты, но важно не перегореть и соблюдать баланс.';

  @override
  String get sajuFortune2024Jeong =>
      '🕯️ Прогноз на 2024 год (Чон, мягкий огонь): год тонких решений и внимательности. Побеждают аккуратность, дипломатия и работа с деталями.';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ Прогноз на 2024 год (Му, энергия земли): период укрепления фундамента. Хорошо закрывать хвосты, наводить порядок и строить долгосрочные планы.';

  @override
  String get sajuFortune2024Gi =>
      '🌾 Прогноз на 2024 год (Ки, мягкая земля): год спокойной стабильности и терпения. Малые шаги дадут ощутимый результат, если действовать регулярно.';

  @override
  String get sajuFortune2024Gyeong =>
      '⚙️ Прогноз на 2024 год (Кён, энергия металла): время дисциплины и четких решений. Структура и правила помогут добиться большего.';

  @override
  String get sajuFortune2024Sin =>
      '🗡️ Прогноз на 2024 год (Син, утонченный металл): год точности и выбора приоритетов. Отсекайте лишнее — и вы увидите прогресс.';

  @override
  String get sajuFortune2024Im =>
      '🌊 Прогноз на 2024 год (Им, энергия воды): период движения и расширения. Учеба, поездки и новые знакомства принесут удачу.';

  @override
  String get sajuFortune2024Gye =>
      '💧 Прогноз на 2024 год (Ке, мягкая вода): год интуиции и гибких переговоров. Слушайте себя и выбирайте мягкую стратегию.';

  @override
  String get sajuFortune2025Gap =>
      '🌿 Прогноз на 2025 год (Кап, энергия дерева): время смелых стартов и роста. Начатое сейчас может стать крупным проектом.';

  @override
  String get sajuFortune2025Eul =>
      '🐍 Общий прогноз на 2025 год (Ыльса, год Синей Змеи): \'Год мудрости, гибкости и внутреннего роста\'. Год Ыльса требует проницательности и мягкого подхода. Змея символизирует интеллект, а энергия Ыль (Дерево) добавляет стремление к развитию. Это отличный период для укрепления фундамента в карьере и личных делах. Избегайте поспешности; ваша сила в этом году — в тщательном планировании и внимании к деталям.';

  @override
  String get sajuFortune2026Gap =>
      '🌿 Прогноз на 2026 год (Кап, энергия дерева): год расширения возможностей. Действуйте шире, но сохраняйте дисциплину.';

  @override
  String get sajuFortune2026Eul =>
      '🍃 Прогноз на 2026 год (Ыль, энергия дерева): гибкость и коммуникация будут ключом к успеху.';

  @override
  String get sajuFortune2026Byeong =>
      '🔥 Общий прогноз на 2026 год (Пёно, год Красной Лошади): \'Год страсти, активности и максимального успеха\'. Год Пёно наполнен мощной огненной энергией. Это время для того, чтобы заявить о себе во весь голос. Энергия Лошади (О) несет в себе скорость и прогресс, а Пён (Огонь) освещает путь. Период будет очень динамичным, подходящим для реализации самых амбициозных проектов. Помните о балансе, чтобы не \'перегореть\'.';

  @override
  String get sajuFortune2026Jeong =>
      '🕯️ Прогноз на 2026 год (Чон, мягкий огонь): тонкая настройка процессов даст большой эффект.';

  @override
  String get sajuFortune2026Mu =>
      '⛰️ Прогноз на 2026 год (Му, земля): укрепление позиций и накопление ресурсов.';

  @override
  String get sajuFortune2026Gi =>
      '🌾 Прогноз на 2026 год (Ки, мягкая земля): стабильность через регулярность и терпение.';

  @override
  String get sajuFortune2026Gyeong =>
      '⚙️ Прогноз на 2026 год (Кён, металл): строгий план и порядок принесут результат.';

  @override
  String get sajuFortune2026Sin =>
      '🗡️ Прогноз на 2026 год (Син, металл): точность, принципиальность и выбор главного.';

  @override
  String get sajuFortune2026Im =>
      '🌊 Прогноз на 2026 год (Им, вода): движение, обучение и новые связи.';

  @override
  String get sajuFortune2026Gye =>
      '💧 Прогноз на 2026 год (Ке, вода): интуиция и мягкие переговоры помогут выйти победителем.';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 Прогноз на 2025 год (Пён, огонь): энергия высокая, важно правильно распределять силы.';

  @override
  String get sajuFortune2025Jeong =>
      '🕯️ Прогноз на 2025 год (Чон, огонь): время аккуратных решений и важных разговоров.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ Прогноз на 2025 год (Му, земля): укрепляйте фундамент, закрывайте долги и незавершенные дела.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 Прогноз на 2025 год (Ки, земля): стабильность приходит через заботу о базе и здоровье.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚙️ Прогноз на 2025 год (Кён, металл): дисциплина и структура — ваш союзник.';

  @override
  String get sajuFortune2025Sin =>
      '🗡️ Прогноз на 2025 год (Син, металл): отсечение лишнего и верность принципам.';

  @override
  String get sajuFortune2025Im =>
      '🌊 Прогноз на 2025 год (Им, вода): время расширять горизонты и учиться новому.';

  @override
  String get sajuFortune2025Gye =>
      '💧 Прогноз на 2025 год (Ке, вода): интуиция и гибкость помогут обойти препятствия.';

  @override
  String get preparationForTomorrow => 'Подготовка к завтрашнему дню';

  @override
  String get howToMeetMoreLuck => 'Как притянуть больше удачи';

  @override
  String get enterName => 'Введите имя';

  @override
  String fortuneDateConfirm(String date) {
    return 'Хотите проверить предсказание на $date?';
  }

  @override
  String get colorPurple => 'Фиолетовый';

  @override
  String get colorBlue => 'Синий';

  @override
  String get colorYellow => 'Желтый';

  @override
  String get colorRed => 'Красный';

  @override
  String get colorGreen => 'Зеленый';

  @override
  String get colorPink => 'Розовый';

  @override
  String get colorOrange => 'Оранжевый';

  @override
  String get colorWhite => 'Белый';

  @override
  String get colorBlack => 'Черный';

  @override
  String get itemPerfume => 'Духи';

  @override
  String get itemHandkerchief => 'Платок';

  @override
  String get itemRing => 'Кольцо';

  @override
  String get itemWatch => 'Часы';

  @override
  String get itemGlasses => 'Очки';

  @override
  String get itemHat => 'Шляпа';

  @override
  String get itemBook => 'Книга';

  @override
  String get itemEarphones => 'Наушники';

  @override
  String get itemMirror => 'Зеркальце';

  @override
  String get itemPen => 'Ручка';

  @override
  String get itemCoin => 'Монета';

  @override
  String get itemKey => 'Ключ';

  @override
  String get dirEast => 'Восток';

  @override
  String get dirWest => 'Запад';

  @override
  String get dirSouth => 'Юг';

  @override
  String get dirNorth => 'Север';

  @override
  String get dirNorthEast => 'Северо-восток';

  @override
  String get dirSouthEast => 'Юго-восток';

  @override
  String get dirNorthWest => 'Северо-запад';

  @override
  String get dirSouthWest => 'Юго-запад';

  @override
  String get general => 'Общие';

  @override
  String get darkMode => 'Темная тема';

  @override
  String get darkModeDescription => 'Включить темную тему приложения.';

  @override
  String get alarmSettings => 'Настройки будильника';

  @override
  String get privacySettings => 'Конфиденциальность';

  @override
  String get information => 'Информация';

  @override
  String get notice => 'Уведомления';

  @override
  String get weatherConditionSunny => 'Солнечно';

  @override
  String get weatherConditionPartlyCloudy => 'Переменная облачность';

  @override
  String get weatherConditionCloudy => 'Облачно';

  @override
  String get weatherConditionFoggy => 'Туман';

  @override
  String get weatherConditionDrizzle => 'Морось';

  @override
  String get weatherConditionRainy => 'Дождь';

  @override
  String get weatherConditionFreezingRain => 'Ледяной дождь';

  @override
  String get weatherConditionSnowy => 'Снег';

  @override
  String get weatherConditionSnowGrains => 'Снежная крупа';

  @override
  String get weatherConditionRainShowers => 'Ливни';

  @override
  String get weatherConditionSnowShowers => 'Снегопад';

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
  String get locationUnknown => 'Местоположение неизвестно';

  @override
  String get locationError => 'Не удалось определить местоположение';

  @override
  String get faq => 'FAQ';

  @override
  String get sendFeedback => 'Отправить отзыв';

  @override
  String get feedbackDescription =>
      'Расскажите о неудобствах или предложениях при использовании Fortune Alarm.\\nВаш отзыв помогает сделать приложение лучше.';

  @override
  String get reportCopyright => 'Сообщить о нарушении авторских прав';

  @override
  String get copyrightDescription =>
      'Если вы считаете, что контент нарушает авторские права, сообщите нам по email.\\nМы проверим и примем меры.';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get privacyPolicy =>
      'Условия и конфиденциальность\\n\\n1. Общие положения\\n\\nСтатья 1 (Цель)\\nЭти условия определяют правила использования приложения «Fortune Alarm» (далее — «Сервис»), а также права и обязанности пользователя и разработчика.\\n\\nСтатья 2 (Конфиденциальность)\\n1) Приложение не требует регистрации и не хранит персональные данные на сервере.\\n2) Данные (будильники, миссии, история печенек и т.п.) сохраняются локально на устройстве.\\n3) Разрешения используются только для работы функций: уведомления, точный будильник/исключение оптимизации батареи, показ поверх других приложений, камера (только для миссии с фото).\\n\\nСтатья 3 (Реклама)\\nСервис может показывать рекламу (Google AdMob). Идентификатор рекламы может использоваться для персонализации.\\n\\nСтатья 4 (Удаление данных)\\nПри удалении приложения все локальные данные удаляются и не подлежат восстановлению.\\n\\nКонтакты: seriessnap.co@gmail.com';

  @override
  String get alarmOptimization => 'Оптимизация будильника';

  @override
  String get allOptimizationsCompleted => 'Все настройки оптимизации выполнены';

  @override
  String get optimizationNeeded => 'Для точного будильника нужны настройки.';

  @override
  String get optimizationDescription =>
      'Из-за настроек Android будильник может запаздывать или не сработать. Включите все пункты ниже.';

  @override
  String get allowNotificationPermission => 'Разрешить уведомления';

  @override
  String get notificationPermissionDescription =>
      'Нужно, чтобы показывать уведомления при срабатывании будильника.';

  @override
  String get excludeBatteryOptimization => 'Исключить из оптимизации батареи';

  @override
  String get batteryOptimizationDescription =>
      'Чтобы будильник срабатывал вовремя даже в энергосбережении.';

  @override
  String get allowExactAlarm => 'Разрешить точный будильник';

  @override
  String get exactAlarmDescription =>
      'Позволяет системе запускать будильник без задержек.';

  @override
  String get drawOverOtherApps => 'Показывать поверх других приложений';

  @override
  String get overlayDescription =>
      'Показывает экран будильника даже на экране блокировки или поверх других приложений.';

  @override
  String get allSettingsCompleted => 'Все настройки выполнены.';

  @override
  String get allowAllItems => 'Пожалуйста, включите все разрешения.';

  @override
  String get manualSettingsInfo =>
      'Некоторые пункты можно изменить вручную в настройках Android.';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get selectPhoto => 'Выбрать фото';

  @override
  String get selectAlarmBackground => 'Выбрать фон будильника';

  @override
  String get defaultLabel => 'По умолчанию';

  @override
  String get howToAdd => 'Как добавить';

  @override
  String get addAssetInstructions =>
      'Добавьте изображения в папку assets/images/ и зарегистрируйте их в pubspec.yaml.';

  @override
  String get ringingNow => 'Звонит сейчас';

  @override
  String get setTime => 'Установить время';

  @override
  String get repeatDays => 'Дни повтора';

  @override
  String get repeatDaily => 'Повторять ежедневно';

  @override
  String get snoozeSettings => 'Настройки повтора';

  @override
  String get wakeUpAlarm => 'Будильник';

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
  String get daySunFull => 'Воскресенье';

  @override
  String get dayMonFull => 'Понедельник';

  @override
  String get dayTueFull => 'Вторник';

  @override
  String get dayWedFull => 'Среда';

  @override
  String get dayThuFull => 'Четверг';

  @override
  String get dayFriFull => 'Пятница';

  @override
  String get daySatFull => 'Суббота';

  @override
  String get missionRewardEarned => 'Отлично! Вы получили печенье удачи! 🎉';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Отлично! Вы выполнили $missions миссий и получили $cookies печенье(ек)!';
  }

  @override
  String daysCount(int count) {
    return '$count дн.';
  }

  @override
  String get user => 'Пользователь';

  @override
  String get member => 'Участник';

  @override
  String get manageSajuInfo => 'Управление профилем саджу';

  @override
  String get freeCharge => 'Бесплатно пополнить';

  @override
  String get fortunePass => 'Fortune Pass';

  @override
  String get unlimitedNotSubscribed => 'Безлимит недоступен (нет подписки)';

  @override
  String get unlimitedInUse => 'Безлимит активен';

  @override
  String get subscribe => 'Подписаться';

  @override
  String get manageSubscription => 'Управление подпиской';

  @override
  String get purchaseHistory => 'История покупок';

  @override
  String get customerCenter => 'Служба поддержки';

  @override
  String get noNewNotifications => 'Нет новых уведомлений.';

  @override
  String get noPurchaseHistory => 'Нет истории покупок.';

  @override
  String get none => 'Нет';

  @override
  String deleteConfirmMessage(String title) {
    return 'Вы уверены, что хотите удалить «$title»?';
  }

  @override
  String get delete => 'Удалить';

  @override
  String get notepad => 'Блокнот';

  @override
  String get today => 'Сегодня';

  @override
  String get yearView => 'Год';

  @override
  String get monthView => 'Месяц';

  @override
  String get weekView => 'Неделя';

  @override
  String get dayView => 'День';

  @override
  String get noEvents => 'Нет запланированных событий.';

  @override
  String get calendarDragGuide =>
      'Потяните вниз, чтобы просмотреть подробный календарь.';

  @override
  String get noSavedMemos => 'Нет сохраненных заметок или событий.';

  @override
  String get holiday => 'Праздник';

  @override
  String get photo => 'Фото';

  @override
  String get drawing => 'Рисование';

  @override
  String get drawingTitle => 'Рисование';

  @override
  String get pencil => 'Карандаш';

  @override
  String get marker => 'Маркер';

  @override
  String get eraser => 'Ластик';

  @override
  String adjustThickness(String label) {
    return 'Настройка толщины $label';
  }

  @override
  String get sticker => 'Стикер';

  @override
  String get event => 'Событие';

  @override
  String get memo => 'Заметка';

  @override
  String get routineExercise => 'Упражнение';

  @override
  String get routineHiking => 'Поход';

  @override
  String get routineCleaning => 'Уборка';

  @override
  String get routineTravel => 'Путешествие';

  @override
  String get routineDate => 'Свидание';

  @override
  String get routineConcert => 'Концерт';

  @override
  String get routineMovie => 'Кино';

  @override
  String get routineMeeting => 'Встреча';

  @override
  String get howIsYourMoodToday => 'Как ваше настроение сегодня?';

  @override
  String get complete => 'Готово';

  @override
  String get amWithIcon => '☀️ AM';

  @override
  String get pmWithIcon => '🌙 PM';

  @override
  String get photoPermissionDescription =>
      'Для добавления фотографий разрешите доступ к галерее в настройках.';

  @override
  String get goToSettings => 'Перейти в настройки';

  @override
  String get photoPermissionNeeded => 'Необходим доступ к фотографиям.';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get fontFamily => 'Шрифт';

  @override
  String get textColor => 'Цвет текста';

  @override
  String get textAlign => 'Выравнивание';

  @override
  String get alignLeft => 'По левому краю';

  @override
  String get alignCenter => 'По центру';

  @override
  String get alignRight => 'По правому краю';

  @override
  String get edit => 'Редактировать';

  @override
  String get fontSettings => 'Настройки шрифта';

  @override
  String get imageAddedFromKeyboard => 'Изображение добавлено с клавиатуры.';

  @override
  String get cancelWriting => 'Отменить запись';

  @override
  String get cancelWritingConfirm =>
      'Запись не сохранена. Вы действительно хотите выйти?';

  @override
  String get continueWriting => 'Продолжить';

  @override
  String get title => 'Заголовок';

  @override
  String get content => 'Содержание';

  @override
  String get selectTime => 'Выбрать время';

  @override
  String get noTime => 'Без времени';

  @override
  String minutesLater(String minutes) {
    return 'Через $minutes мин';
  }

  @override
  String get countLabel => 'Количество';

  @override
  String timesCount(String count) {
    return 'Всего $count раз';
  }

  @override
  String get wakeUpMission => 'Миссия пробуждения';

  @override
  String get alarmSound => 'Звук будильника';

  @override
  String get gradualVolume => 'Постепенная громкость';

  @override
  String get vibration => 'Вибрация';

  @override
  String get alarmNameAndBackground => 'Имя и фон будильника';

  @override
  String get customStyle => 'Свой стиль';

  @override
  String get alarmName => 'Имя будильника';

  @override
  String get enterAlarmName => 'Введите имя будильника';

  @override
  String get routineSummary => 'Обзор рутины';

  @override
  String get alarmOn => 'Будильник ВКЛ';

  @override
  String get alarmOff => 'Будильник ВЫКЛ';

  @override
  String get contentHint => 'Добавить текст';

  @override
  String get addEvent => 'Добавить событие';

  @override
  String get manageItem => 'Управление';

  @override
  String get manageItemDescription => 'Что вы хотите сделать с этим элементом?';

  @override
  String get noTitle => 'Без названия';

  @override
  String get selectTitleColor => 'Цвет заголовка';

  @override
  String get save => 'Сохранить';

  @override
  String get missionNone => 'Без миссии';

  @override
  String get missionSnap => 'Фото объекта';

  @override
  String get missionMath => 'Математика';

  @override
  String get missionFortune => 'Гадание';

  @override
  String get missionShake => 'Тряска';

  @override
  String get missionFortuneCatch => 'Поймай Фортуни';

  @override
  String get missionNoDescription => 'Будильник выключится без миссии.';

  @override
  String get missionCameraDescription =>
      'Сфотографируйте указанный объект, чтобы выключить будильник.';

  @override
  String get missionMathDescription => 'Решайте примеры, чтобы разбудить мозг.';

  @override
  String get missionFortuneDescription =>
      'Выключите будильник и узнайте предсказание на день.';

  @override
  String get missionShakeDescription =>
      'Потрясите телефон, чтобы выключить будильник.';

  @override
  String get missionFortuneCatchDescription => 'Поймайте движущуюся Фортуни!';

  @override
  String get missionWalk => 'Ходьба';

  @override
  String get missionWalkDescription => 'Пройдитесь, чтобы выключить будильник!';

  @override
  String get missionFaceDescription => 'Держите лицо в кадре 5 секунд.';

  @override
  String get walkStepCount => 'Цель (шагов)';

  @override
  String walkSteps(int count) {
    return '$count шагов';
  }

  @override
  String get missionNumberOrder => 'Порядок чисел';

  @override
  String get missionNumberOrderDescription =>
      'Нажимайте на числа от 1 до 9 по порядку.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Далее: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Плитки памяти';

  @override
  String get missionHiddenButtonDescription =>
      'Запомните узор и повторите его за 10 секунд.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Быстрое нажатие';

  @override
  String get missionTapSprintDescriptionShort =>
      'Быстро нажимайте, чтобы заполнить шкалу.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Нажмите $goalTaps+ раз, чтобы заполнить шкалу.';
  }

  @override
  String get missionTapSprintTapHere => 'Нажми сюда';

  @override
  String get missionTapSprintHint => 'Шкала падает, если перестать нажимать!';

  @override
  String get missionLeftRight => 'Лево / Право';

  @override
  String get missionLeftRightDescriptionShort =>
      'Следуйте подсказкам: лево или право.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'Сделайте $targetStreak правильных нажатий подряд.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Нажми СЛЕВА';

  @override
  String get missionLeftRightPromptRight => 'Нажми СПРАВА';

  @override
  String get left => 'Лево';

  @override
  String get right => 'Право';

  @override
  String get missionHintInactivity => 'Сброс через 2 минуты бездействия.';

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
  String fortuneCatchTime(int seconds) {
    return 'Время: $secondsс';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'Рекорд: $secondsс';
  }

  @override
  String get fortuneCatchAngryHint =>
      'Избегайте злой Фортуни, чтобы не получить штраф!';

  @override
  String get fortuneCatchInstruction =>
      'Ловите веселую Фортуни и избегайте злых!';

  @override
  String fortuneCatchPointMinus(int points) {
    return '-$points очков';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points очков';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return 'Комбо: $combo!';
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
  String missionAnalyzing(int index, int total) {
    return 'Миссия $index/$total: Анализ...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'Миссия $index/$total: Наведите на объект.';
  }

  @override
  String get missionPointSink => 'Наведите на раковину.';

  @override
  String get missionPointRefrigerator => 'Наведите на холодильник.';

  @override
  String get missionPointScale => 'Наведите на весы.';

  @override
  String get missionPointFace => 'Наведите на лицо.';

  @override
  String get missionPointObjectGeneric => 'Наведите на указанный объект.';

  @override
  String get missionRecognizeObject => 'Распознайте объект.';

  @override
  String get missionPerform => 'Выполните миссию.';

  @override
  String get initError => 'Ошибка инициализации.';

  @override
  String get analyzingNextTarget => 'Анализ следующей цели...';

  @override
  String get errorOccurredGeneric => 'Произошла ошибка';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return 'Успех: $completed/$total!';
  }

  @override
  String missionMatchSuccess(int total) {
    return 'Успех: $total/$total! Все совпало!';
  }

  @override
  String get escape => 'Побег';

  @override
  String get pointObjectClearly => 'Наведите на объект четко';

  @override
  String get matchingSuccess => 'Совпадение!';

  @override
  String get missionComplete => 'Миссия выполнена';

  @override
  String get allMissionsComplete => 'Все миссии выполнены';

  @override
  String missionSnoozeMessage(String minutes) {
    return 'Миссия выполнена! Но будильник снова прозвенит через $minutes мин (по настройкам).';
  }

  @override
  String get showFace => 'Покажите лицо';

  @override
  String get keepWatching => 'Смотрите на экран';

  @override
  String get recognizingFaceForFortune => 'Распознаем лицо для анализа';

  @override
  String get dataNotStored => 'Данные не сохраняются';

  @override
  String get solveProblem => 'Решите задачу.';

  @override
  String get correctAnswer => 'Верно!';

  @override
  String get wrongAnswerRetry => 'Неверно. Попробуйте снова.';

  @override
  String get correct => 'Правильно!';

  @override
  String get walkToDismiss => 'Пройдитесь со смартфоном в руке';

  @override
  String get shakeCount => 'Счетчик встрясок';

  @override
  String shakeTimes(int count) {
    return '$count встрясок';
  }

  @override
  String tapTimes(int count) {
    return '$count касаний';
  }

  @override
  String missionNumber(int number) {
    return 'Миссия $number';
  }

  @override
  String get soundBirds => 'Пение птиц';

  @override
  String get shakeCountLabel => 'Количество встрясок';

  @override
  String missionIndex(int index) {
    return 'Миссия $index';
  }

  @override
  String get ringtoneSelect => 'Выбор мелодии';

  @override
  String get vibrationSelect => 'Выбор вибрации';

  @override
  String get selectMissionTitle => 'Выберите миссию для будильника';

  @override
  String get ringtoneCategoryStandard => 'Стандартные';

  @override
  String get ringtoneCategoryCalm => 'Спокойные';

  @override
  String get ringtoneCategoryUpbeat => 'Бодрые';

  @override
  String get ringtoneCategoryLoud => 'Громкие';

  @override
  String get noRingtones => 'Мелодии не найдены.';

  @override
  String get photoPermissionRequired => 'Нужно разрешение на доступ к фото.';

  @override
  String get deleteImage => 'Удалить фото';

  @override
  String get longPressToDelete => 'Нажмите и удерживайте, чтобы удалить';

  @override
  String get videoLoadFail => 'Не удалось загрузить видео';

  @override
  String get existingCapturedImages => 'Сохраненные фото';

  @override
  String deleteCount(int count) {
    return 'Удалить ($count)';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return 'Удалить $count фото?\\nЭто действие нельзя отменить.';
  }

  @override
  String get classicAlarm => 'Классический будильник';

  @override
  String get digitalAlarm => 'Цифровой будильник';

  @override
  String get birdsSound => 'Пение птиц';

  @override
  String get wavesSound => 'Шум волн';

  @override
  String get cuckooClock => 'Кукушка';

  @override
  String get calmAlarm => 'Спокойный будильник';

  @override
  String get doorKnock => 'Стук в дверь';

  @override
  String get earlySunrise => 'Ранний рассвет';

  @override
  String get goodMorningSound => 'Доброе утро';

  @override
  String get inAHurry => 'В спешке';

  @override
  String get lovingYou => 'Люблю тебя';

  @override
  String get sirenSound => 'Сирена';

  @override
  String get swingingSound => 'Качели';

  @override
  String get telephoneBusy => 'Занято';

  @override
  String get shortVibration => 'Коротко';

  @override
  String get longVibration => 'Длинно';

  @override
  String get heartbeatVibration => 'Сердцебиение';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'Быстрый ритм';

  @override
  String get exactAlarmPermissionDesc =>
      'Чтобы будильник срабатывал точно, требуется разрешение «Будильники и напоминания».';

  @override
  String get batteryOptimizationPermissionDesc =>
      'Отключите оптимизацию батареи для своевременного срабатывания будильника.';

  @override
  String get overlayPermissionDesc =>
      'Чтобы показывать экран миссии при звонке, нужно разрешение «Показывать поверх других приложений».';

  @override
  String get cameraMissionFirstImageError =>
      'Пожалуйста, задайте хотя бы первое изображение для миссии.';

  @override
  String get retry => 'Повторить';

  @override
  String get exactAlarmPermissionFail =>
      'Не удалось зарегистрировать будильник. Включите «точный будильник».';

  @override
  String get batteryOptimizationPermissionFail =>
      'Не удалось зарегистрировать будильник. Добавьте приложение в исключения оптимизации батареи.';

  @override
  String get overlayPermissionFail =>
      'Не удалось зарегистрировать будильник. Разрешите показ поверх других приложений.';

  @override
  String get batteryOptimizationName => 'Оптимизация батареи';

  @override
  String get batteryOptimizationTitle =>
      'Требуются настройки оптимизации\nдля точной работы будильника.';

  @override
  String get batteryOptimizationSubtitle =>
      'Пожалуйста, добавьте приложение в исключения оптимизации батареи\nдля корректной работы в фоновом режиме.';

  @override
  String get batteryOptimizationBottomDesc =>
      'Выбор «Не ограничено» или «Не оптимизировать»\nв настройках гарантирует своевременный сигнал.';

  @override
  String get understand => 'Понятно';

  @override
  String get overlayPermissionName => 'Отображение поверх других приложений';

  @override
  String get overlayPermissionTitle => 'Руководство по разрешениям';

  @override
  String get unknownAlarmError =>
      'Не удалось зарегистрировать будильник. Произошла неизвестная ошибка.';

  @override
  String get resetTooltip => 'Сброс';

  @override
  String get errorLoadingAlarm => 'Не удалось загрузить данные будильника.';

  @override
  String get alarmNotFound => 'Будильник не найден.';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'Повтор будильника ($current/$max)';
  }

  @override
  String snoozeRemainingCount(int current, int max) {
    return 'Осталось ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'Выключить будильник';

  @override
  String get startMission => 'Начать миссию';

  @override
  String get alarmSnooze => 'Отложить';

  @override
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes мин (без ограничений)';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes мин ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => 'Вдохновляющий день';

  @override
  String get ringtone_cozy_day => 'Уютный день';

  @override
  String get ringtone_sensible_day => 'Спокойный день';

  @override
  String get ringtone_play_with_me => 'Поиграй со мной';

  @override
  String get ringtone_refreshing_day => 'Свежий день';

  @override
  String get ringtone_new_beginning => 'Новое начало';

  @override
  String get ringtone_self_love => 'Любовь к себе';

  @override
  String get cherry_stained_finger => 'Палец в вишневом соке';

  @override
  String get dancing_in_the_stars => 'Танец в звездах';

  @override
  String get nice_day => 'Хороший день';

  @override
  String get fortuneTitle => 'Проверить удачу';

  @override
  String get fortuneMessage =>
      'Узнайте результаты гадания\\nи получите скрытые подарки!';

  @override
  String get fortuneAdButton => 'Посмотреть рекламу и узнать результат';

  @override
  String get fortuneLoadingMessage =>
      'Мастер таро готовит для вас особое толкование карт.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Анализируем выбранные карты таро... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Сосредоточьтесь на сегодняшней энергии\\nи выберите 3 карты.';

  @override
  String fortuneSelectTitleDate(String month, int day) {
    return 'Сосредоточьтесь на энергии $day.$month\\nи выберите 3 карты.';
  }

  @override
  String get fortuneNewYearButton => 'Новогоднее гадание на 2026 год';

  @override
  String get loveFortune => 'Любовь';

  @override
  String get wealthFortune => 'Богатство';

  @override
  String get successFortune => 'Успех';

  @override
  String get fortuneResultTitle => 'Ваш результат гадания на сегодня.';

  @override
  String fortuneResultTitleDate(int year, String month, int day) {
    return 'Гадание на $day.$month.$year';
  }

  @override
  String get startDayButton => 'Начать свой день';

  @override
  String get tarotName0 => 'Дурак';

  @override
  String get tarotName1 => 'Маг';

  @override
  String get tarotName2 => 'Верховная жрица';

  @override
  String get tarotName3 => 'Императрица';

  @override
  String get tarotName4 => 'Император';

  @override
  String get tarotName5 => 'Иерофант';

  @override
  String get tarotName6 => 'Влюбленные';

  @override
  String get tarotName7 => 'Колесница';

  @override
  String get tarotName8 => 'Сила';

  @override
  String get tarotName9 => 'Отшельник';

  @override
  String get tarotName10 => 'Колесо Фортуны';

  @override
  String get tarotName11 => 'Справедливость';

  @override
  String get tarotName12 => 'Повешенный';

  @override
  String get tarotName13 => 'Смерть';

  @override
  String get tarotName14 => 'Умеренность';

  @override
  String get tarotName15 => 'Дьявол';

  @override
  String get tarotName16 => 'Башня';

  @override
  String get tarotName17 => 'Звезда';

  @override
  String get tarotName18 => 'Луна';

  @override
  String get tarotName19 => 'Солнце';

  @override
  String get tarotName20 => 'Суд';

  @override
  String get tarotName21 => 'Мир';

  @override
  String get tarotKeywords0 =>
      'Новые начинания, приключения, невинность, свобода, безрассудство';

  @override
  String get tarotDesc0 =>
      'Шут опасно стоит на краю обрыва в яркой одежде, но его взор устремлен вдаль, полный надежды.';

  @override
  String get tarotLoveMeaning0 =>
      'Может прийти неожиданная новая любовь или судьбоносная встреча с первого взгляда.';

  @override
  String get tarotLoveDetail0 =>
      'Это время, когда вы можете начать любовь с чистым сердцем, как ребенок. Забудьте все прошлые раны.';

  @override
  String get tarotWealthMeaning0 =>
      'Новая инвестиция или бизнес-объект могут привлечь ваше внимание.';

  @override
  String get tarotWealthDetail0 =>
      'Это время, когда открываются новые финансовые возможности. Вы можете достичь неожиданных результатов.';

  @override
  String get tarotSuccessMeaning0 =>
      'Это хорошее время для начала нового проекта или смены работы в совершенно другой области.';

  @override
  String get tarotSuccessDetail0 =>
      'Если есть что-то, к чему вы готовитесь, сделайте первый шаг смело.';

  @override
  String get tarotKeywords1 =>
      'Творчество, мастерство, самовыражение, находчивость, воля';

  @override
  String get tarotDesc1 =>
      'Маг стоит перед столом, на котором лежат символы четырех стихий. Он уверенно указывает одной рукой в небо, а другой на землю, символизируя способность воплощать идеи в реальность.';

  @override
  String get tarotLoveMeaning1 =>
      'Это прекрасная возможность проявить свое обаяние и покорить чье-то сердце.';

  @override
  String get tarotLoveDetail1 =>
      'Ваше обаяние и таланты сейчас на пике, что делает вас крайне привлекательным для противоположного пола. Если у вас кто-то есть на примете, не стесняйтесь проявлять инициативу и подходить первым. Ваше чувство юмора и остроумие сделают общение незабываемым, и вы сможете легко направить отношения в нужное вам русло.';

  @override
  String get tarotWealthMeaning1 =>
      'Идеальное время для создания новых источников дохода благодаря вашим навыкам.';

  @override
  String get tarotWealthDetail1 =>
      'Ваши знания, навыки и идеи сейчас могут принести реальную финансовую выгоду. Не ограничивайтесь только основной зарплатой — попробуйте монетизировать свои хобби или заняться фрилансом. Ваши творческие проекты и умение убеждать помогут вам достичь доходов, превышающих ваши ожидания.';

  @override
  String get tarotSuccessMeaning1 =>
      'Ваши профессиональные способности будут на высоте и получат признание окружающих.';

  @override
  String get tarotSuccessDetail1 =>
      'В работе или учебе вы сможете в полной мере проявить себя и выделиться среди остальных. Какие бы сложности ни возникали, вы решите их благодаря своей находчивости и острому уму. Коллеги и руководство признают в вас настоящего эксперта, так что действуйте уверенно.';

  @override
  String get tarotKeywords2 =>
      'Интуиция, тайна, подсознание, внутренняя мудрость, пассивность';

  @override
  String get tarotDesc2 =>
      'Верховная Жрица сидит между черной и белой колоннами, храня свиток мудрости. Она символизирует глубокую интуицию и баланс между сознательным и бессознательным.';

  @override
  String get tarotLoveMeaning2 =>
      'Период, когда духовная близость важнее физического влечения.';

  @override
  String get tarotLoveDetail2 =>
      'Сейчас вас будут больше привлекать люди с богатым внутренним миром, с которыми можно поговорить по душам. Ваша интуиция обострена, что позволит вам понимать партнера без слов. Однако излишняя скрытность может привести к недопониманию, поэтому старайтесь иногда открыто выражать свои чувства.';

  @override
  String get tarotWealthMeaning2 =>
      'Время сохранять активы и наблюдать за ситуацией, а не рисковать.';

  @override
  String get tarotWealthDetail2 =>
      'Сейчас не лучший момент для погони за быстрой прибылью. Вместо активных действий лучше заняться глубоким анализом рынка и изучением финансовых инструментов. Это период «посева», поэтому не переживайте, если доход не придет мгновенно — долгосрочные вложения в будущем оправдают себя.';

  @override
  String get tarotSuccessMeaning2 =>
      'Успех ждет в научной деятельности, исследованиях и интеллектуальном труде.';

  @override
  String get tarotSuccessDetail2 =>
      'Сосредоточьтесь на укреплении своего внутреннего потенциала и повышении квалификации, а не на внешнем блеске. В делах, требующих глубокого анализа и планирования, вы добьетесь выдающихся результатов. Ваша мудрость и осторожность станут ключом к успеху в решающий момент.';

  @override
  String get tarotKeywords3 =>
      'Женственность, красота, природа, изобилие, плодородие';

  @override
  String get tarotDesc3 =>
      'Императрица восседает в цветущем саду, олицетворяя материальное благополучие и душевную щедрость.';

  @override
  String get tarotLoveMeaning3 =>
      'Время расцвета чувств и укрепления отношений.';

  @override
  String get tarotLoveDetail3 =>
      'Ваше обаяние и мягкая сила сейчас на максимуме, что делает вас невероятно притягательным. В отношениях наступает период гармонии и заботы, возможно обсуждение планов на брак или пополнение в семье. Если вы одиноки, смена имиджа или стиля поможет вам привлечь внимание достойного человека.';

  @override
  String get tarotWealthMeaning3 =>
      'Период материального процветания и стабильности.';

  @override
  String get tarotWealthDetail3 =>
      'Финансовая удача на вашей стороне. Ваши прошлые усилия принесут плоды, и вы сможете насладиться комфортом. Возможны неожиданные бонусы, подарки или прибыль от успешных инвестиций. Делитесь своей позитивной энергией с окружающими, и это притянет к вам еще больше удачи.';

  @override
  String get tarotSuccessMeaning3 =>
      'Текущие проекты развиваются успешно и приносят отличные результаты.';

  @override
  String get tarotSuccessDetail3 =>
      'Пришло время увидеть реальные плоды своего труда. Проекты завершатся успешно, что может принести повышение или премию. Ваше творческое видение и эстетическое чутье будут особенно востребованы. Наслаждайтесь процессом работы — это поможет достичь еще лучших результатов.';

  @override
  String get tarotKeywords4 =>
      'Авторитет, структура, контроль, лидерство, логика';

  @override
  String get tarotDesc4 =>
      'Император сидит на каменном троне в доспехах, символизируя твердость, порядок и решительность в управлении.';

  @override
  String get tarotLoveMeaning4 =>
      'Стабильные отношения с надежным и ответственным партнером.';

  @override
  String get tarotLoveDetail4 =>
      'Вместо бурных страстей на первый план выходят доверие и уверенность в завтрашнем дне. Партнер станет для вас надежной опорой и защитой. Постарайтесь избегать излишнего контроля и упрямства в общении. Одиноких людей ждет встреча с влиятельным и статусным человеком.';

  @override
  String get tarotWealthMeaning4 =>
      'Систематическое управление активами поможет накопить стабильный капитал.';

  @override
  String get tarotWealthDetail4 =>
      'В финансовых делах сейчас крайне важно придерживаться плана и принципов. Вместо рискованных спекуляций лучше выбирать надежные инструменты, такие как депозиты или недвижимость. Ваша прагматичность и решительность помогут вам заложить прочный фундамент для будущего богатства.';

  @override
  String get tarotSuccessMeaning4 =>
      'Хорошие шансы на повышение или получение лидерской позиции.';

  @override
  String get tarotSuccessDetail4 =>
      'Ваше положение в коллективе укрепляется. Руководство оценит ваши лидерские качества, и вам могут доверить управление важным проектом или отделом. Используйте логику и холодный расчет для решения рабочих задач, и вы добьетесь полного доверия со стороны начальства.';

  @override
  String get tarotKeywords5 =>
      'Традиция, соответствие, этика, наставничество, вера';

  @override
  String get tarotDesc5 =>
      'Иерофант символизирует социальные нормы и духовное наставничество, ведя людей за собой с помощью мудрых советов.';

  @override
  String get tarotLoveMeaning5 =>
      'Серьезные и здоровые отношения, основанные на взаимном уважении.';

  @override
  String get tarotLoveDetail5 =>
      'Сейчас вас будут интересовать не мимолетные интрижки, а глубокие отношения с прицелом на создание семьи. Знакомство через общих друзей или на официальных мероприятиях может стать началом чего-то важного. Если в паре возникли споры, обратитесь за советом к старшим — их опыт поможет вам восстановить гармонию.';

  @override
  String get tarotWealthMeaning5 =>
      'Лучше придерживаться традиционных и проверенных способов накопления.';

  @override
  String get tarotWealthDetail5 =>
      'Отдавайте приоритет безопасности, а не рискованным инвестициям. Банковские вклады или страхование будут наиболее подходящими вариантами. Консультация с финансовым экспертом или честное ведение дел помогут вам сохранить и приумножить свое состояние.';

  @override
  String get tarotSuccessMeaning5 =>
      'Благоприятное время для заключения контрактов и партнерских соглашений.';

  @override
  String get tarotSuccessDetail5 =>
      'Вместо того чтобы решать проблемы в одиночку, обратитесь за поддержкой к коллегам или наставникам. Соблюдение корпоративных правил и процедур — самый короткий путь к признанию. Это также удачный период для подписания важных документов и налаживания деловых связей.';

  @override
  String get tarotKeywords6 => 'Любовь, гармония, выбор, союз, партнерство';

  @override
  String get tarotDesc6 =>
      'Под лучами теплого солнца Адам и Ева получают благословение ангела. Это символ союза душ и важного жизненного выбора.';

  @override
  String get tarotLoveMeaning6 => 'Один из лучших периодов для расцвета любви.';

  @override
  String get tarotLoveDetail6 =>
      'Вас ждет волнующий роман. Вы быстро сблизитесь с человеком, который вам симпатичен, и почувствуете глубокую духовную связь. Если вы планируете признание в чувствах, шансы на успех очень велики. Но помните: лучше выбирать сердцем, а не поддаваться сиюминутному соблазну.';

  @override
  String get tarotWealthMeaning6 =>
      'Ваше финансовое положение улучшится при сотрудничестве с другими.';

  @override
  String get tarotWealthDetail6 =>
      'Работа в паре с единомышленником принесет синергетический эффект и увеличит прибыль. Если вам предложат партнерство, рассмотрите его всерьез. Общение с окружающими поможет вам получить ценную инвестиционную информацию. Однако следите за расходами на развлечения, чтобы не выйти за рамки бюджета.';

  @override
  String get tarotSuccessMeaning6 =>
      'Время, когда командная работа приносит блестящие результаты.';

  @override
  String get tarotSuccessDetail6 =>
      'Вы прекрасно ладите с коллегами и партнерами, и работа приносит удовольствие. В командных проектах вы добьетесь большего, чем в одиночку, а умение налаживать связи станет ключом к успеху. Выбирая дело, которое вам по душе, вы получите результат, о котором не придется жалеть.';

  @override
  String get tarotKeywords7 =>
      'Победа, воля, движение вперед, завоевание, триумф';

  @override
  String get tarotDesc7 =>
      'Молодой король на колеснице уверенно движется к цели, держа в руках скипетр власти. Его воля непоколебима, а триумф близок.';

  @override
  String get tarotLoveMeaning7 =>
      'Период, когда активные действия в любви принесут успех.';

  @override
  String get tarotLoveDetail7 =>
      'Пришло время решительно бороться за свою любовь. Не сомневайтесь и открыто заявляйте о своих чувствах — даже если есть конкуренты, вы выйдете победителем. Если вы находитесь в стадии неопределенности, возьмите инициативу в свои руки. Совместные поездки или активный отдых только укрепят вашу связь.';

  @override
  String get tarotWealthMeaning7 =>
      'Нужно действовать агрессивно для достижения поставленных финансовых целей.';

  @override
  String get tarotWealthDetail7 =>
      'Сейчас вам нужна мощная пробивная сила для реализации планов. Не колеблясь принимайте важные решения, когда выпадает шанс. Сосредоточьтесь на краткосрочных проектах — сейчас ваш доход напрямую зависит от вашей активности. Возможны расходы, связанные с поездками, но это будет вложением в новые возможности.';

  @override
  String get tarotSuccessMeaning7 =>
      'Удача в конкурентной борьбе и достижение целей.';

  @override
  String get tarotSuccessDetail7 =>
      'Вас ждет успех в достижении конкретных целей: повышение, успешная сдача экзаменов или заключение выгодной сделки. Чем сильнее конкуренция, тем выше ваш боевой дух, и в итоге победа будет за вами. Ваша решительность произведет сильное впечатление на коллег. В командировках вы проявите свои лучшие качества.';

  @override
  String get tarotKeywords8 =>
      'Сила, мужество, терпение, мягкое влияние, самообладание';

  @override
  String get tarotDesc8 =>
      'Женщина в белых одеждах нежно закрывает пасть льву, символизируя победу духа над грубой силой и самообладание.';

  @override
  String get tarotLoveMeaning8 =>
      'Период, когда нужно проявить терпение и принять партнера таким, какой он есть.';

  @override
  String get tarotLoveDetail8 =>
      'Ваши отношения сейчас требуют мудрости и выдержки. Принимая недостатки партнера с открытым сердцем, вы выводите связь на новый уровень. Важно вести за собой мягко, проявляя внутреннюю стойкость. Если вы будете терпеливо поддерживать любимого человека, ваша искренность в итоге растопит любой лед.';

  @override
  String get tarotWealthMeaning8 =>
      'Постепенное накопление и разумные траты — ключ к богатству.';

  @override
  String get tarotWealthDetail8 =>
      'Ваше финансовое состояние медленно, но верно растет. Не расстраивайтесь, если прямо сейчас нет огромных поступлений — продолжайте планомерно управлять активами. В инвестициях не поддавайтесь панике из-за временных колебаний. Умение контролировать свои импульсивные желания — самый короткий путь к достатку.';

  @override
  String get tarotSuccessMeaning8 =>
      'Вы справитесь даже с самыми сложными задачами или придирчивым руководством.';

  @override
  String get tarotSuccessDetail8 =>
      'Вам могут поручить трудный проект, но у вас достаточно внутренних ресурсов, чтобы с ним справиться. Ваша мягкость снаружи скрывает стальную волю, которая поможет преодолеть любые преграды. Ваше спокойствие при решении проблем вызовет глубокое уважение и доверие окружающих.';

  @override
  String get tarotKeywords9 =>
      'Интроспекция, уединение, поиск истины, мудрость, отдых';

  @override
  String get tarotDesc9 =>
      'Старец с фонарем в руках стоит на вершине заснеженной горы, прислушиваясь к внутреннему голосу в поисках истины.';

  @override
  String get tarotLoveMeaning9 =>
      'Время для одиночества или глубоких раздумий об отношениях.';

  @override
  String get tarotLoveDetail9 =>
      'Сейчас вам важнее разобраться в себе, чем вести активную светскую жизнь. Не стоит искать встреч только ради того, чтобы убежать от одиночества — подумайте, какая любовь вам действительно нужна. Даже если вы в паре, небольшая дистанция поможет вам обоим лучше понять ценность ваших отношений.';

  @override
  String get tarotWealthMeaning9 =>
      'Финансовая активность может временно снизиться.';

  @override
  String get tarotWealthDetail9 =>
      'В денежных делах сейчас стоит занять консервативную позицию. Важнее сохранить то, что есть, чем пытаться приумножить капитал рискованными методами. Вложения в собственное образование или повышение квалификации станут лучшей инвестицией, которая принесет плоды в будущем.';

  @override
  String get tarotSuccessMeaning9 =>
      'Успех в делах, требующих глубоких знаний, исследований или мастерства.';

  @override
  String get tarotSuccessDetail9 =>
      'Вы добьетесь отличных результатов в научной работе, планировании или разработке — там, где нужно глубокое погружение в процесс. Сейчас время накапливать силы, а не выставлять их напоказ. Если столкнетесь с неразрешимой задачей, обратитесь за советом к опытному наставнику.';

  @override
  String get tarotKeywords10 =>
      'Удача, перемены, судьба, циклы, поворотный момент';

  @override
  String get tarotDesc10 =>
      'Огромное колесо фортуны вращается, возвещая о неизбежных переменах и начале нового жизненного цикла.';

  @override
  String get tarotLoveMeaning10 => 'Вас ждет судьбоносная встреча.';

  @override
  String get tarotLoveDetail10 =>
      'Любовь может нагрянуть внезапно, как в кино. Возможны случайные знакомства или неожиданные воссоединения с прошлыми возлюбленными. Одинокие люди могут влюбиться с первого взгляда, а те, кто в паре, почувствуют, что отношения выходят на новый уровень. Не упустите этот удачный момент.';

  @override
  String get tarotWealthMeaning10 => 'Финансовая ситуация начинает улучшаться.';

  @override
  String get tarotWealthDetail10 =>
      'Госпожа Удача улыбается вам. Возможны неожиданные денежные поступления или прибыль от вложений. Денежный поток становится стабильнее, и вам нужно вовремя ловить возможности. Однако помните, что удача циклична — проявите мудрость и отложите часть средств на будущее.';

  @override
  String get tarotSuccessMeaning10 =>
      'Обстоятельства складываются в вашу пользу.';

  @override
  String get tarotSuccessDetail10 =>
      'Наступает важный период, который может стать поворотным в карьере. Дела, которые стояли на паузе, сдвинутся с мертвой точки. Шансы на повышение или выгодное предложение по работе станут тем самым «попутным ветром», который вынесет вас на новую высоту.';

  @override
  String get tarotKeywords11 =>
      'Справедливость, баланс, ответственность, истина, причинно-следственная связь';

  @override
  String get tarotDesc11 =>
      'Судья в красных одеждах держит меч в правой руке и весы в левой. Это символ объективного суждения и ответственности за свои поступки.';

  @override
  String get tarotLoveMeaning11 =>
      'Отношения, в которых разум преобладает над чувствами.';

  @override
  String get tarotLoveDetail11 =>
      'Сейчас наступило время, когда трезвый расчет важнее эмоций. Подумайте, сохраняется ли баланс в ваших отношениях: не жертвуете ли вы собой слишком сильно или, наоборот, не берете ли слишком много, ничего не отдавая взамен. Если вы планируете брак, вы будете тщательно оценивать партнера, и честный, открытый диалог станет ключом к укреплению связи.';

  @override
  String get tarotWealthMeaning11 =>
      'Требуется предельная внимательность при заключении сделок и денежных операциях.';

  @override
  String get tarotWealthDetail11 =>
      'В финансовых делах может возникнуть ситуация, требующая восстановления справедливости. Это хорошее время для возврата долгов или окончательных расчетов. При подписании контрактов внимательно читайте условия и следуйте букве закона — честность и прозрачность в делах сейчас ваши лучшие союзники.';

  @override
  String get tarotSuccessMeaning11 =>
      'Вы получите справедливую оценку своих трудов и заслуженное вознаграждение.';

  @override
  String get tarotSuccessDetail11 =>
      'Ваши профессиональные достижения будут оценены объективно. Если вы усердно трудились, ждите повышения или премии. Ваши аналитические способности и точность будут особенно востребованы в сферах, связанных с правом или финансами. Принимая решения, опирайтесь только на факты и данные, исключая влияние эмоций.';

  @override
  String get tarotKeywords12 =>
      'Жертва, терпение, новый взгляд, застой, озарение';

  @override
  String get tarotDesc12 =>
      'Человек, подвешенный за ногу на дереве, через добровольное испытание смотрит на мир под другим углом и обретает озарение. Ореол вокруг его головы символизирует духовный рост.';

  @override
  String get tarotLoveMeaning12 =>
      'Отношения могут зайти в тупик, а безответные чувства могут длиться долго.';

  @override
  String get tarotLoveDetail12 =>
      'Вы можете чувствовать разочарование из-за отсутствия прогресса в любви, но сейчас спешка не поможет. Сделайте паузу, посмотрите на ситуацию с другой стороны и подумайте, не навязываете ли вы свои чувства слишком настойчиво. Умение поставить себя на место другого и проявить терпение в итоге станет ключом к сердцу партнера.';

  @override
  String get tarotWealthMeaning12 =>
      'Денежные потоки могут временно прекратиться, возможны вынужденные потери.';

  @override
  String get tarotWealthDetail12 =>
      'В финансовых делах может наступить период застоя. Вложения могут быть «заморожены», а ожидаемые доходы — задержаны. Чем больше вы будете суетиться, тем сложнее будет ситуация, поэтому сейчас лучше сохранять спокойствие. Используйте это время, чтобы пересмотреть свои привычки в тратах и выработать новое отношение к деньгам.';

  @override
  String get tarotSuccessMeaning12 =>
      'Дела могут идти не по плану, возможны задержки.';

  @override
  String get tarotSuccessDetail12 =>
      'Приостановка проекта или задержка в делах могут вызвать стресс, но это не поражение, а сигнал к «перезагрузке». Не пытайтесь форсировать события — отступите на шаг и пересмотрите общую стратегию. Отказ от старых шаблонов поможет вам найти гениальное решение, а нынешние испытания принесут ценный опыт.';

  @override
  String get tarotKeywords13 =>
      'Завершение, перемены, трансформация, расставание, новое начало';

  @override
  String get tarotDesc13 =>
      'Символ полного завершения старого и рождения нового. Это болезненный, но неизбежный процесс трансформации, когда смерть старого прокладывает путь для будущего.';

  @override
  String get tarotLoveMeaning13 =>
      'Означает конец отношений или их радикальную перемену.';

  @override
  String get tarotLoveDetail13 =>
      'Ваши текущие отношения, возможно, достигли своего предела. Вместо того чтобы пытаться удержать то, что уходит, проявите смелость и отпустите ситуацию. Расставание болезненно, но в конце этого пути вас обязательно ждет лучшее начало. Помните: только полностью освободившись от прошлых привязанностей и ран, вы освободите место для нового человека в своей жизни.';

  @override
  String get tarotWealthMeaning13 =>
      'Возможны финансовые потери или неудачи в инвестициях.';

  @override
  String get tarotWealthDetail13 =>
      'Ожидаются серьезные перемены в финансах. Вы можете столкнуться с убытками там, где не ждали, или с непредвиденными расходами. Это сигнал о том, что старые методы управления капиталом больше не работают. Используйте этот момент, чтобы закрыть долги, отсечь ненужные траты и начать строить более здоровую и стабильную финансовую структуру.';

  @override
  String get tarotSuccessMeaning13 =>
      'Текущая работа может быть прервана или закончиться неудачей.';

  @override
  String get tarotSuccessDetail13 =>
      'Проект, в который вы вложили много сил, может закрыться, или в карьере произойдут резкие перемены. Сейчас вы можете чувствовать горечь поражения, но это знак судьбы: пора оставить то, что вам не подходит, и искать путь к настоящему успеху. Начните с чистого листа, и перед вами откроется новая, более захватывающая глава жизни.';

  @override
  String get tarotKeywords14 =>
      'Баланс, умеренность, гармония, исцеление, компромисс';

  @override
  String get tarotDesc14 =>
      'Ангел переливает воду из одной чаши в другую, символизируя идеальный баланс между реальностью и идеалом, а также гармоничный поток жизни.';

  @override
  String get tarotLoveMeaning14 =>
      'Процесс, в котором два разных человека находят общий язык и гармонию.';

  @override
  String get tarotLoveDetail14 =>
      'Для этого периода больше подходит спокойная и глубокая любовь, чем бурные страсти. Признавая различия друг друга и дополняя их, вы строите прочную связь. Даже если возникают споры, мудрость поможет вам решить их через спокойный диалог. Ваше мягкое и заботливое отношение успокоит партнера и создаст стабильную атмосферу в отношениях.';

  @override
  String get tarotWealthMeaning14 =>
      'Важно соблюдать баланс между доходами и расходами.';

  @override
  String get tarotWealthDetail14 =>
      'Финансовая ситуация стабилизируется. Вместо того чтобы гоняться за легкой наживой, сосредоточьтесь на эффективном распределении текущих активов. С ростом доходов важно сохранять привычку контролировать траты. В инвестициях лучше придерживаться стратегии диверсификации — последовательность и дисциплина в итоге приведут вас к богатству.';

  @override
  String get tarotSuccessMeaning14 =>
      'Ваша способность сглаживать острые углы и вести команду к согласию будет на высоте.';

  @override
  String get tarotSuccessDetail14 =>
      'Вы отлично справитесь с ролью посредника в командных проектах, решая конфликты и повышая общую эффективность. Ваша гибкость и умение адаптироваться будут оценены коллегами. Сейчас важно соблюдать баланс между работой и отдыхом, чтобы избежать выгорания. Взгляд на ситуацию в целом поможет вам достичь наилучших результатов.';

  @override
  String get tarotKeywords15 =>
      'Искушение, зависимость, привязанность, материализм, одержимость';

  @override
  String get tarotDesc15 =>
      'Символ желаний и привязанностей, которые сковывают нас. Это материальные искушения, от которых можно освободиться, если проявить волю, но в которые мы часто погружаемся с головой.';

  @override
  String get tarotLoveMeaning15 =>
      'Сильное физическое влечение или одержимость партнером.';

  @override
  String get tarotLoveDetail15 =>
      'Вас может непреодолимо тянуть к кому-то, что мешает принимать здравые решения. Может начаться бурный и страстный роман, но будьте осторожны, чтобы не попасть в ловушку излишней ревности и контроля. Подумайте, является ли ваше чувство настоящей любовью или просто желанием обладать другим человеком. Учитесь контролировать свои порывы.';

  @override
  String get tarotWealthMeaning15 =>
      'Чрезмерная жажда наживы может привести к рискованным вложениям или крупным тратам на развлечения.';

  @override
  String get tarotWealthDetail15 =>
      'Сейчас период множества финансовых соблазнов. Остерегайтесь сомнительных предложений о «легких» деньгах и импульсивных покупок, которые могут опустошить ваш кошелек. Не становитесь рабом денег и не подрывайте доверие окружающих. Вместо новых вложений сейчас лучше сосредоточиться на сохранении того, что имеете, и укрощении своего аппетита.';

  @override
  String get tarotSuccessMeaning15 =>
      'Ради успеха вы можете быть готовы пойти на любые меры.';

  @override
  String get tarotSuccessDetail15 =>
      'Жажда власти или признания может заставить вас видеть в коллегах только конкурентов. Будьте осторожны, чтобы не превратиться в трудоголика, забывающего о здоровье и отдыхе. Откажитесь от мысли получить всё и сразу без должных усилий. Честное отношение к делу поможет вам освободиться от внутренних оков, которые вы сами себе создали.';

  @override
  String get tarotKeywords16 =>
      'Разрушение, потрясение, внезапные перемены, освобождение, прозрение';

  @override
  String get tarotDesc16 =>
      'Молния ударяет в башню, она рушится, и люди падают вниз. Это символ внезапного разрушения старых ценностей под действием внешних сил и столкновения с горькой правдой.';

  @override
  String get tarotLoveMeaning16 =>
      'В отношениях возможен серьезный кризис или внезапный разрыв.';

  @override
  String get tarotLoveDetail16 =>
      'Как гром среди ясного неба, в вашей личной жизни может произойти неожиданное событие. Вы можете разочароваться в партнере или столкнуться с конфликтом, который пошатнет основы ваших отношений. Но не отчаивайтесь: это процесс очищения от иллюзий и нездоровых связей. На руинах старого со временем вырастет нечто более крепкое и настоящее.';

  @override
  String get tarotWealthMeaning16 =>
      'Нужно подготовиться к внезапным финансовым потерям или потрясениям.';

  @override
  String get tarotWealthDetail16 =>
      'Наступает период крайней нестабильности в финансах. Возможны резкие убытки или крах инвестиционных проектов. Сейчас крайне важно перевести активы в безопасное место и быть начеку. Помните, что этот крах поможет вам пересмотреть свои взгляды на деньги, а после падения всегда наступает период восстановления на более прочном фундаменте.';

  @override
  String get tarotSuccessMeaning16 =>
      'Проекты могут быть прерваны, возможны резкие перемены в карьере или кадровые перестановки.';

  @override
  String get tarotSuccessDetail16 =>
      'Вы можете почувствовать горечь от того, что дело, которое вы строили по кирпичику, рушится. Но это происходит не из-за вашей слабости, а из-за неизбежных перемен. Сохраняйте спокойствие, оцените ситуацию и начните искать новые пути. Если вы сможете превратить этот кризис в возможность для перезагрузки, вы достигнете еще больших высот.';

  @override
  String get tarotKeywords17 =>
      'Надежда, вдохновение, исцеление, оптимизм, исполнение желаний';

  @override
  String get tarotDesc17 =>
      'Под светом яркой звезды женщина льет воду, символизируя покой после испытаний и надежду на светлое будущее.';

  @override
  String get tarotLoveMeaning17 =>
      'Период встречи с идеалом или исполнения мечты о любви.';

  @override
  String get tarotLoveDetail17 =>
      'Как звезда в ночи, в вашу жизнь приходит сияющая надежда. Вы можете встретить человека своей мечты, а ваше искреннее обаяние будет крайне притягательным для окружающих. Прошлые обиды затягиваются, уступая место светлой энергии, которая позволит вам снова поверить в любовь.';

  @override
  String get tarotWealthMeaning17 =>
      'Финансовая ситуация начинает постепенно улучшаться.';

  @override
  String get tarotWealthDetail17 =>
      'Денежная удача разворачивается в вашу сторону. Экономические трудности остаются позади, и вы начинаете видеть свет в конце тоннеля. Креативные идеи могут принести дополнительные источники дохода. Сейчас важно мыслить на перспективу: вложения в будущее станут залогом вашей финансовой стабильности.';

  @override
  String get tarotSuccessMeaning17 =>
      'Вас ждет прилив вдохновения и возможность заявить о своих талантах.';

  @override
  String get tarotSuccessDetail17 =>
      'Ваши идеи получат признание и похвалу коллег. Вы особенно преуспеете в творческих сферах, маркетинге или рекламе — сейчас идеальное время для запуска проекта, о котором вы давно мечтали. Действуйте уверенно: у вас есть все шансы завоевать популярность и укрепить свой авторитет.';

  @override
  String get tarotKeywords18 =>
      'Тревога, иллюзия, неопределенность, интуиция, подсознание';

  @override
  String get tarotDesc18 =>
      'Под светом луны сосуществуют тревога и туманная неопределенность, символизируя скрытую правду и мир подсознания.';

  @override
  String get tarotLoveMeaning18 =>
      'Непонимание чувств партнера, возможны обиды и подозрения.';

  @override
  String get tarotLoveDetail18 =>
      'Вы словно в тумане: чувства партнера неясны, что порождает тревогу. Мелкие недоразумения могут перерасти в серьезные подозрения, лишая вас покоя. Но не спешите с выводами — сейчас лучше занять выжидательную позицию. Вместо того чтобы цепляться за неопределенные отношения, постарайтесь сохранить внутреннее равновесие и мыслить рационально.';

  @override
  String get tarotWealthMeaning18 =>
      'Финансовые перспективы туманны, высок риск обмана или мошенничества.';

  @override
  String get tarotWealthDetail18 =>
      'Ваше видение ситуации сейчас искажено. Вы легко можете поддаться на уловки мошенников или заманчивые, но пустые обещания. Опасайтесь скрытых ловушек и проявляйте крайнюю осторожность в делах. Сейчас не время для новых проектов — лучше сосредоточиться на защите того, что у вас уже есть, и тщательной проверке любой информации.';

  @override
  String get tarotSuccessMeaning18 =>
      'Период путаницы: цели неясны, возможны интриги в коллективе.';

  @override
  String get tarotSuccessDetail18 =>
      'Вы можете оказаться в ситуации неопределенности, когда направление развития проекта размыто, а за спиной шепчутся коллеги. Будьте осторожны в словах и поступках. Сейчас мудрее будет подождать, пока ситуация прояснится. Не верьте слухам на слово, сохраняйте спокойствие и занимайтесь своим делом, не вступая в конфликты.';

  @override
  String get tarotKeywords19 =>
      'Успех, счастье, жизненная сила, позитив, благословение';

  @override
  String get tarotDesc19 =>
      'Под ярким солнцем ребенок на белом коне машет флагом, радуясь жизни. Это символ полной ясности, успеха и счастья.';

  @override
  String get tarotLoveMeaning19 =>
      'Вас ждут благословенные, яркие и счастливые отношения.';

  @override
  String get tarotLoveDetail19 =>
      'Идеально счастливая и благословенная любовь сейчас с вами. Прошлые недопонимания и конфликты исчезнут, а доверие укрепится. Одиноких людей ждет встреча с кем-то, кто излучает светлую энергию. Возможны радостные новости, такие как свадьба или расширение семьи. Это прекрасное время, чтобы наслаждаться любовью чисто и страстно, как ребенок.';

  @override
  String get tarotWealthMeaning19 =>
      'Ваше финансовое положение находится на пике.';

  @override
  String get tarotWealthDetail19 =>
      'Наступил ваш «звездный час». Ваши финансовые перспективы очень сильны, что ведет к росту прибыли. Все ваши прошлые усилия наконец-то вознаграждаются сполна. Сейчас удачное время для крупных покупок или инвестиций в то, что приносит вам радость. Наслаждайтесь своим успехом и делитесь им с другими.';

  @override
  String get tarotSuccessMeaning19 =>
      'Ваши таланты будут признаны, и вы окажетесь в центре внимания.';

  @override
  String get tarotSuccessDetail19 =>
      'Звучат фанфары успеха. Все ваши прошлые труды наконец-то оценены по достоинству и представлены миру. Вас ждет успех в делах, повышение по службе или блестящая сдача экзаменов. Ваша уверенность в себе и позитивный настрой помогут вам достичь любых высот. Это время вашего триумфа.';

  @override
  String get tarotKeywords20 =>
      'Возрождение, награда, известие, решение, воссоединение';

  @override
  String get tarotDesc20 =>
      'Ангел трубит в небе, и люди в гробах пробуждаются, радуясь жизни. Это символ вознаграждения за прошлые труды и пробуждения к новой жизни.';

  @override
  String get tarotLoveMeaning20 =>
      'Возможно известие от бывшего партнера или шанс на воссоединение.';

  @override
  String get tarotLoveDetail20 =>
      'Придет известие, которого вы долго ждали. Если вы не могли забыть старую любовь или надеялись на встречу, шансы на успех сейчас крайне высоки. Неопределенные отношения наконец-то могут перерасти в нечто серьезное. Возможно возобновление связи со старым знакомым — прислушайтесь к своему сердцу и примите решение, о котором не будете жалеть.';

  @override
  String get tarotWealthMeaning20 =>
      'Прошлые вложения могут принести прибыль, возможен возврат старых долгов.';

  @override
  String get tarotWealthDetail20 =>
      'Наступает время пожинать плоды прошлых усилий. Забытые акции могут вырасти в цене, или вам вернут долг, на который вы уже не рассчитывали. Возможна неожиданная удача или шанс успешно перезапустить старую идею. Решение, которое вы примете сейчас, окажет большое влияние на ваше финансовое будущее, поэтому действуйте смело.';

  @override
  String get tarotSuccessMeaning20 =>
      'Ваши прошлые труды будут признаны, возможны повышение или награда.';

  @override
  String get tarotSuccessDetail20 =>
      'Настал день суда. Ваши прошлые усилия наконец-то получили достойную оценку, и благие вести, подобные звуку трубы, не заставят себя ждать. Возможны выгодные предложения по работе или шанс выйти из застоя и снова взлететь. Не бойтесь перемен — ловите возможность и начинайте новую главу своей карьеры.';

  @override
  String get tarotKeywords21 =>
      'Завершение, интеграция, достижение, счастливый конец, совершенство';

  @override
  String get tarotDesc21 =>
      'Символ полного достижения цели и идеальной гармонии после долгого путешествия. Четыре священных зверя по углам благословляют совершенный мир и предвещают начало нового, еще более захватывающего цикла.';

  @override
  String get tarotLoveMeaning21 =>
      'Означает расцвет и полноту любви. Вас ждет союз с идеальным партнером и моменты истинного счастья.';

  @override
  String get tarotLoveDetail21 =>
      'Наступил идеальный момент, чтобы поставить точку в долгих отношениях и перейти на новый уровень — например, вступить в брак. Вы убедитесь, что являетесь лучшими партнерами друг для друга, и будете наслаждаться счастьем единства. Если вы одиноки, вы встретите человека, который полностью соответствует вашим идеалам. Возможно знакомство во время путешествия.';

  @override
  String get tarotWealthMeaning21 =>
      'Вы достигнете поставленной финансовой цели и обретете экономическую свободу.';

  @override
  String get tarotWealthDetail21 =>
      'Вы на 100% достигли своих денежных целей и вышли на уровень финансовой свободы. Возможны крупные прибыли от международного сотрудничества или инвестиций в глобальные рынки. Ваш инвестиционный портфель сбалансирован и приносит стабильный доход. Наслаждайтесь достатком и начинайте расширять свои горизонты.';

  @override
  String get tarotSuccessMeaning21 =>
      'Проект будет успешно завершен, и вы получите высшее признание.';

  @override
  String get tarotSuccessDetail21 =>
      'Вы достигли пика своей карьеры. Порученный проект завершится блестящим успехом, и вы получите заслуженную похвалу. Все намеченные цели достигнуты, и пора готовиться к выходу на мировую арену. Перед вами открываются возможности для обучения или работы за рубежом, поэтому используйте нынешний успех как трамплин для новых свершений.';

  @override
  String get supplementRecordPrompt => 'Примите витамины и запишите результат!';

  @override
  String get snoozeQuestion => 'Когда напомнить вам снова?';

  @override
  String get hoursShort => 'ч';

  @override
  String get minutesShort => 'мин';

  @override
  String get after => 'спустя';

  @override
  String snoozeMessage(int minutes) {
    return 'Будильник снова прозвенит через $minutes мин.';
  }

  @override
  String timesTaken(int count) {
    return '$count раз принято';
  }

  @override
  String dailyGoalTimes(int goal) {
    return 'Цель: $goal раз в день';
  }

  @override
  String get didYouTakeSupplement => 'Вы приняли витамины?';

  @override
  String get viewMissionRecords => 'История миссий';

  @override
  String get setTakingGoal => 'Установить цель';

  @override
  String get times => 'раз';

  @override
  String get dailyTakingGoal => 'Дневная цель';

  @override
  String get howManyTimesADay => 'Сколько раз в день вы принимаете добавки?';

  @override
  String get setGoalMl => 'Установить цель (мл)';

  @override
  String get sleepAnalysis => 'Анализ сна';

  @override
  String get todaysSleep => 'Сон сегодня';

  @override
  String get sleepDuration => 'Длительность сна';

  @override
  String get wakeUpTime => 'Время пробуждения';

  @override
  String get weeklySleepPattern => 'График сна за неделю';

  @override
  String get sleepAdvice =>
      'Вы соблюдаете режим. Сегодня вы легли спать на 30 минут раньше, чем вчера!';

  @override
  String get stopwatch => 'Секундомер';

  @override
  String get lap => 'Круг';

  @override
  String get stop => 'Стоп';

  @override
  String lapLabel(int index) {
    return 'Круг $index';
  }

  @override
  String get monday => 'Пн';

  @override
  String get tuesday => 'Вт';

  @override
  String get wednesday => 'Ср';

  @override
  String get thursday => 'Чт';

  @override
  String get friday => 'Пт';

  @override
  String get saturday => 'Сб';

  @override
  String get sunday => 'Вс';

  @override
  String get policy => 'Политика конфиденциальности';

  @override
  String get support => 'Служба поддержки';

  @override
  String get defaultAlarmBehavior => 'Настройки по умолчанию';

  @override
  String get defaultAlarmVolume => 'Громкость по умолчанию';

  @override
  String get defaultAlarmVolumeDescription =>
      'Громкость для новых будильников.';

  @override
  String get gradualVolumeDescription => 'Постепенное увеличение громкости.';

  @override
  String get defaultVibration => 'Вибрация по умолчанию';

  @override
  String get defaultVibrationDescription =>
      'Включать вибрацию для новых будильников.';

  @override
  String get defaultInterval => 'Интервал по умолчанию';

  @override
  String get maxSnoozeCountLabel => 'Макс. количество повторов';

  @override
  String get minutes => 'min';

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
  String get missionWorkout => 'Тренировка';

  @override
  String get missionDiary => 'Вести дневник';

  @override
  String get missionBedMaking => 'Заправить постель';

  @override
  String get missionStretching => 'Растяжка';

  @override
  String get missionReading => 'Чтение (10 мин)';

  @override
  String get missionPlanning => 'План на день';

  @override
  String get missionBreakfast => 'Позавтракать';

  @override
  String get missionMeditation => 'Медитация (5 мин)';

  @override
  String get missionLearnWords => 'Выучить 5 слов';

  @override
  String get missionVentilation => 'Проветривание';

  @override
  String get missionCleaning => 'Уборка';

  @override
  String get missionGratitudeDiary => 'Дневник благодарности';

  @override
  String get faqQuestion1 => 'Будильник не звонит.';

  @override
  String get faqAnswer1 =>
      'Система Android может блокировать будильники в режиме экономии энергии. Пожалуйста, разрешите приложению работу в фоновом режиме в меню «Настройки > Оптимизация будильника».';

  @override
  String get faqQuestion2 => 'Как изменить миссию?';

  @override
  String get faqAnswer2 =>
      'Вы можете выбрать другую миссию (Математика, Фото, Тряска и др.) в настройках конкретного будильника в списке.';

  @override
  String get faqQuestion3 => 'Как включить темную тему?';

  @override
  String get faqAnswer3 =>
      'Вы можете изменить тему в меню «Настройки > Общие > Темная тема».';

  @override
  String get faqQuestion4 => 'Как собирать печенье?';

  @override
  String get faqAnswer4 =>
      'Вы получаете печенье за каждое успешное пробуждение или выполнение миссий. Используйте их, чтобы узнавать предсказания на день!';

  @override
  String get faqQuestion5 => 'Исчезнут ли данные при удалении приложения?';

  @override
  String get faqAnswer5 =>
      'Да, все данные хранятся на устройстве. При удалении приложения ваши записи и настройки будут стерты.';

  @override
  String get noticeLabel => 'Объявления';

  @override
  String get notice1Title => 'Запуск Fortune Alarm';

  @override
  String get notice1Content =>
      'Здравствуйте! Fortune Alarm официально запущен.\\n\\nНачинайте каждое утро с проверки своей удачи и заряжайтесь позитивом на весь день!\\nМы продолжим радовать вас новыми функциями.\\n\\nСпасибо, что вы с нами.';

  @override
  String get notice2Title => 'Обновление версии 1.0.0';

  @override
  String get notice2Content =>
      'Что нового в версии 1.0.0:\\n\\n1. Улучшен интерфейс миссии «Витамины»\\n2. Оптимизированы настройки точного времени\\n3. Добавлена поддержка темной темы\\n4. Исправлены ошибки и повышена стабильность\\n\\nОбновитесь до последней версии прямо сейчас!';

  @override
  String get notice3Title => 'Изменение Условий использования';

  @override
  String get notice3Content =>
      'Мы обновили условия использования.\\n\\nОсновные изменения:\\n- Улучшена политика конфиденциальности\\n- Уточнены правила использования сервисов\\n\\nПодробности в меню «Настройки > Условия».';

  @override
  String get notice4Title => 'Обновление версии 1.1.1';

  @override
  String get notice4Content =>
      'Что нового в версии 1.1.1:\\n\\n1. Улучшен интерфейс руководства по оптимизации батареи\\n2. Оптимизирована верстка текста для английской версии\\n3. Повышена стабильность рекламной системы\\n4. Улучшена общая стабильность и производительность приложения\\n\\nПожалуйста, обновитесь до последней версии для более комфортной работы!';

  @override
  String get supportContentTitle => 'Текст запроса';

  @override
  String get supportHint =>
      'Пожалуйста, опишите вашу проблему или предложение.';

  @override
  String get supportRecipient => 'Кому: Служба поддержки';

  @override
  String get emailCopied => 'Адрес почты скопирован.';

  @override
  String get copyTooltip => 'Копировать';

  @override
  String get supportWorkingDays =>
      'Мы постараемся ответить в течение 24 часов в рабочие дни.';

  @override
  String get supportEmptyError => 'Пожалуйста, введите текст запроса.';

  @override
  String get supportSubjectPrefix => 'Тема запроса';

  @override
  String get supportContentPrefix => 'Текст запроса';

  @override
  String get supportCopySuccessTitle => 'Запрос скопирован';

  @override
  String supportCopySuccessMessage(String email) {
    return 'Текст запроса скопирован в буфер обмена.\\nХотите отправить письмо на $email?';
  }

  @override
  String get selectionComplete => 'Выбор завершен';

  @override
  String get selectVibration => 'Выбрать тип вибрации';

  @override
  String get cameraMissionSequentialImageError =>
      'Пожалуйста, добавьте изображения для миссии по порядку.';

  @override
  String get copyEmailAction => 'Копировать адрес почты';

  @override
  String get addMissionTitle => 'Новая миссия';

  @override
  String get recommendedMissionList => 'Рекомендованные миссии';

  @override
  String get recommendedMissionDesc => 'Миссии для продуктивного дня.';

  @override
  String get all => 'Все';

  @override
  String get allMissions => 'Все миссии';

  @override
  String categoryMissions(String category) {
    return 'Миссии: $category';
  }

  @override
  String get deselectAll => 'Снять всё';

  @override
  String get selectAll => 'Выбрать всё';

  @override
  String get myCustomMissions => 'Мои миссии';

  @override
  String get myCustomMissionsDesc => 'Миссии, которые вы создали сами.';

  @override
  String get createYourOwnMission => 'Создать свою миссию';

  @override
  String get createYourOwnMissionDesc =>
      'Если не нашли подходящую, создайте свою.';

  @override
  String get missionNameHint => 'Название (напр., Сходить в зал)';

  @override
  String get selectCategory => 'Категория';

  @override
  String get getNotification => 'Уведомление';

  @override
  String get missionCategoryHealth => 'Здоровье';

  @override
  String get missionCategoryStudy => 'Учеба';

  @override
  String get missionCategoryRoutine => 'Привычки';

  @override
  String get missionCategoryHobby => 'Хобби';

  @override
  String get missionCategoryOther => 'Другое';

  @override
  String get copyEmailSuccessMessage =>
      'Адрес скопирован. Пожалуйста, вставьте его в ваше почтовое приложение.';

  @override
  String get supportSubmitButton => 'Копировать и отправить';

  @override
  String get shakePhone => 'Потрясите телефон!';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get fortuneCheckButton => 'Узнать предсказание';

  @override
  String get fortuneSelectCards => 'Выберите 3 карты';

  @override
  String get fortuneDragCards => 'Перетащите 3 карты';

  @override
  String get fortuneDetailTitle => 'Подробности';

  @override
  String get labelFineDust => 'Пыль';

  @override
  String get labelUltraFineDust => 'Мелкая пыль';

  @override
  String get weatherToday => 'Погода на сегодня';

  @override
  String get weatherUpdateMessage =>
      'Обновляем погоду для вашего местоположения.';

  @override
  String get weatherDisclaimer =>
      'Данные могут незначительно отличаться от фактических.';

  @override
  String get weatherSource => 'Данные предоставлены погодными службами';

  @override
  String get locationPermissionTitle => 'Доступ к геопозиции';

  @override
  String get locationPermissionDesc => 'Требуется для отображения погоды.';

  @override
  String get hourlyForecast => 'Почасовой прогноз';

  @override
  String get weeklyForecast => 'Прогноз на неделю';

  @override
  String hourFormat(String hour) {
    return '$hourч';
  }

  @override
  String get noNotifications => 'Нет новых уведомлений.';

  @override
  String get adLoadFailed => 'Ошибка загрузки рекламы';

  @override
  String get adLoading => 'Загрузка рекламы...';

  @override
  String get removeAds => 'Удалить рекламу';

  @override
  String get close => 'Закрыть';

  @override
  String get exitQuestion => 'Выйти из приложения?';

  @override
  String get exitApp => 'Выйти';

  @override
  String get shareResultDescription =>
      'Мой результат гадания в приложении Будильник удачи.';

  @override
  String get shareResultButton => 'Поделиться';

  @override
  String get unknownTime => 'Время неизвестно';

  @override
  String get adLoadError => 'Не удалось загрузить рекламу. Попробуйте позже.';

  @override
  String get adShowError => 'Не удалось показать рекламу. Попробуйте позже.';

  @override
  String earnCookies(int count) {
    return 'Вы получили печенье: $count шт.! 🎉';
  }

  @override
  String get freePassAfterTimeout => 'Открываем результат бесплатно! 🎉';

  @override
  String get adLoadDelay =>
      'Загрузка задерживается. Попробуйте через мгновение.';

  @override
  String get fortuneAccessTitle => 'Проверить удачу';

  @override
  String get fortuneAccessSubtitle => 'Узнайте предсказание и получите бонусы!';

  @override
  String get watchAdButtonText => 'Смотреть рекламу (бесплатно)';

  @override
  String useCookiesButtonText(int count) {
    return 'Использовать печенье: $count шт.';
  }

  @override
  String get adFailFreePass => 'Реклама не загрузилась, открываем бесплатно.';

  @override
  String get luckyNumberTitle => 'Счастливые числа';

  @override
  String get luckyNumberSubtitle => 'Сгенерировано ИИ специально для вас';

  @override
  String get luckyNumberGenerateButton => 'Создать числа';

  @override
  String get luckyNumberGuideText =>
      'Откройте свои счастливые числа\\nс помощью ИИ-алгоритма Будильника удачи';

  @override
  String get luckyNumberAnalysisStep1 => 'Сбор данных об удаче...';

  @override
  String get luckyNumberAnalysisStep2 => 'Анализ закономерностей...';

  @override
  String get luckyNumberAnalysisStep3 => 'Анализ энергии чисел...';

  @override
  String get luckyNumberAnalysisStep4 => 'Изучение паттернов...';

  @override
  String get luckyNumberAnalysisStep5 => 'Применение ИИ-модели...';

  @override
  String get luckyNumberAnalysisStep6 => 'Расчет комбинации...';

  @override
  String get luckyNumberAnalysisStep7 => 'Готово! Генерация чисел';

  @override
  String get luckyNumberAnalysisFinal => 'Финальная обработка...';

  @override
  String get luckyNumberAnalyzing => 'Анализ энергии...';

  @override
  String get luckyNumberGeometric => 'Геометрический анализ...';

  @override
  String get luckyNumberPatterns => 'Сопоставление шаблонов...';

  @override
  String get luckyNumberEnergy => 'Гармонизация энергии...';

  @override
  String get luckyNumberCompleted => 'Анализ завершен!';

  @override
  String get luckyNumberShare => 'Поделиться результатом';

  @override
  String get luckyNumberRestart => 'Попробовать снова';

  @override
  String get luckyNumberGenerating => 'Создаем числа...';

  @override
  String get luckyNumberResultTitle => 'Ваши счастливые числа';

  @override
  String get luckyNumberResultSubtitle => '6 основных + бонусное число';

  @override
  String get luckyNumberDisclaimer =>
      '* Сервис носит развлекательный характер. Числа не гарантируют выигрыш.';

  @override
  String get luckyNumberShareTitle => 'Мои счастливые числа';

  @override
  String get luckyNumberShareDescription =>
      'Счастливые числа от Будильника удачи.';

  @override
  String luckyNumberSetLabel(String label) {
    return 'Набор $label';
  }

  @override
  String get luckyNumberRegenerateButton => 'Создать заново';

  @override
  String get luckyNumberFeatureAiTitle => 'ИИ Рекомендация';

  @override
  String get luckyNumberFeatureAiDesc => 'Умный алгоритм';

  @override
  String get luckyNumberFeatureSmartTitle => 'Смарт-прогноз';

  @override
  String get luckyNumberFeatureSmartDesc => 'Подбор счастливых чисел';

  @override
  String get luckyNumberFeatureDataTitle => 'Анализ данных';

  @override
  String get luckyNumberFeatureDataDesc => 'Оптимальная комбинация';

  @override
  String get fortunePassTitle => 'Fortune Pass';

  @override
  String get fortunePassTabFree => 'Бесплатно';

  @override
  String get fortunePassTabPremium => 'Premium Pass';

  @override
  String get fortunePassFreeChargeTitle => 'Получить печенье';

  @override
  String get fortunePassFreeChargeButton => 'Смотреть рекламу (1 печенье)';

  @override
  String get fortunePassActivePlan => 'Ваш тариф';

  @override
  String get fortunePassNoSubscription => 'Нет активной подписки';

  @override
  String get fortunePassRestore => 'Восстановить';

  @override
  String get fortunePassMonth1Title => '1 месяц';

  @override
  String get fortunePassMonth1Desc => 'Все функции на месяц';

  @override
  String get fortunePassMonth6Title => '6 месяцев';

  @override
  String get fortunePassMonth6Desc => 'Подписка со скидкой';

  @override
  String get fortunePassYear1Title => '1 год';

  @override
  String get fortunePassYear1Desc => 'Лучшая цена за год';

  @override
  String get fortunePassBestPlan => 'Популярный выбор';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return 'Скидка $percent%!';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return 'СКИДКА $percent%';
  }

  @override
  String get fortunePassPerMonth => ' /мес.';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return 'Всего $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => 'Месяц';

  @override
  String get fortunePassUnit6Months => '6 месяцев';

  @override
  String get fortunePassUnitYear => 'Год';

  @override
  String get fortunePassMyCookies => 'Мои печенья';

  @override
  String get fortunePassCurrentStatus => 'Статус';

  @override
  String get fortunePassStatusPremium => 'Premium Pass активен';

  @override
  String get fortunePassStatusFree => 'Бесплатная версия';

  @override
  String get fortunePassStoreErrorTitle => 'Ошибка магазина';

  @override
  String get fortunePassStoreErrorContent =>
      'Не удалось загрузить данные о покупках.';

  @override
  String fortunePassSubscribeSale(int percent) {
    return 'Подписаться (скидка $percent%)';
  }

  @override
  String get fortunePassSubscribeNow => 'Подписаться сейчас';

  @override
  String get fortunePassApplied => 'Подписка Fortune Pass активирована.';

  @override
  String get fortunePassApplyFailed =>
      'Не удалось активировать подписку. Проверьте сеть.';

  @override
  String get fortunePassRestored => 'Покупки восстановлены.';

  @override
  String get fortunePassRestoreFailed => 'Не удалось восстановить покупки.';

  @override
  String get fortunePassTimeSaleTitle => 'Подождите! Вам пришел подарок 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return 'Обычная цена $price/год';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '$price/год';
  }

  @override
  String get fortunePassTimeSaleBadge =>
      'Скидка 50%, если подпишетесь за 3 минуты!';

  @override
  String get fortunePassTimeSaleButton => 'Получить скидку и начать Pro';

  @override
  String get fortunePassTimeSaleCancel => 'Может быть, позже';

  @override
  String get fortunePassTimeSaleStartMessage =>
      '3-минутная скидка началась! Проверьте верхний баннер.';

  @override
  String get fortunePassSubscribeButton => 'Подписаться';

  @override
  String get fortunePassSubscribeDiscountButton => 'Подписаться со скидкой 50%';

  @override
  String get fortunePassCookieBalance => 'Ваши печенья удачи';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'Pass Активен';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return 'Всего $price / $unit';
  }

  @override
  String get fortunePassPopularPlan => 'Популярный тариф';

  @override
  String get fortunePassPricePerMonth => ' /мес';

  @override
  String get fortunePassPaymentFailed => 'Ошибка запроса платежа.';

  @override
  String get fortunePassSubscriptionFailed =>
      'Не удалось активировать подписку. Проверьте сеть.';

  @override
  String get fortunePassSubscriptionSuccess =>
      'Подписка Fortune Pass активирована.';

  @override
  String get fortunePassCannotSubscribeTitle => 'Ошибка подписки';

  @override
  String get fortunePassCannotSubscribeMessage =>
      'Не удалось получить данные о товарах из магазина.\\n\\n[Чек-лист]\\n1. Статус входа в Google Play / App Store\\n2. Подключение к интернету\\n3. Статус регистрации тестового устройства';

  @override
  String get year => 'Год';

  @override
  String get month => 'Месяц';

  @override
  String get day => 'День';

  @override
  String get sajuProfileTitle => 'Редактировать профиль Саджу';

  @override
  String get sajuNameLabel => 'Имя';

  @override
  String get sajuNameHint => 'Пожалуйста, введите ваше имя';

  @override
  String get sajuNameHelper => 'До 6 символов';

  @override
  String get sajuGenderLabel => 'Пол';

  @override
  String get sajuGenderMale => 'Мужчина';

  @override
  String get sajuGenderFemale => 'Женщина';

  @override
  String get sajuBirthDateLabel => 'Дата рождения';

  @override
  String get sajuBirthTimeLabel => 'Время рождения';

  @override
  String get sajuUnknownTime => 'Время неизвестно';

  @override
  String get sajuEditComplete => 'Редактирование завершено';

  @override
  String get sajuSolar => 'Солнечный';

  @override
  String get sajuLunar => 'Лунный';

  @override
  String get sajuSelectBirthDate => 'Выберите дату рождения';

  @override
  String get sajuSelectBirthTime => 'Выбрать время рождения';

  @override
  String get compatibilityTitle => 'Проверить совместимость';

  @override
  String get compatibilityInputHeader => 'Введите данные обоих партнеров';

  @override
  String get compatibilityInputSubtitle =>
      'Мы проанализируем точную совместимость на основе данных Саджу.';

  @override
  String get compatibilityMyInfo => 'Мои данные';

  @override
  String get compatibilityInputMyNameGuide => 'Пожалуйста, введите ваше имя.';

  @override
  String get compatibilityInputPartnerNameGuide =>
      'Пожалуйста, введите имя партнера.';

  @override
  String get compatibilityPartnerInfo => 'Данные партнера';

  @override
  String get compatibilityLoadSaved => 'Загрузить сохраненные';

  @override
  String get compatibilityTitleBest => 'Идеальная пара! ❤️';

  @override
  String get compatibilityDescBest =>
      'Лучшая совместимость, о которой можно только мечтать. Не отпускайте друг друга!';

  @override
  String get compatibilityDescBest_Youth =>
      'Вы лучшие партнеры для свежей и страстной любви. Прекрасно видеть, как вы поддерживаете мечты друг друга и растете вместе! Ваши отношения дают позитивный стимул, когда вы делитесь заботами об учебе или карьере. Если вы будете ценить и заботиться друг о друге так же, как сейчас, вы — идеальная пара, способная вместе преодолеть любые испытания.';

  @override
  String get compatibilityDescBest_Mature =>
      'Вы идеальные партнеры, дающие друг другу стабильность и силу. Это зрелые отношения, в которых вы доверяете ценностям друг друга и строите совместное будущее. Вы глубоко понимаете жизненные цели друг друга и являетесь лучшей поддержкой. С взаимным доверием в качестве основы вы сможете вести счастливую и процветающую совместную жизнь.';

  @override
  String get compatibilityDescBest_Senior =>
      'Вы прекрасные спутники, проводящие золотые годы вместе в тепле и уюте. Это глубокие отношения, в которых вы уважаете мудрость друг друга и оказываете эмоциональную поддержку. Вы партнеры, которые делят маленькие радости повседневной жизни и заботятся о здоровье друг друга. Ваш союз бесценен, он ведет к мирной и счастливой жизни, полной общих воспоминаний.';

  @override
  String get compatibilityTitleGreat => 'Очень хорошие отношения 💕';

  @override
  String get compatibilityDescGreat =>
      'Прекрасный партнер, который является огромной поддержкой друг для друга.';

  @override
  String get compatibilityDescGreat_Youth =>
      'Это отношения, полные энергии и азарта. У вас схожие интересы и ценности, поэтому вы с удовольствием проводите много времени вместе. Вы пара, которая растет вместе, мотивируя друг друга. Если вы преодолеете небольшие различия с пониманием, ваша любовь станет еще глубже.';

  @override
  String get compatibilityDescGreat_Mature =>
      'Вы пара с очень высокой гармонией в образе жизни и ценностях. Вы уважаете работу и личное пространство друг друга, обеспечивая при этом надежную эмоциональную поддержку. Это стабильные отношения, в которых проблемы решаются сообща и планируется надежное будущее. Если вы сохраните общение, вашим отношениям будут завидовать окружающие.';

  @override
  String get compatibilityDescGreat_Senior =>
      'Вы партнеры, которые дарят друг другу утешение и покой. Вы разделяете хобби друг друга и наслаждаетесь спокойным временем вместе. Это отношения, в которых вы цените жизненный опыт друг друга и поддерживаете во всем. Если вы будете внимательны к здоровью и чувствам друг друга, ваши золотые годы будут очень стабильными и счастливыми.';

  @override
  String get compatibilityTitleGood => 'Хорошо подходящая пара 😊';

  @override
  String get compatibilityDescGood =>
      'Есть некоторые различия, но вы можете построить прекрасную любовь, подстраиваясь друг под друга.';

  @override
  String get compatibilityDescGood_Youth =>
      'Вы пара, которая строит прекрасную любовь через взаимную адаптацию. Хотя в характерах могут быть различия, вы можете построить хорошие отношения, если будете стараться понять друг друга. Важно уважать индивидуальность партнера и находить точки соприкосновения в честных разговорах.';

  @override
  String get compatibilityDescGood_Mature =>
      'Ваши отношения остаются стабильными благодаря взаимному вниманию и усилиям. Могут возникать ситуации, когда ваши взгляды на практические вопросы или жизненные решения расходятся, но вы можете решить их путем диалога. Если вы сосредоточитесь на сильных сторонах друг друга и будете поддерживать партнера, вы станете крепкой парой.';

  @override
  String get compatibilityDescGood_Senior =>
      'Вы спутники, ведущие мирную жизнь и подстраивающиеся под ритм друг друга. Важно уважать привычки партнера и укреплять близость через простые ежедневные разговоры. Если вы будете следить за здоровьем друг друга и поддерживать во всем, ваши отношения будут комфортными и уютными.';

  @override
  String get compatibilityTitleEffort => 'Требуются усилия 🧐';

  @override
  String get compatibilityDescEffort =>
      'Много различий. Понимание и внимание — ключи к вашим отношениям.';

  @override
  String get compatibilityDescEffort_Youth =>
      'Вы пара, которой нужно расти вместе через долгие разговоры и понимание. Часто могут возникать разногласия из-за разных характеров, но если вы будете воспринимать это как процесс познания друг друга, вы сможете развиваться. Важно понимать точку зрения партнера, а не навязывать свое мнение.';

  @override
  String get compatibilityDescEffort_Mature =>
      'Это отношения, требующие большого терпения и адаптации, так как ваши стили жизни могут различаться. Могут возникать трения в практических делах, поэтому важно установить четкие правила и уважать друг друга. Если вы приложите усилия, чтобы видеть в различиях не конфликт, а дополнение, вы сможете сохранить отношения.';

  @override
  String get compatibilityDescEffort_Senior =>
      'Вы партнеры, которым нужно давать друг другу пространство и стараться понять привычки партнера. Важно принимать устоявшийся годами образ жизни другого, а не пытаться его изменить. Если вы сосредоточитесь на общих интересах и будете поддерживать друг друга эмоционально, ваши отношения будут стабильными.';

  @override
  String get compatibilityTitleDifficult => 'Нужно много подстраиваться 😅';

  @override
  String get compatibilityDescDifficult =>
      'Различия в характерах могут быть значительными. Вы должны глубоко понимать различия друг друга.';

  @override
  String get compatibilityDescDifficult_Youth =>
      'Различия в характерах могут быть значительными, что может приводить к частым конфликтам. Это отношения, требующие глубокой любви и готовности меняться ради другого. Вместо того чтобы пытаться контролировать партнера, важно принимать его индивидуальность такой, какая она есть, и находить компромисс через постоянный диалог.';

  @override
  String get compatibilityDescDifficult_Mature =>
      'Поскольку ваши ценности и жизненные цели могут сильно различаться, требуется много усилий, чтобы найти общее направление. Может быть трудно прийти к компромиссу в важных жизненных решениях, поэтому честное и глубокое общение просто необходимо. Если вы воспримете различия как возможность для личностного роста, вы сможете преодолеть трудности.';

  @override
  String get compatibilityDescDifficult_Senior =>
      'Важно признавать различия в образе жизни, которые каждый из вас вырабатывал долгие годы, и уважать личное пространство другого. Вместо того чтобы пытаться подстроить партнера под свои представления, лучше строить отношения на взаимном принятии. Чтобы обрести покой вместе, потребуется много терпения и понимания.';

  @override
  String get compatibilityAdvice_Youth =>
      'Старайтесь смотреть на мир глазами партнера. Маленькие сюрпризы и искренние слова поддержки укрепят ваши отношения. Планируйте совместные занятия, которые вдохновляют вас обоих, и создавайте прекрасные воспоминания.';

  @override
  String get compatibilityAdvice_Mature =>
      'Честное общение о ваших целях и ожиданиях — ключ к успеху. Поддерживайте друг друга в профессиональном развитии, но не забывайте уделять время отношениям. Совместное финансовое планирование и видение будущего дадут вам чувство безопасности.';

  @override
  String get compatibilityAdvice_Senior =>
      'Вместе следите за здоровьем, наслаждайтесь прогулками или небольшими поездками. Делитесь жизненной мудростью и укрепляйте эмоциональную связь. Создайте дома уютную атмосферу, где вы оба будете чувствовать себя комфортно и защищенно.';

  @override
  String get compatibilityLuck_Youth =>
      'Это фаза удачи, когда ваша страсть и энергия сделают ваше совместное будущее ярким. У вас будет много возможностей для совместного роста и реализации мечтаний. Ваша любовь будет восприниматься окружающими как позитивная сила.';

  @override
  String get compatibilityLuck_Mature =>
      'Это время стабильности и роста. Ваши совместные усилия принесут плоды, будь то в финансовом плане или в глубине ваших чувств. Вы строите прочный фундамент на долгие годы.';

  @override
  String get compatibilityLuck_Senior =>
      'Эта удача характеризуется спокойствием, миром и взаимной заботой. Вы как бальзам для души друг друга. Это время наполнено глубокой благодарностью и радостью от совместного жизненного пути.';

  @override
  String get tarotLoveMeaning0_Senior =>
      'Это время находить радость в небольших ежедневных переменах, а не в новом волнении.';

  @override
  String get tarotLoveDetail0_Senior =>
      'Это время ценить маленькие радости повседневной жизни, а не большие перемены. Теплое общение с окружающими принесет вам покой.';

  @override
  String get tarotLoveMeaning1_Senior =>
      'Прислушайтесь к своему внутреннему голосу и найдите время, чтобы заглянуть в себя.';

  @override
  String get tarotLoveDetail1_Senior =>
      'Найдите глубокий смысл жизни через мудрость и проницательность. Ваше доброе сердце, помогающее другим, принесет вам большую удачу.';

  @override
  String get tarotLoveMeaning2_Senior =>
      'Используйте свой богатый опыт и мудрость, чтобы направлять окружающих.';

  @override
  String get tarotLoveDetail2_Senior =>
      'Направляйте свою семью и окружающих своей мудростью и опытом. Ваше стабильное руководство даст всем душевный покой.';

  @override
  String get tarotLoveMeaning3_Senior =>
      'Это время, когда материальное и эмоциональное изобилие достигается одновременно.';

  @override
  String get tarotLoveDetail3_Senior =>
      'Время, когда изобилие и стабильность приходят в вашу жизнь одновременно. Разделите эту радость со своими близкими и проведите счастливое время.';

  @override
  String get tarotLoveMeaning4_Senior =>
      'Необходимы сильное чувство ответственности и лидерство.';

  @override
  String get tarotLoveDetail4_Senior =>
      'Организуйте свое окружение с твердой волей и ведите свою жизнь с убеждением. Ваше стабильное присутствие даст душевный покой вашей семье и окружающим. Однако не забывайте о гибком сердце.';

  @override
  String get tarotLoveMeaning5_Senior =>
      'Это время следовать традиционным ценностям и искать духовный покой.';

  @override
  String get tarotLoveDetail5_Senior =>
      'Найдите смысл жизни в многолетней мудрости или учениях. Обмен вашими глубокими идеями с молодым поколением принесет большую награду. Ваше скромное и искреннее отношение будет привлекать людей.';

  @override
  String get tarotLoveMeaning6_Senior =>
      'Гармоничные отношения с окружающими — ключ к удаче.';

  @override
  String get tarotLoveDetail6_Senior =>
      'Поддерживайте сбалансированные отношения, основанные на взаимном уважении и понимании. Глубокое общение с дорогим человеком станет отличным источником силы в вашей жизни. Это время еще раз почувствовать важность общения.';

  @override
  String get tarotLoveMeaning7_Senior =>
      'Действуйте смело, имея в виду четкую цель.';

  @override
  String get tarotLoveDetail7_Senior =>
      'Даже если вы в преклонном возрасте, ваша страсть все еще прекрасна. Если есть что-то, чего вы хотите достичь, стремитесь к этому с мужеством. Ваше активное отношение вдохнет новую жизненную силу в вашу повседневную жизнь.';

  @override
  String get tarotLoveMeaning8_Senior =>
      'Необходим справедливый и сбалансированный взгляд.';

  @override
  String get tarotLoveDetail8_Senior =>
      'Решайте дела спокойно и логично. Когда возникает конфликт или выбор, следование своей совести принесет наилучшие результаты. Ваша честность заслужит уважение окружающих.';

  @override
  String get tarotLoveMeaning9_Senior =>
      'Это время спокойно оглянуться на свою жизнь и найти внутреннюю истину.';

  @override
  String get tarotLoveDetail9_Senior =>
      'Держитесь подальше от суеты и найдите время для себя. В тишине вы найдете новый смысл жизни и обретете духовный рост. Это драгоценное время для самопознания.';

  @override
  String get tarotLoveMeaning10_Senior =>
      'Принимайте течение жизни естественно и ждите новой возможности.';

  @override
  String get tarotLoveDetail10_Senior =>
      'В жизни бывают взлеты и падения. Даже если все идет не по плану, не расстраивайтесь и ждите подходящего момента. Скоро наступят позитивные перемены, так что сохраняйте спокойствие.';

  @override
  String get tarotLoveMeaning11_Senior =>
      'Контролируйте свой разум с помощью внутренней силы и терпения.';

  @override
  String get tarotLoveDetail11_Senior =>
      'Необходима сила, чтобы справляться с трудными ситуациями с теплым сердцем, а не силой. Ваша мягкость и терпимость будут иметь силу трогать сердца других. Доверяйте своей внутренней силе.';

  @override
  String get tarotLoveMeaning12_Senior =>
      'Это время, когда необходимы новая перспектива и жертва.';

  @override
  String get tarotLoveDetail12_Senior =>
      'Постарайтесь взглянуть на мир под другим углом. Даже если дела кажутся остановленными на время, это процесс подготовки к большему скачку. Терпение и преданное сердце принесут ценные плоды.';

  @override
  String get tarotLoveMeaning13_Senior =>
      'Старое заканчивается, и приближается новое начало.';

  @override
  String get tarotLoveDetail13_Senior =>
      'Отпустите прошлое и приготовьтесь к новой главе в вашей жизни. Перемены могут быть непривычными, но это важный процесс для роста. Если вы примете поток перемен с легким сердцем, придет новая удача.';

  @override
  String get tarotLoveMeaning14_Senior =>
      'Баланс и умеренность — самые важные ценности.';

  @override
  String get tarotLoveDetail14_Senior =>
      'Избегайте крайностей во всем и придерживайтесь золотой середины. Душевный покой и здоровый образ жизни принесут вам стабильность. Поддерживайте гармоничную повседневную жизнь, хорошо сочетая различные элементы.';

  @override
  String get tarotLoveMeaning15_Senior =>
      'Будьте осторожны с чрезмерной жадностью или одержимостью.';

  @override
  String get tarotLoveDetail15_Senior =>
      'Оглянитесь назад, чтобы увидеть, не связаны ли вы материальными вещами или старыми привычками. Если вы отпустите свой разум, вы почувствуете себя свободным. Если вы найдете свое истинное «я» вдали от искушения, ваша удача улучшится.';

  @override
  String get tarotLoveMeaning16_Senior =>
      'Внезапное изменение может стать возможностью для нового скачка.';

  @override
  String get tarotLoveDetail16_Senior =>
      'Даже если произойдет неожиданное событие, не пугайтесь и примите его как процесс разрушения старых рамок. После кризиса будет подготовлена более прочная и надежная основа. Обладайте мудростью, чтобы преодолевать трудности.';

  @override
  String get tarotLoveMeaning17_Senior =>
      'Время, когда надежда и свет наполняют вашу жизнь.';

  @override
  String get tarotLoveDetail17_Senior =>
      'Смотрите в будущее с позитивным настроем. Ваши мечты и желания постепенно сбываются. Делясь своей яркой энергией с окружающими, вы обретете еще большее счастье.';

  @override
  String get tarotLoveMeaning18_Senior =>
      'Не беспокойтесь о неопределенности и доверяйте своей интуиции.';

  @override
  String get tarotLoveDetail18_Senior =>
      'Даже если будущее кажется неясным, нет необходимости беспокоиться заранее. Слушайте свой внутренний голос и двигайтесь медленно. С течением времени туман рассеется и появится ясный путь.';

  @override
  String get tarotLoveMeaning19_Senior =>
      'Это время в полной мере насладиться радостью и жизненной силой.';

  @override
  String get tarotLoveDetail19_Senior =>
      'Наслаждайтесь каждым днем с ярким и позитивным сердцем, подобно солнцу. Ваше присутствие само по себе станет большой силой для вашей семьи и соседей. Будьте благодарны за маленькое счастье в повседневной жизни и живите яркой жизнью.';

  @override
  String get tarotLoveMeaning20_Senior =>
      'Время, когда результаты ваших прошлых усилий вознаграждаются.';

  @override
  String get tarotLoveDetail20_Senior =>
      'Пришло время сбора урожая. Ваша искренняя жизнь принесла плоды, и вы получите признание и похвалу от окружающих. Примите этот результат с благодарным сердцем и приготовьтесь к новому путешествию.';

  @override
  String get tarotLoveMeaning21_Senior =>
      'Наслаждайтесь удовольствием повседневной жизни со свободным и чистым сердцем.';

  @override
  String get tarotLoveDetail21_Senior =>
      'Старайтесь ладить с окружающими со свободным духом, который не связан обязательствами. Новые встречи или впечатления вдохнут жизненную силу в вашу жизнь. Имейте досуг, чтобы смотреть на мир с легким сердцем.';

  @override
  String get tarotWealthMeaning0_Senior =>
      'Это время для стабильного управления активами и мудрости делиться.';

  @override
  String get tarotWealthDetail0_Senior =>
      'Сосредоточьтесь на защите и управлении текущими активами, а не на новых инвестициях. Передача вашей экономической мудрости или советы семье и окружающим будут очень полезны.';

  @override
  String get tarotWealthMeaning1_Senior =>
      'Прислушайтесь к своей интуиции и действуйте осторожно.';

  @override
  String get tarotWealthDetail1_Senior =>
      'Ваши специализированные знания или навыки, накопленные за долгое время, могут вернуться в виде экономической ценности. Спокойно ждите возможностей, не торопясь, и вы принесете хорошие плоды.';

  @override
  String get tarotWealthMeaning2_Senior =>
      'Прочный финансовый фундамент создается благодаря мудрости и опыту.';

  @override
  String get tarotWealthDetail2_Senior =>
      'Богатство накапливается в доме, и пришло время обрести стабильность. Ваше щедрое сердце согреет окружающих, и это благословение вернется к вам. Наслаждайтесь повседневной жизнью с расслабленным умом.';

  @override
  String get tarotSuccessMeaning0_Senior =>
      'Это время, когда изящное завершение важнее нового вызова.';

  @override
  String get tarotSuccessDetail0_Senior =>
      'Сосредоточьтесь на организации и завершении достижений, которые вы создали. Ваш успех заключается в искренности и мудрости, проявленных в процессе, а не в результате. Распространяйте позитивное влияние вокруг себя.';

  @override
  String get tarotSuccessMeaning1_Senior =>
      'Готовьтесь к будущему с новыми творческими целями.';

  @override
  String get tarotSuccessDetail1_Senior =>
      'Ваш внутренний покой важнее социального статуса или чести. Найдите время, чтобы развивать свое внутреннее «я» через медитацию или чтение. Глубокое понимание заставит вас сиять еще больше.';

  @override
  String get tarotSuccessMeaning2_Senior => 'Ведите других мудростью и опытом.';

  @override
  String get tarotSuccessDetail2_Senior =>
      'Гармоничная жизнь с семьей и сохранение здоровья — это достаточно успешная жизнь. Находите счастье в мелочах повседневной жизни и имейте благодарное сердце. Ваше само существование — огромная сила для вашей семьи.';

  @override
  String get tarotWealthMeaning3_Senior =>
      'Это время материального изобилия и стабильности.';

  @override
  String get tarotWealthDetail3_Senior =>
      'Поддерживайте стабильность в доме за счет стабильных источников дохода и планируемого потребления. Ваша экономическая мудрость станет отличным уроком для ваших детей.';

  @override
  String get tarotWealthMeaning4_Senior =>
      'Ответственное лидерство приносит финансовый успех.';

  @override
  String get tarotWealthDetail4_Senior =>
      'Мы рекомендуем проверенные методы управления активами, а не сложные финансовые продукты. Осторожное и консервативное отношение — ключ к защите ваших активов.';

  @override
  String get tarotWealthMeaning5_Senior =>
      'Соблюдение принципов приносит долгосрочную финансовую стабильность.';

  @override
  String get tarotWealthDetail5_Senior =>
      'Лучше быть удовлетворенным своей текущей жизнью и быть основательным, чем быть жадным. Правильный выбор гарантирует мир в старости.';

  @override
  String get tarotWealthMeaning6_Senior =>
      'Неожиданная финансовая возможность может появиться через знакомого.';

  @override
  String get tarotWealthDetail6_Senior =>
      'Возможно временное давление на денежные потоки, но если вы мудро с этим справитесь, вы сможете превратить кризис в возможность. Сократите ненужные расходы.';

  @override
  String get tarotWealthMeaning7_Senior =>
      'Успех может быть достигнут благодаря быстрым и решительным действиям.';

  @override
  String get tarotWealthDetail7_Senior =>
      'Если вы будете накапливать добродетель вокруг себя, удача в богатстве придет из неожиданных мест. Радость от того, что вы делитесь, сделает вашу жизнь еще богаче.';

  @override
  String get tarotWealthMeaning8_Senior =>
      'Необходимо справедливое и сбалансированное управление финансами.';

  @override
  String get tarotWealthDetail8_Senior =>
      'Важно найти покой в душе, а не материальное изобилие. Дисциплинированная жизнь, скорее, принесет экономическую стабильность.';

  @override
  String get tarotWealthMeaning9_Senior =>
      'Найдите время, чтобы пересмотреть свои финансовые планы.';

  @override
  String get tarotWealthDetail9_Senior =>
      'Могут возникнуть неожиданные доходы или расходы. Если вы адаптируетесь к изменениям и будете мудро управлять своими активами, серьезных проблем не возникнет.';

  @override
  String get tarotWealthMeaning10_Senior =>
      'Удача переменчива, так что готовьтесь к будущему.';

  @override
  String get tarotWealthDetail10_Senior =>
      'Важно следовать принципам в вопросах собственности, таких как наследство или дарение. Честное отношение предотвращает споры и приносит мир.';

  @override
  String get tarotWealthMeaning11_Senior =>
      'Преодолевайте финансовые трудности с терпением и внутренней силой.';

  @override
  String get tarotWealthDetail11_Senior =>
      'Экономическая поддержка детей или потомков вернется в качестве большой награды позже. Будьте терпеливы и сохраняйте долгосрочную перспективу.';

  @override
  String get tarotWealthMeaning12_Senior => 'Необходим новый взгляд на деньги.';

  @override
  String get tarotWealthDetail12_Senior =>
      'У вас будет таинственный опыт, когда вы наполняетесь через опустошение. Отпустите ненужное чувство собственности и встречайте повседневную жизнь с легким сердцем.';

  @override
  String get tarotWealthMeaning13_Senior =>
      'Грядут серьезные финансовые перемены, так что будьте готовы.';

  @override
  String get tarotWealthDetail13_Senior =>
      'Ищите гармонию между доходами и расходами и остерегайтесь чрезмерной жадности. Дисциплинированная жизнь принесет вам постоянную стабильность.';

  @override
  String get tarotWealthMeaning14_Senior =>
      'Избегайте чрезмерных трат и соблюдайте умеренность.';

  @override
  String get tarotWealthDetail14_Senior =>
      'Вы должны быть осторожны со сладкими инвестиционными предложениями или чрезмерным расширением. Доверять своему богатому опыту и принимать взвешенные решения — это способ защитить свои активы.';

  @override
  String get tarotWealthMeaning15_Senior =>
      'Остерегайтесь чрезмерных финансовых соблазнов.';

  @override
  String get tarotWealthDetail15_Senior =>
      'В кризисной ситуации необходима мудрость возвращения к основам. Не волнуйтесь и тщательно проверяйте состояние своих активов, чтобы минимизировать ущерб.';

  @override
  String get tarotWealthMeaning16_Senior =>
      'Внезапное изменение может стать возможностью для нового финансового скачка.';

  @override
  String get tarotWealthDetail16_Senior =>
      'Это время, когда экономические трудности разрешаются и начинается стабильный поток. Проектируйте свое будущее с позитивным настроем и наслаждайтесь миром.';

  @override
  String get tarotWealthMeaning17_Senior =>
      'Надежда и финансовая удача начинают сиять.';

  @override
  String get tarotWealthDetail17_Senior =>
      'Нужно терпение, чтобы дождаться, пока туман, связанный с богатством, рассеется и откроется правда. Не торопитесь и наблюдайте, а не принимайте поспешное решение.';

  @override
  String get tarotWealthMeaning18_Senior =>
      'Остерегайтесь невидимых финансовых рисков.';

  @override
  String get tarotWealthDetail18_Senior =>
      'За вашими усилиями следуют достаточные награды, и возникает экономический досуг. Делитесь счастьем с окружающими и проводите благословенное время.';

  @override
  String get tarotWealthMeaning19_Senior =>
      'Это время наслаждаться материальным изобилием и жизненной силой.';

  @override
  String get tarotWealthDetail19_Senior =>
      'Это время, когда ваша искренность признается как экономическое достижение. Организуйте прошлое и сделайте новый шаг к стабильному будущему.';

  @override
  String get tarotWealthMeaning20_Senior =>
      'Прошлые усилия приносят плоды в виде финансовых вознаграждений.';

  @override
  String get tarotWealthDetail20_Senior =>
      'Экономическая стабильность достигает своего пика, и гарантирован мирный уход на покой. Это момент, когда сияет ваше мудрое управление активами.';

  @override
  String get tarotWealthMeaning21_Senior =>
      'Сохраняйте финансовую свободу с чистым сердцем.';

  @override
  String get tarotWealthDetail21_Senior =>
      'Пришло время ценить радость жизни, а не материальное обладание. Если вы будете наслаждаться миром с расслабленным умом, богатство придет само собой.';

  @override
  String get tarotSuccessMeaning3_Senior =>
      'Ваши усилия приносят плоды, и вы достигаете стабильности.';

  @override
  String get tarotSuccessDetail3_Senior =>
      'Ваше лидерство и мудрость служат отличным примером для окружающих. Вы вкусите истинный успех, когда будете руководить с терпимостью, а не с авторитетом.';

  @override
  String get tarotSuccessMeaning4_Senior =>
      'Сильное лидерство приносит успех в вашей сфере.';

  @override
  String get tarotSuccessDetail4_Senior =>
      'Это время, когда непоколебимые ценности приносят плоды. Ваша принципиальная жизнь послужит вехой, указывающей правильный путь младшим.';

  @override
  String get tarotSuccessMeaning5_Senior =>
      'Сохраняйте честь и следуйте традиционным ценностям.';

  @override
  String get tarotSuccessDetail5_Senior =>
      'Пришло время сделать мудрый выбор между честью и прибылью. Решения, принятые на основе вашего богатого опыта, гарантируют мирное будущее.';

  @override
  String get tarotSuccessMeaning6_Senior =>
      'Новое партнерство или сотрудничество приносит хорошие результаты.';

  @override
  String get tarotSuccessDetail6_Senior =>
      'Никакое препятствие не может сломить вашу волю. Ваше стремление двигаться вперед, не сдаваясь, — это уже огромный успех.';

  @override
  String get tarotSuccessMeaning7_Senior => 'Смело идите к своей цели.';

  @override
  String get tarotSuccessDetail7_Senior =>
      'Это время, когда мягкость побеждает силу. Когда вы принимаете окружающих с терпением и доброжелательностью, ваша честь будет еще выше.';

  @override
  String get tarotSuccessMeaning8_Senior =>
      'Справедливое суждение и баланс — ключи к успеху.';

  @override
  String get tarotSuccessDetail8_Senior =>
      'Это время, когда вы осознаете глубокие истины, которые другие не могут видеть. Время тихого размышления сделает вас более зрелым и глубоким человеком.';

  @override
  String get tarotSuccessMeaning9_Senior =>
      'Найдите время, чтобы пересмотреть свои достижения.';

  @override
  String get tarotSuccessDetail9_Senior =>
      'Открывается новая глава жизни. Если вы примете изменения позитивно, не боясь их, вы добьетесь неожиданно больших результатов.';

  @override
  String get tarotSuccessMeaning10_Senior =>
      'Примите перемену судьбы и ищите новый путь.';

  @override
  String get tarotSuccessDetail10_Senior =>
      'Следование справедливости, а не частным интересам, вызывает уважение окружающих. Ваша честность в конечном итоге станет ключом к величайшему успеху.';

  @override
  String get tarotSuccessMeaning11_Senior =>
      'Преодолевайте трудности с упорством и терпением.';

  @override
  String get tarotSuccessDetail11_Senior =>
      'Даже если сейчас трудно, пришло время выстоять ради благородной цели. Ваша преданность останется прекрасным успехом в памяти истории и людей в будущем.';

  @override
  String get tarotSuccessMeaning12_Senior =>
      'Посмотрите на успех с другой точки зрения.';

  @override
  String get tarotSuccessDetail12_Senior =>
      'Важно осознать ценность настоящего, а не зацикливаться на прошлой славе. Покой, обретенный через опустошение, — это истинный успех в жизни.';

  @override
  String get tarotSuccessMeaning13_Senior =>
      'Один этап заканчивается, и начинается новая глава.';

  @override
  String get tarotSuccessDetail13_Senior =>
      'Сбалансированная жизнь, не склоняющаяся ни в одну из сторон, — высшая добродетель. Ваша дисциплинированность принесет мир и стабильность окружающим.';

  @override
  String get tarotSuccessMeaning14_Senior =>
      'Сохраняйте баланс и управляйте своим успехом умеренно.';

  @override
  String get tarotSuccessDetail14_Senior =>
      'Найдите свое истинное «я», вырвавшись из ограничений, которые вас связывали. В тот момент, когда вы обретете свободу ума, вы станете самым успешным человеком в мире.';

  @override
  String get tarotSuccessMeaning15_Senior =>
      'Остерегайтесь одержимости успехом или властью.';

  @override
  String get tarotSuccessDetail15_Senior =>
      'Внезапные перемены — это процесс, делающий вас сильнее. Когда вы установите новый порядок, спокойно реагируя, последуют еще большие достижения.';

  @override
  String get tarotSuccessMeaning16_Senior =>
      'Неожиданное изменение может стать поворотным моментом к еще большему успеху.';

  @override
  String get tarotSuccessDetail16_Senior =>
      'Отдых приходит к усталой душе, и рождаются новые мечты. Ваша творческая энергия осветит окружающих и принесет счастливые плоды.';

  @override
  String get tarotSuccessMeaning17_Senior =>
      'Ясное видение и надежда ведут к успеху.';

  @override
  String get tarotSuccessDetail17_Senior =>
      'Слушайте свой внутренний голос даже в запутанных ситуациях. Со временем ваш выбор окажется верным.';

  @override
  String get tarotSuccessMeaning18_Senior =>
      'Не беспокойтесь о неопределенности и доверяйте своей интуиции.';

  @override
  String get tarotSuccessDetail18_Senior =>
      'Время, когда тело и разум здоровы и полны сил. Делиться позитивной энергией с окружающими и наслаждаться радостью жизни — это истинный успех.';

  @override
  String get tarotSuccessMeaning19_Senior =>
      'Празднуйте свои достижения и наслаждайтесь радостью успеха.';

  @override
  String get tarotSuccessDetail19_Senior =>
      'Появляются места, где нужны ваши опыт и мудрость. Вы почувствуете большую награду и успех, когда внесете вклад в жизнь общества с новым чувством миссии.';

  @override
  String get tarotSuccessMeaning20_Senior =>
      'Ваши многолетние усилия получили официальное признание.';

  @override
  String get tarotSuccessDetail20_Senior =>
      'Состояние совершенного удовлетворения и покоя, когда больше нечего достигать. Ваша жизнь сама по себе станет произведением искусства и произведет глубокое впечатление на окружающих.';

  @override
  String get tarotSuccessMeaning21_Senior =>
      'Добейтесь окончательного успеха со свободным разумом.';

  @override
  String get tarotSuccessDetail21_Senior =>
      'Наслаждайтесь собственным счастьем вдали от мировых стандартов. Вы, живущий так, словно путешествуете по миру с легким сердцем, — истинный победитель.';

  @override
  String get compatibilityResultButton => 'Посмотреть результат совместимости';

  @override
  String get compatibilityDeleteTooltip => 'Удалить';

  @override
  String get compatibilityGenderMale => 'Мужчина';

  @override
  String get compatibilityGenderFemale => 'Женщина';

  @override
  String get compatibilityInputTitle => 'Ввод данных для совместимости';

  @override
  String get tojeongInputTitle => 'Данные для Тоджон Бигёль';

  @override
  String tojeongCheckFortune(int year) {
    return 'Проверьте ваш Тоджон Бигёль\\nна $year год';
  }

  @override
  String get tojeongInputGuide =>
      'Введите дату и время рождения\\nдля точного анализа.';

  @override
  String tojeongViewResult(int year) {
    return 'Посмотреть Тоджон Бигёль на $year';
  }

  @override
  String get tojeongCheckButton => 'Проверить Тоджон Бигёль';

  @override
  String get tojeongSaveAndCheck => 'Сохранить и посмотреть Тоджон Бигёль';

  @override
  String get tojeongYearSelect => 'Выбрать год';

  @override
  String tojeongResultTitle(int year) {
    return 'Тоджон Бигёль на $year год';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return 'Прогноз $name на $year год';
  }

  @override
  String tojeongGua(String gua) {
    return 'Гексаграмма: $gua';
  }

  @override
  String get tojeongTotalLuck => 'Общая удача';

  @override
  String get tojeongProcess => 'Процесс';

  @override
  String get tojeongResult => 'Результат';

  @override
  String get tojeongMonthlyLuck => 'Прогноз по месяцам';

  @override
  String get tojeongShareResult => 'Поделиться результатом';

  @override
  String tojeongShareTitle(int year) {
    return 'Результаты Тоджон Бигёль на $year год';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return 'Общий обзор Тоджон Бигёль для $name.\\n\\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => 'Целевой год';

  @override
  String get sajuDeleteTitle => 'Удалить данные Саджу';

  @override
  String sajuDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить данные $name?';
  }

  @override
  String get sajuProfileSelect => 'Выбрать профиль Саджу';

  @override
  String get add => 'Добавить';

  @override
  String get modify => 'Изменить';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\\nСервис в разработке.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'Мы усердно работаем над тем, чтобы предоставить\\nвам более точную информацию о вашей удаче!';

  @override
  String get goBack => 'Назад';

  @override
  String get name => 'Имя';

  @override
  String get nameInputGuide => 'Пожалуйста, введите ваше имя';

  @override
  String get sajuLunarSolar => 'Солнечный/Лунный';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => 'Выбрать год';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'Выбрать профиль';

  @override
  String get male => 'Мужчина';

  @override
  String get female => 'Женщина';

  @override
  String get newYearFortuneInputTitle => 'Данные для новогоднего прогноза';

  @override
  String newYearFortuneHeader(int year) {
    return 'Каким будет ваш прогноз\\nна $year год?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'Введите дату и время рождения\\nдля точного анализа Саджу.';

  @override
  String newYearFortuneViewButton(int year) {
    return 'Посмотреть прогноз на $year';
  }

  @override
  String get newYearFortuneCheckButton => 'Проверить прогноз';

  @override
  String get newYearFortuneSaveAndCheckButton =>
      'Сохранить и посмотреть прогноз';

  @override
  String newYearFortuneResultTitle(int year) {
    return 'Мой новогодний прогноз на $year';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return 'Результат моего новогоднего прогноза на $year';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return 'Новогодний прогноз для $name.\\n\\n$desc...';
  }

  @override
  String get sajuChartTitle => 'Карта Саджу';

  @override
  String get sajuHour => 'Час';

  @override
  String get sajuDay => 'День';

  @override
  String get sajuMonth => 'Месяц';

  @override
  String get sajuYear => 'Год';

  @override
  String get ohaengAnalysisTitle => 'Анализ Пяти Элементов';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'Ваш доминирующий элемент: $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ Пять элементов (Дерево, Огонь, Земля, Металл, Вода) — это базовые энергии Саджу. Хотя баланс идеален, вы можете понять свои склонности через эти элементы.';

  @override
  String yearlyTotalLuck(int year) {
    return 'Общая удача на $year год';
  }

  @override
  String get fortuneDisclaimer =>
      'Этот прогноз носит развлекательный характер. Ваша жизнь зависит от вашей воли.';

  @override
  String get compatibilityResultTitle => 'Результат совместимости';

  @override
  String get compatibilityScore => 'Балл совместимости';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => 'Наша совместимость';

  @override
  String get compatibilityShareResult => 'Поделиться результатом';

  @override
  String get compatibilityRetryButton => 'Проверить с кем-то еще';

  @override
  String get compatibilitySummary => 'Кратко';

  @override
  String get compatibilitySectionLuck => 'Синергия Удачи';

  @override
  String get compatibilitySectionAdvice => 'Советы по Отношениям';

  @override
  String get compatibilitySectionPositive => 'Положительные Аспекты';

  @override
  String get compatibilitySectionCaution => 'На что обратить внимание';

  @override
  String get compatibilityLunarDisclaimer =>
      '* Примечание: Лунные даты рождения в настоящее время анализируются на основе солнечных дат. Лунная конверсия будет обновлена в ближайшее время.';

  @override
  String get tojeongSaveAndCheckButton =>
      'Сохранить и посмотреть Тоджон Бигёль';

  @override
  String get tojeongSangsuKeyword1 =>
      'период, требующий сильного драйва и лидерства';

  @override
  String get tojeongSangsuKeyword2 =>
      'период, полный активных отношений и радости';

  @override
  String get tojeongSangsuKeyword3 => 'период, когда сияют интеллект и страсть';

  @override
  String get tojeongSangsuKeyword4 =>
      'период быстрых перемен и новых начинаний';

  @override
  String get tojeongSangsuKeyword5 =>
      'период, требующий гибкости и мягкого общения';

  @override
  String get tojeongSangsuKeyword6 =>
      'период преодоления трудностей мудростью и терпением';

  @override
  String get tojeongSangsuKeyword7 =>
      'период стремления к стабильности и накопления сил';

  @override
  String get tojeongSangsuKeyword8 =>
      'период созидания добродетели с открытым сердцем';

  @override
  String get tojeongJungsuKeyword1 => 'вы встретите мудрого наставника';

  @override
  String get tojeongJungsuKeyword2 =>
      'вас ждет успех в договорах и соглашениях';

  @override
  String get tojeongJungsuKeyword3 => 'вас ждут новые и интересные вызовы';

  @override
  String get tojeongJungsuKeyword4 => 'вас ждут профессиональный успех и почет';

  @override
  String get tojeongJungsuKeyword5 =>
      'вам следует проявить осторожность в финансах';

  @override
  String get tojeongJungsuKeyword6 => 'вам следует уделить внимание здоровью';

  @override
  String get tojeongHasuKeyword1 => 'вы достигнете значительного успеха.';

  @override
  String get tojeongHasuKeyword2 => 'вы пожнете плоды своих упорных усилий.';

  @override
  String get tojeongHasuKeyword3 =>
      'вы превратите трудности в возможности через терпение.';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return 'Путь этого года: $sangsu, затем $jungsu, и в итоге $hasu.';
  }

  @override
  String get tojeongSangsuDetail1 =>
      'Вас поддерживают и небо, и земля. Это год, когда ваша решимость приведет к великим достижениям. Словно дракон, взмывающий в небо, ваша энергия ярка и мощна. У вас будет много шансов проявить лидерство и получить признание. Просто помните о скромности, чтобы избежать лишних трений.';

  @override
  String get tojeongSangsuDetail2 =>
      'Подобно камню, создающему круги на воде, этот год будет полон общения и радости. Ваша популярность вырастет, но следите за словами, чтобы избежать сплетен. Вы можете встретить важного партнера на общественном мероприятии.';

  @override
  String get tojeongSangsuDetail3 =>
      'Как солнце, сияющее над миром, ваш интеллект и страсть будут на пике. Вы преуспеете в учебе или творчестве, заработав отличную репутацию. Сохраняйте спокойствие и фокус, чтобы эффективно управлять энергией и избежать выгорания.';

  @override
  String get tojeongSangsuDetail4 =>
      'Ожидайте быстрых и захватывающих перемен в этом году. Ваша предприимчивость делает это время идеальным для новых начинаний. Хотя вы будете заняты переходами, настойчивость станет ключом к завершению начатого и достижению стабильных результатов.';

  @override
  String get tojeongSangsuDetail5 =>
      'Подобно весеннему ветерку, оживляющему землю, ваша гибкость поможет преодолеть любые препятствия. Это отличный год для бизнеса и новых связей. Будьте решительны, чтобы не упустить лучшие возможности.';

  @override
  String get tojeongSangsuDetail6 =>
      'Этот год требует мудрости и терпения, словно плавание в глубоких водах. Пока все кажется спокойным, используйте это время для накопления внутренних сил. Избегайте рискованных инвестиций и ждите подходящего момента; ваше терпение будет вознаграждено.';

  @override
  String get tojeongSangsuDetail7 =>
      'Вы можете столкнуться с трудностями, похожими на восхождение на высокую гору, но за ней вас ждет равнина возможностей. Сосредоточьтесь на стабильности и сохранении достигнутого. Доверие и последовательность принесут плоды в долгосрочной перспективе.';

  @override
  String get tojeongSangsuDetail8 =>
      'Это время для посева семян будущего успеха. Проявляя теплоту и терпение к окружающим, вы создадите прочный фундамент доверия и уважения. Ваши долгосрочные вложения и внимание к семье принесут мир и процветание.';

  @override
  String get tojeongJungsuDetail1 =>
      'Появится мудрый наставник, который принесет добрые вести и возможности. Предыдущие препятствия исчезнут, а финансовые перспективы улучшатся. Сотрудничество станет вашим ключом к успеху в этом году.';

  @override
  String get tojeongJungsuDetail2 =>
      'В вашей семье или доме могут произойти радостные события. Это благоприятное время для документов, контрактов или сделок. Поддерживайте ясное и доброе общение, чтобы все взаимодействия оставались позитивными.';

  @override
  String get tojeongJungsuDetail3 =>
      'Перед вами откроются новые горизонты, возможно, через путешествия или работу в новых местах. Принимайте эти перемены с уверенностью; ваша готовность исследовать новое приведет к достойным результатам.';

  @override
  String get tojeongJungsuDetail4 =>
      'Ваш упорный труд будет отмечен почетом или повышением. Это отличное время для экзаменов или сертификации. Уверенно демонстрируйте свои способности, и вы добьетесь большого успеха.';

  @override
  String get tojeongJungsuDetail5 =>
      'Ваш финансовый потенциал высок, но велико и искушение тратить. Практикуйте тщательное управление деньгами и избегайте импульсивных покупок. Мудро вести дела профессионально и прозрачно.';

  @override
  String get tojeongJungsuDetail6 =>
      'В этом году уделите приоритетное внимание своему физическому и ментальному благополучию. Избегайте переутомления и обеспечьте себе полноценный отдых. Забота о здоровье сейчас предотвратит проблемы в будущем и сохранит вашу энергию.';

  @override
  String get tojeongHasuDetail1 =>
      'В конечном счете, ваши усилия приведут к успеху, и цели будут достигнуты. Вы будете вознаграждены за свой труд и получите признание окружающих. Оставайтесь верны своему видению, чтобы успех был долгим.';

  @override
  String get tojeongHasuDetail2 =>
      'На пути могут возникнуть трудности, но ваше упорство приведет вас к цели. Награда за труд будет тем слаще, чем больше усилий вы приложите. Успех расцветет в свое время.';

  @override
  String get tojeongHasuDetail3 =>
      'Могут возникнуть неожиданные препятствия, но ваша стойкость превратит эти вызовы в возможности. Сохраняя спокойствие, вы обнаружите, что неудача может обернуться благословением. Мудрость — ваш лучший союзник в этом году.';

  @override
  String get tojeongGeneralWealthGood =>
      'Удача в деньгах хорошая. Возможен доход из неожиданных источников или хорошие результаты от инвестиций. Однако деньги могут как приходить, так и уходить, поэтому сосредоточьтесь на сбережениях.';

  @override
  String get tojeongGeneralWealthBad =>
      'Денежный поток может быть нестабильным. Вам следует сократить ненужные расходы и начать копить. Будьте осторожны с финансовыми операциями и консультируйтесь с экспертами.';

  @override
  String get tojeongGeneralCareerGood =>
      'Появятся возможности получить признание в карьере или бизнесе. Это хорошее время для повышения, смены работы или открытия дела. Лучших результатов можно достичь через хорошие отношения.';

  @override
  String get tojeongGeneralCareerBad =>
      'Лучше всего сохранять текущее положение. Сосредоточьтесь на текущих задачах и развивайте навыки, а не начинайте новые проекты. Возможен стресс в отношениях с коллегами, сохраняйте спокойствие.';

  @override
  String get tojeongGeneralLoveGood =>
      'Удача в любви растет: одинокие могут встретить партнера, а чувства в парах станут глубже. В доме будет царить гармония. Хорошее время для разговоров о браке.';

  @override
  String get tojeongGeneralLoveBad =>
      'Могут возникнуть споры из-за пустяков. Нужно понимание и внимание к позиции друг друга. Старайтесь решать проблемы через диалог, а не эмоции.';

  @override
  String get optional => 'Необязательно';

  @override
  String get sajuSolarHint =>
      'Тоджон Бигёль наиболее точен при анализе на основе лунного дня рождения.';

  @override
  String get yourFortune => 'Ваша удача';

  @override
  String get guaUpper => 'Верхняя';

  @override
  String get guaMiddle => 'Средняя';

  @override
  String get guaLower => 'Нижняя';

  @override
  String get guaCode => 'Код Гексаграммы';

  @override
  String get viewAgain => 'Проверить снова';

  @override
  String get zodiacAries => 'Овен';

  @override
  String get zodiacTaurus => 'Телец';

  @override
  String get zodiacGemini => 'Близнецы';

  @override
  String get zodiacCancer => 'Рак';

  @override
  String get zodiacLeo => 'Лев';

  @override
  String get zodiacVirgo => 'Дева';

  @override
  String get zodiacLibra => 'Весы';

  @override
  String get zodiacScorpio => 'Скорпион';

  @override
  String get zodiacSagittarius => 'Стрелец';

  @override
  String get zodiacCapricorn => 'Козерог';

  @override
  String get zodiacAquarius => 'Водолей';

  @override
  String get zodiacPisces => 'Рыбы';

  @override
  String get elementFire => 'Огонь';

  @override
  String get elementEarth => 'Земля';

  @override
  String get elementAir => 'Воздух';

  @override
  String get elementWater => 'Вода';

  @override
  String get compatibilityCategoryZodiac => 'Совместимость по знакам зодиака';

  @override
  String get compatibilityCategoryInner => 'Внутренняя совместимость';

  @override
  String get compatibilityCategoryConstellation =>
      'Совместимость по созвездиям';

  @override
  String get compatibilitySummarySamhap => 'Лучшая пара по знаку (Самхап)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return '$animal1 и $animal2 идеально подходят друг другу, дополняя слабые стороны. Эти отношения создают отличную синергию.';
  }

  @override
  String get compatibilitySummaryYukhap => 'Отличная пара по знаку (Юкхап)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return '$animal1 и $animal2 имеют сильное взаимное притяжение. Легко почувствовать связь с самого начала.';
  }

  @override
  String get compatibilitySummaryChung => 'Отношения, требующие усилий (Чунг)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return '$animal1 и $animal2 имеют разные темпераменты и могут сталкиваться. Необходимо уважать различия и проявлять внимание.';
  }

  @override
  String get compatibilitySummaryWonjin =>
      'Отношения, требующие понимания (Вонджин)';

  @override
  String get compatibilityDescWonjin =>
      'Это отношения, где вы можете иногда чувствовать обиду или грусть без ясной причины. Рекомендуется частое общение.';

  @override
  String get compatibilitySummaryDefaultZodiac =>
      'Обычная совместимость по знакам';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return '$animal1 и $animal2 имеют ровные отношения без серьезных конфликтов.';
  }

  @override
  String get compatibilitySummaryCheonganHap => 'Родственные души';

  @override
  String get compatibilityDescCheonganHap =>
      'Ваши характеры и ценности идеально совпадают. Вы — родственные души, понимающие друг друга без слов.';

  @override
  String get compatibilitySummarySangsaeng => 'Поддерживающее партнерство';

  @override
  String get compatibilityDescSangsaeng =>
      'Позитивные отношения, в которых вы естественно поддерживаете друг друга и помогаете расти.';

  @override
  String get compatibilitySummarySanggeuk => 'Нужен динамический баланс';

  @override
  String get compatibilityDescSanggeuk =>
      'Хотя характеры разные, у вас есть уникальный потенциал дополнять сильные и слабые стороны друг друга.';

  @override
  String get compatibilitySummaryDefaultInner => 'Естественные друзья';

  @override
  String get compatibilityDescDefaultInner =>
      'Отношения, построенные на схожих склонностях и общих интересах, делающие время вместе легким.';

  @override
  String get compatibilitySummarySameElement => 'Встреча единомышленников';

  @override
  String compatibilityDescSameElement(String element) {
    return 'Общая стихия «$element» означает, что ваши ценности и поступки очень похожи.';
  }

  @override
  String get compatibilitySummaryCompatibleElement => 'Гармоничный баланс';

  @override
  String get compatibilityDescCompatibleElement =>
      'Прекрасные отношения, в которых ваши разные черты идеально дополняют друг друга.';

  @override
  String get compatibilitySummaryIncompatibleElement =>
      'Увлекательные различия';

  @override
  String get compatibilityDescIncompatibleElement =>
      'Ваши разные темпераменты могут сначала казаться непривычными, но они дают бесконечные возможности для роста.';

  @override
  String get compatibilitySummaryDefaultConstellation => 'Средняя гармония';

  @override
  String get compatibilityDescDefaultConstellation =>
      'Отношения, которые достаточно хорошо сочетаются по знакам зодиака.';

  @override
  String get routineMorningTitle => 'Бодрое утро! ☀️';

  @override
  String get routineMorningBody =>
      'Вы не забыли про свои ежедневные миссии, запланированные на сегодня?';

  @override
  String get routineEveningTitle => 'Хорошая работа сегодня! ✨';

  @override
  String get routineEveningBody =>
      'Вы выполнили все миссии на сегодня? Завершите свою рутину.';

  @override
  String get routineCheckTitle => 'Проверьте свои миссии на сегодня! 🚀';

  @override
  String get routineCheckBody =>
      'Следуйте ежедневным миссиям и сделайте свой день приятным.';

  @override
  String get supplementNotificationTitle => 'Напоминание о добавках';

  @override
  String get waterNotificationTitle => 'Напоминание попить воды';

  @override
  String get routineNotificationTitle => 'Ежедневное уведомление о рутине';

  @override
  String get todaysFortuneNotificationTitle => 'Сегодняшнее предсказание';

  @override
  String get afternoonFortuneNotificationBody =>
      'Как насчет вашего дневного предсказания? Проверьте прямо сейчас!';

  @override
  String get morningFortuneNotificationBody =>
      'Узнайте свое предсказание и начните день бодро!';

  @override
  String get fortunePassExpiryTitle => 'Fortune Pass истекает сегодня';

  @override
  String get fortunePassExpiryBody =>
      'Ваша подписка Fortune Pass истекает сегодня. Продлите ее, чтобы продолжать пользоваться преимуществами!';

  @override
  String get takeNow => 'Принять сейчас';

  @override
  String get later => 'Позже';

  @override
  String get turnOffAlarmAction => 'Выключить будильник';

  @override
  String get todaysFortuneNotification => 'Уведомление о гороскопе на сегодня';

  @override
  String get enableNotification => 'Включить уведомление';

  @override
  String get fortuneNotificationDescription =>
      'Уведомляет вас о вашем гороскопе на сегодня в указанное время.';

  @override
  String get morningNotificationTime => 'Время утреннего уведомления';

  @override
  String get afternoonNotificationTime => 'Время дневного уведомления';

  @override
  String get morningFortuneTitle => 'Сегодняшнее предсказание (Утро)';

  @override
  String get afternoonFortuneTitle => 'Сегодняшнее предсказание (День)';

  @override
  String get type => 'Тип';

  @override
  String get supplementChannelDesc => 'Канал уведомлений о приеме витаминов.';

  @override
  String get waterChannelDesc => 'Канал уведомлений о привычке пить воду.';

  @override
  String get waterSummaryTitle => 'Уведомление о питье воды';

  @override
  String get dailyRoutineChannelDesc =>
      'Канал уведомлений о ежедневных миссиях и формировании привычек.';

  @override
  String get dailyRoutineSummaryTitle => 'Уведомление о распорядке дня';

  @override
  String get missionChannelName => 'Уведомление о миссии';

  @override
  String get missionChannelDesc =>
      'Канал общих уведомлений о выполнении миссий.';

  @override
  String get fortuneChannelName => 'Уведомление об удаче';

  @override
  String get fortuneChannelDesc =>
      'Канал ежедневных уведомлений о проверке удачи.';

  @override
  String get subscriptionChannelName => 'Уведомление о подписке';

  @override
  String get subscriptionChannelDesc =>
      'Канал уведомлений об истечении срока действия Fortune Pass и подписках.';

  @override
  String get alarmChannelName => 'Будильник';

  @override
  String get alarmChannelDesc =>
      'Канал будильников для пробуждения и выполнения миссий.';

  @override
  String get shareViaKakao => 'Поделиться через KakaoTalk';

  @override
  String get shareViaSNS =>
      'Поделиться через другие соцсети (Instagram, Twitter и т. д.)';

  @override
  String get checkDetailResult => 'Проверить подробный результат';

  @override
  String get viewMyFortuneResult => 'Посмотреть мой результат удачи';

  @override
  String get takeSupplementNow => 'Пожалуйста, примите витамины!';

  @override
  String get takeNowQuestion => 'Хотите принять сейчас?';

  @override
  String get eatNow => 'Принять сейчас';

  @override
  String get eatLater => 'Принять позже';

  @override
  String snoozeMessageGeneric(int minutes) {
    return 'Я напомню вам снова через $minutes минут.';
  }

  @override
  String get hours => 'часов';

  @override
  String get cheeringMessage4 => 'Яркое утро, счастливое начало!';

  @override
  String get cheeringMessage5 => 'Пусть ваш день будет полон улыбок.';

  @override
  String get cheeringMessage6 => 'Выше голову сегодня!';

  @override
  String get cheeringMessage7 => 'Сегодня вы будете сиять.';

  @override
  String get cheeringMessage8 =>
      'У меня такое чувство, что произойдет что-то хорошее!';

  @override
  String get cheeringMessage9 => 'Отличная работа сегодня. Бодрое начало!';

  @override
  String get cheeringMessage10 => 'Счастье всегда рядом с вами.';

  @override
  String get cheeringMessage11 => 'Я верю в ваши мечты сегодня.';

  @override
  String get cheeringMessage12 => 'Освежающее утро, приятный день!';

  @override
  String get cheeringMessage13 => 'Будьте победителем сегодня!';

  @override
  String get cheeringMessage14 => 'Вы ценны сами по себе.';

  @override
  String get cheeringMessage15 => 'Пусть день будет полон приятных событий.';

  @override
  String get cheeringMessage16 => 'Пусть ваш день сегодня сияет!';

  @override
  String get cheeringMessage17 => 'Ваша улыбка освещает мир.';

  @override
  String get cheeringMessage18 => 'Будьте собой сегодня!';

  @override
  String get cheeringMessage19 => 'Начните день с трепетом в сердце.';

  @override
  String get cheeringMessage20 => 'Вас ждет чудесный день.';

  @override
  String get cheeringMessage21 => 'С силой позитива сегодня!';

  @override
  String get cheeringMessage22 => 'Я поддерживаю ваш путь.';

  @override
  String get cheeringMessage23 => 'Сделайте сегодня свой лучший день!';

  @override
  String get cheeringMessage24 => 'Пусть удача будет с вами!';

  @override
  String get cheeringMessage25 => 'Теплого вам дня сегодня. ';

  @override
  String get cheeringMessage26 => 'Вы это сможете!';

  @override
  String get cheeringMessage27 => 'Начните день с благодарности.';

  @override
  String get cheeringMessage28 => 'Ваша ценность бесконечна.';

  @override
  String get cheeringMessage29 => 'Пусть ваш день расцветет улыбками.';

  @override
  String get cheeringMessage30 => 'Хорошего времени с хорошими людьми!';

  @override
  String get cheeringMessage31 => 'Сегодня вы на шаг ближе к своей мечте!';

  @override
  String get cheeringMessage32 => 'Сегодня вы самый крутой человек.';

  @override
  String get cheeringMessage33 => 'Наступит чудесный день.';

  @override
  String get cheeringMessage34 => 'Наслаждайтесь своим днем сегодня.';

  @override
  String get cheeringMessage35 => 'Ваши усилия не будут напрасны.';

  @override
  String get cheeringMessage36 => 'Здорового вам дня сегодня. ';

  @override
  String get cheeringMessage37 => 'Вы рождены, чтобы быть любимыми!';

  @override
  String get cheeringMessage38 => 'Будьте смелыми сегодня!';

  @override
  String get cheeringMessage39 => 'Светлое будущее ждет вас. ';

  @override
  String get cheeringMessage40 => 'Пусть день будет полон страсти!';

  @override
  String get cheeringMessage41 => 'Я надеюсь, что в вашей душе покой.';

  @override
  String get cheeringMessage42 => 'Найдите маленькое счастье сегодня.';

  @override
  String get cheeringMessage43 => 'Вы уже справляетесь достаточно хорошо. ';

  @override
  String get cheeringMessage44 => 'Начните день с надеждой.';

  @override
  String get cheeringMessage45 => 'Ваша доброта — большая сила для кого-то. ';

  @override
  String get cheeringMessage46 => 'Продуктивного вам дня сегодня. ';

  @override
  String get cheeringMessage47 => 'У вас есть сила изменить мир.';

  @override
  String get cheeringMessage48 => 'Ясного дня сегодня!';

  @override
  String get cheeringMessage49 => 'Проявите свое обаяние в полной мере.';

  @override
  String get cheeringMessage50 => 'Наполните свой день счастьем сегодня!';

  @override
  String get locationServiceDisabled => 'Службы геолокации отключены.';

  @override
  String get locationPermissionDenied => 'Доступ к геолокации запрещен.';

  @override
  String get locationPermissionPermanentlyDenied =>
      'Доступ к геолокации запрещен навсегда.';

  @override
  String get deleteMissionTitle => 'Удалить миссию';

  @override
  String get yesDelete => 'Да, удалить';

  @override
  String get waterAlarmTitle => 'Пора пить воду! 💧';

  @override
  String get waterAlarmBody =>
      'Как насчет стакана прохладной воды для вашего здоровья?';

  @override
  String get supplementAlarmBody => 'Не забудьте принять витамины сегодня.';

  @override
  String get waterHabitChannelDesc =>
      'Канал уведомлений для привычки пить воду.';

  @override
  String get pleaseSolveMath => 'Пожалуйста, решите задачу.';

  @override
  String detectedLabel(String labels) {
    return '[Обнаружено: $labels]';
  }

  @override
  String get defaultSleepDuration => '7 ч. 30 мин.';

  @override
  String get year2024Name => 'Год Гап-Чин (Год Голубого Дракона)';

  @override
  String get year2025Name => 'Год Юль-Са (Год Голубой Змеи)';

  @override
  String get year2026Name => 'Год Бён-О (Год Красного Коня)';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle Запрос] $title';
  }

  @override
  String get summary => 'Сводка';

  @override
  String get monthlySummary => 'Ежемесячная сводка';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month ежемесячный показатель успеха: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return 'Нет записей для $month';
  }

  @override
  String get missionRecord => 'Запись миссии';

  @override
  String get supplementRecord => 'Запись о добавках';

  @override
  String get timeSaleCatchChance =>
      'Воспользуйтесь шансом получить скидку 50%!';
}
