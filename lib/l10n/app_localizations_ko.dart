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
  String hoursMinutesRemaining(int hours, int minutes) {
    return '$hours시간 $minutes분 후에 울려요';
  }

  @override
  String minutesRemaining(int minutes) {
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
  String get todaysAdvice => '신비로운 별들이 들려주는 오늘의 조언';

  @override
  String get viewSpecificDateFortune => '지정일 운세보기';

  @override
  String get lottoRecommendation => '로또 번호 추천';

  @override
  String get luckyNumber => '행운의 번호';

  @override
  String get specificDateFortune => '지정일 운세';

  @override
  String get specialDayFortune => '특별한 날 운세';

  @override
  String get newYearFortune => '신년운세';

  @override
  String get totalFortune2025 => '2025년 전체운';

  @override
  String get traditionalFortune => '토정비결';

  @override
  String get traditionalSaju => '전통 사주 풀이';

  @override
  String get faceReading => '관상 보기';

  @override
  String get faceFate => '얼굴 관상 운명';

  @override
  String get compatibility => '궁합 보기';

  @override
  String get relationshipHarmony => '인연과의 조화';

  @override
  String get general => '일반';

  @override
  String get darkMode => '다크 모드';

  @override
  String get darkModeDescription => '화면을 어둡게 설정합니다.';

  @override
  String get alarmSettings => '알람 설정';

  @override
  String get information => '정보';

  @override
  String get notice => '공지사항';

  @override
  String get weatherConditionSunny => '맑음';

  @override
  String get weatherConditionCloudy => '흐림';

  @override
  String get weatherConditionFoggy => '안개';

  @override
  String get weatherConditionRainy => '비';

  @override
  String get weatherConditionSnowy => '눈';

  @override
  String get weatherConditionThunderstorm => '천둥번개';

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
  String get privacyPolicy => '개인정보 처리방침';

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
  String get gallery => '갤러리';

  @override
  String get ringingNow => '지금 울려요';

  @override
  String get setTime => '시간 설정';

  @override
  String get repeatDays => '반복 요일';

  @override
  String get repeatDaily => '매일 반복';

  @override
  String get snoozeSettings => '반복 알람 (스누즈)';

  @override
  String get interval => '간격';

  @override
  String get wakeUpAlarm => '기상 알람';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval분, $count회';
  }

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
  String get none => '없음';

  @override
  String minutesLater(int minutes) {
    return '$minutes분 후';
  }

  @override
  String get countLabel => '횟수';

  @override
  String timesCount(int count) {
    return '$count회 (총 $count번)';
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
  String get alarmName => '알람 이름';

  @override
  String get enterAlarmName => '알람 이름을 입력해주세요';

  @override
  String get save => '저장';

  @override
  String get missionNone => '미션 없음';

  @override
  String get missionSnap => '사물찍기';

  @override
  String get missionMath => '계산 문제';

  @override
  String get missionFortune => '운세';

  @override
  String get missionShake => '흔들기';

  @override
  String get missionFortuneCatch => '포츄니를 잡아라';

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
  String get missionWalk => '걷기';

  @override
  String get missionWalkDescription => '걸어서 알람을 끄세요!';

  @override
  String get missionFaceDescription => '10초간 화면을 응시하여 관상을 확인하세요.';

  @override
  String get walkStepCount => '목표 걸음 수';

  @override
  String walkSteps(int count) {
    return '$count 걸음';
  }

  @override
  String get missionNumberOrder => '숫자 순서';

  @override
  String get missionNumberOrderDescription => '1부터 9까지 순서대로 터치하세요.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return '다음: $nextNumber';
  }

  @override
  String get missionHiddenButton => '위치 기억';

  @override
  String get missionHiddenButtonDescription => '밝아지는 칸의 위치를 순서대로 기억하고 터치하세요.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => '터치 연타';

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
  String get missionLeftRight => '좌우 선택';

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
  String get shakeCount => '흔들기 횟수';

  @override
  String shakeTimes(int count) {
    return '$count회';
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
  String get defaultRingtone => '기본 벨소리';

  @override
  String get classicAlarm => '클래식 알람';

  @override
  String get digitalAlarm => '디지털 알람';

  @override
  String get birdsSound => '새소리';

  @override
  String get wavesSound => '파도 소리';

  @override
  String get defaultVibration => '기본 진동';

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
  String get permissionRequired => '권한 필요';

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
  String get cameraMissionSequentialImageError => '미션 이미지를 순서대로 설정해주세요.';

  @override
  String errorOccurred(String error) {
    return '오류 발생: $error';
  }

  @override
  String get openSettings => '설정 열기';

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
    return '반복 알람 ($current/$max)';
  }

  @override
  String get turnOffAlarm => '알람 끄기';

  @override
  String get startMission => '미션 시작';

  @override
  String get fortuneTitle => '운세 확인하기';

  @override
  String get fortuneMessage => '운세 결과를 확인하고\n숨겨진 선물도 받아 가요!';

  @override
  String get fortuneAdButton => '광고 보고 결과 확인';

  @override
  String get fortuneLoadingMessage => '점신의 특별한 타로 해석을 경험해보세요.';

  @override
  String fortuneAnalyzing(int progress) {
    return '선택한 타로를 분석하고 있어요... $progress%';
  }

  @override
  String get fortuneSelectTitle => '오늘의 기운을 생각하며\n카드 3장을 선택해주세요.';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return '$month월 $day일의 기운을 생각하며\n카드 3장을 선택해주세요.';
  }

  @override
  String get fortuneNewYearButton => '2025 신년운세 보기';

  @override
  String get loveFortune => '애정운';

  @override
  String get wealthFortune => '재물운';

  @override
  String get successFortune => '성공운';

  @override
  String get fortuneResultTitle => '오늘의 운세 결과입니다.';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return '$year년 $month월 $day일의 운세';
  }

  @override
  String get startDayButton => '오늘 하루 시작하기';

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
  String get defaultVibrationDescription => '새 알람 생성 시 진동을 기본으로 켭니다.';

  @override
  String get defaultInterval => '기본 간격';

  @override
  String get maxSnoozeCountLabel => '최대 횟수';

  @override
  String get minutes => '분';

  @override
  String get times => '회';

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
  String get missionEnglishWords => '영어 단어 5개 외우기';

  @override
  String get missionVentilation => '환기 시키기';

  @override
  String get missionCleaning => '방 정리하기';

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
  String get copyEmailAction => '이메일 주소 복사';

  @override
  String get copyEmailSuccessMessage => '이메일 주소가 복사되었습니다. 메일 앱에서 붙여넣어 주세요.';

  @override
  String get supportSubmitButton => '문의 내용 복사하고 보내기';

  @override
  String get shakePhone => '핸드폰을 흔들어주세요!';

  @override
  String get englishQuizMission => '영어 퀴즈 미션';

  @override
  String get quizInstruction => '왼쪽 단어와 오른쪽 뜻을 차례로 눌러 매칭하세요';

  @override
  String get missionSuccess => '미션 성공!';

  @override
  String get goHome => '홈으로';

  @override
  String get quizWord1 => '사과';

  @override
  String get quizWord1Ans => 'apple';

  @override
  String get quizWord2 => '바나나';

  @override
  String get quizWord2Ans => 'banana';

  @override
  String get quizWord3 => '학교';

  @override
  String get quizWord3Ans => 'school';

  @override
  String get quizWord4 => '컴퓨터';

  @override
  String get quizWord4Ans => 'computer';

  @override
  String get quizWord5 => '물';

  @override
  String get quizWord5Ans => 'water';

  @override
  String get quizWord6 => '친구';

  @override
  String get quizWord6Ans => 'friend';

  @override
  String get quizWord7 => '가족';

  @override
  String get quizWord7Ans => 'family';

  @override
  String get quizWord8 => '집';

  @override
  String get quizWord8Ans => 'house';

  @override
  String get quizWord9 => '책';

  @override
  String get quizWord9Ans => 'book';

  @override
  String get quizWord10 => '사랑';

  @override
  String get quizWord10Ans => 'love';

  @override
  String get quizWord11 => '태양';

  @override
  String get quizWord11Ans => 'sun';

  @override
  String get quizWord12 => '달';

  @override
  String get quizWord12Ans => 'moon';

  @override
  String get quizWord13 => '바다';

  @override
  String get quizWord13Ans => 'sea';

  @override
  String get quizWord14 => '하늘';

  @override
  String get quizWord14Ans => 'sky';

  @override
  String get quizWord15 => '나무';

  @override
  String get quizWord15Ans => 'tree';

  @override
  String get missionComplete => '미션 완료!';

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
}
