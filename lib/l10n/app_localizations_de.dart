// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Glücksalarm';

  @override
  String get morningGreeting => 'Guten Morgen! Starte gut in deinen Tag.';

  @override
  String get missionWakeUp => 'Aufwach-Mission';

  @override
  String get missionSupplement => 'Nahrungsergänzung einnehmen';

  @override
  String get missionWater => 'Mindestens 2 Liter Wasser trinken';

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
  String get dailyFortuneCookieReward => 'Täglicher Glückskeks-Bonus';

  @override
  String get missionRewardInfo => '1 Keks für 5 Missionen, 2 für 10!';

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
  String get myMissionRecord => 'Meine Statistik';

  @override
  String get consecutiveSuccess => 'Tage in Folge';

  @override
  String get successRate30Days => 'Erfolgsrate (30 Tage)';

  @override
  String get totalSuccess => 'Gesamterfolge';

  @override
  String get inProgress => 'In Arbeit 🔥';

  @override
  String get resetMissions => 'Zurücksetzen';

  @override
  String get resetMissionsConfirm =>
      'Möchtest du alle Herausforderungen zurücksetzen?\n(System-Missionen ausgenommen)';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get addMission => 'Hinzufügen';

  @override
  String get completedMissions => 'Abgeschlossen';

  @override
  String get noCompletedMissionsHint => 'Noch keine Missionen abgeschlossen.';

  @override
  String greeting(String userName) {
    return 'Hallo, $userName';
  }

  @override
  String get welcomeFortune => 'Willkommen in der Welt des Glücks';

  @override
  String get luckyColor => 'Glücksfarbe';

  @override
  String get luckyItem => 'Glücksgegenstand';

  @override
  String get luckyDirection => 'Glücksrichtung';

  @override
  String get viewVariousFortunes => 'Verschiedene Horoskope';

  @override
  String get todaysRecommendation => 'Heutige Empfehlung';

  @override
  String get checkTodaysFortune => 'Tageshoroskop ansehen';

  @override
  String get todaysAdvice => 'Tipp des Tages';

  @override
  String get viewSpecificDateFortune => 'Horoskop für ein bestimmtes Datum';

  @override
  String get luckyNumberRecommendation => 'Glückszahlen des Tages';

  @override
  String get luckyNumber => 'Glückszahl';

  @override
  String get specificDateFortune => 'Horoskop für ein bestimmtes Datum';

  @override
  String get specialDayFortune => 'Besondere Tage';

  @override
  String get newYearFortune => 'Neujahrshoroskop';

  @override
  String get totalFortune2026 => 'Jahresglück 2026';

  @override
  String get traditionalFortune => 'Traditionelle Deutung (Tojeong)';

  @override
  String get traditionalSaju => 'Traditionelle Saju-Analyse';

  @override
  String get faceReading => 'KI-Gesichtsdeutung';

  @override
  String get missionFaceReading => 'Gesichtsanalyse-Mission';

  @override
  String get faceFate => 'Gesichtsausdruck';

  @override
  String get compatibility => 'Kompatibilität';

  @override
  String get relationshipHarmony => 'Beziehungsharmonie';

  @override
  String get ohaengWood => 'Holz';

  @override
  String get ohaengFire => 'Feuer';

  @override
  String get ohaengEarth => 'Erde';

  @override
  String get ohaengMetal => 'Metall';

  @override
  String get ohaengWater => 'Wasser';

  @override
  String get ohaengWoodSymbol => 'Holz';

  @override
  String get ohaengFireSymbol => 'Feuer';

  @override
  String get ohaengEarthSymbol => 'Erde';

  @override
  String get ohaengMetalSymbol => 'Metall';

  @override
  String get ohaengWaterSymbol => 'Wasser';

  @override
  String get ohaengWoodExplanation =>
      'Mit einer starken Energie von Holz sind Sie voller Wachstum und Motivation, besitzen eine mitfühlende und unternehmungslustige Natur.';

  @override
  String get ohaengFireExplanation =>
      'Mit einer starken Energie von Feuer sind Sie leidenschaftlich und höflich, neigen dazu, aktiv zu sein und lieben glamouröse Dinge.';

  @override
  String get ohaengEarthExplanation =>
      'Mit einer starken Energie von Erde haben Sie Vertrauen und Toleranz, besitzen eine ernste und unveränderliche Natur.';

  @override
  String get ohaengMetalExplanation =>
      'Mit einer starken Energie von Metall haben Sie Entschlossenheit und Loyalität, besitzen eine kühle Natur, die Prinzipien schätzt.';

  @override
  String get ohaengWaterExplanation =>
      'Mit einer starken Energie von Wasser haben Sie Weisheit und Flexibilität, besitzen eine kluge und sehr anpassungsfähige Natur.';

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
  String get jijiJa => 'Ja';

  @override
  String get jijiChuk => 'Chuk';

  @override
  String get jijiIn => 'In';

  @override
  String get jijiMyo => 'Myo';

  @override
  String get jijiJin => 'Jin';

  @override
  String get jijiSa => 'Sa';

  @override
  String get jijiO => 'O';

  @override
  String get jijiMi => 'Mi';

  @override
  String get jijiSin => 'Sin';

  @override
  String get jijiYu => 'Yu';

  @override
  String get jijiSul => 'Sul';

  @override
  String get jijiHae => 'Hae';

  @override
  String get jijiAnimalRat => 'Ratte';

  @override
  String get jijiAnimalOx => 'Ochse';

  @override
  String get jijiAnimalTiger => 'Tiger';

  @override
  String get jijiAnimalRabbit => 'Hase';

  @override
  String get jijiAnimalDragon => 'Drache';

  @override
  String get jijiAnimalSnake => 'Schlange';

  @override
  String get jijiAnimalHorse => 'Pferd';

  @override
  String get jijiAnimalSheep => 'Schaf';

  @override
  String get jijiAnimalMonkey => 'Affe';

  @override
  String get jijiAnimalRooster => 'Hahn';

  @override
  String get jijiAnimalDog => 'Hund';

  @override
  String get jijiAnimalPig => 'Schwein';

  @override
  String get assetDefaultBackground => 'Standard';

  @override
  String get assetFortuneyFriends => 'Fortuney Freunde';

  @override
  String get assetMongchuny => 'Mongchuny';

  @override
  String get assetPanchuny => 'Panchuny';

  @override
  String get assetTochuny => 'Tochuny';

  @override
  String get assetHochuny => 'Hochuny';

  @override
  String get assetBear => 'Bär';

  @override
  String get assetMoon => 'Mond';

  @override
  String get assetBridge => 'Brücke';

  @override
  String get assetRoad => 'Straße';

  @override
  String get assetSky => 'Himmel';

  @override
  String get assetMinimalGray => 'Grau';

  @override
  String get assetDarkMode => 'Dunkel';

  @override
  String get assetSoftBlue => 'Blau';

  @override
  String get assetWarmBeige => 'Beige';

  @override
  String assetCat(int number) {
    return 'Katze $number';
  }

  @override
  String assetDog(int number) {
    return 'Hund $number';
  }

  @override
  String assetSea(int number) {
    return 'Meer $number';
  }

  @override
  String get categoryCharacter => 'Charakter';

  @override
  String get categoryAnimal => 'Tier';

  @override
  String get categoryIllustration => 'Illustration';

  @override
  String get categoryLandscape => 'Landschaft';

  @override
  String get categorySimple => 'Einfach';

  @override
  String get alarmBackground => 'Wecker-Hintergrund';

  @override
  String get random => 'Zufällig';

  @override
  String get gallery => 'Galerie';

  @override
  String get selectSolidColor => 'Einfarbige Farbe wählen';

  @override
  String get deleteColor => 'Farbe löschen';

  @override
  String get deleteColorConfirm =>
      'Sind Sie sicher, dass Sie diese Farbe aus der Liste löschen möchten?';

  @override
  String get randomBackgroundDesc =>
      'Jedes Mal ein neuer Hintergrund, wenn der Wecker klingelt!';

  @override
  String get backgroundDeleted => 'Hintergrundbild gelöscht.';

  @override
  String get pickFromDevice => 'Vom Gerät auswählen';

  @override
  String get alarmSaveError =>
      'Fehler beim Speichern des Weckers. Ein unbekannter Fehler ist aufgetreten.';

  @override
  String errorOccurred(String error) {
    return 'Fehler aufgetreten: $error';
  }

  @override
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get videoLoadFailed =>
      'Video konnte nicht geladen werden\nZum Wiederholen tippen';

  @override
  String get itsTimeToWakeUp => 'Zeit aufzustehen!';

  @override
  String get dismissAlarm => 'Wecker ausschalten';

  @override
  String get slideToDismiss => 'Zum Ausschalten schieben';

  @override
  String snoozeInfo(int minutes, int count) {
    return '$minutes Min, $count Mal';
  }

  @override
  String snoozeInfoUnlimited(int minutes) {
    return '$minutes Min, unbegrenzt';
  }

  @override
  String get noActiveAlarms => 'Keine aktiven Wecker';

  @override
  String get wealth => 'Wohlstand';

  @override
  String get love => 'Beziehung';

  @override
  String get career => 'Karriere';

  @override
  String get health => 'Gesundheit';

  @override
  String get faceAnalysisBasic => 'Gesichtsanalyse (Basis)';

  @override
  String get insufficientDataOverallImpression =>
      'Unzureichende Messdaten, basierend auf dem Gesamteindruck interpretiert.';

  @override
  String get noseStabilityWealthAccuracy =>
      'Stabilität in der Nasenkontur erhöht die Genauigkeit der Wohlstandsinterpretation.';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      'Klarheit in der Mundkontur verfeinert die Interpretation von zwischenmenschlichem und sprachlichem Glück.';

  @override
  String get improveAnalysisQualityAdvice =>
      'Hellere Beleuchtung und nach vorne schauen verbessern die Analysequalität.';

  @override
  String get basicAnalysisDescription =>
      'Dieses Ergebnis wird aufgrund unzureichender Gesichtskontur-/Ausdrucksmessung als Basisinterpretation angezeigt.\nStabilität in Indikatoren wie Augenöffnung, Nasenkontur und Mundbereich verbessert sich bei Blick nach vorne und besserer Beleuchtung.\nWiederholen macht die Score-Verteilungen und Beschreibungen spezifischer.';

  @override
  String get defaultDailyFortune =>
      'Heute ist ein guter Tag, um mit einem friedlichen Geist zu beginnen.\nFüllen Sie sich mit positiver Energie mit einem Lächeln im Spiegel.\nEin wenig Freizeit bringt unerwartetes Glück.';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '${vibe}Heute sticht Ihr $topKey-Glück am meisten hervor. Auf der anderen Seite scheint $bottomKey sorgfältige Aufmerksamkeit zu erfordern.';
  }

  @override
  String get faceShapeVLine => 'V-Linie';

  @override
  String get faceShapeSquare => 'Quadratisch';

  @override
  String get faceShapeBalanced => 'Ausgewogen';

  @override
  String get faceShapeRound => 'Rund';

  @override
  String get faceShapeLong => 'Lang';

  @override
  String get faceShapeOval => 'Oval';

  @override
  String get titleWealthOriented => 'Wohlstandsorientiertes Gesicht';

  @override
  String get titleLoveStrong => 'Gesicht mit starkem Beziehungsglück';

  @override
  String get titleCareerNotable => 'Gesicht mit bemerkenswertem Karriereglück';

  @override
  String get titleStableEnergy => 'Gesicht mit stabiler Energie';

  @override
  String get faceAnalysisComplete => 'Analyse abgeschlossen!';

  @override
  String get chooseUnlockMethod =>
      'Wählen Sie eine Methode,\num Ihr Ergebnis freizuschalten.';

  @override
  String get watchAdForFreeResult => 'Anzeige ansehen (kostenlos)';

  @override
  String get useTwoCookies => '2 Glückskekse verwenden';

  @override
  String get checkResult => 'Ergebnis prüfen';

  @override
  String get aiAnalyzingFace => 'KI analysiert Ihr Gesicht...';

  @override
  String get faceRecognitionComplete => 'Gesicht erkannt';

  @override
  String get extractingFeatures => 'Merkmale werden extrahiert...';

  @override
  String get matchingFortuneData => 'Daten werden abgeglichen...';

  @override
  String get adLoadFailedFreeUnlock =>
      'Anzeige konnte nicht geladen werden. Freischaltung erfolgt kostenlos.';

  @override
  String get insufficientCookies => 'Zu wenig Kekse';

  @override
  String get insufficientCookiesDesc =>
      'Du hast nicht genug Glückskekse.\nSieh dir eine Anzeige an, um das Ergebnis kostenlos zu sehen!';

  @override
  String get usingTwoCookiesToast => '2 Glückskekse verwendet.';

  @override
  String get todaysFaceAnalysis => 'Heutige Gesichtsanalyse';

  @override
  String totalScoreWithPoints(int score) {
    return 'Gesamtpunktzahl: $score Pkt';
  }

  @override
  String get adLoadFailFreeAccess =>
      'Anzeige konnte nicht geladen werden. Zugriff ist diesmal kostenlos.';

  @override
  String get insufficientCookiesTitle => 'Zu wenig Glückskekse';

  @override
  String get insufficientCookiesMessage =>
      'Du hast nicht genug Glückskekse.\nVerdiene mehr durch Missionen oder sieh dir eine Anzeige an.';

  @override
  String get useCookiesSnackbar => '2 Glückskekse wurden verwendet.';

  @override
  String get faceAnalysisComplete_v2 => 'Gesichtsanalyse abgeschlossen!';

  @override
  String get chooseMethodToViewResult =>
      'Wähle eine Methode, um dein Ergebnis freizuschalten.';

  @override
  String get watchAdForFree => 'Anzeige ansehen (kostenlos)';

  @override
  String get useTwoCookies_v2 => '2 Kekse verwenden';

  @override
  String get viewResult => 'Ergebnis anzeigen';

  @override
  String get aiAnalyzingFace_v2 => 'KI analysiert dein Gesicht...';

  @override
  String get faceRecognitionComplete_v2 => 'Erkennung abgeschlossen';

  @override
  String get extractingFeatures_v2 => 'Merkmale werden extrahiert...';

  @override
  String get matchingFortuneData_v2 => 'Daten werden abgeglichen...';

  @override
  String get wealthLuck => '💰 Finanzen';

  @override
  String get loveLuck => '❤️ Liebe';

  @override
  String get careerLuck => '💼 Karriere';

  @override
  String get healthLuck => '💪 Gesundheit';

  @override
  String get tojeongMonthlyGood_0 =>
      'Eine edle Person aus dem Osten bringt gute Nachrichten. Lang erwartete Pläne werden in Erfüllung gehen.';

  @override
  String get tojeongMonthlyGood_1 =>
      'Wohlstand fließt wie eine Quelle herein. Sorgen verschwinden, da alles reibungslos verläuft.';

  @override
  String get tojeongMonthlyGood_2 =>
      'Bemühungen tragen Früchte und Sie erhalten Glückwünsche. Beförderung oder großartige Ergebnisse werden erwartet.';

  @override
  String get tojeongMonthlyGood_3 =>
      'Die Morgensonne geht nach einer dunklen Nacht auf. Härte endet und Glück kommt an.';

  @override
  String get tojeongMonthlyGood_4 =>
      'Unerwarteter Gewinn füllt Ihre Tasche. Kleine Investitionen führen zu großen Gewinnen.';

  @override
  String get tojeongMonthlyNeutral_0 =>
      'Ein friedlicher Alltag geht weiter. Er vergeht ohne besondere Ereignisse.';

  @override
  String get tojeongMonthlyNeutral_1 =>
      'Zufriedenheit bringt Seelenfrieden. Genießen Sie kleines Glück.';

  @override
  String get tojeongMonthlyNeutral_2 =>
      'Gönnen Sie sich eine Pause in Ihrem geschäftigen Leben. Achten Sie auf das Gesundheitsmanagement.';

  @override
  String get tojeongMonthlyNeutral_3 =>
      'Behalten Sie Ihre aktuelle Arbeit bei, anstatt etwas Neues zu beginnen.';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'Kommunikation ist der Schlüssel. Seien Sie vorsichtig mit Worten, um Missverständnisse zu vermeiden.';

  @override
  String get tojeongMonthlyCaution_0 =>
      'Seien Sie in allem vorsichtig. Sicher ist sicher.';

  @override
  String get tojeongMonthlyCaution_1 =>
      'Achten Sie auf Ihre Gesundheit und vermeiden Sie Überanstrengung.';

  @override
  String get tojeongMonthlyCaution_2 =>
      'Vermeiden Sie Klatsch und halten Sie sich aus den Angelegenheiten anderer heraus.';

  @override
  String get tojeongMonthlyCaution_3 =>
      'Übermäßige Gier bringt Ärger. Leben Sie innerhalb Ihrer Möglichkeiten.';

  @override
  String get tojeongMonthlyCaution_4 =>
      'Vermeiden Sie Geldtransaktionen, da Sie von Menschen, denen Sie vertrauen, enttäuscht werden könnten.';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      'Mit der klaren Energie des neuen Jahres wird alles reibungslos verlaufen, sobald Sie anfangen, das zu tun, was Sie geplant haben.';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      'Zu Beginn des Jahres erhalten Sie Hilfe von edlen Menschen, also pflegen Sie Ihre Beziehungen zu den Menschen um Sie herum.';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'Wenn Sie zu viel Motivation haben, können Sie Dinge falsch machen. Überprüfen Sie Ihre Pläne ruhig aus einer langfristigen Perspektive.';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      'Gut begonnen ist halb geschafft. Wenn Sie mutig anfangen, etwas zu tun, was Sie aufgeschoben haben, werden Sie unerwartete Ergebnisse erzielen.';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      'Kleine Änderungen in den Gewohnheiten können Ihr Glück verändern. Gewöhnen Sie sich an, früh aufzustehen.';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      'Es ist noch nicht die richtige Zeit, also müssen wir unsere Stärke unter der Oberfläche stärken und nach Möglichkeiten suchen.';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      'Es können alte Probleme oder Konflikte auftauchen. Vermeiden Sie es nicht und packen Sie es direkt an.';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      'Dies ist eine Zeit, in der es wichtiger ist, Substanz aufzubauen als äußere Leistung. Übereilte Bewegungen können Schaden anrichten.';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      'So wie wir am Ende des Winters auf den Frühling warten, eröffnen sich Chancen für diejenigen, die sich geduldig vorbereiten.';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      'Sie müssen ruhig Ihren eigenen Weg gehen, ohne durch den Lärm um Sie herum gestört zu werden.';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      'Die Energie der Revitalisierung aller Dinge bringt Ihnen neue Möglichkeiten. Zögern Sie nicht und nehmen Sie die Herausforderung an.';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      'Dies ist der Monat, in dem eine neue Beziehung beginnen kann. Wenn Sie Menschen mit einer positiven Einstellung behandeln, werden Sie gute Ergebnisse erzielen.';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      'Im Wind der Veränderung verliert man leicht den Fokus. Kontrollieren Sie Ihren Geist, damit Sie nicht von geringfügigen emotionalen Veränderungen beeinflusst werden.';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      'Genau wie ein Spross, der den Boden durchbricht, ist dies die Zeit, in der Ihr Potenzial explodiert. Seien Sie zuversichtlich.';

  @override
  String get tojeongMonthlySpecial_3_4 =>
      'Eine wertvolle Beziehung wird zu Ihnen kommen, also öffnen Sie die Tür Ihres Herzens und heißen Sie Menschen willkommen.';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      'Ihr Wohlstand wird mit warmer Energie wachsen. Die Früchte Ihrer Bemühungen werden zu finanziellen Belohnungen führen.';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      'Sie haben viel Glück mit Dokumenten, sodass Sie bei Verträgen oder Prüfungen gute Ergebnisse erzielen können. Bitte überprüfen Sie es sorgfältig.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      'Es können unerwartete Ausgaben anfallen, daher müssen Sie der Geldverwaltung besondere Aufmerksamkeit schenken.';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      'Dies ist der Monat, in dem Ihre Reize wie Blumen in voller Blüte hervorstechen. Ergreifen Sie die Initiative in zwischenmenschlichen Beziehungen.';

  @override
  String get tojeongMonthlySpecial_4_4 =>
      'Dies ist ein guter Zeitpunkt, um zu investieren oder Ihre Ersparnisse zu erhöhen, denn Sie werden mit Reichtum gesegnet sein.';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      'Da zu Hause eine harmonische Atmosphäre herrscht, werden Sie Freude und Stabilität in den Beziehungen zu Ihrer Familie finden.';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      'Die Freundlichkeit, die Sie Ihren Mitmenschen entgegenbringen, wird als Segen zurückkommen. Die Anhäufung von Tugend hilft, Schwierigkeiten zu lösen.';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'Ein kleines Missverständnis kann zu einem Streit mit einer Ihnen nahestehenden Person führen. Eine umgekehrte Haltung ist erforderlich.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      'Konzentrieren Sie sich im Familienmonat darauf, Zeit mit Ihrer Familie zu verbringen. Harmonie in der Familie ist die Grundlage von allem.';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      'Wenn Sie sich beruhigt umschauen, werden Sie wertvolle Dinge entdecken, die Ihnen entgangen sind.';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      'Ihre Bemühungen werden Früchte tragen und Sie werden Anerkennung von Ihren Mitmenschen erhalten. Es besteht die Möglichkeit einer Beförderung oder Ehrung.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      'Wenn Ihre aktive Energie stärker wird, kann es eine Überlegung wert sein, in ein neues Feld zu expandieren oder den Job zu wechseln.';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'Wenn Sie zu weit gehen, können Sie in Schwierigkeiten geraten. Bleiben Sie bescheiden und schauen Sie sich um.';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      'Bevor die Hitze beginnt, müssen Sie Ihre Ausdauer auffüllen. Es ist auch eine gute Idee, einen Gesundheitscheck durchführen zu lassen.';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      'Nehmen Sie sich Zeit für eine Zwischenbilanz, um das erste Halbjahr abzuschließen und für das zweite Halbjahr zu planen.';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      'Dies ist eine Zeit, in der leidenschaftliche Leidenschaft zu Ergebnissen führt. Wenn Sie mutig voranschreiten, können Sie Ihre Ziele erreichen.';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      'Vielleicht treffen Sie auf Reisen oder beim Umzug einen wertvollen Menschen oder erhalten eine neue Chance.';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      'Dies ist eine Zeit, in der Ihre Gesundheit leicht geschädigt werden kann. Es ist wichtig, Überlastung zu vermeiden und sich ausreichend Ruhe zu gönnen.';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      'Es erfordert unermüdliche Leidenschaft, auch bei sengender Hitze. So viel Sie schwitzen, Sie werden Ergebnisse erzielen.';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      'Nehmen Sie sich Zeit, um durch Ruhe neue Energie zu tanken. Eine lange Reise bringt Glück.';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      'Mit der Zeit beginnt sich die Geduld allmählich zu verbessern. Seien Sie nicht ungeduldig und warten Sie auf Ihre Zeit.';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      'Alte Probleme, die nicht gelöst wurden, finden einen Hinweis. Benutzen Sie Ihren Verstand, um es zu lösen.';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      'Es ist leicht, unvorsichtig zu sein, wenn es um Erfolg geht. Lassen Sie Ihre Anspannung bis zum Schluss nicht los.';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      'Es ist Zeit, den Endspurt vor der fruchtbaren Saison zu machen. Entspannen Sie sich nicht.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      'Es gibt eine unerwartete helfende Hand. Wenn Sie Schwierigkeiten haben, fragen Sie Ihre Mitmenschen um Rat.';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      'Wie die Zeit der reichen Fruchtbarkeit ist es eine Zeit, in der sowohl Reichtum als auch Liebesglück im Überfluss vorhanden sind.';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      'Wenn Sie sich viel Mühe geben, werden Sie bessere Ergebnisse erzielen als erwartet.';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'So wie viel reinkommt, kann auch viel rausgehen. Sie benötigen einen intelligenten Ausgabenplan.';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      'Es ist eine Zeit des Überflusses wie goldene Felder. Wenn Sie ein gebendes Herz haben, werden Ihnen größere Segnungen zuteil.';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      'Dies ist ein guter Zeitpunkt, um eventuelle Missverständnisse oder Konflikte auszuräumen. Streck zuerst deine Hand aus.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      'Ihr Ruhm wird zunehmen und Ihr Name wird weithin bekannt. Sie werden das Vertrauen Ihrer Mitmenschen gewinnen.';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      'Bei intellektuellen Aktivitäten können Sie großartige Ergebnisse erzielen. Dies ist ein guter Zeitpunkt, um sich auf Ihr Studium oder Ihre Forschung zu konzentrieren.';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      'Je höher Ihr Status, desto größer wird Ihre Verantwortung. Sie müssen mit Ihren Worten und Taten vorsichtig sein.';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'Dein Ruhm erhebt sich wie der hohe blaue Himmel. Entfesseln Sie Ihre Fähigkeiten voll und ganz.';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      'Dies ist ein guter Monat, um durch tiefe Kontemplation und Lektüre innere Weisheit zu entwickeln.';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      'Es ist eine Zeit, in der wir Weisheit brauchen, um auf das Jahr zurückzublicken und uns auf die Zukunft vorzubereiten. Durch Reflexion werden Sie auf die nächste Ebene wachsen.';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      'Sie werden finanzielle Stabilität finden, aber Sie sollten keine übermäßigen Investitionen tätigen, um große Gewinne zu erzielen.';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      'Möglicherweise fühlen Sie sich in Ihren Beziehungen einsam. Zunächst müssen Sie sich bemühen, aufgeschlossen auf die Menschen zuzugehen.';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      'Genauso wie Sie Ihren Kragen anpassen, wenn ein kalter Wind weht, müssen Sie auf die Praktikabilität achten und Ihre innere Stärke stärken.';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      'Am Ende des Jahres brauchen wir Weisheit, um auf das zurückzublicken, was uns gefehlt hat, und um uns auf das nächste Jahr vorzubereiten.';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      'Am Ende des Jahres kommt unerwartetes Glück. Erwarten Sie einen finanziellen Gewinn oder gute Nachrichten.';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      'Für Ihre harte Arbeit über einen langen Zeitraum werden Sie belohnt. Es ist der Monat, in dem die Schönheit des Öls geerntet wird.';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      'Häufige Zusammenkünfte können Ihrer Gesundheit schaden oder zu unnötigen Ausgaben führen, daher ist Mäßigung geboten.';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      'Das Ende ist ein neuer Anfang. Beenden Sie das Jahr, indem Sie eine hoffnungsvolle Zukunft planen, anstatt sie zu bereuen.';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      'Wenn Sie das warme Teilen praktizieren, wird Ihnen diese Wärme als Glücksbringer zurückkommen.';

  @override
  String get todaysFaceFortune => 'Heutiges Gesichts-Glück';

  @override
  String get detailedAnalysis => 'Detaillierte Analyse';

  @override
  String get eyeInsight => '👁️ Auge (Einblick)';

  @override
  String get noseWealth => '👃 Nase (Wohlstand)';

  @override
  String get mouthLateLuck => '👄 Mund (Spätes Glück)';

  @override
  String get overallAnalysisTitle => 'Gesamtanalyse';

  @override
  String get shareResultTitle => 'Heutiges Gesichtsergebnis';

  @override
  String shareResultDesc(String title) {
    return 'KI-Gesichtsanalyseergebnis.\n$title';
  }

  @override
  String get shareResultTotalScore => 'Gesamtpunktzahl';

  @override
  String get shareResultWealth => 'Wohlstandsglück';

  @override
  String get shareResultLove => 'Liebesglück';

  @override
  String get shareResultCareer => 'Karriereglück';

  @override
  String get shareResultHealth => 'Gesundheitsglück';

  @override
  String get shareResultText => 'Ergebnis teilen';

  @override
  String get wakeUpComplete => 'Aufwachen abgeschlossen!';

  @override
  String get collapseOptions => 'Optionen einklappen';

  @override
  String get expandOptions => 'Weitere Optionen';

  @override
  String get snoozeAlarm => 'Schlummeralarm';

  @override
  String get interval => 'Intervall';

  @override
  String get maxSnoozeCount => 'Maximale Schlummeranzahl';

  @override
  String get unlimited => 'Unbegrenzt';

  @override
  String get permissionRequired => 'Berechtigung erforderlich';

  @override
  String get exactAlarmFailMessage =>
      'Wecker konnte nicht registriert werden. Die Berechtigung für genaue Wecker ist deaktiviert.';

  @override
  String get batteryOptimFailMessage =>
      'Wecker konnte nicht registriert werden. Die Berechtigung zur Ausnahme von der Batterieoptimierung fehlt.';

  @override
  String get overlayFailMessage =>
      'Wecker konnte nicht registriert werden. Die Berechtigung zum Anzeigen über anderen Apps fehlt.';

  @override
  String get loadingDelay => 'Ladeverzögerung';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get previewFail => 'Vorschau fehlgeschlagen';

  @override
  String get bgDefault => 'Standardhintergrund';

  @override
  String get bgFortuneFriends => 'Glücksfreunde';

  @override
  String get bgMongChuni => 'Mongchuni';

  @override
  String get bgPanChuni => 'Panchuni';

  @override
  String get bgToChuni => 'Tochuni';

  @override
  String get bgHoChuni => 'Hochuni';

  @override
  String get bgBear => 'Bär';

  @override
  String get bgMoon => 'Mond';

  @override
  String get bgSea => 'Meer';

  @override
  String get bgBridge => 'Brücke';

  @override
  String get bgRoad => 'Straße';

  @override
  String get bgSky => 'Himmel';

  @override
  String get bgMinimalGray => 'Minimalistisches Grau';

  @override
  String get bgDarkMode => 'Dunkelmodus';

  @override
  String get bgSoftBlue => 'Zartes Blau';

  @override
  String get bgWarmBeige => 'Warmes Beige';

  @override
  String get dateFormatMdyE => 'd. MMM (E)';

  @override
  String get deleteAlarm => 'Wecker löschen';

  @override
  String get confirmDelete => 'Möchten Sie wirklich löschen?';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get wealthLuckWithIcon => '💰 Wohlstandsglück';

  @override
  String get loveLuckWithIcon => '❤️ Liebesglück';

  @override
  String get careerLuckWithIcon => '💼 Karriereglück';

  @override
  String get healthLuckWithIcon => '💪 Gesundheitsglück';

  @override
  String get mouthFortune => '👄 Mund (Reifeglück)';

  @override
  String get comprehensiveAnalysis => 'Umfassende Analyse';

  @override
  String get todaysFaceResult => 'Heutiges Gesichtsanalyseergebnis';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'Dies ist das KI-Gesichtsanalyseergebnis.\n$title';
  }

  @override
  String get shareResult => 'Ergebnis teilen';

  @override
  String get faceVibeSmile0 =>
      'Das strahlende Lächeln auf Ihren Lippen verbreitet positive Energie um Sie herum.';

  @override
  String get faceVibeSmile1 =>
      'Durch das strahlend blühende Lächeln ist die helle Energie von heute spürbar.';

  @override
  String get faceVibeSmile2 =>
      'Die weiche Mundlinie verströmt eine attraktive Energie, die nach edlen Helfern ruft.';

  @override
  String get faceVibeSmile3 =>
      'Ein selbstbewusstes Lächeln wird der Schlüssel sein, um heute alle Hindernisse leicht zu lösen.';

  @override
  String get faceVibeSmile4 =>
      'Dank des erfrischenden Lächelns wird blockierte Energie geklärt und das Glück ist bereit zu kommen.';

  @override
  String get faceVibeEye0 =>
      'Aus den funkelnden Augen ist ein starker Wille zu spüren, den heutigen Tag zu führen.';

  @override
  String get faceVibeEye1 =>
      'Die scharfen Augen sagen ein scharfes Urteilsvermögen und Intuition voraus.';

  @override
  String get faceVibeEye2 =>
      'Klare und tiefe Augen warten mit aufrichtiger Energie auf gute Nachrichten.';

  @override
  String get faceVibeEye3 =>
      'Ein würdevoller Blick, der geradeaus starrt, wird heute Ihre Präsenz erhöhen.';

  @override
  String get faceVibeEye4 =>
      'Die Leidenschaft in Ihren Augen ist ein Tag, der den Menschen um Sie herum starkes Vertrauen einflößt.';

  @override
  String get faceVibeNeutral0 =>
      'Insgesamt bringt die friedliche und stabile Gesichtsenergie Seelenfrieden.';

  @override
  String get faceVibeNeutral1 =>
      'Ein ruhiger Teint zeigt umsichtige und weise Energie.';

  @override
  String get faceVibeNeutral2 =>
      'Die Harmonie des ausgeglichenen Gesichts symbolisiert die Flachheit des heutigen Tages ohne Höhen und Tiefen.';

  @override
  String get faceVibeNeutral3 =>
      'Ein Gesicht mit einer ernsten Atmosphäre ist optimal für wichtige Entscheidungen heute.';

  @override
  String get faceVibeNeutral4 =>
      'Komfortable Gesichtsenergie gibt den Menschen um Sie herum Beruhigung, so dass die Zusammenarbeit gut verlaufen wird.';

  @override
  String get dailyFortuneWealth0 =>
      'Die Energie der Nase ist solide, so dass kleine Organisation und Verifizierung den Geldfluss vergrößern werden.';

  @override
  String get dailyFortuneWealth1 =>
      'Es ist ein Tag, an dem Kraft in den Wohlstandspalast (Nase) gesteckt wird. Je dringender es ist, desto mehr Gewinn bleibt, wenn Sie noch einmal nachrechnen.';

  @override
  String get dailyFortuneWealth2 =>
      'Die Energie der Nase, das Zentrum des Gesichts, ist gut, so dass eine sorgfältig ergriffene Sache zu unerwarteten Ergebnissen führt.';

  @override
  String get dailyFortuneWealth3 =>
      'Es ist ein Teint mit Wohlstandsglück. Es ist ein Fluss, in dem kleine Gewinne an unerwarteten Stellen auftreten können.';

  @override
  String get dailyFortuneWealth4 =>
      'Die Vitalität der Nasenspitze ist gut, so dass der wirtschaftliche Sinn scharf wird. Es ist ein vorteilhafter Tag für Investitions- oder Kaufentscheidungen.';

  @override
  String get dailyFortuneWealth5 =>
      'Die Energie, die nach Geld ruft, ist stark. Glück folgt, wenn Sie Ihren Geldbeutel organisieren oder Ihre Kontoauszüge überprüfen.';

  @override
  String get dailyFortuneWealth6 =>
      'Es ist ein Gesicht, in dem das Wohlstandslager zuverlässig gefüllt ist. Aufrichtige Bemühungen beginnen Früchte zu tragen.';

  @override
  String get dailyFortuneWealth7 =>
      'Stabiles Wohlstandsglück kommt herein. Kontinuierliche Einsparungen statt großer Ausgaben erhöhen das Glück mehr.';

  @override
  String get dailyFortuneWealth8 =>
      'Augen, die wirtschaftliche Möglichkeiten einfangen, werden hell. Hören Sie auf Informationen in Ihrer Umgebung.';

  @override
  String get dailyFortuneWealth9 =>
      'Wohlhabende Energie ist voll in Ihrem Gesicht. Es ist ein geheimnisvoller Tag, an dem ein schenkendes Herz als größerer Reichtum zurückkehrt.';

  @override
  String get dailyFortuneLove0 =>
      'Die Energie der Mundwinkel ist weich. Wenn Sie zuerst ein Wort sagen, wird sich die Beziehung lockern.';

  @override
  String get dailyFortuneLove1 =>
      'Die Mundlinie, die Worte enthält, ist ordentlich. Wenn Sie Ihre Aufrichtigkeit zeigen, werden Missverständnisse reduziert.';

  @override
  String get dailyFortuneLove2 =>
      'Ein heller Teint zieht die Energie edler Helfer an. Kleine Rücksichtnahme kehrt als große Verbindung zurück.';

  @override
  String get dailyFortuneLove3 =>
      'Es ist ein Tag, an dem der Charme, der Menschen anzieht, hervorsticht. Sie werden positive Energie aus neuen Begegnungen gewinnen.';

  @override
  String get dailyFortuneLove4 =>
      'Die Energie zwischenmenschlicher Beziehungen ist klar, so dass Konflikte gelöst und Harmonie erreicht wird.';

  @override
  String get dailyFortuneLove5 =>
      'Die Weichheit der Mundlinie öffnet das Herz der anderen Person. Heute ist Zuhören die beste Gesprächsmethode.';

  @override
  String get dailyFortuneLove6 =>
      'Es ist ein Gesicht, das Hilfe von Ihrer Umgebung erhalten kann. Machen Sie sich keine Sorgen allein, versuchen Sie, Rat einzuholen.';

  @override
  String get dailyFortuneLove7 =>
      'Aufrichtige Augen bauen Vertrauen auf. Wenn Sie Versprechen schätzen, wird Sie eine größere Verbindung erreichen.';

  @override
  String get dailyFortuneLove8 =>
      'Harmonische Energie ist voll in Heim und Arbeitsplatz. Es wird ein Tag sein, an dem das Lachen nie endet.';

  @override
  String get dailyFortuneLove9 =>
      'Es ist ein Tag, an dem die Fäden der Verbindung wunderschön entwirrt werden. Drücken Sie Ihren Dank an wertvolle Menschen aus.';

  @override
  String get dailyFortuneCareer0 =>
      'Der Blick Ihrer Augen ist scharf. Wenn Sie Prioritäten eingrenzen, verwandelt sich Konzentration in Leistung.';

  @override
  String get dailyFortuneCareer1 =>
      'Es ist eine Augenlinie, in der Beobachtung hervorsticht. Entscheidungen sind einfach und die Ausführung ist an diesem Tag stetig.';

  @override
  String get dailyFortuneCareer2 =>
      'Die Energie von Stirn und Augen ist klar, so dass heute die Kraft, die zugewiesene Aufgabe bis zum Ende zu erledigen, groß ist.';

  @override
  String get dailyFortuneCareer3 =>
      'Es ist ein Gesicht, in dem Führung ausgeübt wird. Ihre Meinung wird einen großen Einfluss auf Ihre Mitmenschen haben.';

  @override
  String get dailyFortuneCareer4 =>
      'Das Urteilsvermögen erreicht heute seinen Höhepunkt. Selbst komplexe Probleme können klar gelöst werden.';

  @override
  String get dailyFortuneCareer5 =>
      'Die Arbeitsabwicklung ist sauber und wird in Ihrer Umgebung anerkannt. Die Energie für Beförderung oder Leistung ist stark.';

  @override
  String get dailyFortuneCareer6 =>
      'Optimale Energie für den Start eines neuen Projekts oder einer neuen Arbeit. Fordern Sie sich selbst mit Zuversicht heraus.';

  @override
  String get dailyFortuneCareer7 =>
      'Ein Tag, an dem die Arbeitseffizienz deutlich steigt. Gut für die Erledigung aufgeschobener Aufgaben.';

  @override
  String get dailyFortuneCareer8 =>
      'Augen, in denen kreative Ideen entspringen. Die Gewohnheit, Notizen zu machen, bringt Glück.';

  @override
  String get dailyFortuneCareer9 =>
      'Beharrlichkeit und Geduld glänzen heute. Wenn Sie sich bis zum Ende konzentrieren, folgen große Belohnungen.';

  @override
  String get dailyFortuneHealth0 =>
      'Der allgemeine Teint ist stabil. Wenn Sie einen Rhythmus wählen, wird sich Ihr Zustand schnell erholen.';

  @override
  String get dailyFortuneHealth1 =>
      'Die Vitalität des Gesichts sticht hervor. Wenn Sie das Tempo halten, ohne es zu übertreiben, wird der Tag angenehm.';

  @override
  String get dailyFortuneHealth2 =>
      'Die Energie von Augen und Haut ist klar, so dass eine kurze Ruhepause Konzentration und Stimmung zusammen steigert.';

  @override
  String get dailyFortuneHealth3 =>
      'Der Körperrhythmus erreicht die beste Harmonie. Leichte Bewegung macht die Energie klarer.';

  @override
  String get dailyFortuneHealth4 =>
      'Geladene Energie ist voll in Ihrem Gesicht. Sie können den heutigen Tag angenehm verbringen, ohne müde zu werden.';

  @override
  String get dailyFortuneHealth5 =>
      'Stabilität von Geist und Körper sticht hervor. Meditation oder tiefes Atmen steigert das Glück mehr.';

  @override
  String get dailyFortuneHealth6 =>
      'Es ist ein Tag mit guter Widerstandsfähigkeit. Es gibt Vitalität, um selbst ein wenig Müdigkeit schnell wegzuwaschen.';

  @override
  String get dailyFortuneHealth7 =>
      'Die Hautvitalität ist gut, so dass Sie die Leute sagen hören werden, dass Sie gesund aussehen.';

  @override
  String get dailyFortuneHealth8 =>
      'Gemäßigte Ernährung und Ruhe stärken die Wurzel des Glücks. Nehmen Sie sich einen Tag Zeit, um Ihren Körper zu schätzen.';

  @override
  String get dailyFortuneHealth9 =>
      'Frische Luft und Wasseraufnahme sind die heutige Medizin. Genießen Sie einen Tag voller Vitalität.';

  @override
  String get dailyFortuneTipWealth0 =>
      'Prüfen Sie Ausgaben, Abonnements und Zahlungen \'morgen\' einmal mehr als \'jetzt\'.';

  @override
  String get dailyFortuneTipWealth1 =>
      'Vermeiden Sie Konsum ohne Versprechen, und es ist ein Gewinn, nur das zu enthalten, was Sie brauchen.';

  @override
  String get dailyFortuneTipWealth2 =>
      'Wenn Sie Aufzeichnungen über geldbezogene Gespräche hinterlassen, verhindern Sie unnötige Verluste.';

  @override
  String get dailyFortuneTipWealth3 =>
      'Prüfen Sie, ob es auch bei kleinen Beträgen Lecks gibt.';

  @override
  String get dailyFortuneTipWealth4 =>
      'Die Versuchung zu Impulskäufen ist heute groß. Denken Sie 10 Minuten nach, bevor Sie bezahlen.';

  @override
  String get dailyFortuneTipWealth5 =>
      'Investitionen oder große Transaktionen sollten heute vorsichtig sein. Beziehen Sie sich auf Expertenrat.';

  @override
  String get dailyFortuneTipWealth6 =>
      'Sie müssen geliehenes Geld oder zu erhaltendes Geld klar organisieren.';

  @override
  String get dailyFortuneTipWealth7 =>
      'Achten Sie auf das Portemonnaie-Management. Die Energie von Verlust oder Verschwendung ist leicht sichtbar.';

  @override
  String get dailyFortuneTipWealth8 =>
      'Weisheit, praktische Gewinne zu erzielen, anstatt sich auf den Konsum zu konzentrieren, der auf das Aussehen ausgerichtet ist, ist erforderlich.';

  @override
  String get dailyFortuneTipWealth9 =>
      'Anstatt etwas umsonst zu erwarten, ist die Zahlung eines fairen Preises der Weg, um das Glück zu bewahren.';

  @override
  String get dailyFortuneTipLove0 =>
      'Da Ihr Tonfall leicht scharf werden kann, antworten Sie \'nach einer Pause\'.';

  @override
  String get dailyFortuneTipLove1 =>
      'Wenn ein Missverständnis entsteht, ist eine kurze Überprüfung besser als eine lange Erklärung.';

  @override
  String get dailyFortuneTipLove2 =>
      'Heute baut sich Vertrauen allein durch das Einhalten der Termine auf.';

  @override
  String get dailyFortuneTipLove3 =>
      'Gespräche reduzieren den emotionalen Konsum, wenn Sie mit dem Fazit beginnen.';

  @override
  String get dailyFortuneTipLove4 =>
      'Seien Sie auch zu engen Personen höflich. Sie könnten sie verletzen, indem Sie sich von der Vertrautheit täuschen lassen.';

  @override
  String get dailyFortuneTipLove5 =>
      'Versuchen Sie es mit Lob vor Kritik. Das verschlossene Herz der anderen Person wird sich öffnen.';

  @override
  String get dailyFortuneTipLove6 =>
      'Es ist ein Tag, an dem Versprecher besorgniserregend sind. Organisieren Sie wichtige Geschichten noch einmal per Text.';

  @override
  String get dailyFortuneTipLove7 =>
      'Sich nicht zu sehr in die Angelegenheiten anderer einzumischen, ist das Geheimnis, um Gerüchte zu verhindern.';

  @override
  String get dailyFortuneTipLove8 =>
      'Rationales Gespräch anstelle einer emotionalen Reaktion hält Beziehungen gesund.';

  @override
  String get dailyFortuneTipLove9 =>
      'Überprüfen Sie den Zeitplan sorgfältig, damit sich Termine nicht überschneiden. Vertrauen ist das Kapital.';

  @override
  String get dailyFortuneTipCareer0 =>
      'Anstatt Dinge zu beginnen, lässt \'eines beenden\' das Glück wachsen.';

  @override
  String get dailyFortuneTipCareer1 =>
      'Die Frist kommt vor der Perfektion. Heute bei 80% bestätigen.';

  @override
  String get dailyFortuneTipCareer2 =>
      'Wenn Sie eine Sache organisieren, die Sie aufgeschoben haben, wird Ihr Kopf klar.';

  @override
  String get dailyFortuneTipCareer3 =>
      'Meine Arbeit von der anderer zu trennen, reduziert Stress.';

  @override
  String get dailyFortuneTipCareer4 =>
      'Kleine Fehler können die Arbeit verwickeln. Vergessen Sie nicht die Endkontrolle.';

  @override
  String get dailyFortuneTipCareer5 =>
      'Reibungen mit Vorgesetzten oder Kollegen werden erwartet. Eine Einstellung, Meinungsverschiedenheiten zu respektieren, ist erforderlich.';

  @override
  String get dailyFortuneTipCareer6 =>
      'Die Konzentration lässt sich heute leicht ablenken. Behalten Sie den Rhythmus von 50 Minuten Arbeit und 10 Minuten Pause bei.';

  @override
  String get dailyFortuneTipCareer7 =>
      'Übermäßige Verantwortung kann giftig sein. Übernehmen Sie nur so viel, wie Sie bewältigen können.';

  @override
  String get dailyFortuneTipCareer8 =>
      'Achten Sie darauf, heute keine persönlichen Gefühle in die öffentliche Arbeit zu mischen.';

  @override
  String get dailyFortuneTipCareer9 =>
      'Bevor Sie Dokumente oder E-Mails versenden, überprüfen Sie den Empfänger und die Anhänge noch einmal.';

  @override
  String get dailyFortuneTipHealth0 =>
      'Vermeiden Sie Schlafmangel, übermäßiges Essen und übermäßiges Koffein, um Ihren Zustand zu stabilisieren.';

  @override
  String get dailyFortuneTipHealth1 =>
      'Das Lösen von Verspannungen im Nacken und in den Schultern reduziert die heutige Müdigkeit erheblich.';

  @override
  String get dailyFortuneTipHealth2 =>
      'Ein kurzer Spaziergang ordnet Gedanken und erfrischt die Energie.';

  @override
  String get dailyFortuneTipHealth3 =>
      'Ein Glas Wasser und 1 Minute Dehnen unterstützen den Boden des Glücks.';

  @override
  String get dailyFortuneTipHealth4 =>
      'Augenmüdigkeit kann schwerwiegend werden. Reduzieren Sie kurzzeitig die Smartphone-Nutzung.';

  @override
  String get dailyFortuneTipHealth5 =>
      'Anstatt plötzlicher Aktivität ist es besser, sich nach ausreichendem Aufwärmen des Körpers zu bewegen.';

  @override
  String get dailyFortuneTipHealth6 =>
      'Da Sie empfindlich auf Temperaturänderungen reagieren könnten, bringen Sie ein Oberteil mit, um die Körpertemperatur zu regulieren.';

  @override
  String get dailyFortuneTipHealth7 =>
      'Vermeiden Sie heute anregende Lebensmittel für die Darmgesundheit und die Haut.';

  @override
  String get dailyFortuneTipHealth8 =>
      'Ausreichend Schlaf ist die beste Medizin. Gehen Sie heute früher als gewöhnlich ins Bett.';

  @override
  String get dailyFortuneTipHealth9 =>
      'Wechseln Sie Ihre Stimmung mit Ihrer Lieblingsmusik oder Ihrem Lieblingsduft, damit sich kein Stress ansammelt.';

  @override
  String get eyeAnalysisTypeSharp =>
      'Your eyes are intense and clear, showing momentary judgment and drive that stand out very much.';

  @override
  String get eyeAnalysisTypeDeep =>
      'Ihre Augen sind ruhig und tiefgründig, ein weises Gesicht, das sorgfältig beobachtet und nachdenkt, bevor es handelt.';

  @override
  String get eyeAnalysisTypeBalanced =>
      'Die Energie der Augen ist ausgeglichen und stimmt Emotionen und Vernunft angemessen aufeinander ab, um ein Gefühl der Stabilität zu vermitteln.';

  @override
  String get eyeExpressionBright =>
      'Besonders die strahlenden Augen und ein Lächeln harmonieren miteinander und bringen die Energie von \'Dohwa\' stark zum Ausdruck, die Menschen anzieht.';

  @override
  String get eyeExpressionGentle =>
      'Ein sanftes Lächeln verbirgt sich in ruhigen Augen und verleiht ein Gefühl von weichem Charisma des Typs \'Oeyu-naegang\'.';

  @override
  String get eyeExpressionStrong =>
      'Starke Augen ohne Lächeln symbolisieren Entschlossenheit und Führung und zeigen die Kraft, direkt auf Ziele zuzugehen.';

  @override
  String get eyeExpressionSteady =>
      'Insgesamt eine ruhige und ernsthafte Atmosphäre, die Vertrauen durch eine gewichtige Haltung anstelle von leichten Worten und Taten gewinnt.';

  @override
  String get eyePostureTilt =>
      'Der Kopf ist jedoch etwas geneigt, was das Zentrum des Geistes erschüttern kann. Ein gerader Blick nach vorn macht das Glück klarer.';

  @override
  String get eyePostureStraight =>
      'Die Haltung, geradeaus zu blicken, macht die Energie der Augen klarer und aufrechter.';

  @override
  String get noseInsufficient =>
      'Die Messung der Nasenkontur ist nicht ausreichend, daher wird die Interpretation der Nase mit Zurückhaltung angezeigt.';

  @override
  String get noseWealthRich =>
      'Der Nasenrücken ist dick und die Länge ist groß, daher ist die Energie des \'Reichtumspalastes (Jebaekgung)\', der Reichtum sammelt und schützt, sehr gut.';

  @override
  String get noseWealthPlanner =>
      'Die Nase ist scharf und ordentlich, was Sie zu einer praktischen Person macht, die Reichtum sorgfältig verwaltet und systematisch vermehrt.';

  @override
  String get noseWealthBalanced =>
      'Die Proportionen der Nase sind angemessen und ausgewogen, was die Kraft verleiht, den eingehenden Reichtum stabil zu halten.';

  @override
  String get mouthExpressionBlessing =>
      'Der Mund ist geschlossen, aber die Mundwinkel sind nach oben gezogen, sodass in jedem Wort Segen wohnt und Sie ein Gesicht sind, das Gunst von der Umgebung gewinnt.';

  @override
  String get mouthExpressionReliable =>
      'Das Aussehen des fest geschlossenen Mundes zeigt Vertrauen und Verantwortung, ein Typ, der eher durch Taten als durch leichte Worte überzeugt.';

  @override
  String get mouthExpressionLucky =>
      'Ein weit geöffneter, lächelnder Mund ist erfrischend, strahlt positive Energie aus und ruft nach Glück in zwischenmenschlichen Beziehungen.';

  @override
  String get mouthExpressionOpen =>
      'Der Mund ist leicht geöffnet, was eine offene und ehrliche Persönlichkeit zeigt, aber manchmal müssen Sie vorsichtig mit Versprechern sein.';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'Der heutige Fokus liegt auf $topKey, und der Punkt, auf den Sie achten sollten, ist $bottomKey.';
  }

  @override
  String get overallVibeWealthRich =>
      'Die Energie des Reichtumspalastes (Nase) ist ausgeprägt und lebendig, was einen sehr guten Teint für das Ergreifen finanzieller Möglichkeiten schafft.';

  @override
  String get overallVibeWealthSteady =>
      'Die Energie um die Nase, das Zentrum des Gesichts, ist ruhig, was ein geeigneter Fluss ist, um praktische Gewinne mitzunehmen und stetig Reichtum anzuhäufen.';

  @override
  String get overallVibeLoveCharisma =>
      'Das strahlende Lächeln, das an den Mundwinkeln beginnt, verstärkt die Energie von \'Dohwa\', sodass sich Menschen um Sie sammeln; es ist ein Gesicht, das edle Helfer treffen kann.';

  @override
  String get overallVibeLoveTrust =>
      'Der Ernst der Augen verleiht dem Gegenüber tiefes Vertrauen und macht es zu einem guten Tag, um tiefe Beziehungen anstelle von flüchtigen Begegnungen aufzubauen.';

  @override
  String get overallVibeCareerSmart =>
      'Die intelligente Energie in Ihren Augen erhöht das Urteilsvermögen, was der optimale Zustand für komplexe Aufgaben oder wichtige Entscheidungen ist.';

  @override
  String get overallVibeCareerSteady =>
      'Die stabile Energie des unteren Gesichts unterstützt die Ausdauer, sodass Bemühungen, schweigend Ihren Platz zu behaupten, zu großartigen Ergebnissen führen.';

  @override
  String get overallVibeHealth =>
      'Die im ganzen Gesicht zirkulierende Vitalität und ein klarer Teint zeigen, dass der Körperrhythmus stabil ist, was gut zum Aufladen der Lebenskraft ist.';

  @override
  String get overallActionPrudent =>
      'Der Segen späterer Jahre ist im umsichtigen Erscheinungsbild des geschlossenen Mundes spürbar. Heute folgt das Glück, wenn Sie eher mit Taten als mit Worten praktizieren.';

  @override
  String get overallActionConfident =>
      'Die erfrischend offene Mundlinie ruft nach positiver Energie. Wenn Sie Meinungen mit selbstbewusster Stimme präsentieren, werden Sie eine gute Resonanz erhalten.';

  @override
  String get adviceHealth0 =>
      'Das Zustandsmanagement unterstützt die Basis des Glücks. Organisieren Sie heute unzumutbare Zeitpläne neu.';

  @override
  String get adviceHealth1 =>
      'Hören Sie auf die Signale Ihres Körpers. Eine kurze Pause bringt größere Ergebnisse.';

  @override
  String get adviceHealth2 =>
      'Ausreichend Schlaf und Wasseraufnahme allein klären das heutige Glück.';

  @override
  String get adviceWealth0 =>
      'Geld fließt so leicht ab, wie es hereinkommt. Prüfen Sie Ausgaben und Verträge noch einmal.';

  @override
  String get adviceWealth1 =>
      'Das Reduzieren kleiner Ausgaben ist der Anfang, um großen Reichtum zu sammeln.';

  @override
  String get adviceWealth2 =>
      'Finanzielle Entscheidungen auf morgen zu verschieben, kann ein Gewinn sein.';

  @override
  String get adviceLove0 =>
      'Ein Ton, ein Ausdruck bestimmt das zwischenmenschliche Glück. Beginnen Sie zuerst sanft.';

  @override
  String get adviceLove1 =>
      'Eine zuhörende Haltung wird zum Schlüssel, um das Herz des anderen zu öffnen.';

  @override
  String get adviceLove2 =>
      'Manieren auch gegenüber nahestehenden Personen zu bewahren, ist der Weg, das Glück zu schützen.';

  @override
  String get adviceCareer0 =>
      'Heute ist ein Tag, um \'eine Sache sicher zu fangen\', anstatt die Ziele zu erweitern. Reduzieren Sie Prioritäten.';

  @override
  String get adviceCareer1 =>
      'Überstürzen Sie nichts. Schritt für Schritt vorzugehen ist der schnellste Weg.';

  @override
  String get adviceCareer2 =>
      'Beziehen Sie Ratschläge aus Ihrem Umfeld ein, aber vertrauen Sie bei der endgültigen Entscheidung Ihrer eigenen Intuition.';

  @override
  String get sajuFortune2024Gap =>
      '🌿 2024 Gapjin Jahr Gap-Holz Allgemeines Glück: \'Ein Jahr der Neuanfänge und Sprünge\'\n\n2024 ist ein Jahr, in dem die Energie von \'Bi-gyeon\' und \'Pyeon-jae\' für Sie eintritt. Es ist, als würden neue Bäume in einem üppigen Wald gepflanzt und weites Land entfaltet sich. Es wird ein großartiges Jahr sein, um eine klare subjektive Sicht zu haben und neue Dinge zu planen.\n\n💼 [Karriere & Business]\nEine Zeit, in der das Selbstvertrauen überfließt und die Tatkraft stärker wird. Es ergeben sich Gelegenheiten, bei großen Projekten durch Zusammenarbeit mit Kollegen oder Partnern erfolgreich zu sein. Wenn Sie über eine Existenzgründung oder einen Jobwechsel nachgedacht haben, könnte dieses Jahr der richtige Zeitpunkt sein. Sie könnten jedoch eigensinnig werden, daher ist eine zuhörende Haltung erforderlich.\n\n💰 [Reichtum]\nGelegenheiten, großen Reichtum zu berühren, werden kommen. Unerwartete Windfälle oder Investitionsrenditen werden erwartet. Es kann jedoch viel Geld abfließen, daher ist ein gründliches Asset-Management erforderlich. Investitionen mit langfristiger Perspektive sind vorteilhaft.\n\n❤️ [Liebe & Beziehungen]\nEine gute Zeit, um Beziehungen zu erweitern und neue Bindungen zu knüpfen. Wenn Sie Single sind, besteht eine hohe Wahrscheinlichkeit, einen attraktiven Partner zu treffen, und wenn Sie in einer Partnerschaft sind, wird die Beziehung tiefer werden. Achten Sie jedoch auf auftauchende Konkurrenten.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Gesundheit von Leber oder Gallenblase und bewältigen Sie Stress. Vermeiden Sie außerdem willkürliche Entscheidungen aufgrund von übermäßigem Selbstvertrauen.';

  @override
  String get sajuFortune2024Eul =>
      '🌿 2024 Gapjin Jahr Eul-Holz Allgemeines Glück: \'Ein Jahr des Wachstums mit Helfern\'\n\n2024 ist ein Jahr, in dem die Energie von \'Geob-jae\' und \'Jeong-jae\' für Sie eintritt. Es ist wie Efeu, der an einem großen Baum hochklettert, um den Himmel zu sehen. Es wird ein Jahr sein, in dem Sie mit der Hilfe Ihrer Mitmenschen größere Ergebnisse erzielen können als allein.\n\n💼 [Karriere & Business]\nZusammenarbeit und Networking sind wichtig. Sie werden kompetente Helfer treffen, die Arbeitseffizienz steigern und Anerkennung gewinnen. Es können jedoch Situationen auftreten, in denen Leistungen geteilt werden müssen, achten Sie also auf eine faire Verteilung. Es ist eine gute Zeit, Ihre Präsenz inmitten des Wettbewerbs zu zeigen.\n\n💰 [Reichtum]\nEin stabiles Einkommen ist garantiert. Belohnungen folgen aufrichtigen Bemühungen, und es ist eine vorteilhafte Zeit für Ersparnisse oder Immobilieninvestitionen. Vermeiden Sie jedoch Finanztransaktionen mit Kollegen oder Bekannten und achten Sie auf das Ausgabenmanagement.\n\n❤️ [Liebe & Beziehungen]\nEs wird viele gesellschaftliche Zusammenkünfte geben und die Beliebtheit wird zunehmen. In romantischen Beziehungen können kleinere Missverständnisse auftreten, daher ist ein ehrliches Gespräch erforderlich. Neue Bindungen werden sich wahrscheinlich ganz natürlich durch Freunde oder Kollegen ergeben.\n\n⚠️ [Vorsicht]\nAchten Sie auf Nervenerkrankungen oder Migräne. Bewahren Sie außerdem eine flexible Haltung, da Sie unter Konflikten mit Menschen in Ihrer Umgebung leiden könnten.';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 2024 Gapjin Jahr Byeong-Feuer Allgemeines Glück: \'Ein Jahr, in dem Leidenschaft und Weisheit strahlen\'\n\n2024 ist ein Jahr, in dem die Energie von \'Pyeon-in\' und \'Sik-sin\' für Sie eintritt. Es ist, als würde die Sonne auf einen Wald scheinen, um ihm Leben einzuhauchen. Kreative Ideen werden sprudeln und es wird ein Jahr sein, in dem Sie Ihre Talente voll entfalten können.\n\n💼 [Karriere & Business]\nSie werden in Fachbereichen hervorstechen und originelle Ergebnisse erzielen. Besonders vorteilhaft für diejenigen in Forschung, Kunst oder technischen Positionen. Die Tatkraft kann jedoch aufgrund vieler Gedanken sinken. Wenn Sie also einen Plan gemacht haben, bemühen Sie sich, ihn sofort in die Tat umzusetzen.\n\n💰 [Reichtum]\nEine Zeit, in der Ihre Talente und Ideen zu Geld führen. Nebenjobs oder Hobbys können Einkommen schaffen. Prüfen Sie jedoch Dokumentenverträge oder Investitionen sorgfältig, um Verluste zu vermeiden.\n\n❤️ [Liebe & Beziehungen]\nEine Zeit, in der sich die Ausdrucksweise verbessert und der Charme überfließt. Sie werden eine führende Rolle in Beziehungen einnehmen und die Gunst vieler Menschen gewinnen. In romantischen Beziehungen wird es viele angenehme Verabredungen und Ereignisse geben, die die Beziehung vertiefen.\n\n⚠️ [Vorsicht]\nAchten Sie auf das Verdauungssystem oder die Herz-Kreislauf-Gesundheit. Da Sie sich durch zu viel Nachdenken deprimiert fühlen könnten, ist es gut, Energie durch Outdoor-Aktivitäten freizusetzen.';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 2024 Gapjin Jahr Jeong-Feuer Allgemeines Glück: \'Ein Jahr der Stärkung interner Fundamente in Stabilität\'\n\n2024 ist ein Jahr, in dem die Energie von \'Jeong-in\' und \'Sang-gwan\' für Sie eintritt. Es ist wie eine Lampe am Nachthimmel, die den Wald beleuchtet. Es wird ein gutes Jahr sein, um sich auf die Selbstentwicklung zu konzentrieren, wie Studien oder den Erwerb von Zertifizierungen, und die internen Grundlagen zu stärken.\n\n💼 [Karriere & Business]\nMit der Hilfe von Vorgesetzten oder Senioren verbessert sich das Arbeitsumfeld und es ergeben sich Gelegenheiten für Beförderungen oder Versetzungen. Es ist eine vorteilhafte Zeit, Ihre Meinungen überzeugend zu vermitteln und Zustimmung von Ihren Mitmenschen zu gewinnen. Seien Sie jedoch vorsichtig mit Worten und Taten, da kritische Haltungen zu Gerüchten führen können.\n\n💰 [Reichtum]\nGlück in Bezug auf Dokumente ist gut. Immobilienverträge oder Einkommensverbesserungen durch den Erwerb von Zertifizierungen werden erwartet. Es ist gut, sich auf eine stabile Vermögensverwaltung zu konzentrieren und von impulsivem Konsum abzusehen.\n\n❤️ [Liebe & Beziehungen]\nSie werden das Vertrauen der Menschen um Sie herum mit einem höflichen und herzlichen Auftreten gewinnen. In romantischen Beziehungen wächst die Rücksichtnahme aufeinander, wodurch stabile Treffen aufrechterhalten werden. Ein gutes Jahr, um auch eine Hochzeit vorzubereiten.\n\n⚠️ [Vorsicht]\nAchten Sie auf Augenerkrankungen oder nervöse Erschöpfung. Bewahren Sie außerdem eine bescheidene Haltung, da das Zurschaustellen Ihrer Fähigkeiten Ressentiments bei Ihren Mitmenschen hervorrufen kann.';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ 2024 Gapjin Jahr Mu-Erde Allgemeines Glück: \'Ein Jahr der Verantwortung und Herausforderung\'\n\n2024 ist ein Jahr, in dem die Energie von \'Pyeon-gwan\' und \'Bi-gyeon\' für Sie eintritt. Es ist, als würde ein riesiger Berg mit einem Wald harmonieren, um seine Majestät zu zeigen. Die Verantwortlichkeiten werden zunehmen, aber es wird ein Jahr sein, in dem Sie durch deren Überwindung einen Schritt weiter wachsen.\n\n💼 [Karriere & Business]\nSie werden oft mit schwierigen Aufgaben betraut oder müssen Führungsqualitäten beweisen. In einem stark umkämpften Umfeld ergeben sich Gelegenheiten, Ihre Fähigkeiten unter Beweis zu stellen. So hart es auch sein mag, das Erfolgsgefühl wird groß sein, daher ist Beharrlichkeit erforderlich, um bis zum Ende durchzuhalten.\n\n💰 [Reichtum]\nDie Ausgaben können in diesem Jahr etwas steigen. Es ist klug, sich eher auf den Kapitalerhalt als auf Investitionen zu konzentrieren, und seien Sie vorsichtig, da Sie in finanziellen Beziehungen zu Menschen in Ihrer Umgebung Geld verlieren könnten. Es ist wichtig, einen Vermögensplan mit langfristiger Perspektive aufzustellen.\n\n❤️ [Liebe & Beziehungen]\nSie werden mit starkem Charisma die Aufmerksamkeit des anderen Geschlechts auf sich ziehen. Eine eigensinnige Haltung kann jedoch zu Streitigkeiten mit Partnern führen, daher sind Bemühungen erforderlich, die Position der anderen Person zu berücksichtigen. Eine Zeit, in der Freundschaften mit Freunden tiefer werden.\n\n⚠️ [Vorsicht]\nAchten Sie auf körperliche Überanstrengung wie Magenbeschwerden oder Muskelschmerzen. Ausreichend Ruhe und Dehnung sind erforderlich, und es ist gut, Hobbys zu haben, die den mentalen Druck abbauen können.';

  @override
  String get sajuFortune2024Gi =>
      '🌾 2024 Gapjin Jahr Gi-Erde Allgemeines Glück: \'Ein Jahr der Frucht und Harmonie\'\n\n2024 ist ein Jahr, in dem die Energie von \'Jeong-gwan\' und \'Geob-jae\' für Sie eintritt. Es ist wie üppige Bäume, die auf einem weiten Feld wachsen und Früchte tragen. Es wird ein angenehmes Jahr sein, in dem der soziale Status steigt und Ehre gewonnen wird.\n\n💼 [Karriere & Business]\nSie werden innerhalb der Organisation anerkannt und übernehmen wichtige Positionen. Ein Jahr mit sehr großem Glück bei Anstellung oder Beförderung. Wenn Sie Regeln befolgen und aufrichtig arbeiten, können Sie Ergebnisse erzielen, die über den Erwartungen liegen. Sie könnten jedoch durch den Wettbewerb mit Kollegen gestresst werden, bewahren Sie also etwas Seelenfrieden.\n\n💰 [Reichtum]\nEin Jahr, in dem ein stabiles Einkommen erzielt wird und sich der Reichtum stetig anhäuft. Belohnungen entsprechend der Leistung oder Ehre werden erwartet. Es kann jedoch zu Ausgaben kommen, da es viele Dinge geben wird, die Sie den Menschen um Sie herum geben möchten, daher ist eine angemessene Anpassung erforderlich.\n\n❤️ [Liebe & Beziehungen]\nEine Zeit, in der das Hochzeitsglück stark eintritt. Wenn Sie Single sind, können Sie einen zuverlässigen Partner treffen und eine ernsthafte Beziehung entwickeln. In Beziehungen werden Sie durch reibungslose Kommunikation die Unterstützung vieler Menschen gewinnen.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Milz- oder Bauchspeicheldrüsenfunktion und behalten Sie regelmäßige Essgewohnheiten bei. Seien Sie außerdem vorsichtig, da Sie Ihre eigenen Interessen vernachlässigen könnten, wenn Sie zu sehr in die Angelegenheiten anderer involviert sind.';

  @override
  String get sajuFortune2024Gyeong =>
      '⚔️ 2024 Gapjin Jahr Gyeong-Metall Allgemeines Glück: \'Ein Jahr des Wandels und der Innovation\'\n\n2024 ist ein Jahr, in dem die Energie von \'Pyeon-jae\' und \'Pyeon-in\' für Sie eintritt. Es ist wie ein scharfes Schwert, das einen Wald lichtet und einen neuen Weg bahnt. Es wird ein Jahr sein, in dem Sie bestehende Rahmenbedingungen sprengen und neue Bereiche herausfordern, um großen Veränderungen gegenüberzustehen.\n\n💼 [Karriere & Business]\nNeue Geschäftsideen werden Ihnen in den Sinn kommen und Sie werden kühne Entschlossenheit an den Tag legen. Das Glück für Auslandstätigkeiten oder Ortswechsel ist groß, und eine Haltung, Veränderungen nicht zu scheuen, ist der Schlüssel zum Erfolg. Koordinationsfähigkeiten sind jedoch erforderlich, da eigenmächtiges Handeln zu Konflikten innerhalb der Organisation führen kann.\n\n💰 [Reichtum]\nEin Jahr mit großen Schwankungen im Reichtumsglück. Sie können große Gewinne erzielen, aber unvernünftige Investitionen können zu großen Verlusten führen. Sie müssen auf der Grundlage gründlicher Analysen und Planungen agieren, und es ist besser, spekulative Investitionen zu vermeiden.\n\n❤️ [Liebe & Beziehungen]\nEs wird viele Gelegenheiten geben, neue Leute kennenzulernen, und Sie werden aktive soziale Aktivitäten entfalten. Eine Zeit, in der die Neugier beim Dating zunimmt. Eine ernsthafte Haltung ist jedoch erforderlich, da es leicht heiß werden und wieder abkühlen kann.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Gesundheit der Atemwege oder des Dickdarms. Bewahren Sie außerdem jederzeit die Ruhe und achten Sie auf die Sicherheit, da Unfälle aufgrund einer voreiligen Persönlichkeit auftreten können.';

  @override
  String get sajuFortune2024Sin =>
      '💎 2024 Gapjin Jahr Sin-Metall Allgemeines Glück: \'Ein Jahr der glänzenden Juwelen und der Ehre\'\n\n2024 ist ein year, in dem die Energie von \'Jeong-jae\' und \'Jeong-in\' für Sie eintritt. Es ist wie ein Juwel, das in einem Wald glänzt und für seinen Wert anerkannt wird. Es wird ein Jahr sein, in dem Sie gerechte Belohnungen für Ihre Bemühungen erhalten und Ihre Ehre steigern.\n\n💼 [Karriere & Business]\nAufrichtigkeit und Gewissenhaftigkeit strahlen aus und gewinnen das Vertrauen aller um Sie herum. Sie könnten für Ihr Fachwissen anerkannt werden und die verantwortliche Person für ein wichtiges Projekt werden oder die Freude über eine Beförderung genießen. Eine stabile Zeit, in der die Dinge wie geplant reibungslos verlaufen.\n\n💰 [Reichtum]\nDas Reichtumsglück ist sehr stabil und gut. Ein stetiges Einkommen ist garantiert, und Sie werden gute Ergebnisse bei Ersparnissen oder Finanztechnologien erzielen. Sie könnten auch von Eltern oder Vorgesetzten erben oder wirtschaftliche Hilfe erhalten.\n\n❤️ [Liebe & Beziehungen]\nSie werden mit einem würdevollen und höflichen Auftreten großen Charme auf das andere Geschlecht ausüben. In romantischen Beziehungen vertieft sich das Vertrauen ineinander, was es zu einem guten Jahr macht, um sich die Ehe zu versprechen. Die Beziehungen sind ebenfalls reibungslos und friedlich.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Lungengesundheit oder Hauterkrankungen. Manchmal müssen Sie sich auch wohlfühlen, da das Streben nach zu viel Perfektion zu Selbststress führen kann.';

  @override
  String get sajuFortune2024Im =>
      '🌊 2024 Gapjin Jahr Im-Wasser Allgemeines Glück: \'Ein Jahr des flexiblen Wachstums wie fließendes Wasser\'\n\n2024 ist ein Jahr, in dem die Energie von \'Sik-sin\' und \'Pyeon-gwan\' für Sie eintritt. Es ist wie ein großes Meer, das einen Wald befeuchtet, um Leben wachsen zu lassen. Es wird ein Jahr sein, in dem Sie Weisheit walten lassen, um schwierige Probleme zu lösen und Ihr Territorium zu erweitern.\n\n💼 [Karriere & Business]\nEine Zeit, in der kreative Problemlösungsfähigkeiten hervorstechen. Sie werden selbst in schwierigen Situationen Durchbrüche finden und Anerkennung für Ihre Fähigkeiten gewinnen. Besonders gute Ergebnisse werden in den Bereichen Bildung, Beratung und Planung erwartet. Eine Anpassung des Tempos ist jedoch erforderlich, da Sie aufgrund der übermäßigen Arbeitsbelastung erschöpft sein könnten.\n\n💰 [Reichtum]\nEin gutes Jahr, um durch Ihre Fähigkeiten oder Talente Einkommen zu schaffen. Eine Zeit, in der Essensglück und Reichtumsglück zusammen eintreffen. Es ist jedoch klug, Notfallfonds zu sichern, da plötzliche Ausgaben auftreten können.\n\n❤️ [Liebe & Beziehungen]\nSie werden gute Beziehungen zu den Menschen in Ihrer Umgebung pflegen, da Ihr Verständnis und Ihre Toleranz zunehmen. In romantischen Beziehungen werden Sie die wahren Gefühle des anderen durch tiefe Gespräche bestätigen. Wenn Sie Single sind, ist es sehr wahrscheinlich, dass Sie einen Partner mit einem angenehmen Gefühl treffen.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Gesundheit des Nieren- oder Blasensystems. Priorisieren Sie außerdem Ihre Handlungen, da der Versuch, zu viele Dinge gleichzeitig zu erledigen, Ihrer Gesundheit schaden kann.';

  @override
  String get sajuFortune2024Gye =>
      '💧 2024 Gapjin Jahr Gye-Wasser Allgemeines Glück: \'Chancen inmitten des Wandels ergreifen\'\n\n2024 ist ein Jahr, in dem die Energie von \'Sang-gwan\' und \'Jeong-gwan\' für Sie eintritt. Es ist wie süßer Regen, der einen Wald befeuchtet, um alles wiederzubeleben. Es wird ein Jahr sein, in dem Sie Ihre Stimme erheben, um der Welt Ihre Anwesenheit zu verkünden und neue Möglichkeiten zu ergreifen.\n\n💼 [Karriere & Business]\nDie Beredsamkeit verbessert sich und kreative Ideen werden reichlich vorhanden sein. Sie werden exzellentes Talent in den Bereichen Marketing, PR und Kunst zeigen. Es ist jedoch Weisheit gefragt, um flexibel zu reagieren, da Rebellion gegen Chefs oder Organisationsregeln aufkommen kann.\n\n💰 [Reichtum]\nEin Jahr, in dem der Geldfluss aktiv wird. Es ergeben sich Gelegenheiten, das Einkommen durch den Einsatz von Witz und Schnelligkeit zu steigern. Seien Sie jedoch vorsichtig, da die Ausgaben aufgrund von impulsivem Konsum oder ausgefallenem Erscheinungsbild groß werden können.\n\n❤️ [Liebe & Beziehungen]\nSie werden mit überfließendem Charme und guten Konversationsfähigkeiten beliebt sein. In romantischen Beziehungen hauchen Sie durch ehrlichen emotionalen Ausdruck Leben ein, aber Rücksichtnahme ist erforderlich, da scharfe Worte manchmal verletzen können.\n\n⚠️ [Vorsicht]\nAchten Sie auf urologische Erkrankungen oder die Durchblutung. Vermeiden Sie es außerdem, schlecht über andere zu reden, und bewahren Sie jederzeit eine bescheidene Ausdrucksweise und Handlungsweise, da Sie Gegenstand von Gerüchten sein könnten.';

  @override
  String get sajuFortune2025Gap =>
      '🌿 2025 Eulsa Year Gap-Wood General Fortune: \'Growth Amidst New Stage and Competition\'\n\n2025 is a year where the energy of \'Geob-jae\' and \'Sik-sin\' enters for you. It\'s like a large tree in a forest harmonizing with ivy (Eul-wood) to grow together. Synergy occurs when together rather than alone, but at the same time, it will be a year where fierce competition cannot be avoided.\n\n💼 [Career & Business]\nActivity becomes vigorous and the desire for expression becomes strong. Opportunities will come to widely announce your ideas and talents to the world. Excellent results are expected for freelancers, those in performing arts, or sales. However, subtle conflicts may arise in relationships with colleagues or competitors, so wisdom to make them collaborators rather than enemies is needed.\n\n💰 [Wealth]\nWealth flow is active, but there may be as much money going out as coming in (influence of Geob-jae). Caution is needed as expenditures may occur due to gatherings with friends/colleagues or investment recommendations. Investing in self-development or business expansion is more advantageous in the long run than saving money.\n\n❤️ [Love & Relationships]\nSociability improves and you will meet many new people. Popularity rises in gatherings or group activities, and it\'s a good time to appeal charm to the opposite sex. However, as competitors may appear, it\'s good to express yourself actively if there\'s someone you like.\n\n⚠️ [Cautions]\nExcessive competitive spirit may lead to trouble. Also, movement luck increases due to the \'Sa-fire\' energy, so pay attention to traffic safety and physical strength management.';

  @override
  String get sajuFortune2025Eul =>
      '🌿 2025 Eulsa Year Eul-Wood General Fortune: \'A Brilliant Leap Revealing Your Colors\'\n\n2025 is a year where the energy of \'Bi-gyeon\' and \'Sang-gwan\' enters for you. It\'s like flowers in a field in full bloom under the warm sun. It will be a dynamic year where you fully show off your individuality and talents and receive public attention.\n\n💼 [Career & Business]\nCreativity and artistic sense reach their peak. You will stand out greatly in tasks of planning and presenting ideas. Opportunities to become independent or lead new projects arise as your skills are recognized. However, coordination is needed as trying to go too far ahead may conflict with existing rules.\n\n💰 [Wealth]\nA year where income is created based on wit and skill. You may gain unexpected income through side jobs or creative activities. However, expenditures for dignity maintenance or entertainment may increase as you chase fancy things, so don\'t lose economic sense.\n\n❤️ [Love & Relationships]\nA time with overflowing charm, receiving attention from the opposite sex. In romantic relationships, you spend pleasant and lively times, but sometimes fights may occur due to your own stubbornness. If solo, you can look forward to a fateful meeting.\n\n⚠️ [Cautions]\nBe careful of slips of the tongue as it\'s an easy year to be subject to rumors. Also, regular sleep and rest are essential as you may consume too much energy and get tired easily.';

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
      '🌾 2026 Byeong-oh Year Gi-Earth General Fortune: \'Solid Foundation and Definite Support\'\n\n2026 is a year of \'Jeong-in\' (Knowledge) and \'Pyeon-in\' (Intuition) for you, a Gi-Earth. It is a situation where warm sunlight shines on the earth and ripens grains. It is a period of solidifying a stable foundation while receiving full support and love from superiors.\n\n💼 [Career & Business]\nYou will achieve the best results in everything related to study, such as promotion exams, certification exams, and degree attainment. At work, you will gain the trust of superiors and take on important positions. You will stand out in education, real estate, counseling, and welfare fields.\n\n💰 [Wealth]\nIt is a luck to hold documents. You may achieve the dream of owning a home or receive inheritance or gifts. Stable asset growth is possible, and it is a year where honor shines more than wealth.\n\n❤️ [Love & Relationships]\nIt is a year to be loved. You will receive dependable love from your lover or meet a partner with good conditions. Marriage luck also enters, and family life becomes harmonious.\n\n⚠️ [Precautions]\nIf you only try to receive, you may become lazy. A posture of sharing as much as you received is necessary. Discard dependency and grow self-reliance.';

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
      '🔥 2025 Eulsa Year Byeong-Fire General Fortune: \'Achievement and Competition Full of Passion\'\n\n2025 is a year where the energy of \'Jeong-in\' and \'Bi-gyeon\' enters for you. It\'s like the sun in the sky meeting the heat on the ground to burn even hotter. You will gain strong support forces and push forward towards goals without hesitation based on confidence.\n\n💼 [Career & Business]\nYou will achieve great growth with the help of reliable helpers or mentors. Very advantageous for acquiring certifications or academic achievements. Collaboration with colleagues shines, and you will lead the team to success by exercising leadership. However, beware as excessive competitive spirit may harm relationships.\n\n💰 [Wealth]\nA time to increase wealth while sharing information with people around you. Income through joint investment or cooperation is expected. However, it\'s important to take care of practical interests as you may spend excessively due to pride or conscious of others\' gaze.\n\n❤️ [Love & Relationships]\nA year where friendships deepen as there will be many gatherings with people. In romantic relationships, comfort like a friend becomes stronger. However, appropriate balance is needed as conflicts may arise by prioritizing friends over partners.\n\n⚠️ [Cautions]\nPay attention to blood circulation systems such as blood pressure or heart health. Also, always maintain peace of mind as impulsive emotions due to a fiery personality may ruin things.';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 2025 Eulsa Year Jeong-Fire General Fortune: \'Stability and Opportunity Found Amidst Change\'\n\n2025 is a year where the energy of \'Pyeon-in\' and \'Geob-jae\' enters for you. It\'s like a candle flickering in the wind but eventually illuminating the surroundings and revealing its presence. Unexpected changes may come, but it will be a year where you wisely overcome them and turn them into opportunities.\n\n💼 [Career & Business]\nOriginal ideas and intuition shine. You will target niche markets that others haven\'t thought of or achieve deep results in professional fields. However, competition with colleagues becomes fierce and there may be people trying to snatch results, so pay attention to security maintenance and relationship management.\n\n💰 [Wealth]\nA year where there may be fluctuations in wealth luck. Conservative asset management is needed as unexpected expenditures may occur or losses may be seen in investments. However, income using your own professional skills will come in stably. It\'s better to avoid financial transactions.\n\n❤️ [Love & Relationships]\nYou may become passive in dating as thoughts increase. In romantic relationships, it\'s easy to feel disappointed over small things, so it\'s important to trust the other person and treat them with an open heart. Filling the inner self through time alone is also a good way.\n\n⚠️ [Cautions]\nBeware of nervous disorders or insomnia due to stress. It\'s important to manage your mind through meditation or light exercise, and try to have a positive mindset rather than negative thoughts.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ 2025 Eulsa Year Mu-Earth General Fortune: \'A Year of Maturity Strengthening Internal Foundations Wisely\'\n\n2025 is a year where the energy of \'Jeong-gwan\' and \'Pyeon-in\' enters for you. It\'s like warm heat permeating under a huge mountain to embrace everything. It will be a substantial year of adding your own depth while keeping social honor.\n\n💼 [Career & Business]\nYou will rise to a responsible position within the organization or opportunities for promotion will come. If you value principles and work sincerely, you will receive great recognition. At the same time, you achieve excellent results in acquiring professional knowledge or research tasks. However, flexible thinking is needed as you may refuse change by being caught in stereotypes.\n\n💰 [Wealth]\nStable income is guaranteed. It\'s advantageous to save sincerely and manage assets. Fortune related to real estate or documents is good, so it\'s worth considering long-term investments. However, avoid unreasonable investments by being shaken by surrounding temptations.\n\n❤️ [Love & Relationships]\nYou gain trust from people with dignified speech and actions. In romantic relationships, it\'s a good time to respect each other and develop into a serious relationship. If thinking about marriage, it\'s also good to make specific plans.\n\n⚠️ [Cautions]\nPay attention to digestive system or skin health. Also, practice making quick decisions by listening to surrounding advice as you may experience decision paralysis due to overthinking.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 2025 Eulsa Year Gi-Earth General Fortune: \'Achieving Goals with Responsibility\'\n\n2025 is a year where the energy of \'Pyeon-gwan\' and \'Jeong-in\' enters for you. It\'s like sunshine shining after rain on a wide land to grow crops. There may be difficult processes, but it will be a rewarding year of eventually gaining honor and achieving goals.\n\n💼 [Career & Business]\nWork intensity may increase and difficult tasks may be given. However, you will prove your qualities as a leader by overcoming them with your skills and patience. You will pass through crises with the help or support of superiors, and as a result, you will taste a great sense of accomplishment.\n\n💰 [Wealth]\nA year where you need to pay attention to expenditure management. There may be a lot of money going out, such as unexpected taxes or public utility charges. However, as you can expect incentives or bonuses as a result of steady efforts, sincerity is the key to calling wealth.\n\n❤️ [Love & Relationships]\nA responsible appearance comes across as attractive to the opposite sex. In romantic relationships, the bond deepens as you listen to each other\'s hardships and comfort each other. However, efforts for frequent communication even if short are needed as you may neglect partners due to a busy daily life.\n\n⚠️ [Cautions]\nBeware of immunity decline due to overwork. It\'s important to manage physical strength with regular meals and exercise, and relieve stress with positive thoughts.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ 2025 Eulsa Year Gyeong-Metal General Fortune: \'Gaining Honor while Taking Care of Practical Interests\'\n\n2025 is a year where the energy of \'Jeong-jae\' and \'Pyeon-gwan\' enters for you. It\'s like a solid rock being heated by fire and reborn as a precious sword. You will gain definite rewards for your efforts and socially prove your value.\n\n💼 [Career & Business]\nYou achieve great results with result-oriented thinking and drive. Especially recognized for abilities in finance, management, and technology fields. Luck to solve difficult problems and gain honor is strong, but responsibility also grows, so you may feel pressure. Believe in yourself and go forward boldly.\n\n💰 [Wealth]\nWealth luck is very good. Besides stable income, you gain practical profits through investments or side jobs. You will accurately grasp the flow of money and efficiently manage assets. However, refrain from spending large sums for honor.\n\n❤️ [Love & Relationships]\nAppeal to the opposite sex with a sincere and reliable appearance. In romantic relationships, you give the other person a sense of relief with a responsible attitude. In relationships, you may give a somewhat strict image, so it\'s good to talk with some soft humor occasionally.\n\n⚠️ [Cautions]\nPay attention to bone or joint health, and respiratory diseases. Also, soothe yourself with a mind of \'this is enough\' as you may pick on yourself due to perfectionist tendencies.';

  @override
  String get sajuFortune2025Sin =>
      '💎 2025 Eulsa Year Sin-Metal General Fortune: \'A Year of Wisdom Shining Amidst Change\'\n\n2025 is a year where the energy of \'Pyeon-jae\' and \'Jeong-gwan\' enters for you. It\'s like a sophisticated jewel revealing its value under brilliant lighting. It will be a pleasant year where social status rises along with unexpected windfalls.\n\n💼 [Career & Business]\nBusiness acumen improves and the ability to capture new opportunities is excellent. A time when bold challenges return as large profits. Within the organization, you gain trust with rational judgment and catch opportunities for promotion or transfer. However, be careful not to neglect the process by focusing too much on results.\n\n💰 [Wealth]\nA year where money luck enters. Opportunities to touch large wealth such as unexpected investment returns or inheritance arise. However, as expenditures may also become fancy, it\'s important to maintain planned spending habits.\n\n❤️ [Love & Relationships]\nYou become the protagonist in social gatherings with a fancy and attractive appearance. Dating luck is very strong, so you may receive advances from many people. In romantic relationships, you spend passionate and pleasant times. A good year to develop into a serious meeting.\n\n⚠️ [Cautions]\nPay attention to lung health or skin diseases. Also, always maintain humility and don\'t forget the mind to consider others as you may appear arrogant to people due to excessive confidence.';

  @override
  String get sajuFortune2025Im =>
      '🌊 2025 Eulsa Year Im-Water General Fortune: \'Producing Results by Exercising Wisdom\'\n\n2025 is a year where the energy of \'Sang-gwan\' and \'Pyeon-jae\' enters for you. It\'s like a large river winding and moistening a wide field. It will be a dynamic year of gaining large wealth and expanding activity range by exercising your talents and eloquence.\n\n💼 [Career & Business]\nEloquence improves and you achieve excellent results in marketing or PR fields. A very good time to commercialize your ideas or pioneer new markets. Will be the best year for those doing creative work. However, it\'s important to be polite as there may be friction with bosses.\n\n💰 [Wealth]\nWealth luck moves actively. Luck to earn money with your own skills is strong, and opportunities to roll large money come. However, caution is needed for speculative investments, and wealth luck will be maintained long only if you have a mind to give as much as you earned.\n\n❤️ [Love & Relationships]\nWith overflowing humor and charm, people never cease to be around you. A year where you can enjoy pleasant dating with high popularity among the opposite sex. In romantic relationships, you breathe life through diverse dates. However, be careful as a single light word may cause misunderstanding.\n\n⚠️ [Cautions]\nPay attention to kidney or urological system health. Also, pay attention to proper rest and nutrition as physical strength may be discharged due to a wide activity range.';

  @override
  String get sajuFortune2025Gye =>
      '💧 2025 Eulsa Year Gye-Water General Fortune: \'A Year of Sincerity Producing Stable Fruits\'\n\n2025 is a year where the energy of \'Sik-sin\' and \'Jeong-jae\' enters for you. It\'s like a clear drizzle moistening the land to prepare for a rich harvest. It will be a warm year where your efforts accumulate steadily and return as stable wealth and happiness.\n\n💼 [Career & Business]\nA year where sincerity becomes the best weapon. You produce steady results by fulfilling responsibilities and gain trust from colleagues. A good time to grow expertise, and you will feel rewarded through work you like. You can grow step by step in a stable environment.\n\n💰 [Wealth]\nA year that is economically relaxed and stable. Steady income occurs, and you will feel the fun of increasing assets frugally. There is food and clothing luck, so abundance is full in overall life. Savings are more advantageous than unreasonable investments.\n\n❤️ [Love & Relationships]\nYou give comfort to partners with a warm-hearted appearance. A year where you grow beautiful love while considering each other meticulously. If single, you are highly likely to meet a partner who communicates well and has similar values.\n\n⚠️ [Cautions]\nPay attention to stomach health or eating habit management. It\'s good to find vitality by giving new stimuli occasionally as you may become lazy by settling for comfort.';

  @override
  String get preparationForTomorrow => 'Vorbereitung auf morgen';

  @override
  String get howToMeetMoreLuck => 'Dein Weg zum Glück';

  @override
  String get enterName => 'Gib deinen Namen ein';

  @override
  String fortuneDateConfirm(String date) {
    return 'Horoskop für den $date prüfen?';
  }

  @override
  String get colorPurple => 'Lila';

  @override
  String get colorBlue => 'Blau';

  @override
  String get colorYellow => 'Gelb';

  @override
  String get colorRed => 'Rot';

  @override
  String get colorGreen => 'Grün';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorWhite => 'Weiß';

  @override
  String get colorBlack => 'Schwarz';

  @override
  String get itemPerfume => 'Parfüm';

  @override
  String get itemHandkerchief => 'Taschentuch';

  @override
  String get itemRing => 'Ring';

  @override
  String get itemWatch => 'Armbanduhr';

  @override
  String get itemGlasses => 'Brille';

  @override
  String get itemHat => 'Hut';

  @override
  String get itemBook => 'Buch';

  @override
  String get itemEarphones => 'Kopfhörer';

  @override
  String get itemMirror => 'Spiegel';

  @override
  String get itemPen => 'Stift';

  @override
  String get itemCoin => 'Münze';

  @override
  String get itemKey => 'Schlüssel';

  @override
  String get dirEast => 'Osten';

  @override
  String get dirWest => 'Westen';

  @override
  String get dirSouth => 'Süden';

  @override
  String get dirNorth => 'Norden';

  @override
  String get dirNorthEast => 'Nordosten';

  @override
  String get dirSouthEast => 'Südosten';

  @override
  String get dirNorthWest => 'Nordwesten';

  @override
  String get dirSouthWest => 'Südwesten';

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
  String get weatherConditionPartlyCloudy => 'Teilweise bewölkt';

  @override
  String get weatherConditionCloudy => 'Bewölkt';

  @override
  String get weatherConditionFoggy => 'Neblig';

  @override
  String get weatherConditionDrizzle => 'Nieselregen';

  @override
  String get weatherConditionRainy => 'Regnerisch';

  @override
  String get weatherConditionFreezingRain => 'Glatteisregen';

  @override
  String get weatherConditionSnowy => 'Schneefall';

  @override
  String get weatherConditionSnowGrains => 'Schneegriesel';

  @override
  String get weatherConditionRainShowers => 'Regenschauer';

  @override
  String get weatherConditionSnowShowers => 'Schneeschauer';

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
  String get allowAllItems => 'Please allow all items';

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
  String get wakeUpAlarm => 'Aufwach-Wecker';

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
  String get member => 'Mitglied';

  @override
  String get manageSajuInfo => 'Geburtsinfo verwalten';

  @override
  String get freeCharge => 'Gratis Refill';

  @override
  String get fortunePass => 'Glückspass';

  @override
  String get unlimitedNotSubscribed => 'Abo nicht aktiv';

  @override
  String get unlimitedInUse => 'Abo aktiv';

  @override
  String get subscribe => 'Abonnieren';

  @override
  String get manageSubscription => 'Abo verwalten';

  @override
  String get purchaseHistory => 'Kaufverlauf';

  @override
  String get customerCenter => 'Support';

  @override
  String get noNewNotifications => 'Keine neuen Benachrichtigungen.';

  @override
  String get noPurchaseHistory => 'Kein Kaufverlauf vorhanden.';

  @override
  String get none => 'Keine';

  @override
  String deleteConfirmMessage(String title) {
    return 'Möchtest du \"$title\" löschen?';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get notepad => 'Notizbuch';

  @override
  String get today => 'Heute';

  @override
  String get yearView => 'Jahr';

  @override
  String get monthView => 'Monat';

  @override
  String get weekView => 'Woche';

  @override
  String get dayView => 'Tag';

  @override
  String get noEvents => 'Keine Termine geplant.';

  @override
  String get noSavedMemos => 'Keine gespeicherten Memos.';

  @override
  String get holiday => 'Feiertag';

  @override
  String get photo => 'Foto';

  @override
  String get drawing => 'Zeichnung';

  @override
  String get drawingTitle => 'Zeichnung';

  @override
  String get pencil => 'Bleistift';

  @override
  String get marker => 'Marker';

  @override
  String get eraser => 'Radiergummi';

  @override
  String adjustThickness(String label) {
    return 'Dicke anpassen';
  }

  @override
  String get sticker => 'Sticker';

  @override
  String get event => 'Termin';

  @override
  String get memo => 'Memo';

  @override
  String get routineExercise => 'Sport';

  @override
  String get routineHiking => 'Wandern';

  @override
  String get routineCleaning => 'Putzen';

  @override
  String get routineTravel => 'Reisen';

  @override
  String get routineDate => 'Datum';

  @override
  String get routineConcert => 'Konzert';

  @override
  String get routineMovie => 'Film';

  @override
  String get routineMeeting => 'Besprechung';

  @override
  String get howIsYourMoodToday => 'Wie ist deine Stimmung heute?';

  @override
  String get complete => 'Fertig';

  @override
  String get amWithIcon => '☀️ AM';

  @override
  String get pmWithIcon => '🌙 PM';

  @override
  String get photoPermissionDescription =>
      'Um Fotos hinzuzufügen, erlaube den Zugriff in den Einstellungen.';

  @override
  String get goToSettings => 'Zu den Einstellungen';

  @override
  String get photoPermissionNeeded => 'Foto-Zugriff erforderlich.';

  @override
  String get fontSize => 'Schriftgröße';

  @override
  String get fontFamily => 'Schriftart';

  @override
  String get textColor => 'Textfarbe';

  @override
  String get textAlign => 'Ausrichtung';

  @override
  String get alignLeft => 'Links';

  @override
  String get alignCenter => 'Zentriert';

  @override
  String get alignRight => 'Rechts';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get fontSettings => 'Schrift-Einstellungen';

  @override
  String get imageAddedFromKeyboard => 'Bild über Tastatur hinzugefügt.';

  @override
  String get cancelWriting => 'Abbrechen';

  @override
  String get cancelWritingConfirm =>
      'Du hast ungespeicherte Änderungen. Möchtest du wirklich abbrechen?';

  @override
  String get continueWriting => 'Weiter schreiben';

  @override
  String get title => 'Titel';

  @override
  String get content => 'Inhalt';

  @override
  String get selectTime => 'Zeit wählen';

  @override
  String get noTime => 'Keine Zeit';

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
  String get routineSummary => 'Zusammenfassung';

  @override
  String get alarmOn => 'Wecker AN';

  @override
  String get alarmOff => 'Wecker AUS';

  @override
  String get contentHint => 'Inhalt hinzufügen';

  @override
  String get addEvent => 'Termin hinzufügen';

  @override
  String get manageItem => 'Eintrag verwalten';

  @override
  String get manageItemDescription => 'Was möchtest du mit diesem Eintrag tun?';

  @override
  String get noTitle => 'Kein Titel';

  @override
  String get selectTitleColor => 'Titelfarbe wählen';

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
  String fortuneCatchTime(int seconds) {
    return 'Time: ${seconds}s';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'Best: ${seconds}s';
  }

  @override
  String get fortuneCatchAngryHint => 'Vermeide den bösen Fortuni!';

  @override
  String get fortuneCatchInstruction => 'Fange die glücklichen Fortunis!';

  @override
  String fortuneCatchPointMinus(int points) {
    return '$points points deducted';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points Punkte';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo Kombi!';
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
  String missionAnalyzing(int index, int total) {
    return 'Mission $index/$total wird analysiert...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'Mission $index/$total: Zeigen Sie auf das Objekt in der Anleitung.';
  }

  @override
  String get missionPointSink => 'Zeigen Sie auf das Waschbecken.';

  @override
  String get missionPointRefrigerator => 'Zeigen Sie auf den Kühlschrank.';

  @override
  String get missionPointScale => 'Zeigen Sie auf die Waage.';

  @override
  String get missionPointFace => 'Zeigen Sie auf Ihr Gesicht.';

  @override
  String get missionPointObjectGeneric =>
      'Zeigen Sie auf das angegebene Objekt.';

  @override
  String get missionRecognizeObject => 'Bitte erkennen Sie das Objekt.';

  @override
  String get missionPerform => 'Bitte führen Sie die Mission aus.';

  @override
  String get initError => 'Bei der Initialisierung ist ein Fehler aufgetreten.';

  @override
  String get analyzingNextTarget => 'Nächstes Ziel wird analysiert...';

  @override
  String get errorOccurredGeneric => 'Ein Fehler ist aufgetreten';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total Success!';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total Erfolg! Abgleich erfolgreich!';
  }

  @override
  String get escape => 'Entkommen';

  @override
  String get pointObjectClearly =>
      'Machen Sie ein Foto, auf dem das Ziel deutlich sichtbar ist';

  @override
  String get matchingSuccess => 'Abgleich erfolgreich!';

  @override
  String get missionComplete => 'Mission abgeschlossen!';

  @override
  String get allMissionsComplete => 'Alle Missionen abgeschlossen!';

  @override
  String missionSnoozeMessage(int minutes) {
    return 'Mission erfolgreich! Aber es wird in $minutes Minuten gemäß den Einstellungen erneut klingeln.';
  }

  @override
  String get showFace => 'Bitte zeigen Sie Ihr Gesicht';

  @override
  String get keepWatching => 'Schauen Sie weiter auf den Bildschirm';

  @override
  String get recognizingFaceForFortune =>
      'Gesichtserkennung für die Physiognomie-Analyse';

  @override
  String get dataNotStored => 'Daten werden nicht gespeichert';

  @override
  String get solveProblem => 'Bitte lösen Sie das Problem.';

  @override
  String get correctAnswer => 'Richtige Antwort!';

  @override
  String get wrongAnswerRetry => 'Falsch. Bitte versuchen Sie es erneut.';

  @override
  String get correct => 'Richtig!';

  @override
  String get walkToDismiss => 'Please walk while holding your smartphone';

  @override
  String get shakeCount => 'Schüttelanzahl';

  @override
  String shakeTimes(int count) {
    return '$count Mal';
  }

  @override
  String tapTimes(int count) {
    return '$count Tippen';
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
  String get selectMissionTitle =>
      'Bitte wählen Sie eine Mission zum Beenden des Weckers aus.';

  @override
  String get ringtoneCategoryStandard => 'Standard';

  @override
  String get ringtoneCategoryCalm => 'Ruhig';

  @override
  String get ringtoneCategoryUpbeat => 'Fröhlich';

  @override
  String get ringtoneCategoryLoud => 'Laut';

  @override
  String get noRingtones => 'Keine Klingeltöne gefunden.';

  @override
  String get photoPermissionRequired =>
      'Berechtigung für den Fotozugriff ist erforderlich.';

  @override
  String get deleteImage => 'Bild löschen';

  @override
  String get longPressToDelete => 'Lange drücken zum Löschen.';

  @override
  String get videoLoadFail =>
      'Video konnte nicht geladen werden\nZum Wiederholen tippen';

  @override
  String get existingCapturedImages => 'Vorhandene aufgenommene Bilder';

  @override
  String deleteCount(int count) {
    return 'Löschen $count';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return 'Sind Sie sicher, dass Sie $count Bilder löschen möchten?\nDiese Aktion kann nicht rückgängig gemacht werden.';
  }

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
  String get cuckooClock => 'Kuckucksuhr';

  @override
  String get calmAlarm => 'Ruhiger Wecker';

  @override
  String get doorKnock => 'Türklopfen';

  @override
  String get earlySunrise => 'Früher Sonnenaufgang';

  @override
  String get goodMorningSound => 'Guten Morgen';

  @override
  String get inAHurry => 'In Eile';

  @override
  String get lovingYou => 'Liebe dich';

  @override
  String get sirenSound => 'Sirene';

  @override
  String get swingingSound => 'Schwingend';

  @override
  String get telephoneBusy => 'Telefon besetzt';

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
  String get retry => 'Wiederholen';

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
  String snoozeMinutesUnlimited(int minutes) {
    return '$minutes Min (unbegrenzt)';
  }

  @override
  String snoozeMinutesCount(int minutes, int current, int total) {
    return '$minutes Min ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => 'Beschwingter Tag';

  @override
  String get ringtone_cozy_day => 'Gemütlicher Tag';

  @override
  String get ringtone_sensible_day => 'Besonnener Tag';

  @override
  String get ringtone_play_with_me => 'Spiel mit mir';

  @override
  String get ringtone_refreshing_day => 'Erfrischender Tag';

  @override
  String get ringtone_new_beginning => 'Neuanfang';

  @override
  String get ringtone_self_love => 'Selbstliebe';

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
  String fortuneSelectTitleDate(String month, int day) {
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
  String fortuneResultTitleDate(int year, String month, int day) {
    return 'Glück für $year/$month/$day';
  }

  @override
  String get startDayButton => 'Starte deinen Tag';

  @override
  String get tarotName0 => 'Der Narr';

  @override
  String get tarotName1 => 'Der Magier';

  @override
  String get tarotName2 => 'Die Hohepriesterin';

  @override
  String get tarotName3 => 'Die Herrscherin';

  @override
  String get tarotName4 => 'Der Herrscher';

  @override
  String get tarotName5 => 'Der Hierophant';

  @override
  String get tarotName6 => 'Die Liebenden';

  @override
  String get tarotName7 => 'Der Wagen';

  @override
  String get tarotName8 => 'Die Kraft';

  @override
  String get tarotName9 => 'Der Eremit';

  @override
  String get tarotName10 => 'Das Rad des Schicksals';

  @override
  String get tarotName11 => 'Die Gerechtigkeit';

  @override
  String get tarotName12 => 'Der Gehängte';

  @override
  String get tarotName13 => 'Der Tod';

  @override
  String get tarotName14 => 'Die Mäßigkeit';

  @override
  String get tarotName15 => 'Der Teufel';

  @override
  String get tarotName16 => 'Der Turm';

  @override
  String get tarotName17 => 'Der Stern';

  @override
  String get tarotName18 => 'Der Mond';

  @override
  String get tarotName19 => 'Die Sonne';

  @override
  String get tarotName20 => 'Das Gericht';

  @override
  String get tarotName21 => 'Die Welt';

  @override
  String get tarotKeywords1 =>
      'Schöpfung, Wille, Fähigkeit, Realisierung, Vielseitigkeit';

  @override
  String get tarotDescription1 =>
      'Der Magier trägt ein rotes Gewand, eine Hand zeigt zum Himmel und die andere zur Erde, was die himmlische Kraft auf die Erde bringt. Auf dem Tisch befinden sich vier Elemente (Stab, Kelch, Schwert, Münze), was bedeutet, dass Sie bereits über alle Werkzeuge und Fähigkeiten verfügen, um Ihre Ziele zu erreichen.';

  @override
  String get tarotLoveMeaning1 =>
      'Dies ist eine Zeit, in der Ihr Charme seinen Höhepunkt erreicht hat und Sie beim anderen Geschlecht beliebt sind. Wenn Sie sich in einer Kennenlernphase befinden, können Sie die Beziehung mit Ihrer geistreichen Ausdrucksweise vertiefen und die Führung übernehmen.';

  @override
  String get tarotLoveDetail1 =>
      'Es ist eine großartige Gelegenheit, das Herz des anderen Geschlechts zu erobern, da Ihr Charme und Ihr Talent strahlen. Wenn es jemanden gibt, den Sie mögen, zögern Sie nicht, aktiv auf ihn zuzugehen. Ihr Sinn für Humor und Ihre vernünftigen Gespräche werden die andere Person erfreuen und es Ihnen ermöglichen, die Beziehung proaktiv zu führen. Wenn Sie Single sind, können Sie von mehreren Personen angesprochen werden, und wenn Sie ein Paar sind, wird die andere Person sehr bewegt sein, wenn Sie die Dating-Route planen oder ein Ereignis vorbereiten. Gewinnen Sie die Liebe mit Selbstvertrauen.';

  @override
  String get tarotWealthMeaning1 =>
      'Dies ist der richtige Zeitpunkt, um Einnahmen mit Ihren Fähigkeiten und Fertigkeiten zu generieren. Wenn Sie die Ideen in Ihrem Kopf in die Realität umsetzen, wird dies zu finanziellen Ergebnissen führen.';

  @override
  String get tarotWealthDetail1 =>
      'Dies ist die Zeit, in der Ihr Wissen, Ihre Fähigkeiten und Ihre Ideen zu Geld werden. Geben Sie sich nicht nur mit einem Gehalt zufrieden; generieren Sie zusätzliches Einkommen durch Nebenjobs oder freiberufliche Tätigkeiten. Kreative Planung, Verkaufstalent und Redegewandtheit werden hervorragend unter Beweis gestellt, was zu höheren Einnahmen als erwartet führt. Da Ihr Urteilsvermögen bei der Geldverwaltung wahrscheinlich ins Schwarze trifft, werden Sie gute Ergebnisse erzielen, wenn Sie proaktiv einen Finanzplan aufstellen und in die Tat umsetzen.';

  @override
  String get tarotSuccessMeaning1 =>
      'Ihre Arbeitsfähigkeit wird hervorragend unter Beweis gestellt und von Ihren Mitmenschen anerkannt. Wenn Sie etwas geplant haben, ist jetzt der Zeitpunkt, es in die Tat umzusetzen.';

  @override
  String get tarotSuccessDetail1 =>
      'Sie können sich an Ihrem Arbeitsplatz oder in Ihrem Studium abheben, indem Sie Ihre Fähigkeiten voll ausschöpfen. Egal, welchem Problem Sie gegenüberstehen, Sie können es mit Ihrem eigenen Witz und Humor lösen, und Sie werden von Ihren Kollegen oder Vorgesetzten als \'fähige Person\' anerkannt. Wenn Sie die Leitung eines neuen Projekts übernehmen oder eine wichtige Präsentation halten, können Sie diese erfolgreich abschließen. So wie sich Gelegenheiten für diejenigen ergeben, die vorbereitet sind, sind Sie bereits bestens vorbereitet. Glauben Sie an sich selbst und zeigen Sie Ihre Fähigkeiten selbstbewusst wie ein Protagonist auf der Bühne.';

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
  String get defaultVibration => 'Standardvibration';

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
  String get selectionComplete => 'Auswahl abgeschlossen';

  @override
  String get selectVibration => 'Vibrationsmuster auswählen';

  @override
  String get cameraMissionSequentialImageError =>
      'Bitte lege die Missionsbilder der Reihe nach fest.';

  @override
  String get copyEmailAction => 'E-Mail-Adresse kopieren';

  @override
  String get addMissionTitle => 'Neue Mission hinzufügen';

  @override
  String get recommendedMissionList => 'Empfohlene Missionen';

  @override
  String get recommendedMissionDesc =>
      'Empfohlene Missionen für einen gesunden Tag.';

  @override
  String get all => 'Alle';

  @override
  String get allMissions => 'Alle Missionen';

  @override
  String categoryMissions(Object category) {
    return '$category Missionen';
  }

  @override
  String get deselectAll => 'Alle abwählen';

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String get myCustomMissions => 'Meine benutzerdefinierten Missionen';

  @override
  String get myCustomMissionsDesc =>
      'Fügen Sie Missionen hinzu, die Sie zuvor erstellt haben.';

  @override
  String get createYourOwnMission => 'Eigene Mission erstellen';

  @override
  String get createYourOwnMissionDesc =>
      'Erstellen Sie eine Mission, wenn Sie nicht finden, was Sie suchen.';

  @override
  String get missionNameHint =>
      'Missionsname eingeben (z. B. Ins Fitnessstudio gehen)';

  @override
  String get selectCategory => 'Kategorie auswählen';

  @override
  String get getNotification => 'Benachrichtigung erhalten';

  @override
  String get notificationTime => 'Benachrichtigungszeit';

  @override
  String get missionCategoryHealth => 'Gesundheit';

  @override
  String get missionCategoryStudy => 'Lernen';

  @override
  String get missionCategoryRoutine => 'Routine';

  @override
  String get missionCategoryHobby => 'Hobby';

  @override
  String get missionCategoryOther => 'Andere';

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

  @override
  String get hourlyForecast => 'Stündliche Vorhersage';

  @override
  String get weeklyForecast => 'Wöchentliche Vorhersage';

  @override
  String hourFormat(Object hour) {
    return '$hour Uhr';
  }

  @override
  String get noNotifications => 'Keine neuen Benachrichtigungen.';

  @override
  String get adLoadFailed => 'Anzeige konnte nicht geladen werden';

  @override
  String get adLoading => 'Anzeige wird geladen...';

  @override
  String get removeAds => 'Anzeigen entfernen';

  @override
  String get close => 'Schließen';

  @override
  String get exitQuestion => 'Möchten Sie die App beenden?';

  @override
  String get exitApp => 'Beenden';

  @override
  String get shareResultDescription =>
      'Dies ist Ihr von Fortune Alarm analysiertes Glücksergebnis.';

  @override
  String get shareResultButton => 'Ergebnis teilen';

  @override
  String get unknownTime => 'Unbekannte Zeit';

  @override
  String get adLoadError =>
      'Die Anzeige konnte nicht geladen werden. Bitte versuchen Sie es in Kürze erneut.';

  @override
  String get adShowError =>
      'Die Anzeige konnte nicht angezeigt werden. Bitte versuchen Sie es in Kürze erneut.';

  @override
  String earnCookies(int count) {
    return 'Du hast $count Glückskekse verdient! 🎉';
  }

  @override
  String get freePassAfterTimeout =>
      'Ergebnisse werden kostenlos ohne Anzeige angezeigt! 🎉';

  @override
  String get adLoadDelay =>
      'Das Laden verzögert sich.\nBitte versuchen Sie es in Kürze erneut.';

  @override
  String get fortuneAccessTitle => 'Glück prüfen';

  @override
  String get fortuneAccessSubtitle =>
      'Überprüfen Sie Ihre Glücksergebnisse\nund erhalten Sie versteckte Geschenke!';

  @override
  String get watchAdButtonText => 'Anzeige ansehen für kostenlose Ergebnisse';

  @override
  String useCookiesButtonText(int count) {
    return '$count Glückskekse verwenden';
  }

  @override
  String get adFailFreePass =>
      'Die Anzeige konnte nicht geladen werden, daher lassen wir Sie diesmal kostenlos durch.';

  @override
  String get luckyNumberTitle => 'Meine Glückszahlen';

  @override
  String get luckyNumberSubtitle => 'Spezielle Glückszahlen, generiert von KI';

  @override
  String get luckyNumberGenerateButton => 'Glückszahlen generieren';

  @override
  String get luckyNumberGuideText =>
      'Entdecken Sie Ihre eigenen Glückszahlen\ndurch den KI-Algorithmus von Fortune Alarm';

  @override
  String get luckyNumberAnalysisStep1 => 'Sammle Glücksdaten...';

  @override
  String get luckyNumberAnalysisStep2 => 'Analyse aktueller Zahlenmuster...';

  @override
  String get luckyNumberAnalysisStep3 => 'Analyse der Energie für jede Zahl...';

  @override
  String get luckyNumberAnalysisStep4 => 'Lernen geometrischer Muster...';

  @override
  String get luckyNumberAnalysisStep5 =>
      'Anwenden von KI-Vorhersagemodell-Gewichtungen...';

  @override
  String get luckyNumberAnalysisStep6 =>
      'Berechnung der optimalen Glückskombination...';

  @override
  String get luckyNumberAnalysisStep7 =>
      'Analyse abgeschlossen! Generiere Glückszahlen';

  @override
  String get luckyNumberAnalysisFinal => 'Verarbeitung der finalen Daten...';

  @override
  String get luckyNumberGenerating => 'Glückszahlen werden generiert...';

  @override
  String get luckyNumberResultTitle => 'Glückszahlengenerierung abgeschlossen';

  @override
  String get luckyNumberResultSubtitle => '6 Zahlen + Zusatzzahl';

  @override
  String get luckyNumberDisclaimer =>
      '* Dieser Service dient der Unterhaltung. Die bereitgestellten Zahlen sind Referenzwerte, die von KI-Algorithmen generiert wurden, und garantieren keinen Gewinn.';

  @override
  String get luckyNumberShareTitle => 'Heutige Glückszahlen';

  @override
  String get luckyNumberShareDescription =>
      'Glückszahlen analysiert von Fortune Alarm.';

  @override
  String luckyNumberSetLabel(String label) {
    return 'Set $label';
  }

  @override
  String get luckyNumberRegenerateButton => 'Zahlen neu generieren';

  @override
  String get luckyNumberFeatureAiTitle => 'KI-Empfehlung';

  @override
  String get luckyNumberFeatureAiDesc => 'Smarter Algorithmus';

  @override
  String get luckyNumberFeatureSmartTitle => 'Smart';

  @override
  String get luckyNumberFeatureSmartDesc => 'Glückszahlen-Empfehlung';

  @override
  String get luckyNumberFeatureDataTitle => 'Datenanalyse';

  @override
  String get luckyNumberFeatureDataDesc => 'Optimale Kombination';

  @override
  String get fortunePassTitle => 'Fortune Pass';

  @override
  String get fortunePassTabFree => 'Kostenlos aufladen';

  @override
  String get fortunePassTabPremium => 'Premium Pass';

  @override
  String get fortunePassFreeChargeTitle => 'Kekse kostenlos aufladen';

  @override
  String get fortunePassFreeChargeButton =>
      'Anzeige ansehen und 1 Keks erhalten';

  @override
  String get fortunePassActivePlan => 'Aktueller Plan';

  @override
  String get fortunePassNoSubscription => 'Kein aktives Abonnement';

  @override
  String get fortunePassRestore => 'Wiederherstellen';

  @override
  String get fortunePassMonth1Title => '1 Monat Pass';

  @override
  String get fortunePassMonth1Desc =>
      'Alle Funktionen für 1 Monat freischalten';

  @override
  String get fortunePassMonth6Title => '6 Monate Pass';

  @override
  String get fortunePassMonth6Desc => 'Günstigeres 6-Monats-Abonnement';

  @override
  String get fortunePassYear1Title => '1 Jahr Pass';

  @override
  String get fortunePassYear1Desc => 'Bester Wert für ein ganzes Jahr';

  @override
  String get fortunePassBestPlan => 'Beliebtester Plan';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '$percent% Blitzangebot!';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% RABATT';
  }

  @override
  String get fortunePassPerMonth => ' /Monat';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return 'Gesamt $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => 'Monat';

  @override
  String get fortunePassUnit6Months => '6 Monate';

  @override
  String get fortunePassUnitYear => 'Jahr';

  @override
  String get fortunePassMyCookies => 'Meine Glückskekse';

  @override
  String get fortunePassCurrentStatus => 'Pass-Status';

  @override
  String get fortunePassStatusPremium => 'Premium Pass aktiv';

  @override
  String get fortunePassStatusFree => 'Standard-Benutzer';

  @override
  String get fortunePassStoreErrorTitle => 'Abonnement nicht verfügbar';

  @override
  String get fortunePassStoreErrorContent =>
      'Produktinformationen können derzeit nicht aus dem Store abgerufen werden.';

  @override
  String fortunePassSubscribeSale(int percent) {
    return 'Mit $percent% Rabatt abonnieren';
  }

  @override
  String get fortunePassSubscribeNow => 'Jetzt abonnieren';

  @override
  String get fortunePassApplied => 'Fortune Pass Abonnement angewendet.';

  @override
  String get fortunePassApplyFailed =>
      'Abonnement konnte nicht angewendet werden.';

  @override
  String get fortunePassRestored => 'Kaufhistorie wiederhergestellt.';

  @override
  String get fortunePassRestoreFailed =>
      'Wiederherstellung der Kaufhistorie fehlgeschlagen.';

  @override
  String get fortunePassTimeSaleTitle =>
      'Warten Sie! Ein Geschenk ist angekommen 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return 'Originalpreis $price/Jahr';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '$price/Jahr';
  }

  @override
  String get fortunePassTimeSaleBadge =>
      '50% Rabatt bei Abonnement innerhalb von 3 Minuten!';

  @override
  String get fortunePassTimeSaleButton => 'Rabatt erhalten und Pro starten';

  @override
  String get fortunePassTimeSaleCancel => 'Vielleicht später';

  @override
  String get fortunePassTimeSaleStartMessage =>
      'Der 3-Minuten-Rabatt hat begonnen! Überprüfen Sie das Banner oben.';

  @override
  String get fortunePassSubscribeButton => 'Jetzt abonnieren';

  @override
  String get fortunePassSubscribeDiscountButton => 'Mit 50% Rabatt abonnieren';

  @override
  String get fortunePassCookieBalance => 'Deine Glückskekse';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'Pass aktiv';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return 'Gesamt $price / $unit';
  }

  @override
  String get fortunePassPopularPlan => 'Beliebter Plan';

  @override
  String get fortunePassPricePerMonth => ' /Mon.';

  @override
  String get fortunePassPaymentFailed => 'Zahlungsanfrage fehlgeschlagen.';

  @override
  String get fortunePassSubscriptionFailed =>
      'Abonnement konnte nicht angewendet werden. Bitte überprüfen Sie Ihr Netzwerk.';

  @override
  String get fortunePassSubscriptionSuccess =>
      'Fortune Pass Abonnement wurde angewendet.';

  @override
  String get fortunePassCannotSubscribeTitle => 'Abonnement nicht möglich';

  @override
  String get fortunePassCannotSubscribeMessage =>
      'Produktinformationen können derzeit nicht aus dem Store abgerufen werden.\n\n[Checkliste]\n1. Google Play / App Store Login-Status\n2. Internetverbindung\n3. Registrierungsstatus des Testgeräts';

  @override
  String get year => 'J';

  @override
  String get month => 'M';

  @override
  String get day => 'T';

  @override
  String get sajuProfileTitle =>
      'Hauptprofil der Vier Säulen des Schicksals bearbeiten';

  @override
  String get sajuNameLabel => 'Name';

  @override
  String get sajuNameHint => 'Bitte geben Sie Ihren Namen ein';

  @override
  String get sajuNameHelper => 'Bis zu 6 Zeichen';

  @override
  String get sajuGenderLabel => 'Geschlecht';

  @override
  String get sajuGenderMale => 'Männlich';

  @override
  String get sajuGenderFemale => 'Weiblich';

  @override
  String get sajuBirthDateLabel => 'Geburtsdatum';

  @override
  String get sajuBirthTimeLabel => 'Geburtszeit';

  @override
  String get sajuUnknownTime => 'Unbekannte Zeit';

  @override
  String get sajuEditComplete => 'Bearbeitung abgeschlossen';

  @override
  String get sajuSolar => 'Solar';

  @override
  String get sajuLunar => 'Lunar';

  @override
  String get sajuSelectBirthDate => 'Geburtsdatum auswählen';

  @override
  String get sajuSelectBirthTime => 'Geburtszeit auswählen';

  @override
  String get compatibilityTitle => 'Kompatibilität prüfen';

  @override
  String get compatibilityInputHeader =>
      'Bitte geben Sie Informationen für beide ein';

  @override
  String get compatibilityInputSubtitle =>
      'Wir analysieren die exakte Kompatibilität basierend auf den Informationen der Vier Säulen des Schicksals.';

  @override
  String get compatibilityMyInfo => 'Meine Informationen';

  @override
  String get compatibilityInputMyNameGuide =>
      'Bitte geben Sie Ihren Namen ein.';

  @override
  String get compatibilityInputPartnerNameGuide =>
      'Bitte geben Sie den Namen des Partners ein.';

  @override
  String get compatibilityPartnerInfo => 'Informationen zum Partner';

  @override
  String get compatibilityLoadSaved => 'Gespeicherte Informationen laden';

  @override
  String get compatibilityTitleBest => 'Ein Match im Himmel! ❤️';

  @override
  String get compatibilityDescBest =>
      'Die beste Kompatibilität, die man sich wünschen kann. Lassen Sie sich nicht gehen!';

  @override
  String get compatibilityTitleGreat => 'Eine sehr gute Beziehung 💕';

  @override
  String get compatibilityDescGreat =>
      'Ein großartiger Partner, der sich gegenseitig unterstützt.';

  @override
  String get compatibilityTitleGood => 'Ein gut passendes Paar 😊';

  @override
  String get compatibilityDescGood =>
      'Es gibt einige Unterschiede, aber Sie können eine schöne Liebe haben, während Sie sich aneinander anpassen.';

  @override
  String get compatibilityTitleEffort => 'Anstrengung ist erforderlich 🧐';

  @override
  String get compatibilityDescEffort =>
      'Es gibt viele Unterschiede. Verständnis und Rücksichtnahme sind der Schlüssel zur Beziehung.';

  @override
  String get compatibilityTitleDifficult => 'Viel Anpassung erforderlich 😅';

  @override
  String get compatibilityDescDifficult =>
      'Persönlichkeitsunterschiede können groß sein. Sie müssen die Unterschiede des anderen tief verstehen.';

  @override
  String get compatibilityResultButton => 'Kompatibilitätsergebnis anzeigen';

  @override
  String get compatibilityDeleteTooltip => 'Löschen';

  @override
  String get compatibilityGenderMale => 'Männlich';

  @override
  String get compatibilityGenderFemale => 'Weiblich';

  @override
  String get tojeongInputTitle => 'Tojeong Jahresorakel Informationseingabe';

  @override
  String tojeongCheckFortune(int year) {
    return 'Überprüfen Sie Ihr $year\nTojeong Jahresorakel';
  }

  @override
  String get tojeongInputGuide =>
      'Bitte geben Sie Ihr Geburtsdatum und Ihre Geburtszeit ein\nfür eine genaue Analyse.';

  @override
  String tojeongViewResult(int year) {
    return 'View $year Tojeong Jahresorakel';
  }

  @override
  String get tojeongCheckButton => 'Tojeong Jahresorakel prüfen';

  @override
  String get tojeongSaveAndCheck =>
      'Speichern und Tojeong Jahresorakel ansehen';

  @override
  String get tojeongYearSelect => 'Glücksjahr auswählen';

  @override
  String tojeongResultTitle(int year) {
    return '$year Tojeong Jahresorakel';
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
  String get tojeongTotalLuck => 'Gesamtglück';

  @override
  String get tojeongProcess => 'Prozess';

  @override
  String get tojeongResult => 'Ergebnis';

  @override
  String get tojeongMonthlyLuck => 'Monatliches Glück';

  @override
  String get tojeongShareResult => 'Ergebnisse teilen';

  @override
  String tojeongShareTitle(Object year) {
    return '$year Tojeong Jahresorakel Ergebnisse';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return '${name}s Tojeong Jahresorakel Gesamtbewertung.\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => 'Zieljahr';

  @override
  String get sajuDeleteTitle => 'Vier Säulen des Schicksals Info löschen';

  @override
  String sajuDeleteConfirm(String name) {
    return 'Sind Sie sicher, dass Sie die Informationen von $name löschen möchten?';
  }

  @override
  String get sajuProfileSelect => 'Vier Säulen des Schicksals Info auswählen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get modify => 'Ändern';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\nService ist in Vorbereitung.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'Wir arbeiten hart daran, Ihnen\ngenauere und nützlichere Glücksinformationen bereitzustellen!';

  @override
  String get goBack => 'Zurück';

  @override
  String get name => 'Name';

  @override
  String get nameInputGuide => 'Bitte geben Sie Ihren Namen ein';

  @override
  String get sajuLunarSolar => 'Solar/Lunar';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => 'Glücksjahr auswählen';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'Profil auswählen';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get newYearFortuneInputTitle => 'Neujahrsglück Information';

  @override
  String newYearFortuneHeader(int year) {
    return 'Wie wird dein Glück im Jahr $year\nsein?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'Bitte geben Sie Ihr Geburtsdatum und Ihre Geburtszeit ein\nfür eine genaue Analyse der Vier Säulen des Schicksals.';

  @override
  String newYearFortuneViewButton(int year) {
    return 'Glück für $year ansehen';
  }

  @override
  String get newYearFortuneCheckButton => 'Glück prüfen';

  @override
  String get newYearFortuneSaveAndCheckButton => 'Speichern und Glück ansehen';

  @override
  String newYearFortuneResultTitle(int year) {
    return 'Mein Neujahrsglück $year';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return 'Mein Neujahrsglück-Ergebnis $year';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return 'New Year fortune for $name.\n\n$desc...';
  }

  @override
  String get sajuChartTitle => 'Diagramm der Vier Säulen des Schicksals';

  @override
  String get sajuHour => 'Stunde';

  @override
  String get sajuDay => 'Tag';

  @override
  String get sajuMonth => 'Monat';

  @override
  String get sajuYear => 'Jahr';

  @override
  String get ohaengAnalysisTitle => 'Analyse der Fünf Elemente';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'Dein dominantes Element: $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ Die Fünf Elemente (Holz, Feuer, Erde, Metall, Wasser) sind die grundlegenden Energien der Vier Säulen des Schicksals. Während ein Gleichgewicht ideal ist, können Sie Ihre Tendenzen durch diese Elemente verstehen.';

  @override
  String yearlyTotalLuck(int year) {
    return 'Gesamtglück $year';
  }

  @override
  String get fortuneDisclaimer =>
      'Dieses Glück dient der Unterhaltung. Dein Leben hängt von deinem eigenen Willen ab.';

  @override
  String get compatibilityResultTitle => 'Kompatibilitätsergebnis';

  @override
  String get compatibilityScore => 'Kompatibilitätsbewertung';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => 'Unsere Kompatibilität';

  @override
  String get compatibilityShareResult => 'Ergebnis teilen';

  @override
  String get compatibilityRetryButton => 'Mit jemand anderem prüfen';

  @override
  String get compatibilitySummary => 'Zusammenfassung';

  @override
  String get tojeongSaveAndCheckButton =>
      'Speichern und Tojeong Jahresorakel ansehen';

  @override
  String get tojeongSangsuKeyword1 =>
      'eine Zeit, die starken Antrieb und Führung erfordert';

  @override
  String get tojeongSangsuKeyword2 =>
      'eine Zeit voller aktiver Beziehungen und Freude';

  @override
  String get tojeongSangsuKeyword3 =>
      'eine Zeit, in der Intelligenz und Leidenschaft glänzen';

  @override
  String get tojeongSangsuKeyword4 =>
      'eine Zeit des schnellen Wandels und neuer Anfänge';

  @override
  String get tojeongSangsuKeyword5 =>
      'eine Zeit, die eine flexible Einstellung und sanfte Kommunikation erfordert';

  @override
  String get tojeongSangsuKeyword6 =>
      'eine Zeit, um Schwierigkeiten mit Weisheit und Geduld zu überwinden';

  @override
  String get tojeongSangsuKeyword7 =>
      'eine Zeit, um Stabilität zu suchen und innere Stärke aufzubauen';

  @override
  String get tojeongSangsuKeyword8 =>
      'eine Zeit, um Tugend mit Inklusivität und einem warmen Herzen aufzubauen';

  @override
  String get tojeongJungsuKeyword1 => 'Sie werden einen Helfer treffen';

  @override
  String get tojeongJungsuKeyword2 =>
      'es wird gute Nachrichten in Dokumenten oder Verträgen geben';

  @override
  String get tojeongJungsuKeyword3 =>
      'Sie werden vor neuen Herausforderungen und Möglichkeiten stehen';

  @override
  String get tojeongJungsuKeyword4 =>
      'Erfolg und Ehre bei der Arbeit werden folgen';

  @override
  String get tojeongJungsuKeyword5 =>
      'Sie sollten Ihre Finanzen sorgfältig verwalten';

  @override
  String get tojeongJungsuKeyword6 =>
      'Sie sollten der Pflege Ihrer Gesundheit Priorität einräumen';

  @override
  String get tojeongHasuKeyword1 => 'Sie werden großen Erfolg haben.';

  @override
  String get tojeongHasuKeyword2 =>
      'Sie werden die Belohnung für Ihre Bemühungen ernten.';

  @override
  String get tojeongHasuKeyword3 =>
      'Sie werden durch Geduld eine Krise in eine Chance verwandeln.';

  @override
  String tojeongCoreMessage(Object hasu, Object jungsu, Object sangsu) {
    return 'In diesem Jahr, inmitten von $sangsu, $jungsu und schließlich $hasu';
  }

  @override
  String get tojeongSangsuDetail1 =>
      'Es ist eine Situation, in der Himmel und Erde Ihnen helfen. Es ist ein Jahr, in dem Sie großartige Ergebnisse erzielen können, wenn Sie mit starkem Antrieb vorangehen. Wie ein Drache, der in den Himmel aufsteigt, ist Ihre Energie kraftvoll und hell. Sie werden viele Gelegenheiten haben, Führungsqualitäten zu zeigen und Anerkennung von Ihren Mitmenschen zu erhalten. Zu dogmatisches Handeln kann jedoch Ressentiments hervorrufen, daher ist es wichtig, integrativ zu sein.';

  @override
  String get tojeongSangsuDetail2 =>
      'Es ist, als würde man einen Stein in einen ruhigen See werfen und Wellen schlagen. Es ist ein Jahr mit viel Freude und Vergnügen, aber Sie müssen vorsichtig vor Klatsch sein, der durch Versprecher verursacht wird. Ihr soziales Leben wird aktiv und Ihre Popularität wird steigen, aber das kann auch Eifersucht mit sich bringen. Sie könnten bei einem angenehmen Treffen oder einer Veranstaltung einen guten Partner kennenlernen.';

  @override
  String get tojeongSangsuDetail3 =>
      'Es ist wie eine helle Sonne, die über die ganze Welt scheint. Ihr Verstand und Ihre Leidenschaft werden glänzen, und Sie könnten sich in den Bereichen Studium oder Kunst hervortun. Ihr Ruf wird steigen und Sie werden bekannt werden, aber Sie müssen ein Temperament zügeln, das so schnell wie Feuer ist, um Ärger zu vermeiden. Während die Dinge nach außen hin glanzvoll aussehen, fühlen Sie sich im Inneren vielleicht einsam, also konzentrieren Sie sich auf die innere Substanz.';

  @override
  String get tojeongSangsuDetail4 =>
      'Es werden schnelle Veränderungen erwartet, wie ein Donnerschlag bei klarem Himmel. Ihre Energie ist aktiv und unternehmungslustig, was es zu einer guten Zeit macht, neue Dinge zu beginnen. Sie werden mit Umzügen oder Veränderungen beschäftigt sein. Der Anfang mag laut sein, aber das Ende könnte vage sein, also brauchen Sie die Ausdauer, um zu beenden, was Sie begonnen haben.';

  @override
  String get tojeongSangsuDetail5 =>
      'Es ist eine Zeit, in der alles wieder zum Leben erwacht, wenn eine sanfte Frühlingsbrise weht. Wenn Sie mit einer flexiblen Einstellung reagieren, werden sich versperrte Wege reibungslos öffnen. Sie können Gewinne im Geschäft oder Handel erzielen, und gute Nachrichten werden von weit her kommen. Unentschlossenheit kann jedoch zu verpassten Gelegenheiten führen, daher ist Entschlossenheit gefragt, wenn die Zeit gekommen ist.';

  @override
  String get tojeongSangsuDetail6 =>
      'Es ist wie Schwimmen in tiefem Wasser. Während es an der Oberfläche ruhig aussieht, kann es im Inneren Sorgen geben. Sie müssen Weisheit einsetzen, um Schwierigkeiten zu überwinden, und es ist am besten, übermäßige Investitionen oder Expansionen zu vermeiden. Wenn Sie geduldig auf den richtigen Zeitpunkt warten, wird sicherlich ein guter Tag kommen. Achten Sie auf Ihre Gesundheit.';

  @override
  String get tojeongSangsuDetail7 =>
      'Es ist, als ob ein großer Berg Ihren Weg versperrt, aber sobald Sie ihn überquert haben, wird sich eine weite Ebene ausbreiten. Wenn Sie Schwierigkeiten mit festem Willen ertragen, werden Sie große Früchte ernten. Es ist von Vorteil, Ihre aktuelle Position beizubehalten und sich auf die innere Stabilität zu konzentrieren. Stabilität ist besser als voreilige Veränderungen, und der Aufbau von Vertrauen ist wichtig.';

  @override
  String get tojeongSangsuDetail8 =>
      'Es ist eine Zeit, um Samen auf weitem Land zu säen. Wenn Sie Ihre Umgebung mit Inklusivität und Geduld annehmen, werden Sie Tugend aufbauen. Wenn Sie Menschen mit einem warmen, mutterähnlichen Herzen behandeln, können Sie Hilfe von anderen erhalten. Investitionen für die Zukunft, statt sofortiger Ergebnisse, werden in diesem Jahr glänzen. In Ihrem Zuhause wird Frieden einkehren.';

  @override
  String get tojeongJungsuDetail1 =>
      'Ein Helfer kommt an Ihre Tür und bringt freudige Ereignisse. Blockierte Angelegenheiten werden sich lösen und Wohlstand wird einfließen. Wenn Sie Dinge mit einem Partner planen, steigt die Erfolgswahrscheinlichkeit.';

  @override
  String get tojeongJungsuDetail2 =>
      'Es kann eine Feier zu Hause geben oder Sie heißen ein neues Familienmitglied willkommen. Dokumentenglück ist gut, was es günstig für Verträge oder Verkäufe macht. Kleine Streitigkeiten könnten jedoch zu großen Kämpfen führen, seien Sie also vorsichtig mit Ihren Worten und Taten.';

  @override
  String get tojeongJungsuDetail3 =>
      'Sie sind dazu bestimmt, Ihre Flügel in einem fremden Land auszubreiten oder weit weg zu ziehen. Sie können neue Möglichkeiten durch Reisen oder Geschäftsreisen gewinnen. Wenn Sie sich ohne Angst vor Veränderungen herausfordern, werden Sie gute Ergebnisse erzielen.';

  @override
  String get tojeongJungsuDetail4 =>
      'Ehre folgt, wenn Sie Anerkennung oder eine Beförderung am Arbeitsplatz erhalten. Es ist eine günstige Zeit für das Bestehen von Prüfungen oder den Erwerb von Zertifizierungen. Fühlen Sie sich frei, Ihre Fähigkeiten in vollem Umfang unter Beweis zu stellen.';

  @override
  String get tojeongJungsuDetail5 =>
      'Das Wohlstandsglück ist stark, aber die Ausgaben könnten auch steigen. Sie müssen bei der Geldverwaltung gründlich sein und auf impulsive Ausgaben verzichten. Am besten ist es, Finanztransaktionen mit engen Bekannten zu vermeiden.';

  @override
  String get tojeongJungsuDetail6 =>
      'Es ist eine Zeit, besonders auf Ihre Gesundheit zu achten. Vermeiden Sie Überarbeitung und gönnen Sie sich viel Ruhe. Es ist auch gut, die Versicherung in Vorbereitung auf unerwartete Unfälle oder Krankheiten zu überprüfen.';

  @override
  String get tojeongHasuDetail1 =>
      'Infolgedessen wird sich alles reibungslos lösen und Ihre Wünsche werden in Erfüllung gehen. Sie werden sicherlich Belohnungen für Ihre Bemühungen erhalten und den Neid Ihrer Mitmenschen gewinnen. Wenn Sie Ihre ursprüngliche Einstellung nicht verlieren, werden Ihre Segnungen lange anhalten.';

  @override
  String get tojeongHasuDetail2 =>
      'Es mag einige Schwierigkeiten im Prozess geben, aber wenn Sie durchhalten und hart arbeiten, werden Sie schließlich Ihr Ziel erreichen. Nichts wird leicht gewonnen, also werden Sie ernten, wofür Sie gearbeitet haben. Es ist ein Glück der späten Blüte.';

  @override
  String get tojeongHasuDetail3 =>
      'Sie könnten auf unerwartete Hindernisse stoßen, aber wenn Sie ohne Frustration durchhalten, können Sie eine Krise in eine Chance verwandeln. Wenn Sie Gier loslassen und Ihren Geist klären, werden stattdessen gute Dinge passieren. Weisheit, um Unglück in einen Segen zu verwandeln, ist gefragt.';

  @override
  String get tojeongGeneralWealthGood =>
      'Das Wohlstandsglück ist gut. Einkommen kann aus unerwarteten Quellen entstehen, oder Investitionen können gute Ergebnisse erzielen. So viel Geld, wie hereinkommt, kann jedoch auch wieder hinausgehen, also konzentrieren Sie sich aufs Sparen.';

  @override
  String get tojeongGeneralWealthBad =>
      'Der Wohlstandsfluss ist möglicherweise nicht reibungslos. Sie sollten unnötige Ausgaben reduzieren und sich das Sparen zur Gewohnheit machen. Seien Sie vorsichtig bei Finanztransaktionen und konsultieren Sie Experten für Investitionen.';

  @override
  String get tojeongGeneralCareerGood =>
      'Gelegenheiten, Anerkennung in Ihrer Karriere oder Ihrem Unternehmen zu gewinnen, werden kommen. Es ist eine gute Zeit für Beförderungen, Berufswechsel oder die Gründung eines Unternehmens. Mit guten Beziehungen lassen sich bessere Ergebnisse erzielen.';

  @override
  String get tojeongGeneralCareerBad =>
      'Am besten ist es, den aktuellen Zustand beizubehalten. Konzentrieren Sie sich auf Ihre aktuellen Aufgaben und bauen Sie Ihre Fähigkeiten aus, anstatt neue Unternehmungen zu starten. Sie könnten sich in Beziehungen zu Kollegen oder Vorgesetzten gestresst fühlen, also beruhigen Sie Ihren Geist.';

  @override
  String get tojeongGeneralLoveGood =>
      'Das Liebesglück steigt, Singles können einen guten Partner finden und die Liebe von Paaren wird sich vertiefen. Lachen und Harmonie werden das Haus erfüllen. Es ist eine gute Zeit für Heiratsgespräche.';

  @override
  String get tojeongGeneralLoveBad =>
      'Aufgrund trivialer Missverständnisse können Argumente entstehen. Verständnis und Rücksichtnahme auf die Position des anderen sind gefragt. Versuchen Sie, Probleme durch rationalen Dialog statt durch emotionale Reaktionen zu lösen.';

  @override
  String get optional => 'Optional';

  @override
  String get sajuSolarHint =>
      'Tojeong Jahresorakel ist am genauesten, wenn es auf der Grundlage des Mondgeburtstags analysiert wird.';

  @override
  String get yourFortune => 'Dein Glück';

  @override
  String get guaUpper => 'Oberes Gua';

  @override
  String get guaMiddle => 'Mittleres Gua';

  @override
  String get guaLower => 'Unteres Gua';

  @override
  String get guaCode => 'Gua-Code';

  @override
  String get viewAgain => 'Erneut prüfen';

  @override
  String get zodiacAries => 'Widder';

  @override
  String get zodiacTaurus => 'Stier';

  @override
  String get zodiacGemini => 'Zwillinge';

  @override
  String get zodiacCancer => 'Krebs';

  @override
  String get zodiacLeo => 'Löwe';

  @override
  String get zodiacVirgo => 'Jungfrau';

  @override
  String get zodiacLibra => 'Waage';

  @override
  String get zodiacScorpio => 'Skorpion';

  @override
  String get zodiacSagittarius => 'Schütze';

  @override
  String get zodiacCapricorn => 'Steinbock';

  @override
  String get zodiacAquarius => 'Wassermann';

  @override
  String get zodiacPisces => 'Fische';

  @override
  String get elementFire => 'Feuer';

  @override
  String get elementEarth => 'Erde';

  @override
  String get elementAir => 'Luft';

  @override
  String get elementWater => 'Wasser';

  @override
  String get compatibilityCategoryZodiac => 'Tierkreis-Kompatibilität';

  @override
  String get compatibilityCategoryInner => 'Innere Kompatibilität';

  @override
  String get compatibilityCategoryConstellation => 'Sternbild-Kompatibilität';

  @override
  String get compatibilitySummarySamhap =>
      'Beste Tierkreis-Übereinstimmung (Samhap)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return 'Die $animal1 und $animal2 passen perfekt zusammen und ergänzen die Schwächen des anderen. Diese Beziehung schafft eine großartige Synergie, wenn man zusammen ist.';
  }

  @override
  String get compatibilitySummaryYukhap =>
      'Großartige Tierkreis-Übereinstimmung (Yukhap)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return 'Die $animal1 und $animal2 haben eine starke gegenseitige Anziehungskraft. Es ist leicht, von Anfang an eine Verbindung zu spüren.';
  }

  @override
  String get compatibilitySummaryChung =>
      'Beziehung, die Anstrengung erfordert (Chung)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return 'Die $animal1 und $animal2 haben unterschiedliche Temperamente und können aneinandergeraten. Es ist notwendig, die Unterschiede des anderen zu respektieren und Rücksichtnahme zu zeigen.';
  }

  @override
  String get compatibilitySummaryWonjin =>
      'Beziehung, die Verständnis erfordert (Wonjin)';

  @override
  String get compatibilityDescWonjin =>
      'Dies ist eine Beziehung, in der Sie gelegentlich ohne klaren Grund Groll oder Traurigkeit verspüren könnten. Häufige Kommunikation wird empfohlen, um Missverständnisse zu reduzieren.';

  @override
  String get compatibilitySummaryDefaultZodiac =>
      'Durchschnittliche Tierkreis-Übereinstimmung';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return 'Die $animal1 und $animal2 haben eine reibungslose Beziehung ohne größere Konflikte.';
  }

  @override
  String get compatibilitySummaryCheonganHap => 'Seelenverwandte (CheonganHap)';

  @override
  String get compatibilityDescCheonganHap =>
      'Die Persönlichkeiten und Werte beider Individuen sind perfekt aufeinander abgestimmt. Sie sind Seelenverwandte, die sich auch ohne Worte verstehen.';

  @override
  String get compatibilitySummarySangsaeng =>
      'Gegenseitig vorteilhaft (Sangsaeng)';

  @override
  String get compatibilityDescSangsaeng =>
      'Eine positive Beziehung, in der Sie sich gegenseitig unterstützen und beim Wachsen helfen.';

  @override
  String get compatibilitySummarySanggeuk =>
      'Beziehung, die Anpassung erfordert (Sanggeuk)';

  @override
  String get compatibilityDescSanggeuk =>
      'Es kann Persönlichkeitsunterschiede geben, aber es ist auch eine Beziehung, in der Sie die Schwächen des anderen ergänzen können.';

  @override
  String get compatibilitySummaryDefaultInner => 'Bequem wie Freunde';

  @override
  String get compatibilityDescDefaultInner =>
      'Eine Beziehung, in der Sie ähnliche Tendenzen haben und die Zeit bequem wie Freunde verbringen können.';

  @override
  String get compatibilitySummarySameElement =>
      'Treffen ähnlicher Persönlichkeiten';

  @override
  String compatibilityDescSameElement(String element) {
    return 'Sie beide haben die Tendenz \'$element\', was Ihre Werte und Handlungsweisen sehr ähnlich macht.';
  }

  @override
  String get compatibilitySummaryCompatibleElement =>
      'Harmonisches Gleichgewicht';

  @override
  String get compatibilityDescCompatibleElement =>
      'Eine Beziehung, in der verschiedene Reize harmonisch miteinander verschmelzen.';

  @override
  String get compatibilitySummaryIncompatibleElement => 'Verschiedene Reize';

  @override
  String get compatibilityDescIncompatibleElement =>
      'Da Sie unterschiedliche Temperamente haben, mag es sich anfangs ungewohnt anfühlen, aber es ist eine Freude, sich kennenzulernen.';

  @override
  String get compatibilitySummaryDefaultConstellation =>
      'Durchschnittliche Harmonie';

  @override
  String get compatibilityDescDefaultConstellation =>
      'Eine Beziehung, die basierend auf den Tierkreiszeichen einigermaßen gut zusammenpasst.';
}
