// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

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
  String get fortuneCookie => 'भाग्य कुकी';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get languageKorean => 'कोरियाई';

  @override
  String get languageEnglish => 'अंग्रेजी';

  @override
  String get languageJapanese => 'जापानी';

  @override
  String get languageChinese => 'चीनी';

  @override
  String get languageRussian => 'रूसी';

  @override
  String get languageHindi => 'हिंदी';

  @override
  String get languageSpanish => 'स्पेनिश';

  @override
  String get languageFrench => 'फ्रेंच';

  @override
  String get languageGerman => 'जर्मन';

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
  String get missionSuccess => 'मिशन सफल!';

  @override
  String get cheeringMessage1 => 'आज का दिन मंगलमय हो!';

  @override
  String get cheeringMessage2 => 'आज मैं आपके साथ हूँ!';

  @override
  String get cheeringMessage3 => 'यह एक शानदार दिन होने वाला है।';

  @override
  String get todaysCheering => 'आज का संदेश';

  @override
  String get notificationWakeUpBody => 'जागने का समय हो गया!';

  @override
  String get notificationMissionBody => 'मिशन पूरा करें और अलार्म बंद करें!';

  @override
  String get notificationSafetyBody =>
      'अलार्म जबरन बंद कर दिया गया था! कृपया मिशन पूरा करें।';

  @override
  String get notificationRingingBody => 'अलार्म बज रहा है!';

  @override
  String get snoozePrefix => '[स्नूज़]';

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
  String hoursMinutesRemaining(String hours, String minutes) {
    return '$hours घंटे $minutes मिनट में बजेगा';
  }

  @override
  String minutesRemaining(String minutes) {
    return '$minutes मिनट में बजेगा';
  }

  @override
  String get am => 'सुबह';

  @override
  String get pm => 'शाम';

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
  String get completedMissions => 'पूर्ण किए गए मिशन';

  @override
  String get noCompletedMissionsHint =>
      'अभी तक कोई मिशन पूरा नहीं हुआ है। आज का लक्ष्य पूरा करें।';

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
  String get checkTodaysFortune => 'आज का भाग्य देखें';

  @override
  String get todaysAdvice => 'आज की सलाह';

  @override
  String get viewSpecificDateFortune => 'किसी विशेष तिथि का भाग्य देखें';

  @override
  String get luckyNumberRecommendation => 'भाग्यशाली नंबरों की सिफारिश';

  @override
  String get luckyNumber => 'भाग्यशाली नंबर';

  @override
  String get specificDateFortune => 'विशिष्ट तिथि का भाग्य';

  @override
  String get specialDayFortune => 'विशेष दिन का भाग्य';

  @override
  String get newYearFortune => 'नया साल भाग्य';

  @override
  String get totalFortune2026 => '2026 का कुल भाग्य';

  @override
  String get traditionalFortune => 'पारंपरिक भविष्यवाणी (Tojeong)';

  @override
  String get traditionalSaju => 'पारंपरिक साजू विश्लेषण';

  @override
  String get faceReading => 'AI चेहरा पढ़ना';

  @override
  String get missionFaceReading => 'चेहरा पढ़ने का मिशन';

  @override
  String get faceFate => 'चेहरा भाग्य';

  @override
  String get compatibility => 'अनुकूलता';

  @override
  String get relationshipHarmony => 'रिश्तों का सामंजस्य';

  @override
  String get ohaengWood => 'लकड़ी';

  @override
  String get ohaengFire => 'अग्नि';

  @override
  String get ohaengEarth => 'पृथ्वी';

  @override
  String get ohaengMetal => 'धातु';

  @override
  String get ohaengWater => 'जल';

  @override
  String get ohaengWoodSymbol => 'लकड़ी';

  @override
  String get ohaengFireSymbol => 'अग्नि';

  @override
  String get ohaengEarthSymbol => 'पृथ्वी';

  @override
  String get ohaengMetalSymbol => 'धातु';

  @override
  String get ohaengWaterSymbol => 'जल';

  @override
  String get ohaengWoodExplanation =>
      'लकड़ी की मजबूत ऊर्जा के साथ, आप विकास और प्रेरणा से भरपूर हैं। आपका स्वभाव दयालु और प्रगतिशील है।';

  @override
  String get ohaengFireExplanation =>
      'अग्नि की प्रबल ऊर्जा के साथ, आप भावुक और विनम्र हैं। आप सक्रिय रहना और प्रभावशाली चीजों को पसंद करते हैं।';

  @override
  String get ohaengEarthExplanation =>
      'पृथ्वी की मजबूत ऊर्जा के साथ, आप विश्वसनीय और सहनशील हैं। आपका स्वभाव गंभीर और स्थिर है।';

  @override
  String get ohaengMetalExplanation =>
      'धातु की मजबूत ऊर्जा के साथ, आप निर्णायक और वफादार हैं। आप सिद्धांतों को महत्व देने वाले और शांत दिमाग के व्यक्ति हैं।';

  @override
  String get ohaengWaterExplanation =>
      'जल की मजबूत ऊर्जा के साथ, आप बुद्धिमान और लचीले हैं। आप चतुर हैं और परिस्थितियों के अनुसार खुद को ढाल लेते हैं।';

  @override
  String get cheonganGap => 'गैप';

  @override
  String get cheonganEul => 'यूल';

  @override
  String get cheonganByeong => 'ब्योंग';

  @override
  String get cheonganJeong => 'जोंग';

  @override
  String get cheonganMu => 'मु';

  @override
  String get cheonganGi => 'गी';

  @override
  String get cheonganGyeong => 'ग्योंग';

  @override
  String get cheonganSin => 'सिन';

  @override
  String get cheonganIm => 'इम';

  @override
  String get cheonganGye => 'ग्ये';

  @override
  String get jijiJa => 'चूहा (Rat)';

  @override
  String get jijiChuk => 'बैल (Ox)';

  @override
  String get jijiIn => 'बाघ (Tiger)';

  @override
  String get jijiMyo => 'खरगोश (Rabbit)';

  @override
  String get jijiJin => 'ड्रैगन (Dragon)';

  @override
  String get jijiSa => 'सांप (Snake)';

  @override
  String get jijiO => 'घोड़ा (Horse)';

  @override
  String get jijiMi => 'बकरी (Goat)';

  @override
  String get jijiSin => 'बंदर (Monkey)';

  @override
  String get jijiYu => 'मुर्गा (Rooster)';

  @override
  String get jijiSul => 'कुत्ता (Dog)';

  @override
  String get jijiHae => 'सुअर (Pig)';

  @override
  String get jijiAnimalRat => 'चूहा';

  @override
  String get jijiAnimalOx => 'बैल';

  @override
  String get jijiAnimalTiger => 'बाघ';

  @override
  String get jijiAnimalRabbit => 'खरगोश';

  @override
  String get jijiAnimalDragon => 'ड्रैगन';

  @override
  String get jijiAnimalSnake => 'सांप';

  @override
  String get jijiAnimalHorse => 'घोड़ा';

  @override
  String get jijiAnimalSheep => 'भेड़';

  @override
  String get jijiAnimalMonkey => 'बंदर';

  @override
  String get jijiAnimalRooster => 'मुर्गा';

  @override
  String get jijiAnimalDog => 'कुत्ता';

  @override
  String get jijiAnimalPig => 'सुअर';

  @override
  String get assetDefaultBackground => 'डिफ़ॉल्ट पृष्ठभूमि';

  @override
  String get assetFortuneyFriends => 'फॉर्च्यूनी मित्र';

  @override
  String get assetMongchuny => 'मोंगचुनी';

  @override
  String get assetPanchuny => 'पांचुनी';

  @override
  String get assetTochuny => 'तोचुनी';

  @override
  String get assetHochuny => 'होचुनी';

  @override
  String get assetBear => 'भालू';

  @override
  String get assetMoon => 'चंद्रमा';

  @override
  String get assetBridge => 'पुल';

  @override
  String get assetRoad => 'सड़क';

  @override
  String get assetSky => 'आकाश';

  @override
  String get assetMinimalGray => 'न्यूनतम ग्रे';

  @override
  String get assetDarkMode => 'डार्क मोड';

  @override
  String get assetSoftBlue => 'सॉफ्ट ब्लू';

  @override
  String get assetWarmBeige => 'वार्म बेज';

  @override
  String assetCat(int number) {
    return 'बिल्ली $number';
  }

  @override
  String assetDog(int number) {
    return 'कुत्ता $number';
  }

  @override
  String assetSea(int number) {
    return 'समुद्र $number';
  }

  @override
  String get categoryCharacter => 'पात्र';

  @override
  String get categoryAnimal => 'जानवर';

  @override
  String get categoryIllustration => 'चित्रण';

  @override
  String get categoryLandscape => 'परिदृश्य';

  @override
  String get categorySimple => 'सरल';

  @override
  String get alarmBackground => 'अलार्म पृष्ठभूमि';

  @override
  String get random => 'यादृच्छिक';

  @override
  String get gallery => 'गैलरी';

  @override
  String get selectSolidColor => 'ठोस रंग चुनें';

  @override
  String get deleteColor => 'रंग हटाएं';

  @override
  String get deleteColorConfirm =>
      'क्या आप वाकई इस रंग को सूची से हटाना चाहते हैं?';

  @override
  String get deleteMission => 'मिशन हटाएं';

  @override
  String get deleteMissionConfirm => 'क्या आप वाकई इस मिशन को हटाना चाहते हैं?';

  @override
  String get randomBackgroundDesc => 'हर बार अलार्म बजने पर एक नई पृष्ठभूमि!';

  @override
  String get backgroundDeleted => 'पृष्ठभूमि छवि हटा दी गई।';

  @override
  String get pickFromDevice => 'डिवाइस से चुनें';

  @override
  String get alarmSaveError => 'अलार्म सहेजने में विफल। एक अज्ञात त्रुटि हुई।';

  @override
  String errorOccurred(String error) {
    return 'त्रुटि हुई: $error';
  }

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get videoLoadFailed =>
      'वीडियो लोड करने में विफल\nपुनः प्रयास करने के लिए टैप करें';

  @override
  String get itsTimeToWakeUp => 'जागने का समय है!';

  @override
  String get dismissAlarm => 'अलार्म बंद करें';

  @override
  String get slideToDismiss => 'बंद करने के लिए स्लाइड करें';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes मिनट x $count बार';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '$minutesमि, असीमित';
  }

  @override
  String get quickAlarm => 'त्वरित अलार्म';

  @override
  String get setQuickAlarm => 'त्वरित अलार्म सेट करें';

  @override
  String addMinutes(String minutes) {
    return '+ $minutes मिनट';
  }

  @override
  String ringingAt(String time) {
    return '$time बजे बजता है';
  }

  @override
  String get pleaseSetTime => 'कृपया समय निर्धारित करें।';

  @override
  String get alarmSaved => 'अलार्म सहेजा गया।';

  @override
  String get alarmScheduledTitle => 'अलार्म निर्धारित';

  @override
  String alarmScheduledBody(String time) {
    return 'अलार्म $time बजे बजेगा।';
  }

  @override
  String get goodDay => 'यह एक अद्भुत दिन होने वाला है!';

  @override
  String get luckyDay => 'आपका दिन भाग्य से भरा हो!';

  @override
  String get cheerUp => 'आपका दिन शानदार और उत्पादक हो!';

  @override
  String get stayHappy => 'आज हर पल का आनंद लें!';

  @override
  String get youCanDoIt => 'आज आप कुछ भी कर सकते हैं!';

  @override
  String get noActiveAlarms => 'कोई सक्रिय अलार्म नहीं';

  @override
  String get wealth => 'धन';

  @override
  String get love => 'रिश्ते';

  @override
  String get career => 'करियर';

  @override
  String get health => 'स्वास्थ्य';

  @override
  String get faceAnalysisBasic => 'चेहरा विश्लेषण (बुनियादी)';

  @override
  String get insufficientDataOverallImpression =>
      'अपर्याप्त माप डेटा, समग्र प्रभाव के आधार पर व्याख्या की गई।';

  @override
  String get noseStabilityWealthAccuracy =>
      'नाक के आकार में स्थिरता धन भाग्य की व्याख्या की सटीकता को बढ़ाती है।';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      'मुंह के आकार में स्पष्टता पारस्परिक और भाषण भाग्य की व्याख्या को परिष्कृत करती है।';

  @override
  String get improveAnalysisQualityAdvice =>
      'बेहतर रोशनी और सामने की ओर मुख करने से विश्लेषण की गुणवत्ता में सुधार होगा।';

  @override
  String get basicAnalysisDescription =>
      'अपर्याप्त चेहरे के आकार/अभिव्यक्ति माप के कारण यह परिणाम बुनियादी व्याख्या के रूप में प्रदर्शित किया गया है।\nसामने की ओर मुख करने और बेहतर रोशनी के साथ आंखों के खुलने, नाक के आकार और मुंह के क्षेत्र जैसे संकेतकों में स्थिरता में सुधार होगा।\nपुनः प्रयास करने से स्कोर वितरण और विवरण अधिक विशिष्ट हो जाएंगे।';

  @override
  String get defaultDailyFortune =>
      'आज का दिन शांत मन से शुरू करने के लिए अच्छा है।\nशीशे में मुस्कान के साथ खुद को सकारात्मक ऊर्जा से भरें।\nथोड़ी सी फुर्सत अप्रत्याशित भाग्य लाती है।';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '$vibeआज, आपका $topKey भाग्य सबसे अधिक उभर कर सामने आता है। दूसरी ओर, $bottomKey पर सावधानीपूर्वक ध्यान देने की आवश्यकता प्रतीत होती है।';
  }

  @override
  String get faceShapeVLine => 'V-आकार';

  @override
  String get faceShapeSquare => 'चौकोर';

  @override
  String get faceShapeBalanced => 'संतुलित';

  @override
  String get faceShapeRound => 'गोल';

  @override
  String get faceShapeLong => 'लंबा';

  @override
  String get faceShapeOval => 'अंडाकार';

  @override
  String get titleWealthOriented => 'धन-उन्मुख चेहरा';

  @override
  String get titleLoveStrong => 'मजबूत रिश्ते भाग्य वाला चेहरा';

  @override
  String get titleCareerNotable => 'उल्लेखनीय करियर भाग्य वाला चेहरा';

  @override
  String get titleStableEnergy => 'स्थिर ऊर्जा वाला चेहरा';

  @override
  String get faceAnalysisComplete => 'चेहरा विश्लेषण पूरा हो गया है!';

  @override
  String get chooseUnlockMethod =>
      'अपने चेहरे में छिपे भाग्य की जांच करने के लिए,\nकृपया नीचे दिए गए तरीकों में से एक चुनें।';

  @override
  String get watchAdForFreeResult => 'मुफ्त परिणाम के लिए विज्ञापन देखें';

  @override
  String get useTwoCookies => '2 फॉर्च्यून कुकीज़ का उपयोग करें';

  @override
  String get checkResult => 'परिणाम जांचें';

  @override
  String get aiAnalyzingFace => 'AI आपके चेहरे का विश्लेषण कर रहा है...';

  @override
  String get faceRecognitionComplete => 'चेहरा पहचान पूरा हुआ';

  @override
  String get extractingFeatures => 'विशेषताएं निकाली जा रही हैं...';

  @override
  String get matchingFortuneData => 'भाग्य डेटा का मिलान किया जा रहा है...';

  @override
  String get adLoadFailedFreeUnlock =>
      'विज्ञापन लोड करने में विफल, इसलिए हमने इसे इस बार मुफ्त में अनलॉक कर दिया।';

  @override
  String get insufficientCookies => 'अपर्याप्त कुकीज़';

  @override
  String get insufficientCookiesDesc =>
      'आपके पास पर्याप्त फॉर्च्यून कुकीज़ नहीं हैं।\nमुफ्त में जांचने के लिए एक विज्ञापन देखें!';

  @override
  String get usingTwoCookiesToast =>
      'परिणाम जांचने के लिए 2 फॉर्च्यून कुकीज़ का उपयोग कर रहे हैं।';

  @override
  String get todaysFaceAnalysis => 'आज का चेहरा विश्लेषण';

  @override
  String totalScoreWithPoints(int score) {
    return 'कुल स्कोर $scoreअंक';
  }

  @override
  String get adLoadFailFreeAccess =>
      'विज्ञापन लोड करने में विफल। इस बार मुफ्त में खोला गया।';

  @override
  String get insufficientCookiesTitle => 'पर्याप्त फॉर्च्यून कुकीज़ नहीं';

  @override
  String get insufficientCookiesMessage =>
      'आपके पास पर्याप्त फॉर्च्यून कुकीज़ नहीं हैं।\nआप मिशन पूरा करके या विज्ञापन देखकर अधिक कमा सकते हैं।';

  @override
  String get useCookiesSnackbar =>
      'परिणामों की जांच के लिए 2 फॉर्च्यून कुकीज़ का उपयोग कर रहे हैं।';

  @override
  String get faceAnalysisComplete_v2 => 'चेहरे का विश्लेषण पूरा हुआ!';

  @override
  String get chooseMethodToViewResult =>
      'अपने चेहरे में छिपे भाग्य की जांच करने के लिए,\nकृपया नीचे दिए गए तरीकों में से एक चुनें।';

  @override
  String get watchAdForFree => 'विज्ञापन देखें और मुफ्त में परिणाम देखें';

  @override
  String get useTwoCookies_v2 => '2 कुकीज़ इस्तेमाल करें';

  @override
  String get viewResult => 'परिणाम देखें';

  @override
  String get aiAnalyzingFace_v2 => 'AI आपके चेहरे का विश्लेषण कर रहा है...';

  @override
  String get faceRecognitionComplete_v2 => 'पहचान पूरी हुई';

  @override
  String get extractingFeatures_v2 => 'विशेषताएँ निकाली जा रही हैं...';

  @override
  String get matchingFortuneData_v2 => 'डेटा मिलाया जा रहा है...';

  @override
  String get wealthLuck => '💰 धन भाग्य';

  @override
  String get loveLuck => '❤️ प्रेम भाग्य';

  @override
  String get careerLuck => '💼 करियर भाग्य';

  @override
  String get healthLuck => '💪 स्वास्थ्य भाग्य';

  @override
  String get tojeongMonthlyGood_0 =>
      'पूर्व से कोई नेक व्यक्ति शुभ समाचार लाता है। लंबे समय से प्रतीक्षित योजनाएं फलीभूत होंगी।';

  @override
  String get tojeongMonthlyGood_1 =>
      'धन वसंत की तरह बहता है। जैसे-जैसे सब कुछ सुचारू रूप से चलता है, चिंताएं दूर हो जाती हैं।';

  @override
  String get tojeongMonthlyGood_2 =>
      'प्रयास रंग लाते हैं और आपको बधाई मिलती है। पदोन्नति या अच्छे परिणाम की उम्मीद है।';

  @override
  String get tojeongMonthlyGood_3 =>
      'अंधेरी रात के बाद सुबह का सूरज उगता है। कष्ट समाप्त होते हैं और खुशियाँ आती हैं।';

  @override
  String get tojeongMonthlyGood_4 =>
      'अप्रत्याशित लाभ आपकी जेब भर देता है। छोटे निवेश बड़े मुनाफे की ओर ले जाते हैं।';

  @override
  String get tojeongMonthlyNeutral_0 =>
      'एक शांतिपूर्ण दैनिक जीवन जारी रहता है। यह बिना किसी विशेष घटना के बीत जाता है।';

  @override
  String get tojeongMonthlyNeutral_1 =>
      'संतोष मन की शांति लाता है। छोटी खुशियों का आनंद लें।';

  @override
  String get tojeongMonthlyNeutral_2 =>
      'अपने व्यस्त जीवन में थोड़ा आराम करें। स्वास्थ्य प्रबंधन पर ध्यान दें।';

  @override
  String get tojeongMonthlyNeutral_3 =>
      'कुछ नया शुरू करने के बजाय अपना वर्तमान कार्य जारी रखें।';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'संचार महत्वपूर्ण है। गलतफहमी से बचने के लिए शब्दों के चयन में सावधानी बरतें।';

  @override
  String get tojeongMonthlyCaution_0 =>
      'हर चीज में सतर्क रहें। पछताने से बेहतर सुरक्षित रहना है।';

  @override
  String get tojeongMonthlyCaution_1 =>
      'स्वास्थ्य पर ध्यान दें और अधिक परिश्रम से बचें।';

  @override
  String get tojeongMonthlyCaution_2 =>
      'गपशप से बचें और दूसरों के काम में दखल न दें।';

  @override
  String get tojeongMonthlyCaution_3 =>
      'अत्यधिक लालच परेशानी लाता है। अपनी क्षमता के अनुसार जिएं।';

  @override
  String get tojeongMonthlyCaution_4 =>
      'पैसे के लेन-देन से बचें क्योंकि आप उन लोगों से निराश हो सकते हैं जिन पर आप भरोसा करते हैं।';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      'नए साल की स्पष्ट ऊर्जा आपके साथ होने पर, जब आप वह करना शुरू कर देंगे जो आपने योजना बनाई है तो चीजें सुचारू रूप से चलने लगेंगी।';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      'साल की शुरुआत में आपको नेक लोगों से मदद मिलेगी, इसलिए अपने आस-पास के लोगों के साथ अपने रिश्तों को संजोकर रखें।';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'यदि आपमें बहुत अधिक प्रेरणा है, तो आप गलत काम भी कर सकते हैं। दीर्घकालिक दृष्टिकोण से शांतिपूर्वक अपनी योजनाओं की समीक्षा करें।';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      'अच्छी शुरुआत तो आधी हो चुकी है। यदि आप साहसपूर्वक वह काम करना शुरू कर देंगे जिसे आप टालते आ रहे हैं, तो आपको अप्रत्याशित परिणाम प्राप्त होंगे।';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      'आदतों में छोटे-छोटे बदलाव आपकी किस्मत की दिशा बदल सकते हैं। जल्दी उठने की आदत डालें।';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      'अभी समय नहीं आया है, इसलिए हमें सतह से नीचे अपनी ताकत मजबूत करनी होगी और अवसरों की तलाश करनी होगी।';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      'पुरानी समस्याएँ या झगड़े सामने आ सकते हैं। इसे टालें नहीं और इससे डटकर निपटें।';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      'यह वह समय है जब बाहरी प्रदर्शन के बजाय पदार्थ का निर्माण करना अधिक महत्वपूर्ण है। जल्दबाजी में उठाया गया कदम नुकसान पहुंचा सकता है।';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      'जिस तरह हम सर्दियों के अंत में वसंत की प्रतीक्षा करते हैं, उसी तरह अवसर उन लोगों के लिए आते हैं जो धैर्य के साथ तैयारी करते हैं।';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      'आपको अपने आस-पास के शोर से परेशान हुए बिना चुपचाप अपने रास्ते पर चलना चाहिए।';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      'सभी चीजों के पुनरुद्धार की ऊर्जा आपके लिए नए अवसर लाती है। संकोच न करें और चुनौती स्वीकार करें।';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      'यही वह महीना है जब किसी नए रिश्ते की शुरुआत हो सकती है। यदि आप सकारात्मक सोच के साथ लोगों के साथ व्यवहार करेंगे तो आपको अच्छे परिणाम प्राप्त होंगे।';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      'परिवर्तन की बयार में ध्यान खोना आसान है। अपने मन पर नियंत्रण रखें ताकि आप छोटे-मोटे भावनात्मक बदलावों से प्रभावित न हों।';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      'ठीक उसी तरह जैसे एक अंकुर ज़मीन से फूटता है, यही वह समय है जब आपकी क्षमता फूटती है। विश्वास रखें।';

  @override
  String get tojeongMonthlySpecial_3_4 =>
      'एक अनमोल रिश्ता आपके पास आएगा, इसलिए अपने दिल का दरवाज़ा खोलें और लोगों का स्वागत करें।';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      'गर्म ऊर्जा से आपका धन बढ़ेगा। आपके प्रयासों का फल वित्तीय पुरस्कार की ओर ले जाएगा।';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      'दस्तावेज़ों के मामले में आपकी किस्मत अच्छी है, इसलिए आपको अनुबंध या परीक्षा में अच्छे परिणाम मिल सकते हैं। कृपया ध्यानपूर्वक समीक्षा करें.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      'अप्रत्याशित खर्चे सामने आ सकते हैं, इसलिए आपको धन प्रबंधन पर विशेष ध्यान देना चाहिए।';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      'यह वह महीना है जब आपका आकर्षण पूरी तरह खिले फूलों की तरह उभरकर सामने आता है। पारस्परिक संबंधों में पहल करें।';

  @override
  String get tojeongMonthlySpecial_4_4 =>
      'यह निवेश करने या अपनी बचत बढ़ाने का अच्छा समय है क्योंकि आपको धन का आशीर्वाद मिलेगा।';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      'चूँकि घर में सौहार्दपूर्ण माहौल है, आप अपने परिवार के साथ अपने रिश्तों में खुशी और स्थिरता पाएंगे।';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      'आप अपने आस-पास के लोगों के प्रति जो दयालुता दिखाएंगे वह आशीर्वाद के रूप में वापस आएगी। पुण्य का संचय कठिनाइयों को हल करने में मदद करता है।';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'छोटी सी गलतफहमी आपके किसी करीबी से झगड़े का कारण बन सकती है। उलटी मुद्रा आवश्यक है.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      'चूँकि यह पारिवारिक महीना है, इसलिए अपने परिवार के साथ समय बिताने पर ध्यान दें। परिवार में सद्भाव ही हर चीज़ का आधार है।';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      'यदि आप मन की शांति के साथ चारों ओर देखते हैं, तो आप उन मूल्यवान चीज़ों की खोज करेंगे जिन्हें आप खो रहे हैं।';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      'आपके प्रयास सफल होंगे और आपको अपने आस-पास के लोगों से पहचान मिलेगी। पदोन्नति या सम्मान का अवसर है.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      'जैसे-जैसे आपकी सक्रिय ऊर्जा मजबूत होती जाती है, किसी नए क्षेत्र में विस्तार करने या नौकरी बदलने पर विचार करना उचित हो सकता है।';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'अगर आप बहुत आगे बढ़ गए तो मुसीबत में पड़ सकते हैं। विनम्र रहें और अपने चारों ओर देखें।';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      'गर्मी शुरू होने से पहले, आपको सहनशक्ति जमा करनी होगी। स्वास्थ्य जांच कराना भी एक अच्छा विचार है।';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      'वर्ष की पहली छमाही समाप्त करने के लिए मध्यावधि समीक्षा के लिए समय निकालें और दूसरी छमाही की योजना बनाएं।';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      'यह वह समय है जब जुनूनी जुनून परिणाम तक ले जाता है। यदि आप साहसपूर्वक आगे बढ़ते हैं, तो आप अपने लक्ष्य प्राप्त कर सकते हैं।';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      'यात्रा या प्रवास के दौरान आपकी मुलाकात किसी मूल्यवान व्यक्ति से हो सकती है या कोई नया अवसर मिल सकता है।';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      'यह एक ऐसा समय है जब आपकी सेहत को आसानी से नुकसान पहुंच सकता है। अत्यधिक काम से बचना और पर्याप्त आराम करना महत्वपूर्ण है।';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      'भीषण गर्मी में भी इसके लिए अथक जुनून की जरूरत होती है। जितना पसीना बहाओगे उतना परिणाम मिलेगा।';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      'आराम के माध्यम से रिचार्ज करने के लिए समय निकालें। लंबी यात्रा सौभाग्य लेकर आती है।';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      'जैसे-जैसे समय बीतता है, धैर्य में धीरे-धीरे सुधार होने लगता है। अधीर न हों और अपने समय की प्रतीक्षा करें।';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      'पुरानी समस्याएं जो सुलझ नहीं पाई थीं, उनका समाधान मिलेगा। इसे हल करने के लिए अपनी बुद्धि का प्रयोग करें।';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      'जब बात सफल होने की हो तो अपनी सतर्कता को कम करना आसान होता है। अंत तक अपने तनाव को जाने न दें।';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      'फलदायी सीज़न से पहले अंतिम उछाल लाने का समय आ गया है। आराम मत करो.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      'कोई अप्रत्याशित मदद करने वाला हाथ है। यदि आपको कठिनाई हो तो अपने आसपास के लोगों से सलाह लें।';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      'प्रचुर फल के मौसम की तरह, यह एक ऐसा समय है जब धन और प्रेम भाग्य दोनों प्रचुर हो जाते हैं।';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      'अगर आप खूब मेहनत करेंगे तो आपको उम्मीद से बेहतर परिणाम मिलेंगे।';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'जिस प्रकार बहुत कुछ अंदर आ रहा है, उसी प्रकार बहुत कुछ बाहर भी जा सकता है। आपको एक स्मार्ट व्यय योजना की आवश्यकता है।';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      'यह सुनहरे खेतों की तरह प्रचुरता का समय है। यदि आपके पास देने वाला हृदय है, तो अधिक से अधिक आशीर्वाद आपके पास आएंगे।';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      'किसी भी गलतफहमी या विवाद को सुलझाने का यह अच्छा समय है। पहले अपना हाथ बढ़ाओ.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      'आपकी प्रसिद्धि बढ़ेगी और आपका नाम दूर-दूर तक मशहूर होगा। आप अपने आस-पास के लोगों का विश्वास हासिल करेंगे।';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      'बौद्धिक गतिविधियों में आप अच्छे नतीजे हासिल कर सकते हैं। यह अपनी पढ़ाई या शोध पर ध्यान केंद्रित करने का अच्छा समय है।';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      'जैसे-जैसे आपका रुतबा बढ़ता है, आपकी ज़िम्मेदारी बड़ी हो जाती है। आपको अपने शब्दों और कार्यों में सावधान रहना चाहिए।';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'आपकी कीर्ति ऊँचे नीले आकाश की भाँति ऊपर उठती है। अपनी क्षमताओं को पूरी तरह उजागर करें।';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      'गहन चिंतन और अध्ययन के माध्यम से आंतरिक ज्ञान विकसित करने के लिए यह एक अच्छा महीना है।';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      'यह वह समय है जब हमें पिछले वर्ष पर नजर डालने और भविष्य के लिए तैयारी करने के लिए ज्ञान की आवश्यकता है। चिंतन के माध्यम से, आप अगले स्तर तक बढ़ेंगे।';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      'आपको वित्तीय स्थिरता मिलेगी, लेकिन आपको बड़े मुनाफ़े के चक्कर में अत्यधिक निवेश नहीं करना चाहिए।';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      'आप अपने रिश्तों में अकेलापन महसूस कर सकते हैं। सबसे पहले, आपको खुले दिमाग से लोगों से संपर्क करने का प्रयास करना होगा।';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      'ठंडी हवा चलने पर अपने कॉलर को एडजस्ट करने की तरह, आपको व्यावहारिकता का ध्यान रखने और अपनी आंतरिक शक्ति को मजबूत करने की आवश्यकता है।';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      'जैसे-जैसे हम वर्ष समाप्त करते हैं, हमें यह देखने के लिए ज्ञान की आवश्यकता होती है कि हमारे पास क्या कमी थी और अगले वर्ष के लिए तैयारी करें।';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      'वर्ष के अंत में अप्रत्याशित भाग्य आता है। वित्तीय लाभ या अच्छी खबर की उम्मीद करें।';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      'आपको लंबे समय तक की गई अपनी मेहनत का इनाम मिलेगा। यह तेल की खूबसूरती हासिल करने का महीना है।';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      'बार-बार इकट्ठा होना आपके स्वास्थ्य को नुकसान पहुंचा सकता है या अनावश्यक खर्च का कारण बन सकता है, इसलिए संयम आवश्यक है।';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      'अंत एक नई शुरुआत है. पछतावे के बजाय आशापूर्ण भविष्य की योजना बनाकर वर्ष का अंत करें।';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      'यदि आप गर्मजोशी से साझा करने का अभ्यास करते हैं, तो वह गर्मजोशी सौभाग्य के रूप में आपके पास लौट आएगी।';

  @override
  String get todaysFaceFortune => 'आज का मुख भाग्य';

  @override
  String get detailedAnalysis => 'विस्तृत विश्लेषण';

  @override
  String get eyeInsight => '👁️ आँखें (दृष्टि)';

  @override
  String get noseWealth => '👃 नाक (धन)';

  @override
  String get mouthLateLuck => '👄 मुँह (भविष्य)';

  @override
  String get overallAnalysisTitle => 'समग्र विश्लेषण';

  @override
  String get shareResultTitle => 'आज का परिणाम';

  @override
  String shareResultDesc(String title) {
    return 'AI चेहरा विश्लेषण परिणाम।\n$title';
  }

  @override
  String get shareResultTotalScore => 'कुल स्कोर';

  @override
  String get shareResultWealth => 'धन';

  @override
  String get shareResultLove => 'प्रेम';

  @override
  String get shareResultCareer => 'करियर';

  @override
  String get shareResultHealth => 'स्वास्थ्य';

  @override
  String get shareResultText => 'परिणाम साझा करें';

  @override
  String get wakeUpComplete => 'जागना सफल!';

  @override
  String get collapseOptions => 'विकल्प संक्षिप्त करें';

  @override
  String get expandOptions => 'अधिक विकल्प';

  @override
  String get snoozeAlarm => 'अलार्म स्नूज़ करें';

  @override
  String get interval => 'अंतराल';

  @override
  String get maxSnoozeCount => 'अधिकतम स्नूज़ संख्या';

  @override
  String get unlimited => 'असीमित';

  @override
  String get permissionRequired => 'अनुमति आवश्यक';

  @override
  String get exactAlarmFailMessage =>
      'अलार्म पंजीकृत करने में विफल। सटीक अलार्म अनुमति बंद है और सेटिंग की आवश्यकता है।';

  @override
  String get batteryOptimFailMessage =>
      'अलार्म पंजीकृत करने में विफल। बैटरी अनुकूलन अपवाद अनुमति गायब है।';

  @override
  String get overlayFailMessage =>
      'अलार्म पंजीकृत करने में विफल। अन्य ऐप्स के ऊपर प्रदर्शित करने की अनुमति गायब है।';

  @override
  String get loadingDelay => 'लोडिंग विलंब';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get previewFail => 'पूर्वावलोकन विफल';

  @override
  String get bgDefault => 'डिफ़ॉल्ट पृष्ठभूमि';

  @override
  String get bgFortuneFriends => 'फॉर्च्यून मित्र';

  @override
  String get bgMongChuni => 'मोंगचुनी';

  @override
  String get bgPanChuni => 'पांचुनी';

  @override
  String get bgToChuni => 'तोचुनी';

  @override
  String get bgHoChuni => 'होचुनी';

  @override
  String get bgBear => 'भालू';

  @override
  String get bgMoon => 'चंद्रमा';

  @override
  String get bgSea => 'समुद्र';

  @override
  String get bgBridge => 'पुल';

  @override
  String get bgRoad => 'सड़क';

  @override
  String get bgSky => 'आकाश';

  @override
  String get bgMinimalGray => 'न्यूनतम ग्रे';

  @override
  String get bgDarkMode => 'डार्क मोड';

  @override
  String get bgSoftBlue => 'सॉफ्ट ब्लू';

  @override
  String get bgWarmBeige => 'वार्म बेज';

  @override
  String get dateFormatMdyE => 'd/M (E)';

  @override
  String get deleteAlarm => 'अलार्म हटाएं';

  @override
  String get firstAlarmGuideTitle => 'अभी तक कोई अल람 नहीं';

  @override
  String get firstAlarmGuideDesc =>
      'भाग्य अलार्म सेट करें और\nएक ताज़ा दिन की शुरुआत करें!';

  @override
  String get addAlarm => 'अलार्म जोड़ें';

  @override
  String get addFirstAlarm => 'पहला अल람 बनाएं';

  @override
  String get deleteAlarmConfirm => 'क्या आप इस अलार्म को हटा나 चाहते हैं?';

  @override
  String get welcomeMessage => 'आपसे मिलकर खुशी हुई!';

  @override
  String get whenToRing => 'मुझे आपको कब जगाना चाहिए?';

  @override
  String get next => 'अगला';

  @override
  String get retryFortune => 'फिर से भाग्य देखें';

  @override
  String get retryFortuneDesc =>
      'परिणाम पसंद नहीं आया?\nएक बार और कोशिश करने के लिए विज्ञापन देखें!';

  @override
  String get tapToReveal => 'भाग्य जानने के लिए टैप करें';

  @override
  String get redrawButton => 'फिर से निकालें';

  @override
  String get defaultFortuneGreeting => 'आज का भाग्य देखें!';

  @override
  String get registerProfile => 'प्रोफ़ाइल रजिस्टर करें';

  @override
  String get todaysFortuneTitle => 'आज का भाग्य';

  @override
  String get fortuneCheckSubtitle => 'आपका दिन कैसा रहेगा? अभी देखें।';

  @override
  String get supportSection => 'सहायता';

  @override
  String get rateApp => 'ऐप को रेट करें';

  @override
  String get shareWithFriends => 'दोस्तों के साथ साझा करें';

  @override
  String get shareAppMessage =>
      '\'Fortune Alarm\' को आजमाएं! हर सुबह अपने दैनिक भाग्य के साथ ताज़गी से उठें। https://play.google.com/store/apps/details?id=com.seriessnap.fortunealarm';

  @override
  String get locationPermissionRequiredWeather =>
      'मौसम की जानकारी प्राप्त करने के लिए स्थान की अनुमति आवश्यक है।';

  @override
  String get turnOnLocationService => 'कृपया स्थान सेवाएँ चालू करें';

  @override
  String get checkWeatherLocationRequired => 'मौसम के लिए स्थान आवश्यक';

  @override
  String get themeColor => 'थीम रंग';

  @override
  String get confirmDelete => 'क्या आप वाकई हटाना चाहते हैं?';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get wealthLuckWithIcon => '💰 धन भाग्य';

  @override
  String get loveLuckWithIcon => '❤️ प्रेम भाग्य';

  @override
  String get careerLuckWithIcon => '💼 करियर भाग्य';

  @override
  String get healthLuckWithIcon => '💪 स्वास्थ्य भाग्य';

  @override
  String get mouthFortune => '👄 मुँह (परिपक्वता भाग्य)';

  @override
  String get comprehensiveAnalysis => 'व्यापक विश्लेषण';

  @override
  String get todaysFaceResult => 'आज का चेहरा विश्लेषण परिणाम';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'यह AI चेहरा विश्लेषण परिणाम है।\n$title';
  }

  @override
  String get shareResult => 'परिणाम साझा करें';

  @override
  String get faceVibeSmile0 =>
      'आपके होठों की उज्ज्वल मुस्कान आपके चारों ओर सकारात्मक ऊर्जा फैलाती है। ';

  @override
  String get faceVibeSmile1 =>
      'खिली हुई मुस्कान से आज की उज्ज्वल ऊर्जा महसूस होती है। ';

  @override
  String get faceVibeSmile2 =>
      'कोमल मुख रेखा एक आकर्षक ऊर्जा उत्सर्जित कर रही है जो नेक सहायकों को बुलाती है। ';

  @override
  String get faceVibeSmile3 =>
      'एक आत्मविश्वासी मुस्कान आज किसी भी बाधा को आसानी से हल करने की कुंजी होगी। ';

  @override
  String get faceVibeSmile4 =>
      'ताज़ा मुस्कान की बदौलत, अवरुद्ध ऊर्जा साफ हो जाती है और भाग्य आने के लिए तैयार है। ';

  @override
  String get faceVibeEye0 =>
      'टिमटिमाती आँखों से आज नेतृत्व करने की दृढ़ इच्छाशक्ति महसूस होती है। ';

  @override
  String get faceVibeEye1 =>
      'तेज आँखें गहरी निर्णय क्षमता और अंतर्ज्ञान की भविष्यवाणी करती हैं। ';

  @override
  String get faceVibeEye2 =>
      'स्पष्ट और गहरी आँखें सच्ची ऊर्जा के साथ शुभ समाचार की प्रतीक्षा कर रही हैं। ';

  @override
  String get faceVibeEye3 =>
      'सीधे आगे देखने वाली गरिमामय दृष्टि आज आपकी उपस्थिति को बढ़ाएगी। ';

  @override
  String get faceVibeEye4 =>
      'आपकी आँखों में जुनून एक ऐसा दिन है जो आपके आस-पास के लोगों में गहरा विश्वास पैदा करता है। ';

  @override
  String get faceVibeNeutral0 =>
      'कुल मिलाकर, शांतिपूर्ण और स्थिर चेहरे की ऊर्जा मन की शांति लाती है। ';

  @override
  String get faceVibeNeutral1 =>
      'एक शांत रंग विवेकपूर्ण और बुद्धिमान ऊर्जा दिखाता है। ';

  @override
  String get faceVibeNeutral2 =>
      'संतुलित चेहरे का सामंजस्य आज बिना किसी उतार-चढ़ाव के सपाट होने का प्रतीक है। ';

  @override
  String get faceVibeNeutral3 =>
      'गंभीर माहौल वाला चेहरा आज महत्वपूर्ण निर्णय लेने के लिए इष्टतम है। ';

  @override
  String get faceVibeNeutral4 =>
      'आरामदायक चेहरे की ऊर्जा आपके आस-पास के लोगों को आश्वासन देती है, इसलिए सहयोग अच्छा रहेगा। ';

  @override
  String get dailyFortuneWealth0 =>
      'नाक की ऊर्जा ठोस है, इसलिए छोटे संगठन और सत्यापन से धन का प्रवाह बड़ा हो जाएगा।';

  @override
  String get dailyFortuneWealth1 =>
      'यह वह दिन है जब धन महल (नाक) में शक्ति डाली जाती है। यह जितना अधिक जरूरी है, यदि आप एक बार और गणना करते हैं तो उतना ही अधिक लाभ शेष रहता है।';

  @override
  String get dailyFortuneWealth2 =>
      'चेहरे के केंद्र, नाक की ऊर्जा अच्छी है, इसलिए सावधानी से ली गई एक चीज़ अप्रत्याशित परिणाम लाती है।';

  @override
  String get dailyFortuneWealth3 =>
      'यह धन भाग्य वाला रंग है। यह एक ऐसा प्रवाह है जहाँ अप्रत्याशित स्थानों पर छोटे लाभ हो सकते हैं।';

  @override
  String get dailyFortuneWealth4 =>
      'नाक की नोक की जीवन शक्ति अच्छी है, इसलिए आर्थिक समझ तेज हो जाती है। यह निवेश या खरीद निर्णय के लिए एक फायदेमंद दिन है।';

  @override
  String get dailyFortuneWealth5 =>
      'पैसा बुलाने वाली ऊर्जा प्रबल है। यदि आप अपना बटुआ व्यवस्थित करते हैं या अपने बैंक स्टेटमेंट की जांच करते हैं तो भाग्य साथ देता है।';

  @override
  String get dailyFortuneWealth6 =>
      'यह एक ऐसा चेहरा है जहाँ धन का भंडार विश्वसनीय रूप से भरा हुआ है। ईमानदार प्रयास फल देने लगे हैं।';

  @override
  String get dailyFortuneWealth7 =>
      'स्थिर धन भाग्य आ रहा है। बड़े खर्चों के बजाय निरंतर बचत भाग्य को अधिक बढ़ाती है।';

  @override
  String get dailyFortuneWealth8 =>
      'आर्थिक अवसरों को पकड़ने वाली आँखें उज्ज्वल हो जाती हैं। अपने आस-पास की जानकारी सुनें।';

  @override
  String get dailyFortuneWealth9 =>
      'आपके चेहरे पर समृद्ध ऊर्जा भरी हुई है। यह एक रहस्यमय दिन है जहाँ साझा करने वाला हृदय बड़े धन के रूप में वापस आता है।';

  @override
  String get dailyFortuneLove0 =>
      'मुंह के कोनों की ऊर्जा कोमल है, इसलिए यदि आप पहले एक शब्द कहते हैं, तो रिश्ता ढीला हो जाएगा।';

  @override
  String get dailyFortuneLove1 =>
      'शब्दों को समाहित करने वाली मुख रेखा साफ-सुथरी है। अपनी ईमानदारी को कम करने से गलतफहमियां कम होती हैं।';

  @override
  String get dailyFortuneLove2 =>
      'एक उज्ज्वल रंग नेक सहायकों की ऊर्जा को आकर्षित करता है। छोटा सा विचार एक बड़े संबंध के रूप में वापस आता है।';

  @override
  String get dailyFortuneLove3 =>
      'यह वह दिन है जब लोगों को आकर्षित करने वाला आकर्षण उभर कर सामने आता है। आपको नई मुलाकातों से सकारात्मक ऊर्जा मिलेगी।';

  @override
  String get dailyFortuneLove4 =>
      'पारस्परिक संबंधों की ऊर्जा स्पष्ट है, इसलिए संघर्ष हल हो जाते हैं और सद्भाव प्राप्त होता है।';

  @override
  String get dailyFortuneLove5 =>
      'मुख रेखा की कोमलता दूसरे व्यक्ति का हृदय खोल देती है। आज, सुनना सबसे अच्छा बातचीत का तरीका है।';

  @override
  String get dailyFortuneLove6 =>
      'यह एक ऐसा चेहरा है जिसे अपने आस-पास से मदद मिल सकती है। अकेले चिंता न करें, सलाह लेने का प्रयास करें।';

  @override
  String get dailyFortuneLove7 =>
      'ईमानदार आँखें विश्वास जगाती हैं। यदि आप वादों को महत्व देते हैं, तो एक बड़ा संबंध आप तक पहुँचेगा।';

  @override
  String get dailyFortuneLove8 =>
      'घर और कार्यस्थल में सामंजस्यपूर्ण ऊर्जा भरी हुई है। यह एक ऐसा दिन होगा जहाँ हँसी कभी खत्म नहीं होगी।';

  @override
  String get dailyFortuneLove9 =>
      'यह वह दिन है जब संबंध के धागे खूबसूरती से सुलझ जाते हैं। अनमोल लोगों के प्रति अपना आभार व्यक्त करें।';

  @override
  String get dailyFortuneCareer0 =>
      'आपकी दृष्टि तेज है; प्राथमिकताओं को तय करने से आपकी एकाग्रता सफलता में बदल जाएगी।';

  @override
  String get dailyFortuneCareer1 =>
      'आज आपकी अवलोकन क्षमता बेहतरीन है। आपके निर्णय सटीक और क्रियान्वयन स्थिर रहेगा।';

  @override
  String get dailyFortuneCareer2 =>
      'आपका माथा और आँखें स्पष्ट ऊर्जा से भरे हैं; आज आप अपने कार्यों को सफलतापूर्वक पूरा करेंगे।';

  @override
  String get dailyFortuneCareer3 =>
      'आपके चेहरे से नेतृत्व झलकता है। आपकी राय का दूसरों पर गहरा प्रभाव पड़ेगा।';

  @override
  String get dailyFortuneCareer4 =>
      'आज आपकी निर्णय लेने की क्षमता चरम पर है। जटिल समस्याओं का भी समाधान निकलेगा।';

  @override
  String get dailyFortuneCareer5 =>
      'आपके काम की हर जगह प्रशंसा होगी। पदोन्नति या बड़ी उपलब्धि के योग बन रहे हैं।';

  @override
  String get dailyFortuneCareer6 =>
      'नया प्रोजेक्ट शुरू करने के लिए बेहतरीन समय है। पूरे आत्मविश्वास के साथ आगे बढ़ें।';

  @override
  String get dailyFortuneCareer7 =>
      'आज आपकी कार्यक्षमता काफी बढ़ी हुई है। रुके हुए कार्यों को पूरा करने के लिए अच्छा दिन है।';

  @override
  String get dailyFortuneCareer8 =>
      'आपकी आँखों में रचनात्मक विचार चमक रहे हैं। आज नोट लिखने की आदत शुभ रहेगी।';

  @override
  String get dailyFortuneCareer9 =>
      'आज आपकी दृढ़ता और धैर्य रंग लाएगा। अंत तक ध्यान केंद्रित रखने से बड़ा लाभ होगा।';

  @override
  String get dailyFortuneHealth0 =>
      'समग्र रंग स्थिर है, इसलिए यदि आप एक लय चुनते हैं, तो आपकी स्थिति जल्दी ठीक हो जाएगी।';

  @override
  String get dailyFortuneHealth1 =>
      'चेहरे की जीवन शक्ति उभर कर सामने आती है। यदि आप इसे ज़्यादा किए बिना गति बनाए रखते हैं, तो दिन आरामदायक हो जाता।';

  @override
  String get dailyFortuneHealth2 =>
      'आँखों और त्वचा की ऊर्जा स्पष्ट है, इसलिए थोड़ा आराम एकाग्रता और मनोदशा को एक साथ बढ़ाता है।';

  @override
  String get dailyFortuneHealth3 =>
      'शरीर की लय सर्वोत्तम सामंजस्य प्राप्त करती है। हल्का व्यायाम ऊर्जा को और स्पष्ट बनाता है।';

  @override
  String get dailyFortuneHealth4 =>
      'आपके चेहरे पर चार्ज की गई ऊर्जा भरी हुई है। आप आज का दिन बिना थके खुशी-खुशी बिता सकते हैं।';

  @override
  String get dailyFortuneHealth5 =>
      'मन और शरीर की स्थिरता उभर कर सामने आती है। ध्यान या गहरी सांस लेना भाग्य को और बढ़ाता है।';

  @override
  String get dailyFortuneHealth6 =>
      'यह अच्छे लचीलेपन वाला दिन है। थोड़ी सी थकान को भी जल्दी मिटाने की जीवन शक्ति है।';

  @override
  String get dailyFortuneHealth7 =>
      'त्वचा की जीवन शक्ति अच्छी है, इसलिए यह एक ऐसा प्रवाह है जहाँ आप लोगों को यह कहते हुए सुनेंगे कि आप स्वस्थ दिखते हैं।';

  @override
  String get dailyFortuneHealth8 =>
      'संयमित आहार और आराम भाग्य की जड़ को मजबूत करते हैं। अपने शरीर को संजोने का दिन रखें।';

  @override
  String get dailyFortuneHealth9 =>
      'ताजी हवा और पानी का सेवन आज की दवा है। जीवन शक्ति से भरे दिन का आनंद लें।';

  @override
  String get dailyFortuneTipWealth0 =>
      'व्यय, सदस्यता और भुगतान की जांच \'अभी\' के बजाय \'कल\' एक बार और करें।';

  @override
  String get dailyFortuneTipWealth1 =>
      'बिना वादों के उपभोग से बचें, और केवल वही शामिल करना एक लाभ है जिसकी आपको आवश्यकता है।';

  @override
  String get dailyFortuneTipWealth2 =>
      'यदि आप पैसे से संबंधित बातचीत का रिकॉर्ड रखते हैं, तो आप अनावश्यक नुकसान को रोकते हैं।';

  @override
  String get dailyFortuneTipWealth3 =>
      'जांचें कि क्या छोटी मात्रा में भी कोई रिसाव है।';

  @override
  String get dailyFortuneTipWealth4 =>
      'आज आवेगपूर्ण खरीदारी का प्रलोभन प्रबल है। भुगतान करने से पहले 10 मिनट तक सोचें।';

  @override
  String get dailyFortuneTipWealth5 =>
      'आज निवेश या बड़े लेन-देन में सावधानी बरतनी चाहिए। विशेषज्ञ की सलाह लें।';

  @override
  String get dailyFortuneTipWealth6 =>
      'आपको उधार दिए गए पैसे या प्राप्त होने वाले पैसे को स्पष्ट रूप से व्यवस्थित करने की आवश्यकता है।';

  @override
  String get dailyFortuneTipWealth7 =>
      'बटुआ प्रबंधन पर ध्यान दें। हानि या बर्बादी की ऊर्जा थोड़ी दिखाई दे रही है।';

  @override
  String get dailyFortuneTipWealth8 =>
      'दिखावे पर केंद्रित उपभोग के बजाय व्यावहारिक लाभ लेने की बुद्धि की आवश्यकता है।';

  @override
  String get dailyFortuneTipWealth9 =>
      'मुफ्त में किसी चीज़ की उम्मीद करने के बजाय, उचित कीमत चुकाना भाग्य बनाए रखने का तरीका है।';

  @override
  String get dailyFortuneTipLove0 =>
      'चूँकि आपका लहजा तीखा होना आसान है, इसलिए \'ब्रेक के बाद\' उत्तर दें।';

  @override
  String get dailyFortuneTipLove1 =>
      'यदि कोई गलतफहमी उत्पन्न होती है, तो लंबी व्याख्या की तुलना में छोटा सत्यापन बेहतर है।';

  @override
  String get dailyFortuneTipLove2 =>
      'आज, केवल नियुक्ति का समय रखने से ही विश्वास बनता है।';

  @override
  String get dailyFortuneTipLove3 =>
      'यदि आप निष्कर्ष से शुरू करते हैं तो बातचीत भावनात्मक खपत को कम करती है।';

  @override
  String get dailyFortuneTipLove4 =>
      'करीबी लोगों के प्रति भी विनम्र रहें। आप परिचितता से धोखा खाकर उन्हें चोट पहुँचा सकते हैं।';

  @override
  String get dailyFortuneTipLove5 =>
      'आलोचना से पहले प्रशंसा करने का प्रयास करें। दूसरे व्यक्ति का बंद हृदय खुल जाएगा।';

  @override
  String get dailyFortuneTipLove6 =>
      'यह वह दिन है जब जुबान फिसलने की चिंता होती है। टेक्स्ट द्वारा एक बार और महत्वपूर्ण कहानियों को व्यवस्थित करें।';

  @override
  String get dailyFortuneTipLove7 =>
      'दूसरों के मामलों में बहुत अधिक हस्तक्षेप न करना अफवाहों को रोकने का रहस्य है।';

  @override
  String get dailyFortuneTipLove8 =>
      'भावनात्मक प्रतिक्रिया के बजाय तर्कसंगत बातचीत रिश्तों को स्वस्थ रखती है।';

  @override
  String get dailyFortuneTipLove9 =>
      'शेड्यूल को ध्यान से जांचें ताकि नियुक्तियाँ ओवरलैप न हों। विश्वास ही पूँजी है।';

  @override
  String get dailyFortuneTipCareer0 =>
      'चीजें शुरू करने के बजाय, \'एक को खत्म करना\' भाग्य को बढ़ाता है।';

  @override
  String get dailyFortuneTipCareer1 =>
      'समय सीमा पूर्णता से पहले आती है। आज, 80% पर पुष्टि करें।';

  @override
  String get dailyFortuneTipCareer2 =>
      'यदि आप एक ऐसी चीज़ को व्यवस्थित करते हैं जिसे आप टाल रहे हैं, तो आपका सिर साफ हो जाता है।';

  @override
  String get dailyFortuneTipCareer3 =>
      'मेरे काम को दूसरों के काम से अलग करना तनाव को कम करता है।';

  @override
  String get dailyFortuneTipCareer4 =>
      'छोटी गलतियाँ काम को उलझा सकती हैं। अंतिम जांच न भूलें।';

  @override
  String get dailyFortuneTipCareer5 =>
      'वरिष्ठों या सहकर्मियों के साथ घर्षण की उम्मीद है। राय के अंतर का सम्मान करने वाला दृष्टिकोण आवश्यक है।';

  @override
  String get dailyFortuneTipCareer6 =>
      'आज एकाग्रता आसानी से विचलित हो सकती है। 50 मिनट काम करने और 10 मिनट आराम करने की लय बनाए रखें।';

  @override
  String get dailyFortuneTipCareer7 =>
      'अत्यधिक जिम्मेदारी जहरीली हो सकती है। केवल उतना ही लें जितना आप संभाल सकें।';

  @override
  String get dailyFortuneTipCareer8 =>
      'सावधान रहें कि आज सार्वजनिक काम में व्यक्तिगत भावनाओं को न मिलाएं।';

  @override
  String get dailyFortuneTipCareer9 =>
      'दस्तावेज़ या ईमेल भेजने से पहले, प्राप्तकर्ता और अटैचमेंट को एक बार और जांचें।';

  @override
  String get dailyFortuneTipHealth0 =>
      'अपनी स्थिति को स्थिर करने के लिए नींद, अधिक खाने और अत्यधिक कैफीन से बचें।';

  @override
  String get dailyFortuneTipHealth1 =>
      'गर्दन और कंधे के तनाव को दूर करने से आज की थकान काफी कम हो जाती है।';

  @override
  String get dailyFortuneTipHealth2 =>
      'थोड़ी सी सैर विचारों को व्यवस्थित करती है और ऊर्जा को ताज़ा करती।';

  @override
  String get dailyFortuneTipHealth3 =>
      'एक गिलास पानी और 1 मिनट की स्ट्रेचिंग भाग्य के तल का समर्थन करती है।';

  @override
  String get dailyFortuneTipHealth4 =>
      'आँखों की थकान गंभीर हो सकती है। संक्षेप में स्मार्टफोन का उपयोग कम करें।';

  @override
  String get dailyFortuneTipHealth5 =>
      'अचानक गतिविधि के बजाय, शरीर को पर्याप्त रूप से गर्म करने के बाद आगे बढ़ना बेहतर है।';

  @override
  String get dailyFortuneTipHealth6 =>
      'चूँकि आप तापमान परिवर्तन के प्रति संवेदनशील हो सकते हैं, शरीर के तापमान को नियंत्रित करने के लिए बाहरी वस्त्र साथ लाएं।';

  @override
  String get dailyFortuneTipHealth7 =>
      'आंतों के स्वास्थ्य और त्वचा के लिए आज उत्तेजक खाद्य पदार्थों से बचें।';

  @override
  String get dailyFortuneTipHealth8 =>
      'पर्याप्त नींद सबसे अच्छी दवा है। आज सामान्य से पहले सो जाएं।';

  @override
  String get dailyFortuneTipHealth9 =>
      'अपने पसंदीदा संगीत या खुशबू के साथ अपना मूड बदलें ताकि तनाव जमा न हो।';

  @override
  String get eyeAnalysisTypeSharp =>
      'आपकी आँखें तीक्ष्ण और स्पष्ट हैं, जो आपकी त्वरित निर्णय क्षमता और प्रेरणा को दर्शाती हैं।';

  @override
  String get eyeAnalysisTypeDeep =>
      'आपकी आँखें शांत और गहरी हैं, जो एक बुद्धिमान व्यक्तित्व को दर्शाती हैं जो कदम उठाने से पहले सावधानीपूर्वक सोचता है।';

  @override
  String get eyeAnalysisTypeBalanced =>
      'आपकी आँखों की ऊर्जा संतुलित है, जो स्थिरता का अहसास कराती है।';

  @override
  String get eyeExpressionBright =>
      'आपकी उज्ज्वल आँखें और मुस्कान लोगों को आकर्षित करने वाली सकारात्मक ऊर्जा पैदा करती हैं।';

  @override
  String get eyeExpressionGentle =>
      'आपकी शांत आँखों में एक कोमल मुस्कान छिपी है, जो आपके सौम्य व्यक्तित्व को दर्शाती है।';

  @override
  String get eyeExpressionStrong =>
      'आपकी दृढ़ आँखें नेतृत्व और संकल्प का प्रतीक हैं, जो आपके लक्ष्यों की ओर बढ़ने की शक्ति को दर्शाती हैं।';

  @override
  String get eyeExpressionSteady =>
      'आपका शांत और गंभीर स्वभाव दूसरों का विश्वास जीतने में मदद करता है।';

  @override
  String get eyePostureTilt =>
      'आपका सिर थोड़ा झुका हुआ है, जो एकाग्रता में कमी का संकेत दे सकता है; सीधे देखना आपके भाग्य को और स्पष्ट करेगा।';

  @override
  String get eyePostureStraight =>
      'सीधे देखने की मुद्रा आपकी आँखों की ऊर्जा को अधिक स्पष्ट और सकारात्मक बनाती है।';

  @override
  String get noseInsufficient =>
      'नाक की रूपरेखा का माप पर्याप्त नहीं है, इसलिए व्याख्या सामान्य रूप से प्रदर्शित की जा रही है।';

  @override
  String get noseWealthRich =>
      'आपकी नाक की बनावट धन संचय और सुरक्षा के लिए बहुत अच्छी ऊर्जा का संकेत देती है।';

  @override
  String get noseWealthPlanner =>
      'आपकी तीखी नाक यह दर्शाती है कि आप धन प्रबंधन में व्यावहारिक और व्यवस्थित हैं।';

  @override
  String get noseWealthBalanced =>
      'आपकी नाक का अनुपात संतुलित है, जो आने वाले धन को स्थिरता के साथ बनाए रखने की शक्ति देता है।';

  @override
  String get mouthExpressionBlessing =>
      'आपका मुँह बंद है लेकिन कोने ऊपर की ओर हैं, जो यह दर्शाता है कि आप दूसरों का स्नेह प्राप्त करने वाले व्यक्ति हैं।';

  @override
  String get mouthExpressionReliable =>
      'आपका कसकर बंद मुँह विश्वास और जिम्मेदारी को दर्शाता है, जो शब्दों से ज्यादा कार्यों में विश्वास रखता है।';

  @override
  String get mouthExpressionLucky =>
      'आपकी खुली मुस्कान सकारात्मक ऊर्जा का संचार करती है और संबंधों में भाग्य को आमंत्रित करती है।';

  @override
  String get supplementAlarmTitle => 'सप्लीमेंट लेने का समय! 💊';

  @override
  String get alarmVolume => 'अलार्म वॉल्यूम';

  @override
  String get alarmTimeList => 'अलार्म समय सूची';

  @override
  String get noAlarmTimesAdded => 'कोई अलार्म समय नहीं जोड़ा गया';

  @override
  String get alarmTimeDeleted => 'अलार्म का समय हटा दिया गया';

  @override
  String get addAlarmTime => 'अलार्म का समय जोड़ें';

  @override
  String get editAlarmTime => 'अलार्म का समय बदलें';

  @override
  String get defaultRingtone => 'डिफ़ॉल्ट रिंगटोन';

  @override
  String get takeSupplementsNow =>
      'कृपया अपने सप्लीमेंट लें और उन्हें रिकॉर्ड करें!';

  @override
  String get nextTime => 'अगली बार लें';

  @override
  String get take => 'लें';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get notificationTime => 'सूचना का समय';

  @override
  String get start => 'शुरू करें';

  @override
  String get end => 'समाप्त';

  @override
  String get notificationInterval => 'सूचना अंतराल';

  @override
  String get waterDrankToday => 'आज पिया गया पानी';

  @override
  String get goal => 'लक्ष्य';

  @override
  String get cup => 'कप';

  @override
  String get waterIntakeRecord => 'पानी के सेवन का रिकॉर्ड';

  @override
  String get remainingAmount => 'शेष राशि';

  @override
  String get ml => 'मिलीलीटर';

  @override
  String minutesFormat(String minutes) {
    return '$minutes मिनट';
  }

  @override
  String get drinkWater => 'पानी पिएं';

  @override
  String get supplement => 'सप्लीमेंट';

  @override
  String get water => 'पानी';

  @override
  String get morning => 'सुबह';

  @override
  String get afternoon => 'दोपहर';

  @override
  String get evening => 'शाम';

  @override
  String get takeSupplement => 'सप्लीमेंट लें';

  @override
  String get goalAchievedTitle => 'लक्ष्य प्राप्त हुआ!';

  @override
  String get waterIntake => 'पानी का सेवन';

  @override
  String get remindTime => 'अनुस्मारक समय';

  @override
  String get alarmRingtone => 'अलार्म रिंगटोन';

  @override
  String get snoozeTime => 'स्नूज़ का समय';

  @override
  String get snoozeDescription => '\'बाद में लें\' चुनते समय डिफ़ॉल्ट समय है';

  @override
  String get oneHour => '1 घंटा';

  @override
  String get mouthExpressionOpen =>
      'आपका मुँह थोड़ा खुला है, जो एक ईमानदार व्यक्तित्व को दर्शाता है, लेकिन कभी-कभी बोलने में सावधानी बरतने की आवश्यकता होती है।';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'आज आपका मुख्य ध्यान $topKey पर होना चाहिए, और $bottomKey के प्रति सतर्क रहें।';
  }

  @override
  String get overallVibeWealthRich =>
      'आपके चेहरे की चमक आर्थिक समृद्धि का संकेत दे रही है; नए अवसरों का लाभ उठाने के लिए आज का दिन श्रेष्ठ है।';

  @override
  String get overallVibeWealthSteady =>
      'शांत और स्थिर मन आपको बुद्धिमानी से वित्त प्रबंधन करने और स्थायी संपत्ति बनाने में मदद करेगा।';

  @override
  String get overallVibeLoveCharisma =>
      'आपकी उज्ज्वल मुस्कान आज स्वाभाविक रूप से सकारात्मक लोगों और मददगार संपर्कों को आकर्षित करेगी।';

  @override
  String get overallVibeLoveTrust =>
      'आपकी सौम्य और स्थिर दृष्टि गहरा विश्वास पैदा करती है, जो सार्थक संबंधों के लिए इसे एक आदर्श समय बनाती है।';

  @override
  String get overallVibeCareerSmart =>
      'आपका तेज ध्यान निर्णय लेने की क्षमता को बढ़ाता है, जो जटिल कार्यों या बड़े फैसलों के लिए एकदम सही समय है।';

  @override
  String get overallVibeCareerSteady =>
      'आपकी स्थिर ऊर्जा निरंतरता का समर्थन करती है; अपने लक्ष्यों पर ध्यान केंद्रित करने से शानदार परिणाम मिलेंगे।';

  @override
  String get overallVibeHealth =>
      'आपकी साफ रंगत एक संतुलित आंतरिक लय को दर्शाती है, जो शारीरिक गतिविधियों के लिए एक अच्छा दिन है।';

  @override
  String get overallActionPrudent =>
      'आपकी शांत अभिव्यक्ति बुद्धिमानी का संकेत है। आज अपने कार्यों को अपने शब्दों से अधिक बोलने दें।';

  @override
  String get overallActionConfident =>
      'एक आत्मविश्वासी और स्पष्ट अभिव्यक्ति सकारात्मक परिणाम आकर्षित करती है। अपनी बात स्पष्टता और विश्वास के साथ कहें।';

  @override
  String get adviceHealth0 =>
      'एक स्वस्थ दिनचर्या ही सौभाग्य की नींव है। आज खुद पर काम का अत्यधिक बोझ न डालें।';

  @override
  String get adviceHealth1 =>
      'अपने शरीर की जरूरतों को सुनें। अभी लिया गया एक छोटा विश्राम बाद में बेहतर परिणाम देगा।';

  @override
  String get adviceHealth2 =>
      'पर्याप्त पानी पिएं और आराम करें; सादगी ही आपके भाग्य को पुनर्जीवित करने की कुंजी है।';

  @override
  String get adviceWealth0 =>
      'आज अपने खर्चों को लेकर सावधान रहें। सभी खर्चों और अनुबंधों की दोबारा जांच करें।';

  @override
  String get adviceWealth1 =>
      'आज छोटे खर्चों में कटौती करना भविष्य में बड़ी संपत्ति बनाने की दिशा में पहला कदम है।';

  @override
  String get adviceWealth2 =>
      'वित्तीय निर्णय लेने के लिए कल तक का इंतजार करना आपके पक्ष में हो सकता है।';

  @override
  String get adviceLove0 =>
      'एक दयालु शब्द और कोमल व्यवहार रिश्तों में आपके भाग्य को संवार सकता है।';

  @override
  String get adviceLove1 =>
      'आज दूसरों का दिल जीतने का रहस्य एक अच्छा श्रोता बनना है।';

  @override
  String get adviceLove2 =>
      'अपने करीबी लोगों के साथ भी शिष्टाचार बनाए रखना आपकी सकारात्मक ऊर्जा को सुरक्षित रखेगा।';

  @override
  String get adviceCareer0 =>
      'सब कुछ एक साथ करने की कोशिश करने के बजाय आज केवल एक मुख्य लक्ष्य पर ध्यान केंद्रित करें।';

  @override
  String get adviceCareer1 =>
      'जल्दबाजी न करें। धैर्यपूर्वक एक-एक कदम उठाना ही सफलता का सबसे निश्चित मार्ग है।';

  @override
  String get adviceCareer2 =>
      'दूसरों की सलाह सुनें, लेकिन अंतिम निर्णय के लिए अपनी अंतरात्मा की आवाज पर भरोसा करें।';

  @override
  String get sajuFortune2026Gap =>
      '🌳 2026 ब्योंग-ओ वर्ष गैप-वुड (Gap-Wood) सामान्य भाग्य: \'जुनून की लौ, गतिविधि का अधिकतम विस्तार\'\n\n2026 एक ऐसा वर्ष है जहाँ \'Sik-sin\' (उत्पादकता) और \'Sang-gwan\' (अभिव्यक्ति) की ऊर्जा आपके लिए, एक गैप-वुड, बहुत मजबूत है। यह ऐसी स्थिति है जहाँ लकड़ी आग से मिलती है और जोर से जलती है, एक ऐसी अवधि जहाँ आपकी प्रतिभा और अभिव्यक्ति बिना किसी झिझक के दुनिया में फूट पड़ती है। आपकी उपस्थिति तब भी प्रकट होती है जब आप शांत रहते हैं, और आपकी गतिविधियों का दायरा नाटकीय रूप से फैलता है।\n\n💼 [करियर और व्यवसाय]\nनए प्रोजेक्ट्स या व्यवसाय शुरू करने के लिए यह बहुत अच्छा समय है। आपके विचार साकार होंगे, और आप काम में पूरी तरह डूब जाएंगे। आप उन क्षेत्रों में शानदार परिणाम प्राप्त कर सकते हैं जो आपको अभिव्यक्त करते हैं, जैसे कला, प्रसारण, बिक्री और शिक्षा। हालाँकि, आपको सतर्क रहने और हर चीज की दोबारा जाँच करने की आवश्यकता है क्योंकि केवल आगे भागने पर आप गलतियाँ कर सकते हैं।\n\n💰 [धन]\nधन उतना ही पीछे आता है जितना आप सक्रिय होते हैं। व्यवसाय या साइड जॉब्स से आय बढ़ सकती है। हालाँकि, जितना आप कमाते हैं, उतना ही पैसा निवेश या उपभोग के लिए बाहर जा सकता है। भविष्य के लिए निवेश अच्छा है, लेकिन आवेगी खर्च से बचना चाहिए।\n\n❤️ [प्रेम और संबंध]\nईमानदार और सक्रिय रवैये के साथ विपरीत लिंग को आकर्षित करें। रोमांटिक भाग्य गरमाता है, लेकिन अत्यधिक भावनात्मक अभिव्यक्ति साथी पर बोझ बन सकती है। यह एक ऐसा वर्ष भी है जहाँ बच्चों का भाग्य बहुत मजबूती से प्रवेश करता है।\n\n⚠️ [सावधानियां]\nयह अत्यधिक ऊर्जा खपत का वर्ष है। \'बर्नआउट\' आ सकता है, इसलिए शारीरिक शक्ति प्रबंधन आवश्यक है। बोलने की फिसलन के कारण होने वाली अफवाहों से सावधान रहें, और केवल अपने तर्कों पर अड़े रहने की कोशिश न करें।';

  @override
  String get sajuFortune2026Eul =>
      '🌸 2026 ब्योंग-ओ वर्ष यूल-वुड (Eul-Wood) सामान्य भाग्य: \'शानदार खिलावट, प्रतिभा का पूर्ण प्रस्फुटन\'\n\n2026 एक ऐसा वर्ष है जहाँ \'Sang-gwan\' (अभिव्यक्ति) आपके लिए, एक यूल-वुड, भारी है। यह गर्म सूरज के नीचे फूल खिलने जैसी स्थिति है, एक ऐसी अवधि जहाँ आपका आकर्षण और प्रतिभा अपने चरम पर पहुँचती है। आप वह नायक होंगे जो हर जगह ध्यान प्राप्त करता है और शानदार उपलब्धियों का स्वाद चखता है।\n\n💼 [करियर और व्यवसाय]\nमौजूदा ढांचों को तोड़ने वाले अपरंपरागत प्रयास सफल होते हैं। आप डिजाइन, फैशन, सौंदर्य और मनोरंजन में अलग दिखेंगे। आपको कार्यस्थल पर पदोन्नति या स्काउट ऑफर मिल सकते हैं, लेकिन वरिष्ठों के साथ घर्षण से सावधान रहें। एक मुक्त वातावरण में आपकी क्षमता दोगुनी हो जाती है।\n\n💰 [धन]\nधन सृजन की क्षमता उत्कृष्ट हो जाती है। आपके ब्रांड का मूल्य बढ़ता है और आपकी कीमत बढ़ती है। हालाँकि, ग्लैमर का पीछा करने से विलासिता या बर्बादी हो सकती है, इसलिए आपको अपने बटुए की अच्छी तरह रक्षा करनी चाहिए।\n\n❤️ [प्रेम और संबंध]\nविपरीत लिंग के बीच लोकप्रियता विस्फोट करती है। आपके पास एक शानदार और भावुक रोमांस होगा, लेकिन यह थोड़े समय के लिए और तीव्र हो सकता है। शादीशुदा लोगों को बच्चों के बारे में काफी चिंता हो सकती है।\n\n⚠️ [सावधानियां]\nभावनात्मक उतार-चढ़ाव गंभीर हो सकते हैं। यदि आप अपने गुस्से पर काबू नहीं रख पाते हैं, तो कड़ी मेहनत से अर्जित उपलब्धियाँ ढह सकती हैं। कानूनी मुद्दों या अफवाहों से बचने के लिए कानून का पालन करने वाली भावना रखें।';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ 2026 ब्योंग-ओ वर्ष ब्योंग-फायर (Byeong-Fire) सामान्य भाग्य: \'दो सूरज, तीव्र प्रतिस्पर्धा और छलांग\'\n\n2026 एक ऐसा वर्ष है जहाँ \'Bi-gyeon\' (मित्र) और \'Geob-jae\' (प्रतिस्पर्धी) आपके लिए, एक ब्योंग-फायर, बहुत मजबूत हैं। यह ऐसी स्थिति है जहाँ आकाश में दो सूरज दिखाई देते हैं, एक ऐसी अवधि जहाँ गर्व और प्रतिस्पर्धी भावना आकाश को छूती है। व्यक्तिपरकता मजबूत हो जाती है, आप किसी भी हस्तक्षेप से नफरत करते हैं, और आप दृढ़ संकल्प के साथ अपने रास्ते पर आगे बढ़ते हैं।\n\n💼 [करियर और व्यवसाय]\nप्रतिस्पर्धी स्थानों पर जीतने और उपलब्धि हासिल करने का यह एक भाग्य है। आप साझेदारी या सहयोग के माध्यम से पैमाने को बढ़ा सकते हैं, लेकिन लाभ वितरण के मुद्दों के कारण संघर्ष उत्पन्न हो सकते हैं। फ्रीलांसरों या पेशेवरों के लिए अपने नाम को व्यापक रूप से प्रसिद्ध करने का यह एक अच्छा अवसर है।\n\n💰 [धन]\nपैसा आता है, लेकिन उसे बाहर जाने के लिए बड़े रास्ते भी होते हैं। भाई-बहनों, दोस्तों या सहकर्मियों के कारण पैसा बाहर जा सकता है। पैसे की गारंटी देना या उधार देना बिल्कुल वर्जित है। पैसा बचाने के बजाय सम्मान या बढ़ती शक्ति में निवेश करना बेहतर है।\n\n❤️ [प्रेम और संबंध]\nआप किसी दोस्त जैसे प्रेमी से मिल सकते हैं या किसी दोस्त से प्रेमी के रूप में विकसित हो सकते हैं। हालाँकि, यदि आपका कोई साथी है, तो सावधान रहें क्योंकि प्रेम त्रिकोण या प्रतिस्पर्धी सामने आ सकता।\n\n⚠️ [सावधानियां]\nमनमाने कार्य आपके आस-पास के लोगों की नाराजगी का कारण बन सकते हैं। \'विनम्रता\' सबसे अच्छी रणनीति है। हृदय रोग या आँखों के स्वास्थ्य पर ध्यान दें।';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 2026 ब्योंग-ओ वर्ष जियोंग-फायर (Jeong-Fire) सामान्य भाग्य: \'विशाल ज्वाला, शक्ति का विस्तार\'\n\n2026 आपके लिए, एक जियोंग-फायर, \'Geob-jae\' (प्रतिस्पर्धी) और \'Bi-gyeon\' (मित्र) का वर्ष है। एक भट्टी से मिलने वाली मोमबत्ती की तरह, यह एक ऐसी अवधि है जहाँ आपकी शक्ति विशाल हो जाती है। आप अपने आस-पास के लोगों की मदद या सहयोग से उन चीजों को प्राप्त कर सकते हैं जो अकेले असंभव थीं।\n\n💼 [करियर और व्यवसाय]\nएक मजबूत प्रेरक शक्ति उत्पन्न होती है। आपके पास प्रतिस्पर्धियों पर हावी होने या उन्हें अपनी तरफ करने की बुद्धि होगी। टीम प्रोजेक्ट्स या संगठनात्मक जीवन में नेतृत्व करने के अवसर आएंगे। हालाँकि, यदि आप परिणामों पर एकाधिकार करने की कोशिश करते हैं, तो आपको धोखा मिल सकता है, इसलिए श्रेय साझा करने का दृष्टिकोण आवश्यक है।\n\n💰 [धन]\nसट्टा प्रवृत्तियाँ मजबूत हो जाती हैं। आप \'उच्च जोखिम, उच्च प्रतिफल\' का पीछा करेंगे, और यदि भाग्यशाली रहे, तो आप बहुत पैसा कमाएंगे, लेकिन विफलता का भी बड़ा प्रभाव पड़ता है। अप्रत्याशित खर्च हो सकते हैं, इसलिए आपातकालीन निधि तैयार करना अच्छा है।\n\n❤️ [प्रेम और संबंध]\nसामाजिक सभाओं या समूह गतिविधियों में संबंध मिलने की उच्च संभावना है। पुरुषों को सावधान रहना चाहिए क्योंकि वे अपनी पत्नियों या प्रेमिकाओं की उपेक्षा कर सकते हैं। आपके आस-पास के लोगों के साथ संबंध इस वर्ष संपत्ति बन जाएंगे।\n\n⚠️ [सावधानियां]\nलालच परेशानी का कारण बनता है। अनुचित विस्तार या निवेश से बचें। क्रोध या तनाव के कारण होने वाली बीमारियों से सावधान रहें।';

  @override
  String get sajuFortune2026Mu =>
      '🌋 2026 ब्योंग-ओ वर्ष मु-अर्थ (Mu-Earth) सामान्य भाग्य: \'भीषण गर्मी के बीच धैर्य और तैयारी\'\n\n2026 एक ऐसा वर्ष है जहाँ \'Pyeon-in\' (अंतर्ज्ञान) और \'Jeong-in\' (ज्ञान) की ऊर्जा आपके लिए, एक मु-अर्थ, मजबूत है। यह ज्वालामुखी फटने से ठीक पहले की संघनित ऊर्जा की तरह है। पढ़ाई, कला और प्रमाणन प्राप्त करने के माध्यम से अपने आंतरिक स्व को भरने और कौशल विकसित करने का यह इष्टतम समय है।\n\n💼 [करियर और व्यवसाय]\nसक्रिय कार्य के बजाय योजना, अनुसंधान और रणनीति स्थापना जैसे मानसिक श्रम चमकते हैं। दस्तावेजी भाग्य अच्छा है, इसलिए अनुबंधों या परमिट से संबंधित कार्यों में परिणाम मिलते हैं। हालाँकि, यदि आप केवल सोचते हैं और निष्पादन स्थगित करते हैं, तो आप अवसर चूक सकते हैं, इसलिए साहसिक निर्णय लेने की भी आवश्यकता है।\n\n💰 [धन]\nरियल एस्टेट दस्तावेजी भाग्य बहुत मजबूत है। यह बिक्री या अनुबंध के माध्यम से संपत्ति बढ़ाने का अवसर है। नकदी प्रवाह कुछ निराशाजनक हो सकता है, लेकिन दीर्घकालिक दृष्टिकोण से निवेश आशाजनक है।\n\n❤️ [प्रेम और संबंध]\nमाताओं या वरिष्ठों का हस्तक्षेप बढ़ सकता है। रोमांस में, आप मानसिक जुड़ाव को महत्व देंगे, और बड़े लोगों के साथ संबंध बन सकते हैं।\n\n⚠️ [सावधानियां]\nबहुत अधिक विचार अवसाद या सुस्ती का कारण बन सकते हैं। बाहरी गतिविधियाँ या व्यायाम के माध्यम से पसीना बहाना भाग्य को बेहतर बनाने में मदद करता है। चूंकि बहुत अधिक गर्मी के कारण जमीन फट जाती है, इसलिए शुष्क त्वचा या पेट के विकारों से सावधान रहें।';

  @override
  String get sajuFortune2026Gi =>
      '🌾 2026 ब्योंग-ओ वर्ष गी-अर्थ (Gi-Earth) सामान्य भाग्य: \'ठोस नींव और निश्चित समर्थन\'\n\n2026 आपके लिए, एक गी-अर्थ, \'Jeong-in\' (ज्ञान) और \'Pyeon-in\' (अंतर्ज्ञान) का वर्ष है। यह ऐसी स्थिति है जहाँ गर्म धूप पृथ्वी पर चमकती है और अनाज पकाती है। यह वरिष्ठों से पूर्ण समर्थन और प्यार प्राप्त करते हुए एक स्थिर नींव को मजबूत करने की अवधि है।\n\n💼 [करियर और व्यवसाय]\nआप पढ़ाई से संबंधित हर चीज में सर्वश्रेष्ठ परिणाम प्राप्त करेंगे, जैसे पदोन्नति परीक्षा, प्रमाणन परीक्षा और डिग्री प्राप्ति। कार्यस्थल पर, आप वरिष्ठों का विश्वास जीतेंगे और महत्वपूर्ण पद संभालेंगे। आप शिक्षा, रियल एस्टेट, परामर्श और कल्याण क्षेत्रों में अलग दिखेंगे।\n\n💰 [धन]\nयह दस्तावेजों को धारण करने का भाग्य है। आप घर के मालिक होने का लक्ष्य प्राप्त कर सकते हैं या विरासत या उपहार प्राप्त कर सकते हैं। स्थिर संपत्ति वृद्धि संभव है, और यह एक ऐसा वर्ष है जहाँ सम्मान धन से अधिक चमकता है।\n\n❤️ [प्रेम और संबंध]\nयह प्यार पाने का वर्ष है। आपको अपने प्रेमी से भरोसेमंद प्यार मिलेगा या आप अच्छी शर्तों वाले साथी से मिलेंगे। विवाह का भाग्य भी प्रवेश करता है, और पारिवारिक जीवन सामंजस्यपूर्ण हो जाता।\n\n⚠️ [सावधानियां]\nयदि आप केवल प्राप्त करने की कोशिश करते हैं, तो आप आलसी हो सकते हैं। जितना प्राप्त किया है उतना ही साझा करने का दृष्टिकोण आवश्यक है। निर्भरता त्यागें और आत्मनिर्भरता बढ़ाएं।';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ 2026 ब्योंग-ओ वर्ष ग्योंग-मेटल (Gyeong-Metal) सामान्य भाग्य: \'अग्निपरीक्षा के परे एक उत्कृष्ट कृति का जन्म\'\n\n2026 एक ऐसा वर्ष है जहाँ \'Pyeon-gwan\' (दबाव) और \'Jeong-gwan\' (अधिकार) आपके लिए, एक ग्योंग-मेटल, बहुत शक्तिशाली हैं। यह एक भट्टी में कच्चे अयस्क को पिघलाकर एक उत्कृष्ट कृति तलवार बनाने जैसी स्थिति है। तीव्र दबाव और तनाव हो सकता है, लेकिन यदि आप इसे सहन करते हैं, तो आपको अपार अधिकार और सम्मान प्राप्त होगा।\n\n💼 [करियर और व्यवसाय]\nआप भारी जिम्मेदारी वाले पद संभाल सकते हैं या कठिन प्रोजेक्ट्स को संभाल सकते हैं। हालाँकि, यह आपका परीक्षण करने की एक प्रक्रिया है, और यदि सफलतापूर्वक पूरा हो जाता है, तो आपकी स्थिति तुरंत बढ़ जाती है। सार्वजनिक कार्यालय, सेना, पुलिस और कानूनी क्षेत्रों में रहने वालों के लिए पदोन्नति का यह एक अवसर है।\n\n💰 [धन]\nयह पैसे के बजाय सम्मान और उपाधियों का भाग्य है। जैसे-जैसे स्थिति बढ़ती है, धन स्वाभाविक रूप से पीछे आएगा, लेकिन गरिमा बनाए रखने या मनोरंजन के लिए बाहर जाने वाला पैसा भी महत्वपूर्ण है।\n\n❤️ [प्रेम और संबंध]\nमहिलाओं के लिए, यह एक ऐसा भाग्य है जहाँ एक करिश्माई और सक्षम पुरुष दिखाई देता है। पुरुषों के पास बच्चों का मजबूत भाग्य है। कार्यस्थल के वरिष्ठों या बड़ों के साथ संबंध महत्वपूर्ण हो जाते हैं।\n\n⚠️ [सावधानियां]\nस्वास्थ्य प्रबंधन सर्वोच्च प्राथमिकता है। अधिक काम के कारण होने वाली बीमारियों या दुर्घटनाओं से सावधान रहें। विशेष रूप से फेफड़े और बड़ी आंत कमजोर हो सकते हैं। तनाव दूर करने के तरीके खोजें।';

  @override
  String get sajuFortune2026Sin =>
      '💎 2026 ब्योंग-ओ वर्ष सिन-मेटल (Sin-Metal) सामान्य भाग्य: \'चमकता हुआ रत्न, सम्मान का शिखर\'\n\n2026 आपके लिए, एक सिन-मेटल, \'Jeong-gwan\' (अधिकार) और \'Pyeon-gwan\' (दबाव) का वर्ष है। रोशनी के नीचे चमकते रत्न की तरह, यह एक ऐसी अवधि है जहाँ आपका मूल्य दुनिया के सामने प्रकट होता है और सम्मान बढ़ता है। आपके सीधे और स्थिर कार्यस्थलों या संगठनों के साथ गहरे संबंध हैं।\n\n💼 [करियर और व्यवसाय]\nनौकरी की तलाश, पदोन्नति और स्थानांतरण भाग्य बहुत अच्छे हैं। आपको अपने कौशल के लिए पहचाने जाने पर स्काउट ऑफर भी मिल सकते हैं। यदि आप सिद्धांतों का पालन करते हैं और काम को सही ढंग से संभालते हैं, तो आपको सभी से सम्मान मिलेगा।\n\n💰 [धन]\nस्थिर वेतन या निश्चित आय की गारंटी है। यदि आप धन का पीछा करने के बजाय सम्मान की रक्षा करते हैं, तो धन स्वाभाविक रूप से पीछे आएगा। आपको अपने पति या कार्यस्थल से लाभ मिल सकता है।\n\n❤️ [प्रेम और संबंध]\nयह महिलाओं के लिए सबसे अच्छा विवाह और डेटिंग भाग्य है। आप एक सीधे और सक्षम जीवनसाथी से मिल सकते हैं। पुरुष बच्चे प्राप्त करते हैं या बच्चों के कारण सुखद घटनाएं होती हैं।\n\n⚠️ [सावधानियां]\nबहुत अधिक गर्मी रत्न को पिघला सकती है। अत्यधिक काम या तनाव घबराहट का कारण बन सकता है। आप मजबूत सिद्धांत-उन्मुख प्रवृत्तियों के कारण अनम्य दिखाई दे सकते हैं, इसलिए सावधान रहें।';

  @override
  String get sajuFortune2026Im =>
      '🌊 2026 ब्योंग-ओ वर्ष इम-वाटर (Im-Water) सामान्य भाग्य: \'गतिविधि सीमा के विस्तार का एक गतिशील वर्ष\'\n\n2026 एक ऐसा वर्ष है जहाँ आपके लिए \'Pyeon-jae\' और \'Jeong-jae\' की ऊर्जा प्रवेश कर रही है। यह सूर्य की गर्मी प्राप्त करके सक्रिय रूप से प्रवाहित होने वाले और विस्तृत दुनिया की ओर बढ़ने वाले एक विशाल समुद्र की तरह है। यह एक गतिशील वर्ष होगा जहाँ आर्थिक गतिविधियाँ जोरदार हो जाएँगी और बड़ी संपत्ति को छूने के अवसर आएंगे।\n\n💼 [करियर और व्यवसाय]\nव्यावसायिक कौशल अधिकतम हो जाता है। नए बाजारों में अग्रणी बनने या निवेश से बड़ा लाभ प्राप्त करने के लिए एक बहुत अच्छा वर्ष। भाग्य जहाँ गतिविधि की सीमा घरेलू से विदेशों तक फैल सकती है। साहसिक निर्णय शानदार परिणामों की ओर ले जाते हैं, लेकिन विस्तृत समीक्षा आवश्यक है।\n\n💰 [धन]\nधन का भाग्य अपने चरम पर पहुँच जाता है। अप्रत्याशित लाभ या बड़े पैमाने पर व्यावसायिक लाभ की उम्मीद है। यदि आप पैसे के प्रवाह को अच्छी तरह से पकड़ते हैं, तो आप बड़ी संपत्ति बना सकते हैं। हालाँकि, प्रबंधन महत्वपूर्ण है क्योंकि बाहर जाने वाला पैसा आने वाले पैसे के बराबर बड़ा हो सकता है।\n\n❤️ [प्रेम और संबंध]\nसामाजिकता में सुधार होता है और उमड़ते आकर्षण के साथ विपरीत लिंग के कई लोग आस-पास इकट्ठा होते हैं। सक्रिय डेटिंग का आनंद लेने के लिए एक अच्छा समय। प्रेम संबंधों में, आप शानदार डेट्स और यात्राओं का आनंद लेते हुए खुशी का समय बिताते हैं। हालाँकि, सावधान रहें क्योंकि आप बहुत व्यस्त कार्यक्रम के कारण साथियों की उपेक्षा कर सकते हैं।\n\n⚠️ [सावधानियां]\nगुर्दे की कार्यप्रणाली या रक्त परिसंचरण पर ध्यान दें। साथ ही, उचित स्तर पर संतुष्ट रहने की बुद्धि आवश्यक है क्योंकि अत्यधिक लालच परेशानी का कारण बन सकता है।';

  @override
  String get sajuFortune2026Gye =>
      '💧 2026 ब्योंग-ओ वर्ष ग्ये-वाटर (Gye-Water) सामान्य भाग्य: \'आंतरिक नींव को मजबूत करते हुए व्यावहारिक हितों को प्राप्त करना\'\n\n2026 एक ऐसा वर्ष है जहाँ आपके लिए \'Jeong-jae\' और \'Pyeon-jae\' की ऊर्जा प्रवेश कर रही है। यह मीठी बारिश के बाद चमकने वाली धूप की तरह है, जो भूमि को जीवन और प्रचुरता से भर देती है। आप स्थिर आय के आधार पर आर्थिक स्थिरता प्राप्त करेंगे और छोटी खुशियाँ पाएंगे।\n\n💼 [करियर और व्यवसाय]\nआप सौंपे गए कार्यों को ईमानदारी और सावधानी के साथ पूरी तरह से संभालते हैं। वित्त, लेखा या प्रबंधन कार्यों में उत्कृष्ट क्षमता प्रदर्शित करें। सौंपे गए काम में अत्यधिक लालच के बजाय अपना सर्वश्रेष्ठ देने पर पहचान और पुरस्कार मिलते हैं। आप एक स्थिर वातावरण में कौशल निर्माण करते हुए कदम दर कदम बढ़ सकते हैं।\n\n💰 [धन]\nधन का भाग्य बहुत अच्छा है। निरंतर और स्थिर आय होती है, और आप वित्तीय तकनीक या बचत के माध्यम से संपत्ति बढ़ाने के आनंद का अनुभव करते हैं। छोटे लेकिन निश्चित लाभ मिलकर बड़ा इनाम देते हैं। इस वर्ष मितव्ययी खर्च करने की आदतें चमकती हैं।\n\n❤️ [प्रेम और संबंध]\nआप दयालु और सूक्ष्म विचार के साथ साथियों को गहरा विश्वास देते हैं। आप दैनिक जीवन साझा करते हुए एक छोटे लेकिन गर्म प्यार को बढ़ाते हैं। संबंध भी सुचारू और शांतिपूर्ण रहते हैं। आप अपने आस-पास के लोगों के लिए एक विश्वसनीय सलाहकार की भूमिका निभाएंगे।\n\n⚠️ [सावधानियां]\nआँखों के रोगों या मूत्र प्रणाली के स्वास्थ्य पर ध्यान दें। साथ ही, कभी-कभी दुनिया को व्यापक दृष्टिकोण से देखने का अभ्यास करें क्योंकि आप बहुत विस्तृत चीजों पर ध्यान देकर बड़े प्रवाह को चूक सकते हैं।';

  @override
  String get preparationForTomorrow => 'कल की तैयारी';

  @override
  String get howToMeetMoreLuck => 'अधिक भाग्य कैसे प्राप्त करें';

  @override
  String get enterName => 'कृपया अपना नाम दर्ज करें';

  @override
  String fortuneDateConfirm(String date) {
    return 'क्या आप $date के लिए भाग्य की जाँच करना चाहेंगे?';
  }

  @override
  String get colorPurple => 'बैंगनी';

  @override
  String get colorBlue => 'नीला';

  @override
  String get colorYellow => 'पीला';

  @override
  String get colorRed => 'लाल';

  @override
  String get colorGreen => 'हरा';

  @override
  String get colorPink => 'गुलाबी';

  @override
  String get colorOrange => 'नारंगी';

  @override
  String get colorWhite => 'सफेद';

  @override
  String get colorBlack => 'काला';

  @override
  String get itemPerfume => 'इत्र';

  @override
  String get itemHandkerchief => 'रुमाल';

  @override
  String get itemRing => 'अंगूठी';

  @override
  String get itemWatch => 'घड़ी';

  @override
  String get itemGlasses => 'चश्मा';

  @override
  String get itemHat => 'टोपी';

  @override
  String get itemBook => 'किताब';

  @override
  String get itemEarphones => 'ईयरफोन';

  @override
  String get itemMirror => 'दर्पण';

  @override
  String get itemPen => 'पेन';

  @override
  String get itemCoin => 'सिक्का';

  @override
  String get itemKey => 'चाबी';

  @override
  String get dirEast => 'पूर्व';

  @override
  String get dirWest => 'पश्चिम';

  @override
  String get dirSouth => 'दक्षिण';

  @override
  String get dirNorth => 'उत्तर';

  @override
  String get dirNorthEast => 'उत्तर-पूर्व';

  @override
  String get dirSouthEast => 'दक्षिण-पूर्व';

  @override
  String get dirNorthWest => 'उत्तर-पश्चिम';

  @override
  String get dirSouthWest => 'दक्षिण-पश्चिम';

  @override
  String get general => 'सामान्य';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get darkModeDescription => 'स्क्रीन को डार्क पर सेट करें।';

  @override
  String get alarmSettings => 'अलार्म सेटिंग्स';

  @override
  String get privacySettings => 'गोपनीयता सेटिंग्स';

  @override
  String get information => 'जानकारी';

  @override
  String get notice => 'सूचना';

  @override
  String get weatherConditionSunny => 'साफ़';

  @override
  String get weatherConditionPartlyCloudy => 'आंशिक रूप से बादल';

  @override
  String get weatherConditionCloudy => 'बादल';

  @override
  String get weatherConditionFoggy => 'कोहरा';

  @override
  String get weatherConditionDrizzle => 'बूंदाबांदी';

  @override
  String get weatherConditionRainy => 'बारिश';

  @override
  String get weatherConditionFreezingRain => 'जमने वाली बारिश';

  @override
  String get weatherConditionSnowy => 'बर्फ';

  @override
  String get weatherConditionSnowGrains => 'बर्फ के दाने';

  @override
  String get weatherConditionRainShowers => 'बारिश की बौछारें';

  @override
  String get weatherConditionSnowShowers => 'बर्फ की बौछारें';

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
  String get privacyPolicy =>
      'सेवा की शर्तें और गोपनीयता नीति\n\n1. सामान्य प्रावधान\n\nअनुच्छेद 1 (उद्देश्य)\nइन शर्तों का उद्देश्य \'फॉर्च्यून अलार्म\' (इसके बाद \'सेवा\' कहा जाएगा) द्वारा प्रदान की जाने वाली सेवा के उपयोग की शर्तों और प्रक्रियाओं, और उपयोगकर्ताओं और डेवलपर के अधिकारों, दायित्वों और जिम्मेदारियों को निर्धारित करना है।\n\nअनुच्छेद 2 (शर्तों की परिभाषा)\n1. \'उपयोगकर्ता\' उस व्यक्ति को संदर्भित करता है जो ऐप इंस्टॉल करता है और सेवा का उपयोग करता है।\n2. \'सेवा\' अलार्म, भाग्य, मौसम और मिशन जैसे कार्यों को संदर्भित करती है जो ऐप के माध्यम से प्रदान किए जाते हैं।\n\n2. सेवा का उपयोग\n\nअनुच्छेद 3 (सेवा प्रावधान)\n1. यह सेवा अलार्म, मिशन, आज का भाग्य और मौसम की जानकारी जैसे कार्य नि:शुल्क प्रदान करती है।\n2. मौसम की जानकारी के लिए स्थान डेटा का उपयोग किया जाता है, और यह डेटा सर्वर पर संग्रहीत नहीं होता है।\n\nअनुच्छेद 4 (विज्ञापन)\nसेवा के संचालन के लिए ऐप के भीतर विज्ञापन प्रदर्शित किए जा सकते हैं।\n\n3. व्यक्तिगत जानकारी सुरक्षा\n\nअनुच्छेद 5 (व्यक्तिगत जानकारी का संग्रह और उपयोग)\n1. यह ऐप सदस्यता पंजीकरण की आवश्यकता नहीं है और सर्वर पर व्यक्तिगत जानकारी संग्रहीत नहीं करता है।\n2. सभी डेटा (अलार्म सेटिंग्स, मिशन रिकॉर्ड, आदि) उपयोगकर्ता के डिवाइस पर स्थानीय रूप से संग्रहीत किए जाते हैं।\n3. ऐप को हटाने पर, सभी संग्रहीत डेटा भी हटा दिए जाएंगे और उन्हें पुनर्प्राप्त नहीं किया जा सकता है।\n\nअनुच्छेद 6 (अनुमतियाँ)\nसेवा का उपयोग करने के लिए निम्नलिखित अनुमतियों की आवश्यकता हो सकती है:\n- अलार्म और रिमाइंडर: सटीक समय पर अलार्म बजाने के लिए उपयोग किया जाता है।\n- अन्य ऐप्स के ऊपर दिखाएं: अलार्म स्क्रीन प्रदर्शित करने के लिए उपयोग किया जाता है।\n- स्थान: मौसम की जानकारी प्रदान करने के लिए उपयोग किया जाता है।\n- बैटरी अनुकूलन को अनदेखा करें: अलार्म के विश्वसनीय संचालन के लिए उपयोग किया जाता है।\n\n4. दायित्व और क्षतिपूर्ति\n\nअनुच्छेद 7 (प्रतिबंध)\nडेवलपर सेवा के उपयोग से होने वाले किसी भी नुकसान के लिए जिम्मेदार नहीं है (अलार्म विफलता, डेटा हानि, आदि)। उपयोगकर्ता डेटा बैकअप और प्रबंधन के लिए जिम्मेदार है।\n\n5. अन्य\n\nअनुच्छेद 8 (संपर्क)\nसेवा के बारे में पूछताछ के लिए, कृपया नीचे दिए गए ईमेल पर संपर्क करें।\nईमेल: seriessnap.co@gmail.com';

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
  String get allowAllItems => 'कृपया सभी अनुमतियाँ सक्षम करें।';

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
  String get wakeUpAlarm => 'अलार्म';

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
  String get daySunFull => 'रविवार';

  @override
  String get dayMonFull => 'सोमवार';

  @override
  String get dayTueFull => 'मंगलवार';

  @override
  String get dayWedFull => 'बुधवार';

  @override
  String get dayThuFull => 'गुरुवार';

  @override
  String get dayFriFull => 'शुक्रवार';

  @override
  String get daySatFull => 'शनिवार';

  @override
  String get missionRewardEarned =>
      'बधाई हो! आपने 5 मिशन पूरे किए और 1 भाग्य कुकी (Fortune Cookie) जीती है!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'शानदार! आपने $missions मिशन पूरे किए और $cookies भाग्य कुकी(ज़) प्राप्त कीं!';
  }

  @override
  String daysCount(int count) {
    return '$count दिन';
  }

  @override
  String get user => 'उपयोगकर्ता';

  @override
  String get member => 'सदस्य';

  @override
  String get manageSajuInfo => 'जन्म जानकारी प्रबंधित करें';

  @override
  String get freeCharge => 'मुफ्त रिफिल';

  @override
  String get fortunePass => 'फॉर्च्यून पास';

  @override
  String get unlimitedNotSubscribed => 'सदस्यता सक्रिय नहीं है';

  @override
  String get unlimitedInUse => 'सदस्यता सक्रिय है';

  @override
  String get subscribe => 'सदस्यता लें';

  @override
  String get manageSubscription => 'सदस्यता प्रबंधन';

  @override
  String get purchaseHistory => 'खरीद इतिहास';

  @override
  String get customerCenter => 'सहायता केंद्र';

  @override
  String get noNewNotifications => 'कोई नई सूचना नहीं है।';

  @override
  String get noPurchaseHistory => 'कोई खरीद इतिहास नहीं मिला।';

  @override
  String get none => 'कोई नहीं';

  @override
  String deleteConfirmMessage(String title) {
    return 'क्या आप \"$title\" को हटाना चाहते हैं?';
  }

  @override
  String get delete => 'हटाएं';

  @override
  String get notepad => 'नोटपैड';

  @override
  String get today => 'आज';

  @override
  String get yearView => 'वर्ष';

  @override
  String get monthView => 'माह';

  @override
  String get weekView => 'सप्ताह';

  @override
  String get dayView => 'दिन';

  @override
  String get noEvents => 'कोई निर्धारित कार्यक्रम नहीं है।';

  @override
  String get calendarDragGuide => 'विस्तृत कैलेंडर देखने के लिए नीचे खींचें।';

  @override
  String get noSavedMemos => 'कोई सहेजा गया मेमो या ईवेंट नहीं है।';

  @override
  String get holiday => 'अवकाश';

  @override
  String get photo => 'फोटो';

  @override
  String get drawing => 'ड्राइंग';

  @override
  String get drawingTitle => 'चित्रकारी (Drawing)';

  @override
  String get pencil => 'पेंसिल';

  @override
  String get marker => 'मार्कर';

  @override
  String get eraser => 'इरेज़र';

  @override
  String adjustThickness(String label) {
    return '$label की मोटाई बदलें';
  }

  @override
  String get sticker => 'स्टीकर';

  @override
  String get event => 'ईवेंट';

  @override
  String get memo => 'मेमो';

  @override
  String get routineExercise => 'व्यायाम';

  @override
  String get routineHiking => 'हाइकिंग';

  @override
  String get routineCleaning => 'सफाई';

  @override
  String get routineTravel => 'यात्रा';

  @override
  String get routineDate => 'डेट (Date)';

  @override
  String get routineConcert => 'कॉन्सर्ट';

  @override
  String get routineMovie => 'फिल्म';

  @override
  String get routineMeeting => 'मीटिंग';

  @override
  String get howIsYourMoodToday => 'आज आपका मूड कैसा है?';

  @override
  String get complete => 'पूर्ण';

  @override
  String get amWithIcon => '☀️ AM';

  @override
  String get pmWithIcon => '🌙 PM';

  @override
  String get photoPermissionDescription =>
      'फ़ोटो जोड़ने के लिए, आपको सेटिंग्स में फ़ोटो एक्सेस की अनुमति देनी होगी।';

  @override
  String get goToSettings => 'सेटिंग्स पर जाएं';

  @override
  String get photoPermissionNeeded => 'फ़ोटो एक्सेस अनुमति आवश्यक है।';

  @override
  String get fontSize => 'फ़ॉन्ट आकार';

  @override
  String get fontFamily => 'फ़ॉन्ट';

  @override
  String get textColor => 'टेक्स्ट का रंग';

  @override
  String get textAlign => 'संरेखण';

  @override
  String get alignLeft => 'बायां';

  @override
  String get alignCenter => 'केंद्र';

  @override
  String get alignRight => 'दायां';

  @override
  String get edit => 'संपादन';

  @override
  String get fontSettings => 'फ़ॉन्ट सेटिंग्स';

  @override
  String get imageAddedFromKeyboard => 'कीबोर्ड से इमेज जोड़ी गई।';

  @override
  String get cancelWriting => 'लिखना रद्द करें';

  @override
  String get cancelWritingConfirm =>
      'सामग्री लिखी जा रही है। क्या आप रद्द करना और बाहर निकलना चाहते हैं?';

  @override
  String get continueWriting => 'लिखना जारी रखें';

  @override
  String get title => 'शीर्षक';

  @override
  String get content => 'सामग्री';

  @override
  String get selectTime => 'समय चुनें';

  @override
  String get noTime => 'कोई समय नहीं';

  @override
  String minutesLater(String minutes) {
    return '$minutes मिनट बाद';
  }

  @override
  String get countLabel => 'गिनती';

  @override
  String timesCount(String count) {
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
  String get customStyle => 'कस्टम स्टाइल';

  @override
  String get alarmName => 'अलार्म नाम';

  @override
  String get enterAlarmName => 'कृपया अलार्म नाम दर्ज करें';

  @override
  String get routineSummary => 'रूटीन सारांश';

  @override
  String get alarmOn => 'अलार्म चालू';

  @override
  String get alarmOff => 'अलार्म बंद';

  @override
  String get contentHint => 'सामग्री जोड़ें';

  @override
  String get addEvent => 'ईवेंट जोड़ें';

  @override
  String get manageItem => 'आइटम प्रबंधित करें';

  @override
  String get manageItemDescription => 'आप इस आइटम के साथ क्या करना चाहेंगे?';

  @override
  String get noTitle => 'कोई शीर्षक नहीं';

  @override
  String get selectTitleColor => 'शीर्षक का रंग चुनें';

  @override
  String get save => 'सहेजें';

  @override
  String get missionNone => 'कोई मिशन नहीं';

  @override
  String get missionSnap => 'स्नैप';

  @override
  String get missionMath => 'गणित';

  @override
  String get missionFortune => 'भाग्य';

  @override
  String get missionShake => 'हिलाना';

  @override
  String get missionFortuneCatch => 'फॉर्च्यून कैच';

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
  String get missionFortuneCatchDescription => 'चलती फॉर्च्यूनी को पकड़ें!';

  @override
  String get missionWalk => 'चलना';

  @override
  String get missionWalkDescription => 'अलार्म बंद करने के लिए चलें!';

  @override
  String get missionFaceDescription => '5 सेकंड तक चेहरा फ्रेम में रखें।';

  @override
  String get walkStepCount => 'लक्ष्य कदम';

  @override
  String walkSteps(int count) {
    return '$count कदम';
  }

  @override
  String get missionNumberOrder => 'संख्या क्रम';

  @override
  String get missionNumberOrderDescription => '1 से 9 तक क्रम से टैप करें।';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'अगला: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'स्थिति याद';

  @override
  String get missionHiddenButtonDescription =>
      'चमकते टाइल्स को क्रम से याद करें और 10 सेकंड में टैप करें।';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'टैप स्प्रिंट';

  @override
  String get missionTapSprintDescriptionShort => 'मीटर भरने के लिए टैप करें।';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'मीटर भरने के लिए $goalTaps+ बार टैप करें।';
  }

  @override
  String get missionTapSprintTapHere => 'टैप';

  @override
  String get missionTapSprintHint => 'तेज़ी से भरता है, रुकने पर घटता है।';

  @override
  String get missionLeftRight => 'बायाँ / दायाँ';

  @override
  String get missionLeftRightDescriptionShort =>
      'संकेत के अनुसार बायाँ या दायाँ चुनें।';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'लगातार $targetStreak सही करें।';
  }

  @override
  String get missionLeftRightPromptLeft => 'बायाँ टैप करें';

  @override
  String get missionLeftRightPromptRight => 'दायाँ टैप करें';

  @override
  String get left => 'बायाँ';

  @override
  String get right => 'दायाँ';

  @override
  String get missionHintInactivity => '2 मिनट रुकने पर रीसेट हो जाएगा।';

  @override
  String fortuneCatchScore(int score) {
    return 'स्कोर: $score';
  }

  @override
  String get fortuneCatchGoal => 'लक्ष्य: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(पकड़: $count/$min)';
  }

  @override
  String fortuneCatchTime(int seconds) {
    return 'समय: $seconds सेकंड';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'सर्वश्रेष्ठ: $seconds सेकंड';
  }

  @override
  String get fortuneCatchAngryHint =>
      'क्रोधित भाग्यनी (Bhagyani) एक पेनल्टी है!';

  @override
  String get fortuneCatchInstruction =>
      'क्रोधित भाग्यनी (Bhagyani) से बचें और उन्हें पकड़ें!';

  @override
  String fortuneCatchPointMinus(int points) {
    return '$points अंक काटे गए';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points अंक';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo कॉम्बो!';
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
  String missionAnalyzing(int index, int total) {
    return 'मिशन $index/$total विश्लेषण किया जा रहा है...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'मिशन $index/$total: गाइड में वस्तु की ओर इशारा करें।';
  }

  @override
  String get missionPointSink => 'सिंक की ओर इशारा करें।';

  @override
  String get missionPointRefrigerator => 'रेफ्रिजरेटर की ओर इशारा करें।';

  @override
  String get missionPointScale => 'वजन मशीन की ओर इशारा करें।';

  @override
  String get missionPointFace => 'अपने चेहरे की ओर इशारा करें।';

  @override
  String get missionPointObjectGeneric => 'निर्दिष्ट वस्तु की ओर इशारा करें।';

  @override
  String get missionRecognizeObject => 'कृपया वस्तु को पहचानें।';

  @override
  String get missionPerform => 'कृपया मिशन पूरा करें।';

  @override
  String get initError => 'आरंभीकरण के दौरान एक त्रुटि हुई।';

  @override
  String get analyzingNextTarget => 'अगले लक्ष्य का विश्लेषण किया जा रहा है...';

  @override
  String get errorOccurredGeneric => 'त्रुटि हुई';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total सफलता!';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total सफलता! मिलान सफल!';
  }

  @override
  String get escape => 'बाहर निकलें';

  @override
  String get pointObjectClearly =>
      'ऐसी फ़ोटो लें जहाँ लक्ष्य स्पष्ट रूप से दिखाई दे';

  @override
  String get matchingSuccess => 'मिलान सफल!';

  @override
  String get missionComplete => 'मिशन पूरा हुआ!';

  @override
  String get allMissionsComplete => 'सभी मिशन पूरे हुए!';

  @override
  String missionSnoozeMessage(String minutes) {
    return 'मिशन सफल! लेकिन सेटिंग्स के अनुसार यह $minutes मिनट में फिर से बजेगा।';
  }

  @override
  String get showFace => 'कृपया अपना चेहरा दिखाएं';

  @override
  String get keepWatching => 'स्क्रीन देखते रहें';

  @override
  String get recognizingFaceForFortune =>
      'चेहरा विश्लेषण के लिए चेहरा पहचाना जा रहा है';

  @override
  String get dataNotStored => 'डेटा संग्रहीत नहीं है';

  @override
  String get solveProblem => 'कृपया समस्या का समाधान करें।';

  @override
  String get correctAnswer => 'सही उत्तर!';

  @override
  String get wrongAnswerRetry => 'गलत। कृपया पुनः प्रयास करें।';

  @override
  String get correct => 'सही!';

  @override
  String get walkToDismiss => 'कृपया अपना स्मार्टफोन पकड़कर चलें';

  @override
  String get shakeCount => 'शेक गिनती';

  @override
  String shakeTimes(int count) {
    return '$count बार';
  }

  @override
  String tapTimes(int count) {
    return '$count टैप';
  }

  @override
  String missionNumber(int number) {
    return 'मिशन $number';
  }

  @override
  String get soundBirds => 'पक्षियों की आवाज़';

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
  String get selectMissionTitle => 'कृपया अलार्म बंद करने का मिशन चुनें।';

  @override
  String get ringtoneCategoryStandard => 'मानक';

  @override
  String get ringtoneCategoryCalm => 'शांत';

  @override
  String get ringtoneCategoryUpbeat => 'उत्साही';

  @override
  String get ringtoneCategoryLoud => 'तेज़';

  @override
  String get noRingtones => 'कोई रिंगटोन नहीं मिली।';

  @override
  String get photoPermissionRequired => 'फ़ोटो एक्सेस अनुमति आवश्यक है।';

  @override
  String get deleteImage => 'इमेज हटाएं';

  @override
  String get longPressToDelete => 'हटाने के लिए देर तक दबाएं।';

  @override
  String get videoLoadFail =>
      'वीडियो लोड करने में विफल\nपुनः प्रयास करने के लिए टैप करें';

  @override
  String get existingCapturedImages => 'मौजूदा कैप्चर की गई इमेज';

  @override
  String deleteCount(int count) {
    return '$count हटाएं';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return 'क्या आप निश्चित रूप से $count इमेज हटाना चाहते हैं?\nयह क्रिया पूर्ववत नहीं की जा सकती।';
  }

  @override
  String get classicAlarm => 'क्लासिक अलार्म';

  @override
  String get digitalAlarm => 'डिजिटल अलार्म';

  @override
  String get birdsSound => 'पक्षियों का चहचहाना';

  @override
  String get wavesSound => 'समुद्र की लहरें';

  @override
  String get cuckooClock => 'कुक्कू घड़ी';

  @override
  String get calmAlarm => 'शांत अलार्म';

  @override
  String get doorKnock => 'दरवाजे की दस्तक';

  @override
  String get earlySunrise => 'जल्दी सूर्योदय';

  @override
  String get goodMorningSound => 'सुप्रभात';

  @override
  String get inAHurry => 'जल्दबाजी में';

  @override
  String get lovingYou => 'लविंग यू';

  @override
  String get sirenSound => 'सायरन';

  @override
  String get swingingSound => 'झूलता हुआ';

  @override
  String get telephoneBusy => 'टेलीफोन व्यस्त';

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
  String get retry => 'पुनः प्रयास करें';

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
  String get batteryOptimizationName => 'बैटरी ऑप्टिमाइज़ेशन';

  @override
  String get batteryOptimizationTitle =>
      'सटीक अलार्म के लिए\nऑप्टिमाइज़ेशन सेटिंग्स आवश्यक हैं।';

  @override
  String get batteryOptimizationSubtitle =>
      'कृपया बैटरी ऑप्टिमाइज़ेशन अपवाद के रूप में सेट करें\nताकि ऐप बैकग्राउंड में सुचारू रूप से चल सके।';

  @override
  String get batteryOptimizationBottomDesc =>
      'सेटिंग्स में \'Unrestricted\' या \'Don\'t optimize\'\nचुनने से अलार्म मिस नहीं होगा।';

  @override
  String get understand => 'समझ गया';

  @override
  String get overlayPermissionName => 'अन्य ऐप्स के ऊपर प्रदर्शित करें';

  @override
  String get overlayPermissionTitle => 'अनुमति मार्गदर्शिका';

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
  String snoozeRemainingCount(int current, int max) {
    return 'शेष ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'अलार्म बंद करें';

  @override
  String get startMission => 'मिशन शुरू करें';

  @override
  String get alarmSnooze => 'अलार्म टालें';

  @override
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes मिनट (असीमित)';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes मिनट ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => 'खुशनुमा दिन';

  @override
  String get ringtone_cozy_day => 'सुकून भरा दिन';

  @override
  String get ringtone_sensible_day => 'समझदारी भरा दिन';

  @override
  String get ringtone_play_with_me => 'मेरे साथ खेलो';

  @override
  String get ringtone_refreshing_day => 'ताज़गी भरा दिन';

  @override
  String get ringtone_new_beginning => 'नई शुरुआत';

  @override
  String get ringtone_self_love => 'खुद से प्यार';

  @override
  String get cherry_stained_finger => 'चेरी सना हुआ उंगली';

  @override
  String get dancing_in_the_stars => 'सितारों में नृत्य';

  @override
  String get nice_day => 'अच्छा दिन';

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
  String fortuneSelectTitleDate(String month, int day) {
    return '$day/$month की ऊर्जा के बारे में सोचें\nऔर 3 कार्ड चुनें।';
  }

  @override
  String get fortuneNewYearButton => '2026 नव वर्ष भाग्य देखें';

  @override
  String get loveFortune => 'प्रेम';

  @override
  String get wealthFortune => 'धन';

  @override
  String get successFortune => 'सफलता';

  @override
  String get fortuneResultTitle => 'यहाँ आज के लिए आपका भाग्य परिणाम है।';

  @override
  String fortuneResultTitleDate(int year, String month, int day) {
    return '$day/$month/$year के लिए भाग्य';
  }

  @override
  String get startDayButton => 'अपना दिन शुरू करें';

  @override
  String get tarotName0 => 'मूर्ख';

  @override
  String get tarotName1 => 'जादूगर';

  @override
  String get tarotName2 => 'उच्च पुजारिन';

  @override
  String get tarotName3 => 'महारानी';

  @override
  String get tarotName4 => 'सम्राट';

  @override
  String get tarotName5 => 'पदानुक्रमित';

  @override
  String get tarotName6 => 'प्रेमी';

  @override
  String get tarotName7 => 'रथ';

  @override
  String get tarotName8 => 'ताकत';

  @override
  String get tarotName9 => 'सन्यासी';

  @override
  String get tarotName10 => 'भाग्य का पहिया';

  @override
  String get tarotName11 => 'न्याय';

  @override
  String get tarotName12 => 'फांसी पर लटका आदमी';

  @override
  String get tarotName13 => 'मौत';

  @override
  String get tarotName14 => 'संयम';

  @override
  String get tarotName15 => 'शैतान';

  @override
  String get tarotName16 => 'टावर';

  @override
  String get tarotName17 => 'तारा';

  @override
  String get tarotName18 => 'चाँद';

  @override
  String get tarotName19 => 'सूरज';

  @override
  String get tarotName20 => 'निर्णय';

  @override
  String get tarotName21 => 'दुनिया';

  @override
  String get tarotKeywords0 =>
      'नई शुरुआत, साहसिक कार्य, मासूमियत, स्वतंत्रता, लापरवाही';

  @override
  String get tarotDesc0 =>
      'मूर्ख कार्ड एक नई जीवन यात्रा की शुरुआत का प्रतीक है। यह मासूमियत, उत्साह और अज्ञात में छलांग लगाने के साहस को दर्शाता है। यह कार्ड आपको अपने दिल की सुनने और बिना किसी डर के नए अवसरों का स्वागत करने के लिए प्रोत्साहित करता है।';

  @override
  String get tarotLoveMeaning0 =>
      'प्यार में, यह एक नई और रोमांचक शुरुआत का संकेत देता है। एक अप्रत्याशित नया प्यार आपके जीवन में आ सकता है, जो ताजगी और खुशी लाएगा। यह पहली नजर में प्यार या किसी नए रिश्ते की शुरुआत हो सकती है।';

  @override
  String get tarotLoveDetail0 =>
      'यह समय पुराने दर्द को भूलकर एक बच्चे की तरह शुद्ध हृदय के साथ प्यार करने का है। अपने आप को पूरी तरह से व्यक्त करें और भावनाओं के प्रवाह में बहें। आपकी सहजता आपके साथी को आपकी ओर आकर्षित करेगी।';

  @override
  String get tarotWealthMeaning0 =>
      'आर्थिक रूप से, यह नए निवेश या व्यावसायिक अवसरों का समय है। आप किसी ऐसे क्षेत्र में पैसा लगा सकते हैं जिसके बारे में आपने पहले कभी नहीं सोचा था। यह एक जोखिम भरा लेकिन संभावित रूप से लाभकारी समय हो सकता है।';

  @override
  String get tarotWealthDetail0 =>
      'धन के मामले में नए रास्ते खुल रहे हैं, जिससे आपको अप्रत्याशित लाभ मिल सकता है। अपनी अंतरात्मा पर भरोसा करें और नई योजनाओं को आज़माने से न डरें। हालांकि, पूरी तरह से लापरवाही बरतने से बचें और बुनियादी सावधानी रखें।';

  @override
  String get tarotSuccessMeaning0 =>
      'करियर में, यह एक नया प्रोजेक्ट शुरू करने या पूरी तरह से अलग क्षेत्र में कदम रखने का शानदार समय है। आपकी रचनात्मकता और नया दृष्टिकोण आपको दूसरों से अलग खड़ा करेगा। सफलता की कुंजी आपके साहस में छिपी है।';

  @override
  String get tarotSuccessDetail0 =>
      'यदि आप किसी नई चीज़ की तैयारी कर रहे हैं, तो अब पहला कदम उठाने का समय है। अपनी क्षमताओं पर भरोसा रखें और चुनौतियों को सीखने के अवसर के रूप में देखें। आपकी निडरता आपको करियर के नए शिखर पर ले जाएगी।';

  @override
  String get tarotKeywords1 =>
      'रचनात्मकता, कौशल, इच्छाशक्ति, आत्म-विश्वास, अभिव्यक्ति';

  @override
  String get tarotDesc1 =>
      'जादूगर कार्ड आपकी आंतरिक शक्ति और संसाधनों का प्रतीक है। आपके पास वह सब कुछ है जो आपको अपने लक्ष्यों को प्राप्त करने के लिए चाहिए। यह कार्ड आपको अपनी प्रतिभा का उपयोग करने और अपने सपनों को हकीकत में बदलने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning1 =>
      'प्यार में, यह कार्ड आकर्षण और नई शुरुआत का संकेत देता है। आप अपने साथी को प्रभावित करने और रिश्ते में नई जान फूंकने में सक्षम होंगे। सिंगल लोगों के लिए, यह अपनी भावनाओं को व्यक्त करने का एक अच्छा समय है।';

  @override
  String get tarotLoveDetail1 =>
      'आप अपनी बातचीत और व्यवहार से दूसरों का दिल जीतने की क्षमता रखते हैं। अपनी भावनाओं को स्पष्ट रूप से साझा करें और रिश्ते में ईमानदारी बरतें। आपका आत्म-विश्वास आपके प्रेम जीवन में सकारात्मक बदलाव लाएगा।';

  @override
  String get tarotWealthMeaning1 =>
      'आर्थिक रूप से, यह नई योजनाओं और लाभ का समय है। आपकी बुद्धिमत्ता और कौशल आपको धन कमाने के नए तरीके खोजने में मदद करेंगे। यह वित्तीय स्थिरता प्राप्त करने के लिए अपनी प्रतिभा का उपयोग करने का समय है।';

  @override
  String get tarotWealthDetail1 =>
      'आपके वित्तीय प्रयास सफल होंगे क्योंकि आप अपने संसाधनों का सही उपयोग करना जानते हैं। निवेश के नए अवसर सामने आएंगे, उन्हें ध्यान से परखें। अपनी वित्तीय स्थिति को बेहतर बनाने के लिए अपनी रचनात्मक सोच का लाभ उठाएं।';

  @override
  String get tarotSuccessMeaning1 =>
      'करियर में, जादूगर सफलता और पदोन्नति का संकेत देता है। आप अपने कार्यस्थल पर अपनी क्षमताओं का प्रदर्शन करके दूसरों का ध्यान आकर्षित करेंगे। नई तकनीकों या कौशलों को सीखना आपके लिए फायदेमंद साबित होगा।';

  @override
  String get tarotSuccessDetail1 =>
      'आपके पास कठिन समस्याओं का समाधान खोजने की अद्भुत क्षमता है। अपने सहकर्मियों के साथ मिलकर काम करें और अपने विचारों को मजबूती से प्रस्तुत करें। आपकी मेहनत और समर्पण आपको वांछित परिणाम दिलाएंगे।';

  @override
  String get tarotKeywords2 =>
      'अंतर्ज्ञान, रहस्य, अवचेतन, आंतरिक ज्ञान, निष्क्रियता';

  @override
  String get tarotDesc2 =>
      'उच्च पुजारिन कार्ड आंतरिक ज्ञान और अंतर्ज्ञान का प्रतीक है। यह आपको बाहरी शोर को शांत करने और अपनी अंतरात्मा की आवाज सुनने के लिए कहता है। रहस्य और अज्ञात के प्रति आपकी संवेदनशीलता इस समय बढ़ जाएगी।';

  @override
  String get tarotLoveMeaning2 =>
      'प्यार में, यह कार्ड गहरी भावनाओं और आध्यात्मिक जुड़ाव का संकेत देता है। हो सकता है कि सब कुछ स्पष्ट न हो, लेकिन आपका दिल सच्चाई जानता है। रिश्तों में धैर्य रखें और चीजों को स्वाभाविक रूप से विकसित होने दें।';

  @override
  String get tarotLoveDetail2 =>
      'अपने साथी की अनकही बातों को समझने की कोशिश करें। यह समय बाहरी दिखावे के बजाय आंतरिक भावनाओं पर ध्यान केंद्रित करने का है। सिंगल लोगों के लिए, किसी के प्रति रहस्यमयी आकर्षण महसूस हो सकता है।';

  @override
  String get tarotWealthMeaning2 =>
      'आर्थिक रूप से, यह समय अपनी वित्तीय योजनाओं को गुप्त रखने और सावधानी बरतने का है। जल्दबाजी में निवेश करने के बजाय, बाजार की गहराई को समझने की कोशिश करें। अपनी आर्थिक स्थिति के बारे में अपनी अंतरात्मा की सुनें।';

  @override
  String get tarotWealthDetail2 =>
      'वित्तीय निर्णयों में अपनी छठी इंद्रिय पर भरोसा करें। यदि कोई सौदा बहुत अच्छा लग रहा है, तो उसके पीछे के छिपे तथ्यों की जांच करें। शांत रहकर और सोच-समझकर कदम उठाकर आप अपने धन की रक्षा कर सकते हैं।';

  @override
  String get tarotSuccessMeaning2 =>
      'करियर में, यह कार्ड सीखने और अनुसंधान का संकेत देता है। आप अपनी बुद्धिमत्ता और शांत व्यवहार से सफलता प्राप्त करेंगे। दूसरों की बातों में आने के बजाय अपने ज्ञान और अनुभव पर भरोसा रखें।';

  @override
  String get tarotSuccessDetail2 =>
      'कार्यस्थल पर चल रही राजनीति से दूर रहें और अपने काम पर ध्यान दें। आपके पास छिपी हुई जानकारी या कौशल हो सकता है जो सही समय पर काम आएगा। धैर्य और समझदारी आपको पेशेवर रूप से आगे बढ़ाएगी।';

  @override
  String get tarotKeywords3 => 'स्त्रीत्व, सुंदरता, प्रकृति, प्रचुरता, उर्वरता';

  @override
  String get tarotDesc3 =>
      'महारानी कार्ड प्रचुरता, पोषण और रचनात्मकता का प्रतीक है। यह प्रकृति की शक्ति और जीवन के आनंद का उत्सव मनाने का समय है। यह कार्ड आपको अपने आस-पास की सुंदरता को पहचानने और दूसरों के प्रति दयालु रहने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning3 =>
      'प्यार में, यह कार्ड एक गहरे, पोषण करने वाले और प्रेमपूर्ण रिश्ते का संकेत देता है। यदि आप किसी रिश्ते में हैं, तो यह और अधिक मजबूत और स्थिर होगा। सिंगल लोगों के लिए, यह एक ऐसे साथी के मिलने का समय है जो आपको सुरक्षा और प्यार महसूस कराए।';

  @override
  String get tarotLoveDetail3 =>
      'आपकी संवेदनशीलता और देखभाल करने वाला स्वभाव आपके साथी को बहुत पसंद आएगा। यह समय रोमांस और भावनात्मक गहराई के लिए बेहतरीन है। परिवार शुरू करने या घर को सुंदर बनाने के बारे में सोचने के लिए भी यह एक अच्छा समय है।';

  @override
  String get tarotWealthMeaning3 =>
      'आर्थिक रूप से, महारानी समृद्धि और भौतिक सुख-सुविधाओं का संकेत देती है। आपके पिछले निवेश अब फल देने लगेंगे। यह विलासिता और आराम पर थोड़ा खर्च करने का समय हो सकता है, लेकिन संतुलन बनाए रखें।';

  @override
  String get tarotWealthDetail3 =>
      'आपके पास धन का प्रवाह अच्छा रहेगा और आप आर्थिक रूप से सुरक्षित महसूस करेंगे। अपनी संपत्ति को बढ़ाने के लिए रचनात्मक तरीकों का उपयोग करें। प्रकृति से जुड़े व्यवसायों या कलात्मक क्षेत्रों से आपको विशेष लाभ मिल सकता है।';

  @override
  String get tarotSuccessMeaning3 =>
      'करियर में, यह कार्ड वृद्धि और सफलता का प्रतीक है। आपकी रचनात्मक योजनाएं सफल होंगी और आपको अपने काम के लिए प्रशंसा मिलेगी। दूसरों का सहयोग करना और एक सकारात्मक कार्य वातावरण बनाना आपके लिए फायदेमंद होगा।';

  @override
  String get tarotSuccessDetail3 =>
      'आप अपने कार्यस्थल पर एक मार्गदर्शक या देखभाल करने वाले की भूमिका निभा सकते हैं। आपके विचार नए और प्रभावशाली होंगे, जिससे कंपनी को लाभ होगा। अपनी मेहनत का फल मिलने का समय आ गया है, इसका आनंद लें।';

  @override
  String get tarotKeywords4 => 'अधिकार, संरचना, नियंत्रण, पितृत्व, तर्क';

  @override
  String get tarotDesc4 =>
      'सम्राट कार्ड अनुशासन, अधिकार और संरचना का प्रतीक है। यह जीवन में व्यवस्था लाने और अपने लक्ष्यों को प्राप्त करने के लिए दृढ़ इच्छाशक्ति का उपयोग करने का समय है। यह कार्ड आपको नेतृत्व करने और जिम्मेदारी संभालने के लिए प्रोत्साहित करता है।';

  @override
  String get tarotLoveMeaning4 =>
      'प्यार में, यह एक स्थिर और गंभीर रिश्ते का संकेत देता है। आपका साथी बहुत सुरक्षात्मक और जिम्मेदार हो सकता है। यह समय रिश्ते में स्पष्ट नियम और सीमाएं तय करने का है ताकि भविष्य सुरक्षित रहे।';

  @override
  String get tarotLoveDetail4 =>
      'अपनी भावनाओं को तर्क के साथ संतुलित करें। रिश्ते में स्थिरता लाने के लिए आपकी प्रतिबद्धता महत्वपूर्ण होगी। सिंगल लोगों के लिए, आप किसी ऐसे व्यक्ति की ओर आकर्षित हो सकते हैं जो उम्र में बड़ा या बहुत सफल हो।';

  @override
  String get tarotWealthMeaning4 =>
      'आर्थिक रूप से, यह कार्ड वित्तीय स्थिरता और धन के अनुशासित प्रबंधन का संकेत देता है। अपनी संपत्ति को बढ़ाने के लिए एक ठोस योजना बनाएं और उसका पालन करें। यह भविष्य के लिए बचत करने और निवेश करने का एक अच्छा समय है।';

  @override
  String get tarotWealthDetail4 =>
      'व्यवस्थित संपत्ति प्रबंधन के साथ आप वित्तीय स्थिरता प्राप्त कर सकते हैं। बजट बनाना और फालतू खर्चों पर नियंत्रण रखना इस समय बहुत जरूरी है। कानूनी या सरकारी मामलों से जुड़े वित्तीय सौदों में आपको सफलता मिल सकती है।';

  @override
  String get tarotSuccessMeaning4 =>
      'करियर में, सम्राट सफलता और अधिकार का प्रतीक है। आप अपने कार्यस्थल पर एक नेतृत्वकारी भूमिका निभा सकते हैं या पदोन्नति प्राप्त कर सकते हैं। आपकी संगठनात्मक क्षमताएं और निर्णय लेने की शक्ति आपको दूसरों से आगे रखेगी।';

  @override
  String get tarotSuccessDetail4 =>
      'अपने लक्ष्यों के प्रति स्पष्ट रहें और अनुशासन के साथ काम करें। आपके वरिष्ठ अधिकारी आपकी मेहनत और नेतृत्व गुणों की सराहना करेंगे। एक ठोस नींव बनाने पर ध्यान दें जो आपको लंबे समय तक पेशेवर सफलता दिलाएगी।';

  @override
  String get tarotKeywords5 =>
      'परंपरा, अनुरूपता, नैतिकता, परामर्श, आध्यात्मिक विश्वास';

  @override
  String get tarotDesc5 =>
      'पदानुक्रमित कार्ड परंपराओं, नियमों और सामाजिक मूल्यों का प्रतीक है। यह सीखने, सलाह लेने और स्थापित मानदंडों का पालन करने का समय है। यह कार्ड आपको अपनी जड़ों से जुड़ने और आध्यात्मिक या नैतिक मार्गदर्शन प्राप्त करने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning5 =>
      'प्यार में, यह एक पारंपरिक और प्रतिबद्ध रिश्ते का संकेत देता है। विवाह या सगाई जैसी चर्चाएं हो सकती हैं। यह समय रिश्ते में एक-दूसरे के मूल्यों और परंपराओं का सम्मान करने का है।';

  @override
  String get tarotLoveDetail5 =>
      'अपने रिश्ते को सामाजिक और पारिवारिक मानदंडों के अनुसार आगे बढ़ाएं। बड़ों की सलाह आपके प्रेम जीवन में स्थिरता ला सकती है। यदि आप सिंगल हैं, तो आप किसी ऐसे व्यक्ति से मिल सकते हैं जिसके विचार बहुत पारंपरिक हों।';

  @override
  String get tarotWealthMeaning5 =>
      'आर्थिक रूप से, यह कार्ड स्थापित और सुरक्षित निवेश के तरीकों का पालन करने का सुझाव देता है। जोखिम भरे सौदों से बचें और अनुभवी लोगों से सलाह लें। यह धन के प्रबंधन में नैतिकता और ईमानदारी बनाए रखने का समय है।';

  @override
  String get tarotWealthDetail5 =>
      'वित्तीय स्थिरता के लिए पारंपरिक बचत योजनाओं और बैंकों पर भरोसा करें। किसी विश्वसनीय वित्तीय सलाहकार से परामर्श लेना आपके लिए फायदेमंद होगा। दान और पुण्य के कार्यों में थोड़ा धन लगाना आपके लिए मानसिक शांति लाएगा।';

  @override
  String get tarotSuccessMeaning5 =>
      'करियर में, यह कार्ड एक गुरु या शिक्षक से सीखने का संकेत देता है। स्थापित प्रक्रियाओं का पालन करना और टीम वर्क पर ध्यान देना आपको सफलता दिलाएगा। यह किसी संस्था या बड़े संगठन में काम करने के लिए अच्छा समय है।';

  @override
  String get tarotSuccessDetail5 =>
      'अपने कार्यस्थल के नियमों और संस्कृति का सम्मान करें। आपके पास जो ज्ञान है, उसे दूसरों के साथ साझा करें और दूसरों से सीखने के लिए तैयार रहें। आपकी ईमानदारी और वफादारी आपको पेशेवर रूप से सम्मानित बनाएगी।';

  @override
  String get tarotKeywords6 => 'प्रेम, सद्भाव, रिश्ते, साझा मूल्य, विकल्प';

  @override
  String get tarotDesc6 =>
      'प्रेमी कार्ड प्यार, आकर्षण और महत्वपूर्ण विकल्पों का प्रतीक है। यह न केवल रोमांटिक रिश्तों के बारे में है, बल्कि जीवन के बड़े निर्णयों में अपने मूल्यों के प्रति सच्चे रहने के बारे में भी है। यह कार्ड सद्भाव और संतुलन खोजने का संदेश देता है।';

  @override
  String get tarotLoveMeaning6 =>
      'प्यार में, यह एक गहरे और भावुक जुड़ाव का संकेत देता है। आप अपने साथी के साथ पूर्ण सामंजस्य महसूस करेंगे। सिंगल लोगों के लिए, एक बहुत ही आकर्षक और महत्वपूर्ण रिश्ता शुरू होने की संभावना है।';

  @override
  String get tarotLoveDetail6 =>
      'आपका दिल खुशी से भर जाएगा क्योंकि आप किसी ऐसे व्यक्ति के करीब आएंगे जो आपके मूल्यों को साझा करता है। यह समय महत्वपूर्ण निर्णय लेने का है, जो आपके भविष्य के प्रेम जीवन को प्रभावित करेगा। अपने दिल की सुनें और सही चुनाव करें।';

  @override
  String get tarotWealthMeaning6 =>
      'आर्थिक रूप से, यह कार्ड साझेदारी और सहयोग के माध्यम से लाभ का संकेत देता है। किसी भरोसेमंद व्यक्ति के साथ मिलकर काम करना आपके लिए फायदेमंद होगा। हालांकि, बड़े वित्तीय निर्णय लेते समय अपने मूल्यों के साथ समझौता न करें।';

  @override
  String get tarotWealthDetail6 =>
      'जब आप दूसरों के साथ सहयोग करते हैं तो आपका वित्तीय दृष्टिकोण बेहतर होता है। निवेश के मामले में आपके पास दो विकल्प हो सकते हैं, उनमें से वह चुनें जो आपके दीर्घकालिक लक्ष्यों के अनुकूल हो। संतुलन बनाए रखना ही वित्तीय सफलता की कुंजी है।';

  @override
  String get tarotSuccessMeaning6 =>
      'करियर में, यह कार्ड सफल सहयोग और टीम वर्क का प्रतीक है। आप अपने सहकर्मियों के साथ मिलकर बेहतरीन परिणाम प्राप्त करेंगे। यह उन विकल्पों को चुनने का समय है जो आपको न केवल सफलता दिलाएं बल्कि संतुष्टि भी दें।';

  @override
  String get tarotSuccessDetail6 =>
      'कार्यस्थल पर आपके संबंध सुधरेंगे और आपको दूसरों का समर्थन मिलेगा। यदि आपको करियर में कोई बड़ा बदलाव करना है, तो अपनी अंतरात्मा की आवाज सुनें। आपकी ईमानदारी और दूसरों के साथ जुड़ने की क्षमता आपको आगे ले जाएगी।';

  @override
  String get tarotKeywords7 =>
      'नियंत्रण, इच्छाशक्ति, सफलता, क्रिया, दृढ़ संकल्प';

  @override
  String get tarotDesc7 =>
      'रथ कार्ड दृढ़ संकल्प, इच्छाशक्ति और जीत का प्रतीक है। यह बाधाओं को पार करने और अपने लक्ष्यों की ओर तेजी से बढ़ने का समय है। यह कार्ड आपको अपने मन और भावनाओं पर नियंत्रण रखकर सफलता प्राप्त करने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning7 =>
      'प्यार में, यह कार्ड सक्रिय प्रयासों और सफलता का संकेत देता है। यदि आप किसी के प्रति अपनी भावनाएं व्यक्त करना चाहते हैं, तो अब सही समय है। रिश्तों में आने वाली समस्याओं को आप अपने साहस और समझदारी से सुलझा लेंगे।';

  @override
  String get tarotLoveDetail7 =>
      'अपने प्रेम जीवन की कमान अपने हाथों में लें। आपका आत्मविश्वास और स्पष्टता आपके साथी को प्रभावित करेगी। सिंगल लोगों के लिए, आप अपनी पसंद के व्यक्ति को पाने के लिए पूरी मेहनत करेंगे और सफल होंगे।';

  @override
  String get tarotWealthMeaning7 =>
      'आर्थिक रूप से, यह कार्ड वित्तीय लक्ष्यों को प्राप्त करने के लिए किए गए कड़े प्रयासों का फल मिलने का संकेत देता है। आप अपनी आर्थिक स्थिति को बेहतर बनाने के लिए बहुत प्रेरित महसूस करेंगे। यह निवेश और धन के प्रबंधन में सक्रिय रहने का समय है।';

  @override
  String get tarotWealthDetail7 =>
      'आपके वित्तीय प्रयास रंग लाएंगे और आप आर्थिक रूप से मजबूत होंगे। यदि कोई पुराना कर्ज या वित्तीय समस्या है, तो आप उसे सुलझाने में सक्षम होंगे। अपनी इच्छाशक्ति का उपयोग करें और फिजूलखर्ची पर नियंत्रण रखें।';

  @override
  String get tarotSuccessMeaning7 =>
      'करियर में, रथ बड़ी सफलता और लक्ष्यों की प्राप्ति का प्रतीक है। आप अपनी मेहनत और फोकस से कठिन से कठिन प्रोजेक्ट को पूरा कर लेंगे। पदोन्नति या किसी महत्वपूर्ण जिम्मेदारी मिलने की पूरी संभावना है।';

  @override
  String get tarotSuccessDetail7 =>
      'अपने करियर के प्रति समर्पित रहें और किसी भी बाधा को अपने रास्ते में न आने दें। आपकी नेतृत्व क्षमता और निर्णय लेने की शक्ति की सराहना की जाएगी। जीत आपकी है, बस अपनी दिशा और गति को नियंत्रित रखें।';

  @override
  String get tarotKeywords8 => 'शक्ति, साहस, अनुनय, प्रभाव, करुणा';

  @override
  String get tarotDesc8 =>
      'शक्ति कार्ड आंतरिक साहस, धैर्य और करुणा का प्रतीक है। यह शारीरिक बल के बजाय मानसिक और भावनात्मक शक्ति का उपयोग करने का समय है। यह कार्ड आपको अपनी आंतरिक शक्तियों पर भरोसा करने और चुनौतियों का शांति से सामना करने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning8 =>
      'प्यार में, यह कार्ड एक बहुत ही गहरे और सहनशील रिश्ते का संकेत देता है। आप अपने साथी की कमियों को प्यार और धैर्य से स्वीकार करेंगे। यह समय गुस्से या जिद के बजाय प्यार और समझदारी से समस्याओं को सुलझाने का है।';

  @override
  String get tarotLoveDetail8 =>
      'आपकी कोमलता और आंतरिक शक्ति आपके रिश्ते को और अधिक मजबूत बनाएगी। सिंगल लोगों के लिए, आप किसी ऐसे व्यक्ति की ओर आकर्षित हो सकते हैं जो स्वभाव से बहुत शांत लेकिन अंदर से बहुत मजबूत हो। सच्चा प्यार धैर्य की परीक्षा लेता है, उसमें सफल हों।';

  @override
  String get tarotWealthMeaning8 =>
      'आर्थिक रूप से, यह कार्ड वित्तीय मामलों में धैर्य और समझदारी बरतने का सुझाव देता है। अपनी संपत्ति को धीरे-धीरे और स्थिरता के साथ बढ़ाने पर ध्यान दें। यह फिजूलखर्ची पर नियंत्रण रखने और अपने वित्तीय लक्ष्यों के प्रति शांत रहने का समय है।';

  @override
  String get tarotWealthDetail8 =>
      'आपकी आर्थिक स्थिति में धीरे-धीरे सुधार होगा। किसी भी बड़े निवेश से पहले अच्छी तरह सोच-विचार करें और जल्दबाजी न करें। अपनी आंतरिक शक्ति का उपयोग करें और उन प्रलोभनों से बचें जो आपकी वित्तीय स्थिरता को नुकसान पहुंचा सकते हैं।';

  @override
  String get tarotSuccessMeaning8 =>
      'करियर में, यह कार्ड आपकी सहनशक्ति और दूसरों को प्रभावित करने की क्षमता का प्रतीक है। आप अपने शांत व्यवहार और बुद्धिमत्ता से कठिन परिस्थितियों को संभाल लेंगे। सहकर्मियों के साथ सहयोग करना और उन्हें प्रोत्साहित करना आपके लिए अच्छा रहेगा।';

  @override
  String get tarotSuccessDetail8 =>
      'कार्यस्थल पर आने वाली चुनौतियों का सामना बिना डरे करें। आपकी मेहनत और समर्पण को वरिष्ठों द्वारा पहचाना जाएगा। सफलता प्राप्त करने के लिए आपको किसी पर दबाव डालने की जरूरत नहीं है, आपका काम खुद बोलेगा।';

  @override
  String get tarotKeywords9 =>
      'आत्मनिरीक्षण, एकांत, आंतरिक मार्गदर्शन, सत्य की खोज';

  @override
  String get tarotDesc9 =>
      'सन्यासी कार्ड एकांत, चिंतन और सत्य की खोज का प्रतीक है। यह दुनिया के शोर से दूर होकर अपनी अंतरात्मा में झांकने का समय है। यह कार्ड आपको अपने जीवन के उद्देश्यों को समझने और आंतरिक शांति प्राप्त करने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning9 =>
      'प्यार में, यह कार्ड आत्म-चिंतन और अकेले रहने की इच्छा का संकेत दे सकता है। यदि आप किसी रिश्ते में हैं, तो आपको अपने साथी के साथ गहरी चर्चा करने और अपने व्यक्तिगत स्थान की आवश्यकता हो सकती है। सिंगल लोगों के लिए, यह प्यार खोजने के बजाय खुद को समझने का समय है।';

  @override
  String get tarotLoveDetail9 =>
      'अपने रिश्तों के बारे में गहराई से सोचें और समझें कि आप वास्तव में क्या चाहते हैं। कभी-कभी थोड़ा समय अकेले बिताना भविष्य के रिश्तों के लिए फायदेमंद होता है। अपनी भावनाओं के प्रति ईमानदार रहें और किसी भी दबाव में आकर निर्णय न लें।';

  @override
  String get tarotWealthMeaning9 =>
      'आर्थिक रूप से, यह कार्ड धन के मामलों में सावधानी और कम खर्च करने का संकेत देता है। यह निवेश के नए रास्ते तलाशने के बजाय अपनी वर्तमान वित्तीय स्थिति का विश्लेषण करने का समय है। भौतिक सुखों के बजाय अपनी मानसिक संतुष्टि पर ध्यान दें।';

  @override
  String get tarotWealthDetail9 =>
      'आपकी वित्तीय गतिविधियां थोड़ी कम हो सकती हैं, जो बचत के लिए अच्छा है। फिजूलखर्ची से बचें और भविष्य के लिए एक ठोस योजना बनाएं। धन के प्रति अपनी सोच बदलें और समझें कि शांति पैसों से नहीं, संतोष से आती है।';

  @override
  String get tarotSuccessMeaning9 =>
      'करियर में, यह कार्ड विशेषज्ञता और गहराई से काम करने का प्रतीक है। आप उन क्षेत्रों में सफल होंगे जहां शोध और गहन अध्ययन की आवश्यकता है। दूसरों की नकल करने के बजाय अपने ज्ञान और अनुभव को बढ़ाने पर ध्यान दें।';

  @override
  String get tarotSuccessDetail9 =>
      'आप अकेले काम करने वाले प्रोजेक्ट्स या शोध कार्यों में उत्कृष्ट परिणाम प्राप्त करेंगे। आपकी बुद्धिमत्ता और अनुभव आपको दूसरों के लिए एक मार्गदर्शक बना सकते हैं। जल्दबाजी में सफलता पाने के बजाय अपने काम की गुणवत्ता पर ध्यान दें।';

  @override
  String get tarotKeywords10 => 'सौभाग्य, कर्म, जीवन चक्र, भाग्य, मोड़';

  @override
  String get tarotDesc10 =>
      'भाग्य का पहिया कार्ड जीवन के निरंतर परिवर्तन और चक्र का प्रतीक है। यह समय है जब आपका भाग्य बदल रहा है और नए अवसर आपके दरवाजे पर दस्तक दे रहे हैं। यह कार्ड आपको बदलावों को स्वीकार करने और सकारात्मक रहने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning10 =>
      'प्यार में, यह एक भाग्यशाली मोड़ और अचानक होने वाली मुलाकातों का संकेत देता है। एक नया और महत्वपूर्ण रिश्ता आपके जीवन में आ सकता है। यदि आप पहले से ही किसी रिश्ते में हैं, तो उसमें सकारात्मक बदलाव आएंगे।';

  @override
  String get tarotLoveDetail10 =>
      'एक भाग्यशाली मुलाकात आपका इंतजार कर रही है। चीजें आपके पक्ष में मुड़ रही हैं, इसलिए अपने दिल के दरवाजे खुले रखें। पुराने विवाद सुलझ जाएंगे और प्यार का एक नया दौर शुरू होगा। ब्रह्मांड आपके प्रेम जीवन को संवार रहा है।';

  @override
  String get tarotWealthMeaning10 =>
      'आर्थिक रूप से, यह कार्ड धन की स्थिति में अचानक सुधार और लाभ का संकेत देता है। आपकी पिछली मेहनत का फल अब मिलने वाला है। हालांकि, धन का सम्मान करें क्योंकि पहिया हमेशा घूमता रहता है, बचत की आदत न छोड़ें।';

  @override
  String get tarotWealthDetail10 =>
      'आपका आर्थिक भाग्य चमक रहा है और आपको अप्रत्याशित लाभ मिल सकता है। निवेश के मामले में यह एक अच्छा समय है, लेकिन अपनी समझदारी का उपयोग करना न भूलें। समृद्धि आ रही है, उसे जिम्मेदारी से संभालें।';

  @override
  String get tarotSuccessMeaning10 =>
      'करियर में, यह कार्ड पदोन्नति, सफलता और एक बड़े बदलाव का प्रतीक है। आपके सामने ऐसे अवसर आएंगे जो आपके करियर को एक नई दिशा देंगे। जो काम रुके हुए थे, वे अब तेजी से पूरे होने लगेंगे।';

  @override
  String get tarotSuccessDetail10 =>
      'यह आपके जीवन का एक महत्वपूर्ण मोड़ है, इसलिए सतर्क रहें और हर अवसर का लाभ उठाएं। आपकी मेहनत और सकारात्मकता आपको पेशेवर ऊंचाइयों पर ले जाएगी। बदलाव से डरे नहीं, यह आपके विकास के लिए जरूरी है।';

  @override
  String get tarotKeywords11 =>
      'न्याय, निष्पक्षता, सत्य, कारण और प्रभाव, जिम्मेदारी';

  @override
  String get tarotDesc11 =>
      'न्याय कार्ड ईमानदारी, निष्पक्षता और संतुलन का प्रतीक है। यह आपके कार्यों के परिणामों का सामना करने और सत्य के साथ खड़े होने का समय है। यह कार्ड आपको न्यायपूर्ण निर्णय लेने और अपने जीवन में संतुलन बनाए रखने के लिए प्रेरित करता है।';

  @override
  String get tarotLoveMeaning11 =>
      'प्यार में, यह कार्ड स्पष्टता और ईमानदारी का संकेत देता है। आप और आपका साथी एक-दूसरे के प्रति बहुत पारदर्शी होंगे। यदि कोई विवाद चल रहा है, तो वह न्यायपूर्ण तरीके से सुलझ जाएगा। यह समय भावनाओं के साथ-साथ तर्क को भी महत्व देने का है।';

  @override
  String get tarotLoveDetail11 =>
      'एक ऐसा रिश्ता जहां भावनाएं और तर्क संतुलित हों। अपनी गलतियों को स्वीकार करें और अपने साथी के साथ निष्पक्ष रहें। सिंगल लोगों के लिए, आप किसी ऐसे व्यक्ति से मिल सकते हैं जो कानून या न्याय के क्षेत्र से जुड़ा हो।';

  @override
  String get tarotWealthMeaning11 =>
      'आर्थिक रूप से, यह कार्ड वित्तीय स्थिरता और धन के उचित वितरण का संकेत देता है। यदि आपका कोई कानूनी मामला या वित्तीय विवाद चल रहा है, तो उसका फैसला आपके पक्ष में आने की संभावना है। अपनी आय और व्यय में संतुलन बनाए रखें।';

  @override
  String get tarotWealthDetail11 =>
      'वित्तीय विवादों को सुलझाने या सही-गलत को स्पष्ट करने का यह अच्छा समय है। निवेश करते समय सभी दस्तावेजों को ध्यान से पढ़ें और नियमों का पालन करें। आपकी ईमानदारी आपको आर्थिक रूप से सुरक्षित और सम्मानित बनाएगी।';

  @override
  String get tarotSuccessMeaning11 =>
      'करियर में, यह कार्ड आपकी मेहनत के अनुसार उचित फल मिलने का प्रतीक है। आपको अपनी उपलब्धियों के लिए पहचाना जाएगा और आपके काम की निष्पक्ष समीक्षा होगी। यह अनुबंधों पर हस्ताक्षर करने या कानूनी मामलों को निपटाने के लिए एक अच्छा समय है।';

  @override
  String get tarotSuccessDetail11 =>
      'आपको अपने कार्य प्रदर्शन का निष्पक्ष और वस्तुनिष्ठ मूल्यांकन प्राप्त होगा। यदि आपने कड़ी मेहनत की है, तो पदोन्नति या बोनस जैसे वैध पुरस्कार मिलेंगे। निर्णय लेते समय भावनाओं को अलग रखें और केवल डेटा और तथ्यों के आधार पर निर्णय लें।';

  @override
  String get tarotKeywords12 => 'विराम, समर्पण, जाने देना, नए दृष्टिकोण';

  @override
  String get tarotDesc12 =>
      'लटका हुआ आदमी कार्ड ठहराव और जानबूझकर किए गए विराम का प्रतीक है। यह एक ऐसा चरण है जहां आपको चीजों को बिल्कुल नए दृष्टिकोण से देखने की जरूरत है। कभी-कभी आध्यात्मिक विकास के लिए पुरानी आदतों को छोड़ना आवश्यक होता है।';

  @override
  String get tarotLoveMeaning12 =>
      'प्यार में, यह कार्ड अनिश्चितता या प्रतीक्षा की अवधि का संकेत देता है। हो सकता है कि कोई रिश्ता रुक गया हो या भावनाएं वैसी न हों जैसी आप चाहते हैं। इस समय का उपयोग अपनी इच्छाओं और जरूरतों को स्पष्ट करने के लिए करें।';

  @override
  String get tarotLoveDetail12 =>
      'यह एक ऐसा समय है जब तर्कसंगत निर्णय लेना कठिन होता है क्योंकि आप भावनात्मक रूप से फंसे हुए महसूस कर सकते हैं। चीजों को जबरदस्ती करने की कोशिश न करें, बल्कि उन्हें स्वाभाविक रूप से विकसित होने दें। धैर्य आपको सही निर्णय की ओर ले जाएगा।';

  @override
  String get tarotWealthMeaning12 =>
      'आर्थिक रूप से, यह कार्ड सावधानी और प्रतीक्षा करने की सलाह देता है। जोखिम भरे निवेश या बड़े खर्चों के लिए यह अच्छा समय नहीं है। अपने वित्त की गहराई से जांच करें और छिपी हुई गलतियों को खोजने की कोशिश करें।';

  @override
  String get tarotWealthDetail12 =>
      'आपका वित्तीय प्रवाह अस्थायी रूप से रुक सकता है। इस विराम का उपयोग अपनी खर्च करने की आदतों पर पुनर्विचार करने और नई बचत रणनीतियां विकसित करने के लिए करें। दृष्टिकोण में बदलाव आपको भविष्य में अधिक स्थिर आय प्राप्त करने में मदद करेगा।';

  @override
  String get tarotSuccessMeaning12 =>
      'करियर में, इस कार्ड का अर्थ है कि प्रोजेक्ट्स अस्थायी रूप से रुक सकते हैं। यह तैयारी और सीखने का चरण है, न कि त्वरित कार्रवाई का। इस देरी को गुणवत्ता में सुधार के अवसर के रूप में स्वीकार करें।';

  @override
  String get tarotSuccessDetail12 =>
      'कभी-कभी बाद में अधिक मजबूती से आगे बढ़ने के लिए पीछे हटना आवश्यक होता है। वर्तमान शांति की अवधि का उपयोग प्रशिक्षण या रणनीतिक योजना के लिए करें। जब आप अपना नजरिया बदलेंगे, तो नए रास्ते खुलेंगे जो आपने पहले नहीं देखे थे।';

  @override
  String get tarotKeywords13 => 'अंत, परिवर्तन, रूपांतरण, संक्रमण';

  @override
  String get tarotDesc13 =>
      'मृत्यु कार्ड भौतिक अंत का नहीं, बल्कि एक गहरे रूपांतरण का प्रतीक है। जीवन का एक पुराना अध्याय समाप्त हो रहा है ताकि कुछ नया और बेहतर शुरू हो सके। इस बदलाव को अपने व्यक्तिगत विकास के एक आवश्यक हिस्से के रूप में स्वीकार करें।';

  @override
  String get tarotLoveMeaning13 =>
      'रिश्तों में, यह कार्ड एक चरण या पुरानी आदतों के अंत का प्रतीक है। इसका मतलब ब्रेकअप हो सकता है, लेकिन यह रिश्ते के भीतर एक गहरे नवीनीकरण का भी संकेत दे सकता है। नया तभी शुरू हो सकता है जब पुराना पीछे छूट जाए।';

  @override
  String get tarotLoveDetail13 =>
      'यह भावनात्मक उथल-पुथल का समय है जो दर्दनाक हो सकता है, लेकिन यह उपचार का वादा करता है। अतीत की उन चीजों को न पकड़ें जो अब आपके लिए अच्छी नहीं हैं। विश्वास रखें कि इस अंत के बाद एक उम्मीद भरी नई शुरुआत आपका इंतजार कर रही है।';

  @override
  String get tarotWealthMeaning13 =>
      'आर्थिक रूप से, यह कार्ड बड़े बदलावों का संकेत देता है, जैसे आय के स्रोत का नुकसान या किसी निवेश की विफलता। यह वित्तीय निर्भरता को समाप्त करने की चेतावनी है। अब आपकी बजट योजना में एक क्रांतिकारी नई शुरुआत की आवश्यकता है।';

  @override
  String get tarotWealthDetail13 =>
      'पुराने वित्तीय ढांचे टूट रहे हैं, जिससे नए और आधुनिक दृष्टिकोणों के लिए जगह बन रही है। उन प्रोजेक्ट्स को छोड़ने के लिए तैयार रहें जो अब लाभ नहीं दे रहे हैं। लंबे समय में, यह स्पष्ट बदलाव आपकी आर्थिक स्थिति को स्थिर करेगा।';

  @override
  String get tarotSuccessMeaning13 =>
      'करियर में, मृत्यु कार्ड एक बड़े प्रोजेक्ट के पूरा होने या नौकरी बदलने का संकेत देता है। मौजूदा संरचनाएं भंग हो सकती हैं, जो शुरू में परेशान करने वाली लग सकती हैं। इसे अपने करियर को बिल्कुल नई दिशा में ले जाने के अवसर के रूप में देखें।';

  @override
  String get tarotSuccessDetail13 =>
      'बदलाव का विरोध करने से केवल मुश्किलें ही बढ़ेंगी। सक्रिय रहें और उन कार्यों को अलविदा कहें जो अब आपको संतुष्ट नहीं करते हैं। एक नई पेशेवर पहचान आपके द्वारा खोजे जाने और आकार दिए जाने की प्रतीक्षा कर रही है।';

  @override
  String get tarotKeywords14 => 'संतुलन, संयम, धैर्य, उद्देश्य';

  @override
  String get tarotDesc14 =>
      'संयम कार्ड जीवन के सभी क्षेत्रों में सद्भाव और संतुलन खोजने का आह्वान करता है। यह अतिवाद से बचने और बीच का रास्ता चुनने के बारे में है। इस चरण में धैर्य और शांति आपके सबसे महत्वपूर्ण उपकरण हैं।';

  @override
  String get tarotLoveMeaning14 =>
      'प्यार में, यह कार्ड एक सामंजस्यपूर्ण और स्थिर संबंध का प्रतीक है। शांत बातचीत और आपसी समझ से विवादों को सुलझाया जा सकता है। यह एक साथ बढ़ने और भावनात्मक उपचार का समय है।';

  @override
  String get tarotLoveDetail14 =>
      'अपने रिश्ते को कोमलता के साथ निभाएं और भावनात्मक उथल-पुथल से बचें। संतुलित लेनदेन आपके और आपके साथी के बीच के बंधन को मजबूत करेगा। सिंगल लोगों को शांत और मैत्रीपूर्ण दृष्टिकोण के माध्यम से प्यार मिलने की संभावना है।';

  @override
  String get tarotWealthMeaning14 =>
      'आर्थिक रूप से, संयम का अर्थ है एक स्थिर और नियंत्रित धन प्रवाह। कोई बड़ी छलांग नहीं होगी, लेकिन कोई खतरनाक नुकसान भी नहीं होगा। अपने संसाधनों को बुद्धिमानी और संयम से प्रबंधित करने पर ध्यान दें।';

  @override
  String get tarotWealthDetail14 =>
      'यदि आप अनावश्यक खर्चों से बचते हैं, तो आपकी वित्तीय स्थिरता बनी रहेगी। दीर्घकालिक और कम जोखिम वाली बचत योजनाओं के लिए यह एक अच्छा समय है। धैर्य और निरंतर प्रबंधन के माध्यम से आपकी संपत्ति धीरे-धीरे और सुरक्षित रूप से बढ़ेगी।';

  @override
  String get tarotSuccessMeaning14 =>
      'करियर में, यह कार्ड सफल सहयोग और सुखद कार्य वातावरण का संकेत देता है। आपकी मध्यस्थता और समझौता करने की क्षमता की विशेष रूप से सराहना की जाएगी। जब तक आप गति को मध्यम रखेंगे, प्रोजेक्ट्स लगातार आगे बढ़ेंगे।';

  @override
  String get tarotSuccessDetail14 =>
      'सफलता निरंतरता और कूटनीति से आती है, न कि आक्रामकता से। अपनी कार्यक्षमता बनाए रखने के लिए कार्य-जीवन संतुलन पर ध्यान दें। आपका शांत व्यवहार सहकर्मियों और वरिष्ठों के लिए प्रेरणादायक होगा।';

  @override
  String get tarotKeywords15 => 'लत, भौतिकवाद, नियंत्रण की कमी, वैराग्य';

  @override
  String get tarotDesc15 =>
      'शैतान कार्ड निर्भरता, प्रलोभनों और आंतरिक स्वतंत्रता के नुकसान की चेतावनी देता है। अक्सर हम भौतिक चीजों या नकारात्मक सोच से बंधे होते हैं जो हमें बढ़ने से रोकती हैं। इन बेड़ियों को पहचानने और उनसे सचेत रूप से मुक्त होने का समय आ गया है।';

  @override
  String get tarotLoveMeaning15 =>
      'प्यार में, यह कार्ड एक गहन लेकिन अक्सर विषाक्त या विशुद्ध रूप से शारीरिक आकर्षण का संकेत देता है। जुनून और ईर्ष्या रिश्ते पर भारी पड़ सकते हैं। सवाल करें कि क्या आपका बंधन सच्चे प्यार पर आधारित है या केवल निर्भरता पर।';

  @override
  String get tarotLoveDetail15 =>
      'यह एक ऐसा समय है जब तीव्र जुनून के कारण तर्कसंगत निर्णय धुंधला हो सकता है। सावधान रहें कि आप अपने आप को ऐसे रिश्ते में न खो दें जो आपकी ऊर्जा छीन रहा हो। आपको सच्ची संतुष्टि तभी मिलेगी जब आप अपनी स्वतंत्रता वापस पा लेंगे।';

  @override
  String get tarotWealthMeaning15 =>
      'आर्थिक रूप से, शैतान लालच और जोखिम भरे प्रलोभनों की चेतावनी देता है जो कर्ज के जाल में फंसा सकते हैं। उन प्रस्तावों से सावधान रहें जो सच होने के लिए बहुत अच्छे लगते हैं। भौतिक संपत्ति आपका एकमात्र लक्ष्य नहीं होनी चाहिए।';

  @override
  String get tarotWealthDetail15 =>
      'धन या उपभोग की इच्छा का गुलाम बनने का खतरा है। अपने खर्चों की जांच करें और अनावश्यक ऋणों से बचें। केवल सचेत आत्म-नियंत्रण के माध्यम से ही आप अपनी वित्तीय स्वतंत्रता को बनाए रख सकते हैं या पुनः प्राप्त कर सकते हैं।';

  @override
  String get tarotSuccessMeaning15 =>
      'करियर में, शैतान कार्ड निर्दयी महत्वाकांक्षा का संकेत दे सकता है जो आपको नुकसान पहुंचा सकती है। शायद आप किसी नौकरी में फंसा हुआ या दबा हुआ महसूस कर रहे हैं। त्वरित सफलता के लिए अपने मूल्यों का बलिदान करने से बचें।';

  @override
  String get tarotSuccessDetail15 =>
      'किसी भी कीमत पर सफलता लंबे समय में असंतोष और संघर्ष का कारण बनेगी। कार्यस्थल पर चल रहे शक्ति के खेलों को पहचानें और उनसे खुद को दूर रखें। अपने काम को अपने व्यक्तिगत विश्वासों के साथ फिर से जोड़ने के तरीके खोजें।';

  @override
  String get tarotKeywords16 =>
      'अचानक परिवर्तन, उथल-पुथल, अराजकता, रहस्योद्घाटन';

  @override
  String get tarotDesc16 =>
      'टावर कार्ड अचानक और अक्सर चौंकाने वाली घटनाओं का प्रतीक है जो परिचित संरचनाओं को ढहा देती हैं। हालांकि यह शुरू में डरावना लग सकता है, लेकिन यह गलत नींव को नष्ट करने का काम करता है। केवल इसी तरह एक अधिक ईमानदार और स्थिर भविष्य के लिए जगह बनाई जा सकती है।';

  @override
  String get tarotLoveMeaning16 =>
      'रिश्तों में, टावर अचानक संघर्ष, आश्चर्यजनक खुलासे या ब्रेकअप का प्रतिनिधित्व कर सकता है। मुखौटे गिर जाते हैं और सच्चाई सामने आ जाती है, जो दर्दनाक हो सकती है। हालांकि, भावनाओं के बारे में स्पष्टता पाने के लिए यह एक आवश्यक शुद्धिकरण है।';

  @override
  String get tarotLoveDetail16 =>
      'एक अप्रत्याशित घटना आपके प्रेम जीवन को हिला सकती है और आपको पुनर्मूल्यांकन के लिए मजबूर कर सकती है। पुरानी चीजों को पकड़ने की कोशिश न करें यदि वे पहले ही टूट चुकी हैं। तूफान के बाद पता चलेगा कि कौन से बंधन नए सिरे से शुरू करने के लिए पर्याप्त मजबूत हैं।';

  @override
  String get tarotWealthMeaning16 =>
      'आर्थिक रूप से, यह कार्ड अचानक नुकसान या वित्तीय आपदाओं के प्रति अत्यधिक सावधानी बरतने की चेतावनी देता है। एक निवेश जो सुरक्षित लग रहा था, वह विफल हो सकता है या अप्रत्याशित खर्च आ सकते हैं। कठिन समय के लिए तैयार रहें और जो संभव हो उसे सुरक्षित करें।';

  @override
  String get tarotWealthDetail16 =>
      'वित्तीय संरचनाएं जो रेत पर बनी थीं, अब ढह सकती हैं। यह धन प्रबंधन में एक कठिन सबक है, लेकिन यह आपको अधिक बुद्धिमान बनाएगा। अपने वित्त को शुरू से और अधिक मजबूती से व्यवस्थित करने के लिए इस स्थिति का उपयोग करें।';

  @override
  String get tarotSuccessMeaning16 =>
      'करियर में, टावर अचानक बर्खास्तगी, कंपनी के दिवालिया होने या बड़े प्रोजेक्ट्स की विफलता का संकेत देता है। आपकी करियर योजना पूरी तरह से बदल सकती है। इस पतन को उन कार्यों से मुक्ति के रूप में देखें जो आपको वैसे भी सीमित कर रहे थे।';

  @override
  String get tarotSuccessDetail16 =>
      'जब सामान्य ढांचा टूट जाता है, तो विकास की पूरी तरह से नई संभावनाएं पैदा होती हैं। लचीले रहें और नई स्थिति के साथ जल्दी तालमेल बिठाने के लिए तैयार रहें। संकटों से मजबूत होकर निकलने की आपकी क्षमता की अब परीक्षा होगी।';

  @override
  String get tarotKeywords17 =>
      'आशा, विश्वास, उद्देश्य, नवीनीकरण, आध्यात्मिकता';

  @override
  String get tarotDesc17 =>
      'तारा आशा, प्रेरणा और दिव्य मार्गदर्शन का कार्ड है। एक कठिन समय के बाद, अब आपके जीवन में शांति और आत्मविश्वास वापस आ रहा है। अपने सपनों पर भरोसा रखें और विश्वास करें कि ब्रह्मांड आपको सही रास्ते पर ले जा रहा है।';

  @override
  String get tarotLoveMeaning17 =>
      'प्यार में, तारा उपचार और गहरे भावनात्मक जुड़ाव की अवधि का वादा करता है। मौजूदा रिश्ते नई सहजता और आपसी विश्वास का अनुभव करते हैं। सिंगल लोगों के लिए, यह कार्ड एक सोलमेट से मिलने का संकेत देता है।';

  @override
  String get tarotLoveDetail17 =>
      'आपका दिल प्यार के लिए फिर से खुल रहा है और आप सकारात्मक ऊर्जा बिखेर रहे हैं। भविष्य की योजनाएं बनाने और अपनी इच्छाएं व्यक्त करने का यह एक शानदार समय है। विश्वास रखें कि आपकी तड़प और इच्छाएं पूरी होंगी।';

  @override
  String get tarotWealthMeaning17 =>
      'आर्थिक रूप से, तारा आपकी स्थिति में धीमी लेकिन निरंतर सुधार का संकेत देता है। पिछली चिंताएं दूर हो रही हैं और आय के नए अवसर खुल रहे हैं। यह वित्तीय सुधार और आशावाद का समय है।';

  @override
  String get tarotWealthDetail17 =>
      'आपका वित्तीय दृष्टिकोण सकारात्मक दिशा में बढ़ने लगा है। पिछली आर्थिक कठिनाइयों को समझदारी भरे निर्णयों और थोड़े भाग्य से दूर किया जाएगा। धैर्य रखें, क्योंकि सफलता लंबे समय तक बनी रहेगी।';

  @override
  String get tarotSuccessMeaning17 =>
      'करियर में, तारा प्रेरणा, सफलता और आपकी प्रतिभा की पहचान का प्रतीक है। आपके प्रोजेक्ट्स सफल होंगे और आप पुरानी समस्याओं के नए समाधान खोज लेंगे। अपने अंतर्मन की आवाज सुनें, क्योंकि आपका रास्ता अब स्पष्ट है।';

  @override
  String get tarotSuccessDetail17 =>
      'आपके रचनात्मक विचारों को सुना जाएगा और वे उल्लेखनीय प्रगति की ओर ले जाएंगे। यह दीर्घकालिक योजना और नेटवर्क बनाने के लिए एक आदर्श समय है। आपका ईमानदार व्यवहार वरिष्ठों और व्यावसायिक भागीदारों को समान रूप से प्रभावित करेगा।';

  @override
  String get tarotKeywords18 => 'डर, चिंता, भ्रम, अवचेतन, अंतर्ज्ञान';

  @override
  String get tarotDesc18 =>
      'चाँद हमें सपनों, परछाइयों और अवचेतन की दुनिया में ले जाता है। सब कुछ वैसा नहीं है जैसा पहली नज़र में दिखता है, और अनिश्चितता डर पैदा कर सकती है। इस अंधेरे चरण में अपने तर्क के बजाय अपने गहरे अंतर्ज्ञान पर अधिक भरोसा करें।';

  @override
  String get tarotLoveMeaning18 =>
      'प्यार में, चाँद रहस्य, गलतफहमी या छिपी हुई इच्छाओं का संकेत देता है। शायद आप अपनी भावनाओं के बारे में अनिश्चित हैं या ऐसी चीजें हैं जो अभी तक नहीं कही गई हैं। धोखे से सावधान रहें और अपने अंतर्मन की सुनें।';

  @override
  String get tarotLoveDetail18 =>
      'यह भावनात्मक भ्रम का समय है जहां आप आसानी से भ्रम में खो सकते हैं। स्पष्ट बातचीत की तलाश करें, लेकिन महत्वपूर्ण निर्णयों में जल्दबाजी न करें। जब दिन का उजाला वापस आएगा, तभी आप स्थिति का बेहतर आकलन कर पाएंगे।';

  @override
  String get tarotWealthMeaning18 =>
      'आर्थिक रूप से, चाँद सावधानी बरतने की सलाह देता है क्योंकि जानकारी अधूरी या भ्रामक हो सकती है। अपारदर्शी सौदों या जोखिम भरी सट्टेबाजी के लिए यह अच्छा समय नहीं है। छिपी हुई लागतों पर ध्यान दें और हर प्रस्ताव की तीन बार जांच करें।';

  @override
  String get tarotWealthDetail18 =>
      ' आपकी वित्तीय स्थिति इस समय कोहरे में चलने जैसी महसूस हो सकती है। भावनाओं में बहकर आवेगपूर्ण खरीदारी या निवेश से बचें। केवल उन तथ्यों पर भरोसा करें जिन्हें आपने खुद जांचा है, और बाहरी दिखावे से गुमराह न हों।';

  @override
  String get tarotSuccessMeaning18 =>
      'करियर में, चाँद अनिश्चितता के चरण या पर्दे के पीछे होने वाले बदलावों का प्रतीक है। कार्यस्थल पर शायद साजिशें हो सकती हैं या आप अपने वर्तमान रास्ते पर संदेह कर रहे हैं। खतरों को जल्दी पहचानने के लिए अपने अंतर्ज्ञान का उपयोग करें।';

  @override
  String get tarotSuccessDetail18 =>
      'नहीं सभी सहकर्मी ईमानदारी से काम नहीं कर रहे हैं, इसलिए सतर्क रहें। यह रचनात्मक कार्य के लिए एक अच्छा समय है जो अवचेतन से आता है, लेकिन कठिन बातचीत के लिए कम अच्छा है। कोहरा छंटने तक प्रतीक्षा करें, फिर अगला बड़ा करियर कदम उठाएं।';

  @override
  String get tarotKeywords19 =>
      'सकारात्मकता, मज़ा, गर्मजोशी, सफलता, जीवन शक्ति';

  @override
  String get tarotDesc19 =>
      'सूरज सबसे खुशहाल कार्डों में से एक है और सफलता, जीवन का आनंद और जीवन शक्ति का वादा करता है। सब कुछ आपके सामने स्पष्ट है और आप ऊर्जा से भरे हुए हैं। इस जीत के क्षण का आनंद लें और अपनी खुशी दूसरों के साथ साझा करें।';

  @override
  String get tarotLoveMeaning19 =>
      'प्यार में, सूरज गर्मी, जुनून और गहरी संतुष्टि के समय का प्रतीक है। रिश्ते फलते-फूलते हैं और साझा गतिविधियां बहुत खुशी लाती हैं। यह सद्भाव का एक चरण है जिसमें सब कुछ बेहतर होता है।';

  @override
  String get tarotLoveDetail19 =>
      'आपका प्रेम जीवन आशावाद और आपसी प्रशंसा से भरा है। सूरज की रोशनी में छोटी-छोटी चिंताएं गायब हो जाती हैं और सच्ची गर्मजोशी के लिए जगह बनाती हैं। सिंगल लोगों के पास अब किसी ऐसे व्यक्ति से मिलने का सबसे अच्छा मौका है जो उनके जीवन को रोशन कर दे।';

  @override
  String get tarotWealthMeaning19 =>
      'आर्थिक रूप से, सूरज समृद्धि, लाभ और बहुत सकारात्मक विकास का संकेत देता है। आपके प्रयास अब रंग ला रहे हैं और आप वित्तीय सुरक्षा की उम्मीद कर सकते हैं। निवेश और नए प्रोजेक्ट्स के लिए यह एक शानदार समय है।';

  @override
  String get tarotWealthDetail19 =>
      'वित्त के लिए एक सुनहरा दिन आ गया है। आकर्षक अवसरों को पहचानने की आपकी समझ तेज हो गई है, जिससे काफी लाभ होगा। भविष्य के लिए अपनी वित्तीय नींव को और मजबूत करने के लिए इस सफल चरण का उपयोग करें।';

  @override
  String get tarotSuccessMeaning19 =>
      'करियर में, सूरज आपके काम की सफलता और शिखर का संकेत देता है। आपको पहचान, पदोन्नति मिलेगी या महत्वपूर्ण प्रोजेक्ट्स को सफलतापूर्वक पूरा करेंगे। आपका सकारात्मक व्यवहार आपको हर पेशेवर समूह का केंद्र बना देगा।';

  @override
  String get tarotSuccessDetail19 =>
      'सफलता अब आपको लगभग सहजता से मिल रही है क्योंकि आप उत्साह और स्पष्टता के साथ कार्य करते हैं। नई चुनौतियों का सामना करने या नेतृत्व की भूमिका संभालने के लिए यह आदर्श समय है। आपका आत्मविश्वास आपकी सबसे बड़ी संपत्ति है और आपको नई उपलब्धियों की ओर ले जाएगा।';

  @override
  String get tarotKeywords20 => 'निर्णय, पुनर्जन्म, आंतरिक पुकार, मुक्ति';

  @override
  String get tarotDesc20 =>
      'निर्णय कार्ड आत्म-जागरूकता, जवाबदेही और पुनर्जन्म के चरण का प्रतीक है। यह पिछले कार्यों का मूल्यांकन करने और आवश्यक निष्कर्ष निकालने का समय है। एक आंतरिक पुकार आपको अपना वास्तविक उद्देश्य खोजने और एक नया अध्याय शुरू करने के लिए कह रही है।';

  @override
  String get tarotLoveMeaning20 =>
      'प्यार में, यह कार्ड रिश्ते में स्पष्टता या महत्वपूर्ण निर्णय का संकेत देता है। शायद कोई पुराना साथी वापस आ सकता है या कोई पुराना घाव आखिरकार भर सकता है। यह क्षमा और ईमानदार नई शुरुआत का समय है।';

  @override
  String get tarotLoveDetail20 =>
      'अब आप स्पष्ट रूप से पहचानते हैं कि आपको वास्तव में एक साझेदारी में क्या चाहिए और क्या नहीं। प्यार के एक अधिक परिपक्व रूप के लिए जगह बनाने के लिए पुराने पैटर्न को छोड़ने के लिए तैयार रहें। यह रूपांतरण आपके प्रेम जीवन को एक उच्च स्तर पर ले जाएगा।';

  @override
  String get tarotWealthMeaning20 =>
      'आर्थिक रूप से, निर्णय का अर्थ है कि अब आप अपने पिछले निर्णयों का फल काट रहे हैं। यदि आपने मेहनत की है, तो इनाम या अप्रत्याशित भुगतान आपका इंतजार कर रहा है। यह वित्तीय लेखा-जोखा और पुनर्गठन का समय है।';

  @override
  String get tarotWealthDetail20 =>
      'अब आपको अपने पिछले प्रयासों के लिए उचित प्रतिफल मिल रहा है। शायद पुराने ऋणों को चुकाने या भूली हुई विरासत का दावा करने का अवसर मिले। भविष्य के लिए अपने वित्त को अधिक स्थायी रूप से योजना बनाने के लिए इस स्पष्टता का उपयोग करें।';

  @override
  String get tarotSuccessMeaning20 =>
      'करियर में, निर्णय कार्ड एक महत्वपूर्ण परीक्षा या आपके करियर के बारे में अंतिम निर्णय का संकेत देता है। आपकी क्षमता को पहचाना जाएगा और आपको एक ऐसा उद्देश्य मिल सकता है जो महज एक नौकरी से कहीं अधिक है। अपने रास्ते की जिम्मेदारी लेने के लिए तैयार रहें।';

  @override
  String get tarotSuccessDetail20 =>
      'पिछले प्रदर्शनों को अब सराहा जाएगा, जिससे करियर में बड़ी उछाल आ सकती है। यह सच्चाई का क्षण है जहां आप अपनी गलतियों का सामना करते हैं और उनसे सीखते हैं। आपके पेशेवर जीवन में एक नया, अधिक प्रामाणिक रास्ता अब आपके सामने खुल रहा है।';

  @override
  String get tarotKeywords21 => 'पूर्णता, एकीकरण, उपलब्धि, यात्रा';

  @override
  String get tarotDesc21 =>
      'दुनिया पूर्णता, सफलता और एक बड़े लक्ष्य की प्राप्ति का प्रतीक है। आपने एक लंबी यात्रा पूरी की है और अब सभी टुकड़े एक सामंजस्यपूर्ण पूर्णता में फिट हो रहे हैं। पूर्णता की भावना का आनंद लें और अपनी उल्लेखनीय सफलताओं का जश्न मरण करें।';

  @override
  String get tarotLoveMeaning21 =>
      'प्यार में, दुनिया एक पूर्ण रिश्ते का प्रतिनिधित्व करती है जिसने सभी चुनौतियों पर विजय प्राप्त की है। यह गहरे जुड़ाव और साझा खुशी की स्थिति है। सिंगल लोग किसी ऐसे व्यक्ति को पाएंगे जो उन्हें पूरी तरह से पूरक करता है और उनके जीवन को समृद्ध करता है।';

  @override
  String get tarotLoveDetail21 =>
      'आपने दिल के मामलों में अपना लक्ष्य पा लिया है और भावनात्मक रूप से सुरक्षित महसूस कर रहे हैं। यह सद्भाव का समय है जहां आप अपने साथी के साथ एक महसूस करते हैं। साझा यात्राएं या शादी जैसे बड़े जीवन कार्यक्रम एक भाग्यशाली नक्षत्र के तहत हैं।';

  @override
  String get tarotWealthMeaning21 =>
      'आर्थिक रूप से, दुनिया पूर्ण सफलता और वित्तीय स्वतंत्रता की प्राप्ति का प्रतीक है। अतीत के आपके बुद्धिमानी भरे निर्णय अब स्थायी स्थिरता की ओर ले जा रहे हैं। अब कोई अनसुलझी समस्या नहीं है और आपका धन सुरक्षित है।';

  @override
  String get tarotWealthDetail21 =>
      'आपने अपने वित्तीय लक्ष्य प्राप्त कर लिए हैं और अब अपनी कड़ी मेहनत के फल का आनंद ले सकते हैं। धन के साथ आपका व्यवहार बुद्धिमान और दूरदर्शी है, जो आपको चिंता मुक्त जीवन जीने की अनुमति देता है। यह समृद्धि को दूसरों के साथ साझा करने और जीवन का आनंद लेने का समय है।';

  @override
  String get tarotSuccessMeaning21 =>
      'करियर में, दुनिया एक करियर चरण के समापन या किसी प्रोजेक्ट की वैश्विक सफलता का संकेत देती है। आपने वह सब कुछ हासिल कर लिया है जो आपने ठाना था और आप बहुत सम्मानित हैं। आपके लिए नए क्षितिज खुल रहे हैं, शायद अंतरराष्ट्रीय स्तर पर भी।';

  @override
  String get tarotSuccessDetail21 =>
      'आपका पेशेवर रास्ता आपको अपने क्षेत्र में महारत हासिल करने की ओर ले गया है। आप जो कुछ भी करते हैं उसमें आप सक्षम और सम्मानित महसूस करते हैं। हालांकि यह चक्र अब पूरा हो गया है, आप अपने ज्ञान और अनुभव के साथ दुनिया को जीतने के लिए तैयार हैं।';

  @override
  String get supplementRecordPrompt =>
      'कृपया अपने सप्लीमेंट लें और इसे रिकॉर्ड करें!';

  @override
  String get snoozeQuestion => 'मुझे आपको दोबारा कब याद दिलाना चाहिए?';

  @override
  String get hoursShort => 'घंटे';

  @override
  String get minutesShort => 'मिनट';

  @override
  String get after => 'के बाद';

  @override
  String snoozeMessage(int minutes) {
    return 'अलार्म $minutes मिनट में फिर से बजेगा।';
  }

  @override
  String timesTaken(int count) {
    return '$count बार लिया गया';
  }

  @override
  String dailyGoalTimes(int goal) {
    return 'लक्ष्य: दिन में $goal बार';
  }

  @override
  String get didYouTakeSupplement => 'क्या आपने अपने सप्लीमेंट लिए?';

  @override
  String get viewMissionRecords => 'मिशन रिकॉर्ड देखें';

  @override
  String get setTakingGoal => 'सेवन लक्ष्य निर्धारित करें';

  @override
  String get times => 'बार';

  @override
  String get dailyTakingGoal => 'दैनिक सेवन लक्ष्य';

  @override
  String get howManyTimesADay => 'आप दिन में कितनी बार सप्लीमेंट लेते हैं?';

  @override
  String get setGoalMl => 'लक्ष्य निर्धारित करें (मिली)';

  @override
  String get sleepAnalysis => 'नींद विश्लेषण';

  @override
  String get todaysSleep => 'आज की नींद';

  @override
  String get sleepDuration => 'नींद की अवधि';

  @override
  String get wakeUpTime => 'जागने का समय';

  @override
  String get weeklySleepPattern => 'साप्ताहिक नींद पैटर्न';

  @override
  String get sleepAdvice =>
      'आप नींद की नियमित आदत बनाए हुए हैं। आप कल की तुलना में 30 मिनट पहले सो गए थे!';

  @override
  String get stopwatch => 'स्टॉपवॉच';

  @override
  String get lap => 'लैप';

  @override
  String get stop => 'रुकें';

  @override
  String lapLabel(int index) {
    return 'लैप $index';
  }

  @override
  String get monday => 'सोम';

  @override
  String get tuesday => 'मंगल';

  @override
  String get wednesday => 'बुध';

  @override
  String get thursday => 'गुरु';

  @override
  String get friday => 'शुक्र';

  @override
  String get saturday => 'शनि';

  @override
  String get sunday => 'रवि';

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
  String get defaultVibration => 'डिफ़ॉल्ट कंपन';

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
  String get missionLearnWords => '5 शब्द सीखना';

  @override
  String get missionVentilation => 'वेंटिलेशन';

  @override
  String get missionCleaning => 'कमरे की सफाई';

  @override
  String get missionGratitudeDiary => 'कृतज्ञता डायरी';

  @override
  String get faqQuestion1 => 'अलार्म नहीं बज रहे हैं।';

  @override
  String get faqAnswer1 =>
      'एंड्रॉइड सिस्टम की बैटरी ऑप्टिमाइज़ेशन सुविधा के कारण अलार्म में देरी हो सकती है या वे अवरुद्ध हो सकते हैं। कृपया सेटिंग्स > अलार्म ऑप्टिमाइज़ेशन मेनू में सभी अनुमतियों को \'अनुमति दें\' पर सेट करें।';

  @override
  String get faqQuestion2 => 'मैं मिशन बदलना चाहता हूं।';

  @override
  String get faqAnswer2 =>
      'आप अलार्म सूची में उस अलार्म पर टैप करके जिसे आप संपादित करना चाहते हैं, मिशन चयन मेनू में इसे अपनी पसंद के मिशन (गणित, फोटो, हिलाना, आदि) में बदल सकते हैं।';

  @override
  String get faqQuestion3 => 'मैं डार्क मोड कैसे सेट करूं?';

  @override
  String get faqAnswer3 =>
      'आप सेटिंग्स > सामान्य > डार्क मोड टॉगल के माध्यम से स्क्रीन थीम बदल सकते हैं।';

  @override
  String get faqQuestion4 => 'मैं फॉर्च्यून कुकीज़ कैसे एकत्र करूं?';

  @override
  String get faqAnswer4 =>
      'हर बार जब आप सुबह अलार्म बंद करते हैं या कोई मिशन पूरा करते हैं तो आप फॉर्च्यून कुकीज़ कमा सकते हैं। अपने द्वारा एकत्र की गई कुकीज़ के साथ अपने दैनिक भाग्य की जाँच करें!';

  @override
  String get faqQuestion5 => 'क्या ऐप हटाने पर मेरा डेटा गायब हो जाएगा?';

  @override
  String get faqAnswer5 =>
      'हां, फॉर्च्यून अलार्म डिवाइस के अंदर डेटा स्टोर करता है, इसलिए ऐप को हटाने से आपके सभी सेट किए गए अलार्म और मिशन रिकॉर्ड डिलीट हो जाएंगे। कृपया सावधान रहें।';

  @override
  String get noticeLabel => 'सूचना';

  @override
  String get notice1Title => 'फॉर्च्यून अलार्म आधिकारिक लॉन्च';

  @override
  String get notice1Content =>
      'नमस्ते। फॉर्च्यून अलार्म आधिकारिक तौर पर लॉन्च किया गया है।\n\nहर सुबह अपने अलार्म के साथ अपने दैनिक भाग्य की जाँच करें और एक खुशहाल दिन की शुरुआत करें!\nहम अधिक विविध सुविधाएँ और बेहतर सेवाएँ प्रदान करना जारी रखेंगे।\n\nधन्यवाद।';

  @override
  String get notice2Title => 'संस्करण 1.0.0 अपडेट समाचार';

  @override
  String get notice2Content =>
      'यहाँ संस्करण 1.0.0 अपडेट की सामग्री है।\n\n1. सप्लीमेंट मिशन UI सुधार\n2. सटीक अलार्म के लिए सिस्टम सेटिंग एकीकरण\n3. डार्क मोड समर्थन\n4. बग फिक्स और स्थिरता में सुधार\n\nअब नवीनतम संस्करण का अनुभव करें!';

  @override
  String get notice3Title => 'सेवा की शर्तें संशोधन सूचना';

  @override
  String get notice3Content =>
      'सेवा की शर्तों को संशोधित किया गया है।\n\nप्रमुख संशोधन:\n- गोपनीयता नीति को मजबूत किया गया\n- सेवा उपयोग का दायरा निर्दिष्ट किया गया\n\nविवरण सेटिंग्स > शर्तें पृष्ठ पर पाए जा सकते हैं।';

  @override
  String get notice4Title => 'संस्करण 1.1.1 अपडेट समाचार';

  @override
  String get notice4Content =>
      'संस्करण 1.1.1 अपडेट की सामग्री यहाँ है:\n\n1. बेहतर बैटरी अनुकूलन गाइड UI\n2. अंग्रेजी संस्करण के लिए बेहतर टेक्स्ट लेआउट\n3. विज्ञापन प्रणाली की स्थिरता में सुधार\n4. ऐप स्थिरता और प्रदर्शन में सुधार\n\nबेहतर अनुभव के लिए कृपया अभी अपडेट करें!';

  @override
  String get supportContentTitle => 'पूछताछ सामग्री';

  @override
  String get supportHint => 'कृपया सामग्री दर्ज करें।';

  @override
  String get supportRecipient => 'प्राप्तकर्ता (ग्राहक सहायता)';

  @override
  String get emailCopied => 'ईमेल पता कॉपी किया गया।';

  @override
  String get copyTooltip => 'कॉपी';

  @override
  String get supportWorkingDays =>
      'हम सप्ताह के दिनों में 24 घंटे के भीतर जवाब देने की कोशिश करेंगे।';

  @override
  String get supportEmptyError => 'कृपया सामग्री दर्ज करें।';

  @override
  String get supportSubjectPrefix => 'पूछताछ शीर्षक';

  @override
  String get supportContentPrefix => 'पूछताछ सामग्री';

  @override
  String get supportCopySuccessTitle => 'पूछताछ कॉपी की गई';

  @override
  String supportCopySuccessMessage(String email) {
    return 'पूछताछ सामग्री क्लिपबोर्ड पर कॉपी कर दी गई है।\nक्या आप $email पर ईमेल भेजना चाहेंगे?';
  }

  @override
  String get selectionComplete => 'चयन पूरा हुआ';

  @override
  String get selectVibration => 'कंपन पैटर्न चुनें';

  @override
  String get cameraMissionSequentialImageError =>
      'कृपया मिशन इमेज को क्रम से सेट करें।';

  @override
  String get copyEmailAction => 'ईमेल पता कॉपी करें';

  @override
  String get addMissionTitle => 'नया मिशन जोड़ें';

  @override
  String get recommendedMissionList => 'अनुशंसित मिशन';

  @override
  String get recommendedMissionDesc => 'एक स्वस्थ दिन के लिए अनुशंसित मिशन।';

  @override
  String get all => 'सभी';

  @override
  String get allMissions => 'सभी मिशन';

  @override
  String categoryMissions(String category) {
    return '$category मिशन';
  }

  @override
  String get deselectAll => 'सभी का चयन हटाएँ';

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String get myCustomMissions => 'मेरे कस्टम मिशन';

  @override
  String get myCustomMissionsDesc => 'आपके द्वारा पहले बनाए गए मिशन जोड़ें।';

  @override
  String get createYourOwnMission => 'अपना स्वयं का मिशन बनाएं';

  @override
  String get createYourOwnMissionDesc =>
      'यदि आपको अपनी पसंद का मिशन नहीं मिलता है, तो खुद बनाएं।';

  @override
  String get missionNameHint => 'मिशन का नाम दर्ज करें (जैसे: जिम जाना)';

  @override
  String get selectCategory => 'श्रेणी चुनें';

  @override
  String get getNotification => 'सूचना प्राप्त करें';

  @override
  String get missionCategoryHealth => 'स्वास्थ्य';

  @override
  String get missionCategoryStudy => 'अध्ययन';

  @override
  String get missionCategoryRoutine => 'दिनचर्या';

  @override
  String get missionCategoryHobby => 'शौक';

  @override
  String get missionCategoryOther => 'अन्य';

  @override
  String get copyEmailSuccessMessage =>
      'ईमेल पता कॉपी हो गया है। कृपया इसे अपने ईमेल ऐप में पेस्ट करें।';

  @override
  String get supportSubmitButton => 'पूछताछ कॉपी करें और भेजें';

  @override
  String get shakePhone => 'कृपया अपना फोन हिलाएं!';

  @override
  String version(String version) {
    return 'संस्करण $version';
  }

  @override
  String get fortuneCheckButton => 'भाग्य देखें';

  @override
  String get fortuneSelectCards => '3 कार्ड चुनें';

  @override
  String get fortuneDragCards => 'ड्रैग करके 3 कार्ड चुनें';

  @override
  String get fortuneDetailTitle => 'विस्तृत व्याख्या';

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
      'मौसम डेटा विश्वसनीय सेवाओं द्वारा प्रदान किया गया';

  @override
  String get locationPermissionTitle => 'स्थान अनुमति दें';

  @override
  String get locationPermissionDesc =>
      'मौसम की जानकारी प्रदर्शित करने के लिए आवश्यक है।';

  @override
  String get hourlyForecast => 'प्रति घंटा 00पूर्वानुमान';

  @override
  String get weeklyForecast => 'साप्ताहिक पूर्वानुमान';

  @override
  String hourFormat(String hour) {
    return '$hourबजे';
  }

  @override
  String get noNotifications => 'कोई नई सूचना नहीं है।';

  @override
  String get adLoadFailed => 'विज्ञापन लोड करने में विफल';

  @override
  String get adLoading => 'विज्ञापन लोड हो रहा है...';

  @override
  String get removeAds => 'विज्ञापन हटाएँ';

  @override
  String get close => 'बंद करें';

  @override
  String get exitQuestion => 'क्या आप बाहर निकलना चाहते हैं?';

  @override
  String get exitApp => 'बाहर निकलें';

  @override
  String get shareResultDescription =>
      'यह फॉर्च्यून अलार्म द्वारा विश्लेषण किया गया आपका भाग्य परिणाम है।';

  @override
  String get shareResultButton => 'परिणाम साझा करें';

  @override
  String get unknownTime => 'अज्ञात समय';

  @override
  String get adLoadError =>
      'विज्ञापन लोड नहीं हो सका। कृपया थोड़ी देर बाद पुनः प्रयास करें।';

  @override
  String get adShowError =>
      'विज्ञापन प्रदर्शित नहीं हो सका। कृपया थोड़ी देर बाद पुनः प्रयास करें।';

  @override
  String earnCookies(int count) {
    return 'आपने $count भाग्य कुकीज़ (Fortune Cookies) जीती हैं! 🎉';
  }

  @override
  String get freePassAfterTimeout =>
      'विज्ञापन के बिना मुफ्त परिणाम दिखाए जा रहे हैं! 🎉';

  @override
  String get adLoadDelay =>
      'लोडिंग में देरी हो रही है। कृपया थोड़ी देर बाद पुनः प्रयास करें।';

  @override
  String get fortuneAccessTitle => 'भाग्य की जाँच करें';

  @override
  String get fortuneAccessSubtitle =>
      'अपने भाग्य के परिणाम देखें\nऔर छिपे हुए उपहार प्राप्त करें!';

  @override
  String get watchAdButtonText => 'मुफ्त परिणाम के लिए विज्ञापन देखें';

  @override
  String useCookiesButtonText(int count) {
    return '$count भाग्य कुकीज़ का उपयोग करें';
  }

  @override
  String get adFailFreePass =>
      'विज्ञापन लोड नहीं हो सका, इसलिए इस बार हम आपको मुफ्त में देखने देंगे।';

  @override
  String get luckyNumberTitle => 'मेरे भाग्यशाली अंक';

  @override
  String get luckyNumberSubtitle =>
      'AI द्वारा जनरेट किए गए आपके आज के भाग्यशाली अंक';

  @override
  String get luckyNumberGenerateButton => 'भाग्यशाली अंक जनरेट करें';

  @override
  String get luckyNumberGuideText =>
      'फॉर्च्यून अलार्म के AI एल्गोरिदम के माध्यम से\nअपने स्वयं के भाग्यशाली अंक खोजें';

  @override
  String get luckyNumberAnalysisStep1 => 'भाग्य डेटा एकत्र किया जा रहा है...';

  @override
  String get luckyNumberAnalysisStep2 =>
      'हाल के अंकों के पैटर्न का विश्लेषण किया जा रहा है...';

  @override
  String get luckyNumberAnalysisStep3 =>
      'प्रत्येक अंक की ऊर्जा का मूल्यांकन किया जा रहा है...';

  @override
  String get luckyNumberAnalysisStep4 =>
      'ज्यामितीय अनुक्रमों का अध्ययन किया जा रहा है...';

  @override
  String get luckyNumberAnalysisStep5 =>
      'AI भविष्यवाणी मॉडल लागू किया जा रहा है...';

  @override
  String get luckyNumberAnalysisStep6 =>
      'इष्टतम संयोजनों की गणना की जा रही है...';

  @override
  String get luckyNumberAnalysisStep7 =>
      'विश्लेषण पूर्ण! अंक जनरेट किए जा रहे हैं...';

  @override
  String get luckyNumberAnalysisFinal => 'अंतिम डेटा संसाधित किया जा रहा है...';

  @override
  String get luckyNumberAnalyzing => 'ऊर्जा का विश्लेषण...';

  @override
  String get luckyNumberGeometric => 'ज्यामितीय विश्लेषण...';

  @override
  String get luckyNumberPatterns => 'पैटर्न मिलान...';

  @override
  String get luckyNumberEnergy => 'ऊर्जा सामंजस्य...';

  @override
  String get luckyNumberCompleted => 'विश्लेषण पूरा हुआ!';

  @override
  String get luckyNumberShare => 'परिणाम साझा करें';

  @override
  String get luckyNumberRestart => 'पुनः प्रयास करें';

  @override
  String get luckyNumberGenerating => 'भाग्यशाली अंक जनरेट किए जा रहे हैं...';

  @override
  String get luckyNumberResultTitle => 'भाग्यशाली अंक जनरेशन पूर्ण';

  @override
  String get luckyNumberResultSubtitle => '6 मुख्य अंक + बोनस अंक';

  @override
  String get luckyNumberDisclaimer =>
      '* यह सेवा केवल मनोरंजन के लिए है। प्रदान किए गए अंक AI एल्गोरिदम द्वारा जनरेट किए गए हैं और जीत की गारंटी नहीं देते हैं।';

  @override
  String get luckyNumberShareTitle => 'आज के भाग्यशाली नंबर';

  @override
  String get luckyNumberShareDescription =>
      'फॉर्च्यून अलार्म द्वारा विश्लेषण किए गए भाग्यशाली नंबर।';

  @override
  String luckyNumberSetLabel(String label) {
    return 'सेट $label';
  }

  @override
  String get luckyNumberRegenerateButton => 'नंबर फिर से जनरेट करें';

  @override
  String get luckyNumberFeatureAiTitle => 'AI सिफारिश';

  @override
  String get luckyNumberFeatureAiDesc => 'स्मार्ट एल्गोरिदम';

  @override
  String get luckyNumberFeatureSmartTitle => 'स्मार्ट';

  @override
  String get luckyNumberFeatureSmartDesc => 'भाग्यशाली नंबर सिफारिश';

  @override
  String get luckyNumberFeatureDataTitle => 'डेटा विश्लेषण';

  @override
  String get luckyNumberFeatureDataDesc => 'इष्टतम संयोजन';

  @override
  String get fortunePassTitle => 'फॉर्च्यून पास';

  @override
  String get fortunePassTabFree => 'मुफ्त चार्ज';

  @override
  String get fortunePassTabPremium => 'प्रीमियम पास';

  @override
  String get fortunePassFreeChargeTitle => 'मुफ्त में कुकीज़ चार्ज करें';

  @override
  String get fortunePassFreeChargeButton =>
      'विज्ञापन देखें और 1 कुकी प्राप्त करें';

  @override
  String get fortunePassActivePlan => 'वर्तमान योजना';

  @override
  String get fortunePassNoSubscription => 'कोई सक्रिय सदस्यता नहीं';

  @override
  String get fortunePassRestore => 'पुनर्स्थापित करें';

  @override
  String get fortunePassMonth1Title => '1 महीने का पास';

  @override
  String get fortunePassMonth1Desc => '1 महीने के लिए सभी सुविधाएं अनलॉक करें';

  @override
  String get fortunePassMonth6Title => '6 महीने का पास';

  @override
  String get fortunePassMonth6Desc => 'रियायती 6 महीने की सदस्यता';

  @override
  String get fortunePassYear1Title => '1 साल का पास';

  @override
  String get fortunePassYear1Desc => 'पूरे वर्ष के लिए सर्वोत्तम मूल्य';

  @override
  String get fortunePassBestPlan => 'सबसे लोकप्रिय योजना';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '$percent% फ्लैश सेल!';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% छूट';
  }

  @override
  String get fortunePassPerMonth => ' /महीना';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return 'कुल $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => 'महीना';

  @override
  String get fortunePassUnit6Months => '6 महीने';

  @override
  String get fortunePassUnitYear => 'वर्ष';

  @override
  String get fortunePassMyCookies => 'मेरी कुकीज़';

  @override
  String get fortunePassCurrentStatus => 'पास स्थिति';

  @override
  String get fortunePassStatusPremium => 'प्रीमियम पास सक्रिय';

  @override
  String get fortunePassStatusFree => 'मानक उपयोगकर्ता';

  @override
  String get fortunePassStoreErrorTitle => 'सदस्यता उपलब्ध नहीं है';

  @override
  String get fortunePassStoreErrorContent =>
      'अभी स्टोर से उत्पाद की जानकारी प्राप्त करने में असमर्थ।';

  @override
  String fortunePassSubscribeSale(int percent) {
    return '$percent% छूट के साथ सदस्यता लें';
  }

  @override
  String get fortunePassSubscribeNow => 'अभी सदस्यता लें';

  @override
  String get fortunePassApplied => 'फॉर्च्यून पास सदस्यता लागू की गई।';

  @override
  String get fortunePassApplyFailed => 'सदस्यता लागू करने में विफल।';

  @override
  String get fortunePassRestored => 'खरीद इतिहास पुनर्स्थापित किया गया।';

  @override
  String get fortunePassRestoreFailed =>
      'खरीद इतिहास पुनर्स्थापित करने में विफल।';

  @override
  String get fortunePassTimeSaleTitle => 'रुको! एक उपहार आया है 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return 'मूल मूल्य $price/वर्ष';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '$price/वर्ष';
  }

  @override
  String get fortunePassTimeSaleBadge =>
      'यदि आप 3 मिनट के भीतर सदस्यता लेते हैं तो 50% की छूट!';

  @override
  String get fortunePassTimeSaleButton => 'छूट प्राप्त करें और प्रो शुरू करें';

  @override
  String get fortunePassTimeSaleCancel => 'शायद बाद में';

  @override
  String get fortunePassTimeSaleStartMessage =>
      '3 मिनट की छूट शुरू हो गई है! ऊपर बैनर देखें।';

  @override
  String get fortunePassSubscribeButton => 'अभी सदस्यता लें';

  @override
  String get fortunePassSubscribeDiscountButton => '50% छूट के साथ सदस्यता लें';

  @override
  String get fortunePassCookieBalance => 'आपकी फॉर्च्यून कुकीज़';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'पास सक्रिय है';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return 'कुल ₩$price / $unit';
  }

  @override
  String get fortunePassPopularPlan => 'लोकप्रिय योजना';

  @override
  String get fortunePassPricePerMonth => ' /माह';

  @override
  String get fortunePassPaymentFailed => 'भुगतान अनुरोध विफल रहा।';

  @override
  String get fortunePassSubscriptionFailed =>
      'सदस्यता लेने में विफल। कृपया अपना नेटवर्क जांचें।';

  @override
  String get fortunePassSubscriptionSuccess =>
      'फॉर्च्यून पास सदस्यता सफलतापूर्वक लागू हो गई है।';

  @override
  String get fortunePassCannotSubscribeTitle => 'सदस्यता उपलब्ध नहीं है';

  @override
  String get fortunePassCannotSubscribeMessage =>
      'इस समय स्टोर से उत्पाद जानकारी प्राप्त करने में असमर्थ।\n\n[चेक लिस्ट]\n1. गूगल प्ले / ऐप स्टोर लॉगिन स्थिति\n2. इंटरनेट कनेक्शन\n3. टेस्ट डिवाइस पंजीकरण स्थिति';

  @override
  String get year => 'वर्ष';

  @override
  String get month => 'महीना';

  @override
  String get day => 'दिन';

  @override
  String get sajuProfileTitle => 'मुख्य प्रोफ़ाइल संपादित करें';

  @override
  String get sajuNameLabel => 'नाम';

  @override
  String get sajuNameHint => 'कृपया अपना नाम दर्ज करें';

  @override
  String get sajuNameHelper => 'अधिकतम 6 अक्षर';

  @override
  String get sajuGenderLabel => 'लिंग';

  @override
  String get sajuGenderMale => 'पुरुष';

  @override
  String get sajuGenderFemale => 'महिला';

  @override
  String get sajuBirthDateLabel => 'जन्म तिथि';

  @override
  String get sajuBirthTimeLabel => 'जन्म समय';

  @override
  String get sajuUnknownTime => 'अज्ञात समय';

  @override
  String get sajuEditComplete => 'संपादन पूरा हुआ';

  @override
  String get sajuSolar => 'सौर (Solar)';

  @override
  String get sajuLunar => 'चंद्र (Lunar)';

  @override
  String get sajuSelectBirthDate => 'जन्म तिथि चुनें';

  @override
  String get sajuSelectBirthTime => 'जन्म समय चुनें';

  @override
  String get compatibilityTitle => 'अनुकूलता की जाँच करें';

  @override
  String get compatibilityInputHeader => 'कृपया दोनों की जानकारी दर्ज करें';

  @override
  String get compatibilityInputSubtitle =>
      'हम साजू (Saju) जानकारी के आधार पर सटीक अनुकूलता का विश्लेषण करेंगे।';

  @override
  String get compatibilityMyInfo => 'मेरी जानकारी';

  @override
  String get compatibilityInputMyNameGuide => 'कृपया अपना नाम दर्ज करें।';

  @override
  String get compatibilityInputPartnerNameGuide =>
      'कृपया साथी का नाम दर्ज करें।';

  @override
  String get compatibilityPartnerInfo => 'साथी की जानकारी';

  @override
  String get compatibilityLoadSaved => 'सहेजी गई जानकारी लोड करें';

  @override
  String get compatibilityTitleBest => 'स्वर्ग में बनी जोड़ी! ❤️';

  @override
  String get compatibilityDescBest =>
      'सबसे अच्छी अनुकूलता जिसकी आप मांग कर सकते हैं। एक-दूसरे को जाने न दें!';

  @override
  String get compatibilityDescBest_Youth =>
      'आप दोनों एक ताज़ा और भावुक प्रेम के लिए सबसे अच्छे साथी हैं। एक-दूसरे के सपनों का समर्थन करते हुए और साथ में बढ़ते हुए देखना बहुत खूबसूरत है! आप एक ऐसा रिश्ता हैं जो पढ़ाई या करियर की चिंताओं को साझा करके एक-दूसरे को सकारात्मक प्रोत्साहन प्रदान करता है। यदि आप एक-दूसरे को वैसे ही संजोते और परवाह करते हैं जैसे आप अभी करते हैं, तो आप स्वर्ग में बनी एक ऐसी जोड़ी हैं जो किसी भी परीक्षा को एक साथ पार कर सकती है।';

  @override
  String get compatibilityDescBest_Mature =>
      'आप आदर्श साथी हैं जो एक-दूसरे को स्थिरता और शक्ति प्रदान करते हैं। यह एक परिपक्व रिश्ता है जहाँ आप एक-दूसरे के मूल्यों पर भरोसा करते हैं और साथ में भविष्य का निर्माण करते हैं। आप एक-दूसरे के जीवन लक्ष्यों को गहराई से समझते हैं और एक-दूसरे के लिए सबसे बड़े समर्थक हैं। आपसी विश्वास को आधार बनाकर, आप एक खुशहाल और समृद्ध जीवन साथ बिता सकते हैं।';

  @override
  String get compatibilityDescBest_Senior =>
      'आप अद्भुत साथी हैं जो जीवन के अंतिम पड़ाव को गर्मजोशी के साथ बिता रहे हैं। यह एक गहरा रिश्ता है जहाँ आप एक-दूसरे के ज्ञान का सम्मान करते हैं और एक-दूसरे को भावनात्मक सहारा देते हैं। आप ऐसे साथी हैं जो दैनिक जीवन की छोटी-छोटी खुशियाँ साझा करते हैं और एक-दूसरे के स्वास्थ्य की देखभाल कर सकते हैं। आप एक अनमोल बंधन हैं जो साझा यादों से भरा एक शांतिपूर्ण और सुखद जीवन जी रहे हैं।';

  @override
  String get compatibilityTitleGreat => 'एक बहुत अच्छा रिश्ता 💕';

  @override
  String get compatibilityDescGreat =>
      'एक बेहतरीन साथी जो एक-दूसरे के लिए बहुत बड़ा सहारा है।';

  @override
  String get compatibilityDescGreat_Youth =>
      'यह ऊर्जा और उत्साह से भरा रिश्ता है। आपकी रुचियां और मूल्य समान हैं, इसलिए आप साथ में बहुत समय का आनंद ले सकते हैं। आप एक ऐसी जोड़ी हैं जो एक-दूसरे को प्रेरित करके साथ में बढ़ती है। यदि आप समझदारी के साथ छोटे-छोटे मतभेदों को दूर करते हैं, तो आप और भी गहरा प्रेम विकसित कर सकते हैं।';

  @override
  String get compatibilityDescGreat_Mature =>
      'आप जीवनशैली और मूल्यों में बहुत उच्च तालमेल वाली जोड़ी हैं। आप एक-दूसरे के काम और सामाजिक स्थान का सम्मान करते हैं और साथ ही मजबूत भावनात्मक सहारा प्रदान करते हैं। यह एक स्थिर रिश्ता है जो समस्याओं को मिलकर सुलझाता है और एक ठोस भविष्य की योजना बनाता है। यदि आप संवाद बनाए रखते हैं, तो आपका रिश्ता ऐसा होगा जिससे दूसरे ईर्ष्या करेंगे।';

  @override
  String get compatibilityDescGreat_Senior =>
      'आप ऐसे साथी हैं जो जीवन में एक-दूसरे को आराम और शांति प्रदान करते हैं। आप एक-दूसरे के शौक साझा करते हैं और साथ में फुर्सत के समय का आनंद लेते हैं। यह एक ऐसा रिश्ता है जहाँ आप एक-दूसरे के जीवन के अनुभवों को महत्व देते हैं और एक-दूसरे का समर्थन करते हैं। यदि आप एक-दूसरे का ख्याल रखते हैं और स्वास्थ्य पर ध्यान देते हैं, तो आपका बुढ़ापा बहुत स्थिर और खुशहाल होगा।';

  @override
  String get compatibilityTitleGood => 'एक अच्छी तरह मेल खाने वाली जोड़ी 😊';

  @override
  String get compatibilityDescGood =>
      'कुछ मतभेद हैं, लेकिन एक-दूसरे के साथ तालमेल बिठाते हुए आपका प्रेम सुंदर हो सकता है।';

  @override
  String get compatibilityDescGood_Youth =>
      'आप एक ऐसी जोड़ी हैं जो आपसी तालमेल के माध्यम से एक सुंदर प्रेम का निर्माण करती है। हालांकि व्यक्तित्व में अंतर हो सकते हैं, लेकिन यदि आप एक-दूसरे को समझने का प्रयास करते हैं तो आपका रिश्ता अच्छा हो सकता है। एक-दूसरे की व्यक्तित्व का सम्मान करना और ईमानदार बातचीत के माध्यम से समानताएं खोजना महत्वपूर्ण है।';

  @override
  String get compatibilityDescGood_Mature =>
      'आप एक ऐसा रिश्ता हैं जो आपसी विचारशीलता और प्रयास के माध्यम से स्थिर रहता है। ऐसी स्थितियाँ हो सकती हैं जहाँ आप व्यावहारिक समस्याओं या जीवन के निर्णयों पर भिन्न हों, लेकिन आप उन्हें संवाद के माध्यम से सुलझा सकते हैं। यदि आप एक-दूसरे की ताकत पर ध्यान केंद्रित करते हैं और एक-दूसरे का समर्थन करते हैं, तो आप एक मजबूत जोड़ी बनेंगे।';

  @override
  String get compatibilityDescGood_Senior =>
      'आप ऐसे साथी हैं जो एक-दूसरे की लय के अनुसार ढलते हुए शांतिपूर्ण जीवन जीते हैं। एक-दूसरे की जीवन की आदतों का सम्मान करना और दैनिक बातचीत के माध्यम से आत्मीयता बनाना महत्वपूर्ण है। यदि आप एक-दूसरे के स्वास्थ्य पर नज़र रखते हैं और एक-दूसरे का सहारा बनते हैं, तो आप एक आरामदायक रिश्ते का आनंद लेंगे।';

  @override
  String get compatibilityTitleEffort => 'प्रयास की आवश्यकता है 🧐';

  @override
  String get compatibilityDescEffort =>
      'कई मतभेद हैं। रिश्ते के लिए समझ और विचारशीलता महत्वपूर्ण हैं।';

  @override
  String get compatibilityDescEffort_Youth =>
      'आप एक ऐसी जोड़ी हैं जिसे बहुत सारी बातचीत और समझ के माध्यम से साथ बढ़ने की आवश्यकता है। अलग-अलग व्यक्तित्वों के कारण अक्सर असहमति हो सकती है, लेकिन यदि आप इसे एक-दूसरे को जानने की प्रक्रिया के रूप में देखते हैं, तो आप विकसित हो सकते हैं। अपनी राय थोपने के बजाय दूसरे के दृष्टिकोण को समझना महत्वपूर्ण है।';

  @override
  String get compatibilityDescEffort_Mature =>
      'यह एक ऐसा रिश्ता है जिसमें बहुत धैर्य और तालमेल की आवश्यकता होती है क्योंकि जीवनशैली अलग हो सकती है। व्यावहारिक मामलों में घर्षण हो सकता है, इसलिए स्पष्ट नियम बनाना और एक-दूसरे का सम्मान करना महत्वपूर्ण है। यदि आप मतभेदों को संघर्ष के रूप में नहीं बल्कि एक पूरक के रूप में देखने का प्रयास करते हैं, तो आप रिश्ता बनाए रख पाएंगे।';

  @override
  String get compatibilityDescEffort_Senior =>
      'आप ऐसे साथी हैं जिन्हें एक-दूसरे को जगह देनी चाहिए और दूसरे की जीवन की आदतों को समझने का प्रयास करना चाहिए। लंबे समय से बनी आदतों को बदलने की कोशिश करने के बजाय उन्हें स्वीकार करना महत्वपूर्ण है। यदि आप साझा हितों पर ध्यान केंद्रित करते हैं और एक-दूसरे को भावनात्मक रूप से सहारा देते हैं, तो आप एक स्थिर रिश्ता निभा पाएंगे।';

  @override
  String get compatibilityTitleDifficult =>
      'बहुत अधिक तालमेल की आवश्यकता है 😅';

  @override
  String get compatibilityDescDifficult =>
      'व्यक्तित्व में अंतर बड़े हो सकते हैं। आपको एक-दूसरे के मतभेदों को गहराई से समझना चाहिए।';

  @override
  String get compatibilityDescDifficult_Youth =>
      'व्यक्तित्व में अंतर बड़े हो सकते हैं, जिससे अक्सर संघर्ष हो सकता है। यह एक ऐसा रिश्ता है जिसमें गहरे प्रेम और दूसरे के लिए बदलने की इच्छा की आवश्यकता होती है। दूसरे को नियंत्रित करने की कोशिश करने के बजाय, उनकी व्यक्तित्व को वैसा ही स्वीकार करना महत्वपूर्ण है जैसा वह है, और निरंतर संवाद के माध्यम से एक मध्य मार्ग खोजना महत्वपूर्ण है।';

  @override
  String get compatibilityDescDifficult_Mature =>
      'चूंकि मूल्य और जीवन के लक्ष्य बहुत अलग हो सकते हैं, इसलिए एक सामान्य दिशा खोजने के लिए बहुत प्रयास की आवश्यकता होती है। जीवन के महत्वपूर्ण निर्णयों पर समझौता करना कठिन हो सकता है, इसलिए बहुत ईमानदार और गहरा संवाद आवश्यक है। यदि आप एक-दूसरे के मतभेदों को व्यक्तिगत विकास के अवसर के रूप में देखते हैं, तो आप कठिनाइयों को दूर कर सकते हैं।';

  @override
  String get compatibilityDescDifficult_Senior =>
      'प्रत्येक ने लंबे समय में जो जीवन जीने के तरीके विकसित किए हैं, उनके मतभेदों को पहचानना और दूसरे के व्यक्तिगत स्थान का सम्मान करना महत्वपूर्ण है। साथी को अपने विचारों के अनुसार ढालने की कोशिश करने के बजाय, एक ऐसा रिश्ता बनाना बेहतर है जहाँ आप एक-दूसरे को वैसे ही स्वीकार करें जैसे आप हैं। साथ में शांति खोजने के लिए बहुत धैर्य और समझ की आवश्यकता होती है।';

  @override
  String get compatibilityAdvice_Youth =>
      'दुनिया को अपने साथी के नजरिए से देखने की कोशिश करें। छोटे सरप्राइज और समर्थन के दिल को छू लेने वाले शब्द आपके रिश्ते को मजबूत कर सकते हैं। ऐसी गतिविधियों की योजना बनाएं जो आप दोनों को उत्साहित करें और सुंदर यादें बनाएं।';

  @override
  String get compatibilityAdvice_Mature =>
      'अपने लक्ष्यों और अपेक्षाओं के बारे में ईमानदार संवाद ही कुंजी है। अपने पेशेवर विकास में एक-दूसरे का समर्थन करें, लेकिन अपने रिश्ते के लिए समय निकालना न भूलें। संयुक्त वित्तीय योजना और भविष्य की दृष्टि सुरक्षा प्रदान करेगी।';

  @override
  String get compatibilityAdvice_Senior =>
      'साथ में अपने स्वास्थ्य का ख्याल रखें और सैर या छोटी यात्राओं का आनंद लें। अपने जीवन के ज्ञान को साझा करें और एक गहरा भावनात्मक बंधन बनाएं। घर पर एक आरामदायक माहौल बनाएं जहाँ आप दोनों सहज और सुरक्षित महसूस करें।';

  @override
  String get compatibilityLuck_Youth =>
      'यह भाग्य का एक चरण है जहाँ आपका जुनून और ऊर्जा आपके भविष्य को उज्ज्वल बनाएगी। आपके पास साथ बढ़ने और अपने सपनों को पूरा करने के कई अवसर होंगे। आपके प्रेम को आपके परिवेश में एक सकारात्मक शक्ति के रूप में देखा जाएगा।';

  @override
  String get compatibilityLuck_Mature =>
      'यह स्थिरता और विकास का समय है। आपके संयुक्त प्रयास फल देंगे, चाहे वह वित्तीय पहलू में हो या आपके रिश्ते की गहराई में। आप आने वाले वर्षों के लिए एक मजबूत नींव बना रहे हैं।';

  @override
  String get compatibilityLuck_Senior =>
      'यह भाग्य शांति, सुकून और आपसी देखभाल की विशेषता है। आप एक-दूसरे की आत्मा के लिए मरहम की तरह हैं। यह समय गहरी कृतज्ञता और जीवन की यात्रा साझा करने की खुशी से भरा है।';

  @override
  String get tarotLoveMeaning0_Senior =>
      'यह नए उत्साह के बजाय छोटे दैनिक परिवर्तनों में खुशी खोजने का समय है।';

  @override
  String get tarotLoveDetail0_Senior =>
      'यह बड़े बदलावों के बजाय दैनिक जीवन की छोटी खुशियों को संजोने का समय है। अपने आस-पास के लोगों के साथ गर्मजोशी से बातचीत करने से आपको शांति मिलेगी।';

  @override
  String get tarotLoveMeaning1_Senior =>
      'अपनी आंतरिक आवाज सुनें और खुद को देखने के लिए समय निकालें।';

  @override
  String get tarotLoveDetail1_Senior =>
      'ज्ञान और अंतर्दृष्टि के माध्यम से जीवन के गहरे अर्थ खोजें। दूसरों की मदद करने का आपका दयालु हृदय आपके लिए बड़ा सौभाग्य लेकर आएगा।';

  @override
  String get tarotLoveMeaning2_Senior =>
      'अपने समृद्ध अनुभव और ज्ञान का उपयोग अपने आस-पास के लोगों का मार्गदर्शन करने के लिए करें।';

  @override
  String get tarotLoveDetail2_Senior =>
      'अपनी बुद्धि और अनुभव के साथ अपने परिवार और आस-पास के लोगों का मार्गदर्शन करें। आपका स्थिर नेतृत्व सभी को शांति प्रदान करेगा।';

  @override
  String get tarotLoveMeaning3_Senior =>
      'यह वह समय है जब भौतिक और भावनात्मक प्रचुरता एक साथ प्राप्त होती है।';

  @override
  String get tarotLoveDetail3_Senior =>
      'एक ऐसा समय जब आपके जीवन में प्रचुरता और स्थिरता एक साथ आती है। अपने प्रियजनों के साथ इस खुशी को साझा करें और एक खुशहाल समय बिताएं।';

  @override
  String get tarotLoveMeaning4_Senior =>
      'जिम्मेदारी और नेतृत्व की एक मजबूत भावना की आवश्यकता है।';

  @override
  String get tarotLoveDetail4_Senior =>
      'दृढ़ इच्छाशक्ति के साथ अपने परिवेश को व्यवस्थित करें और विश्वास के साथ अपना जीवन जीएं। आपकी स्थिर उपस्थिति आपके परिवार और आस-पास के लोगों को मानसिक शांति देगी। हालाँकि, लचीला हृदय रखना न भूलें।';

  @override
  String get tarotLoveMeaning5_Senior =>
      'यह पारंपरिक मूल्यों का पालन करने और आध्यात्मिक शांति की तलाश करने का समय है।';

  @override
  String get tarotLoveDetail5_Senior =>
      'लंबे समय से चले आ रहे ज्ञान या शिक्षाओं में जीवन का अर्थ खोजें। युवा पीढ़ी के साथ अपनी गहरी अंतर्दृष्टि साझा करने से बड़ा प्रतिफल मिलेगा। आपका विनम्र और ईमानदार रवैया लोगों को आकर्षित करेगा।';

  @override
  String get tarotLoveMeaning6_Senior =>
      'अपने आस-पास के लोगों के साथ सामंजस्यपूर्ण संबंध भाग्य की कुंजी है।';

  @override
  String get tarotLoveDetail6_Senior =>
      'आपसी सम्मान और समझ के आधार पर संतुलित संबंध बनाए रखें। किसी अनमोल व्यक्ति के साथ गहरा संवाद आपके जीवन में शक्ति का एक बड़ा स्रोत होगा। यह एक बार फिर साथ होने के महत्व को महसूस करने का समय है।';

  @override
  String get tarotLoveMeaning7_Senior =>
      'मन में स्पष्ट लक्ष्य रखकर साहसपूर्वक कार्य करें।';

  @override
  String get tarotLoveDetail7_Senior =>
      'भले ही आप बड़ी उम्र में हों, आपका जुनून अभी भी सुंदर है। यदि कुछ ऐसा है जिसे आप हासिल करना चाहते हैं, तो साहस के साथ उसका पीछा करें। आपका सक्रिय रवैया आपके दैनिक जीवन में नई जान फूँक देगा।';

  @override
  String get tarotLoveMeaning8_Senior =>
      'एक निष्पक्ष और संतुलित परिप्रेक्ष्य की आवश्यकता है।';

  @override
  String get tarotLoveDetail8_Senior =>
      'चीजों को शांति और तार्किकता से संभालें। जब कोई संघर्ष या विकल्प हो, तो अपने विवेक का पालन करना सबसे अच्छा परिणाम लाएगा। आपकी ईमानदारी आपको अपने आस-पास के लोगों से सम्मान दिलाएगी।';

  @override
  String get tarotLoveMeaning9_Senior =>
      'यह चुपचाप अपने जीवन को पीछे मुड़कर देखने और आंतरिक सत्य खोजने का समय है।';

  @override
  String get tarotLoveDetail9_Senior =>
      'चहल-पहल से दूर रहें और अपने लिए समय निकालें। शांति में, आप जीवन में नया अर्थ पाएंगे और आध्यात्मिक विकास प्राप्त करेंगे। यह आत्म-चिंतन के लिए एक अनमोल समय है।';

  @override
  String get tarotLoveMeaning10_Senior =>
      'जीवन के प्रवाह को स्वाभाविक रूप से स्वीकार करें और एक नए अवसर की प्रतीक्षा करें।';

  @override
  String get tarotLoveDetail10_Senior =>
      'जीवन में उतार-चढ़ाव होते हैं। भले ही चीजें योजना के अनुसार न हों, निराश न हों और सही समय का इंतजार करें। जल्द ही एक सकारात्मक बदलाव आएगा, इसलिए मन को शांत रखें।';

  @override
  String get tarotLoveMeaning11_Senior =>
      'आंतरिक शक्ति और धैर्य के साथ अपने मन को नियंत्रित करें।';

  @override
  String get tarotLoveDetail11_Senior =>
      'कठिन परिस्थितियों को बल के बजाय गर्मजोशी भरे हृदय से संभालने की शक्ति की आवश्यकता है। आपकी कोमलता और सहनशीलता दूसरों के दिलों को छूने की शक्ति रखेगी। अपनी आंतरिक शक्ति पर भरोसा करें।';

  @override
  String get tarotLoveMeaning12_Senior =>
      'यह वह समय है जब एक नए परिप्रेक्ष्य और बलिदान की आवश्यकता होती है।';

  @override
  String get tarotLoveDetail12_Senior =>
      'दुनिया को एक अलग नजरिए से देखने की कोशिश करें। भले ही चीजें कुछ समय के लिए रुकी हुई लगें, यह एक बड़ी छलांग के लिए तैयारी की प्रक्रिया है। धैर्य और समर्पित हृदय मूल्यवान फल लाएगा।';

  @override
  String get tarotLoveMeaning13_Senior =>
      'पुराना समाप्त होता है और एक नई शुरुआत करीब आती है।';

  @override
  String get tarotLoveDetail13_Senior =>
      'अतीत को जाने दें और अपने जीवन के एक नए अध्याय के लिए तैयार रहें। बदलाव अपरिचित हो सकता है, लेकिन यह विकास के लिए एक आवश्यक प्रक्रिया है। यदि आप हल्के मन से बदलाव के प्रवाह को स्वीकार करते हैं, तो नया भाग्य आएगा।';

  @override
  String get tarotLoveMeaning14_Senior =>
      'संतुलन और संयम सबसे महत्वपूर्ण मूल्य हैं।';

  @override
  String get tarotLoveDetail14_Senior =>
      'हर चीज में अति से बचें और बीच का रास्ता बनाए रखें। मन की शांति और स्वस्थ जीवनशैली आपको स्थिरता प्रदान करेगी। विभिन्न तत्वों को अच्छी तरह से जोड़कर एक सामंजस्यपूर्ण दैनिक जीवन बनाए रखें।';

  @override
  String get tarotLoveMeaning15_Senior =>
      'अत्यधिक लालच या जुनून से सावधान रहें।';

  @override
  String get tarotLoveDetail15_Senior =>
      'यह देखने के लिए पीछे मुड़कर देखें कि क्या आप भौतिक चीजों या पुरानी आदतों से बंधे हैं। अपने मन को जाने देने से आप स्वतंत्र महसूस करेंगे। यदि आप प्रलोभन से दूर अपना सच्चा स्वरूप पाते हैं, तो आपका भाग्य सुधरेगा।';

  @override
  String get tarotLoveMeaning16_Senior =>
      'अचानक परिवर्तन एक नई छलांग का अवसर हो सकता है।';

  @override
  String get tarotLoveDetail16_Senior =>
      'भले ही कोई अप्रत्याशित घटना घटे, घबराएं नहीं और इसे पुराने ढांचे को तोड़ने की प्रक्रिया के रूप में स्वीकार करें। संकट के बाद, एक मजबूत और अधिक ठोस आधार तैयार होगा। कठिनाइयों को दूर करने की बुद्धि रखें।';

  @override
  String get tarotLoveMeaning17_Senior =>
      'एक समय जब आशा और प्रकाश आपके जीवन को भर देते हैं।';

  @override
  String get tarotLoveDetail17_Senior =>
      'सकारात्मक मन से भविष्य की ओर देखें। आपके सपने और इच्छाएं धीरे-धीरे सच हो रही हैं। अपनी उज्ज्वल ऊर्जा को अपने आस-पास के लोगों के साथ साझा करने से और भी बड़ी खुशी मिलेगी।';

  @override
  String get tarotLoveMeaning18_Senior =>
      'अनिश्चितता के बारे में चिंतित न हों और अपने अंतर्ज्ञान पर भरोसा करें।';

  @override
  String get tarotLoveDetail18_Senior =>
      'भले ही भविष्य स्पष्ट न लगे, पहले से चिंता करने की कोई आवश्यकता नहीं है। अपनी आंतरिक आवाज सुनें और धीरे-धीरे आगे बढ़ें। जैसे-जैसे समय बीतता जाएगा, धुंध साफ हो जाएगी और एक स्पष्ट रास्ता दिखाई देगा।';

  @override
  String get tarotLoveMeaning19_Senior =>
      'यह जीवन के आनंद और जीवन शक्ति का पूरी तरह से आनंद लेने का समय है।';

  @override
  String get tarotLoveDetail19_Senior =>
      'सूरज की तरह उज्ज्वल और सकारात्मक हृदय के साथ हर दिन का आनंद लें। आपकी उपस्थिति ही आपके परिवार और पड़ोसियों के लिए बड़ी ताकत होगी। दैनिक जीवन की छोटी खुशियों के लिए आभारी रहें और एक जीवंत जीवन जिएं।';

  @override
  String get tarotLoveMeaning20_Senior =>
      'एक समय जब आपके पिछले प्रयासों के परिणाम पुरस्कृत होते हैं।';

  @override
  String get tarotLoveDetail20_Senior =>
      'कटाई का समय आ गया है। आपके ईमानदार जीवन ने फल दिया है, और आपको अपने आस-पास के लोगों से पहचान और प्रशंसा मिलेगी। इस परिणाम को कृतज्ञ हृदय से स्वीकार करें और एक नई यात्रा के लिए तैयार रहें।';

  @override
  String get tarotLoveMeaning21_Senior =>
      'एक स्वतंत्र और शुद्ध हृदय के साथ दैनिक जीवन के आनंद का आनंद लें।';

  @override
  String get tarotLoveDetail21_Senior =>
      'एक स्वतंत्र भावना के साथ अपने आस-पास के लोगों के साथ घुलने-मलने की कोशिश करें जो बंधी हुई नहीं है। नई मुलाकातें या अनुभव आपके जीवन में जान फूँक देंगे। हल्के मन से दुनिया को देखने की फुर्सत रखें।';

  @override
  String get tarotWealthMeaning0_Senior =>
      'यह स्थिर संपत्ति प्रबंधन और साझा करने के ज्ञान का समय है।';

  @override
  String get tarotWealthDetail0_Senior =>
      'नए निवेशों के बजाय अपनी वर्तमान संपत्ति की सुरक्षा और प्रबंधन पर ध्यान दें। अपनी आर्थिक समझ को साझा करना या अपने परिवार और आस-पास के लोगों को सलाह देना बहुत फायदेमंद होगा।';

  @override
  String get tarotWealthMeaning1_Senior =>
      'अपने अंतर्ज्ञान को सुनें और सावधानी से कार्य करें।';

  @override
  String get tarotWealthDetail1_Senior =>
      'आपका लंबे समय से संचित विशेष ज्ञान या कौशल आर्थिक मूल्य में बदल सकता है। बिना जल्दबाजी किए शांति से अवसरों का इंतजार करें, और आप अच्छे परिणाम प्राप्त करेंगे।';

  @override
  String get tarotWealthMeaning2_Senior =>
      'ज्ञान और अनुभव के माध्यम से एक ठोस वित्तीय आधार स्थापित किया जाता है।';

  @override
  String get tarotWealthDetail2_Senior =>
      'घर में धन का संचय होता है और यह स्थिरता पाने का समय है। आपका उदार हृदय आपके आस-पास के लोगों को गर्मजोशी देगा, और यह आशीर्वाद आपके पास वापस आएगा। तनावमुक्त मन के साथ दैनिक जीवन का आनंद लें।';

  @override
  String get tarotSuccessMeaning0_Senior =>
      'यह वह समय है जब एक सुंदर अंत एक नई चुनौती से अधिक महत्वपूर्ण है।';

  @override
  String get tarotSuccessDetail0_Senior =>
      'एक नई चुनौती के बजाय उपलब्धियों को व्यवस्थित करने और निष्कर्ष निकालने पर ध्यान दें। आपकी सफलता परिणाम के बजाय प्रक्रिया में दिखाई गई ईमानदारी और बुद्धिमत्ता में निहित है। अपने चारों ओर सकारात्मक प्रभाव फैलाएं।';

  @override
  String get tarotSuccessMeaning1_Senior =>
      'नए रचनात्मक लक्ष्यों के साथ भविष्य के लिए तैयारी करें।';

  @override
  String get tarotSuccessDetail1_Senior =>
      'आपकी आंतरिक शांति सामाजिक स्थिति या सम्मान से अधिक महत्वपूर्ण है। ध्यान या पढ़ने के माध्यम से अपने आंतरिक स्वरूप को निखारने के लिए समय निकालें। एक गहरी दृष्टि आपको और भी अधिक चमकाएगी।';

  @override
  String get tarotSuccessMeaning2_Senior =>
      'ज्ञान और अनुभव के साथ दूसरों का नेतृत्व करें।';

  @override
  String get tarotSuccessDetail2_Senior =>
      'अपने परिवार के साथ सामंजस्य बिठाकर रहना और अपने स्वास्थ्य को बनाए रखना एक पर्याप्त सफल जीवन है। छोटी-छोटी दैनिक दिनचर्या में खुशी खोजें और आभारी हृदय रखें। आपका अस्तित्व ही आपके परिवार के लिए एक बड़ी ताकत है।';

  @override
  String get tarotWealthMeaning3_Senior =>
      'यह भौतिक प्रचुरता और स्थिरता का समय है।';

  @override
  String get tarotWealthDetail3_Senior =>
      'आय के स्थिर स्रोतों और नियोजित उपभोग के माध्यम से घर की स्थिरता बनाए रखें। आपकी आर्थिक समझ आपके बच्चों के लिए एक बड़ी सीख होगी।';

  @override
  String get tarotWealthMeaning4_Senior =>
      'जिम्मेदार नेतृत्व वित्तीय सफलता लाता है।';

  @override
  String get tarotWealthDetail4_Senior =>
      'हम जटिल वित्तीय उत्पादों के बजाय सिद्ध परिसंपत्ति प्रबंधन विधियों की सलाह देते हैं। अपनी संपत्ति की रक्षा के लिए सतर्क और रूढ़िवादी रवैया ही कुंजी है।';

  @override
  String get tarotWealthMeaning5_Senior =>
      'सिद्धांतों का सम्मान दीर्घकालिक वित्तीय स्थिरता लाता है।';

  @override
  String get tarotWealthDetail5_Senior =>
      'लालची होने के बजाय अपने वर्तमान जीवन से संतुष्ट रहना और ठोस होना बेहतर है। सही चुनाव बुढ़ापे में शांति की गारंटी देता है।';

  @override
  String get tarotWealthMeaning6_Senior =>
      'किसी परिचित के माध्यम से एक अप्रत्याशित वित्तीय अवसर उत्पन्न हो सकता है।';

  @override
  String get tarotWealthDetail6_Senior =>
      'नकदी प्रवाह पर अस्थायी दबाव हो सकता है, लेकिन यदि आप इसे समझदारी से संभालते हैं, तो आप संकट को अवसर में बदल सकते हैं। अनावश्यक खर्च कम करें।';

  @override
  String get tarotWealthMeaning7_Senior =>
      'त्वरित और निर्णायक कार्रवाई के माध्यम से सफलता प्राप्त की जा सकती है।';

  @override
  String get tarotWealthDetail7_Senior =>
      'यदि आप अपने चारों ओर पुण्य संचित करते हैं, तो धन का भाग्य अप्रत्याशित स्थानों से आएगा। साझा करने की खुशी आपके जीवन को और भी समृद्ध बना देगी।';

  @override
  String get tarotWealthMeaning8_Senior =>
      'एक निष्पक्ष और संतुलित वित्तीय प्रबंधन की आवश्यकता है।';

  @override
  String get tarotWealthDetail8_Senior =>
      'भौतिक प्रचुरता के बजाय मन की शांति पाना महत्वपूर्ण है। एक अनुशासित जीवन आर्थिक स्थिरता लाएगा।';

  @override
  String get tarotWealthMeaning9_Senior =>
      'अपनी वित्तीय योजनाओं की समीक्षा करने के लिए समय निकालें।';

  @override
  String get tarotWealthDetail9_Senior =>
      'अप्रत्याशित आय या व्यय हो सकता है। यदि आप परिवर्तन के अनुकूल होते हैं और अपनी संपत्ति का समझदारी से प्रबंधन करते हैं, तो कोई बड़ी समस्या नहीं होगी।';

  @override
  String get tarotWealthMeaning10_Senior =>
      'भाग्य बदलता है, इसलिए भविष्य के लिए तैयारी करें।';

  @override
  String get tarotWealthDetail10_Senior =>
      'विरासत या दान जैसे संपत्ति के मामलों में सिद्धांतों का पालन करना महत्वपूर्ण है। ईमानदार रवैया विवादों को रोकता है और शांति लाता।';

  @override
  String get tarotWealthMeaning11_Senior =>
      'धैर्य और आंतरिक शक्ति के साथ वित्तीय कठिनाइयों को दूर करें।';

  @override
  String get tarotWealthDetail11_Senior =>
      'बच्चों या वंशजों के लिए आर्थिक सहायता बाद में एक बड़े इनाम के रूप में वापस आएगी। धैर्य रखें और दीर्घकालिक दृष्टिकोण बनाए रखें।';

  @override
  String get tarotWealthMeaning12_Senior =>
      'पैसे पर एक नए परिप्रेक्ष्य की आवश्यकता है।';

  @override
  String get tarotWealthDetail12_Senior =>
      'आपके पास एक रहस्यमय अनुभव होगा जहाँ आप खाली होने के माध्यम से भर जाएंगे। अनावश्यक संपत्ति को छोड़ दें और हल्के मन से दैनिक जीवन का सामना करें।';

  @override
  String get tarotWealthMeaning13_Senior =>
      'एक बड़ा वित्तीय परिवर्तन आ रहा है, इसलिए तैयार रहें।';

  @override
  String get tarotWealthDetail13_Senior =>
      'आय और व्यय के बीच सामंजस्य की तलाश करें और अत्यधिक लालच से सावधान रहें। एक अनुशासित जीवन आपको निरंतर स्थिरता प्रदान करेगा।';

  @override
  String get tarotWealthMeaning14_Senior =>
      'अत्यधिक खर्च से बचें और संयम बनाए रखें।';

  @override
  String get tarotWealthDetail14_Senior =>
      'आपको लुभावने निवेश प्रस्तावों या अत्यधिक विस्तार से सावधान रहना चाहिए। अपने समृद्ध अनुभव पर भरोसा करना और विवेकपूर्ण निर्णय लेना आपकी संपत्ति की रक्षा करने का तरीका है।';

  @override
  String get tarotWealthMeaning15_Senior =>
      'अत्यधिक वित्तीय प्रलोभनों से सावधान रहें।';

  @override
  String get tarotWealthDetail15_Senior =>
      'संकट की स्थिति में, बुनियादी बातों पर लौटने की बुद्धि आवश्यक है। घबराएं नहीं और नुकसान को कम करने के लिए अपनी संपत्ति की स्थिति की सावधानीपूर्वक जांच करें।';

  @override
  String get tarotWealthMeaning16_Senior =>
      'अचानक परिवर्तन एक नई वित्तीय छलांग का अवसर हो सकता है।';

  @override
  String get tarotWealthDetail16_Senior =>
      'यह वह समय है जब आर्थिक कठिनाइयाँ दूर हो जाती हैं और एक स्थिर प्रवाह शुरू होता है। सकारात्मक मन से अपने भविष्य की योजना बनाएं और शांति का आनंद लें।';

  @override
  String get tarotWealthMeaning17_Senior =>
      'आशा और वित्तीय भाग्य चमकने लगे हैं।';

  @override
  String get tarotWealthDetail17_Senior =>
      'धन से संबंधित धुंध के छंटने और सच्चाई के सामने आने का इंतजार करने के लिए धैर्य की आवश्यकता है। जल्दबाजी में निर्णय लेने के बजाय अपना समय लें और निरीक्षण करें।';

  @override
  String get tarotWealthMeaning18_Senior =>
      'अदृश्य वित्तीय जोखिमों से सावधान रहें।';

  @override
  String get tarotWealthDetail18_Senior =>
      'आपके प्रयासों के बाद पर्याप्त पुरस्कार मिलते हैं और आर्थिक फुर्सत मिलती है। अपने आस-पास के लोगों के साथ खुशी साझा करें और धन्य समय बिताएं।';

  @override
  String get tarotWealthMeaning19_Senior =>
      'यह भौतिक प्रचुरता और जीवन शक्ति का आनंद लेने का समय है।';

  @override
  String get tarotWealthDetail19_Senior =>
      'यह वह समय है जब आपकी ईमानदारी को आर्थिक उपलब्धि के रूप में मान्यता दी जाती है। अतीत को व्यवस्थित करें और एक स्थिर भविष्य के लिए एक नया कदम उठाएं।';

  @override
  String get tarotWealthMeaning20_Senior =>
      'पिछले प्रयास वित्तीय पुरस्कारों के रूप में फल दे रहे हैं।';

  @override
  String get tarotWealthDetail20_Senior =>
      'आर्थिक स्थिरता अपने चरम पर पहुंच जाती है और एक शांतिपूर्ण सेवानिवृत्ति की गारंटी दी जाती है। यह वह क्षण है जब आपका बुद्धिमान परिसंपत्ति प्रबंधन चमकता है।';

  @override
  String get tarotWealthMeaning21_Senior =>
      'शुद्ध हृदय के साथ वित्तीय स्वतंत्रता बनाए रखें।';

  @override
  String get tarotWealthDetail21_Senior =>
      'यह भौतिक संपत्ति के बजाय जीवन के आनंद को महत्व देने का समय है। यदि आप तनावमुक्त मन के साथ दुनिया का आनंद लेते हैं, तो धन स्वाभाविक रूप से पीछे आएगा।';

  @override
  String get tarotSuccessMeaning3_Senior =>
      'आपके प्रयास फल दे रहे हैं और आप स्थिरता प्राप्त कर रहे हैं।';

  @override
  String get tarotSuccessDetail3_Senior =>
      'आपका नेतृत्व और बुद्धिमत्ता आपके आस-पास के लोगों के लिए एक आदर्श के रूप में कार्य करती है। जब आप अधिकार के बजाय सहनशीलता के साथ नेतृत्व करेंगे तो आप वास्तविक सफलता का स्वाद चखेंगे।';

  @override
  String get tarotSuccessMeaning4_Senior =>
      'मजबूत नेतृत्व आपके क्षेत्र में सफलता लाता है।';

  @override
  String get tarotSuccessDetail4_Senior =>
      'यह वह समय है जब अडिग मूल्य फल देते हैं। सिद्धांतों पर आधारित आपका जीवन छोटे बच्चों को सही रास्ता दिखाने वाले मील के पत्थर के रूप में कार्य करेगा।';

  @override
  String get tarotSuccessMeaning5_Senior =>
      'सम्मान बनाए रखें और पारंपरिक मूल्यों का पालन करें।';

  @override
  String get tarotSuccessDetail5_Senior =>
      'सम्मान और लाभ के बीच बुद्धिमानी से चुनाव करने का समय है। आपके समृद्ध अनुभव के आधार पर लिए गए निर्णय एक शांतिपूर्ण भविष्य सुनिश्चित करेंगे।';

  @override
  String get tarotSuccessMeaning6_Senior =>
      'एक नई साझेदारी या सहयोग अच्छे परिणाम लाता है।';

  @override
  String get tarotSuccessDetail6_Senior =>
      'कोई भी बाधा आपकी इच्छाशक्ति को नहीं तोड़ सकती। हार न मानकर आगे बढ़ने का आपका स्वरूप ही पहले से ही एक बड़ी सफलता है।';

  @override
  String get tarotSuccessMeaning7_Senior =>
      'अपने लक्ष्य की ओर साहसपूर्वक आगे बढ़ें।';

  @override
  String get tarotSuccessDetail7_Senior =>
      'यह वह समय है जब कोमलता शक्ति पर जीत हासिल करती है। जब आप धैर्य और परोपकार के साथ परिवेश को गले लगाते हैं, तो आपका सम्मान और भी ऊंचा होगा।';

  @override
  String get tarotSuccessMeaning8_Senior =>
      'निष्पक्ष निर्णय और संतुलन सफलता की कुंजी हैं।';

  @override
  String get tarotSuccessDetail8_Senior =>
      'यह वह समय है जब आप उन गहरे सत्यों को महसूस करते हैं जिन्हें दूसरे नहीं देख सकते। शांत चिंतन का समय आपको एक अधिक परिपक्व और गहरा इंसान बना देगा।';

  @override
  String get tarotSuccessMeaning9_Senior =>
      'अपनी उपलब्धियों की समीक्षा करने के लिए समय निकालें।';

  @override
  String get tarotSuccessDetail9_Senior =>
      'जीवन का एक नया अध्याय खुलता है। यदि आप बिना डरे परिवर्तन को सकारात्मक रूप से स्वीकार करते हैं, तो आपको अप्रत्याशित और महान परिणाम मिलेंगे।';

  @override
  String get tarotSuccessMeaning10_Senior =>
      'भाग्य के परिवर्तन को स्वीकार करें और एक नया रास्ता खोजें।';

  @override
  String get tarotSuccessDetail10_Senior =>
      'निजी स्वार्थ के बजाय न्याय का पालन करना परिवेश के सम्मान का आह्वान करता है। आपकी ईमानदारी अंततः सबसे बड़ी सफलता की कुंजी होगी।';

  @override
  String get tarotSuccessMeaning11_Senior =>
      'दृढ़ता और धैर्य के साथ चुनौतियों को दूर करें।';

  @override
  String get tarotSuccessDetail11_Senior =>
      'भले ही अभी कठिन हो, यह एक नेक लक्ष्य के लिए डटे रहने का समय है। आपका समर्पण भविष्य में इतिहास और लोगों की यादों में एक सुंदर सफलता के रूप में रहेगा।';

  @override
  String get tarotSuccessMeaning12_Senior =>
      'सफलता को एक अलग दृष्टिकोण से देखें।';

  @override
  String get tarotSuccessDetail12_Senior =>
      'अतीत की महिमा के प्रति जुनूनी होने के बजाय वर्तमान की बहुमूल्यता को महसूस करना महत्वपूर्ण है। शून्यता के माध्यम से प्राप्त शांति ही जीवन में वास्तविक सफलता है।';

  @override
  String get tarotSuccessMeaning13_Senior =>
      'एक चरण समाप्त होता है और एक नया अध्याय शुरू होता.';

  @override
  String get tarotSuccessDetail13_Senior =>
      'एक संतुलित जीवन जो किसी भी तरफ नहीं झुकता है, वह सर्वोच्च गुण है। आपका अनुशासित स्वरूप आपके परिवेश में शांति और स्थिरता फैलाएगा।';

  @override
  String get tarotSuccessMeaning14_Senior =>
      'संतुलन बनाए रखें और संयम के साथ अपनी सफलता का प्रबंधन करें।';

  @override
  String get tarotSuccessDetail14_Senior =>
      'आपको बांधने वाली बाधाओं से बचकर अपना सच्चा स्वरूप खोजें। जिस क्षण आप मन की स्वतंत्रता प्राप्त करेंगे, आप दुनिया के सबसे समृद्ध व्यक्ति होंगे।';

  @override
  String get tarotSuccessMeaning15_Senior =>
      'सफलता या शक्ति के जुनून से सावधान रहें।';

  @override
  String get tarotSuccessDetail15_Senior =>
      'अचानक परिवर्तन एक ऐसी प्रक्रिया है जो आपको मजबूत बनाती है। जब आप शांति से प्रतिक्रिया देकर एक नई व्यवस्था स्थापित करते हैं, तो बड़ी उपलब्धियां मिलेंगी।';

  @override
  String get tarotSuccessMeaning16_Senior =>
      'एक अप्रत्याशित परिवर्तन बड़ी सफलता की ओर एक मोड़ हो सकता है।';

  @override
  String get tarotSuccessDetail16_Senior =>
      'थकी हुई आत्मा को आराम मिलता है और नए सपने जागते हैं। आपकी रचनात्मक ऊर्जा परिवेश को रोशन करेगी और सुखद फल लाएगी।';

  @override
  String get tarotSuccessMeaning17_Senior =>
      'एक स्पष्ट दृष्टि और आशा सफलता की ओर ले जाती है।';

  @override
  String get tarotSuccessDetail17_Senior =>
      'भ्रमित स्थितियों में भी अपनी आंतरिक आवाज सुनें। समय के साथ आपका चुनाव सही साबित होगा।';

  @override
  String get tarotSuccessMeaning18_Senior =>
      'अनिश्चितता के बारे में चिंतित न हों और अपने अंतर्ज्ञान पर भरोसा करें।';

  @override
  String get tarotSuccessDetail18_Senior =>
      'एक समय जब शरीर और मन स्वस्थ और गतिशील होते हैं। अपने परिवेश के साथ सकारात्मक ऊर्जा साझा करना और जीवन के आनंद का आनंद लेना ही वास्तविक सफलता है।';

  @override
  String get tarotSuccessMeaning19_Senior =>
      'अपनी उपलब्धियों का जश्न मनाएं और सफलता के आनंद का आनंद लें।';

  @override
  String get tarotSuccessDetail19_Senior =>
      'आपके अनुभव और बुद्धिमत्ता की आवश्यकता वाली जगहें उत्पन्न होती हैं। जब आप मिशन की एक नई भावना के साथ समाज में योगदान देंगे तो आप एक बड़ा इनाम और सफलता महसूस करेंगे।';

  @override
  String get tarotSuccessMeaning20_Senior =>
      'आपके लंबे समय के प्रयासों को आधिकारिक तौर पर मान्यता दी गई है।';

  @override
  String get tarotSuccessDetail20_Senior =>
      'उपलब्धि और शांति की एक ऐसी स्थिति जहाँ अब कुछ भी हासिल करना बाकी नहीं है। आपका जीवन अपने आप में कला का एक नमूना बन जाएगा और आपके परिवेश पर गहरा प्रभाव डालेगा।';

  @override
  String get tarotSuccessMeaning21_Senior =>
      'स्वतंत्र मन के साथ अंतिम सफलता प्राप्त करें।';

  @override
  String get tarotSuccessDetail21_Senior =>
      'दुनिया के मानकों से दूर अपनी खुशी का आनंद लें। आप, जो दुनिया में ऐसे रहते हैं जैसे कि हल्के मन से यात्रा कर रहे हों, वास्तविक विजेता हैं।';

  @override
  String get compatibilityResultButton => 'अनुकूलता परिणाम देखें';

  @override
  String get compatibilityDeleteTooltip => 'हटाएँ';

  @override
  String get compatibilityGenderMale => 'पुरुष';

  @override
  String get compatibilityGenderFemale => 'महिला';

  @override
  String get compatibilityInputTitle => 'संगतता जानकारी इनपुट';

  @override
  String get tojeongInputTitle => 'तोजियोंग (Tojeong) वार्षिक भविष्यवाणी';

  @override
  String tojeongCheckFortune(int year) {
    return 'अपनी $year की\nतोजियोंग वार्षिक भविष्यवाणी देखें';
  }

  @override
  String get tojeongInputGuide =>
      'सटीक विश्लेषण के लिए कृपया अपनी जन्म तिथि और समय दर्ज करें।';

  @override
  String tojeongViewResult(int year) {
    return '$year तोजियोंग वार्षिक भविष्यवाणी देखें';
  }

  @override
  String get tojeongCheckButton => 'वार्षिक भविष्यवाणी की जाँच करें';

  @override
  String get tojeongSaveAndCheck => 'सहेजें और भविष्यवाणी देखें';

  @override
  String get tojeongYearSelect => 'भविष्यवाणी का वर्ष चुनें';

  @override
  String tojeongResultTitle(int year) {
    return '$year तोजियोंग वार्षिक भविष्यवाणी';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return '$name का $year का भाग्यफल';
  }

  @override
  String tojeongGua(String gua) {
    return 'गुआ: $gua';
  }

  @override
  String get tojeongTotalLuck => 'कुल भाग्य';

  @override
  String get tojeongProcess => 'प्रक्रिया';

  @override
  String get tojeongResult => 'परिणाम';

  @override
  String get tojeongMonthlyLuck => 'मासिक भाग्य';

  @override
  String get tojeongShareResult => 'परिणाम साझा करें';

  @override
  String tojeongShareTitle(int year) {
    return '$year तोजियोंग वार्षिक भविष्यवाणी परिणाम';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return '$name की तोजियोंग वार्षिक भविष्यवाणी की समग्र समीक्षा।\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => 'लक्ष्य वर्ष';

  @override
  String get sajuDeleteTitle => 'साजू जानकारी हटाएँ';

  @override
  String sajuDeleteConfirm(String name) {
    return 'क्या आप निश्चित रूप से $name की जानकारी हटाना चाहते हैं?';
  }

  @override
  String get sajuProfileSelect => 'साजू जानकारी चुनें';

  @override
  String get add => 'जोड़ें';

  @override
  String get modify => 'संशोधित करें';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\nसेवा तैयार की जा रही है।';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'हम आपको अधिक सटीक और उपयोगी भाग्य की जानकारी प्रदान करने के लिए कड़ी मेहनत कर रहे हैं!';

  @override
  String get goBack => 'पीछे जाएं';

  @override
  String get name => 'नाम';

  @override
  String get nameInputGuide => 'कृपया अपना नाम दर्ज करें';

  @override
  String get sajuLunarSolar => 'सौर/चंद्र';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => 'भाग्य का वर्ष चुनें';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'प्रोफ़ाइल चुनें';

  @override
  String get male => 'पुरुष';

  @override
  String get female => 'महिला';

  @override
  String get newYearFortuneInputTitle => 'नए साल के भाग्य की जानकारी';

  @override
  String newYearFortuneHeader(int year) {
    return 'आपका $year का\nभाग्य कैसा रहेगा?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'सटीक साजू विश्लेषण के लिए कृपया अपनी जन्म तिथि और समय दर्ज करें।';

  @override
  String newYearFortuneViewButton(int year) {
    return '$year का भाग्य देखें';
  }

  @override
  String get newYearFortuneCheckButton => 'भाग्य की जाँच करें';

  @override
  String get newYearFortuneSaveAndCheckButton => 'सहेजें और भाग्य देखें';

  @override
  String newYearFortuneResultTitle(int year) {
    return 'मेरा $year का नया साल का भाग्य';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return 'मेरे $year के नए साल के भाग्य का परिणाम';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return '$name के लिए नए साल का भाग्य।\n\n$desc...';
  }

  @override
  String get sajuChartTitle => 'जन्म कुंडली चार्ट (Saju Chart)';

  @override
  String get sajuHour => 'समय';

  @override
  String get sajuDay => 'दिन';

  @override
  String get sajuMonth => 'माह';

  @override
  String get sajuYear => 'वर्ष';

  @override
  String get ohaengAnalysisTitle => 'पंचतत्व (Ohaeng) विश्लेषण';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'आपका प्रमुख तत्व: $name ($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ पंचतत्व (लकड़ी, अग्नि, पृथ्वी, धातु, जल) साजू की बुनियादी ऊर्जाएं हैं। यद्यपि संतुलन आदर्श है, आप इन तत्वों के माध्यम से अपनी प्रवृत्तियों को समझ सकते हैं।';

  @override
  String yearlyTotalLuck(int year) {
    return '$year का कुल भाग्यफल';
  }

  @override
  String get fortuneDisclaimer =>
      'यह भाग्यफल केवल मनोरंजन के लिए है। आपका जीवन आपकी अपनी इच्छाशक्ति और कर्मों पर निर्भर करता है।';

  @override
  String get compatibilityResultTitle => 'अनुकूलता परिणाम';

  @override
  String get compatibilityScore => 'अनुकूलता स्कोर';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score अंक';
  }

  @override
  String get compatibilityShareTitle => 'हमारी अनुकूलता का परिणाम';

  @override
  String get compatibilityShareResult => 'परिणाम साझा करें';

  @override
  String get compatibilityRetryButton => 'किसी और के साथ जाँचें';

  @override
  String get compatibilitySummary => 'सारांश';

  @override
  String get compatibilitySectionLuck => 'भाग्य तालमेल';

  @override
  String get compatibilitySectionAdvice => 'संबंध सलाह';

  @override
  String get compatibilitySectionPositive => 'सकारात्मक पहलू';

  @override
  String get compatibilitySectionCaution => 'सावधानी के बिंदु';

  @override
  String get compatibilityLunarDisclaimer =>
      '* नोट: चंद्र जन्म तिथियों का वर्तमान में सौर तिथियों के आधार पर विश्लेषण किया जाता है। चंद्र रूपांतरण जल्द ही अपडेट किया जाएगा।';

  @override
  String get tojeongSaveAndCheckButton => 'सहेजें और वार्षिक भविष्यवाणी देखें';

  @override
  String get tojeongSangsuKeyword1 => 'दृढ़ इच्छाशक्ति और नेतृत्व का समय';

  @override
  String get tojeongSangsuKeyword2 => 'सक्रिय सामाजिक जीवन और खुशियों का समय';

  @override
  String get tojeongSangsuKeyword3 => 'बुद्धि और जुनून के चमकने का समय';

  @override
  String get tojeongSangsuKeyword4 => 'परिवर्तन और नई शुरुआत का समय';

  @override
  String get tojeongSangsuKeyword5 => 'लचीलेपन और सौम्य बातचीत का समय';

  @override
  String get tojeongSangsuKeyword6 => 'धैर्य के साथ बाधाओं को दूर करने का समय';

  @override
  String get tojeongSangsuKeyword7 => 'स्थिरता और आंतरिक शक्ति निर्माण का समय';

  @override
  String get tojeongSangsuKeyword8 => 'सद्भाव और पुण्य संचय का समय';

  @override
  String get tojeongJungsuKeyword1 => 'आपको किसी सहायक का साथ मिलेगा';

  @override
  String get tojeongJungsuKeyword2 => 'दस्तावेजों या अनुबंधों में शुभ समाचार';

  @override
  String get tojeongJungsuKeyword3 => 'नई चुनौतियों और अवसरों का आगमन';

  @override
  String get tojeongJungsuKeyword4 => 'करियर में सफलता और सम्मान की प्राप्ति';

  @override
  String get tojeongJungsuKeyword5 => 'वित्त का सावधानीपूर्वक प्रबंधन आवश्यक';

  @override
  String get tojeongJungsuKeyword6 => 'स्वास्थ्य और विश्राम को प्राथमिकता दें';

  @override
  String get tojeongHasuKeyword1 => 'आप बड़ी सफलता प्राप्त करेंगे।';

  @override
  String get tojeongHasuKeyword2 => 'प्रयासों का उचित फल प्राप्त होगा।';

  @override
  String get tojeongHasuKeyword3 => 'धैर्य से संकट को अवसर में बदलेंगे।';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return 'इस वर्ष आपका भाग्य $sangsu, $jungsu, और $hasu के प्रभाव में रहेगा।';
  }

  @override
  String get tojeongSangsuDetail1 =>
      'यह वैसी स्थिति है जहाँ भाग्य आपका पूरा साथ दे रहा है। यदि आप दृढ़ इच्छाशक्ति के साथ आगे बढ़ते हैं, तो शानदार परिणाम प्राप्त करेंगे। आकाश की ओर बढ़ते ड्रैगन की तरह आपकी ऊर्जा शक्तिशाली है। नेतृत्व दिखाने और पहचान पाने के कई अवसर मिलेंगे। हालाँकि, अहंकार से बचें और सबके साथ मिलकर चलें।';

  @override
  String get tojeongSangsuDetail2 =>
      'यह एक शांत झील में पत्थर फेंकने जैसा है, जिससे सुंदर लहरें पैदा होती हैं। यह खुशियों भरा वर्ष है, लेकिन वाणी पर नियंत्रण रखना आवश्यक है। सामाजिक जीवन सक्रिय होगा और लोकप्रियता बढ़ेगी, जिससे ईर्ष्या भी हो सकती है। किसी सभा में एक अच्छे साथी से मिलने की संभावना है।';

  @override
  String get tojeongSangsuDetail3 =>
      'यह पूरी दुनिया पर चमकते सूरज की तरह है। आपकी बुद्धि और जुनून चमकेगा, विशेषकर अध्ययन या कला के क्षेत्रों में। आपकी प्रतिष्ठा बढ़ेगी, लेकिन क्रोध पर नियंत्रण रखना जरूरी है। बाहरी चमक के बावजूद अंदरूनी शांति और गहराई पर ध्यान दें।';

  @override
  String get tojeongSangsuDetail4 =>
      'तेजी से बदलाव की उम्मीद है। आपकी ऊर्जा सक्रिय है, जिससे नई शुरुआत के लिए यह अच्छा समय है। आप स्थान परिवर्तन या अन्य बदलावों में व्यस्त रह सकते हैं। शुरुआत उत्साहपूर्ण होगी, लेकिन कार्य को पूरा करने के लिए अंत तक दृढ़ता बनाए रखें।';

  @override
  String get tojeongSangsuDetail5 =>
      'यह वसंत की उस हवा जैसा समय है जो सब कुछ पुनर्जीवित कर देती है। लचीले व्यवहार से कठिन रास्ते भी खुल जाएंगे। व्यापार में लाभ की संभावना है और दूर से शुभ समाचार मिलेगा। अवसर आने पर निर्णय लेने में देरी न करें।';

  @override
  String get tojeongSangsuDetail6 =>
      'यह गहरे पानी में तैरने जैसा है। सतह पर शांति दिख सकती है, लेकिन अंदर कुछ चिंताएँ हो सकती हैं। अपनी बुद्धि का उपयोग करें और जोखिम भरे निवेश से बचें। धैर्यपूर्वक सही समय का इंतजार करें, सफलता अवश्य मिलेगी। अपने स्वास्थ्य का ध्यान रखें।';

  @override
  String get tojeongSangsuDetail7 =>
      'यह एक विशाल पर्वत को पार करने जैसा है, जिसके बाद एक विस्तृत मैदान आपका स्वागत करेगा। यदि आप धैर्य से कठिनाइयों का सामना करते हैं, तो बड़ा फल मिलेगा। वर्तमान स्थिति में स्थिरता बनाए रखना फायदेमंद है। जल्दबाजी के बजाय विश्वास और नींव मजबूत करने पर ध्यान दें।';

  @override
  String get tojeongSangsuDetail8 =>
      'यह उपजाऊ भूमि पर बीज बोने का समय है। यदि आप धैर्य और सद्भाव के साथ चलते हैं, तो भविष्य में इसके अच्छे परिणाम मिलेंगे। दूसरों की मदद करने और माँ जैसे उदार हृदय से व्यवहार करने पर आपको भी सहायता मिलेगी। तत्काल लाभ के बजाय भविष्य के निवेश पर ध्यान दें। घर में सुख-शांति बनी रहेगी।';

  @override
  String get tojeongJungsuDetail1 =>
      'कोई मददगार व्यक्ति आपके जीवन में आएगा, जिससे शुभ कार्य सिद्ध होंगे। रुकी हुई बाधाएं दूर होंगी और आर्थिक स्थिति में सुधार होगा। साझेदारी में काम करने पर सफलता की संभावना अधिक है।';

  @override
  String get tojeongJungsuDetail2 =>
      'परिवार में कोई मांगलिक कार्य या खुशी का अवसर आ सकता है। दस्तावेजी कार्यों और अनुबंधों के लिए यह अनुकूल समय है। हालाँकि, छोटी बातों पर विवाद से बचें और अपने व्यवहार में विनम्रता बनाए रखें।';

  @override
  String get tojeongJungsuDetail3 =>
      'आपको अपनी सीमाओं का विस्तार करने या दूर की यात्रा करने का अवसर मिलेगा। यात्रा या नए संपर्कों के माध्यम से प्रगति होगी। बदलाव से डरे बिना चुनौतियों का सामना करें, परिणाम सुखद होंगे।';

  @override
  String get tojeongJungsuDetail4 =>
      'कार्यक्षेत्र में आपको विशेष पहचान और पदोन्नति मिल सकती है। परीक्षाओं या प्रमाणन के लिए यह श्रेष्ठ समय है। अपनी क्षमताओं का प्रदर्शन करने में संकोच न करें।';

  @override
  String get tojeongJungsuDetail5 =>
      'आर्थिक लाभ की संभावना है, लेकिन खर्च भी बढ़ सकते हैं। बजट प्रबंधन पर ध्यान दें और अनावश्यक खर्चों से बचें। परिचितों के साथ धन के लेन-देन में सावधानी बरतें।';

  @override
  String get tojeongJungsuDetail6 =>
      'यह अपने स्वास्थ्य की विशेष देखभाल करने का समय है। काम के बोझ से बचें और पर्याप्त विश्राम करें। अपनी जीवनशैली को संतुलित रखें और शारीरिक तंदुरुस्ती को प्राथमिकता दें।';

  @override
  String get tojeongHasuDetail1 =>
      'अंततः, सभी मामले सुचारू रूप से हल हो जाएंगे और आपकी मनोकामनाएं पूरी होंगी। आपके प्रयासों का फल मिलेगा और समाज में सम्मान बढ़ेगा। अपनी विनम्रता और मूल सिद्धांतों को बनाए रखें।';

  @override
  String get tojeongHasuDetail2 =>
      'प्रक्रिया में कुछ चुनौतियाँ आ सकती हैं, लेकिन धैर्य और कड़ी मेहनत से आप लक्ष्य प्राप्त कर लेंगे। सफलता के लिए निरंतर प्रयास आवश्यक हैं। यह \'देर आए दुरुस्त आए\' वाला भाग्य है।';

  @override
  String get tojeongHasuDetail3 =>
      'अप्रत्याशित बाधाएं आ सकती हैं, लेकिन निराश न हों। धैर्य से आप संकट को अवसर में बदल सकते हैं। लोभ त्यागकर स्पष्ट मन से कार्य करने पर शुभ फल प्राप्त होंगे।';

  @override
  String get tojeongGeneralWealthGood =>
      'आर्थिक स्थिति अच्छी रहेगी। अप्रत्याशित लाभ या निवेश से अच्छे रिटर्न की उम्मीद है। हालाँकि, बचत पर ध्यान देना भी उतना ही जरूरी है।';

  @override
  String get tojeongGeneralWealthBad =>
      'धन का प्रवाह कुछ धीमा रह सकता है। अनावश्यक खर्च कम करें और भविष्य के लिए बचत करें। वित्तीय निवेश में सावधानी बरतें।';

  @override
  String get tojeongGeneralCareerGood =>
      'करियर में प्रगति और पहचान के अवसर मिलेंगे। पदोन्नति या नई शुरुआत के लिए यह अच्छा समय है। टीम वर्क से बेहतर परिणाम मिलेंगे।';

  @override
  String get tojeongGeneralCareerBad =>
      'फिलहाल यथास्थिति बनाए रखना बेहतर है। नए जोखिम लेने के बजाय अपने कौशल को निखारने पर ध्यान दें। सहकर्मियों के साथ तालमेल बनाए रखें।';

  @override
  String get tojeongGeneralLoveGood =>
      'प्रेम संबंधों में प्रगाढ़ता आएगी। अविवाहितों को एक अच्छा साथी मिल सकता है। पारिवारिक जीवन सुखद और सामंजस्यपूर्ण रहेगा।';

  @override
  String get tojeongGeneralLoveBad =>
      'छोटी गलतफहमियों से विवाद हो सकता. एक-दूसरे की भावनाओं का सम्मान करें और बातचीत के माध्यम से समस्याओं को सुलझाएं।';

  @override
  String get optional => 'वैकल्पिक';

  @override
  String get sajuSolarHint =>
      'तोजियोंगबिग्योल का विश्लेषण चंद्र जन्मदिन के आधार पर किए जाने पर यह सबसे सटीक होता है।';

  @override
  String get yourFortune => 'आपका भाग्य';

  @override
  String get guaUpper => 'ऊपरी गुआ';

  @override
  String get guaMiddle => 'मध्य गुआ';

  @override
  String get guaLower => 'निचला गुआ';

  @override
  String get guaCode => 'गुआ कोड';

  @override
  String get viewAgain => 'फिर से जांचें';

  @override
  String get zodiacAries => 'मेष (Aries)';

  @override
  String get zodiacTaurus => 'वृषभ (Taurus)';

  @override
  String get zodiacGemini => 'मिथुन (Gemini)';

  @override
  String get zodiacCancer => 'कर्क (Cancer)';

  @override
  String get zodiacLeo => 'सिंह (Leo)';

  @override
  String get zodiacVirgo => 'कन्या (Virgo)';

  @override
  String get zodiacLibra => 'तुला (Libra)';

  @override
  String get zodiacScorpio => 'वृश्चिक (Scorpio)';

  @override
  String get zodiacSagittarius => 'धनु (Sagittarius)';

  @override
  String get zodiacCapricorn => 'मकर (Capricorn)';

  @override
  String get zodiacAquarius => 'कुंभ (Aquarius)';

  @override
  String get zodiacPisces => 'मीन (Pisces)';

  @override
  String get elementFire => 'अग्नि (Fire)';

  @override
  String get elementEarth => 'पृथ्वी (Earth)';

  @override
  String get elementAir => 'वायु (Air)';

  @override
  String get elementWater => 'जल (Water)';

  @override
  String get compatibilityCategoryZodiac => 'राशि अनुकूलता';

  @override
  String get compatibilityCategoryInner => 'आंतरिक अनुकूलता';

  @override
  String get compatibilityCategoryConstellation => 'नक्षत्र अनुकूलता';

  @override
  String get compatibilitySummarySamhap => 'सर्वश्रेष्ठ राशि मिलान (Samhap)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return '$animal1 और $animal2 एक आदर्श मिलान हैं, जो एक-दूसरे की कमजोरियों को पूरा करते हैं। यह रिश्ता साथ होने पर शानदार तालमेल बनाता है।';
  }

  @override
  String get compatibilitySummaryYukhap => 'शानदार राशि मिलान (Yukhap)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return '$animal1 और $animal2 के बीच गहरा आपसी आकर्षण है। शुरुआत से ही संबंध महसूस करना आसान है।';
  }

  @override
  String get compatibilitySummaryChung =>
      'प्रयास की आवश्यकता वाला रिश्ता (Chung)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return '$animal1 और $animal2 के स्वभाव अलग हैं और उनमें टकराव हो सकता है। एक-दूसरे के मतभेदों का सम्मान करना और विचारशीलता दिखाना आवश्यक है।';
  }

  @override
  String get compatibilitySummaryWonjin =>
      'समझ की आवश्यकता वाला रिश्ता (Wonjin)';

  @override
  String get compatibilityDescWonjin =>
      'यह एक ऐसा रिश्ता है जहाँ आप कभी-कभी बिना किसी स्पष्ट कारण के नाराजगी या उदासी महसूस कर सकते हैं। गलतफहमियों को कम करने के लिए बार-बार बातचीत करने की सलाह दी जाती है।';

  @override
  String get compatibilitySummaryDefaultZodiac => 'सामान्य राशि मिलान';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return '$animal1 और $animal2 के बीच बिना किसी बड़े संघर्ष के एक सहज रिश्ता है।';
  }

  @override
  String get compatibilitySummaryCheonganHap => 'सोलमेटส์ (CheonganHap)';

  @override
  String get compatibilityDescCheonganHap =>
      'दोनों व्यक्तियों के व्यक्तित्व और मूल्य पूरी तरह से संरेखित हैं। आप ऐसे सोलमेट्स हैं जो बिना शब्दों के भी एक-दूसरे को समझते हैं।';

  @override
  String get compatibilitySummarySangsaeng => 'परस्पर लाभकारी (Sangsaeng)';

  @override
  String get compatibilityDescSangsaeng =>
      'एक सकारात्मक रिश्ता जहाँ आप एक-दूसरे का समर्थन करते हैं और एक-दूसरे को बढ़ने में मदद करते हैं।';

  @override
  String get compatibilitySummarySanggeuk =>
      'समायोजन की आवश्यकता वाला रिश्ता (Sanggeuk)';

  @override
  String get compatibilityDescSanggeuk =>
      'व्यक्तित्व में अंतर हो सकता है, लेकिन यह एक ऐसा रिश्ता भी है जहाँ आप एक-दूसरे की कमजोरियों को पूरा कर सकते हैं।';

  @override
  String get compatibilitySummaryDefaultInner => 'दोस्तों की तरह सहज';

  @override
  String get compatibilityDescDefaultInner =>
      'एक ऐसा रिश्ता जहाँ आपकी प्रवृत्तियाँ समान हैं और आप दोस्तों की तरह सहजता से समय बिता सकते हैं।';

  @override
  String get compatibilitySummarySameElement => 'समान व्यक्तित्वों का मिलन';

  @override
  String compatibilityDescSameElement(String element) {
    return 'आप दोनों की प्रवृत्ति \'$element\' है, जिससे आपके मूल्य और कार्य करने के तरीके बहुत समान हैं।';
  }

  @override
  String get compatibilitySummaryCompatibleElement => 'सामंजस्यपूर्ण संतुलन';

  @override
  String get compatibilityDescCompatibleElement =>
      'एक ऐसा रिश्ता जहाँ विभिन्न आकर्षण सामंजस्यपूर्ण रूप से एक साथ मिलते हैं।';

  @override
  String get compatibilitySummaryIncompatibleElement => 'विभिन्न आकर्षण';

  @override
  String get compatibilityDescIncompatibleElement =>
      'चूंकि आपके स्वभाव अलग हैं, इसलिए शुरुआत में यह अपरिचित लग सकता है, लेकिन एक-दूसरे को जानने में खुशी मिलती है।';

  @override
  String get compatibilitySummaryDefaultConstellation => 'औसत सामंजस्य';

  @override
  String get compatibilityDescDefaultConstellation =>
      'एक रिश्ता जो राशियों के आधार पर काफी हद तक मेल खाता है।';

  @override
  String get routineMorningTitle => 'एक ताज़ा सुबह! ☀️';

  @override
  String get routineMorningBody =>
      'क्या आप आज के लिए नियोजित नियमित मिशनों को भूल गए हैं?';

  @override
  String get routineEveningTitle => 'आज अच्छा काम किया! ✨';

  @override
  String get routineEveningBody =>
      'क्या आपने आज के सभी मिशन पूरे कर लिए हैं? अपनी दिनचर्या पूरी करें।';

  @override
  String get routineCheckTitle => 'आज के अपने मिशनों की जाँच करें! 🚀';

  @override
  String get routineCheckBody =>
      'नियमित मिशनों का पालन करें और अपने दिन को खुशनुमा बनाएं।';

  @override
  String get supplementNotificationTitle => 'सप्लीमेंट अनुस्मारक';

  @override
  String get waterNotificationTitle => 'पानी पीने का अनुस्मारक';

  @override
  String get routineNotificationTitle => 'दैनिक दिनचर्या सूचना';

  @override
  String get todaysFortuneNotificationTitle => 'आज का भाग्य';

  @override
  String get afternoonFortuneNotificationBody =>
      'आपके दोपहर के भाग्य के बारे में क्या? अभी जांचें!';

  @override
  String get morningFortuneNotificationBody =>
      'अपना भाग्य जांचें और ऊर्जा के साथ अपने दिन की शुरुआत करें!';

  @override
  String get fortunePassExpiryTitle => 'फॉर्च्यून पास आज समाप्त हो रहा है';

  @override
  String get fortunePassExpiryBody =>
      'आपकी फॉर्च्यून पास सदस्यता आज समाप्त हो रही है। लाभों का आनंद लेना जारी रखने के लिए नवीनीकृत करें!';

  @override
  String get takeNow => 'अभी लें';

  @override
  String get later => 'बाद में';

  @override
  String get turnOffAlarmAction => 'अलार्म बंद करें';

  @override
  String get todaysFortuneNotification => 'आज का राशिफल अधिसूचना';

  @override
  String get enableNotification => 'अधिसूचना सक्षम करें';

  @override
  String get fortuneNotificationDescription =>
      'निर्दिष्ट समय पर आपको आज के राशिफल के बारे में सूचित करता है।';

  @override
  String get morningNotificationTime => 'सुबह की अधिसूचना का समय';

  @override
  String get afternoonNotificationTime => 'दोपहर की अधिसूचना का समय';

  @override
  String get morningFortuneTitle => 'आज का भाग्य (सुबह)';

  @override
  String get afternoonFortuneTitle => 'आज का भाग्य (दोपहर)';

  @override
  String get type => 'प्रकार';

  @override
  String get supplementChannelDesc => 'सप्लीमेंट लेने की सूचनाओं के लिए चैनल।';

  @override
  String get waterChannelDesc => 'पानी पीने की आदत की सूचनाओं के लिए चैनल।';

  @override
  String get waterSummaryTitle => 'पानी पीने की अधिसूचना';

  @override
  String get dailyRoutineChannelDesc =>
      'दैनिक मिशन और आदत बनाने की सूचनाओं के लिए चैनल।';

  @override
  String get dailyRoutineSummaryTitle => 'दैनिक दिनचर्या अधिसूचना';

  @override
  String get missionChannelName => 'मिशन अधिसूचना';

  @override
  String get missionChannelDesc => 'सामान्य मिशन प्रदर्शन सूचनाओं के लिए चैनल।';

  @override
  String get fortuneChannelName => 'भाग्य अधिसूचना';

  @override
  String get fortuneChannelDesc => 'दैनिक भाग्य जाँच सूचनाओं के लिए चैनल।';

  @override
  String get subscriptionChannelName => 'सदस्यता अधिसूचना';

  @override
  String get subscriptionChannelDesc =>
      'फॉर्च्यून पास की समाप्ति और सदस्यता सूचनाओं के लिए चैनल।';

  @override
  String get alarmChannelName => 'अलार्म';

  @override
  String get alarmChannelDesc => 'जागने और मिशन प्रदर्शन अलार्म के लिए चैनल।';

  @override
  String get shareViaKakao => 'काकाओटॉक के माध्यम से साझा करें';

  @override
  String get shareViaSNS =>
      'अन्य एसएनएस (इंस्टाग्राम, ट्विटर, आदि) के माध्यम से साझा करें';

  @override
  String get checkDetailResult => 'विस्तृत परिणाम देखें';

  @override
  String get viewMyFortuneResult => 'मेरा भाग्य परिणाम देखें';

  @override
  String get takeSupplementNow => 'कृपया अपने सप्लीमेंट लें!';

  @override
  String get takeNowQuestion => 'क्या आप इसे अभी लेना चाहेंगे?';

  @override
  String get eatNow => 'अभी लें';

  @override
  String get eatLater => 'बाद में लें';

  @override
  String snoozeMessageGeneric(int minutes) {
    return 'मैं आपको $minutes मिनट में फिर से याद दिलाऊंगा।';
  }

  @override
  String get hours => 'घंटे';

  @override
  String get cheeringMessage4 => 'जोश भरी सुबह, सुखद शुरुआत!';

  @override
  String get cheeringMessage5 => 'मुस्कुराहट भरा दिन हो।';

  @override
  String get cheeringMessage6 => 'आज हिम्मत मत हारो!';

  @override
  String get cheeringMessage7 => 'आज आप भरपूर चमकेंगे।';

  @override
  String get cheeringMessage8 => 'मुझे लग रहा है कि कुछ अच्छा होने वाला है!';

  @override
  String get cheeringMessage9 => 'आज शानदार काम किया। एक ऊर्जावान शुरुआत!';

  @override
  String get cheeringMessage10 => 'खुशी हमेशा आपके साथ है।';

  @override
  String get cheeringMessage11 => 'मैं आज आपके सपनों का समर्थन करता हूँ।';

  @override
  String get cheeringMessage12 => 'ताज़गी भरी सुबह, सुखद दिन!';

  @override
  String get cheeringMessage13 => 'आज विजयी बनें!';

  @override
  String get cheeringMessage14 => 'आप जैसे हैं वैसे ही अनमोल हैं।';

  @override
  String get cheeringMessage15 => 'सुखद चीज़ों से भरा दिन हो।';

  @override
  String get cheeringMessage16 => 'मुझे आशा है कि आज आपका दिन चमक उठेगा!';

  @override
  String get cheeringMessage17 => 'आपकी मुस्कान दुनिया को रोशन करती है।';

  @override
  String get cheeringMessage18 => 'आज खुद के प्रति सच्चे रहें!';

  @override
  String get cheeringMessage19 => 'आज की शुरुआत धड़कते दिल के साथ करें।';

  @override
  String get cheeringMessage20 => 'एक शानदार दिन आपका इंतज़ार कर रहा है।';

  @override
  String get cheeringMessage21 => 'आज सकारात्मकता की शक्ति के साथ!';

  @override
  String get cheeringMessage22 => 'मैं आपके रास्ते का समर्थन करता हूँ।';

  @override
  String get cheeringMessage23 => 'आज को अपना सबसे अच्छा दिन बनाएं!';

  @override
  String get cheeringMessage24 => 'भाग्य आपके साथ हो!';

  @override
  String get cheeringMessage25 => 'आज का दिन सुखद हो।';

  @override
  String get cheeringMessage26 => 'आप यह कर सकते हैं!';

  @override
  String get cheeringMessage27 => 'आज की शुरुआत कृतज्ञता के साथ करें।';

  @override
  String get cheeringMessage28 => 'आपका मूल्य अनंत है।';

  @override
  String get cheeringMessage29 => 'आपका दिन मुस्कुराहट के साथ खिले।';

  @override
  String get cheeringMessage30 => 'अच्छे लोगों के साथ अच्छा समय बिताएं!';

  @override
  String get cheeringMessage31 => 'आज सपनों के एक कदम और करीब!';

  @override
  String get cheeringMessage32 => 'आज आप सबसे शानदार व्यक्ति हैं।';

  @override
  String get cheeringMessage33 => 'एक चमत्कारी दिन आएगा।';

  @override
  String get cheeringMessage34 => 'आज फुरसत में अपने दिन का आनंद लें।';

  @override
  String get cheeringMessage35 => 'आपके प्रयास आपको धोखा नहीं देंगे।';

  @override
  String get cheeringMessage36 => 'आज का दिन स्वस्थ हो।';

  @override
  String get cheeringMessage37 => 'आप प्यार पाने के लिए पैदा हुए हैं!';

  @override
  String get cheeringMessage38 => 'आज साहसी बनें!';

  @override
  String get cheeringMessage39 => 'एक उज्ज्वल भविष्य आपका इंतज़ार कर रहा है।';

  @override
  String get cheeringMessage40 => 'जुनून से भरा दिन हो!';

  @override
  String get cheeringMessage41 => 'मुझे आशा है कि आपका मन शांत होगा।';

  @override
  String get cheeringMessage42 => 'आज छोटी-छोटी खुशियाँ ढूँढें।';

  @override
  String get cheeringMessage43 => 'आप पहले से ही काफी अच्छा कर रहे हैं।';

  @override
  String get cheeringMessage44 => 'आज की शुरुआत उम्मीद के साथ करें।';

  @override
  String get cheeringMessage45 => 'आपकी दयालुता किसी के लिए बड़ी ताकत है।';

  @override
  String get cheeringMessage46 => 'आज का दिन उत्पादक हो।';

  @override
  String get cheeringMessage47 => 'आपके पास दुनिया बदलने की शक्ति है।';

  @override
  String get cheeringMessage48 => 'आज का दिन साफ़ हो!';

  @override
  String get cheeringMessage49 => 'अपनी चमक को दिल खोलकर बिखेरें।';

  @override
  String get cheeringMessage50 => 'आज के दिन को खुशियों से भर दें!';

  @override
  String get locationServiceDisabled => 'स्थान सेवाएँ अक्षम हैं।';

  @override
  String get locationPermissionDenied => 'स्थान की अनुमति अस्वीकार कर दी गई।';

  @override
  String get locationPermissionPermanentlyDenied =>
      'स्थान की अनुमति स्थायी रूप से अस्वीकार कर दी गई।';

  @override
  String get deleteMissionTitle => 'मिशन हटाएं';

  @override
  String get yesDelete => 'हाँ, हटाएँ';

  @override
  String get waterAlarmTitle => 'पानी पीने का समय! 💧';

  @override
  String get waterAlarmBody =>
      'आपकी सेहत के लिए एक गिलास ठंडा पानी कैसा रहेगा?';

  @override
  String get supplementAlarmBody => 'आज के लिए अपने सप्लीमेंट लेना न भूलें।';

  @override
  String get waterHabitChannelDesc => 'पानी पीने की आदत के लिए अधिसूचना चैनल।';

  @override
  String get pleaseSolveMath => 'कृपया समस्या का समाधान करें।';

  @override
  String detectedLabel(String labels) {
    return '[पहचाना गया: $labels]';
  }

  @override
  String get defaultSleepDuration => '7 घंटे 30 मिनट';

  @override
  String get year2026Name => 'ब्योंग-ओ वर्ष (लाल घोड़े का वर्ष)';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle पूछताछ] $title';
  }

  @override
  String get summary => 'सारांश';

  @override
  String get monthlySummary => 'मासिक सारांश';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month मासिक सफलता दर: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return '$month के लिए कोई रिकॉर्ड नहीं';
  }

  @override
  String get missionRecord => 'मिशन रिकॉर्ड';

  @override
  String get supplementRecord => 'पूरक रिकॉर्ड';

  @override
  String get timeSaleCatchChance => '50% छूट का मौका पकड़ो!';

  @override
  String get languageThai => 'थाई';
}
