import 'dart:ui';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init(
    Future<void> Function(String?)? onNotificationTap, {
    Future<void> Function(NotificationResponse)? onNotificationResponse,
    bool isBackground = false,
  }) async {
    tz.initializeTimeZones();

    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (e) {
      debugPrint('Failed to get local timezone: $e');
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (onNotificationResponse != null) {
          await onNotificationResponse(response);
        } else if (onNotificationTap != null) {
          // Backward compatibility
          await onNotificationTap(response.payload);
        }
      },
    );

    // Android 13 이상 알림 권한 요청 (백그라운드가 아닐 때만)
    if (!isBackground) {
      final platform = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (platform != null) {
        await platform.requestNotificationsPermission();
      }
    }
  }

  Future<void> _updateAndCacheTimezone() async {
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      
      // Hive에 저장 (앱 상태 박스가 열려있는지 확인)
      if (Hive.isBoxOpen('app_state')) {
        await Hive.box('app_state').put('local_timezone', timeZoneName);
      } else {
        final box = await Hive.openBox('app_state');
        await box.put('local_timezone', timeZoneName);
      }
      debugPrint('Timezone updated and cached: $timeZoneName');
    } catch (e) {
      debugPrint('Error updating timezone: $e');
    }
  }

  Future<void> _loadCachedTimezone() async {
    try {
      String? timeZoneName;
      if (Hive.isBoxOpen('app_state')) {
        timeZoneName = Hive.box('app_state').get('local_timezone');
      } else {
        final box = await Hive.openBox('app_state');
        timeZoneName = box.get('local_timezone');
      }

      if (timeZoneName != null) {
        tz.setLocalLocation(tz.getLocation(timeZoneName));
        debugPrint('Cached timezone loaded: $timeZoneName');
      } else {
        debugPrint('No cached timezone found. Using default.');
      }
    } catch (e) {
      debugPrint('Error loading cached timezone: $e');
    }
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
    // 소리 설정 (기본값: alarm_sound)
    String soundResource = (soundName != null && soundName != 'default') ? soundName : 'alarm_sound';
    if (soundResource.contains('.')) {
      soundResource = soundResource.split('.').first;
    }

    // 채널 ID를 소리/진동 설정에 따라 다르게 함 (설정 변경 시 새로운 채널이 생성되도록 함)
    // [수정] channelId 접두어를 v11으로 변경하여 기존 설정 강제 갱신
    final String channelId = 'supplement_channel_v11_${soundResource}_${isVibrationEnabled ? 'vibe' : 'novibe'}';

    debugPrint('[NotificationService] Showing notification. ID: $id, Channel: $channelId, Sound: $soundResource');

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '영양제 알림',
      channelDescription: '영양제 섭취를 위한 전체화면 알람 채널입니다.',
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.alarm,
      visibility: NotificationVisibility.public,
      fullScreenIntent: true, // 전체화면 인텐트 설정
      audioAttributesUsage: AudioAttributesUsage.alarm,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(soundResource),
      enableVibration: isVibrationEnabled,
      additionalFlags: Int32List.fromList(<int>[4]), // FLAG_INSISTENT
      autoCancel: false,
      ongoing: true,
      ticker: '영양제 알림',
      actions: <AndroidNotificationAction>[
        const AndroidNotificationAction(
          'TAKE_NOW',
          '지금 먹을게요',
          showsUserInterface: true,
          cancelNotification: true,
        ),
        const AndroidNotificationAction(
          'SNOOZE',
          '나중에 먹을게요',
          showsUserInterface: true,
          cancelNotification: true,
        ),
      ],
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
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
    switch (vibrationPattern) {
      case 'short':
        vibration = Int64List.fromList([0, 500, 500, 500, 500]);
        break;
      case 'long':
        vibration = Int64List.fromList([0, 2000, 2000, 2000, 2000]);
        break;
      case 'heartbeat':
        vibration = Int64List.fromList([0, 200, 100, 200, 1000, 200, 100, 200, 1000]);
        break;
      case 'sos':
        vibration = Int64List.fromList([0, 200, 100, 200, 100, 200, 500, 500, 200, 500, 200, 500, 500, 200, 100, 200, 100, 200]);
        break;
      case 'quick':
        vibration = Int64List.fromList([0, 100, 50, 100, 50, 100, 50, 100, 50, 100]);
        break;
      default:
        vibration = Int64List.fromList([0, 2000, 1000, 2000, 1000, 2000]);
    }

    // 소리 설정 (기본값: alarm_sound)
    // 확장자 제거 (Android 리소스 이름 규칙)
    String soundResource = (soundName != null && soundName != 'default') ? soundName : 'alarm_sound';
    if (soundResource.contains('.')) {
      soundResource = soundResource.split('.').first;
    }
    
    // 채널 ID를 소리/진동 설정에 따라 다르게 하여 설정을 적용 (Android 특성상 채널 설정 변경 불가하므로)
    // 알람 소리나 진동이 변경되면 새로운 채널을 생성해야 함
    // [수정] channelId 접두어를 v11으로 변경하여 기존 설정 강제 갱신
    final String channelId = 'fortune_alarm_channel_v11_${soundResource}_${isVibrationEnabled ? 'vibe' : 'novibe'}'; 
    
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      '포춘 알람', // 사용자에게 보이는 채널 이름
      channelDescription: 'Fortune Alarm의 알람 채널입니다.',
      importance: Importance.max,
      priority: Priority.max,
      sound: RawResourceAndroidNotificationSound(soundResource),
      playSound: true,
      enableVibration: isVibrationEnabled,
      vibrationPattern: isVibrationEnabled ? vibration : null,
      fullScreenIntent: true, // 핵심: 전체화면 인텐트
      category: AndroidNotificationCategory.alarm,
      visibility: NotificationVisibility.public,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      additionalFlags: Int32List.fromList(<int>[4]), // FLAG_INSISTENT
      autoCancel: false,
      ongoing: true,
      ticker: 'SnapAlarm',
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static const int _fortunePassReminderId = 910001;
  static const int _dailyFortuneNotificationId = 910002;

  Future<void> scheduleDailyFortuneNotification({
    required DateTime time,
    required String title,
    required String body,
  }) async {
    await cancelNotification(_dailyFortuneNotificationId);

    final now = DateTime.now();
    var scheduledDate = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const androidDetails = AndroidNotificationDetails(
      'daily_fortune_notification',
      'Today\'s Fortune',
      channelDescription: 'Daily reminder to check your fortune',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      _dailyFortuneNotificationId,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily at the same time
      payload: 'fortune_daily',
    );
  }

  Future<void> cancelDailyFortuneNotification() async {
    await cancelNotification(_dailyFortuneNotificationId);
  }

  Future<void> scheduleFortunePassExpiryReminder({required DateTime activeUntilLocal}) async {
    final now = DateTime.now();
    final remindAt = activeUntilLocal.subtract(const Duration(hours: 24));

    await cancelNotification(_fortunePassReminderId);
    if (!remindAt.isAfter(now.add(const Duration(minutes: 1)))) {
      return;
    }

    final lang = PlatformDispatcher.instance.locale.languageCode;
    final title = _fortunePassReminderTitle(lang);
    final body = _fortunePassReminderBody(lang);

    const androidDetails = AndroidNotificationDetails(
      'fortune_pass_reminder',
      'Fortune Pass',
      channelDescription: 'Fortune Pass reminder notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      _fortunePassReminderId,
      title,
      body,
      tz.TZDateTime.from(remindAt, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: null,
    );
  }

  String _fortunePassReminderTitle(String lang) {
    switch (lang) {
      case 'ko':
        return '포춘패스 만료 예정';
      case 'ja':
        return 'フォーチュンパスの期限が近いです';
      case 'zh':
        return 'Fortune Pass 即将到期';
      default:
        return 'Fortune Pass Expiring Soon';
    }
  }

  String _fortunePassReminderBody(String lang) {
    switch (lang) {
      case 'ko':
        return '내일 포춘패스가 만료됩니다. 혜택을 계속 받으시려면 갱신해주세요!';
      case 'ja':
        return '明日フォーチュンパスの期限が切れます。特典を継続するには更新してください！';
      case 'zh':
        return '您的 Fortune Pass 将于明天到期。请续订以继续享受优惠！';
      default:
        return 'Your Fortune Pass expires tomorrow. Renew now to keep your benefits!';
    }
  }

  // 커스텀 미션 알림
  Future<void> scheduleMissionNotification({
    required String missionId,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final int notificationId = missionId.hashCode;
    await cancelNotification(notificationId);

    final now = DateTime.now();
    var scheduledDate = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    const androidDetails = AndroidNotificationDetails(
      'mission_notification_channel',
      'Mission Reminder',
      channelDescription: 'Reminders for your custom missions',
      importance: Importance.high,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('alarm_sound'),
      playSound: true,
      enableVibration: true,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'MISSION_COMPLETE',
          '지금 할게요',
          showsUserInterface: true,
          cancelNotification: true,
        ),
        AndroidNotificationAction(
          'MISSION_LATER',
          '나중에 할게요',
          showsUserInterface: true,
          cancelNotification: true,
        ),
      ],
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
      payload: 'mission_$missionId',
    );
  }

  Future<void> cancelMissionNotification(String missionId) async {
    await cancelNotification(missionId.hashCode);
  }
}
