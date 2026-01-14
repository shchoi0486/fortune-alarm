import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('ja'),
    Locale('ko'),
    Locale('ru'),
    Locale('zh')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fortune Alarm'**
  String get appTitle;

  /// No description provided for @morningGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning! Start your lucky day.'**
  String get morningGreeting;

  /// No description provided for @missionWakeUp.
  ///
  /// In en, this message translates to:
  /// **'Wake-up Mission'**
  String get missionWakeUp;

  /// No description provided for @missionSupplement.
  ///
  /// In en, this message translates to:
  /// **'Take Supplements'**
  String get missionSupplement;

  /// No description provided for @missionWater.
  ///
  /// In en, this message translates to:
  /// **'Drink 2L Water'**
  String get missionWater;

  /// No description provided for @fortuneCookie.
  ///
  /// In en, this message translates to:
  /// **'Fortune Cookie'**
  String get fortuneCookie;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @alarm.
  ///
  /// In en, this message translates to:
  /// **'Alarm'**
  String get alarm;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @mission.
  ///
  /// In en, this message translates to:
  /// **'Mission'**
  String get mission;

  /// No description provided for @fortune.
  ///
  /// In en, this message translates to:
  /// **'Fortune'**
  String get fortune;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @allMissionsCompleted.
  ///
  /// In en, this message translates to:
  /// **'You have completed all 5 missions for today.'**
  String get allMissionsCompleted;

  /// No description provided for @rewardReceived.
  ///
  /// In en, this message translates to:
  /// **'You received 1 Fortune Cookie as a reward! 🥠'**
  String get rewardReceived;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @exactAlarmPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'The \"Exact Alarm\" permission is required to sound the alarm at the correct time.'**
  String get exactAlarmPermissionRequired;

  /// No description provided for @overlayPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'The \"Display over other apps\" permission is required for full-screen notifications.'**
  String get overlayPermissionRequired;

  /// No description provided for @deleteAllAlarms.
  ///
  /// In en, this message translates to:
  /// **'Delete All Alarms'**
  String get deleteAllAlarms;

  /// No description provided for @noAlarms.
  ///
  /// In en, this message translates to:
  /// **'No alarms registered.'**
  String get noAlarms;

  /// No description provided for @lessThanAMinuteRemaining.
  ///
  /// In en, this message translates to:
  /// **'Ringing in less than a minute'**
  String get lessThanAMinuteRemaining;

  /// No description provided for @hoursMinutesRemaining.
  ///
  /// In en, this message translates to:
  /// **'Ringing in {hours}h {minutes}m'**
  String hoursMinutesRemaining(int hours, int minutes);

  /// No description provided for @minutesRemaining.
  ///
  /// In en, this message translates to:
  /// **'Ringing in {minutes}m'**
  String minutesRemaining(int minutes);

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// No description provided for @dailyFortuneCookieReward.
  ///
  /// In en, this message translates to:
  /// **'Daily Fortune Cookie Reward'**
  String get dailyFortuneCookieReward;

  /// No description provided for @missionRewardInfo.
  ///
  /// In en, this message translates to:
  /// **'1 cookie for 5 successful missions, 2 for 10!'**
  String get missionRewardInfo;

  /// No description provided for @dailyMission.
  ///
  /// In en, this message translates to:
  /// **'Daily Mission'**
  String get dailyMission;

  /// No description provided for @goalAchieved.
  ///
  /// In en, this message translates to:
  /// **'🎉 {completed}/5 Goal Achieved!'**
  String goalAchieved(int completed);

  /// No description provided for @missionProgress.
  ///
  /// In en, this message translates to:
  /// **'{completed}/5 Achieved'**
  String missionProgress(int completed);

  /// No description provided for @myMissionRecord.
  ///
  /// In en, this message translates to:
  /// **'My Mission Record'**
  String get myMissionRecord;

  /// No description provided for @consecutiveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Consecutive'**
  String get consecutiveSuccess;

  /// No description provided for @successRate30Days.
  ///
  /// In en, this message translates to:
  /// **'Success Rate (30d)'**
  String get successRate30Days;

  /// No description provided for @totalSuccess.
  ///
  /// In en, this message translates to:
  /// **'Total Success'**
  String get totalSuccess;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress 🔥'**
  String get inProgress;

  /// No description provided for @resetMissions.
  ///
  /// In en, this message translates to:
  /// **'Reset Missions'**
  String get resetMissions;

  /// No description provided for @resetMissionsConfirm.
  ///
  /// In en, this message translates to:
  /// **'Do you want to reset all challenge lists?\n(Excluding basic system missions)'**
  String get resetMissionsConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @addMission.
  ///
  /// In en, this message translates to:
  /// **'Add Mission'**
  String get addMission;

  /// No description provided for @completedMissions.
  ///
  /// In en, this message translates to:
  /// **'Completed Missions'**
  String get completedMissions;

  /// No description provided for @noCompletedMissionsHint.
  ///
  /// In en, this message translates to:
  /// **'No completed missions yet. Reach today\'s mission goal.'**
  String get noCompletedMissionsHint;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {userName}'**
  String greeting(String userName);

  /// No description provided for @welcomeFortune.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the mysterious world of fortune'**
  String get welcomeFortune;

  /// No description provided for @luckyColor.
  ///
  /// In en, this message translates to:
  /// **'Lucky Color'**
  String get luckyColor;

  /// No description provided for @luckyItem.
  ///
  /// In en, this message translates to:
  /// **'Lucky Item'**
  String get luckyItem;

  /// No description provided for @luckyDirection.
  ///
  /// In en, this message translates to:
  /// **'Lucky Direction'**
  String get luckyDirection;

  /// No description provided for @viewVariousFortunes.
  ///
  /// In en, this message translates to:
  /// **'View Various Fortunes'**
  String get viewVariousFortunes;

  /// No description provided for @todaysRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Recommendation'**
  String get todaysRecommendation;

  /// No description provided for @checkTodaysFortune.
  ///
  /// In en, this message translates to:
  /// **'Check Today\'s Fortune'**
  String get checkTodaysFortune;

  /// No description provided for @todaysAdvice.
  ///
  /// In en, this message translates to:
  /// **'Today\'s advice from the mysterious stars'**
  String get todaysAdvice;

  /// No description provided for @viewSpecificDateFortune.
  ///
  /// In en, this message translates to:
  /// **'View Fortune for Specific Date'**
  String get viewSpecificDateFortune;

  /// No description provided for @lottoRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Lotto Number Recommendation'**
  String get lottoRecommendation;

  /// No description provided for @luckyNumber.
  ///
  /// In en, this message translates to:
  /// **'Lucky Number'**
  String get luckyNumber;

  /// No description provided for @specificDateFortune.
  ///
  /// In en, this message translates to:
  /// **'Specific Date Fortune'**
  String get specificDateFortune;

  /// No description provided for @specialDayFortune.
  ///
  /// In en, this message translates to:
  /// **'Special Day Fortune'**
  String get specialDayFortune;

  /// No description provided for @newYearFortune.
  ///
  /// In en, this message translates to:
  /// **'New Year Fortune'**
  String get newYearFortune;

  /// No description provided for @totalFortune2026.
  ///
  /// In en, this message translates to:
  /// **'2026 Total Fortune'**
  String get totalFortune2026;

  /// No description provided for @traditionalFortune.
  ///
  /// In en, this message translates to:
  /// **'Traditional Fortune'**
  String get traditionalFortune;

  /// No description provided for @traditionalSaju.
  ///
  /// In en, this message translates to:
  /// **'Traditional Saju Analysis'**
  String get traditionalSaju;

  /// No description provided for @faceReading.
  ///
  /// In en, this message translates to:
  /// **'Face Reading'**
  String get faceReading;

  /// No description provided for @missionFaceReading.
  ///
  /// In en, this message translates to:
  /// **'Face Reading Mission'**
  String get missionFaceReading;

  /// No description provided for @faceFate.
  ///
  /// In en, this message translates to:
  /// **'Face Fate Destiny'**
  String get faceFate;

  /// No description provided for @compatibility.
  ///
  /// In en, this message translates to:
  /// **'Compatibility'**
  String get compatibility;

  /// No description provided for @relationshipHarmony.
  ///
  /// In en, this message translates to:
  /// **'Relationship Harmony'**
  String get relationshipHarmony;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @darkModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Set the screen to dark.'**
  String get darkModeDescription;

  /// No description provided for @alarmSettings.
  ///
  /// In en, this message translates to:
  /// **'Alarm Settings'**
  String get alarmSettings;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @notice.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get notice;

  /// No description provided for @weatherConditionSunny.
  ///
  /// In en, this message translates to:
  /// **'Sunny'**
  String get weatherConditionSunny;

  /// No description provided for @weatherConditionCloudy.
  ///
  /// In en, this message translates to:
  /// **'Cloudy'**
  String get weatherConditionCloudy;

  /// No description provided for @weatherConditionFoggy.
  ///
  /// In en, this message translates to:
  /// **'Foggy'**
  String get weatherConditionFoggy;

  /// No description provided for @weatherConditionRainy.
  ///
  /// In en, this message translates to:
  /// **'Rainy'**
  String get weatherConditionRainy;

  /// No description provided for @weatherConditionSnowy.
  ///
  /// In en, this message translates to:
  /// **'Snowy'**
  String get weatherConditionSnowy;

  /// No description provided for @weatherConditionThunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm'**
  String get weatherConditionThunderstorm;

  /// No description provided for @airQualityGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get airQualityGood;

  /// No description provided for @airQualityNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get airQualityNormal;

  /// No description provided for @airQualityBad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get airQualityBad;

  /// No description provided for @airQualityVeryBad.
  ///
  /// In en, this message translates to:
  /// **'Very Bad'**
  String get airQualityVeryBad;

  /// No description provided for @locationUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown Location'**
  String get locationUnknown;

  /// No description provided for @locationError.
  ///
  /// In en, this message translates to:
  /// **'Location Error'**
  String get locationError;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @sendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

  /// No description provided for @feedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Please let us know if you have any inconveniences or features you would like to suggest while using Fortune Alarm.\nYour valuable opinions make a better service.'**
  String get feedbackDescription;

  /// No description provided for @reportCopyright.
  ///
  /// In en, this message translates to:
  /// **'Report Copyright Infringement'**
  String get reportCopyright;

  /// No description provided for @copyrightDescription.
  ///
  /// In en, this message translates to:
  /// **'If you believe that the content in Fortune Alarm infringes on copyright, please report it via email.\nWe will take immediate action after confirmation.'**
  String get copyrightDescription;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service and Privacy Policy\n\n1. General Provisions\n\nArticle 1 (Purpose)\nThe purpose of these Terms is to define the conditions and procedures for using the service provided by \'Fortune Alarm\' (hereinafter referred to as the \'Service\'), as well as the rights, obligations, and responsibilities of users and the developer.\n\nArticle 2 (Privacy Policy)\n\n1. Items and Method of Personal Information Collection\nThis Service can be used without membership registration and does not store or collect users\' personal information on a separate server.\nHowever, the following information may be generated and stored on the device during the use of the Service:\n- Alarm settings, mission completion records, fortune cookie acquisition history, etc.\n\n2. Information on Device Permission Usage\nThe Service uses the following permissions to the minimum extent necessary to provide the Service:\n- Notifications (Required): Used for alarm execution and fortune cookie notifications.\n- Exact Alarm & Battery Optimization Exclusion (Required): Used to ensure alarms ring on time even in power-saving mode.\n- Display Over Other Apps (Required): Used to display the alarm screen on the lock screen or while using other apps.\n- Camera (Optional): Used only for \'Object Snap\' mission; captured images are processed only on the device and are not transmitted to a server.\n\n3. Advertising Services and Data Processing\nThis Service uses Google AdMob to deliver advertisements for free service provision.\nGoogle may collect some non-personally identifiable information, such as Advertising ID (ADID), for personalized ad settings.\n- Google Privacy Policy: https://policies.google.com/privacy\n\nArticle 3 (Data Storage and Deletion)\nThis Service is a local app that stores data on the user\'s device.\nIf you delete the app, all data stored on the device (alarms, mission records, etc.) will be immediately deleted and cannot be recovered.\n\nArticle 4 (Disclaimer)\n1. The fortune information provided by this Service is for entertainment purposes only, and its accuracy or reliability is not guaranteed.\n2. The developer is not responsible if the alarm does not ring due to device setting changes (turning off notifications, battery optimization, etc.) or system errors.\n\nArticle 5 (Contact Information)\nIf you have any inconveniences or inquiries while using the Service, please contact us at the email below.\nEmail: seriessnap.co@gmail.com'**
  String get privacyPolicy;

  /// No description provided for @alarmOptimization.
  ///
  /// In en, this message translates to:
  /// **'Alarm Sound Optimization'**
  String get alarmOptimization;

  /// No description provided for @allOptimizationsCompleted.
  ///
  /// In en, this message translates to:
  /// **'All optimization settings completed'**
  String get allOptimizationsCompleted;

  /// No description provided for @optimizationNeeded.
  ///
  /// In en, this message translates to:
  /// **'Settings are required for accurate alarms.'**
  String get optimizationNeeded;

  /// No description provided for @optimizationDescription.
  ///
  /// In en, this message translates to:
  /// **'Alarms may be delayed or not sound due to Android system settings. Please set all items to allowed.'**
  String get optimizationDescription;

  /// No description provided for @allowNotificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Allow Notification Permission'**
  String get allowNotificationPermission;

  /// No description provided for @notificationPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'Required to display notifications when an alarm occurs.'**
  String get notificationPermissionDescription;

  /// No description provided for @excludeBatteryOptimization.
  ///
  /// In en, this message translates to:
  /// **'Exclude Battery Optimization'**
  String get excludeBatteryOptimization;

  /// No description provided for @batteryOptimizationDescription.
  ///
  /// In en, this message translates to:
  /// **'Ensures the alarm sounds immediately even in power saving mode.'**
  String get batteryOptimizationDescription;

  /// No description provided for @allowExactAlarm.
  ///
  /// In en, this message translates to:
  /// **'Allow Exact Alarm'**
  String get allowExactAlarm;

  /// No description provided for @exactAlarmDescription.
  ///
  /// In en, this message translates to:
  /// **'Sounds the alarm on time without being delayed by the system.'**
  String get exactAlarmDescription;

  /// No description provided for @drawOverOtherApps.
  ///
  /// In en, this message translates to:
  /// **'Display Over Other Apps'**
  String get drawOverOtherApps;

  /// No description provided for @overlayDescription.
  ///
  /// In en, this message translates to:
  /// **'Displays the alarm screen even on the lock screen or while using other apps.'**
  String get overlayDescription;

  /// No description provided for @allSettingsCompleted.
  ///
  /// In en, this message translates to:
  /// **'All settings are completed.'**
  String get allSettingsCompleted;

  /// No description provided for @manualSettingsInfo.
  ///
  /// In en, this message translates to:
  /// **'You can disable settings directly in Android system settings.'**
  String get manualSettingsInfo;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @selectPhoto.
  ///
  /// In en, this message translates to:
  /// **'Select Photo'**
  String get selectPhoto;

  /// No description provided for @selectAlarmBackground.
  ///
  /// In en, this message translates to:
  /// **'Alarm Background'**
  String get selectAlarmBackground;

  /// No description provided for @defaultLabel.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// No description provided for @howToAdd.
  ///
  /// In en, this message translates to:
  /// **'How to Add'**
  String get howToAdd;

  /// No description provided for @addAssetInstructions.
  ///
  /// In en, this message translates to:
  /// **'Put the image in assets/images/ folder and register it in pubspec.yaml.'**
  String get addAssetInstructions;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @ringingNow.
  ///
  /// In en, this message translates to:
  /// **'Ringing Now'**
  String get ringingNow;

  /// No description provided for @setTime.
  ///
  /// In en, this message translates to:
  /// **'Set Time'**
  String get setTime;

  /// No description provided for @repeatDays.
  ///
  /// In en, this message translates to:
  /// **'Repeat Days'**
  String get repeatDays;

  /// No description provided for @repeatDaily.
  ///
  /// In en, this message translates to:
  /// **'Repeat Daily'**
  String get repeatDaily;

  /// No description provided for @snoozeSettings.
  ///
  /// In en, this message translates to:
  /// **'Snooze Settings'**
  String get snoozeSettings;

  /// No description provided for @interval.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get interval;

  /// No description provided for @wakeUpAlarm.
  ///
  /// In en, this message translates to:
  /// **'Wake-up Alarm'**
  String get wakeUpAlarm;

  /// No description provided for @snoozeInfo.
  ///
  /// In en, this message translates to:
  /// **'{interval} min, {count} times'**
  String snoozeInfo(int interval, int count);

  /// No description provided for @daySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get daySun;

  /// No description provided for @dayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get dayTue;

  /// No description provided for @dayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get dayWed;

  /// No description provided for @dayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get dayFri;

  /// No description provided for @daySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get daySat;

  /// No description provided for @missionRewardEarned.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have completed 5 missions today and earned 1 Fortune Cookie!'**
  String get missionRewardEarned;

  /// No description provided for @missionRewardEarnedWithCount.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You completed {missions} missions today and earned {cookies} Fortune Cookie(s)!'**
  String missionRewardEarnedWithCount(int missions, int cookies);

  /// No description provided for @daysCount.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String daysCount(int count);

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @minutesLater.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min later'**
  String minutesLater(int minutes);

  /// No description provided for @countLabel.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get countLabel;

  /// No description provided for @timesCount.
  ///
  /// In en, this message translates to:
  /// **'Total {count} times'**
  String timesCount(int count);

  /// No description provided for @wakeUpMission.
  ///
  /// In en, this message translates to:
  /// **'Wake-up Mission'**
  String get wakeUpMission;

  /// No description provided for @alarmSound.
  ///
  /// In en, this message translates to:
  /// **'Alarm Sound'**
  String get alarmSound;

  /// No description provided for @gradualVolume.
  ///
  /// In en, this message translates to:
  /// **'Gradual Volume'**
  String get gradualVolume;

  /// No description provided for @vibration.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// No description provided for @alarmNameAndBackground.
  ///
  /// In en, this message translates to:
  /// **'Alarm Name & Background'**
  String get alarmNameAndBackground;

  /// No description provided for @customStyle.
  ///
  /// In en, this message translates to:
  /// **'Custom Style'**
  String get customStyle;

  /// No description provided for @alarmName.
  ///
  /// In en, this message translates to:
  /// **'Alarm Name'**
  String get alarmName;

  /// No description provided for @enterAlarmName.
  ///
  /// In en, this message translates to:
  /// **'Please enter alarm name'**
  String get enterAlarmName;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @missionNone.
  ///
  /// In en, this message translates to:
  /// **'No Mission'**
  String get missionNone;

  /// No description provided for @missionSnap.
  ///
  /// In en, this message translates to:
  /// **'Object Snap'**
  String get missionSnap;

  /// No description provided for @missionMath.
  ///
  /// In en, this message translates to:
  /// **'Math Problem'**
  String get missionMath;

  /// No description provided for @missionFortune.
  ///
  /// In en, this message translates to:
  /// **'Fortune'**
  String get missionFortune;

  /// No description provided for @missionShake.
  ///
  /// In en, this message translates to:
  /// **'Shake'**
  String get missionShake;

  /// No description provided for @missionFortuneCatch.
  ///
  /// In en, this message translates to:
  /// **'Fortune Catch'**
  String get missionFortuneCatch;

  /// No description provided for @missionNoDescription.
  ///
  /// In en, this message translates to:
  /// **'Alarm will ring without a mission.'**
  String get missionNoDescription;

  /// No description provided for @missionCameraDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a photo of the specified object to dismiss the alarm.'**
  String get missionCameraDescription;

  /// No description provided for @missionMathDescription.
  ///
  /// In en, this message translates to:
  /// **'Solve math problems to wake up your brain.'**
  String get missionMathDescription;

  /// No description provided for @missionFortuneDescription.
  ///
  /// In en, this message translates to:
  /// **'Dismiss the alarm and check today\'s fortune.'**
  String get missionFortuneDescription;

  /// No description provided for @missionShakeDescription.
  ///
  /// In en, this message translates to:
  /// **'You must shake your phone to turn off the alarm.'**
  String get missionShakeDescription;

  /// No description provided for @missionFortuneCatchDescription.
  ///
  /// In en, this message translates to:
  /// **'Catch the moving Fortuni!'**
  String get missionFortuneCatchDescription;

  /// No description provided for @missionWalk.
  ///
  /// In en, this message translates to:
  /// **'Walk'**
  String get missionWalk;

  /// No description provided for @missionWalkDescription.
  ///
  /// In en, this message translates to:
  /// **'Walk to turn off the alarm!'**
  String get missionWalkDescription;

  /// No description provided for @missionFaceDescription.
  ///
  /// In en, this message translates to:
  /// **'Keep your face in the frame for 5s.'**
  String get missionFaceDescription;

  /// No description provided for @walkStepCount.
  ///
  /// In en, this message translates to:
  /// **'Target Steps'**
  String get walkStepCount;

  /// No description provided for @walkSteps.
  ///
  /// In en, this message translates to:
  /// **'{count} steps'**
  String walkSteps(int count);

  /// No description provided for @missionNumberOrder.
  ///
  /// In en, this message translates to:
  /// **'Number Order'**
  String get missionNumberOrder;

  /// No description provided for @missionNumberOrderDescription.
  ///
  /// In en, this message translates to:
  /// **'Tap numbers from 1 to 9 in order.'**
  String get missionNumberOrderDescription;

  /// No description provided for @missionNumberOrderGuide.
  ///
  /// In en, this message translates to:
  /// **'Next: {nextNumber}'**
  String missionNumberOrderGuide(int nextNumber);

  /// No description provided for @missionHiddenButton.
  ///
  /// In en, this message translates to:
  /// **'Position Memory'**
  String get missionHiddenButton;

  /// No description provided for @missionHiddenButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Memorize the lit tiles in order and tap them within 10 seconds.'**
  String get missionHiddenButtonDescription;

  /// No description provided for @missionHiddenButtonDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Δ{delta}'**
  String missionHiddenButtonDifficulty(int delta);

  /// No description provided for @missionTapSprint.
  ///
  /// In en, this message translates to:
  /// **'Tap Sprint'**
  String get missionTapSprint;

  /// No description provided for @missionTapSprintDescriptionShort.
  ///
  /// In en, this message translates to:
  /// **'Tap to fill the meter.'**
  String get missionTapSprintDescriptionShort;

  /// No description provided for @missionTapSprintDescription.
  ///
  /// In en, this message translates to:
  /// **'Tap {goalTaps}+ times to fill the meter.'**
  String missionTapSprintDescription(int goalTaps);

  /// No description provided for @missionTapSprintTapHere.
  ///
  /// In en, this message translates to:
  /// **'Tap'**
  String get missionTapSprintTapHere;

  /// No description provided for @missionTapSprintHint.
  ///
  /// In en, this message translates to:
  /// **'Fills up fast, drains if you pause.'**
  String get missionTapSprintHint;

  /// No description provided for @missionLeftRight.
  ///
  /// In en, this message translates to:
  /// **'Left / Right'**
  String get missionLeftRight;

  /// No description provided for @missionLeftRightDescriptionShort.
  ///
  /// In en, this message translates to:
  /// **'Follow the prompt and pick left or right.'**
  String get missionLeftRightDescriptionShort;

  /// No description provided for @missionLeftRightDescription.
  ///
  /// In en, this message translates to:
  /// **'Get {targetStreak} correct in a row.'**
  String missionLeftRightDescription(int targetStreak);

  /// No description provided for @missionLeftRightPromptLeft.
  ///
  /// In en, this message translates to:
  /// **'Tap LEFT'**
  String get missionLeftRightPromptLeft;

  /// No description provided for @missionLeftRightPromptRight.
  ///
  /// In en, this message translates to:
  /// **'Tap RIGHT'**
  String get missionLeftRightPromptRight;

  /// No description provided for @left.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get left;

  /// No description provided for @right.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get right;

  /// No description provided for @missionHintInactivity.
  ///
  /// In en, this message translates to:
  /// **'If you stop for 2 minutes, it resets.'**
  String get missionHintInactivity;

  /// No description provided for @fortuneCatchScore.
  ///
  /// In en, this message translates to:
  /// **'Score: {score}'**
  String fortuneCatchScore(int score);

  /// No description provided for @fortuneCatchGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal: 100'**
  String get fortuneCatchGoal;

  /// No description provided for @fortuneCatchGoalDetail.
  ///
  /// In en, this message translates to:
  /// **'(Catches: {count}/{min})'**
  String fortuneCatchGoalDetail(int count, int min);

  /// No description provided for @fortuneCatchCombo.
  ///
  /// In en, this message translates to:
  /// **'{combo} Combo!'**
  String fortuneCatchCombo(int combo);

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get difficultyNormal;

  /// No description provided for @difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get difficultyHard;

  /// No description provided for @problemCount.
  ///
  /// In en, this message translates to:
  /// **'Number of Problems'**
  String get problemCount;

  /// No description provided for @problemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Problems'**
  String problemsCount(int count);

  /// No description provided for @shakeCount.
  ///
  /// In en, this message translates to:
  /// **'Shake Count'**
  String get shakeCount;

  /// No description provided for @shakeTimes.
  ///
  /// In en, this message translates to:
  /// **'{count} times'**
  String shakeTimes(int count);

  /// No description provided for @missionNumber.
  ///
  /// In en, this message translates to:
  /// **'Mission {number}'**
  String missionNumber(int number);

  /// No description provided for @soundBirds.
  ///
  /// In en, this message translates to:
  /// **'Bird Sounds'**
  String get soundBirds;

  /// No description provided for @shakeCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Number of Shakes'**
  String get shakeCountLabel;

  /// No description provided for @missionIndex.
  ///
  /// In en, this message translates to:
  /// **'Mission {index}'**
  String missionIndex(int index);

  /// No description provided for @ringtoneSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Ringtone'**
  String get ringtoneSelect;

  /// No description provided for @vibrationSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Vibration Pattern'**
  String get vibrationSelect;

  /// No description provided for @defaultRingtone.
  ///
  /// In en, this message translates to:
  /// **'Default Ringtone'**
  String get defaultRingtone;

  /// No description provided for @classicAlarm.
  ///
  /// In en, this message translates to:
  /// **'Classic Alarm'**
  String get classicAlarm;

  /// No description provided for @digitalAlarm.
  ///
  /// In en, this message translates to:
  /// **'Digital Alarm'**
  String get digitalAlarm;

  /// No description provided for @birdsSound.
  ///
  /// In en, this message translates to:
  /// **'Birds Chirping'**
  String get birdsSound;

  /// No description provided for @wavesSound.
  ///
  /// In en, this message translates to:
  /// **'Ocean Waves'**
  String get wavesSound;

  /// No description provided for @defaultVibration.
  ///
  /// In en, this message translates to:
  /// **'Default Vibration'**
  String get defaultVibration;

  /// No description provided for @shortVibration.
  ///
  /// In en, this message translates to:
  /// **'Short Repeat'**
  String get shortVibration;

  /// No description provided for @longVibration.
  ///
  /// In en, this message translates to:
  /// **'Long Repeat'**
  String get longVibration;

  /// No description provided for @heartbeatVibration.
  ///
  /// In en, this message translates to:
  /// **'Heartbeat'**
  String get heartbeatVibration;

  /// No description provided for @sosVibration.
  ///
  /// In en, this message translates to:
  /// **'SOS'**
  String get sosVibration;

  /// No description provided for @quickVibration.
  ///
  /// In en, this message translates to:
  /// **'Quick Beat'**
  String get quickVibration;

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// No description provided for @exactAlarmPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'To ring the alarm at the exact time, \"Schedule & Reminders\" permission is required.'**
  String get exactAlarmPermissionDesc;

  /// No description provided for @batteryOptimizationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization must be disabled for the alarm to ring on time.'**
  String get batteryOptimizationPermissionDesc;

  /// No description provided for @overlayPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'To display the mission screen when the alarm goes off, \"Display over other apps\" permission is required.'**
  String get overlayPermissionDesc;

  /// No description provided for @cameraMissionFirstImageError.
  ///
  /// In en, this message translates to:
  /// **'Please set at least the first mission image.'**
  String get cameraMissionFirstImageError;

  /// No description provided for @cameraMissionSequentialImageError.
  ///
  /// In en, this message translates to:
  /// **'Please set mission images in order.'**
  String get cameraMissionSequentialImageError;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error occurred: {error}'**
  String errorOccurred(String error);

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @exactAlarmPermissionFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. Exact alarm permission is disabled and needs to be set.'**
  String get exactAlarmPermissionFail;

  /// No description provided for @batteryOptimizationPermissionFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. Battery optimization exception permission is missing and needs to be set.'**
  String get batteryOptimizationPermissionFail;

  /// No description provided for @overlayPermissionFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. \"Display over other apps\" permission is missing and needs to be set.'**
  String get overlayPermissionFail;

  /// No description provided for @unknownAlarmError.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. An unknown error occurred.'**
  String get unknownAlarmError;

  /// No description provided for @resetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetTooltip;

  /// No description provided for @errorLoadingAlarm.
  ///
  /// In en, this message translates to:
  /// **'Failed to load alarm information.'**
  String get errorLoadingAlarm;

  /// No description provided for @alarmNotFound.
  ///
  /// In en, this message translates to:
  /// **'Alarm information not found.'**
  String get alarmNotFound;

  /// No description provided for @repeatAlarmCount.
  ///
  /// In en, this message translates to:
  /// **'Snooze Alarm ({current}/{max})'**
  String repeatAlarmCount(int current, int max);

  /// No description provided for @turnOffAlarm.
  ///
  /// In en, this message translates to:
  /// **'Turn Off Alarm'**
  String get turnOffAlarm;

  /// No description provided for @startMission.
  ///
  /// In en, this message translates to:
  /// **'Start Mission'**
  String get startMission;

  /// No description provided for @alarmSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze Alarm'**
  String get alarmSnooze;

  /// No description provided for @fortuneTitle.
  ///
  /// In en, this message translates to:
  /// **'Check Fortune'**
  String get fortuneTitle;

  /// No description provided for @fortuneMessage.
  ///
  /// In en, this message translates to:
  /// **'Check your fortune results\nand get hidden gifts!'**
  String get fortuneMessage;

  /// No description provided for @fortuneAdButton.
  ///
  /// In en, this message translates to:
  /// **'Watch Ad and Check Results'**
  String get fortuneAdButton;

  /// No description provided for @fortuneLoadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Experience the special tarot interpretation of the fortune teller.'**
  String get fortuneLoadingMessage;

  /// No description provided for @fortuneAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your selected tarot... {progress}%'**
  String fortuneAnalyzing(int progress);

  /// No description provided for @fortuneSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Think about today\'s energy\nand select 3 cards.'**
  String get fortuneSelectTitle;

  /// No description provided for @fortuneSelectTitleDate.
  ///
  /// In en, this message translates to:
  /// **'Think about the energy of {month}/{day}\nand select 3 cards.'**
  String fortuneSelectTitleDate(int month, int day);

  /// No description provided for @fortuneNewYearButton.
  ///
  /// In en, this message translates to:
  /// **'View 2026 New Year Fortune'**
  String get fortuneNewYearButton;

  /// No description provided for @loveFortune.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get loveFortune;

  /// No description provided for @wealthFortune.
  ///
  /// In en, this message translates to:
  /// **'Wealth'**
  String get wealthFortune;

  /// No description provided for @successFortune.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successFortune;

  /// No description provided for @fortuneResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Here is your fortune result for today.'**
  String get fortuneResultTitle;

  /// No description provided for @fortuneResultTitleDate.
  ///
  /// In en, this message translates to:
  /// **'Fortune for {year}/{month}/{day}'**
  String fortuneResultTitleDate(int year, int month, int day);

  /// No description provided for @startDayButton.
  ///
  /// In en, this message translates to:
  /// **'Start Your Day'**
  String get startDayButton;

  /// No description provided for @policy.
  ///
  /// In en, this message translates to:
  /// **'Terms and Privacy Policy'**
  String get policy;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @defaultAlarmBehavior.
  ///
  /// In en, this message translates to:
  /// **'Default Alarm Behavior'**
  String get defaultAlarmBehavior;

  /// No description provided for @defaultAlarmVolume.
  ///
  /// In en, this message translates to:
  /// **'Default Alarm Volume'**
  String get defaultAlarmVolume;

  /// No description provided for @defaultAlarmVolumeDescription.
  ///
  /// In en, this message translates to:
  /// **'The default volume applied when creating a new alarm.'**
  String get defaultAlarmVolumeDescription;

  /// No description provided for @gradualVolumeDescription.
  ///
  /// In en, this message translates to:
  /// **'Sets the alarm sound to gradually increase.'**
  String get gradualVolumeDescription;

  /// No description provided for @defaultVibrationDescription.
  ///
  /// In en, this message translates to:
  /// **'Enables vibration by default when creating a new alarm.'**
  String get defaultVibrationDescription;

  /// No description provided for @defaultInterval.
  ///
  /// In en, this message translates to:
  /// **'Default Interval'**
  String get defaultInterval;

  /// No description provided for @maxSnoozeCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Max Snooze Count'**
  String get maxSnoozeCountLabel;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minutes;

  /// No description provided for @times.
  ///
  /// In en, this message translates to:
  /// **'times'**
  String get times;

  /// No description provided for @cupsCount.
  ///
  /// In en, this message translates to:
  /// **'({current}/{goal} cups)'**
  String cupsCount(int current, int goal);

  /// No description provided for @timesCountProgress.
  ///
  /// In en, this message translates to:
  /// **'({current}/{goal} times)'**
  String timesCountProgress(int current, int goal);

  /// No description provided for @missionGym.
  ///
  /// In en, this message translates to:
  /// **'Go to Gym'**
  String get missionGym;

  /// No description provided for @missionWorkout.
  ///
  /// In en, this message translates to:
  /// **'Home Workout'**
  String get missionWorkout;

  /// No description provided for @missionDiary.
  ///
  /// In en, this message translates to:
  /// **'Write Diary'**
  String get missionDiary;

  /// No description provided for @missionBedMaking.
  ///
  /// In en, this message translates to:
  /// **'Make the Bed'**
  String get missionBedMaking;

  /// No description provided for @missionStretching.
  ///
  /// In en, this message translates to:
  /// **'Stretching'**
  String get missionStretching;

  /// No description provided for @missionReading.
  ///
  /// In en, this message translates to:
  /// **'Reading 10min'**
  String get missionReading;

  /// No description provided for @missionPlanning.
  ///
  /// In en, this message translates to:
  /// **'Plan the Day'**
  String get missionPlanning;

  /// No description provided for @missionBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Eat Breakfast'**
  String get missionBreakfast;

  /// No description provided for @missionMeditation.
  ///
  /// In en, this message translates to:
  /// **'Meditation 5min'**
  String get missionMeditation;

  /// No description provided for @missionLearnWords.
  ///
  /// In en, this message translates to:
  /// **'Learn 5 Words'**
  String get missionLearnWords;

  /// No description provided for @missionVentilation.
  ///
  /// In en, this message translates to:
  /// **'Ventilation'**
  String get missionVentilation;

  /// No description provided for @missionCleaning.
  ///
  /// In en, this message translates to:
  /// **'Cleaning room'**
  String get missionCleaning;

  /// No description provided for @missionGratitudeDiary.
  ///
  /// In en, this message translates to:
  /// **'Gratitude Diary'**
  String get missionGratitudeDiary;

  /// No description provided for @faqQuestion1.
  ///
  /// In en, this message translates to:
  /// **'Alarms are not ringing.'**
  String get faqQuestion1;

  /// No description provided for @faqAnswer1.
  ///
  /// In en, this message translates to:
  /// **'Alarms may be delayed or blocked due to the Android system\'s battery optimization feature. Please set all permissions to \'Allow\' in the Settings > Alarm Optimization menu.'**
  String get faqAnswer1;

  /// No description provided for @faqQuestion2.
  ///
  /// In en, this message translates to:
  /// **'I want to change the mission.'**
  String get faqQuestion2;

  /// No description provided for @faqAnswer2.
  ///
  /// In en, this message translates to:
  /// **'You can change it to the mission you want (Math, Photo, Shake, etc.) in the mission selection menu after tapping the alarm you want to edit in the alarm list.'**
  String get faqAnswer2;

  /// No description provided for @faqQuestion3.
  ///
  /// In en, this message translates to:
  /// **'How do I set Dark Mode?'**
  String get faqQuestion3;

  /// No description provided for @faqAnswer3.
  ///
  /// In en, this message translates to:
  /// **'You can change the screen theme through the Settings > General > Dark Mode toggle.'**
  String get faqAnswer3;

  /// No description provided for @faqQuestion4.
  ///
  /// In en, this message translates to:
  /// **'How do I collect fortune cookies?'**
  String get faqQuestion4;

  /// No description provided for @faqAnswer4.
  ///
  /// In en, this message translates to:
  /// **'You can earn fortune cookies every time you dismiss an alarm in the morning or complete a mission. Check your daily fortune with the cookies you\'ve collected!'**
  String get faqAnswer4;

  /// No description provided for @faqQuestion5.
  ///
  /// In en, this message translates to:
  /// **'Will my data disappear if I delete the app?'**
  String get faqQuestion5;

  /// No description provided for @faqAnswer5.
  ///
  /// In en, this message translates to:
  /// **'Yes, Fortune Alarm stores data inside the device, so deleting the app will delete all your set alarms and mission records. Please be careful.'**
  String get faqAnswer5;

  /// No description provided for @noticeLabel.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get noticeLabel;

  /// No description provided for @notice1Title.
  ///
  /// In en, this message translates to:
  /// **'Fortune Alarm Official Launch'**
  String get notice1Title;

  /// No description provided for @notice1Content.
  ///
  /// In en, this message translates to:
  /// **'Hello. Fortune Alarm has been officially launched.\\n\\nCheck your daily fortune with your alarm every morning and start a happy day!\\nWe will continue to provide more diverse features and improved services.\\n\\nThank you.'**
  String get notice1Content;

  /// No description provided for @notice2Title.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0 Update News'**
  String get notice2Title;

  /// No description provided for @notice2Content.
  ///
  /// In en, this message translates to:
  /// **'Here is the content of the version 1.0.0 update.\\n\\n1. Supplement mission UI improvement\\n2. System setting integration for accurate alarms\\n3. Dark mode support\\n4. Bug fixes and stability improvements\\n\\nExperience the latest version now!'**
  String get notice2Content;

  /// No description provided for @notice3Title.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service Revision Notice'**
  String get notice3Title;

  /// No description provided for @notice3Content.
  ///
  /// In en, this message translates to:
  /// **'The Terms of Service have been revised.\\n\\nKey revisions:\\n- Strengthened Privacy Policy\\n- Specified service usage scope\\n\\nDetails can be found on the Settings > Terms page.'**
  String get notice3Content;

  /// No description provided for @supportContentTitle.
  ///
  /// In en, this message translates to:
  /// **'Inquiry Content'**
  String get supportContentTitle;

  /// No description provided for @supportHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter the content.'**
  String get supportHint;

  /// No description provided for @supportRecipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient (Customer Support)'**
  String get supportRecipient;

  /// No description provided for @emailCopied.
  ///
  /// In en, this message translates to:
  /// **'Email address copied.'**
  String get emailCopied;

  /// No description provided for @copyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyTooltip;

  /// No description provided for @supportWorkingDays.
  ///
  /// In en, this message translates to:
  /// **'We will try to respond within 24 hours on weekdays.'**
  String get supportWorkingDays;

  /// No description provided for @supportEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter the content.'**
  String get supportEmptyError;

  /// No description provided for @supportSubjectPrefix.
  ///
  /// In en, this message translates to:
  /// **'Inquiry Title'**
  String get supportSubjectPrefix;

  /// No description provided for @supportContentPrefix.
  ///
  /// In en, this message translates to:
  /// **'Inquiry Content'**
  String get supportContentPrefix;

  /// No description provided for @supportCopySuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Inquiry Copied'**
  String get supportCopySuccessTitle;

  /// No description provided for @supportCopySuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Inquiry content has been copied to clipboard.\\nWould you like to send an email to {email}?'**
  String supportCopySuccessMessage(String email);

  /// No description provided for @copyEmailAction.
  ///
  /// In en, this message translates to:
  /// **'Copy Email Address'**
  String get copyEmailAction;

  /// No description provided for @copyEmailSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Email address copied. Please paste it in your email app.'**
  String get copyEmailSuccessMessage;

  /// No description provided for @supportSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Copy Inquiry and Send'**
  String get supportSubmitButton;

  /// No description provided for @shakePhone.
  ///
  /// In en, this message translates to:
  /// **'Please shake your phone!'**
  String get shakePhone;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(String version);

  /// No description provided for @fortuneCheckButton.
  ///
  /// In en, this message translates to:
  /// **'Check Fortune'**
  String get fortuneCheckButton;

  /// No description provided for @fortuneSelectCards.
  ///
  /// In en, this message translates to:
  /// **'Select 3 cards'**
  String get fortuneSelectCards;

  /// No description provided for @fortuneDragCards.
  ///
  /// In en, this message translates to:
  /// **'Drag and select 3 cards'**
  String get fortuneDragCards;

  /// No description provided for @fortuneDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Detailed Interpretation'**
  String get fortuneDetailTitle;

  /// No description provided for @labelFineDust.
  ///
  /// In en, this message translates to:
  /// **'Fine Dust'**
  String get labelFineDust;

  /// No description provided for @labelUltraFineDust.
  ///
  /// In en, this message translates to:
  /// **'Ultra Fine Dust'**
  String get labelUltraFineDust;

  /// No description provided for @weatherToday.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Weather'**
  String get weatherToday;

  /// No description provided for @weatherUpdateMessage.
  ///
  /// In en, this message translates to:
  /// **'Updating weather information for current location.'**
  String get weatherUpdateMessage;

  /// No description provided for @weatherDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Observed data may vary depending on local conditions or reception status.'**
  String get weatherDisclaimer;

  /// No description provided for @weatherSource.
  ///
  /// In en, this message translates to:
  /// **'Provided by Meteorological Administration, Korea Environment Corporation'**
  String get weatherSource;

  /// No description provided for @locationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow Location Permission'**
  String get locationPermissionTitle;

  /// No description provided for @locationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Required to display weather information.'**
  String get locationPermissionDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'hi',
        'ja',
        'ko',
        'ru',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
