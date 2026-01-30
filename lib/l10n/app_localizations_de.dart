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
  String get language => 'Sprache';

  @override
  String get languageKorean => 'Koreanisch';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageJapanese => 'Japanisch';

  @override
  String get languageChinese => 'Chinesisch';

  @override
  String get languageRussian => 'Russisch';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageGerman => 'Deutsch';

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
  String get missionSuccess => 'Mission erfolgreich!';

  @override
  String get cheeringMessage1 => 'Einen schönen Tag noch!';

  @override
  String get cheeringMessage2 => 'Ich drücke dir heute die Daumen!';

  @override
  String get cheeringMessage3 => 'Es wird ein wunderbarer Tag.';

  @override
  String get todaysCheering => 'Botschaft des Tages';

  @override
  String get notificationWakeUpBody => 'Zeit zum Aufstehen!';

  @override
  String get notificationMissionBody =>
      'Erfülle die Mission und schalte den Wecker aus!';

  @override
  String get notificationSafetyBody =>
      'Der Wecker wurde zwangsweise geschlossen! Bitte beende die Mission.';

  @override
  String get notificationRingingBody => 'Der Wecker klingelt!';

  @override
  String get snoozePrefix => '[Schlummern]';

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
  String hoursMinutesRemaining(String hours, String minutes) {
    return 'Klingelt in $hours Std $minutes Min';
  }

  @override
  String minutesRemaining(String minutes) {
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
  String snoozeInfo(String minutes, String count) {
    return '$minutes Min x $count Mal';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
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
  String get no => 'No';

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
      'Ihre scharfen, klaren Augen spiegeln schnelles Urteilsvermögen und starke Entschlossenheit wider.';

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
  String get supplementAlarmTitle =>
      'Zeit, deine Nahrungsergänzungsmittel einzunehmen! 💊';

  @override
  String get alarmVolume => 'Alarmlautstärke';

  @override
  String get alarmTimeList => 'Alarmzeitliste';

  @override
  String get noAlarmTimesAdded => 'Keine Alarmzeiten hinzugefügt';

  @override
  String get alarmTimeDeleted => 'Alarmzeit wurde gelöscht';

  @override
  String get addAlarmTime => 'Alarmzeit hinzufügen';

  @override
  String get editAlarmTime => 'Alarmzeit bearbeiten';

  @override
  String get defaultRingtone => 'Standardklingelton';

  @override
  String get takeSupplementsNow =>
      'Bitte nehmen Sie Ihre Nahrungsergänzungsmittel ein und zeichnen Sie sie auf!';

  @override
  String get nextTime => 'Nächstes Mal einnehmen';

  @override
  String get take => 'Einnehmen';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get notificationTime => 'Benachrichtigungszeit';

  @override
  String get start => 'Start';

  @override
  String get end => 'Ende';

  @override
  String get notificationInterval => 'Benachrichtigungsintervall';

  @override
  String get waterDrankToday => 'Heute getrunkenes Wasser';

  @override
  String get goal => 'Ziel';

  @override
  String get cup => 'Tasse';

  @override
  String get waterIntakeRecord => 'Wasseraufnahme-Aufzeichnung';

  @override
  String get remainingAmount => 'Restbetrag';

  @override
  String get ml => 'ml';

  @override
  String minutesFormat(String minutes) {
    return '$minutes Min.';
  }

  @override
  String get drinkWater => 'Wasser trinken';

  @override
  String get supplement => 'Nahrungsergänzungsmittel';

  @override
  String get water => 'Wasser';

  @override
  String get morning => 'Vormittag';

  @override
  String get afternoon => 'Nachmittag';

  @override
  String get evening => 'Abend';

  @override
  String get takeSupplement => 'Nahrungsergänzungsmittel einnehmen';

  @override
  String get goalAchievedTitle => 'Ziel erreicht!';

  @override
  String get waterIntake => 'Wasseraufnahme';

  @override
  String get remindTime => 'Erinnerungszeit';

  @override
  String get alarmRingtone => 'Alarm-Klingelton';

  @override
  String get snoozeTime => 'Snooze-Zeit';

  @override
  String get snoozeDescription =>
      'Standardzeit bei Auswahl von \'Später einnehmen\'';

  @override
  String get oneHour => '1 Stunde';

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
      '🌿 2025 Eulsa-Jahr Gap-Holz Allgemeines Glück: \'Wachstum inmitten neuer Phasen und Wettbewerb\'\n\n2025 ist ein Jahr, in dem die Energie von \'Geob-jae\' und \'Sik-sin\' für Sie eintritt. Es ist wie ein großer Baum in einem Wald, der mit Efeu (Eul-Holz) harmoniert, um gemeinsam zu wachsen. Synergien entstehen eher gemeinsam als allein, aber gleichzeitig wird es ein Jahr sein, in dem heftiger Wettbewerb nicht vermieden werden kann.\n\n💼 [Karriere & Business]\nDie Aktivität wird lebhaft und der Wunsch nach Ausdruck wird stark. Es ergeben sich Gelegenheiten, Ihre Ideen und Talente der Welt weithin bekannt zu machen. Hervorragende Ergebnisse werden für Freiberufler, Personen in den darstellenden Künsten oder im Verkauf erwartet. Es können jedoch subtile Konflikte in Beziehungen zu Kollegen oder Konkurrenten auftreten, daher ist Weisheit gefragt, um sie eher zu Verbündeten als zu Feinden zu machen.\n\n💰 [Wohlstand]\nDer Wohlstandsfluss ist aktiv, aber es kann so viel Geld abfließen, wie hereinkommt (Einfluss von Geob-jae). Vorsicht ist geboten, da Ausgaben aufgrund von Treffen mit Freunden/Kollegen oder Investmentempfehlungen anfallen können. Investitionen in die Selbstentwicklung oder Geschäftserweiterung sind langfristig vorteilhafter als das Sparen von Geld.\n\n❤️ [Liebe & Beziehungen]\nDie Kontaktfreudigkeit verbessert sich und Sie werden viele neue Leute kennenlernen. Die Beliebtheit steigt bei Treffen oder Gruppenaktivitäten, und es ist eine gute Zeit, dem anderen Geschlecht Charme zu vermitteln. Da jedoch Konkurrenten auftreten können, ist es gut, sich aktiv auszudrücken, wenn es jemanden gibt, den Sie mögen.\n\n⚠️ [Vorsicht]\nÜbermäßiger Wettbewerbsgeist kann zu Problemen führen. Außerdem nimmt das Bewegungsglück aufgrund der \'Sa-Feuer\'-Energie zu, achten Sie also auf Verkehrssicherheit und Kraftmanagement.';

  @override
  String get sajuFortune2025Eul =>
      '🌿 2025 Eulsa-Jahr Eul-Holz Allgemeines Glück: \'Ein brillanter Sprung, der Ihre Farben offenbart\'\n\n2025 ist ein Jahr, in dem die Energie von \'Bi-gyeon\' und \'Sang-gwan\' für Sie eintritt. Es ist wie Blumen auf einem Feld in voller Blüte unter der warmen Sonne. Es wird ein dynamisches Jahr sein, in dem Sie Ihre Individualität und Ihre Talente voll zur Geltung bringen und öffentliche Aufmerksamkeit erhalten.\n\n💼 [Karriere & Business]\nKreativität und künstlerisches Gespür erreichen ihren Höhepunkt. Sie werden bei der Planung und Präsentation von Ideen stark hervorstechen. Es ergeben sich Gelegenheiten, unabhängig zu werden oder neue Projekte zu leiten, da Ihre Fähigkeiten anerkannt werden. Es ist jedoch Koordination erforderlich, da der Versuch, zu weit vorauszugehen, mit bestehenden Regeln in Konflikt geraten kann.\n\n💰 [Wohlstand]\nEin Jahr, in dem Einkommen auf der Grundlage von Witz und Geschicklichkeit erzielt wird. Sie können unerwartete Einnahmen durch Nebenjobs oder kreative Aktivitäten erzielen. Da Sie jedoch glanzvollen Dingen nachjagen, können die Ausgaben für die Aufrechterhaltung der Würde oder für Unterhaltung steigen, verlieren Sie also nicht den wirtschaftlichen Sinn.\n\n❤️ [Liebe & Beziehungen]\nEine Zeit mit überströmendem Charme, in der Sie die Aufmerksamkeit des anderen Geschlechts auf sich ziehen. In romantischen Beziehungen verbringen Sie angenehme und lebhafte Zeiten, aber manchmal können Streitigkeiten aufgrund Ihrer eigenen Sturheit auftreten. Wenn Sie allein sind, können Sie sich auf eine schicksalhafte Begegnung freuen.\n\n⚠️ [Vorsicht]\nSeien Sie vorsichtig mit Versprechern, da es ein Jahr ist, in dem man leicht zum Gegenstand von Gerüchten werden kann. Außerdem sind regelmäßiger Schlaf und Ruhe unerlässlich, da Sie zu viel Energie verbrauchen und leicht ermüden können.';

  @override
  String get sajuFortune2026Gap =>
      '🌳 2026 Byeong-oh-Jahr Gap-Holz Allgemeines Glück: \'Flamme der Leidenschaft, Maximierung der Aktivität\'\n\n2026 ist ein Jahr, in dem die Energie von \'Sik-sin\' (Produktivität) und \'Sang-gwan\' (Ausdruck) für Sie, ein Gap-Holz, sehr stark ist. Es ist eine Situation, in der Holz auf Feuer trifft und kräftig brennt, eine Zeit, in der Ihr Talent und Ihr Ausdruck ohne Zögern in die Welt hinausplatzen. Ihre Anwesenheit wird offenbart, auch wenn Sie still bleiben, und Ihr Aktionsradius erweitert sich dramatisch.\n\n💼 [Karriere & Business]\nEs ist eine sehr gute Zeit, um neue Projekte oder ein Unternehmen zu starten. Ihre Ideen werden verwirklicht, und Sie werden leidenschaftlich in die Arbeit eintauchen. Sie können großartige Ergebnisse in Bereichen erzielen, in denen Sie sich selbst ausdrücken, wie Kunst, Rundfunk, Verkauf und Bildung. Sie müssen jedoch vorsichtig sein und alles doppelt überprüfen, da Sie Fehler machen könnten, wenn Sie nur nach vorne rennen.\n\n💰 [Wohlstand]\nDer Wohlstand folgt, so sehr Sie aktiv sind. Das Einkommen aus Geschäft oder Nebenjobs kann steigen. Doch so viel Sie verdienen, kann auch viel Geld für Investitionen oder Konsum abfließen. Investitionen für die Zukunft sind gut, aber vor impulsiven Ausgaben sollte man sich hüten.\n\n❤️ [Liebe & Beziehungen]\nSprechen Sie das andere Geschlecht mit einer ehrlichen und aktiven Haltung an. Das Liebesglück heizt sich auf, aber übermäßiger emotionaler Ausdruck könnte den Partner belasten. Es ist auch ein Jahr, in dem das Kinderglück sehr stark eintritt.\n\n⚠️ [Vorsicht]\nEs ist ein Jahr extremer Energieverschwendung. Ein \'Burnout\' kann kommen, daher ist ein körperliches Kraftmanagement unerlässlich. Achten Sie auf Gerüchte, die durch Versprecher verursacht werden, und versuchen Sie, nicht nur auf Ihren eigenen Argumenten zu beharren.';

  @override
  String get sajuFortune2026Eul =>
      '🌸 2026 Byeong-oh-Jahr Eul-Holz Allgemeines Glück: \'Brillantes Blühen, volle Entfaltung des Talents\'\n\n2026 ist ein Jahr, in dem \'Sang-gwan\' (Ausdruck) für Sie, ein Eul-Holz, schwer wiegt. Es ist eine Situation, in der Blumen unter der heißen Sonne blühen, eine Zeit, in der Ihr Charme und Ihr Talent ihren Höhepunkt erreichen. Sie werden der Protagonist sein, der überall Aufmerksamkeit erhält, und brillante Erfolge erzielen.\n\n💼 [Karriere & Business]\nUngewöhnliche Versuche, die bestehende Rahmenbedingungen sprengen, sind erfolgreich. Sie werden in den Bereichen Design, Mode, Schönheit und Unterhaltung hervorstechen. Sie könnten Beförderungs- oder Abwerbeangebote bei der Arbeit erhalten, aber achten Sie auf Reibungen mit Vorgesetzten. In einer freien Umgebung verdoppelt sich Ihre Fähigkeit.\n\n💰 [Wohlstand]\nDie Fähigkeit, Wohlstand zu schaffen, wird exzellent. Ihr Markenwert steigt und Ihr Wert nimmt zu. Das Streben nach Glamour kann jedoch zu Luxus oder Verschwendung führen, daher müssen Sie Ihren Geldbeutel gut hüten.\n\n❤️ [Liebe & Beziehungen]\nDie Popularität beim anderen Geschlecht explodiert. Sie werden eine brillante und leidenschaftliche Romanze haben, aber sie könnte kurz und intensiv enden. Verheiratete Menschen könnten sich viele Sorgen um ihre Kinder machen.\n\n⚠️ [Vorsicht]\nEmotionale Höhen und Tiefen können heftig werden. Wenn Sie Ihr Temperament nicht kontrollieren können, können hart erarbeitete Erfolge zusammenbrechen. Bewahren Sie einen gesetzestreuen Geist, um rechtliche Probleme oder Gerüchte zu vermeiden.';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ 2026 Byeong-oh-Jahr Byeong-Feuer Allgemeines Glück: \'Zwei Sonnen, intensiver Wettbewerb und Sprung\'\n\n2026 ist ein Jahr, in dem \'Bi-gyeon\' (Freund) und \'Geob-jae\' (Konkurrent) für Sie, ein Byeong-Feuer, sehr stark sind. Es ist eine Situation, in der zwei Sonnen am Himmel erscheinen, eine Zeit, in der Stolz und Wettbewerbsgeist den Himmel erreichen. Die Subjektivität wird stark, Sie hassen jegliche Einmischung und gehen Ihren Weg mit Entschlossenheit.\n\n💼 [Karriere & Business]\nEs ist ein Glück, an wettbewerbsorientierten Orten zu gewinnen und Erfolge zu erzielen. Sie können den Umfang durch Partnerschaft oder Zusammenarbeit vergrößern, aber es können Konflikte aufgrund von Gewinnverteilungsfragen entstehen. Es ist eine gute Gelegenheit für Freiberufler oder Fachleute, ihren Namen weithin bekannt zu machen.\n\n💰 [Wohlstand]\nGeld kommt herein, aber es gibt auch große Löcher, durch die es wieder abfließt. Geld kann durch Geschwister, Freunde oder Kollegen verloren gehen. Das Bürgen oder Verleihen von Geld ist absolut verboten. Es ist besser, in Ehre oder wachsende Macht zu investieren, als Geld zu sparen.\n\n❤️ [Liebe & Beziehungen]\nSie können einen Liebhaber wie einen Freund treffen oder sich von einem Freund zu einem Liebhaber entwickeln. Wenn Sie jedoch einen Partner haben, seien Sie vorsichtig, da eine Dreiecksbeziehung oder ein Konkurrent auftauchen könnte.\n\n⚠️ [Vorsicht]\nEigenmächtiges Handeln kann Ressentiments bei den Menschen in Ihrer Umgebung hervorrufen. \'Bescheidenheit\' ist die beste Taktik. Achten Sie auf Herz-Kreislauf-Erkrankungen oder Augengesundheit.';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 2026 Byeong-oh-Jahr Jeong-Feuer Allgemeines Glück: \'Riesige Flamme, Erweiterung der Macht\'\n\n2026 ist ein Jahr von \'Geob-jae\' (Konkurrent) und \'Bi-gyeon\' (Freund) für Sie, ein Jeong-Feuer. Wie eine Kerze, die auf einen Ofen trifft, ist es eine Zeit, in der Ihre Macht massiv wird. Sie können Dinge erreichen, die allein unmöglich waren, durch Hilfe oder Zusammenarbeit von den Menschen um Sie herum.\n\n💼 [Karriere & Business]\nEine starke Triebkraft entsteht. Sie werden die Weisheit haben, Konkurrenten zu überwältigen oder sie auf Ihre Seite zu ziehen. Gelegenheiten, Führung in Teamprojekten oder im Organisationsleben auszuüben, werden kommen. Wenn Sie jedoch versuchen, Ergebnisse zu monopolisieren, könnten Sie verraten werden, daher ist eine Haltung des Teilens von Anerkennung notwendig.\n\n💰 [Wohlstand]\nSpekulative Tendenzen werden stark. Sie werden \'High Risk, High Return\' verfolgen, und wenn Sie Glück haben, werden Sie viel Geld berühren, aber ein Scheitern hat auch große Auswirkungen. Unerwartete Ausgaben können auftreten, daher ist es gut, einen Notfallfonds vorzubereiten.\n\n❤️ [Liebe & Beziehungen]\nEs besteht eine hohe Wahrscheinlichkeit, Verbindungen in sozialen Zusammenkünften oder Gruppenaktivitäten zu treffen. Männer sollten vorsichtig sein, da sie ihre Frauen oder Freundinnen vernachlässigen könnten. Beziehungen zu Menschen in Ihrer Umgebung werden in diesem Jahr zu einem Aktivposten.\n\n⚠️ [Vorsicht]\nGier führt zu Problemen. Sehen Sie von unangemessenen Erweiterungen oder Investitionen ab. Achten Sie auf Krankheiten, die durch Ärger oder Stress verursacht werden.';

  @override
  String get sajuFortune2026Mu =>
      '🌋 2026 Byeong-oh-Jahr Mu-Erde Allgemeines Glück: \'Geduld und Vorbereitung inmitten intensiver Hitze\'\n\n2026 ist ein Jahr, in dem die Energie von \'Pyeon-in\' (Intuition) und \'Jeong-in\' (Wissen) für Sie, ein Mu-Erde, stark ist. Es ist wie kondensierte Energie kurz vor dem Ausbruch eines Vulkans. Es ist die optimale Zeit, um Ihr Inneres zu füllen und Fähigkeiten durch Studium, Kunst und den Erwerb von Zertifizierungen auszubauen.\n\n💼 [Karriere & Business]\nGeistige Arbeit wie Planung, Forschung und Strategieentwicklung glänzt eher als aktive Arbeit. Das Dokumentenglück ist gut, so dass es Ergebnisse bei Verträgen oder genehmigungsbezogenen Aufgaben gibt. Wenn Sie jedoch nur nachdenken und die Ausführung aufschieben, könnten Sie Gelegenheiten verpassen, so dass auch mutige Entschlossenheit gefragt ist.\n\n💰 [Wohlstand]\nDas Immobiliendokumentenglück ist sehr stark. Es ist eine Gelegenheit, das Vermögen durch Verkauf oder Vertrag zu steigern. Der Cashflow kann etwas frustrierend sein, aber Investitionen aus einer langfristigen Perspektive sind vielversprechend.\n\n❤️ [Liebe & Beziehungen]\nDie Einmischung von Müttern oder Vorgesetzten kann zunehmen. In der Romantik werden Sie geistige Gemeinschaft schätzen, und es können Verbindungen zu älteren Menschen geknüpft werden.\n\n⚠️ [Vorsicht]\nZu viele Gedanken können zu Depressionen oder Lethargie führen. Aktivitäten im Freien oder Schwitzen durch Sport helfen, das Glück zu verbessern. Da der Boden aufgrund der zu großen Hitze reißt, achten Sie auf trockene Haut oder Magenbeschwerden.';

  @override
  String get sajuFortune2026Gi =>
      '🌾 2026 Byeong-oh-Jahr Gi-Erde Allgemeines Glück: \'Solides Fundament und definitive Unterstützung\'\n\n2026 ist ein Jahr von \'Jeong-in\' (Wissen) und \'Pyeon-in\' (Intuition) für Sie, eine Gi-Erde. Es ist eine Situation, in der warmes Sonnenlicht auf die Erde scheint und das Getreide reifen lässt. Es ist eine Zeit der Festigung eines stabilen Fundaments, während Sie volle Unterstützung und Liebe von Vorgesetzten erhalten.\n\n💼 [Karriere & Business]\nSie werden die besten Ergebnisse in allem erzielen, was mit dem Studium zu tun hat, wie z. B. Beförderungsprüfungen, Zertifizierungsprüfungen und dem Erwerb von akademischen Graden. Bei der Arbeit werden Sie das Vertrauen der Vorgesetzten gewinnen und wichtige Positionen einnehmen. Sie werden in den Bereichen Bildung, Immobilien, Beratung und Soziales hervorstechen.\n\n💰 [Wohlstand]\nEs ist ein Glück, Dokumente in den Händen zu halten. Sie könnten den Traum vom Eigenheim verwirklichen oder Erbschaften oder Geschenke erhalten. Ein stabiles Vermögenswachstum ist möglich, und es ist ein Jahr, in dem Ehre mehr glänzt als Wohlstand.\n\n❤️ [Liebe & Beziehungen]\nEs ist ein Jahr, um geliebt zu werden. Sie werden verlässliche Liebe von Ihrem Partner erhalten oder einen Partner mit guten Bedingungen treffen. Das Heiratsglück tritt ebenfalls ein, und das Familienleben wird harmonisch.\n\n⚠️ [Vorsicht]\nWenn Sie nur versuchen zu empfangen, könnten Sie faul werden. Eine Haltung des Teilens, so viel wie Sie erhalten haben, ist notwendig. Legen Sie die Abhängigkeit ab und entwickeln Sie Eigenständigkeit.';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ 2026 Byeong-oh-Jahr Gyeong-Metall Allgemeines Glück: \'Geburt eines Meisterwerks jenseits der Prüfung\'\n\n2026 ist ein Jahr, in dem \'Pyeon-gwan\' (Druck) und \'Jeong-gwan\' (Autorität) für Sie, ein Gyeong-Metall, sehr mächtig sind. Es ist eine Situation, in der Roherz in einem Ofen geschmolzen wird, um ein Meisterwerk-Schwert herzustellen. Es kann starker Druck und Stress auftreten, aber wenn Sie ihn ertragen, werden Sie immense Autorität und Ehre gewinnen.\n\n💼 [Karriere & Business]\nSie könnten Positionen mit großer Verantwortung übernehmen oder schwierige Projekte bearbeiten. Dies ist jedoch ein Prozess, der Sie prüft, und wenn er erfolgreich abgeschlossen wird, steigt Ihr Status sofort an. Es ist eine Gelegenheit zur Beförderung für Personen im öffentlichen Dienst, beim Militär, bei der Polizei und im juristischen Bereich.\n\n💰 [Wohlstand]\nEs ist eher ein Glück von Ehre und Titeln als von Geld. Wenn der Status steigt, wird der Wohlstand natürlich folgen, aber das Geld, das für die Aufrechterhaltung der Würde oder für Unterhaltung ausgegeben wird, ist ebenfalls beträchtlich.\n\n❤️ [Liebe & Beziehungen]\nFür Frauen ist es ein Glück, bei dem ein charismatischer und fähiger Mann erscheint. Männer haben ein starkes Kinderglück. Beziehungen zu Vorgesetzten oder Ältesten werden wichtig.\n\n⚠️ [Vorsicht]\nGesundheitsmanagement hat oberste Priorität. Achten Sie auf Krankheiten oder Unfälle, die durch Überarbeitung verursacht werden. Besonders Lunge und Dickdarm könnten geschwächt werden. Finden Sie Wege, um Stress abzubauen.';

  @override
  String get sajuFortune2026Sin =>
      '💎 2026 Byeong-oh-Jahr Sin-Metall Allgemeines Glück: \'Glänzendes Juwel, Höhepunkt der Ehre\'\n\n2026 ist ein Jahr von \'Jeong-gwan\' (Autorität) und \'Pyeon-gwan\' (Druck) für Sie, ein Sin-Metall. Wie ein Juwel, das unter Lichtern glänzt, ist es eine Zeit, in der Ihr Wert der Welt offenbart und die Ehre erhöht wird. Sie haben tiefe Verbindungen zu aufrechten und stabilen Arbeitsplätzen oder Organisationen.\n\n💼 [Karriere & Business]\nArbeitssuche, Beförderung und Versetzungsglück sind sehr gut. Sie könnten auch Abwerbeangebote erhalten, indem Sie für Ihre Fähigkeiten anerkannt werden. Wenn Sie Prinzipien folgen und die Arbeit korrekt erledigen, werden Sie Respekt von allen erhalten.\n\n💰 [Wohlstand]\nEin stabiles Gehalt oder ein festes Einkommen ist garantiert. Wenn Sie die Ehre schützen, anstatt dem Reichtum nachzujagen, wird der Wohlstand natürlich folgen. Sie können von Ihrem Ehemann oder Ihrem Arbeitsplatz profitieren.\n\n❤️ [Liebe & Beziehungen]\nEs ist das beste Heirats- und Dating-Glück für Frauen. Sie können einen aufrechten und fähigen Ehepartner treffen. Männer gewinnen Kinder oder haben freudige Ereignisse aufgrund von Kindern.\n\n⚠️ [Vorsicht]\nZu viel Hitze kann das Juwel schmelzen. Übermäßige Arbeit oder Stress können Nervosität verursachen. Sie könnten aufgrund starker Prinzipienorientierung unflexibel erscheinen, seien Sie also vorsichtig.';

  @override
  String get sajuFortune2026Im =>
      '🌊 2026 Byeongo-Jahr Im-Wasser Allgemeines Glück: \'Ein dynamisches Jahr der Erweiterung des Aktionsradius\'\n\n2026 ist ein Jahr, in dem die Energie von \'Pyeon-jae\' und \'Jeong-jae\' für Sie eintritt. Es ist wie ein riesiges Meer, das aktiv zirkuliert, indem es die Sonnenwärme empfängt und sich auf die weite Welt zubewegt. Es wird ein dynamisches Jahr sein, in dem die wirtschaftlichen Aktivitäten lebhaft werden und Gelegenheiten kommen, großen Wohlstand zu berühren.\n\n💼 [Karriere & Business]\nDer Geschäftssinn wird maximiert. Ein sehr gutes Jahr, um neue Märkte zu erschließen oder große Gewinne aus Investitionen zu ziehen. Glück, bei dem sich der Aktionsradius über das Inland hinaus nach Übersee ausdehnen kann. Mutige Entscheidungen führen zu großartigen Ergebnissen, aber eine detaillierte Prüfung ist unerlässlich.\n\n💰 [Wohlstand]\nDas Wohlstandsglück erreicht seinen Höhepunkt. Unerwartete Gewinne oder großflächige Geschäftsgewinne werden erwartet. Wenn Sie den Geldfluss gut reiten, können Sie große Vermögenswerte bilden. Das Management ist jedoch wichtig, da das Geld, das abfließt, genauso groß sein kann wie das Geld, das hereinkommt.\n\n❤️ [Liebe & Beziehungen]\nDie Kontaktfreudigkeit verbessert sich und viele Menschen des anderen Geschlechts versammeln sich mit überströmendem Charme um Sie herum. Eine gute Zeit, um aktives Dating zu genießen. In romantischen Beziehungen verbringen Sie glückliche Zeiten und genießen schicke Dates und Reisen. Seien Sie jedoch vorsichtig, da Sie Partner aufgrund eines zu vollen Terminkalenders vernachlässigen könnten.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Nierenfunktion oder den Blutkreislauf. Außerdem ist die Weisheit gefragt, zu wissen, wie man auf einem angemessenen Niveau zufrieden ist, da übermäßige Gier zu Problemen führen kann.';

  @override
  String get sajuFortune2026Gye =>
      '💧 2026 Byeongo-Jahr Gye-Wasser Allgemeines Glück: \'Praktische Interessen gewinnen und gleichzeitig das innere Fundament stärken\'\n\n2026 ist ein Jahr, in dem die Energie von \'Jeong-jae\' und \'Pyeon-jae\' für Sie eintritt. Es ist wie Sonnenschein nach einem süßen Regen, der das Land voller Leben und Überfluss macht. Sie werden wirtschaftliche Stabilität auf der Grundlage eines stabilen Einkommens erreichen und kleine Glücksmomente finden.\n\n💼 [Karriere & Business]\nSie erledigen die zugewiesenen Aufgaben perfekt mit Aufrichtigkeit und Gewissenhaftigkeit. Zeigen Sie exzellente Fähigkeiten bei Finanz-, Buchhaltungs- oder Managementaufgaben. Anerkennung und Belohnungen folgen, wenn Sie in der zugewiesenen Arbeit Ihr Bestes geben, anstatt übermäßige Gier zu entwickeln. Sie können Schritt für Schritt wachsen, während Sie in einem stabilen Umfeld Fähigkeiten aufbauen.\n\n💰 [Wohlstand]\nDas Wohlstandsglück ist sehr gut. Es entsteht ein stetiges und stabiles Einkommen, und Sie genießen die Freude, Ihr Vermögen durch Finanztechnologie oder Ersparnisse zu vermehren. Kleine, aber definitive Gewinne sammeln sich an, um eine große Belohnung zu geben. Sparsame Ausgabengewohnheiten glänzen in diesem Jahr.\n\n❤️ [Liebe & Beziehungen]\nSie schenken Ihren Partnern tiefes Vertrauen mit gütiger und gewissenhafter Rücksichtnahme. Sie lassen eine kleine, aber herzliche Liebe wachsen, während Sie den Alltag teilen. Die Beziehungen sind ebenfalls reibungslos und friedlich. Sie werden die Rolle eines vertrauenswürdigen Beraters für die Menschen um Sie herum spielen.\n\n⚠️ [Vorsicht]\nAchten Sie auf Augenkrankheiten oder die Gesundheit des urologischen Systems. Üben Sie auch manchmal, die Welt mit einer weiten Perspektive zu betrachten, da Sie den großen Fluss verpassen könnten, wenn Sie zu detaillierten Dingen Aufmerksamkeit schenken.';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 2025 Eulsa-Jahr Byeong-Feuer Allgemeines Glück: \'Erfolg und Wettbewerb voller Leidenschaft\'\n\n2025 ist ein Jahr, in dem die Energie von \'Jeong-in\' und \'Bi-gyeon\' für Sie eintritt. Es ist wie die Sonne am Himmel, die auf die Hitze am Boden trifft, um noch heißer zu brennen. Sie werden starke Unterstützungskräfte gewinnen und auf der Grundlage von Selbstvertrauen ohne Zögern auf Ihre Ziele zusteuern.\n\n💼 [Karriere & Business]\nSie werden mit der Hilfe zuverlässiger Helfer oder Mentoren ein großes Wachstum erzielen. Sehr vorteilhaft für den Erwerb von Zertifizierungen oder akademischen Leistungen. Die Zusammenarbeit mit Kollegen glänzt, und Sie werden das Team zum Erfolg führen, indem Sie Führungsqualitäten beweisen. Seien Sie jedoch vorsichtig, da übermäßiger Wettbewerbsgeist Beziehungen schaden kann.\n\n💰 [Wohlstand]\nEine Zeit, um den Wohlstand zu mehren, während Sie Informationen mit Menschen in Ihrer Umgebung teilen. Einkommen durch gemeinsame Investitionen oder Kooperation wird erwartet. Es ist jedoch wichtig, auf praktische Interessen zu achten, da Sie aufgrund von Stolz oder dem Bewusstsein für die Blicke anderer übermäßig viel ausgeben könnten.\n\n❤️ [Liebe & Beziehungen]\nEin Jahr, in dem sich Freundschaften vertiefen, da es viele Treffen mit Menschen geben wird. In romantischen Beziehungen wird der Komfort wie bei einem Freund stärker. Es ist jedoch ein angemessenes Gleichgewicht erforderlich, da Konflikte entstehen können, wenn Freunde gegenüber Partnern priorisiert werden.\n\n⚠️ [Vorsicht]\nAchten Sie auf das Kreislaufsystem wie Blutdruck oder Herzgesundheit. Bewahren Sie außerdem stets den Seelenfrieden, da impulsive Emotionen aufgrund einer feurigen Persönlichkeit Dinge ruinieren können.';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 2025 Eulsa-Jahr Jeong-Feuer Allgemeines Glück: \'Stabilität und Chancen inmitten von Veränderungen\'\n\n2025 ist ein Jahr, in dem die Energie von \'Pyeon-in\' und \'Geob-jae\' für Sie eintritt. Es ist wie eine Kerze, die im Wind flackert, aber schließlich die Umgebung erhellt und ihre Präsenz offenbart. Unerwartete Veränderungen können eintreten, aber es wird ein Jahr sein, in dem Sie diese weise überwinden und in Chancen verwandeln.\n\n💼 [Karriere & Business]\nOriginelle Ideen und Intuition glänzen. Sie werden Nischenmärkte anvisieren, an die andere nicht gedacht haben, oder tiefe Ergebnisse in Fachgebieten erzielen. Der Wettbewerb mit Kollegen wird jedoch hart, und es könnte Menschen geben, die versuchen, Ergebnisse wegzuschnappen, achten Sie also auf die Wahrung der Sicherheit und das Beziehungsmanagement.\n\n💰 [Wohlstand]\nEin Jahr, in dem es Schwankungen beim Wohlstandsglück geben kann. Eine konservative Vermögensverwaltung ist erforderlich, da unerwartete Ausgaben auftreten oder Verluste bei Investitionen auftreten können. Das Einkommen durch Ihre eigenen beruflichen Fähigkeiten wird jedoch stabil fließen. Es ist besser, Finanztransaktionen zu vermeiden.\n\n❤️ [Liebe & Beziehungen]\nSie könnten beim Dating passiv werden, da die Gedanken zunehmen. In romantischen Beziehungen ist man leicht enttäuscht über Kleinigkeiten, daher ist es wichtig, der anderen Person zu vertrauen und sie mit offenem Herzen zu behandeln. Das Füllen des Inneren durch Zeit allein ist ebenfalls ein guter Weg.\n\n⚠️ [Vorsicht]\nAchten Sie auf Nervenerkrankungen oder Schlaflosigkeit aufgrund von Stress. Es ist wichtig, Ihren Geist durch Meditation oder leichte Übungen zu beruhigen und zu versuchen, eher eine positive als eine negative Einstellung zu haben.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ 2025 Eulsa-Jahr Mu-Erde Allgemeines Glück: \'Ein Jahr der Reife, in dem die internen Fundamente weise gestärkt werden\'\n\n2025 ist ein Jahr, in dem die Energie von \'Jeong-gwan\' und \'Pyeon-in\' für Sie eintritt. Es ist wie warme Hitze, die unter einen riesigen Berg dringt, um alles zu umarmen. Es wird ein gehaltvolles Jahr sein, in dem Sie Ihre eigene Tiefe hinzufügen und gleichzeitig die soziale Ehre wahren.\n\n💼 [Karriere & Business]\nSie werden in eine verantwortungsvolle Position innerhalb der Organisation aufsteigen oder es ergeben sich Gelegenheiten für Beförderungen. Wenn Sie Prinzipien schätzen und aufrichtig arbeiten, werden Sie große Anerkennung erhalten. Gleichzeitig erzielen Sie hervorragende Ergebnisse beim Erwerb von Fachwissen oder bei Forschungsaufgaben. Es ist jedoch flexibles Denken erforderlich, da Sie Veränderungen ablehnen könnten, wenn Sie in Stereotypen verhaftet sind.\n\n💰 [Wohlstand]\nEin stabiles Einkommen ist garantiert. Es ist vorteilhaft, aufrichtig zu sparen und das Vermögen zu verwalten. Das Glück in Bezug auf Immobilien oder Dokumente ist gut, daher lohnt es sich, langfristige Investitionen in Betracht zu ziehen. Vermeiden Sie jedoch unvernünftige Investitionen, indem Sie sich von Versuchungen aus der Umgebung erschüttern lassen.\n\n❤️ [Liebe & Beziehungen]\nSie gewinnen das Vertrauen der Menschen durch würdevolle Worte und Taten. In romantischen Beziehungen ist es eine gute Zeit, einander zu respektieren und eine ernsthafte Beziehung zu entwickeln. Wenn Sie an eine Hochzeit denken, ist es auch gut, konkrete Pläne zu machen.\n\n⚠️ [Vorsicht]\nAchten Sie auf das Verdauungssystem oder die Hautgesundheit. Üben Sie außerdem, schnelle Entscheidungen zu treffen, indem Sie auf Ratschläge aus der Umgebung hören, da bei Ihnen aufgrund von zu viel Nachdenken eine Entscheidungsunfähigkeit auftreten kann.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 2025 Eulsa-Jahr Gi-Erde Allgemeines Glück: \'Ziele mit Verantwortung erreichen\'\n\n2025 ist ein Jahr, in dem die Energie von \'Pyeon-gwan\' und \'Jeong-in\' für Sie eintritt. Es ist wie Sonnenschein, der nach dem Regen auf ein weites Land scheint, um Getreide wachsen zu lassen. Es mag schwierige Prozesse geben, aber es wird ein lohnendes Jahr sein, in dem Sie schließlich Ehre erlangen und Ziele erreichen.\n\n💼 [Karriere & Business]\nDie Arbeitsintensität kann zunehmen und es können schwierige Aufgaben gestellt werden. Sie werden jedoch Ihre Qualitäten als Führungskraft unter Beweis stellen, indem Sie diese mit Ihren Fähigkeiten und Ihrer Geduld überwinden. Sie werden Krisen mit Hilfe oder Unterstützung von Vorgesetzten meistern und als Ergebnis ein großes Erfolgsgefühl verspüren.\n\n💰 [Wohlstand]\nEin Jahr, in dem Sie auf das Ausgabenmanagement achten müssen. Es kann viel Geld abfließen, wie z. B. unerwartete Steuern oder Versorgungsgebühren. Da Sie jedoch als Ergebnis stetiger Bemühungen Anreize oder Boni erwarten können, ist Aufrichtigkeit der Schlüssel, um den Wohlstand herbeizurufen.\n\n❤️ [Liebe & Beziehungen]\nEin verantwortungsbewusstes Auftreten wirkt attraktiv auf das andere Geschlecht. In romantischen Beziehungen vertieft sich die Bindung, während Sie einander zuhören und sich gegenseitig trösten. Es sind jedoch Bemühungen um häufige Kommunikation erforderlich, auch wenn sie kurz ist, da Sie Partner aufgrund eines geschäftigen Alltags vernachlässigen könnten.\n\n⚠️ [Vorsicht]\nAchten Sie auf einen Rückgang der Immunität aufgrund von Überarbeitung. Es ist wichtig, die körperliche Kraft mit regelmäßigen Mahlzeiten und Bewegung zu verwalten und Stress mit positiven Gedanken abzubauen.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ 2025 Eulsa-Jahr Gyeong-Metall Allgemeines Glück: \'Ehre erlangen und praktische Interessen wahren\'\n\n2025 ist ein Jahr, in dem die Energie von \'Jeong-jae\' und \'Pyeon-gwan\' für Sie eintritt. Es ist wie ein fester Fels, der durch Feuer erhitzt und als kostbares Schwert wiedergeboren wird. Sie werden für Ihre Bemühungen definitiv belohnt und Ihren Wert gesellschaftlich unter Beweis stellen.\n\n💼 [Karriere & Business]\nSie erzielen großartige Ergebnisse mit ergebnisorientiertem Denken und Tatkraft. Besonders anerkannt werden Ihre Fähigkeiten in den Bereichen Finanzen, Management und Technologie. Das Glück, schwierige Probleme zu lösen und Ehre zu erlangen, ist groß, aber auch die Verantwortung wächst, sodass Sie Druck verspüren könnten. Glauben Sie an sich selbst und gehen Sie mutig voran.\n\n💰 [Wohlstand]\nDas Wohlstandsglück ist sehr gut. Neben einem stabilen Einkommen erzielen Sie praktische Gewinne durch Investitionen oder Nebenjobs. Sie werden den Geldfluss genau erfassen und Vermögenswerte effizient verwalten. Verzichten Sie jedoch darauf, große Summen für das Ansehen auszugeben.\n\n❤️ [Liebe & Beziehungen]\nSprechen Sie das andere Geschlecht mit einem aufrichtigen und zuverlässigen Auftreten an. In romantischen Beziehungen geben Sie der anderen Person durch eine verantwortungsbewusste Haltung ein Gefühl der Erleichterung. In Beziehungen vermitteln Sie vielleicht ein etwas strenges Bild, daher ist es gut, ab und zu mit etwas sanftem Humor zu sprechen.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Gesundheit von Knochen oder Gelenken sowie auf Atemwegserkrankungen. Beruhigen Sie sich außerdem mit der Einstellung \'das ist genug\', da Sie aufgrund von perfektionistischen Tendenzen hart zu sich selbst sein könnten.';

  @override
  String get sajuFortune2025Sin =>
      '💎 2025 Eulsa-Jahr Sin-Metall Allgemeines Glück: \'Ein Jahr der Weisheit, die inmitten von Veränderungen strahlt\'\n\n2025 ist ein Jahr, in dem die Energie von \'Pyeon-jae\' und \'Jeong-gwan\' für Sie eintritt. Es ist wie ein edles Juwel, das unter brillanter Beleuchtung seinen Wert offenbart. Es wird ein angenehmes Jahr sein, in dem der soziale Status zusammen mit unerwarteten Glücksfällen steigt.\n\n💼 [Karriere & Business]\nDer Geschäftssinn verbessert sich und die Fähigkeit, neue Chancen zu ergreifen, ist exzellent. Eine Zeit, in der kühne Herausforderungen große Gewinne bringen. Innerhalb der Organisation gewinnen Sie Vertrauen durch rationales Urteilsvermögen und ergreifen Chancen für Beförderungen oder Versetzungen. Achten Sie jedoch darauf, den Prozess nicht zu vernachlässigen, indem Sie sich zu sehr auf Ergebnisse konzentrieren.\n\n💰 [Wohlstand]\nEin Jahr, in dem das Geldglück eintritt. Es ergeben sich Gelegenheiten, großen Wohlstand zu berühren, wie unerwartete Investitionsrenditen oder Erbschaften. Da die Ausgaben jedoch auch luxuriös werden können, ist es wichtig, geplante Konsumgewohnheiten beizubehalten.\n\n❤️ [Liebe & Beziehungen]\nSie werden zum Protagonisten bei gesellschaftlichen Zusammenkünften mit einem schicken und attraktiven Auftreten. Das Dating-Glück ist sehr stark, sodass Sie Avancen von vielen Menschen erhalten könnten. In romantischen Beziehungen verbringen Sie leidenschaftliche und angenehme Zeiten. Ein gutes Jahr, um sich zu einer ernsthaften Beziehung zu entwickeln.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Lungengesundheit oder Hautkrankheiten. Bewahren Sie außerdem stets Demut und vergessen Sie nicht, an andere zu denken, da Sie aufgrund von übermäßigem Selbstvertrauen auf andere arrogant wirken könnten.';

  @override
  String get sajuFortune2025Im =>
      '🌊 2025 Eulsa-Jahr Im-Wasser Allgemeines Glück: \'Ergebnisse erzielen durch Ausübung von Weisheit\'\n\n2025 ist ein Jahr, in dem die Energie von \'Sang-gwan\' und \'Pyeon-jae\' für Sie eintritt. Es ist wie ein großer Fluss, der sich windet und ein weites Feld befeuchtet. Es wird ein dynamisches Jahr sein, in dem Sie großen Wohlstand erlangen und Ihren Aktivitätsbereich erweitern, indem Sie Ihre Talente und Ihre Beredsamkeit einsetzen.\n\n💼 [Karriere & Business]\nDie Beredsamkeit verbessert sich und Sie erzielen exzellente Ergebnisse in den Bereichen Marketing oder PR. Eine sehr gute Zeit, um Ihre Ideen zu vermarkten oder neue Märkte zu erschließen. Es wird das beste Jahr für diejenigen sein, die kreativ arbeiten. Es ist jedoch wichtig, höflich zu sein, da es zu Reibungen mit Vorgesetzten kommen kann.\n\n💰 [Wohlstand]\nDas Wohlstandsglück bewegt sich aktiv. Das Glück, mit eigenen Fähigkeiten Geld zu verdienen, ist stark, und es ergeben sich Gelegenheiten, mit großem Geld umzugehen. Bei spekulativen Investitionen ist jedoch Vorsicht geboten, und das Wohlstandsglück bleibt nur dann lange erhalten, wenn Sie die Einstellung haben, so viel zu geben, wie Sie verdient haben.\n\n❤️ [Liebe & Beziehungen]\nMit überschäumendem Humor und Charme werden die Menschen nie aufhören, um Sie herum zu sein. Ein Jahr, in dem Sie angenehme Verabredungen mit hoher Beliebtheit beim anderen Geschlecht genießen können. In romantischen Beziehungen hauchen Sie der Beziehung durch vielfältige Dates Leben ein. Seien Sie jedoch vorsichtig, da ein einziges unbedachtes Wort Missverständnisse verursachen kann.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Gesundheit der Nieren oder des Harnsystems. Achten Sie außerdem auf angemessene Ruhe und Ernährung, da die körperliche Kraft aufgrund eines großen Aktivitätsbereichs erschöpft sein kann.';

  @override
  String get sajuFortune2025Gye =>
      '💧 2025 Eulsa-Jahr Gye-Wasser Allgemeines Glück: \'Ein Jahr der Aufrichtigkeit, das stabile Früchte hervorbringt\'\n\n2025 ist ein Jahr, in dem die Energie von \'Sik-sin\' und \'Jeong-jae\' für Sie eintritt. Es ist wie ein klarer Nieselregen, der das Land befeuchtet, um eine reiche Ernte vorzubereiten. Es wird ein warmes Jahr sein, in dem sich Ihre Bemühungen stetig ansammeln und als stabiler Wohlstand und Glück zurückkehren.\n\n💼 [Karriere & Business]\nEin Jahr, in dem Aufrichtigkeit zur besten Waffe wird. Sie erzielen stetige Ergebnisse, indem Sie Verantwortung übernehmen, und gewinnen Vertrauen von Kollegen. Eine gute Zeit, um Fachwissen aufzubauen, und Sie werden sich durch Arbeit, die Sie mögen, belohnt fühlen. Sie können in einem stabilen Umfeld Schritt für Schritt wachsen.\n\n💰 [Wohlstand]\nEin Jahr, das wirtschaftlich entspannt und stabil ist. Es fließen stetige Einnahmen, und Sie werden Freude daran haben, Ihr Vermögen sparsam zu mehren. Es gibt Glück in Bezug auf Nahrung und Kleidung, sodass die Fülle im gesamten Leben groß ist. Sparen ist vorteilhafter als unvernünftige Investitionen.\n\n❤️ [Liebe & Beziehungen]\nSie geben Partnern mit einem herzlichen Auftreten ein Gefühl von Komfort. Ein Jahr, in dem Sie eine schöne Liebe entwickeln, während Sie einander sorgfältig berücksichtigen. Wenn Sie Single sind, ist es sehr wahrscheinlich, dass Sie einen Partner treffen, mit dem die Kommunikation gut funktioniert und der ähnliche Werte hat.\n\n⚠️ [Vorsicht]\nAchten Sie auf die Gesundheit des Magens oder die Verwaltung der Essgewohnheiten. Es ist gut, gelegentlich neue Impulse zu setzen, um Vitalität zu finden, da Sie durch das Verharren in Bequemlichkeit träge werden könnten.';

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
  String get allowAllItems => 'Bitte alle Berechtigungen aktivieren';

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
  String get daySunFull => 'Sonntag';

  @override
  String get dayMonFull => 'Montag';

  @override
  String get dayTueFull => 'Dienstag';

  @override
  String get dayWedFull => 'Mittwoch';

  @override
  String get dayThuFull => 'Donnerstag';

  @override
  String get dayFriFull => 'Freitag';

  @override
  String get daySatFull => 'Samstag';

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
    return 'Stärke von $label anpassen';
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
  String minutesLater(String minutes) {
    return '$minutes Min später';
  }

  @override
  String get countLabel => 'Anzahl';

  @override
  String timesCount(String count) {
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
    return 'Zeit: ${seconds}s';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'Beste: ${seconds}s';
  }

  @override
  String get fortuneCatchAngryHint => 'Vermeide den bösen Fortuni!';

  @override
  String get fortuneCatchInstruction => 'Fange die glücklichen Fortunis!';

  @override
  String fortuneCatchPointMinus(int points) {
    return '$points Punkte abgezogen';
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
    return '$completed/$total Erfolg!';
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
  String missionSnoozeMessage(String minutes) {
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
  String get walkToDismiss =>
      'Bitte gehen Sie, während Sie Ihr Smartphone halten';

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
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes Min (unbegrenzt)';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
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
  String get cherry_stained_finger => 'Cherry Stained Finger';

  @override
  String get dancing_in_the_stars => 'Dancing In The Stars';

  @override
  String get nice_day => 'Nice Day';

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
  String get tarotKeywords0 =>
      'Neuanfänge, Abenteuer, Unschuld, Freiheit, Leichtsinn';

  @override
  String get tarotDesc0 =>
      'Der Narr steht prekär am Rande einer Klippe in farbenfroher Kleidung, aber sein Blick ist in die Ferne gerichtet, voller Hoffnung.';

  @override
  String get tarotLoveMeaning0 =>
      'Eine unerwartete neue Liebe kann eintreffen oder eine schicksalhafte Begegnung auf den ersten Blick.';

  @override
  String get tarotLoveDetail0 =>
      'Es ist eine Zeit, in der man die Liebe mit einem reinen Herzen wie ein Kind beginnen kann. Vergessen Sie alle vergangenen Wunden.';

  @override
  String get tarotWealthMeaning0 =>
      'Eine neue Investition oder ein neues Geschäftsobjekt könnte Ihnen ins Auge fallen.';

  @override
  String get tarotWealthDetail0 =>
      'Es ist eine Zeit, in der sich finanziell neue Möglichkeiten eröffnen. Sie können unerwartete Ergebnisse erzielen.';

  @override
  String get tarotSuccessMeaning0 =>
      'Es ist eine gute Zeit, ein neues Projekt zu starten oder den Job in einen völlig anderen Bereich zu wechseln.';

  @override
  String get tarotSuccessDetail0 =>
      'Wenn es etwas gibt, auf das Sie sich vorbereiten, machen Sie mutig den ersten Schritt.';

  @override
  String get tarotKeywords1 =>
      'Kreativität, Meisterschaft, Selbstausdruck, Einfallsreichtum, Wille';

  @override
  String get tarotDesc1 =>
      'Der Magier steht vor einem Tisch mit den Symbolen der vier Elemente. Eine Hand zeigt zum Himmel, die andere zur Erde, was die Fähigkeit symbolisiert, Ideen in die Realität umzusetzen.';

  @override
  String get tarotLoveMeaning1 =>
      'Dies ist eine hervorragende Gelegenheit, Ihren Charme spielen zu lassen und jemanden zu erobern.';

  @override
  String get tarotLoveDetail1 =>
      'Ihr Charisma und Ihre Talente sind auf dem Höhepunkt, was Sie für andere unwiderstehlich macht. Wenn Sie jemanden im Auge haben, zögern Sie nicht, die Initiative zu ergreifen. Ihr Sinn für Humor und Ihre geistreichen Gespräche werden Ihr Gegenüber fesseln und es Ihnen ermöglichen, die Beziehung zu lenken.';

  @override
  String get tarotWealthMeaning1 =>
      'Die ideale Zeit, um durch Ihre Fähigkeiten neue Einkommensquellen zu erschließen.';

  @override
  String get tarotWealthDetail1 =>
      'Ihre Kenntnisse, Fähigkeiten und Ideen können sich jetzt in reale finanzielle Gewinne verwandeln. Beschränken Sie sich nicht nur auf Ihr Grundgehalt; versuchen Sie, Ihre Hobbys zu monetarisieren oder freiberuflich tätig zu werden. Ihre kreative Planung wird Ihnen helfen, Einnahmen zu erzielen, die Ihre Erwartungen übertreffen.';

  @override
  String get tarotSuccessMeaning1 =>
      'Ihre beruflichen Fähigkeiten werden glänzen und Sie werden Anerkennung von Ihren Mitmenschen erhalten.';

  @override
  String get tarotSuccessDetail1 =>
      'Im Beruf oder Studium können Sie Ihr volles Potenzial entfalten und aus der Masse herausstechen. Was auch immer die Herausforderungen sein mögen, Sie werden sie dank Ihres Einfallsreichtums lösen. Ihre Kollegen und Vorgesetzten werden Sie als Experten anerkennen, also handeln Sie mit Selbstvertrauen.';

  @override
  String get tarotKeywords2 =>
      'Intuition, Geheimnis, Unterbewusstsein, innere Weisheit, Passivität';

  @override
  String get tarotDesc2 =>
      'Die Hohepriesterin sitzt zwischen einer weißen und einer schwarzen Säule und bewacht die Schriftrolle der Weisheit. Sie symbolisiert tiefe Intuition und das Gleichgewicht zwischen Bewusstsein und Unterbewusstsein.';

  @override
  String get tarotLoveMeaning2 =>
      'Eine Zeit, in der die spirituelle Verbindung wichtiger ist als die körperliche Anziehung.';

  @override
  String get tarotLoveDetail2 =>
      'Sie werden sich eher zu Menschen mit einer reichen inneren Welt hingezogen fühlen, mit denen Sie tiefe Gespräche führen können. Ihre Intuition ist geschärft, sodass Sie Ihren Partner ohne Worte verstehen können. Zu viel Zurückhaltung könnte jedoch zu Missverständnissen führen, also versuchen Sie, Ihre Gefühle ab und zu offen zu zeigen.';

  @override
  String get tarotWealthMeaning2 =>
      'Es ist Zeit, Ihr Vermögen zu schützen und die Situation zu beobachten, anstatt Risiken einzugehen.';

  @override
  String get tarotWealthDetail2 =>
      'Dies ist nicht der beste Zeitpunkt, um ohne Nachzudenken schnellen Gewinnen nachzujagen. Nehmen Sie sich stattdessen Zeit, den Markt zu analysieren und Finanzinstrumente zu studieren. Es ist eine Phase der «Aussaat», also seien Sie nicht beunruhigt, wenn die Früchte nicht sofort kommen.';

  @override
  String get tarotSuccessMeaning2 =>
      'Erfolg erwartet Sie in akademischen Aktivitäten, Forschung und intellektuellen Berufen.';

  @override
  String get tarotSuccessDetail2 =>
      'Konzentrieren Sie sich darauf, Ihr inneres Potenzial zu stärken und Ihre Kompetenzen zu verbessern, anstatt nach äußerem Glanz zu suchen. Sie werden herausragende Ergebnisse in Aufgaben erzielen, die eine gründliche Analyse erfordern. Ihre Weisheit und Vorsicht werden in entscheidenden Momenten der Schlüssel zum Erfolg sein.';

  @override
  String get tarotKeywords3 =>
      'Weiblichkeit, Schönheit, Natur, Fülle, Fruchtbarkeit';

  @override
  String get tarotDesc3 =>
      'Die Herrscherin ruht in einem blühenden Garten und repräsentiert materiellen Wohlstand und emotionale Großzügigkeit.';

  @override
  String get tarotLoveMeaning3 =>
      'Zeit des emotionalen Aufblühens und der Stärkung der affektiven Bindungen.';

  @override
  String get tarotLoveDetail3 =>
      'Ihr Charme und Ihre weibliche (oder empfängliche) Energie sind auf dem Maximum, was Sie unglaublich attraktiv macht. In Ihren Beziehungen wird Harmonie und gegenseitige Fürsorge herrschen, was es zu einem guten Zeitpunkt macht, über Heiratspläne zu sprechen. Wenn Sie Single sind, wird Ihnen ein Stilwechsel helfen, Aufmerksamkeit zu erregen.';

  @override
  String get tarotWealthMeaning3 =>
      'Zeitraum des materiellen Wohlstands und der finanziellen Stabilität.';

  @override
  String get tarotWealthDetail3 =>
      'Das finanzielle Glück ist auf Ihrer Seite. Ihre vergangenen Bemühungen werden Früchte tragen und Sie werden mehr Komfort genießen können. Sie könnten unerwartete Boni, Geschenke oder Gewinne aus erfolgreichen Investitionen erhalten. Teilen Sie Ihre positive Energie mit anderen, das wird noch mehr Glück anziehen.';

  @override
  String get tarotSuccessMeaning3 =>
      'Aktuelle Projekte kommen erfolgreich voran und bringen exzellente Ergebnisse.';

  @override
  String get tarotSuccessDetail3 =>
      'Es ist Zeit, die realen Früchte Ihrer Arbeit zu sehen. Projekte werden erfolgreich abgeschlossen, was sich in einer Beförderung oder einem Bonus niederschlagen könnte. Ihre kreative Vision und Ihr ästhetischer Sinn werden sehr geschätzt. Genießen Sie den Arbeitsprozess; dies wird Ihnen helfen, noch höhere Ziele zu erreichen.';

  @override
  String get tarotKeywords4 => 'Autorität, Struktur, Kontrolle, Führung, Logik';

  @override
  String get tarotDesc4 =>
      'Der Herrscher sitzt auf einem Steinthron in Rüstung und symbolisiert Festigkeit, Ordnung und Entschlossenheit in der Führung.';

  @override
  String get tarotLoveMeaning4 =>
      'Stabile Beziehung mit einem zuverlässigen und verantwortungsbewussten Partner.';

  @override
  String get tarotLoveDetail4 =>
      'Anstelle von flüchtigen Leidenschaften treten Vertrauen und Sicherheit für die Zukunft in den Vordergrund. Ihr Partner wird eine solide Stütze und ein Beschützer für Sie sein. Versuchen Sie, übermäßige Kontrolle und Sturheit in der Kommunikation zu vermeiden. Für Singles zeichnet sich eine Begegnung mit einer einflussreichen Person ab.';

  @override
  String get tarotWealthMeaning4 =>
      'Systematisches Asset-Management wird helfen, ein stabiles Kapital aufzubauen.';

  @override
  String get tarotWealthDetail4 =>
      'In Finanzangelegenheiten ist es entscheidend, sich an einen Plan und an Ihre Prinzipien zu halten. Wählen Sie anstelle von riskanten Spekulationen sichere Instrumente wie Einlagen oder Immobilien. Ihr Pragmatismus und Ihre Entschlossenheit werden Ihnen helfen, den Grundstein für dauerhaften Wohlstand zu legen.';

  @override
  String get tarotSuccessMeaning4 =>
      'Gute Chancen auf eine Beförderung oder eine Führungsposition.';

  @override
  String get tarotSuccessDetail4 =>
      'Ihre Position im Team festigt sich. Die Führungskräfte werden Ihre Qualitäten schätzen und könnten Ihnen die Leitung eines wichtigen Projekts oder einer Abteilung anvertrauen. Nutzen Sie Logik und kühles Kalkül, um berufliche Aufgaben zu lösen, und Sie werden das volle Vertrauen Ihrer Vorgesetzten gewinnen.';

  @override
  String get tarotKeywords5 =>
      'Tradition, Lehre, Überzeugungen, Rat, Vermittlung';

  @override
  String get tarotDesc5 =>
      'Der Hierophant symbolisiert soziale Normen und spirituelle Führung, indem er durch weise Ratschläge und traditionelle Werte führt.';

  @override
  String get tarotLoveMeaning5 =>
      'Seriöse und gesunde Beziehungen, die auf gegenseitigem Respekt basieren.';

  @override
  String get tarotLoveDetail5 =>
      'Sie werden nicht nach flüchtigen Abenteuern suchen, sondern nach einer tiefen Beziehung mit dem Ziel, eine Familie zu gründen. Jemandem über gemeinsame Freunde oder bei formellen Anlässen zu begegnen, könnte der Beginn von etwas Wichtigem sein. Wenn Streitigkeiten auftreten, fragen Sie Ältere um Rat; ihre Weisheit wird Ihnen helfen.';

  @override
  String get tarotWealthMeaning5 =>
      'Es ist besser, traditionelle und bewährte Sparmethoden zu befolgen.';

  @override
  String get tarotWealthDetail5 =>
      'Bevorzugen Sie Sicherheit gegenüber riskanten Investitionen. Bankeinlagen oder Versicherungen sind die am besten geeigneten Optionen. Die Beratung durch einen Finanzexperten oder die Aufrechterhaltung der Ehrlichkeit in Ihren Transaktionen wird Ihnen helfen, Ihr Vermögen zu bewahren und zu mehren.';

  @override
  String get tarotSuccessMeaning5 =>
      'Günstiger Zeitpunkt für den Abschluss von Verträgen und Partnerschaftsabkommen.';

  @override
  String get tarotSuccessDetail5 =>
      'Anstatt Probleme allein zu lösen, suchen Sie die Unterstützung von Kollegen oder Mentoren. Die Einhaltung von Unternehmensregeln und -verfahren ist der kürzeste Weg zur Anerkennung. Es ist auch eine günstige Zeit, um wichtige Dokumente zu unterzeichnen und berufliche Netzwerke aufzubauen.';

  @override
  String get tarotKeywords6 =>
      'Liebe, Harmonie, Beziehungen, gemeinsame Werte, Entscheidungen';

  @override
  String get tarotDesc6 =>
      'Adam und Eva stehen unter einer warmen Sonne und erhalten den Segen eines Engels.';

  @override
  String get tarotLoveMeaning6 =>
      'Dies ist eine der besten Zeiten für die Liebe, um zu erblühen.';

  @override
  String get tarotLoveDetail6 =>
      'Eine herzzerreißende Romanze erwartet Sie. Sie werden jemandem, zu dem Sie sich hingezogen fühlen, schnell näher kommen. Wenn Sie bereit sind, Ihre Liebe zu gestehen, ist die Erfolgsrate sehr hoch. Wählen Sie jedoch mit Bedacht, wohin Ihr Herz wirklich gehört.';

  @override
  String get tarotWealthMeaning6 =>
      'Ihr finanzielles Glück steigt, wenn Sie gemeinsam statt alleine handeln.';

  @override
  String get tarotWealthDetail6 =>
      'Die Zusammenarbeit mit jemandem, mit dem Sie sich gut verstehen, wird Synergien schaffen. Wenn Sie einen Partnerschaftsvorschlag erhalten, prüfen Sie ihn positiv. Es ist eine Zeit, in der Sie nützliche Informationen durch Kommunikation erhalten können. Passen Sie jedoch auf, dass die Ausgaben für Vergnügen nicht zu hoch werden.';

  @override
  String get tarotSuccessMeaning6 =>
      'Dies ist eine Zeit, in der Teamarbeit glänzt.';

  @override
  String get tarotSuccessDetail6 =>
      'Sie werden freudig mit Kollegen oder Geschäftspartnern zusammenarbeiten, die perfekt zu Ihnen passen. In Teamprojekten können Sie bessere Ergebnisse erzielen als bei Einzelaufgaben. Wenn Sie eine Arbeit wählen, die Sie wirklich lieben, werden Sie Ergebnisse erzielen, die Sie nicht bereuen werden.';

  @override
  String get tarotKeywords7 =>
      'Kontrolle, Wille, Erfolg, Handeln, Entschlossenheit';

  @override
  String get tarotDesc7 =>
      'Ein junger König in einem Streitwagen stürmt mit starkem Willen auf sein Ziel zu und erringt einen Sieg.';

  @override
  String get tarotLoveMeaning7 =>
      'Es ist eine Zeit, in der aktive romantische Bestrebungen erfolgreich sind.';

  @override
  String get tarotLoveDetail7 =>
      'Es ist an der Zeit, sich zu beeilen, um die Liebe zu gewinnen. Zögern Sie nicht und drücken Sie Ihr Herz ehrlich und stolz aus. Wenn Sie sich in einer Kennenlernphase befinden, ist es gut, die Beziehung klar zu definieren. Dynamische Dates oder gemeinsames Reisen werden Ihre Zuneigung vertiefen.';

  @override
  String get tarotWealthMeaning7 =>
      'Es ist an der Zeit, aggressiv vorzugehen, um den Zielgewinn zu erreichen.';

  @override
  String get tarotWealthDetail7 =>
      'Ein starker Antrieb ist erforderlich, um finanzielle Ziele zu erreichen. Treffen Sie mutige Entscheidungen, wenn sich die Gelegenheit bietet. Es ist vorteilhaft, sich auf Projekte zu konzentrieren, die kurzfristig Ergebnisse liefern. Ihre Leistung wird so stark steigen, wie Sie hart arbeiten.';

  @override
  String get tarotSuccessMeaning7 =>
      'Sie werden wahrscheinlich den Wettbewerb gewinnen und Ihre Ziele erreichen.';

  @override
  String get tarotSuccessDetail7 =>
      'Klare Zielerreichung wie Beförderung, Bestehen oder Vertragsunterzeichnung wird vorhergesagt. Je intensiver der Wettbewerb, desto mehr wird Ihr Kampfgeist brennen. Ihr Bild, Hindernisse direkt zu durchbrechen, wird einen tiefen Eindruck bei den Menschen um Sie herum hinterlassen.';

  @override
  String get tarotKeywords8 => 'Kraft, Mut, Überzeugung, Einfluss, Mitgefühl';

  @override
  String get tarotDesc8 =>
      'Eine Frau in Weiß geht sanft mit dem Maul eines Löwen um und symbolisiert spirituelle Stärke und Geduld.';

  @override
  String get tarotLoveMeaning8 =>
      'Es ist eine Zeit, in der Sie die Toleranz brauchen, um die andere Person so zu akzeptieren, wie sie ist.';

  @override
  String get tarotLoveDetail8 =>
      'Die aktuelle Liebe erfordert Geduld und Weisheit. Die Beziehung kann sich auf die nächste Stufe entwickeln, wenn Sie die Unzulänglichkeiten des anderen mit weitem Herzen akzeptieren. Eine sanfte, aber feste Haltung ist gefragt. Wenn Sie geduldig an ihrer Seite bleiben, wird Ihre Aufrichtigkeit schließlich ihr Herz öffnen.';

  @override
  String get tarotWealthMeaning8 =>
      'Stetiges Sparen und gesunde Konsumgewohnheiten sind die Geheimnisse zum Sammeln von Reichtum.';

  @override
  String get tarotWealthDetail8 =>
      'Ihr finanzielles Glück steigt allmählich an. Seien Sie nicht enttäuscht, wenn nicht sofort großes Geld hereinkommt. Verwalten Sie Ihr Vermögen treu, und es wird später als große Summe zurückkehren. Es ist vorteilhaft, festzuhalten, anstatt sich von kurzfristigen Schwankungen beeinflussen zu lassen.';

  @override
  String get tarotSuccessMeaning8 =>
      'Auch wenn Sie auf eine schwierige Aufgabe stoßen, können Sie damit weise umgehen.';

  @override
  String get tarotSuccessDetail8 =>
      'Ihnen könnte ein hartes Projekt oder eine heikle Aufgabe zugewiesen werden, aber Sie haben genug Potenzial, um sie zu lösen. Obwohl Sie nach außen hin weich erscheinen, zeichnen Sie sich dadurch aus, dass Sie Hindernisse mit starkem innerem Willen überwinden. Ihre ruhige Problemlösungsfähigkeit wird dazu führen, dass die Menschen Ihnen tiefes Vertrauen entgegenbringen.';

  @override
  String get tarotKeywords9 =>
      'Introspektion, Einsamkeit, innere Führung, Suche nach der Wahrheit';

  @override
  String get tarotDesc9 =>
      'Ein alter Mann mit einer Lampe auf einem dunklen, verschneiten Berg hört auf seine innere Stimme und erforscht die Wahrheit.';

  @override
  String get tarotLoveMeaning9 =>
      'Es ist eine Zeit, in der Sie Zeit für sich selbst brauchen oder tief über die Liebe nachdenken.';

  @override
  String get tarotLoveDetail9 =>
      'Jetzt ist eine Zeit, in der Sie Zeit brauchen, um auf sich selbst zurückzublicken, anstatt aktiv zu daten. Denken Sie tief darüber nach, welche Art von Liebe Sie wirklich wollen. Auch wenn Sie einen Partner haben, kann es helfen, etwas Abstand zu gewinnen, um das Wesen der Beziehung zu erkennen.';

  @override
  String get tarotWealthMeaning9 =>
      'Finanzielle Aktivitäten können etwas eingeschränkt sein.';

  @override
  String get tarotWealthDetail9 =>
      'Sie sollten eine konservative Haltung gegenüber Reichtum einnehmen. Anstatt neue Investitionen zu tätigen, ist es wichtig, Ihr aktuelles Vermögen gründlich zu prüfen. Investitionen in das Studium oder den Erwerb von Fähigkeiten zur Steigerung Ihres Wertes sind großartige Investitionen, die später zu größeren Gewinnen führen werden.';

  @override
  String get tarotSuccessMeaning9 =>
      'Sie erzielen Ergebnisse in Bereichen, in denen Fachwissen oder Fähigkeiten tiefgehend erforscht werden.';

  @override
  String get tarotSuccessDetail9 =>
      'Sie können hervorragende Ergebnisse bei Aufgaben erzielen, die tiefe Konzentration erfordern, wie Forschung, Planung oder Entwicklung. Es ist eine Zeit des stillen Aufbaus von Fähigkeiten. Wenn es ein ungelöstes Problem gibt, suchen Sie einen erfahrenen Mentor um Rat.';

  @override
  String get tarotKeywords10 =>
      'Viel Glück, Karma, Lebenszyklen, Schicksal, Wendepunkte';

  @override
  String get tarotDesc10 =>
      'Ein riesiges Schicksalsrad dreht sich und signalisiert den unvermeidlichen Fluss des Schicksals und den Beginn eines neuen Zyklus.';

  @override
  String get tarotLoveMeaning10 =>
      'Eine schicksalhafte Begegnung erwartet Sie.';

  @override
  String get tarotLoveDetail10 =>
      'Eine schicksalhafte Liebe wie im Film kommt auf Sie zu. Dramatische Ereignisse wie das Treffen mit jemandem an einem unerwarteten Ort können eintreten. Singles könnten jemanden treffen, in den sie sich auf den ersten Blick verlieben, während Paare feststellen werden, dass ihre Beziehung auf die nächste Stufe voranschreitet.';

  @override
  String get tarotWealthMeaning10 =>
      'Der Fluss des finanziellen Glücks verbessert sich.';

  @override
  String get tarotWealthDetail10 =>
      'Die Glücksgöttin lächelt Sie an. Ihr finanzielles Glück befindet sich auf einer Aufwärtskurve mit unerwarteten Einnahmen. Wenn der Geldumlauf reibungslos wird, brauchen Sie die Kühnheit, die Gelegenheit zu ergreifen. Vergessen Sie jedoch nicht die Weisheit, für die Zukunft zu sparen.';

  @override
  String get tarotSuccessMeaning10 =>
      'Die Situation wendet sich zu Ihren Gunsten.';

  @override
  String get tarotSuccessDetail10 =>
      'Ein Wendepunkt ist erreicht, an dem blockierte Angelegenheiten wieder fließen. Die Gezeiten wenden sich zu Ihren Gunsten, also zögern Sie nicht, neue Gelegenheiten zu ergreifen. Gelegenheiten für Veränderungen wie Beförderungen oder Karriereschritte werden Sie an einen höheren Ort bringen.';

  @override
  String get tarotKeywords11 =>
      'Gerechtigkeit, Fairness, Wahrheit, Ursache und Wirkung, Verantwortung';

  @override
  String get tarotDesc11 =>
      'Ein Richter in einer roten Robe hält ein Schwert in der rechten Hand und eine Waage in der linken.';

  @override
  String get tarotLoveMeaning11 =>
      'Es ist eine Beziehung, in der die Vernunft dem Gefühl vorausgeht.';

  @override
  String get tarotLoveDetail11 =>
      'Jetzt ist eine Zeit für rationales Urteilsvermögen. Schauen Sie zurück, um zu sehen, ob Ihre Beziehung ausgeglichen ist. Wenn Sie über eine Heirat nachdenken, könnten Sie die Bedingungen oder den Hintergrund Ihres Partners akribisch abwägen. Ehrliche und faire Gespräche werden die Lösung sein.';

  @override
  String get tarotWealthMeaning11 =>
      'Eine sorgfältige Prüfung bei Finanztransaktionen oder Verträgen ist erforderlich.';

  @override
  String get tarotWealthDetail11 =>
      'Es kann eine Situation entstehen, in der Sie bei finanziellen Angelegenheiten Recht von Unrecht unterscheiden müssen. Es ist eine gute Zeit, um finanzielle Beziehungen sauber zu klären. Überprüfen Sie Verträge sorgfältig auf nachteilige Klauseln und handeln Sie nach Prinzipien.';

  @override
  String get tarotSuccessMeaning11 =>
      'Sie erhalten eine faire Bewertung und eine legitime Entschädigung.';

  @override
  String get tarotSuccessDetail11 =>
      'Sie erhalten eine faire und objektive Bewertung Ihrer Arbeitsleistung. Wenn Sie hart gearbeitet haben, werden legitime Belohnungen wie Beförderungen oder Boni folgen. Wenn Sie Entscheidungen treffen, schließen Sie Emotionen aus und urteilen Sie streng nach Daten und Fakten.';

  @override
  String get tarotKeywords12 => 'Pause, Hingabe, Loslassen, neue Perspektiven';

  @override
  String get tarotDesc12 =>
      'Die Karte Der Gehängte symbolisiert eine Zeit des Stillstands und der bewussten Pause. Es ist eine Phase, in der man die Dinge aus einer völlig neuen Perspektive betrachten sollte. Manchmal ist es notwendig, alte Gewohnheiten loszulassen, um geistiges Wachstum zu ermöglichen.';

  @override
  String get tarotLoveMeaning12 =>
      'In der Liebe deutet diese Karte auf eine Phase der Unsicherheit oder des Abwartens hin. Es kann sein, dass eine Beziehung stagniert oder Gefühle nicht erwidert werden. Nutzen Sie diese Zeit, um innezuhalten und Ihre eigenen Wünsche und Bedürfnisse zu klären.';

  @override
  String get tarotLoveDetail12 =>
      'Es ist eine Zeit, in der rationales Urteilsvermögen schwierig ist, da man emotional feststeckt. Erzwingen Sie nichts, sondern lassen Sie die Dinge sich natürlich entwickeln. Geduld und Selbstreflexion führen Sie schließlich zur richtigen Entscheidung.';

  @override
  String get tarotWealthMeaning12 =>
      'Finanziell gesehen mahnt der Gehängte zur Vorsicht und zum Abwarten. Es ist kein guter Zeitpunkt für riskante Investitionen oder große Ausgaben. Überprüfen Sie Ihre Finanzen gründlich und suchen Sie nach versteckten Fehlern.';

  @override
  String get tarotWealthDetail12 =>
      'Ihr finanzieller Fluss könnte vorübergehend ins Stocken geraten. Nutzen Sie diese Pause, um Ihre Ausgabengewohnheiten zu überdenken und neue Sparstrategien zu entwickeln. Ein Perspektivwechsel kann Ihnen helfen, langfristig stabilere Einnahmen zu sichern.';

  @override
  String get tarotSuccessMeaning12 =>
      'Beruflich bedeutet diese Karte, dass Projekte vorübergehend zum Stillstand kommen könnten. Es ist eine Phase der Vorbereitung und des Lernens, nicht des schnellen Handelns. Akzeptieren Sie die Verzögerung als Chance zur Qualitätsverbesserung.';

  @override
  String get tarotSuccessDetail12 =>
      'Manchmal ist ein Rückzug notwendig, um später kraftvoller voranzukommen. Nutzen Sie die aktuelle Ruhephase für Fortbildungen oder strategische Planung. Wenn Sie Ihre Einstellung ändern, werden sich neue Türen öffnen, die Sie zuvor übersehen haben.';

  @override
  String get tarotKeywords13 => 'Ende, Wandel, Transformation, Übergang';

  @override
  String get tarotDesc13 =>
      'Die Karte Der Tod steht nicht für das physische Ende, sondern für eine tiefgreifende Transformation. Ein alter Lebensabschnitt endet, damit etwas Neues und Besseres entstehen kann. Akzeptieren Sie den Wandel als notwendigen Teil Ihrer persönlichen Entwicklung.';

  @override
  String get tarotLoveMeaning13 =>
      'In Beziehungen symbolisiert diese Karte das Ende einer Phase oder einer veralteten Dynamik. Dies kann eine Trennung bedeuten, aber auch eine tiefgreifende Erneuerung innerhalb der Partnerschaft. Platz für Neues wird erst geschaffen, wenn Altes losgelassen wird.';

  @override
  String get tarotLoveDetail13 =>
      'Es ist eine Zeit des emotionalen Umbruchs, die schmerzhaft sein kann, aber Heilung verspricht. Klammern Sie sich nicht an Vergangenes, das Ihnen nicht mehr guttut. Vertrauen Sie darauf, dass nach diesem Ende ein hoffnungsvoller Neuanfang auf Sie wartet.';

  @override
  String get tarotWealthMeaning13 =>
      'Finanziell deutet der Tod auf einschneidende Veränderungen hin, wie den Verlust einer Einnahmequelle oder das Scheitern einer Investition. Es ist eine Warnung, finanzielle Abhängigkeiten zu beenden. Ein radikaler Neuanfang in Ihrer Budgetplanung ist nun erforderlich.';

  @override
  String get tarotWealthDetail13 =>
      'Alte finanzielle Strukturen brechen zusammen, was Raum für modernere Ansätze schafft. Seien Sie bereit, sich von unrentablen Projekten zu trennen, auch wenn es schwerfällt. Langfristig wird dieser klare Schnitt Ihre wirtschaftliche Situation stabilisieren.';

  @override
  String get tarotSuccessMeaning13 =>
      'Im Beruf signalisiert der Tod den Abschluss eines großen Projekts oder einen Jobwechsel. Bestehende Strukturen könnten sich auflösen, was zunächst verunsichernd wirken kann. Sehen Sie dies als Chance, Ihre Karriere in eine völlig neue Richtung zu lenken.';

  @override
  String get tarotSuccessDetail13 =>
      'Widerstand gegen Veränderungen wird nur zu mehr Schwierigkeiten führen. Seien Sie proaktiv und verabschieden Sie sich von Aufgaben, die Sie nicht mehr erfüllen. Eine neue berufliche Identität wartet darauf, von Ihnen entdeckt und geformt zu werden.';

  @override
  String get tarotKeywords14 => 'Gleichgewicht, Mäßigung, Geduld, Zweck';

  @override
  String get tarotDesc14 =>
      'Die Mäßigkeit ruft dazu auf, Harmonie und Ausgeglichenheit in allen Lebensbereichen zu finden. Es geht darum, Extreme zu vermeiden und einen goldenen Mittelweg zu wählen. Geduld und Gelassenheit sind Ihre wichtigsten Werkzeuge in dieser Phase.';

  @override
  String get tarotLoveMeaning14 =>
      'In der Liebe steht diese Karte für eine harmonische und stabile Verbindung. Konflikte können durch ruhige Kommunikation und gegenseitiges Verständnis gelöst werden. Es ist eine Zeit des Zusammenwachsens und der emotionalen Heilung.';

  @override
  String get tarotLoveDetail14 =>
      'Pflegen Sie Ihre Beziehung mit Sanftheit und vermeiden Sie emotionale Ausbrüche. Ein ausgewogenes Geben und Nehmen stärkt das Band zwischen Ihnen und Ihrem Partner. Singles finden ihr Glück eher durch eine ruhige, freundschaftliche Annäherung.';

  @override
  String get tarotWealthMeaning14 =>
      'Finanziell bedeutet Mäßigkeit einen stabilen und kontrollierten Geldfluss. Es gibt keine großen Sprünge, aber auch keine gefährlichen Verluste. Fokusieren Sie sich darauf, Ihre Ressourcen klug und maßvoll zu verwalten.';

  @override
  String get tarotWealthDetail14 =>
      'Ihre finanzielle Stabilität folgt einem ruhigen Strom, wenn Sie unnötige Ausgaben vermeiden. Es ist eine gute Zeit für langfristige, risikoarme Sparpläne. Durch Geduld und konsequente Verwaltung wird Ihr Wohlstand stetig und sicher wachsen.';

  @override
  String get tarotSuccessMeaning14 =>
      'Beruflich deutet die Karte auf eine erfolgreiche Zusammenarbeit und ein angenehmes Arbeitsklima hin. Ihre Fähigkeit zur Vermittlung und zum Kompromiss wird besonders geschätzt. Projekte schreiten stetig voran, solange Sie das Tempo moderat halten.';

  @override
  String get tarotSuccessDetail14 =>
      'Erfolg stellt sich durch Beständigkeit und Diplomatie ein, nicht durch Aggressivität. Achten Sie auf eine gute Work-Life-Balance, um Ihre Leistungsfähigkeit langfristig zu erhalten. Ihre ruhige Art wirkt inspirierend auf Kollegen und Vorgesetzte.';

  @override
  String get tarotKeywords15 =>
      'Sucht, Materialismus, Kontrollverlust, Loslösung';

  @override
  String get tarotDesc15 =>
      'Der Teufel warnt vor Abhängigkeiten, Versuchungen und dem Verlust der inneren Freiheit. Oft sind wir an materielle Dinge oder negative Gedankenmuster gebunden, die uns am Wachstum hindern. Es ist an der Zeit, diese Ketten zu erkennen und sich bewusst davon zu lösen.';

  @override
  String get tarotLoveMeaning15 =>
      'In der Liebe deutet diese Karte auf eine intensive, aber oft toxische oder rein physische Anziehung hin. Besessenheit und Eifersucht können die Beziehung belasten. Hinterfragen Sie, ob Ihre Bindung auf wahrer Liebe oder auf bloßer Abhängigkeit basiert.';

  @override
  String get tarotLoveDetail15 =>
      'Es ist eine Zeit, in der das rationale Urteil durch starke Leidenschaft getrübt sein kann. Achten Sie darauf, sich nicht in einer Beziehung zu verlieren, die Ihnen Ihre Energie raubt. Wahre Erfüllung finden Sie erst, wenn Sie Ihre eigene Unabhängigkeit zurückgewinnen.';

  @override
  String get tarotWealthMeaning15 =>
      'Finanziell warnt der Teufel vor Gier und riskanten Verlockungen, die in die Schuldenfalle führen können. Seien Sie vorsichtig bei Angeboten, die zu gut klingen, um wahr zu sein. Materieller Besitz sollte nicht Ihr einziges Ziel sein.';

  @override
  String get tarotWealthDetail15 =>
      'Es besteht die Gefahr, ein Sklave des Geldes oder der Konsumlust zu werden. Überprüfen Sie Ihre Ausgaben auf zwanghafte Muster und vermeiden Sie neue Kredite. Nur durch bewusste Selbstbeherrschung können Sie Ihre finanzielle Freiheit bewahren oder wiedererlangen.';

  @override
  String get tarotSuccessMeaning15 =>
      'Beruflich kann der Teufel auf einen rücksichtslosen Ehrgeiz hindeuten, der Ihnen schaden könnte. Vielleicht fühlen Sie sich in einem Job gefangen oder unterdrückt. Hüten Sie sich davor, Ihre Werte für schnellen Erfolg zu opfern.';

  @override
  String get tarotSuccessDetail15 =>
      'Erfolg um jeden Preis wird langfristig zu Unzufriedenheit und Konflikten führen. Erkennen Sie Machtspiele im Arbeitsumfeld und distanzieren Sie sich davon. Suchen Sie nach Wegen, Ihre Arbeit wieder mit Ihren persönlichen Überzeugungen in Einklang zu bringen.';

  @override
  String get tarotKeywords16 =>
      'Plötzliche Veränderung, Umbruch, Chaos, Offenbarung';

  @override
  String get tarotDesc16 =>
      'Der Turm symbolisiert plötzliche und oft schockierende Ereignisse, die gewohnte Strukturen zum Einsturz bringen. Auch wenn dies zunächst beängstigend wirkt, dient es dazu, falsche Fundamente zu zerstören. Nur so kann Platz für eine ehrlichere und stabilere Zukunft geschaffen werden.';

  @override
  String get tarotLoveMeaning16 =>
      'In Beziehungen kann der Turm für plötzliche Konflikte, überraschende Enthüllungen oder eine Trennung stehen. Masken fallen und die Wahrheit kommt ans Licht, was schmerzhaft sein kann. Es ist jedoch eine notwendige Reinigung, um Klarheit über die Gefühle zu erhalten.';

  @override
  String get tarotLoveDetail16 =>
      'Ein unerwartetes Ereignis könnte Ihr Liebesleben erschüttern und Sie zur Neubewertung zwingen. Versuchen Sie nicht, das Alte gewaltsam festzuhalten, wenn es bereits zerbrochen ist. Nach dem Sturm wird sich zeigen, welche Bindungen stark genug für einen Neuanfang sind.';

  @override
  String get tarotWealthMeaning16 =>
      'Finanziell mahnt die Karte zur äußersten Vorsicht vor plötzlichen Verlusten oder finanziellen Katastrophen. Ein sicher geglaubtes Investment könnte scheitern oder unerwartete Kosten fallen an. Bereiten Sie sich auf unruhige Zeiten vor und sichern Sie ab, was möglich ist.';

  @override
  String get tarotWealthDetail16 =>
      'Finanzielle Strukturen, die auf Sand gebaut waren, könnten jetzt zusammenbrechen. Es ist eine harte Lektion in Sachen Geldmanagement, die Sie aber weiser machen wird. Nutzen Sie den Trümmerhaufen, um Ihre Finanzen von Grund auf neu und solider zu organisieren.';

  @override
  String get tarotSuccessMeaning16 =>
      'Beruflich deutet der Turm auf plötzliche Entlassungen, Firmenpleiten oder das Scheitern großer Projekte hin. Ihre Karriereplanung könnte komplett über den Haufen geworfen werden. Sehen Sie den Zusammenbruch als Befreiung von Aufgaben, die Sie ohnehin eingeschränkt haben.';

  @override
  String get tarotSuccessDetail16 =>
      'Wenn der gewohnte Rahmen wegbricht, entstehen völlig neue Möglichkeiten der Entfaltung. Seien Sie flexibel und bereit, sich schnell an die neue Situation anzupassen. Ihre Fähigkeit, aus Krisen gestärkt hervorzugehen, wird jetzt auf die Probe gestellt und gefördert.';

  @override
  String get tarotKeywords17 =>
      'Hoffnung, Glaube, Zweck, Erneuerung, Spiritualität';

  @override
  String get tarotDesc17 =>
      'Der Stern ist eine Karte der Hoffnung, der Inspiration und der göttlichen Führung. Nach einer schwierigen Zeit kehrt nun Ruhe und Zuversicht in Ihr Leben zurück. Vertrauen Sie auf Ihre Träume und darauf, dass das Universum Sie auf den richtigen Weg leitet.';

  @override
  String get tarotLoveMeaning17 =>
      'In der Liebe verspricht der Stern eine Zeit der Heilung und der tiefen emotionalen Verbundenheit. Bestehende Beziehungen erfahren eine neue Leichtigkeit und gegenseitiges Vertrauen. Für Singles deutet die Karte auf die Begegnung mit einem Seelenverwandten hin.';

  @override
  String get tarotLoveDetail17 =>
      'Ihr Herz öffnet sich wieder für die Liebe und Sie strahlen eine positive Energie aus. Es ist eine wunderbare Zeit, um gemeinsame Zukunftspläne zu schmieden und Wünsche zu äußern. Vertrauen Sie darauf, dass Ihre Sehnsüchte in Erfüllung gehen werden.';

  @override
  String get tarotWealthMeaning17 =>
      'Finanziell signalisiert der Stern eine langsame, aber stetige Verbesserung Ihrer Lage. Vorangegangene Sorgen lösen sich auf und neue Möglichkeiten für Einnahmen tun sich auf. Es ist eine Zeit der finanziellen Erholung und des Optimismus.';

  @override
  String get tarotWealthDetail17 =>
      'Ihr finanzieller Ausblick beginnt sich in eine positive Richtung zu bewegen. Frühere wirtschaftliche Schwierigkeiten werden durch kluge Entscheidungen und etwas Glück erwunden. Bleiben Sie geduldig, denn der Erfolg wird sich langfristig und nachhaltig einstellen.';

  @override
  String get tarotSuccessMeaning17 =>
      'Beruflich steht der Stern für Inspiration, Erfolg und die Anerkennung Ihrer Talente. Ihre Projekte stehen unter einem guten Stern und Sie finden innovative Lösungen für alte Probleme. Folgen Sie Ihrer Berufung, denn Ihr Weg ist nun klar vorgezeichnet.';

  @override
  String get tarotSuccessDetail17 =>
      'Ihre kreativen Ideen finden Gehör und führen zu bemerkenswerten Fortschritten. Es ist eine ideale Zeit für langfristige Planungen und den Aufbau von Netzwerken. Ihr authentisches Auftreten überzeugt Vorgesetzte und Geschäftspartner gleichermaßen.';

  @override
  String get tarotKeywords18 =>
      'Angst, Sorge, Illusion, Unterbewusstsein, Intuition';

  @override
  String get tarotDesc18 =>
      'Der Mond führt uns in die Welt der Träume, der Schatten und des Unbewussten. Nicht alles ist so, wie es auf den ersten Blick scheint, und Unsicherheit kann Ängste hervorrufen. Vertrauen Sie in dieser dunklen Phase weniger Ihrem Verstand als vielmehr Ihrer tiefen Intuition.';

  @override
  String get tarotLoveMeaning18 =>
      'In der Liebe deutet der Mond auf Geheimnisse, Missverständnisse oder verborgene Sehnsüchte hin. Vielleicht sind Sie sich Ihrer Gefühle unsicher oder es gibt Dinge, die noch nicht ausgesprochen wurden. Hüten Sie sich vor Täuschungen und hören Sie auf Ihr Bauchgefühl.';

  @override
  String get tarotLoveDetail18 =>
      'Es ist eine Zeit emotionaler Verwirrung, in der Sie sich leicht in Illusionen verlieren können. Suchen Sie das klärende Gespräch, aber überstürzen Sie keine wichtigen Entscheidungen. Erst wenn das Tageslicht zurückkehrt, werden Sie die Situation klarer beurteilen können.';

  @override
  String get tarotWealthMeaning18 =>
      'Finanziell mahnt der Mond zur Vorsicht, da Informationen unvollständig oder irreführend sein könnten. Es ist kein guter Zeitpunkt für undurchsichtige Geschäfte oder riskante Spekulationen. Achten Sie auf versteckte Kosten und prüfen Sie jedes Angebot dreifach.';

  @override
  String get tarotWealthDetail18 =>
      'Ihre finanzielle Situation könnte sich derzeit wie eine Wanderung im Nebel anfühlen. Vermeiden Sie impulsive Käufe oder Investitionen aus einer Stimmung heraus. Vertrauen Sie nur Fakten, die Sie selbst überprüft haben, und lassen Sie sich nicht von äußeren Schein blenden.';

  @override
  String get tarotSuccessMeaning18 =>
      'Beruflich symbolisiert der Mond eine Phase der Ungewissheit oder des Wandels hinter den Kulissen. Vielleicht gibt es Intrigen am Arbeitsplatz oder Sie zweifeln an Ihrem aktuellen Weg. Nutzen Sie Ihre Intuition, um Gefahren frühzeitig zu erkennen.';

  @override
  String get tarotSuccessDetail18 =>
      'Nicht alle Kollegen spielen mit offenen Karten, seien Sie also wachsam. Es ist eine gute Zeit für kreative Arbeit, die aus dem Unterbewusstsein schöpft, aber weniger für harte Verhandlungen. Warten Sie ab, bis sich der Nebel lichtet, bevor Sie den nächsten großen Karriereschritt machen.';

  @override
  String get tarotKeywords19 => 'Positivität, Spaß, Wärme, Erfolg, Vitalität';

  @override
  String get tarotDesc19 =>
      'Die Sonne ist eine der glücklichsten Karten und verspricht Erfolg, Lebensfreude und Vitalität. Alles liegt klar und deutlich vor Ihnen, und Sie strotzen nur so vor Energie. Genießen Sie diesen Moment des Triumphs und teilen Sie Ihr Glück mit Ihren Mitmenschen.';

  @override
  String get tarotLoveMeaning19 =>
      'In der Liebe steht die Sonne für eine Zeit voller Wärme, Leidenschaft und tiefer Zufriedenheit. Beziehungen blühen auf und gemeinsame Unternehmungen bringen viel Freude. Es ist eine Phase der Harmonie, in der sich alles zum Besten entwickelt.';

  @override
  String get tarotLoveDetail19 =>
      'Ihr Liebesleben ist von Optimismus und gegenseitiger Wertschätzung geprägt. Kleine Sorgen verschwinden im Licht der Sonne und machen Platz für echte Herzlichkeit. Singles haben jetzt die besten Chancen, jemanden zu treffen, der ihr Leben hell erleuchtet.';

  @override
  String get tarotWealthMeaning19 =>
      'Finanziell deutet die Sonne auf Wohlstand, Gewinn und eine äußerst positive Entwicklung hin. Ihre Bemühungen zahlen sich nun aus und Sie können mit finanzieller Sicherheit rechnen. Es ist eine großartige Zeit für Investitionen und neue Projekte.';

  @override
  String get tarotWealthDetail19 =>
      'Ein sonniger Tag für Ihre Finanzen ist angebrochen. Ihr Gespür für lukrative Gelegenheiten ist geschärft, was zu erheblichen Gewinnen führt. Nutzen Sie diese erfolgreiche Phase, um Ihre finanzielle Basis für die Zukunft weiter zu stärken.';

  @override
  String get tarotSuccessMeaning19 =>
      'Beruflich signalisiert die Sonne den absoluten Höhepunkt und die Krönung Ihrer Arbeit. Sie erhalten Anerkennung, Beförderungen oder schließen wichtige Projekte erfolgreich ab. Ihre positive Ausstrahlung macht Sie zum Mittelpunkt jeder beruflichen Gruppe.';

  @override
  String get tarotSuccessDetail19 =>
      'Erfolg kommt Ihnen jetzt fast mühelos entgegen, da Sie mit Begeisterung und Klarheit handeln. Es ist die ideale Zeit, um sich neuen Herausforderungen zu stellen oder eine Führungsposition zu übernehmen. Ihr Selbstvertrauen ist Ihr größtes Kapital und führt Sie zu neuen Bestleistungen.';

  @override
  String get tarotKeywords20 => 'Urteil, Wiedergeburt, innerer Ruf, Absolution';

  @override
  String get tarotDesc20 =>
      'Das Gericht steht für eine Phase der Selbsterkenntnis, der Abrechnung und der Neugeburt. Es ist an der Zeit, vergangene Taten zu bewerten und die notwendigen Konsequenzen daraus zu ziehen. Ein innerer Ruf fordert Sie auf, Ihre wahre Bestimmung zu finden und ein neues Kapitel zu beginnen.';

  @override
  String get tarotLoveMeaning20 =>
      'In der Liebe deutet diese Karte auf eine Klärung oder eine wichtige Entscheidung in einer Beziehung hin. Vielleicht kehrt ein früherer Partner zurück oder eine alte Wunde heilt endlich. Es ist eine Zeit der Vergebung und des ehrlichen Neuanfangs.';

  @override
  String get tarotLoveDetail20 =>
      'Sie erkennen jetzt klar, was Sie in einer Partnerschaft wirklich brauchen und was nicht. Seien Sie bereit, alte Muster loszulassen, um Platz für eine reifere Form der Liebe zu schaffen. Diese Transformation wird Ihr Liebesleben auf eine höhere Ebene heben.';

  @override
  String get tarotWealthMeaning20 =>
      'Finanziell bedeutet das Gericht, dass Sie nun die Früchte Ihrer vergangenen Entscheidungen ernten. Wenn Sie fleißig waren, erwartet Sie eine Belohnung oder eine unerwartete Rückzahlung. Es ist eine Zeit der finanziellen Bilanzierung und der Neuausrichtung.';

  @override
  String get tarotWealthDetail20 =>
      'Sie erhalten nun die gerechte Entlohnung für Ihre bisherigen Bemühungen. Vielleicht bietet sich eine Gelegenheit, alte Schulden zu begleichen oder ein vergessenes Erbe anzutreten. Nutzen Sie diese Klarheit, um Ihre Finanzen für die Zukunft nachhaltiger zu planen.';

  @override
  String get tarotSuccessMeaning20 =>
      'Beruflich signalisiert das Gericht eine wichtige Prüfung oder eine endgültige Entscheidung über Ihre Karriere. Ihr Potenzial wird erkannt und Sie könnten eine Berufung finden, die über einen bloßen Job hinausgeht. Seien Sie bereit, Verantwortung für Ihren Weg zu übernehmen.';

  @override
  String get tarotSuccessDetail20 =>
      'Vergangene Leistungen werden nun gewürdigt, was zu einem bedeutenden Karrieresprung führen kann. Es ist ein Moment der Wahrheit, in dem Sie sich Ihren Fehlern stellen und daraus lernen. Ein neuer, authentischerer Weg in Ihrem Berufsleben öffnet sich nun vor Ihnen.';

  @override
  String get tarotKeywords21 => 'Abschluss, Integration, Leistung, Reise';

  @override
  String get tarotDesc21 =>
      'Die Welt symbolisiert Vollendung, Erfolg und das Erreichen eines großen Ziels. Sie haben eine lange Reise hinter sich und alle Puzzleteile fügen sich nun zu einem harmonischen Ganzen zusammen. Genießen Sie das Gefühl der Ganzheit und feiern Sie Ihre bemerkenswerten Erfolge.';

  @override
  String get tarotLoveMeaning21 =>
      'In der Liebe steht die Welt für eine erfüllte Beziehung, die alle Herausforderungen gemeistert hat. Es ist ein Zustand tiefer Verbundenheit und des gemeinsamen Glücks. Singles finden jemanden, der sie vollkommen ergänzt und ihr Leben bereichert.';

  @override
  String get tarotLoveDetail21 =>
      'Sie haben in Herzensangelegenheiten Ihr Ziel erreicht und fühlen sich emotional angekommen. Es ist eine Zeit der Harmonie, in der Sie sich mit Ihrem Partner eins fühlen. Gemeinsame Reisen oder große Lebensereignisse wie eine Hochzeit stehen unter einem glücklichen Stern.';

  @override
  String get tarotWealthMeaning21 =>
      'Finanziell bedeutet die Welt absoluten Erfolg und die Erreichung finanzieller Freiheit. Ihre klugen Entscheidungen der Vergangenheit führen nun zu dauerhafter Stabilität. Es gibt keine ungelösten Probleme mehr und Ihr Wohlstand ist gesichert.';

  @override
  String get tarotWealthDetail21 =>
      'Sie haben Ihre finanziellen Ziele erreicht und können nun die Früchte Ihrer harten Arbeit genießen. Ihr Umgang mit Geld ist weise und vorausschauend, was Ihnen ein sorgenfreies Leben ermöglicht. Es ist die Zeit, den Wohlstand mit anderen zu teilen und das Leben zu genießen.';

  @override
  String get tarotSuccessMeaning21 =>
      'Beruflich signalisiert die Welt den krönenden Abschluss einer Karrierephase oder den weltweiten Erfolg eines Projekts. Sie haben alles erreicht, was Sie sich vorgenommen haben, und genießen hohes Ansehen. Neue Horizonte eröffnen sich für Sie, vielleicht sogar international.';

  @override
  String get tarotSuccessDetail21 =>
      'Ihr beruflicher Weg hat Sie zur Meisterschaft in Ihrem Bereich geführt. Sie fühlen sich kompetent und respektiert in allem, was Sie tun. Auch wenn dieser Zyklus nun abgeschlossen ist, sind Sie bereit, mit Ihrem Wissen und Ihrer Erfahrung die Welt zu erobern.';

  @override
  String get supplementRecordPrompt =>
      'Bitte nehmen Sie Ihre Nahrungsergänzungsmittel ein und zeichnen Sie es auf!';

  @override
  String get snoozeQuestion => 'Wann soll ich Sie erneut erinnern?';

  @override
  String get hoursShort => 'Std.';

  @override
  String get minutesShort => 'Min.';

  @override
  String get after => 'nach';

  @override
  String snoozeMessage(int minutes) {
    return 'Der Wecker klingelt in $minutes Minuten erneut.';
  }

  @override
  String timesTaken(int count) {
    return '$count Mal eingenommen';
  }

  @override
  String dailyGoalTimes(int goal) {
    return 'Ziel: $goal Mal am Tag';
  }

  @override
  String get didYouTakeSupplement =>
      'Haben Sie Ihre Nahrungsergänzungsmittel eingenommen?';

  @override
  String get viewMissionRecords => 'Missionsaufzeichnungen anzeigen';

  @override
  String get setTakingGoal => 'Einnahmeziel festlegen';

  @override
  String get times => 'Mal';

  @override
  String get dailyTakingGoal => 'Tägliches Einnahmeziel';

  @override
  String get howManyTimesADay =>
      'Wie oft am Tag nehmen Sie Nahrungsergänzungsmittel ein?';

  @override
  String get setGoalMl => 'Ziel festlegen (ml)';

  @override
  String get sleepAnalysis => 'Schlafanalyse';

  @override
  String get todaysSleep => 'Heutiger Schlaf';

  @override
  String get sleepDuration => 'Schlafdauer';

  @override
  String get wakeUpTime => 'Aufwachzeit';

  @override
  String get weeklySleepPattern => 'Wöchentliches Schlafmuster';

  @override
  String get sleepAdvice =>
      'Sie behalten eine regelmäßige Schlafgewohnheit bei. Sie sind 30 Minuten früher ins Bett gegangen als gestern!';

  @override
  String get stopwatch => 'Stoppuhr';

  @override
  String get lap => 'Runde';

  @override
  String get stop => 'Stopp';

  @override
  String lapLabel(int index) {
    return 'Runde $index';
  }

  @override
  String get monday => 'Mo';

  @override
  String get tuesday => 'Di';

  @override
  String get wednesday => 'Mi';

  @override
  String get thursday => 'Do';

  @override
  String get friday => 'Fr';

  @override
  String get saturday => 'Sa';

  @override
  String get sunday => 'So';

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
  String get minutes => 'min';

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
  String categoryMissions(String category) {
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
  String hourFormat(String hour) {
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
  String get luckyNumberAnalyzing => 'Energie wird analysiert...';

  @override
  String get luckyNumberGeometric => 'Geometrische Analyse...';

  @override
  String get luckyNumberPatterns => 'Musterabgleich...';

  @override
  String get luckyNumberEnergy => 'Energie wird harmonisiert...';

  @override
  String get luckyNumberCompleted => 'Analyse abgeschlossen!';

  @override
  String get luckyNumberShare => 'Ergebnisse teilen';

  @override
  String get luckyNumberRestart => 'Nochmal versuchen';

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
  String get compatibilityInputTitle => 'Kompatibilitätsinformationen Eingabe';

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
  String tojeongShareTitle(int year) {
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
    return 'Neujahrs-Horoskop für $name.\n\n$desc...';
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
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
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

  @override
  String get routineMorningTitle => 'Ein erfrischender Morgen! ☀️';

  @override
  String get routineMorningBody =>
      'Haben Sie die für heute geplanten Routine-Missionen vergessen?';

  @override
  String get routineEveningTitle => 'Gute Arbeit heute! ✨';

  @override
  String get routineEveningBody =>
      'Haben Sie alle heutigen Missionen abgeschlossen? Schließen Sie Ihre Routine ab.';

  @override
  String get routineCheckTitle => 'Überprüfen Sie Ihre heutigen Missionen! 🚀';

  @override
  String get routineCheckBody =>
      'Befolgen Sie die Routine-Missionen und machen Sie Ihren Tag angenehm.';

  @override
  String get supplementNotificationTitle =>
      'Erinnerung an Nahrungsergänzungsmittel';

  @override
  String get waterNotificationTitle => 'Trinkerinnerung';

  @override
  String get routineNotificationTitle => 'Tägliche Routine-Benachrichtigung';

  @override
  String get todaysFortuneNotificationTitle => 'Dein heutiges Horoskop';

  @override
  String get afternoonFortuneNotificationBody =>
      'Wie sieht dein Nachmittags-Horoskop aus? Gleich nachsehen!';

  @override
  String get morningFortuneNotificationBody =>
      'Schau dir dein Horoskop an und starte voller Energie in den Tag!';

  @override
  String get fortunePassExpiryTitle => 'Fortune Pass läuft heute ab';

  @override
  String get fortunePassExpiryBody =>
      'Ihre Fortune Pass-Mitgliedschaft läuft heute ab. Erneuern Sie sie, um die Vorteile weiterhin zu nutzen!';

  @override
  String get takeNow => 'Jetzt einnehmen';

  @override
  String get later => 'Später';

  @override
  String get turnOffAlarmAction => 'Alarm ausschalten';

  @override
  String get todaysFortuneNotification => 'Heutige Horoskop-Benachrichtigung';

  @override
  String get enableNotification => 'Benachrichtigung aktivieren';

  @override
  String get fortuneNotificationDescription =>
      'Informiert Sie zur festgelegten Zeit über Ihr heutiges Horoskop.';

  @override
  String get morningNotificationTime => 'Benachrichtigungszeit am Morgen';

  @override
  String get afternoonNotificationTime => 'Benachrichtigungszeit am Nachmittag';

  @override
  String get morningFortuneTitle => 'Morgen-Horoskop';

  @override
  String get afternoonFortuneTitle => 'Nachmittag-Horoskop';

  @override
  String get type => 'Typ';

  @override
  String get supplementChannelDesc =>
      'Kanal für Benachrichtigungen zur Einnahme von Nahrungsergänzungsmitteln.';

  @override
  String get waterChannelDesc =>
      'Kanal für Benachrichtigungen zur Wassertrinkgewohnheit.';

  @override
  String get waterSummaryTitle => 'Wassertrink-Benachrichtigung';

  @override
  String get dailyRoutineChannelDesc =>
      'Kanal für tägliche Missions- und Gewohnheitsbildungs-Benachrichtigungen.';

  @override
  String get dailyRoutineSummaryTitle => 'Tägliche Routine-Benachrichtigung';

  @override
  String get missionChannelName => 'Missions-Benachrichtigung';

  @override
  String get missionChannelDesc =>
      'Kanal für allgemeine Missions-Benachrichtigungen.';

  @override
  String get fortuneChannelName => 'Glücks-Benachrichtigung';

  @override
  String get fortuneChannelDesc =>
      'Kanal für tägliche Glücks-Check-Benachrichtigungen.';

  @override
  String get subscriptionChannelName => 'Abonnement-Benachrichtigung';

  @override
  String get subscriptionChannelDesc =>
      'Kanal für Fortune Pass-Ablauf- und Abonnement-Benachrichtigungen.';

  @override
  String get alarmChannelName => 'Wecker';

  @override
  String get alarmChannelDesc => 'Kanal für Aufwach- und Missions-Alarme.';

  @override
  String get shareViaKakao => 'Über KakaoTalk teilen';

  @override
  String get shareViaSNS =>
      'Über andere soziale Netzwerke teilen (Instagram, Twitter, etc.)';

  @override
  String get checkDetailResult => 'Detailliertes Ergebnis prüfen';

  @override
  String get viewMyFortuneResult => 'Mein Glücksergebnis anzeigen';

  @override
  String get takeSupplementNow =>
      'Bitte nehmen Sie Ihre Nahrungsergänzungsmittel ein!';

  @override
  String get takeNowQuestion => 'Möchten Sie es jetzt einnehmen?';

  @override
  String get eatNow => 'Jetzt einnehmen';

  @override
  String get eatLater => 'Später einnehmen';

  @override
  String snoozeMessageGeneric(int minutes) {
    return 'Ich werde Sie in $minutes Minuten erneut erinnern.';
  }

  @override
  String get hours => 'Stunden';

  @override
  String get cheeringMessage4 => 'Lebhafter Morgen, glücklicher Start!';

  @override
  String get cheeringMessage5 => 'Hab einen lächelnden Tag.';

  @override
  String get cheeringMessage6 => 'Kopf hoch heute!';

  @override
  String get cheeringMessage7 => 'Du wirst heute genug strahlen.';

  @override
  String get cheeringMessage8 =>
      'Ich habe das Gefühl, dass etwas Gutes passieren wird!';

  @override
  String get cheeringMessage9 => 'Gute Arbeit heute. Ein kraftvoller Start!';

  @override
  String get cheeringMessage10 => 'Das Glück ist immer an deiner Seite.';

  @override
  String get cheeringMessage11 =>
      'Ich drücke dir heute die Daumen für deine Träume.';

  @override
  String get cheeringMessage12 => 'Erfrischender Morgen, angenehmer Tag!';

  @override
  String get cheeringMessage13 => 'Sei heute siegreich!';

  @override
  String get cheeringMessage14 => 'Du bist wertvoll, einfach weil du du bist.';

  @override
  String get cheeringMessage15 => 'Hab einen Tag voller angenehmer Dinge.';

  @override
  String get cheeringMessage16 => 'Ich hoffe, dein Tag funkelt heute!';

  @override
  String get cheeringMessage17 => 'Dein Lächeln erhellt die Welt.';

  @override
  String get cheeringMessage18 => 'Sei heute du selbst!';

  @override
  String get cheeringMessage19 => 'Beginne den Tag mit flatterndem Herzen.';

  @override
  String get cheeringMessage20 => 'Ein wunderbarer Tag erwartet dich.';

  @override
  String get cheeringMessage21 => 'Mit der Kraft der Positivität heute!';

  @override
  String get cheeringMessage22 => 'Ich unterstütze deinen Weg.';

  @override
  String get cheeringMessage23 => 'Mach das Beste aus dem heutigen Tag!';

  @override
  String get cheeringMessage24 => 'Möge das Glück mit dir sein!';

  @override
  String get cheeringMessage25 => 'Hab heute einen herzlichen Tag.';

  @override
  String get cheeringMessage26 => 'Du schaffst das!';

  @override
  String get cheeringMessage27 => 'Beginne den Tag mit Dankbarkeit.';

  @override
  String get cheeringMessage28 => 'Dein Wert ist unendlich.';

  @override
  String get cheeringMessage29 => 'Möge dein Tag mit einem Lächeln erblühen.';

  @override
  String get cheeringMessage30 => 'Hab eine gute Zeit mit guten Menschen!';

  @override
  String get cheeringMessage31 => 'Heute einen Schritt näher an deine Träume!';

  @override
  String get cheeringMessage32 => 'Du bist heute der Coolste.';

  @override
  String get cheeringMessage33 => 'Ein wunderbarer Tag wird kommen.';

  @override
  String get cheeringMessage34 => 'Genieße deinen Tag heute in aller Ruhe.';

  @override
  String get cheeringMessage35 =>
      'Deine Bemühungen werden dich nicht verraten.';

  @override
  String get cheeringMessage36 => 'Hab heute einen gesunden Tag.';

  @override
  String get cheeringMessage37 => 'Du wurdest geboren, um geliebt zu werden!';

  @override
  String get cheeringMessage38 => 'Sei heute mutig!';

  @override
  String get cheeringMessage39 => 'Eine strahlende Zukunft erwartet dich.';

  @override
  String get cheeringMessage40 => 'Hab einen tag voller Leidenschaft!';

  @override
  String get cheeringMessage41 => 'Ich hoffe, dein Geist ist in Frieden.';

  @override
  String get cheeringMessage42 => 'Finde heute das kleine Glück.';

  @override
  String get cheeringMessage43 => 'Du machst das schon gut genug.';

  @override
  String get cheeringMessage44 => 'Beginne den Tag hoffnungsvoll.';

  @override
  String get cheeringMessage45 =>
      'Deine Freundlichkeit ist eine große Stärke für jemanden.';

  @override
  String get cheeringMessage46 => 'Hab heute einen produktiven Tag.';

  @override
  String get cheeringMessage47 => 'Du hast die Kraft, die Welt zu verändern.';

  @override
  String get cheeringMessage48 => 'Klarer Tag heute!';

  @override
  String get cheeringMessage49 => 'Strahle deinen Charme nach Herzenslust aus.';

  @override
  String get cheeringMessage50 => 'Fülle deinen Tag heute mit Glück!';

  @override
  String get locationServiceDisabled => 'Standortdienste sind deaktiviert.';

  @override
  String get locationPermissionDenied => 'Standortberechtigung verweigert.';

  @override
  String get locationPermissionPermanentlyDenied =>
      'Standortberechtigung dauerhaft verweigert.';

  @override
  String get deleteMissionTitle => 'Mission löschen';

  @override
  String get deleteMissionConfirm =>
      'Sind Sie sicher, dass Sie diese Mission löschen möchten?';

  @override
  String get yesDelete => 'Ja, löschen';

  @override
  String get waterAlarmTitle => 'Zeit, Wasser zu trinken! 💧';

  @override
  String get waterAlarmBody =>
      'Wie wäre es mit einem Glas kühlem Wasser für Ihre Gesundheit?';

  @override
  String get supplementAlarmBody =>
      'Vergiss nicht, deine Nahrungsergänzungsmittel für heute einzunehmen.';

  @override
  String get waterHabitChannelDesc =>
      'Benachrichtigungskanal für die Wassertrinkgewohnheit.';

  @override
  String get pleaseSolveMath => 'Bitte lösen Sie das Problem.';

  @override
  String detectedLabel(String labels) {
    return '[Erkannt: $labels]';
  }

  @override
  String get defaultSleepDuration => '7 Std. 30 Min.';

  @override
  String get year2024Name => 'Gap-Chin Jahr (Jahr des Blauen Drachen)';

  @override
  String get year2025Name => 'Eul-Sa Jahr (Jahr der Blauen Schlange)';

  @override
  String get year2026Name => 'Byeong-O Jahr (Jahr des Roten Pferdes)';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle Anfrage] $title';
  }

  @override
  String get summary => 'Zusammenfassung';

  @override
  String get monthlySummary => 'Monatliche Zusammenfassung';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month Monatliche Erfolgsquote: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return 'Keine Aufzeichnungen für $month';
  }

  @override
  String get missionRecord => 'Missionsrekord';

  @override
  String get supplementRecord => 'Ergänzungsaufzeichnung';

  @override
  String get timeSaleCatchChance => 'Nutzen Sie die 50% Rabatt-Chance!';
}
