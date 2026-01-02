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
  String get missionWakeUp => 'Wake-up Mission';

  @override
  String get missionSupplement => 'Take Supplements';

  @override
  String get missionWater => 'Drink 2L Water';

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
  String get todaysAdvice => 'Today\'s advice from the mysterious stars';

  @override
  String get viewSpecificDateFortune => 'View Fortune for Specific Date';

  @override
  String get lottoRecommendation => 'Lotto Number Recommendation';

  @override
  String get luckyNumber => 'Lucky Number';

  @override
  String get specificDateFortune => 'Specific Date Fortune';

  @override
  String get specialDayFortune => 'Special Day Fortune';

  @override
  String get newYearFortune => 'New Year Fortune';

  @override
  String get totalFortune2025 => '2025 Total Fortune';

  @override
  String get traditionalFortune => 'Traditional Fortune';

  @override
  String get traditionalSaju => 'Traditional Saju Analysis';

  @override
  String get faceReading => 'Face Reading';

  @override
  String get faceFate => 'Face Fate Destiny';

  @override
  String get compatibility => 'Compatibility';

  @override
  String get relationshipHarmony => 'Relationship Harmony';

  @override
  String get general => 'General';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get darkModeDescription => 'Set the screen to dark.';

  @override
  String get alarmSettings => 'Alarm Settings';

  @override
  String get information => 'Information';

  @override
  String get notice => 'Notice';

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
  String get faq => 'FAQ';

  @override
  String get sendFeedback => 'Send Feedback';

  @override
  String get feedbackDescription =>
      'Please let us know if you have any inconveniences or features you would like to suggest while using Fortune Alarm.\nYour valuable opinions make a better service.';

  @override
  String get reportCopyright => 'Report Copyright Infringement';

  @override
  String get copyrightDescription =>
      'If you believe that the content in Fortune Alarm infringes on copyright, please report it via email.\nWe will take immediate action after confirmation.';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get alarmOptimization => 'Alarm Sound Optimization';

  @override
  String get allOptimizationsCompleted => 'All optimization settings completed';

  @override
  String get optimizationNeeded => 'Settings are required for accurate alarms.';

  @override
  String get optimizationDescription =>
      'Alarms may be delayed or not sound due to Android system settings. Please set all items to allowed.';

  @override
  String get allowNotificationPermission => 'Allow Notification Permission';

  @override
  String get notificationPermissionDescription =>
      'Required to display notifications when an alarm occurs.';

  @override
  String get excludeBatteryOptimization => 'Exclude Battery Optimization';

  @override
  String get batteryOptimizationDescription =>
      'Ensures the alarm sounds immediately even in power saving mode.';

  @override
  String get allowExactAlarm => 'Allow Exact Alarm';

  @override
  String get exactAlarmDescription =>
      'Sounds the alarm on time without being delayed by the system.';

  @override
  String get drawOverOtherApps => 'Display Over Other Apps';

  @override
  String get overlayDescription =>
      'Displays the alarm screen even on the lock screen or while using other apps.';

  @override
  String get allSettingsCompleted => 'All settings are completed.';

  @override
  String get manualSettingsInfo =>
      'You can disable settings directly in Android system settings.';

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
      'Put the image in assets/images/ folder and register it in pubspec.yaml.';

  @override
  String get gallery => 'Gallery';

  @override
  String get ringingNow => 'Ringing Now';

  @override
  String get setTime => 'Set Time';

  @override
  String get repeatDays => 'Repeat Days';

  @override
  String get repeatDaily => 'Repeat Daily';

  @override
  String get snoozeSettings => 'Snooze Settings';

  @override
  String get interval => 'Interval';

  @override
  String get wakeUpAlarm => 'Wake-up Alarm';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval min, $count times';
  }

  @override
  String get daySun => 'Sun';

  @override
  String get dayMon => 'Mon';

  @override
  String get dayTue => 'Tue';

  @override
  String get dayWed => 'Wed';

  @override
  String get dayThu => 'Thu';

  @override
  String get dayFri => 'Fri';

  @override
  String get daySat => 'Sat';

  @override
  String get missionRewardEarned =>
      'Congratulations! You have completed 5 missions today and earned 1 Fortune Cookie!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Congratulations! You completed $missions missions today and earned $cookies Fortune Cookie(s)!';
  }

  @override
  String daysCount(int count) {
    return '$count days';
  }

  @override
  String get user => 'User';

  @override
  String get none => 'None';

  @override
  String minutesLater(int minutes) {
    return '$minutes min later';
  }

  @override
  String get countLabel => 'Count';

  @override
  String timesCount(int count) {
    return '$count times (Total $count)';
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
  String get alarmName => 'Alarm Name';

  @override
  String get enterAlarmName => 'Please enter alarm name';

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
  String get defaultVibration => 'Default Vibration';

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
  String get permissionRequired => 'Permission Required';

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
  String get cameraMissionSequentialImageError =>
      'Please set mission images in order.';

  @override
  String errorOccurred(String error) {
    return 'Error occurred: $error';
  }

  @override
  String get openSettings => 'Open Settings';

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
  String get fortuneTitle => 'Check Fortune';

  @override
  String get fortuneMessage =>
      'Check your fortune results\nand get hidden gifts!';

  @override
  String get fortuneAdButton => 'Watch Ad and Check Results';

  @override
  String get fortuneLoadingMessage =>
      'Experience the special tarot interpretation of the fortune teller.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Analyzing your selected tarot... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Think about today\'s energy\nand select 3 cards.';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return 'Think about the energy of $month/$day\nand select 3 cards.';
  }

  @override
  String get fortuneNewYearButton => 'View 2025 New Year Fortune';

  @override
  String get loveFortune => 'Love';

  @override
  String get wealthFortune => 'Wealth';

  @override
  String get successFortune => 'Success';

  @override
  String get fortuneResultTitle => 'Here is your fortune result for today.';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return 'Fortune for $year/$month/$day';
  }

  @override
  String get startDayButton => 'Start Your Day';

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
  String get missionEnglishWords => 'Learn 5 Words';

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
  String get copyEmailAction => 'Copy Email Address';

  @override
  String get copyEmailSuccessMessage =>
      'Email address copied. Please paste it in your email app.';

  @override
  String get supportSubmitButton => 'Copy Inquiry and Send';

  @override
  String get shakePhone => 'Please shake your phone!';

  @override
  String get englishQuizMission => 'English Quiz Mission';

  @override
  String get quizInstruction =>
      'Tap the word on the left and the meaning on the right in order to match them.';

  @override
  String get missionSuccess => 'Mission Success!';

  @override
  String get goHome => 'Go Home';

  @override
  String get quizWord1 => 'Apple';

  @override
  String get quizWord1Ans => 'apple';

  @override
  String get quizWord2 => 'Banana';

  @override
  String get quizWord2Ans => 'banana';

  @override
  String get quizWord3 => 'School';

  @override
  String get quizWord3Ans => 'school';

  @override
  String get quizWord4 => 'Computer';

  @override
  String get quizWord4Ans => 'computer';

  @override
  String get quizWord5 => 'Water';

  @override
  String get quizWord5Ans => 'water';

  @override
  String get quizWord6 => 'Friend';

  @override
  String get quizWord6Ans => 'friend';

  @override
  String get quizWord7 => 'Family';

  @override
  String get quizWord7Ans => 'family';

  @override
  String get quizWord8 => 'House';

  @override
  String get quizWord8Ans => 'house';

  @override
  String get quizWord9 => 'Book';

  @override
  String get quizWord9Ans => 'book';

  @override
  String get quizWord10 => 'Love';

  @override
  String get quizWord10Ans => 'love';

  @override
  String get quizWord11 => 'Sun';

  @override
  String get quizWord11Ans => 'sun';

  @override
  String get quizWord12 => 'Moon';

  @override
  String get quizWord12Ans => 'moon';

  @override
  String get quizWord13 => 'Sea';

  @override
  String get quizWord13Ans => 'sea';

  @override
  String get quizWord14 => 'Sky';

  @override
  String get quizWord14Ans => 'sky';

  @override
  String get quizWord15 => 'Tree';

  @override
  String get quizWord15Ans => 'tree';

  @override
  String get missionComplete => 'Mission Complete!';

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
  String get weatherSource =>
      'Provided by Meteorological Administration, Korea Environment Corporation';

  @override
  String get locationPermissionTitle => 'Allow Location Permission';

  @override
  String get locationPermissionDesc =>
      'Required to display weather information.';
}
