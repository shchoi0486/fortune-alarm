import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
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
  /// **'Alarm Mission'**
  String get missionWakeUp;

  /// No description provided for @missionSupplement.
  ///
  /// In en, this message translates to:
  /// **'Take Supplements'**
  String get missionSupplement;

  /// No description provided for @missionWater.
  ///
  /// In en, this message translates to:
  /// **'Drink over 2L of Water'**
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

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageKorean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get languageKorean;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get languageJapanese;

  /// No description provided for @languageChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get languageChinese;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get languageHindi;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

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

  /// No description provided for @missionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Mission Success!'**
  String get missionSuccess;

  /// No description provided for @cheeringMessage1.
  ///
  /// In en, this message translates to:
  /// **'Have a great day today!'**
  String get cheeringMessage1;

  /// No description provided for @cheeringMessage2.
  ///
  /// In en, this message translates to:
  /// **'I\'m rooting for you today!'**
  String get cheeringMessage2;

  /// No description provided for @cheeringMessage3.
  ///
  /// In en, this message translates to:
  /// **'It\'s going to be a wonderful day.'**
  String get cheeringMessage3;

  /// No description provided for @todaysCheering.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Message'**
  String get todaysCheering;

  /// No description provided for @notificationWakeUpBody.
  ///
  /// In en, this message translates to:
  /// **'Time to wake up!'**
  String get notificationWakeUpBody;

  /// No description provided for @notificationMissionBody.
  ///
  /// In en, this message translates to:
  /// **'Complete the mission and turn off the alarm!'**
  String get notificationMissionBody;

  /// No description provided for @notificationSafetyBody.
  ///
  /// In en, this message translates to:
  /// **'The alarm was forced to close! Please complete the mission.'**
  String get notificationSafetyBody;

  /// No description provided for @notificationRingingBody.
  ///
  /// In en, this message translates to:
  /// **'The alarm is ringing!'**
  String get notificationRingingBody;

  /// No description provided for @snoozePrefix.
  ///
  /// In en, this message translates to:
  /// **'[Snooze]'**
  String get snoozePrefix;

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
  String hoursMinutesRemaining(String hours, String minutes);

  /// No description provided for @minutesRemaining.
  ///
  /// In en, this message translates to:
  /// **'Ringing in {minutes}m'**
  String minutesRemaining(String minutes);

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
  /// **'Today\'s Advice'**
  String get todaysAdvice;

  /// No description provided for @viewSpecificDateFortune.
  ///
  /// In en, this message translates to:
  /// **'View Fortune for Specific Date'**
  String get viewSpecificDateFortune;

  /// No description provided for @luckyNumberRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Lucky Number Recommendation'**
  String get luckyNumberRecommendation;

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
  /// **'Traditional Four Pillars Analysis'**
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

  /// No description provided for @ohaengWood.
  ///
  /// In en, this message translates to:
  /// **'Wood'**
  String get ohaengWood;

  /// No description provided for @ohaengFire.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get ohaengFire;

  /// No description provided for @ohaengEarth.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get ohaengEarth;

  /// No description provided for @ohaengMetal.
  ///
  /// In en, this message translates to:
  /// **'Metal'**
  String get ohaengMetal;

  /// No description provided for @ohaengWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get ohaengWater;

  /// No description provided for @ohaengWoodSymbol.
  ///
  /// In en, this message translates to:
  /// **'Wood'**
  String get ohaengWoodSymbol;

  /// No description provided for @ohaengFireSymbol.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get ohaengFireSymbol;

  /// No description provided for @ohaengEarthSymbol.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get ohaengEarthSymbol;

  /// No description provided for @ohaengMetalSymbol.
  ///
  /// In en, this message translates to:
  /// **'Metal'**
  String get ohaengMetalSymbol;

  /// No description provided for @ohaengWaterSymbol.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get ohaengWaterSymbol;

  /// No description provided for @ohaengWoodExplanation.
  ///
  /// In en, this message translates to:
  /// **'With a strong energy of Wood (Tree), you are full of growth and motivation, possessing a compassionate and enterprising nature.'**
  String get ohaengWoodExplanation;

  /// No description provided for @ohaengFireExplanation.
  ///
  /// In en, this message translates to:
  /// **'With a strong energy of Fire, you are passionate and polite, with a tendency to be active and fond of glamorous things.'**
  String get ohaengFireExplanation;

  /// No description provided for @ohaengEarthExplanation.
  ///
  /// In en, this message translates to:
  /// **'With a strong energy of Earth, you have trust and tolerance, possessing a grave and unchanging nature.'**
  String get ohaengEarthExplanation;

  /// No description provided for @ohaengMetalExplanation.
  ///
  /// In en, this message translates to:
  /// **'With a strong energy of Metal, you have decisiveness and loyalty, possessing a cool-headed nature that values principles.'**
  String get ohaengMetalExplanation;

  /// No description provided for @ohaengWaterExplanation.
  ///
  /// In en, this message translates to:
  /// **'With a strong energy of Water, you have wisdom and flexibility, possessing a clever and highly adaptable nature.'**
  String get ohaengWaterExplanation;

  /// No description provided for @cheonganGap.
  ///
  /// In en, this message translates to:
  /// **'Gap'**
  String get cheonganGap;

  /// No description provided for @cheonganEul.
  ///
  /// In en, this message translates to:
  /// **'Eul'**
  String get cheonganEul;

  /// No description provided for @cheonganByeong.
  ///
  /// In en, this message translates to:
  /// **'Byeong'**
  String get cheonganByeong;

  /// No description provided for @cheonganJeong.
  ///
  /// In en, this message translates to:
  /// **'Jeong'**
  String get cheonganJeong;

  /// No description provided for @cheonganMu.
  ///
  /// In en, this message translates to:
  /// **'Mu'**
  String get cheonganMu;

  /// No description provided for @cheonganGi.
  ///
  /// In en, this message translates to:
  /// **'Gi'**
  String get cheonganGi;

  /// No description provided for @cheonganGyeong.
  ///
  /// In en, this message translates to:
  /// **'Gyeong'**
  String get cheonganGyeong;

  /// No description provided for @cheonganSin.
  ///
  /// In en, this message translates to:
  /// **'Sin'**
  String get cheonganSin;

  /// No description provided for @cheonganIm.
  ///
  /// In en, this message translates to:
  /// **'Im'**
  String get cheonganIm;

  /// No description provided for @cheonganGye.
  ///
  /// In en, this message translates to:
  /// **'Gye'**
  String get cheonganGye;

  /// No description provided for @jijiJa.
  ///
  /// In en, this message translates to:
  /// **'Rat'**
  String get jijiJa;

  /// No description provided for @jijiChuk.
  ///
  /// In en, this message translates to:
  /// **'Ox'**
  String get jijiChuk;

  /// No description provided for @jijiIn.
  ///
  /// In en, this message translates to:
  /// **'Tiger'**
  String get jijiIn;

  /// No description provided for @jijiMyo.
  ///
  /// In en, this message translates to:
  /// **'Rabbit'**
  String get jijiMyo;

  /// No description provided for @jijiJin.
  ///
  /// In en, this message translates to:
  /// **'Dragon'**
  String get jijiJin;

  /// No description provided for @jijiSa.
  ///
  /// In en, this message translates to:
  /// **'Snake'**
  String get jijiSa;

  /// No description provided for @jijiO.
  ///
  /// In en, this message translates to:
  /// **'Horse'**
  String get jijiO;

  /// No description provided for @jijiMi.
  ///
  /// In en, this message translates to:
  /// **'Goat'**
  String get jijiMi;

  /// No description provided for @jijiSin.
  ///
  /// In en, this message translates to:
  /// **'Monkey'**
  String get jijiSin;

  /// No description provided for @jijiYu.
  ///
  /// In en, this message translates to:
  /// **'Rooster'**
  String get jijiYu;

  /// No description provided for @jijiSul.
  ///
  /// In en, this message translates to:
  /// **'Dog'**
  String get jijiSul;

  /// No description provided for @jijiHae.
  ///
  /// In en, this message translates to:
  /// **'Pig'**
  String get jijiHae;

  /// No description provided for @jijiAnimalRat.
  ///
  /// In en, this message translates to:
  /// **'Rat'**
  String get jijiAnimalRat;

  /// No description provided for @jijiAnimalOx.
  ///
  /// In en, this message translates to:
  /// **'Ox'**
  String get jijiAnimalOx;

  /// No description provided for @jijiAnimalTiger.
  ///
  /// In en, this message translates to:
  /// **'Tiger'**
  String get jijiAnimalTiger;

  /// No description provided for @jijiAnimalRabbit.
  ///
  /// In en, this message translates to:
  /// **'Rabbit'**
  String get jijiAnimalRabbit;

  /// No description provided for @jijiAnimalDragon.
  ///
  /// In en, this message translates to:
  /// **'Dragon'**
  String get jijiAnimalDragon;

  /// No description provided for @jijiAnimalSnake.
  ///
  /// In en, this message translates to:
  /// **'Snake'**
  String get jijiAnimalSnake;

  /// No description provided for @jijiAnimalHorse.
  ///
  /// In en, this message translates to:
  /// **'Horse'**
  String get jijiAnimalHorse;

  /// No description provided for @jijiAnimalSheep.
  ///
  /// In en, this message translates to:
  /// **'Sheep'**
  String get jijiAnimalSheep;

  /// No description provided for @jijiAnimalMonkey.
  ///
  /// In en, this message translates to:
  /// **'Monkey'**
  String get jijiAnimalMonkey;

  /// No description provided for @jijiAnimalRooster.
  ///
  /// In en, this message translates to:
  /// **'Rooster'**
  String get jijiAnimalRooster;

  /// No description provided for @jijiAnimalDog.
  ///
  /// In en, this message translates to:
  /// **'Dog'**
  String get jijiAnimalDog;

  /// No description provided for @jijiAnimalPig.
  ///
  /// In en, this message translates to:
  /// **'Pig'**
  String get jijiAnimalPig;

  /// No description provided for @assetDefaultBackground.
  ///
  /// In en, this message translates to:
  /// **'Default Background'**
  String get assetDefaultBackground;

  /// No description provided for @assetFortuneyFriends.
  ///
  /// In en, this message translates to:
  /// **'Fortuney Friends'**
  String get assetFortuneyFriends;

  /// No description provided for @assetMongchuny.
  ///
  /// In en, this message translates to:
  /// **'Mongchuny'**
  String get assetMongchuny;

  /// No description provided for @assetPanchuny.
  ///
  /// In en, this message translates to:
  /// **'Panchuny'**
  String get assetPanchuny;

  /// No description provided for @assetTochuny.
  ///
  /// In en, this message translates to:
  /// **'Tochuny'**
  String get assetTochuny;

  /// No description provided for @assetHochuny.
  ///
  /// In en, this message translates to:
  /// **'Hochuny'**
  String get assetHochuny;

  /// No description provided for @assetBear.
  ///
  /// In en, this message translates to:
  /// **'Bear'**
  String get assetBear;

  /// No description provided for @assetMoon.
  ///
  /// In en, this message translates to:
  /// **'Moon'**
  String get assetMoon;

  /// No description provided for @assetBridge.
  ///
  /// In en, this message translates to:
  /// **'Bridge'**
  String get assetBridge;

  /// No description provided for @assetRoad.
  ///
  /// In en, this message translates to:
  /// **'Road'**
  String get assetRoad;

  /// No description provided for @assetSky.
  ///
  /// In en, this message translates to:
  /// **'Sky'**
  String get assetSky;

  /// No description provided for @assetMinimalGray.
  ///
  /// In en, this message translates to:
  /// **'Minimal Gray'**
  String get assetMinimalGray;

  /// No description provided for @assetDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get assetDarkMode;

  /// No description provided for @assetSoftBlue.
  ///
  /// In en, this message translates to:
  /// **'Soft Blue'**
  String get assetSoftBlue;

  /// No description provided for @assetWarmBeige.
  ///
  /// In en, this message translates to:
  /// **'Warm Beige'**
  String get assetWarmBeige;

  /// No description provided for @assetCat.
  ///
  /// In en, this message translates to:
  /// **'Cat {number}'**
  String assetCat(int number);

  /// No description provided for @assetDog.
  ///
  /// In en, this message translates to:
  /// **'Dog {number}'**
  String assetDog(int number);

  /// No description provided for @assetSea.
  ///
  /// In en, this message translates to:
  /// **'Sea {number}'**
  String assetSea(int number);

  /// No description provided for @categoryCharacter.
  ///
  /// In en, this message translates to:
  /// **'Character'**
  String get categoryCharacter;

  /// No description provided for @categoryAnimal.
  ///
  /// In en, this message translates to:
  /// **'Animal'**
  String get categoryAnimal;

  /// No description provided for @categoryIllustration.
  ///
  /// In en, this message translates to:
  /// **'Illustration'**
  String get categoryIllustration;

  /// No description provided for @categoryLandscape.
  ///
  /// In en, this message translates to:
  /// **'Landscape'**
  String get categoryLandscape;

  /// No description provided for @categorySimple.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get categorySimple;

  /// No description provided for @alarmBackground.
  ///
  /// In en, this message translates to:
  /// **'Alarm Background'**
  String get alarmBackground;

  /// No description provided for @random.
  ///
  /// In en, this message translates to:
  /// **'Random'**
  String get random;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @selectSolidColor.
  ///
  /// In en, this message translates to:
  /// **'Select Solid Color'**
  String get selectSolidColor;

  /// No description provided for @deleteColor.
  ///
  /// In en, this message translates to:
  /// **'Delete Color'**
  String get deleteColor;

  /// No description provided for @deleteColorConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this color from the list?'**
  String get deleteColorConfirm;

  /// No description provided for @randomBackgroundDesc.
  ///
  /// In en, this message translates to:
  /// **'A new background every time the alarm rings!'**
  String get randomBackgroundDesc;

  /// No description provided for @backgroundDeleted.
  ///
  /// In en, this message translates to:
  /// **'Background image deleted.'**
  String get backgroundDeleted;

  /// No description provided for @pickFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Pick from device'**
  String get pickFromDevice;

  /// No description provided for @alarmSaveError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save alarm. An unknown error occurred.'**
  String get alarmSaveError;

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

  /// No description provided for @videoLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load video\nTap to retry'**
  String get videoLoadFailed;

  /// No description provided for @itsTimeToWakeUp.
  ///
  /// In en, this message translates to:
  /// **'Time to wake up!'**
  String get itsTimeToWakeUp;

  /// No description provided for @dismissAlarm.
  ///
  /// In en, this message translates to:
  /// **'Stop Alarm'**
  String get dismissAlarm;

  /// No description provided for @slideToDismiss.
  ///
  /// In en, this message translates to:
  /// **'Swipe to turn off'**
  String get slideToDismiss;

  /// No description provided for @snoozeInfo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m x {count}'**
  String snoozeInfo(String minutes, String count);

  /// No description provided for @snoozeInfoUnlimited.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m · Unlimited'**
  String snoozeInfoUnlimited(String minutes);

  /// No description provided for @noActiveAlarms.
  ///
  /// In en, this message translates to:
  /// **'No active alarms'**
  String get noActiveAlarms;

  /// No description provided for @wealth.
  ///
  /// In en, this message translates to:
  /// **'Wealth'**
  String get wealth;

  /// No description provided for @love.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get love;

  /// No description provided for @career.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get career;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @faceAnalysisBasic.
  ///
  /// In en, this message translates to:
  /// **'Basic Face Analysis'**
  String get faceAnalysisBasic;

  /// No description provided for @insufficientDataOverallImpression.
  ///
  /// In en, this message translates to:
  /// **'Limited data; interpreting based on overall impression.'**
  String get insufficientDataOverallImpression;

  /// No description provided for @noseStabilityWealthAccuracy.
  ///
  /// In en, this message translates to:
  /// **'A clearer nose contour would improve wealth fortune accuracy.'**
  String get noseStabilityWealthAccuracy;

  /// No description provided for @mouthClarityInterpersonalAccuracy.
  ///
  /// In en, this message translates to:
  /// **'A clearer mouth contour would refine relationship fortune accuracy.'**
  String get mouthClarityInterpersonalAccuracy;

  /// No description provided for @improveAnalysisQualityAdvice.
  ///
  /// In en, this message translates to:
  /// **'Better lighting and facing the camera directly will improve analysis.'**
  String get improveAnalysisQualityAdvice;

  /// No description provided for @basicAnalysisDescription.
  ///
  /// In en, this message translates to:
  /// **'This result is a general interpretation due to limited facial contour data.\nFor more specific scores, please retry in a brighter environment while facing the camera directly.'**
  String get basicAnalysisDescription;

  /// No description provided for @defaultDailyFortune.
  ///
  /// In en, this message translates to:
  /// **'Start your day with a peaceful mind.\nA smile in the mirror will bring positive energy.\nA moment of calm may bring unexpected luck.'**
  String get defaultDailyFortune;

  /// No description provided for @dailyFortuneHeadline.
  ///
  /// In en, this message translates to:
  /// **'{vibe}Today, your {topKey} luck is strongest, while your {bottomKey} luck requires extra care.'**
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey);

  /// No description provided for @faceShapeVLine.
  ///
  /// In en, this message translates to:
  /// **'V-line'**
  String get faceShapeVLine;

  /// No description provided for @faceShapeSquare.
  ///
  /// In en, this message translates to:
  /// **'Square'**
  String get faceShapeSquare;

  /// No description provided for @faceShapeBalanced.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get faceShapeBalanced;

  /// No description provided for @faceShapeRound.
  ///
  /// In en, this message translates to:
  /// **'Round'**
  String get faceShapeRound;

  /// No description provided for @faceShapeLong.
  ///
  /// In en, this message translates to:
  /// **'Long'**
  String get faceShapeLong;

  /// No description provided for @faceShapeOval.
  ///
  /// In en, this message translates to:
  /// **'Oval'**
  String get faceShapeOval;

  /// No description provided for @titleWealthOriented.
  ///
  /// In en, this message translates to:
  /// **'Wealth-attracting face'**
  String get titleWealthOriented;

  /// No description provided for @titleLoveStrong.
  ///
  /// In en, this message translates to:
  /// **'Romantic & charming face'**
  String get titleLoveStrong;

  /// No description provided for @titleCareerNotable.
  ///
  /// In en, this message translates to:
  /// **'Natural leader face'**
  String get titleCareerNotable;

  /// No description provided for @titleStableEnergy.
  ///
  /// In en, this message translates to:
  /// **'Stable & grounded face'**
  String get titleStableEnergy;

  /// No description provided for @faceAnalysisComplete.
  ///
  /// In en, this message translates to:
  /// **'Face analysis complete!'**
  String get faceAnalysisComplete;

  /// No description provided for @chooseUnlockMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose a method below to unlock your hidden facial fortune.'**
  String get chooseUnlockMethod;

  /// No description provided for @watchAdForFreeResult.
  ///
  /// In en, this message translates to:
  /// **'Watch ad for free'**
  String get watchAdForFreeResult;

  /// No description provided for @useTwoCookies.
  ///
  /// In en, this message translates to:
  /// **'Use 2 Cookies'**
  String get useTwoCookies;

  /// No description provided for @checkResult.
  ///
  /// In en, this message translates to:
  /// **'View Results'**
  String get checkResult;

  /// No description provided for @aiAnalyzingFace.
  ///
  /// In en, this message translates to:
  /// **'AI is analyzing your face...'**
  String get aiAnalyzingFace;

  /// No description provided for @faceRecognitionComplete.
  ///
  /// In en, this message translates to:
  /// **'Recognition complete'**
  String get faceRecognitionComplete;

  /// No description provided for @extractingFeatures.
  ///
  /// In en, this message translates to:
  /// **'Extracting features...'**
  String get extractingFeatures;

  /// No description provided for @matchingFortuneData.
  ///
  /// In en, this message translates to:
  /// **'Matching data...'**
  String get matchingFortuneData;

  /// No description provided for @adLoadFailedFreeUnlock.
  ///
  /// In en, this message translates to:
  /// **'Ad failed to load. Results unlocked for free!'**
  String get adLoadFailedFreeUnlock;

  /// No description provided for @insufficientCookies.
  ///
  /// In en, this message translates to:
  /// **'Not Enough Cookies'**
  String get insufficientCookies;

  /// No description provided for @insufficientCookiesDesc.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough cookies.\nWatch an ad to check for free!'**
  String get insufficientCookiesDesc;

  /// No description provided for @usingTwoCookiesToast.
  ///
  /// In en, this message translates to:
  /// **'Using 2 Cookies to unlock results.'**
  String get usingTwoCookiesToast;

  /// No description provided for @todaysFaceAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Face Analysis'**
  String get todaysFaceAnalysis;

  /// No description provided for @totalScoreWithPoints.
  ///
  /// In en, this message translates to:
  /// **'Total Score: {score} pts'**
  String totalScoreWithPoints(int score);

  /// No description provided for @adLoadFailFreeAccess.
  ///
  /// In en, this message translates to:
  /// **'Ad failed to load. Results unlocked for free!'**
  String get adLoadFailFreeAccess;

  /// No description provided for @insufficientCookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Not Enough Fortune Cookies'**
  String get insufficientCookiesTitle;

  /// No description provided for @insufficientCookiesMessage.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough fortune cookies.\nYou can earn more by completing missions or watching ads.'**
  String get insufficientCookiesMessage;

  /// No description provided for @useCookiesSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Using 2 Cookies to check results.'**
  String get useCookiesSnackbar;

  /// No description provided for @faceAnalysisComplete_v2.
  ///
  /// In en, this message translates to:
  /// **'Face analysis is complete!'**
  String get faceAnalysisComplete_v2;

  /// No description provided for @chooseMethodToViewResult.
  ///
  /// In en, this message translates to:
  /// **'Choose a method below to check your hidden facial fortune.'**
  String get chooseMethodToViewResult;

  /// No description provided for @watchAdForFree.
  ///
  /// In en, this message translates to:
  /// **'Watch ad for free'**
  String get watchAdForFree;

  /// No description provided for @useTwoCookies_v2.
  ///
  /// In en, this message translates to:
  /// **'Use 2 Cookies'**
  String get useTwoCookies_v2;

  /// No description provided for @viewResult.
  ///
  /// In en, this message translates to:
  /// **'View Results'**
  String get viewResult;

  /// No description provided for @aiAnalyzingFace_v2.
  ///
  /// In en, this message translates to:
  /// **'AI is analyzing your face...'**
  String get aiAnalyzingFace_v2;

  /// No description provided for @faceRecognitionComplete_v2.
  ///
  /// In en, this message translates to:
  /// **'Recognition complete'**
  String get faceRecognitionComplete_v2;

  /// No description provided for @extractingFeatures_v2.
  ///
  /// In en, this message translates to:
  /// **'Extracting features...'**
  String get extractingFeatures_v2;

  /// No description provided for @matchingFortuneData_v2.
  ///
  /// In en, this message translates to:
  /// **'Matching data...'**
  String get matchingFortuneData_v2;

  /// No description provided for @wealthLuck.
  ///
  /// In en, this message translates to:
  /// **'💰 Wealth'**
  String get wealthLuck;

  /// No description provided for @loveLuck.
  ///
  /// In en, this message translates to:
  /// **'❤️ Love'**
  String get loveLuck;

  /// No description provided for @careerLuck.
  ///
  /// In en, this message translates to:
  /// **'💼 Career'**
  String get careerLuck;

  /// No description provided for @healthLuck.
  ///
  /// In en, this message translates to:
  /// **'💪 Health'**
  String get healthLuck;

  /// No description provided for @tojeongMonthlyGood_0.
  ///
  /// In en, this message translates to:
  /// **'A noble person from the east brings good news. Long-awaited plans will come to fruition.'**
  String get tojeongMonthlyGood_0;

  /// No description provided for @tojeongMonthlyGood_1.
  ///
  /// In en, this message translates to:
  /// **'Wealth flows in like a spring. Worries disappear as everything goes smoothly.'**
  String get tojeongMonthlyGood_1;

  /// No description provided for @tojeongMonthlyGood_2.
  ///
  /// In en, this message translates to:
  /// **'Efforts bear fruit and you receive congratulations. Promotion or great results are expected.'**
  String get tojeongMonthlyGood_2;

  /// No description provided for @tojeongMonthlyGood_3.
  ///
  /// In en, this message translates to:
  /// **'Morning sun rises after a dark night. Hardship ends and happiness arrives.'**
  String get tojeongMonthlyGood_3;

  /// No description provided for @tojeongMonthlyGood_4.
  ///
  /// In en, this message translates to:
  /// **'Unexpected windfall fills your pocket. Small investments lead to big profits.'**
  String get tojeongMonthlyGood_4;

  /// No description provided for @tojeongMonthlyNeutral_0.
  ///
  /// In en, this message translates to:
  /// **'A peaceful daily life continues. It passes without special events.'**
  String get tojeongMonthlyNeutral_0;

  /// No description provided for @tojeongMonthlyNeutral_1.
  ///
  /// In en, this message translates to:
  /// **'Contentment brings peace of mind. Enjoy small happiness.'**
  String get tojeongMonthlyNeutral_1;

  /// No description provided for @tojeongMonthlyNeutral_2.
  ///
  /// In en, this message translates to:
  /// **'Take a rest in your busy life. Pay attention to health management.'**
  String get tojeongMonthlyNeutral_2;

  /// No description provided for @tojeongMonthlyNeutral_3.
  ///
  /// In en, this message translates to:
  /// **'Maintain your current work rather than starting something new.'**
  String get tojeongMonthlyNeutral_3;

  /// No description provided for @tojeongMonthlyNeutral_4.
  ///
  /// In en, this message translates to:
  /// **'Communication is key. Be careful with words to avoid misunderstandings.'**
  String get tojeongMonthlyNeutral_4;

  /// No description provided for @tojeongMonthlyCaution_0.
  ///
  /// In en, this message translates to:
  /// **'Be cautious in everything. Better safe than sorry.'**
  String get tojeongMonthlyCaution_0;

  /// No description provided for @tojeongMonthlyCaution_1.
  ///
  /// In en, this message translates to:
  /// **'Pay attention to health and avoid overexertion.'**
  String get tojeongMonthlyCaution_1;

  /// No description provided for @tojeongMonthlyCaution_2.
  ///
  /// In en, this message translates to:
  /// **'Avoid gossip and stay out of others\' business.'**
  String get tojeongMonthlyCaution_2;

  /// No description provided for @tojeongMonthlyCaution_3.
  ///
  /// In en, this message translates to:
  /// **'Excessive greed brings trouble. Live within your means.'**
  String get tojeongMonthlyCaution_3;

  /// No description provided for @tojeongMonthlyCaution_4.
  ///
  /// In en, this message translates to:
  /// **'Avoid money transactions as you might be disappointed in people you trust.'**
  String get tojeongMonthlyCaution_4;

  /// No description provided for @tojeongMonthlySpecial_1_0.
  ///
  /// In en, this message translates to:
  /// **'New year\'s clear energy is with you. Plans will start smoothly.'**
  String get tojeongMonthlySpecial_1_0;

  /// No description provided for @tojeongMonthlySpecial_1_1.
  ///
  /// In en, this message translates to:
  /// **'A helper appears early this year. Value your relationships.'**
  String get tojeongMonthlySpecial_1_1;

  /// No description provided for @tojeongMonthlySpecial_1_2.
  ///
  /// In en, this message translates to:
  /// **'A fresh start brings unexpected opportunities. Stay open-minded.'**
  String get tojeongMonthlySpecial_1_2;

  /// No description provided for @tojeongMonthlySpecial_1_3.
  ///
  /// In en, this message translates to:
  /// **'Your focus and determination will lead to a significant breakthrough.'**
  String get tojeongMonthlySpecial_1_3;

  /// No description provided for @tojeongMonthlySpecial_1_4.
  ///
  /// In en, this message translates to:
  /// **'Wisdom from the past will guide you through new challenges.'**
  String get tojeongMonthlySpecial_1_4;

  /// No description provided for @tojeongMonthlySpecial_2_0.
  ///
  /// In en, this message translates to:
  /// **'Not yet the time. Build strength and wait for the opportunity.'**
  String get tojeongMonthlySpecial_2_0;

  /// No description provided for @tojeongMonthlySpecial_2_1.
  ///
  /// In en, this message translates to:
  /// **'Old issues may resurface. Solve them head-on.'**
  String get tojeongMonthlySpecial_2_1;

  /// No description provided for @tojeongMonthlySpecial_2_2.
  ///
  /// In en, this message translates to:
  /// **'Patience is your best ally this month. Observe and learn.'**
  String get tojeongMonthlySpecial_2_2;

  /// No description provided for @tojeongMonthlySpecial_2_3.
  ///
  /// In en, this message translates to:
  /// **'Avoid hasty decisions. A better moment is approaching soon.'**
  String get tojeongMonthlySpecial_2_3;

  /// No description provided for @tojeongMonthlySpecial_2_4.
  ///
  /// In en, this message translates to:
  /// **'Small steps today will lead to big gains in the future.'**
  String get tojeongMonthlySpecial_2_4;

  /// No description provided for @tojeongMonthlySpecial_3_0.
  ///
  /// In en, this message translates to:
  /// **'Everything is reviving. Don\'t hesitate and take on challenges.'**
  String get tojeongMonthlySpecial_3_0;

  /// No description provided for @tojeongMonthlySpecial_3_1.
  ///
  /// In en, this message translates to:
  /// **'New connections may begin. A positive mind brings good results.'**
  String get tojeongMonthlySpecial_3_1;

  /// No description provided for @tojeongMonthlySpecial_3_2.
  ///
  /// In en, this message translates to:
  /// **'Growth is happening in unexpected areas. Embrace the change.'**
  String get tojeongMonthlySpecial_3_2;

  /// No description provided for @tojeongMonthlySpecial_3_3.
  ///
  /// In en, this message translates to:
  /// **'Your energy is contagious. Lead with kindness and courage.'**
  String get tojeongMonthlySpecial_3_3;

  /// No description provided for @tojeongMonthlySpecial_3_4.
  ///
  /// In en, this message translates to:
  /// **'Spring brings a wave of creativity. Express your ideas freely.'**
  String get tojeongMonthlySpecial_3_4;

  /// No description provided for @tojeongMonthlySpecial_4_0.
  ///
  /// In en, this message translates to:
  /// **'Wealth luck rises with warmth. Efforts lead to financial rewards.'**
  String get tojeongMonthlySpecial_4_0;

  /// No description provided for @tojeongMonthlySpecial_4_1.
  ///
  /// In en, this message translates to:
  /// **'Good results in contracts or exams. Review carefully.'**
  String get tojeongMonthlySpecial_4_1;

  /// No description provided for @tojeongMonthlySpecial_4_2.
  ///
  /// In en, this message translates to:
  /// **'Stability in your career is highlighted. Keep up the good work.'**
  String get tojeongMonthlySpecial_4_2;

  /// No description provided for @tojeongMonthlySpecial_4_3.
  ///
  /// In en, this message translates to:
  /// **'Financial planning now will yield great benefits later this year.'**
  String get tojeongMonthlySpecial_4_3;

  /// No description provided for @tojeongMonthlySpecial_4_4.
  ///
  /// In en, this message translates to:
  /// **'A fruitful partnership may develop. Collaborate for success.'**
  String get tojeongMonthlySpecial_4_4;

  /// No description provided for @tojeongMonthlySpecial_5_0.
  ///
  /// In en, this message translates to:
  /// **'Harmony at home brings stability and joy.'**
  String get tojeongMonthlySpecial_5_0;

  /// No description provided for @tojeongMonthlySpecial_5_1.
  ///
  /// In en, this message translates to:
  /// **'Kindness to others returns as blessings.'**
  String get tojeongMonthlySpecial_5_1;

  /// No description provided for @tojeongMonthlySpecial_5_2.
  ///
  /// In en, this message translates to:
  /// **'Peace and tranquility surround you. Cherish these moments.'**
  String get tojeongMonthlySpecial_5_2;

  /// No description provided for @tojeongMonthlySpecial_5_3.
  ///
  /// In en, this message translates to:
  /// **'Family bonds are strengthened through open communication.'**
  String get tojeongMonthlySpecial_5_3;

  /// No description provided for @tojeongMonthlySpecial_5_4.
  ///
  /// In en, this message translates to:
  /// **'Your inner light shines brightly. Inspire those around you.'**
  String get tojeongMonthlySpecial_5_4;

  /// No description provided for @tojeongMonthlySpecial_6_0.
  ///
  /// In en, this message translates to:
  /// **'Efforts are recognized. Opportunities for promotion or honor.'**
  String get tojeongMonthlySpecial_6_0;

  /// No description provided for @tojeongMonthlySpecial_6_1.
  ///
  /// In en, this message translates to:
  /// **'Strong active energy. Consider expansion or career change.'**
  String get tojeongMonthlySpecial_6_1;

  /// No description provided for @tojeongMonthlySpecial_6_2.
  ///
  /// In en, this message translates to:
  /// **'Your leadership skills are in demand. Take charge with confidence.'**
  String get tojeongMonthlySpecial_6_2;

  /// No description provided for @tojeongMonthlySpecial_6_3.
  ///
  /// In en, this message translates to:
  /// **'A major goal is within reach. Stay focused on the finish line.'**
  String get tojeongMonthlySpecial_6_3;

  /// No description provided for @tojeongMonthlySpecial_6_4.
  ///
  /// In en, this message translates to:
  /// **'New professional horizons are opening. Be ready to explore.'**
  String get tojeongMonthlySpecial_6_4;

  /// No description provided for @tojeongMonthlySpecial_7_0.
  ///
  /// In en, this message translates to:
  /// **'Passion leads to performance. Bold moves achieve goals.'**
  String get tojeongMonthlySpecial_7_0;

  /// No description provided for @tojeongMonthlySpecial_7_1.
  ///
  /// In en, this message translates to:
  /// **'Meet a helper or find new opportunities while traveling.'**
  String get tojeongMonthlySpecial_7_1;

  /// No description provided for @tojeongMonthlySpecial_7_2.
  ///
  /// In en, this message translates to:
  /// **'Adventure calls. A change of scenery will refresh your spirit.'**
  String get tojeongMonthlySpecial_7_2;

  /// No description provided for @tojeongMonthlySpecial_7_3.
  ///
  /// In en, this message translates to:
  /// **'Your enthusiasm attracts positive outcomes. Dream big.'**
  String get tojeongMonthlySpecial_7_3;

  /// No description provided for @tojeongMonthlySpecial_7_4.
  ///
  /// In en, this message translates to:
  /// **'Dynamic energy fuels your progress. Keep moving forward.'**
  String get tojeongMonthlySpecial_7_4;

  /// No description provided for @tojeongMonthlySpecial_8_0.
  ///
  /// In en, this message translates to:
  /// **'Patience pays off. Luck starts to open up gradually.'**
  String get tojeongMonthlySpecial_8_0;

  /// No description provided for @tojeongMonthlySpecial_8_1.
  ///
  /// In en, this message translates to:
  /// **'Old problems find solutions. Use your wisdom.'**
  String get tojeongMonthlySpecial_8_1;

  /// No description provided for @tojeongMonthlySpecial_8_2.
  ///
  /// In en, this message translates to:
  /// **'Steadiness and persistence will overcome any obstacle.'**
  String get tojeongMonthlySpecial_8_2;

  /// No description provided for @tojeongMonthlySpecial_8_3.
  ///
  /// In en, this message translates to:
  /// **'Reflection brings clarity. Understand your true path.'**
  String get tojeongMonthlySpecial_8_3;

  /// No description provided for @tojeongMonthlySpecial_8_4.
  ///
  /// In en, this message translates to:
  /// **'Good news arrives from a distance. Be prepared for joy.'**
  String get tojeongMonthlySpecial_8_4;

  /// No description provided for @tojeongMonthlySpecial_9_0.
  ///
  /// In en, this message translates to:
  /// **'Wealth and love are abundant like the harvest season.'**
  String get tojeongMonthlySpecial_9_0;

  /// No description provided for @tojeongMonthlySpecial_9_1.
  ///
  /// In en, this message translates to:
  /// **'Better than expected results for your hard work.'**
  String get tojeongMonthlySpecial_9_1;

  /// No description provided for @tojeongMonthlySpecial_9_2.
  ///
  /// In en, this message translates to:
  /// **'Gratitude attracts more abundance. Share your success.'**
  String get tojeongMonthlySpecial_9_2;

  /// No description provided for @tojeongMonthlySpecial_9_3.
  ///
  /// In en, this message translates to:
  /// **'Emotional fulfillment is at its peak. Enjoy the love.'**
  String get tojeongMonthlySpecial_9_3;

  /// No description provided for @tojeongMonthlySpecial_9_4.
  ///
  /// In en, this message translates to:
  /// **'Your efforts are bearing sweet fruit. Celebrate your wins.'**
  String get tojeongMonthlySpecial_9_4;

  /// No description provided for @tojeongMonthlySpecial_10_0.
  ///
  /// In en, this message translates to:
  /// **'Honor rises and your name becomes known.'**
  String get tojeongMonthlySpecial_10_0;

  /// No description provided for @tojeongMonthlySpecial_10_1.
  ///
  /// In en, this message translates to:
  /// **'Great results in intellectual activities. Focus on studies.'**
  String get tojeongMonthlySpecial_10_1;

  /// No description provided for @tojeongMonthlySpecial_10_2.
  ///
  /// In en, this message translates to:
  /// **'Recognition for your expertise is coming. Speak your truth.'**
  String get tojeongMonthlySpecial_10_2;

  /// No description provided for @tojeongMonthlySpecial_10_3.
  ///
  /// In en, this message translates to:
  /// **'Academic or professional success is highly likely this month.'**
  String get tojeongMonthlySpecial_10_3;

  /// No description provided for @tojeongMonthlySpecial_10_4.
  ///
  /// In en, this message translates to:
  /// **'Your influence is growing. Use it for the greater good.'**
  String get tojeongMonthlySpecial_10_4;

  /// No description provided for @tojeongMonthlySpecial_11_0.
  ///
  /// In en, this message translates to:
  /// **'Time for wisdom and reflection. Prepare for the future.'**
  String get tojeongMonthlySpecial_11_0;

  /// No description provided for @tojeongMonthlySpecial_11_1.
  ///
  /// In en, this message translates to:
  /// **'Financial stability, but avoid risky investments.'**
  String get tojeongMonthlySpecial_11_1;

  /// No description provided for @tojeongMonthlySpecial_11_2.
  ///
  /// In en, this message translates to:
  /// **'Inner peace is found through meditation and quiet time.'**
  String get tojeongMonthlySpecial_11_2;

  /// No description provided for @tojeongMonthlySpecial_11_3.
  ///
  /// In en, this message translates to:
  /// **'Strategic thinking now will set you up for a great next year.'**
  String get tojeongMonthlySpecial_11_3;

  /// No description provided for @tojeongMonthlySpecial_11_4.
  ///
  /// In en, this message translates to:
  /// **'Trust your intuition. It will guide you to safety and success.'**
  String get tojeongMonthlySpecial_11_4;

  /// No description provided for @tojeongMonthlySpecial_12_0.
  ///
  /// In en, this message translates to:
  /// **'Unexpected luck at year-end. Look forward to good news.'**
  String get tojeongMonthlySpecial_12_0;

  /// No description provided for @tojeongMonthlySpecial_12_1.
  ///
  /// In en, this message translates to:
  /// **'Rewards for long-term efforts. A successful conclusion.'**
  String get tojeongMonthlySpecial_12_1;

  /// No description provided for @tojeongMonthlySpecial_12_2.
  ///
  /// In en, this message translates to:
  /// **'The year ends on a high note. Be proud of your journey.'**
  String get tojeongMonthlySpecial_12_2;

  /// No description provided for @tojeongMonthlySpecial_12_3.
  ///
  /// In en, this message translates to:
  /// **'New doors are opening as old ones close. Welcome the future.'**
  String get tojeongMonthlySpecial_12_3;

  /// No description provided for @tojeongMonthlySpecial_12_4.
  ///
  /// In en, this message translates to:
  /// **'Generosity brings its own rewards. Spread holiday cheer.'**
  String get tojeongMonthlySpecial_12_4;

  /// No description provided for @todaysFaceFortune.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Face Fortune'**
  String get todaysFaceFortune;

  /// No description provided for @detailedAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Detailed Analysis'**
  String get detailedAnalysis;

  /// No description provided for @eyeInsight.
  ///
  /// In en, this message translates to:
  /// **'👁️ Eye (Insight)'**
  String get eyeInsight;

  /// No description provided for @noseWealth.
  ///
  /// In en, this message translates to:
  /// **'👃 Nose (Wealth)'**
  String get noseWealth;

  /// No description provided for @mouthLateLuck.
  ///
  /// In en, this message translates to:
  /// **'👄 Mouth (Late Luck)'**
  String get mouthLateLuck;

  /// No description provided for @overallAnalysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Overall Analysis'**
  String get overallAnalysisTitle;

  /// No description provided for @shareResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Face Result'**
  String get shareResultTitle;

  /// No description provided for @shareResultDesc.
  ///
  /// In en, this message translates to:
  /// **'AI face analysis result.\n{title}'**
  String shareResultDesc(String title);

  /// No description provided for @shareResultTotalScore.
  ///
  /// In en, this message translates to:
  /// **'Total Score'**
  String get shareResultTotalScore;

  /// No description provided for @shareResultWealth.
  ///
  /// In en, this message translates to:
  /// **'Wealth Luck'**
  String get shareResultWealth;

  /// No description provided for @shareResultLove.
  ///
  /// In en, this message translates to:
  /// **'Love Luck'**
  String get shareResultLove;

  /// No description provided for @shareResultCareer.
  ///
  /// In en, this message translates to:
  /// **'Career Luck'**
  String get shareResultCareer;

  /// No description provided for @shareResultHealth.
  ///
  /// In en, this message translates to:
  /// **'Health Luck'**
  String get shareResultHealth;

  /// No description provided for @shareResultText.
  ///
  /// In en, this message translates to:
  /// **'Share Result'**
  String get shareResultText;

  /// No description provided for @wakeUpComplete.
  ///
  /// In en, this message translates to:
  /// **'Wake up complete!'**
  String get wakeUpComplete;

  /// No description provided for @collapseOptions.
  ///
  /// In en, this message translates to:
  /// **'Collapse Options'**
  String get collapseOptions;

  /// No description provided for @expandOptions.
  ///
  /// In en, this message translates to:
  /// **'More Options'**
  String get expandOptions;

  /// No description provided for @snoozeAlarm.
  ///
  /// In en, this message translates to:
  /// **'Snooze Alarm'**
  String get snoozeAlarm;

  /// No description provided for @interval.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get interval;

  /// No description provided for @maxSnoozeCount.
  ///
  /// In en, this message translates to:
  /// **'Max Snooze Count'**
  String get maxSnoozeCount;

  /// No description provided for @unlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get unlimited;

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// No description provided for @exactAlarmFailMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. Exact alarm permission is off and needs setting.'**
  String get exactAlarmFailMessage;

  /// No description provided for @batteryOptimFailMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. Battery optimization exception permission is missing.'**
  String get batteryOptimFailMessage;

  /// No description provided for @overlayFailMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to register alarm. Display over other apps permission is missing.'**
  String get overlayFailMessage;

  /// No description provided for @loadingDelay.
  ///
  /// In en, this message translates to:
  /// **'Loading delay'**
  String get loadingDelay;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @previewFail.
  ///
  /// In en, this message translates to:
  /// **'Preview failed'**
  String get previewFail;

  /// No description provided for @bgDefault.
  ///
  /// In en, this message translates to:
  /// **'Default Background'**
  String get bgDefault;

  /// No description provided for @bgFortuneFriends.
  ///
  /// In en, this message translates to:
  /// **'Fortune Friends'**
  String get bgFortuneFriends;

  /// No description provided for @bgMongChuni.
  ///
  /// In en, this message translates to:
  /// **'Mongchuni'**
  String get bgMongChuni;

  /// No description provided for @bgPanChuni.
  ///
  /// In en, this message translates to:
  /// **'Panchuni'**
  String get bgPanChuni;

  /// No description provided for @bgToChuni.
  ///
  /// In en, this message translates to:
  /// **'Tochuni'**
  String get bgToChuni;

  /// No description provided for @bgHoChuni.
  ///
  /// In en, this message translates to:
  /// **'Hochuni'**
  String get bgHoChuni;

  /// No description provided for @bgBear.
  ///
  /// In en, this message translates to:
  /// **'Bear'**
  String get bgBear;

  /// No description provided for @bgMoon.
  ///
  /// In en, this message translates to:
  /// **'Moon'**
  String get bgMoon;

  /// No description provided for @bgSea.
  ///
  /// In en, this message translates to:
  /// **'Sea'**
  String get bgSea;

  /// No description provided for @bgBridge.
  ///
  /// In en, this message translates to:
  /// **'Bridge'**
  String get bgBridge;

  /// No description provided for @bgRoad.
  ///
  /// In en, this message translates to:
  /// **'Road'**
  String get bgRoad;

  /// No description provided for @bgSky.
  ///
  /// In en, this message translates to:
  /// **'Sky'**
  String get bgSky;

  /// No description provided for @bgMinimalGray.
  ///
  /// In en, this message translates to:
  /// **'Minimal Gray'**
  String get bgMinimalGray;

  /// No description provided for @bgDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get bgDarkMode;

  /// No description provided for @bgSoftBlue.
  ///
  /// In en, this message translates to:
  /// **'Soft Blue'**
  String get bgSoftBlue;

  /// No description provided for @bgWarmBeige.
  ///
  /// In en, this message translates to:
  /// **'Warm Beige'**
  String get bgWarmBeige;

  /// No description provided for @dateFormatMdyE.
  ///
  /// In en, this message translates to:
  /// **'MMM d (E)'**
  String get dateFormatMdyE;

  /// No description provided for @deleteAlarm.
  ///
  /// In en, this message translates to:
  /// **'Delete Alarm'**
  String get deleteAlarm;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get confirmDelete;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @wealthLuckWithIcon.
  ///
  /// In en, this message translates to:
  /// **'💰 Wealth Luck'**
  String get wealthLuckWithIcon;

  /// No description provided for @loveLuckWithIcon.
  ///
  /// In en, this message translates to:
  /// **'❤️ Love Luck'**
  String get loveLuckWithIcon;

  /// No description provided for @careerLuckWithIcon.
  ///
  /// In en, this message translates to:
  /// **'💼 Career Luck'**
  String get careerLuckWithIcon;

  /// No description provided for @healthLuckWithIcon.
  ///
  /// In en, this message translates to:
  /// **'💪 Health Luck'**
  String get healthLuckWithIcon;

  /// No description provided for @mouthFortune.
  ///
  /// In en, this message translates to:
  /// **'👄 Mouth (Maturity Luck)'**
  String get mouthFortune;

  /// No description provided for @comprehensiveAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Analysis'**
  String get comprehensiveAnalysis;

  /// No description provided for @todaysFaceResult.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Face Analysis Result'**
  String get todaysFaceResult;

  /// No description provided for @faceAnalysisShareDesc.
  ///
  /// In en, this message translates to:
  /// **'This is the AI face analysis result.\n{title}'**
  String faceAnalysisShareDesc(String title);

  /// No description provided for @shareResult.
  ///
  /// In en, this message translates to:
  /// **'Share Result'**
  String get shareResult;

  /// No description provided for @faceVibeSmile0.
  ///
  /// In en, this message translates to:
  /// **'Your bright smile spreads positive energy to everyone around you. '**
  String get faceVibeSmile0;

  /// No description provided for @faceVibeSmile1.
  ///
  /// In en, this message translates to:
  /// **'That radiant smile shows you\'re full of vibrant energy today. '**
  String get faceVibeSmile1;

  /// No description provided for @faceVibeSmile2.
  ///
  /// In en, this message translates to:
  /// **'Your gentle expression has a charming quality that attracts supportive people. '**
  String get faceVibeSmile2;

  /// No description provided for @faceVibeSmile3.
  ///
  /// In en, this message translates to:
  /// **'A confident smile will be your greatest asset in overcoming any obstacles today. '**
  String get faceVibeSmile3;

  /// No description provided for @faceVibeSmile4.
  ///
  /// In en, this message translates to:
  /// **'Your refreshing smile is clearing away stale energy, making room for good luck. '**
  String get faceVibeSmile4;

  /// No description provided for @faceVibeEye0.
  ///
  /// In en, this message translates to:
  /// **'Your sparkling eyes show a strong will to take charge of your day. '**
  String get faceVibeEye0;

  /// No description provided for @faceVibeEye1.
  ///
  /// In en, this message translates to:
  /// **'Those sharp, focused eyes suggest keen judgment and intuition. '**
  String get faceVibeEye1;

  /// No description provided for @faceVibeEye2.
  ///
  /// In en, this message translates to:
  /// **'Your clear, deep gaze reflects a sincere heart ready for good news. '**
  String get faceVibeEye2;

  /// No description provided for @faceVibeEye3.
  ///
  /// In en, this message translates to:
  /// **'Your dignified look and steady gaze will command respect today. '**
  String get faceVibeEye3;

  /// No description provided for @faceVibeEye4.
  ///
  /// In en, this message translates to:
  /// **'The passion in your eyes inspires trust and confidence in those around you. '**
  String get faceVibeEye4;

  /// No description provided for @faceVibeNeutral0.
  ///
  /// In en, this message translates to:
  /// **'Your peaceful and stable expression brings a sense of inner calm. '**
  String get faceVibeNeutral0;

  /// No description provided for @faceVibeNeutral1.
  ///
  /// In en, this message translates to:
  /// **'A calm complexion reflects your prudent and wise energy. '**
  String get faceVibeNeutral1;

  /// No description provided for @faceVibeNeutral2.
  ///
  /// In en, this message translates to:
  /// **'Your balanced features suggest a smooth and steady day ahead. '**
  String get faceVibeNeutral2;

  /// No description provided for @faceVibeNeutral3.
  ///
  /// In en, this message translates to:
  /// **'Your serious demeanor is perfect for making important decisions today. '**
  String get faceVibeNeutral3;

  /// No description provided for @faceVibeNeutral4.
  ///
  /// In en, this message translates to:
  /// **'Your composed expression puts others at ease, favoring smooth cooperation. '**
  String get faceVibeNeutral4;

  /// No description provided for @dailyFortuneWealth0.
  ///
  /// In en, this message translates to:
  /// **'With a strong focus on your features, a little organization will help your finances grow.'**
  String get dailyFortuneWealth0;

  /// No description provided for @dailyFortuneWealth1.
  ///
  /// In en, this message translates to:
  /// **'Your wealth-related energy is high today. Take a moment to double-check your calculations for extra profit.'**
  String get dailyFortuneWealth1;

  /// No description provided for @dailyFortuneWealth2.
  ///
  /// In en, this message translates to:
  /// **'Your balanced features suggest that careful attention to detail will lead to unexpected gains.'**
  String get dailyFortuneWealth2;

  /// No description provided for @dailyFortuneWealth3.
  ///
  /// In en, this message translates to:
  /// **'Your complexion shows promising wealth luck. Small profits may appear in unexpected places.'**
  String get dailyFortuneWealth3;

  /// No description provided for @dailyFortuneWealth4.
  ///
  /// In en, this message translates to:
  /// **'Your sharp focus today favors smart financial moves. It\'s a great day for investment or purchase decisions.'**
  String get dailyFortuneWealth4;

  /// No description provided for @dailyFortuneWealth5.
  ///
  /// In en, this message translates to:
  /// **'You have a strong energy for attracting wealth. Try organizing your wallet or reviewing your accounts.'**
  String get dailyFortuneWealth5;

  /// No description provided for @dailyFortuneWealth6.
  ///
  /// In en, this message translates to:
  /// **'Your features suggest a steady accumulation of wealth. Sincere efforts are beginning to pay off.'**
  String get dailyFortuneWealth6;

  /// No description provided for @dailyFortuneWealth7.
  ///
  /// In en, this message translates to:
  /// **'Stable financial luck is on your side. Consistent saving will serve you better than big spending.'**
  String get dailyFortuneWealth7;

  /// No description provided for @dailyFortuneWealth8.
  ///
  /// In en, this message translates to:
  /// **'Your keen observation will help you spot financial opportunities. Keep your ears open.'**
  String get dailyFortuneWealth8;

  /// No description provided for @dailyFortuneWealth9.
  ///
  /// In en, this message translates to:
  /// **'A prosperous energy surrounds you. Generosity today will return to you as even greater abundance.'**
  String get dailyFortuneWealth9;

  /// No description provided for @dailyFortuneLove0.
  ///
  /// In en, this message translates to:
  /// **'Your gentle expression suggests that being the first to reach out will soften any relationship tension.'**
  String get dailyFortuneLove0;

  /// No description provided for @dailyFortuneLove1.
  ///
  /// In en, this message translates to:
  /// **'A clear and honest look reduces misunderstandings. Sincerity is your best approach today.'**
  String get dailyFortuneLove1;

  /// No description provided for @dailyFortuneLove2.
  ///
  /// In en, this message translates to:
  /// **'Your bright complexion attracts supportive energy. Small acts of kindness will lead to great connections.'**
  String get dailyFortuneLove2;

  /// No description provided for @dailyFortuneLove3.
  ///
  /// In en, this message translates to:
  /// **'Your natural charm is especially noticeable today. Expect positive energy from new encounters.'**
  String get dailyFortuneLove3;

  /// No description provided for @dailyFortuneLove4.
  ///
  /// In en, this message translates to:
  /// **'Clear relationship energy helps resolve old conflicts and brings harmony.'**
  String get dailyFortuneLove4;

  /// No description provided for @dailyFortuneLove5.
  ///
  /// In en, this message translates to:
  /// **'Your approachable look opens hearts. Today, listening is your most powerful tool.'**
  String get dailyFortuneLove5;

  /// No description provided for @dailyFortuneLove6.
  ///
  /// In en, this message translates to:
  /// **'You have a face that naturally draws help. Don\'t hesitate to seek advice instead of worrying alone.'**
  String get dailyFortuneLove6;

  /// No description provided for @dailyFortuneLove7.
  ///
  /// In en, this message translates to:
  /// **'Your sincere gaze builds deep trust. Honoring your promises will lead to stronger bonds.'**
  String get dailyFortuneLove7;

  /// No description provided for @dailyFortuneLove8.
  ///
  /// In en, this message translates to:
  /// **'Harmonious energy fills your home and workplace. It\'s a day for laughter and joy.'**
  String get dailyFortuneLove8;

  /// No description provided for @dailyFortuneLove9.
  ///
  /// In en, this message translates to:
  /// **'The threads of connection are untangling beautifully. Express your gratitude to those you value.'**
  String get dailyFortuneLove9;

  /// No description provided for @dailyFortuneCareer0.
  ///
  /// In en, this message translates to:
  /// **'Your sharp focus will turn priorities into peak performance today.'**
  String get dailyFortuneCareer0;

  /// No description provided for @dailyFortuneCareer1.
  ///
  /// In en, this message translates to:
  /// **'Your keen observation stands out. Keep decisions simple and execution steady.'**
  String get dailyFortuneCareer1;

  /// No description provided for @dailyFortuneCareer2.
  ///
  /// In en, this message translates to:
  /// **'Clear energy in your eyes gives you the power to see every task through to the end.'**
  String get dailyFortuneCareer2;

  /// No description provided for @dailyFortuneCareer3.
  ///
  /// In en, this message translates to:
  /// **'Your natural leadership is showing. Your opinions will carry significant weight today.'**
  String get dailyFortuneCareer3;

  /// No description provided for @dailyFortuneCareer4.
  ///
  /// In en, this message translates to:
  /// **'Your judgment is at its peak. Even complex problems will find clear solutions today.'**
  String get dailyFortuneCareer4;

  /// No description provided for @dailyFortuneCareer5.
  ///
  /// In en, this message translates to:
  /// **'Your efficient work style is being noticed. You\'re in a strong position for promotion or achievement.'**
  String get dailyFortuneCareer5;

  /// No description provided for @dailyFortuneCareer6.
  ///
  /// In en, this message translates to:
  /// **'You have the perfect energy for starting new projects. Move forward with total confidence.'**
  String get dailyFortuneCareer6;

  /// No description provided for @dailyFortuneCareer7.
  ///
  /// In en, this message translates to:
  /// **'Work efficiency is rising. It\'s a great day to tackle those postponed tasks.'**
  String get dailyFortuneCareer7;

  /// No description provided for @dailyFortuneCareer8.
  ///
  /// In en, this message translates to:
  /// **'Creative ideas are flowing. Make it a habit to jot them down for future luck.'**
  String get dailyFortuneCareer8;

  /// No description provided for @dailyFortuneCareer9.
  ///
  /// In en, this message translates to:
  /// **'Your persistence and patience will be rewarded today. Focus until the end for great results.'**
  String get dailyFortuneCareer9;

  /// No description provided for @dailyFortuneHealth0.
  ///
  /// In en, this message translates to:
  /// **'A stable complexion suggests a quick recovery if you maintain a steady rhythm.'**
  String get dailyFortuneHealth0;

  /// No description provided for @dailyFortuneHealth1.
  ///
  /// In en, this message translates to:
  /// **'Your facial vitality is strong. Keep a comfortable pace without overdoing it.'**
  String get dailyFortuneHealth1;

  /// No description provided for @dailyFortuneHealth2.
  ///
  /// In en, this message translates to:
  /// **'Clear energy in your eyes and skin means a short rest will greatly boost your mood and focus.'**
  String get dailyFortuneHealth2;

  /// No description provided for @dailyFortuneHealth3.
  ///
  /// In en, this message translates to:
  /// **'Your body\'s rhythm is in perfect harmony. Light exercise will make your energy even clearer.'**
  String get dailyFortuneHealth3;

  /// No description provided for @dailyFortuneHealth4.
  ///
  /// In en, this message translates to:
  /// **'You\'re full of vibrant energy. You can power through the day without feeling drained.'**
  String get dailyFortuneHealth4;

  /// No description provided for @dailyFortuneHealth5.
  ///
  /// In en, this message translates to:
  /// **'Physical and mental stability are highlighted. Meditation or deep breathing will boost your luck.'**
  String get dailyFortuneHealth5;

  /// No description provided for @dailyFortuneHealth6.
  ///
  /// In en, this message translates to:
  /// **'Your resilience is high today. You\'ll bounce back quickly from any minor fatigue.'**
  String get dailyFortuneHealth6;

  /// No description provided for @dailyFortuneHealth7.
  ///
  /// In en, this message translates to:
  /// **'Your healthy glow is noticeable. Expect compliments on your vibrant appearance today.'**
  String get dailyFortuneHealth7;

  /// No description provided for @dailyFortuneHealth8.
  ///
  /// In en, this message translates to:
  /// **'A balanced diet and proper rest will strengthen your foundation of luck. Take care of your body.'**
  String get dailyFortuneHealth8;

  /// No description provided for @dailyFortuneHealth9.
  ///
  /// In en, this message translates to:
  /// **'Fresh air and staying hydrated are your best medicines today. Enjoy your vitality.'**
  String get dailyFortuneHealth9;

  /// No description provided for @dailyFortuneTipWealth0.
  ///
  /// In en, this message translates to:
  /// **'Check your spending and subscriptions one more time today.'**
  String get dailyFortuneTipWealth0;

  /// No description provided for @dailyFortuneTipWealth1.
  ///
  /// In en, this message translates to:
  /// **'Avoid impulsive buys; sticking to what you truly need is a major win.'**
  String get dailyFortuneTipWealth1;

  /// No description provided for @dailyFortuneTipWealth2.
  ///
  /// In en, this message translates to:
  /// **'Keep a record of financial discussions to prevent any future misunderstandings.'**
  String get dailyFortuneTipWealth2;

  /// No description provided for @dailyFortuneTipWealth3.
  ///
  /// In en, this message translates to:
  /// **'Keep an eye out for small \'leaks\' in your budget.'**
  String get dailyFortuneTipWealth3;

  /// No description provided for @dailyFortuneTipWealth4.
  ///
  /// In en, this message translates to:
  /// **'Temptation to spend is high today. Wait 10 minutes before making any purchase.'**
  String get dailyFortuneTipWealth4;

  /// No description provided for @dailyFortuneTipWealth5.
  ///
  /// In en, this message translates to:
  /// **'Be cautious with large transactions today. Seek expert advice if needed.'**
  String get dailyFortuneTipWealth5;

  /// No description provided for @dailyFortuneTipWealth6.
  ///
  /// In en, this message translates to:
  /// **'Clear up any outstanding debts or money owed to you today.'**
  String get dailyFortuneTipWealth6;

  /// No description provided for @dailyFortuneTipWealth7.
  ///
  /// In en, this message translates to:
  /// **'Watch your wallet. There\'s a slight energy of loss or waste around you today.'**
  String get dailyFortuneTipWealth7;

  /// No description provided for @dailyFortuneTipWealth8.
  ///
  /// In en, this message translates to:
  /// **'Prioritize practical gains over spending money just for appearances.'**
  String get dailyFortuneTipWealth8;

  /// No description provided for @dailyFortuneTipWealth9.
  ///
  /// In en, this message translates to:
  /// **'Fair play is the way to keep your luck. Avoid looking for shortcuts or freebies.'**
  String get dailyFortuneTipWealth9;

  /// No description provided for @dailyFortuneTipLove0.
  ///
  /// In en, this message translates to:
  /// **'If you\'re feeling on edge, take a breath before you respond to others.'**
  String get dailyFortuneTipLove0;

  /// No description provided for @dailyFortuneTipLove1.
  ///
  /// In en, this message translates to:
  /// **'A quick check-in is better than a long explanation if a misunderstanding arises.'**
  String get dailyFortuneTipLove1;

  /// No description provided for @dailyFortuneTipLove2.
  ///
  /// In en, this message translates to:
  /// **'Simply being on time will build significant trust today.'**
  String get dailyFortuneTipLove2;

  /// No description provided for @dailyFortuneTipLove3.
  ///
  /// In en, this message translates to:
  /// **'Get straight to the point to avoid unnecessary emotional drain.'**
  String get dailyFortuneTipLove3;

  /// No description provided for @dailyFortuneTipLove4.
  ///
  /// In en, this message translates to:
  /// **'Stay mindful of your manners, even with those you\'re closest to.'**
  String get dailyFortuneTipLove4;

  /// No description provided for @dailyFortuneTipLove5.
  ///
  /// In en, this message translates to:
  /// **'Try a compliment before a critique. It will open doors that were previously closed.'**
  String get dailyFortuneTipLove5;

  /// No description provided for @dailyFortuneTipLove6.
  ///
  /// In en, this message translates to:
  /// **'Think before you speak. Confirm important details in writing to be safe.'**
  String get dailyFortuneTipLove6;

  /// No description provided for @dailyFortuneTipLove7.
  ///
  /// In en, this message translates to:
  /// **'Staying out of other people\'s business is the best way to avoid rumors.'**
  String get dailyFortuneTipLove7;

  /// No description provided for @dailyFortuneTipLove8.
  ///
  /// In en, this message translates to:
  /// **'Keep it rational. Calm conversation is the key to healthy relationships today.'**
  String get dailyFortuneTipLove8;

  /// No description provided for @dailyFortuneTipLove9.
  ///
  /// In en, this message translates to:
  /// **'Double-check your schedule. Reliability is your most valuable asset today.'**
  String get dailyFortuneTipLove9;

  /// No description provided for @dailyFortuneTipCareer0.
  ///
  /// In en, this message translates to:
  /// **'Focus on finishing one task completely rather than starting several new ones.'**
  String get dailyFortuneTipCareer0;

  /// No description provided for @dailyFortuneTipCareer1.
  ///
  /// In en, this message translates to:
  /// **'Progress is better than perfection. Aim for \'done\' rather than \'flawless\' today.'**
  String get dailyFortuneTipCareer1;

  /// No description provided for @dailyFortuneTipCareer2.
  ///
  /// In en, this message translates to:
  /// **'Clear your head by finishing that one thing you\'ve been putting off.'**
  String get dailyFortuneTipCareer2;

  /// No description provided for @dailyFortuneTipCareer3.
  ///
  /// In en, this message translates to:
  /// **'Focus on your own responsibilities to keep your stress levels low.'**
  String get dailyFortuneTipCareer3;

  /// No description provided for @dailyFortuneTipCareer4.
  ///
  /// In en, this message translates to:
  /// **'Small errors can snowball. Don\'t skip your final review today.'**
  String get dailyFortuneTipCareer4;

  /// No description provided for @dailyFortuneTipCareer5.
  ///
  /// In en, this message translates to:
  /// **'Respect different opinions to avoid friction with colleagues or bosses.'**
  String get dailyFortuneTipCareer5;

  /// No description provided for @dailyFortuneTipCareer6.
  ///
  /// In en, this message translates to:
  /// **'Concentration might waver. Try working in 50-minute blocks with 10-minute breaks.'**
  String get dailyFortuneTipCareer6;

  /// No description provided for @dailyFortuneTipCareer7.
  ///
  /// In en, this message translates to:
  /// **'Don\'t take on more than you can handle. Knowing your limits is a strength.'**
  String get dailyFortuneTipCareer7;

  /// No description provided for @dailyFortuneTipCareer8.
  ///
  /// In en, this message translates to:
  /// **'Keep your professional and personal lives separate today.'**
  String get dailyFortuneTipCareer8;

  /// No description provided for @dailyFortuneTipCareer9.
  ///
  /// In en, this message translates to:
  /// **'Double-check recipients and attachments before hitting \'send\'.'**
  String get dailyFortuneTipCareer9;

  /// No description provided for @dailyFortuneTipHealth0.
  ///
  /// In en, this message translates to:
  /// **'Prioritize sleep and avoid overeating or too much caffeine today.'**
  String get dailyFortuneTipHealth0;

  /// No description provided for @dailyFortuneTipHealth1.
  ///
  /// In en, this message translates to:
  /// **'Stretching your neck and shoulders will significantly reduce your fatigue.'**
  String get dailyFortuneTipHealth1;

  /// No description provided for @dailyFortuneTipHealth2.
  ///
  /// In en, this message translates to:
  /// **'A short walk will clear your head and refresh your energy levels.'**
  String get dailyFortuneTipHealth2;

  /// No description provided for @dailyFortuneTipHealth3.
  ///
  /// In en, this message translates to:
  /// **'A glass of water and a quick stretch will set a positive tone for your day.'**
  String get dailyFortuneTipHealth3;

  /// No description provided for @dailyFortuneTipHealth4.
  ///
  /// In en, this message translates to:
  /// **'Give your eyes a break. Try to limit your screen time today.'**
  String get dailyFortuneTipHealth4;

  /// No description provided for @dailyFortuneTipHealth5.
  ///
  /// In en, this message translates to:
  /// **'Warm up properly before any intense physical activity.'**
  String get dailyFortuneTipHealth5;

  /// No description provided for @dailyFortuneTipHealth6.
  ///
  /// In en, this message translates to:
  /// **'Bring a light layer. You might be more sensitive to temperature changes today.'**
  String get dailyFortuneTipHealth6;

  /// No description provided for @dailyFortuneTipHealth7.
  ///
  /// In en, this message translates to:
  /// **'Stick to light, healthy foods for the sake of your gut and skin.'**
  String get dailyFortuneTipHealth7;

  /// No description provided for @dailyFortuneTipHealth8.
  ///
  /// In en, this message translates to:
  /// **'Sleep is your best medicine. Try to get to bed a bit earlier tonight.'**
  String get dailyFortuneTipHealth8;

  /// No description provided for @dailyFortuneTipHealth9.
  ///
  /// In en, this message translates to:
  /// **'Listen to your favorite music or find a pleasant scent to keep stress at bay.'**
  String get dailyFortuneTipHealth9;

  /// No description provided for @eyeAnalysisTypeSharp.
  ///
  /// In en, this message translates to:
  /// **'Your sharp, clear eyes reflect quick judgment and strong determination.'**
  String get eyeAnalysisTypeSharp;

  /// No description provided for @eyeAnalysisTypeDeep.
  ///
  /// In en, this message translates to:
  /// **'Your calm and deep gaze suggests a wise and thoughtful personality.'**
  String get eyeAnalysisTypeDeep;

  /// No description provided for @eyeAnalysisTypeBalanced.
  ///
  /// In en, this message translates to:
  /// **'Your eyes show a perfect balance of emotion and reason, projecting a sense of stability.'**
  String get eyeAnalysisTypeBalanced;

  /// No description provided for @eyeExpressionBright.
  ///
  /// In en, this message translates to:
  /// **'Your bright eyes and warm smile create an inviting aura that naturally draws people to you.'**
  String get eyeExpressionBright;

  /// No description provided for @eyeExpressionGentle.
  ///
  /// In en, this message translates to:
  /// **'A gentle smile within your calm gaze reflects a quiet but strong charisma.'**
  String get eyeExpressionGentle;

  /// No description provided for @eyeExpressionStrong.
  ///
  /// In en, this message translates to:
  /// **'Your intense, focused gaze symbolizes strong leadership and the drive to achieve your goals.'**
  String get eyeExpressionStrong;

  /// No description provided for @eyeExpressionSteady.
  ///
  /// In en, this message translates to:
  /// **'Your calm and serious demeanor inspires trust and respect.'**
  String get eyeExpressionSteady;

  /// No description provided for @eyePostureTilt.
  ///
  /// In en, this message translates to:
  /// **'A slightly tilted head can signal uncertainty; keeping your head held high and looking straight ahead will bring better focus and luck.'**
  String get eyePostureTilt;

  /// No description provided for @eyePostureStraight.
  ///
  /// In en, this message translates to:
  /// **'Looking straight ahead projects confidence and clears your path for success.'**
  String get eyePostureStraight;

  /// No description provided for @noseInsufficient.
  ///
  /// In en, this message translates to:
  /// **'Nose analysis is limited due to image clarity; providing a general interpretation.'**
  String get noseInsufficient;

  /// No description provided for @noseWealthRich.
  ///
  /// In en, this message translates to:
  /// **'A strong and well-defined nose suggests great potential for accumulating and protecting wealth.'**
  String get noseWealthRich;

  /// No description provided for @noseWealthPlanner.
  ///
  /// In en, this message translates to:
  /// **'A sharp, well-proportioned nose indicates a practical mind for managing and growing your finances.'**
  String get noseWealthPlanner;

  /// No description provided for @noseWealthBalanced.
  ///
  /// In en, this message translates to:
  /// **'Your balanced features suggest a steady and stable flow of financial luck.'**
  String get noseWealthBalanced;

  /// No description provided for @mouthExpressionBlessing.
  ///
  /// In en, this message translates to:
  /// **'Your upturned corners suggest a positive nature that naturally attracts good fortune and favor from others.'**
  String get mouthExpressionBlessing;

  /// No description provided for @mouthExpressionReliable.
  ///
  /// In en, this message translates to:
  /// **'A firm, closed mouth reflects reliability and a preference for action over empty words.'**
  String get mouthExpressionReliable;

  /// No description provided for @mouthExpressionLucky.
  ///
  /// In en, this message translates to:
  /// **'A bright, open smile radiates positive energy, bringing luck to your relationships.'**
  String get mouthExpressionLucky;

  /// No description provided for @supplementAlarmTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to take your supplements! 💊'**
  String get supplementAlarmTitle;

  /// No description provided for @alarmVolume.
  ///
  /// In en, this message translates to:
  /// **'Alarm Volume'**
  String get alarmVolume;

  /// No description provided for @alarmTimeList.
  ///
  /// In en, this message translates to:
  /// **'Alarm Time List'**
  String get alarmTimeList;

  /// No description provided for @noAlarmTimesAdded.
  ///
  /// In en, this message translates to:
  /// **'No alarm times added.'**
  String get noAlarmTimesAdded;

  /// No description provided for @alarmTimeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Alarm time deleted.'**
  String get alarmTimeDeleted;

  /// No description provided for @addAlarmTime.
  ///
  /// In en, this message translates to:
  /// **'Add Alarm Time'**
  String get addAlarmTime;

  /// No description provided for @editAlarmTime.
  ///
  /// In en, this message translates to:
  /// **'Edit Alarm Time'**
  String get editAlarmTime;

  /// No description provided for @defaultRingtone.
  ///
  /// In en, this message translates to:
  /// **'Default Ringtone'**
  String get defaultRingtone;

  /// No description provided for @takeSupplementsNow.
  ///
  /// In en, this message translates to:
  /// **'Please take your supplements and record it!'**
  String get takeSupplementsNow;

  /// No description provided for @nextTime.
  ///
  /// In en, this message translates to:
  /// **'Next Time'**
  String get nextTime;

  /// No description provided for @take.
  ///
  /// In en, this message translates to:
  /// **'Take'**
  String get take;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationTime.
  ///
  /// In en, this message translates to:
  /// **'Notification Time'**
  String get notificationTime;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @notificationInterval.
  ///
  /// In en, this message translates to:
  /// **'Notification Interval'**
  String get notificationInterval;

  /// No description provided for @waterDrankToday.
  ///
  /// In en, this message translates to:
  /// **'Water Drank Today'**
  String get waterDrankToday;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @cup.
  ///
  /// In en, this message translates to:
  /// **'Cup'**
  String get cup;

  /// No description provided for @waterIntakeRecord.
  ///
  /// In en, this message translates to:
  /// **'Water Intake Record'**
  String get waterIntakeRecord;

  /// No description provided for @remainingAmount.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remainingAmount;

  /// No description provided for @ml.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get ml;

  /// No description provided for @minutesFormat.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String minutesFormat(String minutes);

  /// No description provided for @drinkWater.
  ///
  /// In en, this message translates to:
  /// **'Drink Water'**
  String get drinkWater;

  /// No description provided for @supplement.
  ///
  /// In en, this message translates to:
  /// **'Supplement'**
  String get supplement;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @takeSupplement.
  ///
  /// In en, this message translates to:
  /// **'Take Supplement'**
  String get takeSupplement;

  /// No description provided for @goalAchievedTitle.
  ///
  /// In en, this message translates to:
  /// **'Goal Achieved!'**
  String get goalAchievedTitle;

  /// No description provided for @waterIntake.
  ///
  /// In en, this message translates to:
  /// **'Water Intake'**
  String get waterIntake;

  /// No description provided for @remindTime.
  ///
  /// In en, this message translates to:
  /// **'Remind Time'**
  String get remindTime;

  /// No description provided for @alarmRingtone.
  ///
  /// In en, this message translates to:
  /// **'Alarm Ringtone'**
  String get alarmRingtone;

  /// No description provided for @snoozeTime.
  ///
  /// In en, this message translates to:
  /// **'Snooze Time'**
  String get snoozeTime;

  /// No description provided for @snoozeDescription.
  ///
  /// In en, this message translates to:
  /// **'Default time when selecting \'Next Time\''**
  String get snoozeDescription;

  /// No description provided for @oneHour.
  ///
  /// In en, this message translates to:
  /// **'1 Hour'**
  String get oneHour;

  /// No description provided for @mouthExpressionOpen.
  ///
  /// In en, this message translates to:
  /// **'Your open expression suggests honesty, but be mindful of your words in sensitive situations.'**
  String get mouthExpressionOpen;

  /// No description provided for @overallHeadlineSimple.
  ///
  /// In en, this message translates to:
  /// **'Today\'s focus is {topKey}, and the point to be careful of is {bottomKey}.'**
  String overallHeadlineSimple(String topKey, String bottomKey);

  /// No description provided for @overallVibeWealthRich.
  ///
  /// In en, this message translates to:
  /// **'Your features radiate financial vitality, making this an excellent day to seize new opportunities.'**
  String get overallVibeWealthRich;

  /// No description provided for @overallVibeWealthSteady.
  ///
  /// In en, this message translates to:
  /// **'A calm and steady focus will help you manage your finances wisely and build lasting wealth.'**
  String get overallVibeWealthSteady;

  /// No description provided for @overallVibeLoveCharisma.
  ///
  /// In en, this message translates to:
  /// **'Your bright smile naturally attracts positive people and helpful connections today.'**
  String get overallVibeLoveCharisma;

  /// No description provided for @overallVibeLoveTrust.
  ///
  /// In en, this message translates to:
  /// **'Your sincere and steady gaze builds deep trust, making it a perfect time for meaningful connections.'**
  String get overallVibeLoveTrust;

  /// No description provided for @overallVibeCareerSmart.
  ///
  /// In en, this message translates to:
  /// **'Your sharp focus enhances your judgment, making it the perfect time for complex tasks or big decisions.'**
  String get overallVibeCareerSmart;

  /// No description provided for @overallVibeCareerSteady.
  ///
  /// In en, this message translates to:
  /// **'Your steady energy supports persistence; staying focused on your goals will lead to great results.'**
  String get overallVibeCareerSteady;

  /// No description provided for @overallVibeHealth.
  ///
  /// In en, this message translates to:
  /// **'Your clear complexion reflects a balanced internal rhythm, making it a great day for physical activities.'**
  String get overallVibeHealth;

  /// No description provided for @overallActionPrudent.
  ///
  /// In en, this message translates to:
  /// **'Your composed expression suggests wisdom. Today, let your actions speak louder than your words.'**
  String get overallActionPrudent;

  /// No description provided for @overallActionConfident.
  ///
  /// In en, this message translates to:
  /// **'A confident and open expression attracts positive results. Speak your mind with clarity and confidence.'**
  String get overallActionConfident;

  /// No description provided for @adviceHealth0.
  ///
  /// In en, this message translates to:
  /// **'A healthy routine is the foundation of good luck. Avoid overcommitting yourself today.'**
  String get adviceHealth0;

  /// No description provided for @adviceHealth1.
  ///
  /// In en, this message translates to:
  /// **'Pay attention to your body\'s needs. A short break now will lead to better results later.'**
  String get adviceHealth1;

  /// No description provided for @adviceHealth2.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated and get enough rest; simplicity is the key to refreshing your luck.'**
  String get adviceHealth2;

  /// No description provided for @adviceWealth0.
  ///
  /// In en, this message translates to:
  /// **'Be careful with your spending today. Double-check all expenses and contracts.'**
  String get adviceWealth0;

  /// No description provided for @adviceWealth1.
  ///
  /// In en, this message translates to:
  /// **'Cutting back on minor expenses today is the first step toward building significant wealth.'**
  String get adviceWealth1;

  /// No description provided for @adviceWealth2.
  ///
  /// In en, this message translates to:
  /// **'Waiting until tomorrow to make financial decisions may work in your favor.'**
  String get adviceWealth2;

  /// No description provided for @adviceLove0.
  ///
  /// In en, this message translates to:
  /// **'A kind word and a gentle expression can improve your luck in relationships.'**
  String get adviceLove0;

  /// No description provided for @adviceLove1.
  ///
  /// In en, this message translates to:
  /// **'Being a good listener is the secret to winning over others today.'**
  String get adviceLove1;

  /// No description provided for @adviceLove2.
  ///
  /// In en, this message translates to:
  /// **'Maintaining courtesy even with those close to you will preserve your positive energy.'**
  String get adviceLove2;

  /// No description provided for @adviceCareer0.
  ///
  /// In en, this message translates to:
  /// **'Focus on one key goal today instead of trying to do everything at once.'**
  String get adviceCareer0;

  /// No description provided for @adviceCareer1.
  ///
  /// In en, this message translates to:
  /// **'Don\'t rush. Taking things one step at a time is the quickest way to success.'**
  String get adviceCareer1;

  /// No description provided for @adviceCareer2.
  ///
  /// In en, this message translates to:
  /// **'Consider the advice of others, but trust your intuition for the final decision.'**
  String get adviceCareer2;

  /// No description provided for @sajuFortune2024Gap.
  ///
  /// In en, this message translates to:
  /// **'🌿 2024 Year of the Wood Dragon (Yang Wood): \'A Year of New Beginnings and Growth\'\n\n2024 brings the energy of \'Peers\' and \'Windfalls.\' Like a new tree in a lush forest, this is a time for self-discovery and planning for the future.\n\n💼 [Career & Business]\nYour confidence and drive will be at their peak. You\'ll find opportunities to succeed in large projects through collaboration. If you\'ve been considering a career change or starting a business, now is the time. Stay open to others\' ideas to avoid becoming overly stubborn.\n\n💰 [Wealth]\nExpect opportunities for significant financial gain or unexpected windfalls. While wealth flows in, expenses may also rise, so careful asset management is key. Long-term investments are highly recommended.\n\n❤️ [Love & Relationships]\nA great time to expand your social circle. Singles may find an attractive partner, and couples will see their bonds deepen. Be mindful of potential rivalries in your personal life.\n\n⚠️ [Cautions]\nPrioritize your physical health and manage stress. Avoid making impulsive decisions based on overconfidence.'**
  String get sajuFortune2024Gap;

  /// No description provided for @sajuFortune2024Eul.
  ///
  /// In en, this message translates to:
  /// **'🌿 2024 Year of the Wood Dragon (Yin Wood): \'A Year of Growth through Collaboration\'\n\n2024 brings the energy of \'Competitors\' and \'Stable Wealth.\' Like ivy climbing a great tree, you will achieve more by working with others than by going it alone.\n\n💼 [Career & Business]\nNetworking is your greatest asset this year. You\'ll meet influential mentors who will help you gain recognition. Be prepared to share your success with those who helped you. This is a strong year for establishing your presence in competitive environments.\n\n💰 [Wealth]\nA stable and consistent income is expected. Your hard work will be rewarded, making it an ideal time for savings or real estate. Avoid lending money to friends or acquaintances to prevent future conflict.\n\n❤️ [Love & Relationships]\nYour social life will flourish, and your popularity will grow. While romance looks promising, honest communication is necessary to avoid misunderstandings. New connections will likely form through your existing social circles.\n\n⚠️ [Cautions]\nWatch out for stress-related headaches or nervous tension. Stay flexible in your interactions to avoid unnecessary friction with others.'**
  String get sajuFortune2024Eul;

  /// No description provided for @sajuFortune2024Byeong.
  ///
  /// In en, this message translates to:
  /// **'🔥 2024 Year of the Wood Dragon (Yang Fire): \'A Year for Passion and Creative Wisdom\'\n\n2024 brings the energy of \'Intuition\' and \'Creativity.\' Like the sun breathing life into a forest, your original ideas and talents will shine brightly this year.\n\n💼 [Career & Business]\nYou will excel in specialized fields, especially those involving research, art, or technology. Your original approach will bring unique results. To succeed, focus on turning your many ideas into immediate action.\n\n💰 [Wealth]\nYour talents and ideas will be your primary source of income. Side projects or hobbies could turn into profitable ventures. Be sure to review all contracts and investment plans carefully to avoid potential losses.\n\n❤️ [Love & Relationships]\nYour charm and eloquence will be at their peak, making you a natural leader in social settings. You\'ll enjoy a vibrant romantic life with many memorable dates and events.\n\n⚠️ [Cautions]\nPay attention to your digestive and cardiovascular health. Stay active outdoors to help clear your mind if you feel overwhelmed by deep thoughts.'**
  String get sajuFortune2024Byeong;

  /// No description provided for @sajuFortune2024Jeong.
  ///
  /// In en, this message translates to:
  /// **'🔥 2024 Year of the Wood Dragon (Yin Fire): \'A Year of Inner Strength and Stability\'\n\n2024 brings the energy of \'Academic Success\' and \'Expression.\' Like a lamp illuminating a forest, this is a perfect year to focus on self-development, studies, or obtaining new certifications.\n\n💼 [Career & Business]\nSupport from mentors or seniors will improve your work environment, opening doors for promotions or transfers. Your ability to persuade others will be strong. Be mindful of your words to avoid being misunderstood by colleagues.\n\n💰 [Wealth]\nLuck is on your side regarding contracts and legal documents. Expect gains from real estate or career-related certifications. Focus on stable asset management and avoid impulsive purchases.\n\n❤️ [Love & Relationships]\nYour warm and polite demeanor will earn you the trust of those around you. Couples will experience a stable and nurturing period, making it a good year to plan for the future, including marriage.\n\n⚠️ [Cautions]\nTake care of your vision and manage mental fatigue. A humble attitude will help you avoid resentment from others who may be envious of your success.'**
  String get sajuFortune2024Jeong;

  /// No description provided for @sajuFortune2024Mu.
  ///
  /// In en, this message translates to:
  /// **'⛰️ 2024 Year of the Wood Dragon (Yang Earth): \'A Year of Responsibility and Growth\'\n\n2024 brings the energy of \'Authority\' and \'Peers.\' Like a great mountain standing firm in a forest, you will face new responsibilities that will ultimately lead to significant personal growth.\n\n💼 [Career & Business]\nYou\'ll be called upon to lead and handle challenging assignments. Competitive environments will provide the perfect stage to prove your skills. Persistence will be your greatest ally in achieving long-term success.\n\n💰 [Wealth]\nExpect some increase in your expenses this year. Focus on protecting your current assets rather than taking big risks. Be cautious with financial transactions involving friends or family, and plan your budget with a long-term view.\n\n❤️ [Love & Relationships]\nYour strong charisma will attract attention from others. However, be careful not to let stubbornness cause friction with your partner. This is a great year for deepening friendships and building strong bonds.\n\n⚠️ [Cautions]\nBeware of physical overwork, specifically digestive issues or muscle pain. Prioritize rest and stretching, and find a hobby to help relieve mental pressure.'**
  String get sajuFortune2024Mu;

  /// No description provided for @sajuFortune2024Gi.
  ///
  /// In en, this message translates to:
  /// **'🌾 2024 Year of the Wood Dragon (Yin Earth): \'A Year of Achievement and Harmony\'\n\n2024 brings the energy of \'Stability\' and \'Sharing.\' Like a fertile field bearing fruit, this will be a rewarding year where your social status rises and you gain well-deserved recognition.\n\n💼 [Career & Business]\nYou will be recognized for your hard work and may step into a significant new role. This is an exceptionally lucky year for employment and promotions. By following your principles, you will achieve results beyond your expectations.\n\n💰 [Wealth]\nA stable income and steady accumulation of wealth are in the cards. You may receive rewards for your past performance or honor. Be mindful of spending too much on others, and keep a balanced budget.\n\n❤️ [Love & Relationships]\nMarriage luck is strong this year. Singles may find a reliable partner for a serious relationship. Clear communication will help you gain support and affection from those around you.\n\n⚠️ [Cautions]\nMaintain regular eating habits and take care of your digestive health. Avoid getting too involved in other people\'s problems at the expense of your own well-being.'**
  String get sajuFortune2024Gi;

  /// No description provided for @sajuFortune2024Gyeong.
  ///
  /// In en, this message translates to:
  /// **'⚔️ 2024 Year of the Wood Dragon (Yang Metal): \'A Year of Innovation and Change\'\n\n2024 brings the energy of \'Windfalls\' and \'Intuition.\' Like a sharp sword clearing a path through a forest, you will break old patterns and embrace exciting new challenges.\n\n💼 [Career & Business]\nYour bold decisiveness and fresh ideas will lead to success in new ventures. You may find opportunities for travel or work abroad. Embrace change, but remember to coordinate with others to avoid unnecessary conflict within your team.\n\n💰 [Wealth]\nYour financial situation may see significant fluctuations. While there is potential for large profits, avoid speculative investments without a solid plan. Thorough analysis will be your best protection against losses.\n\n❤️ [Love & Relationships]\nYou\'ll have many opportunities to meet new people and expand your social life. Your curiosity in dating will be high, but try to maintain a serious and consistent attitude to build lasting connections.\n\n⚠️ [Cautions]\nPay attention to your respiratory and digestive health. Stay calm and avoid rushing into decisions to prevent accidents or mistakes caused by impatience.'**
  String get sajuFortune2024Gyeong;

  /// No description provided for @sajuFortune2024Sin.
  ///
  /// In en, this message translates to:
  /// **'💎 2024 Year of the Wood Dragon (Yin Metal): \'A Year of Recognition and Honor\'\n\n2024 brings the energy of \'Stable Wealth\' and \'Academic Success.\' Like a jewel discovered in a forest, your value will be recognized, and you will receive just rewards for your efforts.\n\n💼 [Career & Business]\nYour meticulous nature and sincerity will earn you deep trust. You may be put in charge of important projects or enjoy a promotion. This is a stable period where your plans will likely go exactly as intended.\n\n💰 [Wealth]\nYour financial outlook is stable and positive. Expect consistent income and success in savings or smart financial planning. You may also receive support or an inheritance from family or mentors.\n\n❤️ [Love & Relationships]\nYour polite and dignified manner will be very attractive to others. Trust will deepen in your romantic relationships, making this a great year for marriage or long-term commitments.\n\n⚠️ [Cautions]\nTake care of your skin and respiratory health. Don\'t let perfectionism cause unnecessary stress; remember to take time for yourself and relax.'**
  String get sajuFortune2024Sin;

  /// No description provided for @sajuFortune2024Im.
  ///
  /// In en, this message translates to:
  /// **'🌊 2024 Year of the Wood Dragon (Yang Water): \'A Year of Flexible Growth and Wisdom\'\n\n2024 brings the energy of \'Creativity\' and \'Authority.\' Like a vast sea nurturing a forest, your wisdom will help you solve difficult problems and expand your influence.\n\n💼 [Career & Business]\nYour creative problem-solving skills will be your greatest strength. You\'ll find breakthroughs in challenging situations and gain recognition for your abilities, especially in education, planning, or consulting. Manage your workload to avoid burnout.\n\n💰 [Wealth]\nThis is a good year to increase your income through your unique skills and talents. While wealth flows in, sudden expenses may arise, so it\'s wise to keep an emergency fund for peace of mind.\n\n❤️ [Love & Relationships]\nYour increased understanding and tolerance will help you maintain excellent relationships. Deep conversations will strengthen your romantic bonds. Singles are likely to find a partner who brings them a sense of comfort.\n\n⚠️ [Cautions]\nPay attention to your kidney and bladder health. Avoid taking on too many responsibilities at once, as overcommitting can affect your physical well-being.'**
  String get sajuFortune2024Im;

  /// No description provided for @sajuFortune2024Gye.
  ///
  /// In en, this message translates to:
  /// **'💧 2024 Year of the Wood Dragon (Yin Water): \'A Year of Seizing New Opportunities\'\n\n2024 brings the energy of \'Innovation\' and \'Stability.\' Like a gentle rain reviving a forest, your voice will be heard, and you will find new opportunities to showcase your presence.\n\n💼 [Career & Business]\nYour communication skills and creative ideas will be highly effective, especially in marketing, PR, or the arts. Be mindful of how you handle authority to ensure your innovative ideas are well-received by your organization.\n\n💰 [Wealth]\nYour financial flow will be active this year. Quick thinking and wit will help you increase your income. Be careful with impulsive spending on luxury items, and focus on maintaining a balanced budget.\n\n❤️ [Love & Relationships]\nYour charm and conversational skills will make you very popular. In relationships, your honesty will be refreshing, but remember to choose your words carefully to avoid hurting those you care about.\n\n⚠️ [Cautions]\nWatch out for issues with blood circulation or urological health. Stay humble and avoid gossip to protect your reputation and maintain positive relationships.'**
  String get sajuFortune2024Gye;

  /// No description provided for @sajuFortune2025Gap.
  ///
  /// In en, this message translates to:
  /// **'🌿 2025 Year of the Wood Snake (Yang Wood): \'Growth through New Opportunities and Competition\'\n\n2025 brings the energy of \'Competitors\' and \'Productivity.\' Like a great tree growing alongside ivy, you will find success through synergy, though you must also navigate a year of healthy competition.\n\n💼 [Career & Business]\nYour activity and desire to express your ideas will be strong. This is a great year to showcase your talents to the world, especially for freelancers, artists, or those in sales. Build alliances with colleagues to turn potential rivals into collaborators.\n\n💰 [Wealth]\nWhile your financial flow is active, you may see money going out as quickly as it comes in. Be cautious of investment advice from friends or colleagues. In the long run, investing in your own growth or business expansion will be more rewarding than simply saving.\n\n❤️ [Love & Relationships]\nYour social life will be vibrant, and you\'ll meet many new people. Your charm will be highly effective in social settings. If you\'re interested in someone, be proactive in expressing your feelings, as you may face competition.\n\n⚠️ [Cautions]\nAvoid letting a competitive spirit lead to unnecessary conflict. With the active energy of the year, prioritize your physical stamina and stay safe while traveling.'**
  String get sajuFortune2025Gap;

  /// No description provided for @sajuFortune2025Eul.
  ///
  /// In en, this message translates to:
  /// **'🌿 2025 Year of the Wood Snake (Yin Wood): \'A Brilliant Leap Forward\'\n\n2025 brings the energy of \'Peers\' and \'Expression.\' Like flowers in full bloom under the sun, this will be a dynamic year where your unique personality and talents receive the recognition they deserve.\n\n💼 [Career & Business]\nYour creativity and artistic sense will be at their peak. You\'ll excel in roles that involve planning and presenting fresh ideas. This is a strong year for independence or leading new projects. Remember to coordinate with others to ensure your innovations are well-received.\n\n💰 [Wealth]\nExpect income generated from your wit and specialized skills. Side projects or creative activities may bring unexpected financial gains. Manage your budget carefully to avoid overspending on luxury items or entertainment.\n\n❤️ [Love & Relationships]\nYour charm will attract significant attention from others. While you\'ll enjoy a lively romantic life, be mindful of your stubbornness in relationships. Singles can look forward to a potentially life-changing meeting.\n\n⚠️ [Cautions]\nChoose your words carefully to avoid gossip or misunderstandings. Prioritize regular rest and sleep to manage your energy levels throughout the year.'**
  String get sajuFortune2025Eul;

  /// No description provided for @sajuFortune2026Gap.
  ///
  /// In en, this message translates to:
  /// **'🌳 2026 Byeong-oh Year Gap-Wood General Fortune: \'Flame of Passion, Maximization of Activity\'\n\n2026 is a year where the energy of \'Sik-sin\' (Productivity) and \'Sang-gwan\' (Expression) is very strong for you, a Gap-Wood. It is a situation where wood meets fire and burns vigorously, a period where your talent and expression burst out into the world without hesitation. Your presence is revealed even if you stay still, and your range of activities expands dramatically.\n\n💼 [Career & Business]\nIt is a very good time to start new projects or a business. Your ideas are realized, and you will be passionately immersed in work. You can achieve great results in fields that express yourself, such as art, broadcasting, sales, and education. However, you need to be cautious and double-check everything as you may make mistakes if you only run forward.\n\n💰 [Wealth]\nWealth follows as much as you are active. Income from business or side jobs may increase. However, as much as you earn, a lot of money may go out for investment or consumption. Investment for the future is good, but impulsive spending should be guarded against.\n\n❤️ [Love & Relationships]\nAppeal to the opposite sex with an honest and active attitude. Romantic luck heats up, but excessive emotional expression may burden the partner. It is also a year where children\'s luck enters very strongly.\n\n⚠️ [Precautions]\nIt is a year of extreme energy consumption. \'Burnout\' may come, so physical strength management is essential. Be careful of rumors caused by slips of the tongue, and try not to insist only on your own arguments.'**
  String get sajuFortune2026Gap;

  /// No description provided for @sajuFortune2026Eul.
  ///
  /// In en, this message translates to:
  /// **'🌸 2026 Byeong-oh Year Eul-Wood General Fortune: \'Brilliant Blooming, Full Flowering of Talent\'\n\n2026 is a year where \'Sang-gwan\' (Expression) is heavy for you, an Eul-Wood. It is a situation where flowers bloom under the hot sun, a period where your charm and talent reach their peak. You will be the protagonist who receives attention everywhere and taste brilliant achievements.\n\n💼 [Career & Business]\nUnconventional attempts that break existing frameworks succeed. You will stand out in design, fashion, beauty, and entertainment. You may receive promotion or scout offers at work, but be careful of friction with superiors. Your ability doubles in a free environment.\n\n💰 [Wealth]\nThe ability to create wealth becomes excellent. Your brand value rises and your worth increases. However, chasing glamour may lead to luxury or waste, so you must guard your wallet well.\n\n❤️ [Love & Relationships]\nPopularity with the opposite sex explodes. You will have a brilliant and passionate romance, but it may end shortly and intensely. Married people may have a lot to worry about regarding children.\n\n⚠️ [Precautions]\nEmotional ups and downs may become severe. If you cannot control your temper, hard-earned achievements may collapse. Have a law-abiding spirit to avoid legal issues or rumors.'**
  String get sajuFortune2026Eul;

  /// No description provided for @sajuFortune2026Byeong.
  ///
  /// In en, this message translates to:
  /// **'☀️ 2026 Byeong-oh Year Byeong-Fire General Fortune: \'Two Suns, Intense Competition and Leap\'\n\n2026 is a year where \'Bi-gyeon\' (Friend) and \'Geob-jae\' (Competitor) are very strong for you, a Byeong-Fire. It is a situation where two suns appear in the sky, a period where pride and competitive spirit reach the sky. Subjectivity becomes strong, you hate any interference, and you push through your path with determination.\n\n💼 [Career & Business]\nIt is a luck to win and achieve in competitive places. You can increase the scale through partnership or collaboration, but conflicts may arise due to profit distribution issues. It is a good opportunity for freelancers or professionals to make their names widely known.\n\n💰 [Wealth]\nMoney comes in, but there are also large holes for it to go out. Money may go out due to siblings, friends, or colleagues. Guaranteeing or lending money is absolutely forbidden. It is better to invest in honor or growing power rather than saving money.\n\n❤️ [Love & Relationships]\nYou may meet a lover like a friend or develop from a friend to a lover. However, if you have a partner, be careful as a love triangle or competitor may appear.\n\n⚠️ [Precautions]\nDogmatic actions may cause resentment from those around you. \'Humility\' is the best tactic. Pay attention to cardiovascular disease or eye health.'**
  String get sajuFortune2026Byeong;

  /// No description provided for @sajuFortune2026Jeong.
  ///
  /// In en, this message translates to:
  /// **'🔥 2026 Byeong-oh Year Jeong-Fire General Fortune: \'Giant Flame, Expansion of Power\'\n\n2026 is a year of \'Geob-jae\' (Competitor) and \'Bi-gyeon\' (Friend) for you, a Jeong-Fire. Like a candle meeting a furnace, it is a period where your power becomes massive. You can achieve things that were impossible alone through help or cooperation from those around you.\n\n💼 [Career & Business]\nA strong driving force arises. You will have the wisdom to overwhelm competitors or turn them into your side. Opportunities to exercise leadership in team projects or organizational life will come. However, if you try to monopolize results, you may be betrayed, so a posture of sharing credit is necessary.\n\n💰 [Wealth]\nSpeculative tendencies become strong. You will pursue \'high risk, high return,\' and if lucky, you will touch a lot of money, but failure also has a large impact. Unexpected expenses may occur, so it is good to prepare an emergency fund.\n\n❤️ [Love & Relationships]\nThere is a high probability of meeting connections in social gatherings or group activities. Men should be careful as they may neglect their wives or girlfriends. Relationships with people around you become assets this year.\n\n⚠️ [Precautions]\nGreed leads to trouble. Refrain from unreasonable expansion or investment. Be careful of diseases caused by anger or stress.'**
  String get sajuFortune2026Jeong;

  /// No description provided for @sajuFortune2026Mu.
  ///
  /// In en, this message translates to:
  /// **'🌋 2026 Byeong-oh Year Mu-Earth General Fortune: \'Patience and Preparation Amidst Intense Heat\'\n\n2026 is a year where the energy of \'Pyeon-in\' (Intuition) and \'Jeong-in\' (Knowledge) is strong for you, a Mu-Earth. It is like condensed energy just before a volcano erupts. It is the optimal time to fill your inner self and grow skills through study, art, and obtaining certifications.\n\n💼 [Career & Business]\nMental labor such as planning, research, and strategy establishment shines rather than active work. Document luck is good, so there are results in contracts or permit-related tasks. However, if you only think and postpone execution, you may miss opportunities, so bold decisiveness is also needed.\n\n💰 [Wealth]\nReal estate document luck is very strong. It is an opportunity to increase assets through sale or contract. Cash flow may be somewhat frustrating, but investment from a long-term perspective is promising.\n\n❤️ [Love & Relationships]\nInterference from mothers or superiors may increase. In romance, you will value mental communion, and connections with older people may be made.\n\n⚠️ [Precautions]\nToo many thoughts can lead to depression or lethargy. Outdoor activities or sweating through exercise help improve luck. As the ground cracks due to too much heat, be careful of dry skin or stomach disorders.'**
  String get sajuFortune2026Mu;

  /// No description provided for @sajuFortune2026Gi.
  ///
  /// In en, this message translates to:
  /// **'🌾 2026 Byeong-oh Year Gi-Earth General Fortune: \'Solid Foundation and Definite Support\'\n\n2026 is a year of \'Jeong-in\' (Knowledge) and \'Pyeon-in\' (Intuition) for you, a Gi-Earth. It is a situation where warm sunlight shines on the earth and ripens grains. It is a period of solidifying a stable foundation while receiving full support and love from superiors.\n\n💼 [Career & Business]\nYou will achieve the best results in everything related to study, such as promotion exams, certification exams, and degree attainment. At work, you will gain the trust of superiors and take on important positions. You will stand out in education, real estate, counseling, and welfare fields.\n\n💰 [Wealth]\nIt is a luck to hold documents. You may achieve the goal of owning a home or receive inheritance or gifts. Stable asset growth is possible, and it is a year where honor shines more than wealth.\n\n❤️ [Love & Relationships]\nIt is a year to be loved. You will receive dependable love from your lover or meet a partner with good conditions. Marriage luck also enters, and family life becomes harmonious.\n\n⚠️ [Precautions]\nIf you only try to receive, you may become lazy. A posture of sharing as much as you received is necessary. Discard dependency and grow self-reliance.'**
  String get sajuFortune2026Gi;

  /// No description provided for @sajuFortune2026Gyeong.
  ///
  /// In en, this message translates to:
  /// **'⚔️ 2026 Byeong-oh Year Gyeong-Metal General Fortune: \'Birth of a Masterpiece Beyond Ordeal\'\n\n2026 is a year where \'Pyeon-gwan\' (Pressure) and \'Jeong-gwan\' (Authority) are very powerful for you, a Gyeong-Metal. It is a situation of melting raw ore in a furnace to make a masterpiece sword. There may be strong pressure and stress, but if you endure it, you will gain immense authority and honor.\n\n💼 [Career & Business]\nYou may take on positions with heavy responsibility or handle difficult projects. However, this is a process of testing you, and if successfully completed, your status rises instantly. It is an opportunity for promotion for those in public office, military, police, and legal fields.\n\n💰 [Wealth]\nIt is a luck of honor and titles rather than money. As status rises, wealth will naturally follow, but money going out for dignity maintenance or entertainment is also significant.\n\n❤️ [Love & Relationships]\nFor women, it is a luck where a charismatic and capable man appears. Men have strong children\'s luck. Relationships with work superiors or elders become important.\n\n⚠️ [Precautions]\nHealth management is the top priority. Be careful of diseases or accidents caused by overwork. Especially lungs and large intestines may weaken. Find ways to relieve stress.'**
  String get sajuFortune2026Gyeong;

  /// No description provided for @sajuFortune2026Sin.
  ///
  /// In en, this message translates to:
  /// **'💎 2026 Byeong-oh Year Sin-Metal General Fortune: \'Shining Jewel, Peak of Honor\'\n\n2026 is a year of \'Jeong-gwan\' (Authority) and \'Pyeon-gwan\' (Pressure) for you, a Sin-Metal. Like a jewel shining under lights, it is a period where your value is revealed to the world and honor is elevated. You have deep connections with upright and stable workplaces or organizations.\n\n💼 [Career & Business]\nJob hunting, promotion, and transfer luck are very good. You may also receive scout offers by being recognized for your skills. If you follow principles and handle work correctly, you will receive respect from everyone.\n\n💰 [Wealth]\nStable salary or fixed income is guaranteed. If you protect honor rather than chasing wealth, wealth will naturally follow. You can benefit from your husband or workplace.\n\n❤️ [Love & Relationships]\nIt is the best marriage and dating luck for women. You can meet an upright and capable spouse. Men gain children or have joyful events due to children.\n\n⚠️ [Precautions]\nToo much heat can melt the jewel. Excessive work or stress may cause nervousness. You may appear inflexible due to strong principle-oriented tendencies, so be careful.'**
  String get sajuFortune2026Sin;

  /// No description provided for @sajuFortune2026Im.
  ///
  /// In en, this message translates to:
  /// **'🌊 2026 Byeongo Year Im-Water General Fortune: \'A Dynamic Year of Expanding Activity Range\'\n\n2026 is a year where the energy of \'Pyeon-jae\' and \'Jeong-jae\' enters for you. It\'s like a huge sea circulating actively by receiving the sun\'s heat and moving towards the wide world. It will be a dynamic year where economic activities become vigorous and opportunities to touch large wealth come.\n\n💼 [Career & Business]\nBusiness acumen is maximized. A very good year to pioneer new markets or reap large profits from investments. Luck where activity range can expand beyond domestic to overseas. Bold decisions lead to great results, but detailed review is essential.\n\n💰 [Wealth]\nWealth luck reaches its peak. Unexpected windfalls or large-scale business profits are expected. If you ride the flow of money well, you can form large assets. However, management is important as money going out can be as large as money coming in.\n\n❤️ [Love & Relationships]\nSociability improves and many people of the opposite sex gather around with overflowing charm. A good time to enjoy active dating. In romantic relationships, you spend happy times enjoying fancy dates and trips. However, be careful as you may neglect partners due to a too busy schedule.\n\n⚠️ [Cautions]\nPay attention to kidney function or blood circulation. Also, wisdom to know how to be satisfied at an appropriate level is needed as excessive greed may lead to trouble.'**
  String get sajuFortune2026Im;

  /// No description provided for @sajuFortune2026Gye.
  ///
  /// In en, this message translates to:
  /// **'💧 2026 Byeongo Year Gye-Water General Fortune: \'Gaining Practical Interests while Strengthening Internal Foundations\'\n\n2026 is a year where the energy of \'Jeong-jae\' and \'Pyeon-jae\' enters for you. It\'s like sunshine shining after sweet rain, making the land full of life and abundance. You will achieve economic stability based on stable income and find small happinesses.\n\n💼 [Career & Business]\nYou handle assigned tasks perfectly with sincerity and meticulousness. Display excellent ability in finance, accounting, or management tasks. Recognition and rewards follow when you do your best in assigned work rather than excessive greed. You can grow step by step while building skills in a stable environment.\n\n💰 [Wealth]\nWealth luck is very good. Steady and stable income occurs, and you enjoy the joy of increasing assets through financial technology or savings. Small but definite profits gather to give great reward. Frugal spending habits shine this year.\n\n❤️ [Love & Relationships]\nYou give deep trust to partners with kindhearted and meticulous consideration. You grow a small but warm love while sharing daily lives. Relationships are also smooth and peaceful. You will play the role of a trusted advisor to people around you.\n\n⚠️ [Cautions]\nPay attention to eye diseases or urological system health. Also, sometimes practice looking at the world with a wide perspective as you may miss the big flow by paying attention to too detailed things.'**
  String get sajuFortune2026Gye;

  /// No description provided for @sajuFortune2025Byeong.
  ///
  /// In en, this message translates to:
  /// **'🔥 2025 Year of the Wood Snake (Yang Fire): \'Passion and Achievement\'\n\n2025 brings the energy of \'Academic Success\' and \'Peers.\' Like the sun meeting the warmth of the earth, this year you\'ll find strong support and the confidence to achieve your goals.\n\n💼 [Career & Business]\nSupport from mentors or reliable partners will help you reach new heights. This is a great year for academic pursuits or professional certifications. While collaboration will lead to success, be mindful that excessive competition doesn\'t strain your professional relationships.\n\n💰 [Wealth]\nSharing information with your network will lead to financial growth. Joint ventures or collaborative investments look promising. Avoid overspending for the sake of appearance or pride; focus on practical gains.\n\n❤️ [Love & Relationships]\nYour social circle will deepen, and you\'ll find comfort in friendships. In romantic relationships, a sense of familiarity and friendship will strengthen your bond. Balance your time between friends and your partner to maintain harmony.\n\n⚠️ [Cautions]\nPay attention to your heart and circulatory health. Stay calm and manage your emotions, as impulsive reactions could lead to unnecessary setbacks.'**
  String get sajuFortune2025Byeong;

  /// No description provided for @sajuFortune2025Jeong.
  ///
  /// In en, this message translates to:
  /// **'🔥 2025 Year of the Wood Snake (Yin Fire): \'Opportunities in Times of Change\'\n\n2025 brings the energy of \'Intuition\' and \'Competitors.\' Like a candle that continues to shine despite the wind, you will wisely overcome challenges and turn them into opportunities for success.\n\n💼 [Career & Business]\nYour original ideas and sharp intuition will shine. You\'ll find success in niche markets or specialized fields where others haven\'t looked. Be mindful of competition within your organization, and protect your ideas while maintaining good relationships.\n\n💰 [Wealth]\nExpect some fluctuations in your finances this year. A conservative approach to asset management is recommended, as unexpected expenses could arise. However, your professional skills will provide a stable source of income. Avoid risky financial transactions.\n\n❤️ [Love & Relationships]\nYou may find yourself being more reflective or passive in your romantic life. Trust is essential; try to approach your relationships with an open heart. Taking time for yourself will help you maintain your inner balance.\n\n⚠️ [Cautions]\nWatch out for stress-related fatigue or sleep issues. Practice mindfulness or light exercise to stay positive and clear-headed throughout the year.'**
  String get sajuFortune2025Jeong;

  /// No description provided for @sajuFortune2025Mu.
  ///
  /// In en, this message translates to:
  /// **'⛰️ 2025 Year of the Wood Snake (Yang Earth): \'Wisdom and Maturity\'\n\n2025 brings the energy of \'Honor\' and \'Intuition.\' Like a great mountain embracing the warmth of the earth, this will be a year for deepening your knowledge while maintaining your social standing.\n\n💼 [Career & Business]\nYou\'re likely to step into a role of responsibility or find opportunities for promotion. By valuing principles and working sincerely, you\'ll earn significant recognition. This is also an excellent year for research or specialized studies. Stay open to new ideas to avoid becoming stuck in old patterns.\n\n💰 [Wealth]\nA stable income is expected. Focus on saving and careful asset management. Luck is on your side regarding real estate or legal documents, making it a good time for long-term investments. Avoid being swayed by risky temptations.\n\n❤️ [Love & Relationships]\nYour dignified and reliable manner will earn you the trust of others. This is a perfect time for couples to build a deeper, more serious relationship. If you\'re considering marriage, this is a great year to make specific plans.\n\n⚠️ [Cautions]\nTake care of your digestive health and skin. Don\'t let overthinking lead to indecision; listen to trusted advice to help you move forward with confidence.'**
  String get sajuFortune2025Mu;

  /// No description provided for @sajuFortune2025Gi.
  ///
  /// In en, this message translates to:
  /// **'🌾 2025 Year of the Wood Snake (Yin Earth): \'Achieving Goals through Persistence\'\n\n2025 brings the energy of \'Authority\' and \'Academic Success.\' Like sunshine after a rain, this year will bring the recognition and honor you\'ve worked so hard to achieve.\n\n💼 [Career & Business]\nYour workload and responsibilities may increase, but you\'ll prove your leadership skills by overcoming these challenges with patience. Support from mentors or seniors will help you navigate difficult situations, leading to a great sense of accomplishment.\n\n💰 [Wealth]\nCareful budget management is essential this year, as you may face unexpected taxes or public fees. However, your steady efforts will likely be rewarded with bonuses or incentives. Persistence is your key to financial success.\n\n❤️ [Love & Relationships]\nYour responsible nature will be very attractive to others. Shared challenges will strengthen the bond between couples as you support each other. Even with a busy schedule, make time for meaningful communication with your partner.\n\n⚠️ [Cautions]\nAvoid burnout by prioritizing your physical health. Maintain a regular routine of healthy meals and exercise, and keep a positive mindset to manage stress effectively.'**
  String get sajuFortune2025Gi;

  /// No description provided for @sajuFortune2025Gyeong.
  ///
  /// In en, this message translates to:
  /// **'⚔️ 2025 Year of the Wood Snake (Yang Metal): \'Earning Honor and Practical Gains\'\n\n2025 brings the energy of \'Stable Wealth\' and \'Authority.\' Like raw metal being refined into a master sword, your hard work will be rewarded with both social status and financial gains.\n\n💼 [Career & Business]\nYour focus on results and strong drive will lead to significant achievements, especially in finance, management, or technology. You\'ll gain recognition for solving complex problems, though the increased responsibility may bring some pressure. Trust in your abilities and move forward boldly.\n\n💰 [Wealth]\nYour financial outlook is very positive. In addition to a stable income, you may see gains from side projects or smart investments. You\'ll have a keen eye for managing your assets efficiently. Avoid spending too much solely for the sake of your reputation.\n\n❤️ [Love & Relationships]\nYour sincere and reliable nature will be your greatest asset in relationships. You provide a sense of security for your partner with your responsible attitude. Try to add a touch of humor to your interactions to soften your professional image.\n\n⚠️ [Cautions]\nTake care of your respiratory health and joints. Don\'t let perfectionism cause unnecessary stress; remember to be kind to yourself as you strive for your goals.'**
  String get sajuFortune2025Gyeong;

  /// No description provided for @sajuFortune2025Sin.
  ///
  /// In en, this message translates to:
  /// **'💎 2025 Year of the Wood Snake (Yin Metal): \'Wisdom and Success in Times of Change\'\n\n2025 brings the energy of \'Windfalls\' and \'Honor.\' Like a fine jewel under a spotlight, your value will be recognized, and you\'ll experience both a rise in social status and unexpected financial gains.\n\n💼 [Career & Business]\nYour business acumen will be sharp, and you\'ll excel at capturing new opportunities. Bold challenges are likely to bring significant rewards. Within your organization, your rational judgment will earn you the trust of others and potentially a promotion.\n\n💰 [Wealth]\nFinancial luck is on your side this year. You may see unexpected gains from investments or family support. While wealth flows in, maintain a planned budget to avoid overspending on luxury items.\n\n❤️ [Love & Relationships]\nYou\'ll be the center of attention in social settings with your attractive presence. This is a very strong year for romance, with many people drawn to your charm. Couples can look forward to a passionate and meaningful year together.\n\n⚠️ [Cautions]\nPay attention to your respiratory and skin health. Maintain a humble attitude to ensure your confidence isn\'t mistaken for arrogance by those around you.'**
  String get sajuFortune2025Sin;

  /// No description provided for @sajuFortune2025Im.
  ///
  /// In en, this message translates to:
  /// **'🌊 2025 Year of the Wood Snake (Yang Water): \'Expanding Your Influence through Wisdom\'\n\n2025 brings the energy of \'Expression\' and \'Windfalls.\' Like a winding river nurturing a field, this will be a dynamic year for expanding your activities and achieving significant financial success through your unique talents.\n\n💼 [Career & Business]\nYour communication skills will be highly effective, especially in marketing, PR, or creative fields. This is the perfect time to commercialize your ideas and explore new markets. Stay professional in your interactions with authority to ensure your ideas are well-received.\n\n💰 [Wealth]\nYour financial situation will be active and promising. You\'ll find opportunities to earn money through your specialized skills and capture large financial gains. Remember to share your success with others to maintain your positive financial flow.\n\n❤️ [Love & Relationships]\nYour humor and charm will make you very popular. You\'ll enjoy a vibrant social life with many interesting dates. In relationships, variety and creativity will keep things exciting. Be mindful that your words are understood as intended to avoid simple misunderstandings.\n\n⚠️ [Cautions]\nTake care of your kidney and urological health. Prioritize rest and proper nutrition to maintain your energy levels as you expand your range of activities.'**
  String get sajuFortune2025Im;

  /// No description provided for @sajuFortune2025Gye.
  ///
  /// In en, this message translates to:
  /// **'💧 2025 Year of the Wood Snake (Yin Water): \'A Year of Stability and Reward\'\n\n2025 brings the energy of \'Productivity\' and \'Stable Wealth.\' Like a gentle rain preparing the land for a rich harvest, your steady efforts will lead to lasting wealth and happiness.\n\n💼 [Career & Business]\nSincerity is your greatest strength this year. By fulfilling your responsibilities, you\'ll earn the deep trust of your colleagues. This is a great time to focus on your favorite projects and grow your expertise in a stable environment.\n\n💰 [Wealth]\nExpect a stable and comfortable financial year. You\'ll find satisfaction in steadily building your assets through careful planning. Abundance is the theme for your year; focus on safe investments and savings rather than taking risks.\n\n❤️ [Love & Relationships]\nYour warm-hearted and considerate nature will bring comfort to your partner. This is a year for nurturing your relationships with care and attention. Singles are likely to meet someone who shares their values and communicates well.\n\n⚠️ [Cautions]\nPay attention to your digestive health and maintain healthy eating habits. Find new ways to stay active and engaged to avoid becoming too comfortable or settled in your routine.'**
  String get sajuFortune2025Gye;

  /// No description provided for @preparationForTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Preparation for Tomorrow'**
  String get preparationForTomorrow;

  /// No description provided for @howToMeetMoreLuck.
  ///
  /// In en, this message translates to:
  /// **'How to meet more luck'**
  String get howToMeetMoreLuck;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get enterName;

  /// No description provided for @fortuneDateConfirm.
  ///
  /// In en, this message translates to:
  /// **'Would you like to check the fortune for {date}?'**
  String fortuneDateConfirm(String date);

  /// No description provided for @colorPurple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get colorPurple;

  /// No description provided for @colorBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get colorBlue;

  /// No description provided for @colorYellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get colorYellow;

  /// No description provided for @colorRed.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get colorRed;

  /// No description provided for @colorGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get colorGreen;

  /// No description provided for @colorPink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get colorPink;

  /// No description provided for @colorOrange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get colorOrange;

  /// No description provided for @colorWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorWhite;

  /// No description provided for @colorBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get colorBlack;

  /// No description provided for @itemPerfume.
  ///
  /// In en, this message translates to:
  /// **'Perfume'**
  String get itemPerfume;

  /// No description provided for @itemHandkerchief.
  ///
  /// In en, this message translates to:
  /// **'Handkerchief'**
  String get itemHandkerchief;

  /// No description provided for @itemRing.
  ///
  /// In en, this message translates to:
  /// **'Ring'**
  String get itemRing;

  /// No description provided for @itemWatch.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get itemWatch;

  /// No description provided for @itemGlasses.
  ///
  /// In en, this message translates to:
  /// **'Glasses'**
  String get itemGlasses;

  /// No description provided for @itemHat.
  ///
  /// In en, this message translates to:
  /// **'Hat'**
  String get itemHat;

  /// No description provided for @itemBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get itemBook;

  /// No description provided for @itemEarphones.
  ///
  /// In en, this message translates to:
  /// **'Earphones'**
  String get itemEarphones;

  /// No description provided for @itemMirror.
  ///
  /// In en, this message translates to:
  /// **'Mirror'**
  String get itemMirror;

  /// No description provided for @itemPen.
  ///
  /// In en, this message translates to:
  /// **'Pen'**
  String get itemPen;

  /// No description provided for @itemCoin.
  ///
  /// In en, this message translates to:
  /// **'Coin'**
  String get itemCoin;

  /// No description provided for @itemKey.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get itemKey;

  /// No description provided for @dirEast.
  ///
  /// In en, this message translates to:
  /// **'East'**
  String get dirEast;

  /// No description provided for @dirWest.
  ///
  /// In en, this message translates to:
  /// **'West'**
  String get dirWest;

  /// No description provided for @dirSouth.
  ///
  /// In en, this message translates to:
  /// **'South'**
  String get dirSouth;

  /// No description provided for @dirNorth.
  ///
  /// In en, this message translates to:
  /// **'North'**
  String get dirNorth;

  /// No description provided for @dirNorthEast.
  ///
  /// In en, this message translates to:
  /// **'North-East'**
  String get dirNorthEast;

  /// No description provided for @dirSouthEast.
  ///
  /// In en, this message translates to:
  /// **'South-East'**
  String get dirSouthEast;

  /// No description provided for @dirNorthWest.
  ///
  /// In en, this message translates to:
  /// **'North-West'**
  String get dirNorthWest;

  /// No description provided for @dirSouthWest.
  ///
  /// In en, this message translates to:
  /// **'South-West'**
  String get dirSouthWest;

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
  /// **'Enable dark mode for a more comfortable viewing experience.'**
  String get darkModeDescription;

  /// No description provided for @alarmSettings.
  ///
  /// In en, this message translates to:
  /// **'Alarm Settings'**
  String get alarmSettings;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;

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

  /// No description provided for @weatherConditionPartlyCloudy.
  ///
  /// In en, this message translates to:
  /// **'Partly Cloudy'**
  String get weatherConditionPartlyCloudy;

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

  /// No description provided for @weatherConditionDrizzle.
  ///
  /// In en, this message translates to:
  /// **'Drizzle'**
  String get weatherConditionDrizzle;

  /// No description provided for @weatherConditionRainy.
  ///
  /// In en, this message translates to:
  /// **'Rainy'**
  String get weatherConditionRainy;

  /// No description provided for @weatherConditionFreezingRain.
  ///
  /// In en, this message translates to:
  /// **'Freezing Rain'**
  String get weatherConditionFreezingRain;

  /// No description provided for @weatherConditionSnowy.
  ///
  /// In en, this message translates to:
  /// **'Snowy'**
  String get weatherConditionSnowy;

  /// No description provided for @weatherConditionSnowGrains.
  ///
  /// In en, this message translates to:
  /// **'Snow Grains'**
  String get weatherConditionSnowGrains;

  /// No description provided for @weatherConditionRainShowers.
  ///
  /// In en, this message translates to:
  /// **'Rain Showers'**
  String get weatherConditionRainShowers;

  /// No description provided for @weatherConditionSnowShowers.
  ///
  /// In en, this message translates to:
  /// **'Snow Showers'**
  String get weatherConditionSnowShowers;

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
  /// **'Please share any feedback or suggestions regarding Fortune Alarm.\nYour input helps us improve.'**
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
  /// **'Alarm Optimization'**
  String get alarmOptimization;

  /// No description provided for @allOptimizationsCompleted.
  ///
  /// In en, this message translates to:
  /// **'All settings optimized.'**
  String get allOptimizationsCompleted;

  /// No description provided for @optimizationNeeded.
  ///
  /// In en, this message translates to:
  /// **'Additional settings are required for accurate alarms.'**
  String get optimizationNeeded;

  /// No description provided for @optimizationDescription.
  ///
  /// In en, this message translates to:
  /// **'To ensure your alarms ring on time, please allow the following permissions in your system settings.'**
  String get optimizationDescription;

  /// No description provided for @allowNotificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allowNotificationPermission;

  /// No description provided for @notificationPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'Enables notifications for alarms and fortune updates.'**
  String get notificationPermissionDescription;

  /// No description provided for @excludeBatteryOptimization.
  ///
  /// In en, this message translates to:
  /// **'Exclude Battery Optimization'**
  String get excludeBatteryOptimization;

  /// No description provided for @batteryOptimizationDescription.
  ///
  /// In en, this message translates to:
  /// **'Prevents the system from delaying alarms to save power.'**
  String get batteryOptimizationDescription;

  /// No description provided for @allowExactAlarm.
  ///
  /// In en, this message translates to:
  /// **'Allow Exact Alarms'**
  String get allowExactAlarm;

  /// No description provided for @exactAlarmDescription.
  ///
  /// In en, this message translates to:
  /// **'Ensures alarms trigger precisely at the scheduled time.'**
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
  /// **'All settings updated.'**
  String get allSettingsCompleted;

  /// No description provided for @allowAllItems.
  ///
  /// In en, this message translates to:
  /// **'Please enable all permissions.'**
  String get allowAllItems;

  /// No description provided for @manualSettingsInfo.
  ///
  /// In en, this message translates to:
  /// **'You can manage these settings anytime in your Android system menu.'**
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
  /// **'Add images to the \'assets/images/\' folder and update \'pubspec.yaml\'.'**
  String get addAssetInstructions;

  /// No description provided for @ringingNow.
  ///
  /// In en, this message translates to:
  /// **'Alarm Ringing'**
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

  /// No description provided for @wakeUpAlarm.
  ///
  /// In en, this message translates to:
  /// **'Alarm Mission'**
  String get wakeUpAlarm;

  /// No description provided for @daySun.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get daySun;

  /// No description provided for @dayMon.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get dayTue;

  /// No description provided for @dayWed.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get dayWed;

  /// No description provided for @dayThu.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get dayFri;

  /// No description provided for @daySat.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get daySat;

  /// No description provided for @daySunFull.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get daySunFull;

  /// No description provided for @dayMonFull.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get dayMonFull;

  /// No description provided for @dayTueFull.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get dayTueFull;

  /// No description provided for @dayWedFull.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get dayWedFull;

  /// No description provided for @dayThuFull.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get dayThuFull;

  /// No description provided for @dayFriFull.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get dayFriFull;

  /// No description provided for @daySatFull.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get daySatFull;

  /// No description provided for @missionRewardEarned.
  ///
  /// In en, this message translates to:
  /// **'Great job! You\'ve completed 5 missions and earned a Fortune Cookie!'**
  String get missionRewardEarned;

  /// No description provided for @missionRewardEarnedWithCount.
  ///
  /// In en, this message translates to:
  /// **'Well done! You\'ve completed {missions} missions and earned {cookies} Fortune Cookie(s)!'**
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

  /// No description provided for @member.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get member;

  /// No description provided for @manageSajuInfo.
  ///
  /// In en, this message translates to:
  /// **'Manage Birth Info'**
  String get manageSajuInfo;

  /// No description provided for @freeCharge.
  ///
  /// In en, this message translates to:
  /// **'Free Refill'**
  String get freeCharge;

  /// No description provided for @fortunePass.
  ///
  /// In en, this message translates to:
  /// **'Fortune Pass'**
  String get fortunePass;

  /// No description provided for @unlimitedNotSubscribed.
  ///
  /// In en, this message translates to:
  /// **'Subscription inactive'**
  String get unlimitedNotSubscribed;

  /// No description provided for @unlimitedInUse.
  ///
  /// In en, this message translates to:
  /// **'Subscription active'**
  String get unlimitedInUse;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @manageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscription'**
  String get manageSubscription;

  /// No description provided for @purchaseHistory.
  ///
  /// In en, this message translates to:
  /// **'Purchase History'**
  String get purchaseHistory;

  /// No description provided for @customerCenter.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get customerCenter;

  /// No description provided for @noNewNotifications.
  ///
  /// In en, this message translates to:
  /// **'No new notifications.'**
  String get noNewNotifications;

  /// No description provided for @noPurchaseHistory.
  ///
  /// In en, this message translates to:
  /// **'No purchase history.'**
  String get noPurchaseHistory;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @deleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete \"{title}\"?'**
  String deleteConfirmMessage(String title);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @notepad.
  ///
  /// In en, this message translates to:
  /// **'Notepad'**
  String get notepad;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yearView.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get yearView;

  /// No description provided for @monthView.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get monthView;

  /// No description provided for @weekView.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get weekView;

  /// No description provided for @dayView.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get dayView;

  /// No description provided for @noEvents.
  ///
  /// In en, this message translates to:
  /// **'No events scheduled.'**
  String get noEvents;

  /// No description provided for @noSavedMemos.
  ///
  /// In en, this message translates to:
  /// **'No saved memos or events.'**
  String get noSavedMemos;

  /// No description provided for @holiday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holiday;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @drawing.
  ///
  /// In en, this message translates to:
  /// **'Drawing'**
  String get drawing;

  /// No description provided for @drawingTitle.
  ///
  /// In en, this message translates to:
  /// **'Drawing'**
  String get drawingTitle;

  /// No description provided for @pencil.
  ///
  /// In en, this message translates to:
  /// **'Pencil'**
  String get pencil;

  /// No description provided for @marker.
  ///
  /// In en, this message translates to:
  /// **'Marker'**
  String get marker;

  /// No description provided for @eraser.
  ///
  /// In en, this message translates to:
  /// **'Eraser'**
  String get eraser;

  /// No description provided for @adjustThickness.
  ///
  /// In en, this message translates to:
  /// **'Adjust {label} thickness'**
  String adjustThickness(String label);

  /// No description provided for @sticker.
  ///
  /// In en, this message translates to:
  /// **'Sticker'**
  String get sticker;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// No description provided for @memo.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get memo;

  /// No description provided for @routineExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get routineExercise;

  /// No description provided for @routineHiking.
  ///
  /// In en, this message translates to:
  /// **'Hiking'**
  String get routineHiking;

  /// No description provided for @routineCleaning.
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get routineCleaning;

  /// No description provided for @routineTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get routineTravel;

  /// No description provided for @routineDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get routineDate;

  /// No description provided for @routineConcert.
  ///
  /// In en, this message translates to:
  /// **'Concert'**
  String get routineConcert;

  /// No description provided for @routineMovie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get routineMovie;

  /// No description provided for @routineMeeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get routineMeeting;

  /// No description provided for @howIsYourMoodToday.
  ///
  /// In en, this message translates to:
  /// **'How is your mood today?'**
  String get howIsYourMoodToday;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @amWithIcon.
  ///
  /// In en, this message translates to:
  /// **'☀️ AM'**
  String get amWithIcon;

  /// No description provided for @pmWithIcon.
  ///
  /// In en, this message translates to:
  /// **'🌙 PM'**
  String get pmWithIcon;

  /// No description provided for @photoPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'To add photos, you must allow photo access in settings.'**
  String get photoPermissionDescription;

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings'**
  String get goToSettings;

  /// No description provided for @photoPermissionNeeded.
  ///
  /// In en, this message translates to:
  /// **'Photo access permission is required.'**
  String get photoPermissionNeeded;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @fontFamily.
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get fontFamily;

  /// No description provided for @textColor.
  ///
  /// In en, this message translates to:
  /// **'Text Color'**
  String get textColor;

  /// No description provided for @textAlign.
  ///
  /// In en, this message translates to:
  /// **'Alignment'**
  String get textAlign;

  /// No description provided for @alignLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get alignLeft;

  /// No description provided for @alignCenter.
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get alignCenter;

  /// No description provided for @alignRight.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get alignRight;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @fontSettings.
  ///
  /// In en, this message translates to:
  /// **'Font Settings'**
  String get fontSettings;

  /// No description provided for @imageAddedFromKeyboard.
  ///
  /// In en, this message translates to:
  /// **'Image added from keyboard.'**
  String get imageAddedFromKeyboard;

  /// No description provided for @cancelWriting.
  ///
  /// In en, this message translates to:
  /// **'Cancel Writing'**
  String get cancelWriting;

  /// No description provided for @cancelWritingConfirm.
  ///
  /// In en, this message translates to:
  /// **'There is content being written. Do you want to cancel and exit?'**
  String get cancelWritingConfirm;

  /// No description provided for @continueWriting.
  ///
  /// In en, this message translates to:
  /// **'Continue Writing'**
  String get continueWriting;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// No description provided for @noTime.
  ///
  /// In en, this message translates to:
  /// **'No Time'**
  String get noTime;

  /// No description provided for @minutesLater.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min later'**
  String minutesLater(String minutes);

  /// No description provided for @countLabel.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get countLabel;

  /// No description provided for @timesCount.
  ///
  /// In en, this message translates to:
  /// **'Total {count} times'**
  String timesCount(String count);

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

  /// No description provided for @routineSummary.
  ///
  /// In en, this message translates to:
  /// **'Routine Summary'**
  String get routineSummary;

  /// No description provided for @alarmOn.
  ///
  /// In en, this message translates to:
  /// **'Alarm ON'**
  String get alarmOn;

  /// No description provided for @alarmOff.
  ///
  /// In en, this message translates to:
  /// **'Alarm OFF'**
  String get alarmOff;

  /// No description provided for @contentHint.
  ///
  /// In en, this message translates to:
  /// **'Add content'**
  String get contentHint;

  /// No description provided for @addEvent.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get addEvent;

  /// No description provided for @manageItem.
  ///
  /// In en, this message translates to:
  /// **'Manage Item'**
  String get manageItem;

  /// No description provided for @manageItemDescription.
  ///
  /// In en, this message translates to:
  /// **'What would you like to do with this item?'**
  String get manageItemDescription;

  /// No description provided for @noTitle.
  ///
  /// In en, this message translates to:
  /// **'No Title'**
  String get noTitle;

  /// No description provided for @selectTitleColor.
  ///
  /// In en, this message translates to:
  /// **'Select Title Color'**
  String get selectTitleColor;

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
  /// **'Memory Tiles'**
  String get missionHiddenButton;

  /// No description provided for @missionHiddenButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Memorize the pattern of the tiles and tap them in order within 10 seconds.'**
  String get missionHiddenButtonDescription;

  /// No description provided for @missionHiddenButtonDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Δ{delta}'**
  String missionHiddenButtonDifficulty(int delta);

  /// No description provided for @missionTapSprint.
  ///
  /// In en, this message translates to:
  /// **'Rapid Tap'**
  String get missionTapSprint;

  /// No description provided for @missionTapSprintDescriptionShort.
  ///
  /// In en, this message translates to:
  /// **'Tap quickly to fill the meter.'**
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
  /// **'The meter drains if you stop tapping!'**
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

  /// No description provided for @fortuneCatchTime.
  ///
  /// In en, this message translates to:
  /// **'Time: {seconds}s'**
  String fortuneCatchTime(int seconds);

  /// No description provided for @fortuneCatchBest.
  ///
  /// In en, this message translates to:
  /// **'Best: {seconds}s'**
  String fortuneCatchBest(int seconds);

  /// No description provided for @fortuneCatchAngryHint.
  ///
  /// In en, this message translates to:
  /// **'Avoid the angry Fortuni to prevent penalties!'**
  String get fortuneCatchAngryHint;

  /// No description provided for @fortuneCatchInstruction.
  ///
  /// In en, this message translates to:
  /// **'Catch the happy Fortuni and avoid the angry ones!'**
  String get fortuneCatchInstruction;

  /// No description provided for @fortuneCatchPointMinus.
  ///
  /// In en, this message translates to:
  /// **'{points} points deducted'**
  String fortuneCatchPointMinus(int points);

  /// No description provided for @fortuneCatchPointPlus.
  ///
  /// In en, this message translates to:
  /// **'+{points} points'**
  String fortuneCatchPointPlus(int points);

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

  /// No description provided for @missionAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Mission {index}/{total} Analyzing...'**
  String missionAnalyzing(int index, int total);

  /// No description provided for @missionPointObject.
  ///
  /// In en, this message translates to:
  /// **'Mission {index}/{total}: Point at the object in the guide.'**
  String missionPointObject(int index, int total);

  /// No description provided for @missionPointSink.
  ///
  /// In en, this message translates to:
  /// **'Point at the sink.'**
  String get missionPointSink;

  /// No description provided for @missionPointRefrigerator.
  ///
  /// In en, this message translates to:
  /// **'Point at the refrigerator.'**
  String get missionPointRefrigerator;

  /// No description provided for @missionPointScale.
  ///
  /// In en, this message translates to:
  /// **'Point at the scale.'**
  String get missionPointScale;

  /// No description provided for @missionPointFace.
  ///
  /// In en, this message translates to:
  /// **'Point at your face.'**
  String get missionPointFace;

  /// No description provided for @missionPointObjectGeneric.
  ///
  /// In en, this message translates to:
  /// **'Point at the specified object.'**
  String get missionPointObjectGeneric;

  /// No description provided for @missionRecognizeObject.
  ///
  /// In en, this message translates to:
  /// **'Please recognize the object.'**
  String get missionRecognizeObject;

  /// No description provided for @missionPerform.
  ///
  /// In en, this message translates to:
  /// **'Please perform the mission.'**
  String get missionPerform;

  /// No description provided for @initError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during initialization.'**
  String get initError;

  /// No description provided for @analyzingNextTarget.
  ///
  /// In en, this message translates to:
  /// **'Analyzing next target...'**
  String get analyzingNextTarget;

  /// No description provided for @errorOccurredGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error occurred'**
  String get errorOccurredGeneric;

  /// No description provided for @missionSuccessWithCount.
  ///
  /// In en, this message translates to:
  /// **'{completed}/{total} Success!'**
  String missionSuccessWithCount(int completed, int total);

  /// No description provided for @missionMatchSuccess.
  ///
  /// In en, this message translates to:
  /// **'{total}/{total} Success! Matching success!'**
  String missionMatchSuccess(int total);

  /// No description provided for @escape.
  ///
  /// In en, this message translates to:
  /// **'Escape'**
  String get escape;

  /// No description provided for @pointObjectClearly.
  ///
  /// In en, this message translates to:
  /// **'Take a photo where the target is clearly visible'**
  String get pointObjectClearly;

  /// No description provided for @matchingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Matching Success!'**
  String get matchingSuccess;

  /// No description provided for @missionComplete.
  ///
  /// In en, this message translates to:
  /// **'Mission Complete!'**
  String get missionComplete;

  /// No description provided for @allMissionsComplete.
  ///
  /// In en, this message translates to:
  /// **'All Missions Complete!'**
  String get allMissionsComplete;

  /// No description provided for @missionSnoozeMessage.
  ///
  /// In en, this message translates to:
  /// **'Mission Success! But it will ring again in {minutes} minutes according to settings.'**
  String missionSnoozeMessage(String minutes);

  /// No description provided for @showFace.
  ///
  /// In en, this message translates to:
  /// **'Please show your face'**
  String get showFace;

  /// No description provided for @keepWatching.
  ///
  /// In en, this message translates to:
  /// **'Keep watching the screen'**
  String get keepWatching;

  /// No description provided for @recognizingFaceForFortune.
  ///
  /// In en, this message translates to:
  /// **'Recognizing face for physiognomy analysis'**
  String get recognizingFaceForFortune;

  /// No description provided for @dataNotStored.
  ///
  /// In en, this message translates to:
  /// **'Data is not stored'**
  String get dataNotStored;

  /// No description provided for @solveProblem.
  ///
  /// In en, this message translates to:
  /// **'Please solve the problem.'**
  String get solveProblem;

  /// No description provided for @correctAnswer.
  ///
  /// In en, this message translates to:
  /// **'Correct answer!'**
  String get correctAnswer;

  /// No description provided for @wrongAnswerRetry.
  ///
  /// In en, this message translates to:
  /// **'Wrong. Please try again.'**
  String get wrongAnswerRetry;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get correct;

  /// No description provided for @walkToDismiss.
  ///
  /// In en, this message translates to:
  /// **'Please walk while holding your smartphone'**
  String get walkToDismiss;

  /// No description provided for @shakeCount.
  ///
  /// In en, this message translates to:
  /// **'Shake Count'**
  String get shakeCount;

  /// No description provided for @shakeTimes.
  ///
  /// In en, this message translates to:
  /// **'{count} Shakes'**
  String shakeTimes(int count);

  /// No description provided for @tapTimes.
  ///
  /// In en, this message translates to:
  /// **'{count} Taps'**
  String tapTimes(int count);

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

  /// No description provided for @selectMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Select an alarm mission'**
  String get selectMissionTitle;

  /// No description provided for @ringtoneCategoryStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get ringtoneCategoryStandard;

  /// No description provided for @ringtoneCategoryCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get ringtoneCategoryCalm;

  /// No description provided for @ringtoneCategoryUpbeat.
  ///
  /// In en, this message translates to:
  /// **'Upbeat'**
  String get ringtoneCategoryUpbeat;

  /// No description provided for @ringtoneCategoryLoud.
  ///
  /// In en, this message translates to:
  /// **'Loud'**
  String get ringtoneCategoryLoud;

  /// No description provided for @noRingtones.
  ///
  /// In en, this message translates to:
  /// **'No ringtones found.'**
  String get noRingtones;

  /// No description provided for @photoPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Photo access permission is required.'**
  String get photoPermissionRequired;

  /// No description provided for @deleteImage.
  ///
  /// In en, this message translates to:
  /// **'Delete Image'**
  String get deleteImage;

  /// No description provided for @longPressToDelete.
  ///
  /// In en, this message translates to:
  /// **'Long press to delete.'**
  String get longPressToDelete;

  /// No description provided for @videoLoadFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to load video\nTap to retry'**
  String get videoLoadFail;

  /// No description provided for @existingCapturedImages.
  ///
  /// In en, this message translates to:
  /// **'Existing Captured Images'**
  String get existingCapturedImages;

  /// No description provided for @deleteCount.
  ///
  /// In en, this message translates to:
  /// **'Delete {count}'**
  String deleteCount(int count);

  /// No description provided for @deleteSelectedImagesConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} images?\nThis action cannot be undone.'**
  String deleteSelectedImagesConfirm(int count);

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

  /// No description provided for @cuckooClock.
  ///
  /// In en, this message translates to:
  /// **'Cuckoo Clock'**
  String get cuckooClock;

  /// No description provided for @calmAlarm.
  ///
  /// In en, this message translates to:
  /// **'Calm Alarm'**
  String get calmAlarm;

  /// No description provided for @doorKnock.
  ///
  /// In en, this message translates to:
  /// **'Door Knock'**
  String get doorKnock;

  /// No description provided for @earlySunrise.
  ///
  /// In en, this message translates to:
  /// **'Early Sunrise'**
  String get earlySunrise;

  /// No description provided for @goodMorningSound.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorningSound;

  /// No description provided for @inAHurry.
  ///
  /// In en, this message translates to:
  /// **'In a Hurry'**
  String get inAHurry;

  /// No description provided for @lovingYou.
  ///
  /// In en, this message translates to:
  /// **'Loving You'**
  String get lovingYou;

  /// No description provided for @sirenSound.
  ///
  /// In en, this message translates to:
  /// **'Siren'**
  String get sirenSound;

  /// No description provided for @swingingSound.
  ///
  /// In en, this message translates to:
  /// **'Swinging'**
  String get swingingSound;

  /// No description provided for @telephoneBusy.
  ///
  /// In en, this message translates to:
  /// **'Telephone Busy'**
  String get telephoneBusy;

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

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

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
  /// **'Snooze'**
  String get alarmSnooze;

  /// No description provided for @snoozeMinutesUnlimited.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m (Unlimited)'**
  String snoozeMinutesUnlimited(String minutes);

  /// No description provided for @snoozeMinutesCount.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ({current}/{total})'**
  String snoozeMinutesCount(String minutes, int current, int total);

  /// No description provided for @ringtone_fluttering_day.
  ///
  /// In en, this message translates to:
  /// **'Fluttering Day'**
  String get ringtone_fluttering_day;

  /// No description provided for @ringtone_cozy_day.
  ///
  /// In en, this message translates to:
  /// **'Cozy Day'**
  String get ringtone_cozy_day;

  /// No description provided for @ringtone_sensible_day.
  ///
  /// In en, this message translates to:
  /// **'Sensible Day'**
  String get ringtone_sensible_day;

  /// No description provided for @ringtone_play_with_me.
  ///
  /// In en, this message translates to:
  /// **'Play with Me'**
  String get ringtone_play_with_me;

  /// No description provided for @ringtone_refreshing_day.
  ///
  /// In en, this message translates to:
  /// **'Refreshing Day'**
  String get ringtone_refreshing_day;

  /// No description provided for @ringtone_new_beginning.
  ///
  /// In en, this message translates to:
  /// **'New Beginning'**
  String get ringtone_new_beginning;

  /// No description provided for @ringtone_self_love.
  ///
  /// In en, this message translates to:
  /// **'Self Love'**
  String get ringtone_self_love;

  /// No description provided for @cherry_stained_finger.
  ///
  /// In en, this message translates to:
  /// **'Cherry Stained Finger'**
  String get cherry_stained_finger;

  /// No description provided for @dancing_in_the_stars.
  ///
  /// In en, this message translates to:
  /// **'Dancing In The Stars'**
  String get dancing_in_the_stars;

  /// No description provided for @nice_day.
  ///
  /// In en, this message translates to:
  /// **'Nice Day'**
  String get nice_day;

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
  /// **'Experience a special Tarot reading from our fortune teller.'**
  String get fortuneLoadingMessage;

  /// No description provided for @fortuneAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your selected Tarot card... {progress}%'**
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
  String fortuneSelectTitleDate(String month, int day);

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
  /// **'Fortune for {month}/{day}, {year}'**
  String fortuneResultTitleDate(int year, String month, int day);

  /// No description provided for @startDayButton.
  ///
  /// In en, this message translates to:
  /// **'Start Your Day'**
  String get startDayButton;

  /// No description provided for @tarotName0.
  ///
  /// In en, this message translates to:
  /// **'The Fool'**
  String get tarotName0;

  /// No description provided for @tarotName1.
  ///
  /// In en, this message translates to:
  /// **'The Magician'**
  String get tarotName1;

  /// No description provided for @tarotName2.
  ///
  /// In en, this message translates to:
  /// **'The High Priestess'**
  String get tarotName2;

  /// No description provided for @tarotName3.
  ///
  /// In en, this message translates to:
  /// **'The Empress'**
  String get tarotName3;

  /// No description provided for @tarotName4.
  ///
  /// In en, this message translates to:
  /// **'The Emperor'**
  String get tarotName4;

  /// No description provided for @tarotName5.
  ///
  /// In en, this message translates to:
  /// **'The Hierophant'**
  String get tarotName5;

  /// No description provided for @tarotName6.
  ///
  /// In en, this message translates to:
  /// **'The Lovers'**
  String get tarotName6;

  /// No description provided for @tarotName7.
  ///
  /// In en, this message translates to:
  /// **'The Chariot'**
  String get tarotName7;

  /// No description provided for @tarotName8.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get tarotName8;

  /// No description provided for @tarotName9.
  ///
  /// In en, this message translates to:
  /// **'The Hermit'**
  String get tarotName9;

  /// No description provided for @tarotName10.
  ///
  /// In en, this message translates to:
  /// **'Wheel of Fortune'**
  String get tarotName10;

  /// No description provided for @tarotName11.
  ///
  /// In en, this message translates to:
  /// **'Justice'**
  String get tarotName11;

  /// No description provided for @tarotName12.
  ///
  /// In en, this message translates to:
  /// **'The Hanged Man'**
  String get tarotName12;

  /// No description provided for @tarotName13.
  ///
  /// In en, this message translates to:
  /// **'Death'**
  String get tarotName13;

  /// No description provided for @tarotName14.
  ///
  /// In en, this message translates to:
  /// **'Temperance'**
  String get tarotName14;

  /// No description provided for @tarotName15.
  ///
  /// In en, this message translates to:
  /// **'The Devil'**
  String get tarotName15;

  /// No description provided for @tarotName16.
  ///
  /// In en, this message translates to:
  /// **'The Tower'**
  String get tarotName16;

  /// No description provided for @tarotName17.
  ///
  /// In en, this message translates to:
  /// **'The Star'**
  String get tarotName17;

  /// No description provided for @tarotName18.
  ///
  /// In en, this message translates to:
  /// **'The Moon'**
  String get tarotName18;

  /// No description provided for @tarotName19.
  ///
  /// In en, this message translates to:
  /// **'The Sun'**
  String get tarotName19;

  /// No description provided for @tarotName20.
  ///
  /// In en, this message translates to:
  /// **'Judgement'**
  String get tarotName20;

  /// No description provided for @tarotName21.
  ///
  /// In en, this message translates to:
  /// **'The World'**
  String get tarotName21;

  /// No description provided for @tarotKeywords0.
  ///
  /// In en, this message translates to:
  /// **'New beginnings, adventure, innocence, freedom, recklessness'**
  String get tarotKeywords0;

  /// No description provided for @tarotDesc0.
  ///
  /// In en, this message translates to:
  /// **'The Fool stands precariously at the edge of a cliff in colorful clothes, but his gaze is fixed on the distance, full of hope.'**
  String get tarotDesc0;

  /// No description provided for @tarotLoveMeaning0.
  ///
  /// In en, this message translates to:
  /// **'An unexpected new love may arrive, or a fateful encounter at first sight may occur.'**
  String get tarotLoveMeaning0;

  /// No description provided for @tarotLoveDetail0.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when you can start love with a pure heart like a child. Forget all past wounds or complex conditions and be faithful to the emotions of this moment. You may encounter a new connection in an unexpected place or have a heart-fluttering experience of falling in love at first sight.'**
  String get tarotLoveDetail0;

  /// No description provided for @tarotWealthMeaning0.
  ///
  /// In en, this message translates to:
  /// **'New investments or business items may catch your eye. It\'s a time when profits follow when you work happily without being tied to money.'**
  String get tarotWealthMeaning0;

  /// No description provided for @tarotWealthDetail0.
  ///
  /// In en, this message translates to:
  /// **'A time when new financial opportunities are opening up. You can achieve unexpected results by investing in creative items that others haven\'t tried or by challenging new fields. However, avoid reckless spending and let profits naturally follow the process of enjoying your work.'**
  String get tarotWealthDetail0;

  /// No description provided for @tarotSuccessMeaning0.
  ///
  /// In en, this message translates to:
  /// **'It\'s a good time to start a new project or change to a completely different field.'**
  String get tarotSuccessMeaning0;

  /// No description provided for @tarotSuccessDetail0.
  ///
  /// In en, this message translates to:
  /// **'The most suitable time to start a new project or change to a completely different field. Take a bold first step with excitement rather than fear of failure. Your pure passion will positively influence those around you and open new paths.'**
  String get tarotSuccessDetail0;

  /// No description provided for @tarotKeywords1.
  ///
  /// In en, this message translates to:
  /// **'Creation, Will, Ability, Realization, Versatility'**
  String get tarotKeywords1;

  /// No description provided for @tarotDesc1.
  ///
  /// In en, this message translates to:
  /// **'The magician is wearing a red robe, one hand pointing to the sky and the other to the ground, bringing heavenly power to the ground.'**
  String get tarotDesc1;

  /// No description provided for @tarotLoveMeaning1.
  ///
  /// In en, this message translates to:
  /// **'This is a time when your charm is at its peak and you become popular with the opposite sex.'**
  String get tarotLoveMeaning1;

  /// No description provided for @tarotLoveDetail1.
  ///
  /// In en, this message translates to:
  /// **'This is a perfect opportunity for your charm and talent to shine and capture someone\'s heart. If there\'s someone you like, don\'t hesitate and approach them actively. Your sense of humor and witty conversation will delight them, allowing you to take the lead in the relationship. Win your love with confidence.'**
  String get tarotLoveDetail1;

  /// No description provided for @tarotWealthMeaning1.
  ///
  /// In en, this message translates to:
  /// **'It\'s the right time to generate revenue using your abilities and skills.'**
  String get tarotWealthMeaning1;

  /// No description provided for @tarotWealthDetail1.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when your knowledge, skills, and ideas turn into money. Don\'t just settle for your salary; try creating additional income through side jobs or second careers. Your creative planning and sales abilities will be outstanding, leading to higher-than-expected profits.'**
  String get tarotWealthDetail1;

  /// No description provided for @tarotSuccessMeaning1.
  ///
  /// In en, this message translates to:
  /// **'Your work ability is excellently demonstrated and recognized by those around you.'**
  String get tarotSuccessMeaning1;

  /// No description provided for @tarotSuccessDetail1.
  ///
  /// In en, this message translates to:
  /// **'You can stand out in your workplace or studies by fully demonstrating your abilities. No matter what problem arises, you can solve it with your own wit and cleverness, being recognized as a \'talented person\' by colleagues and superiors. Trust yourself and show your skills confidently.'**
  String get tarotSuccessDetail1;

  /// No description provided for @tarotKeywords2.
  ///
  /// In en, this message translates to:
  /// **'Intuition, wisdom, mystery, secret, platonic'**
  String get tarotKeywords2;

  /// No description provided for @tarotDesc2.
  ///
  /// In en, this message translates to:
  /// **'The High Priestess sits behind a mysterious veil, holding a scroll of wisdom and balancing to symbolize deep insight.'**
  String get tarotDesc2;

  /// No description provided for @tarotLoveMeaning2.
  ///
  /// In en, this message translates to:
  /// **'It means platonic love where spiritual communion is important.'**
  String get tarotLoveMeaning2;

  /// No description provided for @tarotLoveDetail2.
  ///
  /// In en, this message translates to:
  /// **'You\'ll be attracted to someone with spiritual depth and good conversation rather than just physical charm. Your intuition for reading others\' minds is developed, so you can understand each other\'s feelings without words. However, being too cautious can cause misunderstandings, so try expressing your feelings honestly sometimes.'**
  String get tarotLoveDetail2;

  /// No description provided for @tarotWealthMeaning2.
  ///
  /// In en, this message translates to:
  /// **'Now is the time to protect your assets and watch the situation rather than actively investing.'**
  String get tarotWealthMeaning2;

  /// No description provided for @tarotWealthDetail2.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time to analyze and study market conditions calmly rather than moving hastily for immediate profit. Since this is a time for sowing seeds and waiting, don\'t be impatient if you don\'t see immediate gains. It\'s better to consider investments from a long-term perspective like real estate or stocks.'**
  String get tarotWealthDetail2;

  /// No description provided for @tarotSuccessMeaning2.
  ///
  /// In en, this message translates to:
  /// **'You can achieve good results in fields such as studies, research, and professional jobs.'**
  String get tarotSuccessMeaning2;

  /// No description provided for @tarotSuccessDetail2.
  ///
  /// In en, this message translates to:
  /// **'Focus on strengthening your internal foundations and building skills rather than on flashy external results. You can achieve excellent outcomes in tasks requiring deep thinking like research, planning, or analysis. Your wise and cautious attitude will be the key to solving problems at decisive moments.'**
  String get tarotSuccessDetail2;

  /// No description provided for @tarotKeywords3.
  ///
  /// In en, this message translates to:
  /// **'Abundance, motherhood, nature, beauty, fruit'**
  String get tarotKeywords3;

  /// No description provided for @tarotDesc3.
  ///
  /// In en, this message translates to:
  /// **'The Empress, sitting comfortably in abundant nature, is a symbol of material and spiritual abundance.'**
  String get tarotDesc3;

  /// No description provided for @tarotLoveMeaning3.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when love overflows and the relationship becomes deeper.'**
  String get tarotLoveMeaning3;

  /// No description provided for @tarotLoveDetail3.
  ///
  /// In en, this message translates to:
  /// **'It\'s a period when your inclusive charm is maximized, making you appear very attractive to others. If you\'re in a relationship, you\'ll receive great love for your warm and caring nature, and marriage talks may arise. If you\'re single, grooming your appearance or changing your style will greatly help improve your love luck.'**
  String get tarotLoveDetail3;

  /// No description provided for @tarotWealthMeaning3.
  ///
  /// In en, this message translates to:
  /// **'It\'s a very materially abundant and stable time.'**
  String get tarotWealthMeaning3;

  /// No description provided for @tarotWealthDetail3.
  ///
  /// In en, this message translates to:
  /// **'Your financial luck is blooming. Rewards follow as much as your effort, or even more, allowing you to enjoy economic leisure. You may achieve higher-than-expected profits in business or investments, or receive unexpected bonuses or gifts. Sharing this abundant energy with those around you will bring even greater fortune.'**
  String get tarotWealthDetail3;

  /// No description provided for @tarotSuccessMeaning3.
  ///
  /// In en, this message translates to:
  /// **'Projects in progress grow smoothly and produce good results.'**
  String get tarotSuccessMeaning3;

  /// No description provided for @tarotSuccessDetail3.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when the results of work appear visibly. Projects will finish successfully, leading to performance bonuses or promotion opportunities. Your talent will especially shine in fields requiring aesthetic sense or creativity. Working while enjoying the process will bring even better results.'**
  String get tarotSuccessDetail3;

  /// No description provided for @tarotKeywords4.
  ///
  /// In en, this message translates to:
  /// **'Authority, structure, stability, leadership, responsibility'**
  String get tarotKeywords4;

  /// No description provided for @tarotDesc4.
  ///
  /// In en, this message translates to:
  /// **'The Emperor, sitting on a hard stone throne in armor, symbolizes firm dominance and order.'**
  String get tarotDesc4;

  /// No description provided for @tarotLoveMeaning4.
  ///
  /// In en, this message translates to:
  /// **'It means a stable relationship with a reliable and responsible partner.'**
  String get tarotLoveMeaning4;

  /// No description provided for @tarotLoveDetail4.
  ///
  /// In en, this message translates to:
  /// **'A relationship based on trust and stability continues rather than burning passion. Your partner will reliably protect and lead you. However, be careful not to be too controlling or stubborn. If you\'re single, you\'ll have opportunities to meet someone with ability and social status.'**
  String get tarotLoveDetail4;

  /// No description provided for @tarotWealthMeaning4.
  ///
  /// In en, this message translates to:
  /// **'You can accumulate financial stability with systematic asset management.'**
  String get tarotWealthMeaning4;

  /// No description provided for @tarotWealthDetail4.
  ///
  /// In en, this message translates to:
  /// **'Setting principles and plans is important in financial management. Rather than speculation aiming for a windfall, it\'s better to build a foundation by investing in safe and certain assets like savings or real estate. Your realistic judgment and drive will be a great help in accumulating wealth.'**
  String get tarotWealthDetail4;

  /// No description provided for @tarotSuccessMeaning4.
  ///
  /// In en, this message translates to:
  /// **'You are in a favorable position to be promoted at work or rise to a leadership role.'**
  String get tarotSuccessMeaning4;

  /// No description provided for @tarotSuccessDetail4.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when your position within the organization becomes solid. You may be promoted to team leader or manager in recognition of your leadership, and you may be put in charge of important projects. You\'ll gain the trust of your superiors by handling tasks with rational and cool judgment without being swayed by emotions.'**
  String get tarotSuccessDetail4;

  /// No description provided for @tarotKeywords5.
  ///
  /// In en, this message translates to:
  /// **'Tradition, teaching, belief, advice, mediation'**
  String get tarotKeywords5;

  /// No description provided for @tarotDesc5.
  ///
  /// In en, this message translates to:
  /// **'The Hierophant is a spiritual teacher who values social norms and traditions and leads people with wise advice.'**
  String get tarotDesc5;

  /// No description provided for @tarotLoveMeaning5.
  ///
  /// In en, this message translates to:
  /// **'Serious and healthy meetings continue based on trust and respect.'**
  String get tarotLoveMeaning5;

  /// No description provided for @tarotLoveDetail5.
  ///
  /// In en, this message translates to:
  /// **'You\'ll want a serious relationship with marriage in mind rather than a casual encounter. You can meet a good connection in blind dates, arranged meetings, or healthy gatherings. If there\'s a conflict between partners, try seeking advice from elders or seniors around you. Their wise advice will be a great help in restoring the relationship.'**
  String get tarotLoveDetail5;

  /// No description provided for @tarotWealthMeaning5.
  ///
  /// In en, this message translates to:
  /// **'Traditional and safe methods of financial technology are good.'**
  String get tarotWealthMeaning5;

  /// No description provided for @tarotWealthDetail5.
  ///
  /// In en, this message translates to:
  /// **'Stability should be the top priority rather than adventurous investment. It\'s good to use traditional financial products like bank savings or insurance. Seeking professional consulting or maintaining honest and transparent financial transactions is the way to protect your credit and assets.'**
  String get tarotWealthDetail5;

  /// No description provided for @tarotSuccessMeaning5.
  ///
  /// In en, this message translates to:
  /// **'Contracts, alliances, and cooperative relationships will be signed smoothly.'**
  String get tarotSuccessMeaning5;

  /// No description provided for @tarotSuccessDetail5.
  ///
  /// In en, this message translates to:
  /// **'It\'s wise to receive help from those around you rather than trying to solve the problem alone. You can find solutions surprisingly easily if you seek advice from superiors like bosses or mentors. Following company rules and procedures is the shortcut to getting good evaluations, and it\'s also a good time to sign important contracts.'**
  String get tarotSuccessDetail5;

  /// No description provided for @tarotKeywords6.
  ///
  /// In en, this message translates to:
  /// **'Love, harmony, choice, union, partnership'**
  String get tarotKeywords6;

  /// No description provided for @tarotDesc6.
  ///
  /// In en, this message translates to:
  /// **'Adam and Eve stand receiving a blessing from an angel under a warm sun.'**
  String get tarotDesc6;

  /// No description provided for @tarotLoveMeaning6.
  ///
  /// In en, this message translates to:
  /// **'This is one of the best times for love to bloom.'**
  String get tarotLoveMeaning6;

  /// No description provided for @tarotLoveDetail6.
  ///
  /// In en, this message translates to:
  /// **'A heart-fluttering romance awaits you. You\'ll rapidly get closer to someone you\'re attracted to, and you can feel a telepathic connection just by making eye contact. If you\'re preparing to confess, the success rate is very high, so take courage. However, you need the wisdom to choose where your heart truly belongs rather than being swept away by momentary temptation.'**
  String get tarotLoveDetail6;

  /// No description provided for @tarotWealthMeaning6.
  ///
  /// In en, this message translates to:
  /// **'Your financial fortunes increase when you\'re together rather than alone.'**
  String get tarotWealthMeaning6;

  /// No description provided for @tarotWealthDetail6.
  ///
  /// In en, this message translates to:
  /// **'Promoting work with someone you get along with will create synergy and increase financial benefits. If you receive a partnership proposal, review it positively. It\'s a time when you can get useful investment information through communication with people around you. However, spending for pleasure may become excessive, so proper adjustment is necessary.'**
  String get tarotWealthDetail6;

  /// No description provided for @tarotSuccessMeaning6.
  ///
  /// In en, this message translates to:
  /// **'This is a time when teamwork shines.'**
  String get tarotSuccessMeaning6;

  /// No description provided for @tarotSuccessDetail6.
  ///
  /// In en, this message translates to:
  /// **'You\'ll work joyfully with colleagues or business partners who fit you perfectly. You can achieve better results in team projects than in solo tasks, and smooth interpersonal relationships will be the key to success. If you choose work that you truly love and enjoy, you\'ll get results you won\'t regret.'**
  String get tarotSuccessDetail6;

  /// No description provided for @tarotKeywords7.
  ///
  /// In en, this message translates to:
  /// **'Victory, will, forward, conquest, movement'**
  String get tarotKeywords7;

  /// No description provided for @tarotDesc7.
  ///
  /// In en, this message translates to:
  /// **'A young king in a chariot rushes forward toward his goal with strong will and wins a victory.'**
  String get tarotDesc7;

  /// No description provided for @tarotLoveMeaning7.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when active romantic pursuits succeed.'**
  String get tarotLoveMeaning7;

  /// No description provided for @tarotLoveDetail7.
  ///
  /// In en, this message translates to:
  /// **'It\'s time to rush to win love. Don\'t hesitate and express your heart honestly and proudly; you can win even if there are competitors. If you\'re in a \'some\' stage, it\'s good to define the relationship clearly and lead. Dynamic dates or traveling together will deepen your affection.'**
  String get tarotLoveDetail7;

  /// No description provided for @tarotWealthMeaning7.
  ///
  /// In en, this message translates to:
  /// **'It\'s time to move aggressively to achieve the target profit.'**
  String get tarotWealthMeaning7;

  /// No description provided for @tarotWealthDetail7.
  ///
  /// In en, this message translates to:
  /// **'Strong drive is needed to achieve financial goals. Don\'t hesitate and make bold decisions when the opportunity arises; this drive will bring you profit. It\'s advantageous to focus on projects that yield results in the short term, and your performance will increase as much as you work hard. Movement-related expenses may occur, but they will be investments for new opportunities.'**
  String get tarotWealthDetail7;

  /// No description provided for @tarotSuccessMeaning7.
  ///
  /// In en, this message translates to:
  /// **'You are likely to win the competition and achieve your goals.'**
  String get tarotSuccessMeaning7;

  /// No description provided for @tarotSuccessDetail7.
  ///
  /// In en, this message translates to:
  /// **'Clear goal achievement such as promotion, passing, or contract signing is predicted. The more intense the competition, the more your fighting spirit will burn, eventually leading to victory. Your image of breaking through obstacles directly will leave a deep impression on those around you, and you\'ll demonstrate excellent abilities in tasks with frequent business trips or movement.'**
  String get tarotSuccessDetail7;

  /// No description provided for @tarotKeywords8.
  ///
  /// In en, this message translates to:
  /// **'Patience, courage, inner strength, embrace, gentle but firm'**
  String get tarotKeywords8;

  /// No description provided for @tarotDesc8.
  ///
  /// In en, this message translates to:
  /// **'A woman in white gently handles a lion\'s mouth, symbolizing spiritual strength and patience over physical power.'**
  String get tarotDesc8;

  /// No description provided for @tarotLoveMeaning8.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when you need the tolerance to accept and understand the other person as they are.'**
  String get tarotLoveMeaning8;

  /// No description provided for @tarotLoveDetail8.
  ///
  /// In en, this message translates to:
  /// **'Current love requires patience and wisdom. The relationship can develop to the next level when you accept and embrace the other person\'s shortcomings or complaints with a broad heart. A \'gentle but firm\' attitude leading the other person with a soft touch is needed, and if you stay by their side patiently, your sincerity will eventually open their heart.'**
  String get tarotLoveDetail8;

  /// No description provided for @tarotWealthMeaning8.
  ///
  /// In en, this message translates to:
  /// **'Steady savings and healthy consumption habits are the secrets to collecting wealth.'**
  String get tarotWealthMeaning8;

  /// No description provided for @tarotWealthDetail8.
  ///
  /// In en, this message translates to:
  /// **'Your financial fortune is gradually rising. Don\'t be disappointed even if big money doesn\'t come in immediately; manage your assets faithfully, and it will return as a large sum later. In investing, it\'s advantageous to hold on firmly rather than being swayed by short-term fluctuations. Managing your impulsive desire to consume is the shortcut to becoming rich.'**
  String get tarotWealthDetail8;

  /// No description provided for @tarotSuccessMeaning8.
  ///
  /// In en, this message translates to:
  /// **'Even if you encounter a difficult task or a picky boss, you can deal with it wisely.'**
  String get tarotSuccessMeaning8;

  /// No description provided for @tarotSuccessDetail8.
  ///
  /// In en, this message translates to:
  /// **'You may be assigned a hard project or a picky task, but you have enough potential to solve it. Though you appear soft on the outside, you stand out by overcoming obstacles one by one with strong inner will. Your calm problem-solving ability will lead people around you to send deep trust your way.'**
  String get tarotSuccessDetail8;

  /// No description provided for @tarotKeywords9.
  ///
  /// In en, this message translates to:
  /// **'Reflection, solitude, exploration, wisdom, rest'**
  String get tarotKeywords9;

  /// No description provided for @tarotDesc9.
  ///
  /// In en, this message translates to:
  /// **'An old man with a lamp on a dark snowy mountain listens to his inner voice and explores the truth.'**
  String get tarotDesc9;

  /// No description provided for @tarotLoveMeaning9.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when you need time for yourself or think deeply about love.'**
  String get tarotLoveMeaning9;

  /// No description provided for @tarotLoveDetail9.
  ///
  /// In en, this message translates to:
  /// **'Now is a time when you need time to look back on yourself rather than active dating. Instead of meeting just anyone to soothe loneliness, think deeply about what kind of love you truly want. Even if you have a partner, taking some distance and having your own time can actually help you realize the essence of the relationship.'**
  String get tarotLoveDetail9;

  /// No description provided for @tarotWealthMeaning9.
  ///
  /// In en, this message translates to:
  /// **'Financial activities may be somewhat contracted.'**
  String get tarotWealthMeaning9;

  /// No description provided for @tarotWealthDetail9.
  ///
  /// In en, this message translates to:
  /// **'You should take a conservative attitude toward wealth. Rather than making new investments or starting businesses, it\'s important to check your current assets thoroughly and stop money from leaking. Instead, spending on study or skill acquisition to increase your value is a great investment that will lead to larger profits later.'**
  String get tarotWealthDetail9;

  /// No description provided for @tarotSuccessMeaning9.
  ///
  /// In en, this message translates to:
  /// **'You achieve results in fields that deeply research professional knowledge or skills.'**
  String get tarotSuccessMeaning9;

  /// No description provided for @tarotSuccessDetail9.
  ///
  /// In en, this message translates to:
  /// **'You can achieve excellent results in tasks that require deep focus alone, such as research, planning, or development. It\'s a period of silently building skills even if not recognized by others, and it\'s advantageous to focus on the essence of the work rather than workplace relationships. If there\'s an unsolved problem, find an experienced mentor for advice.'**
  String get tarotSuccessDetail9;

  /// No description provided for @tarotKeywords10.
  ///
  /// In en, this message translates to:
  /// **'Destiny, change, opportunity, cycle, turning point'**
  String get tarotKeywords10;

  /// No description provided for @tarotDesc10.
  ///
  /// In en, this message translates to:
  /// **'A huge wheel of fortune turns, signaling the inevitable flow of destiny and the start of a new cycle.'**
  String get tarotDesc10;

  /// No description provided for @tarotLoveMeaning10.
  ///
  /// In en, this message translates to:
  /// **'A fateful encounter awaits you.'**
  String get tarotLoveMeaning10;

  /// No description provided for @tarotLoveDetail10.
  ///
  /// In en, this message translates to:
  /// **'A fated love like a movie is coming your way. Dramatic events such as meeting someone in an unexpected place or a surprise reunion may occur, so keep your heart open. Singles might meet someone they fall for at first sight, while couples will find their relationship advancing to the next level. Don\'t miss this good flow.'**
  String get tarotLoveDetail10;

  /// No description provided for @tarotWealthMeaning10.
  ///
  /// In en, this message translates to:
  /// **'The flow of financial luck is improving.'**
  String get tarotWealthMeaning10;

  /// No description provided for @tarotWealthDetail10.
  ///
  /// In en, this message translates to:
  /// **'The goddess of luck is smiling upon you. Your financial fortune is on an upward curve, with unexpected income or investment returns. As money circulation becomes smooth, you need the boldness to seize the opportunity when it comes. However, since luck cycles, don\'t forget the wisdom to save for the future when things are going well.'**
  String get tarotWealthDetail10;

  /// No description provided for @tarotSuccessMeaning10.
  ///
  /// In en, this message translates to:
  /// **'The situation is turning in your favor.'**
  String get tarotSuccessMeaning10;

  /// No description provided for @tarotSuccessDetail10.
  ///
  /// In en, this message translates to:
  /// **'A turning point has arrived where blocked matters start to flow smoothly. The tide is turning in your favor, so don\'t hesitate to seize new opportunities. Opportunities for change like promotion or career moves will be an upward current taking you to a higher place. Going with the flow will bring great results.'**
  String get tarotSuccessDetail10;

  /// No description provided for @tarotKeywords11.
  ///
  /// In en, this message translates to:
  /// **'Fairness, balance, responsibility, truth, cause and effect'**
  String get tarotKeywords11;

  /// No description provided for @tarotDesc11.
  ///
  /// In en, this message translates to:
  /// **'A judge in a red robe holds a sword in his right hand and a scale in his left.'**
  String get tarotDesc11;

  /// No description provided for @tarotLoveMeaning11.
  ///
  /// In en, this message translates to:
  /// **'It\'s a relationship where reason precedes emotion.'**
  String get tarotLoveMeaning11;

  /// No description provided for @tarotLoveDetail11.
  ///
  /// In en, this message translates to:
  /// **'Now is a time for rational judgment rather than being swayed by emotions. Look back to see if your relationship is balanced, and if you\'re sacrificing too much or only receiving. If you\'re thinking about marriage, you might meticulously weigh your partner\'s conditions or background; honest and fair conversation will be the solution for relationship improvement.'**
  String get tarotLoveDetail11;

  /// No description provided for @tarotWealthMeaning11.
  ///
  /// In en, this message translates to:
  /// **'Careful checking is needed in financial transactions or contracts.'**
  String get tarotWealthMeaning11;

  /// No description provided for @tarotWealthDetail11.
  ///
  /// In en, this message translates to:
  /// **'A situation may arise where you need to clarify right from wrong in financial matters. It\'s a good time to cleanly settle financial relationships, such as receiving borrowed money or repaying debts. When signing contracts, check carefully for any toxic clauses and handle everything according to principles rather than relying on luck or expedients.'**
  String get tarotWealthDetail11;

  /// No description provided for @tarotSuccessMeaning11.
  ///
  /// In en, this message translates to:
  /// **'You receive a fair evaluation and legitimate compensation.'**
  String get tarotSuccessMeaning11;

  /// No description provided for @tarotSuccessDetail11.
  ///
  /// In en, this message translates to:
  /// **'You will receive a fair and objective evaluation of your work performance. If you\'ve worked hard, legitimate rewards like promotions or bonuses will follow, and you can demonstrate your abilities in fields requiring accuracy like law or accounting. When making decisions, exclude emotions and judge based strictly on data and facts.'**
  String get tarotSuccessDetail11;

  /// No description provided for @tarotKeywords12.
  ///
  /// In en, this message translates to:
  /// **'Sacrifice, patience, new perspective, stagnation, enlightenment'**
  String get tarotKeywords12;

  /// No description provided for @tarotDesc12.
  ///
  /// In en, this message translates to:
  /// **'A man hanging upside down from a tree looks at the world from a new perspective through voluntary hardship and gains enlightenment.'**
  String get tarotDesc12;

  /// No description provided for @tarotLoveMeaning12.
  ///
  /// In en, this message translates to:
  /// **'The relationship may stagnate or unrequited feelings may last for a long time.'**
  String get tarotLoveMeaning12;

  /// No description provided for @tarotLoveDetail12.
  ///
  /// In en, this message translates to:
  /// **'You may feel frustrated because the progress of love is stalled, but rushing won\'t solve anything now. Stop for a moment and look at the current situation from a different perspective, reflecting on whether you\'ve been forcing love only in your own way. The patience to think and care from the other person\'s position will eventually be the key to opening their heart.'**
  String get tarotLoveDetail12;

  /// No description provided for @tarotWealthMeaning12.
  ///
  /// In en, this message translates to:
  /// **'Fund flow may be tied up or you may have to bear losses.'**
  String get tarotWealthMeaning12;

  /// No description provided for @tarotWealthDetail12.
  ///
  /// In en, this message translates to:
  /// **'You may feel completely blocked financially. Invested money may be tied up or expected income may be delayed, but the more you struggle, the more tangled it might get. It\'s better to empty your mind and observe for now. Use this period to check your consumption habits and re-establish your values regarding money.'**
  String get tarotWealthDetail12;

  /// No description provided for @tarotSuccessMeaning12.
  ///
  /// In en, this message translates to:
  /// **'Work may not proceed as planned and may be delayed.'**
  String get tarotSuccessMeaning12;

  /// No description provided for @tarotSuccessDetail12.
  ///
  /// In en, this message translates to:
  /// **'Projects might be suspended or work delayed, causing stress, but this is a temporary stop signal rather than a failure. Don\'t try to force progress; instead, step back and redraw the overall picture. Brilliant ideas can emerge when you break fixed ideas, and current trials will give you new enlightenment.'**
  String get tarotSuccessDetail12;

  /// No description provided for @tarotKeywords13.
  ///
  /// In en, this message translates to:
  /// **'Ending, change, rebirth, separation, new beginning'**
  String get tarotKeywords13;

  /// No description provided for @tarotDesc13.
  ///
  /// In en, this message translates to:
  /// **'It symbolizes the complete termination of the old and a new beginning resulting from it, representing a painful but inevitable process of change.'**
  String get tarotDesc13;

  /// No description provided for @tarotLoveMeaning13.
  ///
  /// In en, this message translates to:
  /// **'It means the end of a relationship or a big change.'**
  String get tarotLoveMeaning13;

  /// No description provided for @tarotLoveDetail13.
  ///
  /// In en, this message translates to:
  /// **'The current relationship may have reached its limit. You need the courage to let it flow naturally rather than trying to hold on; separation is painful, but a better new beginning always waits at the end. Remember that a place for a new person is created only when you completely escape from past lingering feelings or wounds.'**
  String get tarotLoveDetail13;

  /// No description provided for @tarotWealthMeaning13.
  ///
  /// In en, this message translates to:
  /// **'Difficult situations such as financial losses or investment failures may come.'**
  String get tarotWealthMeaning13;

  /// No description provided for @tarotWealthDetail13.
  ///
  /// In en, this message translates to:
  /// **'A big change is expected financially. You might experience losses in trusted investments or face difficulties with unexpected expenses, but this is a signal to change inefficient asset management methods. Organize your debts and completely cut off unnecessary spending to use this as a stepping stone for a healthier financial structure.'**
  String get tarotWealthDetail13;

  /// No description provided for @tarotSuccessMeaning13.
  ///
  /// In en, this message translates to:
  /// **'Work in progress may be interrupted or failed.'**
  String get tarotSuccessMeaning13;

  /// No description provided for @tarotSuccessDetail13.
  ///
  /// In en, this message translates to:
  /// **'A project you worked hard on might fall through, or you could experience major changes at work. While the sense of frustration will be great for now, this is a revelation of destiny to organize work that doesn\'t fit you and find a new path for greater success. If you discard old ways and start with a completely new mindset, a more wonderful next chapter will open.'**
  String get tarotSuccessDetail13;

  /// No description provided for @tarotKeywords14.
  ///
  /// In en, this message translates to:
  /// **'Balance, temperance, harmony, healing, moderation'**
  String get tarotKeywords14;

  /// No description provided for @tarotDesc14.
  ///
  /// In en, this message translates to:
  /// **'Water is transferred between two cups, symbolizing perfect balance between reality and ideals and a harmonious flow.'**
  String get tarotDesc14;

  /// No description provided for @tarotLoveMeaning14.
  ///
  /// In en, this message translates to:
  /// **'It\'s a process of two different people meeting and achieving harmony.'**
  String get tarotLoveMeaning14;

  /// No description provided for @tarotLoveDetail14.
  ///
  /// In en, this message translates to:
  /// **'A subtle and lasting love suits this period better than burning passion. You\'ll build deep bonds by acknowledging and complementing each other\'s differences, and if there are conflicts, you need the wisdom to solve them through calm conversation. Your gentle and caring attitude will put your partner\'s mind at ease and create a stable relationship.'**
  String get tarotLoveDetail14;

  /// No description provided for @tarotWealthMeaning14.
  ///
  /// In en, this message translates to:
  /// **'It\'s important to balance income and spending.'**
  String get tarotWealthMeaning14;

  /// No description provided for @tarotWealthDetail14.
  ///
  /// In en, this message translates to:
  /// **'Your financial stability follows a stable flow. Focus on efficiently allocating and managing current assets rather than aiming for a windfall, and a habit of appropriately adjusting spending as income increases is needed. If you invest, it\'s good to diversify for risk management, and steady management will eventually bring wealth.'**
  String get tarotWealthDetail14;

  /// No description provided for @tarotSuccessMeaning14.
  ///
  /// In en, this message translates to:
  /// **'The ability to coordinate different opinions and lead harmony stands out.'**
  String get tarotSuccessMeaning14;

  /// No description provided for @tarotSuccessDetail14.
  ///
  /// In en, this message translates to:
  /// **'You\'ll excellently perform as a mediator in team projects, resolving conflicts and increasing work efficiency. Your flexible thinking and adaptability will be recognized, and the wisdom to prevent burnout by balancing work and rest will stand out. Proceeding step-by-step while observing the overall flow leads to the best results.'**
  String get tarotSuccessDetail14;

  /// No description provided for @tarotKeywords15.
  ///
  /// In en, this message translates to:
  /// **'Temptation, bondage, obsession, materialism, addiction'**
  String get tarotKeywords15;

  /// No description provided for @tarotDesc15.
  ///
  /// In en, this message translates to:
  /// **'It symbolizes desires and obsessions that bind oneself, and material temptations that one could escape if they chose, but fails to do so.'**
  String get tarotDesc15;

  /// No description provided for @tarotLoveMeaning15.
  ///
  /// In en, this message translates to:
  /// **'It means a relationship attracted to or obsessed with intense physical charm.'**
  String get tarotLoveMeaning15;

  /// No description provided for @tarotLoveDetail15.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when it\'s hard to make rational judgments because you\'re strongly fascinated by someone\'s charm. A hot romance that might keep you awake at night could start, but on the other hand, you need caution as you might suffer from excessive obsession and restraint. Coolly reflect on whether your feelings are true love or just simple desire or possessiveness.'**
  String get tarotLoveDetail15;

  /// No description provided for @tarotWealthMeaning15.
  ///
  /// In en, this message translates to:
  /// **'Material greed becomes excessive, so you may invest excessively.'**
  String get tarotWealthMeaning15;

  /// No description provided for @tarotWealthDetail15.
  ///
  /// In en, this message translates to:
  /// **'A time with many financial temptations. There\'s a risk of putting money into dangerous places deceived by sweet words, or squandering assets through impulsive luxury purchases. Be wary of becoming a slave to money and losing trust, and focus on protecting what you have rather than new investments.'**
  String get tarotWealthDetail15;

  /// No description provided for @tarotSuccessMeaning15.
  ///
  /// In en, this message translates to:
  /// **'You may try to use any means for success.'**
  String get tarotSuccessMeaning15;

  /// No description provided for @tarotSuccessDetail15.
  ///
  /// In en, this message translates to:
  /// **'Greed for power or honor increases. There is a concern about falling into work addiction, such as setting unreasonable schedules for performance or neglecting health. You need an attitude of working honestly by returning to your original intentions rather than trying to gain without legitimate effort.'**
  String get tarotSuccessDetail15;

  /// No description provided for @tarotKeywords16.
  ///
  /// In en, this message translates to:
  /// **'Collapse, shock, sudden change, liberation, revelation of truth'**
  String get tarotKeywords16;

  /// No description provided for @tarotDesc16.
  ///
  /// In en, this message translates to:
  /// **'Lightning strikes the tower, collapsing it and people are falling.'**
  String get tarotDesc16;

  /// No description provided for @tarotLoveMeaning16.
  ///
  /// In en, this message translates to:
  /// **'A big crisis or a sudden breakup may come to the relationship.'**
  String get tarotLoveMeaning16;

  /// No description provided for @tarotLoveDetail16.
  ///
  /// In en, this message translates to:
  /// **'An unexpected event like a bolt from the blue can occur on the love front. You might be disappointed in someone you trusted or face a conflict that shakes the relationship to its roots, but don\'t despair. This is a process of breaking unhealthy relationships or misunderstandings to face the truth, and an opportunity to build a firmer love will eventually come.'**
  String get tarotLoveDetail16;

  /// No description provided for @tarotWealthMeaning16.
  ///
  /// In en, this message translates to:
  /// **'You should prepare for sudden financial losses or disasters.'**
  String get tarotWealthMeaning16;

  /// No description provided for @tarotWealthDetail16.
  ///
  /// In en, this message translates to:
  /// **'It\'s a very unstable time financially. You may hear shocking news such as big money leaving or an investment collapsing, so move your assets to a safe place and prepare. However, this collapse will be an opportunity to correct wrong economic concepts, and after hitting rock bottom, a chance to build a solid foundation will come.'**
  String get tarotWealthDetail16;

  /// No description provided for @tarotSuccessMeaning16.
  ///
  /// In en, this message translates to:
  /// **'Projects may be interrupted or shocking changes at work may occur.'**
  String get tarotSuccessMeaning16;

  /// No description provided for @tarotSuccessDetail16.
  ///
  /// In en, this message translates to:
  /// **'You may feel frustration as if the tower you\'ve worked hard to build is collapsing, but this is due to an inevitable flow of change rather than a lack of ability. Don\'t panic; grasp the situation coolly, discard old systems, and seek new paths. If you take this crisis as an opportunity to reorganize, you can leap to a much higher place.'**
  String get tarotSuccessDetail16;

  /// No description provided for @tarotKeywords17.
  ///
  /// In en, this message translates to:
  /// **'Hope, inspiration, healing, optimism, wish fulfillment'**
  String get tarotKeywords17;

  /// No description provided for @tarotDesc17.
  ///
  /// In en, this message translates to:
  /// **'A woman is pouring water with two jars while keeping one foot on the ground, symbolizing peace after hardship and hope for the future.'**
  String get tarotDesc17;

  /// No description provided for @tarotLoveMeaning17.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when you meet someone close to your ideal type or your dream about love comes true.'**
  String get tarotLoveMeaning17;

  /// No description provided for @tarotLoveDetail17.
  ///
  /// In en, this message translates to:
  /// **'Like a star brightening the dark night, sparkling hope comes to your love life as well. You may meet your ideal type or make a beautiful promise for the future with your lover, and it\'s a time when your pure charm strongly appeals. Past painful memories will now be healed, and bright energy to dream of new love will arise.'**
  String get tarotLoveDetail17;

  /// No description provided for @tarotWealthMeaning17.
  ///
  /// In en, this message translates to:
  /// **'The financial situation gradually improves.'**
  String get tarotWealthMeaning17;

  /// No description provided for @tarotWealthDetail17.
  ///
  /// In en, this message translates to:
  /// **'Your financial outlook starts to flow in a positive direction. Previous economic difficulties are resolved and a ray of light is seen, and an opportunity to increase side income through creative ideas may arise. Rather than immediate big gains, an eye for investing in places with high future value from a long-term perspective will lead you to financial stability.'**
  String get tarotWealthDetail17;

  /// No description provided for @tarotSuccessMeaning17.
  ///
  /// In en, this message translates to:
  /// **'Creative inspiration springs up and you get an opportunity to spread your talent widely.'**
  String get tarotSuccessMeaning17;

  /// No description provided for @tarotSuccessDetail17.
  ///
  /// In en, this message translates to:
  /// **'Your ideas shine and receive praise from those around you. You can stand out in marketing, PR, or artistic fields, and it\'s a very good time to start a project you\'ve always dreamed of. If you express yourself confidently, luck is in for you to gain popularity or honor, so seize the opportunity.'**
  String get tarotSuccessDetail17;

  /// No description provided for @tarotKeywords18.
  ///
  /// In en, this message translates to:
  /// **'Anxiety, illusion, ambiguity, intuition, unconscious'**
  String get tarotKeywords18;

  /// No description provided for @tarotDesc18.
  ///
  /// In en, this message translates to:
  /// **'At night when the moon is up, a dog and a wolf howl and a crayfish crawls out of the water, symbolizing unseen truths and the subconscious.'**
  String get tarotDesc18;

  /// No description provided for @tarotLoveMeaning18.
  ///
  /// In en, this message translates to:
  /// **'It\'s frustrating because you don\'t know the other person\'s heart, and suspicion are easy to sprout.'**
  String get tarotLoveMeaning18;

  /// No description provided for @tarotLoveDetail18.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time when you\'re anxious because you don\'t know the other person\'s inner thoughts, as if in a fog. Trivial misunderstandings can grow into suspicion and cause sleepless nights, so it\'s better to watch the situation calmly rather than hastily interrogating. Instead of clinging to uncertain relationships swept by emotions, prioritize finding your center through rational thinking.'**
  String get tarotLoveDetail18;

  /// No description provided for @tarotWealthMeaning18.
  ///
  /// In en, this message translates to:
  /// **'Investment prospects are opaque and there is a risk of fraud.'**
  String get tarotWealthMeaning18;

  /// No description provided for @tarotWealthDetail18.
  ///
  /// In en, this message translates to:
  /// **'Your vision is blurred in terms of finance, so there is a high risk of being deceived by plausible investment information or sweet words. Since traps are hidden in unseen places, it\'s a time to be extremely careful, as if tapping a stone bridge before crossing. Rather than starting new things, protecting your assets through thorough realistic verification is the way.'**
  String get tarotWealthDetail18;

  /// No description provided for @tarotSuccessMeaning18.
  ///
  /// In en, this message translates to:
  /// **'It\'s a confusing time because the direction of work may be ambiguous.'**
  String get tarotSuccessMeaning18;

  /// No description provided for @tarotSuccessDetail18.
  ///
  /// In en, this message translates to:
  /// **'You may find yourself in a hopeless situation where you can\'t see ahead, and you should be careful with your words and actions as project direction may be shaken or you may be caught in workplace rumors. It\'s wise to wait until the situation becomes clear rather than moving hastily, and it\'s good to guard your position silently and focus on mental management.'**
  String get tarotSuccessDetail18;

  /// No description provided for @tarotKeywords19.
  ///
  /// In en, this message translates to:
  /// **'Success, Happiness, Vitality, Positivity, Blessing'**
  String get tarotKeywords19;

  /// No description provided for @tarotDesc19.
  ///
  /// In en, this message translates to:
  /// **'Under the bright sun, a child is joyfully riding a white horse and waving a flag.'**
  String get tarotDesc19;

  /// No description provided for @tarotLoveMeaning19.
  ///
  /// In en, this message translates to:
  /// **'You will have a bright and happy relationship that is blessed.'**
  String get tarotLoveMeaning19;

  /// No description provided for @tarotLoveDetail19.
  ///
  /// In en, this message translates to:
  /// **'A perfectly happy and blessed love is with you. Past misunderstandings and conflicts will melt away, deepening your trust. It\'s the best time for singles to meet someone with bright energy, and you can expect joyous news like marriage or expansion. It\'s a wonderful fortune to enjoy love purely and passionately like a child.'**
  String get tarotLoveDetail19;

  /// No description provided for @tarotWealthMeaning19.
  ///
  /// In en, this message translates to:
  /// **'Your financial fortune is at its best.'**
  String get tarotWealthMeaning19;

  /// No description provided for @tarotWealthDetail19.
  ///
  /// In en, this message translates to:
  /// **'Bright days have arrived for your finances. Your money luck is extremely strong, with everything you do turning into profit. Business will flourish, investments look promising, and sharing this positive energy will bring even greater abundance. You can expect good news that asset values like real estate or stocks will rise significantly.'**
  String get tarotWealthDetail19;

  /// No description provided for @tarotSuccessMeaning19.
  ///
  /// In en, this message translates to:
  /// **'Your abilities will be recognized and you will receive the spotlight.'**
  String get tarotSuccessMeaning19;

  /// No description provided for @tarotSuccessDetail19.
  ///
  /// In en, this message translates to:
  /// **'The fanfare of success is sounding. Your long-term efforts will finally shine and be recognized by the world. You\'ll achieve visible results like passing exams or getting promoted, and your confident attitude will establish you as a natural leader. Now is the stage where you are the protagonist, so display your skills to the fullest and win success.'**
  String get tarotSuccessDetail19;

  /// No description provided for @tarotKeywords20.
  ///
  /// In en, this message translates to:
  /// **'Resurrection, reward, news, decision, reunion'**
  String get tarotKeywords20;

  /// No description provided for @tarotDesc20.
  ///
  /// In en, this message translates to:
  /// **'When an angel blows a trumpet in the sky, people in coffins wake up and cheer, symbolizing rewards for the past and rebirth to a new stage.'**
  String get tarotDesc20;

  /// No description provided for @tarotLoveMeaning20.
  ///
  /// In en, this message translates to:
  /// **'You may receive contact from an ex-lover or have an opportunity to reunite.'**
  String get tarotLoveMeaning20;

  /// No description provided for @tarotLoveDetail20.
  ///
  /// In en, this message translates to:
  /// **'Waiting news arrives. If you\'ve been waiting for contact from an ex-lover you couldn\'t forget or wishing for a reunion, it\'s very likely to come true, and stagnant \'some\' relationships will bear fruit by clearly developing into lovers. A new connection with someone you knew in the past might also occur, so listen to your heart and make a decision without regret.'**
  String get tarotLoveDetail20;

  /// No description provided for @tarotWealthMeaning20.
  ///
  /// In en, this message translates to:
  /// **'You may get profits from previous investments, or get back money you lent.'**
  String get tarotWealthMeaning20;

  /// No description provided for @tarotWealthDetail20.
  ///
  /// In en, this message translates to:
  /// **'It\'s a time to receive rewards for past efforts. There\'s an unexpected windfall, such as forgotten stocks rising or receiving back money you didn\'t expect to get, and an opportunity to succeed by retrying ideas that failed before. Since the decision you make now will greatly influence your future wealth, careful yet bold determination is needed.'**
  String get tarotWealthDetail20;

  /// No description provided for @tarotSuccessMeaning20.
  ///
  /// In en, this message translates to:
  /// **'Your efforts will be recognized and you will be promoted or rewarded.'**
  String get tarotSuccessMeaning20;

  /// No description provided for @tarotSuccessDetail20.
  ///
  /// In en, this message translates to:
  /// **'Judgment day has come. A fair evaluation and rewards for the sweat you\'ve shed will be given, and happy news like promotion or passing will spread like a trumpet sound. A scout offer or career move opportunity to escape from a stagnant situation and fly again might come, so don\'t fear change and start a new chapter.'**
  String get tarotSuccessDetail20;

  /// No description provided for @tarotKeywords21.
  ///
  /// In en, this message translates to:
  /// **'Completion, integration, achievement, happy ending, perfection'**
  String get tarotKeywords21;

  /// No description provided for @tarotDesc21.
  ///
  /// In en, this message translates to:
  /// **'A woman is dancing inside a laurel wreath, and the four elements are in their completed forms, symbolizing the best happy ending.'**
  String get tarotDesc21;

  /// No description provided for @tarotLoveMeaning21.
  ///
  /// In en, this message translates to:
  /// **'You will bear the fruit of love and enter marriage, or form an ideal family.'**
  String get tarotLoveMeaning21;

  /// No description provided for @tarotLoveDetail21.
  ///
  /// In en, this message translates to:
  /// **'It\'s a perfect time to put a period to a long relationship and move toward a new world called marriage. You\'ll enjoy the happiness of becoming one under blessings after confirming you are each other\'s best halves, and if you\'re single, you can meet a fateful partner who meets your ideal type. It\'s also a fortune where connections are made during overseas travel or in exotic environments.'**
  String get tarotLoveDetail21;

  /// No description provided for @tarotWealthMeaning21.
  ///
  /// In en, this message translates to:
  /// **'You will achieve the target amount and enjoy economic freedom.'**
  String get tarotWealthMeaning21;

  /// No description provided for @tarotWealthDetail21.
  ///
  /// In en, this message translates to:
  /// **'You achieve the feat of 100% achieving your financial goals and have reached a stage where you can enjoy economic freedom. You can make big profits in global fields like overseas stocks or trade, and your investment portfolio will achieve perfect harmony to bring stable wealth. Now, enjoy the abundance and widen your perspective toward a broader world.'**
  String get tarotWealthDetail21;

  /// No description provided for @tarotSuccessMeaning21.
  ///
  /// In en, this message translates to:
  /// **'You will successfully complete the project and gain the highest honor.'**
  String get tarotSuccessMeaning21;

  /// No description provided for @tarotSuccessDetail21.
  ///
  /// In en, this message translates to:
  /// **'It\'s the time to hit the peak of your career. You will receive the highest praise by perfectly succeeding in the project you\'re in charge of, and you\'ll prepare to move toward a bigger world after achieving everything you aimed for. As it\'s a fortune where your activity stage can expand globally through studying abroad or overseas employment, use current success as a stepping stone to leap toward a grander dream.'**
  String get tarotSuccessDetail21;

  /// No description provided for @supplementRecordPrompt.
  ///
  /// In en, this message translates to:
  /// **'Please take your supplements and record it!'**
  String get supplementRecordPrompt;

  /// No description provided for @snoozeQuestion.
  ///
  /// In en, this message translates to:
  /// **'When should I remind you again?'**
  String get snoozeQuestion;

  /// No description provided for @hoursShort.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get hoursShort;

  /// No description provided for @minutesShort.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get minutesShort;

  /// No description provided for @after.
  ///
  /// In en, this message translates to:
  /// **'after'**
  String get after;

  /// No description provided for @snoozeMessage.
  ///
  /// In en, this message translates to:
  /// **'Alarm will ring again in {minutes} minutes.'**
  String snoozeMessage(int minutes);

  /// No description provided for @timesTaken.
  ///
  /// In en, this message translates to:
  /// **'{count} times taken'**
  String timesTaken(int count);

  /// No description provided for @dailyGoalTimes.
  ///
  /// In en, this message translates to:
  /// **'Goal: {goal} times a day'**
  String dailyGoalTimes(int goal);

  /// No description provided for @didYouTakeSupplement.
  ///
  /// In en, this message translates to:
  /// **'Did you take your supplements?'**
  String get didYouTakeSupplement;

  /// No description provided for @viewMissionRecords.
  ///
  /// In en, this message translates to:
  /// **'View Mission Records'**
  String get viewMissionRecords;

  /// No description provided for @setTakingGoal.
  ///
  /// In en, this message translates to:
  /// **'Set Intake Goal'**
  String get setTakingGoal;

  /// No description provided for @times.
  ///
  /// In en, this message translates to:
  /// **'times'**
  String get times;

  /// No description provided for @dailyTakingGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily Intake Goal'**
  String get dailyTakingGoal;

  /// No description provided for @howManyTimesADay.
  ///
  /// In en, this message translates to:
  /// **'How many times a day do you take supplements?'**
  String get howManyTimesADay;

  /// No description provided for @setGoalMl.
  ///
  /// In en, this message translates to:
  /// **'Set Goal (ml)'**
  String get setGoalMl;

  /// No description provided for @sleepAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Sleep Analysis'**
  String get sleepAnalysis;

  /// No description provided for @todaysSleep.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Sleep'**
  String get todaysSleep;

  /// No description provided for @sleepDuration.
  ///
  /// In en, this message translates to:
  /// **'Sleep Duration'**
  String get sleepDuration;

  /// No description provided for @wakeUpTime.
  ///
  /// In en, this message translates to:
  /// **'Wake Up Time'**
  String get wakeUpTime;

  /// No description provided for @weeklySleepPattern.
  ///
  /// In en, this message translates to:
  /// **'Weekly Sleep Pattern'**
  String get weeklySleepPattern;

  /// No description provided for @sleepAdvice.
  ///
  /// In en, this message translates to:
  /// **'You are maintaining a regular sleep habit. You went to bed 30 minutes earlier than yesterday!'**
  String get sleepAdvice;

  /// No description provided for @stopwatch.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch'**
  String get stopwatch;

  /// No description provided for @lap.
  ///
  /// In en, this message translates to:
  /// **'Lap'**
  String get lap;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @lapLabel.
  ///
  /// In en, this message translates to:
  /// **'Lap {index}'**
  String lapLabel(int index);

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

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

  /// No description provided for @defaultVibration.
  ///
  /// In en, this message translates to:
  /// **'Default Vibration'**
  String get defaultVibration;

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

  /// No description provided for @selectionComplete.
  ///
  /// In en, this message translates to:
  /// **'Selection Complete'**
  String get selectionComplete;

  /// No description provided for @selectVibration.
  ///
  /// In en, this message translates to:
  /// **'Select Vibration Pattern'**
  String get selectVibration;

  /// No description provided for @cameraMissionSequentialImageError.
  ///
  /// In en, this message translates to:
  /// **'Please set mission images in order.'**
  String get cameraMissionSequentialImageError;

  /// No description provided for @copyEmailAction.
  ///
  /// In en, this message translates to:
  /// **'Copy Email Address'**
  String get copyEmailAction;

  /// No description provided for @addMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Mission'**
  String get addMissionTitle;

  /// No description provided for @recommendedMissionList.
  ///
  /// In en, this message translates to:
  /// **'Recommended Missions'**
  String get recommendedMissionList;

  /// No description provided for @recommendedMissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Recommended missions for a healthy day.'**
  String get recommendedMissionDesc;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allMissions.
  ///
  /// In en, this message translates to:
  /// **'All Missions'**
  String get allMissions;

  /// No description provided for @categoryMissions.
  ///
  /// In en, this message translates to:
  /// **'{category} Missions'**
  String categoryMissions(String category);

  /// No description provided for @deselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get deselectAll;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// No description provided for @myCustomMissions.
  ///
  /// In en, this message translates to:
  /// **'My Custom Missions'**
  String get myCustomMissions;

  /// No description provided for @myCustomMissionsDesc.
  ///
  /// In en, this message translates to:
  /// **'Add missions you\'ve created before.'**
  String get myCustomMissionsDesc;

  /// No description provided for @createYourOwnMission.
  ///
  /// In en, this message translates to:
  /// **'Create Your Own Mission'**
  String get createYourOwnMission;

  /// No description provided for @createYourOwnMissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a mission if you don\'t find what you want.'**
  String get createYourOwnMissionDesc;

  /// No description provided for @missionNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter mission name (e.g. Go to gym)'**
  String get missionNameHint;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @getNotification.
  ///
  /// In en, this message translates to:
  /// **'Get Notification'**
  String get getNotification;

  /// No description provided for @missionCategoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get missionCategoryHealth;

  /// No description provided for @missionCategoryStudy.
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get missionCategoryStudy;

  /// No description provided for @missionCategoryRoutine.
  ///
  /// In en, this message translates to:
  /// **'Routine'**
  String get missionCategoryRoutine;

  /// No description provided for @missionCategoryHobby.
  ///
  /// In en, this message translates to:
  /// **'Hobby'**
  String get missionCategoryHobby;

  /// No description provided for @missionCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get missionCategoryOther;

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
  /// **'Weather data provided by trusted services'**
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

  /// No description provided for @hourlyForecast.
  ///
  /// In en, this message translates to:
  /// **'Hourly Forecast'**
  String get hourlyForecast;

  /// No description provided for @weeklyForecast.
  ///
  /// In en, this message translates to:
  /// **'Weekly Forecast'**
  String get weeklyForecast;

  /// No description provided for @hourFormat.
  ///
  /// In en, this message translates to:
  /// **'{hour}h'**
  String hourFormat(String hour);

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No new notifications.'**
  String get noNotifications;

  /// No description provided for @adLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Ad failed to load'**
  String get adLoadFailed;

  /// No description provided for @adLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading ad...'**
  String get adLoading;

  /// No description provided for @removeAds.
  ///
  /// In en, this message translates to:
  /// **'Remove Ads'**
  String get removeAds;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @exitQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit?'**
  String get exitQuestion;

  /// No description provided for @exitApp.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitApp;

  /// No description provided for @shareResultDescription.
  ///
  /// In en, this message translates to:
  /// **'This is your fortune result analyzed by Fortune Alarm.'**
  String get shareResultDescription;

  /// No description provided for @shareResultButton.
  ///
  /// In en, this message translates to:
  /// **'Share Result'**
  String get shareResultButton;

  /// No description provided for @unknownTime.
  ///
  /// In en, this message translates to:
  /// **'Unknown Time'**
  String get unknownTime;

  /// No description provided for @adLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the ad. Please try again in a moment.'**
  String get adLoadError;

  /// No description provided for @adShowError.
  ///
  /// In en, this message translates to:
  /// **'Could not display the ad. Please try again in a moment.'**
  String get adShowError;

  /// No description provided for @earnCookies.
  ///
  /// In en, this message translates to:
  /// **'You\'ve earned {count} fortune cookies! 🎉'**
  String earnCookies(int count);

  /// No description provided for @freePassAfterTimeout.
  ///
  /// In en, this message translates to:
  /// **'Showing results for free without an ad! 🎉'**
  String get freePassAfterTimeout;

  /// No description provided for @adLoadDelay.
  ///
  /// In en, this message translates to:
  /// **'Loading is delayed.\nPlease try again in a moment.'**
  String get adLoadDelay;

  /// No description provided for @fortuneAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Check Fortune'**
  String get fortuneAccessTitle;

  /// No description provided for @fortuneAccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check your fortune results\nand get hidden gifts!'**
  String get fortuneAccessSubtitle;

  /// No description provided for @watchAdButtonText.
  ///
  /// In en, this message translates to:
  /// **'Watch Ad for Free Results'**
  String get watchAdButtonText;

  /// No description provided for @useCookiesButtonText.
  ///
  /// In en, this message translates to:
  /// **'Use {count} Fortune Cookies'**
  String useCookiesButtonText(int count);

  /// No description provided for @adFailFreePass.
  ///
  /// In en, this message translates to:
  /// **'Could not load the ad, so we\'ll let you through for free this time.'**
  String get adFailFreePass;

  /// No description provided for @luckyNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'My Lucky Numbers'**
  String get luckyNumberTitle;

  /// No description provided for @luckyNumberSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI-powered lucky numbers for your day'**
  String get luckyNumberSubtitle;

  /// No description provided for @luckyNumberGenerateButton.
  ///
  /// In en, this message translates to:
  /// **'Generate Lucky Numbers'**
  String get luckyNumberGenerateButton;

  /// No description provided for @luckyNumberGuideText.
  ///
  /// In en, this message translates to:
  /// **'Discover your own lucky numbers\nthrough Fortune Alarm\'s AI algorithm'**
  String get luckyNumberGuideText;

  /// No description provided for @luckyNumberAnalysisStep1.
  ///
  /// In en, this message translates to:
  /// **'Gathering fortune data...'**
  String get luckyNumberAnalysisStep1;

  /// No description provided for @luckyNumberAnalysisStep2.
  ///
  /// In en, this message translates to:
  /// **'Reviewing recent number patterns...'**
  String get luckyNumberAnalysisStep2;

  /// No description provided for @luckyNumberAnalysisStep3.
  ///
  /// In en, this message translates to:
  /// **'Evaluating number probabilities...'**
  String get luckyNumberAnalysisStep3;

  /// No description provided for @luckyNumberAnalysisStep4.
  ///
  /// In en, this message translates to:
  /// **'Studying geometric sequences...'**
  String get luckyNumberAnalysisStep4;

  /// No description provided for @luckyNumberAnalysisStep5.
  ///
  /// In en, this message translates to:
  /// **'Applying AI prediction weights...'**
  String get luckyNumberAnalysisStep5;

  /// No description provided for @luckyNumberAnalysisStep6.
  ///
  /// In en, this message translates to:
  /// **'Calculating optimal combinations...'**
  String get luckyNumberAnalysisStep6;

  /// No description provided for @luckyNumberAnalysisStep7.
  ///
  /// In en, this message translates to:
  /// **'Analysis complete! Generating numbers...'**
  String get luckyNumberAnalysisStep7;

  /// No description provided for @luckyNumberAnalysisFinal.
  ///
  /// In en, this message translates to:
  /// **'Processing final data...'**
  String get luckyNumberAnalysisFinal;

  /// No description provided for @luckyNumberAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing energy...'**
  String get luckyNumberAnalyzing;

  /// No description provided for @luckyNumberGeometric.
  ///
  /// In en, this message translates to:
  /// **'Geometric analysis...'**
  String get luckyNumberGeometric;

  /// No description provided for @luckyNumberPatterns.
  ///
  /// In en, this message translates to:
  /// **'Pattern matching...'**
  String get luckyNumberPatterns;

  /// No description provided for @luckyNumberEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy harmonization...'**
  String get luckyNumberEnergy;

  /// No description provided for @luckyNumberCompleted.
  ///
  /// In en, this message translates to:
  /// **'Analysis completed!'**
  String get luckyNumberCompleted;

  /// No description provided for @luckyNumberShare.
  ///
  /// In en, this message translates to:
  /// **'Share Results'**
  String get luckyNumberShare;

  /// No description provided for @luckyNumberRestart.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get luckyNumberRestart;

  /// No description provided for @luckyNumberGenerating.
  ///
  /// In en, this message translates to:
  /// **'Generating lucky numbers...'**
  String get luckyNumberGenerating;

  /// No description provided for @luckyNumberResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Lucky number generation complete'**
  String get luckyNumberResultTitle;

  /// No description provided for @luckyNumberResultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'6 numbers + bonus number'**
  String get luckyNumberResultSubtitle;

  /// No description provided for @luckyNumberDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'* This service is for entertainment purposes. Numbers provided are for reference generated by AI algorithms and do not guarantee a win.'**
  String get luckyNumberDisclaimer;

  /// No description provided for @luckyNumberShareTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Lucky Numbers'**
  String get luckyNumberShareTitle;

  /// No description provided for @luckyNumberShareDescription.
  ///
  /// In en, this message translates to:
  /// **'Lucky numbers analyzed by Fortune Alarm.'**
  String get luckyNumberShareDescription;

  /// No description provided for @luckyNumberSetLabel.
  ///
  /// In en, this message translates to:
  /// **'Set {label}'**
  String luckyNumberSetLabel(String label);

  /// No description provided for @luckyNumberRegenerateButton.
  ///
  /// In en, this message translates to:
  /// **'Regenerate numbers'**
  String get luckyNumberRegenerateButton;

  /// No description provided for @luckyNumberFeatureAiTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Recommendation'**
  String get luckyNumberFeatureAiTitle;

  /// No description provided for @luckyNumberFeatureAiDesc.
  ///
  /// In en, this message translates to:
  /// **'Smart AI Algorithm'**
  String get luckyNumberFeatureAiDesc;

  /// No description provided for @luckyNumberFeatureSmartTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart'**
  String get luckyNumberFeatureSmartTitle;

  /// No description provided for @luckyNumberFeatureSmartDesc.
  ///
  /// In en, this message translates to:
  /// **'Personalized Recommendations'**
  String get luckyNumberFeatureSmartDesc;

  /// No description provided for @luckyNumberFeatureDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Analysis'**
  String get luckyNumberFeatureDataTitle;

  /// No description provided for @luckyNumberFeatureDataDesc.
  ///
  /// In en, this message translates to:
  /// **'Probability Analysis'**
  String get luckyNumberFeatureDataDesc;

  /// No description provided for @fortunePassTitle.
  ///
  /// In en, this message translates to:
  /// **'Fortune Pass Premium'**
  String get fortunePassTitle;

  /// No description provided for @fortunePassTabFree.
  ///
  /// In en, this message translates to:
  /// **'Free Charge'**
  String get fortunePassTabFree;

  /// No description provided for @fortunePassTabPremium.
  ///
  /// In en, this message translates to:
  /// **'Fortune Pass'**
  String get fortunePassTabPremium;

  /// No description provided for @fortunePassFreeChargeTitle.
  ///
  /// In en, this message translates to:
  /// **'Watch an ad to charge fortune cookies for free!'**
  String get fortunePassFreeChargeTitle;

  /// No description provided for @fortunePassFreeChargeButton.
  ///
  /// In en, this message translates to:
  /// **'Watch Ad & Charge (+1)'**
  String get fortunePassFreeChargeButton;

  /// No description provided for @fortunePassActivePlan.
  ///
  /// In en, this message translates to:
  /// **'Current Subscription Plan'**
  String get fortunePassActivePlan;

  /// No description provided for @fortunePassNoSubscription.
  ///
  /// In en, this message translates to:
  /// **'No Subscription Found'**
  String get fortunePassNoSubscription;

  /// No description provided for @fortunePassRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get fortunePassRestore;

  /// No description provided for @fortunePassMonth1Title.
  ///
  /// In en, this message translates to:
  /// **'1 Month Subscription'**
  String get fortunePassMonth1Title;

  /// No description provided for @fortunePassMonth1Desc.
  ///
  /// In en, this message translates to:
  /// **'Monthly Plan'**
  String get fortunePassMonth1Desc;

  /// No description provided for @fortunePassMonth6Title.
  ///
  /// In en, this message translates to:
  /// **'6 Month Subscription'**
  String get fortunePassMonth6Title;

  /// No description provided for @fortunePassMonth6Desc.
  ///
  /// In en, this message translates to:
  /// **'180 Days Plan'**
  String get fortunePassMonth6Desc;

  /// No description provided for @fortunePassYear1Title.
  ///
  /// In en, this message translates to:
  /// **'12 Month Subscription'**
  String get fortunePassYear1Title;

  /// No description provided for @fortunePassYear1Desc.
  ///
  /// In en, this message translates to:
  /// **'1 Year Plan'**
  String get fortunePassYear1Desc;

  /// No description provided for @fortunePassBestPlan.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get fortunePassBestPlan;

  /// No description provided for @fortunePassTimeSaleLabel.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Time Sale!'**
  String fortunePassTimeSaleLabel(int percent);

  /// No description provided for @fortunePassOffLabel.
  ///
  /// In en, this message translates to:
  /// **'{percent}% OFF'**
  String fortunePassOffLabel(int percent);

  /// No description provided for @fortunePassPerMonth.
  ///
  /// In en, this message translates to:
  /// **' /mo'**
  String get fortunePassPerMonth;

  /// No description provided for @fortunePassTotalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total {price} / {unit}'**
  String fortunePassTotalPrice(String price, String unit);

  /// No description provided for @fortunePassUnitMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get fortunePassUnitMonth;

  /// No description provided for @fortunePassUnit6Months.
  ///
  /// In en, this message translates to:
  /// **'6 Months'**
  String get fortunePassUnit6Months;

  /// No description provided for @fortunePassUnitYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get fortunePassUnitYear;

  /// No description provided for @fortunePassMyCookies.
  ///
  /// In en, this message translates to:
  /// **'My Fortune Cookies'**
  String get fortunePassMyCookies;

  /// No description provided for @fortunePassCurrentStatus.
  ///
  /// In en, this message translates to:
  /// **'Pass Status'**
  String get fortunePassCurrentStatus;

  /// No description provided for @fortunePassStatusPremium.
  ///
  /// In en, this message translates to:
  /// **'Premium Pass Active'**
  String get fortunePassStatusPremium;

  /// No description provided for @fortunePassStatusFree.
  ///
  /// In en, this message translates to:
  /// **'Free User'**
  String get fortunePassStatusFree;

  /// No description provided for @fortunePassStoreErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get fortunePassStoreErrorTitle;

  /// No description provided for @fortunePassStoreErrorContent.
  ///
  /// In en, this message translates to:
  /// **'Cannot retrieve product information from the store.\n\n[Checklist]\n1. Google Play / App Store Login\n2. Internet Connection\n3. Test Device Registration'**
  String get fortunePassStoreErrorContent;

  /// No description provided for @fortunePassSubscribeSale.
  ///
  /// In en, this message translates to:
  /// **'Subscribe with {percent}% OFF'**
  String fortunePassSubscribeSale(int percent);

  /// No description provided for @fortunePassSubscribeNow.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get fortunePassSubscribeNow;

  /// No description provided for @fortunePassApplied.
  ///
  /// In en, this message translates to:
  /// **'Fortune Pass subscription applied.'**
  String get fortunePassApplied;

  /// No description provided for @fortunePassApplyFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to apply subscription. Check your network.'**
  String get fortunePassApplyFailed;

  /// No description provided for @fortunePassRestored.
  ///
  /// In en, this message translates to:
  /// **'Purchases restored.'**
  String get fortunePassRestored;

  /// No description provided for @fortunePassRestoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to restore purchases.'**
  String get fortunePassRestoreFailed;

  /// No description provided for @fortunePassTimeSaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Wait! A gift has arrived 🎁'**
  String get fortunePassTimeSaleTitle;

  /// No description provided for @fortunePassTimeSalePriceOriginal.
  ///
  /// In en, this message translates to:
  /// **'Original price ₩{price}/year'**
  String fortunePassTimeSalePriceOriginal(String price);

  /// No description provided for @fortunePassTimeSalePriceDiscount.
  ///
  /// In en, this message translates to:
  /// **'₩{price}/year'**
  String fortunePassTimeSalePriceDiscount(String price);

  /// No description provided for @fortunePassTimeSaleBadge.
  ///
  /// In en, this message translates to:
  /// **'50% off if you subscribe within 3 minutes!'**
  String get fortunePassTimeSaleBadge;

  /// No description provided for @fortunePassTimeSaleButton.
  ///
  /// In en, this message translates to:
  /// **'Get Discount and Start Pro'**
  String get fortunePassTimeSaleButton;

  /// No description provided for @fortunePassTimeSaleCancel.
  ///
  /// In en, this message translates to:
  /// **'Maybe next time'**
  String get fortunePassTimeSaleCancel;

  /// No description provided for @fortunePassTimeSaleStartMessage.
  ///
  /// In en, this message translates to:
  /// **'3-minute discount has started! Check the top banner.'**
  String get fortunePassTimeSaleStartMessage;

  /// No description provided for @fortunePassSubscribeButton.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get fortunePassSubscribeButton;

  /// No description provided for @fortunePassSubscribeDiscountButton.
  ///
  /// In en, this message translates to:
  /// **'Subscribe with 50% Off'**
  String get fortunePassSubscribeDiscountButton;

  /// No description provided for @fortunePassCookieBalance.
  ///
  /// In en, this message translates to:
  /// **'Your Fortune Cookies'**
  String get fortunePassCookieBalance;

  /// No description provided for @fortunePassCookieCount.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String fortunePassCookieCount(int count);

  /// No description provided for @fortunePassActive.
  ///
  /// In en, this message translates to:
  /// **'Pass Active'**
  String get fortunePassActive;

  /// No description provided for @fortunePassTotalFormat.
  ///
  /// In en, this message translates to:
  /// **'Total ₩{price} / {unit}'**
  String fortunePassTotalFormat(String price, String unit);

  /// No description provided for @fortunePassPopularPlan.
  ///
  /// In en, this message translates to:
  /// **'Popular Plan'**
  String get fortunePassPopularPlan;

  /// No description provided for @fortunePassPricePerMonth.
  ///
  /// In en, this message translates to:
  /// **' /mo'**
  String get fortunePassPricePerMonth;

  /// No description provided for @fortunePassPaymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment request failed.'**
  String get fortunePassPaymentFailed;

  /// No description provided for @fortunePassSubscriptionFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to apply subscription. Please check your network.'**
  String get fortunePassSubscriptionFailed;

  /// No description provided for @fortunePassSubscriptionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Fortune Pass subscription has been applied.'**
  String get fortunePassSubscriptionSuccess;

  /// No description provided for @fortunePassCannotSubscribeTitle.
  ///
  /// In en, this message translates to:
  /// **'Cannot Subscribe'**
  String get fortunePassCannotSubscribeTitle;

  /// No description provided for @fortunePassCannotSubscribeMessage.
  ///
  /// In en, this message translates to:
  /// **'Unable to retrieve product information from the store at this time.\n\n[Check List]\n1. Google Play / App Store login status\n2. Internet connection\n3. Test device registration status'**
  String get fortunePassCannotSubscribeMessage;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Y'**
  String get year;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get month;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'D'**
  String get day;

  /// No description provided for @sajuProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Main Four Pillars of Destiny Profile'**
  String get sajuProfileTitle;

  /// No description provided for @sajuNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sajuNameLabel;

  /// No description provided for @sajuNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get sajuNameHint;

  /// No description provided for @sajuNameHelper.
  ///
  /// In en, this message translates to:
  /// **'Up to 6 characters'**
  String get sajuNameHelper;

  /// No description provided for @sajuGenderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get sajuGenderLabel;

  /// No description provided for @sajuGenderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get sajuGenderMale;

  /// No description provided for @sajuGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get sajuGenderFemale;

  /// No description provided for @sajuBirthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get sajuBirthDateLabel;

  /// No description provided for @sajuBirthTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Time'**
  String get sajuBirthTimeLabel;

  /// No description provided for @sajuUnknownTime.
  ///
  /// In en, this message translates to:
  /// **'Unknown Time'**
  String get sajuUnknownTime;

  /// No description provided for @sajuEditComplete.
  ///
  /// In en, this message translates to:
  /// **'Edit Complete'**
  String get sajuEditComplete;

  /// No description provided for @sajuSolar.
  ///
  /// In en, this message translates to:
  /// **'Solar'**
  String get sajuSolar;

  /// No description provided for @sajuLunar.
  ///
  /// In en, this message translates to:
  /// **'Lunar'**
  String get sajuLunar;

  /// No description provided for @sajuSelectBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Select Birth Date'**
  String get sajuSelectBirthDate;

  /// No description provided for @sajuSelectBirthTime.
  ///
  /// In en, this message translates to:
  /// **'Select Birth Time'**
  String get sajuSelectBirthTime;

  /// No description provided for @compatibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Check Compatibility'**
  String get compatibilityTitle;

  /// No description provided for @compatibilityInputHeader.
  ///
  /// In en, this message translates to:
  /// **'Please enter information for both'**
  String get compatibilityInputHeader;

  /// No description provided for @compatibilityInputSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We will analyze the exact compatibility based on Four Pillars of Destiny information.'**
  String get compatibilityInputSubtitle;

  /// No description provided for @compatibilityMyInfo.
  ///
  /// In en, this message translates to:
  /// **'My Information'**
  String get compatibilityMyInfo;

  /// No description provided for @compatibilityInputMyNameGuide.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name.'**
  String get compatibilityInputMyNameGuide;

  /// No description provided for @compatibilityInputPartnerNameGuide.
  ///
  /// In en, this message translates to:
  /// **'Please enter partner\'s name.'**
  String get compatibilityInputPartnerNameGuide;

  /// No description provided for @compatibilityPartnerInfo.
  ///
  /// In en, this message translates to:
  /// **'Partner\'s Information'**
  String get compatibilityPartnerInfo;

  /// No description provided for @compatibilityLoadSaved.
  ///
  /// In en, this message translates to:
  /// **'Load Saved Info'**
  String get compatibilityLoadSaved;

  /// No description provided for @compatibilityTitleBest.
  ///
  /// In en, this message translates to:
  /// **'A match made in heaven! ❤️'**
  String get compatibilityTitleBest;

  /// No description provided for @compatibilityDescBest.
  ///
  /// In en, this message translates to:
  /// **'The best compatibility you could ask for. Don\'t let each other go!'**
  String get compatibilityDescBest;

  /// No description provided for @compatibilityTitleGreat.
  ///
  /// In en, this message translates to:
  /// **'A very good relationship 💕'**
  String get compatibilityTitleGreat;

  /// No description provided for @compatibilityDescGreat.
  ///
  /// In en, this message translates to:
  /// **'A great partner who is a huge support to each other.'**
  String get compatibilityDescGreat;

  /// No description provided for @compatibilityTitleGood.
  ///
  /// In en, this message translates to:
  /// **'A well-matched couple 😊'**
  String get compatibilityTitleGood;

  /// No description provided for @compatibilityDescGood.
  ///
  /// In en, this message translates to:
  /// **'There are some differences, but you can have a beautiful love while adjusting to each other.'**
  String get compatibilityDescGood;

  /// No description provided for @compatibilityTitleEffort.
  ///
  /// In en, this message translates to:
  /// **'Effort is needed 🧐'**
  String get compatibilityTitleEffort;

  /// No description provided for @compatibilityDescEffort.
  ///
  /// In en, this message translates to:
  /// **'There are many differences. Understanding and consideration are key to the relationship.'**
  String get compatibilityDescEffort;

  /// No description provided for @compatibilityTitleDifficult.
  ///
  /// In en, this message translates to:
  /// **'Need to adjust a lot 😅'**
  String get compatibilityTitleDifficult;

  /// No description provided for @compatibilityDescDifficult.
  ///
  /// In en, this message translates to:
  /// **'Personality differences can be large. You need to deeply understand each other\'s differences.'**
  String get compatibilityDescDifficult;

  /// No description provided for @compatibilityResultButton.
  ///
  /// In en, this message translates to:
  /// **'View Compatibility Result'**
  String get compatibilityResultButton;

  /// No description provided for @compatibilityDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get compatibilityDeleteTooltip;

  /// No description provided for @compatibilityGenderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get compatibilityGenderMale;

  /// No description provided for @compatibilityGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get compatibilityGenderFemale;

  /// No description provided for @compatibilityInputTitle.
  ///
  /// In en, this message translates to:
  /// **'Compatibility Information Input'**
  String get compatibilityInputTitle;

  /// No description provided for @tojeongInputTitle.
  ///
  /// In en, this message translates to:
  /// **'Tojeong Yearly Oracle Information Input'**
  String get tojeongInputTitle;

  /// No description provided for @tojeongCheckFortune.
  ///
  /// In en, this message translates to:
  /// **'Check your {year}\nTojeong Yearly Oracle'**
  String tojeongCheckFortune(int year);

  /// No description provided for @tojeongInputGuide.
  ///
  /// In en, this message translates to:
  /// **'Please enter your birth date and time\nfor an accurate analysis.'**
  String get tojeongInputGuide;

  /// No description provided for @tojeongViewResult.
  ///
  /// In en, this message translates to:
  /// **'View {year} Tojeong Yearly Oracle'**
  String tojeongViewResult(int year);

  /// No description provided for @tojeongCheckButton.
  ///
  /// In en, this message translates to:
  /// **'Check Tojeong Yearly Oracle'**
  String get tojeongCheckButton;

  /// No description provided for @tojeongSaveAndCheck.
  ///
  /// In en, this message translates to:
  /// **'Save and View Tojeong Yearly Oracle'**
  String get tojeongSaveAndCheck;

  /// No description provided for @tojeongYearSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Fortune Year'**
  String get tojeongYearSelect;

  /// No description provided for @tojeongResultTitle.
  ///
  /// In en, this message translates to:
  /// **'{year} Tojeong Yearly Oracle'**
  String tojeongResultTitle(int year);

  /// No description provided for @tojeongUserFortune.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s {year} Fortune'**
  String tojeongUserFortune(String name, int year);

  /// No description provided for @tojeongGua.
  ///
  /// In en, this message translates to:
  /// **'Gua: {gua}'**
  String tojeongGua(String gua);

  /// No description provided for @tojeongTotalLuck.
  ///
  /// In en, this message translates to:
  /// **'Total Luck'**
  String get tojeongTotalLuck;

  /// No description provided for @tojeongProcess.
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get tojeongProcess;

  /// No description provided for @tojeongResult.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get tojeongResult;

  /// No description provided for @tojeongMonthlyLuck.
  ///
  /// In en, this message translates to:
  /// **'Monthly Fortune'**
  String get tojeongMonthlyLuck;

  /// No description provided for @tojeongShareResult.
  ///
  /// In en, this message translates to:
  /// **'Share Results'**
  String get tojeongShareResult;

  /// No description provided for @tojeongShareTitle.
  ///
  /// In en, this message translates to:
  /// **'{year} Tojeong Yearly Oracle Results'**
  String tojeongShareTitle(int year);

  /// No description provided for @tojeongShareDesc.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s Tojeong Yearly Oracle overall review.\n\n{desc}...'**
  String tojeongShareDesc(String name, String desc);

  /// No description provided for @tojeongShareTargetYear.
  ///
  /// In en, this message translates to:
  /// **'Target Year'**
  String get tojeongShareTargetYear;

  /// No description provided for @sajuDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Four Pillars of Destiny Info'**
  String get sajuDeleteTitle;

  /// No description provided for @sajuDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}\'s info?'**
  String sajuDeleteConfirm(String name);

  /// No description provided for @sajuProfileSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Four Pillars of Destiny Info'**
  String get sajuProfileSelect;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @modify.
  ///
  /// In en, this message translates to:
  /// **'Modify'**
  String get modify;

  /// No description provided for @fortuneUnderConstructionTitle.
  ///
  /// In en, this message translates to:
  /// **'{title}\nService is under preparation.'**
  String fortuneUnderConstructionTitle(String title);

  /// No description provided for @fortuneUnderConstructionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We are working hard to provide you with\nmore accurate and useful fortune information!'**
  String get fortuneUnderConstructionSubtitle;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameInputGuide.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameInputGuide;

  /// No description provided for @sajuLunarSolar.
  ///
  /// In en, this message translates to:
  /// **'Solar/Lunar'**
  String get sajuLunarSolar;

  /// No description provided for @sajuBirthDateDisplay.
  ///
  /// In en, this message translates to:
  /// **'{year}.{month}.{day}'**
  String sajuBirthDateDisplay(int year, int month, int day);

  /// No description provided for @sajuSelectFortuneYear.
  ///
  /// In en, this message translates to:
  /// **'Select Fortune Year'**
  String get sajuSelectFortuneYear;

  /// No description provided for @sajuYearDisplay.
  ///
  /// In en, this message translates to:
  /// **'{year}'**
  String sajuYearDisplay(int year);

  /// No description provided for @sajuSelectProfile.
  ///
  /// In en, this message translates to:
  /// **'Select Profile'**
  String get sajuSelectProfile;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @newYearFortuneInputTitle.
  ///
  /// In en, this message translates to:
  /// **'New Year Fortune Info'**
  String get newYearFortuneInputTitle;

  /// No description provided for @newYearFortuneHeader.
  ///
  /// In en, this message translates to:
  /// **'How will your {year}\nfortune be?'**
  String newYearFortuneHeader(int year);

  /// No description provided for @newYearFortuneSubHeader.
  ///
  /// In en, this message translates to:
  /// **'Please enter your birth date and time\nfor accurate Four Pillars of Destiny analysis.'**
  String get newYearFortuneSubHeader;

  /// No description provided for @newYearFortuneViewButton.
  ///
  /// In en, this message translates to:
  /// **'View {year} Fortune'**
  String newYearFortuneViewButton(int year);

  /// No description provided for @newYearFortuneCheckButton.
  ///
  /// In en, this message translates to:
  /// **'Check Fortune'**
  String get newYearFortuneCheckButton;

  /// No description provided for @newYearFortuneSaveAndCheckButton.
  ///
  /// In en, this message translates to:
  /// **'Save and View Fortune'**
  String get newYearFortuneSaveAndCheckButton;

  /// No description provided for @newYearFortuneResultTitle.
  ///
  /// In en, this message translates to:
  /// **'My {year} New Year Fortune'**
  String newYearFortuneResultTitle(int year);

  /// No description provided for @newYearFortuneShareTitle.
  ///
  /// In en, this message translates to:
  /// **'My {year} New Year Fortune Result'**
  String newYearFortuneShareTitle(int year);

  /// No description provided for @newYearFortuneShareDesc.
  ///
  /// In en, this message translates to:
  /// **'New Year fortune for {name}.\n\n{desc}...'**
  String newYearFortuneShareDesc(String name, String desc);

  /// No description provided for @sajuChartTitle.
  ///
  /// In en, this message translates to:
  /// **'Four Pillars of Destiny Chart'**
  String get sajuChartTitle;

  /// No description provided for @sajuHour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get sajuHour;

  /// No description provided for @sajuDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get sajuDay;

  /// No description provided for @sajuMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get sajuMonth;

  /// No description provided for @sajuYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get sajuYear;

  /// No description provided for @ohaengAnalysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Five Elements Analysis'**
  String get ohaengAnalysisTitle;

  /// No description provided for @dominantOhaeng.
  ///
  /// In en, this message translates to:
  /// **'Your Dominant Element: {name}({symbol})'**
  String dominantOhaeng(String name, String symbol);

  /// No description provided for @ohaengDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'※ Five Elements (Wood, Fire, Earth, Metal, Water) are the basic energies of Four Pillars of Destiny. While balance is ideal, you can understand your tendencies through these elements.'**
  String get ohaengDisclaimer;

  /// No description provided for @yearlyTotalLuck.
  ///
  /// In en, this message translates to:
  /// **'{year} Total Luck'**
  String yearlyTotalLuck(int year);

  /// No description provided for @fortuneDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This fortune is for entertainment purposes. Your life depends on your own will.'**
  String get fortuneDisclaimer;

  /// No description provided for @compatibilityResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Compatibility Result'**
  String get compatibilityResultTitle;

  /// No description provided for @compatibilityScore.
  ///
  /// In en, this message translates to:
  /// **'Compatibility Score'**
  String get compatibilityScore;

  /// No description provided for @compatibilityScoreDisplay.
  ///
  /// In en, this message translates to:
  /// **'{score}'**
  String compatibilityScoreDisplay(int score);

  /// No description provided for @compatibilityShareTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Compatibility'**
  String get compatibilityShareTitle;

  /// No description provided for @compatibilityShareResult.
  ///
  /// In en, this message translates to:
  /// **'Share Result'**
  String get compatibilityShareResult;

  /// No description provided for @compatibilityRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Check with Someone Else'**
  String get compatibilityRetryButton;

  /// No description provided for @compatibilitySummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get compatibilitySummary;

  /// No description provided for @tojeongSaveAndCheckButton.
  ///
  /// In en, this message translates to:
  /// **'Save and View Tojeong Yearly Oracle'**
  String get tojeongSaveAndCheckButton;

  /// No description provided for @tojeongSangsuKeyword1.
  ///
  /// In en, this message translates to:
  /// **'a period requiring strong drive and leadership'**
  String get tojeongSangsuKeyword1;

  /// No description provided for @tojeongSangsuKeyword2.
  ///
  /// In en, this message translates to:
  /// **'a period full of active relationships and joy'**
  String get tojeongSangsuKeyword2;

  /// No description provided for @tojeongSangsuKeyword3.
  ///
  /// In en, this message translates to:
  /// **'a period where intelligence and passion shine'**
  String get tojeongSangsuKeyword3;

  /// No description provided for @tojeongSangsuKeyword4.
  ///
  /// In en, this message translates to:
  /// **'a period of rapid changes and new beginnings'**
  String get tojeongSangsuKeyword4;

  /// No description provided for @tojeongSangsuKeyword5.
  ///
  /// In en, this message translates to:
  /// **'a period requiring a flexible attitude and soft communication'**
  String get tojeongSangsuKeyword5;

  /// No description provided for @tojeongSangsuKeyword6.
  ///
  /// In en, this message translates to:
  /// **'a period to overcome difficulties with wisdom and patience'**
  String get tojeongSangsuKeyword6;

  /// No description provided for @tojeongSangsuKeyword7.
  ///
  /// In en, this message translates to:
  /// **'a period to seek stability and build inner strength'**
  String get tojeongSangsuKeyword7;

  /// No description provided for @tojeongSangsuKeyword8.
  ///
  /// In en, this message translates to:
  /// **'a period to build virtue with inclusivity and a warm heart'**
  String get tojeongSangsuKeyword8;

  /// No description provided for @tojeongJungsuKeyword1.
  ///
  /// In en, this message translates to:
  /// **'you will encounter a helpful mentor'**
  String get tojeongJungsuKeyword1;

  /// No description provided for @tojeongJungsuKeyword2.
  ///
  /// In en, this message translates to:
  /// **'you will find success in contracts and agreements'**
  String get tojeongJungsuKeyword2;

  /// No description provided for @tojeongJungsuKeyword3.
  ///
  /// In en, this message translates to:
  /// **'you will face new and exciting challenges'**
  String get tojeongJungsuKeyword3;

  /// No description provided for @tojeongJungsuKeyword4.
  ///
  /// In en, this message translates to:
  /// **'professional success and honor await you'**
  String get tojeongJungsuKeyword4;

  /// No description provided for @tojeongJungsuKeyword5.
  ///
  /// In en, this message translates to:
  /// **'you should practice careful financial management'**
  String get tojeongJungsuKeyword5;

  /// No description provided for @tojeongJungsuKeyword6.
  ///
  /// In en, this message translates to:
  /// **'you should prioritize your health and well-being'**
  String get tojeongJungsuKeyword6;

  /// No description provided for @tojeongHasuKeyword1.
  ///
  /// In en, this message translates to:
  /// **'you will achieve significant success.'**
  String get tojeongHasuKeyword1;

  /// No description provided for @tojeongHasuKeyword2.
  ///
  /// In en, this message translates to:
  /// **'you will reap the rewards of your steady efforts.'**
  String get tojeongHasuKeyword2;

  /// No description provided for @tojeongHasuKeyword3.
  ///
  /// In en, this message translates to:
  /// **'you will turn challenges into opportunities through patience.'**
  String get tojeongHasuKeyword3;

  /// No description provided for @tojeongCoreMessage.
  ///
  /// In en, this message translates to:
  /// **'This year\'s journey: {sangsu}, followed by {jungsu}, leading to {hasu}.'**
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu);

  /// No description provided for @tojeongSangsuDetail1.
  ///
  /// In en, this message translates to:
  /// **'You are supported by both heaven and earth. This is a year where your strong determination will lead to great achievements. Like a dragon ascending to the sky, your energy is vibrant and powerful. You\'ll have many chances to lead and gain recognition. Just remember to stay humble and inclusive to avoid unnecessary friction.'**
  String get tojeongSangsuDetail1;

  /// No description provided for @tojeongSangsuDetail2.
  ///
  /// In en, this message translates to:
  /// **'Like a stone creating ripples in a calm lake, this year will be full of social activity and joy. Your popularity will rise, but be mindful of your words to avoid gossip. You may meet a significant partner at a social gathering or event.'**
  String get tojeongSangsuDetail2;

  /// No description provided for @tojeongSangsuDetail3.
  ///
  /// In en, this message translates to:
  /// **'Like the sun shining upon the world, your intellect and passion will be at their peak. You\'ll excel in academic or creative pursuits, earning a great reputation. Stay calm and focused to manage your energy effectively and avoid burnout.'**
  String get tojeongSangsuDetail3;

  /// No description provided for @tojeongSangsuDetail4.
  ///
  /// In en, this message translates to:
  /// **'Expect rapid and exciting changes this year. Your enterprising energy makes it the perfect time to start new ventures. While you\'ll be busy with transitions, your persistence will be key to finishing what you start and achieving lasting results.'**
  String get tojeongSangsuDetail4;

  /// No description provided for @tojeongSangsuDetail5.
  ///
  /// In en, this message translates to:
  /// **'Like a gentle spring breeze reviving the land, your flexible attitude will help you overcome any obstacles. This is a great year for business and building new connections. Stay decisive to ensure you capture the best opportunities as they arise.'**
  String get tojeongSangsuDetail5;

  /// No description provided for @tojeongSangsuDetail6.
  ///
  /// In en, this message translates to:
  /// **'This year requires wisdom and patience, like navigating deep waters. While things may seem quiet, use this time to build your inner strength. Avoid risky investments and wait for the right moment to act; your patience will eventually be rewarded.'**
  String get tojeongSangsuDetail6;

  /// No description provided for @tojeongSangsuDetail7.
  ///
  /// In en, this message translates to:
  /// **'You may face challenges that feel like crossing a great mountain, but a vast plain of opportunity awaits on the other side. Focus on inner stability and maintaining your current progress. Building trust and staying consistent will lead to great fruit in the long run.'**
  String get tojeongSangsuDetail7;

  /// No description provided for @tojeongSangsuDetail8.
  ///
  /// In en, this message translates to:
  /// **'This is a time for sowing the seeds of your future success. By embracing others with a warm and patient heart, you will build a strong foundation of trust and respect. Your long-term investments and focus on family will bring lasting peace and prosperity.'**
  String get tojeongSangsuDetail8;

  /// No description provided for @tojeongJungsuDetail1.
  ///
  /// In en, this message translates to:
  /// **'A helpful mentor will appear, bringing positive news and opportunities. Any previous obstacles will resolve, and your financial outlook will improve. Collaboration will be your key to success this year.'**
  String get tojeongJungsuDetail1;

  /// No description provided for @tojeongJungsuDetail2.
  ///
  /// In en, this message translates to:
  /// **'You may experience joyful events within your family or home. This is a favorable time for legal documents, contracts, or sales. Maintain clear and kind communication to ensure all interactions remain positive.'**
  String get tojeongJungsuDetail2;

  /// No description provided for @tojeongJungsuDetail3.
  ///
  /// In en, this message translates to:
  /// **'New horizons await you, potentially through travel or work in new locations. Embrace these changes with confidence; your willingness to explore new opportunities will lead to rewarding results.'**
  String get tojeongJungsuDetail3;

  /// No description provided for @tojeongJungsuDetail4.
  ///
  /// In en, this message translates to:
  /// **'Your hard work will be recognized with honor or a promotion at work. This is an excellent time for exams or certifications. Showcase your abilities with confidence, and you\'ll achieve great success.'**
  String get tojeongJungsuDetail4;

  /// No description provided for @tojeongJungsuDetail5.
  ///
  /// In en, this message translates to:
  /// **'Your financial potential is strong, but so is the temptation to spend. Practice thorough money management and avoid impulsive purchases. It\'s wise to keep your financial dealings professional and clear.'**
  String get tojeongJungsuDetail5;

  /// No description provided for @tojeongJungsuDetail6.
  ///
  /// In en, this message translates to:
  /// **'Prioritize your physical and mental well-being this year. Avoid overworking and ensure you get plenty of rest. Taking proactive steps for your health now will prevent future issues and keep your energy high.'**
  String get tojeongJungsuDetail6;

  /// No description provided for @tojeongHasuDetail1.
  ///
  /// In en, this message translates to:
  /// **'Ultimately, your efforts will lead to success and your goals will be achieved. You will be rewarded for your hard work and admired by those around you. Stay true to your original vision to ensure your success lasts.'**
  String get tojeongHasuDetail1;

  /// No description provided for @tojeongHasuDetail2.
  ///
  /// In en, this message translates to:
  /// **'You may face some challenges along the way, but your perseverance will lead you to your goal. The rewards of your hard work will be all the sweeter for the effort you put in. Success will bloom in its own time.'**
  String get tojeongHasuDetail2;

  /// No description provided for @tojeongHasuDetail3.
  ///
  /// In en, this message translates to:
  /// **'Unexpected obstacles may arise, but your resilience will turn these challenges into opportunities. By staying calm and focused, you\'ll find that misfortune can be turned into a blessing. Wisdom is your greatest ally this year.'**
  String get tojeongHasuDetail3;

  /// No description provided for @tojeongGeneralWealthGood.
  ///
  /// In en, this message translates to:
  /// **'Wealth luck is good. Income may arise from unexpected places, or investments may yield good results. However, as much as money comes in, it can also go out, so focus on saving.'**
  String get tojeongGeneralWealthGood;

  /// No description provided for @tojeongGeneralWealthBad.
  ///
  /// In en, this message translates to:
  /// **'The flow of wealth may not be smooth. You should reduce unnecessary spending and develop a habit of saving. Be cautious with financial transactions and consult experts for investments.'**
  String get tojeongGeneralWealthBad;

  /// No description provided for @tojeongGeneralCareerGood.
  ///
  /// In en, this message translates to:
  /// **'Opportunities to gain recognition in your career or business will come. It\'s a good time for promotions, career changes, or starting a business. Better results can be achieved with good relationships.'**
  String get tojeongGeneralCareerGood;

  /// No description provided for @tojeongGeneralCareerBad.
  ///
  /// In en, this message translates to:
  /// **'It\'s best to maintain the current state. Focus on your current tasks and build your skills rather than starting new ventures. You might feel stressed in relationships with colleagues or superiors, so keep your mind at ease.'**
  String get tojeongGeneralCareerBad;

  /// No description provided for @tojeongGeneralLoveGood.
  ///
  /// In en, this message translates to:
  /// **'Love luck rises, so singles may meet a good partner and couples\' love will deepen. Laughter and harmony will fill the home. It\'s a good time for marriage talks.'**
  String get tojeongGeneralLoveGood;

  /// No description provided for @tojeongGeneralLoveBad.
  ///
  /// In en, this message translates to:
  /// **'Arguments may arise due to trivial misunderstandings. Understanding and consideration for each other\'s positions are needed. Try to resolve problems through rational dialogue rather than emotional responses.'**
  String get tojeongGeneralLoveBad;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @sajuSolarHint.
  ///
  /// In en, this message translates to:
  /// **'Tojeong Yearly Oracle is most accurate when analyzed based on the lunar birthday.'**
  String get sajuSolarHint;

  /// No description provided for @yourFortune.
  ///
  /// In en, this message translates to:
  /// **'Your Fortune'**
  String get yourFortune;

  /// No description provided for @guaUpper.
  ///
  /// In en, this message translates to:
  /// **'Upper'**
  String get guaUpper;

  /// No description provided for @guaMiddle.
  ///
  /// In en, this message translates to:
  /// **'Middle'**
  String get guaMiddle;

  /// No description provided for @guaLower.
  ///
  /// In en, this message translates to:
  /// **'Lower'**
  String get guaLower;

  /// No description provided for @guaCode.
  ///
  /// In en, this message translates to:
  /// **'Gua Code'**
  String get guaCode;

  /// No description provided for @viewAgain.
  ///
  /// In en, this message translates to:
  /// **'Check Again'**
  String get viewAgain;

  /// No description provided for @zodiacAries.
  ///
  /// In en, this message translates to:
  /// **'Aries'**
  String get zodiacAries;

  /// No description provided for @zodiacTaurus.
  ///
  /// In en, this message translates to:
  /// **'Taurus'**
  String get zodiacTaurus;

  /// No description provided for @zodiacGemini.
  ///
  /// In en, this message translates to:
  /// **'Gemini'**
  String get zodiacGemini;

  /// No description provided for @zodiacCancer.
  ///
  /// In en, this message translates to:
  /// **'Cancer'**
  String get zodiacCancer;

  /// No description provided for @zodiacLeo.
  ///
  /// In en, this message translates to:
  /// **'Leo'**
  String get zodiacLeo;

  /// No description provided for @zodiacVirgo.
  ///
  /// In en, this message translates to:
  /// **'Virgo'**
  String get zodiacVirgo;

  /// No description provided for @zodiacLibra.
  ///
  /// In en, this message translates to:
  /// **'Libra'**
  String get zodiacLibra;

  /// No description provided for @zodiacScorpio.
  ///
  /// In en, this message translates to:
  /// **'Scorpio'**
  String get zodiacScorpio;

  /// No description provided for @zodiacSagittarius.
  ///
  /// In en, this message translates to:
  /// **'Sagittarius'**
  String get zodiacSagittarius;

  /// No description provided for @zodiacCapricorn.
  ///
  /// In en, this message translates to:
  /// **'Capricorn'**
  String get zodiacCapricorn;

  /// No description provided for @zodiacAquarius.
  ///
  /// In en, this message translates to:
  /// **'Aquarius'**
  String get zodiacAquarius;

  /// No description provided for @zodiacPisces.
  ///
  /// In en, this message translates to:
  /// **'Pisces'**
  String get zodiacPisces;

  /// No description provided for @elementFire.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get elementFire;

  /// No description provided for @elementEarth.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get elementEarth;

  /// No description provided for @elementAir.
  ///
  /// In en, this message translates to:
  /// **'Air'**
  String get elementAir;

  /// No description provided for @elementWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get elementWater;

  /// No description provided for @compatibilityCategoryZodiac.
  ///
  /// In en, this message translates to:
  /// **'Zodiac Compatibility'**
  String get compatibilityCategoryZodiac;

  /// No description provided for @compatibilityCategoryInner.
  ///
  /// In en, this message translates to:
  /// **'Inner Compatibility'**
  String get compatibilityCategoryInner;

  /// No description provided for @compatibilityCategoryConstellation.
  ///
  /// In en, this message translates to:
  /// **'Constellation Compatibility'**
  String get compatibilityCategoryConstellation;

  /// No description provided for @compatibilitySummarySamhap.
  ///
  /// In en, this message translates to:
  /// **'Best Zodiac Match (Samhap)'**
  String get compatibilitySummarySamhap;

  /// No description provided for @compatibilityDescSamhap.
  ///
  /// In en, this message translates to:
  /// **'The {animal1} and {animal2} are a perfect match, complementing each other\'s weaknesses. This relationship creates great synergy when together.'**
  String compatibilityDescSamhap(String animal1, String animal2);

  /// No description provided for @compatibilitySummaryYukhap.
  ///
  /// In en, this message translates to:
  /// **'Great Zodiac Match (Yukhap)'**
  String get compatibilitySummaryYukhap;

  /// No description provided for @compatibilityDescYukhap.
  ///
  /// In en, this message translates to:
  /// **'The {animal1} and {animal2} have a strong mutual attraction. It\'s easy to feel a connection from the very beginning.'**
  String compatibilityDescYukhap(String animal1, String animal2);

  /// No description provided for @compatibilitySummaryChung.
  ///
  /// In en, this message translates to:
  /// **'Relationship Requiring Effort (Chung)'**
  String get compatibilitySummaryChung;

  /// No description provided for @compatibilityDescChung.
  ///
  /// In en, this message translates to:
  /// **'The {animal1} and {animal2} have different temperaments and may clash. Respecting each other\'s differences and showing consideration is necessary.'**
  String compatibilityDescChung(String animal1, String animal2);

  /// No description provided for @compatibilitySummaryWonjin.
  ///
  /// In en, this message translates to:
  /// **'Relationship Requiring Understanding (Wonjin)'**
  String get compatibilitySummaryWonjin;

  /// No description provided for @compatibilityDescWonjin.
  ///
  /// In en, this message translates to:
  /// **'This is a relationship where you might occasionally feel resentment or sadness without a clear reason. Frequent communication is recommended to reduce misunderstandings.'**
  String get compatibilityDescWonjin;

  /// No description provided for @compatibilitySummaryDefaultZodiac.
  ///
  /// In en, this message translates to:
  /// **'Average Zodiac Match'**
  String get compatibilitySummaryDefaultZodiac;

  /// No description provided for @compatibilityDescDefaultZodiac.
  ///
  /// In en, this message translates to:
  /// **'The {animal1} and {animal2} have a smooth relationship without major conflicts.'**
  String compatibilityDescDefaultZodiac(String animal1, String animal2);

  /// No description provided for @compatibilitySummaryCheonganHap.
  ///
  /// In en, this message translates to:
  /// **'Destined Soulmates'**
  String get compatibilitySummaryCheonganHap;

  /// No description provided for @compatibilityDescCheonganHap.
  ///
  /// In en, this message translates to:
  /// **'Your personalities and values are perfectly aligned. You are soulmates who understand each other even without words.'**
  String get compatibilityDescCheonganHap;

  /// No description provided for @compatibilitySummarySangsaeng.
  ///
  /// In en, this message translates to:
  /// **'Supportive Partnership'**
  String get compatibilitySummarySangsaeng;

  /// No description provided for @compatibilityDescSangsaeng.
  ///
  /// In en, this message translates to:
  /// **'A positive relationship where you naturally support each other and help one another grow.'**
  String get compatibilityDescSangsaeng;

  /// No description provided for @compatibilitySummarySanggeuk.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Balance Required'**
  String get compatibilitySummarySanggeuk;

  /// No description provided for @compatibilityDescSanggeuk.
  ///
  /// In en, this message translates to:
  /// **'While there may be personality differences, you have the unique potential to complement each other\'s strengths and weaknesses.'**
  String get compatibilityDescSanggeuk;

  /// No description provided for @compatibilitySummaryDefaultInner.
  ///
  /// In en, this message translates to:
  /// **'Natural Friends'**
  String get compatibilitySummaryDefaultInner;

  /// No description provided for @compatibilityDescDefaultInner.
  ///
  /// In en, this message translates to:
  /// **'A relationship built on similar tendencies and shared interests, making your time together easy and comfortable.'**
  String get compatibilityDescDefaultInner;

  /// No description provided for @compatibilitySummarySameElement.
  ///
  /// In en, this message translates to:
  /// **'Meeting of Similar Minds'**
  String get compatibilitySummarySameElement;

  /// No description provided for @compatibilityDescSameElement.
  ///
  /// In en, this message translates to:
  /// **'Sharing the \'{element}\' tendency means your values and ways of acting are very much in sync.'**
  String compatibilityDescSameElement(String element);

  /// No description provided for @compatibilitySummaryCompatibleElement.
  ///
  /// In en, this message translates to:
  /// **'Harmonious Balance'**
  String get compatibilitySummaryCompatibleElement;

  /// No description provided for @compatibilityDescCompatibleElement.
  ///
  /// In en, this message translates to:
  /// **'A beautiful relationship where your different charms blend together in perfect harmony.'**
  String get compatibilityDescCompatibleElement;

  /// No description provided for @compatibilitySummaryIncompatibleElement.
  ///
  /// In en, this message translates to:
  /// **'Fascinating Differences'**
  String get compatibilitySummaryIncompatibleElement;

  /// No description provided for @compatibilityDescIncompatibleElement.
  ///
  /// In en, this message translates to:
  /// **'Your different temperaments may feel unfamiliar at first, but they offer endless opportunities for growth and discovery together.'**
  String get compatibilityDescIncompatibleElement;

  /// No description provided for @compatibilitySummaryDefaultConstellation.
  ///
  /// In en, this message translates to:
  /// **'Average Harmony'**
  String get compatibilitySummaryDefaultConstellation;

  /// No description provided for @compatibilityDescDefaultConstellation.
  ///
  /// In en, this message translates to:
  /// **'A relationship that matches reasonably well based on zodiac signs.'**
  String get compatibilityDescDefaultConstellation;

  /// No description provided for @routineMorningTitle.
  ///
  /// In en, this message translates to:
  /// **'Fresh Morning! ☀️'**
  String get routineMorningTitle;

  /// No description provided for @routineMorningBody.
  ///
  /// In en, this message translates to:
  /// **'Did you forget your routine missions?'**
  String get routineMorningBody;

  /// No description provided for @routineEveningTitle.
  ///
  /// In en, this message translates to:
  /// **'Good job today! ✨'**
  String get routineEveningTitle;

  /// No description provided for @routineEveningBody.
  ///
  /// In en, this message translates to:
  /// **'Did you complete all your missions? Finish your routine.'**
  String get routineEveningBody;

  /// No description provided for @routineCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Check today\'s missions! 🚀'**
  String get routineCheckTitle;

  /// No description provided for @routineCheckBody.
  ///
  /// In en, this message translates to:
  /// **'Follow your routine and have a great day.'**
  String get routineCheckBody;

  /// No description provided for @supplementNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Supplement Reminder'**
  String get supplementNotificationTitle;

  /// No description provided for @waterNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Water Reminder'**
  String get waterNotificationTitle;

  /// No description provided for @routineNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Routine Reminder'**
  String get routineNotificationTitle;

  /// No description provided for @todaysFortuneNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Fortune'**
  String get todaysFortuneNotificationTitle;

  /// No description provided for @afternoonFortuneNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'How about your afternoon fortune? Check it now!'**
  String get afternoonFortuneNotificationBody;

  /// No description provided for @morningFortuneNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Check your fortune and start your day with energy!'**
  String get morningFortuneNotificationBody;

  /// No description provided for @fortunePassExpiryTitle.
  ///
  /// In en, this message translates to:
  /// **'Fortune Pass Expiring Today'**
  String get fortunePassExpiryTitle;

  /// No description provided for @fortunePassExpiryBody.
  ///
  /// In en, this message translates to:
  /// **'Your membership expires today. Renew to keep enjoying benefits!'**
  String get fortunePassExpiryBody;

  /// No description provided for @takeNow.
  ///
  /// In en, this message translates to:
  /// **'Take Now'**
  String get takeNow;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @turnOffAlarmAction.
  ///
  /// In en, this message translates to:
  /// **'Turn Off Alarm'**
  String get turnOffAlarmAction;

  /// No description provided for @todaysFortuneNotification.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Fortune Notification'**
  String get todaysFortuneNotification;

  /// No description provided for @enableNotification.
  ///
  /// In en, this message translates to:
  /// **'Enable Notification'**
  String get enableNotification;

  /// No description provided for @fortuneNotificationDescription.
  ///
  /// In en, this message translates to:
  /// **'Get your daily fortune at the scheduled time.'**
  String get fortuneNotificationDescription;

  /// No description provided for @morningNotificationTime.
  ///
  /// In en, this message translates to:
  /// **'Morning Notification Time'**
  String get morningNotificationTime;

  /// No description provided for @afternoonNotificationTime.
  ///
  /// In en, this message translates to:
  /// **'Afternoon Notification Time'**
  String get afternoonNotificationTime;

  /// No description provided for @morningFortuneTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Fortune (Morning)'**
  String get morningFortuneTitle;

  /// No description provided for @afternoonFortuneTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Fortune (Afternoon)'**
  String get afternoonFortuneTitle;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @supplementChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for supplement intake notifications.'**
  String get supplementChannelDesc;

  /// No description provided for @waterChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for water drinking habit notifications.'**
  String get waterChannelDesc;

  /// No description provided for @waterSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Water Drinking Notification'**
  String get waterSummaryTitle;

  /// No description provided for @dailyRoutineChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for daily mission and habit building notifications.'**
  String get dailyRoutineChannelDesc;

  /// No description provided for @dailyRoutineSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Routine Notification'**
  String get dailyRoutineSummaryTitle;

  /// No description provided for @missionChannelName.
  ///
  /// In en, this message translates to:
  /// **'Mission Notification'**
  String get missionChannelName;

  /// No description provided for @missionChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for general mission performance notifications.'**
  String get missionChannelDesc;

  /// No description provided for @fortuneChannelName.
  ///
  /// In en, this message translates to:
  /// **'Fortune Notification'**
  String get fortuneChannelName;

  /// No description provided for @fortuneChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for daily fortune check notifications.'**
  String get fortuneChannelDesc;

  /// No description provided for @subscriptionChannelName.
  ///
  /// In en, this message translates to:
  /// **'Subscription Notification'**
  String get subscriptionChannelName;

  /// No description provided for @subscriptionChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for Fortune Pass expiration and subscription notifications.'**
  String get subscriptionChannelDesc;

  /// No description provided for @alarmChannelName.
  ///
  /// In en, this message translates to:
  /// **'Alarm'**
  String get alarmChannelName;

  /// No description provided for @alarmChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Channel for wake-up and mission performance alarms.'**
  String get alarmChannelDesc;

  /// No description provided for @shareViaKakao.
  ///
  /// In en, this message translates to:
  /// **'Share via KakaoTalk'**
  String get shareViaKakao;

  /// No description provided for @shareViaSNS.
  ///
  /// In en, this message translates to:
  /// **'Share via other SNS (Instagram, Twitter, etc.)'**
  String get shareViaSNS;

  /// No description provided for @checkDetailResult.
  ///
  /// In en, this message translates to:
  /// **'Check Detailed Result'**
  String get checkDetailResult;

  /// No description provided for @viewMyFortuneResult.
  ///
  /// In en, this message translates to:
  /// **'View My Fortune Result'**
  String get viewMyFortuneResult;

  /// No description provided for @takeSupplementNow.
  ///
  /// In en, this message translates to:
  /// **'Please take your supplements!'**
  String get takeSupplementNow;

  /// No description provided for @takeNowQuestion.
  ///
  /// In en, this message translates to:
  /// **'Would you like to take it now?'**
  String get takeNowQuestion;

  /// No description provided for @eatNow.
  ///
  /// In en, this message translates to:
  /// **'Eat now'**
  String get eatNow;

  /// No description provided for @eatLater.
  ///
  /// In en, this message translates to:
  /// **'Eat later'**
  String get eatLater;

  /// No description provided for @snoozeMessageGeneric.
  ///
  /// In en, this message translates to:
  /// **'I will remind you again in {minutes} minutes.'**
  String snoozeMessageGeneric(int minutes);

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @cheeringMessage4.
  ///
  /// In en, this message translates to:
  /// **'Vibrant morning, happy start!'**
  String get cheeringMessage4;

  /// No description provided for @cheeringMessage5.
  ///
  /// In en, this message translates to:
  /// **'Have a smiling day.'**
  String get cheeringMessage5;

  /// No description provided for @cheeringMessage6.
  ///
  /// In en, this message translates to:
  /// **'Cheer up today!'**
  String get cheeringMessage6;

  /// No description provided for @cheeringMessage7.
  ///
  /// In en, this message translates to:
  /// **'You will shine enough today.'**
  String get cheeringMessage7;

  /// No description provided for @cheeringMessage8.
  ///
  /// In en, this message translates to:
  /// **'I have a feeling something good will happen!'**
  String get cheeringMessage8;

  /// No description provided for @cheeringMessage9.
  ///
  /// In en, this message translates to:
  /// **'Great job today. A vigorous start!'**
  String get cheeringMessage9;

  /// No description provided for @cheeringMessage10.
  ///
  /// In en, this message translates to:
  /// **'Happiness is always by your side.'**
  String get cheeringMessage10;

  /// No description provided for @cheeringMessage11.
  ///
  /// In en, this message translates to:
  /// **'I\'m rooting for your dreams today.'**
  String get cheeringMessage11;

  /// No description provided for @cheeringMessage12.
  ///
  /// In en, this message translates to:
  /// **'Refreshing morning, pleasant day!'**
  String get cheeringMessage12;

  /// No description provided for @cheeringMessage13.
  ///
  /// In en, this message translates to:
  /// **'Be victorious today!'**
  String get cheeringMessage13;

  /// No description provided for @cheeringMessage14.
  ///
  /// In en, this message translates to:
  /// **'You are precious just by being you.'**
  String get cheeringMessage14;

  /// No description provided for @cheeringMessage15.
  ///
  /// In en, this message translates to:
  /// **'Have a day full of pleasant things.'**
  String get cheeringMessage15;

  /// No description provided for @cheeringMessage16.
  ///
  /// In en, this message translates to:
  /// **'I hope your day sparkles today!'**
  String get cheeringMessage16;

  /// No description provided for @cheeringMessage17.
  ///
  /// In en, this message translates to:
  /// **'Your smile brightens the world.'**
  String get cheeringMessage17;

  /// No description provided for @cheeringMessage18.
  ///
  /// In en, this message translates to:
  /// **'Be yourself today!'**
  String get cheeringMessage18;

  /// No description provided for @cheeringMessage19.
  ///
  /// In en, this message translates to:
  /// **'Start today with a fluttering heart.'**
  String get cheeringMessage19;

  /// No description provided for @cheeringMessage20.
  ///
  /// In en, this message translates to:
  /// **'A wonderful day awaits you.'**
  String get cheeringMessage20;

  /// No description provided for @cheeringMessage21.
  ///
  /// In en, this message translates to:
  /// **'With the power of positivity today!'**
  String get cheeringMessage21;

  /// No description provided for @cheeringMessage22.
  ///
  /// In en, this message translates to:
  /// **'I\'m rooting for your path.'**
  String get cheeringMessage22;

  /// No description provided for @cheeringMessage23.
  ///
  /// In en, this message translates to:
  /// **'Make today your best!'**
  String get cheeringMessage23;

  /// No description provided for @cheeringMessage24.
  ///
  /// In en, this message translates to:
  /// **'May luck be with you!'**
  String get cheeringMessage24;

  /// No description provided for @cheeringMessage25.
  ///
  /// In en, this message translates to:
  /// **'Have a warm day today.'**
  String get cheeringMessage25;

  /// No description provided for @cheeringMessage26.
  ///
  /// In en, this message translates to:
  /// **'You can do it!'**
  String get cheeringMessage26;

  /// No description provided for @cheeringMessage27.
  ///
  /// In en, this message translates to:
  /// **'Start today with gratitude.'**
  String get cheeringMessage27;

  /// No description provided for @cheeringMessage28.
  ///
  /// In en, this message translates to:
  /// **'Your value is infinite.'**
  String get cheeringMessage28;

  /// No description provided for @cheeringMessage29.
  ///
  /// In en, this message translates to:
  /// **'May your day bloom with smiles.'**
  String get cheeringMessage29;

  /// No description provided for @cheeringMessage30.
  ///
  /// In en, this message translates to:
  /// **'Have a good time with good people!'**
  String get cheeringMessage30;

  /// No description provided for @cheeringMessage31.
  ///
  /// In en, this message translates to:
  /// **'One step closer to your dreams today!'**
  String get cheeringMessage31;

  /// No description provided for @cheeringMessage32.
  ///
  /// In en, this message translates to:
  /// **'You are the coolest person today.'**
  String get cheeringMessage32;

  /// No description provided for @cheeringMessage33.
  ///
  /// In en, this message translates to:
  /// **'A miraculous day will come.'**
  String get cheeringMessage33;

  /// No description provided for @cheeringMessage34.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your day at leisure today.'**
  String get cheeringMessage34;

  /// No description provided for @cheeringMessage35.
  ///
  /// In en, this message translates to:
  /// **'Your efforts will not betray you.'**
  String get cheeringMessage35;

  /// No description provided for @cheeringMessage36.
  ///
  /// In en, this message translates to:
  /// **'Have a healthy day today.'**
  String get cheeringMessage36;

  /// No description provided for @cheeringMessage37.
  ///
  /// In en, this message translates to:
  /// **'You were born to be loved!'**
  String get cheeringMessage37;

  /// No description provided for @cheeringMessage38.
  ///
  /// In en, this message translates to:
  /// **'Be courageous today!'**
  String get cheeringMessage38;

  /// No description provided for @cheeringMessage39.
  ///
  /// In en, this message translates to:
  /// **'A bright future awaits you.'**
  String get cheeringMessage39;

  /// No description provided for @cheeringMessage40.
  ///
  /// In en, this message translates to:
  /// **'Have a day full of passion!'**
  String get cheeringMessage40;

  /// No description provided for @cheeringMessage41.
  ///
  /// In en, this message translates to:
  /// **'I hope your mind is at peace.'**
  String get cheeringMessage41;

  /// No description provided for @cheeringMessage42.
  ///
  /// In en, this message translates to:
  /// **'Find small happiness today.'**
  String get cheeringMessage42;

  /// No description provided for @cheeringMessage43.
  ///
  /// In en, this message translates to:
  /// **'You\'re already doing well enough.'**
  String get cheeringMessage43;

  /// No description provided for @cheeringMessage44.
  ///
  /// In en, this message translates to:
  /// **'Start today hopefully.'**
  String get cheeringMessage44;

  /// No description provided for @cheeringMessage45.
  ///
  /// In en, this message translates to:
  /// **'Your kindness is a great strength to someone.'**
  String get cheeringMessage45;

  /// No description provided for @cheeringMessage46.
  ///
  /// In en, this message translates to:
  /// **'Have a productive day today.'**
  String get cheeringMessage46;

  /// No description provided for @cheeringMessage47.
  ///
  /// In en, this message translates to:
  /// **'You have the power to change the world.'**
  String get cheeringMessage47;

  /// No description provided for @cheeringMessage48.
  ///
  /// In en, this message translates to:
  /// **'Clear day today!'**
  String get cheeringMessage48;

  /// No description provided for @cheeringMessage49.
  ///
  /// In en, this message translates to:
  /// **'Exude your charm to your heart\'s content.'**
  String get cheeringMessage49;

  /// No description provided for @cheeringMessage50.
  ///
  /// In en, this message translates to:
  /// **'Fill your day with happiness today!'**
  String get cheeringMessage50;

  /// No description provided for @locationServiceDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled.'**
  String get locationServiceDisabled;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied.'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied.'**
  String get locationPermissionPermanentlyDenied;

  /// No description provided for @deleteMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Mission'**
  String get deleteMissionTitle;

  /// No description provided for @deleteMissionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this mission?'**
  String get deleteMissionConfirm;

  /// No description provided for @yesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete it'**
  String get yesDelete;

  /// No description provided for @waterAlarmTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to drink water! 💧'**
  String get waterAlarmTitle;

  /// No description provided for @waterAlarmBody.
  ///
  /// In en, this message translates to:
  /// **'How about a glass of cool water for your health?'**
  String get waterAlarmBody;

  /// No description provided for @supplementAlarmBody.
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget to take your supplements for today.'**
  String get supplementAlarmBody;

  /// No description provided for @waterHabitChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Notification channel for water drinking habit.'**
  String get waterHabitChannelDesc;

  /// No description provided for @pleaseSolveMath.
  ///
  /// In en, this message translates to:
  /// **'Please solve the problem.'**
  String get pleaseSolveMath;

  /// No description provided for @detectedLabel.
  ///
  /// In en, this message translates to:
  /// **'[Detected: {labels}]'**
  String detectedLabel(String labels);

  /// No description provided for @defaultSleepDuration.
  ///
  /// In en, this message translates to:
  /// **'7h 30m'**
  String get defaultSleepDuration;

  /// No description provided for @year2024Name.
  ///
  /// In en, this message translates to:
  /// **'Gap-Chin Year (Year of the Blue Dragon)'**
  String get year2024Name;

  /// No description provided for @year2025Name.
  ///
  /// In en, this message translates to:
  /// **'Eul-Sa Year (Year of the Blue Snake)'**
  String get year2025Name;

  /// No description provided for @year2026Name.
  ///
  /// In en, this message translates to:
  /// **'Byeong-O Year (Year of the Red Horse)'**
  String get year2026Name;

  /// No description provided for @supportEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'[{appTitle} Inquiry] {title}'**
  String supportEmailSubject(String appTitle, String title);

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @monthlySummary.
  ///
  /// In en, this message translates to:
  /// **'Monthly Summary'**
  String get monthlySummary;

  /// No description provided for @monthlySuccessRate.
  ///
  /// In en, this message translates to:
  /// **'{month} Monthly Success Rate: {percentage}% ({success}/{total})'**
  String monthlySuccessRate(
      int month, String percentage, int success, int total);

  /// No description provided for @noMonthlyRecord.
  ///
  /// In en, this message translates to:
  /// **'No records for {month}'**
  String noMonthlyRecord(int month);

  /// No description provided for @missionRecord.
  ///
  /// In en, this message translates to:
  /// **'Mission Record'**
  String get missionRecord;

  /// No description provided for @supplementRecord.
  ///
  /// In en, this message translates to:
  /// **'Supplement Record'**
  String get supplementRecord;

  /// No description provided for @timeSaleCatchChance.
  ///
  /// In en, this message translates to:
  /// **'Grab the 50% discount chance!'**
  String get timeSaleCatchChance;
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
        'de',
        'en',
        'es',
        'fr',
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
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
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
