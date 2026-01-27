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
  String get missionWakeUp => 'Alarm Mission';

  @override
  String get missionSupplement => 'Take Supplements';

  @override
  String get missionWater => 'Drink over 2L of Water';

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

  @override
  String get exactAlarmPermissionRequired =>
      'The \"Exact Alarm\" permission is required to sound the alarm at the correct time.';

  @override
  String get overlayPermissionRequired =>
      'The \"Display over other apps\" permission is required for full-screen notifications.';

  @override
  String get deleteAllAlarms => 'Delete All Alarms';

  @override
  String get noAlarms => 'No alarms registered.';

  @override
  String get lessThanAMinuteRemaining => 'Ringing in less than a minute';

  @override
  String hoursMinutesRemaining(int hours, int minutes) {
    return 'Ringing in ${hours}h ${minutes}m';
  }

  @override
  String minutesRemaining(int minutes) {
    return 'Ringing in ${minutes}m';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward => 'Daily Fortune Cookie Reward';

  @override
  String get missionRewardInfo =>
      '1 cookie for 5 successful missions, 2 for 10!';

  @override
  String get dailyMission => 'Daily Mission';

  @override
  String goalAchieved(int completed) {
    return '🎉 $completed/5 Goal Achieved!';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 Achieved';
  }

  @override
  String get myMissionRecord => 'My Mission Record';

  @override
  String get consecutiveSuccess => 'Consecutive';

  @override
  String get successRate30Days => 'Success Rate (30d)';

  @override
  String get totalSuccess => 'Total Success';

  @override
  String get inProgress => 'In Progress 🔥';

  @override
  String get resetMissions => 'Reset Missions';

  @override
  String get resetMissionsConfirm =>
      'Do you want to reset all challenge lists?\n(Excluding basic system missions)';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get addMission => 'Add Mission';

  @override
  String get completedMissions => 'Completed Missions';

  @override
  String get noCompletedMissionsHint =>
      'No completed missions yet. Reach today\'s mission goal.';

  @override
  String greeting(String userName) {
    return 'Hello, $userName';
  }

  @override
  String get welcomeFortune => 'Welcome to the mysterious world of fortune';

  @override
  String get luckyColor => 'Lucky Color';

  @override
  String get luckyItem => 'Lucky Item';

  @override
  String get luckyDirection => 'Lucky Direction';

  @override
  String get viewVariousFortunes => 'View Various Fortunes';

  @override
  String get todaysRecommendation => 'Today\'s Recommendation';

  @override
  String get checkTodaysFortune => 'Check Today\'s Fortune';

  @override
  String get todaysAdvice => 'Today\'s Advice';

  @override
  String get viewSpecificDateFortune => 'View Fortune for Specific Date';

  @override
  String get luckyNumberRecommendation => 'Lucky Number Recommendation';

  @override
  String get luckyNumber => 'Lucky Number';

  @override
  String get specificDateFortune => 'Specific Date Fortune';

  @override
  String get specialDayFortune => 'Special Day Fortune';

  @override
  String get newYearFortune => 'New Year Fortune';

  @override
  String get totalFortune2026 => '2026 Total Fortune';

  @override
  String get traditionalFortune => 'Traditional Fortune';

  @override
  String get traditionalSaju => 'Traditional Four Pillars Analysis';

  @override
  String get faceReading => 'Face Reading';

  @override
  String get missionFaceReading => 'Face Reading Mission';

  @override
  String get faceFate => 'Face Fate Destiny';

  @override
  String get compatibility => 'Compatibility';

  @override
  String get relationshipHarmony => 'Relationship Harmony';

  @override
  String get ohaengWood => 'Wood';

  @override
  String get ohaengFire => 'Fire';

  @override
  String get ohaengEarth => 'Earth';

  @override
  String get ohaengMetal => 'Metal';

  @override
  String get ohaengWater => 'Water';

  @override
  String get ohaengWoodSymbol => 'Wood';

  @override
  String get ohaengFireSymbol => 'Fire';

  @override
  String get ohaengEarthSymbol => 'Earth';

  @override
  String get ohaengMetalSymbol => 'Metal';

  @override
  String get ohaengWaterSymbol => 'Water';

  @override
  String get ohaengWoodExplanation =>
      'With a strong energy of Wood (Tree), you are full of growth and motivation, possessing a compassionate and enterprising nature.';

  @override
  String get ohaengFireExplanation =>
      'With a strong energy of Fire, you are passionate and polite, with a tendency to be active and fond of glamorous things.';

  @override
  String get ohaengEarthExplanation =>
      'With a strong energy of Earth, you have trust and tolerance, possessing a grave and unchanging nature.';

  @override
  String get ohaengMetalExplanation =>
      'With a strong energy of Metal, you have decisiveness and loyalty, possessing a cool-headed nature that values principles.';

  @override
  String get ohaengWaterExplanation =>
      'With a strong energy of Water, you have wisdom and flexibility, possessing a clever and highly adaptable nature.';

  @override
  String get cheonganGap => 'Gap';

  @override
  String get cheonganEul => 'Eul';

  @override
  String get cheonganByeong => 'Byeong';

  @override
  String get cheonganJeong => 'Jeong';

  @override
  String get cheonganMu => 'Mu';

  @override
  String get cheonganGi => 'Gi';

  @override
  String get cheonganGyeong => 'Gyeong';

  @override
  String get cheonganSin => 'Sin';

  @override
  String get cheonganIm => 'Im';

  @override
  String get cheonganGye => 'Gye';

  @override
  String get jijiJa => 'Rat';

  @override
  String get jijiChuk => 'Ox';

  @override
  String get jijiIn => 'Tiger';

  @override
  String get jijiMyo => 'Rabbit';

  @override
  String get jijiJin => 'Dragon';

  @override
  String get jijiSa => 'Snake';

  @override
  String get jijiO => 'Horse';

  @override
  String get jijiMi => 'Goat';

  @override
  String get jijiSin => 'Monkey';

  @override
  String get jijiYu => 'Rooster';

  @override
  String get jijiSul => 'Dog';

  @override
  String get jijiHae => 'Pig';

  @override
  String get jijiAnimalRat => 'Rat';

  @override
  String get jijiAnimalOx => 'Ox';

  @override
  String get jijiAnimalTiger => 'Tiger';

  @override
  String get jijiAnimalRabbit => 'Rabbit';

  @override
  String get jijiAnimalDragon => 'Dragon';

  @override
  String get jijiAnimalSnake => 'Snake';

  @override
  String get jijiAnimalHorse => 'Horse';

  @override
  String get jijiAnimalSheep => 'Sheep';

  @override
  String get jijiAnimalMonkey => 'Monkey';

  @override
  String get jijiAnimalRooster => 'Rooster';

  @override
  String get jijiAnimalDog => 'Dog';

  @override
  String get jijiAnimalPig => 'Pig';

  @override
  String get assetDefaultBackground => 'Default Background';

  @override
  String get assetFortuneyFriends => 'Fortuney Friends';

  @override
  String get assetMongchuny => 'Mongchuny';

  @override
  String get assetPanchuny => 'Panchuny';

  @override
  String get assetTochuny => 'Tochuny';

  @override
  String get assetHochuny => 'Hochuny';

  @override
  String get assetBear => 'Bear';

  @override
  String get assetMoon => 'Moon';

  @override
  String get assetBridge => 'Bridge';

  @override
  String get assetRoad => 'Road';

  @override
  String get assetSky => 'Sky';

  @override
  String get assetMinimalGray => 'Minimal Gray';

  @override
  String get assetDarkMode => 'Dark Mode';

  @override
  String get assetSoftBlue => 'Soft Blue';

  @override
  String get assetWarmBeige => 'Warm Beige';

  @override
  String assetCat(int number) {
    return 'Cat $number';
  }

  @override
  String assetDog(int number) {
    return 'Dog $number';
  }

  @override
  String assetSea(int number) {
    return 'Sea $number';
  }

  @override
  String get categoryCharacter => 'Character';

  @override
  String get categoryAnimal => 'Animal';

  @override
  String get categoryIllustration => 'Illustration';

  @override
  String get categoryLandscape => 'Landscape';

  @override
  String get categorySimple => 'Simple';

  @override
  String get alarmBackground => 'Alarm Background';

  @override
  String get random => 'Random';

  @override
  String get gallery => 'Gallery';

  @override
  String get selectSolidColor => 'Select Solid Color';

  @override
  String get deleteColor => 'Delete Color';

  @override
  String get deleteColorConfirm =>
      'Are you sure you want to delete this color from the list?';

  @override
  String get randomBackgroundDesc =>
      'A new background every time the alarm rings!';

  @override
  String get backgroundDeleted => 'Background image deleted.';

  @override
  String get pickFromDevice => 'Pick from device';

  @override
  String get alarmSaveError =>
      'Failed to save alarm. An unknown error occurred.';

  @override
  String errorOccurred(String error) {
    return 'Error occurred: $error';
  }

  @override
  String get openSettings => 'Open Settings';

  @override
  String get videoLoadFailed => 'Failed to load video\nTap to retry';

  @override
  String get itsTimeToWakeUp => 'Time to wake up!';

  @override
  String get dismissAlarm => 'Stop Alarm';

  @override
  String get slideToDismiss => 'Swipe to turn off';

  @override
  String snoozeInfo(int minutes, int count) {
    return '${minutes}m · $count';
  }

  @override
  String snoozeInfoUnlimited(int minutes) {
    return '${minutes}m · Unlimited';
  }

  @override
  String get noActiveAlarms => 'No active alarms';

  @override
  String get wealth => 'Wealth';

  @override
  String get love => 'Relationship';

  @override
  String get career => 'Career';

  @override
  String get health => 'Health';

  @override
  String get faceAnalysisBasic => 'Basic Face Analysis';

  @override
  String get insufficientDataOverallImpression =>
      'Limited data; interpreting based on overall impression.';

  @override
  String get noseStabilityWealthAccuracy =>
      'A clearer nose contour would improve wealth fortune accuracy.';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      'A clearer mouth contour would refine relationship fortune accuracy.';

  @override
  String get improveAnalysisQualityAdvice =>
      'Better lighting and facing the camera directly will improve analysis.';

  @override
  String get basicAnalysisDescription =>
      'This result is a general interpretation due to limited facial contour data.\nFor more specific scores, please retry in a brighter environment while facing the camera directly.';

  @override
  String get defaultDailyFortune =>
      'Start your day with a peaceful mind.\nA smile in the mirror will bring positive energy.\nA moment of calm may bring unexpected luck.';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '${vibe}Today, your $topKey luck is strongest, while your $bottomKey luck requires extra care.';
  }

  @override
  String get faceShapeVLine => 'V-line';

  @override
  String get faceShapeSquare => 'Square';

  @override
  String get faceShapeBalanced => 'Balanced';

  @override
  String get faceShapeRound => 'Round';

  @override
  String get faceShapeLong => 'Long';

  @override
  String get faceShapeOval => 'Oval';

  @override
  String get titleWealthOriented => 'Wealth-attracting face';

  @override
  String get titleLoveStrong => 'Romantic & charming face';

  @override
  String get titleCareerNotable => 'Natural leader face';

  @override
  String get titleStableEnergy => 'Stable & grounded face';

  @override
  String get faceAnalysisComplete => 'Face analysis complete!';

  @override
  String get chooseUnlockMethod =>
      'Choose a method below to unlock your hidden facial fortune.';

  @override
  String get watchAdForFreeResult => 'Watch ad for free';

  @override
  String get useTwoCookies => 'Use 2 Cookies';

  @override
  String get checkResult => 'View Results';

  @override
  String get aiAnalyzingFace => 'AI is analyzing your face...';

  @override
  String get faceRecognitionComplete => 'Recognition complete';

  @override
  String get extractingFeatures => 'Extracting features...';

  @override
  String get matchingFortuneData => 'Matching data...';

  @override
  String get adLoadFailedFreeUnlock =>
      'Ad failed to load. Results unlocked for free!';

  @override
  String get insufficientCookies => 'Not Enough Cookies';

  @override
  String get insufficientCookiesDesc =>
      'You don\'t have enough cookies.\nWatch an ad to check for free!';

  @override
  String get usingTwoCookiesToast => 'Using 2 Cookies to unlock results.';

  @override
  String get todaysFaceAnalysis => 'Today\'s Face Analysis';

  @override
  String totalScoreWithPoints(int score) {
    return 'Total Score: $score pts';
  }

  @override
  String get adLoadFailFreeAccess =>
      'Ad failed to load. Results unlocked for free!';

  @override
  String get insufficientCookiesTitle => 'Not Enough Fortune Cookies';

  @override
  String get insufficientCookiesMessage =>
      'You don\'t have enough fortune cookies.\nYou can earn more by completing missions or watching ads.';

  @override
  String get useCookiesSnackbar => 'Using 2 Cookies to check results.';

  @override
  String get faceAnalysisComplete_v2 => 'Face analysis is complete!';

  @override
  String get chooseMethodToViewResult =>
      'Choose a method below to check your hidden facial fortune.';

  @override
  String get watchAdForFree => 'Watch ad for free';

  @override
  String get useTwoCookies_v2 => 'Use 2 Cookies';

  @override
  String get viewResult => 'View Results';

  @override
  String get aiAnalyzingFace_v2 => 'AI is analyzing your face...';

  @override
  String get faceRecognitionComplete_v2 => 'Recognition complete';

  @override
  String get extractingFeatures_v2 => 'Extracting features...';

  @override
  String get matchingFortuneData_v2 => 'Matching data...';

  @override
  String get wealthLuck => '💰 Wealth';

  @override
  String get loveLuck => '❤️ Love';

  @override
  String get careerLuck => '💼 Career';

  @override
  String get healthLuck => '💪 Health';

  @override
  String get tojeongMonthlyGood_0 =>
      'A noble person from the east brings good news. Long-awaited plans will come to fruition.';

  @override
  String get tojeongMonthlyGood_1 =>
      'Wealth flows in like a spring. Worries disappear as everything goes smoothly.';

  @override
  String get tojeongMonthlyGood_2 =>
      'Efforts bear fruit and you receive congratulations. Promotion or great results are expected.';

  @override
  String get tojeongMonthlyGood_3 =>
      'Morning sun rises after a dark night. Hardship ends and happiness arrives.';

  @override
  String get tojeongMonthlyGood_4 =>
      'Unexpected windfall fills your pocket. Small investments lead to big profits.';

  @override
  String get tojeongMonthlyNeutral_0 =>
      'A peaceful daily life continues. It passes without special events.';

  @override
  String get tojeongMonthlyNeutral_1 =>
      'Contentment brings peace of mind. Enjoy small happiness.';

  @override
  String get tojeongMonthlyNeutral_2 =>
      'Take a rest in your busy life. Pay attention to health management.';

  @override
  String get tojeongMonthlyNeutral_3 =>
      'Maintain your current work rather than starting something new.';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'Communication is key. Be careful with words to avoid misunderstandings.';

  @override
  String get tojeongMonthlyCaution_0 =>
      'Be cautious in everything. Better safe than sorry.';

  @override
  String get tojeongMonthlyCaution_1 =>
      'Pay attention to health and avoid overexertion.';

  @override
  String get tojeongMonthlyCaution_2 =>
      'Avoid gossip and stay out of others\' business.';

  @override
  String get tojeongMonthlyCaution_3 =>
      'Excessive greed brings trouble. Live within your means.';

  @override
  String get tojeongMonthlyCaution_4 =>
      'Avoid money transactions as you might be disappointed in people you trust.';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      'New year\'s clear energy is with you. Plans will start smoothly.';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      'A helper appears early this year. Value your relationships.';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'A fresh start brings unexpected opportunities. Stay open-minded.';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      'Your focus and determination will lead to a significant breakthrough.';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      'Wisdom from the past will guide you through new challenges.';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      'Not yet the time. Build strength and wait for the opportunity.';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      'Old issues may resurface. Solve them head-on.';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      'Patience is your best ally this month. Observe and learn.';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      'Avoid hasty decisions. A better moment is approaching soon.';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      'Small steps today will lead to big gains in the future.';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      'Everything is reviving. Don\'t hesitate and take on challenges.';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      'New connections may begin. A positive mind brings good results.';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      'Growth is happening in unexpected areas. Embrace the change.';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      'Your energy is contagious. Lead with kindness and courage.';

  @override
  String get tojeongMonthlySpecial_3_4 =>
      'Spring brings a wave of creativity. Express your ideas freely.';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      'Wealth luck rises with warmth. Efforts lead to financial rewards.';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      'Good results in contracts or exams. Review carefully.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      'Stability in your career is highlighted. Keep up the good work.';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      'Financial planning now will yield great benefits later this year.';

  @override
  String get tojeongMonthlySpecial_4_4 =>
      'A fruitful partnership may develop. Collaborate for success.';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      'Harmony at home brings stability and joy.';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      'Kindness to others returns as blessings.';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'Peace and tranquility surround you. Cherish these moments.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      'Family bonds are strengthened through open communication.';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      'Your inner light shines brightly. Inspire those around you.';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      'Efforts are recognized. Opportunities for promotion or honor.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      'Strong active energy. Consider expansion or career change.';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'Your leadership skills are in demand. Take charge with confidence.';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      'A major goal is within reach. Stay focused on the finish line.';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      'New professional horizons are opening. Be ready to explore.';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      'Passion leads to performance. Bold moves achieve goals.';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      'Meet a helper or find new opportunities while traveling.';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      'Adventure calls. A change of scenery will refresh your spirit.';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      'Your enthusiasm attracts positive outcomes. Dream big.';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      'Dynamic energy fuels your progress. Keep moving forward.';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      'Patience pays off. Luck starts to open up gradually.';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      'Old problems find solutions. Use your wisdom.';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      'Steadiness and persistence will overcome any obstacle.';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      'Reflection brings clarity. Understand your true path.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      'Good news arrives from a distance. Be prepared for joy.';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      'Wealth and love are abundant like the harvest season.';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      'Better than expected results for your hard work.';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'Gratitude attracts more abundance. Share your success.';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      'Emotional fulfillment is at its peak. Enjoy the love.';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      'Your efforts are bearing sweet fruit. Celebrate your wins.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      'Honor rises and your name becomes known.';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      'Great results in intellectual activities. Focus on studies.';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      'Recognition for your expertise is coming. Speak your truth.';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'Academic or professional success is highly likely this month.';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      'Your influence is growing. Use it for the greater good.';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      'Time for wisdom and reflection. Prepare for the future.';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      'Financial stability, but avoid risky investments.';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      'Inner peace is found through meditation and quiet time.';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      'Strategic thinking now will set you up for a great next year.';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      'Trust your intuition. It will guide you to safety and success.';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      'Unexpected luck at year-end. Look forward to good news.';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      'Rewards for long-term efforts. A successful conclusion.';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      'The year ends on a high note. Be proud of your journey.';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      'New doors are opening as old ones close. Welcome the future.';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      'Generosity brings its own rewards. Spread holiday cheer.';

  @override
  String get todaysFaceFortune => 'Today\'s Face Fortune';

  @override
  String get detailedAnalysis => 'Detailed Analysis';

  @override
  String get eyeInsight => '👁️ Eye (Insight)';

  @override
  String get noseWealth => '👃 Nose (Wealth)';

  @override
  String get mouthLateLuck => '👄 Mouth (Late Luck)';

  @override
  String get overallAnalysisTitle => 'Overall Analysis';

  @override
  String get shareResultTitle => 'Today\'s Face Result';

  @override
  String shareResultDesc(String title) {
    return 'AI face analysis result.\n$title';
  }

  @override
  String get shareResultTotalScore => 'Total Score';

  @override
  String get shareResultWealth => 'Wealth Luck';

  @override
  String get shareResultLove => 'Love Luck';

  @override
  String get shareResultCareer => 'Career Luck';

  @override
  String get shareResultHealth => 'Health Luck';

  @override
  String get shareResultText => 'Share Result';

  @override
  String get wakeUpComplete => 'Wake up complete!';

  @override
  String get collapseOptions => 'Collapse Options';

  @override
  String get expandOptions => 'More Options';

  @override
  String get snoozeAlarm => 'Snooze Alarm';

  @override
  String get interval => 'Interval';

  @override
  String get maxSnoozeCount => 'Max Snooze Count';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get permissionRequired => 'Permission Required';

  @override
  String get exactAlarmFailMessage =>
      'Failed to register alarm. Exact alarm permission is off and needs setting.';

  @override
  String get batteryOptimFailMessage =>
      'Failed to register alarm. Battery optimization exception permission is missing.';

  @override
  String get overlayFailMessage =>
      'Failed to register alarm. Display over other apps permission is missing.';

  @override
  String get loadingDelay => 'Loading delay';

  @override
  String get loading => 'Loading...';

  @override
  String get previewFail => 'Preview failed';

  @override
  String get bgDefault => 'Default Background';

  @override
  String get bgFortuneFriends => 'Fortune Friends';

  @override
  String get bgMongChuni => 'Mongchuni';

  @override
  String get bgPanChuni => 'Panchuni';

  @override
  String get bgToChuni => 'Tochuni';

  @override
  String get bgHoChuni => 'Hochuni';

  @override
  String get bgBear => 'Bear';

  @override
  String get bgMoon => 'Moon';

  @override
  String get bgSea => 'Sea';

  @override
  String get bgBridge => 'Bridge';

  @override
  String get bgRoad => 'Road';

  @override
  String get bgSky => 'Sky';

  @override
  String get bgMinimalGray => 'Minimal Gray';

  @override
  String get bgDarkMode => 'Dark Mode';

  @override
  String get bgSoftBlue => 'Soft Blue';

  @override
  String get bgWarmBeige => 'Warm Beige';

  @override
  String get dateFormatMdyE => 'MMM d (E)';

  @override
  String get deleteAlarm => 'Delete Alarm';

  @override
  String get confirmDelete => 'Are you sure you want to delete?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get wealthLuckWithIcon => '💰 Wealth Luck';

  @override
  String get loveLuckWithIcon => '❤️ Love Luck';

  @override
  String get careerLuckWithIcon => '💼 Career Luck';

  @override
  String get healthLuckWithIcon => '💪 Health Luck';

  @override
  String get mouthFortune => '👄 Mouth (Maturity Luck)';

  @override
  String get comprehensiveAnalysis => 'Comprehensive Analysis';

  @override
  String get todaysFaceResult => 'Today\'s Face Analysis Result';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'This is the AI face analysis result.\n$title';
  }

  @override
  String get shareResult => 'Share Result';

  @override
  String get faceVibeSmile0 =>
      'Your bright smile spreads positive energy to everyone around you. ';

  @override
  String get faceVibeSmile1 =>
      'That radiant smile shows you\'re full of vibrant energy today. ';

  @override
  String get faceVibeSmile2 =>
      'Your gentle expression has a charming quality that attracts supportive people. ';

  @override
  String get faceVibeSmile3 =>
      'A confident smile will be your greatest asset in overcoming any obstacles today. ';

  @override
  String get faceVibeSmile4 =>
      'Your refreshing smile is clearing away stale energy, making room for good luck. ';

  @override
  String get faceVibeEye0 =>
      'Your sparkling eyes show a strong will to take charge of your day. ';

  @override
  String get faceVibeEye1 =>
      'Those sharp, focused eyes suggest keen judgment and intuition. ';

  @override
  String get faceVibeEye2 =>
      'Your clear, deep gaze reflects a sincere heart ready for good news. ';

  @override
  String get faceVibeEye3 =>
      'Your dignified look and steady gaze will command respect today. ';

  @override
  String get faceVibeEye4 =>
      'The passion in your eyes inspires trust and confidence in those around you. ';

  @override
  String get faceVibeNeutral0 =>
      'Your peaceful and stable expression brings a sense of inner calm. ';

  @override
  String get faceVibeNeutral1 =>
      'A calm complexion reflects your prudent and wise energy. ';

  @override
  String get faceVibeNeutral2 =>
      'Your balanced features suggest a smooth and steady day ahead. ';

  @override
  String get faceVibeNeutral3 =>
      'Your serious demeanor is perfect for making important decisions today. ';

  @override
  String get faceVibeNeutral4 =>
      'Your composed expression puts others at ease, favoring smooth cooperation. ';

  @override
  String get dailyFortuneWealth0 =>
      'With a strong focus on your features, a little organization will help your finances grow.';

  @override
  String get dailyFortuneWealth1 =>
      'Your wealth-related energy is high today. Take a moment to double-check your calculations for extra profit.';

  @override
  String get dailyFortuneWealth2 =>
      'Your balanced features suggest that careful attention to detail will lead to unexpected gains.';

  @override
  String get dailyFortuneWealth3 =>
      'Your complexion shows promising wealth luck. Small profits may appear in unexpected places.';

  @override
  String get dailyFortuneWealth4 =>
      'Your sharp focus today favors smart financial moves. It\'s a great day for investment or purchase decisions.';

  @override
  String get dailyFortuneWealth5 =>
      'You have a strong energy for attracting wealth. Try organizing your wallet or reviewing your accounts.';

  @override
  String get dailyFortuneWealth6 =>
      'Your features suggest a steady accumulation of wealth. Sincere efforts are beginning to pay off.';

  @override
  String get dailyFortuneWealth7 =>
      'Stable financial luck is on your side. Consistent saving will serve you better than big spending.';

  @override
  String get dailyFortuneWealth8 =>
      'Your keen observation will help you spot financial opportunities. Keep your ears open.';

  @override
  String get dailyFortuneWealth9 =>
      'A prosperous energy surrounds you. Generosity today will return to you as even greater abundance.';

  @override
  String get dailyFortuneLove0 =>
      'Your gentle expression suggests that being the first to reach out will soften any relationship tension.';

  @override
  String get dailyFortuneLove1 =>
      'A clear and honest look reduces misunderstandings. Sincerity is your best approach today.';

  @override
  String get dailyFortuneLove2 =>
      'Your bright complexion attracts supportive energy. Small acts of kindness will lead to great connections.';

  @override
  String get dailyFortuneLove3 =>
      'Your natural charm is especially noticeable today. Expect positive energy from new encounters.';

  @override
  String get dailyFortuneLove4 =>
      'Clear relationship energy helps resolve old conflicts and brings harmony.';

  @override
  String get dailyFortuneLove5 =>
      'Your approachable look opens hearts. Today, listening is your most powerful tool.';

  @override
  String get dailyFortuneLove6 =>
      'You have a face that naturally draws help. Don\'t hesitate to seek advice instead of worrying alone.';

  @override
  String get dailyFortuneLove7 =>
      'Your sincere gaze builds deep trust. Honoring your promises will lead to stronger bonds.';

  @override
  String get dailyFortuneLove8 =>
      'Harmonious energy fills your home and workplace. It\'s a day for laughter and joy.';

  @override
  String get dailyFortuneLove9 =>
      'The threads of connection are untangling beautifully. Express your gratitude to those you value.';

  @override
  String get dailyFortuneCareer0 =>
      'Your sharp focus will turn priorities into peak performance today.';

  @override
  String get dailyFortuneCareer1 =>
      'Your keen observation stands out. Keep decisions simple and execution steady.';

  @override
  String get dailyFortuneCareer2 =>
      'Clear energy in your eyes gives you the power to see every task through to the end.';

  @override
  String get dailyFortuneCareer3 =>
      'Your natural leadership is showing. Your opinions will carry significant weight today.';

  @override
  String get dailyFortuneCareer4 =>
      'Your judgment is at its peak. Even complex problems will find clear solutions today.';

  @override
  String get dailyFortuneCareer5 =>
      'Your efficient work style is being noticed. You\'re in a strong position for promotion or achievement.';

  @override
  String get dailyFortuneCareer6 =>
      'You have the perfect energy for starting new projects. Move forward with total confidence.';

  @override
  String get dailyFortuneCareer7 =>
      'Work efficiency is rising. It\'s a great day to tackle those postponed tasks.';

  @override
  String get dailyFortuneCareer8 =>
      'Creative ideas are flowing. Make it a habit to jot them down for future luck.';

  @override
  String get dailyFortuneCareer9 =>
      'Your persistence and patience will be rewarded today. Focus until the end for great results.';

  @override
  String get dailyFortuneHealth0 =>
      'A stable complexion suggests a quick recovery if you maintain a steady rhythm.';

  @override
  String get dailyFortuneHealth1 =>
      'Your facial vitality is strong. Keep a comfortable pace without overdoing it.';

  @override
  String get dailyFortuneHealth2 =>
      'Clear energy in your eyes and skin means a short rest will greatly boost your mood and focus.';

  @override
  String get dailyFortuneHealth3 =>
      'Your body\'s rhythm is in perfect harmony. Light exercise will make your energy even clearer.';

  @override
  String get dailyFortuneHealth4 =>
      'You\'re full of vibrant energy. You can power through the day without feeling drained.';

  @override
  String get dailyFortuneHealth5 =>
      'Physical and mental stability are highlighted. Meditation or deep breathing will boost your luck.';

  @override
  String get dailyFortuneHealth6 =>
      'Your resilience is high today. You\'ll bounce back quickly from any minor fatigue.';

  @override
  String get dailyFortuneHealth7 =>
      'Your healthy glow is noticeable. Expect compliments on your vibrant appearance today.';

  @override
  String get dailyFortuneHealth8 =>
      'A balanced diet and proper rest will strengthen your foundation of luck. Take care of your body.';

  @override
  String get dailyFortuneHealth9 =>
      'Fresh air and staying hydrated are your best medicines today. Enjoy your vitality.';

  @override
  String get dailyFortuneTipWealth0 =>
      'Check your spending and subscriptions one more time today.';

  @override
  String get dailyFortuneTipWealth1 =>
      'Avoid impulsive buys; sticking to what you truly need is a major win.';

  @override
  String get dailyFortuneTipWealth2 =>
      'Keep a record of financial discussions to prevent any future misunderstandings.';

  @override
  String get dailyFortuneTipWealth3 =>
      'Keep an eye out for small \'leaks\' in your budget.';

  @override
  String get dailyFortuneTipWealth4 =>
      'Temptation to spend is high today. Wait 10 minutes before making any purchase.';

  @override
  String get dailyFortuneTipWealth5 =>
      'Be cautious with large transactions today. Seek expert advice if needed.';

  @override
  String get dailyFortuneTipWealth6 =>
      'Clear up any outstanding debts or money owed to you today.';

  @override
  String get dailyFortuneTipWealth7 =>
      'Watch your wallet. There\'s a slight energy of loss or waste around you today.';

  @override
  String get dailyFortuneTipWealth8 =>
      'Prioritize practical gains over spending money just for appearances.';

  @override
  String get dailyFortuneTipWealth9 =>
      'Fair play is the way to keep your luck. Avoid looking for shortcuts or freebies.';

  @override
  String get dailyFortuneTipLove0 =>
      'If you\'re feeling on edge, take a breath before you respond to others.';

  @override
  String get dailyFortuneTipLove1 =>
      'A quick check-in is better than a long explanation if a misunderstanding arises.';

  @override
  String get dailyFortuneTipLove2 =>
      'Simply being on time will build significant trust today.';

  @override
  String get dailyFortuneTipLove3 =>
      'Get straight to the point to avoid unnecessary emotional drain.';

  @override
  String get dailyFortuneTipLove4 =>
      'Stay mindful of your manners, even with those you\'re closest to.';

  @override
  String get dailyFortuneTipLove5 =>
      'Try a compliment before a critique. It will open doors that were previously closed.';

  @override
  String get dailyFortuneTipLove6 =>
      'Think before you speak. Confirm important details in writing to be safe.';

  @override
  String get dailyFortuneTipLove7 =>
      'Staying out of other people\'s business is the best way to avoid rumors.';

  @override
  String get dailyFortuneTipLove8 =>
      'Keep it rational. Calm conversation is the key to healthy relationships today.';

  @override
  String get dailyFortuneTipLove9 =>
      'Double-check your schedule. Reliability is your most valuable asset today.';

  @override
  String get dailyFortuneTipCareer0 =>
      'Focus on finishing one task completely rather than starting several new ones.';

  @override
  String get dailyFortuneTipCareer1 =>
      'Progress is better than perfection. Aim for \'done\' rather than \'flawless\' today.';

  @override
  String get dailyFortuneTipCareer2 =>
      'Clear your head by finishing that one thing you\'ve been putting off.';

  @override
  String get dailyFortuneTipCareer3 =>
      'Focus on your own responsibilities to keep your stress levels low.';

  @override
  String get dailyFortuneTipCareer4 =>
      'Small errors can snowball. Don\'t skip your final review today.';

  @override
  String get dailyFortuneTipCareer5 =>
      'Respect different opinions to avoid friction with colleagues or bosses.';

  @override
  String get dailyFortuneTipCareer6 =>
      'Concentration might waver. Try working in 50-minute blocks with 10-minute breaks.';

  @override
  String get dailyFortuneTipCareer7 =>
      'Don\'t take on more than you can handle. Knowing your limits is a strength.';

  @override
  String get dailyFortuneTipCareer8 =>
      'Keep your professional and personal lives separate today.';

  @override
  String get dailyFortuneTipCareer9 =>
      'Double-check recipients and attachments before hitting \'send\'.';

  @override
  String get dailyFortuneTipHealth0 =>
      'Prioritize sleep and avoid overeating or too much caffeine today.';

  @override
  String get dailyFortuneTipHealth1 =>
      'Stretching your neck and shoulders will significantly reduce your fatigue.';

  @override
  String get dailyFortuneTipHealth2 =>
      'A short walk will clear your head and refresh your energy levels.';

  @override
  String get dailyFortuneTipHealth3 =>
      'A glass of water and a quick stretch will set a positive tone for your day.';

  @override
  String get dailyFortuneTipHealth4 =>
      'Give your eyes a break. Try to limit your screen time today.';

  @override
  String get dailyFortuneTipHealth5 =>
      'Warm up properly before any intense physical activity.';

  @override
  String get dailyFortuneTipHealth6 =>
      'Bring a light layer. You might be more sensitive to temperature changes today.';

  @override
  String get dailyFortuneTipHealth7 =>
      'Stick to light, healthy foods for the sake of your gut and skin.';

  @override
  String get dailyFortuneTipHealth8 =>
      'Sleep is your best medicine. Try to get to bed a bit earlier tonight.';

  @override
  String get dailyFortuneTipHealth9 =>
      'Listen to your favorite music or find a pleasant scent to keep stress at bay.';

  @override
  String get eyeAnalysisTypeSharp =>
      'Your sharp, clear eyes reflect quick judgment and strong determination.';

  @override
  String get eyeAnalysisTypeDeep =>
      'Your calm and deep gaze suggests a wise and thoughtful personality.';

  @override
  String get eyeAnalysisTypeBalanced =>
      'Your eyes show a perfect balance of emotion and reason, projecting a sense of stability.';

  @override
  String get eyeExpressionBright =>
      'Your bright eyes and warm smile create an inviting aura that naturally draws people to you.';

  @override
  String get eyeExpressionGentle =>
      'A gentle smile within your calm gaze reflects a quiet but strong charisma.';

  @override
  String get eyeExpressionStrong =>
      'Your intense, focused gaze symbolizes strong leadership and the drive to achieve your goals.';

  @override
  String get eyeExpressionSteady =>
      'Your calm and serious demeanor inspires trust and respect.';

  @override
  String get eyePostureTilt =>
      'A slightly tilted head can signal uncertainty; keeping your head held high and looking straight ahead will bring better focus and luck.';

  @override
  String get eyePostureStraight =>
      'Looking straight ahead projects confidence and clears your path for success.';

  @override
  String get noseInsufficient =>
      'Nose analysis is limited due to image clarity; providing a general interpretation.';

  @override
  String get noseWealthRich =>
      'A strong and well-defined nose suggests great potential for accumulating and protecting wealth.';

  @override
  String get noseWealthPlanner =>
      'A sharp, well-proportioned nose indicates a practical mind for managing and growing your finances.';

  @override
  String get noseWealthBalanced =>
      'Your balanced features suggest a steady and stable flow of financial luck.';

  @override
  String get mouthExpressionBlessing =>
      'Your upturned corners suggest a positive nature that naturally attracts good fortune and favor from others.';

  @override
  String get mouthExpressionReliable =>
      'A firm, closed mouth reflects reliability and a preference for action over empty words.';

  @override
  String get mouthExpressionLucky =>
      'A bright, open smile radiates positive energy, bringing luck to your relationships.';

  @override
  String get mouthExpressionOpen =>
      'Your open expression suggests honesty, but be mindful of your words in sensitive situations.';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'Today\'s focus is $topKey, and the point to be careful of is $bottomKey.';
  }

  @override
  String get overallVibeWealthRich =>
      'Your features radiate financial vitality, making this an excellent day to seize new opportunities.';

  @override
  String get overallVibeWealthSteady =>
      'A calm and steady focus will help you manage your finances wisely and build lasting wealth.';

  @override
  String get overallVibeLoveCharisma =>
      'Your bright smile naturally attracts positive people and helpful connections today.';

  @override
  String get overallVibeLoveTrust =>
      'Your sincere and steady gaze builds deep trust, making it a perfect time for meaningful connections.';

  @override
  String get overallVibeCareerSmart =>
      'Your sharp focus enhances your judgment, making it the perfect time for complex tasks or big decisions.';

  @override
  String get overallVibeCareerSteady =>
      'Your steady energy supports persistence; staying focused on your goals will lead to great results.';

  @override
  String get overallVibeHealth =>
      'Your clear complexion reflects a balanced internal rhythm, making it a great day for physical activities.';

  @override
  String get overallActionPrudent =>
      'Your composed expression suggests wisdom. Today, let your actions speak louder than your words.';

  @override
  String get overallActionConfident =>
      'A confident and open expression attracts positive results. Speak your mind with clarity and confidence.';

  @override
  String get adviceHealth0 =>
      'A healthy routine is the foundation of good luck. Avoid overcommitting yourself today.';

  @override
  String get adviceHealth1 =>
      'Pay attention to your body\'s needs. A short break now will lead to better results later.';

  @override
  String get adviceHealth2 =>
      'Stay hydrated and get enough rest; simplicity is the key to refreshing your luck.';

  @override
  String get adviceWealth0 =>
      'Be careful with your spending today. Double-check all expenses and contracts.';

  @override
  String get adviceWealth1 =>
      'Cutting back on minor expenses today is the first step toward building significant wealth.';

  @override
  String get adviceWealth2 =>
      'Waiting until tomorrow to make financial decisions may work in your favor.';

  @override
  String get adviceLove0 =>
      'A kind word and a gentle expression can improve your luck in relationships.';

  @override
  String get adviceLove1 =>
      'Being a good listener is the secret to winning over others today.';

  @override
  String get adviceLove2 =>
      'Maintaining courtesy even with those close to you will preserve your positive energy.';

  @override
  String get adviceCareer0 =>
      'Focus on one key goal today instead of trying to do everything at once.';

  @override
  String get adviceCareer1 =>
      'Don\'t rush. Taking things one step at a time is the quickest way to success.';

  @override
  String get adviceCareer2 =>
      'Consider the advice of others, but trust your intuition for the final decision.';

  @override
  String get sajuFortune2024Gap =>
      '🌿 2024 Year of the Wood Dragon (Yang Wood): \'A Year of New Beginnings and Growth\'\n\n2024 brings the energy of \'Peers\' and \'Windfalls.\' Like a new tree in a lush forest, this is a time for self-discovery and planning for the future.\n\n💼 [Career & Business]\nYour confidence and drive will be at their peak. You\'ll find opportunities to succeed in large projects through collaboration. If you\'ve been considering a career change or starting a business, now is the time. Stay open to others\' ideas to avoid becoming overly stubborn.\n\n💰 [Wealth]\nExpect opportunities for significant financial gain or unexpected windfalls. While wealth flows in, expenses may also rise, so careful asset management is key. Long-term investments are highly recommended.\n\n❤️ [Love & Relationships]\nA great time to expand your social circle. Singles may find an attractive partner, and couples will see their bonds deepen. Be mindful of potential rivalries in your personal life.\n\n⚠️ [Cautions]\nPrioritize your physical health and manage stress. Avoid making impulsive decisions based on overconfidence.';

  @override
  String get sajuFortune2024Eul =>
      '🌿 2024 Year of the Wood Dragon (Yin Wood): \'A Year of Growth through Collaboration\'\n\n2024 brings the energy of \'Competitors\' and \'Stable Wealth.\' Like ivy climbing a great tree, you will achieve more by working with others than by going it alone.\n\n💼 [Career & Business]\nNetworking is your greatest asset this year. You\'ll meet influential mentors who will help you gain recognition. Be prepared to share your success with those who helped you. This is a strong year for establishing your presence in competitive environments.\n\n💰 [Wealth]\nA stable and consistent income is expected. Your hard work will be rewarded, making it an ideal time for savings or real estate. Avoid lending money to friends or acquaintances to prevent future conflict.\n\n❤️ [Love & Relationships]\nYour social life will flourish, and your popularity will grow. While romance looks promising, honest communication is necessary to avoid misunderstandings. New connections will likely form through your existing social circles.\n\n⚠️ [Cautions]\nWatch out for stress-related headaches or nervous tension. Stay flexible in your interactions to avoid unnecessary friction with others.';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 2024 Year of the Wood Dragon (Yang Fire): \'A Year for Passion and Creative Wisdom\'\n\n2024 brings the energy of \'Intuition\' and \'Creativity.\' Like the sun breathing life into a forest, your original ideas and talents will shine brightly this year.\n\n💼 [Career & Business]\nYou will excel in specialized fields, especially those involving research, art, or technology. Your original approach will bring unique results. To succeed, focus on turning your many ideas into immediate action.\n\n💰 [Wealth]\nYour talents and ideas will be your primary source of income. Side projects or hobbies could turn into profitable ventures. Be sure to review all contracts and investment plans carefully to avoid potential losses.\n\n❤️ [Love & Relationships]\nYour charm and eloquence will be at their peak, making you a natural leader in social settings. You\'ll enjoy a vibrant romantic life with many memorable dates and events.\n\n⚠️ [Cautions]\nPay attention to your digestive and cardiovascular health. Stay active outdoors to help clear your mind if you feel overwhelmed by deep thoughts.';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 2024 Year of the Wood Dragon (Yin Fire): \'A Year of Inner Strength and Stability\'\n\n2024 brings the energy of \'Academic Success\' and \'Expression.\' Like a lamp illuminating a forest, this is a perfect year to focus on self-development, studies, or obtaining new certifications.\n\n💼 [Career & Business]\nSupport from mentors or seniors will improve your work environment, opening doors for promotions or transfers. Your ability to persuade others will be strong. Be mindful of your words to avoid being misunderstood by colleagues.\n\n💰 [Wealth]\nLuck is on your side regarding contracts and legal documents. Expect gains from real estate or career-related certifications. Focus on stable asset management and avoid impulsive purchases.\n\n❤️ [Love & Relationships]\nYour warm and polite demeanor will earn you the trust of those around you. Couples will experience a stable and nurturing period, making it a good year to plan for the future, including marriage.\n\n⚠️ [Cautions]\nTake care of your vision and manage mental fatigue. A humble attitude will help you avoid resentment from others who may be envious of your success.';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ 2024 Year of the Wood Dragon (Yang Earth): \'A Year of Responsibility and Growth\'\n\n2024 brings the energy of \'Authority\' and \'Peers.\' Like a great mountain standing firm in a forest, you will face new responsibilities that will ultimately lead to significant personal growth.\n\n💼 [Career & Business]\nYou\'ll be called upon to lead and handle challenging assignments. Competitive environments will provide the perfect stage to prove your skills. Persistence will be your greatest ally in achieving long-term success.\n\n💰 [Wealth]\nExpect some increase in your expenses this year. Focus on protecting your current assets rather than taking big risks. Be cautious with financial transactions involving friends or family, and plan your budget with a long-term view.\n\n❤️ [Love & Relationships]\nYour strong charisma will attract attention from others. However, be careful not to let stubbornness cause friction with your partner. This is a great year for deepening friendships and building strong bonds.\n\n⚠️ [Cautions]\nBeware of physical overwork, specifically digestive issues or muscle pain. Prioritize rest and stretching, and find a hobby to help relieve mental pressure.';

  @override
  String get sajuFortune2024Gi =>
      '🌾 2024 Year of the Wood Dragon (Yin Earth): \'A Year of Achievement and Harmony\'\n\n2024 brings the energy of \'Stability\' and \'Sharing.\' Like a fertile field bearing fruit, this will be a rewarding year where your social status rises and you gain well-deserved recognition.\n\n💼 [Career & Business]\nYou will be recognized for your hard work and may step into a significant new role. This is an exceptionally lucky year for employment and promotions. By following your principles, you will achieve results beyond your expectations.\n\n💰 [Wealth]\nA stable income and steady accumulation of wealth are in the cards. You may receive rewards for your past performance or honor. Be mindful of spending too much on others, and keep a balanced budget.\n\n❤️ [Love & Relationships]\nMarriage luck is strong this year. Singles may find a reliable partner for a serious relationship. Clear communication will help you gain support and affection from those around you.\n\n⚠️ [Cautions]\nMaintain regular eating habits and take care of your digestive health. Avoid getting too involved in other people\'s problems at the expense of your own well-being.';

  @override
  String get sajuFortune2024Gyeong =>
      '⚔️ 2024 Year of the Wood Dragon (Yang Metal): \'A Year of Innovation and Change\'\n\n2024 brings the energy of \'Windfalls\' and \'Intuition.\' Like a sharp sword clearing a path through a forest, you will break old patterns and embrace exciting new challenges.\n\n💼 [Career & Business]\nYour bold decisiveness and fresh ideas will lead to success in new ventures. You may find opportunities for travel or work abroad. Embrace change, but remember to coordinate with others to avoid unnecessary conflict within your team.\n\n💰 [Wealth]\nYour financial situation may see significant fluctuations. While there is potential for large profits, avoid speculative investments without a solid plan. Thorough analysis will be your best protection against losses.\n\n❤️ [Love & Relationships]\nYou\'ll have many opportunities to meet new people and expand your social life. Your curiosity in dating will be high, but try to maintain a serious and consistent attitude to build lasting connections.\n\n⚠️ [Cautions]\nPay attention to your respiratory and digestive health. Stay calm and avoid rushing into decisions to prevent accidents or mistakes caused by impatience.';

  @override
  String get sajuFortune2024Sin =>
      '💎 2024 Year of the Wood Dragon (Yin Metal): \'A Year of Recognition and Honor\'\n\n2024 brings the energy of \'Stable Wealth\' and \'Academic Success.\' Like a jewel discovered in a forest, your value will be recognized, and you will receive just rewards for your efforts.\n\n💼 [Career & Business]\nYour meticulous nature and sincerity will earn you deep trust. You may be put in charge of important projects or enjoy a promotion. This is a stable period where your plans will likely go exactly as intended.\n\n💰 [Wealth]\nYour financial outlook is stable and positive. Expect consistent income and success in savings or smart financial planning. You may also receive support or an inheritance from family or mentors.\n\n❤️ [Love & Relationships]\nYour polite and dignified manner will be very attractive to others. Trust will deepen in your romantic relationships, making this a great year for marriage or long-term commitments.\n\n⚠️ [Cautions]\nTake care of your skin and respiratory health. Don\'t let perfectionism cause unnecessary stress; remember to take time for yourself and relax.';

  @override
  String get sajuFortune2024Im =>
      '🌊 2024 Year of the Wood Dragon (Yang Water): \'A Year of Flexible Growth and Wisdom\'\n\n2024 brings the energy of \'Creativity\' and \'Authority.\' Like a vast sea nurturing a forest, your wisdom will help you solve difficult problems and expand your influence.\n\n💼 [Career & Business]\nYour creative problem-solving skills will be your greatest strength. You\'ll find breakthroughs in challenging situations and gain recognition for your abilities, especially in education, planning, or consulting. Manage your workload to avoid burnout.\n\n💰 [Wealth]\nThis is a good year to increase your income through your unique skills and talents. While wealth flows in, sudden expenses may arise, so it\'s wise to keep an emergency fund for peace of mind.\n\n❤️ [Love & Relationships]\nYour increased understanding and tolerance will help you maintain excellent relationships. Deep conversations will strengthen your romantic bonds. Singles are likely to find a partner who brings them a sense of comfort.\n\n⚠️ [Cautions]\nPay attention to your kidney and bladder health. Avoid taking on too many responsibilities at once, as overcommitting can affect your physical well-being.';

  @override
  String get sajuFortune2024Gye =>
      '💧 2024 Year of the Wood Dragon (Yin Water): \'A Year of Seizing New Opportunities\'\n\n2024 brings the energy of \'Innovation\' and \'Stability.\' Like a gentle rain reviving a forest, your voice will be heard, and you will find new opportunities to showcase your presence.\n\n💼 [Career & Business]\nYour communication skills and creative ideas will be highly effective, especially in marketing, PR, or the arts. Be mindful of how you handle authority to ensure your innovative ideas are well-received by your organization.\n\n💰 [Wealth]\nYour financial flow will be active this year. Quick thinking and wit will help you increase your income. Be careful with impulsive spending on luxury items, and focus on maintaining a balanced budget.\n\n❤️ [Love & Relationships]\nYour charm and conversational skills will make you very popular. In relationships, your honesty will be refreshing, but remember to choose your words carefully to avoid hurting those you care about.\n\n⚠️ [Cautions]\nWatch out for issues with blood circulation or urological health. Stay humble and avoid gossip to protect your reputation and maintain positive relationships.';

  @override
  String get sajuFortune2025Gap =>
      '🌿 2025 Year of the Wood Snake (Yang Wood): \'Growth through New Opportunities and Competition\'\n\n2025 brings the energy of \'Competitors\' and \'Productivity.\' Like a great tree growing alongside ivy, you will find success through synergy, though you must also navigate a year of healthy competition.\n\n💼 [Career & Business]\nYour activity and desire to express your ideas will be strong. This is a great year to showcase your talents to the world, especially for freelancers, artists, or those in sales. Build alliances with colleagues to turn potential rivals into collaborators.\n\n💰 [Wealth]\nWhile your financial flow is active, you may see money going out as quickly as it comes in. Be cautious of investment advice from friends or colleagues. In the long run, investing in your own growth or business expansion will be more rewarding than simply saving.\n\n❤️ [Love & Relationships]\nYour social life will be vibrant, and you\'ll meet many new people. Your charm will be highly effective in social settings. If you\'re interested in someone, be proactive in expressing your feelings, as you may face competition.\n\n⚠️ [Cautions]\nAvoid letting a competitive spirit lead to unnecessary conflict. With the active energy of the year, prioritize your physical stamina and stay safe while traveling.';

  @override
  String get sajuFortune2025Eul =>
      '🌿 2025 Year of the Wood Snake (Yin Wood): \'A Brilliant Leap Forward\'\n\n2025 brings the energy of \'Peers\' and \'Expression.\' Like flowers in full bloom under the sun, this will be a dynamic year where your unique personality and talents receive the recognition they deserve.\n\n💼 [Career & Business]\nYour creativity and artistic sense will be at their peak. You\'ll excel in roles that involve planning and presenting fresh ideas. This is a strong year for independence or leading new projects. Remember to coordinate with others to ensure your innovations are well-received.\n\n💰 [Wealth]\nExpect income generated from your wit and specialized skills. Side projects or creative activities may bring unexpected financial gains. Manage your budget carefully to avoid overspending on luxury items or entertainment.\n\n❤️ [Love & Relationships]\nYour charm will attract significant attention from others. While you\'ll enjoy a lively romantic life, be mindful of your stubbornness in relationships. Singles can look forward to a potentially life-changing meeting.\n\n⚠️ [Cautions]\nChoose your words carefully to avoid gossip or misunderstandings. Prioritize regular rest and sleep to manage your energy levels throughout the year.';

  @override
  String get sajuFortune2026Gap =>
      '🌳 2026 Byeong-oh Year Gap-Wood General Fortune: \'Flame of Passion, Maximization of Activity\'\n\n2026 is a year where the energy of \'Sik-sin\' (Productivity) and \'Sang-gwan\' (Expression) is very strong for you, a Gap-Wood. It is a situation where wood meets fire and burns vigorously, a period where your talent and expression burst out into the world without hesitation. Your presence is revealed even if you stay still, and your range of activities expands dramatically.\n\n💼 [Career & Business]\nIt is a very good time to start new projects or a business. Your ideas are realized, and you will be passionately immersed in work. You can achieve great results in fields that express yourself, such as art, broadcasting, sales, and education. However, you need to be cautious and double-check everything as you may make mistakes if you only run forward.\n\n💰 [Wealth]\nWealth follows as much as you are active. Income from business or side jobs may increase. However, as much as you earn, a lot of money may go out for investment or consumption. Investment for the future is good, but impulsive spending should be guarded against.\n\n❤️ [Love & Relationships]\nAppeal to the opposite sex with an honest and active attitude. Romantic luck heats up, but excessive emotional expression may burden the partner. It is also a year where children\'s luck enters very strongly.\n\n⚠️ [Precautions]\nIt is a year of extreme energy consumption. \'Burnout\' may come, so physical strength management is essential. Be careful of rumors caused by slips of the tongue, and try not to insist only on your own arguments.';

  @override
  String get sajuFortune2026Eul =>
      '🌸 2026 Byeong-oh Year Eul-Wood General Fortune: \'Brilliant Blooming, Full Flowering of Talent\'\n\n2026 is a year where \'Sang-gwan\' (Expression) is heavy for you, an Eul-Wood. It is a situation where flowers bloom under the hot sun, a period where your charm and talent reach their peak. You will be the protagonist who receives attention everywhere and taste brilliant achievements.\n\n💼 [Career & Business]\nUnconventional attempts that break existing frameworks succeed. You will stand out in design, fashion, beauty, and entertainment. You may receive promotion or scout offers at work, but be careful of friction with superiors. Your ability doubles in a free environment.\n\n💰 [Wealth]\nThe ability to create wealth becomes excellent. Your brand value rises and your worth increases. However, chasing glamour may lead to luxury or waste, so you must guard your wallet well.\n\n❤️ [Love & Relationships]\nPopularity with the opposite sex explodes. You will have a brilliant and passionate romance, but it may end shortly and intensely. Married people may have a lot to worry about regarding children.\n\n⚠️ [Precautions]\nEmotional ups and downs may become severe. If you cannot control your temper, hard-earned achievements may collapse. Have a law-abiding spirit to avoid legal issues or rumors.';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ 2026 Byeong-oh Year Byeong-Fire General Fortune: \'Two Suns, Intense Competition and Leap\'\n\n2026 is a year where \'Bi-gyeon\' (Friend) and \'Geob-jae\' (Competitor) are very strong for you, a Byeong-Fire. It is a situation where two suns appear in the sky, a period where pride and competitive spirit reach the sky. Subjectivity becomes strong, you hate any interference, and you push through your path with determination.\n\n💼 [Career & Business]\nIt is a luck to win and achieve in competitive places. You can increase the scale through partnership or collaboration, but conflicts may arise due to profit distribution issues. It is a good opportunity for freelancers or professionals to make their names widely known.\n\n💰 [Wealth]\nMoney comes in, but there are also large holes for it to go out. Money may go out due to siblings, friends, or colleagues. Guaranteeing or lending money is absolutely forbidden. It is better to invest in honor or growing power rather than saving money.\n\n❤️ [Love & Relationships]\nYou may meet a lover like a friend or develop from a friend to a lover. However, if you have a partner, be careful as a love triangle or competitor may appear.\n\n⚠️ [Precautions]\nDogmatic actions may cause resentment from those around you. \'Humility\' is the best tactic. Pay attention to cardiovascular disease or eye health.';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 2026 Byeong-oh Year Jeong-Fire General Fortune: \'Giant Flame, Expansion of Power\'\n\n2026 is a year of \'Geob-jae\' (Competitor) and \'Bi-gyeon\' (Friend) for you, a Jeong-Fire. Like a candle meeting a furnace, it is a period where your power becomes massive. You can achieve things that were impossible alone through help or cooperation from those around you.\n\n💼 [Career & Business]\nA strong driving force arises. You will have the wisdom to overwhelm competitors or turn them into your side. Opportunities to exercise leadership in team projects or organizational life will come. However, if you try to monopolize results, you may be betrayed, so a posture of sharing credit is necessary.\n\n💰 [Wealth]\nSpeculative tendencies become strong. You will pursue \'high risk, high return,\' and if lucky, you will touch a lot of money, but failure also has a large impact. Unexpected expenses may occur, so it is good to prepare an emergency fund.\n\n❤️ [Love & Relationships]\nThere is a high probability of meeting connections in social gatherings or group activities. Men should be careful as they may neglect their wives or girlfriends. Relationships with people around you become assets this year.\n\n⚠️ [Precautions]\nGreed leads to trouble. Refrain from unreasonable expansion or investment. Be careful of diseases caused by anger or stress.';

  @override
  String get sajuFortune2026Mu =>
      '🌋 2026 Byeong-oh Year Mu-Earth General Fortune: \'Patience and Preparation Amidst Intense Heat\'\n\n2026 is a year where the energy of \'Pyeon-in\' (Intuition) and \'Jeong-in\' (Knowledge) is strong for you, a Mu-Earth. It is like condensed energy just before a volcano erupts. It is the optimal time to fill your inner self and grow skills through study, art, and obtaining certifications.\n\n💼 [Career & Business]\nMental labor such as planning, research, and strategy establishment shines rather than active work. Document luck is good, so there are results in contracts or permit-related tasks. However, if you only think and postpone execution, you may miss opportunities, so bold decisiveness is also needed.\n\n💰 [Wealth]\nReal estate document luck is very strong. It is an opportunity to increase assets through sale or contract. Cash flow may be somewhat frustrating, but investment from a long-term perspective is promising.\n\n❤️ [Love & Relationships]\nInterference from mothers or superiors may increase. In romance, you will value mental communion, and connections with older people may be made.\n\n⚠️ [Precautions]\nToo many thoughts can lead to depression or lethargy. Outdoor activities or sweating through exercise help improve luck. As the ground cracks due to too much heat, be careful of dry skin or stomach disorders.';

  @override
  String get sajuFortune2026Gi =>
      '🌾 2026 Byeong-oh Year Gi-Earth General Fortune: \'Solid Foundation and Definite Support\'\n\n2026 is a year of \'Jeong-in\' (Knowledge) and \'Pyeon-in\' (Intuition) for you, a Gi-Earth. It is a situation where warm sunlight shines on the earth and ripens grains. It is a period of solidifying a stable foundation while receiving full support and love from superiors.\n\n💼 [Career & Business]\nYou will achieve the best results in everything related to study, such as promotion exams, certification exams, and degree attainment. At work, you will gain the trust of superiors and take on important positions. You will stand out in education, real estate, counseling, and welfare fields.\n\n💰 [Wealth]\nIt is a luck to hold documents. You may achieve the goal of owning a home or receive inheritance or gifts. Stable asset growth is possible, and it is a year where honor shines more than wealth.\n\n❤️ [Love & Relationships]\nIt is a year to be loved. You will receive dependable love from your lover or meet a partner with good conditions. Marriage luck also enters, and family life becomes harmonious.\n\n⚠️ [Precautions]\nIf you only try to receive, you may become lazy. A posture of sharing as much as you received is necessary. Discard dependency and grow self-reliance.';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ 2026 Byeong-oh Year Gyeong-Metal General Fortune: \'Birth of a Masterpiece Beyond Ordeal\'\n\n2026 is a year where \'Pyeon-gwan\' (Pressure) and \'Jeong-gwan\' (Authority) are very powerful for you, a Gyeong-Metal. It is a situation of melting raw ore in a furnace to make a masterpiece sword. There may be strong pressure and stress, but if you endure it, you will gain immense authority and honor.\n\n💼 [Career & Business]\nYou may take on positions with heavy responsibility or handle difficult projects. However, this is a process of testing you, and if successfully completed, your status rises instantly. It is an opportunity for promotion for those in public office, military, police, and legal fields.\n\n💰 [Wealth]\nIt is a luck of honor and titles rather than money. As status rises, wealth will naturally follow, but money going out for dignity maintenance or entertainment is also significant.\n\n❤️ [Love & Relationships]\nFor women, it is a luck where a charismatic and capable man appears. Men have strong children\'s luck. Relationships with work superiors or elders become important.\n\n⚠️ [Precautions]\nHealth management is the top priority. Be careful of diseases or accidents caused by overwork. Especially lungs and large intestines may weaken. Find ways to relieve stress.';

  @override
  String get sajuFortune2026Sin =>
      '💎 2026 Byeong-oh Year Sin-Metal General Fortune: \'Shining Jewel, Peak of Honor\'\n\n2026 is a year of \'Jeong-gwan\' (Authority) and \'Pyeon-gwan\' (Pressure) for you, a Sin-Metal. Like a jewel shining under lights, it is a period where your value is revealed to the world and honor is elevated. You have deep connections with upright and stable workplaces or organizations.\n\n💼 [Career & Business]\nJob hunting, promotion, and transfer luck are very good. You may also receive scout offers by being recognized for your skills. If you follow principles and handle work correctly, you will receive respect from everyone.\n\n💰 [Wealth]\nStable salary or fixed income is guaranteed. If you protect honor rather than chasing wealth, wealth will naturally follow. You can benefit from your husband or workplace.\n\n❤️ [Love & Relationships]\nIt is the best marriage and dating luck for women. You can meet an upright and capable spouse. Men gain children or have joyful events due to children.\n\n⚠️ [Precautions]\nToo much heat can melt the jewel. Excessive work or stress may cause nervousness. You may appear inflexible due to strong principle-oriented tendencies, so be careful.';

  @override
  String get sajuFortune2026Im =>
      '🌊 2026 Byeongo Year Im-Water General Fortune: \'A Dynamic Year of Expanding Activity Range\'\n\n2026 is a year where the energy of \'Pyeon-jae\' and \'Jeong-jae\' enters for you. It\'s like a huge sea circulating actively by receiving the sun\'s heat and moving towards the wide world. It will be a dynamic year where economic activities become vigorous and opportunities to touch large wealth come.\n\n💼 [Career & Business]\nBusiness acumen is maximized. A very good year to pioneer new markets or reap large profits from investments. Luck where activity range can expand beyond domestic to overseas. Bold decisions lead to great results, but detailed review is essential.\n\n💰 [Wealth]\nWealth luck reaches its peak. Unexpected windfalls or large-scale business profits are expected. If you ride the flow of money well, you can form large assets. However, management is important as money going out can be as large as money coming in.\n\n❤️ [Love & Relationships]\nSociability improves and many people of the opposite sex gather around with overflowing charm. A good time to enjoy active dating. In romantic relationships, you spend happy times enjoying fancy dates and trips. However, be careful as you may neglect partners due to a too busy schedule.\n\n⚠️ [Cautions]\nPay attention to kidney function or blood circulation. Also, wisdom to know how to be satisfied at an appropriate level is needed as excessive greed may lead to trouble.';

  @override
  String get sajuFortune2026Gye =>
      '💧 2026 Byeongo Year Gye-Water General Fortune: \'Gaining Practical Interests while Strengthening Internal Foundations\'\n\n2026 is a year where the energy of \'Jeong-jae\' and \'Pyeon-jae\' enters for you. It\'s like sunshine shining after sweet rain, making the land full of life and abundance. You will achieve economic stability based on stable income and find small happinesses.\n\n💼 [Career & Business]\nYou handle assigned tasks perfectly with sincerity and meticulousness. Display excellent ability in finance, accounting, or management tasks. Recognition and rewards follow when you do your best in assigned work rather than excessive greed. You can grow step by step while building skills in a stable environment.\n\n💰 [Wealth]\nWealth luck is very good. Steady and stable income occurs, and you enjoy the joy of increasing assets through financial technology or savings. Small but definite profits gather to give great reward. Frugal spending habits shine this year.\n\n❤️ [Love & Relationships]\nYou give deep trust to partners with kindhearted and meticulous consideration. You grow a small but warm love while sharing daily lives. Relationships are also smooth and peaceful. You will play the role of a trusted advisor to people around you.\n\n⚠️ [Cautions]\nPay attention to eye diseases or urological system health. Also, sometimes practice looking at the world with a wide perspective as you may miss the big flow by paying attention to too detailed things.';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 2025 Year of the Wood Snake (Yang Fire): \'Passion and Achievement\'\n\n2025 brings the energy of \'Academic Success\' and \'Peers.\' Like the sun meeting the warmth of the earth, this year you\'ll find strong support and the confidence to achieve your goals.\n\n💼 [Career & Business]\nSupport from mentors or reliable partners will help you reach new heights. This is a great year for academic pursuits or professional certifications. While collaboration will lead to success, be mindful that excessive competition doesn\'t strain your professional relationships.\n\n💰 [Wealth]\nSharing information with your network will lead to financial growth. Joint ventures or collaborative investments look promising. Avoid overspending for the sake of appearance or pride; focus on practical gains.\n\n❤️ [Love & Relationships]\nYour social circle will deepen, and you\'ll find comfort in friendships. In romantic relationships, a sense of familiarity and friendship will strengthen your bond. Balance your time between friends and your partner to maintain harmony.\n\n⚠️ [Cautions]\nPay attention to your heart and circulatory health. Stay calm and manage your emotions, as impulsive reactions could lead to unnecessary setbacks.';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 2025 Year of the Wood Snake (Yin Fire): \'Opportunities in Times of Change\'\n\n2025 brings the energy of \'Intuition\' and \'Competitors.\' Like a candle that continues to shine despite the wind, you will wisely overcome challenges and turn them into opportunities for success.\n\n💼 [Career & Business]\nYour original ideas and sharp intuition will shine. You\'ll find success in niche markets or specialized fields where others haven\'t looked. Be mindful of competition within your organization, and protect your ideas while maintaining good relationships.\n\n💰 [Wealth]\nExpect some fluctuations in your finances this year. A conservative approach to asset management is recommended, as unexpected expenses could arise. However, your professional skills will provide a stable source of income. Avoid risky financial transactions.\n\n❤️ [Love & Relationships]\nYou may find yourself being more reflective or passive in your romantic life. Trust is essential; try to approach your relationships with an open heart. Taking time for yourself will help you maintain your inner balance.\n\n⚠️ [Cautions]\nWatch out for stress-related fatigue or sleep issues. Practice mindfulness or light exercise to stay positive and clear-headed throughout the year.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ 2025 Year of the Wood Snake (Yang Earth): \'Wisdom and Maturity\'\n\n2025 brings the energy of \'Honor\' and \'Intuition.\' Like a great mountain embracing the warmth of the earth, this will be a year for deepening your knowledge while maintaining your social standing.\n\n💼 [Career & Business]\nYou\'re likely to step into a role of responsibility or find opportunities for promotion. By valuing principles and working sincerely, you\'ll earn significant recognition. This is also an excellent year for research or specialized studies. Stay open to new ideas to avoid becoming stuck in old patterns.\n\n💰 [Wealth]\nA stable income is expected. Focus on saving and careful asset management. Luck is on your side regarding real estate or legal documents, making it a good time for long-term investments. Avoid being swayed by risky temptations.\n\n❤️ [Love & Relationships]\nYour dignified and reliable manner will earn you the trust of others. This is a perfect time for couples to build a deeper, more serious relationship. If you\'re considering marriage, this is a great year to make specific plans.\n\n⚠️ [Cautions]\nTake care of your digestive health and skin. Don\'t let overthinking lead to indecision; listen to trusted advice to help you move forward with confidence.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 2025 Year of the Wood Snake (Yin Earth): \'Achieving Goals through Persistence\'\n\n2025 brings the energy of \'Authority\' and \'Academic Success.\' Like sunshine after a rain, this year will bring the recognition and honor you\'ve worked so hard to achieve.\n\n💼 [Career & Business]\nYour workload and responsibilities may increase, but you\'ll prove your leadership skills by overcoming these challenges with patience. Support from mentors or seniors will help you navigate difficult situations, leading to a great sense of accomplishment.\n\n💰 [Wealth]\nCareful budget management is essential this year, as you may face unexpected taxes or public fees. However, your steady efforts will likely be rewarded with bonuses or incentives. Persistence is your key to financial success.\n\n❤️ [Love & Relationships]\nYour responsible nature will be very attractive to others. Shared challenges will strengthen the bond between couples as you support each other. Even with a busy schedule, make time for meaningful communication with your partner.\n\n⚠️ [Cautions]\nAvoid burnout by prioritizing your physical health. Maintain a regular routine of healthy meals and exercise, and keep a positive mindset to manage stress effectively.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ 2025 Year of the Wood Snake (Yang Metal): \'Earning Honor and Practical Gains\'\n\n2025 brings the energy of \'Stable Wealth\' and \'Authority.\' Like raw metal being refined into a master sword, your hard work will be rewarded with both social status and financial gains.\n\n💼 [Career & Business]\nYour focus on results and strong drive will lead to significant achievements, especially in finance, management, or technology. You\'ll gain recognition for solving complex problems, though the increased responsibility may bring some pressure. Trust in your abilities and move forward boldly.\n\n💰 [Wealth]\nYour financial outlook is very positive. In addition to a stable income, you may see gains from side projects or smart investments. You\'ll have a keen eye for managing your assets efficiently. Avoid spending too much solely for the sake of your reputation.\n\n❤️ [Love & Relationships]\nYour sincere and reliable nature will be your greatest asset in relationships. You provide a sense of security for your partner with your responsible attitude. Try to add a touch of humor to your interactions to soften your professional image.\n\n⚠️ [Cautions]\nTake care of your respiratory health and joints. Don\'t let perfectionism cause unnecessary stress; remember to be kind to yourself as you strive for your goals.';

  @override
  String get sajuFortune2025Sin =>
      '💎 2025 Year of the Wood Snake (Yin Metal): \'Wisdom and Success in Times of Change\'\n\n2025 brings the energy of \'Windfalls\' and \'Honor.\' Like a fine jewel under a spotlight, your value will be recognized, and you\'ll experience both a rise in social status and unexpected financial gains.\n\n💼 [Career & Business]\nYour business acumen will be sharp, and you\'ll excel at capturing new opportunities. Bold challenges are likely to bring significant rewards. Within your organization, your rational judgment will earn you the trust of others and potentially a promotion.\n\n💰 [Wealth]\nFinancial luck is on your side this year. You may see unexpected gains from investments or family support. While wealth flows in, maintain a planned budget to avoid overspending on luxury items.\n\n❤️ [Love & Relationships]\nYou\'ll be the center of attention in social settings with your attractive presence. This is a very strong year for romance, with many people drawn to your charm. Couples can look forward to a passionate and meaningful year together.\n\n⚠️ [Cautions]\nPay attention to your respiratory and skin health. Maintain a humble attitude to ensure your confidence isn\'t mistaken for arrogance by those around you.';

  @override
  String get sajuFortune2025Im =>
      '🌊 2025 Year of the Wood Snake (Yang Water): \'Expanding Your Influence through Wisdom\'\n\n2025 brings the energy of \'Expression\' and \'Windfalls.\' Like a winding river nurturing a field, this will be a dynamic year for expanding your activities and achieving significant financial success through your unique talents.\n\n💼 [Career & Business]\nYour communication skills will be highly effective, especially in marketing, PR, or creative fields. This is the perfect time to commercialize your ideas and explore new markets. Stay professional in your interactions with authority to ensure your ideas are well-received.\n\n💰 [Wealth]\nYour financial situation will be active and promising. You\'ll find opportunities to earn money through your specialized skills and capture large financial gains. Remember to share your success with others to maintain your positive financial flow.\n\n❤️ [Love & Relationships]\nYour humor and charm will make you very popular. You\'ll enjoy a vibrant social life with many interesting dates. In relationships, variety and creativity will keep things exciting. Be mindful that your words are understood as intended to avoid simple misunderstandings.\n\n⚠️ [Cautions]\nTake care of your kidney and urological health. Prioritize rest and proper nutrition to maintain your energy levels as you expand your range of activities.';

  @override
  String get sajuFortune2025Gye =>
      '💧 2025 Year of the Wood Snake (Yin Water): \'A Year of Stability and Reward\'\n\n2025 brings the energy of \'Productivity\' and \'Stable Wealth.\' Like a gentle rain preparing the land for a rich harvest, your steady efforts will lead to lasting wealth and happiness.\n\n💼 [Career & Business]\nSincerity is your greatest strength this year. By fulfilling your responsibilities, you\'ll earn the deep trust of your colleagues. This is a great time to focus on your favorite projects and grow your expertise in a stable environment.\n\n💰 [Wealth]\nExpect a stable and comfortable financial year. You\'ll find satisfaction in steadily building your assets through careful planning. Abundance is the theme for your year; focus on safe investments and savings rather than taking risks.\n\n❤️ [Love & Relationships]\nYour warm-hearted and considerate nature will bring comfort to your partner. This is a year for nurturing your relationships with care and attention. Singles are likely to meet someone who shares their values and communicates well.\n\n⚠️ [Cautions]\nPay attention to your digestive health and maintain healthy eating habits. Find new ways to stay active and engaged to avoid becoming too comfortable or settled in your routine.';

  @override
  String get preparationForTomorrow => 'Preparation for Tomorrow';

  @override
  String get howToMeetMoreLuck => 'How to meet more luck';

  @override
  String get enterName => 'Please enter your name';

  @override
  String fortuneDateConfirm(String date) {
    return 'Would you like to check the fortune for $date?';
  }

  @override
  String get colorPurple => 'Purple';

  @override
  String get colorBlue => 'Blue';

  @override
  String get colorYellow => 'Yellow';

  @override
  String get colorRed => 'Red';

  @override
  String get colorGreen => 'Green';

  @override
  String get colorPink => 'Pink';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorWhite => 'White';

  @override
  String get colorBlack => 'Black';

  @override
  String get itemPerfume => 'Perfume';

  @override
  String get itemHandkerchief => 'Handkerchief';

  @override
  String get itemRing => 'Ring';

  @override
  String get itemWatch => 'Watch';

  @override
  String get itemGlasses => 'Glasses';

  @override
  String get itemHat => 'Hat';

  @override
  String get itemBook => 'Book';

  @override
  String get itemEarphones => 'Earphones';

  @override
  String get itemMirror => 'Mirror';

  @override
  String get itemPen => 'Pen';

  @override
  String get itemCoin => 'Coin';

  @override
  String get itemKey => 'Key';

  @override
  String get dirEast => 'East';

  @override
  String get dirWest => 'West';

  @override
  String get dirSouth => 'South';

  @override
  String get dirNorth => 'North';

  @override
  String get dirNorthEast => 'North-East';

  @override
  String get dirSouthEast => 'South-East';

  @override
  String get dirNorthWest => 'North-West';

  @override
  String get dirSouthWest => 'South-West';

  @override
  String get general => 'General';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get darkModeDescription =>
      'Enable dark mode for a more comfortable viewing experience.';

  @override
  String get alarmSettings => 'Alarm Settings';

  @override
  String get privacySettings => 'Privacy Settings';

  @override
  String get information => 'Information';

  @override
  String get notice => 'Notice';

  @override
  String get weatherConditionSunny => 'Sunny';

  @override
  String get weatherConditionPartlyCloudy => 'Partly Cloudy';

  @override
  String get weatherConditionCloudy => 'Cloudy';

  @override
  String get weatherConditionFoggy => 'Foggy';

  @override
  String get weatherConditionDrizzle => 'Drizzle';

  @override
  String get weatherConditionRainy => 'Rainy';

  @override
  String get weatherConditionFreezingRain => 'Freezing Rain';

  @override
  String get weatherConditionSnowy => 'Snowy';

  @override
  String get weatherConditionSnowGrains => 'Snow Grains';

  @override
  String get weatherConditionRainShowers => 'Rain Showers';

  @override
  String get weatherConditionSnowShowers => 'Snow Showers';

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
  String get faq => 'FAQ';

  @override
  String get sendFeedback => 'Send Feedback';

  @override
  String get feedbackDescription =>
      'Please share any feedback or suggestions regarding Fortune Alarm.\nYour input helps us improve.';

  @override
  String get reportCopyright => 'Report Copyright Infringement';

  @override
  String get copyrightDescription =>
      'If you believe that the content in Fortune Alarm infringes on copyright, please report it via email.\nWe will take immediate action after confirmation.';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy =>
      'Terms of Service and Privacy Policy\n\n1. General Provisions\n\nArticle 1 (Purpose)\nThe purpose of these Terms is to define the conditions and procedures for using the service provided by \'Fortune Alarm\' (hereinafter referred to as the \'Service\'), as well as the rights, obligations, and responsibilities of users and the developer.\n\nArticle 2 (Privacy Policy)\n\n1. Items and Method of Personal Information Collection\nThis Service can be used without membership registration and does not store or collect users\' personal information on a separate server.\nHowever, the following information may be generated and stored on the device during the use of the Service:\n- Alarm settings, mission completion records, fortune cookie acquisition history, etc.\n\n2. Information on Device Permission Usage\nThe Service uses the following permissions to the minimum extent necessary to provide the Service:\n- Notifications (Required): Used for alarm execution and fortune cookie notifications.\n- Exact Alarm & Battery Optimization Exclusion (Required): Used to ensure alarms ring on time even in power-saving mode.\n- Display Over Other Apps (Required): Used to display the alarm screen on the lock screen or while using other apps.\n- Camera (Optional): Used only for \'Object Snap\' mission; captured images are processed only on the device and are not transmitted to a server.\n\n3. Advertising Services and Data Processing\nThis Service uses Google AdMob to deliver advertisements for free service provision.\nGoogle may collect some non-personally identifiable information, such as Advertising ID (ADID), for personalized ad settings.\n- Google Privacy Policy: https://policies.google.com/privacy\n\nArticle 3 (Data Storage and Deletion)\nThis Service is a local app that stores data on the user\'s device.\nIf you delete the app, all data stored on the device (alarms, mission records, etc.) will be immediately deleted and cannot be recovered.\n\nArticle 4 (Disclaimer)\n1. The fortune information provided by this Service is for entertainment purposes only, and its accuracy or reliability is not guaranteed.\n2. The developer is not responsible if the alarm does not ring due to device setting changes (turning off notifications, battery optimization, etc.) or system errors.\n\nArticle 5 (Contact Information)\nIf you have any inconveniences or inquiries while using the Service, please contact us at the email below.\nEmail: seriessnap.co@gmail.com';

  @override
  String get alarmOptimization => 'Alarm Optimization';

  @override
  String get allOptimizationsCompleted => 'All settings optimized.';

  @override
  String get optimizationNeeded =>
      'Additional settings are required for accurate alarms.';

  @override
  String get optimizationDescription =>
      'To ensure your alarms ring on time, please allow the following permissions in your system settings.';

  @override
  String get allowNotificationPermission => 'Allow Notifications';

  @override
  String get notificationPermissionDescription =>
      'Enables notifications for alarms and fortune updates.';

  @override
  String get excludeBatteryOptimization => 'Exclude Battery Optimization';

  @override
  String get batteryOptimizationDescription =>
      'Prevents the system from delaying alarms to save power.';

  @override
  String get allowExactAlarm => 'Allow Exact Alarms';

  @override
  String get exactAlarmDescription =>
      'Ensures alarms trigger precisely at the scheduled time.';

  @override
  String get drawOverOtherApps => 'Display Over Other Apps';

  @override
  String get overlayDescription =>
      'Displays the alarm screen even on the lock screen or while using other apps.';

  @override
  String get allSettingsCompleted => 'All settings updated.';

  @override
  String get allowAllItems => 'Please enable all permissions.';

  @override
  String get manualSettingsInfo =>
      'You can manage these settings anytime in your Android system menu.';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get selectPhoto => 'Select Photo';

  @override
  String get selectAlarmBackground => 'Alarm Background';

  @override
  String get defaultLabel => 'Default';

  @override
  String get howToAdd => 'How to Add';

  @override
  String get addAssetInstructions =>
      'Add images to the \'assets/images/\' folder and update \'pubspec.yaml\'.';

  @override
  String get ringingNow => 'Alarm Ringing';

  @override
  String get setTime => 'Set Time';

  @override
  String get repeatDays => 'Repeat Days';

  @override
  String get repeatDaily => 'Repeat Daily';

  @override
  String get snoozeSettings => 'Snooze Settings';

  @override
  String get wakeUpAlarm => 'Alarm Mission';

  @override
  String get daySun => 'S';

  @override
  String get dayMon => 'M';

  @override
  String get dayTue => 'T';

  @override
  String get dayWed => 'W';

  @override
  String get dayThu => 'T';

  @override
  String get dayFri => 'F';

  @override
  String get daySat => 'S';

  @override
  String get daySunFull => 'Sunday';

  @override
  String get dayMonFull => 'Monday';

  @override
  String get dayTueFull => 'Tuesday';

  @override
  String get dayWedFull => 'Wednesday';

  @override
  String get dayThuFull => 'Thursday';

  @override
  String get dayFriFull => 'Friday';

  @override
  String get daySatFull => 'Saturday';

  @override
  String get missionRewardEarned =>
      'Great job! You\'ve completed 5 missions and earned a Fortune Cookie!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Well done! You\'ve completed $missions missions and earned $cookies Fortune Cookie(s)!';
  }

  @override
  String daysCount(int count) {
    return '$count days';
  }

  @override
  String get user => 'User';

  @override
  String get member => 'Member';

  @override
  String get manageSajuInfo => 'Manage Birth Info';

  @override
  String get freeCharge => 'Free Refill';

  @override
  String get fortunePass => 'Fortune Pass';

  @override
  String get unlimitedNotSubscribed => 'Subscription inactive';

  @override
  String get unlimitedInUse => 'Subscription active';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get manageSubscription => 'Manage Subscription';

  @override
  String get purchaseHistory => 'Purchase History';

  @override
  String get customerCenter => 'Support';

  @override
  String get noNewNotifications => 'No new notifications.';

  @override
  String get noPurchaseHistory => 'No purchase history.';

  @override
  String get none => 'None';

  @override
  String deleteConfirmMessage(String title) {
    return 'Do you want to delete \"$title\"?';
  }

  @override
  String get delete => 'Delete';

  @override
  String get notepad => 'Notepad';

  @override
  String get today => 'Today';

  @override
  String get yearView => 'Year';

  @override
  String get monthView => 'Month';

  @override
  String get weekView => 'Week';

  @override
  String get dayView => 'Day';

  @override
  String get noEvents => 'No events scheduled.';

  @override
  String get noSavedMemos => 'No saved memos or events.';

  @override
  String get holiday => 'Holiday';

  @override
  String get photo => 'Photo';

  @override
  String get drawing => 'Drawing';

  @override
  String get drawingTitle => 'Drawing';

  @override
  String get pencil => 'Pencil';

  @override
  String get marker => 'Marker';

  @override
  String get eraser => 'Eraser';

  @override
  String adjustThickness(String label) {
    return 'Adjust $label thickness';
  }

  @override
  String get sticker => 'Sticker';

  @override
  String get event => 'Event';

  @override
  String get memo => 'Memo';

  @override
  String get routineExercise => 'Exercise';

  @override
  String get routineHiking => 'Hiking';

  @override
  String get routineCleaning => 'Cleaning';

  @override
  String get routineTravel => 'Travel';

  @override
  String get routineDate => 'Date';

  @override
  String get routineConcert => 'Concert';

  @override
  String get routineMovie => 'Movie';

  @override
  String get routineMeeting => 'Meeting';

  @override
  String get howIsYourMoodToday => 'How is your mood today?';

  @override
  String get complete => 'Complete';

  @override
  String get amWithIcon => '☀️ AM';

  @override
  String get pmWithIcon => '🌙 PM';

  @override
  String get photoPermissionDescription =>
      'To add photos, you must allow photo access in settings.';

  @override
  String get goToSettings => 'Go to Settings';

  @override
  String get photoPermissionNeeded => 'Photo access permission is required.';

  @override
  String get fontSize => 'Font Size';

  @override
  String get fontFamily => 'Font';

  @override
  String get textColor => 'Text Color';

  @override
  String get textAlign => 'Alignment';

  @override
  String get alignLeft => 'Left';

  @override
  String get alignCenter => 'Center';

  @override
  String get alignRight => 'Right';

  @override
  String get edit => 'Edit';

  @override
  String get fontSettings => 'Font Settings';

  @override
  String get imageAddedFromKeyboard => 'Image added from keyboard.';

  @override
  String get cancelWriting => 'Cancel Writing';

  @override
  String get cancelWritingConfirm =>
      'There is content being written. Do you want to cancel and exit?';

  @override
  String get continueWriting => 'Continue Writing';

  @override
  String get title => 'Title';

  @override
  String get content => 'Content';

  @override
  String get selectTime => 'Select Time';

  @override
  String get noTime => 'No Time';

  @override
  String minutesLater(int minutes) {
    return '$minutes min later';
  }

  @override
  String get countLabel => 'Count';

  @override
  String timesCount(int count) {
    return 'Total $count times';
  }

  @override
  String get wakeUpMission => 'Wake-up Mission';

  @override
  String get alarmSound => 'Alarm Sound';

  @override
  String get gradualVolume => 'Gradual Volume';

  @override
  String get vibration => 'Vibration';

  @override
  String get alarmNameAndBackground => 'Alarm Name & Background';

  @override
  String get customStyle => 'Custom Style';

  @override
  String get alarmName => 'Alarm Name';

  @override
  String get enterAlarmName => 'Please enter alarm name';

  @override
  String get routineSummary => 'Routine Summary';

  @override
  String get alarmOn => 'Alarm ON';

  @override
  String get alarmOff => 'Alarm OFF';

  @override
  String get contentHint => 'Add content';

  @override
  String get addEvent => 'Add Event';

  @override
  String get manageItem => 'Manage Item';

  @override
  String get manageItemDescription =>
      'What would you like to do with this item?';

  @override
  String get noTitle => 'No Title';

  @override
  String get selectTitleColor => 'Select Title Color';

  @override
  String get save => 'Save';

  @override
  String get missionNone => 'No Mission';

  @override
  String get missionSnap => 'Object Snap';

  @override
  String get missionMath => 'Math Problem';

  @override
  String get missionFortune => 'Fortune';

  @override
  String get missionShake => 'Shake';

  @override
  String get missionFortuneCatch => 'Fortune Catch';

  @override
  String get missionNoDescription => 'Alarm will ring without a mission.';

  @override
  String get missionCameraDescription =>
      'Take a photo of the specified object to dismiss the alarm.';

  @override
  String get missionMathDescription =>
      'Solve math problems to wake up your brain.';

  @override
  String get missionFortuneDescription =>
      'Dismiss the alarm and check today\'s fortune.';

  @override
  String get missionShakeDescription =>
      'You must shake your phone to turn off the alarm.';

  @override
  String get missionFortuneCatchDescription => 'Catch the moving Fortuni!';

  @override
  String get missionWalk => 'Walk';

  @override
  String get missionWalkDescription => 'Walk to turn off the alarm!';

  @override
  String get missionFaceDescription => 'Keep your face in the frame for 5s.';

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
  String get missionHiddenButton => 'Memory Tiles';

  @override
  String get missionHiddenButtonDescription =>
      'Memorize the pattern of the tiles and tap them in order within 10 seconds.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Rapid Tap';

  @override
  String get missionTapSprintDescriptionShort =>
      'Tap quickly to fill the meter.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Tap $goalTaps+ times to fill the meter.';
  }

  @override
  String get missionTapSprintTapHere => 'Tap';

  @override
  String get missionTapSprintHint => 'The meter drains if you stop tapping!';

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
  String fortuneCatchTime(int seconds) {
    return 'Time: ${seconds}s';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'Best: ${seconds}s';
  }

  @override
  String get fortuneCatchAngryHint =>
      'Avoid the angry Fortuni to prevent penalties!';

  @override
  String get fortuneCatchInstruction =>
      'Catch the happy Fortuni and avoid the angry ones!';

  @override
  String fortuneCatchPointMinus(int points) {
    return '$points points deducted';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points points';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo Combo!';
  }

  @override
  String get difficulty => 'Difficulty';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyHard => 'Hard';

  @override
  String get problemCount => 'Number of Problems';

  @override
  String problemsCount(int count) {
    return '$count Problems';
  }

  @override
  String missionAnalyzing(int index, int total) {
    return 'Mission $index/$total Analyzing...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'Mission $index/$total: Point at the object in the guide.';
  }

  @override
  String get missionPointSink => 'Point at the sink.';

  @override
  String get missionPointRefrigerator => 'Point at the refrigerator.';

  @override
  String get missionPointScale => 'Point at the scale.';

  @override
  String get missionPointFace => 'Point at your face.';

  @override
  String get missionPointObjectGeneric => 'Point at the specified object.';

  @override
  String get missionRecognizeObject => 'Please recognize the object.';

  @override
  String get missionPerform => 'Please perform the mission.';

  @override
  String get initError => 'An error occurred during initialization.';

  @override
  String get analyzingNextTarget => 'Analyzing next target...';

  @override
  String get errorOccurredGeneric => 'Error occurred';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total Success!';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total Success! Matching success!';
  }

  @override
  String get escape => 'Escape';

  @override
  String get pointObjectClearly =>
      'Take a photo where the target is clearly visible';

  @override
  String get matchingSuccess => 'Matching Success!';

  @override
  String get missionComplete => 'Mission Complete!';

  @override
  String get allMissionsComplete => 'All Missions Complete!';

  @override
  String missionSnoozeMessage(int minutes) {
    return 'Mission Success! But it will ring again in $minutes minutes according to settings.';
  }

  @override
  String get showFace => 'Please show your face';

  @override
  String get keepWatching => 'Keep watching the screen';

  @override
  String get recognizingFaceForFortune =>
      'Recognizing face for physiognomy analysis';

  @override
  String get dataNotStored => 'Data is not stored';

  @override
  String get solveProblem => 'Please solve the problem.';

  @override
  String get correctAnswer => 'Correct answer!';

  @override
  String get wrongAnswerRetry => 'Wrong. Please try again.';

  @override
  String get correct => 'Correct!';

  @override
  String get walkToDismiss => 'Please walk while holding your smartphone';

  @override
  String get shakeCount => 'Shake Count';

  @override
  String shakeTimes(int count) {
    return '$count Shakes';
  }

  @override
  String tapTimes(int count) {
    return '$count Taps';
  }

  @override
  String missionNumber(int number) {
    return 'Mission $number';
  }

  @override
  String get soundBirds => 'Bird Sounds';

  @override
  String get shakeCountLabel => 'Number of Shakes';

  @override
  String missionIndex(int index) {
    return 'Mission $index';
  }

  @override
  String get ringtoneSelect => 'Select Ringtone';

  @override
  String get vibrationSelect => 'Select Vibration Pattern';

  @override
  String get selectMissionTitle => 'Select an alarm mission';

  @override
  String get ringtoneCategoryStandard => 'Standard';

  @override
  String get ringtoneCategoryCalm => 'Calm';

  @override
  String get ringtoneCategoryUpbeat => 'Upbeat';

  @override
  String get ringtoneCategoryLoud => 'Loud';

  @override
  String get noRingtones => 'No ringtones found.';

  @override
  String get photoPermissionRequired => 'Photo access permission is required.';

  @override
  String get deleteImage => 'Delete Image';

  @override
  String get longPressToDelete => 'Long press to delete.';

  @override
  String get videoLoadFail => 'Failed to load video\nTap to retry';

  @override
  String get existingCapturedImages => 'Existing Captured Images';

  @override
  String deleteCount(int count) {
    return 'Delete $count';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return 'Are you sure you want to delete $count images?\nThis action cannot be undone.';
  }

  @override
  String get defaultRingtone => 'Default Ringtone';

  @override
  String get classicAlarm => 'Classic Alarm';

  @override
  String get digitalAlarm => 'Digital Alarm';

  @override
  String get birdsSound => 'Birds Chirping';

  @override
  String get wavesSound => 'Ocean Waves';

  @override
  String get cuckooClock => 'Cuckoo Clock';

  @override
  String get calmAlarm => 'Calm Alarm';

  @override
  String get doorKnock => 'Door Knock';

  @override
  String get earlySunrise => 'Early Sunrise';

  @override
  String get goodMorningSound => 'Good Morning';

  @override
  String get inAHurry => 'In a Hurry';

  @override
  String get lovingYou => 'Loving You';

  @override
  String get sirenSound => 'Siren';

  @override
  String get swingingSound => 'Swinging';

  @override
  String get telephoneBusy => 'Telephone Busy';

  @override
  String get shortVibration => 'Short Repeat';

  @override
  String get longVibration => 'Long Repeat';

  @override
  String get heartbeatVibration => 'Heartbeat';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'Quick Beat';

  @override
  String get exactAlarmPermissionDesc =>
      'To ring the alarm at the exact time, \"Schedule & Reminders\" permission is required.';

  @override
  String get batteryOptimizationPermissionDesc =>
      'Battery optimization must be disabled for the alarm to ring on time.';

  @override
  String get overlayPermissionDesc =>
      'To display the mission screen when the alarm goes off, \"Display over other apps\" permission is required.';

  @override
  String get cameraMissionFirstImageError =>
      'Please set at least the first mission image.';

  @override
  String get retry => 'Retry';

  @override
  String get exactAlarmPermissionFail =>
      'Failed to register alarm. Exact alarm permission is disabled and needs to be set.';

  @override
  String get batteryOptimizationPermissionFail =>
      'Failed to register alarm. Battery optimization exception permission is missing and needs to be set.';

  @override
  String get overlayPermissionFail =>
      'Failed to register alarm. \"Display over other apps\" permission is missing and needs to be set.';

  @override
  String get unknownAlarmError =>
      'Failed to register alarm. An unknown error occurred.';

  @override
  String get resetTooltip => 'Reset';

  @override
  String get errorLoadingAlarm => 'Failed to load alarm information.';

  @override
  String get alarmNotFound => 'Alarm information not found.';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'Snooze Alarm ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'Turn Off Alarm';

  @override
  String get startMission => 'Start Mission';

  @override
  String get alarmSnooze => 'Snooze';

  @override
  String snoozeMinutesUnlimited(int minutes) {
    return '${minutes}m (Unlimited)';
  }

  @override
  String snoozeMinutesCount(int minutes, int current, int total) {
    return '${minutes}m ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => 'Fluttering Day';

  @override
  String get ringtone_cozy_day => 'Cozy Day';

  @override
  String get ringtone_sensible_day => 'Sensible Day';

  @override
  String get ringtone_play_with_me => 'Play with Me';

  @override
  String get ringtone_refreshing_day => 'Refreshing Day';

  @override
  String get ringtone_new_beginning => 'New Beginning';

  @override
  String get ringtone_self_love => 'Self Love';

  @override
  String get fortuneTitle => 'Check Fortune';

  @override
  String get fortuneMessage =>
      'Check your fortune results\nand get hidden gifts!';

  @override
  String get fortuneAdButton => 'Watch Ad and Check Results';

  @override
  String get fortuneLoadingMessage =>
      'Experience a special Tarot reading from our fortune teller.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Analyzing your selected Tarot card... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Think about today\'s energy\nand select 3 cards.';

  @override
  String fortuneSelectTitleDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(
      month,
      {
        '1': 'January',
        '2': 'February',
        '3': 'March',
        '4': 'April',
        '5': 'May',
        '6': 'June',
        '7': 'July',
        '8': 'August',
        '9': 'September',
        '10': 'October',
        '11': 'November',
        '12': 'December',
        'other': 'Month',
      },
    );
    return 'Think about the energy of $_temp0 $day\nand select 3 cards.';
  }

  @override
  String get fortuneNewYearButton => 'View 2026 New Year Fortune';

  @override
  String get loveFortune => 'Love';

  @override
  String get wealthFortune => 'Wealth';

  @override
  String get successFortune => 'Success';

  @override
  String get fortuneResultTitle => 'Here is your fortune result for today.';

  @override
  String fortuneResultTitleDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(
      month,
      {
        '1': 'January',
        '2': 'February',
        '3': 'March',
        '4': 'April',
        '5': 'May',
        '6': 'June',
        '7': 'July',
        '8': 'August',
        '9': 'September',
        '10': 'October',
        '11': 'November',
        '12': 'December',
        'other': 'Month',
      },
    );
    return 'Fortune for $_temp0 $day, $year';
  }

  @override
  String get startDayButton => 'Start Your Day';

  @override
  String get tarotName0 => 'The Fool';

  @override
  String get tarotName1 => 'The Magician';

  @override
  String get tarotName2 => 'The High Priestess';

  @override
  String get tarotName3 => 'The Empress';

  @override
  String get tarotName4 => 'The Emperor';

  @override
  String get tarotName5 => 'The Hierophant';

  @override
  String get tarotName6 => 'The Lovers';

  @override
  String get tarotName7 => 'The Chariot';

  @override
  String get tarotName8 => 'Strength';

  @override
  String get tarotName9 => 'The Hermit';

  @override
  String get tarotName10 => 'Wheel of Fortune';

  @override
  String get tarotName11 => 'Justice';

  @override
  String get tarotName12 => 'The Hanged Man';

  @override
  String get tarotName13 => 'Death';

  @override
  String get tarotName14 => 'Temperance';

  @override
  String get tarotName15 => 'The Devil';

  @override
  String get tarotName16 => 'The Tower';

  @override
  String get tarotName17 => 'The Star';

  @override
  String get tarotName18 => 'The Moon';

  @override
  String get tarotName19 => 'The Sun';

  @override
  String get tarotName20 => 'Judgement';

  @override
  String get tarotName21 => 'The World';

  @override
  String get tarotKeywords1 =>
      'Creation, Will, Ability, Realization, Versatility';

  @override
  String get tarotDescription1 =>
      'The magician is wearing a red robe, one hand pointing to the sky and the other to the ground, bringing heavenly power to the ground. There are four elements (staff, cup, sword, coin) on the table, which means you already have all the tools and abilities to achieve your goals.';

  @override
  String get tarotLoveMeaning1 =>
      'This is a time when your charm is at its peak and you are popular with others. If you\'re seeing someone or have a spark with someone, you can develop the relationship with your witty speech and lead.';

  @override
  String get tarotLoveDetail1 =>
      'It\'s a great opportunity to capture someone\'s heart as your charm and talent shine. If there\'s someone you like, don\'t hesitate to approach them actively. Your sense of humor and sensible conversation will delight the other person and allow you to lead the relationship proactively. If you\'re single, you may be approached by several people, and if you\'re in a relationship, the other person will be greatly moved if you lead the date plans or prepare an event. Win love with confidence.';

  @override
  String get tarotWealthMeaning1 =>
      'This is the right time to generate revenue using your abilities and skills. If you materialize the ideas in your head into reality, it will lead to financial results.';

  @override
  String get tarotWealthDetail1 =>
      'This is the time when your knowledge, skills, and ideas become money. Don\'t just settle for a salary; generate extra income through side jobs, two jobs, or freelance activities. Creative planning, sales ability, and speaking ability will be demonstrated excellently, resulting in higher-than-expected revenue. Since your judgment is likely to hit the mark in fund management, you will get good results if you proactively set up a financial plan and put it into practice.';

  @override
  String get tarotSuccessMeaning1 =>
      'Your work ability will be excellently demonstrated and recognized by those around you. If you have something planned, now is the time to put it into practice.';

  @override
  String get tarotSuccessDetail1 =>
      'You can stand out in your workplace or studies by making full use of your abilities. No matter what problem you face, you can solve it with your own wit and humor, and you will be recognized as a \'capable person\' by your colleagues or superiors. If you take the lead in a new project or give an important presentation, you can finish it successfully. Just as opportunities come to those who are prepared, you are already fully prepared. Believe in yourself and show off your skills confidently like a protagonist on stage.';

  @override
  String get policy => 'Terms and Privacy Policy';

  @override
  String get support => 'Support';

  @override
  String get defaultAlarmBehavior => 'Default Alarm Behavior';

  @override
  String get defaultAlarmVolume => 'Default Alarm Volume';

  @override
  String get defaultAlarmVolumeDescription =>
      'The default volume applied when creating a new alarm.';

  @override
  String get gradualVolumeDescription =>
      'Sets the alarm sound to gradually increase.';

  @override
  String get defaultVibration => 'Default Vibration';

  @override
  String get defaultVibrationDescription =>
      'Enables vibration by default when creating a new alarm.';

  @override
  String get defaultInterval => 'Default Interval';

  @override
  String get maxSnoozeCountLabel => 'Max Snooze Count';

  @override
  String get minutes => 'min';

  @override
  String get times => 'times';

  @override
  String cupsCount(int current, int goal) {
    return '($current/$goal cups)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current/$goal times)';
  }

  @override
  String get missionGym => 'Go to Gym';

  @override
  String get missionWorkout => 'Home Workout';

  @override
  String get missionDiary => 'Write Diary';

  @override
  String get missionBedMaking => 'Make the Bed';

  @override
  String get missionStretching => 'Stretching';

  @override
  String get missionReading => 'Reading 10min';

  @override
  String get missionPlanning => 'Plan the Day';

  @override
  String get missionBreakfast => 'Eat Breakfast';

  @override
  String get missionMeditation => 'Meditation 5min';

  @override
  String get missionLearnWords => 'Learn 5 Words';

  @override
  String get missionVentilation => 'Ventilation';

  @override
  String get missionCleaning => 'Cleaning room';

  @override
  String get missionGratitudeDiary => 'Gratitude Diary';

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
  String get selectionComplete => 'Selection Complete';

  @override
  String get selectVibration => 'Select Vibration Pattern';

  @override
  String get cameraMissionSequentialImageError =>
      'Please set mission images in order.';

  @override
  String get copyEmailAction => 'Copy Email Address';

  @override
  String get addMissionTitle => 'Add New Mission';

  @override
  String get recommendedMissionList => 'Recommended Missions';

  @override
  String get recommendedMissionDesc =>
      'Recommended missions for a healthy day.';

  @override
  String get all => 'All';

  @override
  String get allMissions => 'All Missions';

  @override
  String categoryMissions(Object category) {
    return '$category Missions';
  }

  @override
  String get deselectAll => 'Deselect All';

  @override
  String get selectAll => 'Select All';

  @override
  String get myCustomMissions => 'My Custom Missions';

  @override
  String get myCustomMissionsDesc => 'Add missions you\'ve created before.';

  @override
  String get createYourOwnMission => 'Create Your Own Mission';

  @override
  String get createYourOwnMissionDesc =>
      'Create a mission if you don\'t find what you want.';

  @override
  String get missionNameHint => 'Enter mission name (e.g. Go to gym)';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get getNotification => 'Get Notification';

  @override
  String get notificationTime => 'Notification Time';

  @override
  String get missionCategoryHealth => 'Health';

  @override
  String get missionCategoryStudy => 'Study';

  @override
  String get missionCategoryRoutine => 'Routine';

  @override
  String get missionCategoryHobby => 'Hobby';

  @override
  String get missionCategoryOther => 'Other';

  @override
  String get copyEmailSuccessMessage =>
      'Email address copied. Please paste it in your email app.';

  @override
  String get supportSubmitButton => 'Copy Inquiry and Send';

  @override
  String get shakePhone => 'Please shake your phone!';

  @override
  String version(String version) {
    return 'Version $version';
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
  String get weatherSource => 'Weather data provided by trusted services';

  @override
  String get locationPermissionTitle => 'Allow Location Permission';

  @override
  String get locationPermissionDesc =>
      'Required to display weather information.';

  @override
  String get hourlyForecast => 'Hourly Forecast';

  @override
  String get weeklyForecast => 'Weekly Forecast';

  @override
  String hourFormat(Object hour) {
    return '${hour}h';
  }

  @override
  String get noNotifications => 'No new notifications.';

  @override
  String get adLoadFailed => 'Ad failed to load';

  @override
  String get adLoading => 'Loading ad...';

  @override
  String get removeAds => 'Remove Ads';

  @override
  String get close => 'Close';

  @override
  String get exitQuestion => 'Do you want to exit?';

  @override
  String get exitApp => 'Exit';

  @override
  String get shareResultDescription =>
      'This is your fortune result analyzed by Fortune Alarm.';

  @override
  String get shareResultButton => 'Share Result';

  @override
  String get unknownTime => 'Unknown Time';

  @override
  String get adLoadError =>
      'Could not load the ad. Please try again in a moment.';

  @override
  String get adShowError =>
      'Could not display the ad. Please try again in a moment.';

  @override
  String earnCookies(int count) {
    return 'You\'ve earned $count fortune cookies! 🎉';
  }

  @override
  String get freePassAfterTimeout =>
      'Showing results for free without an ad! 🎉';

  @override
  String get adLoadDelay =>
      'Loading is delayed.\nPlease try again in a moment.';

  @override
  String get fortuneAccessTitle => 'Check Fortune';

  @override
  String get fortuneAccessSubtitle =>
      'Check your fortune results\nand get hidden gifts!';

  @override
  String get watchAdButtonText => 'Watch Ad for Free Results';

  @override
  String useCookiesButtonText(int count) {
    return 'Use $count Fortune Cookies';
  }

  @override
  String get adFailFreePass =>
      'Could not load the ad, so we\'ll let you through for free this time.';

  @override
  String get luckyNumberTitle => 'My Lucky Numbers';

  @override
  String get luckyNumberSubtitle => 'AI-powered lucky numbers for your day';

  @override
  String get luckyNumberGenerateButton => 'Generate Lucky Numbers';

  @override
  String get luckyNumberGuideText =>
      'Discover your own lucky numbers\nthrough Fortune Alarm\'s AI algorithm';

  @override
  String get luckyNumberAnalysisStep1 => 'Gathering fortune data...';

  @override
  String get luckyNumberAnalysisStep2 => 'Reviewing recent number patterns...';

  @override
  String get luckyNumberAnalysisStep3 => 'Evaluating number probabilities...';

  @override
  String get luckyNumberAnalysisStep4 => 'Studying geometric sequences...';

  @override
  String get luckyNumberAnalysisStep5 => 'Applying AI prediction weights...';

  @override
  String get luckyNumberAnalysisStep6 => 'Calculating optimal combinations...';

  @override
  String get luckyNumberAnalysisStep7 =>
      'Analysis complete! Generating numbers...';

  @override
  String get luckyNumberAnalysisFinal => 'Processing final data...';

  @override
  String get luckyNumberGenerating => 'Generating lucky numbers...';

  @override
  String get luckyNumberResultTitle => 'Lucky number generation complete';

  @override
  String get luckyNumberResultSubtitle => '6 numbers + bonus number';

  @override
  String get luckyNumberDisclaimer =>
      '* This service is for entertainment purposes. Numbers provided are for reference generated by AI algorithms and do not guarantee a win.';

  @override
  String get luckyNumberShareTitle => 'Today\'s Lucky Numbers';

  @override
  String get luckyNumberShareDescription =>
      'Lucky numbers analyzed by Fortune Alarm.';

  @override
  String luckyNumberSetLabel(String label) {
    return 'Set $label';
  }

  @override
  String get luckyNumberRegenerateButton => 'Regenerate numbers';

  @override
  String get luckyNumberFeatureAiTitle => 'AI Recommendation';

  @override
  String get luckyNumberFeatureAiDesc => 'Smart AI Algorithm';

  @override
  String get luckyNumberFeatureSmartTitle => 'Smart';

  @override
  String get luckyNumberFeatureSmartDesc => 'Personalized Recommendations';

  @override
  String get luckyNumberFeatureDataTitle => 'Data Analysis';

  @override
  String get luckyNumberFeatureDataDesc => 'Probability Analysis';

  @override
  String get fortunePassTitle => 'Fortune Pass Premium';

  @override
  String get fortunePassTabFree => 'Free Charge';

  @override
  String get fortunePassTabPremium => 'Fortune Pass';

  @override
  String get fortunePassFreeChargeTitle =>
      'Watch an ad to charge fortune cookies for free!';

  @override
  String get fortunePassFreeChargeButton => 'Watch Ad & Charge (+1)';

  @override
  String get fortunePassActivePlan => 'Current Subscription Plan';

  @override
  String get fortunePassNoSubscription => 'No Subscription Found';

  @override
  String get fortunePassRestore => 'Restore';

  @override
  String get fortunePassMonth1Title => '1 Month Subscription';

  @override
  String get fortunePassMonth1Desc => 'Monthly Plan';

  @override
  String get fortunePassMonth6Title => '6 Month Subscription';

  @override
  String get fortunePassMonth6Desc => '180 Days Plan';

  @override
  String get fortunePassYear1Title => '12 Month Subscription';

  @override
  String get fortunePassYear1Desc => '1 Year Plan';

  @override
  String get fortunePassBestPlan => 'Popular';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '$percent% Time Sale!';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% OFF';
  }

  @override
  String get fortunePassPerMonth => ' /mo';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return 'Total $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => 'Month';

  @override
  String get fortunePassUnit6Months => '6 Months';

  @override
  String get fortunePassUnitYear => 'Year';

  @override
  String get fortunePassMyCookies => 'My Fortune Cookies';

  @override
  String get fortunePassCurrentStatus => 'Pass Status';

  @override
  String get fortunePassStatusPremium => 'Premium Pass Active';

  @override
  String get fortunePassStatusFree => 'Free User';

  @override
  String get fortunePassStoreErrorTitle => 'Unavailable';

  @override
  String get fortunePassStoreErrorContent =>
      'Cannot retrieve product information from the store.\n\n[Checklist]\n1. Google Play / App Store Login\n2. Internet Connection\n3. Test Device Registration';

  @override
  String fortunePassSubscribeSale(int percent) {
    return 'Subscribe with $percent% OFF';
  }

  @override
  String get fortunePassSubscribeNow => 'Subscribe Now';

  @override
  String get fortunePassApplied => 'Fortune Pass subscription applied.';

  @override
  String get fortunePassApplyFailed =>
      'Failed to apply subscription. Check your network.';

  @override
  String get fortunePassRestored => 'Purchases restored.';

  @override
  String get fortunePassRestoreFailed => 'Failed to restore purchases.';

  @override
  String get fortunePassTimeSaleTitle => 'Wait! A gift has arrived 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return 'Original price ₩$price/year';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '₩$price/year';
  }

  @override
  String get fortunePassTimeSaleBadge =>
      '50% off if you subscribe within 3 minutes!';

  @override
  String get fortunePassTimeSaleButton => 'Get Discount and Start Pro';

  @override
  String get fortunePassTimeSaleCancel => 'Maybe next time';

  @override
  String get fortunePassTimeSaleStartMessage =>
      '3-minute discount has started! Check the top banner.';

  @override
  String get fortunePassSubscribeButton => 'Subscribe Now';

  @override
  String get fortunePassSubscribeDiscountButton => 'Subscribe with 50% Off';

  @override
  String get fortunePassCookieBalance => 'Your Fortune Cookies';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'Pass Active';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return 'Total ₩$price / $unit';
  }

  @override
  String get fortunePassPopularPlan => 'Popular Plan';

  @override
  String get fortunePassPricePerMonth => ' /mo';

  @override
  String get fortunePassPaymentFailed => 'Payment request failed.';

  @override
  String get fortunePassSubscriptionFailed =>
      'Failed to apply subscription. Please check your network.';

  @override
  String get fortunePassSubscriptionSuccess =>
      'Fortune Pass subscription has been applied.';

  @override
  String get fortunePassCannotSubscribeTitle => 'Cannot Subscribe';

  @override
  String get fortunePassCannotSubscribeMessage =>
      'Unable to retrieve product information from the store at this time.\n\n[Check List]\n1. Google Play / App Store login status\n2. Internet connection\n3. Test device registration status';

  @override
  String get year => 'Y';

  @override
  String get month => 'M';

  @override
  String get day => 'D';

  @override
  String get sajuProfileTitle => 'Edit Main Four Pillars of Destiny Profile';

  @override
  String get sajuNameLabel => 'Name';

  @override
  String get sajuNameHint => 'Please enter your name';

  @override
  String get sajuNameHelper => 'Up to 6 characters';

  @override
  String get sajuGenderLabel => 'Gender';

  @override
  String get sajuGenderMale => 'Male';

  @override
  String get sajuGenderFemale => 'Female';

  @override
  String get sajuBirthDateLabel => 'Birth Date';

  @override
  String get sajuBirthTimeLabel => 'Birth Time';

  @override
  String get sajuUnknownTime => 'Unknown Time';

  @override
  String get sajuEditComplete => 'Edit Complete';

  @override
  String get sajuSolar => 'Solar';

  @override
  String get sajuLunar => 'Lunar';

  @override
  String get sajuSelectBirthDate => 'Select Birth Date';

  @override
  String get sajuSelectBirthTime => 'Select Birth Time';

  @override
  String get compatibilityTitle => 'Check Compatibility';

  @override
  String get compatibilityInputHeader => 'Please enter information for both';

  @override
  String get compatibilityInputSubtitle =>
      'We will analyze the exact compatibility based on Four Pillars of Destiny information.';

  @override
  String get compatibilityMyInfo => 'My Information';

  @override
  String get compatibilityInputMyNameGuide => 'Please enter your name.';

  @override
  String get compatibilityInputPartnerNameGuide =>
      'Please enter partner\'s name.';

  @override
  String get compatibilityPartnerInfo => 'Partner\'s Information';

  @override
  String get compatibilityLoadSaved => 'Load Saved Info';

  @override
  String get compatibilityTitleBest => 'A match made in heaven! ❤️';

  @override
  String get compatibilityDescBest =>
      'The best compatibility you could ask for. Don\'t let each other go!';

  @override
  String get compatibilityTitleGreat => 'A very good relationship 💕';

  @override
  String get compatibilityDescGreat =>
      'A great partner who is a huge support to each other.';

  @override
  String get compatibilityTitleGood => 'A well-matched couple 😊';

  @override
  String get compatibilityDescGood =>
      'There are some differences, but you can have a beautiful love while adjusting to each other.';

  @override
  String get compatibilityTitleEffort => 'Effort is needed 🧐';

  @override
  String get compatibilityDescEffort =>
      'There are many differences. Understanding and consideration are key to the relationship.';

  @override
  String get compatibilityTitleDifficult => 'Need to adjust a lot 😅';

  @override
  String get compatibilityDescDifficult =>
      'Personality differences can be large. You need to deeply understand each other\'s differences.';

  @override
  String get compatibilityResultButton => 'View Compatibility Result';

  @override
  String get compatibilityDeleteTooltip => 'Delete';

  @override
  String get compatibilityGenderMale => 'Male';

  @override
  String get compatibilityGenderFemale => 'Female';

  @override
  String get tojeongInputTitle => 'Tojeong Yearly Oracle Information Input';

  @override
  String tojeongCheckFortune(int year) {
    return 'Check your $year\nTojeong Yearly Oracle';
  }

  @override
  String get tojeongInputGuide =>
      'Please enter your birth date and time\nfor an accurate analysis.';

  @override
  String tojeongViewResult(int year) {
    return 'View $year Tojeong Yearly Oracle';
  }

  @override
  String get tojeongCheckButton => 'Check Tojeong Yearly Oracle';

  @override
  String get tojeongSaveAndCheck => 'Save and View Tojeong Yearly Oracle';

  @override
  String get tojeongYearSelect => 'Select Fortune Year';

  @override
  String tojeongResultTitle(int year) {
    return '$year Tojeong Yearly Oracle';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return '$name\'s $year Fortune';
  }

  @override
  String tojeongGua(String gua) {
    return 'Gua: $gua';
  }

  @override
  String get tojeongTotalLuck => 'Total Luck';

  @override
  String get tojeongProcess => 'Process';

  @override
  String get tojeongResult => 'Result';

  @override
  String get tojeongMonthlyLuck => 'Monthly Fortune';

  @override
  String get tojeongShareResult => 'Share Results';

  @override
  String tojeongShareTitle(Object year) {
    return '$year Tojeong Yearly Oracle Results';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return '$name\'s Tojeong Yearly Oracle overall review.\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => 'Target Year';

  @override
  String get sajuDeleteTitle => 'Delete Four Pillars of Destiny Info';

  @override
  String sajuDeleteConfirm(String name) {
    return 'Are you sure you want to delete $name\'s info?';
  }

  @override
  String get sajuProfileSelect => 'Select Four Pillars of Destiny Info';

  @override
  String get add => 'Add';

  @override
  String get modify => 'Modify';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\nService is under preparation.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'We are working hard to provide you with\nmore accurate and useful fortune information!';

  @override
  String get goBack => 'Go Back';

  @override
  String get name => 'Name';

  @override
  String get nameInputGuide => 'Please enter your name';

  @override
  String get sajuLunarSolar => 'Solar/Lunar';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => 'Select Fortune Year';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'Select Profile';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get newYearFortuneInputTitle => 'New Year Fortune Info';

  @override
  String newYearFortuneHeader(int year) {
    return 'How will your $year\nfortune be?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'Please enter your birth date and time\nfor accurate Four Pillars of Destiny analysis.';

  @override
  String newYearFortuneViewButton(int year) {
    return 'View $year Fortune';
  }

  @override
  String get newYearFortuneCheckButton => 'Check Fortune';

  @override
  String get newYearFortuneSaveAndCheckButton => 'Save and View Fortune';

  @override
  String newYearFortuneResultTitle(int year) {
    return 'My $year New Year Fortune';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return 'My $year New Year Fortune Result';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return 'New Year fortune for $name.\n\n$desc...';
  }

  @override
  String get sajuChartTitle => 'Four Pillars of Destiny Chart';

  @override
  String get sajuHour => 'Hour';

  @override
  String get sajuDay => 'Day';

  @override
  String get sajuMonth => 'Month';

  @override
  String get sajuYear => 'Year';

  @override
  String get ohaengAnalysisTitle => 'Five Elements Analysis';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'Your Dominant Element: $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ Five Elements (Wood, Fire, Earth, Metal, Water) are the basic energies of Four Pillars of Destiny. While balance is ideal, you can understand your tendencies through these elements.';

  @override
  String yearlyTotalLuck(int year) {
    return '$year Total Luck';
  }

  @override
  String get fortuneDisclaimer =>
      'This fortune is for entertainment purposes. Your life depends on your own will.';

  @override
  String get compatibilityResultTitle => 'Compatibility Result';

  @override
  String get compatibilityScore => 'Compatibility Score';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => 'Our Compatibility';

  @override
  String get compatibilityShareResult => 'Share Result';

  @override
  String get compatibilityRetryButton => 'Check with Someone Else';

  @override
  String get compatibilitySummary => 'Summary';

  @override
  String get tojeongSaveAndCheckButton => 'Save and View Tojeong Yearly Oracle';

  @override
  String get tojeongSangsuKeyword1 =>
      'a period requiring strong drive and leadership';

  @override
  String get tojeongSangsuKeyword2 =>
      'a period full of active relationships and joy';

  @override
  String get tojeongSangsuKeyword3 =>
      'a period where intelligence and passion shine';

  @override
  String get tojeongSangsuKeyword4 =>
      'a period of rapid changes and new beginnings';

  @override
  String get tojeongSangsuKeyword5 =>
      'a period requiring a flexible attitude and soft communication';

  @override
  String get tojeongSangsuKeyword6 =>
      'a period to overcome difficulties with wisdom and patience';

  @override
  String get tojeongSangsuKeyword7 =>
      'a period to seek stability and build inner strength';

  @override
  String get tojeongSangsuKeyword8 =>
      'a period to build virtue with inclusivity and a warm heart';

  @override
  String get tojeongJungsuKeyword1 => 'you will encounter a helpful mentor';

  @override
  String get tojeongJungsuKeyword2 =>
      'you will find success in contracts and agreements';

  @override
  String get tojeongJungsuKeyword3 =>
      'you will face new and exciting challenges';

  @override
  String get tojeongJungsuKeyword4 =>
      'professional success and honor await you';

  @override
  String get tojeongJungsuKeyword5 =>
      'you should practice careful financial management';

  @override
  String get tojeongJungsuKeyword6 =>
      'you should prioritize your health and well-being';

  @override
  String get tojeongHasuKeyword1 => 'you will achieve significant success.';

  @override
  String get tojeongHasuKeyword2 =>
      'you will reap the rewards of your steady efforts.';

  @override
  String get tojeongHasuKeyword3 =>
      'you will turn challenges into opportunities through patience.';

  @override
  String tojeongCoreMessage(Object hasu, Object jungsu, Object sangsu) {
    return 'This year\'s journey: $sangsu, followed by $jungsu, leading to $hasu.';
  }

  @override
  String get tojeongSangsuDetail1 =>
      'You are supported by both heaven and earth. This is a year where your strong determination will lead to great achievements. Like a dragon ascending to the sky, your energy is vibrant and powerful. You\'ll have many chances to lead and gain recognition. Just remember to stay humble and inclusive to avoid unnecessary friction.';

  @override
  String get tojeongSangsuDetail2 =>
      'Like a stone creating ripples in a calm lake, this year will be full of social activity and joy. Your popularity will rise, but be mindful of your words to avoid gossip. You may meet a significant partner at a social gathering or event.';

  @override
  String get tojeongSangsuDetail3 =>
      'Like the sun shining upon the world, your intellect and passion will be at their peak. You\'ll excel in academic or creative pursuits, earning a great reputation. Stay calm and focused to manage your energy effectively and avoid burnout.';

  @override
  String get tojeongSangsuDetail4 =>
      'Expect rapid and exciting changes this year. Your enterprising energy makes it the perfect time to start new ventures. While you\'ll be busy with transitions, your persistence will be key to finishing what you start and achieving lasting results.';

  @override
  String get tojeongSangsuDetail5 =>
      'Like a gentle spring breeze reviving the land, your flexible attitude will help you overcome any obstacles. This is a great year for business and building new connections. Stay decisive to ensure you capture the best opportunities as they arise.';

  @override
  String get tojeongSangsuDetail6 =>
      'This year requires wisdom and patience, like navigating deep waters. While things may seem quiet, use this time to build your inner strength. Avoid risky investments and wait for the right moment to act; your patience will eventually be rewarded.';

  @override
  String get tojeongSangsuDetail7 =>
      'You may face challenges that feel like crossing a great mountain, but a vast plain of opportunity awaits on the other side. Focus on inner stability and maintaining your current progress. Building trust and staying consistent will lead to great fruit in the long run.';

  @override
  String get tojeongSangsuDetail8 =>
      'This is a time for sowing the seeds of your future success. By embracing others with a warm and patient heart, you will build a strong foundation of trust and respect. Your long-term investments and focus on family will bring lasting peace and prosperity.';

  @override
  String get tojeongJungsuDetail1 =>
      'A helpful mentor will appear, bringing positive news and opportunities. Any previous obstacles will resolve, and your financial outlook will improve. Collaboration will be your key to success this year.';

  @override
  String get tojeongJungsuDetail2 =>
      'You may experience joyful events within your family or home. This is a favorable time for legal documents, contracts, or sales. Maintain clear and kind communication to ensure all interactions remain positive.';

  @override
  String get tojeongJungsuDetail3 =>
      'New horizons await you, potentially through travel or work in new locations. Embrace these changes with confidence; your willingness to explore new opportunities will lead to rewarding results.';

  @override
  String get tojeongJungsuDetail4 =>
      'Your hard work will be recognized with honor or a promotion at work. This is an excellent time for exams or certifications. Showcase your abilities with confidence, and you\'ll achieve great success.';

  @override
  String get tojeongJungsuDetail5 =>
      'Your financial potential is strong, but so is the temptation to spend. Practice thorough money management and avoid impulsive purchases. It\'s wise to keep your financial dealings professional and clear.';

  @override
  String get tojeongJungsuDetail6 =>
      'Prioritize your physical and mental well-being this year. Avoid overworking and ensure you get plenty of rest. Taking proactive steps for your health now will prevent future issues and keep your energy high.';

  @override
  String get tojeongHasuDetail1 =>
      'Ultimately, your efforts will lead to success and your goals will be achieved. You will be rewarded for your hard work and admired by those around you. Stay true to your original vision to ensure your success lasts.';

  @override
  String get tojeongHasuDetail2 =>
      'You may face some challenges along the way, but your perseverance will lead you to your goal. The rewards of your hard work will be all the sweeter for the effort you put in. Success will bloom in its own time.';

  @override
  String get tojeongHasuDetail3 =>
      'Unexpected obstacles may arise, but your resilience will turn these challenges into opportunities. By staying calm and focused, you\'ll find that misfortune can be turned into a blessing. Wisdom is your greatest ally this year.';

  @override
  String get tojeongGeneralWealthGood =>
      'Wealth luck is good. Income may arise from unexpected places, or investments may yield good results. However, as much as money comes in, it can also go out, so focus on saving.';

  @override
  String get tojeongGeneralWealthBad =>
      'The flow of wealth may not be smooth. You should reduce unnecessary spending and develop a habit of saving. Be cautious with financial transactions and consult experts for investments.';

  @override
  String get tojeongGeneralCareerGood =>
      'Opportunities to gain recognition in your career or business will come. It\'s a good time for promotions, career changes, or starting a business. Better results can be achieved with good relationships.';

  @override
  String get tojeongGeneralCareerBad =>
      'It\'s best to maintain the current state. Focus on your current tasks and build your skills rather than starting new ventures. You might feel stressed in relationships with colleagues or superiors, so keep your mind at ease.';

  @override
  String get tojeongGeneralLoveGood =>
      'Love luck rises, so singles may meet a good partner and couples\' love will deepen. Laughter and harmony will fill the home. It\'s a good time for marriage talks.';

  @override
  String get tojeongGeneralLoveBad =>
      'Arguments may arise due to trivial misunderstandings. Understanding and consideration for each other\'s positions are needed. Try to resolve problems through rational dialogue rather than emotional responses.';

  @override
  String get optional => 'Optional';

  @override
  String get sajuSolarHint =>
      'Tojeong Yearly Oracle is most accurate when analyzed based on the lunar birthday.';

  @override
  String get yourFortune => 'Your Fortune';

  @override
  String get guaUpper => 'Upper';

  @override
  String get guaMiddle => 'Middle';

  @override
  String get guaLower => 'Lower';

  @override
  String get guaCode => 'Gua Code';

  @override
  String get viewAgain => 'Check Again';

  @override
  String get zodiacAries => 'Aries';

  @override
  String get zodiacTaurus => 'Taurus';

  @override
  String get zodiacGemini => 'Gemini';

  @override
  String get zodiacCancer => 'Cancer';

  @override
  String get zodiacLeo => 'Leo';

  @override
  String get zodiacVirgo => 'Virgo';

  @override
  String get zodiacLibra => 'Libra';

  @override
  String get zodiacScorpio => 'Scorpio';

  @override
  String get zodiacSagittarius => 'Sagittarius';

  @override
  String get zodiacCapricorn => 'Capricorn';

  @override
  String get zodiacAquarius => 'Aquarius';

  @override
  String get zodiacPisces => 'Pisces';

  @override
  String get elementFire => 'Fire';

  @override
  String get elementEarth => 'Earth';

  @override
  String get elementAir => 'Air';

  @override
  String get elementWater => 'Water';

  @override
  String get compatibilityCategoryZodiac => 'Zodiac Compatibility';

  @override
  String get compatibilityCategoryInner => 'Inner Compatibility';

  @override
  String get compatibilityCategoryConstellation =>
      'Constellation Compatibility';

  @override
  String get compatibilitySummarySamhap => 'Best Zodiac Match (Samhap)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return 'The $animal1 and $animal2 are a perfect match, complementing each other\'s weaknesses. This relationship creates great synergy when together.';
  }

  @override
  String get compatibilitySummaryYukhap => 'Great Zodiac Match (Yukhap)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return 'The $animal1 and $animal2 have a strong mutual attraction. It\'s easy to feel a connection from the very beginning.';
  }

  @override
  String get compatibilitySummaryChung =>
      'Relationship Requiring Effort (Chung)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return 'The $animal1 and $animal2 have different temperaments and may clash. Respecting each other\'s differences and showing consideration is necessary.';
  }

  @override
  String get compatibilitySummaryWonjin =>
      'Relationship Requiring Understanding (Wonjin)';

  @override
  String get compatibilityDescWonjin =>
      'This is a relationship where you might occasionally feel resentment or sadness without a clear reason. Frequent communication is recommended to reduce misunderstandings.';

  @override
  String get compatibilitySummaryDefaultZodiac => 'Average Zodiac Match';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return 'The $animal1 and $animal2 have a smooth relationship without major conflicts.';
  }

  @override
  String get compatibilitySummaryCheonganHap => 'Destined Soulmates';

  @override
  String get compatibilityDescCheonganHap =>
      'Your personalities and values are perfectly aligned. You are soulmates who understand each other even without words.';

  @override
  String get compatibilitySummarySangsaeng => 'Supportive Partnership';

  @override
  String get compatibilityDescSangsaeng =>
      'A positive relationship where you naturally support each other and help one another grow.';

  @override
  String get compatibilitySummarySanggeuk => 'Dynamic Balance Required';

  @override
  String get compatibilityDescSanggeuk =>
      'While there may be personality differences, you have the unique potential to complement each other\'s strengths and weaknesses.';

  @override
  String get compatibilitySummaryDefaultInner => 'Natural Friends';

  @override
  String get compatibilityDescDefaultInner =>
      'A relationship built on similar tendencies and shared interests, making your time together easy and comfortable.';

  @override
  String get compatibilitySummarySameElement => 'Meeting of Similar Minds';

  @override
  String compatibilityDescSameElement(String element) {
    return 'Sharing the \'$element\' tendency means your values and ways of acting are very much in sync.';
  }

  @override
  String get compatibilitySummaryCompatibleElement => 'Harmonious Balance';

  @override
  String get compatibilityDescCompatibleElement =>
      'A beautiful relationship where your different charms blend together in perfect harmony.';

  @override
  String get compatibilitySummaryIncompatibleElement =>
      'Fascinating Differences';

  @override
  String get compatibilityDescIncompatibleElement =>
      'Your different temperaments may feel unfamiliar at first, but they offer endless opportunities for growth and discovery together.';

  @override
  String get compatibilitySummaryDefaultConstellation => 'Average Harmony';

  @override
  String get compatibilityDescDefaultConstellation =>
      'A relationship that matches reasonably well based on zodiac signs.';
}
