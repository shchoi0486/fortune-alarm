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
  String get language => 'Idioma';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageJapanese => 'Japonés';

  @override
  String get languageChinese => 'Chino';

  @override
  String get languageRussian => 'Ruso';

  @override
  String get languageHindi => 'Hindi';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languageGerman => 'Alemán';

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
  String get missionSuccess => '¡Misión cumplida!';

  @override
  String get cheeringMessage1 => '¡Que tengas un gran día hoy!';

  @override
  String get cheeringMessage2 => '¡Te estoy apoyando hoy!';

  @override
  String get cheeringMessage3 => 'Va a ser un día maravilloso.';

  @override
  String get todaysCheering => 'Mensaje de hoy';

  @override
  String get notificationWakeUpBody => '¡Hora de despertar!';

  @override
  String get notificationMissionBody =>
      '¡Completa la misión y apaga la alarma!';

  @override
  String get notificationSafetyBody =>
      '¡La alarma se cerró forzosamente! Por favor completa la misión.';

  @override
  String get notificationRingingBody => '¡La alarma está sonando!';

  @override
  String get snoozePrefix => '[Pospuesto]';

  @override
  String get exactAlarmPermissionRequired =>
      'Se requiere el permiso de \"Alarma exacta\" para que la alarma suene a la hora correcta.';

  @override
  String get overlayPermissionRequired =>
      'Se requiere el permiso de \"Mostrar sobre otras aplicaciones\" para notificaciones a pantalla completa.';

  @override
  String get deleteAllAlarms => 'Eliminar todas las alarmas';

  @override
  String get noAlarms => 'No hay alarmas registradas.';

  @override
  String get lessThanAMinuteRemaining => 'Sonará en menos de un minuto';

  @override
  String hoursMinutesRemaining(String hours, String minutes) {
    return 'Sonará en ${hours}h ${minutes}m';
  }

  @override
  String minutesRemaining(String minutes) {
    return 'Sonará en ${minutes}m';
  }

  @override
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get dailyFortuneCookieReward =>
      'Recompensa diaria de galleta de la fortuna';

  @override
  String get missionRewardInfo =>
      '¡1 galleta por 5 misiones exitosas, 2 por 10!';

  @override
  String get dailyMission => 'Misión diaria';

  @override
  String goalAchieved(int completed) {
    return '🎉 ¡$completed/5 Meta lograda!';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 Logrado';
  }

  @override
  String get myMissionRecord => 'Mi récord de misión';

  @override
  String get consecutiveSuccess => 'Consecutivo';

  @override
  String get successRate30Days => 'Tasa de éxito (30d)';

  @override
  String get totalSuccess => 'Éxito total';

  @override
  String get inProgress => 'En progreso 🔥';

  @override
  String get resetMissions => 'Reiniciar misiones';

  @override
  String get resetMissionsConfirm =>
      '¿Quieres reiniciar todas las listas de desafíos?\n(Excluyendo misiones básicas del sistema)';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get addMission => 'Añadir misión';

  @override
  String get completedMissions => 'Misiones completadas';

  @override
  String get noCompletedMissionsHint =>
      'Aún no hay misiones completadas. Alcanza tu meta de misión de hoy.';

  @override
  String greeting(String userName) {
    return 'Hola, $userName';
  }

  @override
  String get welcomeFortune => 'Bienvenido al misterioso mundo de la fortuna';

  @override
  String get luckyColor => 'Color de la suerte';

  @override
  String get luckyItem => 'Objeto de la suerte';

  @override
  String get luckyDirection => 'Dirección afortunada';

  @override
  String get viewVariousFortunes => 'Ver varias fortunas';

  @override
  String get todaysRecommendation => 'Recomendación de hoy';

  @override
  String get checkTodaysFortune => 'Consultar fortuna de hoy';

  @override
  String get todaysAdvice => 'Consejo de hoy';

  @override
  String get viewSpecificDateFortune => 'Ver fortuna de fecha específica';

  @override
  String get luckyNumberRecommendation =>
      'Recomendación de número de la suerte';

  @override
  String get luckyNumber => 'Número de la suerte';

  @override
  String get specificDateFortune => 'Fortuna de fecha específica';

  @override
  String get specialDayFortune => 'Fortuna de día especial';

  @override
  String get newYearFortune => 'Fortuna de Año Nuevo';

  @override
  String get totalFortune2026 => 'Fortuna total 2026';

  @override
  String get traditionalFortune => 'Tojeongbigyeol';

  @override
  String get traditionalSaju => 'Lectura tradicional de Saju';

  @override
  String get faceReading => 'Lectura de rostro';

  @override
  String get missionFaceReading => 'Misión de lectura de rostro';

  @override
  String get faceFate => 'Destino del rostro';

  @override
  String get compatibility => 'Ver compatibilidad';

  @override
  String get relationshipHarmony => 'Armonía en la relación';

  @override
  String get ohaengWood => 'Madera';

  @override
  String get ohaengFire => 'Fuego';

  @override
  String get ohaengEarth => 'Tierra';

  @override
  String get ohaengMetal => 'Metal';

  @override
  String get ohaengWater => 'Agua';

  @override
  String get ohaengWoodSymbol => 'Madera';

  @override
  String get ohaengFireSymbol => 'Fuego';

  @override
  String get ohaengEarthSymbol => 'Tierra';

  @override
  String get ohaengMetalSymbol => 'Metal';

  @override
  String get ohaengWaterSymbol => 'Agua';

  @override
  String get ohaengWoodExplanation =>
      'Con una fuerte energía de Madera (Árbol), estás lleno de crecimiento y motivación, poseyendo una naturaleza compasiva y emprendedora.';

  @override
  String get ohaengFireExplanation =>
      'Con una fuerte energía de Fuego, eres apasionado y educado, con tendencia a ser activo y aficionado a las cosas glamorosas.';

  @override
  String get ohaengEarthExplanation =>
      'Con una fuerte energía de Tierra, tienes confianza y tolerancia, poseyendo una naturaleza grave e inmutable.';

  @override
  String get ohaengMetalExplanation =>
      'Con una fuerte energía de Metal, tienes decisión y lealtad, poseyendo una naturaleza serena que valora los principios.';

  @override
  String get ohaengWaterExplanation =>
      'Con una fuerte energía de Agua, tienes sabiduría y flexibilidad, poseyendo una naturaleza inteligente y altamente adaptable.';

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
  String get jijiAnimalRat => 'Rata';

  @override
  String get jijiAnimalOx => 'Buey';

  @override
  String get jijiAnimalTiger => 'Tigre';

  @override
  String get jijiAnimalRabbit => 'Conejo';

  @override
  String get jijiAnimalDragon => 'Dragón';

  @override
  String get jijiAnimalSnake => 'Serpiente';

  @override
  String get jijiAnimalHorse => 'Caballo';

  @override
  String get jijiAnimalSheep => 'Oveja';

  @override
  String get jijiAnimalMonkey => 'Mono';

  @override
  String get jijiAnimalRooster => 'Gallo';

  @override
  String get jijiAnimalDog => 'Perro';

  @override
  String get jijiAnimalPig => 'Cerdo';

  @override
  String get assetDefaultBackground => 'Fondo Predeterminado';

  @override
  String get assetFortuneyFriends => 'Amigos Fortuney';

  @override
  String get assetMongchuny => 'Mongchuny';

  @override
  String get assetPanchuny => 'Panchuny';

  @override
  String get assetTochuny => 'Tochuny';

  @override
  String get assetHochuny => 'Hochuny';

  @override
  String get assetBear => 'Oso';

  @override
  String get assetMoon => 'Luna';

  @override
  String get assetBridge => 'Puente';

  @override
  String get assetRoad => 'Camino';

  @override
  String get assetSky => 'Cielo';

  @override
  String get assetMinimalGray => 'Gris Minimalista';

  @override
  String get assetDarkMode => 'Modo Oscuro';

  @override
  String get assetSoftBlue => 'Azul Suave';

  @override
  String get assetWarmBeige => 'Beige Cálido';

  @override
  String assetCat(int number) {
    return 'Gato $number';
  }

  @override
  String assetDog(int number) {
    return 'Perro $number';
  }

  @override
  String assetSea(int number) {
    return 'Mar $number';
  }

  @override
  String get categoryCharacter => 'Personaje';

  @override
  String get categoryAnimal => 'Animal';

  @override
  String get categoryIllustration => 'Ilustración';

  @override
  String get categoryLandscape => 'Paisaje';

  @override
  String get categorySimple => 'Simple';

  @override
  String get alarmBackground => 'Fondo de Alarma';

  @override
  String get random => 'Aleatorio';

  @override
  String get gallery => 'Galería';

  @override
  String get selectSolidColor => 'Seleccionar Color Sólido';

  @override
  String get deleteColor => 'Eliminar Color';

  @override
  String get deleteColorConfirm =>
      '¿Estás seguro de que deseas eliminar este color de la lista?';

  @override
  String get deleteMission => 'Eliminar misión';

  @override
  String get deleteMissionConfirm =>
      '¿Estás seguro de que quieres eliminar esta misión?';

  @override
  String get randomBackgroundDesc =>
      '¡Un nuevo fondo cada vez que suene la alarma!';

  @override
  String get backgroundDeleted => 'Imagen de fondo eliminada.';

  @override
  String get pickFromDevice => 'Elegir del dispositivo';

  @override
  String get alarmSaveError =>
      'Error al guardar la alarma. Ocurrió un error desconocido.';

  @override
  String errorOccurred(String error) {
    return 'Ocurrió un error: $error';
  }

  @override
  String get openSettings => 'Abrir Ajustes';

  @override
  String get videoLoadFailed => 'Error al cargar video\nToca para reintentar';

  @override
  String get itsTimeToWakeUp => '¡Hora de despertarse!';

  @override
  String get dismissAlarm => 'Descartar Alarma';

  @override
  String get slideToDismiss => 'Desliza para descartar';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes min x $count veces';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '${minutes}m, Ilimitado';
  }

  @override
  String get noActiveAlarms => 'No hay alarmas activas';

  @override
  String get wealth => 'Riqueza';

  @override
  String get love => 'Relación';

  @override
  String get career => 'Carrera';

  @override
  String get health => 'Salud';

  @override
  String get faceAnalysisBasic => 'Análisis Facial (Básico)';

  @override
  String get insufficientDataOverallImpression =>
      'Datos de medición insuficientes, interpretados según la impresión general.';

  @override
  String get noseStabilityWealthAccuracy =>
      'La estabilidad en el contorno de la nariz aumenta la precisión de la interpretación de la fortuna de la riqueza.';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      'La claridad en el contorno de la boca refina la interpretación de la fortuna interpersonal y del habla.';

  @override
  String get improveAnalysisQualityAdvice =>
      'Una iluminación más brillante y mirar hacia adelante mejorarán la calidad del análisis.';

  @override
  String get basicAnalysisDescription =>
      'Este resultado se muestra como una interpretación básica debido a la medición insuficiente del contorno facial/expresión.\nLa estabilidad en indicadores como la apertura de los ojos, el contorno de la nariz y el área de la boca mejorará mirando hacia adelante y con mejor iluminación.\nReintentar hará que las distribuciones de puntaje y las descripciones sean más específicas.';

  @override
  String get defaultDailyFortune =>
      'Hoy es un buen día para comenzar con una mente tranquila.\nLlénate de energía positiva con una sonrisa en el espejo.\nUn poco de ocio trae suerte inesperada.';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '${vibe}Hoy, tu fortuna de $topKey destaca más. Por otro lado, $bottomKey parece requerir atención cuidadosa.';
  }

  @override
  String get faceShapeVLine => 'Línea V';

  @override
  String get faceShapeSquare => 'Cuadrada';

  @override
  String get faceShapeBalanced => 'Equilibrada';

  @override
  String get faceShapeRound => 'Redonda';

  @override
  String get faceShapeLong => 'Alargada';

  @override
  String get faceShapeOval => 'Ovalada';

  @override
  String get titleWealthOriented => 'Rostro orientado a la riqueza';

  @override
  String get titleLoveStrong => 'Rostro con fuerte suerte en las relaciones';

  @override
  String get titleCareerNotable => 'Rostro con notable suerte en la carrera';

  @override
  String get titleStableEnergy => 'Rostro con energía estable';

  @override
  String get faceAnalysisComplete => '¡El análisis facial se ha completado!';

  @override
  String get chooseUnlockMethod => 'Elegir método de desbloqueo';

  @override
  String get watchAdForFreeResult => 'Ver anuncio para resultado gratis';

  @override
  String get useTwoCookies => 'Usar 2 Galletas de la Fortuna';

  @override
  String get checkResult => 'Verificar Resultado';

  @override
  String get aiAnalyzingFace => 'La IA está analizando tu rostro...';

  @override
  String get faceRecognitionComplete => 'Reconocimiento facial completo';

  @override
  String get extractingFeatures => 'Extrayendo características...';

  @override
  String get matchingFortuneData => 'Emparejando datos de fortuna...';

  @override
  String get adLoadFailedFreeUnlock =>
      'Error al cargar el anuncio, así que lo desbloqueamos gratis esta vez.';

  @override
  String get insufficientCookies => 'Galletas Insuficientes';

  @override
  String get insufficientCookiesDesc =>
      'No tienes suficientes Galletas de la Fortuna.\n¡Mira un anuncio para verificar gratis!';

  @override
  String get usingTwoCookiesToast =>
      'Usando 2 Galletas de la Fortuna para ver el resultado.';

  @override
  String get todaysFaceAnalysis => 'Análisis Facial de Hoy';

  @override
  String totalScoreWithPoints(int score) {
    return 'Puntaje Total ${score}pts';
  }

  @override
  String get adLoadFailFreeAccess =>
      'Error al cargar el anuncio. Abierto gratis esta vez.';

  @override
  String get insufficientCookiesTitle =>
      'No hay suficientes galletas de la fortuna';

  @override
  String get insufficientCookiesMessage =>
      'No tienes suficientes galletas de la fortuna.\nPuedes ganar más completando misiones o viendo anuncios.';

  @override
  String get useCookiesSnackbar =>
      'Usando 2 galletas de la fortuna para verificar los resultados.';

  @override
  String get faceAnalysisComplete_v2 => '¡Análisis facial completado!';

  @override
  String get chooseMethodToViewResult => 'Elegir método para ver el resultado';

  @override
  String get watchAdForFree => 'Ver anuncio y ver resultado gratis';

  @override
  String get useTwoCookies_v2 => 'Usar 2 galletas';

  @override
  String get viewResult => 'Ver Resultado';

  @override
  String get aiAnalyzingFace_v2 => 'La IA está analizando tu rostro...';

  @override
  String get faceRecognitionComplete_v2 => 'Reconocimiento completado';

  @override
  String get extractingFeatures_v2 => 'Extrayendo rasgos...';

  @override
  String get matchingFortuneData_v2 => 'Comparando datos...';

  @override
  String get wealthLuck => '💰 Suerte de Riqueza';

  @override
  String get loveLuck => '❤️ Suerte de Amor';

  @override
  String get careerLuck => '💼 Suerte de Carrera';

  @override
  String get healthLuck => '💪 Suerte de Salud';

  @override
  String get tojeongMonthlyGood_0 =>
      'Una persona noble del este trae buenas noticias. Los planes largamente esperados darán frutos.';

  @override
  String get tojeongMonthlyGood_1 => 'Buen mes para nuevas oportunidades';

  @override
  String get tojeongMonthlyGood_2 =>
      'Los esfuerzos dan frutos y recibes felicitaciones. Se espera un ascenso o grandes resultados.';

  @override
  String get tojeongMonthlyGood_3 =>
      'El sol de la mañana sale tras una noche oscura. Las dificultades terminan y llega la felicidad.';

  @override
  String get tojeongMonthlyGood_4 =>
      'Una ganancia inesperada llena tu bolsillo. Pequeñas inversiones conducen a grandes beneficios.';

  @override
  String get tojeongMonthlyNeutral_0 =>
      'Continúa una vida diaria pacífica. Pasa sin eventos especiales.';

  @override
  String get tojeongMonthlyNeutral_1 =>
      'El contentamiento trae paz mental. Disfruta de la pequeña felicidad.';

  @override
  String get tojeongMonthlyNeutral_2 =>
      'Tómate un descanso en tu ajetreada vida. Presta atención a la gestión de la salud.';

  @override
  String get tojeongMonthlyNeutral_3 =>
      'Mantén tu trabajo actual en lugar de comenzar algo nuevo.';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'La comunicación es clave. Ten cuidado con las palabras para evitar malentendidos.';

  @override
  String get tojeongMonthlyCaution_0 => 'Precaución con los gastos inesperados';

  @override
  String get tojeongMonthlyCaution_1 =>
      'Presta atención a la salud y evita el esfuerzo excesivo.';

  @override
  String get tojeongMonthlyCaution_2 =>
      'Evita los chismes y mantente fuera de los asuntos de los demás.';

  @override
  String get tojeongMonthlyCaution_3 =>
      'La codicia excesiva trae problemas. Vive según tus medios.';

  @override
  String get tojeongMonthlyCaution_4 =>
      'Evita las transacciones de dinero, ya que podrías sentirte decepcionado con las personas en las que confías.';

  @override
  String get tojeongMonthlySpecial_1_0 =>
      'Con la energía clara del nuevo año contigo, todo irá bien una vez que empieces a hacer lo que has planeado.';

  @override
  String get tojeongMonthlySpecial_1_1 =>
      'A principios de año recibirás ayuda de personas nobles, así que valora tus relaciones con las personas que te rodean.';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'Si tienes demasiada motivación, puedes hacer las cosas mal. Revisa con calma tus planes desde una perspectiva a largo plazo.';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      'Un buen comienzo está a medio hacer. Si comienzas con valentía a hacer algo que has estado posponiendo, lograrás resultados inesperados.';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      'Pequeños cambios de hábitos pueden cambiar el curso de tu suerte. Adquiera el hábito de levantarse temprano.';

  @override
  String get tojeongMonthlySpecial_2_0 =>
      'Aún no es el momento, por lo que debemos fortalecer nuestra fuerza bajo la superficie y buscar oportunidades.';

  @override
  String get tojeongMonthlySpecial_2_1 =>
      'Pueden surgir viejos problemas o conflictos. No lo evites y afrontalo de frente.';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      'Este es un momento en el que es más importante generar sustancia que desempeño exterior. Los movimientos apresurados pueden causar daños.';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      'Así como esperamos la primavera al final del invierno, las oportunidades llegan a quienes se preparan con paciencia.';

  @override
  String get tojeongMonthlySpecial_2_4 =>
      'Debes recorrer tranquilamente tu propio camino sin que te moleste el ruido que te rodea.';

  @override
  String get tojeongMonthlySpecial_3_0 =>
      'La energía de revitalización de todas las cosas os trae nuevas oportunidades. No lo dudes y acepta el desafío.';

  @override
  String get tojeongMonthlySpecial_3_1 =>
      'Este es el mes en el que puede comenzar una nueva relación. Si tratas a las personas con una mente positiva, obtendrás buenos resultados.';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      'Es fácil perder el foco ante los vientos de cambio. Controla tu mente para que no te dejes llevar por cambios emocionales menores.';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      'Al igual que un brote que emerge del suelo, este es el momento en el que tu potencial explota. Tenga confianza.';

  @override
  String get tojeongMonthlySpecial_3_4 =>
      'Una relación preciosa llegará a ti, así que abre la puerta de tu corazón y da la bienvenida a las personas.';

  @override
  String get tojeongMonthlySpecial_4_0 =>
      'Tu riqueza aumentará con energía cálida. Los frutos de sus esfuerzos conducirán a recompensas financieras.';

  @override
  String get tojeongMonthlySpecial_4_1 =>
      'Tienes buena suerte con los documentos, por lo que podrás obtener buenos resultados en contratos o exámenes. Por favor revise cuidadosamente.';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      'Pueden surgir gastos inesperados, por lo que debes prestar especial atención a la gestión del dinero.';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      'Este es el mes en el que tus encantos resaltan como flores en pleno florecimiento. Tomar iniciativa en las relaciones interpersonales.';

  @override
  String get tojeongMonthlySpecial_4_4 =>
      'Este es un buen momento para invertir o aumentar sus ahorros, ya que será bendecido con riqueza.';

  @override
  String get tojeongMonthlySpecial_5_0 =>
      'Como en casa reina un ambiente armonioso, encontrarás alegría y estabilidad en las relaciones con tu familia.';

  @override
  String get tojeongMonthlySpecial_5_1 =>
      'La bondad que muestres a quienes te rodean se traducirá en bendiciones. La acumulación de virtud ayuda a resolver las dificultades.';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'Un pequeño malentendido puede provocar una pelea con alguien cercano a usted. Se requiere postura inversa.';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      'Como es el Mes de la Familia, concéntrate en pasar tiempo con tu familia. La armonía en la familia es la base de todo.';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      'Si miras a tu alrededor con tranquilidad, descubrirás cosas valiosas que te has estado perdiendo.';

  @override
  String get tojeongMonthlySpecial_6_0 =>
      'Tus esfuerzos darán frutos y recibirás el reconocimiento de quienes te rodean. Existe una oportunidad de ascenso u honor.';

  @override
  String get tojeongMonthlySpecial_6_1 =>
      'A medida que su energía activa se fortalezca, puede que valga la pena considerar expandirse a un nuevo campo o cambiar de trabajo.';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'Si avanza demasiado, puede meterse en problemas. Mantente humilde y mira a tu alrededor.';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      'Antes de que comience el calor, debes abastecerte de resistencia. También es una buena idea hacerse un chequeo médico.';

  @override
  String get tojeongMonthlySpecial_6_4 =>
      'Tómese el tiempo para realizar una revisión intermedia para finalizar la primera mitad del año y planificar la segunda mitad.';

  @override
  String get tojeongMonthlySpecial_7_0 =>
      'Este es un momento en el que la pasión apasionada conduce a resultados. Si sigues adelante con valentía, podrás lograr tus objetivos.';

  @override
  String get tojeongMonthlySpecial_7_1 =>
      'Es posible que conozca a alguien valioso o tenga una nueva oportunidad mientras viaja o se muda.';

  @override
  String get tojeongMonthlySpecial_7_2 =>
      'Este es un momento en el que su salud puede verse perjudicada fácilmente. Es importante evitar el exceso de trabajo y descansar lo suficiente.';

  @override
  String get tojeongMonthlySpecial_7_3 =>
      'Requiere una pasión incansable incluso en el calor abrasador. Por mucho que sudes, obtendrás resultados.';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      'Tómese el tiempo para recargar energías mediante el descanso. Un largo viaje trae buena suerte.';

  @override
  String get tojeongMonthlySpecial_8_0 =>
      'A medida que pasa el tiempo, la paciencia comienza a mejorar gradualmente. No seas impaciente y espera tu momento.';

  @override
  String get tojeongMonthlySpecial_8_1 =>
      'Viejos problemas que no se han resuelto encontrarán una pista. Usa tu ingenio para resolverlo.';

  @override
  String get tojeongMonthlySpecial_8_2 =>
      'Es fácil bajar la guardia cuando se trata de concretar algo. No sueltes tu tensión hasta el final.';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      'Ha llegado el momento de dar el último esfuerzo antes de una temporada fructífera. No te relajes.';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      'Hay una mano amiga inesperada. Si tienes dificultades, pide consejo a quienes te rodean.';

  @override
  String get tojeongMonthlySpecial_9_0 =>
      'Al igual que la temporada de abundante fecundidad, es un momento en el que tanto la riqueza como la fortuna amorosa se vuelven abundantes.';

  @override
  String get tojeongMonthlySpecial_9_1 =>
      'Si le pones mucho esfuerzo, obtendrás mejores resultados de los esperados.';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'Así como entran muchas cosas, también pueden salir muchas cosas. Necesita un plan de gastos inteligente.';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      'Es una época de abundancia como de campos dorados. Si tienes un corazón generoso, recibirás mayores bendiciones.';

  @override
  String get tojeongMonthlySpecial_9_4 =>
      'Este es un buen momento para resolver cualquier malentendido o conflicto. Extiende tu mano primero.';

  @override
  String get tojeongMonthlySpecial_10_0 =>
      'Tu fama aumentará y tu nombre será ampliamente conocido. Te ganarás la confianza de quienes te rodean.';

  @override
  String get tojeongMonthlySpecial_10_1 =>
      'Puedes lograr grandes resultados en actividades intelectuales. Este es un buen momento para centrarse en sus estudios o investigaciones.';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      'A medida que su estatus aumenta, su responsabilidad se vuelve más pesada. Debes tener cuidado con tus palabras y acciones.';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'Tu fama se eleva como el alto cielo azul. Libera tus habilidades al máximo.';

  @override
  String get tojeongMonthlySpecial_10_4 =>
      'Este es un buen mes para desarrollar la sabiduría interior a través de la contemplación y la lectura profundas.';

  @override
  String get tojeongMonthlySpecial_11_0 =>
      'Es un momento en el que necesitamos sabiduría para recordar el año pasado y prepararnos para el futuro. A través de la reflexión, crecerás al siguiente nivel.';

  @override
  String get tojeongMonthlySpecial_11_1 =>
      'Encontrarás estabilidad financiera, pero no debes realizar inversiones excesivas en pos de grandes ganancias.';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      'Es posible que se sienta solo en sus relaciones. Primero, debes hacer un esfuerzo por acercarte a las personas con una mente abierta.';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      'Al igual que ajustarse el cuello cuando sopla un viento frío, debes cuidar la practicidad y fortalecer tu fuerza interior.';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      'Al concluir el año, necesitamos sabiduría para recordar lo que nos falta y prepararnos para el próximo año.';

  @override
  String get tojeongMonthlySpecial_12_0 =>
      'A finales de año llega una suerte inesperada. Espere ganancias financieras o buenas noticias.';

  @override
  String get tojeongMonthlySpecial_12_1 =>
      'Serás recompensado por tu arduo trabajo durante un largo período de tiempo. Es el mes de cosechar la belleza del petróleo.';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      'Las reuniones frecuentes pueden dañar su salud o generar gastos innecesarios, por lo que es necesaria la moderación.';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      'El final es un nuevo comienzo. Termine el año planificando un futuro esperanzador en lugar de arrepentirse.';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      'Si practicas compartir cálidamente, esa calidez te regresará en forma de buena suerte.';

  @override
  String get todaysFaceFortune => 'Tu Fortuna Facial de Hoy';

  @override
  String get detailedAnalysis => 'Análisis Detallado';

  @override
  String get eyeInsight => '👁️ Ojos (Visión)';

  @override
  String get noseWealth => '👃 Nariz (Riqueza)';

  @override
  String get mouthLateLuck => '👄 Boca (Destino)';

  @override
  String get overallAnalysisTitle => 'Análisis General';

  @override
  String get shareResultTitle => 'Resultado de Hoy';

  @override
  String shareResultDesc(String title) {
    return 'Resultado del análisis facial por IA.\n$title';
  }

  @override
  String get shareResultTotalScore => 'Puntaje Total';

  @override
  String get shareResultWealth => 'Riqueza';

  @override
  String get shareResultLove => 'Amor';

  @override
  String get shareResultCareer => 'Carrera';

  @override
  String get shareResultHealth => 'Salud';

  @override
  String get shareResultText => 'Compartir Resultado';

  @override
  String get wakeUpComplete => '¡Despertar completado!';

  @override
  String get collapseOptions => 'Contraer Opciones';

  @override
  String get expandOptions => 'Más Opciones';

  @override
  String get snoozeAlarm => 'Posponer Alarma';

  @override
  String get interval => 'Intervalo';

  @override
  String get maxSnoozeCount => 'Repeticiones Máximas';

  @override
  String get unlimited => 'Ilimitado';

  @override
  String get permissionRequired => 'Permiso Requerido';

  @override
  String get exactAlarmFailMessage =>
      'Error al registrar la alarma. El permiso de alarma exacta está desactivado.';

  @override
  String get batteryOptimFailMessage =>
      'Error al registrar la alarma. Falta el permiso de optimización de batería.';

  @override
  String get overlayFailMessage =>
      'Error al registrar la alarma. Falta el permiso de mostrar sobre otras apps.';

  @override
  String get loadingDelay => 'Retraso en la carga';

  @override
  String get loading => 'Cargando...';

  @override
  String get previewFail => 'Error en la vista previa';

  @override
  String get bgDefault => 'Fondo Predeterminado';

  @override
  String get bgFortuneFriends => 'Amigos de la Fortuna';

  @override
  String get bgMongChuni => 'Mongchuni';

  @override
  String get bgPanChuni => 'Panchuni';

  @override
  String get bgToChuni => 'Tochuni';

  @override
  String get bgHoChuni => 'Hochuni';

  @override
  String get bgBear => 'Oso';

  @override
  String get bgMoon => 'Luna';

  @override
  String get bgSea => 'Mar';

  @override
  String get bgBridge => 'Puente';

  @override
  String get bgRoad => 'Camino';

  @override
  String get bgSky => 'Cielo';

  @override
  String get bgMinimalGray => 'Gris Minimalista';

  @override
  String get bgDarkMode => 'Modo Oscuro';

  @override
  String get bgSoftBlue => 'Azul Suave';

  @override
  String get bgWarmBeige => 'Beige Cálido';

  @override
  String get dateFormatMdyE => 'd \'de\' MMM (E)';

  @override
  String get deleteAlarm => 'Eliminar Alarma';

  @override
  String get confirmDelete => '¿Estás seguro de que deseas eliminarla?';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get wealthLuckWithIcon => '💰 Riqueza';

  @override
  String get loveLuckWithIcon => '❤️ Amor';

  @override
  String get careerLuckWithIcon => '💼 Carrera';

  @override
  String get healthLuckWithIcon => '💪 Salud';

  @override
  String get mouthFortune => '👄 Boca (Destino)';

  @override
  String get comprehensiveAnalysis => 'Análisis Integral';

  @override
  String get todaysFaceResult => 'Resultado del Análisis Facial';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'Este es el resultado del análisis facial por IA.\n$title';
  }

  @override
  String get shareResult => 'Compartir resultado';

  @override
  String get faceVibeSmile0 =>
      'Tu sonrisa radiante contagia energía positiva a quienes te rodean. ';

  @override
  String get faceVibeSmile1 =>
      'Tu sonrisa floreciente refleja la energía brillante de este nuevo día. ';

  @override
  String get faceVibeSmile2 =>
      'Tus rasgos suaves emanan una energía atractiva que atraerá ayuda valiosa hoy. ';

  @override
  String get faceVibeSmile3 =>
      'Una sonrisa segura será la clave para superar cualquier obstáculo hoy. ';

  @override
  String get faceVibeSmile4 =>
      'Gracias a tu sonrisa refrescante, la energía fluye y la suerte está lista para llegar. ';

  @override
  String get faceVibeEye0 =>
      'Tus ojos brillantes reflejan una gran determinación para liderar el día. ';

  @override
  String get faceVibeEye1 =>
      'Tu mirada aguda anticipa un juicio y una intuición excepcionales. ';

  @override
  String get faceVibeEye2 =>
      'Tus ojos profundos y claros transmiten una energía sincera que espera buenas noticias. ';

  @override
  String get faceVibeEye3 =>
      'Tu mirada firme y directa aumentará tu presencia y confianza hoy. ';

  @override
  String get faceVibeEye4 =>
      'La pasión en tus ojos inspira una fuerte confianza en las personas que te rodean. ';

  @override
  String get faceVibeNeutral0 =>
      'En general, tu energía facial pacífica y estable te brinda paz mental. ';

  @override
  String get faceVibeNeutral1 =>
      'Tu semblante sereno muestra una energía prudente y sabia. ';

  @override
  String get faceVibeNeutral2 =>
      'La armonía de tu rostro equilibrado simboliza un día estable y sin altibajos. ';

  @override
  String get faceVibeNeutral3 =>
      'Tu expresión seria es ideal para tomar decisiones importantes hoy. ';

  @override
  String get faceVibeNeutral4 =>
      'Tu energía facial reconfortante transmite seguridad, facilitando la cooperación con los demás. ';

  @override
  String get dailyFortuneWealth0 =>
      'La energía de tu nariz es sólida; una planificación cuidadosa aumentará tu flujo de dinero.';

  @override
  String get dailyFortuneWealth1 =>
      'Hoy la suerte se centra en tu nariz. Si calculas con calma, obtendrás mejores beneficios.';

  @override
  String get dailyFortuneWealth2 =>
      'El centro de tu rostro tiene buena energía; un pequeño detalle cuidado traerá resultados inesperados.';

  @override
  String get dailyFortuneWealth3 =>
      'Tu semblante indica buena fortuna económica. Pueden surgir ganancias en lugares inesperados.';

  @override
  String get dailyFortuneWealth4 =>
      'La vitalidad de tu nariz agudiza tu sentido económico. Es un día favorable para decisiones financieras.';

  @override
  String get dailyFortuneWealth5 =>
      'La energía para atraer dinero es fuerte. Revisa tus cuentas para atraer aún más suerte.';

  @override
  String get dailyFortuneWealth6 =>
      'Tu rostro indica que tus ahorros crecerán. Tus esfuerzos constantes comienzan a dar frutos.';

  @override
  String get dailyFortuneWealth7 =>
      'Llega una fortuna estable. El ahorro constante en lugar de grandes gastos aumentará tu suerte.';

  @override
  String get dailyFortuneWealth8 =>
      'Tus ojos para captar oportunidades económicas están brillantes. Escucha la información a tu alrededor.';

  @override
  String get dailyFortuneWealth9 =>
      'Tu rostro rebosa prosperidad. Es un día donde compartir tu corazón te devolverá mayor riqueza.';

  @override
  String get dailyFortuneLove0 =>
      'Tu expresión es suave; si das el primer paso, tus relaciones mejorarán notablemente.';

  @override
  String get dailyFortuneLove1 =>
      'Tu forma de comunicarte es impecable hoy. La sinceridad reducirá cualquier malentendido.';

  @override
  String get dailyFortuneLove2 =>
      'Tu semblante brillante atrae a personas valiosas. Un pequeño gesto traerá una gran conexión.';

  @override
  String get dailyFortuneLove3 =>
      'Hoy destaca tu encanto personal. Recibirás energía positiva de nuevos encuentros.';

  @override
  String get dailyFortuneLove4 =>
      'La energía en tus relaciones es clara; los conflictos se resuelven y llega la armonía.';

  @override
  String get dailyFortuneLove5 =>
      'Tu suavidad facial abre el corazón de los demás. Hoy, escuchar es la mejor forma de conversar.';

  @override
  String get dailyFortuneLove6 =>
      'Tu rostro indica que recibirás ayuda. No te preocupes solo, busca consejo en otros.';

  @override
  String get dailyFortuneLove7 =>
      'Tus ojos sinceros generan confianza. Si cumples tus promesas, fortalecerás tus vínculos.';

  @override
  String get dailyFortuneLove8 =>
      'La armonía reina en tu entorno. Será un día donde las sonrisas no faltarán.';

  @override
  String get dailyFortuneLove9 =>
      'Tus vínculos se fortalecen hoy. Expresa tu gratitud a las personas que valoras.';

  @override
  String get dailyFortuneCareer0 =>
      'Tu mirada es aguda; si priorizas tus tareas, tu concentración se traducirá en éxito.';

  @override
  String get dailyFortuneCareer1 =>
      'Tu capacidad de observación destaca hoy. Las decisiones serán simples y tu ejecución firme.';

  @override
  String get dailyFortuneCareer2 =>
      'Tu frente y ojos están despejados; hoy tienes la fuerza para completar tus tareas con éxito.';

  @override
  String get dailyFortuneCareer3 =>
      'Tu rostro ejerce liderazgo. Tu opinión tendrá una gran influencia en los demás.';

  @override
  String get dailyFortuneCareer4 =>
      'Tu juicio alcanza su punto máximo hoy. Incluso los problemas complejos se resolverán con claridad.';

  @override
  String get dailyFortuneCareer5 =>
      'Tu trabajo será reconocido por los demás. Tienes una fuerte energía para logros y ascensos.';

  @override
  String get dailyFortuneCareer6 =>
      'Energía óptima para comenzar nuevos proyectos. Desafíate con total confianza.';

  @override
  String get dailyFortuneCareer7 =>
      'Tu eficiencia laboral aumenta significativamente. Es ideal para tareas pendientes.';

  @override
  String get dailyFortuneCareer8 =>
      'Tus ojos rebosan ideas creativas. Tomar notas hoy te traerá mucha suerte.';

  @override
  String get dailyFortuneCareer9 =>
      'Tu persistencia y paciencia brillan hoy. Si te concentras hasta el final, obtendrás grandes recompensas.';

  @override
  String get dailyFortuneHealth0 =>
      'La tez general es estable, así que si eliges un ritmo, tu condición se recuperará rápidamente.';

  @override
  String get dailyFortuneHealth1 =>
      'La vitalidad del rostro destaca. Si mantienes el ritmo sin exagerar, el día será cómodo.';

  @override
  String get dailyFortuneHealth2 =>
      'La energía de los ojos y la piel es clara, por lo que un breve descanso eleva la concentración y el ánimo.';

  @override
  String get dailyFortuneHealth3 =>
      'El ritmo corporal logra la mejor armonía. El ejercicio ligero aclara la energía.';

  @override
  String get dailyFortuneHealth4 =>
      'Tu rostro está lleno de energía cargada. Puedes pasar el día agradablemente sin cansarte.';

  @override
  String get dailyFortuneHealth5 =>
      'Destaca la estabilidad de mente y cuerpo. La meditación o la respiración profunda aumentan más la suerte.';

  @override
  String get dailyFortuneHealth6 =>
      'Es un día con buena resiliencia. Hay vitalidad para lavar rápidamente incluso un poco de fatiga.';

  @override
  String get dailyFortuneHealth7 =>
      'La vitalidad de la piel es buena, es un flujo donde escucharás a la gente decir que te ves saludable.';

  @override
  String get dailyFortuneHealth8 =>
      'Una dieta moderada y descanso fortalecen la raíz de la suerte. Ten un día para apreciar tu cuerpo.';

  @override
  String get dailyFortuneHealth9 =>
      'El aire fresco y la ingesta de agua son la medicina de hoy. Disfruta de un día lleno de vitalidad.';

  @override
  String get dailyFortuneTipWealth0 =>
      'Revisa los gastos, suscripciones y pagos de \'mañana\' una vez más que los de \'ahora\'.';

  @override
  String get dailyFortuneTipWealth1 =>
      'Evita el consumo sin promesas; es una ganancia contener solo lo que necesitas.';

  @override
  String get dailyFortuneTipWealth2 =>
      'Si dejas registros de conversaciones relacionadas con dinero, evitas pérdidas innecesarias.';

  @override
  String get dailyFortuneTipWealth3 =>
      'Revisa si hay fugas incluso por cantidades pequeñas.';

  @override
  String get dailyFortuneTipWealth4 =>
      'La tentación de compras impulsivas es fuerte hoy. Piensa 10 minutos antes de pagar.';

  @override
  String get dailyFortuneTipWealth5 =>
      'Las inversiones o grandes transacciones deben ser cautelosas hoy. Consulta el consejo de expertos.';

  @override
  String get dailyFortuneTipWealth6 =>
      'Necesitas organizar claramente el dinero prestado o el dinero por recibir.';

  @override
  String get dailyFortuneTipWealth7 =>
      'Presta atención al manejo de la billetera. Se ve ligeramente energía de pérdida o desperdicio.';

  @override
  String get dailyFortuneTipWealth8 =>
      'Se necesita sabiduría para tomar ganancias prácticas en lugar de consumo centrado en la apariencia.';

  @override
  String get dailyFortuneTipWealth9 =>
      'En lugar de esperar algo gratis, pagar un precio justo es la forma de mantener la suerte.';

  @override
  String get dailyFortuneTipLove0 =>
      'Como tu tono es fácil de volverse agudo, responde \'después de un descanso\'.';

  @override
  String get dailyFortuneTipLove1 =>
      'Si surge un malentendido, una breve verificación es mejor que una larga explicación.';

  @override
  String get dailyFortuneTipLove2 =>
      'Hoy, la confianza se construye solo cumpliendo la hora de la cita.';

  @override
  String get dailyFortuneTipLove3 =>
      'La conversación reduce el consumo emocional si comienzas con la conclusión.';

  @override
  String get dailyFortuneTipLove4 =>
      'Sé cortés incluso con las personas cercanas. Podrías herirlas al confiarte demasiado.';

  @override
  String get dailyFortuneTipLove5 =>
      'Intenta ofrecer elogios antes de la crítica. El corazón cerrado de la otra persona se abrirá.';

  @override
  String get dailyFortuneTipLove6 =>
      'Es un día en el que preocupan los deslices verbales. Organiza las historias importantes una vez más por texto.';

  @override
  String get dailyFortuneTipLove7 =>
      'No interferir demasiado en los asuntos de otros es el secreto para prevenir rumores.';

  @override
  String get dailyFortuneTipLove8 =>
      'Una conversación racional en lugar de una respuesta emocional mantiene las relaciones saludables.';

  @override
  String get dailyFortuneTipLove9 =>
      'Revisa cuidadosamente el horario para no solapar citas. La confianza es el capital.';

  @override
  String get dailyFortuneTipCareer0 =>
      'En lugar de comenzar cosas, \'terminar una\' hace crecer la suerte.';

  @override
  String get dailyFortuneTipCareer1 =>
      'La fecha límite es antes que la perfección. Hoy, confirma al 80%.';

  @override
  String get dailyFortuneTipCareer2 =>
      'Si organizas una cosa que has estado posponiendo, tu cabeza se aclarará.';

  @override
  String get dailyFortuneTipCareer3 =>
      'Separar mi trabajo del de otros reduce el estrés.';

  @override
  String get dailyFortuneTipCareer4 =>
      'Pequeños errores pueden enredar el trabajo. No olvides la revisión final.';

  @override
  String get dailyFortuneTipCareer5 =>
      'Se espera fricción con superiores o colegas. Se necesita una actitud de respeto a las diferencias de opinión.';

  @override
  String get dailyFortuneTipCareer6 =>
      'La concentración es fácil de distraer hoy. Mantén el ritmo de trabajar 50 minutos y descansar 10.';

  @override
  String get dailyFortuneTipCareer7 =>
      'La responsabilidad excesiva puede ser venenosa. Solo asume tanto como puedas manejar.';

  @override
  String get dailyFortuneTipCareer8 =>
      'Ten cuidado de no mezclar sentimientos personales en el trabajo público hoy.';

  @override
  String get dailyFortuneTipCareer9 =>
      'Antes de enviar documentos o correos electrónicos, revisa el destinatario y los adjuntos una vez más.';

  @override
  String get dailyFortuneTipHealth0 =>
      'Evita el sueño, comer en exceso y el exceso de cafeína para estabilizar tu condición.';

  @override
  String get dailyFortuneTipHealth1 =>
      'Aliviar la tensión del cuello y los hombros reduce significativamente la fatiga de hoy.';

  @override
  String get dailyFortuneTipHealth2 =>
      'Una caminata corta organiza los pensamientos y refresca la energía.';

  @override
  String get dailyFortuneTipHealth3 =>
      'Un vaso de agua y 1 minuto de estiramiento apoyan la base de la suerte.';

  @override
  String get dailyFortuneTipHealth4 =>
      'La fatiga ocular puede volverse severa. Reduce brevemente el uso del teléfono inteligente.';

  @override
  String get dailyFortuneTipHealth5 =>
      'En lugar de actividad repentina, es mejor moverse después de calentar el cuerpo suficientemente.';

  @override
  String get dailyFortuneTipHealth6 =>
      'Como podrías ser sensible a los cambios de temperatura, lleva una prenda exterior para regular la temperatura corporal.';

  @override
  String get dailyFortuneTipHealth7 =>
      'Evita alimentos estimulantes hoy para la salud intestinal y la piel.';

  @override
  String get dailyFortuneTipHealth8 =>
      'El sueño suficiente es la mejor medicina. Ve a la cama más temprano de lo habitual hoy.';

  @override
  String get dailyFortuneTipHealth9 =>
      'Cambia tu estado de ánimo con tu música o aroma favorito para que el estrés no se acumule.';

  @override
  String get eyeAnalysisTypeSharp =>
      'Tus ojos son intensos y claros, reflejando un juicio rápido y una fuerte determinación.';

  @override
  String get eyeAnalysisTypeDeep =>
      'Tu mirada tranquila y profunda sugiere una personalidad sabia y reflexiva.';

  @override
  String get eyeAnalysisTypeBalanced =>
      'Tus ojos muestran un equilibrio perfecto entre la emoción y la razón, proyectando una sensación de estabilidad.';

  @override
  String get eyeExpressionBright =>
      'Tus ojos brillantes y tu cálida sonrisa crean un aura acogedora que atrae naturalmente a las personas hacia ti.';

  @override
  String get eyeExpressionGentle =>
      'Una sonrisa amable dentro de tu mirada tranquila refleja un carisma silencioso pero fuerte.';

  @override
  String get eyeExpressionStrong =>
      'Tu mirada intensa y enfocada simboliza un fuerte liderazgo y el impulso para lograr tus objetivos.';

  @override
  String get eyeExpressionSteady =>
      'Tu comportamiento tranquilo y serio inspira confianza y respeto.';

  @override
  String get eyePostureTilt =>
      'Una cabeza ligeramente inclinada puede indicar incertidumbre; mantener la cabeza en alto y mirar hacia adelante traerá mejor enfoque y suerte.';

  @override
  String get eyePostureStraight =>
      'Mirar directamente hacia adelante proyecta confianza y despeja tu camino hacia el éxito.';

  @override
  String get noseInsufficient =>
      'El análisis de la nariz es limitado debido a la claridad de la imagen; proporcionando una interpretación general.';

  @override
  String get noseWealthRich =>
      'Un puente nasal fuerte y bien definido sugiere un gran potencial para acumular y proteger la riqueza.';

  @override
  String get noseWealthPlanner =>
      'Una nariz afilada y bien proporcionada indica una mente práctica para gestionar y hacer crecer tus finanzas.';

  @override
  String get noseWealthBalanced =>
      'Tus rasgos equilibrados sugieren un flujo constante y estable de suerte financiera.';

  @override
  String get mouthExpressionBlessing =>
      'Las comisuras de tus labios hacia arriba sugieren una naturaleza positiva que atrae naturalmente la buena fortuna y el favor de los demás.';

  @override
  String get mouthExpressionReliable =>
      'Una boca firme y cerrada refleja confiabilidad y una preferencia por la acción sobre las palabras vacías.';

  @override
  String get mouthExpressionLucky =>
      'Una sonrisa brillante y abierta irradia energía positiva, trayendo suerte a tus relaciones.';

  @override
  String get supplementAlarmTitle => '¡Es hora de tomar tus suplementos! 💊';

  @override
  String get alarmVolume => 'Volumen de alarma';

  @override
  String get alarmTimeList => 'Lista de horas de alarma';

  @override
  String get noAlarmTimesAdded => 'No se han añadido horas de alarma';

  @override
  String get alarmTimeDeleted => 'Hora de alarma eliminada';

  @override
  String get addAlarmTime => 'Añadir hora de alarma';

  @override
  String get editAlarmTime => 'Editar hora de alarma';

  @override
  String get defaultRingtone => 'Tono Predeterminado';

  @override
  String get takeSupplementsNow =>
      '¡Por favor tome sus suplementos y regístrelos!';

  @override
  String get nextTime => 'Tomar más tarde';

  @override
  String get take => 'Tomar';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationTime => 'Hora de Notificación';

  @override
  String get start => 'Comenzar';

  @override
  String get end => 'Fin';

  @override
  String get notificationInterval => 'Intervalo de notificación';

  @override
  String get waterDrankToday => 'Agua bebida hoy';

  @override
  String get goal => 'Meta';

  @override
  String get cup => 'Taza';

  @override
  String get waterIntakeRecord => 'Registro de ingesta de agua';

  @override
  String get remainingAmount => 'Cantidad restante';

  @override
  String get ml => 'ml';

  @override
  String minutesFormat(String minutes) {
    return '$minutes min';
  }

  @override
  String get drinkWater => 'Beber agua';

  @override
  String get supplement => 'Suplemento';

  @override
  String get water => 'Agua';

  @override
  String get morning => 'Mañana';

  @override
  String get afternoon => 'Tarde';

  @override
  String get evening => 'Noche';

  @override
  String get takeSupplement => 'Tomar suplemento';

  @override
  String get goalAchievedTitle => '¡Meta alcanzada!';

  @override
  String get waterIntake => 'Ingesta de agua';

  @override
  String get remindTime => 'Hora de recordatorio';

  @override
  String get alarmRingtone => 'Tono de llamada de alarma';

  @override
  String get snoozeTime => 'Tiempo de posposición';

  @override
  String get snoozeDescription =>
      'Tiempo predeterminado al seleccionar \'Tomar más tarde\'';

  @override
  String get oneHour => '1 hora';

  @override
  String get mouthExpressionOpen =>
      'Tu expresión abierta sugiere honestidad, pero ten cuidado con tus palabras en situaciones sensibles.';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return 'El enfoque de hoy es $topKey, y el punto a tener cuidado es $bottomKey.';
  }

  @override
  String get overallVibeWealthRich =>
      'Tus rasgos irradian vitalidad financiera, lo que hace que hoy sea un excelente día para aprovechar nuevas oportunidades.';

  @override
  String get overallVibeWealthSteady =>
      'Un enfoque tranquilo y constante te ayudará a gestionar tus finanzas con sabiduría y a construir una riqueza duradera.';

  @override
  String get overallVibeLoveCharisma =>
      'Tu sonrisa brillante atrae naturalmente a personas positivas y conexiones útiles hoy.';

  @override
  String get overallVibeLoveTrust =>
      'Tu mirada sincera y constante genera una profunda confianza, lo que lo convierte en un momento perfecto para conexiones significativas.';

  @override
  String get overallVibeCareerSmart =>
      'Tu enfoque agudo mejora tu juicio, lo que lo convierte en el momento perfecto para tareas complejas o grandes decisiones.';

  @override
  String get overallVibeCareerSteady =>
      'Tu energía constante apoya la persistencia; mantenerte enfocado en tus objetivos te llevará a grandes resultados.';

  @override
  String get overallVibeHealth =>
      'Tu cutis claro refleja un ritmo interno equilibrado, lo que lo convierte en un gran día para actividades físicas.';

  @override
  String get overallActionPrudent =>
      'Tu expresión serena sugiere sabiduría. Hoy, deja que tus acciones hablen más fuerte que tus palabras.';

  @override
  String get overallActionConfident =>
      'Una expresión segura y abierta atrae resultados positivos. Expresa lo que piensas con claridad y confianza.';

  @override
  String get adviceHealth0 =>
      'La gestión de tu estado físico es la base de tu suerte. Organiza tu agenda para evitar horarios poco razonables hoy.';

  @override
  String get adviceHealth1 =>
      'Escucha las señales de tu cuerpo. Un breve descanso trae mayores resultados.';

  @override
  String get adviceHealth2 =>
      'Dormir lo suficiente y beber agua por sí solos despejarán tu suerte hoy.';

  @override
  String get adviceWealth0 =>
      'El dinero puede filtrarse tan fácilmente como entra. Revisa tus gastos y contratos una vez más.';

  @override
  String get adviceWealth1 =>
      'Reducir los pequeños gastos es el comienzo para acumular una gran riqueza.';

  @override
  String get adviceWealth2 =>
      'Posponer las decisiones financieras hasta mañana puede ser una ganancia.';

  @override
  String get adviceLove0 =>
      'Un tono y una expresión determinan la suerte interpersonal. Comienza con suavidad primero.';

  @override
  String get adviceLove1 =>
      'Una actitud de escucha se convierte en la clave para abrir el corazón de la otra persona.';

  @override
  String get adviceLove2 =>
      'Mantener los modales incluso con personas cercanas es la forma de proteger tu suerte.';

  @override
  String get adviceCareer0 =>
      'Hoy es un día para \'asegurar una cosa\' en lugar de ampliar objetivos. Reduce tus prioridades.';

  @override
  String get adviceCareer1 =>
      'No te apresures. Proceder paso a paso es el camino más rápido.';

  @override
  String get adviceCareer2 =>
      'Consulta los consejos a tu alrededor, pero confía en tu propia intuición para la decisión final.';

  @override
  String get sajuFortune2024Gap =>
      '🌿 Fortuna General 2024 Año Gapjin Madera-Gap: \'Un Año de Nuevos Comienzos y Saltos\'\n\n2024 es un año donde entra la energía de \'Bi-gyeon\' (Compañero) y \'Pyeon-jae\' (Riqueza inesperada) para ti. Es como si se plantaran nuevos árboles en un bosque frondoso y se desplegara una vasta tierra. Será un gran año para tener una visión subjetiva clara y planificar cosas nuevas.\n\n💼 [Carrera y Negocios]\nUn momento en el que la confianza se desborda y el impulso se vuelve más fuerte. Surgirán oportunidades para tener éxito en grandes proyectos cooperando con colegas o socios. Si estabas considerando iniciar un negocio o cambiar de trabajo, este año podría ser el momento adecuado. Sin embargo, puedes volverte obstinado, por lo que es necesaria una actitud de escucha.\n\n💰 [Riqueza]\nLlegarán oportunidades para tocar una gran riqueza. Se esperan ganancias inesperadas o retornos de inversión. Sin embargo, puede haber mucho dinero saliendo, por lo que se requiere una gestión de activos minuciosa. Invertir con una perspectiva a largo plazo es ventajoso.\n\n❤️ [Amor y Relaciones]\nUn buen momento para ampliar las relaciones y formar nuevos vínculos. Si estás soltero, hay una alta posibilidad de conocer a una pareja atractiva, y si estás en pareja, la relación se volverá más profunda. Sin embargo, ten cuidado con la aparición de competidores.\n\n⚠️ [Precauciones]\nPresta atención a la salud del hígado o la vesícula biliar y gestiona el estrés. Además, evita decisiones arbitrarias debido a la confianza excesiva.';

  @override
  String get sajuFortune2024Eul =>
      '🌿 Fortuna General 2024 Año Gapjin Madera-Eul: \'Un Año de Crecimiento con Ayudantes\'\n\n2024 es un año donde entra la energía de \'Geob-jae\' y \'Jeong-jae\' para ti. Es como la hiedra trepando un gran árbol para ver el cielo. Será un año en el que podrás lograr mayores resultados con la ayuda de quienes te rodean en lugar de hacerlo solo.\n\n💼 [Carrera y Negocios]\nLa colaboración y el networking son importantes. Conocerás ayudantes competentes, aumentando la eficiencia laboral y ganando reconocimiento. Sin embargo, pueden surgir situaciones donde el rendimiento deba compartirse, así que presta atención a la distribución justa. Es un buen momento para mostrar tu presencia en medio de la competencia.\n\n💰 [Riqueza]\nSe garantiza un ingreso estable. Las recompensas siguen a los esfuerzos sinceros, y es un momento ventajoso para ahorros o inversión inmobiliaria. Sin embargo, evita transacciones financieras con colegas o conocidos y ten en cuenta la gestión de gastos.\n\n❤️ [Amor y Relaciones]\nHabrá muchas reuniones sociales y la popularidad aumentará. En las relaciones románticas, pueden ocurrir malentendidos menores, por lo que se necesita una conversación honesta. Es probable que nuevos lazos lleguen naturalmente a través de amigos o colegas.\n\n⚠️ [Precauciones]\nCuidado con los trastornos nerviosos o migrañas. Además, mantén una actitud flexible ya que puedes sufrir conflictos con las personas que te rodean.';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 Fortuna General 2024 Año Gapjin Fuego-Byeong: \'Un Año donde la Pasión y la Sabiduría Brillan\'\n\n2024 es un año donde entra la energía de \'Pyeon-in\' y \'Sik-sin\' para ti. Es como el sol brillando sobre un bosque para darle vida. Surgirán ideas creativas y será un año donde podrás desplegar plenamente tus talentos.\n\n💼 [Carrera y Negocios]\nDestacarás en campos profesionales y lograrás resultados originales. Especialmente ventajoso para aquellos en investigación, arte o puestos técnicos. Sin embargo, el poder de ejecución puede caer debido a muchos pensamientos, así que si has hecho un plan, esfuérzate por ponerlo en práctica de inmediato.\n\n💰 [Riqueza]\nUn momento en que tus talentos e ideas conducen al dinero. Los trabajos secundarios o pasatiempos pueden crear ingresos. Sin embargo, revisa cuidadosamente los contratos de documentos o inversiones para evitar pérdidas.\n\n❤️ [Amor y Relaciones]\nUn momento en que el habla mejora y el encanto se desborda. Tomarás un papel de liderazgo en las relaciones y ganarás el favor de muchas personas. En las relaciones románticas, habrá muchas citas y eventos agradables, profundizando la relación.\n\n⚠️ [Precauciones]\nPresta atención al sistema digestivo o la salud cardiovascular. Además, puedes sentirte deprimido por pensar demasiado, por lo que es bueno liberar energía a través de actividades al aire libre.';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 Fortuna General 2024 Año Gapjin Fuego-Jeong: \'Un Año de Fortalecimiento de Bases Internas en Estabilidad\'\n\n2024 es un año donde entra la energía de \'Jeong-in\' y \'Sang-gwan\' para ti. Es como una lámpara en el cielo nocturno iluminando el bosque. Será un buen año para centrarse en el autodesarrollo, como estudios o adquisición de certificaciones, y fortalecer las bases internas.\n\n💼 [Carrera y Negocios]\nCon la ayuda de superiores o mayores, el ambiente de trabajo mejora y llegan oportunidades de ascenso o traslado. Es un momento ventajoso para transmitir persuasivamente tus opiniones y ganar el acuerdo de quienes te rodean. Sin embargo, ten cuidado con las palabras y acciones ya que las actitudes críticas pueden llevar a rumores.\n\n💰 [Riqueza]\nLa fortuna relacionada con documentos es buena. Se esperan contratos inmobiliarios o mejora de ingresos a través de la adquisición de certificaciones. Es bueno centrarse en la gestión estable de activos y abstenerse del consumo impulsivo.\n\n❤️ [Amor y Relaciones]\nGanarás confianza de las personas que te rodean con una apariencia educada y cálida. En las relaciones románticas, la consideración por el otro crece, manteniendo encuentros estables. Un buen año para prepararse para el matrimonio también.\n\n⚠️ [Precauciones]\nCuidado con enfermedades oculares o agotamiento nervioso. Además, mantén una actitud humilde ya que presumir de tus habilidades puede causar resentimiento de quienes te rodean.';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ Fortuna General 2024 Año Gapjin Tierra-Mu: \'Un Año de Responsabilidad y Desafío\'\n\n2024 es un año donde entra la energía de \'Pyeon-gwan\' y \'Bi-gyeon\' para ti. Es como una enorme montaña armonizando con un bosque para mostrar su majestuosidad. Las responsabilidades aumentarán, pero será un año donde crecerás un paso más al superarlas.\n\n💼 [Carrera y Negocios]\nA menudo se te asignarán tareas difíciles o necesitarás ejercer liderazgo. Las oportunidades para demostrar tus habilidades vendrán en entornos altamente competitivos. Por mucho que sea difícil, la sensación de logro será grande, por lo que se necesita persistencia para seguir hasta el final.\n\n💰 [Riqueza]\nEl gasto puede aumentar algo este año. Es sabio centrarse en preservar el principal en lugar de invertir, y ten cuidado ya que puedes perder dinero en relaciones financieras con personas que te rodean. Es importante establecer un plan de activos con una perspectiva a largo plazo.\n\n❤️ [Amor y Relaciones]\nRecibirás atención del sexo opuesto con un fuerte carisma. Sin embargo, las actitudes obstinadas pueden causar peleas con parejas, por lo que se necesitan esfuerzos para considerar la posición de la otra persona. Un momento en que las amistades con amigos se vuelven más profundas.\n\n⚠️ [Precauciones]\nCuidado con el exceso de trabajo físico como trastornos estomacales o dolor muscular. Se necesita suficiente descanso y estiramiento, y es bueno tener pasatiempos que puedan aliviar la presión mental.';

  @override
  String get sajuFortune2024Gi =>
      '🌾 Fortuna General 2024 Año Gapjin Tierra-Gi: \'Un Año de Fructificación y Armonía\'\n\n2024 es un año donde entra la energía de \'Jeong-gwan\' y \'Geob-jae\' para ti. Es como árboles frondosos creciendo en un campo amplio y dando frutos. Será un año agradable donde el estatus social aumenta y se gana honor.\n\n💼 [Carrera y Negocios]\nSerás reconocido dentro de la organización y asumirás puestos importantes. Un año con muy buena suerte de empleo o promoción. Si sigues las reglas y trabajas sinceramente, puedes lograr resultados más allá de las expectativas. Sin embargo, puedes estresarte por la competencia con colegas, así que ten algo de tranquilidad.\n\n💰 [Riqueza]\nUn año donde ocurren ingresos estables y la riqueza se acumula constantemente. Se esperan recompensas según el rendimiento o el honor. Sin embargo, puede haber gastos ya que habrá muchas cosas que dar a las personas que te rodean, por lo que se necesita un ajuste apropiado.\n\n❤️ [Amor y Relaciones]\nUn momento en que la suerte matrimonial entra fuertemente. Si estás soltero, puedes conocer a una pareja confiable y desarrollar una relación seria. En las relaciones, ganarás el apoyo de muchas personas a través de una comunicación fluida.\n\n⚠️ [Precauciones]\nPresta atención a la función del bazo o páncreas y mantén hábitos alimenticios regulares. Además, ten cuidado ya que puedes fallar en cuidar tus propios intereses al estar demasiado involucrado en los asuntos de los demás.';

  @override
  String get sajuFortune2024Gyeong => 'Fortuna Saju 2024 Gyeong';

  @override
  String get sajuFortune2024Sin => 'Fortuna Saju 2024 Sin';

  @override
  String get sajuFortune2024Im =>
      '🌊 Fortuna General 2024 Año Gapjin Agua-Im: \'Un Año de Crecimiento Flexible Como Agua Fluyendo\'\n\n2024 es un año donde entra la energía de \'Sik-sin\' y \'Pyeon-gwan\' para ti. Es como un gran mar humedeciendo un bosque para cultivar vida. Será un año donde ejerces sabiduría para resolver problemas difíciles y expandir tu territorio.\n\n💼 [Carrera y Negocios]\nUn momento en que destacan las habilidades creativas de resolución de problemas. Encontrarás avances incluso en situaciones difíciles y ganarás reconocimiento por tus habilidades. Se esperan buenos resultados especialmente en campos de educación, asesoramiento y planificación. Sin embargo, se necesita ajuste de ritmo ya que puedes agotarte debido a una carga de trabajo excesiva.\n\n💰 [Riqueza]\nUn buen año para crear ingresos a través de tus habilidades o talentos. Un momento en que la suerte de comida y la suerte de riqueza entran juntas. Sin embargo, es sabio asegurar fondos de emergencia ya que pueden ocurrir gastos repentinos.\n\n❤️ [Amor y Relaciones]\nMantendrás buenas relaciones con las personas que te rodean con mayor comprensión y tolerancia. En las relaciones románticas, confirmarán los verdaderos sentimientos del otro a través de una conversación profunda. Si estás soltero, es muy probable que conozcas a una pareja con una sensación cómoda.\n\n⚠️ [Precauciones]\nPresta atención a la salud del sistema renal o de la vejiga. Además, prioriza tus acciones ya que tratar de manejar demasiadas cosas a la vez puede dañar tu salud.';

  @override
  String get sajuFortune2024Gye => 'Fortuna Saju 2024 Gye';

  @override
  String get sajuFortune2025Gap =>
      '🌿 Fortuna General 2025 Año Eulsa Madera-Gap: \'Crecimiento en Medio de Nueva Etapa y Competencia\'\n\n2025 es un año donde entra la energía de \'Geob-jae\' y \'Sik-sin\' para ti. Es como un gran árbol en un bosque armonizando con hiedra (Madera-Eul) para crecer juntos. Ocurre sinergia cuando están juntos en lugar de solos, pero al mismo tiempo, será un año donde no se puede evitar la competencia feroz.\n\n💼 [Carrera y Negocios]\nLa actividad se vuelve vigorosa y el deseo de expresión se vuelve fuerte. Vendrán oportunidades para anunciar ampliamente tus ideas y talentos al mundo. Se esperan excelentes resultados para freelancers, aquellos en artes escénicas o ventas. Sin embargo, pueden surgir conflictos sutiles en las relaciones con colegas o competidores, por lo que se necesita sabiduría para hacerlos colaboradores en lugar de enemigos.\n\n💰 [Riqueza]\nEl flujo de riqueza es activo, pero puede haber tanto dinero saliendo como entrando (influencia de Geob-jae). Se necesita precaución ya que pueden ocurrir gastos debido a reuniones con amigos/colegas o recomendaciones de inversión. Invertir en autodesarrollo o expansión comercial es más ventajoso a largo plazo que ahorrar dinero.\n\n❤️ [Amor y Relaciones]\nLa sociabilidad mejora y conocerás a muchas personas nuevas. La popularidad aumenta en reuniones o actividades grupales, y es un buen momento para apelar encanto al sexo opuesto. Sin embargo, como pueden aparecer competidores, es bueno expresarte activamente si hay alguien que te gusta.\n\n⚠️ [Precauciones]\nEl espíritu competitivo excesivo puede llevar a problemas. Además, la suerte de movimiento aumenta debido a la energía de \'Fuego-Sa\', así que presta atención a la seguridad vial y la gestión de la fuerza física.';

  @override
  String get sajuFortune2025Eul =>
      '🌿 Fortuna General 2025 Año Eulsa Madera-Eul: \'Un Salto Brillante Revelando Tus Colores\'\n\n2025 es un año donde entra la energía de \'Bi-gyeon\' y \'Sang-gwan\' para ti. Es como flores en un campo en plena floración bajo el sol cálido. Será un año dinámico donde muestras plenamente tu individualidad y talentos y recibes atención pública.\n\n💼 [Carrera y Negocios]\nLa creatividad y el sentido artístico alcanzan su punto máximo. Destacarás enormemente en tareas de planificación y presentación de ideas. Surgen oportunidades para independizarse o liderar nuevos proyectos a medida que se reconocen tus habilidades. Sin embargo, se necesita coordinación ya que tratar de ir demasiado lejos puede entrar en conflicto con las reglas existentes.\n\n💰 [Riqueza]\nUn año donde se crean ingresos basados en ingenio y habilidad. Puedes obtener ingresos inesperados a través de trabajos secundarios o actividades creativas. Sin embargo, los gastos para el mantenimiento de la dignidad o el entretenimiento pueden aumentar a medida que persigues cosas elegantes, así que no pierdas el sentido económico.\n\n❤️ [Amor y Relaciones]\nUn momento con encanto desbordante, recibiendo atención del sexo opuesto. En las relaciones románticas, pasas momentos agradables y animados, pero a veces pueden ocurrir peleas debido a tu propia obstinación. Si estás solo, puedes esperar un encuentro fatídico.\n\n⚠️ [Precauciones]\nTen cuidado con los deslices de la lengua ya que es un año fácil para ser objeto de rumores. Además, el sueño y el descanso regulares son esenciales ya que puedes consumir demasiada energía y cansarte fácilmente.';

  @override
  String get sajuFortune2026Gap => 'Fortuna Saju 2026 Gap';

  @override
  String get sajuFortune2026Eul =>
      '🌸 Fortuna General 2026 Año Byeong-oh Madera-Eul: \'Floración Brillante, Plena Floración de Talento\'\n\n2026 es un año donde \'Sang-gwan\' (Expresión) es pesado para ti, un Madera-Eul. Es una situación donde las flores florecen bajo el sol caliente, un período donde tu encanto y talento alcanzan su punto máximo. Serás el protagonista que recibe atención en todas partes y probarás logros brillantes.\n\n💼 [Carrera y Negocios]\nIntentos no convencionales que rompen marcos existentes tienen éxito. Destacarás en diseño, moda, belleza y entretenimiento. Puedes recibir ofertas de promoción o scout en el trabajo, pero ten cuidado con la fricción con los superiores. Tu capacidad se duplica en un entorno libre.\n\n💰 [Riqueza]\nLa capacidad de crear riqueza se vuelve excelente. El valor de tu marca aumenta y tu valor aumenta. Sin embargo, perseguir el glamour puede llevar al lujo o al desperdicio, por lo que debes guardar bien tu billetera.\n\n❤️ [Amor y Relaciones]\nLa popularidad con el sexo opuesto explota. Tendrás un romance brillante y apasionado, pero puede terminar breve e intensamente. Las personas casadas pueden tener mucho de qué preocuparse con respecto a los hijos.\n\n⚠️ [Precauciones]\nLos altibajos emocionales pueden volverse severos. Si no puedes controlar tu temperamento, los logros ganados con esfuerzo pueden colapsar. Ten un espíritu respetuoso de la ley para evitar problemas legales o rumores.';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ Fortuna General 2026 Año Byeong-oh Fuego-Byeong: \'Dos Soles, Competencia Intensa y Salto\'\n\n2026 es un año donde \'Bi-gyeon\' (Amigo) y \'Geob-jae\' (Competidor) son muy fuertes para ti, un Fuego-Byeong. Es una situación donde aparecen dos soles en el cielo, un período donde el orgullo y el espíritu competitivo alcanzan el cielo. La subjetividad se vuelve fuerte, odias cualquier interferencia y empujas tu camino con determinación.\n\n💼 [Carrera y Negocios]\nEs una suerte ganar y lograr en lugares competitivos. Puedes aumentar la escala a través de asociación o colaboración, pero pueden surgir conflictos debido a problemas de distribución de beneficios. Es una buena oportunidad para que los freelancers o profesionales den a conocer sus nombres ampliamente.\n\n💰 [Riqueza]\nEl dinero entra, pero también hay grandes agujeros para que salga. El dinero puede salir debido a hermanos, amigos o colegas. Garantizar o prestar dinero está absolutamente prohibido. Es mejor invertir en honor o poder de crecimiento en lugar de ahorrar dinero.\n\n❤️ [Amor y Relaciones]\nPuedes conocer a un amante como un amigo o desarrollarte de un amigo a un amante. Sin embargo, si tienes pareja, ten cuidado ya que puede aparecer un triángulo amoroso o un competidor.\n\n⚠️ [Precauciones]\nLas acciones dogmáticas pueden causar resentimiento de quienes te rodean. La \'humildad\' es la mejor táctica. Presta atención a las enfermedades cardiovasculares o la salud ocular.';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 Fortuna General 2026 Año Byeong-oh Fuego-Jeong: \'Llama Gigante, Expansión de Poder\'\n\n2026 es un año de \'Geob-jae\' (Competidor) y \'Bi-gyeon\' (Amigo) para ti, un Fuego-Jeong. Como una vela encontrándose con un horno, es un período donde tu poder se vuelve masivo. Puedes lograr cosas que eran imposibles solo a través de ayuda o cooperación de quienes te rodean.\n\n💼 [Carrera y Negocios]\nSurge una fuerte fuerza impulsora. Tendrás la sabiduría para abrumar a los competidores o ponerlos de tu lado. Vendrán oportunidades para ejercer liderazgo en proyectos de equipo o vida organizacional. Sin embargo, si intentas monopolizar los resultados, puedes ser traicionado, por lo que es necesaria una postura de compartir el crédito.\n\n💰 [Riqueza]\nLas tendencias especulativas se vuelven fuertes. Perseguirás \'alto riesgo, alto rendimiento\', y si tienes suerte, tocarás mucho dinero, pero el fracaso también tiene un gran impacto. Pueden ocurrir gastos inesperados, por lo que es bueno preparar un fondo de emergencia.\n\n❤️ [Amor y Relaciones]\nHay una alta probabilidad de conocer conexiones en reuniones sociales o actividades grupales. Los hombres deben tener cuidado ya que pueden descuidar a sus esposas o novias. Las relaciones con las personas que te rodean se convierten en activos este año.\n\n⚠️ [Precauciones]\nLa codicia lleva a problemas. Abstente de expansión o inversión irrazonable. Ten cuidado con enfermedades causadas por ira o estrés.';

  @override
  String get sajuFortune2026Mu =>
      '🌋 Fortuna General 2026 Año Byeong-oh Tierra-Mu: \'Paciencia y Preparación en Medio del Calor Intenso\'\n\n2026 es un año donde la energía de \'Pyeon-in\' (Intuición) y \'Jeong-in\' (Conocimiento) es fuerte para ti, un Tierra-Mu. Es como energía condensada justo antes de que un volcán entre en erupción. Es el momento óptimo para llenar tu ser interior y hacer crecer habilidades a través del estudio, el arte y la obtención de certificaciones.\n\n💼 [Carrera y Negocios]\nEl trabajo mental como la planificación, la investigación y el establecimiento de estrategias brilla más que el trabajo activo. La suerte de documentos es buena, por lo que hay resultados en contratos o tareas relacionadas con permisos. Sin embargo, si solo piensas y pospones la ejecución, puedes perder oportunidades, por lo que también se necesita una audaz decisión.\n\n💰 [Riqueza]\nLa suerte de documentos inmobiliarios es muy fuerte. Es una oportunidad para aumentar activos a través de venta o contrato. El flujo de efectivo puede ser algo frustrante, pero la inversión desde una perspectiva a largo plazo es prometedora.\n\n❤️ [Amor y Relaciones]\nLa interferencia de madres o superiores puede aumentar. En el romance, valorarás la comunión mental, y se pueden hacer conexiones con personas mayores.\n\n⚠️ [Precauciones]\nDemasiados pensamientos pueden llevar a depresión o letargo. Las actividades al aire libre o sudar a través del ejercicio ayudan a mejorar la suerte. A medida que el suelo se agrieta debido a demasiado calor, ten cuidado con la piel seca o trastornos estomacales.';

  @override
  String get sajuFortune2026Gi =>
      '🌾 Fortuna General 2026 Año Byeong-oh Tierra-Gi: \'Base Sólida y Apoyo Definitivo\'\n\n2026 es un año de \'Jeong-in\' (Conocimiento) y \'Pyeon-in\' (Intuición) para ti, un Tierra-Gi. Es una situación donde la cálida luz del sol brilla sobre la tierra y madura los granos. Es un período de solidificar una base estable mientras recibes pleno apoyo y amor de los superiores.\n\n💼 [Carrera y Negocios]\nLograrás los mejores resultados en todo lo relacionado con el estudio, como exámenes de promoción, exámenes de certificación y obtención de títulos. En el trabajo, ganarás la confianza de los superiores y asumirás puestos importantes. Destacarás en campos de educación, bienes raíces, asesoramiento y bienestar.\n\n💰 [Riqueza]\nEs una suerte sostener documentos. Puedes lograr el objetivo de tener una casa propia o recibir herencia o regalos. El crecimiento estable de activos es posible, y es un año donde el honor brilla más que la riqueza.\n\n❤️ [Amor y Relaciones]\nEs un año para ser amado. Recibirás amor confiable de tu amante o conocerás a una pareja con buenas condiciones. La suerte matrimonial también entra, y la vida familiar se vuelve armoniosa.\n\n⚠️ [Precauciones]\nSi solo intentas recibir, puedes volverte perezoso. Es necesaria una postura de compartir tanto como recibiste. Desecha la dependencia y cultiva la autosuficiencia.';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ Fortuna General 2026 Año Byeong-oh Metal-Gyeong: \'Nacimiento de una Obra Maestra Más Allá de la Prueba\'\n\n2026 es un año donde \'Pyeon-gwan\' (Presión) y \'Jeong-gwan\' (Autoridad) son muy poderosos para ti, un Metal-Gyeong. Es una situación de derretir mineral crudo en un horno para hacer una espada maestra. Puede haber fuerte presión y estrés, pero si lo soportas, ganarás inmensa autoridad y honor.\n\n💼 [Carrera y Negocios]\nPuedes asumir puestos con gran responsabilidad o manejar proyectos difíciles. Sin embargo, este es un proceso de prueba para ti, y si se completa con éxito, tu estatus aumenta instantáneamente. Es una oportunidad de promoción para aquellos en cargos públicos, militares, policía y campos legales.\n\n💰 [Riqueza]\nEs una suerte de honor y títulos más que de dinero. A medida que aumenta el estatus, la riqueza seguirá naturalmente, pero el dinero que sale para el mantenimiento de la dignidad o el entretenimiento también es significativo.\n\n❤️ [Amor y Relaciones]\nPara las mujeres, es una suerte donde aparece un hombre carismático y capaz. Los hombres tienen fuerte suerte con los hijos. Las relaciones con superiores de trabajo o mayores se vuelven importantes.\n\n⚠️ [Precauciones]\nLa gestión de la salud es la máxima prioridad. Ten cuidado con enfermedades o accidentes causados por exceso de trabajo. Especialmente los pulmones y el intestino grueso pueden debilitarse. Encuentra formas de aliviar el estrés.';

  @override
  String get sajuFortune2026Sin =>
      '💎 Fortuna General 2026 Año Byeong-oh Metal-Sin: \'Joya Brillante, Cima del Honor\'\n\n2026 es un año de \'Jeong-gwan\' (Autoridad) y \'Pyeon-gwan\' (Presión) para ti, un Metal-Sin. Como una joya brillando bajo las luces, es un período donde tu valor se revela al mundo y el honor se eleva. Tienes conexiones profundas con lugares de trabajo u organizaciones rectos y estables.\n\n💼 [Carrera y Negocios]\nLa suerte de búsqueda de empleo, promoción y traslado es muy buena. También puedes recibir ofertas de scout al ser reconocido por tus habilidades. Si sigues principios y manejas el trabajo correctamente, recibirás respeto de todos.\n\n💰 [Riqueza]\nSe garantiza un salario estable o ingreso fijo. Si proteges el honor en lugar de perseguir la riqueza, la riqueza seguirá naturalmente. Puedes beneficiarte de tu esposo o lugar de trabajo.\n\n❤️ [Amor y Relaciones]\nEs la mejor suerte de matrimonio y citas para mujeres. Puedes conocer a un cónyuge recto y capaz. Los hombres ganan hijos o tienen eventos alegres debido a los hijos.\n\n⚠️ [Precauciones]\nDemasiado calor puede derretir la joya. El trabajo excesivo o el estrés pueden causar nerviosismo. Puedes parecer inflexible debido a fuertes tendencias orientadas a principios, así que ten cuidado.';

  @override
  String get sajuFortune2026Im =>
      '🌊 Fortuna General 2026 Año Byeong-oh Agua-Im: \'Un Año Dinámico de Expansión del Rango de Actividad\'\n\n2026 es un año donde entra la energía de \'Pyeon-jae\' y \'Jeong-jae\' para ti. Es como un enorme mar circulando activamente al recibir el calor del sol y moviéndose hacia el ancho mundo. Será un año dinámico donde las actividades económicas se vuelven vigorosas y llegan oportunidades para tocar gran riqueza.\n\n💼 [Carrera y Negocios]\nLa perspicacia comercial se maximiza. Un año muy bueno para ser pionero en nuevos mercados o cosechar grandes ganancias de inversiones. Suerte donde el rango de actividad puede expandirse más allá de lo doméstico al extranjero. Las decisiones audaces conducen a grandes resultados, pero la revisión detallada es esencial.\n\n💰 [Riqueza]\nLa suerte de riqueza alcanza su punto máximo. Se esperan ganancias inesperadas o ganancias comerciales a gran escala. Si montas bien el flujo de dinero, puedes formar grandes activos. Sin embargo, la gestión es importante ya que el dinero que sale puede ser tan grande como el dinero que entra.\n\n❤️ [Amor y Relaciones]\nLa sociabilidad mejora y muchas personas del sexo opuesto se reúnen alrededor con encanto desbordante. Un buen momento para disfrutar de citas activas. En las relaciones románticas, pasas momentos felices disfrutando de citas y viajes elegantes. Sin embargo, ten cuidado ya que puedes descuidar a las parejas debido a un horario demasiado ocupado.\n\n⚠️ [Precauciones]\nPresta atención a la función renal o la circulación sanguínea. Además, se necesita sabiduría para saber cómo estar satisfecho en un nivel apropiado ya que la codicia excesiva puede llevar a problemas.';

  @override
  String get sajuFortune2026Gye =>
      '💧 Fortuna General 2026 Año Byeong-oh Agua-Gye: \'Ganando Intereses Prácticos mientras Fortaleces Bases Internas\'\n\n2026 es un año donde entra la energía de \'Jeong-jae\' y \'Pyeon-jae\' para ti. Es como la luz del sol brillando después de una dulce lluvia, haciendo que la tierra esté llena de vida y abundancia. Lograrás estabilidad económica basada en ingresos estables y encontrarás pequeñas felicidades.\n\n💼 [Carrera y Negocios]\nManejas las tareas asignadas perfectamente con sinceridad y meticulosidad. Muestras excelente capacidad en finanzas, contabilidad o tareas de gestión. El reconocimiento y las recompensas siguen cuando haces lo mejor en el trabajo asignado en lugar de la codicia excesiva. Puedes crecer paso a paso mientras construyes habilidades en un entorno estable.\n\n💰 [Riqueza]\nLa suerte de riqueza es muy buena. Ocurren ingresos constantes y estables, y disfrutas de la alegría de aumentar activos a través de tecnología financiera o ahorros. Pequeñas pero definitivas ganancias se reúnen para dar gran recompensa. Los hábitos de gasto frugales brillan este año.\n\n❤️ [Amor y Relaciones]\nDas profunda confianza a las parejas con una consideración bondadosa y meticulosa. Cultivas un amor pequeño pero cálido mientras compartes vidas diarias. Las relaciones también son fluidas y pacíficas. Desempeñarás el papel de un asesor de confianza para las personas que te rodean.\n\n⚠️ [Precauciones]\nPresta atención a enfermedades oculares o salud del sistema urológico. Además, a veces practica mirar el mundo con una perspectiva amplia ya que puedes perder el gran flujo prestando atención a cosas demasiado detalladas.';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 Fortuna General 2025 Año Eulsa Fuego-Byeong: \'Logro y Competencia Llenos de Pasión\'\n\n2025 es un año donde entra la energía de \'Jeong-in\' y \'Bi-gyeon\' para ti. Es como el sol en el cielo encontrándose con el calor en el suelo para arder aún más caliente. Ganarás fuerzas de apoyo fuertes y empujarás hacia los objetivos sin dudarlo basado en la confianza.\n\n💼 [Carrera y Negocios]\nLograrás un gran crecimiento con la ayuda de ayudantes o mentores confiables. Muy ventajoso para adquirir certificaciones o logros académicos. La colaboración con colegas brilla, y liderarás al equipo al éxito ejerciendo liderazgo. Sin embargo, cuidado ya que el espíritu competitivo excesivo puede dañar las relaciones.\n\n💰 [Riqueza]\nUn momento para aumentar la riqueza mientras compartes información con personas que te rodean. Se esperan ingresos a través de inversión conjunta o cooperación. Sin embargo, es importante cuidar los intereses prácticos ya que puedes gastar excesivamente debido al orgullo o consciente de la mirada de los demás.\n\n❤️ [Amor y Relaciones]\nUn año donde las amistades se profundizan ya que habrá muchas reuniones con personas. En las relaciones románticas, la comodidad como un amigo se vuelve más fuerte. Sin embargo, se necesita un equilibrio apropiado ya que pueden surgir conflictos al priorizar a los amigos sobre las parejas.\n\n⚠️ [Precauciones]\nPresta atención a los sistemas de circulación sanguínea como la presión arterial o la salud cardíaca. Además, siempre mantén la paz mental ya que las emociones impulsivas debido a una personalidad ardiente pueden arruinar las cosas.';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 Fortuna General 2025 Año Eulsa Fuego-Jeong: \'Estabilidad y Oportunidad Encontradas en Medio del Cambio\'\n\n2025 es un año donde entra la energía de \'Pyeon-in\' y \'Geob-jae\' para ti. Es como una vela parpadeando en el viento pero eventualmente iluminando los alrededores y revelando su presencia. Pueden venir cambios inesperados, pero será un año donde los superas sabiamente y los conviertes en oportunidades.\n\n💼 [Carrera y Negocios]\nLas ideas originales y la intuición brillan. Apuntarás a nichos de mercado que otros no han pensado o lograrás resultados profundos en campos profesionales. Sin embargo, la competencia con colegas se vuelve feroz y puede haber personas tratando de arrebatar resultados, así que presta atención al mantenimiento de la seguridad y la gestión de relaciones.\n\n💰 [Riqueza]\nUn año donde puede haber fluctuaciones en la suerte de riqueza. Se necesita una gestión de activos conservadora ya que pueden ocurrir gastos inesperados o pueden verse pérdidas en inversiones. Sin embargo, los ingresos usando tus propias habilidades profesionales vendrán de manera estable. Es mejor evitar transacciones financieras.\n\n❤️ [Amor y Relaciones]\nPuedes volverte pasivo en las citas a medida que aumentan los pensamientos. En las relaciones románticas, es fácil sentirse decepcionado por cosas pequeñas, por lo que es importante confiar en la otra persona y tratarla con un corazón abierto. Llenar el ser interior a través del tiempo a solas también es una buena manera.\n\n⚠️ [Precauciones]\nCuidado con los trastornos nerviosos o insomnio debido al estrés. Es importante manejar tu mente a través de la meditación o ejercicio ligero, y tratar de tener una mentalidad positiva en lugar de pensamientos negativos.';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ Fortuna General 2025 Año Eulsa Tierra-Mu: \'Un Año de Madurez Fortaleciendo Bases Internas Sabiamente\'\n\n2025 es un año donde entra la energía de \'Jeong-gwan\' y \'Pyeon-in\' para ti. Es como calor cálido impregnando bajo una enorme montaña para abrazar todo. Será un año sustancial de agregar tu propia profundidad mientras mantienes el honor social.\n\n💼 [Carrera y Negocios]\nSubirás a una posición responsable dentro de la organización o vendrán oportunidades de promoción. Si valoras los principios y trabajas sinceramente, recibirás gran reconocimiento. Al mismo tiempo, logras excelentes resultados en la adquisición de conocimientos profesionales o tareas de investigación. Sin embargo, se necesita pensamiento flexible ya que puedes rechazar el cambio al estar atrapado en estereotipos.\n\n💰 [Riqueza]\nSe garantiza un ingreso estable. Es ventajoso ahorrar sinceramente y gestionar activos. La fortuna relacionada con bienes raíces o documentos es buena, por lo que vale la pena considerar inversiones a largo plazo. Sin embargo, evita inversiones irrazonables al ser sacudido por tentaciones circundantes.\n\n❤️ [Amor y Relaciones]\nGanas confianza de las personas con un habla y acciones dignas. En las relaciones románticas, es un buen momento para respetarse mutuamente y desarrollarse en una relación seria. Si piensas en el matrimonio, también es bueno hacer planes específicos.\n\n⚠️ [Precauciones]\nPresta atención al sistema digestivo o salud de la piel. Además, practica tomar decisiones rápidas escuchando consejos circundantes ya que puedes experimentar parálisis por análisis debido a pensar demasiado.';

  @override
  String get sajuFortune2025Gi =>
      '🌾 Fortuna General 2025 Año Eulsa Tierra-Gi: \'Logrando Objetivos con Responsabilidad\'\n\n2025 es un año donde entra la energía de \'Pyeon-gwan\' y \'Jeong-in\' para ti. Es como la luz del sol brillando después de la lluvia en una tierra amplia para cultivar cultivos. Puede haber procesos difíciles, pero será un año gratificante de eventualmente ganar honor y lograr objetivos.\n\n💼 [Carrera y Negocios]\nLa intensidad del trabajo puede aumentar y se pueden dar tareas difíciles. Sin embargo, probarás tus cualidades como líder al superarlas con tus habilidades y paciencia. Pasarás por crisis con la ayuda o apoyo de superiores, y como resultado, probarás una gran sensación de logro.\n\n💰 [Riqueza]\nUn año donde necesitas prestar atención a la gestión de gastos. Puede haber mucho dinero saliendo, como impuestos inesperados o cargos de servicios públicos. Sin embargo, como puedes esperar incentivos o bonos como resultado de esfuerzos constantes, la sinceridad es la clave para llamar a la riqueza.\n\n❤️ [Amor y Relaciones]\nUna apariencia responsable resulta atractiva para el sexo opuesto. En las relaciones románticas, el vínculo se profundiza al escuchar las dificultades del otro y consolarse mutuamente. Sin embargo, se necesitan esfuerzos para una comunicación frecuente aunque sea breve ya que puedes descuidar a las parejas debido a una vida diaria ocupada.\n\n⚠️ [Precauciones]\nCuidado con la disminución de la inmunidad debido al exceso de trabajo. Es importante manejar la fuerza física con comidas regulares y ejercicio, y aliviar el estrés con pensamientos positivos.';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ Fortuna General 2025 Año Eulsa Metal-Gyeong: \'Ganando Honor mientras Cuidas Intereses Prácticos\'\n\n2025 es un año donde entra la energía de \'Jeong-jae\' y \'Pyeon-gwan\' para ti. Es como una roca sólida siendo calentada por fuego y renaciendo como una espada preciosa. Ganarás recompensas definitivas por tus esfuerzos y probarás socialmente tu valor.\n\n💼 [Carrera y Negocios]\nLogras grandes resultados con pensamiento orientado a resultados e impulso. Especialmente reconocido por habilidades en campos de finanzas, gestión y tecnología. La suerte para resolver problemas difíciles y ganar honor es fuerte, pero la responsabilidad también crece, por lo que puedes sentir presión. Cree en ti mismo y avanza con audacia.\n\n💰 [Riqueza]\nLa suerte de riqueza es muy buena. Además de ingresos estables, ganas beneficios prácticos a través de inversiones o trabajos secundarios. Captarás con precisión el flujo de dinero y gestionarás eficientemente los activos. Sin embargo, abstente de gastar grandes sumas por honor.\n\n❤️ [Amor y Relaciones]\nApela al sexo opuesto con una apariencia sincera y confiable. En las relaciones románticas, das a la otra persona una sensación de alivio con una actitud responsable. En las relaciones, puedes dar una imagen algo estricta, por lo que es bueno hablar con algo de humor suave ocasionalmente.\n\n⚠️ [Precauciones]\nPresta atención a la salud ósea o articular, y enfermedades respiratorias. Además, cálmate con una mente de \'esto es suficiente\' ya que puedes criticarte a ti mismo debido a tendencias perfeccionistas.';

  @override
  String get sajuFortune2025Sin =>
      '💎 Fortuna General 2025 Año Eulsa Metal-Sin: \'Un Año de Sabiduría Brillando en Medio del Cambio\'\n\n2025 es un año donde entra la energía de \'Pyeon-jae\' y \'Jeong-gwan\' para ti. Es como una joya sofisticada revelando su valor bajo una iluminación brillante. Será un año agradable donde el estatus social aumenta junto con ganancias inesperadas.\n\n💼 [Carrera y Negocios]\nLa perspicacia comercial mejora y la capacidad de capturar nuevas oportunidades es excelente. Un momento en que los desafíos audaces regresan como grandes ganancias. Dentro de la organización, ganas confianza con juicio racional y atrapas oportunidades de promoción o traslado. Sin embargo, ten cuidado de no descuidar el proceso al enfocarte demasiado en los resultados.\n\n💰 [Riqueza]\nUn año donde entra la suerte de dinero. Surgen oportunidades para tocar gran riqueza como rendimientos de inversión inesperados o herencia. Sin embargo, como los gastos también pueden volverse elegantes, es importante mantener hábitos de gasto planificados.\n\n❤️ [Amor y Relaciones]\nTe conviertes en el protagonista en reuniones sociales con una apariencia elegante y atractiva. La suerte en las citas es muy fuerte, por lo que puedes recibir avances de muchas personas. En las relaciones románticas, pasas momentos apasionados y agradables. Un buen año para desarrollarse en un encuentro serio.\n\n⚠️ [Precauciones]\nPresta atención a la salud pulmonar o enfermedades de la piel. Además, siempre mantén la humildad y no olvides la mente para considerar a los demás ya que puedes parecer arrogante a las personas debido a la confianza excesiva.';

  @override
  String get sajuFortune2025Im =>
      '🌊 Fortuna General 2025 Año Eulsa Agua-Im: \'Resultados a Través de la Sabiduría\'\n\n2025 es un año donde entra la energía de \'Sang-gwan\' y \'Pyeon-jae\' para ti. Es como un gran río que fluye y humedece un campo extenso. Será un año dinámico en el que obtendrás una gran riqueza y expandirás tu radio de acción al ejercitar tus talentos y elocuencia.\n\n💼 [Carrera y Negocios]\nTu elocuencia mejora y logras excelentes resultados en los campos de marketing o relaciones públicas. Es un momento muy propicio para comercializar tus ideas o ser pionero en nuevos mercados. Será el mejor año para quienes realizan trabajos creativos. Sin embargo, es importante ser cortés, ya que puede haber fricciones con los superiores.\n\n💰 [Riqueza]\nLa suerte financiera se mueve activamente. La fortuna para ganar dinero con tus propias habilidades es fuerte y surgirán oportunidades para manejar grandes sumas de dinero. Sin embargo, se necesita precaución con las inversiones especulativas, y la suerte de la riqueza se mantendrá a largo plazo solo si tienes la disposición de dar tanto como has ganado.\n\n❤️ [Amor y Relaciones]\nCon un humor y encanto desbordantes, la gente nunca dejará de estar a tu alrededor. Un año en el que podrás disfrutar de citas agradables con gran popularidad entre el sexo opuesto. En las relaciones románticas, darás vida a la pareja a través de diversas citas. Sin embargo, ten cuidado, ya que una sola palabra ligera puede causar malentendidos.\n\n⚠️ [Precauciones]\nPresta atención a la salud del sistema renal o urológico. Además, dedica tiempo al descanso y la nutrición adecuados, ya que tu fuerza física puede agotarse debido a un amplio rango de actividades.';

  @override
  String get sajuFortune2025Gye =>
      '💧 Fortuna General 2025 Año Eulsa Agua-Gye: \'Un Año de Sinceridad que Produce Frutos Estables\'\n\n2025 es un año donde entra la energía de \'Sik-sin\' y \'Jeong-jae\' para ti. Es como una llovizna clara que humedece la tierra para prepararla para una cosecha rica. Será un año cálido en el que tus esfuerzos se acumularán constantemente y regresarán como riqueza y felicidad estables.\n\n💼 [Carrera y Negocios]\nUn año en el que la sinceridad se convierte en tu mejor arma. Produces resultados constantes al cumplir con tus responsabilidades y ganas la confianza de tus colegas. Es un buen momento para desarrollar tu experiencia y te sentirás recompensado a través del trabajo que te gusta. Puedes crecer paso a paso en un ambiente estable.\n\n💰 [Riqueza]\nUn año económicamente relajado y estable. Se producen ingresos constantes y disfrutarás de la diversión de aumentar tus activos de manera frugal. Hay suerte en la alimentación y el vestuario, por lo que la abundancia está presente en tu vida en general. Los ahorros son más ventajosos que las inversiones arriesgadas.\n\n❤️ [Amor y Relaciones]\nBrindas consuelo a tu pareja con una apariencia afectuosa. Un año en el que cultivarás un amor hermoso mientras se consideran mutuamente de forma meticulosa. Si estás soltero, es muy probable que conozcas a una pareja que se comunique bien y tenga valores similares.\n\n⚠️ [Precauciones]\nPresta atención a la salud del estómago o a la gestión de los hábitos alimenticios. Es bueno encontrar vitalidad mediante nuevos estímulos ocasionales, ya que podrías volverte perezoso al conformarte con la comodidad.';

  @override
  String get preparationForTomorrow => 'Preparación para Mañana';

  @override
  String get howToMeetMoreLuck => 'Cómo atraer más suerte';

  @override
  String get enterName => 'Por favor ingresa tu nombre';

  @override
  String fortuneDateConfirm(String date) {
    return '¿Te gustaría consultar la fortuna para el $date?';
  }

  @override
  String get colorPurple => 'Púrpura';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorYellow => 'Amarillo';

  @override
  String get colorRed => 'Rojo';

  @override
  String get colorGreen => 'Verde';

  @override
  String get colorPink => 'Rosa';

  @override
  String get colorOrange => 'Naranja';

  @override
  String get colorWhite => 'Blanco';

  @override
  String get colorBlack => 'Negro';

  @override
  String get itemPerfume => 'Perfume';

  @override
  String get itemHandkerchief => 'Pañuelo';

  @override
  String get itemRing => 'Anillo';

  @override
  String get itemWatch => 'Reloj';

  @override
  String get itemGlasses => 'Gafas';

  @override
  String get itemHat => 'Sombrero';

  @override
  String get itemBook => 'Libro';

  @override
  String get itemEarphones => 'Auriculares';

  @override
  String get itemMirror => 'Espejo';

  @override
  String get itemPen => 'Bolígrafo';

  @override
  String get itemCoin => 'Moneda';

  @override
  String get itemKey => 'Llave';

  @override
  String get dirEast => 'Este';

  @override
  String get dirWest => 'Oeste';

  @override
  String get dirSouth => 'Sur';

  @override
  String get dirNorth => 'Norte';

  @override
  String get dirNorthEast => 'Noreste';

  @override
  String get dirSouthEast => 'Sureste';

  @override
  String get dirNorthWest => 'Noroeste';

  @override
  String get dirSouthWest => 'Suroeste';

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
  String get weatherConditionPartlyCloudy => 'Parcialmente nublado';

  @override
  String get weatherConditionCloudy => 'Nublado';

  @override
  String get weatherConditionFoggy => 'Neblinoso';

  @override
  String get weatherConditionDrizzle => 'Llovizna';

  @override
  String get weatherConditionRainy => 'Lluvioso';

  @override
  String get weatherConditionFreezingRain => 'Lluvia gélida';

  @override
  String get weatherConditionSnowy => 'Nevado';

  @override
  String get weatherConditionSnowGrains => 'Cinarra';

  @override
  String get weatherConditionRainShowers => 'Chubascos';

  @override
  String get weatherConditionSnowShowers => 'Chubascos de nieve';

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
  String get allowAllItems => 'Por favor, activa todos los permisos';

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
  String get wakeUpAlarm => 'Alarma de Despertador';

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
  String get daySunFull => 'Domingo';

  @override
  String get dayMonFull => 'Lunes';

  @override
  String get dayTueFull => 'Martes';

  @override
  String get dayWedFull => 'Miércoles';

  @override
  String get dayThuFull => 'Jueves';

  @override
  String get dayFriFull => 'Viernes';

  @override
  String get daySatFull => 'Sábado';

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
  String get member => 'Miembro';

  @override
  String get manageSajuInfo => 'Gestionar info de Cuatro Pilares';

  @override
  String get freeCharge => 'Recarga gratis';

  @override
  String get fortunePass => 'Pase de Fortuna';

  @override
  String get unlimitedNotSubscribed => 'No suscrito';

  @override
  String get unlimitedInUse => 'En uso';

  @override
  String get subscribe => 'Suscribirse';

  @override
  String get manageSubscription => 'Gestionar suscripción';

  @override
  String get purchaseHistory => 'Historial de compras';

  @override
  String get customerCenter => 'Soporte';

  @override
  String get noNewNotifications => 'No hay notificaciones nuevas.';

  @override
  String get noPurchaseHistory => 'No hay historial de compras.';

  @override
  String get none => 'Ninguno';

  @override
  String deleteConfirmMessage(String title) {
    return '¿Quieres eliminar \"$title\"?';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get notepad => 'Bloc de notas';

  @override
  String get today => 'Hoy';

  @override
  String get yearView => 'Año';

  @override
  String get monthView => 'Mes';

  @override
  String get weekView => 'Semana';

  @override
  String get dayView => 'Día';

  @override
  String get noEvents => 'No hay eventos programados.';

  @override
  String get calendarDragGuide =>
      'Arrastra hacia abajo para ver el calendario detallado.';

  @override
  String get noSavedMemos => 'No hay notas o eventos guardados.';

  @override
  String get holiday => 'Festivo';

  @override
  String get photo => 'Foto';

  @override
  String get drawing => 'Dibujo';

  @override
  String get drawingTitle => 'Dibujo';

  @override
  String get pencil => 'Lápiz';

  @override
  String get marker => 'Marcador';

  @override
  String get eraser => 'Borrador';

  @override
  String adjustThickness(String label) {
    return 'Ajustar grosor de $label';
  }

  @override
  String get sticker => 'Pegatina';

  @override
  String get event => 'Evento';

  @override
  String get memo => 'Nota';

  @override
  String get routineExercise => 'Ejercicio';

  @override
  String get routineHiking => 'Senderismo';

  @override
  String get routineCleaning => 'Limpieza';

  @override
  String get routineTravel => 'Viaje';

  @override
  String get routineDate => 'Cita';

  @override
  String get routineConcert => 'Concierto';

  @override
  String get routineMovie => 'Película';

  @override
  String get routineMeeting => 'Reunión';

  @override
  String get howIsYourMoodToday => '¿Cómo está tu ánimo hoy?';

  @override
  String get complete => 'Completar';

  @override
  String get amWithIcon => '☀️ AM';

  @override
  String get pmWithIcon => '🌙 PM';

  @override
  String get photoPermissionDescription =>
      'Para añadir fotos, debes permitir el acceso a las fotos en los ajustes.';

  @override
  String get goToSettings => 'Ir a Ajustes';

  @override
  String get photoPermissionNeeded =>
      'Se requiere permiso de acceso a las fotos.';

  @override
  String get fontSize => 'Tamaño de fuente';

  @override
  String get fontFamily => 'Fuente';

  @override
  String get textColor => 'Color de texto';

  @override
  String get textAlign => 'Alineación';

  @override
  String get alignLeft => 'Izquierda';

  @override
  String get alignCenter => 'Centro';

  @override
  String get alignRight => 'Derecha';

  @override
  String get edit => 'Editar';

  @override
  String get fontSettings => 'Ajustes de fuente';

  @override
  String get imageAddedFromKeyboard => 'Imagen añadida desde el teclado.';

  @override
  String get cancelWriting => 'Cancelar escritura';

  @override
  String get cancelWritingConfirm =>
      'Hay contenido escrito. ¿Quieres cancelar y salir?';

  @override
  String get continueWriting => 'Continuar escribiendo';

  @override
  String get title => 'Título';

  @override
  String get content => 'Contenido';

  @override
  String get selectTime => 'Seleccionar hora';

  @override
  String get noTime => 'Sin hora';

  @override
  String minutesLater(String minutes) {
    return '$minutes min después';
  }

  @override
  String get countLabel => 'Cantidad';

  @override
  String timesCount(String count) {
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
  String get routineSummary => 'Resumen de Rutina';

  @override
  String get alarmOn => 'Alarma ENCENDIDA';

  @override
  String get alarmOff => 'Alarma APAGADA';

  @override
  String get contentHint => 'Agregar contenido';

  @override
  String get addEvent => 'Agregar Evento';

  @override
  String get manageItem => 'Gestionar Elemento';

  @override
  String get manageItemDescription =>
      '¿Qué te gustaría hacer con este elemento?';

  @override
  String get noTitle => 'Sin Título';

  @override
  String get selectTitleColor => 'Seleccionar Color del Título';

  @override
  String get save => 'Guardar';

  @override
  String get missionNone => 'Sin Misión';

  @override
  String get missionSnap => 'Captura de Objetos';

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
      '¡Atrapa a Fortuni en movimiento!';

  @override
  String get missionWalk => 'Caminar';

  @override
  String get missionWalkDescription => '¡Camina para apagar la alarma!';

  @override
  String get missionFaceDescription =>
      'Mantén tu rostro en el marco por 5 segundos.';

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
  String missionAnalyzing(int index, int total) {
    return 'Misión $index/$total Analizando...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'Misión $index/$total: Apunta al objeto en la guía.';
  }

  @override
  String get missionPointSink => 'Apunta al fregadero.';

  @override
  String get missionPointRefrigerator => 'Apunta al refrigerador.';

  @override
  String get missionPointScale => 'Apunta a la báscula.';

  @override
  String get missionPointFace => 'Apunta a tu cara.';

  @override
  String get missionPointObjectGeneric => 'Apunta al objeto especificado.';

  @override
  String get missionRecognizeObject => 'Por favor reconoce el objeto.';

  @override
  String get missionPerform => 'Por favor realiza la misión.';

  @override
  String get initError => 'Ocurrió un error durante la inicialización.';

  @override
  String get analyzingNextTarget => 'Analizando el siguiente objetivo...';

  @override
  String get errorOccurredGeneric => 'Ocurrió un error';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '¡$completed/$total Éxito!';
  }

  @override
  String missionMatchSuccess(int total) {
    return '¡$total/$total Éxito! ¡Coincidencia exitosa!';
  }

  @override
  String get escape => 'Escapar';

  @override
  String get pointObjectClearly =>
      'Toma una foto donde el objetivo sea claramente visible';

  @override
  String get matchingSuccess => '¡Coincidencia Exitosa!';

  @override
  String get missionComplete => '¡Misión Completada!';

  @override
  String get allMissionsComplete => '¡Todas las Misiones Completadas!';

  @override
  String missionSnoozeMessage(String minutes) {
    return '¡Misión Exitosa! Pero sonará de nuevo en $minutes minutos según la configuración.';
  }

  @override
  String get showFace => 'Por favor muestra tu cara';

  @override
  String get keepWatching => 'Sigue mirando la pantalla';

  @override
  String get recognizingFaceForFortune =>
      'Reconociendo rostro para análisis de fisonomía';

  @override
  String get dataNotStored => 'Los datos no se almacenan';

  @override
  String get solveProblem => 'Por favor resuelve el problema.';

  @override
  String get correctAnswer => '¡Respuesta correcta!';

  @override
  String get wrongAnswerRetry => 'Incorrecto. Por favor intenta de nuevo.';

  @override
  String get correct => '¡Correcto!';

  @override
  String get walkToDismiss => 'Por favor camina sosteniendo tu teléfono';

  @override
  String get shakeCount => 'Conteo de Agitación';

  @override
  String shakeTimes(int count) {
    return '$count veces';
  }

  @override
  String tapTimes(int count) {
    return '$count toques';
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
  String get selectMissionTitle =>
      'Por favor selecciona una misión para apagar la alarma.';

  @override
  String get ringtoneCategoryStandard => 'Estándar';

  @override
  String get ringtoneCategoryCalm => 'Tranquilo';

  @override
  String get ringtoneCategoryUpbeat => 'Alegre';

  @override
  String get ringtoneCategoryLoud => 'Fuerte';

  @override
  String get noRingtones => 'No se encontraron tonos.';

  @override
  String get photoPermissionRequired =>
      'Se requiere permiso de acceso a fotos.';

  @override
  String get deleteImage => 'Eliminar Imagen';

  @override
  String get longPressToDelete => 'Mantén presionado para eliminar.';

  @override
  String get videoLoadFail => 'Error al cargar video\nToca para reintentar';

  @override
  String get existingCapturedImages => 'Imágenes Capturadas Existentes';

  @override
  String deleteCount(int count) {
    return 'Eliminar $count';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return '¿Estás seguro de que deseas eliminar $count imágenes?\nEsta acción no se puede deshacer.';
  }

  @override
  String get classicAlarm => 'Alarma Clásica';

  @override
  String get digitalAlarm => 'Alarma Digital';

  @override
  String get birdsSound => 'Pájaros Cantando';

  @override
  String get wavesSound => 'Olas del Océano';

  @override
  String get cuckooClock => 'Reloj Cucú';

  @override
  String get calmAlarm => 'Alarma Tranquila';

  @override
  String get doorKnock => 'Golpe de Puerta';

  @override
  String get earlySunrise => 'Amanecer Temprano';

  @override
  String get goodMorningSound => 'Buenos Días';

  @override
  String get inAHurry => 'Con Prisa';

  @override
  String get lovingYou => 'Amándote';

  @override
  String get sirenSound => 'Sirena';

  @override
  String get swingingSound => 'Columpio';

  @override
  String get telephoneBusy => 'Teléfono Ocupado';

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
  String get retry => 'Reintentar';

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
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes min (ilimitado)';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes min ($current/$total)';
  }

  @override
  String get ringtone_fluttering_day => 'Día emocionante';

  @override
  String get ringtone_cozy_day => 'Día acogedor';

  @override
  String get ringtone_sensible_day => 'Día sereno';

  @override
  String get ringtone_play_with_me => 'Juega conmigo';

  @override
  String get ringtone_refreshing_day => 'Día refrescante';

  @override
  String get ringtone_new_beginning => 'Nuevo comienzo';

  @override
  String get ringtone_self_love => 'Amor propio';

  @override
  String get cherry_stained_finger => 'Huella de cereza';

  @override
  String get dancing_in_the_stars => 'Bailando en las estrellas';

  @override
  String get nice_day => 'Buen día';

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
  String fortuneSelectTitleDate(String month, int day) {
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
  String fortuneResultTitleDate(int year, String month, int day) {
    return 'Fortuna para el $year/$month/$day';
  }

  @override
  String get startDayButton => 'Comienza Tu Día';

  @override
  String get tarotName0 => 'El Loco';

  @override
  String get tarotName1 => 'El Mago';

  @override
  String get tarotName2 => 'La Sacerdotisa';

  @override
  String get tarotName3 => 'La Emperatriz';

  @override
  String get tarotName4 => 'El Emperador';

  @override
  String get tarotName5 => 'El Hierofante';

  @override
  String get tarotName6 => 'Los Enamorados';

  @override
  String get tarotName7 => 'El Carro';

  @override
  String get tarotName8 => 'La Fuerza';

  @override
  String get tarotName9 => 'El Ermitaño';

  @override
  String get tarotName10 => 'La Rueda de la Fortuna';

  @override
  String get tarotName11 => 'La Justicia';

  @override
  String get tarotName12 => 'El Colgado';

  @override
  String get tarotName13 => 'La Muerte';

  @override
  String get tarotName14 => 'La Templanza';

  @override
  String get tarotName15 => 'El Diablo';

  @override
  String get tarotName16 => 'La Torre';

  @override
  String get tarotName17 => 'La Estrella';

  @override
  String get tarotName18 => 'La Luna';

  @override
  String get tarotName19 => 'El Sol';

  @override
  String get tarotName20 => 'El Juicio';

  @override
  String get tarotName21 => 'El Mundo';

  @override
  String get tarotKeywords0 =>
      'Nuevos comienzos, aventura, inocencia, libertad, imprudencia';

  @override
  String get tarotDesc0 =>
      'El Loco se encuentra precariamente al borde de un acantilado con ropas coloridas, pero su mirada está fija en la distancia, llena de esperanza.';

  @override
  String get tarotLoveMeaning0 =>
      'Puede llegar un nuevo amor inesperado o un encuentro fatídico a primera vista.';

  @override
  String get tarotLoveDetail0 =>
      'Es un momento en el que puedes comenzar el amor con un corazón puro como el de un niño. Olvida todas las heridas pasadas y sé fiel a tus sentimientos.';

  @override
  String get tarotWealthMeaning0 =>
      'Una nueva inversión o negocio puede llamar tu atención. Es un momento en el que las ganancias siguen cuando trabajas felizmente.';

  @override
  String get tarotWealthDetail0 =>
      'Es un momento en el que se abren nuevas oportunidades financieramente. Puedes lograr resultados inesperados si inviertes en un campo nuevo.';

  @override
  String get tarotSuccessMeaning0 =>
      'Es un buen momento para comenzar un nuevo proyecto o cambiar de trabajo a un campo completamente diferente.';

  @override
  String get tarotSuccessDetail0 =>
      'Si hay algo para lo que te estás preparando, da el primer paso con valentía. Es el momento más adecuado para dejar un entorno familiar.';

  @override
  String get tarotKeywords1 =>
      'Creatividad, maestría, autoexpresión, ingenio, voluntad';

  @override
  String get tarotDesc1 =>
      'El Mago está de pie ante una mesa con los símbolos de los cuatro elementos. Con una mano hacia el cielo y la otra hacia la tierra, simboliza la capacidad de manifestar ideas en la realidad.';

  @override
  String get tarotLoveMeaning1 =>
      'Es una oportunidad excelente para mostrar tu encanto y conquistar el corazón de alguien.';

  @override
  String get tarotLoveDetail1 =>
      'Tu carisma y talentos están en su punto máximo, haciéndote irresistible para los demás. Si tienes a alguien especial en mente, no dudes en tomar la iniciativa y acercarte con confianza. Tu sentido del humor y conversación ingeniosa cautivarán a tu pareja, permitiéndote liderar el rumbo de la relación.';

  @override
  String get tarotWealthMeaning1 =>
      'Es el momento ideal para generar nuevos ingresos aprovechando tus habilidades.';

  @override
  String get tarotWealthDetail1 =>
      'Tus conocimientos, habilidades e ideas pueden convertirse en beneficios financieros reales ahora mismo. No te limites solo a tu salario base; intenta monetizar tus pasatiempos o emprender proyectos paralelos. Tu capacidad de planificación creativa y ventas te ayudará a alcanzar ganancias que superarán tus expectativas.';

  @override
  String get tarotSuccessMeaning1 =>
      'Tus capacidades profesionales brillarán y recibirás el reconocimiento de quienes te rodean.';

  @override
  String get tarotSuccessDetail1 =>
      'En el trabajo o los estudios, podrás demostrar todo tu potencial y destacar entre los demás. Resolverás cualquier desafío gracias a tu ingenio y mente aguda. Tus colegas y superiores te reconocerán como un verdadero experto, así que actúa con total seguridad en ti mismo.';

  @override
  String get tarotKeywords2 =>
      'Intuición, misterio, subconsciente, sabiduría interior, pasividad';

  @override
  String get tarotDesc2 =>
      'La Sacerdotisa se sienta entre una columna blanca y una negra, custodiando el pergamino de la sabiduría. Simboliza la intuición profunda y el equilibrio entre lo consciente y lo inconsciente.';

  @override
  String get tarotLoveMeaning2 =>
      'Un periodo donde la conexión espiritual es más importante que la atracción física.';

  @override
  String get tarotLoveDetail2 =>
      'Te sentirás más atraído por personas con un mundo interior rico con quienes puedas tener conversaciones profundas. Tu intuición está agudizada, permitiéndote entender a tu pareja sin necesidad de palabras. Sin embargo, un exceso de reserva podría causar malentendidos, así que intenta expresar tus sentimientos con sinceridad de vez en cuando.';

  @override
  String get tarotWealthMeaning2 =>
      'Es tiempo de proteger tus activos y observar la situación en lugar de arriesgar.';

  @override
  String get tarotWealthDetail2 =>
      'No es el mejor momento para perseguir ganancias rápidas sin pensar. En lugar de actuar impulsivamente, dedica tiempo a analizar el mercado y estudiar herramientas financieras. Es una etapa de «siembra», así que no te angusties si los frutos no llegan de inmediato; las inversiones a largo plazo valdrán la pena.';

  @override
  String get tarotSuccessMeaning2 =>
      'El éxito te espera en actividades académicas, investigación y profesiones intelectuales.';

  @override
  String get tarotSuccessDetail2 =>
      'Concéntrate en fortalecer tu potencial interno y mejorar tus competencias en lugar de buscar el brillo externo. Lograrás resultados sobresalientes en tareas que requieran análisis profundo y planificación. Tu sabiduría y prudencia serán la clave del éxito en los momentos decisivos.';

  @override
  String get tarotKeywords3 =>
      'Feminidad, belleza, naturaleza, abundancia, fertilidad';

  @override
  String get tarotDesc3 =>
      'La Emperatriz descansa en un jardín floreciente, representando la prosperidad material y la generosidad emocional.';

  @override
  String get tarotLoveMeaning3 =>
      'Tiempo de florecimiento emocional y fortalecimiento de los lazos afectivos.';

  @override
  String get tarotLoveDetail3 =>
      'Tu encanto y energía femenina (o receptiva) están al máximo, haciéndote increíblemente atractivo. En tus relaciones habrá armonía y cuidado mutuo, siendo un buen momento para hablar de matrimonio o planes familiares. Si estás soltero, un cambio de imagen o estilo te ayudará a atraer la atención de alguien valioso.';

  @override
  String get tarotWealthMeaning3 =>
      'Periodo de prosperidad material y estabilidad financiera.';

  @override
  String get tarotWealthDetail3 =>
      'La suerte financiera está de tu lado. Tus esfuerzos pasados darán frutos y podrás disfrutar de una mayor comodidad. Podrías recibir bonos inesperados, regalos o ganancias de inversiones exitosas. Comparte tu energía positiva con los demás y esto atraerá aún más fortuna a tu vida.';

  @override
  String get tarotSuccessMeaning3 =>
      'Los proyectos actuales avanzan con éxito y traen resultados excelentes.';

  @override
  String get tarotSuccessDetail3 =>
      'Es hora de ver los frutos reales de tu trabajo. Los proyectos concluirán con éxito, lo que podría traducirse en un ascenso o una bonificación. Tu visión creativa y sentido estético serán muy valorados. Disfruta del proceso laboral; esto te ayudará a alcanzar metas aún más altas.';

  @override
  String get tarotKeywords4 =>
      'Autoridad, estructura, control, liderazgo, lógica';

  @override
  String get tarotDesc4 =>
      'El Emperador se sienta en un trono de piedra con armadura, simbolizando firmeza, orden y determinación en el mando.';

  @override
  String get tarotLoveMeaning4 =>
      'Relación estable con una pareja fiable y responsable.';

  @override
  String get tarotLoveDetail4 =>
      'En lugar de pasiones fugaces, la confianza y la seguridad en el futuro toman el protagonismo. Tu pareja será un apoyo sólido y protector para ti. Intenta evitar el control excesivo y la terquedad en la comunicación. Para los solteros, se vislumbra un encuentro con una persona influyente y de estatus.';

  @override
  String get tarotWealthMeaning4 =>
      'La gestión sistemática de activos ayudará a construir un capital estable.';

  @override
  String get tarotWealthDetail4 =>
      'En asuntos financieros, es crucial ceñirse a un plan y a tus principios. En lugar de especulaciones arriesgadas, elige instrumentos seguros como depósitos o bienes raíces. Tu pragmatismo y determinación te ayudarán a sentar las bases de una riqueza duradera.';

  @override
  String get tarotSuccessMeaning4 =>
      'Buenas oportunidades de ascenso o de obtener una posición de liderazgo.';

  @override
  String get tarotSuccessDetail4 =>
      'Tu posición en el equipo se fortalece. Los directivos valorarán tus dotes de mando y podrían confiarte la gestión de un proyecto o departamento importante. Usa la lógica y el cálculo frío para resolver tareas laborales y ganarás la confianza total de tus superiores.';

  @override
  String get tarotKeywords5 =>
      'Tradición, enseñanza, creencias, consejo, mediación';

  @override
  String get tarotDesc5 =>
      'El Hierofante simboliza las normas sociales y la guía espiritual, liderando a través de consejos sabios y valores tradicionales.';

  @override
  String get tarotLoveMeaning5 =>
      'Relaciones serias y saludables basadas en el respeto mutuo.';

  @override
  String get tarotLoveDetail5 =>
      'No buscarás aventuras pasajeras, sino una relación profunda con miras a formar una familia. Conocer a alguien a través de amigos comunes o en eventos formales podría ser el inicio de algo importante. Si hay disputas en la pareja, busca consejo en personas mayores; su experiencia te ayudará a restaurar la armonía.';

  @override
  String get tarotWealthMeaning5 =>
      'Es preferible seguir métodos de ahorro tradicionales y comprobados.';

  @override
  String get tarotWealthDetail5 =>
      'Prioriza la seguridad sobre las inversiones arriesgadas. Los depósitos bancarios o los seguros serán las opciones más adecuadas. La consulta con un experto financiero o mantener la honestidad en tus tratos te ayudará a conservar y aumentar tu patrimonio.';

  @override
  String get tarotSuccessMeaning5 =>
      'Momento favorable para firmar contratos y acuerdos de asociación.';

  @override
  String get tarotSuccessDetail5 =>
      'En lugar de resolver los problemas solo, busca el apoyo de colegas o mentores. Respetar las reglas y procedimientos corporativos es el camino más corto al reconocimiento. También es un periodo propicio para firmar documentos importantes y establecer redes de contacto profesionales.';

  @override
  String get tarotKeywords6 => 'Amor, armonía, elección, unión, asociación';

  @override
  String get tarotDesc6 =>
      'Bajo los rayos de un sol cálido, Adán y Eva reciben la bendición de un ángel. Es el símbolo de la unión de almas y de una elección vital importante.';

  @override
  String get tarotLoveMeaning6 =>
      'Uno de los mejores periodos para el florecimiento del amor.';

  @override
  String get tarotLoveDetail6 =>
      'Te espera un romance emocionante. Te acercarás rápidamente a una persona que te atrae y sentirás una profunda conexión espiritual. Si planeas declarar tus sentimientos, las probabilidades de éxito son muy altas. Pero recuerda: es mejor elegir con el corazón que ceder a una tentación momentánea.';

  @override
  String get tarotWealthMeaning6 =>
      'Tu situación financiera mejorará al colaborar con otros.';

  @override
  String get tarotWealthDetail6 =>
      'Trabajar en equipo con alguien que piense como tú traerá un efecto de sinergia y aumentará tus beneficios. Si te proponen una asociación, considérala seriamente. La comunicación con los demás te ayudará a obtener información valiosa para tus inversiones. Sin embargo, vigila tus gastos en ocio para no salirte del presupuesto.';

  @override
  String get tarotSuccessMeaning6 =>
      'Es el momento en que el trabajo en equipo trae resultados brillantes.';

  @override
  String get tarotSuccessDetail6 =>
      'Te llevas de maravilla con colegas y socios, y el trabajo te resulta placentero. En proyectos grupales lograrás más que en solitario, y la habilidad para entablar relaciones será la clave del éxito. Al elegir una tarea que realmente te guste, obtendrás resultados de los que no te arrepentirás.';

  @override
  String get tarotKeywords7 => 'Victoria, voluntad, avance, conquista, triunfo';

  @override
  String get tarotDesc7 =>
      'El joven rey en su carro avanza con determinación hacia su objetivo, sosteniendo el cetro del poder. Su voluntad es inquebrantable y el triunfo está cerca.';

  @override
  String get tarotLoveMeaning7 =>
      'Periodo en que las acciones decididas en el amor traerán el éxito.';

  @override
  String get tarotLoveDetail7 =>
      'Es momento de luchar decididamente por tu amor. No dudes y declara tus sentimientos abiertamente; incluso si hay competidores, saldrás victorioso. Si estás en una etapa de incertidumbre, toma la iniciativa y define la relación. Los viajes juntos o el ocio activo fortalecerán vuestro vínculo.';

  @override
  String get tarotWealthMeaning7 =>
      'Debes actuar con audacia para alcanzar los objetivos financieros establecidos.';

  @override
  String get tarotWealthDetail7 =>
      'Ahora necesitas una fuerza impulsora poderosa para realizar tus planes. No vaciles en tomar decisiones importantes cuando surja la oportunidad. Concéntrate en proyectos a corto plazo; ahora tus ingresos dependen directamente de tu actividad. Es posible que surjan gastos relacionados con viajes, pero será una inversión en nuevas oportunidades.';

  @override
  String get tarotSuccessMeaning7 =>
      'Éxito en la competencia y logro de objetivos.';

  @override
  String get tarotSuccessDetail7 =>
      'Te espera el éxito en el logro de metas concretas: ascensos, aprobar exámenes o cerrar acuerdos beneficiosos. Cuanto más fuerte sea la competencia, más alto será tu espíritu de lucha y, al final, la victoria será tuya. Tu determinación causará una gran impresión en tus colegas. En los viajes de negocios demostrarás tus mejores cualidades.';

  @override
  String get tarotKeywords8 =>
      'Fuerza, coraje, paciencia, influencia suave, autocontrol';

  @override
  String get tarotDesc8 =>
      'Una mujer con ropajes blancos cierra suavemente las fauces de un león, simbolizando la victoria del espíritu sobre la fuerza bruta y el dominio de sí mismo.';

  @override
  String get tarotLoveMeaning8 =>
      'Periodo en el que necesitas mostrar paciencia y aceptar a tu pareja tal como es.';

  @override
  String get tarotLoveDetail8 =>
      'Tus relaciones ahora requieren sabiduría y aguante. Al aceptar los defectos de tu pareja con el corazón abierto, llevas el vínculo a un nuevo nivel. Es importante guiar con suavidad, mostrando fortaleza interna. Si apoyas pacientemente a tu ser querido, tu sinceridad acabará por derretir cualquier hielo.';

  @override
  String get tarotWealthMeaning8 =>
      'El ahorro constante y los hábitos de gasto razonables son la clave de la riqueza.';

  @override
  String get tarotWealthDetail8 =>
      'Tu situación financiera crece lenta pero firmemente. No te desanimes si no hay ingresos enormes ahora mismo; sigue gestionando tus activos con regularidad. En las inversiones, no te dejes llevar por el pánico ante las fluctuaciones temporales. La capacidad de controlar tus deseos impulsivos es el camino más corto a la prosperidad.';

  @override
  String get tarotSuccessMeaning8 =>
      'Podrás manejar incluso las tareas más difíciles o a una dirección exigente.';

  @override
  String get tarotSuccessDetail8 =>
      'Es posible que te asignen un proyecto difícil, pero tienes suficientes recursos internos para manejarlo. Tu suavidad exterior esconde una voluntad de acero que te ayudará a superar cualquier obstáculo. Tu calma al resolver problemas despertará un profundo respeto y confianza en los demás.';

  @override
  String get tarotKeywords9 =>
      'Introspección, soledad, búsqueda de la verdad, sabiduría, descanso';

  @override
  String get tarotDesc9 =>
      'Un anciano con una linterna en la mano está en la cima de una montaña nevada, escuchando su voz interior en busca de la verdad.';

  @override
  String get tarotLoveMeaning9 =>
      'Tiempo para la soledad o reflexiones profundas sobre las relaciones.';

  @override
  String get tarotLoveDetail9 =>
      'Ahora es más importante entenderte a ti mismo que llevar una vida social activa. No busques encuentros solo por huir de la soledad; piensa en qué tipo de amor necesitas realmente. Incluso si tienes pareja, una pequeña distancia os ayudará a ambos a valorar mejor vuestra relación.';

  @override
  String get tarotWealthMeaning9 =>
      'La actividad financiera puede disminuir temporalmente.';

  @override
  String get tarotWealthDetail9 =>
      'En asuntos de dinero, conviene adoptar una postura conservadora ahora. Es más importante conservar lo que tienes que intentar aumentar el capital con métodos arriesgados. Invertir en tu propia educación o formación será la mejor inversión, que dará frutos en el futuro.';

  @override
  String get tarotSuccessMeaning9 =>
      'Éxito en asuntos que requieren conocimientos profundos, investigación o maestría.';

  @override
  String get tarotSuccessDetail9 =>
      'Lograrás excelentes resultados en trabajos científicos, planificación o desarrollo, donde se requiera una inmersión profunda en el proceso. Ahora es momento de acumular fuerzas, no de exhibirlas. Si te enfrentas a una tarea insoluble, busca el consejo de un mentor experimentado.';

  @override
  String get tarotKeywords10 =>
      'Suerte, cambios, destino, ciclos, punto de inflexión';

  @override
  String get tarotDesc10 =>
      'La gran rueda de la fortuna gira, anunciando cambios inevitables y el comienzo de un nuevo ciclo vital.';

  @override
  String get tarotLoveMeaning10 => 'Te espera un encuentro fatídico.';

  @override
  String get tarotLoveDetail10 =>
      'El amor puede llegar de repente, como en el cine. Son posibles encuentros fortuitos o reencuentros inesperados con antiguos amores. Los solteros pueden enamorarse a primera vista, y quienes tienen pareja sentirán que la relación pasa a un nuevo nivel. No dejes escapar este momento de suerte.';

  @override
  String get tarotWealthMeaning10 =>
      'La situación financiera empieza a mejorar.';

  @override
  String get tarotWealthDetail10 =>
      'La Diosa Fortuna te sonríe. Son posibles ingresos de dinero inesperados o beneficios de inversiones. El flujo de dinero se vuelve más estable y debes aprovechar las oportunidades a tiempo. Sin embargo, recuerda que la suerte es cíclica; muestra sabiduría y ahorra una parte para el futuro.';

  @override
  String get tarotSuccessMeaning10 =>
      'Las circunstancias se inclinan a tu favor.';

  @override
  String get tarotSuccessDetail10 =>
      'Llega un periodo importante que puede ser un punto de inflexión en tu carrera. Los asuntos que estaban en pausa empezarán a moverse. Las posibilidades de un ascenso o una oferta de trabajo ventajosa serán ese «viento a favor» que te llevará a una nueva altura.';

  @override
  String get tarotKeywords11 =>
      'Justicia, equilibrio, responsabilidad, verdad, causa y efecto';

  @override
  String get tarotDesc11 =>
      'Un juez vestido de rojo sostiene una espada en la mano derecha y una balanza en la izquierda. Es el símbolo del juicio objetivo y de la responsabilidad por las propias acciones.';

  @override
  String get tarotLoveMeaning11 =>
      'Una relación donde la razón prevalece sobre los sentimientos.';

  @override
  String get tarotLoveDetail11 =>
      'Ahora es un momento en el que el juicio racional es más necesario que dejarse llevar por las emociones. Reflexiona sobre si tu relación mantiene el equilibrio: si te estás sacrificando demasiado o, por el contrario, solo estás recibiendo sin dar nada a cambio. Si estás pensando en casarte, evaluarás meticulosamente las condiciones y el trasfondo de tu pareja.';

  @override
  String get tarotWealthMeaning11 =>
      'Se requiere una comprobación meticulosa en las transacciones financieras y contratos.';

  @override
  String get tarotWealthDetail11 =>
      'Pueden surgir situaciones en las que sea necesario distinguir lo correcto de lo incorrecto en el aspecto monetario. Es un buen momento para que te devuelvan dinero prestado o para liquidar cuentas pendientes. Al firmar contratos, revisa cuidadosamente las cláusulas y actúa con honestidad y transparencia siguiendo los principios.';

  @override
  String get tarotSuccessMeaning11 =>
      'Recibirás una evaluación justa de tu trabajo y una recompensa adecuada.';

  @override
  String get tarotSuccessDetail11 =>
      'Tus logros profesionales recibirán una valoración justa y objetiva. Si has trabajado duro, espera un ascenso o una bonificación. Tus capacidades analíticas y precisión serán muy valoradas en campos que requieran exactitud. Al tomar decisiones, deja de lado las emociones y básate estrictamente en datos y hechos.';

  @override
  String get tarotKeywords12 =>
      'Sacrificio, paciencia, nueva perspectiva, estancamiento, despertar';

  @override
  String get tarotDesc12 =>
      'Un hombre colgado de un árbol por un pie, a través de un sufrimiento voluntario, observa el mundo desde un ángulo totalmente nuevo y alcanza la iluminación. El halo alrededor de su cabeza significa crecimiento espiritual.';

  @override
  String get tarotLoveMeaning12 =>
      'La relación puede estancarse o los sentimientos no correspondidos pueden durar mucho tiempo.';

  @override
  String get tarotLoveDetail12 =>
      'Puedes sentir frustración por la falta de progreso en el amor, pero ahora las prisas no ayudarán. Haz una pausa, mira la situación desde el otro lado y reflexiona sobre si estás imponiendo tus sentimientos a tu manera. Saber ponerse en el lugar del otro y mostrar paciencia acabará siendo la llave del corazón de tu pareja.';

  @override
  String get tarotWealthMeaning12 =>
      'Los flujos de dinero pueden detenerse temporalmente, son posibles pérdidas forzadas.';

  @override
  String get tarotWealthDetail12 =>
      'Puedes sentir un estancamiento en tus finanzas. Las inversiones pueden estar «congeladas» y los ingresos esperados retrasados. Cuanto más te agites, más compleja será la situación, por lo que ahora es mejor mantener la calma. Utiliza este tiempo para revisar tus hábitos de gasto y desarrollar una nueva actitud hacia el dinero.';

  @override
  String get tarotSuccessMeaning12 =>
      'Las cosas pueden no ir según el plan, son posibles retrasos.';

  @override
  String get tarotSuccessDetail12 =>
      'La suspensión de un proyecto o el retraso en los asuntos pueden causar estrés, pero esto no es un fracaso, sino una señal de «reinicio». No intentes forzar los eventos; da un paso atrás y reconsidera la estrategia general. Romper con los viejos moldes te ayudará a encontrar una solución genial, y las pruebas actuales te darán una nueva sabiduría.';

  @override
  String get tarotKeywords13 =>
      'Finalización, cambio, transformación, separación, nuevo comienzo';

  @override
  String get tarotDesc13 =>
      'Simboliza la terminación completa de lo viejo y el nacimiento de lo nuevo. Representa un proceso de transformación doloroso pero inevitable, donde la muerte de lo antiguo despeja el camino para el futuro.';

  @override
  String get tarotLoveMeaning13 =>
      'Significa el fin de una relación o un cambio radical en ella.';

  @override
  String get tarotLoveDetail13 =>
      'Es posible que tu relación actual haya llegado a su límite. En lugar de intentar retener lo que se va, muestra valentía y deja ir la situación. La separación es dolorosa, pero al final de este camino te espera sin duda un mejor comienzo. Recuerda: solo liberándote por completo de los apegos y heridas del pasado, dejarás espacio para que entre una nueva persona en tu vida.';

  @override
  String get tarotWealthMeaning13 =>
      'Pueden surgir pérdidas financieras o fracasos en las inversiones.';

  @override
  String get tarotWealthDetail13 =>
      'Se esperan cambios importantes en tus finanzas. Puedes enfrentar pérdidas donde no las esperabas o gastos imprevistos. Es una señal de que los viejos métodos de gestión de capital ya no funcionan. Utiliza este momento para saldar deudas, cortar gastos innecesarios y empezar a construir una estructura financiera más saludable y estable.';

  @override
  String get tarotSuccessMeaning13 =>
      'El trabajo actual puede verse interrumpido o terminar en fracaso.';

  @override
  String get tarotSuccessDetail13 =>
      'Un proyecto en el que pusiste mucho esfuerzo podría cerrarse, o podrías experimentar cambios bruscos en tu carrera. Ahora puedes sentir la amargura del fracaso, pero es una señal del destino: es hora de dejar lo que no te conviene y buscar el camino hacia el éxito real. Empieza de cero y se abrirá ante ti un nuevo y más emocionante capítulo de tu vida.';

  @override
  String get tarotKeywords14 =>
      'Equilibrio, templanza, armonía, curación, compromiso';

  @override
  String get tarotDesc14 =>
      'Un ángel vierte agua de una copa a otra, simbolizando el equilibrio perfecto entre la realidad y el ideal, así como el flujo armonioso de la vida.';

  @override
  String get tarotLoveMeaning14 =>
      'Proceso en el que dos personas diferentes encuentran un lenguaje común y armonía.';

  @override
  String get tarotLoveDetail14 =>
      'Para este periodo es más adecuado un amor tranquilo y profundo que las pasiones turbulentas. Al reconocer las diferencias del otro y complementarlas, construís un vínculo sólido. Incluso si surgen disputas, la sabiduría os ayudará a resolverlas mediante un diálogo sereno. Tu actitud suave y cuidadosa calmará a tu pareja y creará una atmósfera estable en la relación.';

  @override
  String get tarotWealthMeaning14 =>
      'Es importante mantener el equilibrio entre ingresos y gastos.';

  @override
  String get tarotWealthDetail14 =>
      'La situación financiera se estabiliza. En lugar de perseguir ganancias fáciles, concéntrate en la distribución eficiente de tus activos actuales. Con el crecimiento de los ingresos, es importante mantener el hábito de controlar los gastos. En las inversiones, es mejor seguir una estrategia de diversificación; la constancia y la disciplina te llevarán finalmente a la riqueza.';

  @override
  String get tarotSuccessMeaning14 =>
      'Tu capacidad para suavizar asperezas y llevar al equipo al acuerdo estará en su punto máximo.';

  @override
  String get tarotSuccessDetail14 =>
      'Te desempeñarás excelente como mediador en proyectos de equipo, resolviendo conflictos y aumentando la eficiencia general. Tu flexibilidad y capacidad de adaptación serán valoradas por tus colegas. Ahora es importante mantener el equilibrio entre el trabajo y el descanso para evitar el agotamiento. Una visión de conjunto de la situación te ayudará a lograr los mejores resultados.';

  @override
  String get tarotKeywords15 =>
      'Tentación, dependencia, apego, materialismo, obsesión';

  @override
  String get tarotDesc15 =>
      'Símbolo de los deseos y apegos que nos encadenan. Son las tentaciones materiales de las que podemos liberarnos si mostramos voluntad, pero en las que a menudo nos sumergimos por completo.';

  @override
  String get tarotLoveMeaning15 =>
      'Significa una relación atraída u obsesionada por un intenso encanto físico.';

  @override
  String get tarotLoveDetail15 =>
      'Puedes sentirte irresistiblemente atraído por alguien, lo que dificulta tomar decisiones sensatas. Puede comenzar un romance apasionado, pero ten cuidado de no caer en la trampa de los celos y el control excesivos. Piensa si tu sentimiento es amor verdadero o simplemente un deseo de poseer a la otra persona. Aprende a controlar tus impulsos.';

  @override
  String get tarotWealthMeaning15 =>
      'La codicia excesiva puede llevar a inversiones arriesgadas o grandes gastos en ocio.';

  @override
  String get tarotWealthDetail15 =>
      'Es un periodo de muchas tentaciones financieras. Cuidado con las ofertas dudosas de «dinero fácil» y las compras impulsivas que pueden vaciar tu cartera. No te conviertas en esclavo del dinero ni socaves la confianza de quienes te rodean. En lugar de nuevas inversiones, ahora es mejor concentrarse en conservar lo que tienes y domar tu apetito.';

  @override
  String get tarotSuccessMeaning15 =>
      'Por el éxito, podrías estar dispuesto a cualquier medida.';

  @override
  String get tarotSuccessDetail15 =>
      'La sed de poder o reconocimiento puede hacerte ver a tus colegas solo como competidores. Ten cuidado de no convertirte en un adicto al trabajo, olvidando la salud y el descanso. Renuncia a la idea de obtener todo de inmediato sin el esfuerzo adecuado. Una actitud honesta hacia el trabajo te ayudará a liberarte de las cadenas internas que tú mismo te has creado.';

  @override
  String get tarotKeywords16 =>
      'Colapso, impacto, cambio brusco, liberación, revelación';

  @override
  String get tarotDesc16 =>
      'Un rayo cae directamente sobre la torre, derrumbándola y haciendo que la gente caiga. Simboliza la ruptura repentina de los viejos valores por fuerzas externas y el encuentro con la cruda verdad.';

  @override
  String get tarotLoveMeaning16 =>
      'En las relaciones es posible una crisis grave o una ruptura repentina.';

  @override
  String get tarotLoveDetail16 =>
      'Como un rayo en un cielo despejado, puede ocurrir un evento inesperado en tu vida personal. Podrías decepcionarte de tu pareja o enfrentar un conflicto que sacuda los cimientos de tu relación. Pero no te desesperes: es un proceso de limpieza de ilusiones y vínculos poco saludables. Sobre las ruinas de lo viejo, con el tiempo crecerá algo más fuerte y auténtico.';

  @override
  String get tarotWealthMeaning16 =>
      'Necesitas prepararte para pérdidas financieras repentinas o choques.';

  @override
  String get tarotWealthDetail16 =>
      'Comienza un periodo de extrema inestabilidad en las finanzas. Son posibles pérdidas bruscas o el colapso de proyectos de inversión. Ahora es crucial mover tus activos a un lugar seguro y estar alerta. Recuerda que este colapso te ayudará a revisar tus puntos de vista sobre el dinero, y después de la caída siempre llega un periodo de reconstrucción sobre una base más sólida.';

  @override
  String get tarotSuccessMeaning16 =>
      'Los proyectos pueden verse interrumpidos, son posibles cambios bruscos en la carrera o reajustes de personal.';

  @override
  String get tarotSuccessDetail16 =>
      'Puedes sentir amargura porque el proyecto que construiste paso a paso se derrumba. Pero esto no sucede por tu debilidad, sino por cambios inevitables. Mantén la calma, evalúa la situación y empieza a buscar nuevos caminos. Si puedes convertir esta crisis en una oportunidad para reiniciar, alcanzarás alturas aún mayores.';

  @override
  String get tarotKeywords17 =>
      'Esperanza, inspiración, curación, optimismo, cumplimiento de deseos';

  @override
  String get tarotDesc17 =>
      'Bajo la luz de una estrella brillante, una mujer vierte agua, simbolizando la paz después de las pruebas y la esperanza en un futuro brillante.';

  @override
  String get tarotLoveMeaning17 =>
      'Periodo de encuentro con el ideal o cumplimiento del sueño de amor.';

  @override
  String get tarotLoveDetail17 =>
      'Como una estrella en la noche, llega a tu vida una esperanza radiante. Puedes conocer a la persona de tus sueños, y tu carisma sincero será extremadamente atractivo para los demás. Las heridas del pasado se cierran, dando paso a una energía luminosa que te permitirá volver a creer en el amor.';

  @override
  String get tarotWealthMeaning17 =>
      'La situación financiera empieza a mejorar gradualmente.';

  @override
  String get tarotWealthDetail17 =>
      'La suerte con el dinero empieza a girar a tu favor. Las dificultades económicas quedan atrás y empiezas a ver la luz al final del túnel. Las ideas creativas pueden traer fuentes de ingresos adicionales. Ahora es importante pensar a largo plazo: las inversiones en el futuro serán la clave de tu estabilidad financiera.';

  @override
  String get tarotSuccessMeaning17 =>
      'Te espera una oleada de inspiración y la oportunidad de dar a conocer tus talentos.';

  @override
  String get tarotSuccessDetail17 =>
      'Tus ideas recibirán el reconocimiento y el elogio de tus colegas. Destacarás especialmente en áreas creativas, marketing o publicidad; ahora es el momento ideal para lanzar el proyecto con el que siempre has soñado. Actúa con confianza: tienes todas las posibilidades de ganar popularidad y fortalecer tu autoridad.';

  @override
  String get tarotKeywords18 =>
      'Ansiedad, ilusión, incertidumbre, intuición, subconsciente';

  @override
  String get tarotDesc18 =>
      'Bajo la luz de la luna coexisten la ansiedad y una incertidumbre brumosa, simbolizando la verdad oculta y el mundo del subconsciente.';

  @override
  String get tarotLoveMeaning18 =>
      'Incomprensión de los sentimientos de la pareja, posibles ofensas y sospechas.';

  @override
  String get tarotLoveDetail18 =>
      'Estás como en una niebla: los sentimientos de tu pareja no están claros, lo que genera ansiedad. Los pequeños malentendidos pueden convertirse en sospechas serias, robándote la paz. Pero no te apresures a sacar conclusiones; ahora es mejor adoptar una postura de espera. En lugar de aferrarte a una relación incierta, intenta mantener tu equilibrio interno y pensar racionalmente.';

  @override
  String get tarotWealthMeaning18 =>
      'Las perspectivas financieras son brumosas, alto riesgo de engaño o fraude.';

  @override
  String get tarotWealthDetail18 =>
      'Tu visión de la situación está distorsionada ahora. Podrías caer fácilmente en los trucos de estafadores o en promesas tentadoras pero vacías. Desconfía de las trampas ocultas y muestra extrema precaución en los negocios. Ahora no es el momento para nuevos proyectos; es mejor concentrarse en proteger lo que ya tienes y verificar cuidadosamente cualquier información.';

  @override
  String get tarotSuccessMeaning18 =>
      'Periodo de confusión: los objetivos son vagos, posibles intrigas en el equipo.';

  @override
  String get tarotSuccessDetail18 =>
      'Puedes encontrarte en una situación de incertidumbre, donde la dirección del desarrollo del proyecto es borrosa y los colegas susurran a tus espaldas. Ten cuidado con tus palabras y acciones. Ahora será más sabio esperar a que la situación se aclare. No creas en los rumores a ciegas, mantén la calma y ocúpate de tus asuntos sin entrar en conflictos.';

  @override
  String get tarotKeywords19 =>
      'Éxito, felicidad, vitalidad, positivismo, bendición';

  @override
  String get tarotDesc19 =>
      'Bajo un sol radiante, un niño sobre un caballo blanco agita una bandera, disfrutando de la vida. Es el símbolo de la claridad total, el éxito y la felicidad.';

  @override
  String get tarotLoveMeaning19 =>
      'Te esperan unas relaciones bendecidas, brillantes y felices.';

  @override
  String get tarotLoveDetail19 =>
      'Un amor perfectamente feliz y bendecido está ahora contigo. Los malentendidos y conflictos del pasado desaparecerán y la confianza se fortalecerá. Los solteros conocerán a alguien que irradia una energía luminosa. Son posibles noticias alegres, como una boda o la expansión de la familia. Es un momento maravilloso para disfrutar del amor de forma pura y apasionada, como un niño.';

  @override
  String get tarotWealthMeaning19 =>
      'Tu situación financiera está en su punto máximo.';

  @override
  String get tarotWealthDetail19 =>
      'Ha llegado tu «momento estelar». Tus perspectivas financieras son muy sólidas, lo que lleva a un crecimiento de los beneficios. Todos tus esfuerzos pasados finalmente son recompensados con creces. Ahora es un buen momento para compras importantes o inversiones en aquello que te trae alegría. Disfruta de tu éxito y compártelo con los demás.';

  @override
  String get tarotSuccessMeaning19 =>
      'Tus talentos serán reconocidos y estarás en el centro de atención.';

  @override
  String get tarotSuccessDetail19 =>
      'Suenan las fanfarrias del éxito. Todos tus trabajos pasados finalmente son valorados positivamente y presentados al mundo. Te espera el éxito en los negocios, un ascenso o aprobar brillantemente los exámenes. Tu confianza en ti mismo y tu actitud positiva te ayudarán a alcanzar cualquier altura. Es el momento de tu triunfo.';

  @override
  String get tarotKeywords20 =>
      'Renacimiento, recompensa, noticia, decisión, reencuentro';

  @override
  String get tarotDesc20 =>
      'Un ángel toca la trompeta en el cielo y la gente en los ataúdes despierta, disfrutando de la vida. Es el símbolo de la recompensa por los trabajos pasados y del despertar a una nueva vida.';

  @override
  String get tarotLoveMeaning20 =>
      'Es posible una noticia de una antigua pareja o una oportunidad de reencuentro.';

  @override
  String get tarotLoveDetail20 =>
      'Llegará la noticia que tanto has esperado. Si no podías olvidar un antiguo amor o esperabas un encuentro, las posibilidades de éxito ahora son extremadamente altas. Las relaciones inciertas finalmente pueden convertirse en algo serio. Es posible reanudar el contacto con un antiguo conocido; escucha a tu corazón y toma una decisión de la que no te arrepientas.';

  @override
  String get tarotWealthMeaning20 =>
      'Las inversiones pasadas pueden traer beneficios, es posible la devolución de antiguas deudas.';

  @override
  String get tarotWealthDetail20 =>
      'Comienza el momento de cosechar los frutos de los esfuerzos pasados. Las acciones olvidadas pueden subir de precio, o te devolverán una deuda con la que ya no contabas. Es posible una suerte inesperada o una oportunidad de reiniciar con éxito una antigua idea. La decisión que tomes ahora tendrá un gran impacto en tu futuro financiero, así que actúa con valentía.';

  @override
  String get tarotSuccessMeaning20 =>
      'Tus trabajos pasados serán reconocidos, son posibles ascensos o recompensas.';

  @override
  String get tarotSuccessDetail20 =>
      'Ha llegado el día del juicio. Tus esfuerzos pasados finalmente han recibido una valoración digna y recompensa, y las buenas noticias, como el sonido de la trompeta, no se harán esperar. Son posibles ofertas de trabajo ventajosas o la oportunidad de salir del estancamiento y volver a despegar. No temas a los cambios: aprovecha la oportunidad y comienza un nuevo capítulo en tu carrera.';

  @override
  String get tarotKeywords21 =>
      'Finalización, integración, logro, final feliz, perfección';

  @override
  String get tarotDesc21 =>
      'Símbolo del logro total de la meta y de la armonía ideal después de un largo viaje. Las cuatro bestias sagradas en las esquinas bendicen el mundo perfecto y presagian el comienzo de un nuevo y aún más emocionante ciclo.';

  @override
  String get tarotLoveMeaning21 =>
      'Significa el florecimiento y la plenitud del amor. Te espera una unión con la pareja ideal y momentos de verdadera felicidad.';

  @override
  String get tarotLoveDetail21 =>
      'Ha llegado el momento ideal para poner punto final a una larga relación y pasar a un nuevo nivel, por ejemplo, casarse. Te asegurarás de que sois los mejores compañeros el uno para el otro y disfrutarás de la felicidad de la unidad. Si estás soltero, conocerás a una persona que se ajusta totalmente a tus ideales. Es posible conocer a alguien durante un viaje.';

  @override
  String get tarotWealthMeaning21 =>
      'Alcanzarás la meta financiera establecida y obtendrás libertad económica.';

  @override
  String get tarotWealthDetail21 =>
      'Has alcanzado al 100% tus metas de dinero y has llegado al nivel de libertad financiera. Son posibles grandes beneficios de la cooperación internacional o inversiones en mercados globales. Tu cartera de inversiones está equilibrada y trae ingresos estables. Disfruta de la abundancia y empieza a ampliar tus horizontes.';

  @override
  String get tarotSuccessMeaning21 =>
      'El proyecto se completará con éxito y recibirás el máximo reconocimiento.';

  @override
  String get tarotSuccessDetail21 =>
      'Has alcanzado la cima de tu carrera. El proyecto asignado terminará con un éxito brillante y recibirás los elogios merecidos. Todas las metas trazadas se han alcanzado y es hora de prepararse para salir a la escena mundial. Se abren ante ti oportunidades para estudiar o trabajar en el extranjero, así que utiliza el éxito actual como trampolín para nuevos logros.';

  @override
  String get supplementRecordPrompt =>
      '¡Por favor, tome sus suplementos y regístrelo!';

  @override
  String get snoozeQuestion => '¿Cuándo debería recordártelo de nuevo?';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'm';

  @override
  String get after => 'después';

  @override
  String snoozeMessage(int minutes) {
    return 'La alarma sonará de nuevo en $minutes minutos.';
  }

  @override
  String timesTaken(int count) {
    return '$count veces tomado';
  }

  @override
  String dailyGoalTimes(int goal) {
    return 'Meta: $goal veces al día';
  }

  @override
  String get didYouTakeSupplement => '¿Tomó sus suplementos?';

  @override
  String get viewMissionRecords => 'Ver registros de misión';

  @override
  String get setTakingGoal => 'Establecer meta de ingesta';

  @override
  String get times => 'veces';

  @override
  String get dailyTakingGoal => 'Meta diaria de ingesta';

  @override
  String get howManyTimesADay => '¿Cuántas veces al día toma suplementos?';

  @override
  String get setGoalMl => 'Establecer meta (ml)';

  @override
  String get sleepAnalysis => 'Análisis del sueño';

  @override
  String get todaysSleep => 'Sueño de hoy';

  @override
  String get sleepDuration => 'Duración del sueño';

  @override
  String get wakeUpTime => 'Hora de despertar';

  @override
  String get weeklySleepPattern => 'Patrón de sueño semanal';

  @override
  String get sleepAdvice =>
      'Mantienes un hábito de sueño regular. ¡Te acostaste 30 minutos antes que ayer!';

  @override
  String get stopwatch => 'Cronómetro';

  @override
  String get lap => 'Vuelta';

  @override
  String get stop => 'Detener';

  @override
  String lapLabel(int index) {
    return 'Vuelta $index';
  }

  @override
  String get monday => 'Lun';

  @override
  String get tuesday => 'Mar';

  @override
  String get wednesday => 'Mié';

  @override
  String get thursday => 'Jue';

  @override
  String get friday => 'Vie';

  @override
  String get saturday => 'Sáb';

  @override
  String get sunday => 'Dom';

  @override
  String get policy => 'Términos y Privacidad';

  @override
  String get support => 'Atención al cliente';

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
  String get defaultVibration => 'Vibración Predeterminada';

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
  String get selectionComplete => 'Selección Completa';

  @override
  String get selectVibration => 'Seleccionar Patrón de Vibración';

  @override
  String get cameraMissionSequentialImageError =>
      'Por favor establece las imágenes de misión en orden.';

  @override
  String get copyEmailAction => 'Copiar Dirección de Correo';

  @override
  String get addMissionTitle => 'Agregar Nueva Misión';

  @override
  String get recommendedMissionList => 'Misiones Recomendadas';

  @override
  String get recommendedMissionDesc =>
      'Misiones recomendadas para un día saludable.';

  @override
  String get all => 'Todo';

  @override
  String get allMissions => 'Todas las Misiones';

  @override
  String categoryMissions(String category) {
    return 'Misiones de $category';
  }

  @override
  String get deselectAll => 'Deseleccionar Todo';

  @override
  String get selectAll => 'Seleccionar Todo';

  @override
  String get myCustomMissions => 'Mis Misiones Personalizadas';

  @override
  String get myCustomMissionsDesc => 'Agrega misiones que has creado antes.';

  @override
  String get createYourOwnMission => 'Crea Tu Propia Misión';

  @override
  String get createYourOwnMissionDesc =>
      'Crea una misión si no encuentras lo que buscas.';

  @override
  String get missionNameHint => 'Ingresa nombre de misión (ej. Ir al gimnasio)';

  @override
  String get selectCategory => 'Seleccionar Categoría';

  @override
  String get getNotification => 'Recibir Notificación';

  @override
  String get missionCategoryHealth => 'Salud';

  @override
  String get missionCategoryStudy => 'Estudio';

  @override
  String get missionCategoryRoutine => 'Rutina';

  @override
  String get missionCategoryHobby => 'Pasatiempo';

  @override
  String get missionCategoryOther => 'Otro';

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

  @override
  String get hourlyForecast => 'Pronóstico por Hora';

  @override
  String get weeklyForecast => 'Pronóstico Semanal';

  @override
  String hourFormat(String hour) {
    return '${hour}h';
  }

  @override
  String get noNotifications => 'No hay nuevas notificaciones.';

  @override
  String get adLoadFailed => 'Error al cargar anuncio';

  @override
  String get adLoading => 'Cargando anuncio...';

  @override
  String get removeAds => 'Eliminar Anuncios';

  @override
  String get close => 'Cerrar';

  @override
  String get exitQuestion => '¿Quieres salir?';

  @override
  String get exitApp => 'Salir';

  @override
  String get shareResultDescription =>
      'Este es tu resultado de fortuna analizado por Fortune Alarm.';

  @override
  String get shareResultButton => 'Compartir Resultado';

  @override
  String get unknownTime => 'Hora Desconocida';

  @override
  String get adLoadError =>
      'No se pudo cargar el anuncio. Por favor intenta de nuevo en un momento.';

  @override
  String get adShowError =>
      'No se pudo mostrar el anuncio. Por favor intenta de nuevo en un momento.';

  @override
  String earnCookies(int count) {
    return '¡Has ganado $count galletas de la fortuna! 🎉';
  }

  @override
  String get freePassAfterTimeout =>
      '¡Mostrando resultados gratis sin anuncio! 🎉';

  @override
  String get adLoadDelay =>
      'La carga se retrasa.\nPor favor intenta de nuevo en un momento.';

  @override
  String get fortuneAccessTitle => 'Ver Fortuna';

  @override
  String get fortuneAccessSubtitle =>
      '¡Revisa tus resultados de fortuna\ny obtén regalos ocultos!';

  @override
  String get watchAdButtonText => 'Ver Anuncio para Resultados Gratis';

  @override
  String useCookiesButtonText(int count) {
    return 'Usar $count Galletas de la Fortuna';
  }

  @override
  String get adFailFreePass =>
      'No se pudo cargar el anuncio, así que te dejaremos pasar gratis esta vez.';

  @override
  String get luckyNumberTitle => 'Mis Números de la Suerte';

  @override
  String get luckyNumberSubtitle =>
      'Números de la suerte especiales generados por IA';

  @override
  String get luckyNumberGenerateButton => 'Generar Números de la Suerte';

  @override
  String get luckyNumberGuideText =>
      'Descubre tus propios números de la suerte\na través del algoritmo de IA de Fortune Alarm';

  @override
  String get luckyNumberAnalysisStep1 => 'Recopilando datos de suerte...';

  @override
  String get luckyNumberAnalysisStep2 =>
      'Analizando patrones de números recientes...';

  @override
  String get luckyNumberAnalysisStep3 =>
      'Analizando energía para cada número...';

  @override
  String get luckyNumberAnalysisStep4 => 'Aprendiendo patrones geométricos...';

  @override
  String get luckyNumberAnalysisStep5 =>
      'Aplicando pesos del modelo de predicción de IA...';

  @override
  String get luckyNumberAnalysisStep6 =>
      'Calculando la combinación de suerte óptima...';

  @override
  String get luckyNumberAnalysisStep7 =>
      '¡Análisis completado! Generando números de la suerte';

  @override
  String get luckyNumberAnalysisFinal => 'Procesando datos finales...';

  @override
  String get luckyNumberAnalyzing => 'Analizando energía...';

  @override
  String get luckyNumberGeometric => 'Análisis geométrico...';

  @override
  String get luckyNumberPatterns => 'Coincidencia de patrones...';

  @override
  String get luckyNumberEnergy => 'Armonización de energía...';

  @override
  String get luckyNumberCompleted => '¡Análisis completado!';

  @override
  String get luckyNumberShare => 'Compartir resultados';

  @override
  String get luckyNumberRestart => 'Intentar de nuevo';

  @override
  String get luckyNumberGenerating => 'Generando números de la suerte...';

  @override
  String get luckyNumberResultTitle =>
      'Generación de números de la suerte completada';

  @override
  String get luckyNumberResultSubtitle => '6 números + número de bonificación';

  @override
  String get luckyNumberDisclaimer =>
      '* Este servicio es para fines de entretenimiento. Los números proporcionados son de referencia generados por algoritmos de IA y no garantizan un premio.';

  @override
  String get luckyNumberShareTitle => 'Números de la Suerte de Hoy';

  @override
  String get luckyNumberShareDescription =>
      'Números de la suerte analizados por Fortune Alarm.';

  @override
  String luckyNumberSetLabel(String label) {
    return 'Set $label';
  }

  @override
  String get luckyNumberRegenerateButton => 'Regenerar números';

  @override
  String get luckyNumberFeatureAiTitle => 'Recomendación IA';

  @override
  String get luckyNumberFeatureAiDesc => 'Algoritmo Inteligente';

  @override
  String get luckyNumberFeatureSmartTitle => 'Inteligente';

  @override
  String get luckyNumberFeatureSmartDesc =>
      'Recomendación de Números de la Suerte';

  @override
  String get luckyNumberFeatureDataTitle => 'Análisis de Datos';

  @override
  String get luckyNumberFeatureDataDesc => 'Combinación óptima';

  @override
  String get fortunePassTitle => 'Fortune Pass';

  @override
  String get fortunePassTabFree => 'Carga Gratis';

  @override
  String get fortunePassTabPremium => 'Pase Premium';

  @override
  String get fortunePassFreeChargeTitle => 'Cargar galletas gratis';

  @override
  String get fortunePassFreeChargeButton => 'Ver anuncio y obtener 1 galleta';

  @override
  String get fortunePassActivePlan => 'Plan Actual';

  @override
  String get fortunePassNoSubscription => 'Sin suscripción activa';

  @override
  String get fortunePassRestore => 'Restaurar';

  @override
  String get fortunePassMonth1Title => 'Pase de 1 Mes';

  @override
  String get fortunePassMonth1Desc =>
      'Desbloquea todas las funciones por 1 mes';

  @override
  String get fortunePassMonth6Title => 'Pase de 6 Meses';

  @override
  String get fortunePassMonth6Desc => 'Suscripción de 6 meses con descuento';

  @override
  String get fortunePassYear1Title => 'Pase de 1 Año';

  @override
  String get fortunePassYear1Desc => 'El mejor valor para todo un año';

  @override
  String get fortunePassBestPlan => 'Plan más popular';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '¡Oferta relámpago del $percent%!';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% DCTO';
  }

  @override
  String get fortunePassPerMonth => ' /mes';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return 'Total $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => 'Mes';

  @override
  String get fortunePassUnit6Months => '6 Meses';

  @override
  String get fortunePassUnitYear => 'Año';

  @override
  String get fortunePassMyCookies => 'Mis Galletas';

  @override
  String get fortunePassCurrentStatus => 'Estado del Pase';

  @override
  String get fortunePassStatusPremium => 'Pase Premium Activo';

  @override
  String get fortunePassStatusFree => 'Usuario Estándar';

  @override
  String get fortunePassStoreErrorTitle => 'Suscripción no disponible';

  @override
  String get fortunePassStoreErrorContent =>
      'No se puede obtener la información del producto de la tienda en este momento.';

  @override
  String fortunePassSubscribeSale(int percent) {
    return 'Suscribirse con $percent% de descuento';
  }

  @override
  String get fortunePassSubscribeNow => 'Suscribirse ahora';

  @override
  String get fortunePassApplied => 'Suscripción a Fortune Pass aplicada.';

  @override
  String get fortunePassApplyFailed => 'Error al aplicar la suscripción.';

  @override
  String get fortunePassRestored => 'Historial de compras restaurado.';

  @override
  String get fortunePassRestoreFailed =>
      'Error al restaurar el historial de compras.';

  @override
  String get fortunePassTimeSaleTitle => '¡Espera! Ha llegado un regalo 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return 'Precio original $price/año';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '$price/año';
  }

  @override
  String get fortunePassTimeSaleBadge =>
      '¡50% de descuento si te suscribes en 3 minutos!';

  @override
  String get fortunePassTimeSaleButton => 'Obtener descuento y empezar Pro';

  @override
  String get fortunePassTimeSaleCancel => 'Tal vez más tarde';

  @override
  String get fortunePassTimeSaleStartMessage =>
      '¡Ha comenzado el descuento de 3 minutos! Revisa el banner superior.';

  @override
  String get fortunePassSubscribeButton => 'Suscribirse Ahora';

  @override
  String get fortunePassSubscribeDiscountButton =>
      'Suscribirse con 50% de Descuento';

  @override
  String get fortunePassCookieBalance => 'Tus Galletas de la Fortuna';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'Pase Activo';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return 'Total ₩$price / $unit';
  }

  @override
  String get fortunePassPopularPlan => 'Plan Popular';

  @override
  String get fortunePassPricePerMonth => ' /mes';

  @override
  String get fortunePassPaymentFailed => 'Error en la solicitud de pago.';

  @override
  String get fortunePassSubscriptionFailed =>
      'Error al aplicar la suscripción. Por favor verifica tu red.';

  @override
  String get fortunePassSubscriptionSuccess =>
      'La suscripción a Fortune Pass ha sido aplicada.';

  @override
  String get fortunePassCannotSubscribeTitle => 'No se puede suscribir';

  @override
  String get fortunePassCannotSubscribeMessage =>
      'No se puede obtener la información del producto de la tienda en este momento.\n\n[Lista de Verificación]\n1. Estado de inicio de sesión en Google Play / App Store\n2. Conexión a Internet\n3. Estado de registro del dispositivo de prueba';

  @override
  String get year => 'Año';

  @override
  String get month => 'Mes';

  @override
  String get day => 'Día';

  @override
  String get sajuProfileTitle =>
      'Editar perfil principal de Cuatro Pilares del Destino';

  @override
  String get sajuNameLabel => 'Nombre';

  @override
  String get sajuNameHint => 'Por favor ingresa tu nombre';

  @override
  String get sajuNameHelper => 'Hasta 6 caracteres';

  @override
  String get sajuGenderLabel => 'Género';

  @override
  String get sajuGenderMale => 'Masculino';

  @override
  String get sajuGenderFemale => 'Femenino';

  @override
  String get sajuBirthDateLabel => 'Fecha de Nacimiento';

  @override
  String get sajuBirthTimeLabel => 'Hora de Nacimiento';

  @override
  String get sajuUnknownTime => 'Hora Desconocida';

  @override
  String get sajuEditComplete => 'Edición Completada';

  @override
  String get sajuSolar => 'Solar';

  @override
  String get sajuLunar => 'Lunar';

  @override
  String get sajuSelectBirthDate => 'Seleccionar Fecha de Nacimiento';

  @override
  String get sajuSelectBirthTime => 'Seleccionar Hora de Nacimiento';

  @override
  String get compatibilityTitle => 'Verificar Compatibilidad';

  @override
  String get compatibilityInputHeader =>
      'Por favor ingresa la información de ambos';

  @override
  String get compatibilityInputSubtitle =>
      'Analizaremos la compatibilidad exacta basada en la información de los Cuatro Pilares del Destino.';

  @override
  String get compatibilityMyInfo => 'Mi Información';

  @override
  String get compatibilityInputMyNameGuide => 'Por favor ingrese su nombre.';

  @override
  String get compatibilityInputPartnerNameGuide =>
      'Por favor ingrese el nombre de su pareja.';

  @override
  String get compatibilityPartnerInfo => 'Información de la Pareja';

  @override
  String get compatibilityLoadSaved => 'Cargar Información Guardada';

  @override
  String get compatibilityTitleBest => '¡Una pareja hecha en el cielo! ❤️';

  @override
  String get compatibilityDescBest =>
      'La mejor compatibilidad que podrías pedir. ¡No os dejéis ir!';

  @override
  String get compatibilityDescBest_Youth =>
      'Ustedes dos son los mejores compañeros para un amor fresco y apasionado. ¡Es hermoso ver cómo se apoyan mutuamente en sus sueños y crecen juntos! Son una relación que se estimula positivamente al compartir preocupaciones sobre los estudios o la carrera. Si se aprecian y cuidan como hasta ahora, son una pareja ideal que puede superar cualquier prueba juntos.';

  @override
  String get compatibilityDescBest_Mature =>
      'Son compañeros ideales que se brindan estabilidad y fortaleza mutua. Es una relación madura en la que confían en los valores del otro y construyen un futuro juntos. Comprenden profundamente las metas de vida del otro y son los mejores apoyos mutuos. Con la confianza mutua como base, pueden llevar una vida juntos feliz y próspera.';

  @override
  String get compatibilityDescBest_Senior =>
      'Son compañeros maravillosos que pasan los años dorados juntos con calidez. Es una relación profunda en la que respetan la sabiduría del otro y se brindan apoyo emocional mutuo. Son compañeros que comparten las pequeñas alegrías de la vida diaria y se cuidan mutuamente. Son una unión valiosa que lleva una vida pacífica y feliz llena de recuerdos compartidos.';

  @override
  String get compatibilityTitleGreat => 'Una relación muy buena 💕';

  @override
  String get compatibilityDescGreat =>
      'Un gran compañero que es un gran apoyo mutuo.';

  @override
  String get compatibilityDescGreat_Youth =>
      'Es una relación llena de energía y emoción. Tienen intereses y valores similares, por lo que disfrutan mucho tiempo juntos. Son una pareja que crece junta motivándose mutuamente. Si superan las pequeñas diferencias con comprensión, podrán desarrollar un amor aún más profundo.';

  @override
  String get compatibilityDescGreat_Mature =>
      'Son una pareja con una sintonía muy alta en estilo de vida y valores. Respetan el trabajo y el espacio social del otro mientras ofrecen un fuerte respaldo emocional. Es una relación estable que resuelve problemas juntos y planea un futuro sólido. Si mantienen la comunicación, tendrán una relación que otros envidiarán.';

  @override
  String get compatibilityDescGreat_Senior =>
      'Son compañeros que se brindan consuelo y tranquilidad mutua en la vida. Comparten los pasatiempos del otro y disfrutan de un tiempo relajado juntos. Es una relación en la que valoran las experiencias de vida del otro y se apoyan mutuamente. Si se cuidan y prestan atención a la salud del otro, pasarán unos años dorados muy estables y felices.';

  @override
  String get compatibilityTitleGood => 'Una pareja que encaja bien 😊';

  @override
  String get compatibilityDescGood =>
      'Hay algunas diferencias, pero pueden tener un amor hermoso mientras se adaptan el uno al otro.';

  @override
  String get compatibilityDescGood_Youth =>
      'Son una pareja que construye un amor hermoso a través de la adaptación mutua. Aunque puede haber diferencias de personalidad, pueden tener una buena relación si se esfuerzan por comprenderse. Es importante respetar la individualidad del otro y encontrar puntos comunes a través de conversaciones honestas.';

  @override
  String get compatibilityDescGood_Mature =>
      'Son una relación que se mantiene estable gracias a la consideración y el esfuerzo mutuo. Puede haber situaciones en las que difieran en problemas prácticos o decisiones de vida, pero pueden resolverlas mediante el diálogo. Si se centran en las fortalezas del otro y se apoyan mutuamente, serán una pareja sólida.';

  @override
  String get compatibilityDescGood_Senior =>
      'Son compañeros que llevan una vida pacífica mientras se adaptan al ritmo del otro. Es importante respetar los hábitos de vida del otro y construir intimidad a través de pequeñas conversaciones diarias. Si vigilan la salud del otro y se apoyan mutuamente, disfrutarán de una relación cómoda.';

  @override
  String get compatibilityTitleEffort => 'Se requiere esfuerzo 🧐';

  @override
  String get compatibilityDescEffort =>
      'Hay muchas diferencias. La comprensión y la consideración son clave para la relación.';

  @override
  String get compatibilityDescEffort_Youth =>
      'Son una pareja que necesita crecer junta a través de muchas conversaciones y comprensión. Pueden surgir desacuerdos frecuentes debido a personalidades diferentes, pero si ven esto como un proceso de conocerse, podrán desarrollarse. Es importante entender el punto de vista del otro en lugar de imponer la propia opinión.';

  @override
  String get compatibilityDescEffort_Mature =>
      'Es una relación que requiere mucha paciencia y adaptación, ya que los estilos de vida pueden ser diferentes. Puede haber roces en asuntos prácticos, por lo que es importante establecer reglas claras y respetarse mutuamente. Si se esfuerzan por ver las diferencias no como un conflicto, sino como un complemento, podrán mantener la relación.';

  @override
  String get compatibilityDescEffort_Senior =>
      'Son compañeros que deben darse espacio mutuo y esforzarse por comprender los hábitos de vida del otro. Es importante aceptar los hábitos consolidados durante mucho tiempo en lugar de intentar cambiarlos. Si se centran en intereses comunes y se apoyan emocionalmente, podrán llevar una relación estable.';

  @override
  String get compatibilityTitleDifficult => 'Necesita mucho ajuste 😅';

  @override
  String get compatibilityDescDifficult =>
      'Las diferencias de personalidad pueden ser grandes. Deben entender profundamente las diferencias del otro.';

  @override
  String get compatibilityDescDifficult_Youth =>
      'Las diferencias de personalidad pueden ser grandes, lo que puede llevar a conflictos frecuentes. Es una relación que requiere un amor profundo y la voluntad de cambiar por el otro. En lugar de intentar controlar al otro, es importante aceptar su individualidad tal como es y encontrar un punto medio a través del diálogo continuo.';

  @override
  String get compatibilityDescDifficult_Mature =>
      'Dado que los valores y las metas de vida pueden ser muy diferentes, se requiere mucho esfuerzo para encontrar una dirección común. Puede ser difícil llegar a acuerdos en decisiones importantes de la vida, por lo que una comunicación muy honesta y profunda es esencial. Si ven las diferencias del otro como una oportunidad de crecimiento personal, podrán superar las dificultades.';

  @override
  String get compatibilityDescDifficult_Senior =>
      'Es importante reconocer las diferencias en las formas de vida que cada uno ha desarrollado durante mucho tiempo y respetar el espacio personal del otro. En lugar de intentar ajustar a la pareja a las propias ideas, es mejor construir una relación en la que se acepten mutuamente tal como son. Requiere mucha paciencia y comprensión para encontrar la paz juntos.';

  @override
  String get compatibilityAdvice_Youth =>
      'Intenten ver el mundo desde la perspectiva de su pareja. Pequeñas sorpresas y palabras de apoyo sinceras pueden fortalecer su relación. Planeen actividades juntos que los entusiasmen a ambos y creen hermosos recuerdos.';

  @override
  String get compatibilityAdvice_Mature =>
      'La comunicación honesta sobre sus metas y expectativas es la clave. Apóyense mutuamente en su desarrollo profesional, pero no olviden dedicar tiempo a su relación. La planificación financiera conjunta y la visión del futuro les darán seguridad.';

  @override
  String get compatibilityAdvice_Senior =>
      'Cuiden su salud juntos y disfruten de caminatas o pequeños viajes. Compartan su sabiduría de vida y construyan un vínculo emocional profundo. Creen un ambiente acogedor en casa donde ambos se sientan cómodos y seguros.';

  @override
  String get compatibilityLuck_Youth =>
      'Esta es una fase de suerte en la que su pasión y energía harán brillar su futuro juntos. Tendrán muchas oportunidades para crecer juntos y alcanzar sus sueños. Su amor será visto como una fuerza positiva en su entorno.';

  @override
  String get compatibilityLuck_Mature =>
      'Este es un tiempo de estabilidad y crecimiento. Sus esfuerzos conjuntos darán frutos, ya sea en el aspecto financiero o en la profundidad de su relación. Están construyendo una base sólida para los años venideros.';

  @override
  String get compatibilityLuck_Senior =>
      'Esta es una suerte caracterizada por la tranquilidad, la paz y el cuidado mutuo. Son como un bálsamo para el alma del otro. Este tiempo está lleno de profunda gratitud y la alegría de compartir el viaje de la vida.';

  @override
  String get tarotLoveMeaning0_Senior =>
      'Es un momento para encontrar alegría en los pequeños cambios diarios en lugar de nuevas emociones.';

  @override
  String get tarotLoveDetail0_Senior =>
      'Comparta su experiencia y talentos acumulados durante mucho tiempo con quienes lo rodean en lugar de planes ambiciosos. Sentirá una gran recompensa y un vínculo profundo al ayudar o asesorar a alguien.';

  @override
  String get tarotLoveMeaning1_Senior =>
      'Escuche su voz interior y tómese un tiempo para reflexionar sobre sí mismo.';

  @override
  String get tarotLoveDetail1_Senior =>
      'Se necesita un tiempo tranquilo y pacífico. En lugar de estar con mucha gente, medite solo o disfrute de sus pasatiempos para recargar su mente. Esta madurez interior será la base para una vida más estable.';

  @override
  String get tarotLoveMeaning2_Senior =>
      'Use su rica experiencia y sabiduría para guiar a quienes lo rodean.';

  @override
  String get tarotLoveDetail2_Senior =>
      'Su juicio sereno y su amplia perspectiva serán de gran ayuda para muchas personas. Su estatus e influencia aumentarán, y ganará la confianza profunda de la gente. Sea un mentor cálido que pueda acoger a los demás.';

  @override
  String get tarotLoveMeaning3_Senior =>
      'Es un momento en el que se alcanza la abundancia material y emocional al mismo tiempo.';

  @override
  String get tarotLoveDetail3_Senior =>
      'Disfrute de los frutos de su arduo trabajo. Puede sentir la alegría de vivir mientras comparte sentimientos cálidos con su familia o conocidos cercanos. La generosidad le traerá una suerte aún mayor.';

  @override
  String get tarotLoveMeaning4_Senior =>
      'Se necesita un fuerte sentido de la responsabilidad y liderazgo.';

  @override
  String get tarotLoveDetail4_Senior =>
      'Organice su entorno con una voluntad firme y dirija su vida con convicción. Su presencia estable dará tranquilidad a su familia y a quienes lo rodean. Sin embargo, no olvide tener un corazón flexible.';

  @override
  String get tarotLoveMeaning5_Senior =>
      'Es un momento para seguir los valores tradicionales y buscar la paz espiritual.';

  @override
  String get tarotLoveDetail5_Senior =>
      'Encuentre el sentido de la vida en la sabiduría o enseñanzas de larga data. Compartir sus profundos conocimientos con las generaciones más jóvenes le traerá una gran recompensa. Su actitud humilde y sincera atraerá a la gente.';

  @override
  String get tarotLoveMeaning6_Senior =>
      'Una relación armoniosa con las personas que lo rodean es la clave de la suerte.';

  @override
  String get tarotLoveDetail6_Senior =>
      'Mantenga una relación equilibrada basada en el respeto mutuo y la comprensión. La comunicación profunda con una persona preciosa será una gran fuente de fortaleza en su vida. Es un momento para sentir la importancia del compañerismo una vez más.';

  @override
  String get tarotLoveMeaning7_Senior =>
      'Actúe con audacia con un objetivo claro en mente.';

  @override
  String get tarotLoveDetail7_Senior =>
      'Incluso a una edad avanzada, su pasión sigue siendo hermosa. Si hay algo que quiere lograr, persígalo con valentía. Su actitud proactiva infundirá nueva vitalidad a su vida diaria.';

  @override
  String get tarotLoveMeaning8_Senior =>
      'Se necesita una perspectiva justa y equilibrada.';

  @override
  String get tarotLoveDetail8_Senior =>
      'Maneje las cosas con calma y lógica. Cuando haya un conflicto o una elección, seguir su conciencia traerá los mejores resultados. Su integridad le ganará el respeto de quienes lo rodean.';

  @override
  String get tarotLoveMeaning9_Senior =>
      'Es un momento para mirar hacia atrás silenciosamente en su vida y encontrar la verdad interior.';

  @override
  String get tarotLoveDetail9_Senior =>
      'Manténgase alejado del ajetreo y el bullicio y tenga tiempo para usted mismo. En el silencio, encontrará un nuevo significado en la vida y obtendrá un crecimiento espiritual. Es un tiempo precioso para la autorreflexión.';

  @override
  String get tarotLoveMeaning10_Senior =>
      'Acepte el flujo de la vida con naturalidad y espere una nueva oportunidad.';

  @override
  String get tarotLoveDetail10_Senior =>
      'La vida tiene sus altibajos. Incluso si las cosas no salen como planeó, no se decepcione y espere el momento adecuado. Un cambio positivo vendrá pronto, así que tenga una mente relajada.';

  @override
  String get tarotLoveMeaning11_Senior =>
      'Controle su mente con fuerza interior y paciencia.';

  @override
  String get tarotLoveDetail11_Senior =>
      'Se necesita el poder para manejar situaciones difíciles con un corazón cálido en lugar de la fuerza. Su dulzura y tolerancia tendrán el poder de conmover los corazones de los demás. Confíe en su fuerza interior.';

  @override
  String get tarotLoveMeaning12_Senior =>
      'Es un momento en el que se necesitan una nueva perspectiva y sacrificio.';

  @override
  String get tarotLoveDetail12_Senior =>
      'Intente mirar el mundo desde un ángulo diferente. Incluso si las cosas parecen detenerse por un tiempo, es un proceso de preparación para un salto mayor. La paciencia y un corazón dedicado traerán frutos valiosos.';

  @override
  String get tarotLoveMeaning13_Senior =>
      'Lo viejo termina y se acerca un nuevo comienzo.';

  @override
  String get tarotLoveDetail13_Senior =>
      'Deje ir el pasado y prepárese para un nuevo capítulo en su vida. El cambio puede ser desconocido, pero es un proceso esencial para el crecimiento. Si acepta el flujo del cambio con un corazón ligero, vendrá nueva suerte.';

  @override
  String get tarotLoveMeaning14_Senior =>
      'El equilibrio y la moderación son los valores más importantes.';

  @override
  String get tarotLoveDetail14_Senior =>
      'Evite los excesos en todo y mantenga un punto medio. La paz mental y un estilo de vida saludable le traerán estabilidad. Mantenga una vida diaria armoniosa combinando bien diferentes elementos.';

  @override
  String get tarotLoveMeaning15_Senior =>
      'Tenga cuidado con la codicia excesiva o la obsesión.';

  @override
  String get tarotLoveDetail15_Senior =>
      'Mire hacia atrás para ver si está atado por cosas materiales o viejos hábitos. Dejar ir su mente le hará sentirse libre. Si encuentra su verdadero yo lejos de la tentación, su suerte mejorará.';

  @override
  String get tarotLoveMeaning16_Senior =>
      'Un cambio repentino puede ser una oportunidad para un nuevo salto.';

  @override
  String get tarotLoveDetail16_Senior =>
      'Incluso si ocurre un evento inesperado, no se inquiete y acéptelo como un proceso de romper el viejo marco. Después de la crisis, se preparará una base más fuerte y sólida. Tenga la sabiduría para superar las dificultades.';

  @override
  String get tarotLoveMeaning17_Senior =>
      'Un momento en el que la esperanza y la luz llenan su vida.';

  @override
  String get tarotLoveDetail17_Senior =>
      'Mire hacia el futuro con una mente positiva. Sus sueños y deseos se están haciendo realidad gradualmente. Compartir su energía brillante con quienes lo rodean le traerá una felicidad aún mayor.';

  @override
  String get tarotLoveMeaning18_Senior =>
      'No se angustie por la incertidumbre y confíe en su intuición.';

  @override
  String get tarotLoveDetail18_Senior =>
      'Incluso si el futuro parece poco claro, no hay necesidad de preocuparse de antemano. Escuche su voz interior y muévase lentamente. A medida que pase el tiempo, la niebla se disipará y aparecerá un camino claro.';

  @override
  String get tarotLoveMeaning19_Senior =>
      'Es un momento para disfrutar plenamente de la alegría y vitalidad de la vida.';

  @override
  String get tarotLoveDetail19_Senior =>
      'Disfrute cada día con un corazón brillante y positivo como el sol. Su presencia misma será una gran fortaleza para su familia y vecinos. Agradezca la pequeña felicidad en la vida diaria y viva una vida vibrante.';

  @override
  String get tarotLoveMeaning20_Senior =>
      'Un momento en el que los resultados de sus esfuerzos pasados son recompensados.';

  @override
  String get tarotLoveDetail20_Senior =>
      'Ha llegado el tiempo de la cosecha. Su vida sincera ha dado sus frutos, y recibirá reconocimiento y elogios de quienes lo rodean. Acepte este resultado con un corazón agradecido y prepárese para un nuevo viaje.';

  @override
  String get tarotLoveMeaning21_Senior =>
      'Disfrute del placer de la vida diaria con un corazón libre y puro.';

  @override
  String get tarotLoveDetail21_Senior =>
      'Intente llevarse bien con las personas que lo rodean con un espíritu libre que no esté atado. Los nuevos encuentros o experiencias infundirán vitalidad a su vida. Tenga la calma para mirar el mundo con un corazón ligero.';

  @override
  String get tarotWealthMeaning0_Senior =>
      'Tiempo para una gestión de activos estable y la sabiduría de compartir.';

  @override
  String get tarotWealthDetail0_Senior =>
      'Concéntrese en proteger y gestionar sus activos actuales en lugar de nuevas inversiones. Compartir su sabiduría económica o dar consejos a la familia y a quienes lo rodean será muy gratificante.';

  @override
  String get tarotWealthMeaning1_Senior =>
      'Se espera la generación de ingresos utilizando conocimientos y experiencia.';

  @override
  String get tarotWealthDetail1_Senior =>
      'Sus conocimientos especializados o habilidades acumuladas durante mucho tiempo pueden regresar como valor económico. Espere con calma las oportunidades sin apresurarse, y dará buenos frutos.';

  @override
  String get tarotWealthMeaning2_Senior =>
      'Disfrute de la alegría de compartir frutos abundantes con su familia.';

  @override
  String get tarotWealthDetail2_Senior =>
      'La riqueza se acumula en la casa y es un momento para encontrar estabilidad. Su corazón generoso calentará su entorno, y esa bendición volverá a usted. Disfrute de la vida diaria con una mente relajada.';

  @override
  String get tarotSuccessMeaning0_Senior =>
      'Un momento en que concluir con un final elegante es más importante que los nuevos desafíos.';

  @override
  String get tarotSuccessDetail0_Senior =>
      'Concéntrese en organizar y concluir los logros que ha construido. Su éxito radica en la sinceridad y la sabiduría mostradas en el proceso más que en el resultado. Difunda una influencia positiva a su alrededor.';

  @override
  String get tarotSuccessMeaning1_Senior =>
      'La paz interior y el crecimiento espiritual son verdaderos éxitos.';

  @override
  String get tarotSuccessDetail1_Senior =>
      'Su paz interior es más importante que el estatus social o el honor. Tómese tiempo para cultivar su interior a través de la meditación o la lectura. La visión profunda le hará brillar aún más.';

  @override
  String get tarotSuccessMeaning2_Senior =>
      'La armonía familiar y la salud son los mayores logros.';

  @override
  String get tarotSuccessDetail2_Senior =>
      'Vivir armoniosamente con la familia y mantener la salud es una vida suficientemente exitosa. Encuentre la felicidad en las pequeñas rutinas diarias y tenga un corazón agradecido. Su existencia misma es una gran fortaleza para su familia.';

  @override
  String get tarotWealthMeaning3_Senior =>
      'La operación responsable de activos trae prosperidad a la familia.';

  @override
  String get tarotWealthDetail3_Senior =>
      'Mantenga la estabilidad del hogar a través de fuentes de ingresos estables y un consumo planificado. Su sabiduría económica será una gran lección para sus hijos.';

  @override
  String get tarotWealthMeaning4_Senior =>
      'Un momento en el que las formas tradicionales de ahorro y gestión son ventajosas.';

  @override
  String get tarotWealthDetail4_Senior =>
      'Recomendamos métodos de gestión de activos verificados en lugar de productos financieros complejos. Una actitud cautelosa y conservadora es clave para proteger sus activos.';

  @override
  String get tarotWealthMeaning5_Senior =>
      'Ejerza la sabiduría de la vida en las elecciones relacionadas con la riqueza.';

  @override
  String get tarotWealthDetail5_Senior =>
      'Es mejor estar satisfecho con su vida actual y ser sustancial en lugar de ser codicioso. La elección correcta garantiza la paz en la vejez.';

  @override
  String get tarotWealthMeaning6_Senior =>
      'Las situaciones económicas difíciles también pueden superarse con paciencia.';

  @override
  String get tarotWealthDetail6_Senior =>
      'Puede haber una presión temporal en el flujo de caja, pero si lo maneja sabiamente, puede convertir la crisis en una oportunidad. Reduzca los gastos innecesarios.';

  @override
  String get tarotWealthMeaning7_Senior =>
      'Un momento en el que gana mayor abundancia a través del dar.';

  @override
  String get tarotWealthDetail7_Senior =>
      'Si acumula virtud a su alrededor, la suerte con la riqueza vendrá de lugares inesperados. La alegría de compartir hará que su vida sea aún más rica.';

  @override
  String get tarotWealthMeaning8_Senior =>
      'Dese cuenta del verdadero significado de la riqueza en una vida sencilla.';

  @override
  String get tarotWealthDetail8_Senior =>
      'Es importante encontrar ocio mental en lugar de abundancia material. Una vida disciplinada traerá más bien estabilidad económica.';

  @override
  String get tarotWealthMeaning9_Senior =>
      'El flujo de riqueza está cambiando, así que trátelo con flexibilidad.';

  @override
  String get tarotWealthDetail9_Senior =>
      'Pueden ocurrir ingresos o gastos inesperados. Si se adapta al cambio y gestiona sus activos sabiamente, no habrá problemas mayores.';

  @override
  String get tarotWealthMeaning10_Senior =>
      'La gestión de la propiedad justa y transparente aumenta la confianza.';

  @override
  String get tarotWealthDetail10_Senior =>
      'Es importante seguir principios en cuestiones de propiedad como herencias o donaciones. Una actitud honesta evita disputas y trae paz.';

  @override
  String get tarotWealthMeaning11_Senior =>
      'Un momento en el que el sacrificio por el futuro es más valioso que la ganancia inmediata.';

  @override
  String get tarotWealthDetail11_Senior =>
      'El apoyo económico para los hijos o descendientes volverá como una gran recompensa más adelante. Tenga paciencia y mantenga una perspectiva a largo plazo.';

  @override
  String get tarotWealthMeaning12_Senior =>
      'Deje ir la obsesión por la riqueza y encuentre paz mental.';

  @override
  String get tarotWealthDetail12_Senior =>
      'Tendrá una experiencia misteriosa en la que se llena vaciándose. Deje ir el afán de posesión innecesario y afronte la vida diaria con un corazón ligero.';

  @override
  String get tarotWealthMeaning13_Senior =>
      'Los hábitos de consumo equilibrados dan libertad económica.';

  @override
  String get tarotWealthDetail13_Senior =>
      'Busque la armonía entre ingresos y gastos y tenga cuidado con la codicia excesiva. Una vida disciplinada le traerá estabilidad continua.';

  @override
  String get tarotWealthMeaning14_Senior =>
      'Supere las tentaciones materiales y juzgue racionalmente.';

  @override
  String get tarotWealthDetail14_Senior =>
      'Debe tener cuidado con las ofertas de inversión dulces o la expansión excesiva. Confiar en su rica experiencia y tomar decisiones cautelosas es la manera de proteger sus activos.';

  @override
  String get tarotWealthMeaning15_Senior =>
      'Responda con calma a los cambios económicos repentinos.';

  @override
  String get tarotWealthDetail15_Senior =>
      'En una situación de crisis, se necesita la sabiduría de volver a lo básico. No se inquiete y verifique meticulosamente el estado de sus activos para minimizar los daños.';

  @override
  String get tarotWealthMeaning16_Senior =>
      'Una estrella brillante de suerte con la riqueza brilla en su futuro.';

  @override
  String get tarotWealthDetail16_Senior =>
      'Es un momento en el que las dificultades económicas se resuelven y comienza un flujo estable. Diseñe su futuro con una mente positiva y disfrute de la paz.';

  @override
  String get tarotWealthMeaning17_Senior =>
      'No se deje engañar por información incierta y confíe en su intuición.';

  @override
  String get tarotWealthDetail17_Senior =>
      'Se necesita paciencia para esperar hasta que la niebla relacionada con la riqueza se disipe y se revele la verdad. Tómese su tiempo y observe en lugar de tomar una decisión apresurada.';

  @override
  String get tarotWealthMeaning18_Senior =>
      'Un momento lleno de alegría con una abundante suerte con la riqueza.';

  @override
  String get tarotWealthDetail18_Senior =>
      'Recompensas suficientes siguen a sus esfuerzos y surge el ocio económico. Comparta la felicidad con quienes lo rodean y pase un tiempo bendecido.';

  @override
  String get tarotWealthMeaning19_Senior =>
      'Reciba recompensas justas y haga un nuevo plan económico.';

  @override
  String get tarotWealthDetail19_Senior =>
      'Es un momento en el que su sinceridad es reconocida como un logro económico. Organice el pasado y dé un nuevo paso para un futuro estable.';

  @override
  String get tarotWealthMeaning20_Senior =>
      'La suerte con la riqueza se completa y disfruta de una abundancia sin igual.';

  @override
  String get tarotWealthDetail20_Senior =>
      'La estabilidad económica alcanza su punto máximo y se garantiza una jubilación pacífica. Es el momento en que brilla su sabia gestión de activos.';

  @override
  String get tarotWealthMeaning21_Senior =>
      'Disfrute de una abundancia libre sin estar atado a la riqueza.';

  @override
  String get tarotWealthDetail21_Senior =>
      'Es un momento para valorar la alegría de vivir en lugar de la posesión material. Si disfruta del mundo con una mente relajada, la riqueza vendrá naturalmente.';

  @override
  String get tarotSuccessMeaning3_Senior =>
      'Un momento en que la experiencia de vida brilla y recibe respeto.';

  @override
  String get tarotSuccessDetail3_Senior =>
      'Su liderazgo y sabiduría sirven como un gran modelo para quienes lo rodean. Saboreará el verdadero éxito cuando lidere con tolerancia más que con autoridad.';

  @override
  String get tarotSuccessMeaning4_Senior =>
      'Su vida misma, habiendo mantenido convicciones de largo tiempo, es un éxito.';

  @override
  String get tarotSuccessDetail4_Senior =>
      'Es un momento en que los valores inquebrantables dan sus frutos. Su vida basada en principios servirá como un hito que presenta el camino correcto a los más jóvenes.';

  @override
  String get tarotSuccessMeaning5_Senior =>
      'Establecer los valores correctos determina el éxito en la segunda mitad de la vida.';

  @override
  String get tarotSuccessDetail5_Senior =>
      'Es un momento para tomar una decisión sabia entre el honor y el beneficio. Las decisiones tomadas basándose en su rica experiencia garantizarán un futuro pacífico.';

  @override
  String get tarotSuccessMeaning6_Senior =>
      'El esfuerzo persistente finalmente trae la victoria.';

  @override
  String get tarotSuccessDetail6_Senior =>
      'Ningún obstáculo puede quebrar su voluntad. Su apariencia de seguir adelante sin rendirse ya es un gran éxito.';

  @override
  String get tarotSuccessMeaning7_Senior =>
      'La fuerza interior aparece como un carisma suave.';

  @override
  String get tarotSuccessDetail7_Senior =>
      'Es un momento en que la suavidad vence a la fuerza. Cuando abraza el entorno con paciencia y benevolencia, su honor será aún mayor.';

  @override
  String get tarotSuccessMeaning8_Senior =>
      'La sabiduría ganada después de la práctica solitaria es el mayor logro.';

  @override
  String get tarotSuccessDetail8_Senior =>
      'Es un momento en que se da cuenta de verdades profundas que otros no pueden ver. El tiempo de reflexión silenciosa le convertirá en un ser humano más maduro y profundo.';

  @override
  String get tarotSuccessMeaning9_Senior =>
      'Cabalgue la ola del cambio y aproveche nuevas oportunidades.';

  @override
  String get tarotSuccessDetail9_Senior =>
      'Se está abriendo un nuevo capítulo de la vida. Si acepta el cambio positivamente sin temerlo, logrará resultados inesperadamente grandes.';

  @override
  String get tarotSuccessMeaning10_Senior =>
      'Una actitud justa y recta hace que su honor brille aún más.';

  @override
  String get tarotSuccessDetail10_Senior =>
      'El aspecto que sigue a la justicia más que al interés privado exige el respeto de los alrededores. Su honestidad será finalmente la clave del mayor éxito.';

  @override
  String get tarotSuccessMeaning11_Senior =>
      'Un espíritu noble que no teme al sacrificio gana.';

  @override
  String get tarotSuccessDetail11_Senior =>
      'Aunque sea difícil por ahora, es un momento para aguantar por una meta noble. Su dedicación permanecerá como un hermoso éxito en la memoria de la historia y de la gente en el futuro.';

  @override
  String get tarotSuccessMeaning12_Senior =>
      'Deje ir los viejos estándares de éxito y encuentre nuevos valores.';

  @override
  String get tarotSuccessDetail12_Senior =>
      'Es importante darse cuenta de lo preciado del presente en lugar de obsesionarse con la gloria pasada. La paz ganada al vaciarse es el verdadero éxito en la vida.';

  @override
  String get tarotSuccessMeaning13_Senior =>
      'Un momento en que la estética de la armonía y la moderación se completan.';

  @override
  String get tarotSuccessDetail13_Senior =>
      'Una vida equilibrada que no se inclina hacia ningún lado es la virtud más alta. Su apariencia disciplinada difundirá paz y estabilidad a su alrededor.';

  @override
  String get tarotSuccessMeaning14_Senior =>
      'Superar la oscuridad interior y ganar la libertad es el éxito.';

  @override
  String get tarotSuccessDetail14_Senior =>
      'Encuentre su verdadero yo escapando de las ataduras que le ataban. En el momento en que gane la libertad mental, será la persona más exitosa del mundo.';

  @override
  String get tarotSuccessMeaning15_Senior =>
      'Un momento en que se necesita audacia para convertir la crisis en oportunidad.';

  @override
  String get tarotSuccessDetail15_Senior =>
      'El cambio repentino es un proceso para hacerle más fuerte. Cuando establezca un nuevo orden respondiendo con calma, seguirán mayores logros.';

  @override
  String get tarotSuccessMeaning16_Senior =>
      'Sueñe con un futuro esperanzador y obtenga nueva inspiración.';

  @override
  String get tarotSuccessDetail16_Senior =>
      'El descanso llega a un alma cansada y surgen nuevos sueños. Su energía creativa iluminará los alrededores y dará frutos felices.';

  @override
  String get tarotSuccessMeaning17_Senior =>
      'Confíe en su intuición y siga su camino en silencio.';

  @override
  String get tarotSuccessDetail17_Senior =>
      'Escuche su voz interior incluso en situaciones confusas. Con el tiempo, se demostrará que su elección fue la correcta.';

  @override
  String get tarotSuccessMeaning18_Senior =>
      'La energía vibrante trae el mayor logro.';

  @override
  String get tarotSuccessDetail18_Senior =>
      'Un momento en que el cuerpo y la mente están sanos y vibrantes. Compartir energía positiva con el entorno y disfrutar de la alegría de vivir es el verdadero éxito.';

  @override
  String get tarotSuccessMeaning19_Senior =>
      'Responda al llamado y desempeñe un nuevo rol social.';

  @override
  String get tarotSuccessDetail19_Senior =>
      'Surgen lugares que necesitan su experiencia y sabiduría. Sentirá una mayor recompensa y éxito cuando contribuya a la sociedad con un nuevo sentido de misión.';

  @override
  String get tarotSuccessMeaning20_Senior =>
      'Complete el viaje de la vida y logre la armonía perfecta.';

  @override
  String get tarotSuccessDetail20_Senior =>
      'Un estado de perfecta satisfacción y paz sin nada más que lograr. Su vida misma se convertirá en una obra de arte y dará una profunda impresión a su entorno.';

  @override
  String get tarotSuccessMeaning21_Senior =>
      'Una vida libre sin estar atado es el mayor éxito.';

  @override
  String get tarotSuccessDetail21_Senior =>
      'Disfrute de su propia felicidad lejos de los estándares del mundo. Usted, que vive como si viajara por el mundo con un corazón ligero, es el verdadero ganador.';

  @override
  String get compatibilityResultButton => 'Ver resultado de compatibilidad';

  @override
  String get compatibilityDeleteTooltip => 'Eliminar';

  @override
  String get compatibilityGenderMale => 'Masculino';

  @override
  String get compatibilityGenderFemale => 'Femenino';

  @override
  String get compatibilityInputTitle =>
      'Entrada de información de compatibilidad';

  @override
  String get tojeongInputTitle =>
      'Entrada de información del Oráculo Anual Tojeong';

  @override
  String tojeongCheckFortune(int year) {
    return 'Consulta tu $year\nOráculo Anual Tojeong';
  }

  @override
  String get tojeongInputGuide =>
      'Por favor ingresa tu fecha y hora de nacimiento\npara un análisis preciso.';

  @override
  String tojeongViewResult(int year) {
    return 'Ver Oráculo Anual Tojeong $year';
  }

  @override
  String get tojeongCheckButton => 'Consultar Oráculo Anual Tojeong';

  @override
  String get tojeongSaveAndCheck => 'Guardar y ver Oráculo Anual Tojeong';

  @override
  String get tojeongYearSelect => 'Seleccionar Año de Fortuna';

  @override
  String tojeongResultTitle(int year) {
    return 'Oráculo Anual Tojeong $year';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return 'Fortuna de $name para $year';
  }

  @override
  String tojeongGua(String gua) {
    return 'Gua: $gua';
  }

  @override
  String get tojeongTotalLuck => 'Suerte Total';

  @override
  String get tojeongProcess => 'Proceso';

  @override
  String get tojeongResult => 'Resultado';

  @override
  String get tojeongMonthlyLuck => 'Fortuna Mensual';

  @override
  String get tojeongShareResult => 'Compartir Resultados';

  @override
  String tojeongShareTitle(int year) {
    return 'Resultados del Oráculo Anual Tojeong $year';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return 'Resumen general del Oráculo Anual Tojeong de $name.\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => 'Año Objetivo';

  @override
  String get sajuDeleteTitle =>
      'Eliminar información de Cuatro Pilares del Destino';

  @override
  String sajuDeleteConfirm(String name) {
    return '¿Estás seguro de que deseas eliminar la información de $name?';
  }

  @override
  String get sajuProfileSelect =>
      'Seleccionar información de Cuatro Pilares del Destino';

  @override
  String get add => 'Agregar';

  @override
  String get modify => 'Modificar';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\nEl servicio está en preparación.';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      '¡Estamos trabajando duro para ofrecerte\ninformación de fortuna más precisa y útil!';

  @override
  String get goBack => 'Volver';

  @override
  String get name => 'Nombre';

  @override
  String get nameInputGuide => 'Por favor ingresa tu nombre';

  @override
  String get sajuLunarSolar => 'Solar/Lunar';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => 'Seleccionar Año de Fortuna';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'Seleccionar Perfil';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get newYearFortuneInputTitle => 'Información de Fortuna de Año Nuevo';

  @override
  String newYearFortuneHeader(int year) {
    return '¿Cómo será tu fortuna\nen el $year?';
  }

  @override
  String get newYearFortuneSubHeader =>
      'Por favor ingresa tu fecha y hora de nacimiento\npara un análisis preciso de los Cuatro Pilares del Destino.';

  @override
  String newYearFortuneViewButton(int year) {
    return 'Ver Fortuna del $year';
  }

  @override
  String get newYearFortuneCheckButton => 'Verificar Fortuna';

  @override
  String get newYearFortuneSaveAndCheckButton => 'Guardar y Ver Fortuna';

  @override
  String newYearFortuneResultTitle(int year) {
    return 'Mi Fortuna de Año Nuevo $year';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return 'Mi Resultado de Fortuna de Año Nuevo $year';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return 'Fortuna de Año Nuevo para $name.\n\n$desc...';
  }

  @override
  String get sajuChartTitle => 'Gráfico de Cuatro Pilares del Destino';

  @override
  String get sajuHour => 'Hora';

  @override
  String get sajuDay => 'Día';

  @override
  String get sajuMonth => 'Mes';

  @override
  String get sajuYear => 'Año';

  @override
  String get ohaengAnalysisTitle => 'Análisis de los Cinco Elementos';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'Tu Elemento Dominante: $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ Los Cinco Elementos (Madera, Fuego, Tierra, Metal, Agua) son las energías básicas de los Cuatro Pilares del Destino. Si bien el equilibrio es ideal, puedes entender tus tendencias a través de estos elementos.';

  @override
  String yearlyTotalLuck(int year) {
    return 'Suerte Total del $year';
  }

  @override
  String get fortuneDisclaimer =>
      'Esta fortuna es para fines de entretenimiento. Tu vida depende de tu propia voluntad.';

  @override
  String get compatibilityResultTitle => 'Resultado de Compatibilidad';

  @override
  String get compatibilityScore => 'Puntaje de Compatibilidad';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => 'Nuestra Compatibilidad';

  @override
  String get compatibilityShareResult => 'Compartir Resultado';

  @override
  String get compatibilityRetryButton => 'Verificar con Alguien Más';

  @override
  String get compatibilitySummary => 'Resumen';

  @override
  String get compatibilitySectionLuck => 'Sinergia de Suerte';

  @override
  String get compatibilitySectionAdvice => 'Consejos de Relación';

  @override
  String get compatibilitySectionPositive => 'Aspectos Positivos';

  @override
  String get compatibilitySectionCaution => 'Cosas a Tener en Cuenta';

  @override
  String get compatibilityLunarDisclaimer =>
      '* Nota: Las fechas de nacimiento lunares se analizan actualmente según las fechas solares. La conversión lunar se actualizará pronto.';

  @override
  String get tojeongSaveAndCheckButton => 'Guardar y ver fortuna tradicional';

  @override
  String get tojeongSangsuKeyword1 =>
      'un periodo que requiere fuerte impulso y liderazgo';

  @override
  String get tojeongSangsuKeyword2 =>
      'un periodo lleno de relaciones activas y alegría';

  @override
  String get tojeongSangsuKeyword3 =>
      'un periodo donde brillan la inteligencia y la pasión';

  @override
  String get tojeongSangsuKeyword4 =>
      'un periodo de cambios rápidos y nuevos comienzos';

  @override
  String get tojeongSangsuKeyword5 =>
      'un periodo que requiere una actitud flexible y comunicación suave';

  @override
  String get tojeongSangsuKeyword6 =>
      'un periodo para superar dificultades con sabiduría y paciencia';

  @override
  String get tojeongSangsuKeyword7 =>
      'un periodo para buscar estabilidad y fortalecer la fuerza interior';

  @override
  String get tojeongSangsuKeyword8 =>
      'un periodo para construir virtud con inclusividad y un corazón cálido';

  @override
  String get tojeongJungsuKeyword1 => 'conocerás a un ayudante';

  @override
  String get tojeongJungsuKeyword2 =>
      'habrá buenas noticias en documentos o contratos';

  @override
  String get tojeongJungsuKeyword3 =>
      'enfrentarás nuevos desafíos y oportunidades';

  @override
  String get tojeongJungsuKeyword4 =>
      'seguirán el éxito y el honor en el trabajo';

  @override
  String get tojeongJungsuKeyword5 =>
      'debes gestionar cuidadosamente tus finanzas';

  @override
  String get tojeongJungsuKeyword6 => 'debes priorizar el cuidado de tu salud';

  @override
  String get tojeongHasuKeyword1 => 'lograrás un gran éxito.';

  @override
  String get tojeongHasuKeyword2 => 'cosecharás los frutos de tu esfuerzo.';

  @override
  String get tojeongHasuKeyword3 =>
      'convertirás la crisis en oportunidad a través de la paciencia.';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return 'Este año, entre $sangsu, $jungsu y finalmente $hasu';
  }

  @override
  String get tojeongSangsuDetail1 =>
      'Es una situación donde el cielo y la tierra te están ayudando. Es un año donde puedes lograr grandes resultados si procedes con un fuerte impulso. Como un dragón ascendiendo al cielo, tu energía es poderosa y brillante. Tendrás muchas oportunidades para demostrar liderazgo y ganar reconocimiento de quienes te rodean. Sin embargo, actuar de forma demasiado dogmática puede causar resentimiento, por lo que es importante ser inclusivo.';

  @override
  String get tojeongSangsuDetail2 =>
      'Es como lanzar una piedra a un lago tranquilo, creando ondas. Es un año con mucha alegría y placer, pero debes tener cuidado con los chismes causados por deslices al hablar. Tu vida social se activará y tu popularidad aumentará, pero esto también puede traer celos. Podrías conocer a una buena pareja en una reunión o evento agradable.';

  @override
  String get tojeongSangsuDetail3 =>
      'Es como un sol brillante que brilla sobre todo el mundo. Tu intelecto y pasión brillarán, y podrías destacar en campos de estudio o arte. Tu reputación aumentará y te harás conocido, pero debes controlar un temperamento tan rápido como el fuego para evitar problemas. Si bien las cosas se ven glamorosas por fuera, podrías sentirte solo por dentro, así que enfócate en la sustancia interior.';

  @override
  String get tojeongSangsuDetail4 =>
      'Se esperan cambios rápidos, como un trueno en un cielo despejado. Tu energía es activa y emprendedora, lo que lo convierte en un buen momento para comenzar cosas nuevas. Estarás ocupado moviéndote o enfrentando cambios. El comienzo puede ser ruidoso pero el final podría ser vago, por lo que necesitas la perseverancia para terminar lo que empiezas.';

  @override
  String get tojeongSangsuDetail5 =>
      'Es un momento en el que todo revive mientras sopla una suave brisa primaveral. Si respondes con una actitud flexible, los caminos bloqueados se abrirán sin problemas. Puedes obtener ganancias en negocios o comercio, y llegarán buenas noticias de lejos. Sin embargo, la indecisión podría llevar a perder oportunidades, por lo que se necesita decisión cuando llegue el momento.';

  @override
  String get tojeongSangsuDetail6 =>
      'Es como nadar en aguas profundas. Si bien se ve tranquilo en la superficie, puede haber preocupaciones por dentro. Debes usar la sabiduría para superar las dificultades, y es mejor evitar inversiones o expansiones excesivas. Si esperas pacientemente el momento adecuado, seguramente llegará un buen día. Presta atención a tu salud.';

  @override
  String get tojeongSangsuDetail7 =>
      'Es como si una gran montaña bloqueara tu camino, pero una vez que la cruzas, se extiende una vasta llanura. Si soportas las dificultades con voluntad firme, darás grandes frutos. Es ventajoso mantener tu posición actual y enfocarte en la estabilidad interior. La estabilidad es mejor que los cambios apresurados, y construir confianza es importante.';

  @override
  String get tojeongSangsuDetail8 =>
      'Es un momento para sembrar semillas en tierras vastas. Si abrazas tu entorno con inclusividad y paciencia, construirás virtud. Si tratas a las personas con un corazón cálido y maternal, puedes recibir ayuda de los demás. Las inversiones para el futuro, más que los resultados inmediatos, brillarán este año. La paz habitará en tu hogar.';

  @override
  String get tojeongJungsuDetail1 =>
      'Un ayudante llega a tu puerta, trayendo eventos alegres. Los asuntos bloqueados se resolverán y la riqueza fluirá. Si planeas cosas con un socio, la probabilidad de éxito aumentará.';

  @override
  String get tojeongJungsuDetail2 =>
      'Puede haber una celebración en casa o podrías dar la bienvenida a un nuevo miembro de la familia. La suerte con los documentos es buena, lo que lo hace favorable para contratos o ventas. Sin embargo, pequeñas discusiones podrían convertirse en grandes peleas, así que ten cuidado con tus palabras y acciones.';

  @override
  String get tojeongJungsuDetail3 =>
      'Estás destinado a desplegar tus alas en una tierra extranjera o mudarte muy lejos. Puedes obtener nuevas oportunidades a través de viajes o viajes de negocios. Si te desafías a ti mismo sin temer al cambio, obtendrás buenos resultados.';

  @override
  String get tojeongJungsuDetail4 =>
      'El honor sigue a medida que recibes reconocimiento o ascenso en el trabajo. Es un momento favorable para aprobar exámenes u obtener certificaciones. Siéntete libre de demostrar tus habilidades al máximo.';

  @override
  String get tojeongJungsuDetail5 =>
      'La suerte de la riqueza es fuerte, pero los gastos también podrían aumentar. Debes ser minucioso con la gestión del dinero y abstenerte de gastos impulsivos. Es mejor evitar transacciones financieras con conocidos cercanos.';

  @override
  String get tojeongJungsuDetail6 =>
      'Es un momento para cuidar especialmente tu salud. Evita trabajar en exceso y descansa mucho. También es bueno revisar el seguro en preparación para accidentes o enfermedades inesperadas.';

  @override
  String get tojeongHasuDetail1 =>
      'Como resultado, todo se resolverá sin problemas y tus deseos se harán realidad. Seguramente recibirás recompensas por tus esfuerzos y ganarás la envidia de quienes te rodean. Si no pierdes tu mentalidad inicial, tus bendiciones durarán mucho.';

  @override
  String get tojeongHasuDetail2 =>
      'Puede haber algunas dificultades en el proceso, pero si perseveras y trabajas duro, eventualmente lograrás tu objetivo. Nada se gana fácilmente, así que cosecharás lo que has trabajado. Es una fortuna de floración tardía.';

  @override
  String get tojeongHasuDetail3 =>
      'Podrías encontrar obstáculos inesperados, pero si perseveras sin frustrarte, puedes convertir la crisis en oportunidad. Si dejas ir la codicia y aclaras tu mente, sucederán cosas buenas en su lugar. Se necesita sabiduría para convertir el infortunio en una bendición.';

  @override
  String get tojeongGeneralWealthGood =>
      'La suerte de la riqueza es buena. Pueden surgir ingresos de lugares inesperados, o las inversiones pueden dar buenos resultados. Sin embargo, así como entra el dinero, también puede salir, así que enfócate en ahorrar.';

  @override
  String get tojeongGeneralWealthBad =>
      'El flujo de riqueza puede no ser fluido. Debes reducir los gastos innecesarios y desarrollar el hábito de ahorrar. Sé cauteloso con las transacciones financieras y consulta a expertos para inversiones.';

  @override
  String get tojeongGeneralCareerGood =>
      'Surgirán oportunidades para obtener reconocimiento en tu carrera o negocio. Es un buen momento para ascensos, cambios de carrera o para iniciar un negocio. Se pueden lograr mejores resultados con buenas relaciones.';

  @override
  String get tojeongGeneralCareerBad =>
      'Es mejor mantener el estado actual. Enfócate en tus tareas actuales y desarrolla tus habilidades en lugar de iniciar nuevos proyectos. Podrías sentir estrés en las relaciones con colegas o superiores, así que mantén la mente tranquila.';

  @override
  String get tojeongGeneralLoveGood =>
      'La suerte en el amor aumenta, por lo que los solteros pueden conocer a una buena pareja y el amor de las parejas se profundizará. La risa y la armonía llenarán el hogar. Es un buen momento para hablar de matrimonio.';

  @override
  String get tojeongGeneralLoveBad =>
      'Pueden surgir discusiones debido a malentendidos triviales. Se necesita comprensión y consideración por las posiciones del otro. Intenta resolver los problemas a través de un diálogo racional en lugar de respuestas emocionales.';

  @override
  String get optional => 'Opcional';

  @override
  String get sajuSolarHint =>
      'Tojeongbigyeol es más preciso cuando se analiza basándose en el cumpleaños lunar.';

  @override
  String get yourFortune => 'Tu Fortuna';

  @override
  String get guaUpper => 'Gua Superior';

  @override
  String get guaMiddle => 'Gua Medio';

  @override
  String get guaLower => 'Gua Inferior';

  @override
  String get guaCode => 'Código Gua';

  @override
  String get viewAgain => 'Ver de nuevo';

  @override
  String get zodiacAries => 'Aries';

  @override
  String get zodiacTaurus => 'Tauro';

  @override
  String get zodiacGemini => 'Géminis';

  @override
  String get zodiacCancer => 'Cáncer';

  @override
  String get zodiacLeo => 'Leo';

  @override
  String get zodiacVirgo => 'Virgo';

  @override
  String get zodiacLibra => 'Libra';

  @override
  String get zodiacScorpio => 'Escorpio';

  @override
  String get zodiacSagittarius => 'Sagitario';

  @override
  String get zodiacCapricorn => 'Capricornio';

  @override
  String get zodiacAquarius => 'Acuario';

  @override
  String get zodiacPisces => 'Piscis';

  @override
  String get elementFire => 'Fuego';

  @override
  String get elementEarth => 'Tierra';

  @override
  String get elementAir => 'Aire';

  @override
  String get elementWater => 'Agua';

  @override
  String get compatibilityCategoryZodiac =>
      'Compatibilidad de Signos Zodiacales';

  @override
  String get compatibilityCategoryInner => 'Compatibilidad Interior';

  @override
  String get compatibilityCategoryConstellation =>
      'Compatibilidad de Constelaciones';

  @override
  String get compatibilitySummarySamhap =>
      'Mejor Combinación Zodiacal (Samhap)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return 'El $animal1 y el $animal2 son una pareja perfecta, complementando las debilidades del otro. Esta relación crea una gran sinergia cuando están juntos.';
  }

  @override
  String get compatibilitySummaryYukhap => 'Gran Combinación Zodiacal (Yukhap)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return 'El $animal1 y el $animal2 tienen una fuerte atracción mutua. Es fácil sentir una conexión desde el principio.';
  }

  @override
  String get compatibilitySummaryChung =>
      'Relación que Requiere Esfuerzo (Chung)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return 'El $animal1 y el $animal2 tienen temperamentos diferentes y pueden chocar. Es necesario respetar las diferencias del otro y mostrar consideración.';
  }

  @override
  String get compatibilitySummaryWonjin =>
      'Relación que Requiere Comprensión (Wonjin)';

  @override
  String get compatibilityDescWonjin =>
      'Esta es una relación donde ocasionalmente podrías sentir resentimiento o tristeza sin una razón clara. Se recomienda una comunicación frecuente para reducir los malentendidos.';

  @override
  String get compatibilitySummaryDefaultZodiac =>
      'Combinación Zodiacal Promedio';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return 'El $animal1 y el $animal2 tienen una relación fluida sin grandes conflictos.';
  }

  @override
  String get compatibilitySummaryCheonganHap => 'Almas Gemelas (CheonganHap)';

  @override
  String get compatibilityDescCheonganHap =>
      'Las personalidades y los valores de ambos individuos están perfectamente alineados. Son almas gemelas que se entienden incluso sin palabras.';

  @override
  String get compatibilitySummarySangsaeng =>
      'Mutuamente Beneficioso (Sangsaeng)';

  @override
  String get compatibilityDescSangsaeng =>
      'Una relación positiva donde se apoyan mutuamente y se ayudan a crecer.';

  @override
  String get compatibilitySummarySanggeuk =>
      'Relación que Requiere Ajuste (Sanggeuk)';

  @override
  String get compatibilityDescSanggeuk =>
      'Puede haber diferencias de personalidad, pero también es una relación donde pueden complementar las debilidades del otro.';

  @override
  String get compatibilitySummaryDefaultInner => 'Cómodos como Amigos';

  @override
  String get compatibilityDescDefaultInner =>
      'Una relación donde tienen tendencias similares y pueden pasar tiempo cómodamente como amigos.';

  @override
  String get compatibilitySummarySameElement =>
      'Encuentro de Personalidades Similares';

  @override
  String compatibilityDescSameElement(String element) {
    return 'Ambos tienen la tendencia \'$element\', lo que hace que sus valores y formas de actuar sean muy similares.';
  }

  @override
  String get compatibilitySummaryCompatibleElement => 'Equilibrio Armonioso';

  @override
  String get compatibilityDescCompatibleElement =>
      'Una relación donde diferentes encantos se mezclan armoniosamente.';

  @override
  String get compatibilitySummaryIncompatibleElement => 'Encantos Diferentes';

  @override
  String get compatibilityDescIncompatibleElement =>
      'Dado que tienen temperamentos diferentes, al principio puede sentirse extraño, pero hay alegría en conocerse mutuamente.';

  @override
  String get compatibilitySummaryDefaultConstellation => 'Armonía Promedio';

  @override
  String get compatibilityDescDefaultConstellation =>
      'Una relación que encaja razonablemente bien basada en los signos zodiacales.';

  @override
  String get routineMorningTitle => '¡Una mañana refrescante! ☀️';

  @override
  String get routineMorningBody =>
      '¿Ha olvidado las misiones de rutina planeadas para hoy?';

  @override
  String get routineEveningTitle => '¡Buen trabajo hoy! ✨';

  @override
  String get routineEveningBody =>
      '¿Ha completado todas las misiones de hoy? Termine su rutina.';

  @override
  String get routineCheckTitle => '¡Revise sus misiones de hoy! 🚀';

  @override
  String get routineCheckBody =>
      'Siga las misiones de rutina y haga que su día sea agradable.';

  @override
  String get supplementNotificationTitle => 'Recordatorio de suplementos';

  @override
  String get waterNotificationTitle => 'Recordatorio para beber agua';

  @override
  String get routineNotificationTitle => 'Notificación de rutina diaria';

  @override
  String get todaysFortuneNotificationTitle => 'Tu fortuna de hoy';

  @override
  String get afternoonFortuneNotificationBody =>
      '¿Qué tal tu fortuna de la tarde? ¡Compruébalo ahora!';

  @override
  String get morningFortuneNotificationBody =>
      '¡Mira tu fortuna y empieza el día con energía!';

  @override
  String get fortunePassExpiryTitle => 'Fortune Pass vence hoy';

  @override
  String get fortunePassExpiryBody =>
      'Su membresía de Fortune Pass vence hoy. ¡Renuévela para seguir disfrutando de los beneficios!';

  @override
  String get takeNow => 'Tomar ahora';

  @override
  String get later => 'Más tarde';

  @override
  String get turnOffAlarmAction => 'Apagar alarma';

  @override
  String get todaysFortuneNotification => 'Notificación del horóscopo de hoy';

  @override
  String get enableNotification => 'Activar notificación';

  @override
  String get fortuneNotificationDescription =>
      'Te informa de tu horóscopo de hoy a la hora especificada.';

  @override
  String get morningNotificationTime => 'Hora de notificación por la mañana';

  @override
  String get afternoonNotificationTime => 'Hora de notificación por la tarde';

  @override
  String get morningFortuneTitle => 'Fortuna de la mañana';

  @override
  String get afternoonFortuneTitle => 'Fortuna de hoy (Tarde)';

  @override
  String get type => 'Tipo';

  @override
  String get supplementChannelDesc =>
      'Canal para notificaciones de toma de suplementos.';

  @override
  String get waterChannelDesc =>
      'Canal para notificaciones del hábito de beber agua.';

  @override
  String get waterSummaryTitle => 'Notificación de beber agua';

  @override
  String get dailyRoutineChannelDesc =>
      'Canal para notificaciones de misiones diarias y creación de hábitos.';

  @override
  String get dailyRoutineSummaryTitle => 'Notificación de rutina diaria';

  @override
  String get missionChannelName => 'Notificación de misión';

  @override
  String get missionChannelDesc =>
      'Canal para notificaciones generales de ejecución de misiones.';

  @override
  String get fortuneChannelName => 'Notificación de fortuna';

  @override
  String get fortuneChannelDesc =>
      'Canal para notificaciones diarias de consulta de fortuna.';

  @override
  String get subscriptionChannelName => 'Notificación de suscripción';

  @override
  String get subscriptionChannelDesc =>
      'Canal para notificaciones de suscripción y expiración del Fortune Pass.';

  @override
  String get alarmChannelName => 'Alarma';

  @override
  String get alarmChannelDesc =>
      'Canal para alarmas de despertar y ejecución de misiones.';

  @override
  String get shareViaKakao => 'Compartir por KakaoTalk';

  @override
  String get shareViaSNS =>
      'Compartir por otras redes sociales (Instagram, Twitter, etc.)';

  @override
  String get checkDetailResult => 'Consultar resultado detallado';

  @override
  String get viewMyFortuneResult => 'Ver mi resultado de fortuna';

  @override
  String get takeSupplementNow => '¡Por favor toma tus suplementos!';

  @override
  String get takeNowQuestion => '¿Te gustaría tomarlo ahora?';

  @override
  String get eatNow => 'Tomar ahora';

  @override
  String get eatLater => 'Tomar después';

  @override
  String snoozeMessageGeneric(int minutes) {
    return 'Te lo recordaré de nuevo en $minutes minutos.';
  }

  @override
  String get hours => 'horas';

  @override
  String get cheeringMessage4 => '¡Mañana vibrante, comienzo feliz!';

  @override
  String get cheeringMessage5 => 'Ten un día sonriente.';

  @override
  String get cheeringMessage6 => '¡Anímate hoy!';

  @override
  String get cheeringMessage7 => 'Brillarás lo suficiente hoy.';

  @override
  String get cheeringMessage8 =>
      '¡Tengo la sensación de que algo bueno va a pasar!';

  @override
  String get cheeringMessage9 => 'Gran trabajo hoy. ¡Un comienzo vigoroso!';

  @override
  String get cheeringMessage10 => 'La felicidad siempre está a tu lado.';

  @override
  String get cheeringMessage11 => 'Apoyo tus sueños hoy.';

  @override
  String get cheeringMessage12 => '¡Mañana refrescante, día agradable!';

  @override
  String get cheeringMessage13 => '¡Sé victorioso hoy!';

  @override
  String get cheeringMessage14 => 'Eres valioso solo por ser tú.';

  @override
  String get cheeringMessage15 => 'Ten un día lleno de cosas agradables.';

  @override
  String get cheeringMessage16 => '¡Espero que tu día brille hoy!';

  @override
  String get cheeringMessage17 => 'Tu sonrisa ilumina el mundo.';

  @override
  String get cheeringMessage18 => '¡Sé tú mismo hoy!';

  @override
  String get cheeringMessage19 => 'Empieza hoy con el corazón palpitante.';

  @override
  String get cheeringMessage20 => 'Un día maravilloso te espera.';

  @override
  String get cheeringMessage21 => '¡Con el poder de la positividad hoy!';

  @override
  String get cheeringMessage22 => 'Apoyo tu camino.';

  @override
  String get cheeringMessage23 => '¡Haz que hoy sea tu mejor día!';

  @override
  String get cheeringMessage24 => '¡Que la suerte te acompañe!';

  @override
  String get cheeringMessage25 => 'Ten un día cálido hoy.';

  @override
  String get cheeringMessage26 => '¡Puedes hacerlo!';

  @override
  String get cheeringMessage27 => 'Empieza hoy con gratitud.';

  @override
  String get cheeringMessage28 => 'Tu valor es infinito.';

  @override
  String get cheeringMessage29 => 'Que tu día florezca con sonrisas.';

  @override
  String get cheeringMessage30 => '¡Pásalo bien con buena gente!';

  @override
  String get cheeringMessage31 => '¡Un paso más cerca de tus sueños hoy!';

  @override
  String get cheeringMessage32 => 'Eres la persona más genial hoy.';

  @override
  String get cheeringMessage33 => 'Un día milagroso vendrá.';

  @override
  String get cheeringMessage34 => 'Disfruta de tu día con calma hoy.';

  @override
  String get cheeringMessage35 => 'Tus esfuerzos no te traicionarán.';

  @override
  String get cheeringMessage36 => 'Ten un día saludable hoy.';

  @override
  String get cheeringMessage37 => '¡Naciste para ser amado!';

  @override
  String get cheeringMessage38 => '¡Sé valiente hoy!';

  @override
  String get cheeringMessage39 => 'Un futuro brillante te espera.';

  @override
  String get cheeringMessage40 => '¡Ten un día lleno de pasión!';

  @override
  String get cheeringMessage41 => 'Espero que tu mente esté en paz.';

  @override
  String get cheeringMessage42 => 'Encuentra una pequeña felicidad hoy.';

  @override
  String get cheeringMessage43 =>
      'Ya lo estás haciendo lo suficientemente bien.';

  @override
  String get cheeringMessage44 => 'Empieza hoy con esperanza.';

  @override
  String get cheeringMessage45 =>
      'Tu amabilidad es una gran fuerza para alguien.';

  @override
  String get cheeringMessage46 => 'Ten un día productivo hoy.';

  @override
  String get cheeringMessage47 => 'Tienes el poder de cambiar el mundo.';

  @override
  String get cheeringMessage48 => '¡Día despejado hoy!';

  @override
  String get cheeringMessage49 => 'Exuda tu encanto al máximo.';

  @override
  String get cheeringMessage50 => '¡Llena tu día de felicidad hoy!';

  @override
  String get locationServiceDisabled =>
      'Los servicios de ubicación están desactivados.';

  @override
  String get locationPermissionDenied => 'Permiso de ubicación denegado.';

  @override
  String get locationPermissionPermanentlyDenied =>
      'Permiso de ubicación denegado permanentemente.';

  @override
  String get deleteMissionTitle => 'Eliminar misión';

  @override
  String get yesDelete => 'Sí, eliminar';

  @override
  String get waterAlarmTitle => '¡Hora de beber agua! 💧';

  @override
  String get waterAlarmBody => '¿Qué tal un vaso de agua fresca para tu salud?';

  @override
  String get supplementAlarmBody => 'No olvides tomar tus suplementos hoy.';

  @override
  String get waterHabitChannelDesc =>
      'Canal de notificación para el hábito de beber agua.';

  @override
  String get pleaseSolveMath => 'Por favor, resuelve el problema.';

  @override
  String detectedLabel(String labels) {
    return '[Detectado: $labels]';
  }

  @override
  String get defaultSleepDuration => '7h 30m';

  @override
  String get year2024Name => 'Año Gap-Chin (Año del Dragón Azul)';

  @override
  String get year2025Name => 'Año Eul-Sa (Año de la Serpiente Azul)';

  @override
  String get year2026Name => 'Año Byeong-O (Año del Caballo Rojo)';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle Consulta] $title';
  }

  @override
  String get summary => 'Resumen';

  @override
  String get monthlySummary => 'Resumen mensual';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month Tasa de éxito mensual: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return 'No hay registros para $month';
  }

  @override
  String get missionRecord => 'Récord de misión';

  @override
  String get supplementRecord => 'Registro de suplementos';

  @override
  String get timeSaleCatchChance =>
      '¡Aprovecha la oportunidad del 50% de descuento!';
}
