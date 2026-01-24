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
  String get fortuneCookie => 'Fortune Cookie';

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
  String get checkTodaysFortune => 'Vérifier la fortune du jour';

  @override
  String get todaysAdvice => 'Le conseil du jour des étoiles mystérieuses';

  @override
  String get viewSpecificDateFortune =>
      'Voir la fortune pour une date spécifique';

  @override
  String get lottoRecommendation => 'Recommandation Loto';

  @override
  String get luckyNumber => 'Numéro Chance';

  @override
  String get specificDateFortune => 'Fortune Date Spécifique';

  @override
  String get specialDayFortune => 'Fortune Jour Spécial';

  @override
  String get newYearFortune => 'Fortune Nouvel An';

  @override
  String get totalFortune2026 => 'Fortune Totale 2026';

  @override
  String get traditionalFortune => 'Fortune Traditionnelle';

  @override
  String get traditionalSaju => 'Analyse Saju Traditionnelle';

  @override
  String get faceReading => 'Lecture du visage';

  @override
  String get missionFaceReading => 'Mission Lecture Visage';

  @override
  String get faceFate => 'Destin du Visage';

  @override
  String get compatibility => 'Compatibilité';

  @override
  String get relationshipHarmony => 'Harmonie Relationnelle';

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
  String get weatherConditionCloudy => 'Nuageux';

  @override
  String get weatherConditionFoggy => 'Brumeux';

  @override
  String get weatherConditionRainy => 'Pluvieux';

  @override
  String get weatherConditionSnowy => 'Neigeux';

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
  String get gallery => 'Galerie';

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
  String get interval => 'Intervalle';

  @override
  String get wakeUpAlarm => 'Alarme de réveil';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval min, $count fois';
  }

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
  String get none => 'Aucun';

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
  String get shakeCount => 'Nombre de secousses';

  @override
  String shakeTimes(int count) {
    return '$count fois';
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
  String get defaultVibration => 'Vibration par défaut';

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
  String get permissionRequired => 'Permission Requise';

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
  String get cameraMissionSequentialImageError =>
      'Veuillez définir les images de mission dans l\'ordre.';

  @override
  String errorOccurred(String error) {
    return 'Une erreur est survenue : $error';
  }

  @override
  String get openSettings => 'Ouvrir les paramètres';

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
  String fortuneSelectTitleDate(int month, int day) {
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
  String fortuneResultTitleDate(int year, int month, int day) {
    return 'Fortune pour le $year/$month/$day';
  }

  @override
  String get startDayButton => 'Commencez votre journée';

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
  String get copyEmailAction => 'Copier l\'adresse e-mail';

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
}
