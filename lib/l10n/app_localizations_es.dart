// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => '¡Buenos días! Comienza tu día de suerte.';

  @override
  String get missionWakeUp => 'Misión de Despertador';

  @override
  String get missionSupplement => 'Tomar suplementos';

  @override
  String get missionWater => 'Beber más de 2L de agua';

  @override
  String get fortuneCookie => 'Galleta de la Fortuna';

  @override
  String get settings => 'Ajustes';

  @override
  String get alarm => 'Alarma';

  @override
  String get calendar => 'Calendario';

  @override
  String get mission => 'Misión';

  @override
  String get fortune => 'Fortuna';

  @override
  String get congratulations => '¡Felicidades!';

  @override
  String get allMissionsCompleted => 'Has completado las 5 misiones de hoy.';

  @override
  String get rewardReceived =>
      '¡Recibiste 1 Galleta de la Fortuna como recompensa! 🥠';

  @override
  String get confirm => 'Confirmar';

  @override
  String get exactAlarmPermissionRequired =>
      'Se requiere el permiso \"Alarma exacta\" para que suene a la hora correcta.';

  @override
  String get overlayPermissionRequired =>
      'Se requiere el permiso \"Mostrar sobre otras apps\" para notificaciones en pantalla completa.';

  @override
  String get deleteAllAlarms => 'Eliminar todas las alarmas';

  @override
  String get noAlarms => 'No hay alarmas registradas.';

  @override
  String get lessThanAMinuteRemaining => 'Sonará en menos de un minuto';

  @override
  String hoursMinutesRemaining(int hours, int minutes) {
    return 'Sonará en ${hours}h ${minutes}m';
  }

  @override
  String minutesRemaining(int minutes) {
    return 'Sonará en ${minutes}m';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward =>
      'Recompensa Diaria de Galleta de la Fortuna';

  @override
  String get missionRewardInfo =>
      '¡1 galleta por 5 misiones exitosas, 2 por 10!';

  @override
  String get dailyMission => 'Misión Diaria';

  @override
  String goalAchieved(int completed) {
    return '🎉 ¡$completed/5 Objetivo Logrado!';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 Logrado';
  }

  @override
  String get myMissionRecord => 'Mi Registro de Misiones';

  @override
  String get consecutiveSuccess => 'Consecutivo';

  @override
  String get successRate30Days => 'Tasa de éxito (30d)';

  @override
  String get totalSuccess => 'Éxito Total';

  @override
  String get inProgress => 'En Progreso 🔥';

  @override
  String get resetMissions => 'Restablecer Misiones';

  @override
  String get resetMissionsConfirm =>
      '¿Quieres restablecer todas las listas de desafíos?\n(Excluyendo misiones básicas del sistema)';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Restablecer';

  @override
  String get addMission => 'Añadir Misión';

  @override
  String get completedMissions => 'Misiones Completadas';

  @override
  String get noCompletedMissionsHint =>
      'Aún no hay misiones completadas. Alcanza el objetivo de hoy.';

  @override
  String greeting(String userName) {
    return 'Hola, $userName';
  }

  @override
  String get welcomeFortune => 'Bienvenido al misterioso mundo de la fortuna';

  @override
  String get luckyColor => 'Color de la Suerte';

  @override
  String get luckyItem => 'Objeto de la Suerte';

  @override
  String get luckyDirection => 'Dirección de la Suerte';

  @override
  String get viewVariousFortunes => 'Ver varias fortunas';

  @override
  String get todaysRecommendation => 'Recomendación de hoy';

  @override
  String get checkTodaysFortune => 'Ver fortuna de hoy';

  @override
  String get todaysAdvice => 'El consejo de hoy de las estrellas misteriosas';

  @override
  String get viewSpecificDateFortune => 'Ver fortuna para fecha específica';

  @override
  String get lottoRecommendation => 'Recomendación de Loto';

  @override
  String get luckyNumber => 'Número de la Suerte';

  @override
  String get specificDateFortune => 'Fortuna Fecha Específica';

  @override
  String get specialDayFortune => 'Fortuna Día Especial';

  @override
  String get newYearFortune => 'Fortuna Año Nuevo';

  @override
  String get totalFortune2026 => 'Fortuna Total 2026';

  @override
  String get traditionalFortune => 'Fortuna Tradicional';

  @override
  String get traditionalSaju => 'Análisis Saju Tradicional';

  @override
  String get faceReading => 'Lectura de Rostro';

  @override
  String get missionFaceReading => 'Misión Lectura Rostro';

  @override
  String get faceFate => 'Destino del Rostro';

  @override
  String get compatibility => 'Compatibilidad';

  @override
  String get relationshipHarmony => 'Armonía en la Relación';

  @override
  String get general => 'General';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get darkModeDescription => 'Poner la pantalla en modo oscuro.';

  @override
  String get alarmSettings => 'Ajustes de Alarma';

  @override
  String get privacySettings => 'Ajustes de Privacidad';

  @override
  String get information => 'Información';

  @override
  String get notice => 'Aviso';

  @override
  String get weatherConditionSunny => 'Soleado';

  @override
  String get weatherConditionCloudy => 'Nublado';

  @override
  String get weatherConditionFoggy => 'Neblinoso';

  @override
  String get weatherConditionRainy => 'Lluvioso';

  @override
  String get weatherConditionSnowy => 'Nevado';

  @override
  String get weatherConditionThunderstorm => 'Tormenta';

  @override
  String get airQualityGood => 'Bueno';

  @override
  String get airQualityNormal => 'Normal';

  @override
  String get airQualityBad => 'Malo';

  @override
  String get airQualityVeryBad => 'Muy Malo';

  @override
  String get locationUnknown => 'Ubicación Desconocida';

  @override
  String get locationError => 'Error de Ubicación';

  @override
  String get faq => 'FAQ';

  @override
  String get sendFeedback => 'Enviar Comentarios';

  @override
  String get feedbackDescription =>
      'Por favor comparte cualquier comentario o sugerencia sobre Fortune Alarm.\nTu opinión nos ayuda a mejorar.';

  @override
  String get reportCopyright => 'Reportar Infracción de Derechos de Autor';

  @override
  String get copyrightDescription =>
      'Si crees que el contenido en Fortune Alarm infringe los derechos de autor, repórtalo por correo electrónico.\nTomaremos medidas inmediatas tras la confirmación.';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get privacyPolicy =>
      'Términos de Servicio y Política de Privacidad\n\n1. Disposiciones Generales\n\nArtículo 1 (Propósito)\nEl propósito de estos Términos es definir las condiciones y procedimientos para usar el servicio proporcionado por \'Fortune Alarm\' (en adelante, el \'Servicio\'), así como los derechos, obligaciones y responsabilidades de los usuarios y el desarrollador.\n\nArtículo 2 (Política de Privacidad)\n\n1. Elementos y Método de Recopilación de Información Personal\nEste Servicio se puede utilizar sin registro de membresía y no almacena ni recopila información personal de los usuarios en un servidor separado.\nSin embargo, la siguiente información puede generarse y almacenarse en el dispositivo durante el uso del Servicio:\n- Ajustes de alarma, registros de finalización de misiones, historial de adquisición de galletas de la fortuna, etc.\n\n2. Información sobre el Uso de Permisos del Dispositivo\nEl Servicio utiliza los siguientes permisos en la medida mínima necesaria para proporcionar el Servicio:\n- Notificaciones (Requerido): Usado para la ejecución de alarmas y notificaciones de galletas de la fortuna.\n- Alarma Exacta y Exclusión de Optimización de Batería (Requerido): Usado para asegurar que las alarmas suenen a tiempo incluso en modo de ahorro de energía.\n- Mostrar sobre otras apps (Requerido): Usado para mostrar la pantalla de alarma en la pantalla de bloqueo o mientras se usan otras aplicaciones.\n- Cámara (Opcional): Usado solo para la misión \'Object Snap\'; las imágenes capturadas se procesan solo en el dispositivo y no se transmiten a un servidor.\n\n3. Servicios de Publicidad y Procesamiento de Datos\nEste Servicio utiliza Google AdMob para mostrar anuncios y proporcionar el servicio de forma gratuita.\nGoogle puede recopilar cierta información no identificable personalmente, como el ID de publicidad (ADID), para la configuración de anuncios personalizados.\n- Política de Privacidad de Google: https://policies.google.com/privacy\n\nArtículo 3 (Almacenamiento y Eliminación de Datos)\nEste Servicio es una aplicación local que almacena datos en el dispositivo del usuario.\nSi eliminas la aplicación, todos los datos almacenados en el dispositivo (alarmas, registros de misiones, etc.) se eliminarán inmediatamente y no se podrán recuperar.';

  @override
  String get alarmOptimization => 'Optimización de Sonido de Alarma';

  @override
  String get allOptimizationsCompleted =>
      'Todos los ajustes de optimización completados';

  @override
  String get optimizationNeeded =>
      'Se requieren ajustes para alarmas precisas.';

  @override
  String get optimizationDescription =>
      'Las alarmas pueden retrasarse o no sonar debido a la configuración del sistema Android. Por favor, establece todos los elementos en permitido.';

  @override
  String get allowNotificationPermission => 'Permitir Permiso de Notificación';

  @override
  String get notificationPermissionDescription =>
      'Requerido para mostrar notificaciones cuando ocurre una alarma.';

  @override
  String get excludeBatteryOptimization => 'Excluir Optimización de Batería';

  @override
  String get batteryOptimizationDescription =>
      'Asegura que la alarma suene inmediatamente incluso en modo de ahorro de energía.';

  @override
  String get allowExactAlarm => 'Permitir Alarma Exacta';

  @override
  String get exactAlarmDescription =>
      'Hace sonar la alarma a tiempo sin ser retrasada por el sistema.';

  @override
  String get drawOverOtherApps => 'Mostrar sobre otras apps';

  @override
  String get overlayDescription =>
      'Muestra la pantalla de alarma incluso en la pantalla de bloqueo o mientras usas otras apps.';

  @override
  String get allSettingsCompleted => 'Todos los ajustes están completados.';

  @override
  String get manualSettingsInfo =>
      'Puedes desactivar los ajustes directamente en la configuración del sistema Android.';

  @override
  String get takePhoto => 'Tomar Foto';

  @override
  String get selectPhoto => 'Seleccionar Foto';

  @override
  String get selectAlarmBackground => 'Fondo de Alarma';

  @override
  String get defaultLabel => 'Predeterminado';

  @override
  String get howToAdd => 'Cómo Añadir';

  @override
  String get addAssetInstructions =>
      'Pon la imagen en la carpeta assets/images/ y regístrala en pubspec.yaml.';

  @override
  String get gallery => 'Galería';

  @override
  String get ringingNow => 'Sonando Ahora';

  @override
  String get setTime => 'Establecer Hora';

  @override
  String get repeatDays => 'Días de Repetición';

  @override
  String get repeatDaily => 'Repetir Diariamente';

  @override
  String get snoozeSettings => 'Ajustes de Posponer';

  @override
  String get interval => 'Intervalo';

  @override
  String get wakeUpAlarm => 'Alarma de Despertador';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval min, $count veces';
  }

  @override
  String get daySun => 'Dom';

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mié';

  @override
  String get dayThu => 'Jue';

  @override
  String get dayFri => 'Vie';

  @override
  String get daySat => 'Sáb';

  @override
  String get missionRewardEarned =>
      '¡Felicidades! ¡Has completado 5 misiones hoy y ganaste 1 Galleta de la Fortuna!';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return '¡Felicidades! ¡Completaste $missions misiones hoy y ganaste $cookies Galleta(s) de la Fortuna!';
  }

  @override
  String daysCount(int count) {
    return '$count días';
  }

  @override
  String get user => 'Usuario';

  @override
  String get none => 'Ninguno';

  @override
  String minutesLater(int minutes) {
    return '$minutes min después';
  }

  @override
  String get countLabel => 'Cantidad';

  @override
  String timesCount(int count) {
    return 'Total $count veces';
  }

  @override
  String get wakeUpMission => 'Misión de Despertador';

  @override
  String get alarmSound => 'Sonido de Alarma';

  @override
  String get gradualVolume => 'Volumen Gradual';

  @override
  String get vibration => 'Vibración';

  @override
  String get alarmNameAndBackground => 'Nombre y Fondo de Alarma';

  @override
  String get customStyle => 'Estilo Personalizado';

  @override
  String get alarmName => 'Nombre de Alarma';

  @override
  String get enterAlarmName => 'Por favor ingresa nombre de alarma';

  @override
  String get save => 'Guardar';

  @override
  String get missionNone => 'Sin Misión';

  @override
  String get missionSnap => 'Object Snap';

  @override
  String get missionMath => 'Problema Matemático';

  @override
  String get missionFortune => 'Fortuna';

  @override
  String get missionShake => 'Agitar';

  @override
  String get missionFortuneCatch => 'Atrapar Fortuna';

  @override
  String get missionNoDescription => 'La alarma sonará sin misión.';

  @override
  String get missionCameraDescription =>
      'Toma una foto del objeto especificado para apagar la alarma.';

  @override
  String get missionMathDescription =>
      'Resuelve problemas matemáticos para despertar tu cerebro.';

  @override
  String get missionFortuneDescription =>
      'Apaga la alarma y revisa tu fortuna de hoy.';

  @override
  String get missionShakeDescription =>
      'Debes agitar tu teléfono para apagar la alarma.';

  @override
  String get missionFortuneCatchDescription =>
      '¡Atrapa al Fortuni en movimiento!';

  @override
  String get missionWalk => 'Caminar';

  @override
  String get missionWalkDescription => '¡Camina para apagar la alarma!';

  @override
  String get missionFaceDescription => 'Mantén tu rostro en el marco por 5s.';

  @override
  String get walkStepCount => 'Pasos Objetivo';

  @override
  String walkSteps(int count) {
    return '$count pasos';
  }

  @override
  String get missionNumberOrder => 'Orden Numérico';

  @override
  String get missionNumberOrderDescription =>
      'Toca los números del 1 al 9 en orden.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Siguiente: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Memoria de Posición';

  @override
  String get missionHiddenButtonDescription =>
      'Memoriza las baldosas iluminadas en orden y tócalas en 10 segundos.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Sprint Táctil';

  @override
  String get missionTapSprintDescriptionShort => 'Toca para llenar el medidor.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Toca $goalTaps+ veces para llenar el medidor.';
  }

  @override
  String get missionTapSprintTapHere => 'Toca';

  @override
  String get missionTapSprintHint => 'Se llena rápido, se vacía si pausas.';

  @override
  String get missionLeftRight => 'Izquierda / Derecha';

  @override
  String get missionLeftRightDescriptionShort =>
      'Sigue la indicación y elige izquierda o derecha.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'Obtén $targetStreak correctos seguidos.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Toca IZQUIERDA';

  @override
  String get missionLeftRightPromptRight => 'Toca DERECHA';

  @override
  String get left => 'Izquierda';

  @override
  String get right => 'Derecha';

  @override
  String get missionHintInactivity =>
      'Si te detienes por 2 minutos, se reinicia.';

  @override
  String fortuneCatchScore(int score) {
    return 'Puntuación: $score';
  }

  @override
  String get fortuneCatchGoal => 'Objetivo: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(Atrapados: $count/$min)';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '¡$combo Combo!';
  }

  @override
  String get difficulty => 'Dificultad';

  @override
  String get difficultyEasy => 'Fácil';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyHard => 'Difícil';

  @override
  String get problemCount => 'Número de Problemas';

  @override
  String problemsCount(int count) {
    return '$count Problemas';
  }

  @override
  String get shakeCount => 'Conteo de Agitación';

  @override
  String shakeTimes(int count) {
    return '$count veces';
  }

  @override
  String missionNumber(int number) {
    return 'Misión $number';
  }

  @override
  String get soundBirds => 'Sonidos de Pájaros';

  @override
  String get shakeCountLabel => 'Número de Agitaciones';

  @override
  String missionIndex(int index) {
    return 'Misión $index';
  }

  @override
  String get ringtoneSelect => 'Seleccionar Tono';

  @override
  String get vibrationSelect => 'Seleccionar Patrón de Vibración';

  @override
  String get defaultRingtone => 'Tono Predeterminado';

  @override
  String get classicAlarm => 'Alarma Clásica';

  @override
  String get digitalAlarm => 'Alarma Digital';

  @override
  String get birdsSound => 'Pájaros Cantando';

  @override
  String get wavesSound => 'Olas del Océano';

  @override
  String get defaultVibration => 'Vibración Predeterminada';

  @override
  String get shortVibration => 'Repetición Corta';

  @override
  String get longVibration => 'Repetición Larga';

  @override
  String get heartbeatVibration => 'Latido';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => 'Ritmo Rápido';

  @override
  String get permissionRequired => 'Permiso Requerido';

  @override
  String get exactAlarmPermissionDesc =>
      'Para hacer sonar la alarma a la hora exacta, se requiere el permiso \"Calendario y recordatorios\".';

  @override
  String get batteryOptimizationPermissionDesc =>
      'La optimización de batería debe estar desactivada para que la alarma suene a tiempo.';

  @override
  String get overlayPermissionDesc =>
      'Para mostrar la pantalla de misión cuando suena la alarma, se requiere el permiso \"Mostrar sobre otras apps\".';

  @override
  String get cameraMissionFirstImageError =>
      'Por favor establece al menos la primera imagen de misión.';

  @override
  String get cameraMissionSequentialImageError =>
      'Por favor establece las imágenes de misión en orden.';

  @override
  String errorOccurred(String error) {
    return 'Ocurrió un error: $error';
  }

  @override
  String get openSettings => 'Abrir Ajustes';

  @override
  String get exactAlarmPermissionFail =>
      'Error al registrar alarma. El permiso de alarma exacta está desactivado y debe configurarse.';

  @override
  String get batteryOptimizationPermissionFail =>
      'Error al registrar alarma. Falta el permiso de excepción de optimización de batería y debe configurarse.';

  @override
  String get overlayPermissionFail =>
      'Error al registrar alarma. Falta el permiso \"Mostrar sobre otras apps\" y debe configurarse.';

  @override
  String get unknownAlarmError =>
      'Error al registrar alarma. Ocurrió un error desconocido.';

  @override
  String get resetTooltip => 'Restablecer';

  @override
  String get errorLoadingAlarm => 'Error al cargar información de alarma.';

  @override
  String get alarmNotFound => 'Información de alarma no encontrada.';

  @override
  String repeatAlarmCount(int current, int max) {
    return 'Alarma de Posponer ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'Apagar Alarma';

  @override
  String get startMission => 'Iniciar Misión';

  @override
  String get alarmSnooze => 'Posponer';

  @override
  String get fortuneTitle => 'Ver Fortuna';

  @override
  String get fortuneMessage =>
      '¡Revisa tus resultados de fortuna\ny obtén regalos ocultos!';

  @override
  String get fortuneAdButton => 'Ver Anuncio y Revisar Resultados';

  @override
  String get fortuneLoadingMessage =>
      'Experimenta la interpretación especial del tarot del adivino.';

  @override
  String fortuneAnalyzing(int progress) {
    return 'Analizando tu tarot seleccionado... $progress%';
  }

  @override
  String get fortuneSelectTitle =>
      'Piensa en la energía de hoy\ny selecciona 3 cartas.';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return 'Piensa en la energía del $month/$day\ny selecciona 3 cartas.';
  }

  @override
  String get fortuneNewYearButton => 'Ver Fortuna de Año Nuevo 2026';

  @override
  String get loveFortune => 'Amor';

  @override
  String get wealthFortune => 'Riqueza';

  @override
  String get successFortune => 'Éxito';

  @override
  String get fortuneResultTitle =>
      'Aquí está tu resultado de fortuna para hoy.';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return 'Fortuna para el $year/$month/$day';
  }

  @override
  String get startDayButton => 'Comienza Tu Día';

  @override
  String get policy => 'Términos y Privacidad';

  @override
  String get support => 'Soporte';

  @override
  String get defaultAlarmBehavior => 'Comportamiento de Alarma Predeterminado';

  @override
  String get defaultAlarmVolume => 'Volumen de Alarma Predeterminado';

  @override
  String get defaultAlarmVolumeDescription =>
      'El volumen predeterminado aplicado al crear una nueva alarma.';

  @override
  String get gradualVolumeDescription =>
      'Ajusta el sonido de la alarma para que aumente gradualmente.';

  @override
  String get defaultVibrationDescription =>
      'Habilita la vibración por defecto al crear una nueva alarma.';

  @override
  String get defaultInterval => 'Intervalo Predeterminado';

  @override
  String get maxSnoozeCountLabel => 'Conteo Máx de Posponer';

  @override
  String get minutes => 'min';

  @override
  String get times => 'veces';

  @override
  String cupsCount(int current, int goal) {
    return '($current/$goal tazas)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current/$goal veces)';
  }

  @override
  String get missionGym => 'Ir al Gimnasio';

  @override
  String get missionWorkout => 'Entrenamiento en Casa';

  @override
  String get missionDiary => 'Escribir Diario';

  @override
  String get missionBedMaking => 'Hacer la Cama';

  @override
  String get missionStretching => 'Estiramiento';

  @override
  String get missionReading => 'Lectura 10min';

  @override
  String get missionPlanning => 'Planificar el Día';

  @override
  String get missionBreakfast => 'Comer Desayuno';

  @override
  String get missionMeditation => 'Meditación 5min';

  @override
  String get missionLearnWords => 'Aprender 5 Palabras';

  @override
  String get missionVentilation => 'Ventilación';

  @override
  String get missionCleaning => 'Limpiar Habitación';

  @override
  String get missionGratitudeDiary => 'Diario de Gratitud';

  @override
  String get faqQuestion1 => 'Las alarmas no suenan.';

  @override
  String get faqAnswer1 =>
      'Las alarmas pueden retrasarse o bloquearse debido a la función de optimización de batería del sistema Android. Por favor, establece todos los permisos en \'Permitir\' en el menú Ajustes > Optimización de Alarma.';

  @override
  String get faqQuestion2 => 'Quiero cambiar la misión.';

  @override
  String get faqAnswer2 =>
      'Puedes cambiarla a la misión que desees (Matemáticas, Foto, Agitar, etc.) en el menú de selección de misión después de tocar la alarma que deseas editar en la lista de alarmas.';

  @override
  String get faqQuestion3 => '¿Cómo configuro el Modo Oscuro?';

  @override
  String get faqAnswer3 =>
      'Puedes cambiar el tema de la pantalla a través del interruptor Ajustes > General > Modo Oscuro.';

  @override
  String get faqQuestion4 => '¿Cómo recolecto galletas de la fortuna?';

  @override
  String get faqAnswer4 =>
      'Puedes ganar galletas de la fortuna cada vez que apagas una alarma por la mañana o completas una misión. ¡Revisa tu fortuna diaria con las galletas que has recolectado!';

  @override
  String get faqQuestion5 =>
      '¿Desaparecerán mis datos si elimino la aplicación?';

  @override
  String get faqAnswer5 =>
      'Sí, Fortune Alarm almacena datos dentro del dispositivo, por lo que eliminar la aplicación eliminará todas tus alarmas configuradas y registros de misiones. Por favor, ten cuidado.';

  @override
  String get noticeLabel => 'Aviso';

  @override
  String get notice1Title => 'Lanzamiento Oficial de Fortune Alarm';

  @override
  String get notice1Content =>
      'Hola. Fortune Alarm ha sido lanzado oficialmente.\\n\\n¡Revisa tu fortuna diaria con tu alarma cada mañana y comienza un día feliz!\\nContinuaremos proporcionando funciones más diversas y servicios mejorados.\\n\\nGracias.';

  @override
  String get notice2Title => 'Noticias de Actualización Versión 1.0.0';

  @override
  String get notice2Content =>
      'Aquí está el contenido de la actualización versión 1.0.0.\\n\\n1. Mejora de UI de misión de suplementos\\n2. Integración de configuración del sistema para alarmas precisas\\n3. Soporte de modo oscuro\\n4. Corrección de errores y mejoras de estabilidad\\n\\n¡Experimenta la última versión ahora!';

  @override
  String get notice3Title => 'Aviso de Revisión de Términos de Servicio';

  @override
  String get notice3Content =>
      'Los Términos de Servicio han sido revisados.\\n\\nRevisiones clave:\\n- Política de Privacidad fortalecida\\n- Alcance de uso del servicio especificado\\n\\nLos detalles se pueden encontrar en la página Ajustes > Términos.';

  @override
  String get supportContentTitle => 'Contenido de la Consulta';

  @override
  String get supportHint => 'Por favor ingresa el contenido.';

  @override
  String get supportRecipient => 'Destinatario (Soporte al Cliente)';

  @override
  String get emailCopied => 'Dirección de correo copiada.';

  @override
  String get copyTooltip => 'Copiar';

  @override
  String get supportWorkingDays =>
      'Intentaremos responder dentro de las 24 horas en días hábiles.';

  @override
  String get supportEmptyError => 'Por favor ingresa el contenido.';

  @override
  String get supportSubjectPrefix => 'Título de la Consulta';

  @override
  String get supportContentPrefix => 'Contenido de la Consulta';

  @override
  String get supportCopySuccessTitle => 'Consulta Copiada';

  @override
  String supportCopySuccessMessage(String email) {
    return 'El contenido de la consulta ha sido copiado al portapapeles.\\n¿Te gustaría enviar un correo a $email?';
  }

  @override
  String get copyEmailAction => 'Copiar Dirección de Correo';

  @override
  String get copyEmailSuccessMessage =>
      'Dirección de correo copiada. Por favor pégala en tu aplicación de correo.';

  @override
  String get supportSubmitButton => 'Copiar Consulta y Enviar';

  @override
  String get shakePhone => '¡Por favor agita tu teléfono!';

  @override
  String version(String version) {
    return 'Versión $version';
  }

  @override
  String get fortuneCheckButton => 'Ver Fortuna';

  @override
  String get fortuneSelectCards => 'Selecciona 3 cartas';

  @override
  String get fortuneDragCards => 'Arrastra y selecciona 3 cartas';

  @override
  String get fortuneDetailTitle => 'Interpretación Detallada';

  @override
  String get labelFineDust => 'Polvo Fino';

  @override
  String get labelUltraFineDust => 'Polvo Ultra Fino';

  @override
  String get weatherToday => 'Clima de Hoy';

  @override
  String get weatherUpdateMessage =>
      'Actualizando información del clima para la ubicación actual.';

  @override
  String get weatherDisclaimer =>
      'Los datos observados pueden variar según las condiciones locales o el estado de recepción.';

  @override
  String get weatherSource =>
      'Datos del clima proporcionados por servicios confiables';

  @override
  String get locationPermissionTitle => 'Permitir Permiso de Ubicación';

  @override
  String get locationPermissionDesc =>
      'Requerido para mostrar información del clima.';
}
