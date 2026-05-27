// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => 'Bonjour ! Commencez votre journée chanceuse.';

  @override
  String get missionWakeUp => 'Mission Réveil';

  @override
  String get missionSupplement => 'Prendre des compléments';

  @override
  String get missionWater => 'Boire plus de 2L d\'eau';

  @override
  String get fortuneCookie => 'Biscuit de Fortune';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get languageKorean => 'Coréen';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageJapanese => 'Japonais';

  @override
  String get languageChinese => 'Chinois';

  @override
  String get languageRussian => 'Russe';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get languageSpanish => 'Espagnol';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get alarm => 'Alarme';

  @override
  String get calendar => 'Calendrier';

  @override
  String get mission => 'Mission';

  @override
  String get fortune => 'Fortune';

  @override
  String get congratulations => 'Félicitations !';

  @override
  String get allMissionsCompleted =>
      'Vous avez terminé les 5 missions d\'aujourd\'hui.';

  @override
  String get rewardReceived =>
      'Vous avez reçu 1 Fortune Cookie en récompense ! 🥠';

  @override
  String get confirm => 'Confirmer';

  @override
  String get missionSuccess => 'Mission réussie !';

  @override
  String get cheeringMessage1 => 'Passez une excellente journée aujourd\'hui !';

  @override
  String get cheeringMessage2 => 'Je vous soutiens aujourd\'hui !';

  @override
  String get cheeringMessage3 => 'Ce sera une journée merveilleuse.';

  @override
  String get todaysCheering => 'Message du jour';

  @override
  String get notificationWakeUpBody => 'C\'est l\'heure de se réveiller !';

  @override
  String get notificationMissionBody =>
      'Remplissez la mission et éteignez l\'alarme !';

  @override
  String get notificationSafetyBody =>
      'L\'alarme a été fermée de force ! Veuillez terminer la mission.';

  @override
  String get notificationRingingBody => 'L\'alarme sonne !';

  @override
  String get snoozePrefix => '[Rappel]';

  @override
  String get exactAlarmPermissionRequired =>
      'La permission \"Alarme exacte\" est requise pour sonner à l\'heure correcte.';

  @override
  String get overlayPermissionRequired =>
      'La permission \"Afficher sur d\'autres applis\" est requise pour les notifications plein écran.';

  @override
  String get deleteAllAlarms => 'Supprimer toutes les alarmes';

  @override
  String get noAlarms => 'Aucune alarme enregistrée.';

  @override
  String get lessThanAMinuteRemaining => 'Sonne dans moins d\'une minute';

  @override
  String hoursMinutesRemaining(String hours, String minutes) {
    return 'Sonne dans ${hours}h ${minutes}m';
  }

  @override
  String minutesRemaining(String minutes) {
    return 'Sonne dans ${minutes}m';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward =>
      'Récompense quotidienne Fortune Cookie';

  @override
  String get missionRewardInfo =>
      '1 cookie pour 5 missions réussies, 2 pour 10 !';

  @override
  String get dailyMission => 'Mission Quotidienne';

  @override
  String goalAchieved(int completed) {
    return '🎉 $completed/5 Objectif Atteint !';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 Atteint';
  }

  @override
  String get myMissionRecord => 'Mon Journal de Mission';

  @override
  String get consecutiveSuccess => 'Consécutif';

  @override
  String get successRate30Days => 'Taux de réussite (30j)';

  @override
  String get totalSuccess => 'Succès Total';

  @override
  String get inProgress => 'En cours 🔥';

  @override
  String get resetMissions => 'Réinitialiser les missions';

  @override
  String get resetMissionsConfirm =>
      'Voulez-vous réinitialiser toutes les listes de défis ?\n(Excluant les missions système de base)';

  @override
  String get cancel => 'Annuler';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get addMission => 'Ajouter une mission';

  @override
  String get completedMissions => 'Missions terminées';

  @override
  String get noCompletedMissionsHint =>
      'Aucune mission terminée pour l\'instant. Atteignez l\'objectif du jour.';

  @override
  String greeting(String userName) {
    return 'Bonjour, $userName';
  }

  @override
  String get welcomeFortune =>
      'Bienvenue dans le monde mystérieux de la fortune';

  @override
  String get luckyColor => 'Couleur porte-bonheur';

  @override
  String get luckyItem => 'Objet porte-bonheur';

  @override
  String get luckyDirection => 'Direction porte-bonheur';

  @override
  String get viewVariousFortunes => 'Voir diverses fortunes';

  @override
  String get todaysRecommendation => 'Recommandation du jour';

  @override
  String get checkTodaysFortune => 'Voir la fortune du jour';

  @override
  String get todaysAdvice => 'Conseil du jour';

  @override
  String get viewSpecificDateFortune => 'Fortune pour une date précise';

  @override
  String get luckyNumberRecommendation => 'Numéros chance du jour';

  @override
  String get luckyNumber => 'Numéro chance';

  @override
  String get specificDateFortune => 'Fortune à une date précise';

  @override
  String get specialDayFortune => 'Fortune des jours spéciaux';

  @override
  String get newYearFortune => 'Fortune du Nouvel An';

  @override
  String get totalFortune2026 => 'Fortune Totale 2026';

  @override
  String get traditionalFortune => 'Fortune Traditionnelle (Tojeong)';

  @override
  String get traditionalSaju => 'Analyse Saju Traditionnelle';

  @override
  String get faceReading => 'Lecture du Visage AI';

  @override
  String get missionFaceReading => 'Mission Lecture Visage';

  @override
  String get faceFate => 'Destin du Visage';

  @override
  String get compatibility => 'Compatibilité';

  @override
  String get relationshipHarmony => 'Harmonie Relationnelle';

  @override
  String get ohaengWood => 'Bois';

  @override
  String get ohaengFire => 'Feu';

  @override
  String get ohaengEarth => 'Terre';

  @override
  String get ohaengMetal => 'Métal';

  @override
  String get ohaengWater => 'Eau';

  @override
  String get ohaengWoodSymbol => 'Bois';

  @override
  String get ohaengFireSymbol => 'Feu';

  @override
  String get ohaengEarthSymbol => 'Terre';

  @override
  String get ohaengMetalSymbol => 'Métal';

  @override
  String get ohaengWaterSymbol => 'Eau';

  @override
  String get ohaengWoodExplanation =>
      'Avec une forte énergie de Bois (Arbre), vous êtes plein de croissance et de motivation, possédant une nature compatissante et entreprenante.';

  @override
  String get ohaengFireExplanation =>
      'Avec une forte énergie de Feu, vous êtes passionné et poli, avec une tendance à être actif et amateur de choses glamour.';

  @override
  String get ohaengEarthExplanation =>
      'Avec une forte énergie de Terre, vous avez confiance et tolérance, possédant une nature grave et immuable.';

  @override
  String get ohaengMetalExplanation =>
      'Avec une forte énergie de Métal, vous avez de la décision et de la loyauté, possédant une nature calme qui valorise les principes.';

  @override
  String get ohaengWaterExplanation =>
      'Avec une forte énergie de Eau, vous avez de la sagesse et de la flexibilité, possédant une nature intelligente et très adaptable.';

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
  String get jijiChuk => 'Bœuf';

  @override
  String get jijiIn => 'Tigre';

  @override
  String get jijiMyo => 'Lapin';

  @override
  String get jijiJin => 'Dragon';

  @override
  String get jijiSa => 'Serpent';

  @override
  String get jijiO => 'Cheval';

  @override
  String get jijiMi => 'Chèvre';

  @override
  String get jijiSin => 'Singe';

  @override
  String get jijiYu => 'Coq';

  @override
  String get jijiSul => 'Chien';

  @override
  String get jijiHae => 'Cochon';

  @override
  String get jijiAnimalRat => 'Rat';

  @override
  String get jijiAnimalOx => 'Bœuf';

  @override
  String get jijiAnimalTiger => 'Tigre';

  @override
  String get jijiAnimalRabbit => 'Lapin';

  @override
  String get jijiAnimalDragon => 'Dragon';

  @override
  String get jijiAnimalSnake => 'Serpent';

  @override
  String get jijiAnimalHorse => 'Cheval';

  @override
  String get jijiAnimalSheep => 'Mouton';

  @override
  String get jijiAnimalMonkey => 'Singe';

  @override
  String get jijiAnimalRooster => 'Coq';

  @override
  String get jijiAnimalDog => 'Chien';

  @override
  String get jijiAnimalPig => 'Cochon';

  @override
  String get assetDefaultBackground => 'Arrière-plan par défaut';

  @override
  String get assetFortuneyFriends => 'Amis Fortuney';

  @override
  String get assetMongchuny => 'Mongchuny';

  @override
  String get assetPanchuny => 'Panchuny';

  @override
  String get assetTochuny => 'Tochuny';

  @override
  String get assetHochuny => 'Hochuny';

  @override
  String get assetBear => 'Ours';

  @override
  String get assetMoon => 'Lune';

  @override
  String get assetBridge => 'Pont';

  @override
  String get assetRoad => 'Route';

  @override
  String get assetSky => 'Ciel';

  @override
  String get assetMinimalGray => 'Gris minimal';

  @override
  String get assetDarkMode => 'Mode sombre';

  @override
  String get assetSoftBlue => 'Bleu doux';

  @override
  String get assetWarmBeige => 'Beige chaud';

  @override
  String assetCat(int number) {
    return 'Chat $number';
  }

  @override
  String assetDog(int number) {
    return 'Chien $number';
  }

  @override
  String assetSea(int number) {
    return 'Mer $number';
  }

  @override
  String get categoryCharacter => 'Personnage';

  @override
  String get categoryAnimal => 'Animal';

  @override
  String get categoryIllustration => 'Illustration';

  @override
  String get categoryLandscape => 'Paysage';

  @override
  String get categorySimple => 'Simple';

  @override
  String get alarmBackground => 'Arrière-plan de l\'alarme';

  @override
  String get random => 'Aléatoire';

  @override
  String get gallery => 'Galerie';

  @override
  String get selectSolidColor => 'Sélectionner une couleur unie';

  @override
  String get deleteColor => 'Supprimer la couleur';

  @override
  String get deleteColorConfirm =>
      'Êtes-vous sûr de vouloir supprimer cette couleur de la liste ?';

  @override
  String get deleteMission => 'Supprimer la mission';

  @override
  String get deleteMissionConfirm =>
      'Êtes-vous sûr de vouloir supprimer cette mission ?';

  @override
  String get randomBackgroundDesc =>
      'Un nouvel arrière-plan à chaque sonnerie d\'alarme !';

  @override
  String get backgroundDeleted => 'Image d\'arrière-plan supprimée.';

  @override
  String get pickFromDevice => 'Choisir depuis l\'appareil';

  @override
  String get alarmSaveError =>
      'Échec de l\'enregistrement de l\'alarme. Une erreur inconnue est survenue.';

  @override
  String errorOccurred(String error) {
    return 'Une erreur est survenue : $error';
  }

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get videoLoadFailed =>
      'Échec du chargement de la vidéo\nAppuyez pour réessayer';

  @override
  String get itsTimeToWakeUp => 'Il est temps de se lever !';

  @override
  String get dismissAlarm => 'Arrêter l\'alarme';

  @override
  String get slideToDismiss => 'Faire glisser pour arrêter';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes min x $count fois';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '${minutes}m, Illimité';
  }

  @override
  String get quickAlarm => 'Alarme rapide';

  @override
  String get setQuickAlarm => 'Régler l\'alarme rapide';

  @override
  String addMinutes(String minutes) {
    return '+ ${minutes}m';
  }

  @override
  String ringingAt(String time) {
    return 'Sonne à $time';
  }

  @override
  String get pleaseSetTime => 'Veuillez régler l\'heure.';

  @override
  String get alarmSaved => 'Alarme enregistrée.';

  @override
  String get alarmScheduledTitle => 'Alarme programmée';

  @override
  String alarmScheduledBody(String time) {
    return 'L\'alarme sonnera à $time.';
  }

  @override
  String get goodDay => 'Ce sera une journée merveilleuse !';

  @override
  String get luckyDay => 'Je vous souhaite une journée pleine de chance !';

  @override
  String get cheerUp => 'Passez une excellente journée productive !';

  @override
  String get stayHappy => 'Profitez de chaque instant aujourd\'hui !';

  @override
  String get youCanDoIt => 'Aujourd\'hui, tout est possible !';

  @override
  String get noActiveAlarms => 'Pas d\'alarmes actives';

  @override
  String get wealth => 'Richesse';

  @override
  String get love => 'Relation';

  @override
  String get career => 'Carrière';

  @override
  String get health => 'Santé';

  @override
  String get faceAnalysisBasic => 'Analyse du visage (Basique)';

  @override
  String get insufficientDataOverallImpression =>
      'Données de mesure insuffisantes, interprétées selon l\'impression générale.';

  @override
  String get noseStabilityWealthAccuracy =>
      'La stabilité du contour du nez augmente la précision de l\'interprétation de la fortune de richesse.';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      'La clarté du contour de la bouche affine l\'interprétation de la fortune interpersonnelle et de la parole.';

  @override
  String get improveAnalysisQualityAdvice =>
      'Un éclairage plus vif et faire face à l\'appareil amélioreront la qualité de l\'analyse.';

  @override
  String get basicAnalysisDescription =>
      'Ce résultat est affiché comme une interprétation de base en raison de mesures insuffisantes du contour/de l\'expression du visage.\nLa stabilité des indicateurs tels que l\'ouverture des yeux, le contour du nez et la zone de la bouche s\'améliorera en faisant face à l\'appareil et avec un meilleur éclairage.\nRéessayer rendra les distributions de scores et les descriptions plus spécifiques.';

  @override
  String get defaultDailyFortune =>
      'Aujourd\'hui est une bonne journée pour commencer avec un esprit paisible.\nRemplissez-vous d\'énergie positive avec un sourire dans le miroir.\nUn peu de loisir apporte une chance inattendue.';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '${vibe}Aujourd\'hui, votre fortune $topKey ressort le plus. En revanche, $bottomKey semble nécessiter une attention particulière.';
  }

  @override
  String get faceShapeVLine => 'Visage en V';

  @override
  String get faceShapeSquare => 'Carré';

  @override
  String get faceShapeBalanced => 'Équilibré';

  @override
  String get faceShapeRound => 'Rond';

  @override
  String get faceShapeLong => 'Allongé';

  @override
  String get faceShapeOval => 'Ovale';

  @override
  String get titleWealthOriented => 'Visage tourné vers la richesse';

  @override
  String get titleLoveStrong => 'Visage favorisant les relations';

  @override
  String get titleCareerNotable => 'Visage favorisant la carrière';

  @override
  String get titleStableEnergy => 'Visage à l\'énergie stable';

  @override
  String get faceAnalysisComplete => 'Analyse terminée !';

  @override
  String get chooseUnlockMethod =>
      'Choisissez une méthode pour\ndébloquer votre résultat.';

  @override
  String get watchAdForFreeResult => 'Regarder une pub (Gratuit)';

  @override
  String get useTwoCookies => 'Utiliser 2 Fortune Cookies';

  @override
  String get checkResult => 'Vérifier le résultat';

  @override
  String get aiAnalyzingFace => 'L\'IA analyse votre visage...';

  @override
  String get faceRecognitionComplete => 'Visage reconnu';

  @override
  String get extractingFeatures => 'Extraction des traits...';

  @override
  String get matchingFortuneData => 'Analyse des données...';

  @override
  String get adLoadFailedFreeUnlock =>
      'Échec du chargement de la pub. Débloqué gratuitement.';

  @override
  String get insufficientCookies => 'Cookies insuffisants';

  @override
  String get insufficientCookiesDesc =>
      'Pas assez de Fortune Cookies.\nRegardez une pub pour vérifier gratuitement !';

  @override
  String get usingTwoCookiesToast => '2 Fortune Cookies utilisés.';

  @override
  String get todaysFaceAnalysis => 'Analyse du visage d\'aujourd\'hui';

  @override
  String totalScoreWithPoints(int score) {
    return 'Score total : $score pts';
  }

  @override
  String get adLoadFailFreeAccess =>
      'Échec du chargement de la pub. Accès gratuit cette fois.';

  @override
  String get insufficientCookiesTitle => 'Pas assez de Fortune Cookies';

  @override
  String get insufficientCookiesMessage =>
      'Gagnez-en via les missions ou regardez une pub.';

  @override
  String get useCookiesSnackbar => '2 Fortune Cookies ont été utilisés.';

  @override
  String get faceAnalysisComplete_v2 => 'Analyse du visage terminée !';

  @override
  String get chooseMethodToViewResult =>
      'Choisissez une méthode pour voir votre fortune cachée.';

  @override
  String get watchAdForFree => 'Regarder une pub (Gratuit)';

  @override
  String get useTwoCookies_v2 => 'Utiliser 2 cookies';

  @override
  String get viewResult => 'Voir le résultat';

  @override
  String get aiAnalyzingFace_v2 => 'L’IA analyse votre visage...';

  @override
  String get faceRecognitionComplete_v2 => 'Reconnaissance terminée';

  @override
  String get extractingFeatures_v2 => 'Extraction des caractéristiques...';

  @override
  String get matchingFortuneData_v2 => 'Correspondance des données...';

  @override
  String get wealthLuck => '💰 Richesse';

  @override
  String get loveLuck => '❤️ Amour';

  @override
  String get careerLuck => '💼 Carrière';

  @override
  String get healthLuck => '💪 Santé';

  @override
  String get tojeongMonthlyGood_0 =>
      'Une personne de noble lignée venant de l\'est apporte de bonnes nouvelles. Vos projets de longue date vont enfin aboutir.';

  @override
  String get tojeongMonthlyGood_1 =>
      'La richesse coule comme une source. Vos soucis s\'estompent et tout avance sans encombre.';

  @override
  String get tojeongMonthlyGood_2 =>
      'Vos efforts portent leurs fruits et vous recevez des félicitations. Une promotion ou de grands résultats sont attendus.';

  @override
  String get tojeongMonthlyGood_3 =>
      'Le soleil se lève après une nuit sombre. Les épreuves se terminent et le bonheur arrive.';

  @override
  String get tojeongMonthlyGood_4 =>
      'Une rentrée d\'argent inattendue remplit vos poches. De petits investissements mènent à de gros profits.';

  @override
  String get tojeongMonthlyNeutral_0 =>
      'Une vie quotidienne paisible se poursuit. La période passe sans événement particulier.';

  @override
  String get tojeongMonthlyNeutral_1 =>
      'Le contentement apporte la paix de l\'esprit. Savourez ces petits bonheurs.';

  @override
  String get tojeongMonthlyNeutral_2 =>
      'Prenez du repos dans votre vie trépidante. Portez une attention particulière à votre santé.';

  @override
  String get tojeongMonthlyNeutral_3 =>
      'Maintenez votre situation actuelle plutôt que de vous lancer dans la nouveauté.';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'La communication est la clé. Surveillez vos paroles pour éviter tout malentendu.';

  @override
  String get tojeongMonthlyCaution_0 =>
      'Soyez prudent en tout. Mieux vaut prévenir que guérir.';

  @override
  String get tojeongMonthlyCaution_1 =>
      'Faites attention à votre santé et évitez tout surmenage.';

  @override
  String get tojeongMonthlyCaution_2 =>
      'Évitez les commérages et ne vous mêlez pas des affaires d\'autrui.';

  @override
  String get tojeongMonthlyCaution_3 =>
      'Une ambition excessive apporte des ennuis. Vivez selon vos moyens.';

  @override
  String get tojeongMonthlyCaution_4 =>
      'Évitez les transactions financières, vous pourriez être déçu par des personnes de confiance.';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      'Avec l’énergie claire de la nouvelle année avec vous, les choses se passeront bien une fois que vous aurez commencé à faire ce que vous avez prévu.';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      'Au début de l\'année, vous recevrez l\'aide de personnes nobles, alors chérissez vos relations avec les gens qui vous entourent.';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'Si vous êtes trop motivé, vous risquez de mal faire les choses. Examinez sereinement vos projets dans une perspective à long terme.';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      'Un bien commencé est à moitié fait. Si vous commencez hardiment à faire quelque chose que vous avez reporté, vous obtiendrez des résultats inattendus.';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      'De petits changements dans vos habitudes peuvent changer le cours de votre chance. Prenez l’habitude de vous lever tôt.';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      'Ce n’est pas encore le moment, nous devons donc renforcer nos forces sous la surface et rechercher des opportunités.';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      'D’anciens problèmes ou conflits peuvent refaire surface. Ne l’évitez pas et affrontez-le de front.';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      'C’est une époque où il est plus important de construire du contenu plutôt que des performances extérieures. Des mouvements précipités peuvent causer des dégâts.';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      'Alors que nous attendons le printemps à la fin de l’hiver, des opportunités se présentent à ceux qui se préparent avec patience.';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      'Vous devez parcourir tranquillement votre propre chemin sans être dérangé par le bruit qui vous entoure.';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      'L’énergie de revitalisation de toutes choses vous apporte de nouvelles opportunités. N\'hésitez pas et relevez le défi.';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      'C\'est le mois où une nouvelle relation peut commencer. Si vous traitez les gens avec un esprit positif, vous obtiendrez de bons résultats.';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      'Il est facile de perdre sa concentration face au vent du changement. Contrôlez votre esprit afin de ne pas vous laisser influencer par des changements émotionnels mineurs.';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      'Tout comme une pousse qui traverse le sol, c’est le moment où votre potentiel explose. Soyez confiant.';

  @override
  String get tojeongMonthlySpecial_3_4 =>
      'Une relation précieuse viendra à vous, alors ouvrez la porte de votre cœur et accueillez les gens.';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      'Votre richesse augmentera avec l’énergie chaude. Les fruits de vos efforts déboucheront sur des récompenses financières.';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      'Vous avez de la chance avec les documents, vous pouvez donc obtenir de bons résultats aux contrats ou aux examens. Veuillez examiner attentivement.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      'Des dépenses inattendues peuvent survenir, vous devez donc accorder une attention particulière à la gestion de votre argent.';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      'C’est le mois où vos charmes ressortent comme des fleurs en pleine floraison. Prendre des initiatives dans les relations interpersonnelles.';

  @override
  String get tojeongMonthlySpecial_4_4 =>
      'C’est le bon moment pour investir ou augmenter votre épargne car vous serez béni par la richesse.';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      'Comme il règne une atmosphère harmonieuse à la maison, vous trouverez joie et stabilité dans vos relations avec votre famille.';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      'La gentillesse que vous manifestez envers votre entourage reviendra comme une bénédiction. L’accumulation de vertu aide à résoudre les difficultés.';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'Un petit malentendu peut provoquer une bagarre avec un proche. Une posture inversée est requise.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      'Comme c\'est le Mois de la famille, concentrez-vous sur le temps passé avec votre famille. L\'harmonie au sein de la famille est le fondement de tout.';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      'Si vous regardez autour de vous l’esprit tranquille, vous découvrirez des choses précieuses qui vous manquaient.';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      'Vos efforts porteront leurs fruits et vous recevrez la reconnaissance de votre entourage. Il existe une opportunité de promotion ou d’honneur.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      'À mesure que votre énergie active devient plus forte, il peut être utile d’envisager de vous lancer dans un nouveau domaine ou de changer d’emploi.';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'Si vous allez trop loin, vous risquez d’avoir des ennuis. Restez humble et regardez autour de vous.';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      'Avant que la chaleur ne commence, vous devez faire le plein d\'endurance. C\'est également une bonne idée de passer un bilan de santé.';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      'Prenez le temps de faire un bilan à mi-parcours pour terminer le premier semestre et planifier le second semestre.';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      'C’est une époque où la passion passionnée mène aux résultats. Si vous avancez avec audace, vous pouvez atteindre vos objectifs.';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      'Vous pouvez rencontrer quelqu\'un de précieux ou obtenir une nouvelle opportunité lors d\'un voyage ou d\'un déménagement.';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      'C’est une période où votre santé peut être facilement compromise. Il est important d’éviter le surmenage et de se reposer suffisamment.';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      'Cela demande une passion infatigable, même sous une chaleur torride. Autant vous transpirez, autant vous obtiendrez des résultats.';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      'Prenez le temps de vous ressourcer grâce au repos. Un long voyage porte chance.';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      'Au fil du temps, la patience commence à s’améliorer progressivement. Ne soyez pas impatient et attendez votre heure.';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      'Les vieux problèmes non résolus trouveront un indice. Utilisez votre intelligence pour le résoudre.';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      'Il est facile de baisser la garde lorsqu’il s’agit de concrétiser. Ne lâchez pas votre tension jusqu\'à la fin.';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      'Il est temps de donner le dernier élan avant la saison fructueuse. Ne vous détendez pas.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      'Il y a un coup de main inattendu. Si vous rencontrez des difficultés, demandez conseil à votre entourage.';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      'Comme la saison de fécondité abondante, c’est une période où la richesse et la fortune amoureuse deviennent abondantes.';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      'Si vous y consacrez beaucoup d’efforts, vous obtiendrez de meilleurs résultats que prévu.';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'Tout comme il y a beaucoup d’entrées, beaucoup de choses peuvent sortir. Vous avez besoin d’un plan de dépenses intelligent.';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      'C\'est une période d\'abondance comme les champs dorés. Si vous avez un cœur généreux, de plus grandes bénédictions vous parviendront.';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      'C’est le bon moment pour résoudre tout malentendu ou conflit. Tendez d\'abord la main.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      'Votre renommée augmentera et votre nom deviendra largement connu. Vous gagnerez la confiance de votre entourage.';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      'Vous pouvez obtenir d\'excellents résultats dans les activités intellectuelles. C’est le bon moment pour vous concentrer sur vos études ou vos recherches.';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      'À mesure que votre statut augmente, votre responsabilité devient plus lourde. Vous devez faire attention à vos paroles et à vos actions.';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'Votre renommée s\'élève comme le ciel bleu. Libérez pleinement vos capacités.';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      'C’est un bon mois pour développer la sagesse intérieure grâce à une contemplation et une lecture profondes.';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      'C’est une période où nous avons besoin de sagesse pour revenir sur l’année écoulée et préparer l’avenir. Grâce à la réflexion, vous passerez au niveau supérieur.';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      'Vous retrouverez la stabilité financière, mais vous ne devriez pas faire d’investissements excessifs à la recherche de profits importants.';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      'Vous pouvez vous sentir seul dans vos relations. Tout d’abord, vous devez faire un effort pour aborder les gens avec un esprit ouvert.';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      'Tout comme pour ajuster votre col lorsqu\'un vent froid souffle, vous devez veiller à l\'aspect pratique et renforcer votre force intérieure.';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      'Alors que nous terminons l’année, nous avons besoin de sagesse pour regarder en arrière sur ce qui nous a manqué et nous préparer pour l’année prochaine.';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      'Une chance inattendue arrive à la fin de l’année. Attendez-vous à un gain financier ou à une bonne nouvelle.';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      'Vous serez récompensé pour votre travail acharné sur une longue période. C’est le mois où l’on récolte la beauté du pétrole.';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      'Des rassemblements fréquents peuvent nuire à votre santé ou entraîner des dépenses inutiles, la modération est donc nécessaire.';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      'La fin est un nouveau départ. Terminez l’année en planifiant un avenir plein d’espoir plutôt que de regrets.';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      'Si vous pratiquez le partage chaleureux, cette chaleur vous reviendra sous forme de chance.';

  @override
  String get todaysFaceFortune => 'Physionomie du jour';

  @override
  String get detailedAnalysis => 'Analyse détaillée';

  @override
  String get eyeInsight => '👁️ Œil (Perspicacité)';

  @override
  String get noseWealth => '👃 Nez (Richesse)';

  @override
  String get mouthLateLuck => '👄 Bouche (Chance tardive)';

  @override
  String get overallAnalysisTitle => 'Analyse globale';

  @override
  String get shareResultTitle => 'Résultat de la physionomie d\'aujourd\'hui';

  @override
  String shareResultDesc(String title) {
    return 'Résultat de l\'analyse du visage par l\'IA.\n$title';
  }

  @override
  String get shareResultTotalScore => 'Score total';

  @override
  String get shareResultWealth => 'Chance de richesse';

  @override
  String get shareResultLove => 'Chance d\'amour';

  @override
  String get shareResultCareer => 'Chance de carrière';

  @override
  String get shareResultHealth => 'Chance de santé';

  @override
  String get shareResultText => 'Partager le résultat';

  @override
  String get wakeUpComplete => 'Réveil terminé !';

  @override
  String get collapseOptions => 'Réduire les options';

  @override
  String get expandOptions => 'Plus d\'options';

  @override
  String get snoozeAlarm => 'Répéter l\'alarme';

  @override
  String get interval => 'Intervalle';

  @override
  String get maxSnoozeCount => 'Nombre max de répétitions';

  @override
  String get unlimited => 'Illimité';

  @override
  String get permissionRequired => 'Autorisation requise';

  @override
  String get exactAlarmFailMessage =>
      'Échec de l\'enregistrement de l\'alarme. L\'autorisation d\'alarme exacte est désactivée et doit être configurée.';

  @override
  String get batteryOptimFailMessage =>
      'Échec de l\'enregistrement de l\'alarme. L\'autorisation d\'exception d\'optimisation de la batterie est manquante.';

  @override
  String get overlayFailMessage =>
      'Échec de l\'enregistrement de l\'alarme. L\'autorisation d\'affichage sur d\'autres applications est manquante.';

  @override
  String get loadingDelay => 'Délai de chargement';

  @override
  String get loading => 'Chargement...';

  @override
  String get previewFail => 'Échec de l\'aperçu';

  @override
  String get bgDefault => 'Arrière-plan par défaut';

  @override
  String get bgFortuneFriends => 'Amis de la Fortune';

  @override
  String get bgMongChuni => 'Mongchuni';

  @override
  String get bgPanChuni => 'Panchuni';

  @override
  String get bgToChuni => 'Tochuni';

  @override
  String get bgHoChuni => 'Hochuni';

  @override
  String get bgBear => 'Ours';

  @override
  String get bgMoon => 'Lune';

  @override
  String get bgSea => 'Mer';

  @override
  String get bgBridge => 'Pont';

  @override
  String get bgRoad => 'Route';

  @override
  String get bgSky => 'Ciel';

  @override
  String get bgMinimalGray => 'Gris minimal';

  @override
  String get bgDarkMode => 'Mode sombre';

  @override
  String get bgSoftBlue => 'Bleu doux';

  @override
  String get bgWarmBeige => 'Beige chaud';

  @override
  String get dateFormatMdyE => 'd/M (E)';

  @override
  String get deleteAlarm => 'Supprimer l\'alarme';

  @override
  String get firstAlarmGuideTitle => 'Pas d\'alarme encore';

  @override
  String get firstAlarmGuideDesc =>
      'Réglez une alarme de chance et\ncommencez une journée rafraîchissante !';

  @override
  String get addAlarm => 'Ajouter une alarme';

  @override
  String get addFirstAlarm => 'Créer la première alarme';

  @override
  String get deleteAlarmConfirm => 'Supprimer cette alarme ?';

  @override
  String get welcomeMessage => 'Enchanté !';

  @override
  String get whenToRing => 'Quand dois-je vous réveiller ?';

  @override
  String get next => 'Suivant';

  @override
  String get retryFortune => 'Réessayer la fortune';

  @override
  String get retryFortuneDesc =>
      'Vous n\'aimez pas le résultat ?\nRegardez une publicité pour réessayer !';

  @override
  String get tapToReveal => 'Appuyez pour révéler la fortune';

  @override
  String get redrawButton => 'Re-tirer';

  @override
  String get defaultFortuneGreeting => 'Consultez votre horoscope du jour !';

  @override
  String get registerProfile => 'Créer un profil';

  @override
  String get todaysFortuneTitle => 'Horoscope du jour';

  @override
  String get fortuneCheckSubtitle =>
      'Comment sera votre journée ? Découvrez-le maintenant.';

  @override
  String get supportSection => 'Support';

  @override
  String get rateApp => 'Évaluer l\'application';

  @override
  String get shareWithFriends => 'Partager avec des amis';

  @override
  String get shareAppMessage =>
      'Essayez \'Fortune Alarm\' ! Réveillez-vous chaque matin avec votre horoscope du jour. https://play.google.com/store/apps/details?id=com.seriessnap.fortunealarm';

  @override
  String get locationPermissionRequiredWeather =>
      'L\'autorisation de localisation est requise pour obtenir les informations météo.';

  @override
  String get turnOnLocationService =>
      'Veuillez activer les services de localisation';

  @override
  String get checkWeatherLocationRequired => 'Localisation pour la météo';

  @override
  String get themeColor => 'Couleur du thème';

  @override
  String get confirmDelete => 'Êtes-vous sûr de vouloir supprimer ?';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get wealthLuckWithIcon => '💰 Chance de richesse';

  @override
  String get loveLuckWithIcon => '❤️ Chance d\'amour';

  @override
  String get careerLuckWithIcon => '💼 Chance de carrière';

  @override
  String get healthLuckWithIcon => '💪 Chance de santé';

  @override
  String get mouthFortune => '👄 Bouche (Chance de maturité)';

  @override
  String get comprehensiveAnalysis => 'Analyse complète';

  @override
  String get todaysFaceResult =>
      'Résultat de l\'analyse du visage d\'aujourd\'hui';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'Ceci est le résultat de l\'analyse du visage par l\'IA.\n$title';
  }

  @override
  String get shareResult => 'Partager le résultat';

  @override
  String get faceVibeSmile0 =>
      'Votre sourire radieux propage une énergie positive autour de vous. ';

  @override
  String get faceVibeSmile1 =>
      'Votre sourire reflète l\'énergie brillante de cette nouvelle journée. ';

  @override
  String get faceVibeSmile2 =>
      'Vos traits doux émanent une énergie attractive qui attirera de l\'aide aujourd\'hui. ';

  @override
  String get faceVibeSmile3 =>
      'Un sourire confiant sera la clé pour surmonter tout obstacle aujourd\'hui. ';

  @override
  String get faceVibeSmile4 =>
      'Grâce à votre sourire rafraîchissant, l\'énergie circule et la chance est là. ';

  @override
  String get faceVibeEye0 =>
      'Vos yeux brillants reflètent une forte détermination pour mener votre journée. ';

  @override
  String get faceVibeEye1 =>
      'Votre regard vif annonce un jugement et une intuition exceptionnels. ';

  @override
  String get faceVibeEye2 =>
      'Vos yeux profonds et clairs attendent de bonnes nouvelles avec sincérité. ';

  @override
  String get faceVibeEye3 =>
      'Votre regard fixe et direct augmentera votre présence aujourd\'hui. ';

  @override
  String get faceVibeEye4 =>
      'La passion dans vos yeux inspire une grande confiance à votre entourage. ';

  @override
  String get faceVibeNeutral0 =>
      'Globalement, votre énergie faciale paisible vous apporte la tranquillité d\'esprit. ';

  @override
  String get faceVibeNeutral1 =>
      'Votre teint serein montre une énergie prudente et sage. ';

  @override
  String get faceVibeNeutral2 =>
      'L\'harmonie de votre visage symbolise une journée stable et sans heurts. ';

  @override
  String get faceVibeNeutral3 =>
      'Votre expression sérieuse est idéale pour prendre des décisions importantes. ';

  @override
  String get faceVibeNeutral4 =>
      'Votre énergie faciale rassurante facilite la coopération avec les autres. ';

  @override
  String get dailyFortuneWealth0 =>
      'L\'énergie de votre nez est solide ; une planification minutieuse augmentera votre flux financier.';

  @override
  String get dailyFortuneWealth1 =>
      'Aujourd\'hui, la chance se concentre sur votre nez. Calculez bien pour maximiser vos profits.';

  @override
  String get dailyFortuneWealth2 =>
      'Le centre de votre visage a une bonne énergie ; un petit détail soigné apportera des résultats inattendus.';

  @override
  String get dailyFortuneWealth3 =>
      'Votre teint indique une bonne fortune économique. Des gains peuvent surgir de façon imprévue.';

  @override
  String get dailyFortuneWealth4 =>
      'La vitalité de votre nez aiguise votre sens économique. Journée favorable aux décisions financières.';

  @override
  String get dailyFortuneWealth5 =>
      'L\'énergie pour attirer l\'argent est forte. Vérifiez vos comptes pour attirer encore plus de chance.';

  @override
  String get dailyFortuneWealth6 =>
      'Votre visage indique que vos économies vont croître. Vos efforts commencent à porter leurs fruits.';

  @override
  String get dailyFortuneWealth7 =>
      'Une fortune stable arrive. L\'épargne constante plutôt que les grosses dépenses augmentera votre chance.';

  @override
  String get dailyFortuneWealth8 =>
      'Vos yeux pour saisir les opportunités sont brillants. Écoutez les informations autour de vous.';

  @override
  String get dailyFortuneWealth9 =>
      'Votre visage respire la prospérité. C\'est un jour où partager vous apportera plus de richesse.';

  @override
  String get dailyFortuneLove0 =>
      'Votre expression est douce ; si vous faites le premier pas, vos relations s\'amélioreront.';

  @override
  String get dailyFortuneLove1 =>
      'Votre communication est impeccable aujourd\'hui. La sincérité réduira tout malentendu.';

  @override
  String get dailyFortuneLove2 =>
      'Votre teint brillant attire des personnes précieuses. Un petit geste apportera un grand lien.';

  @override
  String get dailyFortuneLove3 =>
      'Aujourd\'hui, votre charme personnel ressort. Vous recevrez l\'énergie positive de nouvelles rencontres.';

  @override
  String get dailyFortuneLove4 =>
      'L\'énergie dans vos relations est claire ; les conflits se résolvent et l\'harmonie arrive.';

  @override
  String get dailyFortuneLove5 =>
      'La douceur de votre visage ouvre le cœur des autres. Aujourd\'hui, écouter est la meilleure façon de converser.';

  @override
  String get dailyFortuneLove6 =>
      'Votre visage indique que vous recevrez de l\'aide. Ne vous inquiétez pas seul, cherchez conseil.';

  @override
  String get dailyFortuneLove7 =>
      'Vos yeux sincères inspirent confiance. Si vous tenez vos promesses, vous renforcerez vos liens.';

  @override
  String get dailyFortuneLove8 =>
      'L\'harmonie règne dans votre entourage. Ce sera une journée riche en sourires.';

  @override
  String get dailyFortuneLove9 =>
      'Vos liens se renforcent aujourd\'hui. Exprimez votre gratitude aux personnes qui vous sont chères.';

  @override
  String get dailyFortuneCareer0 =>
      'Votre regard est vif ; si vous ciblez vos priorités, votre concentration se transformera en succès.';

  @override
  String get dailyFortuneCareer1 =>
      'Votre capacité d\'observation se distingue. Les décisions seront simples et l\'exécution ferme.';

  @override
  String get dailyFortuneCareer2 =>
      'Votre front et vos yeux sont dégagés ; aujourd\'hui, vous avez la force de réussir vos tâches.';

  @override
  String get dailyFortuneCareer3 =>
      'Votre visage exerce un leadership. Votre opinion aura une grande influence sur les autres.';

  @override
  String get dailyFortuneCareer4 =>
      'Votre jugement atteint son apogée aujourd\'hui. Même les problèmes complexes se résoudront clairement.';

  @override
  String get dailyFortuneCareer5 =>
      'Votre travail sera reconnu. Vous avez une forte énergie pour les accomplissements et les promotions.';

  @override
  String get dailyFortuneCareer6 =>
      'Énergie optimale pour lancer de nouveaux projets. Relevez le défi avec confiance.';

  @override
  String get dailyFortuneCareer7 =>
      'Votre efficacité au travail augmente nettement. Idéal pour les tâches en attente.';

  @override
  String get dailyFortuneCareer8 =>
      'Vos yeux regorgent d\'idées créatives. Prendre des notes aujourd\'hui vous portera chance.';

  @override
  String get dailyFortuneCareer9 =>
      'Votre persévérance brille aujourd\'hui. Si vous vous concentrez jusqu\'au bout, de grandes récompenses suivront.';

  @override
  String get dailyFortuneHealth0 =>
      'Votre teint est stable, donc si vous maintenez un bon rythme, votre condition physique se rétablira rapidement.';

  @override
  String get dailyFortuneHealth1 =>
      'La vitalité de votre visage est remarquable. Si vous gardez le tempo sans trop en faire, la journée sera agréable.';

  @override
  String get dailyFortuneHealth2 =>
      'L\'énergie de vos yeux et de votre peau est claire ; un court repos améliorera à la fois votre concentration et votre humeur.';

  @override
  String get dailyFortuneHealth3 =>
      'Votre rythme corporel atteint une harmonie parfaite. Un exercice léger rendra votre énergie encore plus limpide.';

  @override
  String get dailyFortuneHealth4 =>
      'Une énergie débordante se lit sur votre visage. Vous passerez une journée plaisante sans ressentir de fatigue.';

  @override
  String get dailyFortuneHealth5 =>
      'La stabilité de l\'esprit et du corps est à l\'honneur. La méditation ou la respiration profonde augmentera votre chance.';

  @override
  String get dailyFortuneHealth6 =>
      'C\'est une journée avec une bonne capacité de récupération. Vous avez la vitalité nécessaire pour effacer rapidement toute trace de fatigue.';

  @override
  String get dailyFortuneHealth7 =>
      'La vitalité de votre peau est excellente, on vous dira sûrement que vous avez l\'air en pleine forme.';

  @override
  String get dailyFortuneHealth8 =>
      'Une alimentation équilibrée et du repos renforcent la source de votre chance. Prenez le temps de chérir votre corps aujourd\'hui.';

  @override
  String get dailyFortuneHealth9 =>
      'L\'air frais et l\'hydratation sont vos meilleurs remèdes aujourd\'hui. Profitez d\'une journée pleine de vitalité.';

  @override
  String get dailyFortuneTipWealth0 =>
      'Vérifiez vos dépenses, abonnements et paiements \'demain\' plutôt que \'maintenant\'.';

  @override
  String get dailyFortuneTipWealth1 =>
      'Évitez les achats impulsifs ; ne gardez que ce dont vous avez réellement besoin.';

  @override
  String get dailyFortuneTipWealth2 =>
      'Gardez une trace de vos discussions financières pour éviter toute perte inutile.';

  @override
  String get dailyFortuneTipWealth3 =>
      'Vérifiez s\'il y a des fuites d\'argent, même pour de petites sommes.';

  @override
  String get dailyFortuneTipWealth4 =>
      'La tentation des achats impulsifs est forte aujourd\'hui. Réfléchissez 10 minutes avant de payer.';

  @override
  String get dailyFortuneTipWealth5 =>
      'Soyez prudent avec les investissements ou les transactions importantes aujourd\'hui. Demandez conseil à un expert.';

  @override
  String get dailyFortuneTipWealth6 =>
      'Organisez clairement l\'argent prêté ou celui que vous devez recevoir.';

  @override
  String get dailyFortuneTipWealth7 =>
      'Faites attention à la gestion de votre portefeuille. Une légère tendance à la perte ou au gaspillage est visible.';

  @override
  String get dailyFortuneTipWealth8 =>
      'Privilégiez les gains concrets plutôt que les dépenses liées à l\'apparence.';

  @override
  String get dailyFortuneTipWealth9 =>
      'Plutôt que d\'attendre quelque chose gratuitement, payer le juste prix est le meilleur moyen de conserver votre chance.';

  @override
  String get dailyFortuneTipLove0 =>
      'Comme votre ton peut devenir tranchant, prenez une pause avant de répondre.';

  @override
  String get dailyFortuneTipLove1 =>
      'Si un malentendu surgit, une brève vérification vaut mieux qu\'une longue explication.';

  @override
  String get dailyFortuneTipLove2 =>
      'Aujourd\'hui, la confiance se gagne simplement en respectant vos rendez-vous à l\'heure.';

  @override
  String get dailyFortuneTipLove3 =>
      'La conversation sera moins éprouvante si vous commencez directement par la conclusion.';

  @override
  String get dailyFortuneTipLove4 =>
      'Restez poli, même avec vos proches. La familiarité pourrait vous amener à les blesser involontairement.';

  @override
  String get dailyFortuneTipLove5 =>
      'Essayez de complimenter avant de critiquer. Le cœur fermé de l\'autre s\'ouvrira plus facilement.';

  @override
  String get dailyFortuneTipLove6 =>
      'Attention aux lapsus aujourd\'hui. Confirmez les points importants par écrit.';

  @override
  String get dailyFortuneTipLove7 =>
      'Ne pas trop s\'immiscer dans les affaires d\'autrui est le secret pour éviter les rumeurs.';

  @override
  String get dailyFortuneTipLove8 =>
      'Une conversation rationnelle plutôt qu\'une réaction émotionnelle préservera vos relations.';

  @override
  String get dailyFortuneTipLove9 =>
      'Vérifiez soigneusement votre emploi du temps pour éviter les chevauchements. La fiabilité est votre atout.';

  @override
  String get dailyFortuneTipCareer0 =>
      'Plutôt que de commencer de nouvelles choses, \'en terminer une\' boostera votre chance.';

  @override
  String get dailyFortuneTipCareer1 =>
      'Le respect des délais prime sur la perfection. Aujourd\'hui, visez 80% de réussite.';

  @override
  String get dailyFortuneTipCareer2 =>
      'Si vous réglez une tâche que vous avez reportée, votre esprit deviendra plus clair.';

  @override
  String get dailyFortuneTipCareer3 =>
      'Séparez votre travail de celui des autres pour réduire votre stress.';

  @override
  String get dailyFortuneTipCareer4 =>
      'De petites erreurs peuvent compliquer le travail. N\'oubliez pas la vérification finale.';

  @override
  String get dailyFortuneTipCareer5 =>
      'Des frictions avec des collègues ou supérieurs sont possibles. Respectez les différences d\'opinion.';

  @override
  String get dailyFortuneTipCareer6 =>
      'La concentration est fragile aujourd\'hui. Travaillez 50 minutes et reposez-vous 10 minutes.';

  @override
  String get dailyFortuneTipCareer7 =>
      'Une responsabilité excessive peut être néfaste. Ne prenez que ce que vous pouvez assumer.';

  @override
  String get dailyFortuneTipCareer8 =>
      'Veillez à ne pas mélanger sentiments personnels et travail professionnel aujourd\'hui.';

  @override
  String get dailyFortuneTipCareer9 =>
      'Avant d\'envoyer des documents ou des e-mails, vérifiez le destinataire et les pièces jointes.';

  @override
  String get dailyFortuneTipHealth0 =>
      'Évitez le manque de sommeil, les excès alimentaires et la caféine pour stabiliser votre condition.';

  @override
  String get dailyFortuneTipHealth1 =>
      'Relâcher la tension dans le cou et les épaules réduira considérablement votre fatigue.';

  @override
  String get dailyFortuneTipHealth2 =>
      'Une courte promenade organisera vos pensées et rafraîchira votre énergie.';

  @override
  String get dailyFortuneTipHealth3 =>
      'Un verre d\'eau et une minute d\'étirement soutiendront la base de votre chance.';

  @override
  String get dailyFortuneTipHealth4 =>
      'La fatigue oculaire peut devenir intense. Réduisez brièvement l\'utilisation de votre smartphone.';

  @override
  String get dailyFortuneTipHealth5 =>
      'Plutôt qu\'une activité soudaine, il est préférable de bouger après un échauffement suffisant.';

  @override
  String get dailyFortuneTipHealth6 =>
      'Comme vous pourriez être sensible aux changements de température, prévoyez un vêtement pour réguler votre chaleur corporelle.';

  @override
  String get dailyFortuneTipHealth7 =>
      'Évitez les aliments stimulants aujourd\'hui pour votre santé intestinale et votre peau.';

  @override
  String get dailyFortuneTipHealth8 =>
      'Un sommeil suffisant est votre meilleur remède. Couchez-vous plus tôt que d\'habitude.';

  @override
  String get dailyFortuneTipHealth9 =>
      'Changez d\'humeur avec votre musique ou parfum préféré pour ne pas accumuler de stress.';

  @override
  String get eyeAnalysisTypeSharp =>
      'Vos yeux sont intenses et clairs, montrant un jugement et une détermination qui se démarquent.';

  @override
  String get eyeAnalysisTypeDeep =>
      'Vos yeux sont calmes et profonds, un visage sage qui observe et réfléchit attentivement avant d\'agir.';

  @override
  String get eyeAnalysisTypeBalanced =>
      'L\'énergie de vos yeux est équilibrée, harmonisant émotion et raison pour donner un sentiment de stabilité.';

  @override
  String get eyeExpressionBright =>
      'Particulièrement, vos yeux brillants s\'harmonisent avec votre sourire, manifestant l\'énergie attractive du \'Dohwa\'.';

  @override
  String get eyeExpressionGentle =>
      'Un sourire doux se cache dans vos yeux calmes, dégageant un charisme souple de type \'Oeyu-naegang\' (fermeté sous la douceur).';

  @override
  String get eyeExpressionStrong =>
      'Des yeux forts sans sourire symbolisent la décision et le leadership, montrant la force d\'aller droit vers ses objectifs.';

  @override
  String get eyeExpressionSteady =>
      'Une atmosphère calme et sérieuse, gagnant la confiance par une attitude posée plutôt que par des paroles légères.';

  @override
  String get eyePostureTilt =>
      'Cependant, votre tête est légèrement inclinée, ce qui pourrait troubler votre esprit ; regarder droit devant clarifiera votre chance.';

  @override
  String get eyePostureStraight =>
      'Le fait de regarder droit devant rend l\'énergie de vos yeux plus limpide et droite.';

  @override
  String get noseInsufficient =>
      'La mesure du contour du nez est insuffisante, l\'interprétation sera donc modérée.';

  @override
  String get noseWealthRich =>
      'L\'arête du nez est épaisse et longue, l\'énergie du \'Palais de la Richesse\' (Jebaekgung) est excellente pour accumuler des biens.';

  @override
  String get noseWealthPlanner =>
      'Le nez est net et précis, faisant de vous une personne pragmatique qui gère et fait fructifier sa richesse méthodiquement.';

  @override
  String get noseWealthBalanced =>
      'Les proportions du nez sont équilibrées, vous donnant le pouvoir de maintenir durablement la richesse acquise.';

  @override
  String get mouthExpressionBlessing =>
      'La bouche est fermée mais les coins sont relevés ; la chance réside dans chacune de vos paroles et votre visage attire la bienveillance.';

  @override
  String get mouthExpressionReliable =>
      'Une bouche fermement close montre la fiabilité et la responsabilité, un type qui agit plus qu\'il ne parle.';

  @override
  String get mouthExpressionLucky =>
      'Une bouche largement souriante est rafraîchissante, émettant une énergie positive et attirant la chance dans les relations.';

  @override
  String get supplementAlarmTitle =>
      'C\'est l\'heure de prendre vos compléments ! 💊';

  @override
  String get alarmVolume => 'Volume de l\'alarme';

  @override
  String get alarmTimeList => 'Liste des heures d\'alarme';

  @override
  String get noAlarmTimesAdded => 'Aucune heure d\'alarme ajoutée';

  @override
  String get alarmTimeDeleted => 'Heure de l\'alarme supprimée';

  @override
  String get addAlarmTime => 'Ajouter l\'heure de l\'alarme';

  @override
  String get editAlarmTime => 'Modifier l\'heure de l\'alarme';

  @override
  String get defaultRingtone => 'Sonnerie par défaut';

  @override
  String get takeSupplementsNow =>
      'Veuillez prendre vos suppléments et les enregistrer !';

  @override
  String get nextTime => 'Prendre plus tard';

  @override
  String get take => 'Prendre';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationTime => 'Heure de notification';

  @override
  String get start => 'Démarrer';

  @override
  String get end => 'Fin';

  @override
  String get notificationInterval => 'Intervalle de notification';

  @override
  String get waterDrankToday => 'Eau bue aujourd\'hui';

  @override
  String get goal => 'Objectif';

  @override
  String get cup => 'Tasse';

  @override
  String get waterIntakeRecord => 'Enregistrement de l\'apport en eau';

  @override
  String get remainingAmount => 'Montant restant';

  @override
  String get ml => 'ml';

  @override
  String minutesFormat(String minutes) {
    return '$minutes min';
  }

  @override
  String get drinkWater => 'Boire de l\'eau';

  @override
  String get supplement => 'Supplément';

  @override
  String get water => 'Eau';

  @override
  String get morning => 'Matin';

  @override
  String get afternoon => 'Après-midi';

  @override
  String get evening => 'Soir';

  @override
  String get takeSupplement => 'Prendre le supplément';

  @override
  String get goalAchievedTitle => 'Objectif atteint !';

  @override
  String get waterIntake => 'Apport en eau';

  @override
  String get remindTime => 'Heure de rappel';

  @override
  String get alarmRingtone => 'Sonnerie d\'alarme';

  @override
  String get snoozeTime => 'Temps de rappel';

  @override
  String get snoozeDescription =>
      'Temps par défaut lors de la sélection de \'Prendre plus tard\'';

  @override
  String get oneHour => '1 heure';

  @override
  String get mouthExpressionOpen =>
      'La bouche est légèrement ouverte, montrant une personnalité franche, mais attention parfois aux paroles imprudentes.';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'Aujourd\'hui, l\'accent est mis sur $topKey, et le point de vigilance est $bottomKey.';
  }

  @override
  String get overallVibeWealthRich =>
      'L\'énergie du Palais de la Richesse (nez) est vive, offrant un excellent teint pour saisir les opportunités financières.';

  @override
  String get overallVibeWealthSteady =>
      'L\'énergie autour du nez est calme, favorisant des gains concrets et une accumulation régulière de richesse.';

  @override
  String get overallVibeLoveCharisma =>
      'Le sourire éclatant amplifie l\'énergie \'Dohwa\', attirant les gens et favorisant les rencontres avec des protecteurs bienveillants.';

  @override
  String get overallVibeLoveTrust =>
      'Le sérieux de vos yeux inspire une confiance profonde, idéal pour nouer des relations sérieuses aujourd\'hui.';

  @override
  String get overallVibeCareerSmart =>
      'L\'intelligence dans votre regard aiguise votre jugement, parfait pour les tâches complexes ou les décisions importantes.';

  @override
  String get overallVibeCareerSteady =>
      'L\'énergie stable du bas du visage soutient la persévérance ; vos efforts silencieux porteront de grands fruits.';

  @override
  String get overallVibeHealth =>
      'La vitalité circulant sur votre visage montre un rythme corporel stable, idéal pour recharger vos batteries.';

  @override
  String get overallActionPrudent =>
      'Une certaine sagesse se dégage de votre bouche fermée. Aujourd\'hui, la chance suit l\'action plus que la parole.';

  @override
  String get overallActionConfident =>
      'Le contour de votre bouche ouverte appelle l\'énergie positive. Exprimez vos opinions avec assurance.';

  @override
  String get adviceHealth0 =>
      'La gestion de votre condition physique soutient votre chance. Évitez les programmes surchargés aujourd\'hui.';

  @override
  String get adviceHealth1 =>
      'Écoutez les signaux de votre corps. Un court repos apportera de meilleurs résultats.';

  @override
  String get adviceHealth2 =>
      'Un sommeil suffisant et une bonne hydratation suffiront à éclaircir votre chance aujourd\'hui.';

  @override
  String get adviceWealth0 =>
      'L\'argent s\'échappe aussi vite qu\'il entre. Vérifiez vos dépenses et vos contrats une fois de plus.';

  @override
  String get adviceWealth1 =>
      'Réduire les petites dépenses est le début de la grande richesse.';

  @override
  String get adviceWealth2 =>
      'Reporter vos décisions financières à demain pourrait s\'avérer bénéfique.';

  @override
  String get adviceLove0 =>
      'Chaque ton et chaque expression compte pour votre chance relationnelle. Commencez en douceur.';

  @override
  String get adviceLove1 =>
      'Une attitude d\'écoute sera la clé pour ouvrir le cœur de l\'autre.';

  @override
  String get adviceLove2 =>
      'Rester poli, même avec vos proches, est le meilleur moyen de préserver votre chance.';

  @override
  String get adviceCareer0 =>
      'Aujourd\'hui, concentrez-vous sur une tâche précise plutôt que de multiplier les objectifs. Réduisez vos priorités.';

  @override
  String get adviceCareer1 =>
      'Ne vous précipitez pas. Avancer pas à pas est le chemin le plus rapide.';

  @override
  String get adviceCareer2 =>
      'Prenez conseil autour de vous, mais fiez-vous à votre intuition pour la décision finale.';

  @override
  String get sajuFortune2026Gap =>
      '🌳 Fortune générale de l\'année Byeong-oh 2026 (Bois-Gap) : \'Flamme de la passion, maximisation de l\'activité\'\n\n2026 est une année où l\'énergie de \'Sik-sin\' (Productivité) et \'Sang-gwan\' (Expression) est très forte pour vous, Bois-Gap. C\'est une situation où le bois rencontre le feu et brûle vigoureusement, une période où votre talent et votre expression éclatent au monde sans hésitation. Votre présence se révèle même si vous restez immobile, et votre champ d\'activité s\'étend considérablement.\n\n💼 [Carrière et Affaires]\nC\'est un moment idéal pour lancer de nouveaux projets ou une entreprise. Vos idées se réalisent et vous vous immergez avec passion dans le travail. Vous pouvez obtenir de grands résultats dans les domaines de l\'expression de soi, comme l\'art, les médias, la vente et l\'éducation. Cependant, soyez prudent et vérifiez tout deux fois car vous pourriez faire des erreurs en courant trop vite vers l\'avant.\n\n💰 [Richesse]\nLa richesse suit votre activité. Les revenus de votre entreprise ou de vos activités secondaires pourraient augmenter. Cependant, autant vous gagnez, autant d\'argent pourrait sortir pour l\'investissement ou la consommation. Investir pour l\'avenir est bon, mais les dépenses impulsives doivent être surveillées.\n\n❤️ [Amour et Relations]\nSéduisez le sexe opposé avec une attitude honnête et active. La chance amoureuse s\'enflamme, mais une expression émotionnelle excessive pourrait peser sur le partenaire. C\'est aussi une année où la chance liée aux enfants est très présente.\n\n⚠️ [Précautions]\nC\'est une année d\'extrême consommation d\'énergie. Un \'burnout\' peut survenir, la gestion de la force physique est donc essentielle. Attention aux rumeurs causées par des lapsus, et essayez de ne pas imposer uniquement vos propres arguments.';

  @override
  String get sajuFortune2026Eul =>
      '🌸 Fortune générale de l\'année Byeong-oh 2026 (Bois-Eul) : \'Floraison éclatante, plein épanouissement du talent\'\n\n2026 est une année où \'Sang-gwan\' (Expression) est dominant pour vous, Bois-Eul. C\'est une situation où les fleurs s\'épanouissent sous un soleil brûlant, une période où votre charme et votre talent atteignent leur apogée. Vous serez le protagoniste qui attire l\'attention partout et goûterez à des réussites brillantes.\n\n💼 [Carrière et Affaires]\nLes tentatives non conventionnelles qui brisent les cadres existants réussissent. Vous vous distinguerez dans le design, la mode, la beauté et le divertissement. Vous pourriez recevoir des offres de promotion ou de recrutement au travail, mais attention aux frictions avec les supérieurs. Votre capacité double dans un environnement libre.\n\n💰 [Richesse]\nVotre capacité à créer de la richesse devient excellente. Votre valeur de marque et votre mérite augmentent. Cependant, la recherche du glamour peut mener au luxe ou au gaspillage, vous devez donc bien surveiller votre portefeuille.\n\n❤️ [Amour et Relations]\nLa popularité auprès du sexe opposé explose. Vous vivrez une romance brillante et passionnée, mais elle pourrait être intense et brève. Les personnes mariées pourraient avoir beaucoup de préoccupations concernant les enfants.\n\n⚠️ [Précautions]\nLes hauts et les bas émotionnels peuvent devenir graves. Si vous ne contrôlez pas votre tempérament, des réussites durement acquises pourraient s\'effondrer. Gardez un esprit respectueux des lois pour éviter les problèmes juridiques ou les rumeurs.';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ Fortune générale de l\'année Byeong-oh 2026 (Feu-Byeong) : \'Deux soleils, compétition intense et bond en avant\'\n\n2026 est une année où \'Bi-gyeon\' (Ami) et \'Geob-jae\' (Concurrent) sont très forts pour vous, Feu-Byeong. C\'est une situation où deux soleils apparaissent dans le ciel, une période où la fierté et l\'esprit de compétition atteignent des sommets. Votre subjectivité devient forte, vous détestez toute interférence et vous poursuivez votre chemin avec détermination.\n\n💼 [Carrière et Affaires]\nC\'est une chance de gagner et de réussir dans les milieux compétitifs. Vous pouvez augmenter votre envergure grâce au partenariat ou à la collaboration, mais des conflits peuvent surgir sur le partage des bénéfices. C\'est une bonne opportunité pour les freelances ou les professionnels de faire connaître largement leur nom.\n\n💰 [Richesse]\nL\'argent rentre, mais il y a aussi de grands trous par lesquels il s\'échappe. L\'argent peut sortir à cause de frères et sœurs, d\'amis ou de collègues. Se porter garant ou prêter de l\'argent est absolument interdit. Il vaut mieux investir dans l\'honneur ou la croissance de votre pouvoir plutôt que d\'épargner.\n\n❤️ [Amour et Relations]\nVous pourriez rencontrer un amant comme un ami ou passer de l\'amitié à l\'amour. Cependant, si vous avez un partenaire, soyez prudent car un triangle amoureux ou un concurrent pourrait apparaître.\n\n⚠️ [Précautions]\nDes actions dogmatiques pourraient susciter du ressentiment. L\'humilité est votre meilleure tactique. Faites attention aux maladies cardiovasculaires ou à la santé oculaire.';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 Fortune générale de l\'année Byeong-oh 2026 (Feu-Jeong) : \'Flamme géante, expansion du pouvoir\'\n\n2026 est une année de \'Geob-jae\' (Concurrent) et \'Bi-gyeon\' (Ami) pour vous, Feu-Jeong. Comme une bougie rencontrant une fournaise, c\'est une période où votre pouvoir devient massif. Vous pouvez accomplir des choses impossibles seul grâce à l\'aide ou à la coopération de votre entourage.\n\n💼 [Carrière et Affaires]\nUne force motrice puissante surgit. Vous aurez la sagesse de dominer vos concurrents ou de les rallier à votre cause. Des opportunités d\'exercer votre leadership dans des projets d\'équipe ou la vie organisationnelle se présenteront. Cependant, si vous tentez de monopoliser les résultats, vous pourriez être trahi ; un partage des mérites est donc nécessaire.\n\n💰 [Richesse]\nLes tendances spéculatives deviennent fortes. Vous viserez le \'haut risque, haut rendement\' ; si vous avez de la chance, vous toucherez beaucoup d\'argent, mais l\'échec a aussi un impact important. Des dépenses imprévues pourraient survenir, il est donc bon de préparer un fonds d\'urgence.\n\n❤️ [Amour et Relations]\nIl y a une forte probabilité de faire des rencontres lors de rassemblements sociaux ou d\'activités de groupe. Les hommes doivent être prudents car ils pourraient négliger leur conjointe. Les relations avec votre entourage deviennent des atouts cette année.\n\n⚠️ [Précautions]\nL\'avidité mène aux ennuis. Abstenez-vous de toute expansion ou investissement déraisonnable. Attention aux maladies causées par la colère ou le stress.';

  @override
  String get sajuFortune2026Mu =>
      '🌋 Fortune générale de l\'année Byeong-oh 2026 (Terre-Mu) : \'Patience et préparation au milieu d\'une chaleur intense\'\n\n2026 est une année où l\'énergie de \'Pyeon-in\' (Intuition) et \'Jeong-in\' (Connaissance) est forte pour vous, Terre-Mu. C\'est comme l\'énergie condensée juste avant l\'éruption d\'un volcan. C\'est le moment idéal pour enrichir votre moi intérieur et développer vos compétences par l\'étude, l\'art et l\'obtention de certifications.\n\n💼 [Carrière et Affaires]\nLe travail intellectuel comme la planification, la recherche et l\'établissement de stratégies brille plus que le travail actif. La chance liée aux documents est bonne, favorisant les contrats ou les tâches administratives. Cependant, si vous ne faites que réfléchir sans agir, vous pourriez manquer des opportunités ; une audace décisive est aussi nécessaire.\n\n💰 [Richesse]\nLa chance liée aux documents immobiliers est très forte. C\'est une opportunité d\'augmenter vos actifs par la vente ou un contrat. Le flux de trésorerie peut être frustrant, mais l\'investissement à long terme est prometteur.\n\n❤️ [Amour et Relations]\nL\'interférence des mères ou des supérieurs pourrait augmenter. En amour, vous valoriserez la communion mentale, et des liens avec des personnes plus âgées pourraient se nouer.\n\n⚠️ [Précautions]\nTrop de pensées peuvent mener à la dépression ou à la léthargie. Les activités de plein air ou l\'exercice physique aident à améliorer votre chance. Comme le sol se fissure sous l\'effet de la chaleur, attention à la peau sèche ou aux troubles gastriques.';

  @override
  String get sajuFortune2026Gi =>
      '🌾 Fortune générale de l\'année Byeong-oh 2026 (Terre-Gi) : \'Fondation solide et soutien indéfectible\'\n\n2026 est une année de \'Jeong-in\' (Connaissance) et \'Pyeon-in\' (Intuition) pour vous, Terre-Gi. C\'est une situation où une lumière chaude brille sur la terre et fait mûrir les grains. C\'est une période de consolidation d\'une base stable tout en recevant un plein soutien et de l\'amour des supérieurs.\n\n💼 [Carrière et Affaires]\nVous obtiendrez les meilleurs résultats dans tout ce qui concerne l\'étude, comme les examens de promotion, de certification ou l\'obtention de diplômes. Au travail, vous gagnerez la confiance des supérieurs et occuperez des postes importants. Vous vous distinguerez dans l\'éducation, l\'immobilier, le conseil et le bien-être.\n\n💰 [Richesse]\nC\'est une chance de détenir des documents. Vous pourriez atteindre votre objectif de devenir propriétaire ou recevoir un héritage ou des dons. Une croissance stable des actifs est possible, et c\'est une année où l\'honneur brille plus que la richesse.\n\n❤️ [Amour et Relations]\nC\'est une année pour être aimé. Vous recevrez un amour fiable de votre partenaire ou rencontrerez quelqu\'un avec de bonnes conditions. La chance de mariage entre également en jeu et la vie de famille devient harmonieuse.\n\n⚠️ [Précautions]\nSi vous ne faites que recevoir, vous pourriez devenir paresseux. Une attitude de partage est nécessaire. Délaissez la dépendance et développez votre autonomie.';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ Fortune générale de l\'année Byeong-oh 2026 (Métal-Gyeong) : \'Naissance d\'un chef-d\'œuvre au-delà de l\'épreuve\'\n\n2026 est une année où \'Pyeon-gwan\' (Pression) et \'Jeong-gwan\' (Autorité) sont très puissants pour vous, Métal-Gyeong. C\'est comme faire fondre du minerai brut dans une fournaise pour en faire une épée d\'exception. Il peut y avoir une forte pression et du stress, mais si vous endurez, vous gagnerez une autorité et un honneur immenses.\n\n💼 [Carrière et Affaires]\nVous pourriez assumer des postes à haute responsabilité ou gérer des projets difficiles. Cependant, c\'est un processus de test pour vous, et en cas de succès, votre statut s\'élèvera instantanément. C\'est une opportunité de promotion pour ceux qui travaillent dans la fonction publique, l\'armée, la police et le domaine juridique.\n\n💰 [Richesse]\nC\'est une chance d\'honneur et de titres plutôt que d\'argent. À mesure que votre statut s\'élève, la richesse suivra naturellement, mais les dépenses pour maintenir votre rang sont aussi significatives.\n\n❤️ [Amour et Relations]\nPour les femmes, c\'est une chance où un homme charismatique et capable apparaît. Les hommes ont une forte chance liée aux enfants. Les relations avec les supérieurs ou les aînés deviennent importantes.\n\n⚠️ [Précautions]\nLa gestion de la santé est la priorité absolue. Attention aux maladies ou accidents causés par le surmenage. Les poumons et le gros intestin peuvent s\'affaiblir. Trouvez des moyens de relâcher le stress.';

  @override
  String get sajuFortune2026Sin =>
      '💎 Fortune générale de l\'année Byeong-oh 2026 (Métal-Sin) : \'Bijou étincelant, apogée de l\'honneur\'\n\n2026 est une année de \'Jeong-gwan\' (Autorité) et \'Pyeon-gwan\' (Pression) pour vous, Métal-Sin. Comme un bijou brillant sous les projecteurs, c\'est une période où votre valeur se révèle au monde et où votre honneur s\'élève. Vous avez des liens profonds avec des lieux de travail ou des organisations stables.\n\n💼 [Carrière et Affaires]\nLa chance de recherche d\'emploi, de promotion et de transfert est très bonne. Vous pourriez aussi recevoir des offres de recrutement en étant reconnu pour vos compétences. Si vous suivez les principes et gérez le travail correctement, vous recevrez le respect de tous.\n\n💰 [Richesse]\nUn salaire stable ou un revenu fixe est garanti. Si vous protégez votre honneur plutôt que de courir après la richesse, celle-ci suivra naturellement. Vous pouvez bénéficier du soutien de votre conjoint ou de votre lieu de travail.\n\n❤️ [Amour et Relations]\nC\'est la meilleure chance de mariage et de rencontre pour les femmes. Vous pouvez rencontrer un époux droit et capable. Les hommes gagnent des enfants ou vivent des événements joyeux grâce à eux.\n\n⚠️ [Précautions]\nUne chaleur excessive peut faire fondre le bijou. Un travail excessif ou le stress peuvent causer de la nervosité. Vous pourriez paraître inflexible en raison de fortes tendances axées sur les principes, soyez donc prudent.';

  @override
  String get sajuFortune2026Im =>
      '🌊 Fortune générale de l\'année Byeongo 2026 (Eau-Im) : \'Une année dynamique d\'expansion du champ d\'activité\'\n\n2026 est une année où l\'énergie de \'Pyeon-jae\' et \'Jeong-jae\' entre en jeu pour vous. C\'est comme une vaste mer circulant activement en recevant la chaleur du soleil et se dirigeant vers le vaste monde. Ce sera une année dynamique où les activités économiques deviennent vigoureuses et où les opportunités de toucher une grande richesse se présentent.\n\n💼 [Carrière et Affaires]\nLe sens des affaires est maximisé. Une très bonne année pour défricher de nouveaux marchés ou récolter de grands profits sur les investissements. Une chance où le champ d\'activité peut s\'étendre au-delà des frontières nationales. Des décisions audacieuses mènent à de grands résultats, mais un examen détaillé est essentiel.\n\n💰 [Richesse]\nLa chance de richesse atteint son apogée. Des gains inattendus ou des bénéfices commerciaux à grande échelle sont prévus. Si vous suivez bien le flux d\'argent, vous pouvez constituer des actifs importants. Cependant, la gestion est importante car les sorties peuvent être aussi grandes que les entrées.\n\n❤️ [Amour et Relations]\nLa sociabilité s\'améliore et de nombreuses personnes du sexe opposé se rassemblent autour de vous grâce à votre charme. Un bon moment pour profiter de rencontres actives. Dans les relations amoureuses, vous passez des moments heureux en profitant de sorties et de voyages. Cependant, attention à ne pas négliger votre partenaire à cause d\'un emploi du temps trop chargé.\n\n⚠️ [Précautions]\nFaites attention au fonctionnement des reins ou à la circulation sanguine. De plus, une sagesse pour savoir se satisfaire d\'un niveau approprié est nécessaire car une avidité excessive pourrait mener à des ennuis.';

  @override
  String get sajuFortune2026Gye =>
      '💧 Fortune générale de l\'année Byeongo 2026 (Eau-Gye) : \'Gagner des intérêts concrets tout en renforçant ses bases internes\'\n\n2026 est une année où l\'énergie de \'Jeong-jae\' et \'Pyeon-jae\' entre en jeu pour vous. C\'est comme un rayon de soleil brillant après une pluie douce, rendant la terre pleine de vie et d\'abondance. Vous atteindrez une stabilité économique basée sur un revenu stable et trouverez de petits bonheurs.\n\n💼 [Carrière et Affaires]\nVous gérez parfaitement les tâches assignées avec sincérité et méticulosité. Vous faites preuve d\'une excellente capacité dans les tâches financières, comptables ou de gestion. La reconnaissance et les récompenses suivent quand vous faites de votre mieux dans le travail assigné plutôt que par avidité excessive. Vous pouvez grandir pas à pas tout en développant vos compétences dans un environnement stable.\n\n💰 [Richesse]\nLa chance de richesse est très bonne. Un revenu régulier et stable apparaît, et vous appréciez la joie d\'augmenter vos actifs par l\'épargne. Des profits petits mais certains s\'accumulent pour donner une grande récompense. Vos habitudes de dépenses frugales brillent cette année.\n\n❤️ [Amour et Relations]\nVous inspirez une confiance profonde à votre partenaire grâce à une considération bienveillante et méticuleuse. Vous cultivez un amour petit mais chaleureux tout en partageant votre quotidien. Les relations sont également fluides et paisibles. Vous jouerez le rôle d\'un conseiller de confiance pour votre entourage.\n\n⚠️ [Précautions]\nFaites attention aux maladies oculaires ou à la santé du système urologique. De plus, pratiquez parfois l\'observation du monde avec une perspective large car vous pourriez manquer le grand flux en prêtant attention à trop de détails.';

  @override
  String get preparationForTomorrow => 'Préparation pour demain';

  @override
  String get howToMeetMoreLuck => 'Comment attirer plus de chance';

  @override
  String get enterName => 'Entrez votre nom';

  @override
  String fortuneDateConfirm(String date) {
    return 'Souhaitez-vous vérifier la fortune pour $date ?';
  }

  @override
  String get colorPurple => 'Violet';

  @override
  String get colorBlue => 'Bleu';

  @override
  String get colorYellow => 'Jaune';

  @override
  String get colorRed => 'Rouge';

  @override
  String get colorGreen => 'Vert';

  @override
  String get colorPink => 'Rose';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorWhite => 'Blanc';

  @override
  String get colorBlack => 'Noir';

  @override
  String get itemPerfume => 'Parfum';

  @override
  String get itemHandkerchief => 'Mouchoir';

  @override
  String get itemRing => 'Bague';

  @override
  String get itemWatch => 'Montre';

  @override
  String get itemGlasses => 'Lunettes';

  @override
  String get itemHat => 'Chapeau';

  @override
  String get itemBook => 'Livre';

  @override
  String get itemEarphones => 'Écouteurs';

  @override
  String get itemMirror => 'Miroir';

  @override
  String get itemPen => 'Stylo';

  @override
  String get itemCoin => 'Pièce';

  @override
  String get itemKey => 'Clé';

  @override
  String get dirEast => 'Est';

  @override
  String get dirWest => 'Ouest';

  @override
  String get dirSouth => 'Sud';

  @override
  String get dirNorth => 'Nord';

  @override
  String get dirNorthEast => 'Nord-Est';

  @override
  String get dirSouthEast => 'Sud-Est';

  @override
  String get dirNorthWest => 'Nord-Ouest';

  @override
  String get dirSouthWest => 'Sud-Ouest';

  @override
  String get general => 'Général';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get darkModeDescription => 'Régler l\'écran en mode sombre.';

  @override
  String get alarmSettings => 'Paramètres d\'alarme';

  @override
  String get privacySettings => 'Paramètres de confidentialité';

  @override
  String get information => 'Information';

  @override
  String get notice => 'Avis';

  @override
  String get weatherConditionSunny => 'Ensoleillé';

  @override
  String get weatherConditionPartlyCloudy => 'Partiellement nuageux';

  @override
  String get weatherConditionCloudy => 'Nuageux';

  @override
  String get weatherConditionFoggy => 'Brumeux';

  @override
  String get weatherConditionDrizzle => 'Bruine';

  @override
  String get weatherConditionRainy => 'Pluvieux';

  @override
  String get weatherConditionFreezingRain => 'Pluie verglaçante';

  @override
  String get weatherConditionSnowy => 'Neigeux';

  @override
  String get weatherConditionSnowGrains => 'Neige en grains';

  @override
  String get weatherConditionRainShowers => 'Averses de pluie';

  @override
  String get weatherConditionSnowShowers => 'Averses de neige';

  @override
  String get weatherConditionThunderstorm => 'Orage';

  @override
  String get airQualityGood => 'Bon';

  @override
  String get airQualityNormal => 'Normal';

  @override
  String get airQualityBad => 'Mauvais';

  @override
  String get airQualityVeryBad => 'Très mauvais';

  @override
  String get locationUnknown => 'Lieu inconnu';

  @override
  String get locationError => 'Erreur de localisation';

  @override
  String get faq => 'FAQ';

  @override
  String get sendFeedback => 'Envoyer des commentaires';

  @override
  String get feedbackDescription =>
      'Veuillez partager vos commentaires ou suggestions concernant Fortune Alarm.\nVotre avis nous aide à nous améliorer.';

  @override
  String get reportCopyright => 'Signaler une violation du droit d\'auteur';

  @override
  String get copyrightDescription =>
      'Si vous pensez que le contenu de Fortune Alarm viole le droit d\'auteur, veuillez le signaler par e-mail.\nNous prendrons des mesures immédiates après confirmation.';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy =>
      'Conditions d\'utilisation et Politique de confidentialité\n\n1. Dispositions générales\n\nArticle 1 (Objet)\nL\'objet de ces conditions est de définir les conditions et procédures d\'utilisation du service fourni par \'Fortune Alarm\' (ci-après dénommé le \'Service\'), ainsi que les droits, obligations et responsabilités des utilisateurs et du développeur.\n\nArticle 2 (Politique de confidentialité)\n\n1. Éléments et méthode de collecte des informations personnelles\nCe Service peut être utilisé sans inscription et ne stocke ni ne collecte les informations personnelles des utilisateurs sur un serveur séparé.\nCependant, les informations suivantes peuvent être générées et stockées sur l\'appareil lors de l\'utilisation du Service :\n- Paramètres d\'alarme, enregistrements d\'achèvement de mission, historique d\'acquisition de Fortune Cookies, etc.\n\n2. Informations sur l\'utilisation des permissions de l\'appareil\nLe Service utilise les permissions suivantes dans la mesure minimale nécessaire pour fournir le Service :\n- Notifications (Requis) : Utilisé pour l\'exécution des alarmes et les notifications de Fortune Cookies.\n- Alarme exacte et Exclusion d\'optimisation de batterie (Requis) : Utilisé pour garantir que les alarmes sonnent à l\'heure même en mode économie d\'énergie.\n- Afficher sur d\'autres applis (Requis) : Utilisé pour afficher l\'écran d\'alarme sur l\'écran de verrouillage ou lors de l\'utilisation d\'autres applications.\n- Caméra (Optionnel) : Utilisé uniquement pour la mission \'Object Snap\' ; les images capturées sont traitées uniquement sur l\'appareil et ne sont pas transmises à un serveur.\n\n3. Services publicitaires et traitement des données\nCe Service utilise Google AdMob pour diffuser des publicités afin de fournir le service gratuitement.\nGoogle peut collecter certaines informations non personnellement identifiables, telles que l\'identifiant publicitaire (ADID), pour les paramètres publicitaires personnalisés.\n- Politique de confidentialité de Google : https://policies.google.com/privacy\n\nArticle 3 (Stockage et suppression des données)\nCe Service est une application locale qui stocke les données sur l\'appareil de l\'utilisateur.\nSi vous supprimez l\'application, toutes les données stockées sur l\'appareil (alarmes, enregistrements de missions, etc.) seront immédiatement supprimées et ne pourront pas être récupérées.';

  @override
  String get alarmOptimization => 'Optimisation du son de l\'alarme';

  @override
  String get allOptimizationsCompleted =>
      'Tous les paramètres d\'optimisation sont terminés';

  @override
  String get optimizationNeeded =>
      'Des paramètres sont requis pour des alarmes précises.';

  @override
  String get optimizationDescription =>
      'Les alarmes peuvent être retardées ou ne pas sonner en raison des paramètres système Android. Veuillez définir tous les éléments sur autorisé.';

  @override
  String get allowNotificationPermission =>
      'Autoriser la permission de notification';

  @override
  String get notificationPermissionDescription =>
      'Requis pour afficher des notifications lorsqu\'une alarme se déclenche.';

  @override
  String get excludeBatteryOptimization =>
      'Exclure l\'optimisation de la batterie';

  @override
  String get batteryOptimizationDescription =>
      'Garantit que l\'alarme sonne immédiatement même en mode économie d\'énergie.';

  @override
  String get allowExactAlarm => 'Autoriser l\'alarme exacte';

  @override
  String get exactAlarmDescription =>
      'Fait sonner l\'alarme à l\'heure sans être retardée par le système.';

  @override
  String get drawOverOtherApps => 'Afficher sur d\'autres applis';

  @override
  String get overlayDescription =>
      'Affiche l\'écran d\'alarme même sur l\'écran de verrouillage ou lors de l\'utilisation d\'autres applications.';

  @override
  String get allSettingsCompleted => 'Tous les paramètres sont terminés.';

  @override
  String get allowAllItems => 'Veuillez autoriser tous les éléments';

  @override
  String get manualSettingsInfo =>
      'Vous pouvez désactiver les paramètres directement dans les paramètres système Android.';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get selectPhoto => 'Sélectionner une photo';

  @override
  String get selectAlarmBackground => 'Fond d\'alarme';

  @override
  String get defaultLabel => 'Défaut';

  @override
  String get howToAdd => 'Comment ajouter';

  @override
  String get addAssetInstructions =>
      'Placez l\'image dans le dossier assets/images/ et enregistrez-la dans pubspec.yaml.';

  @override
  String get ringingNow => 'Sonne maintenant';

  @override
  String get setTime => 'Régler l\'heure';

  @override
  String get repeatDays => 'Jours de répétition';

  @override
  String get repeatDaily => 'Répéter tous les jours';

  @override
  String get snoozeSettings => 'Paramètres de répétition';

  @override
  String get wakeUpAlarm => 'Alarme de réveil';

  @override
  String get daySun => 'Dim';

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mer';

  @override
  String get dayThu => 'Jeu';

  @override
  String get dayFri => 'Ven';

  @override
  String get daySat => 'Sam';

  @override
  String get daySunFull => 'Dimanche';

  @override
  String get dayMonFull => 'Lundi';

  @override
  String get dayTueFull => 'Mardi';

  @override
  String get dayWedFull => 'Mercredi';

  @override
  String get dayThuFull => 'Jeudi';

  @override
  String get dayFriFull => 'Vendredi';

  @override
  String get daySatFull => 'Samedi';

  @override
  String get missionRewardEarned =>
      'Félicitations ! Vous avez terminé 5 missions aujourd\'hui et gagné 1 Fortune Cookie !';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Félicitations ! Vous avez terminé $missions missions aujourd\'hui et gagné $cookies Fortune Cookie(s) !';
  }

  @override
  String daysCount(int count) {
    return '$count jours';
  }

  @override
  String get user => 'Utilisateur';

  @override
  String get member => 'Membre';

  @override
  String get manageSajuInfo => 'Gérer les infos Saju';

  @override
  String get freeCharge => 'Recharge Gratuite';

  @override
  String get fortunePass => 'Pass Fortune';

  @override
  String get unlimitedNotSubscribed => 'Illimité non souscrit';

  @override
  String get unlimitedInUse => 'Illimité en cours d\'utilisation';

  @override
  String get subscribe => 'S\'abonner';

  @override
  String get manageSubscription => 'Gérer l\'abonnement';

  @override
  String get purchaseHistory => 'Historique des achats';

  @override
  String get customerCenter => 'Support Client';

  @override
  String get noNewNotifications => 'Aucune nouvelle notification.';

  @override
  String get noPurchaseHistory => 'Aucun historique d\'achat.';

  @override
  String get none => 'Aucun';

  @override
  String deleteConfirmMessage(String title) {
    return 'Voulez-vous supprimer \"$title\" ?';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get notepad => 'Bloc-notes';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yearView => 'Année';

  @override
  String get monthView => 'Mois';

  @override
  String get weekView => 'Semaine';

  @override
  String get dayView => 'Jour';

  @override
  String get noEvents => 'Aucun événement prévu.';

  @override
  String get calendarDragGuide =>
      'Glissez vers le bas pour voir le calendrier détaillé.';

  @override
  String get noSavedMemos => 'Aucun mémo ou événement enregistré.';

  @override
  String get holiday => 'Jour férié';

  @override
  String get photo => 'Photo';

  @override
  String get drawing => 'Dessin';

  @override
  String get drawingTitle => 'Dessin';

  @override
  String get pencil => 'Crayon';

  @override
  String get marker => 'Marqueur';

  @override
  String get eraser => 'Gomme';

  @override
  String adjustThickness(String label) {
    return 'Ajuster l\'épaisseur du $label';
  }

  @override
  String get sticker => 'Autocollant';

  @override
  String get event => 'Événement';

  @override
  String get memo => 'Mémo';

  @override
  String get routineExercise => 'Exercice';

  @override
  String get routineHiking => 'Randonnée';

  @override
  String get routineCleaning => 'Ménage';

  @override
  String get routineTravel => 'Voyage';

  @override
  String get routineDate => 'Rendez-vous';

  @override
  String get routineConcert => 'Concert';

  @override
  String get routineMovie => 'Film';

  @override
  String get routineMeeting => 'Réunion';

  @override
  String get howIsYourMoodToday => 'Comment vous sentez-vous aujourd\'hui ?';

  @override
  String get complete => 'Terminer';

  @override
  String get amWithIcon => '☀️ AM';

  @override
  String get pmWithIcon => '🌙 PM';

  @override
  String get photoPermissionDescription =>
      'Pour ajouter des photos, vous devez autoriser l\'accès aux photos dans les paramètres.';

  @override
  String get goToSettings => 'Aller aux paramètres';

  @override
  String get photoPermissionNeeded =>
      'La permission d\'accès aux photos est requise.';

  @override
  String get fontSize => 'Taille de police';

  @override
  String get fontFamily => 'Police';

  @override
  String get textColor => 'Couleur du texte';

  @override
  String get textAlign => 'Alignement';

  @override
  String get alignLeft => 'Gauche';

  @override
  String get alignCenter => 'Centre';

  @override
  String get alignRight => 'Droite';

  @override
  String get edit => 'Modifier';

  @override
  String get fontSettings => 'Paramètres de police';

  @override
  String get imageAddedFromKeyboard => 'Image ajoutée depuis le clavier.';

  @override
  String get cancelWriting => 'Annuler l\'écriture';

  @override
  String get cancelWritingConfirm =>
      'Un contenu est en cours d\'écriture. Voulez-vous annuler et quitter ?';

  @override
  String get continueWriting => 'Continuer l\'écriture';

  @override
  String get title => 'Titre';

  @override
  String get content => 'Contenu';

  @override
  String get selectTime => 'Sélectionner l\'heure';

  @override
  String get noTime => 'Aucune heure';

  @override
  String minutesLater(String minutes) {
    return '$minutes min plus tard';
  }

  @override
  String get countLabel => 'Nombre';

  @override
  String timesCount(String count) {
    return 'Total $count fois';
  }

  @override
  String get wakeUpMission => 'Mission Réveil';

  @override
  String get alarmSound => 'Son de l\'alarme';

  @override
  String get gradualVolume => 'Volume progressif';

  @override
  String get vibration => 'Vibration';

  @override
  String get alarmNameAndBackground => 'Nom & Fond de l\'alarme';

  @override
  String get customStyle => 'Style personnalisé';

  @override
  String get alarmName => 'Nom de l\'alarme';

  @override
  String get enterAlarmName => 'Veuillez entrer le nom de l\'alarme';

  @override
  String get routineSummary => 'Résumé de la routine';

  @override
  String get alarmOn => 'Alarme ACTIVÉE';

  @override
  String get alarmOff => 'Alarme DÉSACTIVÉE';

  @override
  String get contentHint => 'Ajouter du contenu';

  @override
  String get addEvent => 'Ajouter un événement';

  @override
  String get manageItem => 'Gérer l\'élément';

  @override
  String get manageItemDescription =>
      'Que souhaitez-vous faire de cet élément ?';

  @override
  String get noTitle => 'Sans titre';

  @override
  String get selectTitleColor => 'Sélectionner la couleur du titre';

  @override
  String get save => 'Enregistrer';

  @override
  String get missionNone => 'Aucune Mission';

  @override
  String get missionSnap => 'Capture d\'objet';

  @override
  String get missionMath => 'Problème Math';

  @override
  String get missionFortune => 'Fortune';

  @override
  String get missionShake => 'Secouer';

  @override
  String get missionFortuneCatch => 'Attraper Fortune';

  @override
  String get missionNoDescription => 'L\'alarme sonnera sans mission.';

  @override
  String get missionCameraDescription =>
      'Prenez une photo de l\'objet spécifié pour arrêter l\'alarme.';

  @override
  String get missionMathDescription =>
      'Résolvez des problèmes de maths pour réveiller votre cerveau.';

  @override
  String get missionFortuneDescription =>
      'Arrêtez l\'alarme et vérifiez votre fortune du jour.';

  @override
  String get missionShakeDescription =>
      'Vous devez secouer votre téléphone pour éteindre l\'alarme.';

  @override
  String get missionFortuneCatchDescription =>
      'Attrapez le Fortuni en mouvement !';

  @override
  String get missionWalk => 'Marcher';

  @override
  String get missionWalkDescription => 'Marchez pour éteindre l\'alarme !';

  @override
  String get missionFaceDescription =>
      'Gardez votre visage dans le cadre pendant 5s.';

  @override
  String get walkStepCount => 'Pas cibles';

  @override
  String walkSteps(int count) {
    return '$count pas';
  }

  @override
  String get missionNumberOrder => 'Ordre des nombres';

  @override
  String get missionNumberOrderDescription =>
      'Tapez sur les nombres de 1 à 9 dans l\'ordre.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Suivant : $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Mémorisation de position';

  @override
  String get missionHiddenButtonDescription =>
      'Mémorisez les tuiles allumées dans l\'ordre et tapez dessus dans les 10 secondes.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Sprint Tactile';

  @override
  String get missionTapSprintDescriptionShort => 'Tapez pour remplir la jauge.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Tapez $goalTaps+ fois pour remplir la jauge.';
  }

  @override
  String get missionTapSprintTapHere => 'Tapez';

  @override
  String get missionTapSprintHint =>
      'Se remplit vite, se vide si vous faites une pause.';

  @override
  String get missionLeftRight => 'Gauche / Droite';

  @override
  String get missionLeftRightDescriptionShort =>
      'Suivez l\'invite et choisissez gauche ou droite.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'Obtenez $targetStreak correctes d\'affilée.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Tapez GAUCHE';

  @override
  String get missionLeftRightPromptRight => 'Tapez DROITE';

  @override
  String get left => 'Gauche';

  @override
  String get right => 'Droite';

  @override
  String get missionHintInactivity =>
      'Si vous arrêtez pendant 2 minutes, cela se réinitialise.';

  @override
  String fortuneCatchScore(int score) {
    return 'Score : $score';
  }

  @override
  String get fortuneCatchGoal => 'Objectif : 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(Attrapés : $count/$min)';
  }

  @override
  String fortuneCatchTime(int seconds) {
    return 'Temps : ${seconds}s';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'Meilleur : ${seconds}s';
  }

  @override
  String get fortuneCatchAngryHint => 'Fortuny en colère est une pénalité !';

  @override
  String get fortuneCatchInstruction =>
      'Évitez les Fortuni en colère et attrapez-les !';

  @override
  String fortuneCatchPointMinus(int points) {
    return '$points points déduits';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points points';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo Combo !';
  }

  @override
  String get difficulty => 'Difficulté';

  @override
  String get difficultyEasy => 'Facile';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyHard => 'Difficile';

  @override
  String get problemCount => 'Nombre de problèmes';

  @override
  String problemsCount(int count) {
    return '$count Problèmes';
  }

  @override
  String missionAnalyzing(int index, int total) {
    return 'Mission $index/$total Analyse en cours...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'Mission $index/$total : Pointer l\'objet dans le guide.';
  }

  @override
  String get missionPointSink => 'Pointer l\'évier.';

  @override
  String get missionPointRefrigerator => 'Pointer le réfrigérateur.';

  @override
  String get missionPointScale => 'Pointer le pèse-personne.';

  @override
  String get missionPointFace => 'Pointer votre visage.';

  @override
  String get missionPointObjectGeneric => 'Pointer l\'objet spécifié.';

  @override
  String get missionRecognizeObject => 'Veuillez reconnaître l\'objet.';

  @override
  String get missionPerform => 'Veuillez effectuer la mission.';

  @override
  String get initError => 'Une erreur est survenue lors de l\'initialisation.';

  @override
  String get analyzingNextTarget => 'Analyse de la cible suivante...';

  @override
  String get errorOccurredGeneric => 'Une erreur est survenue';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total Réussite !';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total Réussite ! Correspondance réussie !';
  }

  @override
  String get escape => 'Échap';

  @override
  String get pointObjectClearly =>
      'Prenez une photo où la cible est clairement visible';

  @override
  String get matchingSuccess => 'Correspondance réussie !';

  @override
  String get missionComplete => 'Mission terminée !';

  @override
  String get allMissionsComplete => 'Toutes les missions sont terminées !';

  @override
  String missionSnoozeMessage(String minutes) {
    return 'Mission réussie ! Mais elle sonnera à nouveau dans $minutes minutes selon les paramètres.';
  }

  @override
  String get showFace => 'Veuillez montrer votre visage';

  @override
  String get keepWatching => 'Continuez à regarder l\'écran';

  @override
  String get recognizingFaceForFortune =>
      'Reconnaissance du visage pour l\'analyse de physiognomonie';

  @override
  String get dataNotStored => 'Les données ne sont pas stockées';

  @override
  String get solveProblem => 'Veuillez résoudre le problème.';

  @override
  String get correctAnswer => 'Bonne réponse !';

  @override
  String get wrongAnswerRetry => 'Faux. Veuillez réessayer.';

  @override
  String get correct => 'Correct !';

  @override
  String get walkToDismiss => 'Veuillez marcher en tenant votre smartphone';

  @override
  String get shakeCount => 'Nombre de secousses';

  @override
  String shakeTimes(int count) {
    return '$count fois';
  }

  @override
  String tapTimes(int count) {
    return '$count appuis';
  }

  @override
  String missionNumber(int number) {
    return 'Mission $number';
  }

  @override
  String get soundBirds => 'Chants d\'oiseaux';

  @override
  String get shakeCountLabel => 'Nombre de secousses';

  @override
  String missionIndex(int index) {
    return 'Mission $index';
  }

  @override
  String get ringtoneSelect => 'Sélectionner la sonnerie';

  @override
  String get vibrationSelect => 'Sélectionner le modèle de vibration';

  @override
  String get selectMissionTitle =>
      'Veuillez sélectionner une mission d\'arrêt d\'alarme.';

  @override
  String get ringtoneCategoryStandard => 'Standard';

  @override
  String get ringtoneCategoryCalm => 'Calme';

  @override
  String get ringtoneCategoryUpbeat => 'Entraînant';

  @override
  String get ringtoneCategoryLoud => 'Fort';

  @override
  String get noRingtones => 'Aucune sonnerie trouvée.';

  @override
  String get photoPermissionRequired =>
      'La permission d\'accès aux photos est requise.';

  @override
  String get deleteImage => 'Supprimer l\'image';

  @override
  String get longPressToDelete => 'Appuyez longuement pour supprimer.';

  @override
  String get videoLoadFail =>
      'Échec du chargement de la vidéo\nAppuyez pour réessayer';

  @override
  String get existingCapturedImages => 'Images capturées existantes';

  @override
  String deleteCount(int count) {
    return 'Supprimer $count';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return 'Êtes-vous sûr de vouloir supprimer $count images ?\nCette action est irréversible.';
  }

  @override
  String get classicAlarm => 'Alarme Classique';

  @override
  String get digitalAlarm => 'Alarme Digitale';

  @override
  String get birdsSound => 'Oiseaux qui chantent';

  @override
  String get wavesSound => 'Vagues de l\'océan';

  @override
  String get cuckooClock => 'Pendule à coucou';

  @override
  String get calmAlarm => 'Alarme calme';

  @override
  String get doorKnock => 'Frappe à la porte';

  @override
  String get earlySunrise => 'Lever du soleil précoce';

  @override
  String get goodMorningSound => 'Bonjour';

  @override
  String get inAHurry => 'Pressé';

  @override
  String get lovingYou => 'En t\'aimant';

  @override
  String get sirenSound => 'Sirène';

  @override
  String get swingingSound => 'Balançant';

  @override
  String get telephoneBusy => 'Téléphone occupé';

  @override
  String get shortVibration => 'Répétition courte';

  @override
  String get longVibration => 'Répétition longue';

  @override
  String get heartbeatVibration => 'Battement de cœur';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'Rythme rapide';

  @override
  String get exactAlarmPermissionDesc =>
      'Pour faire sonner l\'alarme à l\'heure exacte, la permission \"Calendrier et rappels\" est requise.';

  @override
  String get batteryOptimizationPermissionDesc =>
      'L\'optimisation de la batterie doit être désactivée pour que l\'alarme sonne à l\'heure.';

  @override
  String get overlayPermissionDesc =>
      'Pour afficher l\'écran de mission lorsque l\'alarme se déclenche, la permission \"Afficher sur d\'autres applis\" est requise.';

  @override
  String get cameraMissionFirstImageError =>
      'Veuillez définir au moins la première image de mission.';

  @override
  String get retry => 'Réessayer';

  @override
  String get exactAlarmPermissionFail =>
      'Échec de l\'enregistrement de l\'alarme. La permission d\'alarme exacte est désactivée et doit être définie.';

  @override
  String get batteryOptimizationPermissionFail =>
      'Échec de l\'enregistrement de l\'alarme. La permission d\'exception d\'optimisation de la batterie est manquante et doit être définie.';

  @override
  String get overlayPermissionFail =>
      'Échec de l\'enregistrement de l\'alarme. La permission \"Afficher sur d\'autres applis\" est manquante et doit être définie.';

  @override
  String get batteryOptimizationName => 'Optimisation de la batterie';

  @override
  String get batteryOptimizationTitle =>
      'Paramètres d\'optimisation requis\npour des alarmes précises.';

  @override
  String get batteryOptimizationSubtitle =>
      'Veuillez définir comme exception d\'optimisation de la batterie\npour que l\'application fonctionne correctement en arrière-plan.';

  @override
  String get batteryOptimizationBottomDesc =>
      'Sélectionner \'Non restreint\' ou \'Ne pas optimiser\'\ndans les paramètres garantira qu\'aucune alarme ne soit manquée.';

  @override
  String get understand => 'Je comprends';

  @override
  String get overlayPermissionName => 'Afficher sur d\'autres applications';

  @override
  String get overlayPermissionTitle => 'Guide des permissions';

  @override
  String get unknownAlarmError =>
      'Échec de l\'enregistrement de l\'alarme. Une erreur inconnue est survenue.';

  @override
  String get resetTooltip => 'Réinitialiser';

  @override
  String get errorLoadingAlarm =>
      'Échec du chargement des informations d\'alarme.';

  @override
  String get alarmNotFound => 'Informations d\'alarme introuvables.';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'Alarme de répétition ($current/$max)';
  }

  @override
  String snoozeRemainingCount(int current, int max) {
    return 'Restant ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'Éteindre l\'alarme';

  @override
  String get startMission => 'Commencer la mission';

  @override
  String get alarmSnooze => 'Répéter';

  @override
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes min (illimité)';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes min ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => 'Journée pétillante';

  @override
  String get ringtone_cozy_day => 'Journée cocooning';

  @override
  String get ringtone_sensible_day => 'Journée posée';

  @override
  String get ringtone_play_with_me => 'Joue avec moi';

  @override
  String get ringtone_refreshing_day => 'Journée rafraîchissante';

  @override
  String get ringtone_new_beginning => 'Nouveau départ';

  @override
  String get ringtone_self_love => 'Amour de soi';

  @override
  String get cherry_stained_finger => 'Doigt teinté de cerise';

  @override
  String get dancing_in_the_stars => 'Dansant dans les étoiles';

  @override
  String get nice_day => 'Bonne journée';

  @override
  String get fortuneTitle => 'Vérifier la fortune';

  @override
  String get fortuneMessage =>
      'Vérifiez vos résultats de fortune\net obtenez des cadeaux cachés !';

  @override
  String get fortuneAdButton => 'Regarder la pub et voir les résultats';

  @override
  String get fortuneLoadingMessage =>
      'Découvrez l\'interprétation spéciale du tarot de la voyante.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Analyse de votre tarot sélectionné... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Pensez à l\'énergie d\'aujourd\'hui\net sélectionnez 3 cartes.';

  @override
  String fortuneSelectTitleDate(String month, int day) {
    return 'Pensez à l\'énergie du $month/$day\net sélectionnez 3 cartes.';
  }

  @override
  String get fortuneNewYearButton => 'Voir la fortune du Nouvel An 2026';

  @override
  String get loveFortune => 'Amour';

  @override
  String get wealthFortune => 'Richesse';

  @override
  String get successFortune => 'Succès';

  @override
  String get fortuneResultTitle =>
      'Voici votre résultat de fortune pour aujourd\'hui.';

  @override
  String fortuneResultTitleDate(int year, String month, int day) {
    return 'Fortune pour le $year/$month/$day';
  }

  @override
  String get startDayButton => 'Commencez votre journée';

  @override
  String get tarotName0 => 'Le Fou';

  @override
  String get tarotName1 => 'Le Bateleur';

  @override
  String get tarotName2 => 'La Papesse';

  @override
  String get tarotName3 => 'L\'Impératrice';

  @override
  String get tarotName4 => 'L\'Empereur';

  @override
  String get tarotName5 => 'Le Pape';

  @override
  String get tarotName6 => 'L\'Amoureux';

  @override
  String get tarotName7 => 'Le Chariot';

  @override
  String get tarotName8 => 'La Force';

  @override
  String get tarotName9 => 'L\'Ermite';

  @override
  String get tarotName10 => 'La Roue de Fortune';

  @override
  String get tarotName11 => 'La Justice';

  @override
  String get tarotName12 => 'Le Pendu';

  @override
  String get tarotName13 => 'La Mort';

  @override
  String get tarotName14 => 'La Tempérance';

  @override
  String get tarotName15 => 'Le Diable';

  @override
  String get tarotName16 => 'La Maison Dieu';

  @override
  String get tarotName17 => 'L\'Étoile';

  @override
  String get tarotName18 => 'La Lune';

  @override
  String get tarotName19 => 'Le Soleil';

  @override
  String get tarotName20 => 'Le Jugement';

  @override
  String get tarotName21 => 'Le Monde';

  @override
  String get tarotKeywords0 =>
      'Nouveaux départs, aventure, innocence, liberté, imprudence';

  @override
  String get tarotDesc0 =>
      'Le Fou se tient précairement au bord d\'une falaise dans des vêtements colorés, mais son regard est fixé au loin, plein d\'espoir.';

  @override
  String get tarotLoveMeaning0 =>
      'Un nouvel amour inattendu peut arriver, ou une rencontre fatidique au premier regard.';

  @override
  String get tarotLoveDetail0 =>
      'C\'est un moment où vous pouvez commencer l\'amour avec un cœur pur comme un enfant. Oubliez toutes les blessures passées.';

  @override
  String get tarotWealthMeaning0 =>
      'Un nouvel investissement ou un nouvel élément commercial peut attirer votre attention.';

  @override
  String get tarotWealthDetail0 =>
      'C\'est un moment où de nouvelles opportunités s\'ouvrent financièrement. Vous pouvez obtenir des résultats inattendus.';

  @override
  String get tarotSuccessMeaning0 =>
      'C\'est le bon moment pour commencer un nouveau projet ou changer d\'emploi pour un domaine complètement différent.';

  @override
  String get tarotSuccessDetail0 =>
      'S\'il y a quelque chose que vous préparez, faites le premier pas avec audace.';

  @override
  String get tarotKeywords1 =>
      'Créativité, maîtrise, expression de soi, ingéniosité, volonté';

  @override
  String get tarotDesc1 =>
      'Le Bateleur se tient devant une table portant les symboles des quatre éléments. Une main vers le ciel et l\'autre vers la terre, il symbolise la capacité à manifester les idées dans la réalité.';

  @override
  String get tarotLoveMeaning1 =>
      'C\'est une excellente occasion de montrer votre charme et de conquérir le cœur de quelqu\'un.';

  @override
  String get tarotLoveDetail1 =>
      'Votre charisme et vos talents sont à leur apogée, vous rendant extrêmement attirant pour le sexe opposé. Si vous avez quelqu\'un en vue, n\'hésitez pas à prendre l\'initiative. Votre sens de l\'humour et votre conversation pleine d\'esprit captiveront votre partenaire, vous permettant de guider la relation.';

  @override
  String get tarotWealthMeaning1 =>
      'Le moment idéal pour créer de nouvelles sources de revenus grâce à vos compétences.';

  @override
  String get tarotWealthDetail1 =>
      'Vos connaissances, vos compétences et vos idées peuvent se transformer en gains financiers réels dès maintenant. Ne vous limitez pas à votre salaire de base ; essayez de monétiser vos loisirs ou de vous lancer en freelance. Votre capacité de planification créative vous aidera à atteindre des revenus dépassant vos attentes.';

  @override
  String get tarotSuccessMeaning1 =>
      'Vos capacités professionnelles seront à l\'honneur et recevront la reconnaissance de votre entourage.';

  @override
  String get tarotSuccessDetail1 =>
      'Au travail ou dans vos études, vous pourrez démontrer tout votre potentiel et vous démarquer. Quels que soient les défis, vous les résoudrez grâce à votre ingéniosité et votre esprit vif. Vos collègues et supérieurs vous reconnaîtront comme un véritable expert, alors agissez avec assurance.';

  @override
  String get tarotKeywords2 =>
      'Intuition, mystère, subconscient, sagesse intérieure, passivité';

  @override
  String get tarotDesc2 =>
      'La Papesse est assise entre une colonne blanche et une colonne noire, gardant le parchemin de la sagesse. Elle symbolise l\'intuition profonde et l\'équilibre entre le conscient et l\'inconscient.';

  @override
  String get tarotLoveMeaning2 =>
      'Une période où la connexion spirituelle est plus importante que l\'attraction physique.';

  @override
  String get tarotLoveDetail2 =>
      'Vous serez plus attiré par des personnes ayant un monde intérieur riche avec qui vous pouvez avoir des conversations profondes. Votre intuition est aiguisée, vous permettant de comprendre votre partenaire sans paroles. Cependant, un excès de réserve pourrait causer des malentendus, alors essayez d\'exprimer vos sentiments sincèrement de temps en temps.';

  @override
  String get tarotWealthMeaning2 =>
      'Il est temps de protéger vos actifs et d\'observer la situation plutôt que de prendre des risques.';

  @override
  String get tarotWealthDetail2 =>
      'Ce n\'est pas le meilleur moment pour poursuivre des gains rapides sans réfléchir. Au lieu d\'agir impulsivement, consacrez du temps à l\'analyse du marché et à l\'étude des outils financiers. C\'est une étape de « semailles », alors ne vous angoissez pas si les fruits ne viennent pas immédiatement.';

  @override
  String get tarotSuccessMeaning2 =>
      'Le succès vous attend dans les activités académiques, la recherche et les professions intellectuelles.';

  @override
  String get tarotSuccessDetail2 =>
      'Concentrez-vous sur le renforcement de votre potentiel interne et l\'amélioration de vos compétences plutôt que sur l\'éclat extérieur. Vous obtiendrez des résultats exceptionnels dans les tâches nécessitant une analyse approfondie. Votre sagesse et votre prudence seront la clé du succès lors des moments décisifs.';

  @override
  String get tarotKeywords3 => 'Féminité, beauté, nature, abondance, fertilité';

  @override
  String get tarotDesc3 =>
      'L\'Impératrice repose dans un jardin florissant, représentant la prospérité matérielle et la générosité émotionnelle.';

  @override
  String get tarotLoveMeaning3 =>
      'Temps de floraison émotionnelle et de renforcement des liens affectifs.';

  @override
  String get tarotLoveDetail3 =>
      'Votre charme et votre énergie féminine (ou réceptive) sont au maximum, vous rendant incroyablement attirante. Dans vos relations, il y aura de l\'harmonie et du soin mutuel, ce qui en fait un bon moment pour parler de mariage ou de projets familiaux. Si vous êtes célibataire, un changement de style vous aidera à attirer l\'attention.';

  @override
  String get tarotWealthMeaning3 =>
      'Période de prospérité matérielle et de stabilité financière.';

  @override
  String get tarotWealthDetail3 =>
      'La chance financière est de votre côté. Vos efforts passés porteront leurs fruits et vous pourrez profiter d\'un plus grand confort. Vous pourriez recevoir des bonus inattendus, des cadeaux ou des bénéfices d\'investissements réussis. Partagez votre énergie positive avec les autres, cela attirera encore plus de fortune.';

  @override
  String get tarotSuccessMeaning3 =>
      'Les projets actuels progressent avec succès et apportent d\'excellents résultats.';

  @override
  String get tarotSuccessDetail3 =>
      'Il est temps de voir les fruits réels de votre travail. Les projets se concluront avec succès, ce qui pourrait se traduire par une promotion ou une prime. Votre vision créative et votre sens esthétique seront très appréciés. Profitez du processus de travail ; cela vous aidera à atteindre des objectifs encore plus élevés.';

  @override
  String get tarotKeywords4 =>
      'Autorité, structure, contrôle, leadership, logique';

  @override
  String get tarotDesc4 =>
      'L\'Empereur est assis sur un trône de pierre en armure, symbolisant la fermeté, l\'ordre et la détermination dans le commandement.';

  @override
  String get tarotLoveMeaning4 =>
      'Relation stable avec un partenaire fiable et responsable.';

  @override
  String get tarotLoveDetail4 =>
      'Au lieu de passions éphémères, la confiance et la sécurité en l\'avenir prennent le devant de la scène. Votre partenaire sera un soutien solide et protecteur pour vous. Essayez d\'éviter le contrôle excessif et l\'entêtement dans la communication. Pour les célibataires, une rencontre avec une personne influente se dessine.';

  @override
  String get tarotWealthMeaning4 =>
      'La gestion systématique des actifs aidera à construire un capital stable.';

  @override
  String get tarotWealthDetail4 =>
      'En matière financière, il est crucial de s\'en tenir à un plan et à vos principes. Au lieu de spéculations risquées, choisissez des instruments sûrs comme les dépôts ou l\'immobilier. Votre pragmatisme et votre détermination vous aideront à jeter les bases d\'une richesse durable.';

  @override
  String get tarotSuccessMeaning4 =>
      'De bonnes opportunités de promotion ou d\'obtenir un poste de leadership.';

  @override
  String get tarotSuccessDetail4 =>
      'Votre position dans l\'équipe se renforce. Les dirigeants apprécieront vos qualités de meneur et pourraient vous confier la gestion d\'un projet ou d\'un département important. Utilisez la logique et le calcul froid pour résoudre les tâches professionnelles et vous gagnerez la confiance totale de vos supérieurs.';

  @override
  String get tarotKeywords5 =>
      'Tradition, enseignement, croyances, conseil, médiation';

  @override
  String get tarotDesc5 =>
      'Le Pape symbolise les normes sociales et le guide spirituel, menant à travers des conseils sages et des valeurs traditionnelles.';

  @override
  String get tarotLoveMeaning5 =>
      'Relations sérieuses et saines basées sur le respect mutuel.';

  @override
  String get tarotLoveDetail5 =>
      'Vous ne chercherez pas d\'aventures passagères, mais une relation profonde en vue de fonder une famille. Rencontrer quelqu\'un par des amis communs ou lors d\'événements formels pourrait être le début de quelque chose d\'important. Si des disputes surviennent, demandez conseil à vos aînés ; leur sagesse vous aidera.';

  @override
  String get tarotWealthMeaning5 =>
      'Il est préférable de suivre des méthodes d\'épargne traditionnelles et éprouvées.';

  @override
  String get tarotWealthDetail5 =>
      'Privilégiez la sécurité plutôt que les investissements risqués. Les dépôts bancaires ou les assurances seront les options les plus appropriées. La consultation d\'un expert financier ou le maintien de l\'honnêteté dans vos transactions vous aidera à conserver et à accroître votre patrimoine.';

  @override
  String get tarotSuccessMeaning5 =>
      'Moment favorable pour signer des contrats et des accords de partenariat.';

  @override
  String get tarotSuccessDetail5 =>
      'Au lieu de résoudre les problèmes seul, demandez le soutien de collègues ou de mentors. Respecter les règles et procédures de l\'entreprise est le chemin le plus court vers la reconnaissance. C\'est aussi une période propice pour signer des documents importants et établir des réseaux de contact professionnels.';

  @override
  String get tarotKeywords6 => 'Amour, harmonie, choix, union, partenariat';

  @override
  String get tarotDesc6 =>
      'Sous les rayons d\'un soleil chaud, Adam et Ève reçoivent la bénédiction d\'un ange. C\'est le symbole de l\'union des âmes et d\'un choix de vie important.';

  @override
  String get tarotLoveMeaning6 =>
      'L\'une des meilleures périodes pour l\'épanouissement de l\'amour.';

  @override
  String get tarotLoveDetail6 =>
      'Un roman passionnant vous attend. Vous vous rapprocherez rapidement d\'une personne qui vous attire et ressentirez une profonde connexion spirituelle. Si vous prévoyez de déclarer vos sentiments, les chances de succès sont très élevées. Mais rappelez-vous : il vaut mieux choisir avec le cœur que de céder à une tentation momentanée.';

  @override
  String get tarotWealthMeaning6 =>
      'Votre situation financière s\'améliorera en collaborant avec d\'autres.';

  @override
  String get tarotWealthDetail6 =>
      'Travailler en équipe avec quelqu\'un qui pense comme vous apportera un effet de synergie et augmentera vos bénéfices. Si l\'on vous propose un partenariat, considérez-le sérieusement. La communication avec les autres vous aidera à obtenir des informations précieuses pour vos investissements. Cependant, surveillez vos dépenses de loisirs pour ne pas dépasser votre budget.';

  @override
  String get tarotSuccessMeaning6 =>
      'C\'est le moment où le travail d\'équipe apporte des résultats brillants.';

  @override
  String get tarotSuccessDetail6 =>
      'Vous vous entendez à merveille avec vos collègues et partenaires, et le travail vous est agréable. Dans des projets de groupe, vous accomplirez plus qu\'en solo, et la capacité à nouer des relations sera la clé du succès. En choisissant une tâche qui vous plaît vraiment, vous obtiendrez des résultats que vous ne regretterez pas.';

  @override
  String get tarotKeywords7 => 'Victoire, volonté, avance, conquête, triomphe';

  @override
  String get tarotDesc7 =>
      'Le jeune roi sur son char avance avec détermination vers son objectif, tenant le sceptre du pouvoir. Sa volonté est inébranlable et le triomphe est proche.';

  @override
  String get tarotLoveMeaning7 =>
      'Période où les actions décidées en amour apporteront le succès.';

  @override
  String get tarotLoveDetail7 =>
      'Il est temps de lutter résolument pour votre amour. N\'hésitez pas et déclarez vos sentiments ouvertement ; même s\'il y a des concurrents, vous sortirez victorieux. Si vous êtes dans une phase d\'incertitude, prenez l\'initiative et définissez la relation. Les voyages ensemble ou les loisirs actifs renforceront votre lien.';

  @override
  String get tarotWealthMeaning7 =>
      'Vous devez agir avec audace pour atteindre les objectifs financiers fixés.';

  @override
  String get tarotWealthDetail7 =>
      'Vous avez maintenant besoin d\'une force motrice puissante pour réaliser vos plans. N\'hésitez pas à prendre des décisions importantes lorsque l\'occasion se présente. Concentrez-vous sur des projets à court terme ; maintenant, vos revenus dépendent directement de votre activité. Des dépenses liées aux voyages peuvent survenir, mais ce sera un investissement dans de nouvelles opportunités.';

  @override
  String get tarotSuccessMeaning7 =>
      'Succès dans la compétition et atteinte des objectifs.';

  @override
  String get tarotSuccessDetail7 =>
      'Le succès vous attend dans l\'atteinte de buts concrets : promotions, réussite aux examens ou conclusion d\'accords bénéfiques. Plus la compétition sera forte, plus votre esprit combatif sera élevé et, au final, la victoire sera vôtre. Votre détermination fera une grande impression sur vos collègues.';

  @override
  String get tarotKeywords8 =>
      'Force, courage, patience, influence douce, maîtrise de soi';

  @override
  String get tarotDesc8 =>
      'Une femme aux vêtements blancs ferme doucement la gueule d\'un lion, symbolisant la victoire de l\'esprit sur la force brute et la maîtrise de soi.';

  @override
  String get tarotLoveMeaning8 =>
      'Période où vous devez faire preuve de patience et accepter votre partenaire tel qu\'il est.';

  @override
  String get tarotLoveDetail8 =>
      'Vos relations exigent maintenant de la sagesse et de l\'endurance. En acceptant les défauts de votre partenaire avec un cœur ouvert, vous élevez le lien à un nouveau niveau. Il est important de guider en douceur, en faisant preuve de force intérieure. Si vous soutenez patiemment votre être cher, votre sincérité finira par faire fondre toute glace.';

  @override
  String get tarotWealthMeaning8 =>
      'L\'épargne constante et les habitudes de dépenses raisonnables sont la clé de la richesse.';

  @override
  String get tarotWealthDetail8 =>
      'Votre situation financière croît lentement mais sûrement. Ne vous découragez pas s\'il n\'y a pas de revenus énormes en ce moment ; continuez à gérer vos actifs régulièrement. Dans les investissements, ne vous laissez pas emporter par la panique face aux fluctuations temporaires. La capacité à contrôler vos désirs impulsifs est le chemin le plus court vers la prospérité.';

  @override
  String get tarotSuccessMeaning8 =>
      'Vous pourrez gérer même les tâches les plus difficiles ou une direction exigeante.';

  @override
  String get tarotSuccessDetail8 =>
      'Il est possible qu\'on vous confie un projet difficile, mais vous avez suffisamment de ressources internes pour le gérer. Votre douceur extérieure cache une volonté d\'acier qui vous aidera à surmonter tous les obstacles. Votre calme lors de la résolution de problèmes suscitera un profond respect et une confiance chez les autres.';

  @override
  String get tarotKeywords9 =>
      'Introspection, solitude, recherche de la vérité, sagesse, repos';

  @override
  String get tarotDesc9 =>
      'Un vieil homme avec une lanterne à la main est au sommet d\'une montagne enneigée, écoutant sa voix intérieure en quête de vérité.';

  @override
  String get tarotLoveMeaning9 =>
      'Temps pour la solitude ou des réflexions profondes sur les relations.';

  @override
  String get tarotLoveDetail9 =>
      'Maintenant, il est plus important de vous comprendre vous-même que de mener une vie sociale active. Ne cherchez pas de rencontres juste pour fuir la solitude ; réfléchissez au type d\'amour dont vous avez réellement besoin. Même si vous avez un partenaire, une petite distance vous aidera tous deux à mieux valoriser votre relation.';

  @override
  String get tarotWealthMeaning9 =>
      'L\'activité financière peut diminuer temporairement.';

  @override
  String get tarotWealthDetail9 =>
      'En matière d\'argent, il convient d\'adopter une attitude conservatrice maintenant. Il est plus important de conserver ce que vous avez que d\'essayer d\'augmenter le capital par des méthodes risquées. Investir dans votre propre éducation ou formation sera le meilleur investissement, qui portera ses fruits à l\'avenir.';

  @override
  String get tarotSuccessMeaning9 =>
      'Succès dans les affaires nécessitant des connaissances approfondies, de la recherche ou de la maîtrise.';

  @override
  String get tarotSuccessDetail9 =>
      'Vous obtiendrez d\'excellents résultats dans les travaux scientifiques, la planification ou le développement, où une immersion profonde dans le processus est requise. C\'est maintenant le moment d\'accumuler des forces, pas de les exhiber. Si vous êtes confronté à une tâche insoluble, demandez conseil à un mentor expérimenté.';

  @override
  String get tarotKeywords10 => 'Chance, changements, destin, cycles, tournant';

  @override
  String get tarotDesc10 =>
      'La grande roue de la fortune tourne, annonçant des changements inévitables et le début d\'un nouveau cycle de vie.';

  @override
  String get tarotLoveMeaning10 => 'Une rencontre fatidique vous attend.';

  @override
  String get tarotLoveDetail10 =>
      'L\'amour peut arriver soudainement, comme au cinéma. Des rencontres fortuites ou des retrouvailles inattendues avec d\'anciens amours sont possibles. Les célibataires peuvent tomber amoureux au premier regard, et ceux qui sont en couple sentiront la relation passer à un niveau supérieur.';

  @override
  String get tarotWealthMeaning10 =>
      'La situation financière commence à s\'améliorer.';

  @override
  String get tarotWealthDetail10 =>
      'La déesse Fortune vous sourit. Des rentrées d\'argent inattendues ou des bénéfices d\'investissements sont possibles. Le flux d\'argent devient plus stable et vous devez saisir les opportunités à temps. Cependant, rappelez-vous que la chance est cyclique ; montrez de la sagesse et épargnez une partie pour l\'avenir.';

  @override
  String get tarotSuccessMeaning10 =>
      'Les circonstances penchent en votre faveur.';

  @override
  String get tarotSuccessDetail10 =>
      'Une période importante arrive qui peut être un tournant dans votre carrière. Les dossiers qui étaient en pause commenceront à bouger. Les chances d\'une promotion ou d\'une offre d\'emploi avantageuse seront ce « vent favorable » qui vous emmènera vers de nouveaux sommets.';

  @override
  String get tarotKeywords11 =>
      'Justice, équilibre, responsabilité, vérité, cause et effet';

  @override
  String get tarotDesc11 =>
      'Un juge vêtu de rouge tient une épée dans la main droite et une balance dans la gauche. C\'est le symbole du jugement objectif et de la responsabilité de ses propres actes.';

  @override
  String get tarotLoveMeaning11 =>
      'Une relation où la raison l\'emporte sur les sentiments.';

  @override
  String get tarotLoveDetail11 =>
      'C\'est maintenant un moment où le jugement rationnel est plus nécessaire que de se laisser emporter par les émotions. Réfléchissez pour savoir si votre relation maintient l\'équilibre : si vous vous sacrifiez trop ou, au contraire, si vous ne faites que recevoir sans rien donner en retour. Si vous envisagez de vous marier, vous évaluerez méticuleusement les conditions et le passé de votre partenaire.';

  @override
  String get tarotWealthMeaning11 =>
      'Une vérification méticuleuse est requise dans les transactions financières et les contrats.';

  @override
  String get tarotWealthDetail11 =>
      'Des situations peuvent survenir où il est nécessaire de distinguer le vrai du faux sur le plan monétaire. C\'est un bon moment pour vous faire rembourser de l\'argent prêté ou pour liquider des comptes en suspens. Lors de la signature de contrats, examinez attentivement les clauses et agissez avec honnêteté et transparence en suivant les principes.';

  @override
  String get tarotSuccessMeaning11 =>
      'Vous recevrez une évaluation juste de votre travail et une récompense appropriée.';

  @override
  String get tarotSuccessDetail11 =>
      'Vos réalisations professionnelles recevront une évaluation juste et objective. Si vous avez travaillé dur, attendez-vous à une promotion ou à une prime. Vos capacités analytiques et votre précision seront très appréciées dans les domaines nécessitant de l\'exactitude. Lors de la prise de décisions, laissez de côté les émotions et basez-vous strictement sur les données et les faits.';

  @override
  String get tarotKeywords12 =>
      'Sacrifice, patience, nouvelle perspective, stagnation, éveil';

  @override
  String get tarotDesc12 =>
      'Un homme pendu à un arbre par un pied, à travers une souffrance volontaire, observe le monde sous un angle totalement nouveau et atteint l\'illumination. Le halo autour de sa tête signifie une croissance spirituelle.';

  @override
  String get tarotLoveMeaning12 =>
      'La relation peut stagner ou les sentiments non partagés peuvent durer longtemps.';

  @override
  String get tarotLoveDetail12 =>
      'Vous pouvez ressentir de la frustration face au manque de progrès en amour, mais maintenant la précipitation n\'aidera pas. Faites une pause, regardez la situation de l\'autre côté et réfléchissez si vous imposez vos sentiments à votre manière. Savoir se mettre à la place de l\'autre et faire preuve de patience finira par être la clé du cœur de votre partenaire.';

  @override
  String get tarotWealthMeaning12 =>
      'Les flux d\'argent peuvent s\'arrêter temporairement, des pertes forcées sont possibles.';

  @override
  String get tarotWealthDetail12 =>
      'Vous pouvez ressentir une stagnation de vos finances. Les investissements peuvent être « gelés » et les revenus attendus retardés. Plus vous vous agiterez, plus la situation sera complexe, il est donc préférable de rester calme. Utilisez ce temps pour revoir vos habitudes de dépenses et développer une nouvelle attitude envers l\'argent.';

  @override
  String get tarotSuccessMeaning12 =>
      'Les choses peuvent ne pas se passer selon le plan, des retards sont possibles.';

  @override
  String get tarotSuccessDetail12 =>
      'La suspension d\'un projet ou le retard dans les affaires peuvent causer du stress, mais ce n\'est pas un échec, c\'est un signal de « redémarrage ». N\'essayez pas de forcer les événements ; faites un pas en arrière et reconsidérez la stratégie globale. Rompre avec les vieux schémas vous aidera à trouver une solution géniale.';

  @override
  String get tarotKeywords13 =>
      'Achèvement, changement, transformation, séparation, nouveau départ';

  @override
  String get tarotDesc13 =>
      'Symbolise la fin complète de l\'ancien et la naissance du nouveau. Représente un processus de transformation douloureux mais inévitable, où la mort de l\'ancien dégage le chemin pour l\'avenir.';

  @override
  String get tarotLoveMeaning13 =>
      'Signifie la fin d\'une relation ou un changement radical en elle.';

  @override
  String get tarotLoveDetail13 =>
      'Il est possible que votre relation actuelle ait atteint sa limite. Au lieu d\'essayer de retenir ce qui s\'en va, montrez du courage et laissez faire la situation. La séparation est douloureuse, mais au bout de ce chemin vous attend sans doute un meilleur départ. Rappelez-vous : ce n\'est qu\'en vous libérant complètement des attachements et des blessures du passé que vous laisserez de la place pour qu\'une nouvelle personne entre dans votre vie.';

  @override
  String get tarotWealthMeaning13 =>
      'Des pertes financières ou des échecs d\'investissement peuvent survenir.';

  @override
  String get tarotWealthDetail13 =>
      'Des changements importants dans vos finances sont attendus. Vous pouvez faire face à des pertes là où vous ne les attendiez pas ou à des dépenses imprévues. C\'est un signal que les anciennes méthodes de gestion de capital ne fonctionnent plus. Utilisez ce moment pour solder vos dettes, couper les dépenses inutiles et commencer à construire une structure financière plus saine et plus stable.';

  @override
  String get tarotSuccessMeaning13 =>
      'Le travail actuel peut être interrompu ou se terminer par un échec.';

  @override
  String get tarotSuccessDetail13 =>
      'Un projet dans lequel vous avez mis beaucoup d\'efforts pourrait s\'arrêter, ou vous pourriez connaître des changements brusques dans votre carrière. Maintenant, vous pouvez ressentir l\'amertume de l\'échec, mais c\'est un signe du destin : il est temps de quitter ce qui ne vous convient pas et de chercher le chemin du véritable succès. Partez de zéro et un nouveau chapitre plus passionnant de votre vie s\'ouvrira.';

  @override
  String get tarotKeywords14 =>
      'Équilibre, tempérance, harmonie, guérison, compromis';

  @override
  String get tarotDesc14 =>
      'Un ange verse de l\'eau d\'une coupe à l\'autre, symbolisant l\'équilibre parfait entre la réalité et l\'idéal, ainsi que le flux harmonieux de la vie.';

  @override
  String get tarotLoveMeaning14 =>
      'Processus dans lequel deux personnes différentes trouvent un langage commun et l\'harmonie.';

  @override
  String get tarotLoveDetail14 =>
      'Pour cette période, un amour calme et profond est plus approprié que les passions turbulentes. En reconnaissant les différences de l\'autre et en les complétant, vous construisez un lien solide. Même si des disputes surviennent, la sagesse vous aidera à les résoudre par un dialogue serein. Votre attitude douce et attentionnée calmera votre partenaire et créera une atmosphère stable.';

  @override
  String get tarotWealthMeaning14 =>
      'Il est important de maintenir l\'équilibre entre les revenus et les dépenses.';

  @override
  String get tarotWealthDetail14 =>
      'La situation financière se stabilise. Au lieu de poursuivre des gains faciles, concentrez-vous sur la distribution efficace de vos actifs actuels. Avec la croissance des revenus, il est important de garder l\'habitude de contrôler les dépenses. Dans les investissements, il est préférable de suivre une stratégie de diversification ; la constance vous mènera finalement à la richesse.';

  @override
  String get tarotSuccessMeaning14 =>
      'Votre capacité à arrondir les angles et à mener l\'équipe à l\'accord sera à son apogée.';

  @override
  String get tarotSuccessDetail14 =>
      'Vous excellerez en tant que médiateur dans des projets d\'équipe, résolvant les conflits et augmentant l\'efficacité globale. Votre flexibilité et votre capacité d\'adaptation seront appréciées par vos collègues. Maintenant, il est important de maintenir l\'équilibre entre le travail et le repos pour éviter l\'épuisement professionnel. Une vision globale de la situation vous aidera à obtenir les meilleurs résultats.';

  @override
  String get tarotKeywords15 =>
      'Tentation, dépendance, attachement, matérialisme, obsession';

  @override
  String get tarotDesc15 =>
      'Symbole des désirs et des attachements qui nous enchaînent. Ce sont les tentations matérielles dont nous pouvons nous libérer si nous montrons de la volonté, mais dans lesquelles nous nous plongeons souvent tête baissée.';

  @override
  String get tarotLoveMeaning15 =>
      'Signifie une relation attirée ou obsédée par un charme physique intense.';

  @override
  String get tarotLoveDetail15 =>
      'Vous pourriez être irrésistiblement attiré par quelqu\'un, ce qui rend difficile la prise de décisions sensées. Une romance passionnée peut commencer, mais faites attention à ne pas tomber dans le piège de la jalousie et du contrôle excessifs. Réfléchissez si votre sentiment est un amour véritable ou simplement un désir de posséder l\'autre.';

  @override
  String get tarotWealthMeaning15 =>
      'L\'avidité excessive peut mener à des investissements risqués ou à de grandes dépenses de loisirs.';

  @override
  String get tarotWealthDetail15 =>
      'C\'est une période de nombreuses tentations financières. Méfiez-vous des offres douteuses d\'« argent facile » et des achats impulsifs qui peuvent vider votre portefeuille. Ne devenez pas l\'esclave de l\'argent et ne minez pas la confiance de votre entourage. Au lieu de nouveaux investissements, il est maintenant préférable de se concentrer sur la conservation de ce que vous avez.';

  @override
  String get tarotSuccessMeaning15 =>
      'Pour le succès, vous pourriez être prêt à n\'importe quelle mesure.';

  @override
  String get tarotSuccessDetail15 =>
      'La soif de pouvoir ou de reconnaissance peut vous faire voir vos collègues comme de simples concurrents. Faites attention à ne pas devenir un bourreau de travail, en oubliant la santé et le repos. Renoncez à l\'idée d\'obtenir tout tout de suite sans l\'effort adéquat. Une attitude honnête envers le travail vous aidera à vous libérer des chaînes internes.';

  @override
  String get tarotKeywords16 =>
      'Effondrement, impact, changement brusque, libération, révélation';

  @override
  String get tarotDesc16 =>
      'Un éclair frappe directement la tour, la faisant s\'écrouler et provoquant la chute des gens. Symbolise la rupture soudaine des vieilles valeurs par des forces extérieures et la rencontre avec la crue vérité.';

  @override
  String get tarotLoveMeaning16 =>
      'Dans les relations, une crise grave ou une rupture soudaine est possible.';

  @override
  String get tarotLoveDetail16 =>
      'Comme un éclair dans un ciel dégagé, un événement inattendu peut survenir dans votre vie personnelle. Vous pourriez être déçu par votre partenaire ou faire face à un conflit qui ébranle les fondations de votre relation. Mais ne désespérez pas : c\'est un processus de nettoyage des illusions. Sur les ruines de l\'ancien, quelque chose de plus fort et de plus authentique grandira avec le temps.';

  @override
  String get tarotWealthMeaning16 =>
      'Vous devez vous préparer à des pertes financières soudaines ou à des chocs.';

  @override
  String get tarotWealthDetail16 =>
      'Une période d\'extrême instabilité financière commence. Des pertes brusques ou l\'effondrement de projets d\'investissement sont possibles. Il est maintenant crucial de déplacer vos actifs dans un endroit sûr et d\'être vigilant. Rappelez-vous que cet effondrement vous aidera à revoir vos points de vue sur l\'argent, et qu\'après la chute vient toujours une période de reconstruction.';

  @override
  String get tarotSuccessMeaning16 =>
      'Les projets peuvent être interrompus, des changements brusques de carrière ou des réajustements de personnel sont possibles.';

  @override
  String get tarotSuccessDetail16 =>
      'Vous pouvez ressentir de l\'amertume parce que le projet que vous avez construit étape par étape s\'effondre. Mais cela n\'arrive pas à cause de votre faiblesse, mais à cause de changements inévitables. Gardez votre calme, évaluez la situation et commencez à chercher de nouvelles voies. Si vous pouvez transformer cette crise en opportunité, vous atteindrez des sommets encore plus élevés.';

  @override
  String get tarotKeywords17 =>
      'Espoir, inspiration, guérison, optimisme, réalisation des désirs';

  @override
  String get tarotDesc17 =>
      'Sous la lumière d\'une étoile brillante, une femme verse de l\'eau, symbolisant la paix après les épreuves et l\'espoir en un avenir radieux.';

  @override
  String get tarotLoveMeaning17 =>
      'Période de rencontre avec l\'idéal ou réalisation du rêve d\'amour.';

  @override
  String get tarotLoveDetail17 =>
      'Comme une étoile dans la nuit, un espoir radieux arrive dans votre vie. Vous pourriez rencontrer la personne de vos rêves, et votre charisme sincère sera extrêmement attirant pour les autres. Les blessures du passé se referment, laissant place à une énergie lumineuse qui vous permettra de croire à nouveau en l\'amour.';

  @override
  String get tarotWealthMeaning17 =>
      'La situation financière commence à s\'améliorer progressivement.';

  @override
  String get tarotWealthDetail17 =>
      'La chance avec l\'argent commence à tourner en votre faveur. Les difficultés économiques sont derrière vous et vous commencez à voir la lumière au bout du tunnel. Des idées créatives peuvent apporter des sources de revenus supplémentaires. Maintenant, il est important de penser à long terme : les investissements dans l\'avenir seront la clé.';

  @override
  String get tarotSuccessMeaning17 =>
      'Une vague d\'inspiration vous attend et l\'occasion de faire connaître vos talents.';

  @override
  String get tarotSuccessDetail17 =>
      'Vos idées recevront la reconnaissance et les éloges de vos collègues. Vous vous distinguerez particulièrement dans les domaines créatifs, le marketing ou la publicité ; c\'est maintenant le moment idéal pour lancer le projet dont vous avez toujours rêvé. Agissez avec confiance : vous avez toutes les chances de gagner en popularité et de renforcer votre autorité.';

  @override
  String get tarotKeywords18 =>
      'Anxiété, illusion, incertitude, intuition, subconscient';

  @override
  String get tarotDesc18 =>
      'Sous la lumière de la lune coexistent l\'anxiété et une incertitude brumeuse, symbolisant la vérité cachée et le monde du subconscient.';

  @override
  String get tarotLoveMeaning18 =>
      'Incompréhension des sentiments du partenaire, offenses et soupçons possibles.';

  @override
  String get tarotLoveDetail18 =>
      'Vous êtes comme dans un brouillard : les sentiments de votre partenaire ne sont pas clairs, ce qui génère de l\'anxiété. De petits malentendus peuvent se transformer en soupçons sérieux, vous volant votre tranquillité. Mais ne vous précipitez pas pour tirer des conclusions ; maintenant, il est préférable d\'adopter une posture d\'attente. Essayez de garder votre équilibre interne et de penser rationnellement.';

  @override
  String get tarotWealthMeaning18 =>
      'Les perspectives financières sont brumeuses, risque élevé de tromperie ou de fraude.';

  @override
  String get tarotWealthDetail18 =>
      'Votre vision de la situation est déformée maintenant. Vous pourriez facilement tomber dans les pièges d\'escrocs ou dans des promesses tentantes mais vides. Méfiez-vous des pièges cachés et faites preuve d\'une extrême prudence dans les affaires. Maintenant n\'est pas le moment pour de nouveaux projets ; il vaut mieux se concentrer sur la protection de ce que vous avez déjà.';

  @override
  String get tarotSuccessMeaning18 =>
      'Période de confusion : les objectifs sont vagues, intrigues possibles dans l\'équipe.';

  @override
  String get tarotSuccessDetail18 =>
      'Vous pouvez vous trouver dans une situation d\'incertitude, où la direction du développement du projet est floue et où les collègues murmurent dans votre dos. Faites attention à vos paroles et à vos actions. Maintenant, il sera plus sage d\'attendre que la situation s\'éclaircisse. Ne croyez pas aux rumeurs aveuglément, gardez votre calme et occupez-vous de vos affaires.';

  @override
  String get tarotKeywords19 =>
      'Succès, bonheur, vitalité, positivisme, bénédiction';

  @override
  String get tarotDesc19 =>
      'Sous un soleil radieux, un enfant sur un cheval blanc agite un drapeau, profitant de la vie. C\'est le symbole de la clarté totale, du succès et du bonheur.';

  @override
  String get tarotLoveMeaning19 =>
      'Des relations bénies, brillantes et heureuses vous attendent.';

  @override
  String get tarotLoveDetail19 =>
      'Un amour parfaitement heureux et béni est maintenant avec vous. Les malentendus et les conflits du passé disparaîtront et la confiance sera renforcée. Les célibataires rencontreront quelqu\'un qui dégage une énergie lumineuse. Des nouvelles joyeuses sont possibles, comme un mariage ou l\'agrandissement de la famille. C\'est un moment merveilleux pour profiter de l\'amour de manière pure et passionnée.';

  @override
  String get tarotWealthMeaning19 =>
      'Votre situation financière est à son apogée.';

  @override
  String get tarotWealthDetail19 =>
      'Votre « moment de gloire » est arrivé. Vos perspectives financières sont très solides, ce qui mène à une croissance des bénéfices. Tous vos efforts passés sont enfin récompensés. C\'est un bon moment pour des achats importants ou des investissements dans ce qui vous apporte de la joie. Profitez de votre succès et partagez-le avec les autres.';

  @override
  String get tarotSuccessMeaning19 =>
      'Vos talents seront reconnus et vous serez au centre de l\'attention.';

  @override
  String get tarotSuccessDetail19 =>
      'Les fanfares du succès retentissent. Tous vos travaux passés sont enfin valorisés positivement et présentés au monde. Le succès dans les affaires, une promotion ou la réussite brillante des examens vous attend. Votre confiance en vous et votre attitude positive vous aideront à atteindre n\'importe quel sommet. C\'est le moment de votre triomphe.';

  @override
  String get tarotKeywords20 =>
      'Renaissance, récompense, nouvelle, décision, retrouvailles';

  @override
  String get tarotDesc20 =>
      'Un ange sonne de la trompette dans le ciel et les gens dans les cercueils s\'éveillent, profitant de la vie. C\'est le symbole de la récompense pour les travaux passés et de l\'éveil à une nouvelle vie.';

  @override
  String get tarotLoveMeaning20 =>
      'Une nouvelle d\'un ancien partenaire ou une opportunité de retrouvailles est possible.';

  @override
  String get tarotLoveDetail20 =>
      'La nouvelle que vous attendiez tant arrivera. Si vous ne pouviez pas oublier un ancien amour ou espériez une rencontre, les chances de succès sont maintenant extrêmement élevées. Les relations incertaines peuvent enfin devenir sérieuses. Il est possible de reprendre contact avec une ancienne connaissance ; écoutez votre cœur et prenez une décision.';

  @override
  String get tarotWealthMeaning20 =>
      'Les investissements passés peuvent apporter des bénéfices, le remboursement d\'anciennes dettes est possible.';

  @override
  String get tarotWealthDetail20 =>
      'Le moment est venu de récolter les fruits des efforts passés. Des actions oubliées peuvent augmenter de prix, ou l\'on vous remboursera une dette sur laquelle vous ne comptiez plus. Une chance inattendue ou une opportunité de relancer avec succès une ancienne idée est possible. La décision que vous prendrez maintenant aura un grand impact.';

  @override
  String get tarotSuccessMeaning20 =>
      'Vos travaux passés seront reconnus, des promotions ou des récompenses sont possibles.';

  @override
  String get tarotSuccessDetail20 =>
      'Le jour du jugement est arrivé. Vos efforts passés ont enfin reçu une évaluation digne et une récompense, et les bonnes nouvelles, comme le son de la trompette, ne se feront pas attendre. Des offres d\'emploi avantageuses ou l\'opportunie de sortir de la stagnation sont possibles. Ne craignez pas les changements : saisissez l\'opportunité.';

  @override
  String get tarotKeywords21 =>
      'Achèvement, intégration, accomplissement, fin heureuse, perfection';

  @override
  String get tarotDesc21 =>
      'Symbole de l\'accomplissement total du but et de l\'harmonie idéale après un long voyage. Les quatre bêtes sacrées aux coins bénissent le monde parfait et présagent le début d\'un nouveau cycle.';

  @override
  String get tarotLoveMeaning21 =>
      'Signifie la floraison et la plénitude de l\'amour. Une union avec le partenaire idéal et des moments de vrai bonheur vous attendent.';

  @override
  String get tarotLoveDetail21 =>
      'Le moment est idéal pour mettre un point final à une longue relation et passer à un nouveau niveau, par exemple se marier. Vous vous assurerez que vous êtes les meilleurs partenaires l\'un pour l\'autre. Si vous êtes célibataire, vous rencontrerez une personne qui correspond totalement à vos idéaux. Il est possible de rencontrer quelqu\'un lors d\'un voyage.';

  @override
  String get tarotWealthMeaning21 =>
      'Vous atteindrez l\'objectif financier fixé et obtiendrez la liberté économique.';

  @override
  String get tarotWealthDetail21 =>
      'Vous avez atteint à 100 % vos objectifs d\'argent et êtes arrivé au niveau de liberté financière. De grands bénéfices de la coopération internationale ou des investissements sur les marchés mondiaux sont possibles. Votre portefeuille est équilibré. Profitez de l\'abondance et commencez à élargir vos horizons.';

  @override
  String get tarotSuccessMeaning21 =>
      'Le projet sera achevé avec succès et vous recevrez la reconnaissance maximale.';

  @override
  String get tarotSuccessDetail21 =>
      'Vous avez atteint le sommet de votre carrière. Le projet assigné se terminera par un succès brillant et vous recevrez les éloges mérités. Tous les objectifs fixés ont été atteints et il est temps de se préparer à sortir sur la scène mondiale. Des opportunités pour étudier ou travailler à l\'étranger s\'ouvrent.';

  @override
  String get supplementRecordPrompt =>
      'Veuillez prendre vos compléments et les enregistrer !';

  @override
  String get snoozeQuestion => 'Quand dois-je vous le rappeler à nouveau ?';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'm';

  @override
  String get after => 'après';

  @override
  String snoozeMessage(int minutes) {
    return 'L\'alarme sonnera de nouveau dans $minutes minutes.';
  }

  @override
  String timesTaken(int count) {
    return '$count fois pris';
  }

  @override
  String dailyGoalTimes(int goal) {
    return 'Objectif : $goal fois par jour';
  }

  @override
  String get didYouTakeSupplement => 'Avez-vous pris vos compléments ?';

  @override
  String get viewMissionRecords => 'Voir les enregistrements de mission';

  @override
  String get setTakingGoal => 'Définir l\'objectif de prise';

  @override
  String get times => 'fois';

  @override
  String get dailyTakingGoal => 'Objectif de prise quotidien';

  @override
  String get howManyTimesADay =>
      'Combien de fois par jour prenez-vous des compléments ?';

  @override
  String get setGoalMl => 'Définir l\'objectif (ml)';

  @override
  String get sleepAnalysis => 'Analyse du sommeil';

  @override
  String get todaysSleep => 'Sommeil d\'aujourd\'hui';

  @override
  String get sleepDuration => 'Durée du sommeil';

  @override
  String get wakeUpTime => 'Heure de réveil';

  @override
  String get weeklySleepPattern => 'Modèle de sommeil hebdomadaire';

  @override
  String get sleepAdvice =>
      'Vous maintenez une habitude de sommeil régulière. Vous vous êtes couché 30 minutes plus tôt qu\'hier !';

  @override
  String get stopwatch => 'Chronomètre';

  @override
  String get lap => 'Tour';

  @override
  String get stop => 'Arrêt';

  @override
  String lapLabel(int index) {
    return 'Tour $index';
  }

  @override
  String get monday => 'Lun';

  @override
  String get tuesday => 'Mar';

  @override
  String get wednesday => 'Mer';

  @override
  String get thursday => 'Jeu';

  @override
  String get friday => 'Ven';

  @override
  String get saturday => 'Sam';

  @override
  String get sunday => 'Dim';

  @override
  String get policy => 'Conditions et Confidentialité';

  @override
  String get support => 'Assistance';

  @override
  String get defaultAlarmBehavior => 'Comportement d\'alarme par défaut';

  @override
  String get defaultAlarmVolume => 'Volume d\'alarme par défaut';

  @override
  String get defaultAlarmVolumeDescription =>
      'Le volume par défaut appliqué lors de la création d\'une nouvelle alarme.';

  @override
  String get gradualVolumeDescription =>
      'Règle le son de l\'alarme pour qu\'il augmente progressivement.';

  @override
  String get defaultVibration => 'Vibration par défaut';

  @override
  String get defaultVibrationDescription =>
      'Active la vibration par défaut lors de la création d\'une nouvelle alarme.';

  @override
  String get defaultInterval => 'Intervalle par défaut';

  @override
  String get maxSnoozeCountLabel => 'Nombre max de répétitions';

  @override
  String get minutes => 'min';

  @override
  String cupsCount(int current, int goal) {
    return '($current/$goal tasses)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current/$goal fois)';
  }

  @override
  String get missionGym => 'Aller à la salle de sport';

  @override
  String get missionWorkout => 'Entraînement à la maison';

  @override
  String get missionDiary => 'Écrire un journal';

  @override
  String get missionBedMaking => 'Faire le lit';

  @override
  String get missionStretching => 'Étirements';

  @override
  String get missionReading => 'Lecture 10min';

  @override
  String get missionPlanning => 'Planifier la journée';

  @override
  String get missionBreakfast => 'Manger le petit déjeuner';

  @override
  String get missionMeditation => 'Méditation 5min';

  @override
  String get missionLearnWords => 'Apprendre 5 mots';

  @override
  String get missionVentilation => 'Aération';

  @override
  String get missionCleaning => 'Nettoyer la chambre';

  @override
  String get missionGratitudeDiary => 'Journal de gratitude';

  @override
  String get faqQuestion1 => 'Les alarmes ne sonnent pas.';

  @override
  String get faqAnswer1 =>
      'Les alarmes peuvent être retardées ou bloquées en raison de la fonction d\'optimisation de la batterie du système Android. Veuillez définir toutes les permissions sur \'Autoriser\' dans le menu Paramètres > Optimisation de l\'alarme.';

  @override
  String get faqQuestion2 => 'Je veux changer la mission.';

  @override
  String get faqAnswer2 =>
      'Vous pouvez la changer pour la mission que vous souhaitez (Maths, Photo, Secouer, etc.) dans le menu de sélection de mission après avoir appuyé sur l\'alarme que vous souhaitez modifier dans la liste des alarmes.';

  @override
  String get faqQuestion3 => 'Comment régler le mode sombre ?';

  @override
  String get faqAnswer3 =>
      'Vous pouvez changer le thème de l\'écran via le bouton Paramètres > Général > Mode Sombre.';

  @override
  String get faqQuestion4 => 'Comment collecter des Fortune Cookies ?';

  @override
  String get faqAnswer4 =>
      'Vous pouvez gagner des Fortune Cookies chaque fois que vous éteignez une alarme le matin ou terminez une mission. Vérifiez votre fortune quotidienne avec les cookies que vous avez collectés !';

  @override
  String get faqQuestion5 =>
      'Mes données disparaîtront-elles si je supprime l\'application ?';

  @override
  String get faqAnswer5 =>
      'Oui, Fortune Alarm stocke les données à l\'intérieur de l\'appareil, donc la suppression de l\'application supprimera toutes vos alarmes définies et enregistrements de missions. Soyez prudent.';

  @override
  String get noticeLabel => 'Avis';

  @override
  String get notice1Title => 'Lancement officiel de Fortune Alarm';

  @override
  String get notice1Content =>
      'Bonjour. Fortune Alarm a été officiellement lancé.\\n\\nVérifiez votre fortune quotidienne avec votre alarme chaque matin et commencez une journée heureuse !\\nNous continuerons à fournir des fonctionnalités plus diverses et des services améliorés.\\n\\nMerci.';

  @override
  String get notice2Title => 'Nouvelles de la mise à jour version 1.0.0';

  @override
  String get notice2Content =>
      'Voici le contenu de la mise à jour version 1.0.0.\\n\\n1. Amélioration de l\'interface utilisateur de la mission complémentaire\\n2. Intégration des paramètres système pour des alarmes précises\\n3. Prise en charge du mode sombre\\n4. Corrections de bugs et améliorations de la stabilité\\n\\nDécouvrez la dernière version maintenant !';

  @override
  String get notice3Title => 'Avis de révision des conditions d\'utilisation';

  @override
  String get notice3Content =>
      'Les conditions d\'utilisation ont été révisées.\\n\\nRévisions clés :\\n- Politique de confidentialité renforcée\\n- Portée de l\'utilisation du service spécifiée\\n\\nLes détails peuvent être trouvés sur la page Paramètres > Conditions.';

  @override
  String get notice4Title => 'Mise à jour version 1.1.1';

  @override
  String get notice4Content =>
      'Contenu de la mise à jour 1.1.1 :\\n\\n1. Interface d\'optimisation de la batterie améliorée\\n2. Mise en page du texte anglais optimisée\\n3. Stabilité du système publicitaire renforcée\\n4. Améliorations de la performance et stabilité de l\'app\\n\\nMettez à jour dès maintenant pour une meilleure expérience !';

  @override
  String get supportContentTitle => 'Contenu de la demande';

  @override
  String get supportHint => 'Veuillez entrer le contenu.';

  @override
  String get supportRecipient => 'Destinataire (Support Client)';

  @override
  String get emailCopied => 'Adresse e-mail copiée.';

  @override
  String get copyTooltip => 'Copier';

  @override
  String get supportWorkingDays =>
      'Nous essaierons de répondre dans les 24 heures les jours ouvrables.';

  @override
  String get supportEmptyError => 'Veuillez entrer le contenu.';

  @override
  String get supportSubjectPrefix => 'Titre de la demande';

  @override
  String get supportContentPrefix => 'Contenu de la demande';

  @override
  String get supportCopySuccessTitle => 'Demande copiée';

  @override
  String supportCopySuccessMessage(String email) {
    return 'Le contenu de la demande a été copié dans le presse-papiers.\\nVoulez-vous envoyer un e-mail à $email ?';
  }

  @override
  String get selectionComplete => 'Sélection terminée';

  @override
  String get selectVibration => 'Sélectionner le modèle de vibration';

  @override
  String get cameraMissionSequentialImageError =>
      'Veuillez définir les images de mission dans l\'ordre.';

  @override
  String get copyEmailAction => 'Copier l\'adresse e-mail';

  @override
  String get addMissionTitle => 'Ajouter une nouvelle mission';

  @override
  String get recommendedMissionList => 'Missions recommandées';

  @override
  String get recommendedMissionDesc =>
      'Missions recommandées pour une journée saine.';

  @override
  String get all => 'Tout';

  @override
  String get allMissions => 'Toutes les missions';

  @override
  String categoryMissions(String category) {
    return 'Missions $category';
  }

  @override
  String get deselectAll => 'Tout désélectionner';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get myCustomMissions => 'Mes missions personnalisées';

  @override
  String get myCustomMissionsDesc =>
      'Ajouter des missions que vous avez créées auparavant.';

  @override
  String get createYourOwnMission => 'Créer votre propre mission';

  @override
  String get createYourOwnMissionDesc =>
      'Créez une mission si vous ne trouvez pas ce que vous cherchez.';

  @override
  String get missionNameHint =>
      'Entrez le nom de la mission (ex: Aller à la salle)';

  @override
  String get selectCategory => 'Sélectionner une catégorie';

  @override
  String get getNotification => 'Recevoir une notification';

  @override
  String get missionCategoryHealth => 'Santé';

  @override
  String get missionCategoryStudy => 'Études';

  @override
  String get missionCategoryRoutine => 'Routine';

  @override
  String get missionCategoryHobby => 'Loisir';

  @override
  String get missionCategoryOther => 'Autre';

  @override
  String get copyEmailSuccessMessage =>
      'Adresse e-mail copiée. Veuillez la coller dans votre application de messagerie.';

  @override
  String get supportSubmitButton => 'Copier la demande et envoyer';

  @override
  String get shakePhone => 'Veuillez secouer votre téléphone !';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get fortuneCheckButton => 'Vérifier la fortune';

  @override
  String get fortuneSelectCards => 'Sélectionnez 3 cartes';

  @override
  String get fortuneDragCards => 'Faites glisser et sélectionnez 3 cartes';

  @override
  String get fortuneDetailTitle => 'Interprétation Détaillée';

  @override
  String get labelFineDust => 'Poussière fine';

  @override
  String get labelUltraFineDust => 'Poussière ultra-fine';

  @override
  String get weatherToday => 'Météo d\'aujourd\'hui';

  @override
  String get weatherUpdateMessage =>
      'Mise à jour des informations météo pour l\'emplacement actuel.';

  @override
  String get weatherDisclaimer =>
      'Les données observées peuvent varier en fonction des conditions locales ou de l\'état de réception.';

  @override
  String get weatherSource =>
      'Données météo fournies par des services de confiance';

  @override
  String get locationPermissionTitle =>
      'Autoriser la permission de localisation';

  @override
  String get locationPermissionDesc =>
      'Requis pour afficher les informations météo.';

  @override
  String get hourlyForecast => 'Prévisions horaires';

  @override
  String get weeklyForecast => 'Prévisions hebdomadaires';

  @override
  String hourFormat(String hour) {
    return '${hour}h';
  }

  @override
  String get noNotifications => 'Aucune nouvelle notification.';

  @override
  String get adLoadFailed => 'Échec du chargement de la publicité';

  @override
  String get adLoading => 'Chargement de la publicité...';

  @override
  String get removeAds => 'Supprimer les publicités';

  @override
  String get close => 'Fermer';

  @override
  String get exitQuestion => 'Voulez-vous quitter ?';

  @override
  String get exitApp => 'Quitter';

  @override
  String get shareResultDescription =>
      'Ceci est votre résultat de fortune analysé par Fortune Alarm.';

  @override
  String get shareResultButton => 'Partager le résultat';

  @override
  String get unknownTime => 'Heure inconnue';

  @override
  String get adLoadError =>
      'Impossible de charger la publicité. Veuillez réessayer dans un instant.';

  @override
  String get adShowError =>
      'Impossible d\'afficher la publicité. Veuillez réessayer dans un instant.';

  @override
  String earnCookies(int count) {
    return 'Vous avez gagné $count fortune cookies ! 🎉';
  }

  @override
  String get freePassAfterTimeout =>
      'Affichage des résultats gratuitement sans publicité ! 🎉';

  @override
  String get adLoadDelay =>
      'Le chargement est retardé.\nVeuillez réessayer dans un instant.';

  @override
  String get fortuneAccessTitle => 'Vérifier la fortune';

  @override
  String get fortuneAccessSubtitle =>
      'Vérifiez vos résultats de fortune\net obtenez des cadeaux cachés !';

  @override
  String get watchAdButtonText => 'Regarder la pub pour des résultats gratuits';

  @override
  String useCookiesButtonText(int count) {
    return 'Utiliser $count Fortune Cookies';
  }

  @override
  String get adFailFreePass =>
      'Impossible de charger la publicité, nous vous laissons passer gratuitement cette fois.';

  @override
  String get luckyNumberTitle => 'Mes Numéros Chance';

  @override
  String get luckyNumberSubtitle => 'Numéros chance spéciaux générés par l\'IA';

  @override
  String get luckyNumberGenerateButton => 'Générer des Numéros Chance';

  @override
  String get luckyNumberGuideText =>
      'Découvrez vos propres numéros chance\ngrâce à l\'algorithme IA de Fortune Alarm';

  @override
  String get luckyNumberAnalysisStep1 => 'Collecte des données de chance...';

  @override
  String get luckyNumberAnalysisStep2 =>
      'Analyse des modèles de numéros récents...';

  @override
  String get luckyNumberAnalysisStep3 =>
      'Analyse de l\'énergie pour chaque numéro...';

  @override
  String get luckyNumberAnalysisStep4 =>
      'Apprentissage des modèles géométriques...';

  @override
  String get luckyNumberAnalysisStep5 =>
      'Application des poids du modèle de prédiction IA...';

  @override
  String get luckyNumberAnalysisStep6 =>
      'Calcul de la combinaison chance optimale...';

  @override
  String get luckyNumberAnalysisStep7 =>
      'Analyse terminée ! Génération des numéros chance';

  @override
  String get luckyNumberAnalysisFinal => 'Traitement des données finales...';

  @override
  String get luckyNumberAnalyzing => 'Analyse de l\'énergie...';

  @override
  String get luckyNumberGeometric => 'Analyse géométrique...';

  @override
  String get luckyNumberPatterns => 'Correspondance des motifs...';

  @override
  String get luckyNumberEnergy => 'Harmonisation de l\'énergie...';

  @override
  String get luckyNumberCompleted => 'Analyse terminée !';

  @override
  String get luckyNumberShare => 'Partager les résultats';

  @override
  String get luckyNumberRestart => 'Réessayer';

  @override
  String get luckyNumberGenerating => 'Génération des numéros de la chance...';

  @override
  String get luckyNumberResultTitle => 'Génération des numéros chance terminée';

  @override
  String get luckyNumberResultSubtitle => '6 numéros + numéro bonus';

  @override
  String get luckyNumberDisclaimer =>
      '* Ce service est à des fins de divertissement. Les numéros fournis sont à titre de référence générés par des algorithmes d\'IA et ne garantissent pas un gain.';

  @override
  String get luckyNumberShareTitle => 'Numéros Chance d\'Aujourd\'hui';

  @override
  String get luckyNumberShareDescription =>
      'Numéros chance analysés par Fortune Alarm.';

  @override
  String luckyNumberSetLabel(String label) {
    return 'Set $label';
  }

  @override
  String get luckyNumberRegenerateButton => 'Régénérer les numéros';

  @override
  String get luckyNumberFeatureAiTitle => 'Recommandation IA';

  @override
  String get luckyNumberFeatureAiDesc => 'Algoritme Intelligent';

  @override
  String get luckyNumberFeatureSmartTitle => 'Intelligent';

  @override
  String get luckyNumberFeatureSmartDesc => 'Recommandation de Numéros Chance';

  @override
  String get luckyNumberFeatureDataTitle => 'Analyse de Données';

  @override
  String get luckyNumberFeatureDataDesc => 'Combinaison optimale';

  @override
  String get fortunePassTitle => 'Fortune Pass';

  @override
  String get fortunePassTabFree => 'Recharge Gratuite';

  @override
  String get fortunePassTabPremium => 'Pass Premium';

  @override
  String get fortunePassFreeChargeTitle => 'Recharger des cookies gratuitement';

  @override
  String get fortunePassFreeChargeButton =>
      'Regarder une pub et obtenir 1 cookie';

  @override
  String get fortunePassActivePlan => 'Plan Actuel';

  @override
  String get fortunePassNoSubscription => 'Aucun abonnement actif';

  @override
  String get fortunePassRestore => 'Restaurer';

  @override
  String get fortunePassMonth1Title => 'Pass 1 Mois';

  @override
  String get fortunePassMonth1Desc =>
      'Débloquez toutes les fonctionnalités pendant 1 mois';

  @override
  String get fortunePassMonth6Title => 'Pass 6 Mois';

  @override
  String get fortunePassMonth6Desc => 'Abonnement de 6 mois à prix réduit';

  @override
  String get fortunePassYear1Title => 'Pass 1 An';

  @override
  String get fortunePassYear1Desc => 'Meilleure valeur pour une année entière';

  @override
  String get fortunePassBestPlan => 'Plan le plus populaire';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return 'Offre éclair de $percent% !';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% de RÉDUCTION';
  }

  @override
  String get fortunePassPerMonth => ' /mois';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return 'Total $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => 'Mois';

  @override
  String get fortunePassUnit6Months => '6 Mois';

  @override
  String get fortunePassUnitYear => 'An';

  @override
  String get fortunePassMyCookies => 'Mes Cookies';

  @override
  String get fortunePassCurrentStatus => 'Statut du Pass';

  @override
  String get fortunePassStatusPremium => 'Pass Premium Actif';

  @override
  String get fortunePassStatusFree => 'Utilisateur Standard';

  @override
  String get fortunePassStoreErrorTitle => 'Abonnement non disponible';

  @override
  String get fortunePassStoreErrorContent =>
      'Impossible de récupérer les informations sur les produits du magasin pour le moment.';

  @override
  String fortunePassSubscribeSale(int percent) {
    return 'S\'abonner avec $percent% de réduction';
  }

  @override
  String get fortunePassSubscribeNow => 'S\'abonner maintenant';

  @override
  String get fortunePassApplied => 'Abonnement Fortune Pass appliqué.';

  @override
  String get fortunePassApplyFailed =>
      'Échec de l\'application de l\'abonnement.';

  @override
  String get fortunePassRestored => 'Historique des achats restauré.';

  @override
  String get fortunePassRestoreFailed =>
      'Échec de la restauration de l\'historique des achats.';

  @override
  String get fortunePassTimeSaleTitle => 'Attendez ! Un cadeau est arrivé 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return 'Prix original $price/an';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '$price/an';
  }

  @override
  String get fortunePassTimeSaleBadge =>
      '50% de réduction si vous vous abonnez dans les 3 minutes !';

  @override
  String get fortunePassTimeSaleButton =>
      'Obtenir la réduction et commencer Pro';

  @override
  String get fortunePassTimeSaleCancel => 'Peut-être plus tard';

  @override
  String get fortunePassTimeSaleStartMessage =>
      'La réduction de 3 minutes a commencé ! Vérifiez la bannière en haut.';

  @override
  String get fortunePassSubscribeButton => 'S\'abonner maintenant';

  @override
  String get fortunePassSubscribeDiscountButton =>
      'S\'abonner avec 50% de réduction';

  @override
  String get fortunePassCookieBalance => 'Vos Cookies de Fortune';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'Pass Actif';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return 'Total $price / $unit';
  }

  @override
  String get fortunePassPopularPlan => 'Plan Populaire';

  @override
  String get fortunePassPricePerMonth => ' /mois';

  @override
  String get fortunePassPaymentFailed => 'La demande de paiement a échoué.';

  @override
  String get fortunePassSubscriptionFailed =>
      'Échec de l\'application de l\'abonnement. Veuillez vérifier votre réseau.';

  @override
  String get fortunePassSubscriptionSuccess =>
      'L\'abonnement Fortune Pass a été appliqué.';

  @override
  String get fortunePassCannotSubscribeTitle => 'Impossible de s\'abonner';

  @override
  String get fortunePassCannotSubscribeMessage =>
      'Impossible de récupérer les informations sur les produits du magasin pour le moment.\n\n[Liste de vérification]\n1. État de connexion Google Play / App Store\n2. Connexion Internet\n3. État d\'enregistrement de l\'appareil de test';

  @override
  String get year => 'Année';

  @override
  String get month => 'Mois';

  @override
  String get day => 'Jour';

  @override
  String get sajuProfileTitle =>
      'Modifier le profil principal des Quatre Piliers du Destin';

  @override
  String get sajuNameLabel => 'Nom';

  @override
  String get sajuNameHint => 'Veuillez entrer votre nom';

  @override
  String get sajuNameHelper => 'Jusqu\'à 6 caractères';

  @override
  String get sajuGenderLabel => 'Genre';

  @override
  String get sajuGenderMale => 'Homme';

  @override
  String get sajuGenderFemale => 'Femme';

  @override
  String get sajuBirthDateLabel => 'Date de naissance';

  @override
  String get sajuBirthTimeLabel => 'Heure de naissance';

  @override
  String get sajuUnknownTime => 'Heure inconnue';

  @override
  String get sajuEditComplete => 'Modification terminée';

  @override
  String get sajuSolar => 'Solaire';

  @override
  String get sajuLunar => 'Lunaire';

  @override
  String get sajuSelectBirthDate => 'Sélectionner la date de naissance';

  @override
  String get sajuSelectBirthTime => 'Sélectionner l\'heure de naissance';

  @override
  String get compatibilityTitle => 'Vérifier la compatibilité';

  @override
  String get compatibilityInputHeader =>
      'Veuillez entrer les informations pour les deux';

  @override
  String get compatibilityInputSubtitle =>
      'Nous analyserons la compatibilité exacte basée sur les informations des Quatre Piliers du Destin.';

  @override
  String get compatibilityMyInfo => 'Mes informations';

  @override
  String get compatibilityInputMyNameGuide => 'Veuillez entrer votre nom.';

  @override
  String get compatibilityInputPartnerNameGuide =>
      'Veuillez entrer le nom du partenaire.';

  @override
  String get compatibilityPartnerInfo => 'Informations du partenaire';

  @override
  String get compatibilityLoadSaved => 'Charger les infos enregistrées';

  @override
  String get compatibilityTitleBest => 'Un match parfait ! ❤️';

  @override
  String get compatibilityDescBest =>
      'La meilleure compatibilité que vous puissiez demander. Ne vous lâchez pas !';

  @override
  String get compatibilityDescBest_Youth =>
      'Vous êtes les meilleurs partenaires pour un amour frais et passionné. C\'est beau de vous voir soutenir les rêves de l\'autre et grandir ensemble ! Vous formez une relation qui s\'apporte une stimulation positive en partageant vos préoccupations sur vos études ou votre carrière. Si vous vous chérissez et prenez soin l\'un de l\'autre comme vous le faites maintenant, vous êtes un couple idéal capable de surmonter toutes les épreuves ensemble.';

  @override
  String get compatibilityDescBest_Mature =>
      'Vous êtes des partenaires idéaux qui s\'apportent stabilité et force mutuelle. C\'est une relation mature où vous avez confiance dans les valeurs de l\'autre et construisez un avenir ensemble. Vous comprenez profondément les objectifs de vie de chacun et êtes les meilleurs soutiens l\'un pour l\'autre. Avec la confiance mutuelle comme base, vous pouvez mener une vie commune heureuse et prospère.';

  @override
  String get compatibilityDescBest_Senior =>
      'Vous êtes de merveilleux compagnons qui passent leurs années dorées ensemble avec chaleur. C\'est une relation profonde où vous respectez la sagesse de l\'autre et vous apportez un soutien émotionnel mutuel. Vous êtes des partenaires qui partagent les petites joies du quotidien et prennent soin de la santé de l\'autre. Vous formez une union précieuse qui mène une vie paisible et heureuse, pleine de souvenirs partagés.';

  @override
  String get compatibilityTitleGreat => 'Une très bonne relation 💕';

  @override
  String get compatibilityDescGreat =>
      'Un excellent partenaire qui est un grand soutien mutuel.';

  @override
  String get compatibilityDescGreat_Youth =>
      'C\'est une relation pleine d\'énergie et d\'excitation. Vous avez des intérêts et des valeurs similaires, ce qui vous permet de profiter de beaucoup de temps ensemble. Vous êtes un couple qui grandit ensemble en se motivant mutuellement. Si vous surmontez les petites différences con compréhension, vous pourrez développer un amour encore plus profond.';

  @override
  String get compatibilityDescGreat_Mature =>
      'Vous êtes un couple avec une très grande affinité en termes de style de vie et de valeurs. Vous respectez le travail et l\'espace social de l\'autre tout en offrant un solide soutien émotionnel. C\'est une relation stable qui résout les problèmes ensemble et planifie un avenir solide. Si vous maintenez la communication, vous aurez une relation que les autres envieront.';

  @override
  String get compatibilityDescGreat_Senior =>
      'Vous êtes des partenaires qui s\'apportent réconfort et tranquillité dans la vie. Vous partagez les loisirs de l\'autre et profitez d\'un temps relaxant ensemble. C\'est une relation où vous valorisez les expériences de vie de l\'autre et vous soutenez mutuellement. Si vous prenez soin l\'un de l\'autre et restez attentifs à la santé de chacun, vous passerez des années dorées très stables et heureuses.';

  @override
  String get compatibilityTitleGood => 'Un couple qui s\'entend bien 😊';

  @override
  String get compatibilityDescGood =>
      'Il y a quelques différences, mais vous pouvez avoir un bel amour en vous adaptant l\'un à l\'autre.';

  @override
  String get compatibilityDescGood_Youth =>
      'Vous êtes un couple qui construit un bel amour grâce à une adaptation mutuelle. Bien qu\'il puisse y avoir des différences de personnalité, vous pouvez avoir une bonne relation si vous faites des efforts pour vous comprendre. Il est important de respecter l\'individualité de l\'autre et de trouver des points communs à travers des conversations honnêtes.';

  @override
  String get compatibilityDescGood_Mature =>
      'Vous formez une relation qui reste stable grâce à la considération et aux efforts mutuels. Il peut y avoir des situations où vous différez sur des problèmes pratiques ou des décisions de vie, mais vous pouvez les résoudre par le dialogue. Si vous vous concentrez sur les forces de l\'autre et vous soutenez mutuellement, vous serez un couple solide.';

  @override
  String get compatibilityDescGood_Senior =>
      'Vous êtes des compagnons qui mènent une vie paisible tout en s\'adaptant au rythme de l\'autre. Il est important de respecter les habitudes de vie de l\'autre et de construire une intimité à travers de petites conversations quotidiennes. Si vous veillez sur la santé de l\'autre et vous soutenez mutuellement, vous profiterez d\'une relation confortable.';

  @override
  String get compatibilityTitleEffort => 'Des efforts sont nécessaires 🧐';

  @override
  String get compatibilityDescEffort =>
      'Il y a beaucoup de différences. La compréhension et la considération sont les clés de la relation.';

  @override
  String get compatibilityDescEffort_Youth =>
      'Vous êtes un couple qui doit grandir ensemble à travers de nombreuses conversations et de la compréhension. Des désaccords fréquents peuvent survenir en raison de personnalités différentes, mais si vous voyez cela comme un processus pour apprendre à vous connaître, vous pourrez vous développer. Il est important de comprendre le point de vue de l\'autre plutôt que d\'imposer son propre avis.';

  @override
  String get compatibilityDescEffort_Mature =>
      'C\'est une relation qui demande beaucoup de patience et d\'adaptation car les styles de vie peuvent être différents. Il peut y avoir des frictions sur des questions pratiques, il est donc important d\'établir des règles claires et de se respecter mutuellement. Si vous vous efforcez de voir les différences non pas comme un conflit mais comme un complément, vous pourrez maintenir la relation.';

  @override
  String get compatibilityDescEffort_Senior =>
      'Vous êtes des partenaires qui doivent se laisser de l\'espace mutuellement et s\'efforcer de comprendre les habitudes de vie de l\'autre. Il est important d\'accepter les habitudes ancrées depuis longtemps plutôt que d\'essayer de les changer. Si vous vous concentrez sur des intérêts communs et vous soutenez émotionnellement, vous pourrez mener une relation stable.';

  @override
  String get compatibilityTitleDifficult =>
      'Nécessite beaucoup d\'ajustements 😅';

  @override
  String get compatibilityDescDifficult =>
      'Les différences de personnalité peuvent être importantes. Vous devez comprendre profondément les différences de l\'autre.';

  @override
  String get compatibilityDescDifficult_Youth =>
      'Les différences de personnalité peuvent être importantes, ce qui peut mener à des conflits fréquents. C\'est une relation qui demande un amour profond et la volonté de changer pour l\'autre. Plutôt que d\'essayer de contrôler l\'autre, il est important d\'accepter son individualité telle qu\'elle est et de trouver un terrain d\'entente par un dialogue continu.';

  @override
  String get compatibilityDescDifficult_Mature =>
      'Comme les valeurs et les objectifs de vie peuvent être très différents, beaucoup d\'efforts sont nécessaires pour trouver une direction commune. Il peut être difficile de trouver des compromis sur des décisions de vie importantes, une communication très honnête et profonde est donc essentielle. Si vous voyez les différences de l\'autre comme une opportunité de croissance personnelle, vous pourrez surmonter les difficultés.';

  @override
  String get compatibilityDescDifficult_Senior =>
      'Il est important de reconnaître les différences dans les modes de vie que chacun a développés au fil du temps et de respecter l\'espace personnel de l\'autre. Plutôt que d\'essayer de conformer le partenaire à ses propres idées, il est préférable de construire une relation où l\'on s\'accepte mutuellement tel que l\'on est. Cela demande beaucoup de patience et de compréhension pour trouver la paix ensemble.';

  @override
  String get compatibilityAdvice_Youth =>
      'Essayez de voir le monde du point de vue de votre partenaire. De petites surprises et des paroles de soutien sincères peuvent renforcer votre relation. Planifiez des activités ensemble qui vous passionnent tous les deux et créez de beaux souvenirs.';

  @override
  String get compatibilityAdvice_Mature =>
      'Une communication honnête sur vos objectifs et vos attentes est la clé. Soutenez-vous mutuellement dans votre développement professionnel, mais n\'oubliez pas de consacrer du temps à votre relation. Une planification financière commune et une vision de l\'avenir vous apporteront de la sécurité.';

  @override
  String get compatibilityAdvice_Senior =>
      'Prenez soin de votre santé ensemble et profitez de promenades ou de petits voyages. Partagez votre sagesse de vie et construisez un lien émotionnel profond. Créez une atmosphère chaleureuse à la maison où vous vous sentez tous les deux à l\'aise et en sécurité.';

  @override
  String get compatibilityLuck_Youth =>
      'C\'est une phase de chance où votre passion et votre énergie feront briller votre avenir ensemble. Vous aurez de nombreuses occasions de grandir ensemble et de réaliser vos rêves. Votre amour sera perçu comme une force positive par votre entourage.';

  @override
  String get compatibilityLuck_Mature =>
      'C\'est un temps de stabilité et de croissance. Vos efforts conjoints porteront leurs fruits, que ce soit sur le plan financier ou dans la profondeur de votre relation. Vous construisez une base solide pour les années à venir.';

  @override
  String get compatibilityLuck_Senior =>
      'C\'est une chance caractérisée par la tranquillité, la paix et l\'attention mutuelle. Vous êtes comme un baume pour l\'âme de l\'autre. Ce temps est rempli d\'une profonde gratitude et de la joie de partager le voyage de la vie.';

  @override
  String get tarotLoveMeaning0_Senior =>
      'C\'est une période pour trouver de la joie dans de petits changements quotidiens plutôt que dans une nouvelle excitation.';

  @override
  String get tarotLoveDetail0_Senior =>
      'Partagez votre savoir-faire et vos talents accumulés de longue date avec ceux qui vous entourent plutôt que de grands projets. Vous ressentirez une grande récompense et un lien profond en aidant ou en conseillant quelqu\'un.';

  @override
  String get tarotLoveMeaning1_Senior =>
      'Écoutez votre voix intérieure et prenez le temps de vous regarder.';

  @override
  String get tarotLoveDetail1_Senior =>
      'Un moment calme et paisible est nécessaire. Plutôt que d\'être avec beaucoup de monde, méditez seul ou profitez de vos passe-temps pour recharger votre esprit. Cette maturité intérieure sera le fondement d\'une vie plus stable.';

  @override
  String get tarotLoveMeaning2_Senior =>
      'Utilisez votre riche expérience et votre sagesse pour guider ceux qui vous entourent.';

  @override
  String get tarotLoveDetail2_Senior =>
      'Votre jugement calme et votre perspective large seront d\'une grande aide pour de nombreuses personnes. Votre statut et votre influence augmenteront, et vous gagnerez la confiance profonde des gens. Soyez un mentor chaleureux capable d\'embrasser les autres.';

  @override
  String get tarotLoveMeaning3_Senior =>
      'C\'est une période où l\'abondance matérielle et émotionnelle est atteinte en même temps.';

  @override
  String get tarotLoveDetail3_Senior =>
      'Profitez des fruits de votre dur travail. Vous pouvez ressentir la joie de vivre tout en partageant des sentiments chaleureux avec votre famille ou vos connaissances proches. La générosité vous apportera une chance encore plus grande.';

  @override
  String get tarotLoveMeaning4_Senior =>
      'Un sens aigu de la responsabilité et du leadership sont nécessaires.';

  @override
  String get tarotLoveDetail4_Senior =>
      'Organisez votre environnement avec une volonté ferme et menez votre vie avec conviction. Votre présence stable donnera la tranquillité d\'esprit à votre famille et à ceux qui vous entourent. Cependant, n\'oubliez pas d\'avoir un cœur flexible.';

  @override
  String get tarotLoveMeaning5_Senior =>
      'C\'est une période pour suivre les valeurs traditionnelles et rechercher la paix spirituelle.';

  @override
  String get tarotLoveDetail5_Senior =>
      'Trouvez le sens de la vie dans la sagesse ou les enseignements de longue date. Partager vos idées profondes avec la jeune génération apportera une grande récompense. Votre attitude humble et sincère attirera les gens.';

  @override
  String get tarotLoveMeaning6_Senior =>
      'Une relation harmonieuse avec les gens autour de vous est la clé de la chance.';

  @override
  String get tarotLoveDetail6_Senior =>
      'Maintenez une relation équilibrée basée sur le respect mutuel et la compréhension. Une communication profonde avec une personne précieuse sera une grande source de force dans votre vie. C\'est une période pour ressentir à nouveau l\'importance de la camaraderie.';

  @override
  String get tarotLoveMeaning7_Senior =>
      'Agissez hardiment avec un objectif clair en tête.';

  @override
  String get tarotLoveDetail7_Senior =>
      'Même si vous êtes à un âge avancé, votre passion est toujours belle. S\'il y a quelque chose que vous voulez accomplir, poursuivez-le avec courage. Votre attitude proactive insufflera une nouvelle vitalité dans votre vie quotidienne.';

  @override
  String get tarotLoveMeaning8_Senior =>
      'Une perspective juste et équilibrée est nécessaire.';

  @override
  String get tarotLoveDetail8_Senior =>
      'Gérez les choses calmement et logiquement. En cas de conflit ou de choix, suivre votre conscience apportera les meilleurs résultats. Votre intégrité vous vaudra le respect de ceux qui vous entourent.';

  @override
  String get tarotLoveMeaning9_Senior =>
      'C\'est une période pour regarder calmement votre vie et trouver la vérité intérieure.';

  @override
  String get tarotLoveDetail9_Senior =>
      'Tenez-vous à l\'écart de l\'agitation et prenez du temps pour vous. Dans le silence, vous trouverez un nouveau sens à la vie et obtiendrez une croissance spirituelle. C\'est un moment précieux pour l\'autoréflexion.';

  @override
  String get tarotLoveMeaning10_Senior =>
      'Acceptez naturellement le flux de la vie et attendez une nouvelle opportunité.';

  @override
  String get tarotLoveDetail10_Senior =>
      'La vie a ses hauts et ses bas. Même si les choses ne se passent pas comme prévu, ne soyez pas déçu et attendez le bon moment. Un changement positif viendra bientôt, alors ayez l\'esprit détendu.';

  @override
  String get tarotLoveMeaning11_Senior =>
      'Contrôlez votre esprit avec force intérieure et patience.';

  @override
  String get tarotLoveDetail11_Senior =>
      'Le pouvoir de gérer des situations difficiles avec un cœur chaleureux plutôt que par la force est nécessaire. Votre douceur et votre tolérance auront le pouvoir de toucher le cœur des autres. Faites confiance à votre force intérieure.';

  @override
  String get tarotLoveMeaning12_Senior =>
      'C\'est un moment où une nouvelle perspective et un sacrifice sont nécessaires.';

  @override
  String get tarotLoveDetail12_Senior =>
      'Essayez de regarder le monde sous un angle différent. Même si les choses semblent s\'arrêter pour un moment, c\'est un processus de préparation pour un plus grand saut. La patience et un cœur dévoué apporteront des fruits précieux.';

  @override
  String get tarotLoveMeaning13_Senior =>
      'L\'ancien se termine et un nouveau départ approche.';

  @override
  String get tarotLoveDetail13_Senior =>
      'Lâchez le passé et préparez-vous pour un nouveau chapitre de votre vie. Le changement peut être inhabituel, mais c\'est un processus essentiel pour la croissance. Si vous acceptez le flux du changement avec un cœur léger, une nouvelle chance viendra.';

  @override
  String get tarotLoveMeaning14_Senior =>
      'L\'équilibre et la modération sont les valeurs les plus importantes.';

  @override
  String get tarotLoveDetail14_Senior =>
      'Évitez les excès en tout et maintenez un juste milieu. La tranquillité d\'esprit et un mode de vie sain vous apporteront de la stabilité. Maintenez une vie quotidienne harmonieuse en combinant bien différents éléments.';

  @override
  String get tarotLoveMeaning15_Senior =>
      'Faites attention à l\'avidité excessive ou à l\'obsession.';

  @override
  String get tarotLoveDetail15_Senior =>
      'Regardez en arrière pour voir si vous êtes lié par des choses matérielles ou de vieilles habitudes. Lâcher prise vous fera vous sentir libre. Si vous trouvez votre vrai moi loin de la tentation, votre chance s\'améliorera.';

  @override
  String get tarotLoveMeaning16_Senior =>
      'Un changement soudain peut être une opportunité pour un nouveau saut.';

  @override
  String get tarotLoveDetail16_Senior =>
      'Même si un événement inattendu se produit, ne soyez pas troublé et acceptez-le comme un processus de rupture de l\'ancien cadre. Après la crise, une base plus forte et plus solide sera préparée. Ayez la sagesse de surmonter les difficultés.';

  @override
  String get tarotLoveMeaning17_Senior =>
      'Un moment où l\'espoir et la lumière remplissent votre vie.';

  @override
  String get tarotLoveDetail17_Senior =>
      'Regardez vers l\'avenir avec un esprit positif. Vos rêves et vos souhaits se réalisent progressivement. Partager votre énergie lumineuse avec ceux qui vous entourent apportera un bonheur encore plus grand.';

  @override
  String get tarotLoveMeaning18_Senior =>
      'Ne soyez pas anxieux face à l\'incertitude et faites confiance à votre intuition.';

  @override
  String get tarotLoveDetail18_Senior =>
      'Même si l\'avenir semble incertain, il n\'y a pas lieu de s\'inquiéter à l\'avance. Écoutez votre voix intérieure et avancez lentement. Avec le temps, le brouillard se dissipera et un chemin clair apparaîtra.';

  @override
  String get tarotLoveMeaning19_Senior =>
      'C\'est un moment pour profiter pleinement de la joie et de la vitalité de la vie.';

  @override
  String get tarotLoveDetail19_Senior =>
      'Profitez de chaque jour avec un cœur brillant et positif comme le soleil. Votre présence elle-même sera une grande force pour votre famille et vos voisins. Soyez reconnaissant pour les petits bonheurs de la vie quotidienne et vivez une vie vibrante.';

  @override
  String get tarotLoveMeaning20_Senior =>
      'Un moment où les résultats de vos efforts passés sont récompensés.';

  @override
  String get tarotLoveDetail20_Senior =>
      'Le temps de la récolte est venu. Votre vie sincère a porté ses fruits, et vous recevrez reconnaissance et éloges de la part de ceux qui vous entourent. Acceptez ce résultat avec un cœur reconnaissant et préparez-vous pour un nouveau voyage.';

  @override
  String get tarotLoveMeaning21_Senior =>
      'Profitez du plaisir de la vie quotidienne avec un cœur libre et pur.';

  @override
  String get tarotLoveDetail21_Senior =>
      'Essayez de vous entendre avec les gens autour de vous avec un esprit libre qui n\'est pas lié. De nouvelles rencontres ou expériences insuffleront de la vitalité dans votre vie. Ayez le loisir de regarder le monde avec un cœur léger.';

  @override
  String get tarotWealthMeaning0_Senior =>
      'C\'est une période pour une gestion d\'actifs stable et la sagesse du partage.';

  @override
  String get tarotWealthDetail0_Senior =>
      'Concentrez-vous sur la protection et la gestion de vos actifs actuels plutôt que sur de nouveaux investissements. Partager votre sagesse économique ou donner des conseils à votre famille et à votre entourage sera très gratifiant.';

  @override
  String get tarotWealthMeaning1_Senior =>
      'Écoutez votre intuition et agissez avec prudence.';

  @override
  String get tarotWealthDetail1_Senior =>
      'Vos connaissances spécialisées ou vos compétences accumulées sur une longue période peuvent se transformer en valeur économique. Attendez calmement les opportunités sans vous précipiter, et vous porterez de bons fruits.';

  @override
  String get tarotWealthMeaning2_Senior =>
      'Une base financière solide est établie grâce à la sagesse et à l\'expérience.';

  @override
  String get tarotWealthDetail2_Senior =>
      'La richesse s\'accumule dans la maison et c\'est le moment de trouver la stabilité. Votre cœur généreux rendra votre entourage chaleureux, et cette bénédiction vous reviendra. Profitez de la vie quotidienne avec un esprit détendu.';

  @override
  String get tarotSuccessMeaning0_Senior =>
      'C\'est une période où une fin gracieuse est plus importante qu\'un nouveau défi.';

  @override
  String get tarotSuccessDetail0_Senior =>
      'Concentrez-vous sur l\'organisation et la conclusion des réalisations que vous avez bâties. Votre succès réside dans la sincérité et la sagesse manifestées dans le processus plutôt que dans le résultat. Répandez une influence positive autour de vous.';

  @override
  String get tarotSuccessMeaning1_Senior =>
      'Préparez-vous pour l\'avenir avec de nouveaux objectifs créatifs.';

  @override
  String get tarotSuccessDetail1_Senior =>
      'Votre paix intérieure est plus importante que le statut social ou l\'honneur. Prenez le temps de cultiver votre moi intérieur par la méditation ou la lecture. Une vision profonde vous fera briller encore plus.';

  @override
  String get tarotSuccessMeaning2_Senior =>
      'Menez les autres avec sagesse et expérience.';

  @override
  String get tarotSuccessDetail2_Senior =>
      'Vivre en harmonie avec sa famille et maintenir sa santé est une vie suffisamment réussie. Trouvez le bonheur dans les petites routines quotidiennes et ayez un cœur reconnaissant. Votre existence elle-même est une grande force pour votre famille.';

  @override
  String get tarotWealthMeaning3_Senior =>
      'C\'est une période d\'abondance matérielle et de stabilité.';

  @override
  String get tarotWealthDetail3_Senior =>
      'Maintenez la stabilité du foyer grâce à des sources de revenus stables et une consommation planifiée. Votre sagesse économique sera une grande leçon pour vos enfants.';

  @override
  String get tarotWealthMeaning4_Senior =>
      'Un leadership responsable apporte le succès financier.';

  @override
  String get tarotWealthDetail4_Senior =>
      'Nous recommandons des méthodes de gestion d\'actifs vérifiées plutôt que des produits financiers complexes. Une attitude prudente et conservatrice est la clé pour protéger vos actifs.';

  @override
  String get tarotWealthMeaning5_Senior =>
      'Le respect des principes apporte une stabilité financière à long terme.';

  @override
  String get tarotWealthDetail5_Senior =>
      'Il vaut mieux se contenter de sa vie actuelle et être solide plutôt que d\'être cupide. Le bon choix garantit la paix dans la vieillesse.';

  @override
  String get tarotWealthMeaning6_Senior =>
      'Une opportunité financière inattendue peut se présenter par le biais d\'une connaissance.';

  @override
  String get tarotWealthDetail6_Senior =>
      'Il peut y avoir une pression temporaire sur les flux de trésorerie, mais si vous la gérez avec sagesse, vous pouvez transformer la crise en opportunité. Réduisez les dépenses inutiles.';

  @override
  String get tarotWealthMeaning7_Senior =>
      'Le succès peut être obtenu grâce à une action rapide et décisive.';

  @override
  String get tarotWealthDetail7_Senior =>
      'Si vous accumulez de la vertu autour de vous, la chance de richesse suivra de lieux inattendus. La joie du partage rendra votre vie encore plus riche.';

  @override
  String get tarotWealthMeaning8_Senior =>
      'Une gestion financière juste et équilibrée est nécessaire.';

  @override
  String get tarotWealthDetail8_Senior =>
      'Il est important de trouver la tranquillité d\'esprit plutôt que l\'abondance matérielle. Une vie disciplinée apportera plutôt une stabilité économique.';

  @override
  String get tarotWealthMeaning9_Senior =>
      'Prenez le temps de revoir vos plans financiers.';

  @override
  String get tarotWealthDetail9_Senior =>
      'Des revenus ou des dépenses imprévus peuvent survenir. Si vous vous adaptez au changement et gérez vos actifs avec sagesse, il n\'y aura pas de problèmes majeurs.';

  @override
  String get tarotWealthMeaning10_Senior =>
      'La fortune change, alors préparez-vous pour l\'avenir.';

  @override
  String get tarotWealthDetail10_Senior =>
      'Il est important de suivre les principes dans les questions de propriété telles que l\'héritage ou la donation. Une attitude honnête prévient les litiges et apporte la paix.';

  @override
  String get tarotWealthMeaning11_Senior =>
      'Surmontez les difficultés financières avec patience et force intérieure.';

  @override
  String get tarotWealthDetail11_Senior =>
      'Le soutien économique pour les enfants ou les descendants reviendra comme une grande récompense plus tard. Soyez patient et maintenez une perspective à long terme.';

  @override
  String get tarotWealthMeaning12_Senior =>
      'Une nouvelle perspective sur l\'argent est nécessaire.';

  @override
  String get tarotWealthDetail12_Senior =>
      'Vous vivrez une expérience mystérieuse où vous serez comblé en vous vidant. Lâchez les possessions inutiles et affrontez la vie quotidienne avec un cœur léger.';

  @override
  String get tarotWealthMeaning13_Senior =>
      'Un changement financier majeur arrive, alors préparez-vous.';

  @override
  String get tarotWealthDetail13_Senior =>
      'Recherchez l\'harmonie entre les revenus et les dépenses et méfiez-vous de la cupidité excessive. Une vie disciplinée vous apportera une stabilité continue.';

  @override
  String get tarotWealthMeaning14_Senior =>
      'Évitez les dépenses excessives et maintenez la modération.';

  @override
  String get tarotWealthDetail14_Senior =>
      'Vous devez vous méfier des offres d\'investissement alléchantes ou d\'une expansion excessive. Faire confiance à votre riche expérience et prendre des décisions prudentes est le moyen de protéger vos actifs.';

  @override
  String get tarotWealthMeaning15_Senior =>
      'Méfiez-vous des tentations financières excessives.';

  @override
  String get tarotWealthDetail15_Senior =>
      'Dans une situation de crise, la sagesse du retour aux sources est nécessaire. Ne soyez pas déconcerté et vérifiez méticuleusement l\'état de vos actifs pour minimiser les dommages.';

  @override
  String get tarotWealthMeaning16_Senior =>
      'Un changement soudain peut être une opportunité pour un nouveau saut financier.';

  @override
  String get tarotWealthDetail16_Senior =>
      'C\'est un moment où les difficultés économiques se résolvent et où un flux stable commence. Concevez votre avenir avec un esprit positif et profitez de la paix.';

  @override
  String get tarotWealthMeaning17_Senior =>
      'L\'espoir et la chance financière commencent à briller.';

  @override
  String get tarotWealthDetail17_Senior =>
      'La patience est nécessaire pour attendre que le brouillard lié à la richesse se lève et que la vérité soit révélée. Prenez votre temps et observez plutôt que de prendre une décision hâtive.';

  @override
  String get tarotWealthMeaning18_Senior =>
      'Faites attention aux risques financiers invisibles.';

  @override
  String get tarotWealthDetail18_Senior =>
      'Des récompenses suffisantes suivent vos efforts et un loisir économique apparaît. Partagez le bonheur avec ceux qui vous entourent et passez un temps béni.';

  @override
  String get tarotWealthMeaning19_Senior =>
      'C\'est une période pour profiter de l\'abondance matérielle et de la vitalité.';

  @override
  String get tarotWealthDetail19_Senior =>
      'C\'est un moment où votre sincérité est reconnue comme une réussite économique. Organisez le passé et faites un nouveau pas pour un avenir stable.';

  @override
  String get tarotWealthMeaning20_Senior =>
      'Les efforts passés portent leurs fruits sous forme de récompenses financières.';

  @override
  String get tarotWealthDetail20_Senior =>
      'La stabilité économique atteint son apogée et une retraite paisible est garantie. C\'est le moment où votre gestion avisée des actifs brille.';

  @override
  String get tarotWealthMeaning21_Senior =>
      'Maintenez la liberté financière avec un cœur pur.';

  @override
  String get tarotWealthDetail21_Senior =>
      'C\'est un moment pour valoriser la joie de vivre plutôt que la possession matérielle. Si vous appréciez le monde avec un esprit détendu, la richesse suivra naturellement.';

  @override
  String get tarotSuccessMeaning3_Senior =>
      'Vos efforts portent leurs fruits et vous atteignez la stabilité.';

  @override
  String get tarotSuccessDetail3_Senior =>
      'Votre leadership et votre sagesse servent de modèle pour ceux qui vous entourent. Vous goûterez au vrai succès lorsque vous dirigerez avec tolérance plutôt qu\'avec autorité.';

  @override
  String get tarotSuccessMeaning4_Senior =>
      'Un leadership fort apporte le succès dans votre domaine.';

  @override
  String get tarotSuccessDetail4_Senior =>
      'C\'est un moment où les valeurs inébranlables portent leurs fruits. Votre vie fondée sur des principes servira de jalon présentant le bon chemin aux plus jeunes.';

  @override
  String get tarotSuccessMeaning5_Senior =>
      'Maintenez l\'honneur et suivez les valeurs traditionnelles.';

  @override
  String get tarotSuccessDetail5_Senior =>
      'C\'est le moment de faire un choix judicieux entre l\'honneur et le profit. Les décisions prises sur la base de votre riche expérience garantiront un avenir paisible.';

  @override
  String get tarotSuccessMeaning6_Senior =>
      'Un nouveau partenariat ou une collaboration apporte de bons résultats.';

  @override
  String get tarotSuccessDetail6_Senior =>
      'Aucun obstacle ne peut briser votre volonté. Votre apparence d\'aller de l\'avant sans abandonner est déjà un énorme succès.';

  @override
  String get tarotSuccessMeaning7_Senior =>
      'Avancez hardiment vers votre objectif.';

  @override
  String get tarotSuccessDetail7_Senior =>
      'C\'est un moment où la douceur l\'emporte sur la force. Lorsque vous embrassez l\'entourage avec patience et bienveillance, votre honneur sera encore plus élevé.';

  @override
  String get tarotSuccessMeaning8_Senior =>
      'Un jugement juste et un équilibre sont les clés du succès.';

  @override
  String get tarotSuccessDetail8_Senior =>
      'C\'est un moment où vous réalisez des vérités profondes que les autres ne peuvent pas voir. Un temps de réflexion tranquille fera de vous un être humain plus mature et profond.';

  @override
  String get tarotSuccessMeaning9_Senior =>
      'Prenez le temps de revoir vos réalisations.';

  @override
  String get tarotSuccessDetail9_Senior =>
      'Un nouveau chapitre de la vie s\'ouvre. Si vous acceptez positivement le changement sans le craindre, vous obtiendrez des résultats inattendus et formidables.';

  @override
  String get tarotSuccessMeaning10_Senior =>
      'Acceptez le changement de destin et cherchez une nouvelle voie.';

  @override
  String get tarotSuccessDetail10_Senior =>
      'Le fait de suivre la justice plutôt que l\'intérêt privé appelle au respect de l\'entourage. Votre honnêteté sera finalement la clé du plus grand succès.';

  @override
  String get tarotSuccessMeaning11_Senior =>
      'Surmontez les défis avec persévérance et patience.';

  @override
  String get tarotSuccessDetail11_Senior =>
      'Même si c\'est dur pour l\'instant, c\'est le moment de tenir bon pour un but noble. Votre dévouement restera comme un beau succès dans la mémoire de l\'histoire et des gens à l\'avenir.';

  @override
  String get tarotSuccessMeaning12_Senior =>
      'Considérez le succès d\'un point de vue différent.';

  @override
  String get tarotSuccessDetail12_Senior =>
      'Il est important de réaliser le caractère précieux du présent plutôt que de s\'obséder pour la gloire passée. La paix acquise par le vide est le vrai succès dans la vie.';

  @override
  String get tarotSuccessMeaning13_Senior =>
      'Une phase se termine et un nouveau chapitre commence.';

  @override
  String get tarotSuccessDetail13_Senior =>
      'Une vie équilibrée qui ne penche d\'aucun côté est la plus haute vertu. Votre apparence disciplinée répandra la paix et la stabilité dans votre entourage.';

  @override
  String get tarotSuccessMeaning14_Senior =>
      'Maintenez l\'équilibre et gérez votre succès avec modération.';

  @override
  String get tarotSuccessDetail14_Senior =>
      'Trouvez votre vrai moi en échappant aux contraintes qui vous liaient. Au moment où vous gagnerez la liberté d\'esprit, vous serez la personne la plus prospère au monde.';

  @override
  String get tarotSuccessMeaning15_Senior =>
      'Méfiez-vous de l\'obsession du succès ou du pouvoir.';

  @override
  String get tarotSuccessDetail15_Senior =>
      'Le changement soudain est un processus qui vous rend plus fort. Lorsque vous établissez un nouvel ordre en répondant calmement, de plus grandes réalisations suivront.';

  @override
  String get tarotSuccessMeaning16_Senior =>
      'Un changement inattendu peut être un tournant vers un plus grand succès.';

  @override
  String get tarotSuccessDetail16_Senior =>
      'Le repos vient à une âme fatiguée et de nouveaux rêves surgissent. Votre énergie créative éclairera l\'entourage et portera des fruits heureux.';

  @override
  String get tarotSuccessMeaning17_Senior =>
      'Une vision claire et de l\'espoir mènent au succès.';

  @override
  String get tarotSuccessDetail17_Senior =>
      'Écoutez votre voix intérieure même dans des situations confuses. Avec le temps, votre choix s\'avérera juste.';

  @override
  String get tarotSuccessMeaning18_Senior =>
      'Ne soyez pas anxieux face à l\'incertitude et faites confiance à votre intuition.';

  @override
  String get tarotSuccessDetail18_Senior =>
      'Un moment où le corps et l\'esprit sont sains et dynamiques. Partager une énergie positive avec son entourage et profiter de la joie de vivre est le vrai succès.';

  @override
  String get tarotSuccessMeaning19_Senior =>
      'Célébrez vos réalisations et profitez de la joie du succès.';

  @override
  String get tarotSuccessDetail19_Senior =>
      'Des endroits qui ont besoin de votre expérience et de votre sagesse surgissent. Vous ressentirez une plus grande récompense et un plus grand succès lorsque vous contribuerez à la société avec un nouveau sens de la mission.';

  @override
  String get tarotSuccessMeaning20_Senior =>
      'Vos efforts de longue date sont officiellement reconnus.';

  @override
  String get tarotSuccessDetail20_Senior =>
      'Un état de satisfaction et de paix parfaite avec plus rien à accomplir. Votre vie elle-même deviendra une œuvre d\'art et donnera une impression profonde à votre entourage.';

  @override
  String get tarotSuccessMeaning21_Senior =>
      'Atteignez le succès final avec un esprit libre.';

  @override
  String get tarotSuccessDetail21_Senior =>
      'Profitez de votre propre bonheur loin des standards du monde. Vous, qui vivez comme si vous voyagiez dans le monde avec un cœur léger, êtes le vrai gagnant.';

  @override
  String get compatibilityResultButton => 'Voir le résultat de compatibilité';

  @override
  String get compatibilityDeleteTooltip => 'Supprimer';

  @override
  String get compatibilityGenderMale => 'Homme';

  @override
  String get compatibilityGenderFemale => 'Femme';

  @override
  String get compatibilityInputTitle =>
      'Saisie des informations de compatibilité';

  @override
  String get tojeongInputTitle =>
      'Saisie des informations de l\'Oracle Annuel de Tojeong';

  @override
  String tojeongCheckFortune(int year) {
    return 'Consultez votre $year\nOracle Annuel de Tojeong';
  }

  @override
  String get tojeongInputGuide =>
      'Veuillez entrer votre date et heure de naissance\npour une analyse précise.';

  @override
  String tojeongViewResult(int year) {
    return 'Voir l\'Oracle Annuel de Tojeong $year';
  }

  @override
  String get tojeongCheckButton => 'Consulter l\'Oracle Annuel de Tojeong';

  @override
  String get tojeongSaveAndCheck =>
      'Enregistrer et voir l\'Oracle Annuel de Tojeong';

  @override
  String get tojeongYearSelect => 'Sélectionner l\'année de l\'Oracle';

  @override
  String tojeongResultTitle(int year) {
    return 'Oracle Annuel de Tojeong $year';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return 'Oracle de $name pour $year';
  }

  @override
  String tojeongGua(String gua) {
    return 'Gua: $gua';
  }

  @override
  String get tojeongTotalLuck => 'Chance Totale';

  @override
  String get tojeongProcess => 'Processus';

  @override
  String get tojeongResult => 'Résultat';

  @override
  String get tojeongMonthlyLuck => 'Fortune Mensuelle';

  @override
  String get tojeongShareResult => 'Partager les Résultats';

  @override
  String tojeongShareTitle(int year) {
    return 'Résultats de l\'Oracle Annuel de Tojeong $year';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return 'Examen global de l\'Oracle Annuel de Tojeong de $name.\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => 'Année cible';

  @override
  String get sajuDeleteTitle =>
      'Supprimer les informations des Quatre Piliers du Destin';

  @override
  String sajuDeleteConfirm(String name) {
    return 'Êtes-vous sûr de vouloir supprimer les infos de $name ?';
  }

  @override
  String get sajuProfileSelect =>
      'Sélectionner les informations des Quatre Piliers du Destin';

  @override
  String get add => 'Ajouter';

  @override
  String get modify => 'Modifier';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\nLe service est en cours de préparation.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'Nous travaillons dur pour vous fournir des\ninformations de fortune plus précises et utiles !';

  @override
  String get goBack => 'Retour';

  @override
  String get name => 'Nom';

  @override
  String get nameInputGuide => 'Veuillez entrer votre nom';

  @override
  String get sajuLunarSolar => 'Solaire/Lunaire';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => 'Sélectionner l\'année de la fortune';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'Sélectionner un profil';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get newYearFortuneInputTitle => 'Infos pour la Fortune du Nouvel An';

  @override
  String newYearFortuneHeader(int year) {
    return 'Comment sera votre fortune\npour $year ?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'Veuillez entrer votre date et heure de naissance\npour une analyse précise des Quatre Piliers du Destin.';

  @override
  String newYearFortuneViewButton(int year) {
    return 'Voir la fortune de $year';
  }

  @override
  String get newYearFortuneCheckButton => 'Vérifier la fortune';

  @override
  String get newYearFortuneSaveAndCheckButton =>
      'Enregistrer et voir la fortune';

  @override
  String newYearFortuneResultTitle(int year) {
    return 'Ma fortune du Nouvel An $year';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return 'Résultat de ma fortune du Nouvel An $year';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return 'Fortune du Nouvel An pour $name.\n\n$desc...';
  }

  @override
  String get sajuChartTitle => 'Graphique des Quatre Piliers du Destin';

  @override
  String get sajuHour => 'Heure';

  @override
  String get sajuDay => 'Jour';

  @override
  String get sajuMonth => 'Mois';

  @override
  String get sajuYear => 'Année';

  @override
  String get ohaengAnalysisTitle => 'Analyse des Cinq Éléments';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'Votre élément dominant : $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ Les Cinq Éléments (Bois, Feu, Terre, Métal, Eau) sont les énergies de base des Quatre Piliers du Destin. Bien que l\'équilibre soit idéal, vous pouvez comprendre vos tendances à travers ces éléments.';

  @override
  String yearlyTotalLuck(int year) {
    return 'Chance Totale pour $year';
  }

  @override
  String get fortuneDisclaimer =>
      'Cette fortune est à des fins de divertissement. Votre vie dépend de votre propre volonté.';

  @override
  String get compatibilityResultTitle => 'Résultat de compatibilité';

  @override
  String get compatibilityScore => 'Score de compatibilité';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => 'Notre Compatibilité';

  @override
  String get compatibilityShareResult => 'Partager le Résultat';

  @override
  String get compatibilityRetryButton => 'Vérifier avec quelqu\'un d\'autre';

  @override
  String get compatibilitySummary => 'Résumé';

  @override
  String get compatibilitySectionLuck => 'Synergie de Chance';

  @override
  String get compatibilitySectionAdvice => 'Conseils de Relation';

  @override
  String get compatibilitySectionPositive => 'Aspects Positifs';

  @override
  String get compatibilitySectionCaution => 'Points de Vigilance';

  @override
  String get compatibilityLunarDisclaimer =>
      '* Remarque : Les dates de naissance lunaires sont actuellement analysées sur la base des dates solaires. La conversion lunaire sera bientôt mise à jour.';

  @override
  String get tojeongSaveAndCheckButton =>
      'Enregistrer et voir la fortune traditionnelle';

  @override
  String get tojeongSangsuKeyword1 =>
      'une période exigeant une forte impulsion et du leadership';

  @override
  String get tojeongSangsuKeyword2 =>
      'une période riche en relations actives et en joie';

  @override
  String get tojeongSangsuKeyword3 =>
      'une période où l\'intelligence et la passion brillent';

  @override
  String get tojeongSangsuKeyword4 =>
      'une période de changements rapides et de nouveaux départs';

  @override
  String get tojeongSangsuKeyword5 =>
      'une période exigeant une attitude flexible et une communication douce';

  @override
  String get tojeongSangsuKeyword6 =>
      'une période pour surmonter les difficultés avec sagesse et patience';

  @override
  String get tojeongSangsuKeyword7 =>
      'une période pour rechercher la stabilité et renforcer sa force intérieure';

  @override
  String get tojeongSangsuKeyword8 =>
      'une période pour cultiver la vertu avec inclusivité et un cœur chaleureux';

  @override
  String get tojeongJungsuKeyword1 => 'vous rencontrerez une aide précieuse';

  @override
  String get tojeongJungsuKeyword2 =>
      'il y aura de bonnes nouvelles concernant des documents ou contrats';

  @override
  String get tojeongJungsuKeyword3 =>
      'vous ferez face à de nouveaux défis et opportunités';

  @override
  String get tojeongJungsuKeyword4 =>
      'le succès et l\'honneur au travail suivront';

  @override
  String get tojeongJungsuKeyword5 =>
      'vous devriez gérer vos finances avec soin';

  @override
  String get tojeongJungsuKeyword6 =>
      'vous devriez donner la priorité à votre santé';

  @override
  String get tojeongHasuKeyword1 => 'vous obtiendrez un grand succès.';

  @override
  String get tojeongHasuKeyword2 =>
      'vous récolterez les fruits de vos efforts.';

  @override
  String get tojeongHasuKeyword3 =>
      'vous transformerez la crise en opportunité grâce à la patience.';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return 'Cette année, entre $sangsu, $jungsu, et enfin $hasu';
  }

  @override
  String get tojeongSangsuDetail1 =>
      'C\'est une situation où le ciel et la terre vous aident. C\'est une année où vous pouvez obtenir d\'excellents résultats si vous procédez avec une forte impulsion. Comme un dragon montant au ciel, votre énergie est puissante et brillante. Vous aurez de nombreuses occasions de faire preuve de leadership et d\'obtenir la reconnaissance de votre entourage. Cependant, agir de manière trop dogmatique pourrait susciter du ressentiment, il est donc important d\'être inclusif.';

  @override
  String get tojeongSangsuDetail2 =>
      'C\'est comme jeter une pierre dans un lac calme, créant des ondulations. C\'est une année avec beaucoup de joie et de plaisir, mais vous devez faire attention aux commérages causés par des paroles malheureuses. Votre vie sociale deviendra active et votre popularité augmentera, mais cela peut aussi attirer la jalousie. Vous pourriez rencontrer un bon partenaire lors d\'un rassemblement ou d\'un événement agréable.';

  @override
  String get tojeongSangsuDetail3 =>
      'C\'est comme un soleil brillant éclairant le monde entier. Votre intellect et votre passion brilleront, et vous pourriez vous démarquer dans les domaines des études ou de l\'art. Votre réputation augmentera et vous deviendrez connu, mais vous devez gérer un tempérament aussi vif que le feu pour éviter les ennuis. Bien que les choses semblent glamour à l\'extérieur, vous pourriez vous sentir seul à l\'intérieur, alors concentrez-vous sur votre force intérieure.';

  @override
  String get tojeongSangsuDetail4 =>
      'Des changements rapides sont attendus, comme un coup de tonnerre dans un ciel serein. Votre énergie est active et entreprenante, ce qui en fait un bon moment pour commencer de nouvelles choses. Vous serez occupé par des déménagements ou des changements. Le début pourrait être bruyant mais la fin pourrait être floue, vous avez donc besoin de persévérance pour terminer ce que vous commencez.';

  @override
  String get tojeongSangsuDetail5 =>
      'C\'est un moment où tout renaît alors qu\'une douce brise printanière souffle. Si vous répondez avec une attitude flexible, les chemins bloqués s\'ouvriront en douceur. Vous pouvez réaliser des bénéfices dans les affaires ou le commerce, et de bonnes nouvelles viendront de loin. Cependant, l\'indécision pourrait vous faire manquer des opportunités, une certaine détermination est donc nécessaire le moment venu.';

  @override
  String get tojeongSangsuDetail6 =>
      'C\'est comme nager en eaux profondes. Bien que cela paraisse calme en surface, il peut y avoir des inquiétudes à l\'intérieur. Vous devez faire preuve de sagesse pour surmonter les difficultés, et il est préférable d\'éviter les investissements ou expansions excessifs. Si vous attendez patiemment le bon moment, un jour faste viendra sûrement. Faites attention à votre santé.';

  @override
  String get tojeongSangsuDetail7 =>
      'C\'est comme si une grande montagne bloquait votre chemin, mais une fois franchie, une vaste plaine s\'étendra devant vous. Si vous endurez les difficultés avec une volonté ferme, vous porterez de grands fruits. Il est avantageux de maintenir votre position actuelle et de vous concentrer sur la stabilité intérieure. La stabilité vaut mieux que des changements hâtifs, et instaurer la confiance est important.';

  @override
  String get tojeongSangsuDetail8 =>
      'C\'est le moment de semer des graines sur une vaste terre. Si vous embrassez votre environnement avec inclusivité et patience, vous cultiverez la vertu. Si vous traitez les gens avec un cœur chaleureux et maternel, vous pourrez recevoir l\'aide des autres. Les investissements pour l\'avenir, plutôt que les résultats immédiats, brilleront cette année. La paix habitera votre foyer.';

  @override
  String get tojeongJungsuDetail1 =>
      'Une aide arrive à votre porte, apportant des événements joyeux. Les problèmes bloqués se résoudront et la richesse affluera. Si vous planifiez des choses avec un partenaire, la probabilité de succès augmentera.';

  @override
  String get tojeongJungsuDetail2 =>
      'Il pourrait y avoir une célébration à la maison ou vous pourriez accueillir un nouveau membre dans la famille. La chance concernant les documents est bonne, ce qui est favorable pour les contrats ou les ventes. Cependant, de petites disputes pourraient se transformer en grands conflits, soyez donc prudent avec vos paroles et vos actes.';

  @override
  String get tojeongJungsuDetail3 =>
      'Vous êtes destiné à déployer vos ailes en terre étrangère ou à déménager loin. Vous pouvez obtenir de nouvelles opportunités grâce à des voyages ou des déplacements professionnels. Si vous vous lancez des défis sans craindre le changement, vous obtiendrez de bons résultats.';

  @override
  String get tojeongJungsuDetail4 =>
      'L\'honneur suit alors que vous recevez une reconnaissance ou une promotion au travail. C\'est une période favorable pour réussir des examens ou obtenir des certifications. N\'hésitez pas à démontrer pleinement vos capacités.';

  @override
  String get tojeongJungsuDetail5 =>
      'La chance de richesse est forte, mais les dépenses pourraient aussi augmenter. Vous devez être rigoureux dans la gestion de votre argent et vous abstenir de dépenses impulsives. Il est préférable d\'éviter les transactions financières avec des connaissances proches.';

  @override
  String get tojeongJungsuDetail6 =>
      'C\'est le moment de prendre particulièrement soin de votre santé. Évitez le surmenage et reposez-vous beaucoup. Il est également bon de vérifier vos assurances en préparation d\'accidents ou de maladies inattendus.';

  @override
  String get tojeongHasuDetail1 =>
      'En conséquence, tout se résoudra en douceur et vos vœux se réaliseront. Vous recevrez sûrement des récompenses pour vos efforts et susciterez l\'envie de votre entourage. Si vous ne perdez pas votre état d\'esprit initial, vos bénédictions dureront longtemps.';

  @override
  String get tojeongHasuDetail2 =>
      'Il peut y avoir quelques difficultés dans le processus, mais si vous persévérez et travaillez dur, vous finirez par atteindre votre objectif. Rien ne s\'obtient facilement, vous récolterez donc ce pour quoi vous avez travaillé. C\'est une fortune de floraison tardive.';

  @override
  String get tojeongHasuDetail3 =>
      'Vous pourriez rencontrer des obstacles inattendus, mais si vous persévérez sans frustration, vous pouvez transformer la crise en opportunité. Si vous lâchez prise sur l\'avidité et libérez votre esprit, de bonnes choses arriveront à la place. La sagesse de transformer le malheur en bénédiction est nécessaire.';

  @override
  String get tojeongGeneralWealthGood =>
      'La chance de richesse est bonne. Des revenus peuvent provenir d\'endroits inattendus, ou des investissements peuvent donner de bons résultats. Cependant, autant l\'argent rentre, autant il peut sortir, alors concentrez-vous sur l\'épargne.';

  @override
  String get tojeongGeneralWealthBad =>
      'Le flux de richesse peut ne pas être fluide. Vous devriez réduire les dépenses inutiles et prendre l\'habitude d\'épargner. Soyez prudent avec les transactions financières et consultez des experts pour vos investissements.';

  @override
  String get tojeongGeneralCareerGood =>
      'Des occasions d\'obtenir de la reconnaissance dans votre carrière ou vos affaires se présenteront. C\'est un bon moment pour des promotions, des changements de carrière ou pour lancer une entreprise. De meilleurs résultats peuvent être obtenus grâce à de bonnes relations.';

  @override
  String get tojeongGeneralCareerBad =>
      'Il est préférable de maintenir l\'état actuel. Concentrez-vous sur vos tâches actuelles et développez vos compétences plutôt que de lancer de nouveaux projets. Vous pourriez ressentir du stress dans vos relations avec vos collègues ou supérieurs, alors gardez l\'esprit tranquille.';

  @override
  String get tojeongGeneralLoveGood =>
      'La chance en amour augmente, les célibataires pourraient rencontrer un bon partenaire et l\'amour des couples s\'approfondira. Le rire et l\'harmonie rempliront le foyer. C\'est un bon moment pour parler mariage.';

  @override
  String get tojeongGeneralLoveBad =>
      'Des disputes pourraient survenir suite à des malentendus insignifiants. La compréhension et la considération des positions de chacun sont nécessaires. Essayez de résoudre les problèmes par un dialogue rationnel plutôt que par des réponses émotionnelles.';

  @override
  String get optional => 'Optionnel';

  @override
  String get sajuSolarHint =>
      'Tojeongbigyeol est plus précis lorsqu\'il est analysé sur la base de l\'anniversaire lunaire.';

  @override
  String get yourFortune => 'Votre Fortune';

  @override
  String get guaUpper => 'Gua Supérieur';

  @override
  String get guaMiddle => 'Gua Moyen';

  @override
  String get guaLower => 'Gua Inférieur';

  @override
  String get guaCode => 'Code Gua';

  @override
  String get viewAgain => 'Vérifier à nouveau';

  @override
  String get zodiacAries => 'Bélier';

  @override
  String get zodiacTaurus => 'Taureau';

  @override
  String get zodiacGemini => 'Gémeaux';

  @override
  String get zodiacCancer => 'Cancer';

  @override
  String get zodiacLeo => 'Lion';

  @override
  String get zodiacVirgo => 'Vierge';

  @override
  String get zodiacLibra => 'Balance';

  @override
  String get zodiacScorpio => 'Scorpion';

  @override
  String get zodiacSagittarius => 'Sagittaire';

  @override
  String get zodiacCapricorn => 'Capricorne';

  @override
  String get zodiacAquarius => 'Verseau';

  @override
  String get zodiacPisces => 'Poissons';

  @override
  String get elementFire => 'Feu';

  @override
  String get elementEarth => 'Terre';

  @override
  String get elementAir => 'Air';

  @override
  String get elementWater => 'Eau';

  @override
  String get compatibilityCategoryZodiac => 'Compatibilité Zodiacale';

  @override
  String get compatibilityCategoryInner => 'Compatibilité Intérieure';

  @override
  String get compatibilityCategoryConstellation =>
      'Compatibilité de Constellation';

  @override
  String get compatibilitySummarySamhap => 'Meilleur Accord Zodiacal (Samhap)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return 'Le $animal1 et le $animal2 sont un accord parfait, complétant les faiblesses de l\'autre. Cette relation crée une excellente synergie lorsqu\'ils sont ensemble.';
  }

  @override
  String get compatibilitySummaryYukhap => 'Grand Accord Zodiacal (Yukhap)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return 'Le $animal1 et le $animal2 ont une forte attraction mutuelle. Il est facile de ressentir une connexion dès le début.';
  }

  @override
  String get compatibilitySummaryChung =>
      'Relation Nécessitant des Efforts (Chung)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return 'Le $animal1 et le $animal2 ont des tempéraments différents et peuvent s\'affronter. Respecter les différences de l\'autre et faire preuve de considération est nécessaire.';
  }

  @override
  String get compatibilitySummaryWonjin =>
      'Relation Nécessitant de la Compréhension (Wonjin)';

  @override
  String get compatibilityDescWonjin =>
      'C\'est une relation où vous pourriez occasionnellement ressentir du ressentiment ou de la tristesse sans raison claire. Une communication fréquente est recommandée pour réduire les malentendus.';

  @override
  String get compatibilitySummaryDefaultZodiac => 'Accord Zodiacal Moyen';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return 'Le $animal1 et le $animal2 ont une relation fluide sans conflits majeurs.';
  }

  @override
  String get compatibilitySummaryCheonganHap => 'Âmes Sœurs Destinées';

  @override
  String get compatibilityDescCheonganHap =>
      'Vos personnalités et vos valeurs sont parfaitement alignées. Vous êtes des âmes sœurs qui se comprennent même sans mots.';

  @override
  String get compatibilitySummarySangsaeng => 'Partenariat de Soutien';

  @override
  String get compatibilityDescSangsaeng =>
      'Une relation positive où vous vous soutenez naturellement et vous aidez mutuellement à grandir.';

  @override
  String get compatibilitySummarySanggeuk => 'Équilibre Dynamique Requis';

  @override
  String get compatibilityDescSanggeuk =>
      'Bien qu\'il puisse y avoir des différences de personnalité, vous avez le potentiel unique de compléter les forces et les faiblesses de l\'autre.';

  @override
  String get compatibilitySummaryDefaultInner => 'Amis Naturels';

  @override
  String get compatibilityDescDefaultInner =>
      'Une relation bâtie sur des tendances similaires et des intérêts partagés, rendant votre temps ensemble facile et confortable.';

  @override
  String get compatibilitySummarySameElement =>
      'Rencontre d\'Esprits Similaires';

  @override
  String compatibilityDescSameElement(String element) {
    return 'Le fait de partager la tendance \'$element\' signifie que vos valeurs et vos façons d\'agir sont très synchronisées.';
  }

  @override
  String get compatibilitySummaryCompatibleElement => 'Équilibre Harmonieux';

  @override
  String get compatibilityDescCompatibleElement =>
      'Une belle relation où vos différents charmes se mélangent en une harmonie parfaite.';

  @override
  String get compatibilitySummaryIncompatibleElement =>
      'Différences Fascinantes';

  @override
  String get compatibilityDescIncompatibleElement =>
      'Vos tempéraments différents peuvent sembler inhabituels au début, mais ils offrent d\'infinies opportunités de croissance et de découverte ensemble.';

  @override
  String get compatibilitySummaryDefaultConstellation => 'Harmonie Moyenne';

  @override
  String get compatibilityDescDefaultConstellation =>
      'Une relation qui s\'accorde raisonnablement bien sur la base des signes du zodiaque.';

  @override
  String get routineMorningTitle => 'Un matin rafraîchissant ! ☀️';

  @override
  String get routineMorningBody =>
      'Avez-vous oublié les missions de routine prévues pour aujourd\'hui ?';

  @override
  String get routineEveningTitle => 'Bon travail aujourd\'hui ! ✨';

  @override
  String get routineEveningBody =>
      'Avez-vous terminé toutes les missions d\'aujourd\'hui ? Terminez votre routine.';

  @override
  String get routineCheckTitle => 'Consultez vos missions d\'aujourd\'hui ! 🚀';

  @override
  String get routineCheckBody =>
      'Suivez les missions de routine et rendez votre journée agréable.';

  @override
  String get supplementNotificationTitle => 'Rappel de suppléments';

  @override
  String get waterNotificationTitle => 'Rappel de boire de l\'eau';

  @override
  String get routineNotificationTitle => 'Notification de routine quotidienne';

  @override
  String get todaysFortuneNotificationTitle => 'Votre fortune d\'aujourd\'hui';

  @override
  String get afternoonFortuneNotificationBody =>
      'Et votre fortune de l\'après-midi ? Vérifiez-la maintenant !';

  @override
  String get morningFortuneNotificationBody =>
      'Consultez votre fortune et commencez la journée avec énergie !';

  @override
  String get fortunePassExpiryTitle => 'Fortune Pass expire aujourd\'hui';

  @override
  String get fortunePassExpiryBody =>
      'Votre abonnement Fortune Pass expire aujourd\'hui. Renouvelez-le pour continuer à profiter des avantages !';

  @override
  String get takeNow => 'Prendre maintenant';

  @override
  String get later => 'Plus tard';

  @override
  String get turnOffAlarmAction => 'Arrêter l\'alarme';

  @override
  String get todaysFortuneNotification =>
      'Notification de l\'horoscope du jour';

  @override
  String get enableNotification => 'Activer la notification';

  @override
  String get fortuneNotificationDescription =>
      'Vous informe de votre horoscope du jour à l\'heure spécifiée.';

  @override
  String get morningNotificationTime => 'Heure de notification le matin';

  @override
  String get afternoonNotificationTime => 'Heure de notification l\'après-midi';

  @override
  String get morningFortuneTitle => 'Fortune du matin';

  @override
  String get afternoonFortuneTitle => 'Fortune de l\'après-midi';

  @override
  String get type => 'Type';

  @override
  String get supplementChannelDesc =>
      'Canal pour les notifications de prise de compléments.';

  @override
  String get waterChannelDesc =>
      'Canal pour les notifications de l\'habitude de boire de l\'eau.';

  @override
  String get waterSummaryTitle => 'Notification de consommation d\'eau';

  @override
  String get dailyRoutineChannelDesc =>
      'Canal pour les notifications de missions quotidiennes et de création d\'habitudes.';

  @override
  String get dailyRoutineSummaryTitle => 'Notification de routine quotidienne';

  @override
  String get missionChannelName => 'Notification de mission';

  @override
  String get missionChannelDesc =>
      'Canal pour les notifications générales d\'exécution de mission.';

  @override
  String get fortuneChannelName => 'Notification de fortune';

  @override
  String get fortuneChannelDesc =>
      'Canal pour les notifications quotidiennes de consultation de fortune.';

  @override
  String get subscriptionChannelName => 'Notification d\'abonnement';

  @override
  String get subscriptionChannelDesc =>
      'Canal pour les notifications d\'expiration du Fortune Pass et d\'abonnement.';

  @override
  String get alarmChannelName => 'Alarme';

  @override
  String get alarmChannelDesc =>
      'Canal pour les alarmes de réveil et d\'exécution de mission.';

  @override
  String get shareViaKakao => 'Partager via KakaoTalk';

  @override
  String get shareViaSNS =>
      'Partager via d\'autres réseaux sociaux (Instagram, Twitter, etc.)';

  @override
  String get checkDetailResult => 'Vérifier le résultat détaillé';

  @override
  String get viewMyFortuneResult => 'Voir mon résultat de fortune';

  @override
  String get takeSupplementNow => 'Veuillez prendre vos compléments !';

  @override
  String get takeNowQuestion => 'Souhaitez-vous le prendre maintenant ?';

  @override
  String get eatNow => 'Prendre maintenant';

  @override
  String get eatLater => 'Prendre plus tard';

  @override
  String snoozeMessageGeneric(int minutes) {
    return 'Je vous le rappellerai dans $minutes minutes.';
  }

  @override
  String get hours => 'heures';

  @override
  String get cheeringMessage4 => 'Matinée vibrante, début heureux !';

  @override
  String get cheeringMessage5 => 'Passez une journée souriante.';

  @override
  String get cheeringMessage6 => 'Courage aujourd\'hui !';

  @override
  String get cheeringMessage7 => 'Vous brillerez assez aujourd\'hui.';

  @override
  String get cheeringMessage8 =>
      'J\'ai le pressentiment que quelque chose de bien va arriver !';

  @override
  String get cheeringMessage9 =>
      'Beau travail aujourd\'hui. Un départ vigoureux !';

  @override
  String get cheeringMessage10 => 'Le bonheur est toujours à vos côtés.';

  @override
  String get cheeringMessage11 => 'Je soutiens vos rêves aujourd\'hui.';

  @override
  String get cheeringMessage12 => 'Matinée rafraîchissante, journée agréable !';

  @override
  String get cheeringMessage13 => 'Soyez victorieux aujourd\'hui !';

  @override
  String get cheeringMessage14 =>
      'Vous êtes précieux juste en étant vous-même.';

  @override
  String get cheeringMessage15 =>
      'Passez une journée pleine de choses agréables.';

  @override
  String get cheeringMessage16 =>
      'J\'espère que votre journée sera étincelante aujourd\'hui !';

  @override
  String get cheeringMessage17 => 'Votre sourire illumine le monde.';

  @override
  String get cheeringMessage18 => 'Soyez vous-même aujourd\'hui !';

  @override
  String get cheeringMessage19 =>
      'Commencez aujourd\'hui avec un cœur battant.';

  @override
  String get cheeringMessage20 => 'Une journée merveilleuse vous attend.';

  @override
  String get cheeringMessage21 =>
      'Avec le pouvoir de la positivité aujourd\'hui !';

  @override
  String get cheeringMessage22 => 'Je soutiens votre chemin.';

  @override
  String get cheeringMessage23 =>
      'Faites d\'aujourd\'hui votre meilleur jour !';

  @override
  String get cheeringMessage24 => 'Que la chance soit avec vous !';

  @override
  String get cheeringMessage25 =>
      'Passez une journée chaleureuse aujourd\'hui.';

  @override
  String get cheeringMessage26 => 'Vous pouvez le faire !';

  @override
  String get cheeringMessage27 => 'Commencez aujourd\'hui avec gratitude.';

  @override
  String get cheeringMessage28 => 'Votre valeur est infinie.';

  @override
  String get cheeringMessage29 => 'Que votre journée fleurisse de sourires.';

  @override
  String get cheeringMessage30 => 'Passez un bon moment avec des gens bien !';

  @override
  String get cheeringMessage31 =>
      'Un pas de plus vers vos rêves aujourd\'hui !';

  @override
  String get cheeringMessage32 =>
      'Vous êtes la personne la plus cool aujourd\'hui.';

  @override
  String get cheeringMessage33 => 'Une journée miraculeuse viendra.';

  @override
  String get cheeringMessage34 =>
      'Profitez de votre journée à loisir aujourd\'hui.';

  @override
  String get cheeringMessage35 => 'Vos efforts ne vous trahiront pas.';

  @override
  String get cheeringMessage36 => 'Passez une journée saine aujourd\'hui.';

  @override
  String get cheeringMessage37 => 'Vous êtes né pour être aimé !';

  @override
  String get cheeringMessage38 => 'Soyez courageux aujourd\'hui !';

  @override
  String get cheeringMessage39 => 'Un avenir brillant vous attend.';

  @override
  String get cheeringMessage40 => 'Passez une journée pleine de passion !';

  @override
  String get cheeringMessage41 => 'J\'espère que votre esprit est en paix.';

  @override
  String get cheeringMessage42 => 'Trouvez un petit bonheur aujourd\'hui.';

  @override
  String get cheeringMessage43 => 'Vous vous en sortez déjà assez bien.';

  @override
  String get cheeringMessage44 => 'Commencez aujourd\'hui avec espoir.';

  @override
  String get cheeringMessage45 =>
      'Votre gentillesse est une grande force pour quelqu\'un.';

  @override
  String get cheeringMessage46 => 'Passez une journée productive aujourd\'hui.';

  @override
  String get cheeringMessage47 => 'Vous avez le pouvoir de changer le monde.';

  @override
  String get cheeringMessage48 => 'Journée claire aujourd\'hui !';

  @override
  String get cheeringMessage49 => 'Exprimez votre charme à votre guise.';

  @override
  String get cheeringMessage50 =>
      'Remplissez votre journée de bonheur aujourd\'hui !';

  @override
  String get locationServiceDisabled =>
      'Les services de localisation sont désactivés.';

  @override
  String get locationPermissionDenied => 'Permission de localisation refusée.';

  @override
  String get locationPermissionPermanentlyDenied =>
      'Permission de localisation refusée de manière permanente.';

  @override
  String get deleteMissionTitle => 'Supprimer la mission';

  @override
  String get yesDelete => 'Oui, supprimer';

  @override
  String get waterAlarmTitle => 'C\'est l\'heure de boire de l\'eau ! 💧';

  @override
  String get waterAlarmBody =>
      'Que diriez-vous d\'un verre d\'eau fraîche pour votre santé ?';

  @override
  String get supplementAlarmBody =>
      'N\'oubliez pas de prendre vos compléments aujourd\'hui.';

  @override
  String get waterHabitChannelDesc =>
      'Canal de notification pour l\'habitude de boire de l\'eau.';

  @override
  String get pleaseSolveMath => 'Veuillez résoudre le problème.';

  @override
  String detectedLabel(String labels) {
    return '[Détecté : $labels]';
  }

  @override
  String get defaultSleepDuration => '7h 30m';

  @override
  String get year2026Name => 'Année Byeong-O (Année du Cheval Rouge)';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle Demande] $title';
  }

  @override
  String get summary => 'Résumé';

  @override
  String get monthlySummary => 'Résumé mensuel';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month Taux de réussite mensuel : $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return 'Aucun enregistrement pour $month';
  }

  @override
  String get missionRecord => 'Record de mission';

  @override
  String get supplementRecord => 'Enregistrement des suppléments';

  @override
  String get timeSaleCatchChance =>
      'Saisissez la chance de 50 % de réduction !';

  @override
  String get languageThai => 'Thaï';
}
