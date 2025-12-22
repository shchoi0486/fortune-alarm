import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init(Future<void> Function(String?)? onNotificationTap, {Future<void> Function(NotificationResponse)? onNotificationResponse}) async {
    tz.initializeTimeZones();

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

    // 앱이 알림으로 인해 실행되었는지 확인 (종료된 상태에서 실행 시)
    // main.dart의 _checkNotificationLaunch에서 중복 처리 방지와 함께 수행하므로 
    // 여기서는 자동 실행 로직을 제거합니다.
    /*
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      final response = notificationAppLaunchDetails!.notificationResponse;
      if (response != null) {
        debugPrint('[NotificationService] App launched via notification: ${response.payload}');
        // 약간의 딜레이 후 처리 (앱 초기화 대기)
        Future.delayed(const Duration(milliseconds: 500), () async {
          if (onNotificationResponse != null) {
            await onNotificationResponse(response);
          } else if (onNotificationTap != null) {
            await onNotificationTap(response.payload);
          }
        });
      }
    }
    */
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
    // [수정] channelId 접두어를 v10으로 변경하여 기존 설정 강제 갱신
    final String channelId = 'supplement_channel_v10_${soundResource}_${isVibrationEnabled ? 'vibe' : 'novibe'}';

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
    // [수정] channelId 접두어를 v10으로 변경하여 기존 설정 강제 갱신
    final String channelId = 'fortune_alarm_channel_v10_${soundResource}_${isVibrationEnabled ? 'vibe' : 'novibe'}'; 
    
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
}
