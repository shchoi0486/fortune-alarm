// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Будильник удачи';

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
  String hoursMinutesRemaining(int hours, int minutes) {
    return 'Через $hours ч. $minutes мин.';
  }

  @override
  String minutesRemaining(int minutes) {
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
      'Вы уверены, что хотите сбросить список миссий?\n(Системные миссии сохранятся)';

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
      'Не удалось загрузить видео\nНажмите, чтобы повторить';

  @override
  String get itsTimeToWakeUp => 'Пора вставать!';

  @override
  String get dismissAlarm => 'Отключить';

  @override
  String get slideToDismiss => 'Смахните, чтобы отключить';

  @override
  String snoozeInfo(int minutes, int count) {
    return '$minutes мин · $count раз';
  }

  @override
  String snoozeInfoUnlimited(int minutes) {
    return '$minutes мин · Без ограничений';
  }

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
      'Чтобы узнать свои скрытые предсказания,\nвыберите один из способов ниже.';

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
      'У вас закончились печенья с предсказанием.\nПосмотрите рекламу, чтобы узнать результат бесплатно!';

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
      'Чтобы узнать свои скрытые предсказания,\nвыберите один из способов ниже.';

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
    return 'Результат ИИ-анализа лица.\n$title';
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
  String get dateFormatMdyE => 'd MMM (E)';

  @override
  String get deleteAlarm => 'Удалить будильник';

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
    return 'Результат AI-анализа лица.\n$title';
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
  String get mouthExpressionOpen => 'Открытость и искренность';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'Ключевой посыл дня';
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
      'Расскажите о неудобствах или предложениях при использовании Fortune Alarm.\nВаш отзыв помогает сделать приложение лучше.';

  @override
  String get reportCopyright => 'Сообщить о нарушении авторских прав';

  @override
  String get copyrightDescription =>
      'Если вы считаете, что контент нарушает авторские права, сообщите нам по email.\nМы проверим и примем меры.';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get privacyPolicy =>
      'Условия и конфиденциальность\n\n1. Общие положения\n\nСтатья 1 (Цель)\nЭти условия определяют правила использования приложения «Fortune Alarm» (далее — «Сервис»), а также права и обязанности пользователя и разработчика.\n\nСтатья 2 (Конфиденциальность)\n1) Приложение не требует регистрации и не хранит персональные данные на сервере.\n2) Данные (будильники, миссии, история печенек и т.п.) сохраняются локально на устройстве.\n3) Разрешения используются только для работы функций: уведомления, точный будильник/исключение оптимизации батареи, показ поверх других приложений, камера (только для миссии с фото).\n\nСтатья 3 (Реклама)\nСервис может показывать рекламу (Google AdMob). Идентификатор рекламы может использоваться для персонализации.\n\nСтатья 4 (Удаление данных)\nПри удалении приложения все локальные данные удаляются и не подлежат восстановлению.\n\nКонтакты: seriessnap.co@gmail.com';

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
  String minutesLater(int minutes) {
    return 'Через $minutes мин';
  }

  @override
  String get countLabel => 'Количество';

  @override
  String timesCount(int count) {
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
  String missionSnoozeMessage(int minutes) {
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
    return 'Удалить $count фото?\nЭто действие нельзя отменить.';
  }

  @override
  String get defaultRingtone => 'Мелодия по умолчанию';

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
  String get turnOffAlarm => 'Выключить будильник';

  @override
  String get startMission => 'Начать миссию';

  @override
  String get alarmSnooze => 'Отложить';

  @override
  String snoozeMinutesUnlimited(int minutes) {
    return '$minutes мин (без ограничений)';
  }

  @override
  String snoozeMinutesCount(int minutes, int current, int total) {
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
  String get fortuneTitle => 'Проверить удачу';

  @override
  String get fortuneMessage =>
      'Узнайте результаты гадания\nи получите скрытые подарки!';

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
      'Сосредоточьтесь на сегодняшней энергии\nи выберите 3 карты.';

  @override
  String fortuneSelectTitleDate(String month, int day) {
    return 'Сосредоточьтесь на энергии $day.$month\nи выберите 3 карты.';
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
  String get tarotName0 => 'Шут';

  @override
  String get tarotName1 => 'Маг';

  @override
  String get tarotName2 => 'Верховная Жрица';

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
  String get tarotKeywords1 =>
      'Творение, Воля, Способность, Реализация, Многогранность';

  @override
  String get tarotDescription1 =>
      'Маг в красной мантии указывает одной рукой на небо, а другой — на землю, проводя небесную силу в мир. На столе перед ним четыре стихии (жезл, кубок, меч, денарий), что означает: у вас уже есть все инструменты и способности для достижения целей.';

  @override
  String get tarotLoveMeaning1 =>
      'Ваше обаяние сейчас на пике. Вы привлекательны и интересны для противоположного пола.';

  @override
  String get tarotLoveDetail1 =>
      'Отличная возможность покорить чье-то сердце. Если вам кто-то нравится, не бойтесь проявлять инициативу. Ваше остроумие и умение поддержать беседу очаруют собеседника. Для тех, кто в паре: устройте сюрприз или свидание — партнер будет в восторге. Действуйте уверенно!';

  @override
  String get tarotWealthMeaning1 =>
      'Подходящее время для монетизации ваших навыков. Превратите идеи в реальные финансовые результаты.';

  @override
  String get tarotWealthDetail1 =>
      'Ваши знания и идеи сейчас могут принести деньги. Не ограничивайтесь только зарплатой — рассмотрите варианты подработки или фриланса. Ваши таланты в планировании и продажах проявятся блестяще. Хороший момент для составления финансового плана — ваша интуиция в управлении средствами не подведет.';

  @override
  String get tarotSuccessMeaning1 =>
      'Ваши профессиональные качества будут высоко оценены. Пора воплощать задуманное в жизнь.';

  @override
  String get tarotSuccessDetail1 =>
      'Вы можете выделиться на работе или в учебе, максимально используя свои способности. Любую проблему вы решите с присущей вам смекалкой, что заметят коллеги и руководство. Отличный момент для презентаций или запуска новых проектов. Вы полностью готовы к успеху — верьте в себя и сияйте на сцене жизни!';

  @override
  String get policy => 'Политика конфиденциальности';

  @override
  String get support => 'Поддержка';

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
      'Здравствуйте! Fortune Alarm официально запущен.\n\nНачинайте каждое утро с проверки своей удачи и заряжайтесь позитивом на весь день!\nМы продолжим радовать вас новыми функциями.\n\nСпасибо, что вы с нами.';

  @override
  String get notice2Title => 'Обновление версии 1.0.0';

  @override
  String get notice2Content =>
      'Что нового в версии 1.0.0:\n\n1. Улучшен интерфейс миссии «Витамины»\n2. Оптимизированы настройки точного времени\n3. Добавлена поддержка темной темы\n4. Исправлены ошибки и повышена стабильность\n\nОбновитесь до последней версии прямо сейчас!';

  @override
  String get notice3Title => 'Изменение Условий использования';

  @override
  String get notice3Content =>
      'Мы обновили условия использования.\n\nОсновные изменения:\n- Улучшена политика конфиденциальности\n- Уточнены правила использования сервисов\n\nПодробности в меню «Настройки > Условия».';

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
    return 'Текст запроса скопирован в буфер обмена.\nХотите отправить письмо на $email?';
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
  String categoryMissions(Object category) {
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
  String get notificationTime => 'Время уведомления';

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
  String hourFormat(Object hour) {
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
      'Откройте свои счастливые числа\nс помощью ИИ-алгоритма Будильника удачи';

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
      'Не удалось получить данные о товарах из магазина.\n\n[Чек-лист]\n1. Статус входа в Google Play / App Store\n2. Подключение к интернету\n3. Статус регистрации тестового устройства';

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
      'Лучшая совместимость, о которой можно только мечтать. Берегите друг друга!';

  @override
  String get compatibilityTitleGreat => 'Прекрасные отношения 💕';

  @override
  String get compatibilityDescGreat =>
      'Отличный партнер, который станет для вас огромной поддержкой.';

  @override
  String get compatibilityTitleGood => 'Хорошая пара 😊';

  @override
  String get compatibilityDescGood =>
      'Есть различия, но вы можете построить прекрасную любовь, подстраиваясь друг под друга.';

  @override
  String get compatibilityTitleEffort => 'Нужны усилия 🧐';

  @override
  String get compatibilityDescEffort =>
      'Много различий. Ключ к отношениям — понимание и внимание.';

  @override
  String get compatibilityTitleDifficult => 'Нужно много работы 😅';

  @override
  String get compatibilityDescDifficult =>
      'Различия в характерах могут быть значительными. Вам нужно глубоко понимать друг друга.';

  @override
  String get compatibilityResultButton => 'Посмотреть результат совместимости';

  @override
  String get compatibilityDeleteTooltip => 'Удалить';

  @override
  String get compatibilityGenderMale => 'Мужчина';

  @override
  String get compatibilityGenderFemale => 'Женщина';

  @override
  String get tojeongInputTitle => 'Данные для Тоджон Бигёль';

  @override
  String tojeongCheckFortune(int year) {
    return 'Проверьте ваш Тоджон Бигёль\nна $year год';
  }

  @override
  String get tojeongInputGuide =>
      'Введите дату и время рождения\nдля точного анализа.';

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
  String tojeongShareTitle(Object year) {
    return 'Результаты Тоджон Бигёль на $year год';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return 'Общий обзор Тоджон Бигёль для $name.\n\n$desc...';
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
    return '$title\nСервис в разработке.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'Мы усердно работаем над тем, чтобы предоставить\nвам более точную информацию о вашей удаче!';

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
    return 'Каким будет ваш прогноз\nна $year год?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'Введите дату и время рождения\nдля точного анализа Саджу.';

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
    return 'Новогодний прогноз для $name.\n\n$desc...';
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
  String tojeongCoreMessage(Object hasu, Object jungsu, Object sangsu) {
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
}
