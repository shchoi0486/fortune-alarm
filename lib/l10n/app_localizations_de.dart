// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => 'Guten Morgen! Beginne deinen Glückstag.';

  @override
  String get missionWakeUp => 'Aufwach-Mission';

  @override
  String get missionSupplement => 'Nahrungsergänzungsmittel nehmen';

  @override
  String get missionWater => 'Über 2L Wasser trinken';

  @override
  String get fortuneCookie => 'Glückskeks';

  @override
  String get settings => 'Einstellungen';

  @override
  String get alarm => 'Wecker';

  @override
  String get calendar => 'Kalender';

  @override
  String get mission => 'Mission';

  @override
  String get fortune => 'Glück';

  @override
  String get congratulations => 'Herzlichen Glückwunsch!';

  @override
  String get allMissionsCompleted =>
      'Du hast alle 5 Missionen für heute abgeschlossen.';

  @override
  String get rewardReceived =>
      'Du hast 1 Glückskeks als Belohnung erhalten! 🥠';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get exactAlarmPermissionRequired =>
      'Die Berechtigung \"Exakter Wecker\" ist erforderlich, damit der Wecker zur richtigen Zeit klingelt.';

  @override
  String get overlayPermissionRequired =>
      'Die Berechtigung \"Über anderen Apps anzeigen\" ist für Vollbild-Benachrichtigungen erforderlich.';

  @override
  String get deleteAllAlarms => 'Alle Wecker löschen';

  @override
  String get noAlarms => 'Keine Wecker registriert.';

  @override
  String get lessThanAMinuteRemaining => 'Klingelt in weniger als einer Minute';

  @override
  String hoursMinutesRemaining(int hours, int minutes) {
    return 'Klingelt in $hours Std $minutes Min';
  }

  @override
  String minutesRemaining(int minutes) {
    return 'Klingelt in $minutes Min';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward => 'Tägliche Glückskeks-Belohnung';

  @override
  String get missionRewardInfo =>
      '1 Keks für 5 erfolgreiche Missionen, 2 für 10!';

  @override
  String get dailyMission => 'Tägliche Mission';

  @override
  String goalAchieved(int completed) {
    return '🎉 $completed/5 Ziel erreicht!';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 Erreicht';
  }

  @override
  String get myMissionRecord => 'Mein Missionsprotokoll';

  @override
  String get consecutiveSuccess => 'In Folge';

  @override
  String get successRate30Days => 'Erfolgsrate (30 T)';

  @override
  String get totalSuccess => 'Gesamterfolg';

  @override
  String get inProgress => 'In Arbeit 🔥';

  @override
  String get resetMissions => 'Missionen zurücksetzen';

  @override
  String get resetMissionsConfirm =>
      'Möchtest du alle Herausforderungslisten zurücksetzen?\n(Ausgenommen grundlegende Systemmissionen)';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get addMission => 'Mission hinzufügen';

  @override
  String get completedMissions => 'Abgeschlossene Missionen';

  @override
  String get noCompletedMissionsHint =>
      'Noch keine Missionen abgeschlossen. Erreiche das heutige Missionsziel.';

  @override
  String greeting(String userName) {
    return 'Hallo, $userName';
  }

  @override
  String get welcomeFortune => 'Willkommen in der mysteriösen Welt des Glücks';

  @override
  String get luckyColor => 'Glücksfarbe';

  @override
  String get luckyItem => 'Glücksgegenstand';

  @override
  String get luckyDirection => 'Glücksrichtung';

  @override
  String get viewVariousFortunes => 'Verschiedene Glückssprüche ansehen';

  @override
  String get todaysRecommendation => 'Heutige Empfehlung';

  @override
  String get checkTodaysFortune => 'Heutiges Glück prüfen';

  @override
  String get todaysAdvice => 'Der heutige Rat von den mysteriösen Sternen';

  @override
  String get viewSpecificDateFortune => 'Glück für bestimmtes Datum ansehen';

  @override
  String get lottoRecommendation => 'Lottozahlen-Empfehlung';

  @override
  String get luckyNumber => 'Glückszahl';

  @override
  String get specificDateFortune => 'Glück an bestimmtem Datum';

  @override
  String get specialDayFortune => 'Besonderer Tag Glück';

  @override
  String get newYearFortune => 'Neujahrsglück';

  @override
  String get totalFortune2026 => 'Gesamtglück 2026';

  @override
  String get traditionalFortune => 'Traditionelles Glück';

  @override
  String get traditionalSaju => 'Traditionelle Saju-Analyse';

  @override
  String get faceReading => 'Gesichtslesen';

  @override
  String get missionFaceReading => 'Gesichtslese-Mission';

  @override
  String get faceFate => 'Gesichtsschicksal';

  @override
  String get compatibility => 'Kompatibilität';

  @override
  String get relationshipHarmony => 'Beziehungsharmonie';

  @override
  String get general => 'Allgemein';

  @override
  String get darkMode => 'Dunkelmodus';

  @override
  String get darkModeDescription => 'Den Bildschirm dunkel einstellen.';

  @override
  String get alarmSettings => 'Weckereinstellungen';

  @override
  String get privacySettings => 'Datenschutzeinstellungen';

  @override
  String get information => 'Information';

  @override
  String get notice => 'Hinweis';

  @override
  String get weatherConditionSunny => 'Sonnig';

  @override
  String get weatherConditionCloudy => 'Bewölkt';

  @override
  String get weatherConditionFoggy => 'Neblig';

  @override
  String get weatherConditionRainy => 'Regnerisch';

  @override
  String get weatherConditionSnowy => 'Schnee';

  @override
  String get weatherConditionThunderstorm => 'Gewitter';

  @override
  String get airQualityGood => 'Gut';

  @override
  String get airQualityNormal => 'Normal';

  @override
  String get airQualityBad => 'Schlecht';

  @override
  String get airQualityVeryBad => 'Sehr schlecht';

  @override
  String get locationUnknown => 'Unbekannter Ort';

  @override
  String get locationError => 'Standortfehler';

  @override
  String get faq => 'FAQ';

  @override
  String get sendFeedback => 'Feedback senden';

  @override
  String get feedbackDescription =>
      'Bitte teilen Sie uns Ihr Feedback oder Vorschläge zu Fortune Alarm mit.\nIhre Eingabe hilft uns, uns zu verbessern.';

  @override
  String get reportCopyright => 'Urheberrechtsverletzung melden';

  @override
  String get copyrightDescription =>
      'Wenn Sie glauben, dass der Inhalt von Fortune Alarm das Urheberrecht verletzt, melden Sie dies bitte per E-Mail.\nWir werden nach Bestätigung sofort Maßnahmen ergreifen.';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get privacyPolicy =>
      'Nutzungsbedingungen und Datenschutzrichtlinie\n\n1. Allgemeine Bestimmungen\n\nArtikel 1 (Zweck)\nDer Zweck dieser Bedingungen besteht darin, die Bedingungen und Verfahren für die Nutzung des von \'Fortune Alarm\' bereitgestellten Dienstes (im Folgenden als \'Dienst\' bezeichnet) sowie die Rechte, Pflichten und Verantwortlichkeiten der Benutzer und des Entwicklers festzulegen.\n\nArtikel 2 (Datenschutzrichtlinie)\n\n1. Gegenstände und Methode der Erhebung personenbezogener Daten\nDieser Dienst kann ohne Registrierung einer Mitgliedschaft genutzt werden und speichert oder sammelt keine personenbezogenen Daten der Benutzer auf einem separaten Server.\nDie folgenden Informationen können jedoch während der Nutzung des Dienstes auf dem Gerät generiert und gespeichert werden:\n- Weckereinstellungen, Aufzeichnungen über den Abschluss von Missionen, Verlauf des Erwerbs von Glückskeksen usw.\n\n2. Informationen zur Nutzung von Geräteberechtigungen\nDer Dienst verwendet die folgenden Berechtigungen im für die Bereitstellung des Dienstes erforderlichen Mindestumfang:\n- Benachrichtigungen (Erforderlich): Wird für die Ausführung von Weckern und Glückskeks-Benachrichtigungen verwendet.\n- Exakter Wecker & Ausschluss von der Batterieoptimierung (Erforderlich): Wird verwendet, um sicherzustellen, dass Wecker auch im Energiesparmodus pünktlich klingeln.\n- Über anderen Apps anzeigen (Erforderlich): Wird verwendet, um den Weckerbildschirm auf dem Sperrbildschirm oder während der Nutzung anderer Apps anzuzeigen.\n- Kamera (Optional): Wird nur für die \'Objekt-Snap\'-Mission verwendet; aufgenommene Bilder werden nur auf dem Gerät verarbeitet und nicht an einen Server übertragen.\n\n3. Werbedienste und Datenverarbeitung\nDieser Dienst verwendet Google AdMob, um Werbung für die kostenlose Bereitstellung des Dienstes bereitzustellen.\nGoogle kann einige nicht persönlich identifizierbare Informationen, wie z. B. die Werbe-ID (ADID), für personalisierte Werbeeinstellungen erfassen.\n- Google-Datenschutzrichtlinie: https://policies.google.com/privacy\n\nArtikel 3 (Datenspeicherung und -löschung)\nDieser Dienst ist eine lokale App, die Daten auf dem Gerät des Benutzers speichert.\nWenn Sie die App löschen, werden alle auf dem Gerät gespeicherten Daten (Wecker, Missionsaufzeichnungen usw.) sofort gelöscht und können nicht wiederhergestellt werden.';

  @override
  String get alarmOptimization => 'Weckerton-Optimierung';

  @override
  String get allOptimizationsCompleted =>
      'Alle Optimierungseinstellungen abgeschlossen';

  @override
  String get optimizationNeeded =>
      'Einstellungen sind für genaue Wecker erforderlich.';

  @override
  String get optimizationDescription =>
      'Wecker können aufgrund von Android-Systemeinstellungen verzögert sein oder nicht klingeln. Bitte setzen Sie alle Elemente auf zugelassen.';

  @override
  String get allowNotificationPermission =>
      'Benachrichtigungsberechtigung zulassen';

  @override
  String get notificationPermissionDescription =>
      'Erforderlich, um Benachrichtigungen anzuzeigen, wenn ein Wecker ausgelöst wird.';

  @override
  String get excludeBatteryOptimization => 'Batterieoptimierung ausschließen';

  @override
  String get batteryOptimizationDescription =>
      'Stellt sicher, dass der Wecker auch im Energiesparmodus sofort klingelt.';

  @override
  String get allowExactAlarm => 'Exakten Wecker zulassen';

  @override
  String get exactAlarmDescription =>
      'Lässt den Wecker pünktlich klingeln, ohne vom System verzögert zu werden.';

  @override
  String get drawOverOtherApps => 'Über anderen Apps anzeigen';

  @override
  String get overlayDescription =>
      'Zeigt den Weckerbildschirm auch auf dem Sperrbildschirm oder während der Nutzung anderer Apps an.';

  @override
  String get allSettingsCompleted => 'Alle Einstellungen sind abgeschlossen.';

  @override
  String get manualSettingsInfo =>
      'Sie können Einstellungen direkt in den Android-Systemeinstellungen deaktivieren.';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get selectPhoto => 'Foto auswählen';

  @override
  String get selectAlarmBackground => 'Weckerhintergrund';

  @override
  String get defaultLabel => 'Standard';

  @override
  String get howToAdd => 'Hinzufügen';

  @override
  String get addAssetInstructions =>
      'Legen Sie das Bild im Ordner assets/images/ ab und registrieren Sie es in pubspec.yaml.';

  @override
  String get gallery => 'Galerie';

  @override
  String get ringingNow => 'Klingelt jetzt';

  @override
  String get setTime => 'Zeit einstellen';

  @override
  String get repeatDays => 'Wiederholungstage';

  @override
  String get repeatDaily => 'Täglich wiederholen';

  @override
  String get snoozeSettings => 'Schlummer-Einstellungen';

  @override
  String get interval => 'Intervall';

  @override
  String get wakeUpAlarm => 'Aufwach-Wecker';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval Min, $count Mal';
  }

  @override
  String get daySun => 'So';

  @override
  String get dayMon => 'Mo';

  @override
  String get dayTue => 'Di';

  @override
  String get dayWed => 'Mi';

  @override
  String get dayThu => 'Do';

  @override
  String get dayFri => 'Fr';

  @override
  String get daySat => 'Sa';

  @override
  String get missionRewardEarned =>
      'Herzlichen Glückwunsch! Du hast heute 5 Missionen abgeschlossen und 1 Glückskeks verdient!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Herzlichen Glückwunsch! Du hast heute $missions Missionen abgeschlossen und $cookies Glückskeks(e) verdient!';
  }

  @override
  String daysCount(int count) {
    return '$count Tage';
  }

  @override
  String get user => 'Benutzer';

  @override
  String get none => 'Keine';

  @override
  String minutesLater(int minutes) {
    return '$minutes Min später';
  }

  @override
  String get countLabel => 'Anzahl';

  @override
  String timesCount(int count) {
    return 'Insgesamt $count Mal';
  }

  @override
  String get wakeUpMission => 'Aufwach-Mission';

  @override
  String get alarmSound => 'Weckerton';

  @override
  String get gradualVolume => 'Ansteigende Lautstärke';

  @override
  String get vibration => 'Vibration';

  @override
  String get alarmNameAndBackground => 'Weckername & Hintergrund';

  @override
  String get customStyle => 'Benutzerdefinierter Stil';

  @override
  String get alarmName => 'Weckername';

  @override
  String get enterAlarmName => 'Bitte Weckernamen eingeben';

  @override
  String get save => 'Speichern';

  @override
  String get missionNone => 'Keine Mission';

  @override
  String get missionSnap => 'Objekt-Snap';

  @override
  String get missionMath => 'Matheaufgabe';

  @override
  String get missionFortune => 'Glück';

  @override
  String get missionShake => 'Schütteln';

  @override
  String get missionFortuneCatch => 'Glückskeks fangen';

  @override
  String get missionNoDescription => 'Der Wecker klingelt ohne Mission.';

  @override
  String get missionCameraDescription =>
      'Mache ein Foto des angegebenen Objekts, um den Wecker auszuschalten.';

  @override
  String get missionMathDescription =>
      'Löse Matheaufgaben, um dein Gehirn zu wecken.';

  @override
  String get missionFortuneDescription =>
      'Schalte den Wecker aus und prüfe dein heutiges Glück.';

  @override
  String get missionShakeDescription =>
      'Du musst dein Telefon schütteln, um den Wecker auszuschalten.';

  @override
  String get missionFortuneCatchDescription => 'Fange den beweglichen Fortuni!';

  @override
  String get missionWalk => 'Gehen';

  @override
  String get missionWalkDescription => 'Gehe, um den Wecker auszuschalten!';

  @override
  String get missionFaceDescription =>
      'Halte dein Gesicht 5 Sekunden im Rahmen.';

  @override
  String get walkStepCount => 'Zielschritte';

  @override
  String walkSteps(int count) {
    return '$count Schritte';
  }

  @override
  String get missionNumberOrder => 'Zahlenreihenfolge';

  @override
  String get missionNumberOrderDescription =>
      'Tippe die Zahlen von 1 bis 9 in der richtigen Reihenfolge an.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Nächste: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Position merken';

  @override
  String get missionHiddenButtonDescription =>
      'Merke dir die beleuchteten Kacheln in der Reihenfolge und tippe sie innerhalb von 10 Sekunden an.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Tipp-Sprint';

  @override
  String get missionTapSprintDescriptionShort =>
      'Tippen, um die Anzeige zu füllen.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Tippe $goalTaps+ Mal, um die Anzeige zu füllen.';
  }

  @override
  String get missionTapSprintTapHere => 'Tippen';

  @override
  String get missionTapSprintHint =>
      'Füllt sich schnell, leert sich bei Pause.';

  @override
  String get missionLeftRight => 'Links / Rechts';

  @override
  String get missionLeftRightDescriptionShort =>
      'Folge der Aufforderung und wähle links oder rechts.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'Erreiche $targetStreak Richtige in Folge.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Tippe LINKS';

  @override
  String get missionLeftRightPromptRight => 'Tippe RECHTS';

  @override
  String get left => 'Links';

  @override
  String get right => 'Rechts';

  @override
  String get missionHintInactivity =>
      'Wenn du 2 Minuten aufhörst, wird zurückgesetzt.';

  @override
  String fortuneCatchScore(int score) {
    return 'Punktzahl: $score';
  }

  @override
  String get fortuneCatchGoal => 'Ziel: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(Fänge: $count/$min)';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo Combo!';
  }

  @override
  String get difficulty => 'Schwierigkeit';

  @override
  String get difficultyEasy => 'Einfach';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyHard => 'Schwer';

  @override
  String get problemCount => 'Anzahl der Aufgaben';

  @override
  String problemsCount(int count) {
    return '$count Aufgaben';
  }

  @override
  String get shakeCount => 'Schüttelanzahl';

  @override
  String shakeTimes(int count) {
    return '$count Mal';
  }

  @override
  String missionNumber(int number) {
    return 'Mission $number';
  }

  @override
  String get soundBirds => 'Vogelgezwitscher';

  @override
  String get shakeCountLabel => 'Anzahl Schütteln';

  @override
  String missionIndex(int index) {
    return 'Mission $index';
  }

  @override
  String get ringtoneSelect => 'Klingelton auswählen';

  @override
  String get vibrationSelect => 'Vibrationsmuster auswählen';

  @override
  String get defaultRingtone => 'Standardklingelton';

  @override
  String get classicAlarm => 'Klassischer Wecker';

  @override
  String get digitalAlarm => 'Digitaler Wecker';

  @override
  String get birdsSound => 'Vögel zwitschern';

  @override
  String get wavesSound => 'Meereswellen';

  @override
  String get defaultVibration => 'Standardvibration';

  @override
  String get shortVibration => 'Kurze Wiederholung';

  @override
  String get longVibration => 'Lange Wiederholung';

  @override
  String get heartbeatVibration => 'Herzschlag';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'Schneller Takt';

  @override
  String get permissionRequired => 'Berechtigung erforderlich';

  @override
  String get exactAlarmPermissionDesc =>
      'Damit der Wecker zur genauen Zeit klingelt, ist die Berechtigung \"Zeitpläne & Erinnerungen\" erforderlich.';

  @override
  String get batteryOptimizationPermissionDesc =>
      'Die Batterieoptimierung muss deaktiviert sein, damit der Wecker pünktlich klingelt.';

  @override
  String get overlayPermissionDesc =>
      'Um den Missionsbildschirm anzuzeigen, wenn der Wecker klingelt, ist die Berechtigung \"Über anderen Apps anzeigen\" erforderlich.';

  @override
  String get cameraMissionFirstImageError =>
      'Bitte lege mindestens das erste Missionsbild fest.';

  @override
  String get cameraMissionSequentialImageError =>
      'Bitte lege die Missionsbilder der Reihe nach fest.';

  @override
  String errorOccurred(String error) {
    return 'Fehler aufgetreten: $error';
  }

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get exactAlarmPermissionFail =>
      'Wecker konnte nicht registriert werden. Die Berechtigung für exakten Wecker ist deaktiviert und muss eingestellt werden.';

  @override
  String get batteryOptimizationPermissionFail =>
      'Wecker konnte nicht registriert werden. Die Berechtigung zur Ausnahme von der Batterieoptimierung fehlt und muss eingestellt werden.';

  @override
  String get overlayPermissionFail =>
      'Wecker konnte nicht registriert werden. Die Berechtigung \"Über anderen Apps anzeigen\" fehlt und muss eingestellt werden.';

  @override
  String get unknownAlarmError =>
      'Wecker konnte nicht registriert werden. Ein unbekannter Fehler ist aufgetreten.';

  @override
  String get resetTooltip => 'Zurücksetzen';

  @override
  String get errorLoadingAlarm =>
      'Weckerinformationen konnten nicht geladen werden.';

  @override
  String get alarmNotFound => 'Weckerinformationen nicht gefunden.';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'Schlummerwecker ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'Wecker ausschalten';

  @override
  String get startMission => 'Mission starten';

  @override
  String get alarmSnooze => 'Schlummern';

  @override
  String get fortuneTitle => 'Glück prüfen';

  @override
  String get fortuneMessage =>
      'Prüfe deine Glücksergebnisse\nund erhalte versteckte Geschenke!';

  @override
  String get fortuneAdButton => 'Werbung ansehen und Ergebnisse prüfen';

  @override
  String get fortuneLoadingMessage =>
      'Erlebe die spezielle Tarot-Interpretation des Wahrsagers.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Analysiere dein gewähltes Tarot... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Denke an die heutige Energie\nund wähle 3 Karten.';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return 'Denke an die Energie vom $month/$day\nund wähle 3 Karten.';
  }

  @override
  String get fortuneNewYearButton => 'Neujahrsglück 2026 ansehen';

  @override
  String get loveFortune => 'Liebe';

  @override
  String get wealthFortune => 'Reichtum';

  @override
  String get successFortune => 'Erfolg';

  @override
  String get fortuneResultTitle => 'Hier ist dein Glücksergebnis für heute.';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return 'Glück für $year/$month/$day';
  }

  @override
  String get startDayButton => 'Starte deinen Tag';

  @override
  String get policy => 'Bedingungen und Datenschutz';

  @override
  String get support => 'Support';

  @override
  String get defaultAlarmBehavior => 'Standard-Weckerverhalten';

  @override
  String get defaultAlarmVolume => 'Standard-Weckerlautstärke';

  @override
  String get defaultAlarmVolumeDescription =>
      'Die Standardlautstärke, die beim Erstellen eines neuen Weckers angewendet wird.';

  @override
  String get gradualVolumeDescription =>
      'Stellt den Weckerton so ein, dass er allmählich ansteigt.';

  @override
  String get defaultVibrationDescription =>
      'Aktiviert die Vibration standardmäßig beim Erstellen eines neuen Weckers.';

  @override
  String get defaultInterval => 'Standardintervall';

  @override
  String get maxSnoozeCountLabel => 'Max. Schlummeranzahl';

  @override
  String get minutes => 'Min';

  @override
  String get times => 'Mal';

  @override
  String cupsCount(int current, int goal) {
    return '($current/$goal Tassen)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current/$goal Mal)';
  }

  @override
  String get missionGym => 'Ins Fitnessstudio gehen';

  @override
  String get missionWorkout => 'Heimtraining';

  @override
  String get missionDiary => 'Tagebuch schreiben';

  @override
  String get missionBedMaking => 'Bett machen';

  @override
  String get missionStretching => 'Dehnen';

  @override
  String get missionReading => '10 Min lesen';

  @override
  String get missionPlanning => 'Tag planen';

  @override
  String get missionBreakfast => 'Frühstück essen';

  @override
  String get missionMeditation => '5 Min Meditation';

  @override
  String get missionLearnWords => '5 Wörter lernen';

  @override
  String get missionVentilation => 'Lüften';

  @override
  String get missionCleaning => 'Zimmer aufräumen';

  @override
  String get missionGratitudeDiary => 'Dankbarkeitstagebuch';

  @override
  String get faqQuestion1 => 'Wecker klingeln nicht.';

  @override
  String get faqAnswer1 =>
      'Wecker können aufgrund der Batterieoptimierungsfunktion des Android-Systems verzögert oder blockiert sein. Bitte setzen Sie alle Berechtigungen im Menü Einstellungen > Weckeroptimierung auf \'Zulassen\'.';

  @override
  String get faqQuestion2 => 'Ich möchte die Mission ändern.';

  @override
  String get faqAnswer2 =>
      'Sie können sie im Missionsauswahlmenü ändern (Mathe, Foto, Schütteln usw.), nachdem Sie den zu bearbeitenden Wecker in der Weckerliste angetippt haben.';

  @override
  String get faqQuestion3 => 'Wie stelle ich den Dunkelmodus ein?';

  @override
  String get faqAnswer3 =>
      'Sie können das Bildschirmthema über den Schalter Einstellungen > Allgemein > Dunkelmodus ändern.';

  @override
  String get faqQuestion4 => 'Wie sammle ich Glückskekse?';

  @override
  String get faqAnswer4 =>
      'Sie können jedes Mal Glückskekse verdienen, wenn Sie morgens einen Wecker ausschalten oder eine Mission abschließen. Prüfen Sie Ihr tägliches Glück mit den gesammelten Keksen!';

  @override
  String get faqQuestion5 =>
      'Verschwinden meine Daten, wenn ich die App lösche?';

  @override
  String get faqAnswer5 =>
      'Ja, Fortune Alarm speichert Daten auf dem Gerät, sodass durch das Löschen der App alle Ihre eingestellten Wecker und Missionsaufzeichnungen gelöscht werden. Bitte seien Sie vorsichtig.';

  @override
  String get noticeLabel => 'Hinweis';

  @override
  String get notice1Title => 'Offizieller Start von Fortune Alarm';

  @override
  String get notice1Content =>
      'Hallo. Fortune Alarm wurde offiziell gestartet.\\n\\nPrüfen Sie jeden Morgen Ihr tägliches Glück mit Ihrem Wecker und beginnen Sie einen glücklichen Tag!\\nWir werden weiterhin vielfältigere Funktionen und verbesserte Dienste anbieten.\\n\\nVielen Dank.';

  @override
  String get notice2Title => 'Update-Neuigkeiten Version 1.0.0';

  @override
  String get notice2Content =>
      'Hier ist der Inhalt des Updates auf Version 1.0.0.\\n\\n1. Verbesserung der Benutzeroberfläche für Nahrungsergänzungsmittel-Missionen\\n2. Integration der Systemeinstellungen für genaue Wecker\\n3. Unterstützung des Dunkelmodus\\n4. Fehlerbehebungen und Stabilitätsverbesserungen\\n\\nErleben Sie jetzt die neueste Version!';

  @override
  String get notice3Title =>
      'Hinweis zur Überarbeitung der Nutzungsbedingungen';

  @override
  String get notice3Content =>
      'Die Nutzungsbedingungen wurden überarbeitet.\\n\\nWichtige Änderungen:\\n- Verschärfte Datenschutzrichtlinie\\n- Festgelegter Dienstnutzungsumfang\\n\\nDetails finden Sie auf der Seite Einstellungen > Bedingungen.';

  @override
  String get supportContentTitle => 'Anfrageinhalt';

  @override
  String get supportHint => 'Bitte geben Sie den Inhalt ein.';

  @override
  String get supportRecipient => 'Empfänger (Kundensupport)';

  @override
  String get emailCopied => 'E-Mail-Adresse kopiert.';

  @override
  String get copyTooltip => 'Kopieren';

  @override
  String get supportWorkingDays =>
      'Wir werden versuchen, an Werktagen innerhalb von 24 Stunden zu antworten.';

  @override
  String get supportEmptyError => 'Bitte geben Sie den Inhalt ein.';

  @override
  String get supportSubjectPrefix => 'Anfragetitel';

  @override
  String get supportContentPrefix => 'Anfrageinhalt';

  @override
  String get supportCopySuccessTitle => 'Anfrage kopiert';

  @override
  String supportCopySuccessMessage(String email) {
    return 'Der Anfrageinhalt wurde in die Zwischenablage kopiert.\\nMöchten Sie eine E-Mail an $email senden?';
  }

  @override
  String get copyEmailAction => 'E-Mail-Adresse kopieren';

  @override
  String get copyEmailSuccessMessage =>
      'E-Mail-Adresse kopiert. Bitte fügen Sie sie in Ihre E-Mail-App ein.';

  @override
  String get supportSubmitButton => 'Anfrage kopieren und senden';

  @override
  String get shakePhone => 'Bitte schütteln Sie Ihr Telefon!';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get fortuneCheckButton => 'Glück prüfen';

  @override
  String get fortuneSelectCards => 'Wähle 3 Karten';

  @override
  String get fortuneDragCards => 'Ziehe und wähle 3 Karten';

  @override
  String get fortuneDetailTitle => 'Detaillierte Interpretation';

  @override
  String get labelFineDust => 'Feinstaub';

  @override
  String get labelUltraFineDust => 'Ultra-Feinstaub';

  @override
  String get weatherToday => 'Heutiges Wetter';

  @override
  String get weatherUpdateMessage =>
      'Wetterinformationen für den aktuellen Standort werden aktualisiert.';

  @override
  String get weatherDisclaimer =>
      'Beobachtete Daten können je nach lokalen Bedingungen oder Empfangsstatus variieren.';

  @override
  String get weatherSource =>
      'Wetterdaten bereitgestellt von vertrauenswürdigen Diensten';

  @override
  String get locationPermissionTitle => 'Standortberechtigung zulassen';

  @override
  String get locationPermissionDesc =>
      'Erforderlich, um Wetterinformationen anzuzeigen.';
}
