// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Réveil Fortune';

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
  String hoursMinutesRemaining(int hours, int minutes) {
    return 'Sonne dans ${hours}h ${minutes}m';
  }

  @override
  String minutesRemaining(int minutes) {
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
  String snoozeInfo(int minutes, int count) {
    return '$minutes min, $count fois';
  }

  @override
  String snoozeInfoUnlimited(int minutes) {
    return '${minutes}m, Illimité';
  }

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
  String get interval => 'Intervalle';

  @override
  String get maxSnoozeCount => 'Max Snooze Count';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get permissionRequired => 'Permission Requise';

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
  String get loading => 'Chargement...';

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
  String get sajuFortune2024Gap =>
      '🌿 Fortune générale de l\'année Gapjin 2024 (Bois-Gap) : \'Une année de nouveaux départs et de bonds en avant\'\n\n2024 est une année où l\'énergie de \'Bi-gyeon\' et \'Pyeon-jae\' entre en jeu pour vous. C\'est comme si de nouveaux arbres étaient plantés dans une forêt luxuriante et qu\'une vaste terre s\'ouvrait à vous. Ce sera une excellente année pour avoir une vision subjective claire et planifier de nouvelles choses.\n\n💼 [Carrière et Affaires]\nUne période où la confiance déborde et où votre détermination se renforce. Des opportunités se présenteront pour réussir de grands projets en coopérant avec des collègues ou des partenaires. Si vous envisagiez de créer une entreprise ou de changer d\'emploi, cette année pourrait être le moment idéal. Cependant, vous pourriez devenir têtu, une attitude d\'écoute est donc nécessaire.\n\n💰 [Richesse]\nDes occasions de toucher une grande richesse se présenteront. Des gains inattendus ou des retours sur investissement sont prévus. Cependant, il pourrait y avoir beaucoup de sorties d\'argent, une gestion rigoureuse des actifs est donc requise. Investir avec une perspective à long terme est avantageux.\n\n❤️ [Amour et Relations]\nUn bon moment pour élargir vos relations et nouer de nouveaux liens. Si vous êtes célibataire, il y a de fortes chances de rencontrer un partenaire séduisant, et si vous êtes en couple, la relation s\'approfondira. Cependant, méfiez-vous de l\'apparition de concurrents.\n\n⚠️ [Précautions]\nFaites attention à la santé de votre foie ou de votre vésicule biliaire et gérez votre stress. Évitez également les décisions arbitraires dues à un excès de confiance.';

  @override
  String get sajuFortune2024Eul =>
      '🌿 Fortune générale de l\'année Gapjin 2024 (Bois-Eul) : \'Une année de croissance avec des protecteurs\'\n\n2024 est une année où l\'énergie de \'Geob-jae\' et \'Jeong-jae\' entre en jeu pour vous. C\'est comme du lierre grimpant sur un grand arbre pour voir le ciel. Ce sera une année où vous pourrez obtenir de meilleurs résultats avec l\'aide de votre entourage plutôt que seul.\n\n💼 [Carrière et Affaires]\nLa collaboration et le réseautage sont essentiels. Vous rencontrerez des aides compétents, ce qui augmentera l\'efficacité de votre travail et vous vaudra de la reconnaissance. Cependant, des situations où les performances doivent être partagées peuvent survenir, portez donc attention à une distribution équitable. C\'est un bon moment pour affirmer votre présence au milieu de la compétition.\n\n💰 [Richesse]\nUn revenu stable est garanti. Les récompenses suivent des efforts sincères, et c\'est un moment avantageux pour l\'épargne ou l\'investissement immobilier. Cependant, évitez les transactions financières avec des collègues ou des connaissances et soyez attentif à la gestion de vos dépenses.\n\n❤️ [Amour et Relations]\nIl y aura de nombreux rassemblements sociaux et votre popularité augmentera. Dans les relations amoureuses, de légers malentendus peuvent survenir, une conversation honnête est donc nécessaire. De nouveaux liens sont susceptibles de se nouer naturellement par l\'intermédiaire d\'amis ou de collègues.\n\n⚠️ [Précautions]\nAttention aux troubles nerveux ou aux migraines. Maintenez également une attitude flexible, car vous pourriez souffrir de conflits avec votre entourage.';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 Fortune générale de l\'année Gapjin 2024 (Feu-Byeong) : \'Une année où brillent passion et sagesse\'\n\n2024 est une année où l\'énergie de \'Pyeon-in\' et \'Sik-sin\' entre en jeu pour vous. C\'est comme le soleil brillant sur une forêt pour lui insuffler la vie. Des idées créatives jailliront et ce sera une année où vous pourrez pleinement exprimer vos talents.\n\n💼 [Carrière et Affaires]\nVous vous distinguerez dans des domaines professionnels et obtiendrez des résultats originaux. Particulièrement avantageux pour ceux qui travaillent dans la recherche, l\'art ou des postes techniques. Cependant, votre capacité d\'exécution pourrait baisser à cause de trop de réflexion ; si vous avez fait un plan, efforcez-vous de le mettre en pratique immédiatement.\n\n💰 [Richesse]\nUne période où vos talents et vos idées mènent à l\'argent. Des activités secondaires ou des passe-temps pourraient générer des revenus. Cependant, examinez attentivement les contrats de documents ou les investissements pour prévenir les pertes.\n\n❤️ [Amour et Relations]\nUne période où votre élocution s\'améliore et où votre charme déborde. Vous jouerez un rôle de leader dans vos relations et gagnerez la faveur de nombreuses personnes. Dans les relations amoureuses, il y aura de nombreux rendez-vous et événements plaisants, approfondissant la relation.\n\n⚠️ [Précautions]\nFaites attention au système digestif ou à la santé cardiovasculaire. De plus, vous pourriez vous sentir déprimé à force de trop réfléchir ; il est bon de libérer votre énergie par des activités de plein air.';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 Fortune générale de l\'année Gapjin 2024 (Feu-Jeong) : \'Une année de renforcement des bases internes dans la stabilité\'\n\n2024 est une année où l\'énergie de \'Jeong-in\' et \'Sang-gwan\' entre en jeu pour vous. C\'est comme une lampe dans le ciel nocturne éclairant la forêt. Ce sera une bonne année pour se concentrer sur le développement personnel, comme les études ou l\'acquisition de certifications, et renforcer vos bases internes.\n\n💼 [Carrière et Affaires]\nAvec l\'aide de supérieurs ou d\'aînés, l\'environnement de travail s\'améliore et des opportunités de promotion ou de transfert se présentent. C\'est un moment avantageux pour transmettre vos opinions de manière persuasive et obtenir l\'accord de votre entourage. Cependant, soyez prudent dans vos paroles et vos actes, car des attitudes critiques pourraient mener à des rumeurs.\n\n💰 [Richesse]\nLa chance liée aux documents est bonne. Des contrats immobiliers ou une amélioration des revenus grâce à l\'acquisition de certifications sont prévus. Il est bon de se concentrer sur une gestion d\'actifs stable et de s\'abstenir de consommation impulsive.\n\n❤️ [Amour et Relations]\nVous gagnerez la confiance de votre entourage par votre apparence polie et chaleureuse. Dans les relations amoureuses, la considération mutuelle grandit, maintenant des rencontres stables. Une bonne année pour préparer un mariage également.\n\n⚠️ [Précautions]\nAttention aux maladies oculaires ou à l\'épuisement nerveux. Maintenez également une attitude humble, car faire étalage de vos compétences pourrait susciter du ressentiment autour de vous.';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ Fortune générale de l\'année Gapjin 2024 (Terre-Mu) : \'Une année de responsabilité et de défi\'\n\n2024 est une année où l\'énergie de \'Pyeon-gwan\' et \'Bi-gyeon\' entre en jeu pour vous. C\'est comme une immense montagne s\'harmonisant avec une forêt pour montrer sa majesté. Les responsabilités augmenteront, mais ce sera une année où vous grandirez en les surmontant.\n\n💼 [Carrière et Affaires]\nOn vous confiera souvent des missions difficiles ou vous devrez exercer votre leadership. Des opportunités de prouver vos compétences se présenteront dans des environnements très compétitifs. Même si c\'est dur, le sentiment d\'accomplissement sera grand ; la persévérance est nécessaire pour aller jusqu\'au bout.\n\n💰 [Richesse]\nLes dépenses pourraient augmenter quelque peu cette année. Il est sage de se concentrer sur la préservation du capital plutôt que sur l\'investissement, et soyez prudent car vous pourriez perdre de l\'argent dans des relations financières avec votre entourage. Il est important de définir un plan d\'actifs avec une perspective à long terme.\n\n❤️ [Amour et Relations]\nVous attirerez l\'attention du sexe opposé grâce à votre fort charisme. Cependant, des attitudes têtues pourraient provoquer des disputes avec votre partenaire ; des efforts pour considérer la position de l\'autre sont nécessaires. Une période où les liens d\'amitié deviennent plus profonds.\n\n⚠️ [Précautions]\nAttention au surmenage physique, comme des troubles gastriques ou des douleurs musculaires. Un repos suffisant et des étirements sont nécessaires, et il est bon d\'avoir des passe-temps pour relâcher la pression mentale.';

  @override
  String get sajuFortune2024Gi =>
      '🌾 Fortune générale de l\'année Gapjin 2024 (Terre-Gi) : \'Une année de concrétisation et d\'harmonie\'\n\n2024 est une année où l\'énergie de \'Jeong-gwan\' et \'Geob-jae\' entre en jeu pour vous. C\'est comme des arbres luxuriants poussant sur un large champ et portant des fruits. Ce sera une année plaisante où le statut social s\'élève et où l\'on gagne de l\'honneur.\n\n💼 [Carrière et Affaires]\nVous serez reconnu au sein de l\'organisation et occuperez des postes importants. Une année avec une très forte chance d\'emploi ou de promotion. Si vous suivez les règles et travaillez sincèrement, vous pouvez obtenir des résultats au-delà de vos attentes. Cependant, vous pourriez être stressé par la compétition avec vos collègues, gardez donc une certaine tranquillité d\'esprit.\n\n💰 [Richesse]\nUne année où des revenus stables apparaissent et où la richesse s\'accumule régulièrement. Des récompenses selon les performances ou l\'honneur sont prévues. Cependant, il peut y avoir des dépenses car vous aurez beaucoup à donner à votre entourage, un ajustement approprié est donc nécessaire.\n\n❤️ [Amour et Relations]\nUne période où la chance de mariage est forte. Si vous êtes célibataire, vous pouvez rencontrer un partenaire fiable et développer une relation sérieuse. Dans vos relations, vous obtiendrez le soutien de nombreuses personnes grâce à une communication fluide.\n\n⚠️ [Précautions]\nFaites attention au fonctionnement de la rate ou du pancréas et maintenez des habitudes alimentaires régulières. Soyez également prudent, car vous pourriez négliger vos propres intérêts en vous impliquant trop dans les affaires des autres.';

  @override
  String get sajuFortune2024Gyeong =>
      '⚔️ Fortune générale de l\'année Gapjin 2024 (Métal-Gyeong) : \'Une année de changement et d\'innovation\'\n\n2024 est une année où l\'énergie de \'Pyeon-jae\' et \'Pyeon-in\' entre en jeu pour vous. C\'est comme une épée tranchante dégageant une forêt et créant un nouveau chemin. Ce sera une année où vous briserez les cadres existants et défierez de nouveaux domaines pour faire face à de grands changements.\n\n💼 [Carrière et Affaires]\nDe nouvelles idées d\'affaires vous viendront à l\'esprit et vous ferez preuve d\'une audace décisive. Le travail à l\'étranger ou la chance de mouvement est forte ; une attitude sans peur du changement est la clé du succès. Cependant, des compétences de coordination sont nécessaires car des actions arbitraires pourraient causer des conflits au sein de l\'organisation.\n\n💰 [Richesse]\nUne année avec de grandes fluctuations dans la chance de richesse. Vous pourriez réaliser de grands profits, mais des investissements déraisonnables peuvent mener à de lourdes pertes. Vous devez agir sous une analyse et une planification rigoureuses, et il est préférable d\'éviter les investissements spéculatifs.\n\n❤️ [Amour et Relations]\nIl y aura de nombreuses occasions de rencontrer de nouvelles personnes et vous participerez à des activités sociales actives. Une période où la curiosité augmente dans les rencontres. Cependant, une attitude sérieuse est nécessaire car les sentiments peuvent s\'enflammer et se refroidir facilement.\n\n⚠️ [Précautions]\nFaites attention à la santé respiratoire ou du côlon. Gardez également votre calme en tout temps et portez attention à la sécurité, car des accidents peuvent survenir à cause d\'une personnalité précipitée.';

  @override
  String get sajuFortune2024Sin =>
      '💎 Fortune générale de l\'année Gapjin 2024 (Métal-Sin) : \'Une année de bijoux étincelants et d\'honneur\'\n\n2024 est une année où l\'énergie de \'Jeong-jae\' et \'Jeong-in\' entre en jeu pour vous. C\'est comme un bijou brillant dans une forêt et dont la valeur est reconnue. Ce sera une année où vous recevrez de justes récompenses pour vos efforts et rehausserez votre honneur.\n\n💼 [Carrière et Affaires]\nLa sincérité et la méticulosité brillent, vous valant la confiance de tout votre entourage. Vous pourriez être reconnu pour votre expertise et devenir responsable d\'un projet important ou savourer la joie d\'une promotion. Une période stable où les choses se passent comme prévu.\n\n💰 [Richesse]\nLa chance de richesse est très stable et bonne. Un revenu régulier est garanti, et vous obtiendrez de bons résultats dans l\'épargne ou les technologies financières. Vous pourriez également hériter de vos parents ou supérieurs ou recevoir une aide économique.\n\n❤️ [Amour et Relations]\nVous ferez preuve d\'un grand charme auprès du sexe opposé grâce à une apparence digne et polie. Dans les relations amoureuses, la confiance mutuelle s\'approfondit, ce qui en fait une bonne année pour promettre un mariage. Les relations sont également fluides et paisibles.\n\n⚠️ [Précautions]\nFaites attention à la santé des poumons ou aux maladies de peau. De plus, vous devez parfois vous sentir à l\'aise, car chercher trop la perfection peut mener à un stress personnel.';

  @override
  String get sajuFortune2024Im =>
      '🌊 Fortune générale de l\'année Gapjin 2024 (Eau-Im) : \'Une année de croissance flexible comme l\'eau qui coule\'\n\n2024 est une année où l\'énergie de \'Sik-sin\' et \'Pyeon-gwan\' entre en jeu pour vous. C\'est comme une vaste mer humidifiant une forêt pour faire croître la vie. Ce sera une année où vous exercerez votre sagesse pour résoudre des problèmes difficiles et étendre votre territoire.\n\n💼 [Carrière et Affaires]\nUne période où les compétences créatives de résolution de problèmes se démarquent. Vous trouverez des percées même dans des situations difficiles et gagnerez de la reconnaissance pour vos capacités. De bons résultats sont particulièrement attendus dans les domaines de l\'éducation, du conseil et de la planification. Cependant, un ajustement du rythme est nécessaire car vous pourriez vous épuiser en raison d\'une charge de travail excessive.\n\n💰 [Richesse]\nUne bonne année pour générer des revenus grâce à vos compétences ou vos talents. Une période où la chance alimentaire et la chance de richesse entrent ensemble. Cependant, il est sage de sécuriser des fonds d\'urgence car des dépenses soudaines pourraient survenir.\n\n❤️ [Amour et Relations]\nVous maintiendrez de bonnes relations avec votre entourage grâce à une compréhension et une tolérance accrues. Dans les relations amoureuses, vous confirmerez vos sentiments mutuels par une conversation profonde. Si vous êtes célibataire, vous êtes très susceptible de rencontrer un partenaire avec un sentiment de confort.\n\n⚠️ [Précautions]\nFaites attention à la santé du système rénal ou de la vessie. Priorisez également vos actions, car essayer de gérer trop de choses à la fois pourrait nuire à votre santé.';

  @override
  String get sajuFortune2024Gye =>
      '💧 Fortune générale de l\'année Gapjin 2024 (Eau-Gye) : \'Saisir les opportunités au milieu du changement\'\n\n2024 est une année où l\'énergie de \'Sang-gwan\' et \'Jeong-gwan\' entre en jeu pour vous. C\'est comme une pluie douce humidifiant une forêt pour faire revivre tout ce qui s\'y trouve. Ce sera une année où vous ferez entendre votre voix pour annoncer votre présence au monde et saisir de nouvelles opportunités.\n\n💼 [Carrière et Affaires]\nL\'éloquence s\'améliore et les idées créatives deviennent abondantes. Vous ferez preuve d\'un excellent talent dans les domaines du marketing, des relations publiques et de l\'art. Cependant, une sagesse pour agir avec flexibilité est nécessaire car une rébellion contre les chefs ou les règles de l\'organisation pourrait surgir.\n\n💰 [Richesse]\nUne année où le flux d\'argent devient actif. Des opportunités d\'augmenter vos revenus en faisant preuve d\'esprit et de rapidité se présenteront. Cependant, soyez prudent car les dépenses pourraient devenir importantes en raison d\'une consommation impulsive ou d\'une volonté de paraître.\n\n❤️ [Amour et Relations]\nVous deviendrez populaire grâce à un charme débordant et de bonnes compétences conversationnelles. Dans les relations amoureuses, vous insufflez de la vie par une expression émotionnelle honnête, mais de la considération est nécessaire car des paroles tranchantes pourraient parfois blesser.\n\n⚠️ [Précautions]\nFaites attention aux maladies urologiques ou à la circulation sanguine. Évitez également de dire du mal des autres et maintenez un discours et des actions humbles en tout temps, car vous pourriez faire l\'objet de rumeurs.';

  @override
  String get sajuFortune2025Gap =>
      '🌿 Fortune générale de l\'année Eulsa 2025 (Bois-Gap) : \'Croissance au milieu d\'une nouvelle étape et de la compétition\'\n\n2025 est une année où l\'énergie de \'Geob-jae\' et \'Sik-sin\' entre en jeu pour vous. C\'est comme un grand arbre dans une forêt s\'harmonisant avec du lierre (Bois-Eul) pour grandir ensemble. Une synergie se crée à plusieurs plutôt que seul, mais en même temps, ce sera une année où une compétition féroce sera inévitable.\n\n💼 [Carrière et Affaires]\nL\'activité devient vigoureuse et le désir d\'expression s\'accentue. Des opportunités se présenteront pour annoncer largement vos idées et vos talents au monde. D\'excellents résultats sont attendus pour les freelances, les artistes ou les commerciaux. Cependant, de subtils conflits pourraient surgir dans les relations avec les collègues ou les concurrents ; une sagesse pour en faire des collaborateurs plutôt que des ennemis est nécessaire.\n\n💰 [Richesse]\nLe flux de richesse est actif, mais il pourrait y avoir autant de sorties que d\'entrées d\'argent (influence de Geob-jae). La prudence est de mise car des dépenses pourraient survenir suite à des rassemblements ou des recommandations d\'investissement. Investir dans le développement personnel ou l\'expansion de l\'entreprise est plus avantageux à long terme que l\'épargne simple.\n\n❤️ [Amour et Relations]\nLa sociabilité s\'améliore et vous rencontrerez de nombreuses nouvelles personnes. Votre popularité augmente dans les rassemblements, et c\'est un bon moment pour séduire. Cependant, comme des concurrents pourraient apparaître, il est bon de s\'exprimer activement si quelqu\'un vous plaît.\n\n⚠️ [Précautions]\nUn esprit de compétition excessif pourrait mener à des ennuis. De plus, la chance de mouvement augmente en raison de l\'énergie \'Feu-Sa\', portez donc attention à la sécurité routière et à la gestion de votre force physique.';

  @override
  String get sajuFortune2025Eul =>
      '🌿 Fortune générale de l\'année Eulsa 2025 (Bois-Eul) : \'Un bond brillant révélant vos couleurs\'\n\n2025 est une année où l\'énergie de \'Bi-gyeon\' et \'Sang-gwan\' entre en jeu pour vous. C\'est comme des fleurs en plein champ s\'épanouissant sous un soleil chaud. Ce sera une année dynamique où vous montrerez pleinement votre individualité et vos talents, recevant l\'attention du public.\n\n💼 [Carrière et Affaires]\nLa créativité et le sens artistique atteignent leur apogée. Vous vous distinguerez dans les tâches de planification et de présentation d\'idées. Des opportunités de devenir indépendant ou de diriger de nouveaux projets surgissent car vos compétences sont reconnues. Cependant, une coordination est nécessaire car essayer d\'aller trop vite pourrait entrer en conflit avec les règles existantes.\n\n💰 [Richesse]\nUne année où les revenus sont créés sur la base de l\'esprit et de la compétence. Vous pourriez obtenir des revenus inattendus par des activités secondaires ou créatives. Cependant, les dépenses pour le maintien du rang ou les divertissements pourraient augmenter ; ne perdez pas votre sens économique.\n\n❤️ [Amour et Relations]\nUne période de charme débordant, attirant l\'attention du sexe opposé. Dans les relations amoureuses, vous passez des moments agréables et animés, mais des disputes peuvent survenir à cause de votre propre entêtement. Si vous êtes seul, vous pouvez espérer une rencontre fatidique.\n\n⚠️ [Précautions]\nAttention aux lapsus, car c\'est une année propice aux rumeurs. De plus, un sommeil et un repos réguliers sont essentiels car vous pourriez consommer trop d\'énergie et vous fatiguer facilement.';

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
  String get sajuFortune2025Byeong =>
      '🔥 Fortune générale de l\'année Eulsa 2025 (Feu-Byeong) : \'Réussite et compétition pleines de passion\'\n\n2025 est une année où l\'énergie de \'Jeong-in\' et \'Bi-gyeon\' entre en jeu pour vous. C\'est comme le soleil dans le ciel rencontrant la chaleur du sol pour brûler encore plus fort. Vous gagnerez de solides forces de soutien et avancerez vers vos objectifs sans hésitation, porté par la confiance.\n\n💼 [Carrière et Affaires]\nVous réaliserez une grande croissance avec l\'aide de protecteurs ou de mentors fiables. Très avantageux pour l\'acquisition de certifications ou de diplômes académiques. La collaboration avec les collègues brille, et vous mènerez l\'équipe au succès en exerçant votre leadership. Cependant, attention car un esprit de compétition excessif pourrait nuire aux relations.\n\n💰 [Richesse]\nUne période pour accroître votre richesse tout en partageant des informations avec votre entourage. Des revenus issus d\'investissements conjoints ou de coopérations sont attendus. Cependant, il est important de veiller à vos intérêts concrets car vous pourriez dépenser excessivement par fierté ou par souci du regard des autres.\n\n❤️ [Amour et Relations]\nUne année où les amitiés s\'approfondissent car il y aura de nombreux rassemblements. Dans les relations amoureuses, le confort comme avec un ami se renforce. Cependant, un équilibre approprié est nécessaire car des conflits peuvent survenir si vous donnez la priorité aux amis sur votre partenaire.\n\n⚠️ [Précautions]\nFaites attention au système circulatoire, comme la pression artérielle ou la santé cardiaque. Gardez également votre calme en tout temps car des émotions impulsives dues à une personnalité fougueuse pourraient gâcher les choses.';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 Fortune générale de l\'année Eulsa 2025 (Feu-Jeong) : \'Stabilité et opportunité trouvées au milieu du changement\'\n\n2025 est une année où l\'énergie de \'Pyeon-in\' et \'Geob-jae\' entre en jeu pour vous. C\'est comme une bougie vacillant au vent mais finissant par éclairer les environs et révéler sa présence. Des changements inattendus peuvent survenir, mais ce sera une année où vous les surmonterez sagement pour les transformer en opportunités.\n\n💼 [Carrière et Affaires]\nLes idées originales et l\'intuition brillent. Vous ciblerez des marchés de niche auxquels les autres n\'ont pas pensé ou obtiendrez des résultats profonds dans des domaines professionnels. Cependant, la compétition avec les collègues devient féroce et certains pourraient tenter de s\'approprier vos résultats, portez donc attention à la sécurité et à la gestion des relations.\n\n💰 [Richesse]\nUne année où il peut y avoir des fluctuations dans la chance de richesse. Une gestion d\'actifs conservatrice est nécessaire car des dépenses imprévues pourraient survenir ou des pertes pourraient être constatées dans les investissements. Cependant, les revenus utilisant vos propres compétences professionnelles rentreront de manière stable. Il vaut mieux éviter les transactions financières.\n\n❤️ [Amour et Relations]\nVous pourriez devenir passif dans les rencontres à mesure que vos pensées augmentent. Dans les relations amoureuses, il est facile de se sentir déçu pour de petites choses, il est donc important de faire confiance à l\'autre et de le traiter avec un cœur ouvert. Se ressourcer par du temps seul est aussi une bonne méthode.\n\n⚠️ [Précautions]\nAttention aux troubles nerveux ou à l\'insomnie dus au stress. Il est important de gérer votre esprit par la méditation ou un exercice léger, et essayez d\'avoir une mentalité positive plutôt que des pensées négatives.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ Fortune générale de l\'année Eulsa 2025 (Terre-Mu) : \'Une année de maturité renforçant sagement ses bases internes\'\n\n2025 est une année où l\'énergie de \'Jeong-gwan\' et \'Pyeon-in\' entre en jeu pour vous. C\'est comme une chaleur chaude imprégnant le bas d\'une immense montagne pour tout embrasser. Ce sera une année substantielle où vous ajouterez votre propre profondeur tout en conservant votre honneur social.\n\n💼 [Carrière et Affaires]\nVous accéderez à un poste à responsabilité au sein de l\'organisation ou des opportunités de promotion se présenteront. Si vous valorisez les principes et travaillez sincèrement, vous recevrez une grande reconnaissance. Parallèlement, vous obtiendrez d\'excellents résultats dans l\'acquisition de connaissances professionnelles ou les tâches de recherche. Cependant, une pensée flexible est nécessaire car vous pourriez refuser le changement en étant prisonnier de stéréotypes.\n\n💰 [Richesse]\nUn revenu stable est garanti. Il est avantageux d\'épargner sincèrement et de gérer ses actifs. La fortune liée à l\'immobilier ou aux documents est bonne, il vaut donc la peine d\'envisager des investissements à long terme. Cependant, évitez les investissements déraisonnables en étant ébranlé par les tentations environnantes.\n\n❤️ [Amour et Relations]\nVous gagnez la confiance des gens par un discours et des actions dignes. Dans les relations amoureuses, c\'est un bon moment pour se respecter mutuellement et développer une relation sérieuse. Si vous pensez au mariage, c\'est aussi le bon moment pour faire des plans concrets.\n\n⚠️ [Précautions]\nFaites attention au système digestif ou à la santé de la peau. Pratiquez également la prise de décisions rapides en écoutant les conseils de votre entourage car vous pourriez vivre une paralysie décisionnelle due à trop de réflexion.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 Fortune générale de l\'année Eulsa 2025 (Terre-Gi) : \'Atteindre ses objectifs avec responsabilité\'\n\n2025 est une année où l\'énergie de \'Pyeon-gwan\' et \'Jeong-in\' entre en jeu pour vous. C\'est comme un rayon de soleil brillant après la pluie sur une vaste terre pour faire croître les récoltes. Il peut y avoir des processus difficiles, mais ce sera une année gratifiante où vous finirez par gagner de l\'honneur et atteindre vos objectifs.\n\n💼 [Carrière et Affaires]\nL\'intensité du travail peut augmenter et des tâches difficiles peuvent être confiées. Cependant, vous prouverez vos qualités de leader en les surmontant avec vos compétences et votre patience. Vous traverserez les crises avec l\'aide ou le soutien de vos supérieurs et, par conséquent, vous goûterez à un grand sentiment d\'accomplissement.\n\n💰 [Richesse]\nUne année où vous devez porter attention à la gestion des dépenses. Il pourrait y avoir beaucoup de sorties d\'argent, comme des taxes imprévues ou des charges de service public. Cependant, comme vous pouvez espérer des primes ou des bonus grâce à des efforts réguliers, la sincérité est la clé pour attirer la richesse.\n\n❤️ [Amour et Relations]\nUne apparence responsable est perçue comme attrayante par le sexe opposé. Dans les relations amoureuses, le lien s\'approfondit car vous écoutez les difficultés de l\'autre et vous vous réconfortez mutuellement. Cependant, des efforts pour une communication fréquente même courte sont nécessaires car vous pourriez négliger votre partenaire à cause d\'un quotidien chargé.\n\n⚠️ [Précautions]\nAttention au déclin de l\'immunité dû au surmenage. Il est important de gérer sa force physique avec des repas réguliers et de l\'exercice, et de relâcher le stress par des pensées positives.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ Fortune générale de l\'année Eulsa 2025 (Métal-Gyeong) : \'Gagner de l\'honneur tout en veillant à ses intérêts concrets\'\n\n2025 est une année où l\'énergie de \'Jeong-jae\' et \'Pyeon-gwan\' entre en jeu pour vous. C\'est comme un rocher solide chauffé par le feu et renaissant sous la forme d\'une épée précieuse. Vous obtiendrez des récompenses concrètes pour vos efforts et prouverez socialement votre valeur.\n\n💼 [Carrière et Affaires]\nVous obtenez de grands résultats grâce à une pensée orientée vers les résultats et à votre détermination. Particulièrement reconnu pour vos capacités dans les domaines de la finance, de la gestion et de la technologie. La chance de résoudre des problèmes difficiles et de gagner de l\'honneur est forte, mais la responsabilité grandit aussi, vous pourriez donc ressentir de la pression. Croyez en vous et avancez hardiment.\n\n💰 [Richesse]\nLa chance de richesse est très bonne. En plus d\'un revenu stable, vous gagnez des profits concrets grâce à des investissements ou des activités secondaires. Vous saisirez avec précision le flux d\'argent et gérerez efficacement vos actifs. Cependant, abstenez-vous de dépenser de grosses sommes pour l\'honneur.\n\n❤️ [Amour et Relations]\nSéduisez le sexe opposé avec une apparence sincère et fiable. Dans les relations amoureuses, vous donnez à l\'autre un sentiment de soulagement par une attitude responsable. Dans vos relations, vous pourriez donner une image quelque peu stricte, il est donc bon de discuter avec un peu d\'humour doux occasionnellement.\n\n⚠️ [Précautions]\nFaites attention à la santé des os ou des articulations, et aux maladies respiratoires. Calmez-vous également avec l\'idée que \'c\'est suffisant\' car vous pourriez vous en prendre à vous-même en raison de tendances perfectionnistes.';

  @override
  String get sajuFortune2025Sin =>
      '💎 Fortune générale de l\'année Eulsa 2025 (Métal-Sin) : \'Une année où la sagesse brille au milieu du changement\'\n\n2025 est une année où l\'énergie de \'Pyeon-jae\' et \'Jeong-gwan\' entre en jeu pour vous. C\'est comme un bijou sophistiqué révélant sa valeur sous un éclairage brillant. Ce sera une année plaisante où le statut social s\'élève en même temps que des gains inattendus.\n\n💼 [Carrière et Affaires]\nLe sens des affaires s\'améliore et la capacité à saisir de nouvelles opportunités est excellente. Une période où les défis audacieux rapportent de grands profits. Au sein de l\'organisation, vous gagnez la confiance grâce à un jugement rationnel et saisissez des opportunités de promotion ou de transfert. Cependant, veillez à ne pas négliger le processus en vous concentrant trop sur les résultats.\n\n💰 [Richesse]\nUne année où la chance financière entre en jeu. Des opportunités de toucher une grande richesse comme des retours sur investissement inattendus ou un héritage se présentent. Cependant, comme les dépenses pourraient aussi devenir luxueuses, il est important de maintenir des habitudes de dépenses planifiées.\n\n❤️ [Amour et Relations]\nVous devenez le protagoniste des rassemblements sociaux avec une apparence soignée et attrayante. La chance de rencontre est très forte, vous pourriez recevoir des avances de nombreuses personnes. Dans les relations amoureuses, vous passez des moments passionnés et agréables. Une bonne année pour développer une relation sérieuse.\n\n⚠️ [Précautions]\nFaites attention à la santé des poumons ou aux maladies de peau. Maintenez toujours l\'humilité et n\'oubliez pas de considérer les autres car vous pourriez paraître arrogant à cause d\'un excès de confiance.';

  @override
  String get sajuFortune2025Im =>
      '🌊 Fortune générale de l\'année Eulsa 2025 (Eau-Im) : \'Obtenir des résultats en exerçant sa sagesse\'\n\n2025 est une année où l\'énergie de \'Sang-gwan\' et \'Pyeon-jae\' entre en jeu pour vous. C\'est comme une grande rivière serpentant et humidifiant un large champ. Ce sera une année dynamique où vous gagnerez une grande richesse et étendrez votre champ d\'activité en exerçant vos talents et votre éloquence.\n\n💼 [Carrière et Affaires]\nL\'éloquence s\'améliore et vous obtenez d\'excellents résultats dans les domaines du marketing ou des relations publiques. Un très bon moment pour commercialiser vos idées ou défricher de nouveaux marchés. Ce sera la meilleure année pour ceux qui font un travail créatif. Cependant, il est important d\'être poli car il pourrait y avoir des frictions avec les chefs.\n\n💰 [Richesse]\nLa chance de richesse bouge activement. La chance de gagner de l\'argent avec vos propres compétences est forte, et les opportunités de brasser beaucoup d\'argent arrivent. Cependant, la prudence est de mise pour les investissements spéculatifs, et la chance de richesse ne se maintiendra longtemps que si vous avez l\'esprit de donner autant que vous avez gagné.\n\n❤️ [Amour et Relations]\nGrâce à votre humour et votre charme débordants, les gens ne cessent d\'être autour de vous. Une année où vous pouvez profiter de rencontres agréables avec une grande popularité auprès du sexe opposé. Dans les relations amoureuses, vous insufflez de la vie par divers rendez-vous. Cependant, attention car une seule parole légère pourrait causer un malentendu.\n\n⚠️ [Précautions]\nFaites attention à la santé du système rénal ou urologique. Portez également attention à un repos et une nutrition appropriés car votre force physique pourrait s\'épuiser à cause d\'un large champ d\'activité.';

  @override
  String get sajuFortune2025Gye =>
      '💧 Fortune générale de l\'année Eulsa 2025 (Eau-Gye) : \'Une année de sincérité produisant des fruits stables\'\n\n2025 est une année où l\'énergie de \'Sik-sin\' et \'Jeong-jae\' entre en jeu pour vous. C\'est comme une petite bruine claire humidifiant la terre pour préparer une riche récolte. Ce sera une année chaleureuse où vos efforts s\'accumulent régulièrement et reviennent sous la forme d\'une richesse et d\'un bonheur stables.\n\n💼 [Carrière et Affaires]\nUne année où la sincérité devient votre meilleure arme. Vous produisez des résultats constants en assumant vos responsabilités et gagnez la confiance de vos collègues. Un bon moment pour accroître votre expertise, et vous vous sentirez récompensé par un travail que vous aimez. Vous pouvez grandir pas à pas dans un environnement stable.\n\n💰 [Richesse]\nUne année économiquement détendue et stable. Un revenu régulier apparaît, et vous ressentirez le plaisir d\'augmenter vos actifs de manière frugale. Il y a de la chance en matière de nourriture et de vêtements, l\'abondance est donc présente dans l\'ensemble de la vie. L\'épargne est plus avantageuse que les investissements déraisonnables.\n\n❤️ [Amour et Relations]\nVous apportez du réconfort à votre partenaire par une apparence chaleureuse. Une année où vous cultivez un bel amour tout en vous considérant méticuleusement. Si vous êtes célibataire, vous êtes très susceptible de rencontrer un partenaire qui communique bien et partage des valeurs similaires.\n\n⚠️ [Précautions]\nFaites attention à la santé de l\'estomac ou à la gestion des habitudes alimentaires. Il est bon de trouver de la vitalité en apportant de nouveaux stimuli occasionnellement car vous pourriez devenir paresseux en vous installant dans le confort.';

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
  String get general => 'Général';

  @override
  String get darkMode => 'Mode Sombre';

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
  String get weatherConditionPartlyCloudy => 'Partly Cloudy';

  @override
  String get weatherConditionCloudy => 'Nuageux';

  @override
  String get weatherConditionFoggy => 'Brumeux';

  @override
  String get weatherConditionDrizzle => 'Drizzle';

  @override
  String get weatherConditionRainy => 'Pluvieux';

  @override
  String get weatherConditionFreezingRain => 'Freezing Rain';

  @override
  String get weatherConditionSnowy => 'Neigeux';

  @override
  String get weatherConditionSnowGrains => 'Snow Grains';

  @override
  String get weatherConditionRainShowers => 'Rain Showers';

  @override
  String get weatherConditionSnowShowers => 'Snow Showers';

  @override
  String get weatherConditionThunderstorm => 'Orage';

  @override
  String get airQualityGood => 'Bon';

  @override
  String get airQualityNormal => 'Normal';

  @override
  String get airQualityBad => 'Mauvais';

  @override
  String get airQualityVeryBad => 'Très Mauvais';

  @override
  String get locationUnknown => 'Lieu Inconnu';

  @override
  String get locationError => 'Erreur de Localisation';

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
  String get allowAllItems => 'Please allow all items';

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
  String get fortunePass => 'Fortune Pass';

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
  String minutesLater(int minutes) {
    return '$minutes min plus tard';
  }

  @override
  String get countLabel => 'Nombre';

  @override
  String timesCount(int count) {
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
  String get save => 'Enregistrer';

  @override
  String get missionNone => 'Aucune Mission';

  @override
  String get missionSnap => 'Object Snap';

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
    return 'Time: ${seconds}s';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'Best: ${seconds}s';
  }

  @override
  String get fortuneCatchAngryHint => 'Angry Fortuny is a penalty!';

  @override
  String get fortuneCatchInstruction => 'Avoid angry Fortuni and catch them!';

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
  String missionSnoozeMessage(int minutes) {
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
  String get defaultRingtone => 'Sonnerie par défaut';

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
  String get turnOffAlarm => 'Éteindre l\'alarme';

  @override
  String get startMission => 'Commencer la mission';

  @override
  String get alarmSnooze => 'Répéter';

  @override
  String snoozeMinutesUnlimited(int minutes) {
    return '$minutes min (illimité)';
  }

  @override
  String snoozeMinutesCount(int minutes, int current, int total) {
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
  String get tarotName1 => 'Le Magicien';

  @override
  String get tarotName2 => 'La Grande Prêtresse';

  @override
  String get tarotName3 => 'L\'Impératrice';

  @override
  String get tarotName4 => 'L\'Empereur';

  @override
  String get tarotName5 => 'Le Hiérophante';

  @override
  String get tarotName6 => 'Les Amoureux';

  @override
  String get tarotName7 => 'Le Chariot';

  @override
  String get tarotName8 => 'La Force';

  @override
  String get tarotName9 => 'L\'Ermite';

  @override
  String get tarotName10 => 'La Roue de la Fortune';

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
  String get tarotKeywords1 =>
      'Création, Volonté, Capacité, Réalisation, Polyvalence';

  @override
  String get tarotDescription1 =>
      'Le magicien porte une robe rouge, une main pointée vers le ciel et l\'autre vers le sol, apportant le pouvoir céleste sur terre. Il y a quatre éléments (bâton, coupe, épée, denier) sur la table, ce qui signifie que vous avez déjà tous les outils et capacités pour atteindre vos objectifs.';

  @override
  String get tarotLoveMeaning1 =>
      'C\'est une période où votre charme est à son apogée et où vous êtes populaire auprès du sexe opposé. Si vous êtes dans une relation naissante, vous pouvez développer la relation avec votre discours spirituel et prendre les devants.';

  @override
  String get tarotLoveDetail1 =>
      'C\'est une excellente occasion de capturer le cœur du sexe opposé alors que votre charme et votre talent brillent. S\'il y a quelqu\'un qui vous plaît, n\'hésitez pas à l\'approcher activement. Votre sens de l\'humour et votre conversation sensée raviront l\'autre personne et vous permettront de mener la relation de manière proactive. Si vous êtes célibataire, vous pouvez être approché par plusieurs personnes, et si vous êtes en couple, l\'autre personne sera grandement émue si vous menez la sortie ou préparez un événement. Gagnez l\'amour avec confiance.';

  @override
  String get tarotWealthMeaning1 =>
      'C\'est le bon moment pour générer des revenus en utilisant vos capacités et vos compétences. Si vous concrétisez les idées que vous avez en tête, cela mènera à des résultats financiers.';

  @override
  String get tarotWealthDetail1 =>
      'C\'est le moment où vos connaissances, vos compétences et vos idées deviennent de l\'argent. Ne vous contentez pas d\'un salaire ; générez des revenus supplémentaires via des activités secondaires ou en freelance. Votre planification créative, votre capacité de vente et votre aisance à l\'oral seront d\'excellents atouts, entraînant des revenus plus élevés que prévu. Comme votre jugement est susceptible de viser juste dans la gestion des fonds, vous obtiendrez de bons résultats si vous établissez de manière proactive un plan financier et le mettez en pratique.';

  @override
  String get tarotSuccessMeaning1 =>
      'Votre capacité de travail sera excellemment démontrée et reconnue par votre entourage. Si vous avez quelque chose de prévu, c\'est le moment de le mettre en pratique.';

  @override
  String get tarotSuccessDetail1 =>
      'Vous pouvez vous démarquer sur votre lieu de travail ou dans vos études en utilisant pleinement vos capacités. Quel que soit le problème auquel vous faites face, vous pouvez le résoudre avec votre propre esprit et votre humour, et vous serez reconnu comme une \'personne capable\' par vos collègues ou supérieurs. Si vous prenez la tête d\'un nouveau projet ou faites une présentation importante, vous pouvez la terminer avec succès. Tout comme les opportunités viennent à ceux qui sont préparés, vous l\'êtes déjà pleinement. Croyez en vous et montrez vos compétences avec confiance comme un protagoniste sur scène.';

  @override
  String get policy => 'Conditions et Confidentialité';

  @override
  String get support => 'Support';

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
  String get times => 'fois';

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
  String categoryMissions(Object category) {
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
  String get notificationTime => 'Heure de notification';

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
  String hourFormat(Object hour) {
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
  String get luckyNumberGenerating => 'Génération des numéros chance...';

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
      'La meilleure compatibilité que vous puissiez demander. Ne vous laissez pas partir !';

  @override
  String get compatibilityTitleGreat => 'Une très bonne relation 💕';

  @override
  String get compatibilityDescGreat =>
      'Un excellent partenaire qui est un grand soutien l\'un pour l\'autre.';

  @override
  String get compatibilityTitleGood => 'Un couple bien assorti 😊';

  @override
  String get compatibilityDescGood =>
      'Il y a quelques différences, mais vous pouvez avoir un bel amour tout en vous ajustant l\'un à l\'autre.';

  @override
  String get compatibilityTitleEffort => 'Des efforts sont nécessaires 🧐';

  @override
  String get compatibilityDescEffort =>
      'Il y a beaucoup de différences. La compréhension et la considération sont les clés de la relation.';

  @override
  String get compatibilityTitleDifficult => 'Besoin de beaucoup s\'ajuster 😅';

  @override
  String get compatibilityDescDifficult =>
      'Les différences de personnalité peuvent être importantes. Vous devez comprendre profondément les différences de chacun.';

  @override
  String get compatibilityResultButton => 'Voir le résultat de compatibilité';

  @override
  String get compatibilityDeleteTooltip => 'Supprimer';

  @override
  String get compatibilityGenderMale => 'Homme';

  @override
  String get compatibilityGenderFemale => 'Femme';

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
  String tojeongShareTitle(Object year) {
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
  String tojeongCoreMessage(Object hasu, Object jungsu, Object sangsu) {
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
}
