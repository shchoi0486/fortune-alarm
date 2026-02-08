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
  String get missionWakeUp => '기상 미션';

  @override
  String get missionSupplement => '영양제 챙겨 먹기';

  @override
  String get missionWater => '물 2L 이상 마시기';

  @override
  String get fortuneCookie => '포춘쿠키';

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageEnglish => '영어';

  @override
  String get languageJapanese => '일본어';

  @override
  String get languageChinese => '중국어';

  @override
  String get languageRussian => '러시아어';

  @override
  String get languageHindi => '힌디어';

  @override
  String get languageSpanish => '스페인어';

  @override
  String get languageFrench => '프랑스어';

  @override
  String get languageGerman => '독일어';

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

  @override
  String get missionSuccess => '미션 성공!';

  @override
  String get cheeringMessage1 => '오늘 하루도 즐겁게 보내세요!';

  @override
  String get cheeringMessage2 => '당신의 오늘을 응원합니다!';

  @override
  String get cheeringMessage3 => '오늘도 멋진 하루가 될 거예요.';

  @override
  String get todaysCheering => '오늘의 응원';

  @override
  String get notificationWakeUpBody => '일어날 시간입니다!';

  @override
  String get notificationMissionBody => '미션을 수행하고 알람을 끄세요!';

  @override
  String get notificationSafetyBody => '알람이 강제로 종료되었습니다! 미션을 완료해주세요.';

  @override
  String get notificationRingingBody => '알람이 울리고 있습니다!';

  @override
  String get snoozePrefix => '[미루기]';

  @override
  String get exactAlarmPermissionRequired =>
      '정확한 시간에 알람을 울리려면 \"정확한 알람\" 권한이 필요합니다.';

  @override
  String get overlayPermissionRequired =>
      '전체 화면 알림을 위해 \"다른 앱 위에 표시\" 권한이 필요합니다.';

  @override
  String get deleteAllAlarms => '모든 알람 삭제';

  @override
  String get noAlarms => '등록된 알람이 없습니다.';

  @override
  String get lessThanAMinuteRemaining => '1분 미만 후에 울려요';

  @override
  String hoursMinutesRemaining(String hours, String minutes) {
    return '$hours시간 $minutes분 후에 울려요';
  }

  @override
  String minutesRemaining(String minutes) {
    return '$minutes분 후에 울려요';
  }

  @override
  String get am => '오전';

  @override
  String get pm => '오후';

  @override
  String get dailyFortuneCookieReward => '오늘의 포춘쿠키 보상';

  @override
  String get missionRewardInfo => '미션 5개 성공 시 1개, 10개 성공 시 2개 지급!';

  @override
  String get dailyMission => '오늘의 미션';

  @override
  String goalAchieved(int completed) {
    return '🎉 $completed/5 목표 달성!';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 달성';
  }

  @override
  String get myMissionRecord => '나의 미션 기록';

  @override
  String get consecutiveSuccess => '연속 성공';

  @override
  String get successRate30Days => '성공률(30일)';

  @override
  String get totalSuccess => '총 성공';

  @override
  String get inProgress => '도전 중 🔥';

  @override
  String get resetMissions => '미션 초기화';

  @override
  String get resetMissionsConfirm => '모든 도전 목록을 초기화하시겠습니까?\n(기본 시스템 미션 제외)';

  @override
  String get cancel => '취소';

  @override
  String get reset => '초기화';

  @override
  String get addMission => '미션 추가';

  @override
  String get completedMissions => '완료된 미션';

  @override
  String get noCompletedMissionsHint => '아직 완료된 미션이 없습니다.';

  @override
  String greeting(String userName) {
    return '안녕하세요, $userName님';
  }

  @override
  String get welcomeFortune => '신비로운 운세의 세계에 오신 것을 환영합니다';

  @override
  String get luckyColor => '행운의 색';

  @override
  String get luckyItem => '행운의 물건';

  @override
  String get luckyDirection => '길한 방향';

  @override
  String get viewVariousFortunes => '다양한 운세 보기';

  @override
  String get todaysRecommendation => '오늘의 추천';

  @override
  String get checkTodaysFortune => '오늘의 운세 확인';

  @override
  String get todaysAdvice => '오늘의 조언';

  @override
  String get viewSpecificDateFortune => '지정일 운세보기';

  @override
  String get luckyNumberRecommendation => '행운의 번호 추천';

  @override
  String get luckyNumber => '행운의 번호';

  @override
  String get specificDateFortune => '지정일 운세';

  @override
  String get specialDayFortune => '특별한 날 운세';

  @override
  String get newYearFortune => '신년운세';

  @override
  String get totalFortune2026 => '2026년 전체운';

  @override
  String get traditionalFortune => '토정비결';

  @override
  String get traditionalSaju => '전통 사주 풀이';

  @override
  String get faceReading => '관상 보기';

  @override
  String get missionFaceReading => '관상 미션';

  @override
  String get faceFate => '얼굴 관상 운명';

  @override
  String get compatibility => '궁합 보기';

  @override
  String get relationshipHarmony => '인연과의 조화';

  @override
  String get ohaengWood => '목';

  @override
  String get ohaengFire => '화';

  @override
  String get ohaengEarth => '토';

  @override
  String get ohaengMetal => '금';

  @override
  String get ohaengWater => '수';

  @override
  String get ohaengWoodSymbol => '나무';

  @override
  String get ohaengFireSymbol => '불';

  @override
  String get ohaengEarthSymbol => '흙';

  @override
  String get ohaengMetalSymbol => '쇠';

  @override
  String get ohaengWaterSymbol => '물';

  @override
  String get ohaengWoodExplanation =>
      '목(나무) 기운이 강한 당신은 성장과 의욕이 넘치며, 인정이 많고 진취적인 성향을 가집니다.';

  @override
  String get ohaengFireExplanation =>
      '화(불) 기운이 강한 당신은 열정과 예의가 바르며, 활발하고 화려한 것을 좋아하는 성향입니다.';

  @override
  String get ohaengEarthExplanation =>
      '토(흙) 기운이 강한 당신은 신뢰와 포용력이 있으며, 중후하고 변함없는 성향을 가집니다.';

  @override
  String get ohaengMetalExplanation =>
      '금(쇠) 기운이 강한 당신은 결단력과 의리가 있으며, 냉철하고 원칙을 중요시하는 성향입니다.';

  @override
  String get ohaengWaterExplanation =>
      '수(물) 기운이 강한 당신은 지혜와 유연함이 있으며, 총명하고 적응력이 뛰어난 성향입니다.';

  @override
  String get cheonganGap => '갑';

  @override
  String get cheonganEul => '을';

  @override
  String get cheonganByeong => '병';

  @override
  String get cheonganJeong => '정';

  @override
  String get cheonganMu => '무';

  @override
  String get cheonganGi => '기';

  @override
  String get cheonganGyeong => '경';

  @override
  String get cheonganSin => '신';

  @override
  String get cheonganIm => '임';

  @override
  String get cheonganGye => '계';

  @override
  String get jijiJa => '쥐';

  @override
  String get jijiChuk => '소';

  @override
  String get jijiIn => '호랑이';

  @override
  String get jijiMyo => '토끼';

  @override
  String get jijiJin => '용';

  @override
  String get jijiSa => '뱀';

  @override
  String get jijiO => '말';

  @override
  String get jijiMi => '양';

  @override
  String get jijiSin => '원숭이';

  @override
  String get jijiYu => '닭';

  @override
  String get jijiSul => '개';

  @override
  String get jijiHae => '돼지';

  @override
  String get jijiAnimalRat => '쥐';

  @override
  String get jijiAnimalOx => '소';

  @override
  String get jijiAnimalTiger => '호랑이';

  @override
  String get jijiAnimalRabbit => '토끼';

  @override
  String get jijiAnimalDragon => '용';

  @override
  String get jijiAnimalSnake => '뱀';

  @override
  String get jijiAnimalHorse => '말';

  @override
  String get jijiAnimalSheep => '양';

  @override
  String get jijiAnimalMonkey => '원숭이';

  @override
  String get jijiAnimalRooster => '닭';

  @override
  String get jijiAnimalDog => '개';

  @override
  String get jijiAnimalPig => '돼지';

  @override
  String get assetDefaultBackground => '기본 배경';

  @override
  String get assetFortuneyFriends => '포츄니친구들';

  @override
  String get assetMongchuny => '몽츄니';

  @override
  String get assetPanchuny => '판츄니';

  @override
  String get assetTochuny => '토춘이';

  @override
  String get assetHochuny => '호츄니';

  @override
  String get assetBear => '곰돌이';

  @override
  String get assetMoon => '달';

  @override
  String get assetBridge => '다리';

  @override
  String get assetRoad => '도로';

  @override
  String get assetSky => '하늘';

  @override
  String get assetMinimalGray => '미니멀 그레이';

  @override
  String get assetDarkMode => '다크 모드';

  @override
  String get assetSoftBlue => '소프트 블루';

  @override
  String get assetWarmBeige => '따뜻한 베이지';

  @override
  String assetCat(int number) {
    return '고양이 $number';
  }

  @override
  String assetDog(int number) {
    return '강아지 $number';
  }

  @override
  String assetSea(int number) {
    return '바다 $number';
  }

  @override
  String get categoryCharacter => '캐릭터';

  @override
  String get categoryAnimal => '동물';

  @override
  String get categoryIllustration => '일러스트';

  @override
  String get categoryLandscape => '풍경';

  @override
  String get categorySimple => '심플';

  @override
  String get alarmBackground => '알람 배경화면';

  @override
  String get random => '랜덤';

  @override
  String get gallery => '갤러리';

  @override
  String get selectSolidColor => '단색 선택';

  @override
  String get deleteColor => '색상 삭제';

  @override
  String get deleteColorConfirm => '이 색상을 목록에서 삭제하시겠습니까?';

  @override
  String get deleteMission => '미션 삭제';

  @override
  String get deleteMissionConfirm => '미션을 삭제하시겠습니까?';

  @override
  String get randomBackgroundDesc => '매번 새로운 배경으로 알람이 울려요!';

  @override
  String get backgroundDeleted => '배경화면이 삭제되었습니다.';

  @override
  String get pickFromDevice => '기기에서 선택하기';

  @override
  String get alarmSaveError => '알람 등록 실패. 알 수 없는 오류가 발생했습니다.';

  @override
  String errorOccurred(String error) {
    return '오류 발생: $error';
  }

  @override
  String get openSettings => '설정 열기';

  @override
  String get videoLoadFailed => '영상 불러오기 실패\n탭해서 다시 시도';

  @override
  String get itsTimeToWakeUp => '일어날 시간이에요!';

  @override
  String get dismissAlarm => '알람 끄기';

  @override
  String get slideToDismiss => '밀어서 끄기';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes분 x $count회';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '$minutes분 · 무제한';
  }

  @override
  String get noActiveAlarms => '활성화된 알람 없음';

  @override
  String get wealth => '재물';

  @override
  String get love => '인연';

  @override
  String get career => '직업';

  @override
  String get health => '건강';

  @override
  String get faceAnalysisBasic => '관상 분석(기본)';

  @override
  String get insufficientDataOverallImpression =>
      '측정값이 충분하지 않아, 전체적인 인상 중심으로 해석했습니다.';

  @override
  String get noseStabilityWealthAccuracy =>
      '코 윤곽이 안정적으로 잡히면 재물운 해석의 정확도가 올라갑니다.';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      '입 주변 윤곽이 뚜렷할수록 말운·대인운 해석이 구체화됩니다.';

  @override
  String get improveAnalysisQualityAdvice => '조명을 밝게 하고 정면을 바라보면 분석 품질이 좋아집니다.';

  @override
  String get basicAnalysisDescription =>
      '이번 결과는 얼굴 윤곽/표정 측정이 충분하지 않아 기본 해석으로 표시됩니다.\n정면 응시와 조명 상태가 좋아지면, 눈 뜸·코 윤곽·입 주변 지표가 더 안정적으로 측정됩니다.\n다시 시도하면 점수 분포와 문장이 더 구체적으로 바뀝니다.';

  @override
  String get defaultDailyFortune =>
      '오늘은 평온한 마음으로 하루를 시작하기 좋은 날입니다.\n거울 속 미소로 긍정적인 기운을 채워보세요.\n작은 여유가 뜻밖의 행운을 불러옵니다.';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '$vibe오늘은 $topKey 운이 가장 돋보이는 날입니다. 반면 $bottomKey 쪽은 세심한 주의가 필요해 보이네요.';
  }

  @override
  String get faceShapeVLine => 'V라인형';

  @override
  String get faceShapeSquare => '각진형';

  @override
  String get faceShapeBalanced => '균형형';

  @override
  String get faceShapeRound => '둥근형';

  @override
  String get faceShapeLong => '긴형';

  @override
  String get faceShapeOval => '타원형';

  @override
  String get titleWealthOriented => '재물운 중심의 상';

  @override
  String get titleLoveStrong => '인연운이 강한 상';

  @override
  String get titleCareerNotable => '직업운이 돋보이는 상';

  @override
  String get titleStableEnergy => '기운이 안정된 상';

  @override
  String get faceAnalysisComplete => '관상 분석이 완료되었습니다!';

  @override
  String get chooseUnlockMethod => '당신의 얼굴에 숨겨진 운세를 확인하려면\n아래 방법 중 하나를 선택해주세요.';

  @override
  String get watchAdForFreeResult => '광고 보고 무료로 결과 보기';

  @override
  String get useTwoCookies => '포춘쿠키 2개 사용하기';

  @override
  String get checkResult => '결과 확인하기';

  @override
  String get aiAnalyzingFace => 'AI가 관상을 분석 중입니다...';

  @override
  String get faceRecognitionComplete => '얼굴 인식 완료';

  @override
  String get extractingFeatures => '특징점 추출 중...';

  @override
  String get matchingFortuneData => '운세 데이터 대조 중...';

  @override
  String get adLoadFailedFreeUnlock => '광고를 불러오지 못해 이번에는 무료로 열어드렸어요.';

  @override
  String get insufficientCookies => '포춘쿠키 부족';

  @override
  String get insufficientCookiesDesc => '보유한 포춘쿠키가 부족합니다.\n광고를 보고 무료로 확인해보세요!';

  @override
  String get usingTwoCookiesToast => '포춘쿠키 2개를 사용하여 결과를 확인합니다.';

  @override
  String get todaysFaceAnalysis => '오늘의 관상 분석';

  @override
  String totalScoreWithPoints(int score) {
    return '총점 $score점';
  }

  @override
  String get adLoadFailFreeAccess => '광고를 불러오지 못해 이번에는 무료로 열어드렸어요.';

  @override
  String get insufficientCookiesTitle => '포춘쿠키 부족';

  @override
  String get insufficientCookiesMessage =>
      '보유한 포춘쿠키가 부족합니다.\n미션을 수행하거나 광고를 보고 무료로 충전할 수 있습니다.';

  @override
  String get useCookiesSnackbar => '포춘쿠키 2개를 사용하여 결과를 확인합니다.';

  @override
  String get faceAnalysisComplete_v2 => '관상 분석이 완료되었습니다!';

  @override
  String get chooseMethodToViewResult =>
      '당신의 얼굴에 숨겨진 운세를 확인하려면\n아래 방법 중 하나를 선택해주세요.';

  @override
  String get watchAdForFree => '광고 보고 무료로 결과 보기';

  @override
  String get useTwoCookies_v2 => '포춘쿠키 2개 사용하기';

  @override
  String get viewResult => '결과 확인하기';

  @override
  String get aiAnalyzingFace_v2 => 'AI가 관상을 분석 중입니다...';

  @override
  String get faceRecognitionComplete_v2 => '얼굴 인식 완료';

  @override
  String get extractingFeatures_v2 => '특징점 추출 중...';

  @override
  String get matchingFortuneData_v2 => '운세 데이터 대조 중...';

  @override
  String get wealthLuck => '💰 재물운';

  @override
  String get loveLuck => '❤️ 애정운';

  @override
  String get careerLuck => '💼 직업운';

  @override
  String get healthLuck => '💪 건강운';

  @override
  String get tojeongMonthlyGood_0 =>
      '동쪽에서 귀인이 나타나 기쁜 소식을 전합니다. 오랫동안 기다려온 계획이 결실을 맺을 것입니다.';

  @override
  String get tojeongMonthlyGood_1 =>
      '재물이 샘물처럼 흘러들어옵니다. 모든 일이 순조롭게 풀리니 걱정이 사라집니다.';

  @override
  String get tojeongMonthlyGood_2 =>
      '노력이 결실을 맺어 축하받을 일이 생깁니다. 승진이나 큰 성과가 기대됩니다.';

  @override
  String get tojeongMonthlyGood_3 => '어두운 밤이 지나고 아침 해가 뜹니다. 고생 끝에 행복이 찾아옵니다.';

  @override
  String get tojeongMonthlyGood_4 =>
      '뜻밖의 횡재수가 있어 주머니가 두둑해집니다. 작은 투자로 큰 이익을 봅니다.';

  @override
  String get tojeongMonthlyNeutral_0 => '평온한 일상이 지속됩니다. 특별한 사건 없이 무난하게 지나갑니다.';

  @override
  String get tojeongMonthlyNeutral_1 => '자족하는 마음이 평안을 가져옵니다. 소소한 행복을 즐겨보세요.';

  @override
  String get tojeongMonthlyNeutral_2 =>
      '바쁜 일상 속에서 잠시 휴식을 취하세요. 건강 관리에 유의해야 합니다.';

  @override
  String get tojeongMonthlyNeutral_3 => '새로운 일을 벌이기보다는 현재의 자리를 지키는 것이 좋습니다.';

  @override
  String get tojeongMonthlyNeutral_4 => '소통이 중요합니다. 오해를 사지 않도록 언행에 주의하세요.';

  @override
  String get tojeongMonthlyCaution_0 => '매사에 신중함이 필요합니다. 돌다리도 두들겨 보고 건너세요.';

  @override
  String get tojeongMonthlyCaution_1 => '건강에 유의하고 무리한 활동은 피하는 것이 좋습니다.';

  @override
  String get tojeongMonthlyCaution_2 => '구설수를 조심하고 타인의 일에 깊이 관여하지 마세요.';

  @override
  String get tojeongMonthlyCaution_3 => '과도한 욕심은 화를 부릅니다. 분수에 맞는 생활이 필요합니다.';

  @override
  String get tojeongMonthlyCaution_4 => '금전 거래를 피하세요. 믿었던 사람에게 실망할 수 있습니다.';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      '새해의 맑은 기운이 함께하니, 계획한 바를 시작하면 순조롭게 풀릴 것입니다.';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      '연초에는 귀인의 도움이 따르니, 주변 사람들과의 관계를 소중히 하세요.';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      '의욕이 앞서 일을 그르칠 수 있습니다. 차분하게 장기적인 관점에서 계획을 점검하세요.';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      '시작이 반입니다. 미뤄왔던 일을 과감하게 시작하면 의외의 성과를 얻습니다.';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      '작은 습관의 변화가 큰 운의 흐름을 바꿉니다. 일찍 일어나는 습관을 들여보세요.';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      '아직은 때가 아니니, 수면 아래에서 힘을 기르며 기회를 엿보아야 합니다.';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      '오래된 문제나 갈등이 수면 위로 드러날 수 있습니다. 회피하지 말고 정면으로 해결하세요.';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      '겉으로 보이는 성과보다 내실을 다지는 것이 중요한 시기입니다. 섣부른 움직임은 손해를 부릅니다.';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      '겨울의 끝자락에서 봄을 기다리듯, 인내심을 가지고 준비하는 자에게 기회가 옵니다.';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      '주변의 소란스러움에 동요하지 말고 자신의 길을 묵묵히 걸어가야 합니다.';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      '만물이 소생하는 기운이 당신에게 새로운 기회를 가져다줍니다. 망설이지 말고 도전하세요.';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      '새로운 인연이 시작될 수 있는 달입니다. 긍정적인 마음으로 사람들을 대하면 좋은 결실을 맺습니다.';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      '변화의 바람 속에서 중심을 잃기 쉽습니다. 사소한 감정 변화에 휘둘리지 않도록 마음을 다스리세요.';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      '새싹이 땅을 뚫고 나오듯, 당신의 잠재력이 폭발하는 시기입니다. 자신감을 가지세요.';

  @override
  String get tojeongMonthlySpecial_3_4 => '귀한 인연이 찾아오니 마음의 문을 활짝 열고 사람을 맞이하세요.';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      '따스한 기운과 함께 재물운이 상승합니다. 노력의 결실이 금전적 보상으로 이어질 것입니다.';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      '문서운이 길하여 계약이나 시험에서 좋은 결과를 얻을 수 있습니다. 신중하게 검토하세요.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      '예상치 못한 지출이 발생할 수 있으니, 금전 관리에 각별히 신경 써야 합니다.';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      '꽃이 만개하듯 당신의 매력이 돋보이는 달입니다. 대인관계에서 주도권을 잡으세요.';

  @override
  String get tojeongMonthlySpecial_4_4 => '재물운이 따르니 투자를 하거나 저축을 늘리기에 좋은 시기입니다.';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      '가정에 화목한 기운이 깃드니, 가족과의 관계에서 기쁨을 얻고 안정을 찾게 됩니다.';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      '주변 사람들에게 베푼 친절이 복이 되어 돌아옵니다. 인덕이 쌓여 어려움을 해결해 줍니다.';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      '사소한 오해로 가까운 사람과 다툼이 생길 수 있습니다. 역지사지의 자세가 필요합니다.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      '가정의 달인 만큼 가족과의 시간에 집중하세요. 집안의 화목이 모든 일의 근본입니다.';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      '마음의 여유를 가지고 주변을 둘러보면, 놓치고 있던 소중한 것들을 발견하게 됩니다.';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      '그동안의 노력이 결실을 맺어 주변의 인정을 받게 됩니다. 승진이나 명예의 기회가 있습니다.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      '활동적인 기운이 강해지니, 새로운 분야로의 확장이나 이직을 고려해볼 만합니다.';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      '너무 앞서나가면 구설에 오를 수 있습니다. 겸손한 태도를 유지하고 주변을 살피세요.';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      '더위가 시작되기 전, 체력을 비축해두어야 합니다. 건강 검진을 받아보는 것도 좋습니다.';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      '상반기를 마무리하고 하반기를 계획하는 중간 점검의 시간을 가지세요.';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      '뜨거운 열정이 성과로 이어지는 시기입니다. 과감하게 추진하면 목표를 달성할 수 있습니다.';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      '여행이나 이동 중에 귀인을 만나거나 새로운 기회를 얻게 될 수 있습니다.';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      '건강을 해치기 쉬운 시기입니다. 과로를 피하고 충분한 휴식을 취하는 것이 중요합니다.';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      '무더위 속에서도 지치지 않는 열정이 필요합니다. 땀 흘린 만큼 결실이 있을 것입니다.';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      '휴식을 통해 재충전의 시간을 가지세요. 멀리 떠나는 여행이 행운을 가져다줍니다.';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      '인내의 시간이 지나고 점차 운이 트이기 시작합니다. 조급해하지 말고 때를 기다리세요.';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      '해결되지 않던 묵은 문제가 실마리를 찾게 됩니다. 지혜를 발휘하여 해결하세요.';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      '결실을 앞두고 방심하기 쉽습니다. 마지막까지 긴장의 끈을 놓지 마세요.';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      '결실의 계절을 앞두고 마지막 스퍼트를 올려야 할 때입니다. 긴장을 늦추지 마세요.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      '뜻하지 않은 도움의 손길이 있습니다. 어려움이 있다면 주변에 조언을 구하세요.';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      '풍성한 결실의 계절처럼, 재물운과 애정운이 모두 풍요로워지는 시기입니다.';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      '그동안 공들인 일이 있다면, 기대 이상의 좋은 결과를 얻게 될 것입니다.';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      '들어오는 것이 많은 만큼 나가는 것도 많을 수 있습니다. 현명한 소비 계획이 필요합니다.';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      '황금 들판처럼 풍요로운 시기입니다. 베푸는 마음을 가지면 더 큰 복이 들어옵니다.';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      '그동안의 오해나 갈등을 풀기에 좋은 시기입니다. 먼저 손을 내밀어 보세요.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      '명예운이 높아져 당신의 이름이 널리 알려지게 됩니다. 주변의 신망을 얻게 될 것입니다.';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      '지적인 활동에서 큰 성과를 거둘 수 있습니다. 학업이나 연구에 매진하기 좋은 때입니다.';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      '높아진 위상만큼 책임감도 무거워집니다. 언행에 신중을 기해야 합니다.';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      '높고 푸른 하늘처럼 명예운이 상승합니다. 자신의 능력을 마음껏 펼쳐보세요.';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      '깊이 있는 사색과 독서를 통해 내면의 지혜를 쌓기에 좋은 달입니다.';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      '한 해를 돌아보며 미래를 준비하는 지혜가 필요한 시기입니다. 성찰을 통해 한 단계 성장하게 됩니다.';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      '금전적인 안정을 찾게 되나, 큰 이익을 좇아 무리한 투자를 하는 것은 금물입니다.';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      '인간관계에서 외로움을 느낄 수 있습니다. 먼저 마음을 열고 다가가는 노력이 필요합니다.';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      '차가운 바람이 불어오니 옷깃을 여미듯, 실속을 챙기고 내실을 다져야 합니다.';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      '한 해를 정리하며 부족했던 점을 되돌아보고 내년을 준비하는 지혜가 필요합니다.';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      '연말에 뜻밖의 행운이 찾아옵니다. 금전적인 이득이나 좋은 소식을 기대해 보세요.';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      '오랜 시간 노력해온 일에 대한 보상을 받게 됩니다. 유종의 미를 거두는 달입니다.';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      '모임이 잦아져 건강을 해치거나 불필요한 지출을 할 수 있으니, 절제가 필요합니다.';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      '끝은 새로운 시작입니다. 아쉬움보다는 희망찬 미래를 설계하며 한 해를 마무리하세요.';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      '따뜻한 나눔을 실천하면 그 온기가 당신에게 행운으로 돌아옵니다.';

  @override
  String get todaysFaceFortune => '오늘의 관상 운세';

  @override
  String get detailedAnalysis => '상세 분석';

  @override
  String get eyeInsight => '👁️ 눈 (통찰력)';

  @override
  String get noseWealth => '👃 코 (재물복)';

  @override
  String get mouthLateLuck => '👄 입 (말년운)';

  @override
  String get overallAnalysisTitle => '종합 분석';

  @override
  String get shareResultTitle => '오늘의 관상 결과';

  @override
  String shareResultDesc(String title) {
    return 'AI 관상 분석 결과입니다.\n$title';
  }

  @override
  String get shareResultTotalScore => '종합 점수';

  @override
  String get shareResultWealth => '재물운';

  @override
  String get shareResultLove => '애정운';

  @override
  String get shareResultCareer => '직업운';

  @override
  String get shareResultHealth => '건강운';

  @override
  String get shareResultText => '결과 공유하기';

  @override
  String get wakeUpComplete => '기상 완료!';

  @override
  String get collapseOptions => '옵션 접기';

  @override
  String get expandOptions => '옵션 더보기';

  @override
  String get snoozeAlarm => '알람 미루기';

  @override
  String get interval => '간격';

  @override
  String get maxSnoozeCount => '횟수 제한';

  @override
  String get unlimited => '무제한';

  @override
  String get permissionRequired => '권한 필요';

  @override
  String get exactAlarmFailMessage =>
      '알람 등록에 실패했습니다. 정확한 알람 권한이 꺼져있어 설정이 필요합니다.';

  @override
  String get batteryOptimFailMessage =>
      '알람 등록에 실패했습니다. 배터리 최적화 예외 권한이 없어 설정이 필요합니다.';

  @override
  String get overlayFailMessage =>
      '알람 등록에 실패했습니다. 다른 앱 위에 표시 권한이 없어 설정이 필요합니다.';

  @override
  String get loadingDelay => '로딩 지연';

  @override
  String get loading => '로딩 중...';

  @override
  String get previewFail => '미리보기 실패';

  @override
  String get bgDefault => '기본 배경';

  @override
  String get bgFortuneFriends => '포츄니친구들';

  @override
  String get bgMongChuni => '몽츄니';

  @override
  String get bgPanChuni => '판츄니';

  @override
  String get bgToChuni => '토춘이';

  @override
  String get bgHoChuni => '호츄니';

  @override
  String get bgBear => '곰돌이';

  @override
  String get bgMoon => '달';

  @override
  String get bgSea => '바다';

  @override
  String get bgBridge => '다리';

  @override
  String get bgRoad => '도로';

  @override
  String get bgSky => '하늘';

  @override
  String get bgMinimalGray => '미니멀 그레이';

  @override
  String get bgDarkMode => '다크 모드';

  @override
  String get bgSoftBlue => '소프트 블루';

  @override
  String get bgWarmBeige => '웜 베이지';

  @override
  String get dateFormatMdyE => 'M월 d일 (E)';

  @override
  String get deleteAlarm => '알람 삭제';

  @override
  String get confirmDelete => '정말 삭제하시겠습니까?';

  @override
  String get yes => '예';

  @override
  String get no => '아니요';

  @override
  String get wealthLuckWithIcon => '💰 재물운';

  @override
  String get loveLuckWithIcon => '❤️ 애정운';

  @override
  String get careerLuckWithIcon => '💼 직업운';

  @override
  String get healthLuckWithIcon => '💪 건강운';

  @override
  String get mouthFortune => '👄 입 (말년운)';

  @override
  String get comprehensiveAnalysis => '종합 분석';

  @override
  String get todaysFaceResult => '오늘의 관상 결과';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'AI 관상 분석 결과입니다.\n$title';
  }

  @override
  String get shareResult => '결과 공유하기';

  @override
  String get faceVibeSmile0 => '입가에 머문 밝은 미소가 주변에 긍정적인 에너지를 전파하네요. ';

  @override
  String get faceVibeSmile1 => '화사하게 피어난 미소에서 오늘 하루의 밝은 운기가 느껴집니다. ';

  @override
  String get faceVibeSmile2 => '부드러운 입매가 귀인을 부르는 매력적인 기운을 뿜어내고 있습니다. ';

  @override
  String get faceVibeSmile3 => '자신감 넘치는 미소는 오늘 어떤 난관도 쉽게 풀어낼 열쇠가 될 것입니다. ';

  @override
  String get faceVibeSmile4 => '시원한 미소 덕분에 막혔던 기운이 뚫리고 행운이 찾아올 준비를 마쳤습니다. ';

  @override
  String get faceVibeEye0 => '초롱초롱하게 빛나는 눈빛에서 오늘 하루를 이끌어갈 강한 의지가 느껴집니다. ';

  @override
  String get faceVibeEye1 => '총기 어린 눈매가 날카로운 판단력과 직관을 예고하고 있습니다. ';

  @override
  String get faceVibeEye2 => '맑고 깊은 눈동자가 진실한 기운을 담아 좋은 소식을 기다리고 있네요. ';

  @override
  String get faceVibeEye3 => '정면을 응시하는 당당한 눈빛이 오늘 당신의 존재감을 드높여줄 것입니다. ';

  @override
  String get faceVibeEye4 => '눈빛에 서린 열정이 주변 사람들에게 강한 신뢰를 심어주는 하루입니다. ';

  @override
  String get faceVibeNeutral0 => '전체적으로 평온하고 안정된 얼굴의 기운이 마음의 여유를 가져다줍니다. ';

  @override
  String get faceVibeNeutral1 => '차분하게 가라앉은 안색에서 신중하고 지혜로운 기운이 엿보입니다. ';

  @override
  String get faceVibeNeutral2 => '균형 잡힌 얼굴의 조화가 오늘 하루의 기복 없는 평탄함을 상징하네요. ';

  @override
  String get faceVibeNeutral3 => '진중한 분위기가 느껴지는 얼굴은 오늘 중요한 결정을 내리기에 최적입니다. ';

  @override
  String get faceVibeNeutral4 =>
      '편안한 얼굴 기운이 주변 사람들에게 안도감을 주어 협력이 잘 이루어질 상입니다. ';

  @override
  String get dailyFortuneWealth0 =>
      '콧망울의 기운이 단단하니, 작은 정리와 확인이 돈의 흐름을 더 크게 만들어줍니다.';

  @override
  String get dailyFortuneWealth1 =>
      '재백궁(코)에 힘이 실리는 날입니다. 급할수록 계산을 한 번 더 하면 이득이 남습니다.';

  @override
  String get dailyFortuneWealth2 =>
      '얼굴의 중심인 코의 기운이 좋아 알뜰하게 챙긴 한 가지가 예상 밖의 성과로 이어집니다.';

  @override
  String get dailyFortuneWealth3 =>
      '금전운이 깃든 안색입니다. 생각지 못한 곳에서 작은 수익이 발생할 수 있는 흐름입니다.';

  @override
  String get dailyFortuneWealth4 =>
      '코 끝의 생기가 좋아 경제적인 감각이 예리해집니다. 투가나 구매 결정에 유리한 날입니다.';

  @override
  String get dailyFortuneWealth5 =>
      '돈을 부르는 기운이 강합니다. 지갑을 정리하거나 통장 내역을 살피면 행운이 따릅니다.';

  @override
  String get dailyFortuneWealth6 =>
      '재물 창고가 든든하게 채워지는 상입니다. 성실하게 쌓아온 노력이 결실을 맺기 시작합니다.';

  @override
  String get dailyFortuneWealth7 =>
      '안정적인 재물운이 들어오고 있습니다. 큰 지출보다는 꾸준한 저축이 운을 더 키워줍니다.';

  @override
  String get dailyFortuneWealth8 => '경제적 기회를 포착하는 눈이 밝아집니다. 주변의 정보에 귀를 기울여보세요.';

  @override
  String get dailyFortuneWealth9 =>
      '풍요로운 기운이 얼굴 가득합니다. 나누는 마음이 더 큰 재물로 돌아오는 신비한 날입니다.';

  @override
  String get dailyFortuneLove0 => '입꼬리의 기운이 부드러우니, 먼저 한마디 건네면 관계가 풀립니다.';

  @override
  String get dailyFortuneLove1 => '말을 담는 입매가 정갈합니다. 진심을 짧게 전하는 것이 오해를 줄여줍니다.';

  @override
  String get dailyFortuneLove2 => '밝은 안색이 귀인의 기운을 끌어옵니다. 작은 배려가 큰 인연으로 돌아옵니다.';

  @override
  String get dailyFortuneLove3 =>
      '사람을 끄는 매력이 돋보이는 날입니다. 새로운 만남에서 긍정적인 기운을 얻겠네요.';

  @override
  String get dailyFortuneLove4 => '대인관계의 기운이 맑아 갈등이 해결되고 화합이 이루어지는 흐름입니다.';

  @override
  String get dailyFortuneLove5 => '입매의 부드러움이 상대의 마음을 엽니다. 오늘은 경청이 최고의 대화법입니다.';

  @override
  String get dailyFortuneLove6 => '주변의 도움을 받을 수 있는 상입니다. 혼자 고민하기보다 조언을 구해보세요.';

  @override
  String get dailyFortuneLove7 => '진실된 눈빛이 신뢰를 쌓습니다. 약속을 소중히 하면 더 큰 인연이 닿습니다.';

  @override
  String get dailyFortuneLove8 => '화목한 기운이 가정과 직장에 가득합니다. 웃음이 끊이지 않는 하루가 되겠네요.';

  @override
  String get dailyFortuneLove9 => '인연의 실타래가 예쁘게 풀리는 날입니다. 소중한 사람에게 고마움을 전해보세요.';

  @override
  String get dailyFortuneCareer0 => '눈빛의 총기가 예리하니, 우선순위를 좁히면 집중력이 성과로 바뀝니다.';

  @override
  String get dailyFortuneCareer1 =>
      '관찰력이 돋보이는 눈매입니다. 결정은 간단히, 실행은 꾸준히가 통하는 날입니다.';

  @override
  String get dailyFortuneCareer2 => '이마와 눈의 기운이 맑아 오늘은 맡은 일을 끝까지 마무리하는 힘이 큽니다.';

  @override
  String get dailyFortuneCareer3 => '리더십이 발휘되는 상입니다. 당신의 의견이 주변에 큰 영향력을 미치겠네요.';

  @override
  String get dailyFortuneCareer4 =>
      '판단력이 정점에 달하는 하루입니다. 복잡한 문제도 명쾌하게 해결할 수 있습니다.';

  @override
  String get dailyFortuneCareer5 =>
      '일 처리가 깔끔하여 주변의 인정을 받습니다. 승진이나 성취의 기운이 강합니다.';

  @override
  String get dailyFortuneCareer6 =>
      '새로운 프로젝트나 일을 시작하기에 최적인 기운입니다. 자신 있게 도전하세요.';

  @override
  String get dailyFortuneCareer7 =>
      '업무 효율이 비약적으로 상승하는 날입니다. 미뤄둔 일을 처리하기에 좋습니다.';

  @override
  String get dailyFortuneCareer8 =>
      '창의적인 아이디어가 솟아나는 눈빛입니다. 메모하는 습관이 행운을 가져옵니다.';

  @override
  String get dailyFortuneCareer9 =>
      '끈기와 인내가 빛을 발하는 하루입니다. 마지막까지 집중하면 큰 보람이 따릅니다.';

  @override
  String get dailyFortuneHealth0 => '전체적인 안색이 안정적이니, 리듬을 고르면 컨디션이 금방 회복됩니다.';

  @override
  String get dailyFortuneHealth1 =>
      '얼굴의 활력이 돋보입니다. 무리하지 않고 템포를 지키면 하루가 편안해집니다.';

  @override
  String get dailyFortuneHealth2 => '눈과 피부의 기운이 맑아 작은 휴식이 집중력과 기분을 함께 끌어올립니다.';

  @override
  String get dailyFortuneHealth3 =>
      '신체 리듬이 최상의 조화를 이룹니다. 가벼운 운동이 기운을 더 맑게 해줍니다.';

  @override
  String get dailyFortuneHealth4 =>
      '충전된 에너지가 얼굴 가득합니다. 오늘 하루는 지치지 않고 즐겁게 보낼 수 있습니다.';

  @override
  String get dailyFortuneHealth5 =>
      '심신의 안정이 돋보이는 상입니다. 명상이나 깊은 호흡이 운기를 더 높여줍니다.';

  @override
  String get dailyFortuneHealth6 =>
      '회복 탄력성이 좋은 날입니다. 약간의 피로도 금방 씻어낼 수 있는 활력이 있네요.';

  @override
  String get dailyFortuneHealth7 => '피부의 생기가 좋아 주변에서 건강해 보인다는 인사를 듣게 될 흐름입니다.';

  @override
  String get dailyFortuneHealth8 =>
      '절제된 식단과 휴식이 운의 근본을 튼튼하게 합니다. 몸을 아끼는 하루가 되세요.';

  @override
  String get dailyFortuneHealth9 =>
      '맑은 공기와 수분 섭취가 오늘의 보약입니다. 생기 넘치는 하루를 만끽하세요.';

  @override
  String get dailyFortuneTipWealth0 => '지출·구독·결제는 ‘지금’보다 ‘내일’ 한 번 더 확인하세요.';

  @override
  String get dailyFortuneTipWealth1 => '약속 없는 소비는 피하고, 필요한 것만 담는 게 이득입니다.';

  @override
  String get dailyFortuneTipWealth2 => '금전 관련 대화는 기록을 남기면 불필요한 손해를 막습니다.';

  @override
  String get dailyFortuneTipWealth3 => '작은 금액이라도 새는 구멍이 없는지 체크해보세요.';

  @override
  String get dailyFortuneTipWealth4 => '충동구매의 유혹이 강한 날입니다. 결제 전 10분만 고민해보세요.';

  @override
  String get dailyFortuneTipWealth5 =>
      '투자나 큰 거래는 오늘은 신중해야 합니다. 전문가의 조언을 참고하세요.';

  @override
  String get dailyFortuneTipWealth6 => '빌려준 돈이나 받아야 할 돈에 대해 명확하게 정리할 필요가 있습니다.';

  @override
  String get dailyFortuneTipWealth7 => '지갑 관리에 신경 쓰세요. 분실이나 낭비의 기운이 살짝 보입니다.';

  @override
  String get dailyFortuneTipWealth8 => '겉모습에 치중한 소비보다는 실속을 챙기는 지혜가 필요합니다.';

  @override
  String get dailyFortuneTipWealth9 =>
      '공짜를 기대하기보다 정당한 대가를 지불하는 것이 운을 지키는 길입니다.';

  @override
  String get dailyFortuneTipLove0 => '말투가 날카로워지기 쉬우니 ‘한 박자 쉬고’ 답하세요.';

  @override
  String get dailyFortuneTipLove1 => '오해가 생기면 길게 설명보다 짧게 확인이 더 좋습니다.';

  @override
  String get dailyFortuneTipLove2 => '오늘은 약속 시간을 지키는 것만으로도 신뢰가 쌓입니다.';

  @override
  String get dailyFortuneTipLove3 => '대화는 결론부터 말하면 감정 소모가 줄어듭니다.';

  @override
  String get dailyFortuneTipLove4 =>
      '가까운 사람일수록 예의를 갖추세요. 익숙함에 속아 상처를 줄 수 있습니다.';

  @override
  String get dailyFortuneTipLove5 => '비판보다는 칭찬을 먼저 건네보세요. 닫혔던 상대의 마음이 열립니다.';

  @override
  String get dailyFortuneTipLove6 =>
      '말실수가 걱정되는 날입니다. 중요한 이야기는 문자로 한 번 더 정리하세요.';

  @override
  String get dailyFortuneTipLove7 => '타인의 일에 지나치게 간섭하지 않는 것이 구설수를 막는 비책입니다.';

  @override
  String get dailyFortuneTipLove8 => '감정적인 대응보다는 이성적인 대화가 관계를 건강하게 유지해줍니다.';

  @override
  String get dailyFortuneTipLove9 => '약속을 겹치게 잡지 않도록 일정을 잘 살피세요. 신뢰가 밑천입니다.';

  @override
  String get dailyFortuneTipCareer0 => '일을 벌리기보다 ‘하나를 끝내는 것’이 운을 키웁니다.';

  @override
  String get dailyFortuneTipCareer1 => '완벽보다 마감이 먼저입니다. 오늘은 80%에서 확정하세요.';

  @override
  String get dailyFortuneTipCareer2 => '미루고 있던 한 가지를 정리하면 머리가 맑아집니다.';

  @override
  String get dailyFortuneTipCareer3 => '내가 할 일과 남의 일을 분리하면 스트레스가 줄어듭니다.';

  @override
  String get dailyFortuneTipCareer4 => '사소한 실수로 업무가 꼬일 수 있습니다. 마지막 확인을 잊지 마세요.';

  @override
  String get dailyFortuneTipCareer5 =>
      '상사나 동료와의 마찰이 예상됩니다. 의견 차이를 존중하는 자세가 필요합니다.';

  @override
  String get dailyFortuneTipCareer6 =>
      '집중력이 흐트러지기 쉬운 날입니다. 50분 일하고 10분 쉬는 리듬을 지키세요.';

  @override
  String get dailyFortuneTipCareer7 => '과도한 책임감은 독이 될 수 있습니다. 할 수 있는 만큼만 맡으세요.';

  @override
  String get dailyFortuneTipCareer8 => '공적인 일에 사적인 감정을 섞지 않도록 주의해야 하는 하루입니다.';

  @override
  String get dailyFortuneTipCareer9 => '문서나 이메일 발송 전, 수신인과 첨부파일을 다시 한 번 체크하세요.';

  @override
  String get dailyFortuneTipHealth0 => '수면·과식·카페인 과다만 피하면 컨디션이 안정됩니다.';

  @override
  String get dailyFortuneTipHealth1 => '목·어깨 긴장을 풀어주면 하루 피로가 확 줄어듭니다.';

  @override
  String get dailyFortuneTipHealth2 => '짧은 산책이 생각을 정리해주고 기운을 환기합니다.';

  @override
  String get dailyFortuneTipHealth3 => '물 한 잔, 스트레칭 1분이 운의 바닥을 받칩니다.';

  @override
  String get dailyFortuneTipHealth4 => '눈의 피로가 심해질 수 있습니다. 스마트폰 사용을 잠시 줄여보세요.';

  @override
  String get dailyFortuneTipHealth5 => '갑작스러운 활동보다는 몸을 충분히 예열한 뒤 움직이는 게 좋습니다.';

  @override
  String get dailyFortuneTipHealth6 => '기온 변화에 민감할 수 있으니 겉옷을 챙겨 체온을 조절하세요.';

  @override
  String get dailyFortuneTipHealth7 => '자극적인 음식은 오늘 피하는 것이 장 건강과 피부에 이롭습니다.';

  @override
  String get dailyFortuneTipHealth8 =>
      '충분한 수면이 최고의 보약입니다. 오늘은 평소보다 일찍 잠자리에 드세요.';

  @override
  String get dailyFortuneTipHealth9 => '스트레스가 쌓이지 않도록 좋아하는 음악이나 향기로 기분을 전환하세요.';

  @override
  String get eyeAnalysisTypeSharp =>
      '눈빛이 강렬하고 또렷하여, 순간적인 판단력과 추진력이 매우 돋보이는 상입니다.';

  @override
  String get eyeAnalysisTypeDeep =>
      '눈매가 차분하고 깊어, 신중하게 관찰하고 생각한 뒤 움직이는 현명한 상입니다.';

  @override
  String get eyeAnalysisTypeBalanced =>
      '눈의 기운이 균형 잡혀 있어, 감정과 이성을 적절히 조율하며 안정감을 주는 상입니다.';

  @override
  String get eyeExpressionBright =>
      '특히 밝은 눈빛과 미소가 어우러져, 사람을 끄는 도화(桃花)의 기운이 강하게 발현됩니다.';

  @override
  String get eyeExpressionGentle =>
      '차분한 눈매 속에 은은한 미소가 서려 있어, 외유내강형의 부드러운 카리스마가 느껴집니다.';

  @override
  String get eyeExpressionStrong =>
      '웃음기 없는 강한 눈빛은 결단력과 리더십을 상징하며, 목표를 향해 직진하는 힘이 느껴집니다.';

  @override
  String get eyeExpressionSteady =>
      '전체적으로 차분하고 진중한 분위기라, 가벼운 언행보다는 무게감 있는 태도로 신뢰를 얻습니다.';

  @override
  String get eyePostureTilt =>
      '다만 고개가 다소 기울어 있어 마음의 중심이 흔들릴 수 있으니, 정면을 응시하면 운기가 더 맑아집니다.';

  @override
  String get eyePostureStraight => '정면을 바르게 응시하는 자세가 눈의 기운을 더욱 맑고 올곧게 만들어줍니다.';

  @override
  String get noseInsufficient => '코 윤곽 측정이 충분하지 않아, 코에 대한 해석은 절제해 표시합니다.';

  @override
  String get noseWealthRich =>
      '콧망울이 두툼하고 코 길이가 길어, 재물을 모으고 지키는 \'재백궁(제물창고)\'의 기운이 아주 좋습니다.';

  @override
  String get noseWealthPlanner =>
      '코가 날렵하고 정갈하여, 재물을 꼼꼼하게 관리하고 계획적으로 불려나가는 실속파입니다.';

  @override
  String get noseWealthBalanced =>
      '코의 비율이 적당하고 균형이 잡혀 있어, 들어오는 재물을 안정적으로 유지하는 힘이 있습니다.';

  @override
  String get mouthExpressionBlessing =>
      '입을 다물고 있지만 입꼬리가 올라가 있어, 말 한마디에 복이 깃들고 주변의 호감을 사는 상입니다.';

  @override
  String get mouthExpressionReliable =>
      '입을 굳게 다문 모습에서 신뢰감과 책임감이 느껴지며, 가벼운 말보다 행동으로 보여주는 타입입니다.';

  @override
  String get mouthExpressionLucky =>
      '활짝 웃는 입매가 시원하여, 긍정적인 에너지를 발산하고 대인관계에서 행운을 불러옵니다.';

  @override
  String get supplementAlarmTitle => '영양제 챙겨드실 시간이에요! 💊';

  @override
  String get alarmVolume => '알람 볼륨';

  @override
  String get alarmTimeList => '알림 시간 목록';

  @override
  String get noAlarmTimesAdded => '추가된 알림 시간이 없습니다';

  @override
  String get alarmTimeDeleted => '알림 시간이 삭제되었습니다';

  @override
  String get addAlarmTime => '알림 시간 추가';

  @override
  String get editAlarmTime => '알림 시간 수정';

  @override
  String get defaultRingtone => '기본 벨소리';

  @override
  String get takeSupplementsNow => '영양제를 드시고 기록해주세요!';

  @override
  String get nextTime => '다음에 먹기';

  @override
  String get take => '먹기';

  @override
  String get notifications => '알림';

  @override
  String get notificationTime => '알림 시간';

  @override
  String get start => '시작';

  @override
  String get end => '종료';

  @override
  String get notificationInterval => '알림 간격';

  @override
  String get waterDrankToday => '오늘 마신 물';

  @override
  String get goal => '목표';

  @override
  String get cup => '컵';

  @override
  String get waterIntakeRecord => '물 섭취 기록';

  @override
  String get remainingAmount => '남은 양';

  @override
  String get ml => 'ml';

  @override
  String minutesFormat(String minutes) {
    return '$minutes분';
  }

  @override
  String get drinkWater => '물 마시기';

  @override
  String get supplement => '영양제';

  @override
  String get water => '수분';

  @override
  String get morning => '오전';

  @override
  String get afternoon => '오후';

  @override
  String get evening => '저녁';

  @override
  String get takeSupplement => '영양제 먹기';

  @override
  String get goalAchievedTitle => '목표 달성!';

  @override
  String get waterIntake => '수분 섭취';

  @override
  String get remindTime => '알림 시간';

  @override
  String get alarmRingtone => '알람 벨소리';

  @override
  String get snoozeTime => '알림 미루기 시간';

  @override
  String get snoozeDescription => '나중에 먹기 선택 시 기본 시간입니다';

  @override
  String get oneHour => '1시간';

  @override
  String get mouthExpressionOpen =>
      '입이 살짝 벌어져 있어 개방적이고 솔직한 성격이 보이지만, 때로는 말실수를 조심해야 합니다.';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return '오늘의 중심은 $topKey, 조심할 포인트는 $bottomKey 입니다.';
  }

  @override
  String get overallVibeWealthRich =>
      '재백궁(코)의 기운이 두툼하게 살아있어 금전적인 기회를 포착하기에 아주 좋은 안색입니다.';

  @override
  String get overallVibeWealthSteady =>
      '얼굴의 중심인 코 주변의 기운이 차분하여 실속을 챙기며 재물을 차곡차곡 모으기에 적합한 흐름입니다.';

  @override
  String get overallVibeLoveCharisma =>
      '입꼬리에서 시작된 밝은 미소가 도화의 기운을 증폭시켜, 주변에 사람이 모이고 귀인을 만날 수 있는 상입니다.';

  @override
  String get overallVibeLoveTrust =>
      '눈매의 진중함이 상대에게 깊은 신뢰를 주어, 가벼운 만남보다 깊이 있는 관계를 형성하기 좋은 날입니다.';

  @override
  String get overallVibeCareerSmart =>
      '눈빛에 서린 총명한 기운이 판단력을 높여주니, 복잡한 업무나 중요한 결정을 내리기에 최적의 상태입니다.';

  @override
  String get overallVibeCareerSteady =>
      '하관의 안정적인 기운이 끈기를 뒷받침해주어, 묵묵히 자리를 지키는 노력이 큰 성과로 이어지는 하루입니다.';

  @override
  String get overallVibeHealth =>
      '얼굴 전체에 도는 생기와 맑은 안색이 신체의 리듬이 안정적임을 보여주니, 활력을 충전하기 좋습니다.';

  @override
  String get overallActionPrudent =>
      '입을 다문 신중한 모습에서 말년의 복이 느껴집니다. 오늘은 말보다는 행동으로 실천할 때 행운이 따릅니다.';

  @override
  String get overallActionConfident =>
      '시원하게 열린 입매가 긍정적인 기운을 부릅니다. 자신감 있는 목소리로 의견을 개진하면 좋은 반응을 얻습니다.';

  @override
  String get adviceHealth0 => '컨디션 관리가 운의 바닥을 받칩니다. 오늘은 무리한 일정부터 정리하세요.';

  @override
  String get adviceHealth1 => '몸의 신호에 귀를 기울이세요. 짧은 휴식이 더 큰 성과를 가져옵니다.';

  @override
  String get adviceHealth2 => '충분한 수면과 수분 섭취만으로도 오늘의 운기가 맑아집니다.';

  @override
  String get adviceWealth0 => '돈은 들어오는 만큼 새기 쉽습니다. 지출·계약은 한 번 더 확인하세요.';

  @override
  String get adviceWealth1 => '작은 지출을 줄이는 것이 큰 재물을 모으는 시작입니다.';

  @override
  String get adviceWealth2 => '금전적인 결정은 내일로 미루는 것이 이득이 될 수 있습니다.';

  @override
  String get adviceLove0 => '말투 한 번, 표정 한 번이 인연운을 좌우합니다. 먼저 부드럽게 시작하세요.';

  @override
  String get adviceLove1 => '경청하는 자세가 상대방의 마음을 여는 열쇠가 됩니다.';

  @override
  String get adviceLove2 => '가까운 사람일수록 예의를 지키는 것이 운을 지키는 길입니다.';

  @override
  String get adviceCareer0 => '목표를 넓히기보다 \'하나를 확실히\' 잡는 날입니다. 우선순위를 줄이세요.';

  @override
  String get adviceCareer1 => '서두르지 마세요. 차근차근 진행하는 것이 가장 빠른 길입니다.';

  @override
  String get adviceCareer2 => '주변의 조언을 참고하되, 최종 결정은 본인의 직관을 믿으세요.';

  @override
  String get sajuFortune2024Gap =>
      '🌿 2024년 갑진년 갑목(甲木) 총운: \'새로운 시작과 도약의 해\'\n\n2024년은 갑목인 당신에게 \'비견(비견)\'과 \'편재(편재)\'의 기운이 들어오는 해입니다. 마치 울창한 숲속에 새로운 나무가 심어지고 넓은 땅이 펼쳐지는 형국입니다. 자신의 주관이 뚜렷해지고 새로운 일을 도모하기에 매우 좋은 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n자신감이 넘치고 추진력이 강해지는 시기입니다. 동료나 파트너와 협력하여 큰 프로젝트를 성공시킬 기회가 찾아옵니다. 창업이나 이직을 고민했다면 올해가 적기일 수 있습니다. 다만, 고집이 세질 수 있으니 주변의 의견을 경청하는 자세가 필요합니다.\n\n💰 [재물운]\n큰 재물을 만질 수 있는 기회가 찾아옵니다. 예상치 못한 횡재수나 투자 수익이 기대되는 해입니다. 하지만 나가는 돈도 많을 수 있으니 철저한 자산 관리가 필요합니다. 장기적인 안목으로 투자하는 것이 유리합니다.\n\n❤️ [연애 및 대인관계]\n대인관계가 넓어지고 새로운 인연을 맺기 좋은 시기입니다. 싱글이라면 매력적인 상대를 만날 가능성이 높고, 커플이라면 서로의 관계가 더욱 돈독해질 것입니다. 다만, 경쟁자가 나타날 수 있으니 주의가 필요합니다.\n\n⚠️ [주의사항]\n건강 면에서는 간이나 담 기능에 유의해야 하며, 스트레스 관리에 신경 써야 합니다. 또한, 지나친 자신감으로 인한 독단적인 결정은 피하는 것이 좋습니다.';

  @override
  String get sajuFortune2024Eul =>
      '🌿 2024년 갑진년 을목(乙木) 총운: \'조력자와 함께 성장하는 해\'\n\n2024년은 을목인 당신에게 \'겁재(刦財)\'와 \'정재(正財)\'의 기운이 들어오는 해입니다. 담쟁이덩굴이 큰 나무를 타고 올라가 하늘을 보는 형국입니다. 혼자보다는 주변의 도움을 받아 더 큰 성과를 거둘 수 있는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n협업과 네트워크가 중요한 시기입니다. 유능한 조력자를 만나 업무 효율이 높아지고 인정받게 됩니다. 다만, 성과를 나누어야 하는 상황이 생길 수 있으니 공정한 배분에 신경 써야 합니다. 경쟁 속에서 자신의 존재감을 드러내기에 좋은 시기입니다.\n\n💰 [재물운]\n안정적인 수입이 보장되는 해입니다. 성실하게 노력한 만큼의 대가가 따르며, 저축이나 부동산 투자에 유리한 시기입니다. 하지만 동료나 지인과의 금전 거래는 피하는 것이 좋으며, 지출 관리에 유의해야 합니다.\n\n❤️ [연애 및 대인관계]\n사람들과 어울리는 자리가 많아지며 인기가 높아집니다. 연인 관계에서는 사소한 오해가 생길 수 있으니 솔직한 대화가 필요합니다. 새로운 인연은 친구나 동료를 통해 자연스럽게 찾아올 가능성이 높습니다.\n\n⚠️ [주의사항]\n신경성 질환이나 편두통에 유의해야 합니다. 또한, 주변 사람들과의 갈등으로 인해 마음 고생을 할 수 있으니 유연한 태도를 유지하는 것이 중요합니다.';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 2024년 갑진년 병화(丙火) 총운: \'열정과 지혜가 빛나는 해\'\n\n2024년은 병화인 당신에게 \'편인(偏印)\'과 \'식신(食神)\'의 기운이 들어오는 해입니다. 태양이 숲을 비추어 생명력을 불어넣는 형국입니다. 창의적인 아이디어가 샘솟고 자신의 재능을 마음껏 발휘할 수 있는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n전문 분야에서 두각을 나타내고 독창적인 성과를 거두게 됩니다. 연구나 예술, 기술직 종사자에게 특히 유리한 해입니다. 다만, 생각이 많아져 실행력이 떨어질 수 있으니 계획을 세웠다면 바로 실천에 옮기는 노력이 필요합니다.\n\n💰 [재물운]\n자신의 재능과 아이디어가 돈으로 연결되는 시기입니다. 부업이나 취미 활동이 수익을 창출할 수도 있습니다. 다만, 문서 계약이나 투자 시에는 꼼꼼하게 검토해야 손실을 막을 수 있습니다.\n\n❤️ [연애 및 대인관계]\n말솜씨가 좋아지고 매력이 넘치는 시기입니다. 대인관계에서 주도적인 역할을 하게 되며 많은 사람의 호감을 얻게 됩니다. 연인 관계에서는 즐거운 데이트와 이벤트가 많아져 관계가 깊어집니다.\n\n⚠️ [주의사항]\n소화기 계통이나 심혈관 건강에 유의해야 합니다. 또한, 지나친 생각에 빠져 우울감을 느낄 수 있으니 야외 활동을 통해 에너지를 발산하는 것이 좋습니다.';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 2024년 갑진년 정화(丁火) 총운: \'안정 속의 내실을 다지는 해\'\n\n2024년은 정화인 당신에게 \'정인(正印)\'과 \'상관(傷官)\'의 기운이 들어오는 해입니다. 밤하늘의 등불이 숲을 밝히는 형국입니다. 학문이나 자격증 취득 등 자기 계발에 힘쓰며 내실을 다지기에 좋은 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n윗사람이나 선배의 도움으로 업무 환경이 개선되고 승진이나 영전의 기회가 찾아옵니다. 자신의 의견을 설득력 있게 전달하여 주변의 동의를 얻기에 유리한 시기입니다. 다만, 비판적인 태도로 인해 구설에 오를 수 있으니 언행에 신중해야 합니다.\n\n💰 [재물운]\n문서와 관련된 운이 좋습니다. 부동산 계약이나 자격증 취득을 통한 수익 향상이 기대됩니다. 안정적인 자산 관리에 집중하는 것이 좋으며, 충동적인 소비는 자제해야 합니다.\n\n❤️ [연애 및 대인관계]\n예의 바르고 따뜻한 모습으로 주변 사람들에게 신뢰를 얻게 됩니다. 연인 관계에서는 서로를 배려하는 마음이 커져 안정적인 만남을 이어갑니다. 결혼을 준비하기에도 좋은 해입니다.\n\n⚠️ [주의사항]\n안과 질환이나 신경 과로에 유의해야 합니다. 또한, 자신의 실력을 과시하다가 주변의 반감을 살 수 있으니 겸손한 태도를 유지하는 것이 중요합니다.';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ 2024년 갑진년 무토(戊土) 총운: \'책임감과 도전의 해\'\n\n2024년은 무토인 당신에게 \'편관(偏官)\'과 \'비견(比肩)\'의 기운이 들어오는 해입니다. 거대한 산이 숲과 어우러져 위용을 뽐내는 형국입니다. 책임져야 할 일이 많아지지만 이를 극복하며 한 단계 더 성장하는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n어려운 과업을 맡게 되거나 리더십을 발휘해야 하는 상황이 잦아집니다. 경쟁이 치열한 환경 속에서 자신의 실력을 입증할 기회가 찾아옵니다. 힘든 만큼 성취감도 클 것이니 포기하지 말고 끝까지 밀어붙이는 끈기가 필요합니다.\n\n💰 [재물운]\n지출이 다소 늘어날 수 있는 해입니다. 투자보다는 원금 보존에 힘쓰는 것이 현명하며, 주변 사람들과의 금전 관계에서 손해를 볼 수 있으니 주의해야 합니다. 장기적인 안목으로 자산 계획을 세우는 것이 중요합니다.\n\n❤️ [연애 및 대인관계]\n강한 카리스마로 이성의 주목을 받게 됩니다. 다만, 고집스러운 태도로 인해 연인과 다툼이 생길 수 있으니 상대방의 입장을 배려하는 노력이 필요합니다. 친구들과의 우정이 돈독해지는 시기입니다.\n\n⚠️ [주의사항]\n위장 질환이나 근육통 등 신체적 과로에 유의해야 합니다. 충분한 휴식과 스트레칭이 필요하며, 정신적인 압박감을 해소할 수 있는 취미를 갖는 것이 좋습니다.';

  @override
  String get sajuFortune2024Gi =>
      '🌾 2024년 갑진년 기토(己土) 총운: \'결실과 화합의 해\'\n\n2024년은 기토인 당신에게 \'정관(正官)\'과 \'겁재(刦財)\'의 기운이 들어오는 해입니다. 넓은 들판에 풍성한 나무가 자라나 결실을 맺는 형국입니다. 사회적인 지위가 올라가고 명예를 얻게 되는 기분 좋은 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n조직 내에서 인정을 받고 중요한 직책을 맡게 됩니다. 취업이나 승진 운이 매우 강한 해입니다. 규칙을 준수하고 성실하게 임한다면 기대 이상의 성과를 거둘 수 있습니다. 다만, 동료와의 경쟁에서 스트레스를 받을 수 있으니 마음의 여유를 가져야 합니다.\n\n💰 [재물운]\n안정적인 소득이 발생하고 재물이 차곡차곡 쌓이는 해입니다. 성과급이나 명예에 따른 보상이 기대됩니다. 다만, 주변 사람들에게 베풀어야 할 일이 많아져 지출이 생길 수 있으니 적절한 조절이 필요합니다.\n\n❤️ [연애 및 대인관계]\n결혼운이 강하게 들어오는 시기입니다. 싱글이라면 믿음직한 상대를 만나 진지한 관계로 발전할 수 있습니다. 대인관계에서는 원만한 소통을 통해 많은 사람의 지지를 얻게 됩니다.\n\n⚠️ [주의사항]\n비장이나 췌장 기능에 유의해야 하며, 규칙적인 식습관을 유지하는 것이 중요합니다. 또한, 남의 일에 지나치게 관여하다가 정작 자신의 실속을 챙기지 못할 수 있으니 주의하세요.';

  @override
  String get sajuFortune2024Gyeong =>
      '⚔️ 2024년 갑진년 경금(庚金) 총운: \'변화와 혁신의 해\'\n\n2024년은 경금인 당신에게 \'편재(偏財)\'와 \'편인(偏印)\'의 기운이 들어오는 해입니다. 날카로운 칼이 숲을 정리하며 새로운 길을 내는 형국입니다. 기존의 틀을 깨고 새로운 분야에 도전하여 큰 변화를 맞이하는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n새로운 사업 아이디어가 떠오르고 과감한 결단력을 발휘하게 됩니다. 해외 업무나 이동수가 강하며, 변화를 두려워하지 않는 태도가 성공의 열쇠입니다. 다만, 독단적인 행동으로 인해 조직 내에서 갈등이 생길 수 있으니 조율 능력이 필요합니다.\n\n💰 [재물운]\n재물 운의 변동 폭이 큰 해입니다. 큰 이익을 얻을 수도 있지만, 무리한 투자는 큰 손실을 부를 수 있습니다. 철저한 분석과 계획 하에 움직여야 하며, 투기성 투자는 피하는 것이 좋습니다.\n\n❤️ [연애 및 대인관계]\n새로운 사람들을 만날 기회가 많아지고 활발한 사교 활동을 하게 됩니다. 연애에 있어서는 호기심이 많아지는 시기입니다. 하지만 쉽게 달아오르고 식을 수 있으니 진중한 자세가 필요합니다.\n\n⚠️ [주의사항]\n호흡기나 대장 건강에 유의해야 합니다. 또한, 급한 성격으로 인해 사고가 발생할 수 있으니 항상 차분함을 유지하고 안전에 신경 써야 합니다.';

  @override
  String get sajuFortune2024Sin =>
      '💎 2024년 갑진년 신금(辛金) 총운: \'빛나는 보석과 명예의 해\'\n\n2024년은 신금인 당신에게 \'정재(正財)\'와 \'정인(正印)\'의 기운이 들어오는 해입니다. 보석이 숲속에서 빛을 발하며 가치를 인정받는 형국입니다. 노력에 대한 정당한 보상을 받고 명예를 드높이는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n성실함과 꼼꼼함이 빛을 발하여 주변의 신뢰를 한 몸에 받게 됩니다. 전문성을 인정받아 중요한 프로젝트의 책임자가 되거나 승진의 기쁨을 누릴 수 있습니다. 계획한 대로 일이 순조롭게 풀리는 안정적인 시기입니다.\n\n💰 [재물운]\n재물 운이 매우 안정적이고 좋습니다. 꾸준한 수입이 보장되며, 저축이나 재테크에서 좋은 결실을 맺게 됩니다. 부모님이나 윗사람으로부터 유산을 상속받거나 경제적 도움을 받을 수도 있습니다.\n\n❤️ [연애 및 대인관계]\n품격 있고 예의 바른 모습으로 이성에게 큰 매력을 어필하게 됩니다. 연인 관계에서는 서로에 대한 신뢰가 깊어져 결혼을 약속하기에 좋은 해입니다. 대인관계 역시 원만하고 평화롭습니다.\n\n⚠️ [주의사항]\n폐 건강이나 피부 질환에 유의해야 합니다. 또한, 너무 완벽을 추구하다가 스스로 스트레스를 받을 수 있으니 때로는 편안하게 마음을 먹는 것이 필요합니다.';

  @override
  String get sajuFortune2024Im =>
      '🌊 2024년 갑진년 임수(壬水) 총운: \'흐르는 물처럼 유연한 성장의 해\'\n\n2024년은 임수인 당신에게 \'식신(食神)\'과 \'편관(偏官)\'의 기운이 들어오는 해입니다. 큰 바다가 숲을 적셔 생명을 키우는 형국입니다. 지혜를 발휘하여 어려운 문제를 해결하고 자신의 영역을 넓혀가는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n창의적인 문제 해결 능력이 돋보이는 시기입니다. 어려운 상황에서도 돌파구를 찾아내어 능력을 인정받게 됩니다. 교육, 상담, 기획 분야에서 특히 좋은 성과가 기대됩니다. 다만, 과도한 업무량으로 인해 지칠 수 있으니 완급 조절이 필요합니다.\n\n💰 [재물운]\n자신의 기술이나 재능을 통해 수익을 창출하기 좋은 해입니다. 먹을 복과 재물 복이 함께 들어오는 시기입니다. 하지만 갑작스러운 지출이 생길 수 있으니 비상금을 확보해 두는 것이 현명합니다.\n\n❤️ [연애 및 대인관계]\n이해심이 넓어지고 포용력이 생겨 주변 사람들과 좋은 관계를 유지합니다. 연인 관계에서는 깊은 대화를 통해 서로의 속마음을 확인하게 됩니다. 싱글이라면 편안한 느낌의 상대를 만날 가능성이 높습니다.\n\n⚠️ [주의사항]\n신장이나 방광 계통의 건강에 유의해야 합니다. 또한, 너무 많은 일을 한꺼번에 처리하려다 건강을 해칠 수 있으니 우선순위를 정해 행동하는 것이 중요합니다.';

  @override
  String get sajuFortune2024Gye =>
      '💧 2024년 갑진년 계수(癸水) 총운: \'변화 속의 기회를 잡는 해\'\n\n2024년은 계수인 당신에게 \'상관(傷官)\'과 \'정관(正官)\'의 기운이 들어오는 해입니다. 단비가 숲을 적셔 만물을 소생시키는 형국입니다. 자신의 목소리를 높여 세상에 존재감을 알리고 새로운 기회를 포착하는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n언변이 뛰어나지고 창의적인 아이디어가 풍부해집니다. 마케팅, 홍보, 예술 분야에서 탁월한 재능을 발휘하게 됩니다. 다만, 상사나 조직의 규칙에 반발심이 생길 수 있으니 유연하게 대처하는 지혜가 필요합니다.\n\n💰 [재물운]\n돈의 흐름이 활발해지는 해입니다. 재치와 순발력을 발휘하여 수익을 올릴 수 있는 기회가 찾아옵니다. 다만, 충동적인 소비나 화려한 겉모습을 위해 지출이 커질 수 있으니 주의해야 합니다.\n\n❤️ [연애 및 대인관계]\n매력이 넘치고 화술이 좋아져 인기인이 됩니다. 연인 관계에서는 솔직한 감정 표현으로 활력을 불어넣지만, 때로는 날카로운 말로 상처를 줄 수 있으니 배려가 필요합니다.\n\n⚠️ [주의사항]\n비뇨기 질환이나 혈액 순환에 유의해야 합니다. 또한, 구설수에 오를 수 있으니 다른 사람의 험담은 피하고 항상 겸손한 언행을 유지하는 것이 좋습니다.';

  @override
  String get sajuFortune2025Gap =>
      '🌿 2025년 을사년 갑목(甲木) 총운: \'새로운 무대와 경쟁 속의 성장\'\n\n2025년은 갑목인 당신에게 \'겁재(刦財)\'와 \'식신(食神)\'의 기운이 들어오는 해입니다. 마치 숲속의 큰 나무가 덩굴(을목)과 어우러져 함께 자라나는 형국입니다. 혼자보다는 함께할 때 시너지가 나지만, 동시에 치열한 경쟁을 피할 수 없는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n활동력이 왕성해지고 표현욕구가 강해집니다. 당신의 아이디어와 재능을 세상에 널리 알릴 기회가 찾아옵니다. 프리랜서나 예체능, 영업직 종사자에게는 탁월한 성과가 기대됩니다. 다만, 동료나 경쟁자와의 관계에서 미묘한 갈등이 발생할 수 있으니, 적을 만들기보다는 협력자로 만드는 지혜가 필요합니다.\n\n💰 [재물운]\n재물 흐름은 활발하지만, 들어오는 만큼 나가는 돈도 많을 수 있습니다(겁재의 영향). 친구, 동료와의 모임이나 투자 권유로 인한 지출이 발생할 수 있으니 주의가 필요합니다. 돈을 모으기보다는 자기 계발이나 사업 확장에 투자하는 것이 장기적으로 유리할 수 있습니다.\n\n❤️ [연애 및 대인관계]\n사교성이 좋아져 새로운 사람들을 많이 만나게 됩니다. 모임이나 단체 활동에서 인기가 높아지며, 이성에게도 매력을 어필하기 좋은 시기입니다. 다만, 경쟁자가 나타날 수 있으니 마음에 드는 상대가 있다면 적극적으로 표현하는 것이 좋습니다.\n\n⚠️ [주의사항]\n지나친 승부욕은 화를 부를 수 있습니다. 또한, \'사화(巳火)\'의 역마 기운으로 인해 이동수가 많아지니 교통안전에 유의하고, 체력 관리에 신경 써야 합니다.';

  @override
  String get sajuFortune2025Eul =>
      '🌿 2025년 을사년 을목(乙木) 총운: \'자신의 색깔을 드러내는 화려한 도약\'\n\n2025년은 을목인 당신에게 \'비견(比肩)\'과 \'상관(傷官)\'의 기운이 들어오는 해입니다. 들판의 꽃들이 따스한 햇살 아래 만개하는 형국입니다. 자신의 개성과 재능을 마음껏 뽐내며 대중의 주목을 받게 되는 역동적인 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n창의성과 예술적 감각이 최고조에 달합니다. 아이디어를 기획하고 발표하는 업무에서 큰 두각을 나타내게 됩니다. 본인의 실력을 인정받아 독립하거나 새로운 프로젝트를 주도할 기회가 생깁니다. 다만, 너무 앞서가려다 기존의 규칙과 충돌할 수 있으니 조율이 필요합니다.\n\n💰 [재물운]\n재치와 실력을 바탕으로 수익을 창출하는 해입니다. 부업이나 창작 활동을 통해 예상치 못한 소득을 얻를 수 있습니다. 하지만 화려한 것을 쫓다 보니 품위 유지비나 유흥비 지출이 늘어날 수 있으니 경제적인 관념을 잃지 말아야 합니다.\n\n❤️ [연애 및 대인관계]\n매력이 넘치는 시기로, 이성들의 관심을 한 몸에 받게 됩니다. 연인 관계에서는 즐겁고 활기찬 시간을 보내지만, 때로는 자신의 고집으로 인해 다툼이 생길 수 있으니 주의하세요. 솔로라면 운명적인 만남을 기대해 봐도 좋습니다.\n\n⚠️ [주의사항]\n구설수에 오르기 쉬운 해이므로 말실수에 유의해야 합니다. 또한, 에너지를 너무 많이 소비하여 쉽게 피로해질 수 있으니 규칙적인 수면과 휴식이 필수입니다.';

  @override
  String get sajuFortune2026Gap =>
      '🌿 2026년 병오년 갑목(甲木) 총운: \'열정적으로 자신을 불태우는 해\'\n\n2026년은 갑목인 당신에게 \'식신(食神)\'과 \'상관(傷官)\'의 기운이 들어오는 해입니다. 큰 나무가 뜨거운 태양 아래 꽃을 피우고 열매를 맺기 위해 에너지를 발산하는 형국입니다. 자신의 재능을 세상에 널리 알리고 활동적으로 움직이는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n창의력이 샘솟고 표현력이 좋아집니다. 본인의 아이디어를 기획하고 추진하는 데 큰 성과가 따릅니다. 예술, 디자인, 홍보 등 창작 활동을 하는 분들에게는 최고의 해가 될 것입니다. 다만, 에너지가 너무 강해 주변과 마찰이 생길 수 있으니 겸손함이 필요합니다.\n\n💰 [재물운]\n자신의 기술과 재능을 통해 수익을 창출하는 운이 강합니다. 활동량이 많아지는 만큼 재물의 흐름도 활발해집니다. 다만, 화려한 것을 쫓거나 기분에 따라 지출을 할 수 있으니 실속을 챙기는 것이 중요합니다.\n\n❤️ [연애 및 대인관계]\n매력이 넘치는 시기로, 이성들의 관심을 많이 받게 됩니다. 연인 관계에서는 열정적이고 즐거운 시간을 보내게 됩니다. 다만, 자신의 감정을 너무 앞세우다 상대방이 부담을 느낄 수 있으니 주의하세요.\n\n⚠️ [주의사항]\n심혈관 건강이나 화상 등 뜨거운 기운과 관련된 사고에 유의해야 합니다. 또한, 너무 과도하게 에너지를 쏟아붓다 번아웃이 올 수 있으니 완급 조절이 필수입니다.';

  @override
  String get sajuFortune2026Eul =>
      '🌿 2026년 병오년 을목(乙木) 총운: \'화려하게 피어나는 성취의 해\'\n\n2026년은 을목인 당신에게 \'상관(傷官)\'과 \'식신(食神)\'의 기운이 들어오는 해입니다. 들판의 꽃들이 한여름의 햇살을 받아 만개하는 형국입니다. 자신의 존재감을 확실히 드러내고 다방면에서 재능을 인정받는 화려한 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n언변이 뛰어나지고 사교성이 좋아져 대인관계 업무에서 큰 두각을 나타냅니다. 새로운 프로젝트를 시작하거나 독립적인 활동을 하기에 유리한 시기입니다. 본인의 실력을 마음껏 뽐낼 기회가 찾아옵니다. 다만, 말실수로 인해 구설에 오를 수 있으니 언행에 각별히 유의해야 합니다.\n\n💰 [재물운]\n재치와 실력을 바탕으로 예상치 못한 수익을 올릴 수 있는 해입니다. 아이디어가 돈으로 연결되는 운이 강합니다. 하지만 충동적인 소비나 화려한 생활을 유지하기 위한 지출이 늘어날 수 있으니 주의가 필요합니다.\n\n❤️ [연애 및 대인관계]\n매력 지수가 높아져 이성에게 인기가 많아집니다. 연애 운이 활발하게 작용하여 즐거운 만남이 이어집니다. 다만, 금방 뜨거워졌다가 식을 수 있으니 진중한 만남을 원한다면 상대방을 천천히 알아가는 과정이 필요합니다.\n\n⚠️ [주의사항]\n신경 과로나 시력 건강에 유의해야 합니다. 또한, 지나친 자신감으로 주변 사람들에게 상처를 줄 수 있으니 타인의 입장을 먼저 생각하는 배려심을 갖도록 노력하세요.';

  @override
  String get sajuFortune2026Byeong =>
      '🔥 2026년 병오년 병화(丙火) 총운: \'최고의 열정과 명예의 해\'\n\n2026년은 병화인 당신에게 \'비견(比肩)\'과 \'겁재(刦財)\'의 기운이 들어오는 해입니다. 하늘에 두 개의 태양이 뜬 것처럼 강력한 에너지와 자신감이 넘치는 형국입니다. 주도권을 잡고 일을 추진하며 명예를 얻게 되는 뜨거운 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n강력한 리더십을 발휘하여 조직을 이끌게 됩니다. 경쟁이 치열한 상황에서도 압도적인 실력으로 승리하게 되는 운입니다. 본인의 의지가 관철되는 시기이며, 큰 프로젝트를 성공시켜 명성을 얻게 됩니다. 다만, 독단적인 행동은 적을 만들 수 있으니 동료들을 포용하는 자세가 필요합니다.\n\n💰 [재물운]\n재물 흐름이 매우 크고 활발합니다. 큰 돈을 벌 기회도 많지만, 경쟁으로 인해 지출되거나 동료들과 나누어야 할 돈도 많을 수 있습니다. 동업이나 금전 거래는 신중해야 하며, 확실한 이익이 보장된 곳에 투자하는 것이 현명합니다.\n\n❤️ [연애 및 대인관계]\n자신감 넘치는 모습으로 이성에게 강한 카리스마를 발휘합니다. 연인 관계에서는 주도적인 역할을 하게 되지만, 너무 고집을 부리면 다툼의 원인이 됩니다. 대인관계가 넓어지고 많은 사람의 지지를 얻게 됩니다.\n\n⚠️ [주의사항]\n고혈압이나 심장 질환 등 열과 관련된 건강에 각별히 유의해야 합니다. 또한, 지나친 승부욕으로 인해 정신적인 피로감이 클 수 있으니 명상이나 요가를 통해 마음을 다스리는 것이 좋습니다.';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 2026년 병오년 정화(丁火) 총운: \'함께 협력하며 성장하는 해\'\n\n2026년은 정화인 당신에게 \'겁재(刦財)\'와 \'비견(比肩)\'의 기운이 들어오는 해입니다. 작은 등불들이 모여 큰 불꽃을 이루듯, 주변 사람들과 힘을 합쳐 어려움을 극복하고 더 큰 목표를 향해 나아가는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n혼자보다는 팀워크가 중요한 해입니다. 동료들과의 협력을 통해 업무 효율을 높이고 시너지를 내게 됩니다. 경쟁자조차 내 편으로 만드는 포용력이 필요하며, 공동의 목표를 위해 헌신할 때 큰 성과를 거둡니다. 다만, 성과 배분 과정에서 갈등이 생기지 않도록 명확한 기준을 세워야 합니다.\n\n💰 [재물운]\n재물을 나누어야 할 상황이 생길 수 있지만, 이는 더 큰 이익을 위한 투자가 될 것입니다. 주변 사람들에게 베푸는 돈이 결국 나중에 복으로 돌아옵니다. 금전적인 면에서는 욕심을 버리고 흐름에 맡기는 것이 마음 편한 한 해가 될 것입니다.\n\n❤️ [연애 및 대인관계]\n사람들과 어울리는 자리가 많아지며 인간관계가 풍성해집니다. 연인 관계에서는 친구처럼 편안하고 즐거운 시간을 보내게 됩니다. 다만, 제3자의 개입으로 인해 오해가 생길 수 있으니 둘만의 시간을 소중히 여기세요.\n\n⚠️ [주의사항]\n안과 질환이나 두통에 유의해야 합니다. 또한, 주변 사람들의 말에 쉽게 휘둘릴 수 있으니 본인만의 주관을 잃지 않도록 노력하는 것이 중요합니다.';

  @override
  String get sajuFortune2026Mu =>
      '⛰️ 2026년 병오년 무토(戊토) 총운: \'따스한 온기로 만물을 품는 해\'\n\n2026년은 무토인 당신에게 \'편인(偏印)\'과 \'정인(正印)\'의 기운이 들어오는 해입니다. 거대한 산이 뜨거운 햇살을 받아 만물이 자라나기 좋은 환경을 만드는 형국입니다. 지혜를 얻고 내면을 채우며 주변 사람들에게 도움을 주는 따뜻한 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n학문이나 연구, 전문 기술 분야에서 깊이 있는 성취를 이룹니다. 직관력과 창의력이 좋아져 어려운 문제를 해결하는 데 탁월한 능력을 발휘합니다. 윗사람이나 스승의 도움으로 업무 환경이 개선되고 인정받게 됩니다. 다만, 너무 생각에만 잠겨 실행력이 떨어질 수 있으니 주의하세요.\n\n💰 [재물운]\n안정적인 재물 운입니다. 문서와 관련된 운이 좋아 부동산 계약이나 자격증 취득을 통한 이익이 기대됩니다. 당장의 수익보다는 장기적인 안목으로 투자하는 것이 유리합니다. 부모님이나 윗사람으로부터 경제적 지원을 받을 수도 있습니다.\n\n❤️ [연애 및 대인관계]\n차분하고 지적인 모습으로 이성에게 어필합니다. 연인 관계에서는 깊은 대화와 정서적인 교감을 통해 관계가 더욱 돈독해집니다. 대인관계에서는 고민 상담사 역할을 하며 많은 사람의 신뢰를 얻게 됩니다.\n\n⚠️ [주의사항]\n소화기 계통이나 위장 건강에 유의해야 합니다. 또한, 혼자 있는 시간이 많아지면 우울감을 느낄 수 있으니 가끔은 사람들과 어울리며 에너지를 얻는 것이 좋습니다.';

  @override
  String get sajuFortune2026Gi =>
      '🌾 2026년 병오년 기토(己土) 총운: \'노력의 결실을 맺는 따뜻한 해\'\n\n2026년은 기토인 당신에게 \'정인(正印)\'과 \'편인(偏印)\'의 기운이 들어오는 해입니다. 넓은 들판이 태양의 열기를 받아 곡식이 풍성하게 익어가는 형국입니다. 그동안의 노력이 결실을 맺고 명예와 보람을 얻게 되는 행복한 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n조직 내에서 실력을 인정받고 중요한 역할을 맡게 됩니다. 승진이나 영전 등 기분 좋은 소식이 들려오는 해입니다. 본인의 전문성을 높이기 위해 공부하거나 자격증을 따기에 아주 좋은 시기입니다. 성실함이 보상으로 돌아오니 끝까지 최선을 다하세요.\n\n💰 [재물운]\n재물 운이 매우 안정적입니다. 꾸준한 수입이 보장되며, 계획적인 소비로 자산을 잘 관리하게 됩니다. 문서 운이 좋아 집을 계약하거나 귀중한 자산을 얻게 되는 운입니다. 무리한 투자보다는 현재의 자산을 지키는 것이 유리합니다.\n\n❤️ [연애 및 대인관계]\n다정하고 따뜻한 성품으로 주변 사람들에게 인기가 많습니다. 연인 관계에서는 서로에 대한 신뢰와 애정이 깊어져 결혼을 약속하기에 아주 좋은 해입니다. 대인관계는 원만하고 평화로우며 조력자들의 도움을 많이 받게 됩니다.\n\n⚠️ [주의사항]\n비장이나 췌장 건강에 유의해야 하며, 규칙적인 생활 습관을 유지하는 것이 중요합니다. 또한, 너무 안일한 생각에 빠져 나태해질 수 있으니 적절한 긴장감을 유지하는 것이 좋습니다.';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ 2026년 병오년 경금(庚金) 총운: \'단련을 통해 보검으로 거듭나는 해\'\n\n2026년은 경금인 당신에게 \'편관(偏官)\'과 \'정관(正官)\'의 기운이 들어오는 해입니다. 단단한 원석이 뜨거운 용광로 속에서 제련되어 날카로운 보검이 되는 형국입니다. 힘든 훈련과 과정을 거치지만 결국에는 최고의 명예와 지위를 얻게 되는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n책임감이 막중해지고 어려운 과업을 수행해야 하는 시기입니다. 업무 강도가 높지만 이를 성공적으로 완수했을 때 따르는 보상은 매우 큽니다. 사회적인 지위가 올라가고 명예를 얻게 되는 운이 강합니다. 본인의 원칙을 지키며 정면 돌파하는 용기가 필요합니다.\n\n💰 [재물운]\n지출이 많을 수 있지만, 이는 본인의 명예나 사회적 활동을 위한 투자 성격이 강합니다. 당장의 이익보다는 미래를 위한 기반을 닦는 해라고 생각하세요. 규칙적인 수입은 안정적이나, 무리한 확장은 피하는 것이 좋습니다.\n\n❤️ [연애 및 대인관계]\n강한 카리스마와 책임감 있는 모습으로 이성에게 어필합니다. 연인 관계에서는 든든한 버팀목이 되어주지만, 때로는 너무 엄격하게 대할 수 있으니 부드러운 태도가 필요합니다. 대인관계에서는 공적인 업무를 통해 중요한 인맥을 쌓게 됩니다.\n\n⚠️ [주의사항]\n근골격계 질환이나 사고에 유의해야 합니다. 또한, 스트레스 지수가 높을 수 있으니 충분한 휴식과 함께 취미 생활을 통해 긴장을 풀어주는 것이 중요합니다.';

  @override
  String get sajuFortune2026Sin =>
      '💎 2026년 병오년 신금(辛金) 총운: \'화려한 조명 아래 빛나는 가치\'\n\n2026년은 신금인 당신에게 \'정관(正官)\'과 \'편관(偏官)\'의 기운이 들어오는 해입니다. 정교한 보석이 화려한 불빛 아래에서 그 진가를 드러내며 칭송받는 형국입니다. 법과 원칙을 준수하며 사회적으로 큰 명예를 얻고 지위가 상승하는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n조직 내에서 핵심적인 인물로 떠오릅니다. 승진 운이 매우 강하며, 공공기관이나 대기업과의 계약 등 공식적인 업무에서 큰 성과를 거둡니다. 본인의 깔끔한 일 처리 능력이 빛을 발하여 상사들의 전폭적인 신뢰를 받게 됩니다. 명예를 소중히 여기고 당당하게 행동하세요.\n\n💰 [재물운]\n안정적인 재운과 함께 사회적 지위에 걸맞은 대우를 받게 됩니다. 품격 있는 생활을 유지하면서도 자산을 체계적으로 관리하게 됩니다. 다만, 체면을 차리기 위해 무리하게 지출하는 것은 자제해야 합니다.\n\n❤️ [연애 및 대인관계]\n예의 바르고 세련된 모습으로 많은 이성의 호감을 얻습니다. 연인 관계에서는 서로를 존중하며 모범적인 커플로 거듭납니다. 결혼을 준비하고 있다면 주변의 축복 속에 순조롭게 진행될 것입니다.\n\n⚠️ [주의사항]\n폐나 호흡기 계통, 그리고 스트레스로 인한 피부 질환에 유의해야 합니다. 또한, 주변의 시선을 너무 의식하다 보니 본인의 속마음을 털어놓지 못해 답답할 수 있으니 진솔한 대화 상대가 필요합니다.';

  @override
  String get sajuFortune2026Im =>
      '🌊 2026년 병오년 임수(壬水) 총운: \'활동 범위가 넓어지는 역동적인 해\'\n\n2026년은 임수인 당신에게 \'편재(偏財)\'와 \'정재(正財)\'의 기운이 들어오는 해입니다. 거대한 바다가 태양의 열기를 받아 활발하게 순환하며 넓은 세상을 향해 나아가는 형국입니다. 경제적인 활동이 왕성해지고 큰 재물을 만질 수 있는 기회가 찾아오는 역동적인 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n사업적인 수완이 극대화됩니다. 새로운 시장을 개척하거나 투자에서 큰 이익을 거두기에 아주 좋은 해입니다. 활동 범위가 국내를 넘어 해외까지 넓어질 수 있는 운입니다. 과감한 결정이 큰 성과로 이어지지만, 세부적인 검토는 필수입니다.\n\n💰 [재물운]\n재물 운이 최고의 정점에 이릅니다. 예상치 못한 횡재수나 큰 규모의 사업 이익이 기대되는 해입니다. 돈의 흐름을 잘 타면 큰 자산을 형성할 수 있습니다. 다만, 돈을 벌어들이는 만큼 나가는 돈도 클 수 있으니 관리가 중요합니다.\n\n❤️ [연애 및 대인관계]\n사교성이 좋아지고 매력이 넘쳐 주변에 이성이 많이 모입니다. 활발한 연애를 즐기기에 좋은 시기입니다. 연인 관계에서는 화려한 데이트와 여행을 즐기며 행복한 시간을 보냅니다. 다만, 너무 바쁜 일정으로 연인에게 소홀해질 수 있으니 주의하세요.\n\n⚠️ [주의사항]\n신장 기능이나 혈액 순환에 유의해야 합니다. 또한, 지나친 욕심은 화를 부를 수 있으니 적당한 선에서 만족할 줄 아는 지혜가 필요합니다.';

  @override
  String get sajuFortune2026Gye =>
      '💧 2026년 병오년 계수(癸水) 총운: \'실속을 챙기며 내실을 다지는 해\'\n\n2026년은 계수인 당신에게 \'정재(正財)\'와 \'편재(偏財)\'의 기운이 들어오는 해입니다. 단비가 내린 뒤 햇살이 비추어 대지에 생명력이 가득 차고 풍요로워지는 형국입니다. 안정적인 소득을 바탕으로 경제적인 안정을 이루고 소소한 행복을 찾아가는 알찬 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n성실함과 꼼꼼함으로 맡은 일을 완벽하게 처리합니다. 재무나 회계, 관리 업무에서 탁월한 능력을 발휘하게 됩니다. 큰 욕심보다는 주어진 일에 최선을 다할 때 인정받고 보상이 따릅니다. 안정적인 환경에서 실력을 쌓으며 차근차근 성장해 나갈 수 있습니다.\n\n💰 [재물운]\n재물 운이 아주 좋습니다. 꾸준하고 안정적인 수입이 발생하며, 재테크나 저축을 통해 자산이 늘어나는 기쁨을 누리게 됩니다. 작지만 확실한 이익들이 모여 큰 보람을 줍니다. 알뜰한 소비 습관이 빛을 발하는 해입니다.\n\n❤️ [연애 및 대인관계]\n다정다감하고 세심한 배려로 연인에게 깊은 신뢰를 줍니다. 서로의 일상을 공유하며 소박하지만 따뜻한 사랑을 키워나갑니다. 대인관계 역시 원만하고 평화롭습니다. 주변 사람들에게 신뢰받는 조언자 역할을 하게 됩니다.\n\n⚠️ [주의사항]\n안과 질환이나 비뇨기 계통의 건강에 유의해야 합니다. 또한, 너무 세세한 일에 신경 쓰다 보니 정작 큰 흐름을 놓칠 수 있으니 가끔은 넓은 시야로 세상을 바라보는 연습이 필요합니다.';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 2025년 을사년 병화(丙火) 총운: \'열정이 넘치는 경쟁과 성취\'\n\n2025년은 병화인 당신에게 \'정인(正印)\'과 \'비견(比肩)\'의 기운이 들어오는 해입니다. 하늘의 태양이 땅 위의 열기와 만나 더욱 뜨겁게 타오르는 형국입니다. 강력한 지지 세력을 얻고 자신감을 바탕으로 목표를 향해 거침없이 나아가는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n든든한 조력자나 스승의 도움으로 큰 성장을 이룹니다. 자격증 취득이나 학업적 성취에 매우 유리한 해입니다. 동료들과의 협업이 빛을 발하며, 리더십을 발휘하여 팀을 성공으로 이끌게 됩니다. 다만, 과도한 경쟁심은 관계를 해칠 수 있으니 주의하세요.\n\n💰 [재물운]\n주변 사람들과 정보를 공유하며 재물을 늘려가는 시기입니다. 공동 투자나 협력을 통한 수익이 기대됩니다. 하지만 자존심 때문에 무리하게 지출을 하거나 남의 시선을 의식한 소비를 할 수 있으니 실속을 챙기는 것이 중요합니다.\n\n❤️ [연애 및 대인관계]\n사람들과 어울리는 자리가 많아지며 우정이 깊어지는 해입니다. 연인 관계에서는 친구 같은 편안함이 강해집니다. 다만, 연인보다 친구를 우선시하다가 갈등이 생길 수 있으니 적절한 균형이 필요합니다.\n\n⚠️ [주의사항]\n혈압이나 심장 건강 등 혈액 순환 계통에 유의해야 합니다. 또한, 불 같은 성격으로 인해 욱하는 감정을 조절하지 못하면 일을 그르칠 수 있으니 항상 마음의 평정을 유지하세요.';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 2025년 을사년 정화(丁火) 총운: \'변화 속에서 찾는 안정과 기회\'\n\n2025년은 정화인 당신에게 \'편인(偏印)\'과 \'겁재(刦財)\'의 기운이 들어오는 해입니다. 촛불이 바람에 흔들리지만 결국 주변을 밝히며 존재감을 드러내는 형국입니다. 예상치 못한 변화가 찾아올 수 있지만, 이를 지혜롭게 극복하며 기회로 만드는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n독창적인 아이디어와 직관력이 빛을 발합니다. 남들이 생각지 못한 틈새 시장을 공략하거나 전문적인 분야에서 깊이 있는 성과를 거두게 됩니다. 다만, 동료와의 경쟁이 치열해지고 성과를 가로채려는 사람이 있을 수 있으니 보안 유지와 대인관계 관리에 신경 써야 합니다.\n\n💰 [재물운]\n재물 운의 기복이 있을 수 있는 해입니다. 예상치 못한 지출이 발생하거나 투자에서 손실을 볼 수 있으니 보수적인 자산 관리가 필요합니다. 하지만 본인의 전문 기술을 활용한 수익은 안정적으로 들어올 것입니다. 금전 거래는 가급적 피하는 것이 좋습니다.\n\n❤️ [연애 및 대인관계]\n생각이 많아져 연애에 소극적이 될 수 있습니다. 연인 관계에서는 사소한 일에 서운함을 느끼기 쉬우니 상대방을 믿고 열린 마음으로 대하는 것이 중요합니다. 혼자만의 시간을 통해 내면을 채우는 것도 좋은 방법입니다.\n\n⚠️ [주의사항]\n스트레스로 인한 신경성 질환이나 불면증에 유의해야 합니다. 명상이나 가벼운 운동을 통해 마음을 다스리는 것이 중요하며, 부정적인 생각보다는 긍정적인 마음가짐을 갖도록 노력하세요.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ 2025년 을사년 무토(戊土) 총운: \'지혜롭게 내실을 다지는 성숙의 해\'\n\n2025년은 무토인 당신에게 \'정관(正官)\'과 \'편인(偏印)\'의 기운이 들어오는 해입니다. 거대한 산 아래 따뜻한 온기가 스며들어 만물을 품는 형국입니다. 사회적인 명예를 지키면서도 자신만의 깊이를 더해가는 내실 있는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n조직 내에서 책임 있는 위치에 오르거나 승진의 기회가 찾아옵니다. 원칙을 중시하고 성실하게 임한다면 큰 인정을 받게 됩니다. 동시에 전문 지식을 습득하거나 연구하는 업무에서 탁월한 성과를 거둡니다. 다만, 고정관념에 사로잡혀 변화를 거부할 수 있으니 유연한 사고가 필요합니다.\n\n💰 [재물운]\n안정적인 수입이 보장되는 해입니다. 성실하게 저축하고 자산을 관리하는 것이 유리합니다. 부동산이나 문서와 관련된 운이 좋으니 장기적인 투자를 고려해 볼 만합니다. 다만, 주변의 유혹에 흔들려 무리한 투자를 하는 것은 피해야 합니다.\n\n❤️ [연애 및 대인관계]\n품격 있는 언행으로 주변의 신뢰를 얻습니다. 연인 관계에서는 서로를 존중하며 진지한 관계로 발전하기 좋은 시기입니다. 결혼을 생각하고 있다면 구체적인 계획을 세워보는 것도 좋습니다.\n\n⚠️ [주의사항]\n소화기 계통이나 피부 건강에 유의해야 합니다. 또한, 생각이 너무 많아져 결정 장애를 겪을 수 있으니 중요한 일은 주변의 조언을 듣고 신속하게 결정하는 연습이 필요합니다.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 2025년 을사년 기토(己土) 총운: \'책임감 있게 목표를 달성하는 해\'\n\n2025년은 기토인 당신에게 \'편관(偏官)\'과 \'정인(正印)\'의 기운이 들어오는 해입니다. 넓은 대지에 비가 내린 뒤 햇살이 비추어 곡식이 자라나는 형국입니다. 힘든 과정이 있을 수 있지만, 결국에는 명예를 얻고 목표를 달성하는 보람찬 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n업무 강도가 높아지고 어려운 과제가 주어질 수 있습니다. 하지만 본인의 실력과 인내심으로 이를 극복하며 리더로서의 자질을 증명하게 됩니다. 윗사람의 도움이나 지원을 받아 고비를 넘기게 되며, 결과적으로는 큰 성취감을 맛보게 됩니다.\n\n💰 [재물운]\n지출 관리에 신경 써야 하는 해입니다. 예상치 못한 세금이나 공과금 등 나갈 돈이 많을 수 있습니다. 하지만 꾸준히 노력한 결과로 인센티브나 보너스를 기대할 수 있으니 성실함이 재물을 부르는 열쇠입니다.\n\n❤️ [연애 및 대인관계]\n책임감 있는 모습이 이성에게 매력적으로 다가갑니다. 연인 관계에서는 서로의 고충을 들어주고 위로하며 유대감이 깊어집니다. 다만, 바쁜 일상으로 인해 연인에게 소홀해질 수 있으니 짧게라도 자주 소통하는 노력이 필요합니다.\n\n⚠️ [주의사항]\n과로로 인한 면역력 저하에 유의해야 합니다. 규칙적인 식사와 운동으로 체력을 관리하고, 긍정적인 생각으로 스트레스를 해소하는 것이 중요합니다.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ 2025년 을사년 경금(庚金) 총운: \'실속을 챙기며 명예를 얻는 해\'\n\n2025년은 경금인 당신에게 \'정재(正財)\'와 \'편관(偏官)\'의 기운이 들어오는 해입니다. 단단한 바위가 불에 달구어져 귀한 보검으로 거듭나는 형국입니다. 노력에 대한 확실한 보상을 얻고, 사회적으로 자신의 가치를 입증하는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n결과 중심적인 사고와 추진력으로 큰 성과를 거둡니다. 특히 재무, 관리, 기술 분야에서 능력을 인정받게 됩니다. 어려운 문제를 해결하고 명예를 얻는 운이 강하지만, 그만큼 책임감도 커져 압박감을 느낄 수 있습니다. 자신을 믿고 당당하게 나아가세요.\n\n💰 [재물운]\n재물 운이 매우 좋습니다. 안정적인 소득 외에도 투자나 부업을 통해 실질적인 이익을 얻게 됩니다. 돈의 흐름을 정확히 파악하여 효율적으로 자산을 관리하게 됩니다. 다만, 명예를 위해 큰 돈을 쓰는 것은 자제해야 합니다.\n\n❤️ [연애 및 대인관계]\n성실하고 믿음직한 모습으로 이성에게 어필합니다. 연인 관계에서는 책임감 있는 태도로 상대방에게 안도감을 줍니다. 대인관계에서는 다소 엄격한 이미지를 줄 수 있으니 가끔은 부드러운 유머를 섞어 대화하는 것이 좋습니다.\n\n⚠️ [주의사항]\n뼈나 관절 건강, 그리고 호흡기 질환에 유의해야 합니다. 또한, 완벽주의 성향으로 인해 스스로를 볶아댈 수 있으니 가끔은 \'이만하면 충분하다\'는 마음으로 자신을 다독여주세요.';

  @override
  String get sajuFortune2025Sin =>
      '💎 2025년 을사년 신금(辛金) 총운: \'변화 속에서 빛나는 지혜의 해\'\n\n2025년은 신금인 당신에게 \'편재(偏財)\'와 \'정관(正관)\'의 기운이 들어오는 해입니다. 정교한 보석이 화려한 조명 아래서 그 가치를 드러내는 형국입니다. 예상치 못한 횡재수와 함께 사회적인 지위가 상승하는 즐거운 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n사업적인 수완이 좋아지고 새로운 기회를 포착하는 능력이 뛰어납니다. 과감한 도전이 큰 이익으로 돌아오는 시기입니다. 조직 내에서는 합리적인 판단으로 신뢰를 얻고 승진이나 영전의 기회를 잡게 됩니다. 다만, 너무 결과에만 치중하다가 과정을 소홀히 하지 않도록 주의하세요.\n\n💰 [재물운]\n돈 복이 들어오는 해입니다. 예상치 못한 투자 수익이나 상속 등 큰 재물을 만질 기회가 생깁니다. 하지만 들어오는 만큼 지출도 화려해질 수 있으니 계획적인 소비 습관을 유지하는 것이 중요합니다.\n\n❤️ [연애 및 대인관계]\n화려하고 매력적인 모습으로 사교 모임에서 주인공이 됩니다. 이성 운이 매우 강해 여러 사람의 대시를 받을 수 있습니다. 연인 관계에서는 열정적이고 즐거운 시간을 보내게 됩니다. 진지한 만남으로 발전시키기 좋은 해입니다.\n\n⚠️ [주의사항]\n폐 건강이나 피부 질환에 유의해야 합니다. 또한, 지나친 자신감으로 인해 주변 사람들에게 거만하게 보일 수 있으니 항상 겸손함을 유지하고 타인을 배려하는 마음을 잊지 마세요.';

  @override
  String get sajuFortune2025Im =>
      '🌊 2025년 을사년 임수(壬水) 총운: \'지혜를 발휘하여 성과를 내는 해\'\n\n2025년은 임수인 당신에게 \'상관(傷官)\'과 \'편재(偏財)\'의 기운이 들어오는 해입니다. 큰 강물이 굽이치며 넓은 들판을 적시는 역동적인 형국입니다. 본인의 재능과 화술을 발휘하여 큰 재물을 얻고 활동 범위를 넓히는 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n언변이 뛰어나지고 마케팅이나 홍보 분야에서 탁월한 성과를 거둡니다. 본인의 아이디어를 사업화하거나 새로운 시장을 개척하기에 아주 좋은 시기입니다. 창의적인 일을 하는 분들에게는 최고의 해가 될 것입니다. 다만, 상사와의 마찰이 있을 수 있으니 예의를 갖추는 것이 중요합니다.\n\n💰 [재물운]\n재물 운이 활발하게 움직입니다. 본인의 실력으로 돈을 벌어들이는 운이 강하며, 큰 돈을 굴릴 기회가 찾아옵니다. 다만, 투기적인 투자에는 주의가 필요하며, 번 만큼 주변에 베푸는 마음을 가져야 재운이 오래 유지됩니다.\n\n❤️ [연애 및 대인관계]\n유머 감각과 매력이 넘쳐 주변에 사람이 끊이지 않습니다. 이성에게 인기가 많아 즐거운 연애를 즐길 수 있는 해입니다. 연인 관계에서는 다채로운 데이트로 관계에 활력을 불어넣습니다. 다만, 가벼운 말 한마디로 오해를 살 수 있으니 신중하세요.\n\n⚠️ [주의사항]\n신장이나 비뇨기 계통의 건강에 유의해야 합니다. 또한, 너무 활동 범위가 넓어 체력이 방전될 수 있으니 적절한 휴식과 영양 섭취에 신경 써야 합니다.';

  @override
  String get sajuFortune2025Gye =>
      '💧 2025년 을사년 계수(癸水) 총운: \'안정적인 결실을 맺는 성실의 해\'\n\n2025년은 계수인 당신에게 \'식신(食神)\'과 \'정재(正財)\'의 기운이 들어오는 해입니다. 맑은 이슬비가 대지를 적셔 풍요로운 수확을 준비하는 형국입니다. 본인이 해온 노력들이 차곡차곡 쌓여 안정적인 재물과 행복으로 돌아오는 따뜻한 한 해가 될 것입니다.\n\n💼 [직장 및 사업운]\n성실함이 최고의 무기가 되는 해입니다. 맡은 바 책임을 다하여 꾸준한 성과를 내고 동료들의 신뢰를 얻게 됩니다. 전문성을 키우기에 좋은 시기이며, 본인이 좋아하는 일을 통해 보람을 느끼게 됩니다. 안정적인 환경 속에서 차근차근 성장해 나갈 수 있습니다.\n\n💰 [재물운]\n경제적으로 여유롭고 안정적인 해입니다. 꾸준한 소득이 발생하며, 알뜰하게 자산을 불려나가는 재미를 느끼게 됩니다. 먹을 복과 입을 복이 있어 생활 전반에 풍요로움이 가득합니다. 무리한 투자보다는 저축이 유리합니다.\n\n❤️ [연애 및 대인관계]\n다정다감한 모습으로 연인에게 편안함을 줍니다. 서로를 세심하게 배려하며 예쁜 사랑을 키워나가는 해입니다. 싱글이라면 대화가 잘 통하고 가치관이 비슷한 상대를 만날 확률이 높습니다.\n\n⚠️ [주의사항]\n위장 건강이나 식습관 관리에 유의해야 합니다. 너무 안락함에 안주하여 나태해질 수 있으니, 가끔은 새로운 자극을 주어 활력을 찾는 것이 좋습니다.';

  @override
  String get preparationForTomorrow => '내일을 위한 준비';

  @override
  String get howToMeetMoreLuck => '더 많은 행운을 만나는 방법';

  @override
  String get enterName => '이름을 입력해주세요';

  @override
  String fortuneDateConfirm(String date) {
    return '$date 운세를 확인하시겠습니까?';
  }

  @override
  String get colorPurple => '보라색';

  @override
  String get colorBlue => '파란색';

  @override
  String get colorYellow => '노란색';

  @override
  String get colorRed => '빨간색';

  @override
  String get colorGreen => '초록색';

  @override
  String get colorPink => '분홍색';

  @override
  String get colorOrange => '주황색';

  @override
  String get colorWhite => '하얀색';

  @override
  String get colorBlack => '검정색';

  @override
  String get itemPerfume => '향수';

  @override
  String get itemHandkerchief => '손수건';

  @override
  String get itemRing => '반지';

  @override
  String get itemWatch => '시계';

  @override
  String get itemGlasses => '안경';

  @override
  String get itemHat => '모자';

  @override
  String get itemBook => '책';

  @override
  String get itemEarphones => '이어폰';

  @override
  String get itemMirror => '거울';

  @override
  String get itemPen => '펜';

  @override
  String get itemCoin => '동전';

  @override
  String get itemKey => '열쇠';

  @override
  String get dirEast => '동쪽';

  @override
  String get dirWest => '서쪽';

  @override
  String get dirSouth => '남쪽';

  @override
  String get dirNorth => '북쪽';

  @override
  String get dirNorthEast => '북동쪽';

  @override
  String get dirSouthEast => '남동쪽';

  @override
  String get dirNorthWest => '북서쪽';

  @override
  String get dirSouthWest => '남서쪽';

  @override
  String get general => '일반';

  @override
  String get darkMode => '다크 모드';

  @override
  String get darkModeDescription => '화면을 어둡게 설정합니다.';

  @override
  String get alarmSettings => '알람 설정';

  @override
  String get privacySettings => '개인정보 설정';

  @override
  String get information => '정보';

  @override
  String get notice => '공지사항';

  @override
  String get weatherConditionSunny => '맑음';

  @override
  String get weatherConditionPartlyCloudy => '구름 조금';

  @override
  String get weatherConditionCloudy => '흐림';

  @override
  String get weatherConditionFoggy => '안개';

  @override
  String get weatherConditionDrizzle => '이슬비';

  @override
  String get weatherConditionRainy => '비';

  @override
  String get weatherConditionFreezingRain => '얼어붙는 비';

  @override
  String get weatherConditionSnowy => '눈';

  @override
  String get weatherConditionSnowGrains => '싸락눈';

  @override
  String get weatherConditionRainShowers => '소나기';

  @override
  String get weatherConditionSnowShowers => '소낙눈';

  @override
  String get weatherConditionThunderstorm => '뇌우';

  @override
  String get airQualityGood => '좋음';

  @override
  String get airQualityNormal => '보통';

  @override
  String get airQualityBad => '나쁨';

  @override
  String get airQualityVeryBad => '매우나쁨';

  @override
  String get locationUnknown => '알 수 없는 위치';

  @override
  String get locationError => '위치 오류';

  @override
  String get faq => '자주 묻는 질문';

  @override
  String get sendFeedback => '의견 보내기';

  @override
  String get feedbackDescription =>
      '포춘 알람을 사용하시면서 느낀 불편한 점이나 제안하고 싶은 기능이 있다면 언제든 말씀해 주세요.\n여러분의 소중한 의견이 더 나은 서비스를 만듭니다.';

  @override
  String get reportCopyright => '저작권 침해 신고하기';

  @override
  String get copyrightDescription =>
      '포춘 알람 내의 콘텐츠가 저작권을 침해한다고 판단되는 경우, 해당 내용을 이메일로 신고해 주시기 바랍니다.\n확인 후 즉시 조치를 취하도록 하겠습니다.';

  @override
  String get termsOfService => '이용약관';

  @override
  String get privacyPolicy =>
      '서비스 이용약관 및 개인정보 처리방침\n\n1. 총칙\n\n제1조 (목적)\n본 약관은 \'포춘 알람\'(이하 \'서비스\')이 제공하는 서비스의 이용조건 및 절차, 이용자와 개발자의 권리, 의무 및 책임사항 등 기타 필요한 사항을 규정함을 목적으로 합니다.\n\n제2조 (개인정보 처리방침)\n\n1. 개인정보 수집 항목 및 방법\n본 서비스는 회원가입 없이 이용 가능하며, 별도의 서버에 이용자의 개인정보를 저장하거나 수집하지 않습니다.\n단, 서비스 이용 과정에서 아래와 같은 정보가 생성되어 기기 내에 저장될 수 있습니다.\n- 알람 설정 정보, 미션 수행 기록, 포춘쿠키 획득 내역 등\n\n2. 기기 권한 사용 안내\n서비스 제공을 위해 다음의 권한을 최소한으로 사용합니다.\n- 알림 (필수): 알람 실행 및 포춘쿠키 알림을 위해 사용합니다.\n- 정확한 알람 및 배터리 최적화 제외 (필수): 절전 모드에서도 알람이 정시에 울리도록 보장하기 위해 사용합니다.\n- 다른 앱 위에 표시 (필수): 잠금 화면이나 다른 앱 사용 중에도 알람 화면을 띄우기 위해 사용합니다.\n- 카메라 (선택): \'사물 찍기\' 미션 수행 시에만 사용되며, 촬영된 이미지는 서버로 전송되지 않고 기기 내에서만 처리됩니다.\n\n3. 광고 서비스 및 데이터 처리\n본 서비스는 무료 제공을 위해 Google AdMob을 이용하여 광고를 송출합니다.\nGoogle은 광고 맞춤 설정을 위해 광고 식별자(ADID) 등 일부 비식별 정보를 수집할 수 있습니다.\n- Google 개인정보 처리방침: https://policies.google.com/privacy\n\n제3조 (데이터의 저장 및 삭제)\n본 서비스는 이용자의 기기에 데이터를 저장하는 로컬 방식의 앱입니다.\n앱을 삭제할 경우 기기에 저장된 모든 데이터(알람, 미션 기록 등)는 즉시 삭제되며 복구할 수 없습니다.\n\n제4조 (면책 조항)\n1. 본 서비스에서 제공하는 운세 정보는 재미를 위한 참고용이며, 그 정확성이나 신뢰성을 보증하지 않습니다.\n2. 기기의 설정 변경(알림 끄기, 배터리 최적화 등)이나 시스템 오류로 인해 알람이 울리지 않는 경우에 대해 개발자는 책임을 지지 않습니다.\n\n제5조 (문의처)\n서비스 이용 중 불편 사항이나 문의가 있으실 경우 아래 이메일로 연락 주시기 바랍니다.\n이메일: seriessnap.co@gmail.com';

  @override
  String get alarmOptimization => '알람 울림 최적화';

  @override
  String get allOptimizationsCompleted => '모든 최적화 설정 완료됨';

  @override
  String get optimizationNeeded => '정확한 알람을 위해 설정이 필요합니다.';

  @override
  String get optimizationDescription =>
      '안드로이드 시스템 설정으로 인해 알람이 지연되거나 울리지 않을 수 있습니다. 모든 항목을 허용으로 설정해주세요.';

  @override
  String get allowNotificationPermission => '알림 권한 허용';

  @override
  String get notificationPermissionDescription => '알람 발생 시 알림을 띄우기 위해 필요합니다.';

  @override
  String get excludeBatteryOptimization => '배터리 최적화 제외';

  @override
  String get batteryOptimizationDescription => '절전 모드에서도 알람이 즉시 울리도록 합니다.';

  @override
  String get allowExactAlarm => '정확한 알람 허용';

  @override
  String get exactAlarmDescription => '시스템에 의해 지연되지 않고 정시에 알람을 울립니다.';

  @override
  String get drawOverOtherApps => '다른 앱 위에 표시';

  @override
  String get overlayDescription => '잠금 화면이나 다른 앱 사용 중에도 알람 화면을 띄웁니다.';

  @override
  String get allSettingsCompleted => '모든 설정이 완료되었습니다.';

  @override
  String get allowAllItems => '모든 항목을 허용해주세요';

  @override
  String get manualSettingsInfo => '설정 해제는 안드로이드 시스템 설정에서 직접 하실 수 있습니다.';

  @override
  String get takePhoto => '촬영하기';

  @override
  String get selectPhoto => '선택하기';

  @override
  String get selectAlarmBackground => '알람 배경화면 선택';

  @override
  String get defaultLabel => '기본';

  @override
  String get howToAdd => '추가 방법';

  @override
  String get addAssetInstructions =>
      'assets/images/ 폴더에 이미지를 넣고 pubspec.yaml에 등록하세요.';

  @override
  String get ringingNow => '지금 울려요';

  @override
  String get setTime => '시간 설정';

  @override
  String get repeatDays => '반복 요일';

  @override
  String get repeatDaily => '매일 반복';

  @override
  String get snoozeSettings => '알람 미루기';

  @override
  String get wakeUpAlarm => '기상 알람';

  @override
  String get daySun => '일';

  @override
  String get dayMon => '월';

  @override
  String get dayTue => '화';

  @override
  String get dayWed => '수';

  @override
  String get dayThu => '목';

  @override
  String get dayFri => '금';

  @override
  String get daySat => '토';

  @override
  String get daySunFull => '일요일';

  @override
  String get dayMonFull => '월요일';

  @override
  String get dayTueFull => '화요일';

  @override
  String get dayWedFull => '수요일';

  @override
  String get dayThuFull => '목요일';

  @override
  String get dayFriFull => '금요일';

  @override
  String get daySatFull => '토요일';

  @override
  String get missionRewardEarned => '오늘의 미션 5개를 완료하여\n포춘쿠키 1개를 획득했습니다!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return '오늘의 미션 $missions개를 완료하여\n포춘쿠키 $cookies개를 획득했습니다!';
  }

  @override
  String daysCount(int count) {
    return '$count일';
  }

  @override
  String get user => '사용자';

  @override
  String get member => '회원';

  @override
  String get manageSajuInfo => '사주정보 관리';

  @override
  String get freeCharge => '무료충전';

  @override
  String get fortunePass => '포춘패스';

  @override
  String get unlimitedNotSubscribed => '무제한 미구독';

  @override
  String get unlimitedInUse => '무제한 이용 중';

  @override
  String get subscribe => '구독하기';

  @override
  String get manageSubscription => '구독 관리';

  @override
  String get purchaseHistory => '구매내역';

  @override
  String get customerCenter => '고객센터';

  @override
  String get noNewNotifications => '새로운 알림이 없습니다.';

  @override
  String get noPurchaseHistory => '구매 내역이 없습니다.';

  @override
  String get none => '없음';

  @override
  String deleteConfirmMessage(String title) {
    return '\"$title\"을(를) 삭제할까요?';
  }

  @override
  String get delete => '삭제';

  @override
  String get notepad => '메모장';

  @override
  String get today => '오늘';

  @override
  String get yearView => '연';

  @override
  String get monthView => '월';

  @override
  String get weekView => '주';

  @override
  String get dayView => '일';

  @override
  String get noEvents => '일정이 없습니다.';

  @override
  String get calendarDragGuide => '아래로 드래그하면 상세 캘린더를 볼 수 있습니다.';

  @override
  String get noSavedMemos => '저장된 메모나 일정이 없습니다.';

  @override
  String get holiday => '공휴일';

  @override
  String get photo => '사진';

  @override
  String get drawing => '그림';

  @override
  String get drawingTitle => '필기';

  @override
  String get pencil => '연필';

  @override
  String get marker => '사인펜';

  @override
  String get eraser => '지우개';

  @override
  String adjustThickness(String label) {
    return '$label 두께 조절';
  }

  @override
  String get sticker => '스티커';

  @override
  String get event => '일정';

  @override
  String get memo => '메모';

  @override
  String get routineExercise => '운동';

  @override
  String get routineHiking => '등산';

  @override
  String get routineCleaning => '대청소';

  @override
  String get routineTravel => '여행';

  @override
  String get routineDate => '데이트';

  @override
  String get routineConcert => '콘서트';

  @override
  String get routineMovie => '영화관람';

  @override
  String get routineMeeting => '모임';

  @override
  String get howIsYourMoodToday => '오늘 기분은?';

  @override
  String get complete => '완료';

  @override
  String get amWithIcon => '☀️ 오전';

  @override
  String get pmWithIcon => '🌙 오후';

  @override
  String get photoPermissionDescription => '사진을 추가하려면 설정에서 사진 접근 권한을 허용해야 합니다.';

  @override
  String get goToSettings => '설정으로 이동';

  @override
  String get photoPermissionNeeded => '사진 접근 권한이 필요합니다.';

  @override
  String get fontSize => '글자 크기';

  @override
  String get fontFamily => '글꼴';

  @override
  String get textColor => '글자 색상';

  @override
  String get textAlign => '정렬';

  @override
  String get alignLeft => '왼쪽';

  @override
  String get alignCenter => '가운데';

  @override
  String get alignRight => '오른쪽';

  @override
  String get edit => '편집';

  @override
  String get fontSettings => '글꼴 설정';

  @override
  String get imageAddedFromKeyboard => '키보드에서 이미지가 추가되었습니다.';

  @override
  String get cancelWriting => '작성 취소';

  @override
  String get cancelWritingConfirm => '작성 중인 내용이 있습니다. 작성을 취소하고 나가시겠습니까?';

  @override
  String get continueWriting => '계속 작성';

  @override
  String get title => '제목';

  @override
  String get content => '내용';

  @override
  String get selectTime => '시간 선택';

  @override
  String get noTime => '시간 없음';

  @override
  String minutesLater(String minutes) {
    return '$minutes분 후';
  }

  @override
  String get countLabel => '횟수';

  @override
  String timesCount(String count) {
    return '총 $count회';
  }

  @override
  String get wakeUpMission => '기상 미션';

  @override
  String get alarmSound => '알람 소리';

  @override
  String get gradualVolume => '점점 커지게';

  @override
  String get vibration => '진동';

  @override
  String get alarmNameAndBackground => '알람 이름 및 배경';

  @override
  String get customStyle => '커스텀 스타일';

  @override
  String get alarmName => '알람 이름';

  @override
  String get enterAlarmName => '알람 이름을 입력해주세요';

  @override
  String get routineSummary => '루틴 요약';

  @override
  String get alarmOn => '알람 ON';

  @override
  String get alarmOff => '알람 OFF';

  @override
  String get contentHint => '내용을 추가해 주세요';

  @override
  String get addEvent => '일정 추가';

  @override
  String get manageItem => '항목 관리';

  @override
  String get manageItemDescription => '이 항목을 어떻게 하시겠습니까?';

  @override
  String get noTitle => '제목없음';

  @override
  String get selectTitleColor => '제목 색상 선택';

  @override
  String get save => '저장';

  @override
  String get missionNone => '미션 없음';

  @override
  String get missionSnap => '촬영 미션';

  @override
  String get missionMath => '계산 미션';

  @override
  String get missionFortune => '운세 미션';

  @override
  String get missionShake => '쉐이크 미션';

  @override
  String get missionFortuneCatch => '포춘 캐치 미션';

  @override
  String get missionNoDescription => '미션 없이 알람이 울립니다.';

  @override
  String get missionCameraDescription => '지정된 사물을 촬영하여 알람을 해제합니다.';

  @override
  String get missionMathDescription => '수학 문제를 풀어 뇌를 깨웁니다.';

  @override
  String get missionFortuneDescription => '알람을 해제하고 오늘의 운세를 확인합니다.';

  @override
  String get missionShakeDescription => '핸드폰을 흔들어야 알람이 꺼집니다.';

  @override
  String get missionFortuneCatchDescription => '포츄니를 터치하여 100점 이상을 획득하세요!';

  @override
  String get missionWalk => '걷기 미션';

  @override
  String get missionWalkDescription => '걸어서 알람을 끄세요!';

  @override
  String get missionFaceDescription => '5초간 화면을 응시하여 관상을 확인하세요.';

  @override
  String get walkStepCount => '목표 걸음 수';

  @override
  String walkSteps(int count) {
    return '$count 걸음';
  }

  @override
  String get missionNumberOrder => '숫자 순서 미션';

  @override
  String get missionNumberOrderDescription => '1부터 9까지 순서대로 터치하세요.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return '다음: $nextNumber';
  }

  @override
  String get missionHiddenButton => '패턴 기억 미션';

  @override
  String get missionHiddenButtonDescription => '밝아지는 칸의 위치를 순서대로 기억하고 터치하세요.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => '터치 연타 미션';

  @override
  String get missionTapSprintDescriptionShort => '연타로 게이지를 채우세요.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return '$goalTaps회 이상 터치해 게이지를 채우세요.';
  }

  @override
  String get missionTapSprintTapHere => '터치!';

  @override
  String get missionTapSprintHint => '빠르게 채우고, 잠시 멈추면 조금 줄어들어요.';

  @override
  String get missionLeftRight => '좌우 선택 미션';

  @override
  String get missionLeftRightDescriptionShort => '지시에 맞게 좌/우를 선택하세요.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return '$targetStreak회 연속 성공하면 완료돼요.';
  }

  @override
  String get missionLeftRightPromptLeft => '왼쪽을 누르세요';

  @override
  String get missionLeftRightPromptRight => '오른쪽을 누르세요';

  @override
  String get left => '왼쪽';

  @override
  String get right => '오른쪽';

  @override
  String get missionHintInactivity => '2분 동안 입력이 없으면 초기화돼요.';

  @override
  String fortuneCatchScore(int score) {
    return '점수: $score';
  }

  @override
  String get fortuneCatchGoal => '목표: 100점';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(잡은 횟수: $count/$min)';
  }

  @override
  String fortuneCatchTime(int seconds) {
    return '진행 시간: $seconds초';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return '최고: $seconds초';
  }

  @override
  String get fortuneCatchAngryHint => '화난 포츄니는 감점!';

  @override
  String get fortuneCatchInstruction => '화난 포츄니를 피해서 잡으세요!';

  @override
  String fortuneCatchPointMinus(int points) {
    return '감점 $points점';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points점';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo 콤보!';
  }

  @override
  String get difficulty => '난이도';

  @override
  String get difficultyEasy => '쉬움';

  @override
  String get difficultyNormal => '보통';

  @override
  String get difficultyHard => '어려움';

  @override
  String get problemCount => '문제 수';

  @override
  String problemsCount(int count) {
    return '$count문제';
  }

  @override
  String missionAnalyzing(int index, int total) {
    return '미션 $index/$total 분석 중...';
  }

  @override
  String missionPointObject(int index, int total) {
    return '미션 $index/$total: 가이드 속 물체를 화면에 비춰주세요.';
  }

  @override
  String get missionPointSink => '세면대를 비춰주세요.';

  @override
  String get missionPointRefrigerator => '냉장고를 비춰주세요.';

  @override
  String get missionPointScale => '체중계를 비춰주세요.';

  @override
  String get missionPointFace => '얼굴을 화면에 비춰주세요.';

  @override
  String get missionPointObjectGeneric => '지정된 물체를 비춰주세요.';

  @override
  String get missionRecognizeObject => '사물을 인식시켜주세요.';

  @override
  String get missionPerform => '미션을 수행해주세요.';

  @override
  String get initError => '초기화 중 오류가 발생했습니다.';

  @override
  String get analyzingNextTarget => '다음 목표 분석 중...';

  @override
  String get errorOccurredGeneric => '오류 발생';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total 성공!';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total 성공! 매칭 성공!';
  }

  @override
  String get escape => '탈출';

  @override
  String get pointObjectClearly => '목표물이 잘 보이게 찍으세요';

  @override
  String get matchingSuccess => '매칭 성공!';

  @override
  String get missionComplete => '미션 완료!';

  @override
  String get allMissionsComplete => '모든 미션 완료!';

  @override
  String missionSnoozeMessage(String minutes) {
    return '미션 성공! 하지만 설정에 따라 $minutes분 뒤 다시 울립니다.';
  }

  @override
  String get showFace => '얼굴을 보여주세요';

  @override
  String get keepWatching => '화면을 계속 응시하세요';

  @override
  String get recognizingFaceForFortune => '관상 분석을 위해 얼굴을 인식 중입니다';

  @override
  String get dataNotStored => '데이터는 저장되지 않습니다';

  @override
  String get solveProblem => '문제를 풀어주세요.';

  @override
  String get correctAnswer => '정답입니다!';

  @override
  String get wrongAnswerRetry => '틀렸습니다. 다시 시도하세요.';

  @override
  String get correct => '정답!';

  @override
  String get walkToDismiss => '스마트폰을 들고 걸어주세요';

  @override
  String get shakeCount => '흔들기 횟수';

  @override
  String shakeTimes(int count) {
    return '$count회';
  }

  @override
  String tapTimes(int count) {
    return '$count회 탭';
  }

  @override
  String missionNumber(int number) {
    return '미션 $number';
  }

  @override
  String get soundBirds => '새소리';

  @override
  String get shakeCountLabel => '흔들기 횟수';

  @override
  String missionIndex(int index) {
    return '미션 $index';
  }

  @override
  String get ringtoneSelect => '벨소리 선택';

  @override
  String get vibrationSelect => '진동 패턴 선택';

  @override
  String get selectMissionTitle => '알람 해제 미션을 선택해주세요.';

  @override
  String get ringtoneCategoryStandard => '기본음';

  @override
  String get ringtoneCategoryCalm => '차분한';

  @override
  String get ringtoneCategoryUpbeat => '활기찬';

  @override
  String get ringtoneCategoryLoud => '시끄러운';

  @override
  String get noRingtones => '벨소리가 없습니다.';

  @override
  String get photoPermissionRequired => '사진 접근 권한이 필요합니다.';

  @override
  String get deleteImage => '이미지 삭제';

  @override
  String get longPressToDelete => '길게 눌러 삭제할 수 있어요.';

  @override
  String get videoLoadFail => '영상 불러오기 실패\n탭해서 다시 시도';

  @override
  String get existingCapturedImages => '기존 촬영 이미지';

  @override
  String deleteCount(int count) {
    return '$count개 삭제';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return '$count개의 이미지를 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get classicAlarm => '클래식 알람';

  @override
  String get digitalAlarm => '디지털 알람';

  @override
  String get birdsSound => '새소리';

  @override
  String get wavesSound => '파도 소리';

  @override
  String get cuckooClock => '뻐꾸기 시계';

  @override
  String get calmAlarm => '차분한 알람';

  @override
  String get doorKnock => '노크 소리';

  @override
  String get earlySunrise => '이른 일출';

  @override
  String get goodMorningSound => '굿모닝';

  @override
  String get inAHurry => '서둘러요';

  @override
  String get lovingYou => '러빙 유';

  @override
  String get sirenSound => '사이렌';

  @override
  String get swingingSound => '스윙';

  @override
  String get telephoneBusy => '전화 신호음';

  @override
  String get shortVibration => '짧게 반복';

  @override
  String get longVibration => '길게 반복';

  @override
  String get heartbeatVibration => '심장 박동';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => '빠른 박동';

  @override
  String get exactAlarmPermissionDesc =>
      '알람을 정확한 시간에 울리기 위해 \"스케줄 및 리마인더\" 권한이 필요합니다.';

  @override
  String get batteryOptimizationPermissionDesc =>
      '알람이 정시에 울리려면 배터리 최적화를 해제해야 합니다.';

  @override
  String get overlayPermissionDesc =>
      '알람 실행 시 미션 화면을 띄우기 위해 \"다른 앱 위에 표시\" 권한이 필요합니다.';

  @override
  String get cameraMissionFirstImageError => '적어도 첫 번째 미션 이미지는 설정해주세요.';

  @override
  String get retry => '다시 시도';

  @override
  String get exactAlarmPermissionFail =>
      '알람 등록에 실패했습니다. 정확한 알람 권한이 꺼져있어 설정이 필요합니다.';

  @override
  String get batteryOptimizationPermissionFail =>
      '알람 등록에 실패했습니다. 배터리 최적화 예외 권한이 없어 설정이 필요합니다.';

  @override
  String get overlayPermissionFail =>
      '알람 등록에 실패했습니다. 다른 앱 위에 표시 권한이 없어 설정이 필요합니다.';

  @override
  String get unknownAlarmError => '알람 등록 실패. 알 수 없는 오류가 발생했습니다.';

  @override
  String get resetTooltip => '초기화';

  @override
  String get errorLoadingAlarm => '알람 정보를 불러오지 못했습니다.';

  @override
  String get alarmNotFound => '알람 정보를 찾을 수 없습니다.';

  @override
  String repeatAlarmCount(int current, int max) {
    return '알람 미루기 ($current/$max)';
  }

  @override
  String get turnOffAlarm => '알람 끄기';

  @override
  String get startMission => '미션 시작';

  @override
  String get alarmSnooze => '알람 미루기';

  @override
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes분 (무제한)';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes분 ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => '설레는 하루';

  @override
  String get ringtone_cozy_day => '포근한 하루';

  @override
  String get ringtone_sensible_day => '감각적인 하루';

  @override
  String get ringtone_play_with_me => '나랑 놀자';

  @override
  String get ringtone_refreshing_day => '산뜻한 하루';

  @override
  String get ringtone_new_beginning => '새로운 시작';

  @override
  String get ringtone_self_love => '자아도취';

  @override
  String get cherry_stained_finger => '체리빛 손가락';

  @override
  String get dancing_in_the_stars => '별빛 속의 춤';

  @override
  String get nice_day => '좋은 날';

  @override
  String get fortuneTitle => '운세 확인하기';

  @override
  String get fortuneMessage => '운세 결과를 확인하고\n숨겨진 선물도 받아 가요!';

  @override
  String get fortuneAdButton => '광고 보고 결과 확인';

  @override
  String get fortuneLoadingMessage => '특별한 타로 해석을 경험해보세요.';

  @override
  String fortuneAnalyzing(int progress) {
    return '선택한 타로를 분석하고 있어요... $progress%';
  }

  @override
  String get fortuneSelectTitle => '오늘의 기운을 생각하며\n카드 3장을 선택해주세요.';

  @override
  String fortuneSelectTitleDate(String month, int day) {
    return '$month월 $day일의 기운을 생각하며\n카드 3장을 선택해주세요.';
  }

  @override
  String get fortuneNewYearButton => '2026 신년운세 보기';

  @override
  String get loveFortune => '애정운';

  @override
  String get wealthFortune => '재물운';

  @override
  String get successFortune => '성공운';

  @override
  String get fortuneResultTitle => '오늘의 운세 결과입니다.';

  @override
  String fortuneResultTitleDate(int year, String month, int day) {
    return '$year년 $month월 $day일의 운세';
  }

  @override
  String get startDayButton => '오늘 하루 시작하기';

  @override
  String get tarotName0 => '광대';

  @override
  String get tarotName1 => '마법사';

  @override
  String get tarotName2 => '고위 여사제';

  @override
  String get tarotName3 => '여황제';

  @override
  String get tarotName4 => '황제';

  @override
  String get tarotName5 => '교황';

  @override
  String get tarotName6 => '연인';

  @override
  String get tarotName7 => '전차';

  @override
  String get tarotName8 => '힘';

  @override
  String get tarotName9 => '은둔자';

  @override
  String get tarotName10 => '운명의 수레바퀴';

  @override
  String get tarotName11 => '정의';

  @override
  String get tarotName12 => '매달린 사람';

  @override
  String get tarotName13 => '죽음';

  @override
  String get tarotName14 => '절제';

  @override
  String get tarotName15 => '악마';

  @override
  String get tarotName16 => '탑';

  @override
  String get tarotName17 => '별';

  @override
  String get tarotName18 => '달';

  @override
  String get tarotName19 => '태양';

  @override
  String get tarotName20 => '심판';

  @override
  String get tarotName21 => '세계';

  @override
  String get tarotKeywords0 => '새로운 시작, 모험, 순수, 자유, 무모함';

  @override
  String get tarotDesc0 =>
      '광대는 화려한 옷을 입고 절벽 끝에 위태롭게 서 있지만, 시선은 먼 곳을 향해 희망에 차 있습니다. 작은 강아지가 그를 따르며 경고하듯 짖고 있습니다. 이는 현실적인 위험을 고려하지 않는 순수한 열정과 새로운 여정의 시작을 상징합니다.';

  @override
  String get tarotLoveMeaning0 =>
      '예기치 못한 새로운 사랑이 찾아오거나 첫눈에 반하는 운명적인 만남이 있을 수 있습니다.';

  @override
  String get tarotLoveDetail0 =>
      '마치 어린아이와 같은 순수한 마음으로 사랑을 시작할 수 있는 시기입니다. 과거의 상처나 복잡한 조건들은 모두 잊고, 지금 이 순간의 감정에 충실해보세요. 예기치 못한 곳에서 새로운 인연이 나타나거나 첫눈에 반하는 설레는 경험을 하게 될 수 있습니다.';

  @override
  String get tarotWealthMeaning0 =>
      '새로운 투자처나 사업 아이템이 눈에 들어올 수 있습니다. 돈에 얽매이지 않고 즐겁게 일할 때 수익이 따라오는 시기입니다.';

  @override
  String get tarotWealthDetail0 =>
      '금전적으로 새로운 기회가 열리는 시기입니다. 남들이 시도하지 않은 창의적인 아이템에 투자하거나 새로운 분야에 도전한다면 의외의 성과를 거둘 수 있습니다. 다만 무모한 지출은 피하고, 즐겁게 일하는 과정에서 자연스럽게 수익이 따라오도록 유도하세요.';

  @override
  String get tarotSuccessMeaning0 => '새로운 프로젝트를 시작하거나 전혀 다른 분야로 이직하기 좋은 시기입니다.';

  @override
  String get tarotSuccessDetail0 =>
      '새로운 프로젝트를 시작하거나 전혀 다른 분야로 이직하기에 가장 적합한 때입니다. 실패에 대한 두려움보다는 설렘을 가지고 과감하게 첫발을 내딛으세요. 당신의 순수한 열정이 주변에 긍정적인 영향을 주어 새로운 길을 열어줄 것입니다.';

  @override
  String get tarotKeywords1 => '창조, 의지, 능력, 실현, 다재다능';

  @override
  String get tarotDesc1 =>
      '마법사는 붉은 로브를 입고 한 손은 하늘을, 다른 한 손은 땅을 가리키며 천상의 힘을 지상으로 가져오고 있습니다.';

  @override
  String get tarotLoveMeaning1 => '당신의 매력이 최고조에 달해 이성에게 인기가 많아지는 시기입니다.';

  @override
  String get tarotLoveDetail1 =>
      '당신이 가진 매력과 재능이 빛을 발하여 이성의 마음을 사로잡을 수 있는 절호의 기회입니다. 마음에 드는 상대가 있다면 망설이지 말고 적극적으로 다가가세요. 당신의 유머 감각과 센스 있는 대화가 상대방을 즐겁게 하고, 관계를 주도적으로 이끌어갈 수 있습니다. 자신감을 가지고 사랑을 쟁취하세요.';

  @override
  String get tarotWealthMeaning1 => '당신의 능력과 기술을 활용하여 수익을 창출할 수 있는 적기입니다.';

  @override
  String get tarotWealthDetail1 =>
      '당신이 가진 지식, 기술, 아이디어가 곧 돈이 되는 시기입니다. 단순히 월급을 받는 것에 만족하지 말고, 부업이나 투잡 등을 통해 추가 수익을 창출해보세요. 창의적인 기획이나 영업 능력이 탁월하게 발휘되어 기대 이상의 수익을 올릴 수 있습니다.';

  @override
  String get tarotSuccessMeaning1 => '업무 능력이 탁월하게 발휘되어 주변의 인정을 받습니다.';

  @override
  String get tarotSuccessDetail1 =>
      '직장이나 학업에서 당신의 능력을 십분 발휘하여 두각을 나타낼 수 있습니다. 어떤 문제가 닥쳐도 당신만의 기지와 재치로 해결해낼 수 있으며, 주변 동료들이나 상사에게 \'능력자\'로 인정받게 됩니다. 자신을 믿고 당당하게 실력을 보여주세요.';

  @override
  String get tarotKeywords2 => '직관, 지혜, 신비, 비밀, 플라토닉';

  @override
  String get tarotDesc2 =>
      '신비로운 베일 뒤에 앉아 있는 여사제는 손에 지혜의 두루마리를 들고 균형을 잡으며 깊은 통찰력을 상징합니다.';

  @override
  String get tarotLoveMeaning2 => '정신적인 교감이 중요한 플라토닉한 사랑을 의미합니다.';

  @override
  String get tarotLoveDetail2 =>
      '육체적인 매력보다는 정신적인 깊이와 대화가 통하는 사람에게 끌리게 됩니다. 상대방의 마음을 꿰뚫어 보는 직관력이 발달하여 말하지 않아도 서로의 감정을 이해할 수 있습니다. 하지만 너무 신중한 태도는 오해를 줄 수 있으니 가끔은 솔직하게 마음을 표현해보세요.';

  @override
  String get tarotWealthMeaning2 =>
      '지금은 적극적으로 투자하기보다는 자산을 지키고 상황을 관망해야 할 때입니다.';

  @override
  String get tarotWealthDetail2 =>
      '눈앞의 이익을 쫓아 섣불리 움직이기보다는 냉철하게 시장 상황을 분석하고 공부해야 할 시기입니다. 지금은 씨앗을 뿌리고 기다리는 시기이므로, 당장의 수익이 나지 않는다고 조급해하지 마세요. 부동산이나 주식 등 장기적인 관점에서의 투자를 고려하는 것이 좋습니다.';

  @override
  String get tarotSuccessMeaning2 => '학업, 연구, 전문직 분야에서 좋은 성과를 낼 수 있습니다.';

  @override
  String get tarotSuccessDetail2 =>
      '겉으로 화려하게 드러나는 성과보다는 내실을 다지고 실력을 키우는 데 집중해야 합니다. 연구, 기획, 분석 등 깊이 있는 사고가 필요한 업무에서 탁월한 성과를 낼 수 있습니다. 당신의 지혜롭고 신중한 태도는 결정적인 순간에 문제 해결의 열쇠가 될 것입니다.';

  @override
  String get tarotKeywords3 => '풍요, 모성, 자연, 아름다움, 결실';

  @override
  String get tarotDesc3 => '풍요로운 자연 속에서 편안하게 앉아 있는 여황제는 물질적, 정신적 풍요의 상징입니다.';

  @override
  String get tarotLoveMeaning3 => '사랑이 넘치고 관계가 더욱 깊어지는 시기입니다.';

  @override
  String get tarotLoveDetail3 =>
      '당신의 여성스러운(또는 포용적인) 매력이 극대화되어 이성에게 매우 매력적으로 비치는 시기입니다. 연애 중이라면 상대방을 따뜻하게 감싸주고 챙겨주는 모습에서 큰 사랑을 받게 되며, 결혼 얘기가 오갈 수 있습니다. 솔로라면 외모를 가꾸거나 스타일을 변화시켜보는 것이 연애운을 높이는 데 큰 도움이 됩니다.';

  @override
  String get tarotWealthMeaning3 => '물질적으로 매우 풍요롭고 안정적인 시기입니다.';

  @override
  String get tarotWealthDetail3 =>
      '재물운이 활짝 피어나는 시기입니다. 노력한 만큼, 아니 그 이상의 보상이 따르며 경제적으로 여유를 만끽할 수 있습니다. 사업이나 투자에서 기대 이상의 수익을 거두거나, 뜻밖의 보너스나 선물을 받을 수도 있습니다. 풍요로운 에너지를 주변 사람들과 나누면 더 큰 행운이 찾아올 것입니다.';

  @override
  String get tarotSuccessMeaning3 => '진행 중인 프로젝트가 순조롭게 성장하여 좋은 성과를 냅니다.';

  @override
  String get tarotSuccessDetail3 =>
      '일의 결과가 눈에 보이게 나타나는 시기입니다. 프로젝트가 성공적으로 마무리되어 성과급을 받거나 승진의 기회를 잡을 수 있습니다. 특히 미적 감각이나 창의력이 필요한 분야에서 당신의 재능이 빛을 발합니다. 여유를 가지고 과정을 즐기면서 일하는 것이 오히려 더 좋은 결과를 가져다줄 것입니다.';

  @override
  String get tarotKeywords4 => '권위, 구조, 안정, 리더십, 책임감';

  @override
  String get tarotDesc4 => '딱딱한 돌좌에 앉은 황제는 갑옷을 입고 확고한 지배력과 질서를 상징합니다.';

  @override
  String get tarotLoveMeaning4 => '신뢰할 수 있고 책임감 있는 상대와의 안정적인 연애를 의미합니다.';

  @override
  String get tarotLoveDetail4 =>
      '불타오르는 열정보다는 신뢰와 안정을 바탕으로 한 관계가 지속됩니다. 상대방이 당신을 든든하게 지켜주고 이끌어줄 것입니다. 다만, 너무 통제하려 들거나 고집을 피우지 않도록 주의하세요. 솔로라면 능력 있고 사회적 지위가 있는 사람을 만날 기회가 생길 것입니다.';

  @override
  String get tarotWealthMeaning4 => '체계적인 자산 관리로 안정적인 부를 축적할 수 있습니다.';

  @override
  String get tarotWealthDetail4 =>
      '금전 관리에 있어서 원칙과 계획을 세우는 것이 중요합니다. 일확천금을 노리는 투기보다는 적금, 부동산 등 안전하고 확실한 자산에 투자하여 기반을 다지는 것이 좋습니다. 당신의 현실적인 판단력과 추진력이 부를 축적하는 데 큰 도움이 될 것입니다.';

  @override
  String get tarotSuccessMeaning4 => '직장에서 승진하거나 리더의 자리에 오를 수 있는 운입니다.';

  @override
  String get tarotSuccessDetail4 =>
      '조직 내에서 당신의 입지가 단단해지는 시기입니다. 리더십을 인정받아 팀장이나 관리자로 승진할 수 있으며, 중요한 프로젝트의 총괄 책임을 맡게 될 수도 있습니다. 감정에 휘둘리지 않고 이성적이고 냉철한 판단으로 업무를 처리하여 상사의 신임을 얻을 것입니다.';

  @override
  String get tarotKeywords5 => '전통, 가르침, 신념, 조언, 중재';

  @override
  String get tarotDesc5 =>
      '교황은 사회적 규범과 전통을 중시하며, 지혜로운 조언으로 사람들을 이끄는 정신적인 스승입니다.';

  @override
  String get tarotLoveMeaning5 => '신뢰와 존중을 바탕으로 한 진지하고 건전한 만남이 이어집니다.';

  @override
  String get tarotLoveDetail5 =>
      '가벼운 만남보다는 결혼을 전제로 한 진지한 교제를 원하게 됩니다. 소개팅이나 맞선, 또는 건전한 모임에서 좋은 인연을 만날 수 있습니다. 연인 간에 갈등이 있다면 주변 어른이나 선배에게 조언을 구해보세요. 그들의 지혜로운 조언이 관계 회복에 큰 도움이 될 것입니다.';

  @override
  String get tarotWealthMeaning5 => '전통적이고 안전한 방식의 재테크가 좋습니다.';

  @override
  String get tarotWealthDetail5 =>
      '모험적인 투자보다는 안정성을 최우선으로 해야 합니다. 은행 예적금이나 보험 등 전통적인 금융 상품을 활용하는 것이 좋습니다. 전문가의 컨설팅을 받아보거나 정직하고 투명한 금전 거래를 유지하는 것이 당신의 신용과 재산을 지키는 길입니다.';

  @override
  String get tarotSuccessMeaning5 => '계약, 제휴, 협력 관계가 원만하게 체결될 운입니다.';

  @override
  String get tarotSuccessDetail5 =>
      '혼자서 문제를 해결하려 하기보다는 주변의 도움을 받는 것이 현명합니다. 직장 상사나 멘토 등 윗사람에게 조언을 구하면 의외로 쉽게 해결책을 찾을 수 있습니다. 회사 내의 규칙과 절차를 잘 따르는 것이 좋은 평가를 받는 지름길이며, 중요한 계약을 체결하기에도 좋은 운입니다.';

  @override
  String get tarotKeywords6 => '사랑, 조화, 선택, 결합, 파트너십';

  @override
  String get tarotDesc6 => '따스한 태양 아래 천사의 축복을 받는 아담과 이브가 서 있습니다.';

  @override
  String get tarotLoveMeaning6 => '사랑이 꽃피는 가장 좋은 시기 중 하나입니다.';

  @override
  String get tarotLoveDetail6 =>
      '가슴 설레는 로맨스가 기다리고 있습니다. 호감 있는 상대와 급속도로 가까워지며, 눈만 마주쳐도 통하는 텔레파시 같은 교감을 느낄 수 있습니다. 고백을 준비 중이라면 성공 확률이 매우 높으니 용기를 내세요. 다만 순간의 유혹에 휩쓸리기보다는 진심이 향하는 곳을 선택하는 지혜가 필요합니다.';

  @override
  String get tarotWealthMeaning6 => '혼자보다는 함께할 때 금전운이 상승합니다.';

  @override
  String get tarotWealthDetail6 =>
      '마음이 맞는 사람과 함께 일을 도모하면 시너지 효과가 나서 금전적 이익이 커집니다. 동업 제안이 들어온다면 긍정적으로 검토해보세요. 주변 사람들과의 소통을 통해 유익한 투자 정보를 얻을 수 있는 시기입니다. 다만 즐거움을 위한 지출이 과다해질 수 있으니 적절한 조절이 필요합니다.';

  @override
  String get tarotSuccessMeaning6 => '팀워크가 빛을 발하는 시기입니다.';

  @override
  String get tarotSuccessDetail6 =>
      '직장 동료나 비즈니스 파트너와의 호흡이 척척 맞아 일하는 것이 즐겁습니다. 혼자 하는 업무보다는 팀 프로젝트에서 더 좋은 성과를 낼 수 있으며, 원만한 대인관계가 성공의 핵심 열쇠가 됩니다. 당신이 진정으로 좋아하고 즐길 수 있는 일을 선택한다면 후회 없는 결과를 얻을 것입니다.';

  @override
  String get tarotKeywords7 => '승리, 의지, 전진, 정복, 이동';

  @override
  String get tarotDesc7 =>
      '전차를 탄 젊은 왕이 강한 의지로 목표를 향해 거침없이 돌진하며 승리를 쟁취하는 모습입니다.';

  @override
  String get tarotLoveMeaning7 => '적극적인 애정 공세가 성공하는 시기입니다.';

  @override
  String get tarotLoveDetail7 =>
      '사랑을 쟁취하기 위해 돌진해야 할 때입니다. 머뭇거리지 말고 자신의 마음을 솔직하고 당당하게 표현하면 경쟁자가 있더라도 승리할 수 있습니다. 썸을 타고 있다면 관계를 확실히 정의 내리고 리드하는 것이 좋습니다. 역동적인 데이트나 함께 여행을 떠나는 것이 애정을 깊게 만들어줄 것입니다.';

  @override
  String get tarotWealthMeaning7 => '목표한 수익을 달성하기 위해 공격적으로 움직여야 할 때입니다.';

  @override
  String get tarotWealthDetail7 =>
      '금전적인 목표를 달성하기 위해 강력한 추진력이 필요한 시기입니다. 망설이지 말고 기회가 왔을 때 과감하게 결정하는 추진력이 수익을 가져다줍니다. 단기적으로 성과가 나는 프로젝트에 집중하는 것이 유리하며, 발로 뛰는 만큼 실적이 올라가는 운세입니다. 이동과 관련된 지출이 생길 수 있으나 이는 새로운 기회를 위한 투자가 될 것입니다.';

  @override
  String get tarotSuccessMeaning7 => '경쟁에서 승리하고 목표를 쟁취하는 운입니다.';

  @override
  String get tarotSuccessDetail7 =>
      '승진, 합격, 계약 성사 등 뚜렷한 목표 달성이 예견됩니다. 경쟁이 치열할수록 당신의 투지가 불타올라 결국 승리를 거머쥐게 될 것입니다. 장애물이 닥쳐도 정면 돌파하는 당신의 모습이 주변에 깊은 인상을 남기며, 출장이나 이동이 많은 업무에서 탁월한 능력을 발휘하게 됩니다.';

  @override
  String get tarotKeywords8 => '인내, 용기, 내면의 힘, 포용, 외유내강';

  @override
  String get tarotDesc8 =>
      '흰 옷을 입은 여인이 물리적인 힘이 아닌 정신적인 힘과 인내심으로 맹수를 부드럽게 길들이는 모습입니다.';

  @override
  String get tarotLoveMeaning8 => '상대방을 있는 그대로 받아들이고 이해하는 포용력이 필요한 시기입니다.';

  @override
  String get tarotLoveDetail8 =>
      '지금의 사랑은 인내심과 지혜를 요구합니다. 상대방의 단점이나 투정을 넓은 마음으로 받아주고 보듬어줄 때 관계가 한 단계 더 발전할 수 있습니다. 부드러운 태도로 상대를 리드하는 외유내강의 자세가 필요하며, 끈기 있게 곁을 지켜준다면 결국 당신의 진심이 상대의 마음을 열게 할 것입니다.';

  @override
  String get tarotWealthMeaning8 => '꾸준한 저축과 건전한 소비 습관이 재물을 모으는 비결입니다.';

  @override
  String get tarotWealthDetail8 =>
      '재물운이 서서히 상승하는 흐름입니다. 당장 큰돈이 들어오지 않더라도 실망하지 말고 성실하게 자산을 관리하면 나중에 큰 목돈이 되어 돌아올 것입니다. 투자에 있어서는 단기적인 등락에 일희일비하지 말고 뚝심 있게 버티는 것이 유리합니다. 자신의 충동적인 소비 욕구를 잘 다스리는 것이 부자가 되는 지름길입니다.';

  @override
  String get tarotSuccessMeaning8 => '어려운 과제나 까다로운 상사를 만나더라도 지혜롭게 대처할 수 있습니다.';

  @override
  String get tarotSuccessDetail8 =>
      '힘든 프로젝트나 까다로운 업무를 맡게 될 수 있지만, 당신에게는 이를 해결할 충분한 저력이 있습니다. 겉으로는 부드러워 보이지만 내면의 강한 의지로 난관을 하나씩 극복해 나가는 모습이 돋보입니다. 침착함을 잃지 않고 문제를 해결하는 당신의 모습에 주변에서 깊은 신뢰를 보내게 될 것입니다.';

  @override
  String get tarotKeywords9 => '성찰, 고독, 탐구, 지혜, 휴식';

  @override
  String get tarotDesc9 =>
      '어두운 설산 위에서 등불을 든 노인이 내면의 목소리에 귀 기울이며 진리를 탐구하는 모습입니다.';

  @override
  String get tarotLoveMeaning9 => '혼자만의 시간이 필요하거나 연애에 대해 깊이 고민하는 시기입니다.';

  @override
  String get tarotLoveDetail9 =>
      '지금은 활발한 연애보다는 자신을 돌아보는 시간이 필요한 때입니다. 외로움을 달래기 위해 아무나 만나기보다는, 내가 진정으로 원하는 사랑이 무엇인지 깊이 고민해보세요. 연인이 있더라도 잠시 거리를 두고 각자의 시간을 갖는 것이 오히려 관계의 본질을 깨닫는 데 도움이 될 수 있습니다.';

  @override
  String get tarotWealthMeaning9 => '금전적인 활동이 다소 위축될 수 있습니다.';

  @override
  String get tarotWealthDetail9 =>
      '재물에 관해서는 보수적인 태도를 취해야 합니다. 새로운 투자를 하거나 사업을 벌이기보다는 현재의 자산을 꼼꼼히 점검하고 새어나가는 돈을 막는 것이 중요합니다. 대신 자신의 가치를 높이기 위한 공부나 기술 습득에 비용을 지출하는 것은 훗날 더 큰 수익을 올릴 수 있는 훌륭한 투자입니다.';

  @override
  String get tarotSuccessMeaning9 => '전문적인 지식이나 기술을 깊이 있게 연구하는 분야에서 성과를 냅니다.';

  @override
  String get tarotSuccessDetail9 =>
      '연구, 기획, 개발 등 혼자서 깊이 있게 파고드는 업무에서 탁월한 성과를 낼 수 있습니다. 남들에게 드러나지는 않지만 묵묵히 실력을 쌓아가는 시기이며, 직장 내 인간관계보다는 업무의 본질에 집중하는 것이 유리합니다. 해결되지 않는 문제가 있다면 경험이 풍부한 멘토를 찾아 조언을 구해보세요.';

  @override
  String get tarotKeywords10 => '운명, 변화, 기회, 순환, 터닝포인트';

  @override
  String get tarotDesc10 =>
      '거대한 수레바퀴가 돌며 피할 수 없는 운명의 흐름과 새로운 주기의 시작을 알리는 모습입니다.';

  @override
  String get tarotLoveMeaning10 => '운명적인 만남이 기다리고 있습니다.';

  @override
  String get tarotLoveDetail10 =>
      '영화처럼 운명적인 사랑이 당신을 찾아옵니다. 우연한 장소에서의 만남이나 뜻밖의 재회 등 드라마틱한 사건이 일어날 수 있으니 마음을 열어두세요. 솔로라면 첫눈에 반하는 상대를 만날 수 있고, 커플이라면 관계가 한 단계 발전하는 계기가 생길 것입니다. 지금의 좋은 흐름을 놓치지 마세요.';

  @override
  String get tarotWealthMeaning10 => '금전운의 흐름이 좋아지고 있습니다.';

  @override
  String get tarotWealthDetail10 =>
      '행운의 여신이 당신에게 미소 짓고 있습니다. 생각지도 못한 수입이 생기거나 투자 수익이 나는 등 금전운이 상승 곡선을 그리는 시기입니다. 자금 회전이 원활해지니 기회가 왔을 때 잡는 과감함이 필요합니다. 다만 운은 돌고 도는 법이니 잘 벌릴 때일수록 미래를 위해 저축하는 지혜도 잊지 마세요.';

  @override
  String get tarotSuccessMeaning10 => '상황이 당신에게 유리하게 돌아갑니다.';

  @override
  String get tarotSuccessDetail10 =>
      '막혀있던 일들이 술술 풀리는 인생의 터닝포인트가 찾아왔습니다. 주변 상황이 당신에게 유리하게 흘러가고 있으니, 새로운 기회가 왔을 때 망설이지 말고 잡으세요. 승진이나 이직 등 변화의 기회는 당신을 더 높은 곳으로 데려다줄 상승 기류가 될 것입니다. 흐름에 몸을 맡기면 좋은 결과가 따를 것입니다.';

  @override
  String get tarotKeywords11 => '공정, 균형, 책임, 진실, 인과응보';

  @override
  String get tarotDesc11 => '붉은 옷을 입은 재판관이 오른손엔 검, 왼손엔 저울을 들고 있습니다.';

  @override
  String get tarotLoveMeaning11 => '감정보다는 이성이 앞서는 관계입니다.';

  @override
  String get tarotLoveDetail11 =>
      '지금은 감정에 치우치기보다는 이성적인 판단이 필요한 시기입니다. 상대방과 나의 관계가 균형 잡혀 있는지, 내가 너무 희생하거나 반대로 받기만 하는 건 아닌지 돌아보세요. 결혼을 생각 중이라면 상대방의 조건이나 배경을 꼼꼼히 따져보게 될 수 있으며, 솔직하고 공정한 대화가 관계 개선의 해결책이 될 것입니다.';

  @override
  String get tarotWealthMeaning11 => '금전 거래나 계약에서 꼼꼼한 확인이 필요합니다.';

  @override
  String get tarotWealthDetail11 =>
      '금전적인 부분에서 시시비비를 가려야 할 일이 생길 수 있습니다. 빌려준 돈을 받거나, 반대로 갚아야 할 돈을 정산하는 등 재무 관계를 깨끗이 정리하기 좋은 때입니다. 계약서를 쓸 때는 독소 조항이 없는지 꼼꼼하게 살펴보고, 요행이나 편법보다는 정직하고 투명하게 원칙대로 처리하는 것이 좋습니다.';

  @override
  String get tarotSuccessMeaning11 => '공정한 평가를 받고 정당한 보상을 받게 됩니다.';

  @override
  String get tarotSuccessDetail11 =>
      '당신의 업무 성과에 대해 공정하고 객관적인 평가를 받게 됩니다. 그동안 열심히 일했다면 승진이나 보너스 등 합당한 보상이 따를 것이고, 법조계나 회계 등 정확성이 요구되는 분야에서 능력을 발휘할 수 있습니다. 의사결정을 내릴 때는 감정을 배제하고 철저히 데이터와 팩트에 기반하여 판단하세요.';

  @override
  String get tarotKeywords12 => '희생, 인내, 새로운 시각, 정체, 깨달음';

  @override
  String get tarotDesc12 =>
      '나무에 거꾸로 매달린 남자가 자발적인 고난을 통해 세상을 새로운 시각으로 바라보며 깨달음을 얻는 모습입니다.';

  @override
  String get tarotLoveMeaning12 => '관계가 정체되거나 짝사랑이 길어질 수 있습니다.';

  @override
  String get tarotLoveDetail12 =>
      '연애 진도가 나가지 않아 답답함을 느낄 수 있지만, 지금은 서두른다고 해결될 일이 아닙니다. 잠시 멈춰 서서 현재의 상황을 다른 관점에서 바라보며 내가 너무 내 방식대로만 사랑을 강요한 건 아닌지 반성해볼 필요가 있습니다. 상대방의 입장이 되어 생각하고 배려하는 인내가 결국 상대의 마음을 여는 열쇠가 될 것입니다.';

  @override
  String get tarotWealthMeaning12 => '자금 흐름이 묶이거나 손실을 감수해야 할 수도 있습니다.';

  @override
  String get tarotWealthDetail12 =>
      '금전적으로 꽉 막힌 듯한 느낌을 받을 수 있습니다. 투자한 돈이 묶이거나 예정된 수입이 지연될 수 있지만, 발버둥 칠수록 더 꼬일 수 있으니 지금은 차라리 마음을 비우고 관망하는 것이 상책입니다. 이 시기를 통해 자신의 소비 습관을 점검하고 돈에 대한 가치관을 새롭게 정립해보는 시간으로 삼으세요.';

  @override
  String get tarotSuccessMeaning12 => '일이 계획대로 진행되지 않고 지연될 수 있습니다.';

  @override
  String get tarotSuccessDetail12 =>
      '프로젝트가 중단되거나 업무가 지연되어 스트레스를 받을 수 있지만, 이는 실패가 아니라 잠시 멈춤 신호입니다. 억지로 진행하려 하지 말고 한 발 물러서서 전체적인 그림을 다시 그려보세요. 고정관념을 깼을 때 남들이 생각하지 못하는 기발한 아이디어가 나올 수 있으며, 지금의 시련은 당신에게 새로운 깨달음을 줄 것입니다.';

  @override
  String get tarotKeywords13 => '종결, 변화, 재탄생, 이별, 새로운 시작';

  @override
  String get tarotDesc13 =>
      '낡은 것의 완전한 종결과 그로 인한 새로운 시작을 상징하며, 고통스럽지만 피할 수 없는 변화의 과정을 나타냅니다.';

  @override
  String get tarotLoveMeaning13 => '관계의 종결이나 큰 변화를 의미합니다.';

  @override
  String get tarotLoveDetail13 =>
      '지금의 관계가 한계를 맞이했을 수 있습니다. 억지로 붙잡으려 하기보다는 자연스럽게 흘려보내는 용기가 필요하며, 이별은 아프지만 그 끝에는 반드시 더 나은 새로운 시작이 기다리고 있습니다. 과거의 미련이나 상처에서 완전히 벗어나야만 새로운 사람이 들어올 자리가 생긴다는 점을 명심하세요.';

  @override
  String get tarotWealthMeaning13 => '금전적인 손실이나 투자 실패 등 힘든 상황이 올 수 있습니다.';

  @override
  String get tarotWealthDetail13 =>
      '재정적으로 큰 변화가 예상됩니다. 믿었던 투자처에서 손실이 나거나 예기치 못한 지출로 어려움을 겪을 수 있지만, 이는 그동안의 비효율적인 자산 관리 방식을 바꾸라는 신호입니다. 부채를 정리하고 불필요한 지출을 완전히 차단하여 더 건강하고 안정적인 재무 구조를 갖추기 위한 발판으로 삼으세요.';

  @override
  String get tarotSuccessMeaning13 => '진행하던 일이 중단되거나 실패할 수 있습니다.';

  @override
  String get tarotSuccessDetail13 =>
      '공들였던 프로젝트가 무산되거나 직장에서 큰 변화를 겪을 수 있습니다. 당장은 좌절감이 크겠지만 이는 당신에게 맞지 않는 일을 정리하고 더 큰 성공을 위해 새로운 길을 찾으라는 운명의 계시입니다. 낡은 방식을 버리고 완전히 새로운 마음가짐으로 시작하면 인생의 더 멋진 다음 챕터가 열릴 것입니다.';

  @override
  String get tarotKeywords14 => '균형, 절제, 화합, 치유, 중용';

  @override
  String get tarotDesc14 =>
      '두 개의 컵 사이로 물을 옮겨 담으며 현실과 이상 사이의 완벽한 균형과 조화로운 흐름을 상징합니다.';

  @override
  String get tarotLoveMeaning14 => '서로 다른 두 사람이 만나 조화를 이루어가는 과정입니다.';

  @override
  String get tarotLoveDetail14 =>
      '불타오르는 열정보다는 은은하고 지속적인 사랑이 어울리는 시기입니다. 서로의 차이점을 인정하고 보완해주며 깊은 유대감을 쌓아가게 되며, 다툼이 있더라도 차분하게 대화로 풀어가는 지혜가 필요합니다. 당신의 온화하고 배려심 깊은 태도가 상대방의 마음을 편안하게 하여 안정적인 관계를 만들어줄 것입니다.';

  @override
  String get tarotWealthMeaning14 => '수입과 지출의 균형을 맞추는 것이 중요합니다.';

  @override
  String get tarotWealthDetail14 =>
      '재물운이 안정적인 흐름을 탑니다. 일확천금을 노리기보다는 현재의 자산을 효율적으로 배분하고 관리하는 데 집중하며, 수입이 늘어난 만큼 지출도 적절히 조절하는 습관이 필요합니다. 투자를 한다면 리스크 관리를 위해 분산 투자를 하는 것이 좋으며, 꾸준한 관리가 결국 부를 가져다줄 것입니다.';

  @override
  String get tarotSuccessMeaning14 => '서로 다른 의견을 조율하고 화합을 이끌어내는 능력이 돋보입니다.';

  @override
  String get tarotSuccessDetail14 =>
      '팀 프로젝트에서 중재자 역할을 훌륭히 수행하여 갈등을 해결하고 업무 효율을 높입니다. 당신의 유연한 사고와 적응력이 주변의 인정을 받게 되며, 일과 휴식의 균형을 잘 맞춰 번아웃을 예방하는 지혜가 돋보이는 시기입니다. 전체적인 흐름을 살피며 차근차근 진행하는 것이 가장 좋은 결과로 이어집니다.';

  @override
  String get tarotKeywords15 => '유혹, 속박, 집착, 물질주의, 중독';

  @override
  String get tarotDesc15 =>
      '스스로를 구속하는 욕망과 집착, 그리고 마음만 먹으면 벗어날 수 있지만 그러지 못하는 물질적인 유혹을 상징합니다.';

  @override
  String get tarotLoveMeaning15 => '강렬한 육체적 매력에 끌리거나 집착하는 관계를 의미합니다.';

  @override
  String get tarotLoveDetail15 =>
      '이성의 매력에 강력하게 매료되어 이성적인 판단을 내리기 힘든 시기입니다. 뜨거운 로맨스가 시작될 수도 있지만, 한편으로는 상대에 대한 과도한 집착과 구속으로 힘들어질 수 있으니 주의가 필요합니다. 자신의 감정이 진정한 사랑인지 아니면 단순한 소유욕인지 냉정하게 돌아보고 스스로를 다스려야 합니다.';

  @override
  String get tarotWealthMeaning15 =>
      '물질적인 욕심이 과해져 무리한 투자를 하거나 유흥에 큰돈을 쓸 수 있습니다.';

  @override
  String get tarotWealthDetail15 =>
      '금전적인 유혹이 많은 시기입니다. 달콤한 말에 속아 위험한 곳에 투자하거나 충동적인 소비로 재산을 탕진할 위험이 있으니 경계해야 합니다. 돈의 노예가 되어 주변의 신뢰를 저버리지 않도록 주의하고, 새로운 투자를 하기보다는 현재 가지고 있는 것을 지키며 자신의 과도한 물욕을 다스려야 할 때입니다.';

  @override
  String get tarotSuccessMeaning15 => '성공을 위해 수단과 방법을 가리지 않으려 할 수 있습니다.';

  @override
  String get tarotSuccessDetail15 =>
      '권력이나 명예에 대한 욕심이 커져 주변 동료들을 경쟁 상대로만 보게 될 수 있습니다. 성과를 위해 무리한 일정을 잡거나 건강을 돌보지 않는 일 중독에 빠질 우려가 있으니 주의하세요. 정당한 노력 없이 얻으려는 마음을 버리고 정직하게 업무에 임하는 자세가 필요하며, 스스로 만든 구속에서 벗어나야 합니다.';

  @override
  String get tarotKeywords16 => '붕괴, 충격, 급격한 변화, 해방, 진실의 폭로';

  @override
  String get tarotDesc16 => '번개가 탑을 내리쳐 탑이 무너지고 사람들이 떨어지고 있습니다.';

  @override
  String get tarotLoveMeaning16 => '관계에 큰 위기나 갑작스러운 이별이 닥칠 수 있습니다.';

  @override
  String get tarotLoveDetail16 =>
      '마치 마른하늘에 날벼락처럼 예기치 못한 사건이 연애 전선에 발생할 수 있습니다. 믿었던 상대에게 실망하거나 감당하기 힘든 다툼으로 관계가 뿌리째 흔들릴 수 있지만, 너무 절망하지 마세요. 이는 건강하지 못한 관계나 오해가 깨지고 진실을 마주하게 되는 과정이며, 무너진 자리에는 결국 더 단단한 사랑을 쌓을 기회가 올 것입니다.';

  @override
  String get tarotWealthMeaning16 => '갑작스러운 금전적 손실이나 재난에 대비해야 합니다.';

  @override
  String get tarotWealthDetail16 =>
      '재정적으로 매우 불안정한 시기입니다. 예상치 못한 곳에서 큰돈이 빠져나가거나 투자했던 곳이 무너지는 등 충격적인 소식을 접할 수 있으니 자산을 안전한 곳으로 옮기고 대비해야 합니다. 하지만 이 붕괴는 잘못된 경제 관념을 바로잡는 계기가 될 것이며, 바닥을 치고 나면 다시는 무너지지 않을 튼튼한 기반을 쌓을 기회가 옵니다.';

  @override
  String get tarotSuccessMeaning16 =>
      '프로젝트가 중단되거나 직장에서 갑작스러운 인사 이동 등 충격적인 변화가 생길 수 있습니다.';

  @override
  String get tarotSuccessDetail16 =>
      '그동안 공들여 쌓아온 탑이 무너지는 듯한 좌절감을 느낄 수 있지만, 이는 당신의 능력이 부족해서가 아니라 피할 수 없는 변화의 흐름 때문입니다. 당황하지 말고 사태를 냉정하게 파악하여 낡은 시스템을 버리고 새로운 길을 모색하세요. 지금의 위기를 기회로 삼아 재정비한다면 훨씬 더 높은 곳으로 도약할 수 있을 것입니다.';

  @override
  String get tarotKeywords17 => '희망, 영감, 치유, 낙관주의, 소망 성취';

  @override
  String get tarotDesc17 =>
      '밤하늘의 밝은 별빛 아래에서 여인이 물을 부으며 고난 뒤에 찾아오는 평화와 미래에 대한 희망을 상징합니다.';

  @override
  String get tarotLoveMeaning17 => '이상형에 가까운 사람을 만나거나 연애에 대한 꿈이 이루어지는 시기입니다.';

  @override
  String get tarotLoveDetail17 =>
      '어두운 밤을 밝히는 별처럼 당신의 연애에도 반짝이는 희망이 찾아옵니다. 마음에 그리던 이상형을 만나게 될 수 있으며, 당신의 순수한 매력이 이성에게 크게 어필하는 시기입니다. 과거의 아픈 기억은 이제 치유되고 새로운 사랑을 꿈꿀 수 있는 밝은 에너지가 생길 것입니다.';

  @override
  String get tarotWealthMeaning17 => '금전적으로 서서히 상황이 좋아집니다.';

  @override
  String get tarotWealthDetail17 =>
      '재물운이 긍정적인 방향으로 흘러가기 시작합니다. 그동안의 경제적 어려움이 해소되고 한 줄기 빛이 보이는 시기이며, 창의적인 아이디어를 통해 부가 수익을 올릴 기회가 생길 수 있습니다. 당장의 큰 이득보다는 장기적인 관점에서 미래 가치가 높은 곳에 투자하는 안목이 당신을 재정적 안정으로 인도할 것입니다.';

  @override
  String get tarotSuccessMeaning17 => '창의적인 영감이 샘솟고 자신의 재능을 널리 알릴 기회를 얻습니다.';

  @override
  String get tarotSuccessDetail17 =>
      '당신의 아이디어가 빛을 발하여 주변의 찬사를 받게 됩니다. 특히 예술적인 감각이나 홍보, 마케팅 분야에서 두각을 나타낼 수 있으며, 평소 꿈꿔왔던 프로젝트를 시작하기에 아주 좋은 타이밍입니다. 자신 있게 자신을 표현하면 대중의 인기를 얻거나 명예를 얻을 수 있는 운이 들어와 있으니 기회를 잡으세요.';

  @override
  String get tarotKeywords18 => '불안, 환상, 모호함, 직감, 무의식';

  @override
  String get tarotDesc18 =>
      '달빛 아래 불안과 모호함이 공존하며, 보이지 않는 이면의 진실과 무의식의 세계를 상징합니다.';

  @override
  String get tarotLoveMeaning18 => '상대방의 마음을 알 수 없어 답답하거나, 오해와 의심이 싹트기 쉽습니다.';

  @override
  String get tarotLoveDetail18 =>
      '안개 속에 있는 듯 상대방의 속마음을 알 수 없어 불안한 시기입니다. 사소한 오해가 커져 의심이 되고 불안감 때문에 밤잠을 설칠 수도 있으니, 섣불리 추궁하기보다는 상황을 차분히 지켜보는 것이 좋습니다. 감정에 휩쓸려 불확실한 관계에 너무 매달리기보다는 이성적으로 생각하여 마음의 중심을 잡는 것이 우선입니다.';

  @override
  String get tarotWealthMeaning18 => '투자 전망이 불투명하고 사기의 위험이 도사리고 있습니다.';

  @override
  String get tarotWealthDetail18 =>
      '금전적인 면에서 시야가 흐려져 있어 그럴싸해 보이는 투자 정보나 감언이설에 속아 넘어갈 위험이 높습니다. 보이지 않는 곳에 함정이 숨어 있으니 돌다리도 두들겨 보고 건너는 심정으로 극도로 조심해야 할 시기입니다. 새로운 일을 벌이기보다는 현상 유지를 하며 현실적인 검증 과정을 철저히 거치는 것이 재산을 지키는 길입니다.';

  @override
  String get tarotSuccessMeaning18 =>
      '업무의 방향이 모호하거나 숨겨진 적이 있을 수 있어 혼란스러운 시기입니다.';

  @override
  String get tarotSuccessDetail18 =>
      '앞이 보이지 않는 막막한 상황에 처할 수 있으며, 프로젝트의 방향성이 흔들리거나 직장 내 유언비어에 휘말릴 수 있으니 언행을 조심해야 합니다. 지금은 섣불리 움직이기보다는 상황이 명확해질 때까지 기다리는 것이 현명하며, 남의 말을 함부로 믿지 말고 묵묵히 자신의 자리를 지키며 멘탈 관리에 힘쓰는 것이 좋습니다.';

  @override
  String get tarotKeywords19 => '성공, 행복, 활력, 긍정, 축복';

  @override
  String get tarotDesc19 => '밝은 태양 아래 어린아이가 백마를 타고 깃발을 흔들며 즐거워합니다.';

  @override
  String get tarotLoveMeaning19 => '축복받는 밝고 행복한 연애를 하게 됩니다.';

  @override
  String get tarotLoveDetail19 =>
      '더할 나위 없이 완벽하고 행복한 사랑이 당신과 함께합니다. 그동안의 오해나 갈등이 눈 녹듯이 사라지고 신뢰가 깊어지며, 솔로라면 밝은 에너지를 가진 인연을 만날 수 있는 최고의 시기입니다. 결혼이나 임신 등 경사스러운 소식을 기대해봐도 좋으며, 아이처럼 순수하고 열정적으로 사랑을 즐기기에 더없이 좋은 운세입니다.';

  @override
  String get tarotWealthMeaning19 => '금전운이 최상입니다.';

  @override
  String get tarotWealthDetail19 =>
      '쨍하고 해 뜰 날이 찾아왔습니다. 금전운이 매우 강력하여 무엇을 하든 수익으로 연결되며, 사업은 번창하고 투자는 대박이 날 조짐입니다. 주머니가 두둑해지는 시기이니 이 좋은 기운을 주변과 나누면 더 큰 복으로 돌아올 것이며, 부동산이나 주식 등 자산 가치가 크게 상승할 기분 좋은 소식을 기대해도 좋습니다.';

  @override
  String get tarotSuccessMeaning19 => '당신의 능력을 인정받고 스포트라이트를 받게 됩니다.';

  @override
  String get tarotSuccessDetail19 =>
      '성공의 팡파르가 울려 퍼집니다. 당신이 그동안 노력해 온 일들이 빛을 발하여 세상에 드러나게 되며, 합격이나 승진 등 가시적인 성과를 거두게 됩니다. 자신감 넘치는 태도가 주변을 매료시켜 리더로서의 자질도 인정받을 것이며, 지금은 당신이 주인공인 무대이니 마음껏 기량을 펼쳐 성공을 쟁취하세요.';

  @override
  String get tarotKeywords20 => '부활, 보상, 소식, 결단, 재회';

  @override
  String get tarotDesc20 => '하늘에서 천사가 나팔을 불자, 관 속에 있던 사람들이 깨어나 환호합니다.';

  @override
  String get tarotLoveMeaning20 => '헤어진 연인에게서 연락이 오거나 재회할 기회가 생깁니다.';

  @override
  String get tarotLoveDetail20 =>
      '기다리던 소식이 들려옵니다. 잊지 못했던 옛 연인에게서 연락이 오거나 재회를 바랐다면 이루어질 가능성이 매우 높으며, 지지부진했던 썸 관계가 확실하게 연인으로 발전하는 결실을 보게 될 것입니다. 과거에 알던 사람과 새로운 인연이 닿을 수도 있으니, 마음의 소리에 귀 기울이고 후회 없는 결단을 내리세요.';

  @override
  String get tarotWealthMeaning20 =>
      '과거에 투자했던 곳에서 수익이 나거나 빌려줬던 돈을 돌려받을 수 있습니다.';

  @override
  String get tarotWealthDetail20 =>
      '과거의 노력에 대한 보상을 받는 시기입니다. 잊고 있었던 주식이 오르거나 못 받을 줄 알았던 돈을 돌려받는 등 뜻밖의 횡재수가 있으며, 예전에 실패했던 아이디어를 다시 시도하여 성공할 기회가 찾아옵니다. 지금 내리는 결정이 앞으로의 재물운을 크게 좌우하게 되니 신중하면서도 과감한 결단이 필요한 때입니다.';

  @override
  String get tarotSuccessMeaning20 => '그동안의 노력을 인정받아 승진하거나 포상을 받게 됩니다.';

  @override
  String get tarotSuccessDetail20 =>
      '심판의 날이 왔습니다. 그동안 흘린 땀방울에 대한 정당한 평가와 보상이 주어져 승진이나 합격 등 기쁜 소식이 나팔 소리처럼 울려 퍼질 것입니다. 침체되어 있던 상황에서 벗어나 다시 한번 비상할 수 있는 스카우트 제의나 이직 기회가 올 수 있으니, 변화를 두려워하지 말고 기회를 잡아 새로운 챕터를 시작하세요.';

  @override
  String get tarotKeywords21 => '완성, 통합, 달성, 해피엔딩, 완벽함';

  @override
  String get tarotDesc21 =>
      '긴 여정 끝에 목표를 완전히 달성하고 완벽한 조화를 이룬 상태를 나타내는 최고의 해피엔딩을 상징합니다.';

  @override
  String get tarotLoveMeaning21 => '사랑의 결실을 맺어 결혼에 골인하거나, 이상적인 가정을 꾸리게 됩니다.';

  @override
  String get tarotLoveDetail21 =>
      '긴 연애의 마침표를 찍고 결혼이라는 새로운 세상으로 나아가는 완벽한 시기입니다. 서로가 서로에게 최고의 반쪽임을 확인하고 축복 속에 하나가 되는 행복을 누리게 될 것이며, 솔로라면 당신의 이상형에 부합하는 운명의 상대를 만날 수 있습니다. 해외여행이나 이국적인 환경에서 인연이 닿을 운세이기도 합니다.';

  @override
  String get tarotWealthMeaning21 => '목표했던 금액을 달성하고 경제적 자유를 누리게 됩니다.';

  @override
  String get tarotWealthDetail21 =>
      '금전적인 목표를 100% 달성하는 쾌거를 이루어 경제적 자유를 누릴 수 있는 단계에 도달했습니다. 해외 주식이나 무역 등 글로벌한 분야에서 큰 수익을 낼 수 있으며, 당신의 투자 포트폴리오가 완벽한 조화를 이루어 안정적인 수익을 가져다줄 것입니다. 이제는 풍요로움을 만끽하며 더 넓은 세상을 향해 시야를 넓혀보세요.';

  @override
  String get tarotSuccessMeaning21 => '프로젝트를 성공적으로 완수하고 최고의 명예를 얻습니다.';

  @override
  String get tarotSuccessDetail21 =>
      '당신의 커리어에 정점을 찍는 시기입니다. 맡은 프로젝트를 완벽하게 성공시켜 최고의 찬사를 받게 되며, 목표했던 바를 모두 이루어 더 큰 세상으로 나아갈 준비를 하게 될 것입니다. 유학이나 해외 취업 등 활동 무대가 세계로 넓어질 수 있는 운세이니, 현재의 성공을 발판 삼아 더 원대한 꿈을 꾸며 도약하세요.';

  @override
  String get supplementRecordPrompt => '영양제를 드시고 기록해주세요!';

  @override
  String get snoozeQuestion => '언제 다시 알려드릴까요?';

  @override
  String get hoursShort => '시간';

  @override
  String get minutesShort => '분';

  @override
  String get after => '후에';

  @override
  String snoozeMessage(int minutes) {
    return '$minutes분 후에 알람이 다시 울립니다.';
  }

  @override
  String timesTaken(int count) {
    return '$count회 섭취';
  }

  @override
  String dailyGoalTimes(int goal) {
    return '목표: 하루 $goal회';
  }

  @override
  String get didYouTakeSupplement => '영양제를 챙겨 드셨나요?';

  @override
  String get viewMissionRecords => '미션 기록 보기';

  @override
  String get setTakingGoal => '섭취 목표 설정';

  @override
  String get times => '회';

  @override
  String get dailyTakingGoal => '일일 섭취 목표';

  @override
  String get howManyTimesADay => '하루에 몇 번 영양제를 드시나요?';

  @override
  String get setGoalMl => '목표 설정 (ml)';

  @override
  String get sleepAnalysis => '수면 분석';

  @override
  String get todaysSleep => '오늘의 수면';

  @override
  String get sleepDuration => '수면 시간';

  @override
  String get wakeUpTime => '기상 시간';

  @override
  String get weeklySleepPattern => '주간 수면 패턴';

  @override
  String get sleepAdvice => '규칙적인 수면 습관을 유지하고 있습니다. 어제보다 30분 더 일찍 잠자리에 들었어요!';

  @override
  String get stopwatch => '스톱워치';

  @override
  String get lap => '랩';

  @override
  String get stop => '중지';

  @override
  String lapLabel(int index) {
    return '랩 $index';
  }

  @override
  String get monday => '월';

  @override
  String get tuesday => '화';

  @override
  String get wednesday => '수';

  @override
  String get thursday => '목';

  @override
  String get friday => '금';

  @override
  String get saturday => '토';

  @override
  String get sunday => '일';

  @override
  String get policy => '이용약관 및 개인정보 처리방침';

  @override
  String get support => '문의하기';

  @override
  String get defaultAlarmBehavior => '기본 알람 동작';

  @override
  String get defaultAlarmVolume => '기본 알람 음량';

  @override
  String get defaultAlarmVolumeDescription => '새 알람 생성 시 적용되는 기본 음량입니다.';

  @override
  String get gradualVolumeDescription => '알람 소리가 서서히 커지도록 설정합니다.';

  @override
  String get defaultVibration => '기본 진동';

  @override
  String get defaultVibrationDescription => '새 알람 생성 시 진동을 기본으로 켭니다.';

  @override
  String get defaultInterval => '기본 간격';

  @override
  String get maxSnoozeCountLabel => '최대 횟수';

  @override
  String get minutes => '분';

  @override
  String cupsCount(int current, int goal) {
    return '($current잔/$goal잔)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current회/$goal회)';
  }

  @override
  String get missionGym => '헬스장 가기';

  @override
  String get missionWorkout => '홈트레이닝';

  @override
  String get missionDiary => '일기 쓰기';

  @override
  String get missionBedMaking => '이부자리 정리';

  @override
  String get missionStretching => '스트레칭';

  @override
  String get missionReading => '독서 10분';

  @override
  String get missionPlanning => '오늘의 계획 세우기';

  @override
  String get missionBreakfast => '아침 식사 하기';

  @override
  String get missionMeditation => '명상 5분';

  @override
  String get missionLearnWords => '영어 단어 5개 외우기';

  @override
  String get missionVentilation => '환기';

  @override
  String get missionCleaning => '방 정리정돈 하기';

  @override
  String get missionGratitudeDiary => '감사 일기 쓰기';

  @override
  String get faqQuestion1 => '알람이 울리지 않아요.';

  @override
  String get faqAnswer1 =>
      '안드로이드 시스템의 배터리 최적화 기능으로 인해 알람이 지연되거나 차단될 수 있습니다. 설정 > 알람 울림 최적화 메뉴에서 모든 권한을 허용으로 설정해 주세요.';

  @override
  String get faqQuestion2 => '미션을 변경하고 싶어요.';

  @override
  String get faqAnswer2 =>
      '알람 목록에서 수정을 원하는 알람을 탭한 후, 미션 선택 메뉴에서 원하는 미션(수학, 사진, 흔들기 등)으로 변경하실 수 있습니다.';

  @override
  String get faqQuestion3 => '다크 모드는 어떻게 설정하나요?';

  @override
  String get faqAnswer3 => '설정 > 일반 > 다크 모드 토글을 통해 화면 테마를 변경하실 수 있습니다.';

  @override
  String get faqQuestion4 => '포춘쿠키는 어떻게 모으나요?';

  @override
  String get faqAnswer4 =>
      '매일 아침 알람을 해제하거나, 미션을 완료할 때마다 포춘쿠키를 획득할 수 있습니다. 모은 쿠키로 오늘의 운세를 확인해 보세요!';

  @override
  String get faqQuestion5 => '앱을 삭제하면 데이터가 사라지나요?';

  @override
  String get faqAnswer5 =>
      '네, 포춘 알람은 기기 내부에 데이터를 저장하므로 앱 삭제 시 설정한 알람과 미션 기록이 모두 삭제됩니다. 주의해 주세요.';

  @override
  String get noticeLabel => '공지';

  @override
  String get notice1Title => '포춘 알람 정식 출시 안내';

  @override
  String get notice1Content =>
      '안녕하세요. 포춘 알람이 정식으로 출시되었습니다.\\n\\n매일 아침 알람과 함께 오늘의 운세를 확인하고 즐거운 하루를 시작해보세요!\\n앞으로 더욱 다양한 기능과 개선된 서비스로 찾아뵙겠습니다.\\n\\n감사합니다.';

  @override
  String get notice2Title => '버전 1.0.0 업데이트 소식';

  @override
  String get notice2Content =>
      '버전 1.0.0 업데이트 내용입니다.\\n\\n1. 영양제 미션 UI 개선\\n2. 정확한 알람을 위한 시스템 설정 연동\\n3. 다크 모드 지원\\n4. 버그 수정 및 안정성 개선\\n\\n지금 바로 최신 버전을 경험해보세요!';

  @override
  String get notice3Title => '서비스 이용 약관 개정 안내';

  @override
  String get notice3Content =>
      '서비스 이용 약관이 개정되었습니다.\\n\\n주요 개정 내용:\\n- 개인정보 처리방침 강화\\n- 서비스 이용 범위 구체화\\n\\n자세한 내용은 설정 > 약관 페이지에서 확인하실 수 있습니다.';

  @override
  String get supportContentTitle => '문의 내용';

  @override
  String get supportHint => '내용을 입력해 주세요.';

  @override
  String get supportRecipient => '받는 사람 (고객센터)';

  @override
  String get emailCopied => '이메일 주소가 복사되었습니다.';

  @override
  String get copyTooltip => '복사하기';

  @override
  String get supportWorkingDays => '평일 기준 24시간 이내에 답변을 드리도록 노력하겠습니다.';

  @override
  String get supportEmptyError => '내용을 입력해 주세요.';

  @override
  String get supportSubjectPrefix => '문의 제목';

  @override
  String get supportContentPrefix => '문의 내용';

  @override
  String get supportCopySuccessTitle => '문의 내용 복사됨';

  @override
  String supportCopySuccessMessage(String email) {
    return '문의 내용이 클립보드에 복사되었습니다.\\n$email 로 메일을 보내시겠습니까?';
  }

  @override
  String get selectionComplete => '선택 완료';

  @override
  String get selectVibration => '진동 패턴 선택';

  @override
  String get cameraMissionSequentialImageError => '미션 이미지를 순서대로 설정해주세요.';

  @override
  String get copyEmailAction => '이메일 주소 복사';

  @override
  String get addMissionTitle => '새로운 미션 추가';

  @override
  String get recommendedMissionList => '추천 미션 목록';

  @override
  String get recommendedMissionDesc => '건강한 하루를 위한 추천 미션들입니다.';

  @override
  String get all => '전체';

  @override
  String get allMissions => '전체 미션';

  @override
  String categoryMissions(String category) {
    return '$category 미션';
  }

  @override
  String get deselectAll => '전체 해제';

  @override
  String get selectAll => '전체 선택';

  @override
  String get myCustomMissions => '내가 만든 목록';

  @override
  String get myCustomMissionsDesc => '직접 만들었던 미션들을 다시 추가해보세요.';

  @override
  String get createYourOwnMission => '나만의 미션 만들기';

  @override
  String get createYourOwnMissionDesc => '원하는 미션이 없다면 직접 만들어보세요.';

  @override
  String get missionNameHint => '미션 이름을 입력하세요 (예: 헬스장 가기)';

  @override
  String get selectCategory => '카테고리 선택';

  @override
  String get getNotification => '알림 받기';

  @override
  String get missionCategoryHealth => '건강';

  @override
  String get missionCategoryStudy => '학습';

  @override
  String get missionCategoryRoutine => '루틴';

  @override
  String get missionCategoryHobby => '취미';

  @override
  String get missionCategoryOther => '기타';

  @override
  String get copyEmailSuccessMessage => '이메일 주소가 복사되었습니다. 메일 앱에서 붙여넣어 주세요.';

  @override
  String get supportSubmitButton => '문의 내용 복사하고 보내기';

  @override
  String get shakePhone => '핸드폰을 흔들어주세요!';

  @override
  String version(String version) {
    return '버전 $version';
  }

  @override
  String get fortuneCheckButton => '운세 확인하기';

  @override
  String get fortuneSelectCards => '3장을 선택하세요';

  @override
  String get fortuneDragCards => '3장을 드래그해서 선택하세요';

  @override
  String get fortuneDetailTitle => '상세 풀이';

  @override
  String get labelFineDust => '미세먼지';

  @override
  String get labelUltraFineDust => '초미세먼지';

  @override
  String get weatherToday => '오늘의 날씨';

  @override
  String get weatherUpdateMessage => '현재 위치로 날씨 정보를 업데이트합니다.';

  @override
  String get weatherDisclaimer => '관측된 자료는 현지 사정이나 수신상태에 의해\n차이가 발생할 수 있습니다.';

  @override
  String get weatherSource => '기상청, 한국환경공단 제공';

  @override
  String get locationPermissionTitle => '위치 권한 허용';

  @override
  String get locationPermissionDesc => '날씨 정보를 표시하기 위해 필요합니다.';

  @override
  String get hourlyForecast => '시간대별 예보';

  @override
  String get weeklyForecast => '주간 예보';

  @override
  String hourFormat(String hour) {
    return '$hour시';
  }

  @override
  String get noNotifications => '새로운 알림이 없습니다.';

  @override
  String get adLoadFailed => '광고 로드 실패';

  @override
  String get adLoading => '광고 로딩 중...';

  @override
  String get removeAds => '광고 제거하기';

  @override
  String get close => '닫기';

  @override
  String get exitQuestion => '종료하시겠습니까?';

  @override
  String get exitApp => '종료';

  @override
  String get shareResultDescription => '포춘알람이 분석한 당신의 운세 결과입니다.';

  @override
  String get shareResultButton => '결과 공유하기';

  @override
  String get unknownTime => '시간 모름';

  @override
  String get adLoadError => '광고를 불러올 수 없습니다. 잠시 후 다시 시도해주세요.';

  @override
  String get adShowError => '광고를 표시할 수 없습니다. 잠시 후 다시 시도해주세요.';

  @override
  String earnCookies(int count) {
    return '포춘쿠키 $count개를 획득했습니다! 🎉';
  }

  @override
  String get freePassAfterTimeout => '광고 없이 무료로 결과를 보여드립니다! 🎉';

  @override
  String get adLoadDelay => '로드가 지연되고 있어요.\n잠시 후 다시 시도해주세요.';

  @override
  String get fortuneAccessTitle => '운세 확인하기';

  @override
  String get fortuneAccessSubtitle => '운세 결과를 확인하고\n숨겨진 선물도 받아 가요!';

  @override
  String get watchAdButtonText => '광고 보고 무료 결과 보기';

  @override
  String useCookiesButtonText(int count) {
    return '포춘쿠키 $count개 사용하기';
  }

  @override
  String get adFailFreePass => '광고를 불러오지 못해 이번에는 무료로 진행합니다.';

  @override
  String get luckyNumberTitle => '나만의 행운 번호';

  @override
  String get luckyNumberSubtitle => 'AI가 생성하는 특별한 행운의 번호';

  @override
  String get luckyNumberGenerateButton => '행운 번호 생성하기';

  @override
  String get luckyNumberGuideText =>
      '포춘알람의 AI 알고리즘을 통해\n당신만을 위한 행운의 번호를 확인해보세요';

  @override
  String get luckyNumberAnalysisStep1 => '행운 데이터 수집 중...';

  @override
  String get luckyNumberAnalysisStep2 => '최근 번호 패턴 분석 중...';

  @override
  String get luckyNumberAnalysisStep3 => '번호별 에너지 분석 중...';

  @override
  String get luckyNumberAnalysisStep4 => '기하학적 패턴 학습 중...';

  @override
  String get luckyNumberAnalysisStep5 => 'AI 예측 모델 가중치 적용 중...';

  @override
  String get luckyNumberAnalysisStep6 => '최적의 행운 조합 산출 중...';

  @override
  String get luckyNumberAnalysisStep7 => '분석 완료! 행운 번호 생성';

  @override
  String get luckyNumberAnalysisFinal => '데이터 최종 처리 중...';

  @override
  String get luckyNumberAnalyzing => '에너지 분석 중...';

  @override
  String get luckyNumberGeometric => '기하학적 분석...';

  @override
  String get luckyNumberPatterns => '패턴 매칭...';

  @override
  String get luckyNumberEnergy => '에너지 조화 작업...';

  @override
  String get luckyNumberCompleted => '분석 완료!';

  @override
  String get luckyNumberShare => '결과 공유';

  @override
  String get luckyNumberRestart => '다시 시도';

  @override
  String get luckyNumberGenerating => '행운 번호 생성 중...';

  @override
  String get luckyNumberResultTitle => '행운의 번호 생성 완료';

  @override
  String get luckyNumberResultSubtitle => '6개 번호 + 보너스 번호';

  @override
  String get luckyNumberDisclaimer =>
      '※ 본 서비스는 재미를 위한 서비스로, 제공된 번호는 AI 알고리즘에 의해 생성된 참고용 번호이며 실제 당첨을 보장하지 않습니다.';

  @override
  String get luckyNumberShareTitle => '오늘의 행운 번호';

  @override
  String get luckyNumberShareDescription => '포춘알람이 분석한 행운의 번호입니다.';

  @override
  String luckyNumberSetLabel(String label) {
    return '세트 $label';
  }

  @override
  String get luckyNumberRegenerateButton => '번호 다시 생성하기';

  @override
  String get luckyNumberFeatureAiTitle => 'AI 추천';

  @override
  String get luckyNumberFeatureAiDesc => '스마트 알고리즘';

  @override
  String get luckyNumberFeatureSmartTitle => '스마트';

  @override
  String get luckyNumberFeatureSmartDesc => '행운 번호 추천';

  @override
  String get luckyNumberFeatureDataTitle => '데이터 분석';

  @override
  String get luckyNumberFeatureDataDesc => '최적 조합';

  @override
  String get fortunePassTitle => '포춘패스 프리미엄';

  @override
  String get fortunePassTabFree => '무료 충전소';

  @override
  String get fortunePassTabPremium => '포춘패스 구독';

  @override
  String get fortunePassFreeChargeTitle => '광고를 보고 무료로 포춘쿠키를 충전하세요!';

  @override
  String get fortunePassFreeChargeButton => '광고 보고 무료 충전 (+1개)';

  @override
  String get fortunePassActivePlan => '현재 구독 중인 요금제';

  @override
  String get fortunePassNoSubscription => '구독 정보가 없습니다';

  @override
  String get fortunePassRestore => '복원하기';

  @override
  String get fortunePassMonth1Title => '1개월 구독';

  @override
  String get fortunePassMonth1Desc => '월 정액제';

  @override
  String get fortunePassMonth6Title => '6개월 구독';

  @override
  String get fortunePassMonth6Desc => '180일 정액제';

  @override
  String get fortunePassYear1Title => '12개월 구독';

  @override
  String get fortunePassYear1Desc => '1년 정액제';

  @override
  String get fortunePassBestPlan => '인기 요금제';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '$percent% 타임세일!';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% OFF';
  }

  @override
  String get fortunePassPerMonth => ' /월';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return '총 $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => '월 정가';

  @override
  String get fortunePassUnit6Months => '6개월';

  @override
  String get fortunePassUnitYear => '년';

  @override
  String get fortunePassMyCookies => '보유 중인 포춘쿠키';

  @override
  String get fortunePassCurrentStatus => '이용권 상태';

  @override
  String get fortunePassStatusPremium => '프리미엄 패스 이용 중';

  @override
  String get fortunePassStatusFree => '일반 이용자';

  @override
  String get fortunePassStoreErrorTitle => '구독 불가';

  @override
  String get fortunePassStoreErrorContent =>
      '현재 스토어에서 상품 정보를 가져올 수 없습니다.\n\n[확인 사항]\n1. Google Play / App Store 로그인 상태\n2. 인터넷 연결 확인\n3. 테스트 기기 등록 여부';

  @override
  String fortunePassSubscribeSale(int percent) {
    return '$percent% 할인 받고 구독하기';
  }

  @override
  String get fortunePassSubscribeNow => '지금 바로 구독하기';

  @override
  String get fortunePassApplied => '포춘패스 구독이 적용되었습니다.';

  @override
  String get fortunePassApplyFailed => '구독 적용에 실패했습니다. 네트워크를 확인해주세요.';

  @override
  String get fortunePassRestored => '구매 내역을 복원했습니다.';

  @override
  String get fortunePassRestoreFailed => '구매 내역 복원에 실패했습니다.';

  @override
  String get fortunePassTimeSaleTitle => '잠깐만요! 선물이 도착했어요 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return '기본 가격 연 ₩$price';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '연 ₩$price';
  }

  @override
  String get fortunePassTimeSaleBadge => '3분 내 구독 시 50% 할인 혜택!';

  @override
  String get fortunePassTimeSaleButton => '할인받고 프로 시작하기';

  @override
  String get fortunePassTimeSaleCancel => '아쉽지만 다음에 할게요';

  @override
  String get fortunePassTimeSaleStartMessage =>
      '3분 할인 혜택이 시작되었습니다! 상단 배너를 확인하세요.';

  @override
  String get fortunePassSubscribeButton => '지금 바로 구독하기';

  @override
  String get fortunePassSubscribeDiscountButton => '50% 할인 받고 구독하기';

  @override
  String get fortunePassCookieBalance => '보유 중인 포춘쿠키';

  @override
  String fortunePassCookieCount(int count) {
    return '$count개';
  }

  @override
  String get fortunePassActive => '패스 사용 중';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return '총 ₩$price / $unit';
  }

  @override
  String get fortunePassPopularPlan => '인기 요금제';

  @override
  String get fortunePassPricePerMonth => ' /월';

  @override
  String get fortunePassPaymentFailed => '결제 요청에 실패했습니다.';

  @override
  String get fortunePassSubscriptionFailed => '구독 적용에 실패했습니다. 네트워크를 확인해주세요.';

  @override
  String get fortunePassSubscriptionSuccess => '포춘패스 구독이 적용되었습니다.';

  @override
  String get fortunePassCannotSubscribeTitle => '구독 불가';

  @override
  String get fortunePassCannotSubscribeMessage =>
      '현재 스토어에서 상품 정보를 가져올 수 없습니다.\n\n[확인 사항]\n1. Google Play / App Store 로그인 상태\n2. 인터넷 연결 확인\n3. 테스트 기기 등록 여부';

  @override
  String get year => '년';

  @override
  String get month => '월';

  @override
  String get day => '일';

  @override
  String get sajuProfileTitle => '대표 사주정보 수정';

  @override
  String get sajuNameLabel => '이름';

  @override
  String get sajuNameHint => '이름을 입력해주세요';

  @override
  String get sajuNameHelper => '한글 최대 6자';

  @override
  String get sajuGenderLabel => '성별';

  @override
  String get sajuGenderMale => '남자';

  @override
  String get sajuGenderFemale => '여자';

  @override
  String get sajuBirthDateLabel => '생년월일';

  @override
  String get sajuBirthTimeLabel => '태어난 시간';

  @override
  String get sajuUnknownTime => '시간 모름';

  @override
  String get sajuEditComplete => '수정 완료';

  @override
  String get sajuSolar => '양력';

  @override
  String get sajuLunar => '음력';

  @override
  String get sajuSelectBirthDate => '생년월일 선택';

  @override
  String get sajuSelectBirthTime => '태어난 시간 선택';

  @override
  String get compatibilityTitle => '궁합 보기';

  @override
  String get compatibilityInputHeader => '두 분의 정보를 입력해주세요';

  @override
  String get compatibilityInputSubtitle => '사주 정보를 바탕으로 정확한 궁합을 분석해드립니다.';

  @override
  String get compatibilityMyInfo => '나의 정보';

  @override
  String get compatibilityInputMyNameGuide => '나의 이름을 입력해주세요';

  @override
  String get compatibilityInputPartnerNameGuide => '상대방의 이름을 입력해주세요';

  @override
  String get compatibilityPartnerInfo => '상대방의 정보';

  @override
  String get compatibilityLoadSaved => '저장된 정보 불러오기';

  @override
  String get compatibilityTitleBest => '천생연분이에요! ❤️';

  @override
  String get compatibilityDescBest => '더 이상 바랄 게 없는 최고의 궁합입니다. 서로를 놓치지 마세요!';

  @override
  String get compatibilityDescBest_Youth =>
      '두 분은 풋풋하고 열정적인 사랑을 나눌 최고의 파트너입니다. 서로의 꿈을 응원하며 함께 성장하는 모습이 너무 아름답네요! 학업이나 진로 고민을 함께 나누며 서로에게 긍정적인 자극이 되어주는 관계입니다. 지금처럼 서로를 아끼고 배려한다면 그 어떤 시련도 함께 이겨낼 수 있는 천생연분입니다.';

  @override
  String get compatibilityDescBest_Mature =>
      '인생의 중요한 시기에 서로에게 든든한 버팀목이 되어줄 최고의 궁합입니다. 신뢰를 바탕으로 안정적이고 깊은 사랑을 만들어갈 수 있습니다. 현실적인 문제들을 함께 해결해 나가는 과정에서 서로의 소중함을 더 크게 느낄 것이며, 가치관이 일치하여 함께 미래를 설계하기에 더할 나위 없이 좋은 인연입니다.';

  @override
  String get compatibilityDescBest_Senior =>
      '인생의 동반자로서 서로에게 따뜻한 위로와 안식처가 되어줄 최고의 인연입니다. 말하지 않아도 마음이 통하는 깊은 교감을 나눌 수 있습니다. 건강과 평안을 함께 챙기며 여유로운 삶을 즐길 수 있는 성숙한 관계입니다. 서로의 삶의 지혜를 존중하고 보듬어주는 모습이 주변의 귀감이 되는 아름다운 동행입니다.';

  @override
  String get compatibilityTitleGreat => '아주 좋은 인연이에요 💕';

  @override
  String get compatibilityDescGreat => '서로에게 큰 힘이 되는 훌륭한 파트너입니다.';

  @override
  String get compatibilityDescGreat_Youth =>
      '서로에게 긍정적인 에너지를 주는 아주 좋은 인연입니다. 함께 있으면 시간 가는 줄 모를 만큼 즐겁고 행복한 시간을 보낼 수 있습니다. 가끔은 서로의 개성 때문에 충돌할 수도 있지만, 대화를 통해 금방 화해하고 더 깊은 사이로 발전할 수 있는 생동감 넘치는 관계입니다.';

  @override
  String get compatibilityDescGreat_Mature =>
      '현실적인 문제들을 함께 지혜롭게 헤쳐 나갈 수 있는 훌륭한 파트너입니다. 서로의 부족한 점을 채워주며 시너지를 내는 관계입니다. 일과 사랑, 가정 사이에서 균형을 잘 잡으며 서로의 발전을 응원하는 성숙한 커플로, 함께할수록 시너지가 빛을 발하는 안정적인 궁합입니다.';

  @override
  String get compatibilityDescGreat_Senior =>
      '건강과 평안을 함께 챙기며 여유로운 삶을 즐길 수 있는 아주 좋은 파트너입니다. 서로의 존재만으로도 큰 힘이 되고 위안이 됩니다. 취미 생활이나 산책 등 소소한 일상을 공유하며 정서적으로 깊은 유대감을 쌓아가는 관계입니다. 서로의 건강을 살뜰히 챙기는 따뜻한 정이 넘치는 인연입니다.';

  @override
  String get compatibilityTitleGood => '잘 어울리는 커플이에요 😊';

  @override
  String get compatibilityDescGood => '약간의 차이는 있지만 서로 맞춰가며 예쁜 사랑을 할 수 있습니다.';

  @override
  String get compatibilityDescGood_Youth =>
      '취향과 가치관이 잘 맞는 커플입니다. 가끔은 티격태격할 수도 있지만, 그 과정조차 서로를 더 깊이 알아가는 소중한 시간이 될 거예요. 서로의 다름을 개성으로 인정해주고 조금씩 양보하는 미덕을 발휘한다면 충분히 행복한 연애를 이어갈 수 있는 좋은 궁합입니다.';

  @override
  String get compatibilityDescGood_Mature =>
      '서로의 가치관을 존중하며 조화롭게 어울리는 커플입니다. 현실과 이상 사이에서 균형을 잘 잡으며 사랑을 키워나갈 수 있습니다. 가끔은 서로의 고집 때문에 갈등이 생길 수 있으나, 서로를 향한 신뢰가 깊어 큰 문제 없이 잘 극복해 나갈 수 있는 건실한 관계입니다.';

  @override
  String get compatibilityDescGood_Senior =>
      '오랜 경험과 지혜를 바탕으로 서로를 보듬어주는 조화로운 커플입니다. 소소한 일상을 공유하며 평온한 행복을 누릴 수 있습니다. 서로의 생활 습관을 존중하고 배려하며 친구처럼 편안하게 지낼 수 있는 관계입니다. 서로의 곁을 든든히 지켜주는 것만으로도 충분히 만족스러운 인연입니다.';

  @override
  String get compatibilityTitleEffort => '노력이 필요해요 🧐';

  @override
  String get compatibilityDescEffort => '서로 다른 점이 많습니다. 이해와 배려가 관계의 핵심입니다.';

  @override
  String get compatibilityDescEffort_Youth =>
      '서로 다른 환경에서 자라온 만큼 맞춰가야 할 부분이 많습니다. 자신의 주장만 내세우기보다 상대방의 마음을 먼저 헤아려보는 노력이 필요해요. 사소한 오해가 커지지 않도록 솔직하게 감정을 표현하고 대화하는 시간을 더 많이 가지는 것이 관계 유지에 큰 도움이 됩니다.';

  @override
  String get compatibilityDescEffort_Mature =>
      '각자의 주관이 뚜렷하여 부딪히는 지점이 생길 수 있습니다. 서로의 생활 방식을 존중하고 조금씩 양보하는 미덕이 관계 유지의 핵심입니다. 현실적인 문제로 갈등이 생길 때는 감정적으로 대응하기보다 차분하게 서로의 입장을 정리해보는 지혜가 필요한 시기입니다.';

  @override
  String get compatibilityDescEffort_Senior =>
      '오랫동안 굳어진 생활 습관 차이로 불편함이 생길 수 있습니다. 서로의 영역을 인정해주고 배려하는 마음이 편안한 관계를 만드는 지름길입니다. 자신의 방식만을 고집하기보다는 상대방의 편안함을 먼저 생각하는 따뜻한 마음이 필요합니다. 함께하는 시간의 질을 높이는 데 집중해보세요.';

  @override
  String get compatibilityTitleDifficult => '많이 맞춰가야 해요 😅';

  @override
  String get compatibilityDescDifficult =>
      '성격 차이가 클 수 있습니다. 서로의 다름을 깊이 이해해야 합니다.';

  @override
  String get compatibilityDescDifficult_Youth =>
      '성격이나 라이프스타일의 차이가 크게 느껴질 수 있습니다. 감정적으로 대응하기보다 차분한 대화를 통해 서로의 다름을 인정하는 법을 배워야 합니다. 서로를 바꾸려 하기보다 있는 그대로의 모습을 받아들이는 인내가 관계의 열쇠가 될 것입니다.';

  @override
  String get compatibilityDescDifficult_Mature =>
      '가치관의 차이나 현실적인 문제로 고민이 깊어질 수 있습니다. 깊은 이해와 인내가 필요하며, 서로의 차이를 인정하려는 의지가 중요합니다. 서로에게 너무 많은 것을 기대하기보다 작은 것부터 감사하는 마음을 가져보세요. 대화의 방식을 바꿔보는 것도 좋은 해결책이 될 수 있습니다.';

  @override
  String get compatibilityDescDifficult_Senior =>
      '서로의 고집이 강해 소통에 어려움을 겪을 수 있습니다. 과거의 경험에 얽매이기보다 현재의 상대방을 있는 그대로 받아들이는 노력이 중요합니다. 침묵보다는 따뜻한 말 한마디가 관계 개선의 시작이 될 수 있습니다. 서로의 독립성을 존중하면서도 최소한의 예의를 갖추는 자세가 필요합니다.';

  @override
  String get compatibilityAdvice_Youth =>
      '서로의 꿈을 공유하고 응원하는 시간을 더 많이 가져보세요. 함께 새로운 취미를 시작하거나 여행을 떠나는 등 다채로운 경험을 쌓는 것이 관계에 큰 활력이 됩니다. 대화할 때는 비판보다는 공감을 먼저 해주세요.';

  @override
  String get compatibilityAdvice_Mature =>
      '바쁜 일상 속에서도 둘만의 시간을 확보하는 것이 중요합니다. 서로의 노고를 인정해주고 따뜻한 말 한마디를 건네보세요. 기념일을 챙기거나 정기적으로 데이트를 즐기며 연애 초기의 설렘을 잊지 않도록 노력하는 자세가 필요합니다.';

  @override
  String get compatibilityAdvice_Senior =>
      '건강을 함께 챙기며 산책이나 가벼운 여행을 즐겨보세요. 서로의 삶의 지혜를 나누며 정서적인 유대감을 쌓는 것이 좋습니다. 무리한 활동보다는 함께 편안하게 쉴 수 있는 시간을 늘려보세요. 서로의 건강 상태를 수시로 체크하며 보살피는 마음이 중요합니다.';

  @override
  String get compatibilityLuck_Youth =>
      '두 분의 에너지가 결합되어 학업이나 커리어에서 큰 성취를 이룰 수 있는 운세입니다. 서로가 서로에게 행운의 마스코트가 되어주어 계획하는 일들이 술술 풀리는 좋은 기운이 감돕니다.';

  @override
  String get compatibilityLuck_Mature =>
      '함께 자산을 관리하거나 미래를 설계할 때 큰 행운이 따르는 궁합입니다. 시너지가 매우 좋아 경제적으로 안정되고 사회적 지위도 동반 상승할 수 있는 강력한 재물운과 성공운이 있습니다.';

  @override
  String get compatibilityLuck_Senior =>
      '정서적인 안정과 평안이 깃드는 운세입니다. 서로가 서로에게 최고의 건강 보조제가 되어주어 무병장수하며 평온한 노후를 보낼 수 있는 복된 기운이 가득합니다. 자손들에게도 긍정적인 영향을 주는 덕망 있는 인연입니다.';

  @override
  String get tarotLoveMeaning0_Senior => '새로운 설렘보다는 일상의 작은 변화에서 즐거움을 찾는 시기입니다.';

  @override
  String get tarotLoveDetail0_Senior =>
      '거창한 계획보다는 오랜 시간 쌓아온 당신만의 노하우와 재능을 주변 사람들과 나누어 보세요. 누군가에게 도움을 주거나 조언을 해주는 과정에서 큰 보람과 깊은 유대감을 느끼게 될 것입니다.';

  @override
  String get tarotLoveMeaning1_Senior => '지혜롭고 차분한 대화가 관계를 더욱 깊게 만듭니다.';

  @override
  String get tarotLoveDetail1_Senior =>
      '상대방의 말을 경청하고 공감해 주는 것만으로도 충분한 시기입니다. 서두르지 말고 천천히 마음을 나누다 보면, 말하지 않아도 통하는 깊은 유대감을 느낄 수 있을 것입니다. 자신의 내면을 가꾸는 시간도 가져보세요.';

  @override
  String get tarotLoveMeaning2_Senior => '포용력 있는 마음이 주변 사람들을 행복하게 합니다.';

  @override
  String get tarotLoveDetail2_Senior =>
      '따뜻한 어머니 같은 마음으로 주변을 돌보게 되는 시기입니다. 배우자나 가족들에게 건네는 따뜻한 말 한마디가 큰 힘이 되어 돌아올 것입니다. 집안에 평화가 가득하니 여유로운 마음으로 일상을 즐기세요.';

  @override
  String get tarotLoveMeaning3_Senior => '책임감 있는 태도가 가정의 화목을 지킵니다.';

  @override
  String get tarotLoveDetail3_Senior =>
      '가정 내에서 중심을 잡고 이끌어가야 할 시기입니다. 때로는 엄격할 필요도 있겠지만, 결국은 가족을 향한 깊은 사랑이 바탕이 되어야 합니다. 당신의 헌신과 노력이 가족들에게 안정감을 줄 것입니다.';

  @override
  String get tarotLoveMeaning4_Senior => '전통과 예의를 중시하며 안정적인 관계를 유지합니다.';

  @override
  String get tarotLoveDetail4_Senior =>
      '오랜 시간 지켜온 가치관이나 규칙이 관계에 안정을 줍니다. 주변의 조언에 귀를 기울이되, 당신의 신념을 잃지 마세요. 예의를 갖춘 정중한 태도가 상대방에게 깊은 신뢰를 줄 것입니다.';

  @override
  String get tarotLoveMeaning5_Senior => '선택의 기로에서 신중함이 필요한 시기입니다.';

  @override
  String get tarotLoveDetail5_Senior =>
      '주변의 유혹이나 새로운 변화보다는 현재의 소중한 인연에 집중하세요. 마음이 흔들릴 때는 당신의 풍부한 인생 경험을 되새겨보는 것이 도움이 됩니다. 올바른 선택이 결국 평온한 미래를 가져다줄 것입니다.';

  @override
  String get tarotLoveMeaning6_Senior => '강한 의지로 어려움을 극복하고 화합을 이룹니다.';

  @override
  String get tarotLoveDetail6_Senior =>
      '갈등이 생기더라도 포기하지 말고 대화로 풀어가세요. 당신의 굳건한 의지와 인내심이 결국 좋은 결실을 맺게 할 것입니다. 함께 목표를 세우고 노력하는 과정에서 더욱 끈끈한 정이 생길 것입니다.';

  @override
  String get tarotLoveMeaning7_Senior => '인내와 자애로움으로 관계를 부드럽게 만듭니다.';

  @override
  String get tarotLoveDetail7_Senior =>
      '강요하기보다는 부드러운 설득과 이해가 필요한 시기입니다. 당신의 성숙한 태도가 상대방의 마음을 움직이게 될 것입니다. 화를 내기보다는 한 번 더 웃어주는 여유를 가져보세요.';

  @override
  String get tarotLoveMeaning8_Senior => '고독 속에서 진정한 자아를 발견하고 지혜를 얻습니다.';

  @override
  String get tarotLoveDetail8_Senior =>
      '잠시 혼자만의 시간을 가지며 지나온 삶을 돌아보는 것도 좋습니다. 고요함 속에서 얻은 깨달음이 앞으로의 관계를 더욱 풍요롭게 만들 것입니다. 서두르지 말고 천천히 자신과 마주해 보세요.';

  @override
  String get tarotLoveMeaning9_Senior => '운명의 흐름에 몸을 맡기고 변화를 받아들이세요.';

  @override
  String get tarotLoveDetail9_Senior =>
      '예상치 못한 변화가 생기더라도 당황하지 마세요. 이는 더 나은 미래를 위한 과정일 수 있습니다. 긍정적인 마음으로 변화를 수용한다면, 새로운 행운이 당신의 인연에 찾아올 것입니다.';

  @override
  String get tarotLoveMeaning10_Senior => '냉철한 판단과 정의로운 태도가 신뢰를 쌓습니다.';

  @override
  String get tarotLoveDetail10_Senior =>
      '감정에 치우치기보다는 객관적인 시각으로 상황을 바라보세요. 공정하고 정직한 태도가 주변 사람들에게 존경을 받게 할 것입니다. 옳고 그름을 분명히 하되, 따뜻한 배려도 잊지 마세요.';

  @override
  String get tarotLoveMeaning11_Senior => '인내와 희생이 더 큰 사랑으로 돌아옵니다.';

  @override
  String get tarotLoveDetail11_Senior =>
      '당장의 보상을 바라기보다는 묵묵히 자리를 지키며 헌신하는 시기입니다. 당신의 진심이 결국 상대방에게 전달되어 깊은 감동을 줄 것입니다. 어려운 상황도 지혜롭게 견뎌내면 결국 빛을 보게 될 것입니다.';

  @override
  String get tarotLoveMeaning12_Senior => '불필요한 것을 비우고 새로운 시작을 준비하세요.';

  @override
  String get tarotLoveDetail12_Senior =>
      '과거의 집착이나 낡은 습관을 버려야 할 때입니다. 비워낸 자리에 새로운 희망과 기운이 채워질 것입니다. 변화를 두려워하지 말고 용기 있게 한 걸음을 내디뎌 보세요.';

  @override
  String get tarotLoveMeaning13_Senior => '절제와 조화를 통해 평온한 관계를 유지합니다.';

  @override
  String get tarotLoveDetail13_Senior =>
      '지나치지 않도록 마음을 다스리고 균형을 잡는 것이 중요합니다. 서로의 다름을 인정하고 조화를 이루려 노력할 때 진정한 평화가 찾아옵니다. 소박한 일상에서 행복을 찾아보세요.';

  @override
  String get tarotLoveMeaning14_Senior => '본능적인 욕구보다는 이성적인 통제가 필요한 시기입니다.';

  @override
  String get tarotLoveDetail14_Senior =>
      '집착이나 구속보다는 자유롭고 편안한 관계를 지향하세요. 마음속의 어두운 그림자를 걷어내고 밝은 곳으로 나아가려 노력해야 합니다. 스스로를 사랑하는 마음이 관계 개선의 시작입니다.';

  @override
  String get tarotLoveMeaning15_Senior => '갑작스러운 변화 속에서도 흔들림 없는 중심을 잡으세요.';

  @override
  String get tarotLoveDetail15_Senior =>
      '예기치 못한 갈등이 생길 수 있지만, 이는 오히려 관계를 재정비할 기회가 됩니다. 당황하지 말고 차분하게 대처한다면, 더욱 단단한 유대감을 형성할 수 있을 것입니다.';

  @override
  String get tarotLoveMeaning16_Senior => '희망의 별빛이 당신의 인연을 밝게 비춥니다.';

  @override
  String get tarotLoveDetail16_Senior =>
      '어려운 시기가 지나고 평화와 안식이 찾아오는 시기입니다. 미래에 대한 긍정적인 꿈을 꾸며 함께 계획을 세워보세요. 당신의 밝은 에너지가 주변 사람들에게도 큰 기쁨이 될 것입니다.';

  @override
  String get tarotLoveMeaning17_Senior => '불안함을 떨쳐내고 직관을 믿으며 나아가세요.';

  @override
  String get tarotLoveDetail17_Senior =>
      '마음속의 의구심보다는 서로에 대한 신뢰를 먼저 생각하세요. 안개 걷힌 뒤의 맑은 하늘처럼, 시간이 지나면 진실이 드러날 것입니다. 조급해하지 말고 차분하게 기다리는 지혜가 필요합니다.';

  @override
  String get tarotLoveMeaning18_Senior => '밝은 태양 아래 기쁨과 축복이 가득한 시기입니다.';

  @override
  String get tarotLoveDetail18_Senior =>
      '활기차고 긍정적인 에너지가 넘쳐나는 때입니다. 가족이나 지인들과 함께 즐거운 시간을 보내며 행복을 만끽하세요. 당신의 밝은 미소가 모든 갈등을 녹여줄 것입니다.';

  @override
  String get tarotLoveMeaning19_Senior => '노력에 대한 결실을 보고 새로운 도약을 준비하세요.';

  @override
  String get tarotLoveDetail19_Senior =>
      '그동안의 노고가 인정받고 보람을 느끼게 되는 시기입니다. 기쁜 소식이 들려올 수 있으니 열린 마음으로 받아들이세요. 과거를 정리하고 새로운 희망을 향해 나아갈 때입니다.';

  @override
  String get tarotLoveMeaning20_Senior => '완성과 조화를 이루어 최고의 행복을 누립니다.';

  @override
  String get tarotLoveDetail20_Senior =>
      '오랜 여정 끝에 얻은 평온함과 만족감이 가득한 시기입니다. 더 이상 바랄 것 없는 완벽한 조화를 이루며 일상의 행복을 즐기세요. 당신의 지혜가 주변을 밝히는 빛이 될 것입니다.';

  @override
  String get tarotLoveMeaning21_Senior => '자유롭고 순수한 마음으로 일상의 즐거움을 만끽하세요.';

  @override
  String get tarotLoveDetail21_Senior =>
      '얽매이지 않는 자유로운 영혼으로 주변 사람들과 어울려 보세요. 새로운 만남이나 경험이 당신의 삶에 활력을 불어넣어 줄 것입니다. 가벼운 마음으로 세상을 바라보는 여유를 가지세요.';

  @override
  String get tarotWealthMeaning0_Senior => '안정적인 자산 관리와 나눔의 지혜가 필요한 시기입니다.';

  @override
  String get tarotWealthDetail0_Senior =>
      '새로운 투자보다는 현재의 자산을 잘 지키고 관리하는 것에 집중하세요. 당신의 경험을 바탕으로 가족이나 주변 사람들에게 경제적인 도움이나 조언을 주는 것도 큰 보람이 될 것입니다.';

  @override
  String get tarotWealthMeaning1_Senior => '지식과 경험을 활용한 수익 창출이 기대됩니다.';

  @override
  String get tarotWealthDetail1_Senior =>
      '오랜 시간 쌓아온 당신만의 전문 지식이나 기술이 경제적인 가치로 돌아올 수 있습니다. 조급해하지 말고 차분하게 기회를 기다린다면 좋은 결실을 맺을 것입니다.';

  @override
  String get tarotWealthMeaning2_Senior => '풍요로운 결실을 가족과 함께 나누는 기쁨을 누리세요.';

  @override
  String get tarotWealthDetail2_Senior =>
      '집안에 재물이 모이고 안정을 찾는 시기입니다. 당신의 넉넉한 마음이 주변을 따뜻하게 만들고, 그 복이 다시 당신에게 돌아올 것입니다. 여유로운 마음으로 일상을 즐기세요.';

  @override
  String get tarotSuccessMeaning0_Senior => '새로운 도전보다는 유종의 미를 거두는 것이 중요한 때입니다.';

  @override
  String get tarotSuccessDetail0_Senior =>
      '그동안 일궈온 성과를 잘 정리하고 마무리하는 것에 집중하세요. 당신의 성공은 결과보다 그 과정에서 보여준 성실함과 지혜에 있습니다. 주변에 긍정적인 영향력을 전파하세요.';

  @override
  String get tarotSuccessMeaning1_Senior => '내면의 평화와 정신적인 성장이 진정한 성공입니다.';

  @override
  String get tarotSuccessDetail1_Senior =>
      '사회적인 지위나 명예보다는 당신의 마음이 얼마나 평온한지가 중요합니다. 명상이나 독서 등을 통해 내면을 가꾸는 시간을 가져보세요. 깊은 통찰력이 당신을 더욱 빛나게 할 것입니다.';

  @override
  String get tarotSuccessMeaning2_Senior => '가정의 화목과 건강이 최고의 성취입니다.';

  @override
  String get tarotSuccessDetail2_Senior =>
      '가족들과 화목하게 지내고 건강을 유지하는 것만으로도 충분히 성공한 삶입니다. 소소한 일상에서 행복을 찾고 감사하는 마음을 가지세요. 당신의 존재 자체가 가족들에게 큰 힘이 됩니다.';

  @override
  String get tarotWealthMeaning3_Senior => '책임감 있는 자산 운용이 가문의 번영을 가져옵니다.';

  @override
  String get tarotWealthDetail3_Senior =>
      '안정적인 수입원과 계획적인 소비를 통해 가계의 안정을 유지하세요. 당신의 경제적 지혜가 자녀들에게 큰 교훈이 될 것입니다.';

  @override
  String get tarotWealthMeaning4_Senior => '전통적인 방식의 저축과 관리가 유리한 시기입니다.';

  @override
  String get tarotWealthDetail4_Senior =>
      '복잡한 금융 상품보다는 검증된 방식의 자산 관리를 권장합니다. 신중하고 보수적인 태도가 재산을 지키는 핵심입니다.';

  @override
  String get tarotWealthMeaning5_Senior => '재물과 관련된 선택에서 인생의 지혜를 발휘하세요.';

  @override
  String get tarotWealthDetail5_Senior =>
      '욕심을 부리기보다는 현재의 삶에 만족하며 내실을 기하는 것이 좋습니다. 올바른 선택이 노후의 평안을 보장합니다.';

  @override
  String get tarotWealthMeaning6_Senior => '어려운 경제 상황도 인내심으로 극복할 수 있습니다.';

  @override
  String get tarotWealthDetail6_Senior =>
      '일시적인 자금 압박이 있을 수 있으나, 지혜롭게 대처하면 위기를 기회로 바꿀 수 있습니다. 불필요한 지출을 줄이세요.';

  @override
  String get tarotWealthMeaning7_Senior => '베킒을 통해 더 큰 풍요를 얻게 되는 시기입니다.';

  @override
  String get tarotWealthDetail7_Senior =>
      '주변에 덕을 쌓으면 생각지 못한 곳에서 재물운이 따르게 됩니다. 나눔의 기쁨이 당신의 삶을 더욱 풍성하게 할 것입니다.';

  @override
  String get tarotWealthMeaning8_Senior => '소박한 삶 속에서 진정한 부의 의미를 깨닫습니다.';

  @override
  String get tarotWealthDetail8_Senior =>
      '물질적인 풍요보다 마음의 여유를 찾는 것이 중요합니다. 절제된 생활이 오히려 경제적인 안정을 가져다줄 것입니다.';

  @override
  String get tarotWealthMeaning9_Senior => '재물의 흐름이 바뀌는 시기이니 유연하게 대처하세요.';

  @override
  String get tarotWealthDetail9_Senior =>
      '예상치 못한 수익이나 지출이 생길 수 있습니다. 변화에 순응하며 지혜롭게 자산을 운용한다면 큰 무리가 없을 것입니다.';

  @override
  String get tarotWealthMeaning10_Senior => '공정하고 투명한 재산 관리가 신뢰를 높입니다.';

  @override
  String get tarotWealthDetail10_Senior =>
      '상속이나 증여 등 재산 문제에서 원칙을 지키는 것이 중요합니다. 정직한 태도가 분쟁을 막고 평화를 가져옵니다.';

  @override
  String get tarotWealthMeaning11_Senior => '당장의 이익보다 미래를 위한 희생이 값진 시기입니다.';

  @override
  String get tarotWealthDetail11_Senior =>
      '자녀나 후손을 위한 경제적인 뒷받침이 나중에 큰 보람으로 돌아올 것입니다. 인내심을 갖고 장기적인 관점을 유지하세요.';

  @override
  String get tarotWealthMeaning12_Senior => '재물에 대한 집착을 버리고 마음의 평화를 찾으세요.';

  @override
  String get tarotWealthDetail12_Senior =>
      '비움으로써 오히려 채워지는 신비로운 경험을 하게 될 것입니다. 불필요한 소유욕을 내려놓고 가벼운 마음으로 일상을 대하세요.';

  @override
  String get tarotWealthMeaning13_Senior => '균형 잡힌 소비 습관이 경제적 자유를 줍니다.';

  @override
  String get tarotWealthDetail13_Senior =>
      '수입과 지출의 조화를 꾀하며 무리한 욕심을 경계하세요. 절제된 삶이 당신에게 지속적인 안정을 가져다줄 것입니다.';

  @override
  String get tarotWealthMeaning14_Senior => '물질적인 유혹을 이겨내고 이성적으로 판단하세요.';

  @override
  String get tarotWealthDetail14_Senior =>
      '달콤한 투자 제안이나 무리한 확장을 주의해야 합니다. 당신의 풍부한 경험을 믿고 신중하게 결정하는 것이 재산을 지키는 길입니다.';

  @override
  String get tarotWealthMeaning15_Senior => '갑작스러운 경제적 변화에 침착하게 대응하세요.';

  @override
  String get tarotWealthDetail15_Senior =>
      '위기 상황일수록 기본으로 돌아가는 지혜가 필요합니다. 당황하지 말고 자산 상태를 꼼꼼히 점검하여 피해를 최소화하세요.';

  @override
  String get tarotWealthMeaning16_Senior => '재물운의 밝은 별이 당신의 앞날을 비춥니다.';

  @override
  String get tarotWealthDetail16_Senior =>
      '경제적인 고충이 해결되고 안정적인 흐름이 시작되는 시기입니다. 긍정적인 마음으로 미래를 설계하며 평온을 누리세요.';

  @override
  String get tarotWealthMeaning17_Senior => '불확실한 정보에 현혹되지 말고 직관을 믿으세요.';

  @override
  String get tarotWealthDetail17_Senior =>
      '재물과 관련된 안개가 걷히고 진실이 드러날 때까지 기다리는 인내가 필요합니다. 조급한 결정보다는 시간을 두고 지켜보세요.';

  @override
  String get tarotWealthMeaning18_Senior => '풍요로운 재물운과 함께 기쁨이 가득한 시기입니다.';

  @override
  String get tarotWealthDetail18_Senior =>
      '노력에 대한 충분한 보상이 따르고 경제적인 여유가 생깁니다. 주변 사람들과 행복을 나누며 축복된 시간을 보내세요.';

  @override
  String get tarotWealthMeaning19_Senior => '정당한 보상을 받고 새로운 경제적 계획을 세우세요.';

  @override
  String get tarotWealthDetail19_Senior =>
      '그동안의 성실함이 경제적인 성과로 인정받는 때입니다. 과거를 정리하고 안정적인 미래를 위한 새로운 발걸음을 내디뎌 보세요.';

  @override
  String get tarotWealthMeaning20_Senior => '재물운이 완성되어 더할 나위 없는 풍요를 누립니다.';

  @override
  String get tarotWealthDetail20_Senior =>
      '경제적인 안정이 최고조에 달하며 평온한 노후를 보장받습니다. 당신의 지혜로운 자산 관리가 빛을 발하는 순간입니다.';

  @override
  String get tarotWealthMeaning21_Senior => '재물에 얽매이지 않는 자유로운 풍요를 만끽하세요.';

  @override
  String get tarotWealthDetail21_Senior =>
      '물질적인 소유보다 삶의 즐거움에 가치를 두는 시기입니다. 여유로운 마음으로 세상을 즐기다 보면 재물은 자연스럽게 따라올 것입니다.';

  @override
  String get tarotSuccessMeaning3_Senior => '인생의 경륜이 빛을 발하며 존경을 받는 시기입니다.';

  @override
  String get tarotSuccessDetail3_Senior =>
      '당신의 리더십과 지혜가 주변 사람들에게 큰 귀감이 됩니다. 권위보다는 포용력으로 이끌 때 진정한 성공을 맛보게 될 것입니다.';

  @override
  String get tarotSuccessMeaning4_Senior => '오랜 신념을 지켜온 당신의 삶 자체가 성공입니다.';

  @override
  String get tarotSuccessDetail4_Senior =>
      '흔들림 없이 지켜온 가치관이 결실을 맺는 때입니다. 당신의 원칙 있는 삶이 후배들에게 올바른 길을 제시하는 이정표가 될 것입니다.';

  @override
  String get tarotSuccessMeaning5_Senior => '올바른 가치관 정립이 인생 후반기의 성공을 좌우합니다.';

  @override
  String get tarotSuccessDetail5_Senior =>
      '명예와 실리 사이에서 현명한 선택을 해야 할 시기입니다. 당신의 풍부한 경험을 바탕으로 내린 결정이 평온한 미래를 보장할 것입니다.';

  @override
  String get tarotSuccessMeaning6_Senior => '끈기 있는 노력이 마침내 승리를 가져다줍니다.';

  @override
  String get tarotSuccessDetail6_Senior =>
      '어떤 장애물도 당신의 의지를 꺾을 수 없습니다. 포기하지 않고 나아가는 당신의 모습 자체가 이미 커다란 성공입니다.';

  @override
  String get tarotSuccessMeaning7_Senior => '내면의 강인함이 부드러운 카리스마로 나타납니다.';

  @override
  String get tarotSuccessDetail7_Senior =>
      '부드러움이 강함을 이기는 시기입니다. 인내와 자애로움으로 주변을 포용할 때 당신의 명예는 더욱 드높아질 것입니다.';

  @override
  String get tarotSuccessMeaning8_Senior => '고독한 수행 끝에 얻은 지혜가 최고의 성취입니다.';

  @override
  String get tarotSuccessDetail8_Senior =>
      '남들이 보지 못하는 깊은 진리를 깨닫게 되는 때입니다. 조용한 성찰의 시간이 당신을 더욱 성숙하고 깊이 있는 인간으로 만들 것입니다.';

  @override
  String get tarotSuccessMeaning9_Senior => '변화의 파도를 타고 새로운 기회를 잡으세요.';

  @override
  String get tarotSuccessDetail9_Senior =>
      '인생의 새로운 장이 열리는 시기입니다. 변화를 두려워하지 말고 긍정적으로 수용한다면 예상치 못한 큰 성과를 거둘 것입니다.';

  @override
  String get tarotSuccessMeaning10_Senior => '공명정대한 태도가 당신의 명예를 더욱 빛나게 합니다.';

  @override
  String get tarotSuccessDetail10_Senior =>
      '사사로운 이익보다 정의를 따르는 모습이 주변의 존경을 부릅니다. 당신의 정직함이 결국 가장 큰 성공의 열쇠가 될 것입니다.';

  @override
  String get tarotSuccessMeaning11_Senior => '희생을 두려워하지 않는 고결한 정신이 승리합니다.';

  @override
  String get tarotSuccessDetail11_Senior =>
      '당장은 힘들더라도 숭고한 목표를 위해 인내하는 시기입니다. 당신의 헌신은 훗날 역사와 사람들의 기억 속에 아름다운 성공으로 남을 것입니다.';

  @override
  String get tarotSuccessMeaning12_Senior => '낡은 성공의 기준을 버리고 새로운 가치를 찾으세요.';

  @override
  String get tarotSuccessDetail12_Senior =>
      '과거의 영광에 집착하기보다 현재의 소중함을 깨닫는 것이 중요합니다. 비워냄으로써 얻는 평화가 진정한 인생의 성공입니다.';

  @override
  String get tarotSuccessMeaning13_Senior => '조화와 절제의 미학이 완성되는 시기입니다.';

  @override
  String get tarotSuccessDetail13_Senior =>
      '어느 한쪽으로 치우치지 않는 균형 잡힌 삶이 최고의 미덕입니다. 당신의 절제된 모습이 주변에 평화와 안정을 전파할 것입니다.';

  @override
  String get tarotSuccessMeaning14_Senior => '내면의 어둠을 극복하고 자유를 얻는 것이 성공입니다.';

  @override
  String get tarotSuccessDetail14_Senior =>
      '스스로를 옭아매던 구속에서 벗어나 진정한 자아를 찾으세요. 마음의 자유를 얻는 순간 당신은 세상 누구보다 성공한 사람이 될 것입니다.';

  @override
  String get tarotSuccessMeaning15_Senior => '위기를 기회로 바꾸는 담대함이 필요한 때입니다.';

  @override
  String get tarotSuccessDetail15_Senior =>
      '갑작스러운 변화는 당신을 더 단단하게 만드는 과정입니다. 침착하게 대응하여 새로운 질서를 세울 때 더 큰 성취가 따를 것입니다.';

  @override
  String get tarotSuccessMeaning16_Senior => '희망의 미래를 꿈꾸며 새로운 영감을 얻으세요.';

  @override
  String get tarotSuccessDetail16_Senior =>
      '지친 영혼에 안식이 찾아오고 새로운 꿈이 생기는 시기입니다. 당신의 창의적인 에너지가 주변을 밝히고 행복한 결실을 맺게 할 것입니다.';

  @override
  String get tarotSuccessMeaning17_Senior => '직관을 믿고 묵묵히 당신의 길을 가세요.';

  @override
  String get tarotSuccessDetail17_Senior =>
      '혼란스러운 상황 속에서도 당신의 내면의 목소리에 귀를 기울이세요. 시간이 지나면 당신의 선택이 옳았음이 증명될 것입니다.';

  @override
  String get tarotSuccessMeaning18_Senior => '생명력 넘치는 에너지가 최고의 성취를 가져옵니다.';

  @override
  String get tarotSuccessDetail18_Senior =>
      '몸과 마음이 건강하고 활기찬 시기입니다. 긍정적인 에너지를 주변과 나누며 생의 기쁨을 만끽하는 것이 진정한 성공입니다.';

  @override
  String get tarotSuccessMeaning19_Senior => '부름에 응답하고 새로운 사회적 역할을 수행하세요.';

  @override
  String get tarotSuccessDetail19_Senior =>
      '당신의 경험과 지혜를 필요로 하는 곳이 생깁니다. 새로운 소명 의식을 갖고 사회에 공헌할 때 더 큰 보람과 성공을 느낄 것입니다.';

  @override
  String get tarotSuccessMeaning20_Senior => '인생의 여정을 완성하고 완벽한 조화를 이룹니다.';

  @override
  String get tarotSuccessDetail20_Senior =>
      '더 이상 이룰 것이 없는 완벽한 만족과 평화의 상태입니다. 당신의 삶 자체가 하나의 작품이 되어 주변에 깊은 감동을 줄 것입니다.';

  @override
  String get tarotSuccessMeaning21_Senior => '얽매임 없는 자유로운 삶이 최고의 성공입니다.';

  @override
  String get tarotSuccessDetail21_Senior =>
      '세상의 기준에서 벗어나 당신만의 행복을 즐기세요. 가벼운 마음으로 세상을 여행하듯 살아가는 당신이 진정한 승리자입니다.';

  @override
  String get compatibilityResultButton => '궁합 결과 보기';

  @override
  String get compatibilityDeleteTooltip => '삭제';

  @override
  String get compatibilityGenderMale => '남성';

  @override
  String get compatibilityGenderFemale => '여성';

  @override
  String get compatibilityInputTitle => '궁합 정보 입력';

  @override
  String get tojeongInputTitle => '토정비결 정보 입력';

  @override
  String tojeongCheckFortune(int year) {
    return '$year년\n토정비결을 확인해보세요';
  }

  @override
  String get tojeongInputGuide => '정확한 분석을 위해\n생년월일시를 입력해주세요.';

  @override
  String tojeongViewResult(int year) {
    return '$year년 토정비결 보기';
  }

  @override
  String get tojeongCheckButton => '토정비결 확인하기';

  @override
  String get tojeongSaveAndCheck => '저장하고 토정비결 보기';

  @override
  String get tojeongYearSelect => '운세 년도 선택';

  @override
  String tojeongResultTitle(int year) {
    return '$year년 토정비결';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return '$name님의 $year년 운세';
  }

  @override
  String tojeongGua(String gua) {
    return '괘: $gua';
  }

  @override
  String get tojeongTotalLuck => '총운 (Total Luck)';

  @override
  String get tojeongProcess => '진행 과정';

  @override
  String get tojeongResult => '최종 결과';

  @override
  String get tojeongMonthlyLuck => '월별 운세 (Monthly Fortune)';

  @override
  String get tojeongShareResult => '결과 공유하기';

  @override
  String tojeongShareTitle(int year) {
    return '$year년 토정비결 결과';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return '$name님의 토정비결 총평입니다.\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => '대상 연도';

  @override
  String get sajuDeleteTitle => '사주 정보 삭제';

  @override
  String sajuDeleteConfirm(String name) {
    return '$name님의 정보를 삭제하시겠습니까?';
  }

  @override
  String get sajuProfileSelect => '사주 정보 선택';

  @override
  String get add => '추가';

  @override
  String get modify => '수정';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\n서비스 준비 중입니다.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      '더 정확하고 유용한 운세 정보를 위해\n열심히 준비하고 있어요!';

  @override
  String get goBack => '돌아가기';

  @override
  String get name => '이름';

  @override
  String get nameInputGuide => '이름을 입력해주세요';

  @override
  String get sajuLunarSolar => '양력/음력';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year년 $month월 $day일';
  }

  @override
  String get sajuSelectFortuneYear => '운세 년도 선택';

  @override
  String sajuYearDisplay(int year) {
    return '$year년';
  }

  @override
  String get sajuSelectProfile => '사주 정보 선택';

  @override
  String get male => '남성';

  @override
  String get female => '여성';

  @override
  String get newYearFortuneInputTitle => '신년운세 정보 입력';

  @override
  String newYearFortuneHeader(int year) {
    return '$year년\n나의 운세는 어떨까요?';
  }

  @override
  String get newYearFortuneSubHeader => '정확한 사주 분석을 위해\n생년월일시를 입력해주세요.';

  @override
  String newYearFortuneViewButton(int year) {
    return '$year년 운세 보기';
  }

  @override
  String get newYearFortuneCheckButton => '운세 확인하기';

  @override
  String get newYearFortuneSaveAndCheckButton => '저장하고 운세 보기';

  @override
  String newYearFortuneResultTitle(int year) {
    return '나의 $year년 신년운세';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return '나의 $year년 신년운세 결과';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return '$name님의 신년운세 총평입니다.\n\n$desc...';
  }

  @override
  String get sajuChartTitle => '사주 명식 (Saju Chart)';

  @override
  String get sajuHour => '시주';

  @override
  String get sajuDay => '일주';

  @override
  String get sajuMonth => '월주';

  @override
  String get sajuYear => '년주';

  @override
  String get ohaengAnalysisTitle => '오행 분석 (Five Elements)';

  @override
  String dominantOhaeng(String name, String symbol) {
    return '당신의 대표 오행: $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ 오행은 사주를 구성하는 다섯 가지 기운(목, 화, 토, 금, 수)을 의미합니다. 균형 잡힌 오행이 이상적이지만, 부족하거나 넘치는 기운을 통해 자신의 성향을 파악할 수 있습니다.';

  @override
  String yearlyTotalLuck(int year) {
    return '$year년 총운';
  }

  @override
  String get fortuneDisclaimer => '이 운세는 재미로 보는 것이며, 실제 삶은 본인의 의지에 달려있습니다.';

  @override
  String get compatibilityResultTitle => '궁합 결과';

  @override
  String get compatibilityScore => '궁합 점수';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score점';
  }

  @override
  String get compatibilityShareTitle => '우리의 궁합 결과';

  @override
  String get compatibilityShareResult => '결과 공유하기';

  @override
  String get compatibilityRetryButton => '다른 사람과의 궁합 보기';

  @override
  String get compatibilitySummary => '결과 요약';

  @override
  String get compatibilitySectionLuck => '두 분의 운세 시너지';

  @override
  String get compatibilitySectionAdvice => '관계를 위한 조언';

  @override
  String get compatibilitySectionPositive => '긍정적인 부분';

  @override
  String get compatibilitySectionCaution => '주의할 점';

  @override
  String get compatibilityLunarDisclaimer =>
      '※ 현재 음력 생일은 양력 기준으로 분석되었습니다. 보다 정확한 분석을 위해 추후 음력 변환 기능이 업데이트될 예정입니다.';

  @override
  String get tojeongSaveAndCheckButton => '저장하고 토정비결 보기';

  @override
  String get tojeongSangsuKeyword1 => '강한 추진력과 리더십이 필요한 시기';

  @override
  String get tojeongSangsuKeyword2 => '활발한 대인관계와 즐거움이 가득한 시기';

  @override
  String get tojeongSangsuKeyword3 => '지성과 열정이 빛을 발하는 시기';

  @override
  String get tojeongSangsuKeyword4 => '급격한 변화와 새로운 시작이 예상되는 시기';

  @override
  String get tojeongSangsuKeyword5 => '유연한 태도와 부드러운 소통이 필요한 시기';

  @override
  String get tojeongSangsuKeyword6 => '지혜와 인내심으로 어려움을 극복해야 하는 시기';

  @override
  String get tojeongSangsuKeyword7 => '안정을 추구하며 내실을 다져야 하는 시기';

  @override
  String get tojeongSangsuKeyword8 => '포용력과 따뜻한 마음으로 덕을 쌓아야 하는 시기';

  @override
  String get tojeongJungsuKeyword1 => '귀인의 도움을 만나게 될 것이며';

  @override
  String get tojeongJungsuKeyword2 => '문서나 계약에서 좋은 소식이 있을 것이며';

  @override
  String get tojeongJungsuKeyword3 => '새로운 도전과 변화의 기회를 맞이할 것이며';

  @override
  String get tojeongJungsuKeyword4 => '직장에서의 성공과 명예가 따를 것이며';

  @override
  String get tojeongJungsuKeyword5 => '재물의 흐름을 신중하게 관리해야 할 것이며';

  @override
  String get tojeongJungsuKeyword6 => '건강을 최우선으로 돌봐야 할 것이며';

  @override
  String get tojeongHasuKeyword1 => '큰 성공을 거두게 됩니다.';

  @override
  String get tojeongHasuKeyword2 => '노력한 만큼의 결실을 맺게 됩니다.';

  @override
  String get tojeongHasuKeyword3 => '인내 끝에 위기를 기회로 만들게 됩니다.';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return '올해는 $sangsu 속에서 $jungsu, 결국 $hasu';
  }

  @override
  String get tojeongSangsuDetail1 =>
      '하늘이 돕고 땅이 돕는 형국입니다. 강한 추진력으로 일을 진행하면 큰 성과를 거둘 수 있는 해입니다. 마치 용이 승천하듯 기운이 힘차고 밝습니다. 리더십을 발휘할 기회가 많아지며, 주위의 인정을 받게 됩니다. 다만, 너무 독단적으로 행동하면 주변의 반감을 살 수 있으니 포용력을 갖추는 것이 중요합니다.';

  @override
  String get tojeongSangsuDetail2 =>
      '잔잔한 호수에 돌을 던지니 파문이 이는 격입니다. 기쁨과 즐거움이 많은 해이나, 말실수로 인한 구설수를 조심해야 합니다. 대인 관계가 활발해지고 인기가 높아지지만, 그만큼 시기 질투도 따를 수 있습니다. 즐거운 모임이나 행사에서 좋은 인연을 만날 수 있습니다.';

  @override
  String get tojeongSangsuDetail3 =>
      '밝은 태양이 온 세상을 비추는 것과 같습니다. 지성과 열정이 빛을 발하며, 학문이나 예술 분야에서 두각을 나타낼 수 있습니다. 명예운이 상승하여 이름을 알리게 되나, 불처럼 급한 성격을 다스려야 화를 면합니다. 겉으로는 화려해 보이나 속으로는 외로울 수 있으니 내실을 다져야 합니다.';

  @override
  String get tojeongSangsuDetail4 =>
      '마른하늘에 날벼락이 치듯 급격한 변화가 예상됩니다. 활동적이고 진취적인 기운이 강하여 새로운 일을 시작하기에 좋습니다. 이동수나 변동수가 있어 분주하게 움직이게 됩니다. 시작은 요란하나 끝이 흐지부지될 수 있으니 끈기를 가지고 마무리하는 자세가 필요합니다.';

  @override
  String get tojeongSangsuDetail5 =>
      '부드러운 봄바람이 불어오니 만물이 소생하는 시기입니다. 유연한 태도로 대처하면 막혔던 일이 술술 풀립니다. 사업이나 장사에서 이익을 얻을 수 있으며, 멀리서 좋은 소식이 들려옵니다. 다만, 우유부단함으로 인해 기회를 놓칠 수 있으니 결단력이 필요할 때입니다.';

  @override
  String get tojeongSangsuDetail6 =>
      '깊은 물속을 헤엄치는 듯한 형국입니다. 겉으로는 평온해 보이나 속으로는 근심이 있을 수 있습니다. 지혜를 발휘하여 난관을 극복해야 하며, 무리한 투자나 확장은 피하는 것이 좋습니다. 인내심을 가지고 때를 기다리면 반드시 좋은 날이 올 것입니다. 건강 관리에 유의하세요.';

  @override
  String get tojeongSangsuDetail7 =>
      '태산이 앞을 가로막고 있는 듯하나, 그 산을 넘으면 넓은 평야가 펼쳐집니다. 굳건한 의지로 어려움을 버티면 큰 결실을 맺습니다. 현재의 위치를 지키며 내실을 기하는 것이 유리합니다. 섣부른 변화보다는 안정을 추구하는 것이 좋으며, 신뢰를 쌓는 것이 중요합니다.';

  @override
  String get tojeongSangsuDetail8 =>
      '넓은 대지 위에 씨앗을 뿌리는 시기입니다. 포용력과 인내심으로 주변을 감싸 안으면 덕을 쌓게 됩니다. 어머니와 같은 따뜻한 마음으로 사람을 대하면 귀인의 도움을 받을 수 있습니다. 당장의 성과보다는 미래를 위한 투자가 빛을 발하는 해입니다. 가정에 평화가 깃듭니다.';

  @override
  String get tojeongJungsuDetail1 =>
      '귀인이 문 앞에 당도하니 기쁜 일이 생깁니다. 막혔던 일이 풀리고 재물이 들어오는 운입니다. 협력자를 만나 일을 도모하면 성공 확률이 높아집니다.';

  @override
  String get tojeongJungsuDetail2 =>
      '가정에 경사가 있거나 새로운 식구를 맞이할 수 있습니다. 문서운이 좋아 계약이나 매매에 유리합니다. 다만, 작은 다툼이 큰 싸움으로 번질 수 있으니 언행을 조심하세요.';

  @override
  String get tojeongJungsuDetail3 =>
      '타향에서 뜻을 펼치거나 먼 곳으로 이동할 운입니다. 여행이나 출장을 통해 새로운 기회를 얻을 수 있습니다. 변화를 두려워하지 말고 도전하면 좋은 결과를 얻습니다.';

  @override
  String get tojeongJungsuDetail4 =>
      '관운이 따르니 직장에서 승진하거나 명예를 얻게 됩니다. 시험 합격이나 자격증 취득에 유리한 시기입니다. 자신의 능력을 마음껏 발휘해보세요.';

  @override
  String get tojeongJungsuDetail5 =>
      '재물운이 왕성하나 지출 또한 많아질 수 있습니다. 금전 관리에 철저해야 하며, 충동적인 소비를 자제해야 합니다. 가까운 사람과의 금전 거래는 피하는 것이 좋습니다.';

  @override
  String get tojeongJungsuDetail6 =>
      '건강에 각별히 유의해야 할 시기입니다. 과로를 피하고 충분한 휴식을 취하세요. 예기치 않은 사고나 질병에 대비하여 보험 등을 점검하는 것도 좋습니다.';

  @override
  String get tojeongHasuDetail1 =>
      '결과적으로 모든 일이 순조롭게 풀리고 소원을 성취하게 됩니다. 노력한 만큼의 대가를 반드시 얻게 되며, 주위의 부러움을 사게 됩니다. 초심을 잃지 않으면 복이 오래갈 것입니다.';

  @override
  String get tojeongHasuDetail2 =>
      '과정에서 다소 어려움이 있을 수 있으나, 끈기를 가지고 노력하면 결국에는 목표를 달성합니다. 쉽게 얻어지는 것은 없으니 땀 흘린 만큼의 결실을 맺게 됩니다. 대기만성형 운세입니다.';

  @override
  String get tojeongHasuDetail3 =>
      '뜻하지 않은 난관에 부딪힐 수 있으나, 좌절하지 않고 인내하면 위기를 기회로 바꿀 수 있습니다. 욕심을 버리고 마음을 비우면 오히려 좋은 일이 생깁니다. 전화위복의 지혜가 필요합니다.';

  @override
  String get tojeongGeneralWealthGood =>
      '재물운이 좋습니다. 생각지 못한 곳에서 수익이 발생하거나, 투자한 곳에서 좋은 성과를 거둘 수 있습니다. 다만, 들어오는 만큼 나가는 돈도 있을 수 있으니 저축에 힘쓰세요.';

  @override
  String get tojeongGeneralWealthBad =>
      '재물의 흐름이 원활하지 않을 수 있습니다. 불필요한 지출을 줄이고 절약하는 습관을 들여야 합니다. 금전 거래는 신중하게 하고, 투자는 전문가와 상의하는 것이 좋습니다.';

  @override
  String get tojeongGeneralCareerGood =>
      '직장이나 사업에서 능력을 인정받을 기회가 옵니다. 승진이나 이직, 창업 등 새로운 변화를 시도하기에 좋은 시기입니다. 대인관계를 원만히 하면 더 큰 성과를 얻을 수 있습니다.';

  @override
  String get tojeongGeneralCareerBad =>
      '현 상태를 유지하는 것이 좋습니다. 새로운 일을 벌이기보다는 맡은 일에 충실하며 실력을 쌓는 시기입니다. 동료나 상사와의 관계에서 스트레스를 받을 수 있으니 마음을 편안하게 가지세요.';

  @override
  String get tojeongGeneralLoveGood =>
      '애정운이 상승하여 솔로는 좋은 인연을 만나고, 커플은 사랑이 더욱 깊어집니다. 가정에 웃음꽃이 피고 화목한 분위기가 조성됩니다. 결혼 혼담이 오갈 수도 있는 좋은 시기입니다.';

  @override
  String get tojeongGeneralLoveBad =>
      '사소한 오해로 인해 다툼이 생길 수 있습니다. 서로의 입장을 이해하고 배려하는 마음이 필요합니다. 감정적인 대응보다는 이성적인 대화로 문제를 해결하려고 노력하세요.';

  @override
  String get optional => '선택';

  @override
  String get sajuSolarHint => '토정비결은 음력 생일을 기준으로 분석할 때 가장 정확합니다.';

  @override
  String get yourFortune => '당신의 운세';

  @override
  String get guaUpper => '상괘';

  @override
  String get guaMiddle => '중괘';

  @override
  String get guaLower => '하괘';

  @override
  String get guaCode => '괘 번호';

  @override
  String get viewAgain => '다시 확인하기';

  @override
  String get zodiacAries => '양자리';

  @override
  String get zodiacTaurus => '황소자리';

  @override
  String get zodiacGemini => '쌍둥이자리';

  @override
  String get zodiacCancer => '게자리';

  @override
  String get zodiacLeo => '사자자리';

  @override
  String get zodiacVirgo => '처녀자리';

  @override
  String get zodiacLibra => '천칭자리';

  @override
  String get zodiacScorpio => '전갈자리';

  @override
  String get zodiacSagittarius => '사수자리';

  @override
  String get zodiacCapricorn => '염소자리';

  @override
  String get zodiacAquarius => '물병자리';

  @override
  String get zodiacPisces => '물고기자리';

  @override
  String get elementFire => '불';

  @override
  String get elementEarth => '흙';

  @override
  String get elementAir => '공기';

  @override
  String get elementWater => '물';

  @override
  String get compatibilityCategoryZodiac => '띠 궁합';

  @override
  String get compatibilityCategoryInner => '속마음 궁합';

  @override
  String get compatibilityCategoryConstellation => '별자리 궁합';

  @override
  String get compatibilitySummarySamhap => '최고의 띠 궁합 (삼합)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return '$animal1띠와 $animal2띠는 서로 부족한 점을 채워주는 최고의 궁합입니다. 함께하면 시너지가 나는 관계입니다.';
  }

  @override
  String get compatibilitySummaryYukhap => '아주 좋은 띠 궁합 (육합)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return '$animal1띠와 $animal2띠는 서로 끌리는 매력이 강한 궁합입니다. 처음부터 호감을 느끼기 쉽습니다.';
  }

  @override
  String get compatibilitySummaryChung => '노력이 필요한 관계 (상충)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return '$animal1띠와 $animal2띠는 서로의 기질이 달라 부딪힐 수 있습니다. 서로 다름을 인정하고 배려가 필요합니다.';
  }

  @override
  String get compatibilitySummaryWonjin => '이해와 배려가 필요한 관계 (원진)';

  @override
  String get compatibilityDescWonjin =>
      '가끔 이유 없이 미워지거나 서운할 수 있는 관계입니다. 오해를 줄이도록 대화를 많이 하는 것이 좋습니다.';

  @override
  String get compatibilitySummaryDefaultZodiac => '무난한 띠 궁합';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return '$animal1띠와 $animal2띠는 크게 부딪힘 없이 무난하게 잘 어울리는 관계입니다.';
  }

  @override
  String get compatibilitySummaryCheonganHap => '영혼의 단짝 (천간합)';

  @override
  String get compatibilityDescCheonganHap =>
      '두 사람의 성격과 가치관이 찰떡궁합입니다. 말하지 않아도 서로의 마음을 잘 알아주는 소울메이트입니다.';

  @override
  String get compatibilitySummarySangsaeng => '서로 돕는 관계 (상생)';

  @override
  String get compatibilityDescSangsaeng =>
      '서로에게 힘이 되어주고 발전할 수 있도록 돕는 긍정적인 관계입니다.';

  @override
  String get compatibilitySummarySanggeuk => '조율이 필요한 관계 (상극)';

  @override
  String get compatibilityDescSanggeuk =>
      '성격 차이가 있을 수 있으나, 서로의 단점을 보완해줄 수 있는 관계이기도 합니다.';

  @override
  String get compatibilitySummaryDefaultInner => '친구 같은 편안함';

  @override
  String get compatibilityDescDefaultInner =>
      '비슷한 성향을 가지고 있어 친구처럼 편안하게 지낼 수 있는 관계입니다.';

  @override
  String get compatibilitySummarySameElement => '같은 성향의 만남';

  @override
  String compatibilityDescSameElement(String element) {
    return '두 분 다 \'$element\'의 성향을 가지고 있어 가치관이나 행동 방식이 매우 비슷합니다.';
  }

  @override
  String get compatibilitySummaryCompatibleElement => '잘 어울리는 조화';

  @override
  String get compatibilityDescCompatibleElement =>
      '서로 다른 매력이 있지만 조화롭게 어우러지는 관계입니다.';

  @override
  String get compatibilitySummaryIncompatibleElement => '서로 다른 매력';

  @override
  String get compatibilityDescIncompatibleElement =>
      '서로 다른 기질을 가지고 있어 처음에는 낯설 수 있지만, 서로를 알아가는 즐거움이 있습니다.';

  @override
  String get compatibilitySummaryDefaultConstellation => '평범한 조화';

  @override
  String get compatibilityDescDefaultConstellation =>
      '별자리로 보았을 때 무난하게 어울리는 관계입니다.';

  @override
  String get routineMorningTitle => '상쾌한 아침입니다! ☀️';

  @override
  String get routineMorningBody => '오늘 계획한 루틴 미션들을 잊지 않으셨나요?';

  @override
  String get routineEveningTitle => '오늘 하루도 수고 많으셨어요! ✨';

  @override
  String get routineEveningBody => '오늘의 미션을 모두 수행하셨나요? 루틴을 마무리해보세요.';

  @override
  String get routineCheckTitle => '오늘의 미션을 확인해보세요! 🚀';

  @override
  String get routineCheckBody => '루틴 미션을 지키고 기분 좋은 하루를 만들어봐요.';

  @override
  String get supplementNotificationTitle => '영양제 알림';

  @override
  String get waterNotificationTitle => '물 마시기 알림';

  @override
  String get routineNotificationTitle => '데일리 루틴 알림';

  @override
  String get routineNotificationDescription => '루틴 미션 수행을 위해 오전/오후에 알림을 드립니다.';

  @override
  String get morningRoutineTime => '오전 루틴 알림 시간';

  @override
  String get eveningRoutineTime => '오후 루틴 알림 시간';

  @override
  String get todaysFortuneNotificationTitle => '오늘의 운세';

  @override
  String get afternoonFortuneNotificationBody => '오후의 운세는 어떨까요? 지금 바로 확인해 보세요!';

  @override
  String get morningFortuneNotificationBody => '오늘의 운세를 확인하고 활기차게 시작해 보세요!';

  @override
  String get fortunePassExpiryTitle => '포춘 패스 오늘 만료';

  @override
  String get fortunePassExpiryBody =>
      '오늘 포춘 패스 멤버십이 만료됩니다. 혜택을 계속 누리시려면 갱신해 보세요!';

  @override
  String get takeNow => '지금 먹기';

  @override
  String get later => '나중에';

  @override
  String get turnOffAlarmAction => '알람 끄기';

  @override
  String get todaysFortuneNotification => '오늘의 운세 알림';

  @override
  String get enableNotification => '알림 활성화';

  @override
  String get fortuneNotificationDescription => '지정한 시간에 오늘의 운세를 알려드립니다.';

  @override
  String get morningNotificationTime => '오전 알림 시간';

  @override
  String get afternoonNotificationTime => '오후 알림 시간';

  @override
  String get morningFortuneTitle => '오늘의 운세 (오전)';

  @override
  String get afternoonFortuneTitle => '오늘의 운세 (오후)';

  @override
  String get type => '유형';

  @override
  String get supplementChannelDesc => '영양제 섭취 알림 채널입니다.';

  @override
  String get waterChannelDesc => '물 마시기 습관을 위한 알림 채널입니다.';

  @override
  String get waterSummaryTitle => '물 마시기 알림';

  @override
  String get dailyRoutineChannelDesc => '오늘의 미션을 확인하고 습관을 만드는 알림 채널입니다.';

  @override
  String get dailyRoutineSummaryTitle => '데일리 루틴 알림';

  @override
  String get missionChannelName => '미션 알림';

  @override
  String get missionChannelDesc => '일반 미션 수행을 위한 알림 채널입니다.';

  @override
  String get fortuneChannelName => '운세 알림';

  @override
  String get fortuneChannelDesc => '매일 아침 운세 확인을 위한 알림 채널입니다.';

  @override
  String get subscriptionChannelName => '구독 알림';

  @override
  String get subscriptionChannelDesc => '포춘 패스 만료 및 구독 관련 알림 채널입니다.';

  @override
  String get alarmChannelName => '알람';

  @override
  String get alarmChannelDesc => '기상 및 미션 수행을 위한 알람 채널입니다.';

  @override
  String get shareViaKakao => '카카오톡으로 공유';

  @override
  String get shareViaSNS => '기타 SNS 공유 (Instagram, Twitter 등)';

  @override
  String get checkDetailResult => '자세한 결과 확인하기';

  @override
  String get viewMyFortuneResult => '나의 운세 결과 확인하기';

  @override
  String get takeSupplementNow => '영양제 챙겨 드세요!';

  @override
  String get takeNowQuestion => '지금 드시겠습니까?';

  @override
  String get eatNow => '지금 먹을게요';

  @override
  String get eatLater => '나중에 먹을게요';

  @override
  String snoozeMessageGeneric(int minutes) {
    return '$minutes분 후에 다시 알려드릴게요.';
  }

  @override
  String get hours => '시간';

  @override
  String get cheeringMessage4 => '활기찬 아침, 행복한 시작!';

  @override
  String get cheeringMessage5 => '미소 짓는 하루 되세요.';

  @override
  String get cheeringMessage6 => '오늘 하루도 힘내세요!';

  @override
  String get cheeringMessage7 => '당신은 오늘 충분히 빛날 거예요.';

  @override
  String get cheeringMessage8 => '좋은 일이 생길 것 같은 예감!';

  @override
  String get cheeringMessage9 => '오늘도 수고 많으셨습니다. 힘찬 시작!';

  @override
  String get cheeringMessage10 => '행복은 늘 당신 곁에 있어요.';

  @override
  String get cheeringMessage11 => '오늘도 당신의 꿈을 응원합니다.';

  @override
  String get cheeringMessage12 => '상쾌한 아침, 기분 좋은 하루!';

  @override
  String get cheeringMessage13 => '오늘 하루도 승리하세요!';

  @override
  String get cheeringMessage14 => '당신은 존재만으로도 소중합니다.';

  @override
  String get cheeringMessage15 => '기분 좋은 일이 가득한 하루 되세요.';

  @override
  String get cheeringMessage16 => '오늘 하루도 반짝반짝 빛나길!';

  @override
  String get cheeringMessage17 => '당신의 미소가 세상을 밝힙니다.';

  @override
  String get cheeringMessage18 => '오늘 하루도 당신답게!';

  @override
  String get cheeringMessage19 => '설레는 마음으로 오늘을 시작해요.';

  @override
  String get cheeringMessage20 => '당신을 위한 멋진 하루가 기다려요.';

  @override
  String get cheeringMessage21 => '오늘 하루도 긍정의 힘으로!';

  @override
  String get cheeringMessage22 => '당신이 가는 길을 응원합니다.';

  @override
  String get cheeringMessage23 => '오늘 하루도 최고로 만드세요!';

  @override
  String get cheeringMessage24 => '행운이 당신과 함께하길!';

  @override
  String get cheeringMessage25 => '오늘 하루도 따뜻하게 보내세요.';

  @override
  String get cheeringMessage26 => '당신은 할 수 있어요!';

  @override
  String get cheeringMessage27 => '오늘 하루도 감사하며 시작해요.';

  @override
  String get cheeringMessage28 => '당신의 가치는 무한합니다.';

  @override
  String get cheeringMessage29 => '오늘 하루도 웃음꽃 피우세요.';

  @override
  String get cheeringMessage30 => '좋은 사람들과 좋은 시간 보내길!';

  @override
  String get cheeringMessage31 => '오늘 하루도 꿈을 향해 한 걸음!';

  @override
  String get cheeringMessage32 => '당신은 오늘 가장 멋진 사람입니다.';

  @override
  String get cheeringMessage33 => '기적 같은 하루가 찾아올 거예요.';

  @override
  String get cheeringMessage34 => '오늘 하루도 여유롭게 즐기세요.';

  @override
  String get cheeringMessage35 => '당신의 노력은 배신하지 않아요.';

  @override
  String get cheeringMessage36 => '오늘 하루도 건강하게 보내세요.';

  @override
  String get cheeringMessage37 => '당신은 사랑받기 위해 태어난 사람!';

  @override
  String get cheeringMessage38 => '오늘 하루도 용기 있게!';

  @override
  String get cheeringMessage39 => '밝은 미래가 당신을 기다립니다.';

  @override
  String get cheeringMessage40 => '오늘 하루도 열정 가득하게!';

  @override
  String get cheeringMessage41 => '당신의 마음이 평안하길 바랍니다.';

  @override
  String get cheeringMessage42 => '오늘 하루도 소소한 행복을 찾으세요.';

  @override
  String get cheeringMessage43 => '당신은 이미 충분히 잘하고 있어요.';

  @override
  String get cheeringMessage44 => '오늘 하루도 희망차게 시작해요.';

  @override
  String get cheeringMessage45 => '당신의 친절이 누군가에게 큰 힘이 됩니다.';

  @override
  String get cheeringMessage46 => '오늘 하루도 보람차게 보내세요.';

  @override
  String get cheeringMessage47 => '당신은 세상을 바꾸는 힘이 있습니다.';

  @override
  String get cheeringMessage48 => '오늘 하루도 맑음!';

  @override
  String get cheeringMessage49 => '당신의 매력을 마음껏 발산하세요.';

  @override
  String get cheeringMessage50 => '오늘 하루도 행복으로 꽉 채우세요!';

  @override
  String get locationServiceDisabled => '위치 서비스가 꺼져 있습니다.';

  @override
  String get locationPermissionDenied => '위치 권한이 거부되었습니다.';

  @override
  String get locationPermissionPermanentlyDenied => '위치 권한이 영구적으로 거부되었습니다.';

  @override
  String get deleteMissionTitle => '미션 삭제';

  @override
  String get yesDelete => '네, 삭제할게요';

  @override
  String get waterAlarmTitle => '물 마실 시간이에요! 💧';

  @override
  String get waterAlarmBody => '건강을 위해 시원한 물 한 잔 어떠세요?';

  @override
  String get supplementAlarmBody => '오늘의 영양제, 잊지 말고 지금 챙겨 드세요.';

  @override
  String get waterHabitChannelDesc => '물 마시기 습관을 위한 알림 채널입니다.';

  @override
  String get pleaseSolveMath => '문제를 풀어주세요.';

  @override
  String detectedLabel(String labels) {
    return '[인식됨: $labels]';
  }

  @override
  String get defaultSleepDuration => '7시간 30분';

  @override
  String get year2024Name => '갑진년(푸른 용의 해)';

  @override
  String get year2025Name => '을사년(푸른 뱀의 해)';

  @override
  String get year2026Name => '병오년(붉은 말의 해)';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle 문의] $title';
  }

  @override
  String get summary => '요약';

  @override
  String get monthlySummary => '월간 요약';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month월 성공률: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return '$month월 기록 없음';
  }

  @override
  String get missionRecord => '미션 기록';

  @override
  String get supplementRecord => '섭취 기록';

  @override
  String get timeSaleCatchChance => '50% 할인 기회를 꼭 잡으세요!';
}
