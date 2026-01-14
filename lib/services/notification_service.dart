import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // 알림 그룹화를 위한 키
  static const String _groupKey = 'com.snapalarm.NOTIFICATION_GROUP';
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
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
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
    const String channelId = 'supplement_channel_v1';

    // 액션 버튼 정의
    final List<AndroidNotificationAction> actions = [
      const AndroidNotificationAction(
        'TAKE_NOW',
        '지금 먹기',
        showsUserInterface: true,
        cancelNotification: true,
      ),
      const AndroidNotificationAction(
        'SNOOZE',
        '나중에',
        showsUserInterface: true,
        cancelNotification: true,
      ),
    ];

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '영양제 알림',
      channelDescription: '영양제 섭취 알림 채널입니다.',
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
      ticker: '영양제 알림',
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
    await _showAndroidSummary(channelId, '영양제 알림');
  }

  // Android 그룹 요약 알림 발송용 프라이빗 메서드
  Future<void> _showAndroidSummary(String channelId, String channelName) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.max,
      priority: Priority.max,
      groupKey: _groupKey,
      setAsGroupSummary: true,
      autoCancel: true,
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      _summaryId,
      '',
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
    const String channelId = 'water_channel_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '물 마시기 알림',
      channelDescription: '물 마시기 습관을 위한 알림 채널입니다.',
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
      ticker: '물 마시기 알림',
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

    await _showAndroidSummary(channelId, '물 마시기 알림');
  }

  // 데일리 루틴 알림 전용
  Future<void> showRoutineNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const String channelId = 'routine_channel_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '데일리 루틴 알림',
      channelDescription: '오늘의 미션을 확인하고 습관을 만드는 알림 채널입니다.',
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      playSound: true,
      autoCancel: true,
      ongoing: false,
      ticker: '데일리 루틴 알림',
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

    await _showAndroidSummary(channelId, '데일리 루틴 알림');
  }

  // 일반/커스텀 미션 알림 스케줄링
  Future<void> scheduleMissionNotification({
    required String missionId,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final int id = _getStableId(missionId);
    
    const String channelId = 'mission_channel_v1';
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '미션 알림',
      channelDescription: '일반 미션 수행을 위한 알림 채널입니다.',
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

    // 스케줄링된 알림의 경우 Android 요약 알림을 즉시 발송하면 비어있는 그룹이 보일 수 있으므로 
    // 여기서는 groupKey 설정만으로 충분하거나, 필요시 요약 알림도 함께 스케줄링해야 합니다.
    // 대부분의 경우 groupKey만으로도 같은 채널 내에서 그룹화가 잘 작동합니다.
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
    const String channelId = 'fortune_channel_v1';
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '운세 알림',
      channelDescription: '매일 아침 운세 확인을 위한 알림 채널입니다.',
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
  }

  // 기본 운세 알림 스케줄링 (앱 초기화 시 사용)
  Future<void> scheduleDefaultFortuneNotifications() async {
    final box = await Hive.openBox('alarm_settings');
    final bool isFirstRun = !box.containsKey('daily_fortune_enabled');
    
    if (isFirstRun) {
      // 첫 실행 시 기본값 저장 및 스케줄링
      await box.put('daily_fortune_enabled', true);
      await box.put('daily_fortune_time1', '08:00');
      await box.put('daily_fortune_time2', '13:30');
    }

    final enabled = box.get('daily_fortune_enabled', defaultValue: true);
    if (enabled) {
      final time1Str = box.get('daily_fortune_time1', defaultValue: '08:00');
      var time2Str = box.get('daily_fortune_time2', defaultValue: '13:30');
      
      // 13:00인 경우 13:30으로 자동 업데이트 (사용자 요청 사항 반영)
      if (time2Str == '13:00') {
        time2Str = '13:30';
        await box.put('daily_fortune_time2', time2Str);
      }
      
      final parts1 = time1Str.split(':');
      final time1 = TimeOfDay(hour: int.parse(parts1[0]), minute: int.parse(parts1[1]));
      
      final parts2 = time2Str.split(':');
      final time2 = TimeOfDay(hour: int.parse(parts2[0]), minute: int.parse(parts2[1]));

      await scheduleDailyFortuneNotification(
        id: 40001,
        time: time1,
        title: "오늘의 운세",
        body: "오늘의 운세를 확인하고 활기차게 시작해 보세요!",
      );
      
      await scheduleDailyFortuneNotification(
        id: 40002,
        time: time2,
        title: "오늘의 운세",
        body: "오후의 운세는 어떨까요? 지금 바로 확인해 보세요!",
      );
    }
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

    const String channelId = 'subscription_channel_v1';
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '구독 알림',
      channelDescription: '포춘 패스 만료 및 구독 관련 알림 채널입니다.',
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
      '포춘 패스 오늘 만료',
      '오늘 포춘 패스 멤버십이 만료됩니다. 혜택을 계속 누리시려면 갱신해 보세요!',
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
  }) async {
    final normalizedSoundName =
        (soundName == null || soundName.isEmpty || soundName == 'default')
            ? null
            : soundName;
    
    final String channelId =
        'alarm_channel_${normalizedSoundName ?? 'default'}_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '알람',
      importance: Importance.max,
      priority: Priority.max,
      fullScreenIntent: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      playSound: true,
      sound: normalizedSoundName != null
          ? RawResourceAndroidNotificationSound(normalizedSoundName)
          : null,
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
      sound: normalizedSoundName != null ? '$normalizedSoundName.caf' : null,
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
      matchDateTimeComponents: DateTimeComponents.time,
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
    String? soundName, // 'morning', 'birds', 'waves' etc.
    String? vibrationPattern, // 'short', 'long', 'heartbeat'
    bool isGradualVolume = false,
    bool isVibrationEnabled = true,
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

    final normalizedSoundName =
        (soundName == null || soundName.isEmpty || soundName == 'default')
            ? null
            : soundName;
    final String channelId =
        'alarm_channel_${normalizedSoundName ?? 'default'}_v1';

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '알람',
      channelDescription: '기상 및 미션 수행을 위한 알람 채널입니다.',
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.alarm,
      visibility: NotificationVisibility.public,
      fullScreenIntent: true, // 알람은 풀스크린 인텐트 사용
      icon: '@mipmap/launcher_icon',
      largeIcon: const DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      playSound: true,
      sound: normalizedSoundName != null
          ? RawResourceAndroidNotificationSound(normalizedSoundName)
          : null,
      enableVibration: isVibrationEnabled,
      vibrationPattern: isVibrationEnabled ? vibration : null,
      autoCancel: false, // 알람은 사용자가 끌 때까지 유지
      ongoing: true,
      ticker: '알람이 울립니다!',
      actions: [
         const AndroidNotificationAction(
          'DISMISS',
          '알람 끄기',
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
