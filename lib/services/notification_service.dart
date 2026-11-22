import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../data/models/alarm_model.dart';
import '../data/models/math_difficulty.dart';
import '../data/models/mission_model.dart';
import '../data/models/daily_mission_log.dart';
import '../core/constants/mission_type.dart';
import '../core/constants/mission_category.dart';
import '../core/constants/sound_resources.dart';
import '../features/mission/supplement/models/supplement_settings.dart';
import '../features/mission/supplement/models/supplement_log.dart';
import '../features/mission/water/models/water_settings.dart';
import 'fortune_push_service.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isHiveInitialized = false;

  Future<void> _ensureHiveInitialized() async {
    if (_isHiveInitialized) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(directory.path);
      
      // 어댑터 등록 (중복 등록 방지)
      _registerAdapters();
      
      _isHiveInitialized = true;
      debugPrint('[NotificationService] Hive initialized in background/service context.');
    } catch (e) {
      debugPrint('[NotificationService] Hive initialization error: $e');
      // 이미 초기화된 경우에도 true로 설정
      _isHiveInitialized = true;
    }
  }

  void _registerAdapters() {
    // typeId는 각 모델의 @HiveType(typeId:) 값과 반드시 일치해야 한다.
    // 0=AlarmModel, 1=MissionType (앞선 두 줄이 뒤바뀌면 백그라운드 아이솔레이트에서
    // 'alarms' 박스를 읽지 못해 알람이 울리지 않는다).
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(AlarmModelAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(MissionTypeAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(MathDifficultyAdapter());
    if (!Hive.isAdapterRegistered(3)) Hive.registerAdapter(MissionModelAdapter());
    if (!Hive.isAdapterRegistered(4)) Hive.registerAdapter(DailyMissionLogAdapter());
    if (!Hive.isAdapterRegistered(5)) Hive.registerAdapter(MissionCategoryAdapter());
    if (!Hive.isAdapterRegistered(7)) Hive.registerAdapter(WaterSettingsAdapter());
    if (!Hive.isAdapterRegistered(8)) Hive.registerAdapter(SupplementLogAdapter());
    if (!Hive.isAdapterRegistered(9)) Hive.registerAdapter(SupplementSettingsAdapter());
  }

  Future<AppLocalizations> getL10n() async {
    return await _getL10n();
  }

  Future<AppLocalizations> _getL10n() async {
    // Hive 초기화 확인
    await _ensureHiveInitialized();

    // 1. 기본값: 시스템 언어
    String languageCode = Platform.localeName.split('_')[0];
    debugPrint('[NotificationService] Default system locale: $languageCode');
    
    try {
      // settings 박스가 열려있는지 확인
      Box settingsBox;
      if (Hive.isBoxOpen('settings')) {
        settingsBox = Hive.box('settings');
      } else {
        // [수정] 박스가 닫혀있으면 새로 엶 (백그라운드 대응)
        settingsBox = await Hive.openBox('settings');
      }
      
      if (settingsBox.containsKey('language')) {
        final savedLanguage = settingsBox.get('language');
        if (savedLanguage != null && savedLanguage.isNotEmpty) {
          languageCode = savedLanguage;
          debugPrint('[NotificationService] Found saved language in Hive: $languageCode');
        }
      } else {
        debugPrint('[NotificationService] No "language" key found in Hive settings.');
      }
    } catch (e) {
      debugPrint('[NotificationService] Error reading language from Hive: $e');
      // 에러 발생 시 시스템 로케일 유지
    }
    
    // 지원하지 않는 언어일 경우 영어로 폴백.
    // AppLocalizations.supportedLocales 의 전체 목록과 일치시켜야 한다.
    // (이전에는 `th` 가 빠져 있어, 태국어 기기에서는 알림이 항상 영어로 나왔다)
    if (!['ko', 'en', 'ja', 'zh', 'ru', 'hi', 'fr', 'es', 'de', 'th'].contains(languageCode)) {
      debugPrint('[NotificationService] Unsupported language "$languageCode", falling back to "en"');
      languageCode = 'en';
    }
    
    debugPrint('[NotificationService] Final languageCode for L10n: $languageCode');
    return await AppLocalizations.delegate.load(Locale(languageCode));
  }

  // 알림 그룹화를 위한 키
  static const String _groupKey = 'com.fortunealarm.NOTIFICATION_GROUP';
  static const int _summaryId = 0; // Android 그룹 요약 알림용 ID

  Future<void> init(
    Future<dynamic> Function(int, String?, String?, String?)? onDidReceiveLocalNotification, {
    void Function(NotificationResponse)? onNotificationResponse,
    bool isBackground = false,
  }) async {
    // 타임존 설정
    await _configureLocalTimeZone();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone().timeout(
        const Duration(seconds: 2),
      );
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (_) {
      tz.setLocalLocation(tz.local);
    }
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // 일반 알림 표시
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    final l10n = await _getL10n();
    const String channelId = 'general_channel_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.appTitle,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      autoCancel: true,
      ongoing: false,
      groupKey: _groupKey,
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  // 영양제 알림 전용 (액션 버튼 포함)
  Future<void> showSupplementNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    String? soundName,
    bool isVibrationEnabled = true,
  }) async {
    final l10n = await _getL10n();
    const String channelId = 'supplement_channel_v1';

    // 액션 버튼 정의
    final List<AndroidNotificationAction> actions = [
      AndroidNotificationAction(
        'TAKE_NOW',
        l10n.takeNow,
        showsUserInterface: true,
        cancelNotification: true,
      ),
      AndroidNotificationAction(
        'SNOOZE',
        l10n.later,
        showsUserInterface: true,
        cancelNotification: true,
      ),
    ];

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.supplementNotificationTitle,
      channelDescription: l10n.supplementChannelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      audioAttributesUsage: AudioAttributesUsage.notification,
      playSound: true,
      enableVibration: isVibrationEnabled,
      autoCancel: true,
      ongoing: false,
      ticker: l10n.supplementNotificationTitle,
      actions: actions,
      groupKey: _groupKey, // 그룹화 키 추가
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(
      threadIdentifier: _groupKey, // iOS 그룹화 키
    );

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );

    // Android 그룹 요약 알림 발송
    await _showAndroidSummary(channelId, l10n.supplementNotificationTitle);
  }

  // Android 그룹 요약 알림 발송용 프라이빗 메서드
  Future<void> _showAndroidSummary(String channelId, String channelName) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      channelName,
      // 요약 알림이 별도 행을 차지하기보다 그룹 아래에 묶이도록 중요도를 낮춘다.
      importance: Importance.low,
      priority: Priority.low,
      groupKey: _groupKey,
      setAsGroupSummary: true,
      autoCancel: true,
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // title/body 없이 show 하면 빈 Importance.max 행이 계속 보인다.
    await flutterLocalNotificationsPlugin.show(
      _summaryId,
      channelName,
      '',
      platformChannelSpecifics,
    );
  }

  // 물 마시기 알림 전용
  Future<void> showWaterNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    bool isVibrationEnabled = true,
  }) async {
    final l10n = await _getL10n();
    const String channelId = 'water_channel_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.waterNotificationTitle,
      channelDescription: l10n.waterHabitChannelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      audioAttributesUsage: AudioAttributesUsage.notification,
      playSound: true,
      enableVibration: isVibrationEnabled,
      autoCancel: true,
      ongoing: false,
      ticker: l10n.waterNotificationTitle,
      groupKey: _groupKey,
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );

    await _showAndroidSummary(channelId, l10n.waterSummaryTitle);
  }

  // 데일리 루틴 알림 전용
  Future<void> showRoutineNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    final l10n = await _getL10n();
    const String channelId = 'routine_channel_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.routineNotificationTitle,
      channelDescription: l10n.dailyRoutineChannelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      playSound: true,
      autoCancel: true,
      ongoing: false,
      ticker: l10n.routineNotificationTitle,
      groupKey: _groupKey,
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );

    await _showAndroidSummary(channelId, l10n.dailyRoutineSummaryTitle);
  }

  // 일반/커스텀 미션 알림 스케줄링
  Future<void> scheduleMissionNotification({
    required String missionId,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final int id = _getStableId(missionId);
    final l10n = await _getL10n();
    
    const String channelId = 'mission_channel_v1';
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.missionChannelName,
      channelDescription: l10n.missionChannelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      autoCancel: true,
      groupKey: _groupKey,
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfTime(time.hour, time.minute),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'mission_$missionId',
    );
  }

  Future<void> cancelMissionNotification(String missionId) async {
    final int id = _getStableId(missionId);
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // 데일리 운세 알림 스케줄링
  Future<void> scheduleDailyFortuneNotification({
    required int id,
    required TimeOfDay time,
    required String title,
    required String body,
  }) async {
    final l10n = await _getL10n();
    const String channelId = 'fortune_channel_v1';
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.fortuneChannelName,
      channelDescription: l10n.fortuneChannelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      autoCancel: true,
      groupKey: _groupKey,
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfTime(time.hour, time.minute),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'fortune_daily_$id',
    );
  }

  Future<void> cancelDailyFortuneNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllFortuneNotifications() async {
    await flutterLocalNotificationsPlugin.cancel(40001);
    await flutterLocalNotificationsPlugin.cancel(40002);
    await flutterLocalNotificationsPlugin.cancel(40003);
  }

  // 기본 운세 알림 스케줄링 (FortunePushService로 통합됨)
  Future<void> scheduleDefaultFortuneNotifications() async {
    await FortunePushService.scheduleDailyPush();
  }

  // 포춘 패스 만료 알림 스케줄링
  Future<void> scheduleFortunePassExpiryReminder({
    required DateTime activeUntilLocal,
  }) async {
    const int id = 50001; // 포춘 패스 알림 고정 ID
    
    // 만료 당일 오전 9시 알림 시간 계산
    final reminderTime = DateTime(
      activeUntilLocal.year,
      activeUntilLocal.month,
      activeUntilLocal.day,
      9, 0
    );
    
    // 이미 지난 시간이면 알림을 설정하지 않음
    if (reminderTime.isBefore(DateTime.now())) {
      return;
    }

    final l10n = await _getL10n();

    const String channelId = 'subscription_channel_v1';
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.subscriptionChannelName,
      channelDescription: l10n.subscriptionChannelDesc,
      importance: Importance.high,
      priority: Priority.high,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      autoCancel: true,
      groupKey: _groupKey,
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      l10n.fortunePassExpiryTitle,
      l10n.fortunePassExpiryBody,
      tz.TZDateTime.from(reminderTime, tz.local),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'subscription_expiry',
    );
  }

  Future<void> cancelFortunePassExpiryReminder() async {
    const int id = 50001;
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // 알람 스케줄링 (iOS 대응용)
  Future<void> scheduleAlarmNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
    String? soundName,
    bool isVibrationEnabled = true,
    bool repeatDaily = false,
  }) async {
    // "Standard/morning" 같은 경로에서 raw 리소스 이름을 해석한다.
    // 해석에 실패하면 사운드를 지정하지 않아 시스템 기본 알림음으로라도 울리게 한다.
    // (잘못된 이름으로 채널을 만들면 사운드가 고정되어 영구히 무음이 된다.)
    final rawSoundName = resolveRawSoundName(soundName);
    final String channelId = buildAlarmChannelId(soundName);

    final l10n = await _getL10n();

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.alarmChannelName,
      importance: Importance.max,
      priority: Priority.max,
      fullScreenIntent: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      playSound: true,
      sound: rawSoundName != null ? RawResourceAndroidNotificationSound(rawSoundName) : null,
      enableVibration: isVibrationEnabled,
      autoCancel: false,
      ongoing: true,
      groupKey: _groupKey,
    );

    final DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      // iOS 는 번들된 사운드 파일 이름이 필요하지만 이 앱에는 .caf 가 없다.
      // 잘못된 이름을 주면 예약 알림 자체가 실패하므로 사운드 지정 없이 relies on
      // 기본 알림음으로 처리한다. (알람 사운드는 앱 내 AudioPlayer 가 담당)
      sound: null,
      threadIdentifier: _groupKey,
      interruptionLevel: InterruptionLevel.critical, // 알람이므로 크리티컬 레벨 시도
    );

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // repeatDaily = false : 단발 알람(알람/스누즈/안전). iOS 는 APNs 제한으로
      //   최대 64건까지만 예약되므로 OS 반복에 의존하지 않는다.
      // repeatDaily = true : 매일 같은 시각에 발송하는 알림(운세 푸시, 저녁 루틴).
      //   이 알림들의 재예약 콜백은 AndroidAlarmManager 로만 구현되어 있어
      //   iOS 에서는 이 값이 false 면 딱 한 번 울리고 다시는 반복되지 않는다.
      matchDateTimeComponents:
          repeatDaily ? DateTimeComponents.time : null,
      payload: payload,
    );
  }

  int _getStableId(String id) {
    int h = 0;
    for (int i = 0; i < id.length; i++) {
      h = 31 * h + id.codeUnitAt(i);
      h &= 0xFFFFFFFF;
    }
    if (h > 0x7FFFFFFF) h -= 0x100000000;
    return h;
  }

  Future<void> showAlarmNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    String? soundName, // "Standard/morning" 또는 "morning" 형태 모두 허용
    String? vibrationPattern, // 'short', 'long', 'heartbeat'
    bool isGradualVolume = false,
    bool isVibrationEnabled = true,
    bool isSoundEnabled = true,
  }) async {
    // 진동 패턴 설정
    Int64List vibration;
    if (vibrationPattern == 'short') {
      vibration = Int64List.fromList([0, 500, 500, 500]);
    } else if (vibrationPattern == 'long') {
      vibration = Int64List.fromList([0, 1000, 1000, 1000]);
    } else if (vibrationPattern == 'heartbeat') {
      vibration = Int64List.fromList([0, 200, 200, 200, 500, 500]);
    } else {
       vibration = Int64List.fromList([0, 1000, 1000, 1000, 1000, 1000]);
    }

    // "Standard/morning" 같은 경로에서 raw 리소스 이름을 해석한다.
    // 해석 실패 시 사운드를 지정하지 않는다. 잘못된 이름으로 채널을 만들면
    // 채널 사운드가 고정되어 이후에도 무음으로 남는다.
    // 사운드를 끈 사용자는 채널 사운드가 고정된다는 제약을 고려해 전용 무음 채널을 쓴다.
    final rawSoundName = isSoundEnabled ? resolveRawSoundName(soundName) : null;
    final String channelId =
        isSoundEnabled ? buildAlarmChannelId(soundName) : buildSilentAlarmChannelId();

    final l10n = await _getL10n();

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      l10n.alarm,
      channelDescription: l10n.alarmChannelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.alarm,
      visibility: NotificationVisibility.public,
      fullScreenIntent: true, // 알람은 풀스크린 인텐트 사용
      icon: '@mipmap/launcher_icon',
      largeIcon: const DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      playSound: isSoundEnabled,
      sound: rawSoundName != null ? RawResourceAndroidNotificationSound(rawSoundName) : null,
      enableVibration: isVibrationEnabled,
      vibrationPattern: isVibrationEnabled ? vibration : null,
      autoCancel: false, // 알람은 사용자가 끌 때까지 유지
      ongoing: true,
      ticker: l10n.itsTimeToWakeUp,
      actions: [
         AndroidNotificationAction(
          'DISMISS',
          l10n.turnOffAlarmAction,
          showsUserInterface: true,
          cancelNotification: true,
        ),
      ]
    );

    const DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: _groupKey);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('notification action tapped with input: ${notificationResponse.input}');
  }
}
