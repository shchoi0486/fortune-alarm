// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'फॉर्च्यून अलार्म';

  @override
  String get morningGreeting =>
      'शुभ प्रभात! अपने भाग्यशाली दिन की शुरुआत करें।';

  @override
  String get missionWakeUp => 'वेक-अप मिशन';

  @override
  String get missionSupplement => 'सप्लीमेंट लेना';

  @override
  String get missionWater => '2L से अधिक पानी पीना';

  @override
  String get fortuneCookie => 'फॉर्च्यून कुकी';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get alarm => 'अलार्म';

  @override
  String get calendar => 'कैलेंडर';

  @override
  String get mission => 'मिशन';

  @override
  String get fortune => 'भाग्य';

  @override
  String get congratulations => 'बधाई हो!';

  @override
  String get allMissionsCompleted => 'आपने आज के सभी 5 मिशन पूरे कर लिए हैं।';

  @override
  String get rewardReceived =>
      'आपको इनाम के रूप में 1 फॉर्च्यून कुकी मिली है! 🥠';

  @override
  String get confirm => 'ठीक है';

  @override
  String get exactAlarmPermissionRequired =>
      'सटीक समय पर अलार्म बजाने के लिए \"सटीक अलार्म\" अनुमति आवश्यक है।';

  @override
  String get overlayPermissionRequired =>
      'फुल स्क्रीन नोटिफिकेशन के लिए \"अन्य ऐप्स के ऊपर दिखाएं\" अनुमति आवश्यक है।';

  @override
  String get deleteAllAlarms => 'सभी अलार्म हटाएं';

  @override
  String get noAlarms => 'कोई अलार्म पंजीकृत नहीं है।';

  @override
  String get lessThanAMinuteRemaining => 'एक मिनट से कम समय में बजेगा';

  @override
  String hoursMinutesRemaining(int hours, int minutes) {
    return '$hours घंटे $minutes मिनट में बजेगा';
  }

  @override
  String minutesRemaining(int minutes) {
    return '$minutes मिनट में बजेगा';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward => 'दैनिक फॉर्च्यून कुकी इनाम';

  @override
  String get missionRewardInfo =>
      '5 मिशन सफल होने पर 1, 10 मिशन सफल होने पर 2!';

  @override
  String get dailyMission => 'आज का मिशन';

  @override
  String goalAchieved(int completed) {
    return '🎉 $completed/5 लक्ष्य प्राप्त हुआ!';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 पूर्ण';
  }

  @override
  String get myMissionRecord => 'मेरा मिशन रिकॉर्ड';

  @override
  String get consecutiveSuccess => 'लगातार सफलता';

  @override
  String get successRate30Days => 'सफलता दर (30 दिन)';

  @override
  String get totalSuccess => 'कुल सफलता';

  @override
  String get inProgress => 'प्रगति में 🔥';

  @override
  String get resetMissions => 'मिशन रीसेट करें';

  @override
  String get resetMissionsConfirm =>
      'क्या आप सभी मिशन सूचियों को रीसेट करना चाहते हैं?\n(बेसिक सिस्टम मिशन को छोड़कर)';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get reset => 'रीसेट';

  @override
  String get addMission => 'मिशन जोड़ें';

  @override
  String get completedMissions => 'पूरे किए गए मिशन';

  @override
  String greeting(String userName) {
    return 'नमस्ते, $userName';
  }

  @override
  String get welcomeFortune => 'रहस्यमय भाग्य की दुनिया में आपका स्वागत है';

  @override
  String get luckyColor => 'भाग्यशाली रंग';

  @override
  String get luckyItem => 'भाग्यशाली वस्तु';

  @override
  String get luckyDirection => 'शुभ दिशा';

  @override
  String get viewVariousFortunes => 'विभिन्न भाग्य देखें';

  @override
  String get todaysRecommendation => 'आज की सिफारिश';

  @override
  String get checkTodaysFortune => 'आज का भाग्य जांचें';

  @override
  String get todaysAdvice => 'रहस्यमय सितारों से आज की सलाह';

  @override
  String get viewSpecificDateFortune => 'विशिष्ट तिथि भाग्य';

  @override
  String get lottoRecommendation => 'लोट्टो नंबर सिफारिश';

  @override
  String get luckyNumber => 'भाग्यशाली नंबर';

  @override
  String get specificDateFortune => 'विशिष्ट तिथि भाग्य';

  @override
  String get specialDayFortune => 'विशेष दिन का भाग्य';

  @override
  String get newYearFortune => 'नया साल भाग्य';

  @override
  String get totalFortune2025 => '2025 का कुल भाग्य';

  @override
  String get traditionalFortune => 'पारंपरिक भाग्य';

  @override
  String get traditionalSaju => 'पारंपरिक साजू व्याख्या';

  @override
  String get faceReading => 'चेहरा पढ़ना';

  @override
  String get faceFate => 'चेहरा भाग्य भाग्य';

  @override
  String get compatibility => 'अनुकूलता';

  @override
  String get relationshipHarmony => 'रिश्तों का सामंजस्य';

  @override
  String get general => 'सामान्य';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get darkModeDescription => 'स्क्रीन को डार्क पर सेट करें।';

  @override
  String get alarmSettings => 'अलार्म सेटिंग्स';

  @override
  String get information => 'जानकारी';

  @override
  String get notice => 'सूचना';

  @override
  String get weatherConditionSunny => 'साफ़';

  @override
  String get weatherConditionCloudy => 'बादल';

  @override
  String get weatherConditionFoggy => 'कोहरा';

  @override
  String get weatherConditionRainy => 'बारिश';

  @override
  String get weatherConditionSnowy => 'बर्फ';

  @override
  String get weatherConditionThunderstorm => 'आंधी';

  @override
  String get airQualityGood => 'अच्छा';

  @override
  String get airQualityNormal => 'सामान्य';

  @override
  String get airQualityBad => 'खराब';

  @override
  String get airQualityVeryBad => 'बहुत खराब';

  @override
  String get locationUnknown => 'अज्ञात स्थान';

  @override
  String get locationError => 'स्थान त्रुटि';

  @override
  String get faq => 'अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get sendFeedback => 'प्रतिक्रिया भेजें';

  @override
  String get feedbackDescription =>
      'फॉर्च्यून अलार्म का उपयोग करते समय आपको होने वाली किसी भी असुविधा या सुझाव के बारे में हमें बताएं।\nआपकी बहुमूल्य प्रतिक्रिया हमें बेहतर सेवा बनाने में मदद करती है।';

  @override
  String get reportCopyright => 'कॉपीराइट उल्लंघन की रिपोर्ट करें';

  @override
  String get copyrightDescription =>
      'यदि आपको लगता है कि फॉर्च्यून अलार्म की सामग्री कॉपीराइट का उल्लंघन करती है, तो कृपया ईमेल द्वारा इसकी रिपोर्ट करें।\nहम जांच के बाद तुरंत कार्रवाई करेंगे।';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get alarmOptimization => 'अलार्म ऑप्टिमाइज़ेशन';

  @override
  String get allOptimizationsCompleted =>
      'सभी ऑप्टिमाइज़ेशन सेटिंग्स पूरी हो गईं';

  @override
  String get optimizationNeeded =>
      'सटीक अलार्म के लिए सेटिंग्स की आवश्यकता है।';

  @override
  String get optimizationDescription =>
      'एंड्रॉइड सिस्टम सेटिंग्स के कारण अलार्म में देरी हो सकती है या नहीं बज सकता है। कृपया सभी आइटम की अनुमति दें।';

  @override
  String get allowNotificationPermission => 'नोटिफिकेशन अनुमति दें';

  @override
  String get notificationPermissionDescription =>
      'अलार्म बजने पर नोटिफिकेशन दिखाने के लिए आवश्यक है।';

  @override
  String get excludeBatteryOptimization =>
      'बैटरी ऑप्टिमाइज़ेशन से बाहर निकालें';

  @override
  String get batteryOptimizationDescription =>
      'सुनिश्चित करता है कि बिजली बचत मोड में भी अलार्म तुरंत बजे।';

  @override
  String get allowExactAlarm => 'सटीक अलार्म की अनुमति दें';

  @override
  String get exactAlarmDescription =>
      'सिस्टम द्वारा बिना किसी देरी के अलार्म को समय पर बजाता है।';

  @override
  String get drawOverOtherApps => 'अन्य ऐप्स के ऊपर दिखाएं';

  @override
  String get overlayDescription =>
      'लॉक स्क्रीन या अन्य ऐप्स का उपयोग करते समय भी अलार्म स्क्रीन दिखाता है।';

  @override
  String get allSettingsCompleted => 'सभी सेटिंग्स पूरी हो गई हैं।';

  @override
  String get manualSettingsInfo =>
      'आप एंड्रॉइड सिस्टम सेटिंग्स से सेटिंग्स को मैन्युअल रूप से अक्षम कर सकते हैं।';

  @override
  String get takePhoto => 'फोटो लें';

  @override
  String get selectPhoto => 'फोटो चुनें';

  @override
  String get selectAlarmBackground => 'अलार्म बैकग्राउंड चुनें';

  @override
  String get defaultLabel => 'डिफ़ॉल्ट';

  @override
  String get howToAdd => 'कैसे जोड़ें';

  @override
  String get addAssetInstructions =>
      'assets/images/ फोल्डर में इमेज डालें और pubspec.yaml में रजिस्टर करें।';

  @override
  String get gallery => 'गैलरी';

  @override
  String get ringingNow => 'अभी बज रहा है';

  @override
  String get setTime => 'समय सेट करें';

  @override
  String get repeatDays => 'दोहराने के दिन';

  @override
  String get repeatDaily => 'रोजाना दोहराएं';

  @override
  String get snoozeSettings => 'स्नूज़ सेटिंग्स';

  @override
  String get interval => 'अंतराल';

  @override
  String get wakeUpAlarm => 'अलार्म';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval मिनट, $count बार';
  }

  @override
  String get daySun => 'रवि';

  @override
  String get dayMon => 'सोम';

  @override
  String get dayTue => 'मंगल';

  @override
  String get dayWed => 'बुध';

  @override
  String get dayThu => 'गुरु';

  @override
  String get dayFri => 'शुक्र';

  @override
  String get daySat => 'शनि';

  @override
  String get missionRewardEarned =>
      'बधाई हो! आपने आज 5 मिशन पूरे कर लिए हैं और 1 फॉर्च्यून कुकी जीती है!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Congratulations! You completed $missions missions today and earned $cookies Fortune Cookie(s)!';
  }

  @override
  String daysCount(int count) {
    return '$count दिन';
  }

  @override
  String get user => 'उपयोगकर्ता';

  @override
  String get none => 'कोई नहीं';

  @override
  String minutesLater(int minutes) {
    return '$minutes मिनट बाद';
  }

  @override
  String get countLabel => 'गिनती';

  @override
  String timesCount(int count) {
    return '$count बार (कुल $count)';
  }

  @override
  String get wakeUpMission => 'वेक-अप मिशन';

  @override
  String get alarmSound => 'अलार्म ध्वनि';

  @override
  String get gradualVolume => 'क्रमिक वॉल्यूम';

  @override
  String get vibration => 'कंपन';

  @override
  String get alarmNameAndBackground => 'अलार्म नाम और बैकग्राउंड';

  @override
  String get alarmName => 'अल람 नाम';

  @override
  String get enterAlarmName => 'कृपया अलार्म नाम दर्ज करें';

  @override
  String get save => 'सहेजें';

  @override
  String get missionNone => 'कोई मिशन नहीं';

  @override
  String get missionSnap => 'Snap';

  @override
  String get missionMath => 'गणित';

  @override
  String get missionFortune => 'भाग्य';

  @override
  String get missionShake => 'हिलाना';

  @override
  String get missionFortuneCatch => 'Fortune Catch';

  @override
  String get missionNoDescription => 'बिना किसी मिशन के अलार्म बजेगा।';

  @override
  String get missionCameraDescription =>
      'अलार्म बंद करने के लिए निर्दिष्ट वस्तुओं की क्रम से फोटो लें।';

  @override
  String get missionMathDescription =>
      'अलार्म बंद करने के लिए गणित की समस्याओं को हल करें।';

  @override
  String get missionFortuneDescription => 'भाग्य मिशन चुना गया है।';

  @override
  String get missionShakeDescription => 'अलार्म बंद करने के लिए फोन को हिलाएं।';

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
  String get difficulty => 'कठिनाई';

  @override
  String get difficultyEasy => 'आसान';

  @override
  String get difficultyNormal => 'सामान्य';

  @override
  String get difficultyHard => 'कठिन';

  @override
  String get problemCount => 'प्रश्नों की संख्या';

  @override
  String problemsCount(int count) {
    return '$count प्रश्न';
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
  String get shakeCountLabel => 'हिलाने की संख्या';

  @override
  String missionIndex(int index) {
    return 'मिशन $index';
  }

  @override
  String get ringtoneSelect => 'रिंगटोन चुनें';

  @override
  String get vibrationSelect => 'कंपन पैटर्न चुनें';

  @override
  String get defaultRingtone => 'डिफ़ॉल्ट रिंगटोन';

  @override
  String get classicAlarm => 'क्लासिक अलार्म';

  @override
  String get digitalAlarm => 'डिजिटल अलार्म';

  @override
  String get birdsSound => 'पक्षियों की आवाज़';

  @override
  String get wavesSound => 'लहरों की आवाज़';

  @override
  String get defaultVibration => 'डिफ़ॉल्ट कंपन';

  @override
  String get shortVibration => 'छोटा कंपन';

  @override
  String get longVibration => 'लंबा कंपन';

  @override
  String get heartbeatVibration => 'दिल की धड़कन';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'तेज़ कंपन';

  @override
  String get permissionRequired => 'अनुमति आवश्यक';

  @override
  String get exactAlarmPermissionDesc =>
      'सटीक समय पर अलार्म बजाने के लिए \"शेड्यूल और रिमाइंडर\" अनुमति आवश्यक है।';

  @override
  String get batteryOptimizationPermissionDesc =>
      'अलार्म समय पर बजे इसके लिए बैटरी ऑप्टिमाइज़ेशन को अक्षम करना होगा।';

  @override
  String get overlayPermissionDesc =>
      'मिशन स्क्रीन दिखाने के लिए \"अन्य ऐप्स के ऊपर दिखाएं\" अनुमति आवश्यक है।';

  @override
  String get cameraMissionFirstImageError =>
      'कृपया कम से कम पहली मिशन इमेज सेट करें।';

  @override
  String get cameraMissionSequentialImageError =>
      'कृपया मिशन इमेज को क्रम से सेट करें।';

  @override
  String errorOccurred(String error) {
    return 'त्रुटि हुई: $error';
  }

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get exactAlarmPermissionFail =>
      'अलार्म पंजीकरण विफल। सटीक अलार्म अनुमति आवश्यक है।';

  @override
  String get batteryOptimizationPermissionFail =>
      'अलार्म पंजीकरण विफल। बैटरी ऑप्टिमाइज़ेशन अपवाद अनुमति आवश्यक है।';

  @override
  String get overlayPermissionFail =>
      'अलार्म पंजीकरण विफल। अन्य ऐप्स के ऊपर दिखाएं अनुमति आवश्यक है।';

  @override
  String get unknownAlarmError =>
      'अलार्म रजिस्टर करने में विफल। एक अज्ञात त्रुटि हुई।';

  @override
  String get resetTooltip => 'रीसेट';

  @override
  String get errorLoadingAlarm => 'अलार्म जानकारी लोड करने में विफल।';

  @override
  String get alarmNotFound => 'अलार्म जानकारी नहीं मिली।';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'दोहराएँ अलार्म ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'अलार्म बंद करें';

  @override
  String get startMission => 'मिशन शुरू करें';

  @override
  String get fortuneTitle => 'भाग्य की जाँच करें';

  @override
  String get fortuneMessage =>
      'अपने भाग्य के परिणामों की जाँच करें\nऔर छिपे हुए उपहार प्राप्त करें!';

  @override
  String get fortuneAdButton => 'विज्ञापन देखें और परिणाम जाँचें';

  @override
  String get fortuneLoadingMessage =>
      'भाग्य बताने वाले की विशेष टैरो व्याख्या का अनुभव करें।';

  @override
  String fortuneAnalyzing(int progress) {
    return 'आपके चयनित टैरो का विश्लेषण किया जा रहा है... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'आज की ऊर्जा के बारे में सोचें\nऔर 3 कार्ड चुनें।';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return '$day/$month की ऊर्जा के बारे में सोचें\nऔर 3 कार्ड चुनें।';
  }

  @override
  String get fortuneNewYearButton => '2025 नव वर्ष भाग्य देखें';

  @override
  String get loveFortune => 'प्रेम';

  @override
  String get wealthFortune => 'धन';

  @override
  String get successFortune => 'सफलता';

  @override
  String get fortuneResultTitle => 'यहाँ आज के लिए आपका भाग्य परिणाम है।';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return '$day/$month/$year के लिए भाग्य';
  }

  @override
  String get startDayButton => 'अपना दिन शुरू करें';

  @override
  String get policy => 'शर्तें और गोपनीयता नीति';

  @override
  String get support => 'सहायता';

  @override
  String get defaultAlarmBehavior => 'डिफ़ॉल्ट अलार्म व्यवहार';

  @override
  String get defaultAlarmVolume => 'डिफ़ॉल्ट अलार्म वॉल्यूम';

  @override
  String get defaultAlarmVolumeDescription =>
      'नया अलार्म बनाते समय लागू होने वाला डिफ़ॉल्ट वॉल्यूम।';

  @override
  String get gradualVolumeDescription =>
      'अलार्म की आवाज़ धीरे-धीरे बढ़ने के लिए सेट करता है।';

  @override
  String get defaultVibrationDescription =>
      'नया अलार्म बनाते समय डिफ़ॉल्ट रूप से कंपन सक्षम करता है।';

  @override
  String get defaultInterval => 'डिफ़ॉल्ट अंतराल';

  @override
  String get maxSnoozeCountLabel => 'अधिकतम स्नूज़ संख्या';

  @override
  String get minutes => 'मिनट';

  @override
  String get times => 'बार';

  @override
  String cupsCount(int current, int goal) {
    return '($current/$goal कप)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current/$goal बार)';
  }

  @override
  String get missionGym => 'जिम जाना';

  @override
  String get missionWorkout => 'होम वर्कआउट';

  @override
  String get missionDiary => 'डायरी लिखना';

  @override
  String get missionBedMaking => 'बिस्तर ठीक करना';

  @override
  String get missionStretching => 'स्ट्रेचिंग';

  @override
  String get missionReading => '10 मिनट पढ़ना';

  @override
  String get missionPlanning => 'दिन की योजना बनाना';

  @override
  String get missionBreakfast => 'नाश्ता करना';

  @override
  String get missionMeditation => '5 मिनट ध्यान';

  @override
  String get missionEnglishWords => '5 शब्द सीखना';

  @override
  String get missionVentilation => 'वेंटिलेशन';

  @override
  String get missionCleaning => 'कमरे की सफाई';

  @override
  String get missionGratitudeDiary => 'कृतज्ञता डायरी';

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
  String get shakePhone => 'कृपया फोन को हिलाएं!';

  @override
  String get englishQuizMission => 'अंग्रेजी प्रश्नोत्तरी मिशन';

  @override
  String get quizInstruction =>
      'बाएं तरफ के शब्द और दाएं तरफ के अर्थ को क्रम से क्लिक करें ताकि वे मेल खाएं।';

  @override
  String get missionSuccess => 'मिशन सफल!';

  @override
  String get goHome => 'होम पर जाएं';

  @override
  String get quizWord1 => 'Apple';

  @override
  String get quizWord1Ans => 'सेब';

  @override
  String get quizWord2 => 'Banana';

  @override
  String get quizWord2Ans => 'केला';

  @override
  String get quizWord3 => 'Carrot';

  @override
  String get quizWord3Ans => 'गाजर';

  @override
  String get quizWord4 => 'Dog';

  @override
  String get quizWord4Ans => 'कुत्ता';

  @override
  String get quizWord5 => 'Elephant';

  @override
  String get quizWord5Ans => 'हाथी';

  @override
  String get quizWord6 => 'Flower';

  @override
  String get quizWord6Ans => 'फूल';

  @override
  String get quizWord7 => 'Grapes';

  @override
  String get quizWord7Ans => 'अंगूर';

  @override
  String get quizWord8 => 'House';

  @override
  String get quizWord8Ans => 'घर';

  @override
  String get quizWord9 => 'Ice Cream';

  @override
  String get quizWord9Ans => 'आइसक्रीम';

  @override
  String get quizWord10 => 'Juice';

  @override
  String get quizWord10Ans => 'रस';

  @override
  String get quizWord11 => 'Kangaroo';

  @override
  String get quizWord11Ans => 'कंगारू';

  @override
  String get quizWord12 => 'Lemon';

  @override
  String get quizWord12Ans => 'नींबू';

  @override
  String get quizWord13 => 'Monkey';

  @override
  String get quizWord13Ans => 'बंदर';

  @override
  String get quizWord14 => 'Notebook';

  @override
  String get quizWord14Ans => 'नोटबुक';

  @override
  String get quizWord15 => 'Orange';

  @override
  String get quizWord15Ans => 'संतरा';

  @override
  String get missionComplete => 'मिशन पूरा हुआ';

  @override
  String version(String version) {
    return 'संस्करण $version';
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
  String get labelFineDust => 'बारीक धूल';

  @override
  String get labelUltraFineDust => 'अति सूक्ष्म धूल';

  @override
  String get weatherToday => 'आज का मौसम';

  @override
  String get weatherUpdateMessage =>
      'वर्तमान स्थान के लिए मौसम की जानकारी अपडेट की जा रही है।';

  @override
  String get weatherDisclaimer =>
      'स्थानीय परिस्थितियों या रिसेप्शन स्थिति के आधार पर देखे गए डेटा में भिन्नता हो सकती है।';

  @override
  String get weatherSource =>
      'मौसम विभाग, कोरिया पर्यावरण निगम द्वारा प्रदान किया गया';

  @override
  String get locationPermissionTitle => 'स्थान अनुमति दें';

  @override
  String get locationPermissionDesc =>
      'मौसम की जानकारी प्रदर्शित करने के लिए आवश्यक है।';
}
