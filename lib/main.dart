import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 로컬라이제이션 패키지 임포트
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase Core 임포트
import 'firebase_options.dart'; // Firebase Options 임포트
import 'features/alarm/alarm_screen.dart';
import 'features/calendar/calendar_screen.dart';
import 'services/notification_service.dart';
import 'services/alarm_scheduler_service.dart';
import 'services/ad_service.dart'; // 광고 서비스 임포트
import 'data/models/alarm_model.dart';
import 'data/models/math_difficulty.dart';
import 'data/models/mission_model.dart';
import 'data/models/daily_mission_log.dart';
import 'core/constants/mission_type.dart';
import 'core/constants/mission_category.dart';

import 'features/mission/mission_tab.dart';
import 'features/settings/settings_screen.dart';
import 'features/fortune/fortune_screen.dart';
import 'features/fortune/fortune_pass_screen.dart';
import 'services/supplement_alarm_service.dart';
import 'services/fortune_push_service.dart';
import 'services/routine_alarm_service.dart';

import 'features/alarm/alarm_ringing_screen.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

import 'features/mission/supplement/supplement_mission_screen.dart';
import 'features/mission/water/water_mission_screen.dart';
import 'widgets/fortune_cookie_bar.dart';
import 'widgets/ad_widgets.dart'; // 광고 위젯 임포트
import 'widgets/optimization_bottom_sheet.dart';
import 'services/cookie_service.dart';
import 'services/sharing_service.dart';
import 'providers/weather_provider.dart';
import 'providers/mission_provider.dart';
import 'features/mission/supplement/models/supplement_settings.dart';
import 'features/mission/supplement/models/supplement_log.dart';
import 'providers/bottom_nav_provider.dart';
import 'core/navigation/app_navigator.dart';

final container = ProviderContainer();

// 백그라운드와 통신하기 위한 포트 이름
const String kAlarmPortName = 'alarm_notification_port';
const MethodChannel _foregroundChannel = MethodChannel('com.seriessnap.fortunealarm/foreground');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  SharingService.init();
  debugPrint('App starting: Initializing services...');
  

  
  // 시스템 UI 설정 (Edge-to-Edge 정책 준수 및 최신 안드로이드 대응)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // 투명하게 설정하여 Edge-to-Edge 활성화
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  
  try {
    // Hive 초기화를 위한 경로 설정
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    debugPrint('Step 1: Hive initialized');
    
    _registerAdapters();
    
    // 앱 상태 저장을 위한 박스 미리 열기
    await Hive.openBox('app_state');
    // 운세 박스 미리 열기 (로딩 속도 개선)
    await Hive.openBox('fortune');
    debugPrint('Step 2: App state & fortune boxes opened');

    // 날짜/시간 포맷팅 초기화
    await initializeDateFormatting();

    final notificationService = NotificationService();
    await notificationService.init(
      (id, title, body, payload) => _onNotificationTap(payload),
      onNotificationResponse: _onNotificationResponse
    );
    await FortunePushService.scheduleDailyPush();
    await AlarmSchedulerService.init();
    SupplementAlarmService.init(hivePath: appDocumentDir.path);
    await RoutineAlarmService.scheduleDailyReminders();
    debugPrint('Step 3: Basic services initialized');

    // Firebase 초기화는 앱 시작을 위해 필수적이므로 여기서 대기하되, 오류 발생 시 무시
    debugPrint('Step 4: Initializing Firebase...');
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ).timeout(const Duration(seconds: 5));
      debugPrint('Step 5: Firebase initialized');
    } catch (e) {
      debugPrint('Firebase initialization failed or timed out: $e');
    }

    // 6. 광고 서비스 초기화 (앱 실행 후 백그라운드에서 진행하도록 변경)
    final cookieService = CookieService();
    AdService.init();
    cookieService.hasActiveFortunePassSubscription().timeout(
      const Duration(milliseconds: 500),
      onTimeout: () => false,
    ).then((isSub) {
      AdService.isSubscriber = isSub;
    });

  } catch (e) {
    debugPrint('Initialization warning (ignored for startup): $e');
  }

  // 백그라운드 알람 수신을 위한 포트 등록
  _registerPort();

  // 권한 요청 제거 (MainScreen에서 처리하여 앱 시작 속도 개선)
  // await _requestPermissions();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const FortuneAlarmApp(),
    ),
  );

  // 앱이 완전히 종료된 상태에서 알림(풀스크린 인텐트 포함)으로 실행된 경우 감지
  try {
    final notificationService = NotificationService();
    final notificationAppLaunchDetails = 
        await notificationService.flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      final payload = notificationAppLaunchDetails!.notificationResponse?.payload;
      debugPrint('[Main] App launched via notification. Payload: $payload');
      if (payload != null) {
        try {
          final appStateBox = Hive.box('app_state');
          final lastPayload = appStateBox.get('last_handled_launch_payload');
          if (lastPayload == payload) {
            _initialNotificationHandled = true;
          } else {
            await appStateBox.put('last_handled_launch_payload', payload);
            _initialNotificationHandled = true;
            _onNotificationTap(payload);
          }
        } catch (_) {
          _initialNotificationHandled = true;
          _onNotificationTap(payload);
        }
      }
    }
  } catch (e) {
    debugPrint('[Main] Error checking notification launch details: $e');
  }
}

// 어댑터 등록 로직 분리
void _registerAdapters() {
  Hive.registerAdapter(MissionTypeAdapter());
  Hive.registerAdapter(AlarmModelAdapter());
  Hive.registerAdapter(MathDifficultyAdapter());
  Hive.registerAdapter(MissionModelAdapter());
  Hive.registerAdapter(DailyMissionLogAdapter());
  Hive.registerAdapter(MissionCategoryAdapter());
  
  if (!Hive.isAdapterRegistered(8)) Hive.registerAdapter(SupplementLogAdapter());
  if (!Hive.isAdapterRegistered(9)) Hive.registerAdapter(SupplementSettingsAdapter());
}

Future<void> _requestPermissions() async {
  if (Platform.isAndroid) {
    // 1. 알림 권한 (Android 13+)
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
    
    // 2. 정확한 알람 스케줄링 권한 (Android 12+)
    if (await Permission.scheduleExactAlarm.isDenied) {
      // 이 권한은 보통 설정 화면으로 이동해야 함
      // debugPrint('Schedule Exact Alarm permission is denied.');
    }
    
    // 3. 다른 앱 위에 그리기 권한 (백그라운드 실행을 위해 중요)
    if (await Permission.systemAlertWindow.isDenied) {
      await Permission.systemAlertWindow.request();
    }
    
    // 4. 배터리 최적화 무시 (알람 정시 실행을 위해 중요)
    if (await Permission.ignoreBatteryOptimizations.isDenied) {
      await Permission.ignoreBatteryOptimizations.request();
    }
  }
}

// ... (existing code)

Future<bool> _shouldSuppressAlarmHandling(String payload) async {
  try {
    // app_state 박스가 이미 열려 있으면 그대로 사용
    final Box box = Hive.isBoxOpen('app_state') 
        ? Hive.box('app_state') 
        : await Hive.openBox('app_state');
        
    final activeBaseId = box.get('active_alarm_mission_base_id') as String?;
    final startedAtStr = box.get('active_alarm_mission_started_at') as String?;
    if (activeBaseId == null || startedAtStr == null) return false;

    final startedAt = DateTime.tryParse(startedAtStr);
    if (startedAt == null) return false;

    final now = DateTime.now();
    if (now.difference(startedAt) >= const Duration(minutes: 2)) {
      await box.delete('active_alarm_mission_base_id');
      await box.delete('active_alarm_mission_started_at');
      return false;
    }

    String cleanPayload = payload.replaceAll('_snooze', '');
    if (cleanPayload.startsWith('loading_')) {
      // loading_ 접두사가 있으면 실제 ID로 변환 시도
      final stableId = int.tryParse(cleanPayload.replaceFirst('loading_', ''));
      if (stableId != null) {
         // stableId와 매칭되는 실제 알람 ID 찾기
         final alarmBox = Hive.isBoxOpen('alarms') ? Hive.box<AlarmModel>('alarms') : await Hive.openBox<AlarmModel>('alarms');
         for (final a in alarmBox.values) {
           if (AlarmSchedulerService.getStableId(a.id) == stableId) {
             cleanPayload = a.id;
             break;
           }
         }
      }
    }
    return cleanPayload == activeBaseId;
  } catch (_) {
    return false;
  }
}

// 알림 액션 응답 처리
Future<void> _onNotificationResponse(NotificationResponse response) async {
  debugPrint('Notification Response: ${response.actionId}, Payload: ${response.payload}');
  
  if (response.payload != null && response.payload!.startsWith('supplement_')) {
    _handleSupplementAction(response.actionId, response.payload);
    return;
  }

  if (response.payload != null && response.payload!.startsWith('water_')) {
    _handleWaterAction(response.actionId, response.payload);
    return;
  }

  if (response.payload != null && response.payload!.startsWith('mission_')) {
    _handleMissionAction(response.actionId, response.payload);
    return;
  }

  if (response.payload != null && await _shouldSuppressAlarmHandling(response.payload!)) {
    try {
      final p = response.payload!;
      if (p.startsWith('loading_')) {
        final stableId = int.tryParse(p.replaceFirst('loading_', ''));
        if (stableId != null) {
          await NotificationService().cancelNotification(stableId);
        }
      } else {
        await NotificationService().cancelNotification(AlarmSchedulerService.getStableId(p));
      }
    } catch (_) {}
    return;
  }
  
  // 기존 알람 처리
  await _onNotificationTap(response.payload);
}

Map<String, DateTime> _handledSupplementAlarms = {};
String? _lastHandledAlarmTapKey;
DateTime? _lastHandledAlarmTapAt;

void _handleMissionAction(String? actionId, String? payload) {
  if (payload == null) return;
  
  // payload format: mission_{id}
  final missionId = payload.replaceAll('mission_', '');
  debugPrint('[Main] Handling mission action: $actionId, missionId: $missionId');
  
  if (actionId == 'MISSION_COMPLETE') {
    // 미션 완료 처리
    container.read(missionProvider).setMissionCompleted(missionId, true);
  }
  
  // 앱이 열려있거나 열릴 예정이므로 미션 탭으로 이동
  // 약간의 딜레이를 주어 네비게이터가 준비되도록 함
  Future.delayed(const Duration(milliseconds: 500), () {
    // 1. 미션 탭으로 변경 (인덱스 3)
    container.read(bottomNavProvider.notifier).state = 3;
    
    // 2. 만약 현재 화면이 MainScreen이 아니라면 (예: 운세 화면 등), MainScreen으로 돌아옴
    final currentState = navigatorKey.currentState;
    if (currentState != null) {
      currentState.popUntil((route) => route.isFirst);
    }
  });
}

void _handleSupplementAction(String? actionId, String? payload) {
  if (payload == null) return;
  
  // 중복 처리 방지 (5초 이내 동일 페이로드 무시)
  final now = DateTime.now();
  if (_handledSupplementAlarms.containsKey(payload)) {
    final lastHandled = _handledSupplementAlarms[payload]!;
    if (now.difference(lastHandled).inSeconds < 5) {
      debugPrint('[Main] Supplement action already handled recently: $payload');
      return;
    }
  }
  _handledSupplementAlarms[payload] = now;

  // --- Hot Restart / 재실행 시 중복 처리 방지 ---
  // 앱이 핫리스타트되거나 재실행될 때, 이전 실행 의도(Intent)가 남아있어 
  // 알람 화면이 불필요하게 다시 뜨는 것을 방지합니다.
  if (Hive.isBoxOpen('app_state')) {
    final box = Hive.box('app_state');
    final key = 'last_handled_$payload';
    final lastHandledStr = box.get(key) as String?;
    
    if (lastHandledStr != null) {
      final lastHandledTime = DateTime.parse(lastHandledStr);
      // 최근 1분 내에 이미 처리된 알람이라면 무시 (핫리스타트는 보통 수 초 내에 발생)
      if (now.difference(lastHandledTime).inSeconds < 60) {
         debugPrint('[Main] Supplement action ignored by persistent throttle: $payload');
         return;
      }
    }
    // 처리 시각 업데이트
    box.put(key, now.toIso8601String());
  }

  // 앱이 실행된 상태이므로, Navigator를 통해 화면 이동 또는 다이얼로그 표시
  // 약간의 딜레이를 주어 앱 초기화 후 실행되도록 함
  Future.delayed(const Duration(milliseconds: 500), () {
    final currentState = navigatorKey.currentState;
    if (currentState == null) return;

    int? alarmId;
    if (payload.startsWith('supplement_')) {
      alarmId = int.tryParse(payload.split('_').last);
    }
    alarmId ??= 10000;

    if (actionId == 'TAKE_NOW') {
       // 바로 영양제 화면으로 이동해서 섭취 처리하도록 인자 전달
       // 알람 화면을 스택에서 제거하고 이동하도록 pushReplacementNamed 사용 고려
       currentState.pushNamedAndRemoveUntil('/supplement', (route) => route.isFirst, arguments: {'action': 'take_now'});
    } else {
       // SNOOZE 액션이거나 그냥 탭한 경우 모두 영양제 미션 화면으로 이동
       currentState.pushNamedAndRemoveUntil('/supplement', (route) => route.isFirst, arguments: {'action': 'show_ringing', 'payload': payload});
    }
  });
}

void _handleWaterAction(String? actionId, String? payload) {
  if (payload == null) return;
  
  debugPrint('[Main] Handling water action: $actionId, payload: $payload');
  
  Future.delayed(const Duration(milliseconds: 500), () {
    final currentState = navigatorKey.currentState;
    if (currentState == null) return;
    
    // 물 마시기 미션 화면으로 이동
    currentState.pushNamedAndRemoveUntil('/water', (route) => route.isFirst);
  });
}


bool _initialNotificationHandled = false;

void _registerPort() {
  final ReceivePort receiver = ReceivePort();
  IsolateNameServer.removePortNameMapping(kAlarmPortName);
  IsolateNameServer.registerPortWithName(receiver.sendPort, kAlarmPortName);

  receiver.listen((message) async {
    debugPrint('[MainIsolate] Received message from background: $message');
    // 이제 백그라운드에서 String ID를 직접 전달
    if (message is String) {
       if (await _shouldSuppressAlarmHandling(message)) {
         try {
           await NotificationService().cancelNotification(AlarmSchedulerService.getStableId(message));
         } catch (_) {}
         return;
       }
       await _onNotificationTap(message);
    }
  });
}

String? _buildAlarmTapThrottleKey(String payload) {
  if (payload.startsWith('supplement_') ||
      payload.startsWith('water_') ||
      payload.startsWith('mission_') ||
      payload.startsWith('fortune_daily') ||
      payload == 'routine_daily') {
    return null;
  }

  if (payload.startsWith('loading_')) {
    final stableId = int.tryParse(payload.replaceFirst('loading_', ''));
    if (stableId == null) return null;
    return 'stable_$stableId';
  }

  return 'stable_${AlarmSchedulerService.getStableId(payload)}';
}

Future<bool> _isDuplicateAlarmTap(String payload) async {
  final key = _buildAlarmTapThrottleKey(payload);
  if (key == null) return false;

  final now = DateTime.now();
  if (_lastHandledAlarmTapKey == key &&
      _lastHandledAlarmTapAt != null &&
      now.difference(_lastHandledAlarmTapAt!) < const Duration(seconds: 8)) {
    return true;
  }

  try {
    final box = Hive.isBoxOpen('app_state')
        ? Hive.box('app_state')
        : await Hive.openBox('app_state');
    final lastKey = box.get('last_handled_alarm_tap_key') as String?;
    final lastAtStr = box.get('last_handled_alarm_tap_at') as String?;
    if (lastKey == key && lastAtStr != null) {
      final lastAt = DateTime.tryParse(lastAtStr);
      if (lastAt != null && now.difference(lastAt) < const Duration(seconds: 8)) {
        _lastHandledAlarmTapKey = key;
        _lastHandledAlarmTapAt = now;
        return true;
      }
    }

    await box.put('last_handled_alarm_tap_key', key);
    await box.put('last_handled_alarm_tap_at', now.toIso8601String());
  } catch (_) {}

  _lastHandledAlarmTapKey = key;
  _lastHandledAlarmTapAt = now;
  return false;
}

  // 알림 클릭 시 실행될 콜백
Future<void> _onNotificationTap(String? payload) async {
  debugPrint('[Main] _onNotificationTap called with payload: $payload');
  if (payload == null || payload.isEmpty) return;

  if (await _isDuplicateAlarmTap(payload)) {
    debugPrint('[Main] Duplicate alarm tap ignored: $payload');
    return;
  }

  if (await _shouldSuppressAlarmHandling(payload)) {
    try {
      if (payload.startsWith('loading_')) {
        final stableId = int.tryParse(payload.replaceFirst('loading_', ''));
        if (stableId != null) {
          await NotificationService().cancelNotification(stableId);
        }
      } else {
        await NotificationService().cancelNotification(AlarmSchedulerService.getStableId(payload));
      }
    } catch (_) {}
    return;
  }

  // 백그라운드에서 앱을 포그라운드로 가져오기 시도 (Android 10+ 대응)
  try {
    debugPrint('[Main] Attempting to bring app to foreground via MethodChannel...');
    await _foregroundChannel.invokeMethod('bringToForeground');
    debugPrint('[Main] MethodChannel bringToForeground call finished.');
  } catch (e) {
    debugPrint('[Main] Failed to bring app to foreground: $e');
  }

  // 약간의 딜레이를 주어 Activity가 전면으로 전환될 시간을 줌
  await Future.delayed(const Duration(milliseconds: 500));

  // 영양제 알림 처리
  if (payload.startsWith('supplement_')) {
    _handleSupplementAction(null, payload);
    return;
  }

  // 물 마시기 알림 처리
  if (payload.startsWith('water_')) {
    _handleWaterAction(null, payload);
    return;
  }

  // 커스텀 미션 알림 처리
  if (payload.startsWith('mission_')) {
    _handleMissionAction(null, payload);
    return;
  }

  // 운세 알림 처리
  if (payload.startsWith('fortune_daily')) {
    // 운세 탭으로 이동 (인덱스 2)
    container.read(bottomNavProvider.notifier).state = 2;
    final currentState = navigatorKey.currentState;
    if (currentState != null) {
      // 만약 현재 화면이 MainScreen이 아니라면 (예: 다른 단독 화면), MainScreen으로 돌아옴
      currentState.popUntil((route) => route.isFirst);
    }
    return;
  }

  // 데일리 루틴 알림 처리
  if (payload == 'routine_daily') {
    // 미션 탭으로 이동 (인덱스 3)
    container.read(bottomNavProvider.notifier).state = 3;
    final currentState = navigatorKey.currentState;
    if (currentState != null) {
      currentState.popUntil((route) => route.isFirst);
    }
    return;
  }

  Box<AlarmModel> box;
  if (Hive.isBoxOpen('alarms')) {
    box = Hive.box<AlarmModel>('alarms');
  } else {
    box = await Hive.openBox<AlarmModel>('alarms');
  }

  AlarmModel? alarm;
  String actualPayload = payload;

  if (payload.startsWith('loading_')) {
    final stableIdStr = payload.replaceFirst('loading_', '');
    final stableId = int.tryParse(stableIdStr);
    debugPrint('[Main] Handling loading payload. Stable ID: $stableIdStr');

    if (stableId != null) {
      for (final a in box.values) {
        if (AlarmSchedulerService.getStableId(a.id) == stableId) {
          alarm = a;
          actualPayload = a.id;
          break;
        }
      }
    }
  } else {
    alarm = box.get(actualPayload);

    if (alarm == null) {
      debugPrint('[Main] Alarm with ID $actualPayload not found in Hive. Searching all values...');
      for (final a in box.values) {
        if (a.id == actualPayload) {
          alarm = a;
          break;
        }
      }
    }
  }

  if (alarm == null) {
    debugPrint('[Main] Alarm not found for payload $payload. Ignoring tap.');
    return;
  }

  // --- 버그 수정: 오래된 알림이 앱 실행 시 울리는 현상 방지 ---
  final now = DateTime.now();
  final isRepeating = alarm.repeatDays.any((d) => d);

  DateTime effectiveAlarmTime;
  if (isRepeating) {
    final repeatDays = alarm.repeatDays;
    final alarmTime = alarm.time;
    final int hour = alarmTime.hour;
    final int minute = alarmTime.minute;

    DateTime? lastScheduled;
    int currentWeekdayIndex = now.weekday - 1;

    for (int offset = 0; offset < 7; offset++) {
      final checkIndex = (currentWeekdayIndex - offset) % 7;
      final day = now.subtract(Duration(days: offset));
      if (repeatDays[checkIndex]) {
        final candidate = DateTime(day.year, day.month, day.day, hour, minute);
        if (!candidate.isAfter(now)) {
          lastScheduled = candidate;
          break;
        }
      }
    }

    effectiveAlarmTime = lastScheduled ?? DateTime(now.year, now.month, now.day, hour, minute);
  } else {
    effectiveAlarmTime = alarm.time;
  }

  final differenceInMinutes = now.difference(effectiveAlarmTime).inMinutes;

  // 알람 시간이 현재 시간보다 15분 이상 차이 나면 스킵 (기존 2분에서 15분으로 완화하여 안정성 확보)
  if (differenceInMinutes.abs() > 15) {
    debugPrint('Stale notification tapped. Difference: $differenceInMinutes minutes. Ignoring.');
    return;
  }

  // 화면 이동 시 Navigator가 준비될 때까지 대기
  int retryCount = 0;
  while (navigatorKey.currentState == null && retryCount < 10) {
    await Future.delayed(const Duration(milliseconds: 100));
    retryCount++;
  }

  if (navigatorKey.currentState != null) {
    debugPrint('[Main] Navigating to AlarmRingingScreen with ID: $actualPayload');
    navigatorKey.currentState?.pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AlarmRingingScreen(alarmId: actualPayload),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
      (route) => false,
    );
  } else {
    debugPrint('Navigator state is null even after retries. Cannot navigate to AlarmRingingScreen.');
  }
}

class FortuneAlarmApp extends ConsumerWidget {
  const FortuneAlarmApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final themeMode = themeState.themeMode;
    final primaryColor = themeState.primaryColor;
    final locale = ref.watch(localeProvider);
    
    return MaterialApp(
      navigatorKey: navigatorKey, // Navigator Key 등록
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      title: 'Fortune Alarm', // 기본 타이틀 (로컬라이제이션 로딩 전)
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor, // 선명한 오렌지색으로 변경
          brightness: Brightness.light,
        ).copyWith(
          surface: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: primaryColor.withOpacity(0.1),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF121212),
          elevation: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/supplement': (context) => const SupplementMissionScreen(),
        '/water': (context) => const WaterMissionScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  Future<bool> _tryRestoreAlarmOnSplash() async {
    try {
      if (Platform.isAndroid) {
        final notificationService = NotificationService();
        final androidPlugin = notificationService.flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
        if (androidPlugin != null) {
          final active = await androidPlugin.getActiveNotifications();
          for (final n in active) {
            final channelId = n.channelId;
            if (channelId == null) continue;
            if (!channelId.startsWith('alarm_channel_')) continue;
            if (n.id == 0) continue;
            _initialNotificationHandled = true;
            await _onNotificationTap('loading_${n.id}');
            return true;
          }
        }
      }
    } catch (_) {}

    try {
      final appStateBox = Hive.isBoxOpen('app_state') ? Hive.box('app_state') : await Hive.openBox('app_state');
      final payload = appStateBox.get('pending_alarm_payload');
      final setAtStr = appStateBox.get('pending_alarm_set_at');

      if (payload != null && setAtStr != null) {
        final setAt = DateTime.tryParse(setAtStr.toString());
        if (setAt != null) {
          final diff = DateTime.now().difference(setAt);
          if (diff <= const Duration(minutes: 30)) {
            _initialNotificationHandled = true;
            await _onNotificationTap(payload.toString());
            await appStateBox.delete('pending_alarm_payload');
            await appStateBox.delete('pending_alarm_set_at');
            await appStateBox.flush();
            return true;
          }
        }
      }
    } catch (_) {}

    try {
      final appStateBox = Hive.isBoxOpen('app_state') ? Hive.box('app_state') : await Hive.openBox('app_state');
      final alarmId = appStateBox.get('active_ringing_alarm_id') as String?;
      if (alarmId != null && alarmId.isNotEmpty) {
        _initialNotificationHandled = true;
        await _onNotificationTap(alarmId);
        return true;
      }
    } catch (_) {}

    return false;
  }

  void _navigateToMain() async {
    debugPrint('[Main] SplashScreen: Checking for pending alarm...');

    try {
      final restored = await _tryRestoreAlarmOnSplash();
      if (restored) {
        await Future.delayed(const Duration(milliseconds: 1500));
        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const MainScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
          (route) => false,
        );
        return;
      }
    } catch (_) {}
    
    // 1. 펜딩 알람이 있는지 확인
    bool hasPending = false;
    try {
      // app_state 박스가 이미 열려 있으면 그대로 사용 (닫고 다시 여는 과정에서 발생하는 프리징 방지)
      final Box appStateBox = Hive.isBoxOpen('app_state') 
          ? Hive.box('app_state') 
          : await Hive.openBox('app_state');
          
      hasPending = appStateBox.containsKey('pending_alarm_payload');
      
      if (hasPending) {
        debugPrint('[Main] SplashScreen: Pending alarm detected. Moving to MainScreen immediately.');
        // 펜딩 알람이 있으면 최소 대기 후 바로 이동하여 MainScreen의 initState가 처리하도록 함
        await Future.delayed(const Duration(milliseconds: 300));
      } else {
        // 일반적인 상황에서는 1.5초 대기
        await Future.delayed(const Duration(milliseconds: 1500));
      }
    } catch (e) {
      debugPrint('[Main] SplashScreen error checking pending: $e');
      await Future.delayed(const Duration(milliseconds: 1000));
    }

    if (mounted) {
      debugPrint('[Main] SplashScreen: Navigating to MainScreen...');
      // MainScreen을 새로운 루트로 설정하여 이동 (이전 스택 모두 제거)
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => MainScreen(isAlarmRestoreMode: hasPending),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 알람 복원 시 검은 배경을 위해 기본색 설정
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 배경 이미지 (네이티브 스플래시와 동일하게 설정)
          Image.asset(
            'assets/images/splash/splash_bg.webp',
            fit: BoxFit.cover,
          ),
          // 하단 텍스트
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "FORTUNE ALARM",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 4.0,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 60,
                  height: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainScreen extends ConsumerStatefulWidget {
  final bool isAlarmRestoreMode;
  const MainScreen({super.key, this.isAlarmRestoreMode = false});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> with WidgetsBindingObserver {
  final List<Widget> _screens = [
    const AlarmScreen(),
    const CalendarScreen(),
    const FortuneScreen(),
    const MissionTab(),
    const SettingsScreen(),
  ];

  bool _isStartupCheckDone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observer 등록
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // 초기 로드 시에도 강제 적용

    // 앱 시작 시 주요 광고 사전 로드 (최적화)
    AdService.preloadExitAd();
    AdService.preloadListAd();

    // 알람 체크 로직 실행 (완료 전까지 스플래시 UI 유지)
    _runStartupCheckSequence();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 앱으로 돌아왔을 때 상태바/내비바 모드 강제 적용 (딜레이 방지)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      
      // 날짜 변경 체크 및 미션 로그 갱신
      ref.read(missionProvider).checkDayChange();
    }
  }

  Future<void> _runStartupCheckSequence() async {
    try {
      await _runStartupAlarmChecks().timeout(
        const Duration(seconds: 6),
        onTimeout: () {},
      );
    } catch (_) {}
    if (mounted) {
      setState(() {
        _isStartupCheckDone = true;
      });
      // 초기화 완료 후 권한 체크 다이얼로그 표시 (필요한 경우)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkAndShowPermissions();
      });
    }
  }

  Future<void> _runStartupAlarmChecks() async {
    try {
      await _checkNotificationLaunch().timeout(
        const Duration(seconds: 2),
        onTimeout: () {},
      );
    } catch (_) {}
    try {
      await _checkPendingAlarmFlag().timeout(
        const Duration(seconds: 2),
        onTimeout: () {},
      );
    } catch (_) {}
    try {
      await _checkActiveAlarmNotificationRestore().timeout(
        const Duration(seconds: 2),
        onTimeout: () {},
      );
    } catch (_) {}
    try {
      await _checkActiveRingingRestore().timeout(
        const Duration(seconds: 2),
        onTimeout: () {},
      );
    } catch (_) {}
  }

  Future<void> _checkActiveAlarmNotificationRestore() async {
    if (_initialNotificationHandled) return;
    if (!Platform.isAndroid) return;

    try {
      final notificationService = NotificationService();
      final androidPlugin = notificationService.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin == null) return;

      final active = await androidPlugin.getActiveNotifications();
      if (active.isEmpty) return;

      ActiveNotification? alarmNoti;
      for (final n in active) {
        final channelId = n.channelId;
        if (channelId == null) continue;
        if (!channelId.startsWith('alarm_channel_')) continue;
        if (n.id == 0) continue;
        alarmNoti = n;
        break;
      }

      if (alarmNoti == null) return;
      final alarmNotiId = alarmNoti.id;

      _initialNotificationHandled = true;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        int retries = 0;
        // 최대 5초(100ms * 50회)까지만 대기하도록 수정하여 무한 루프 방지
        while (navigatorKey.currentState == null && retries < 50) {
          await Future.delayed(const Duration(milliseconds: 100));
          retries++;
        }
        
        if (navigatorKey.currentState != null) {
          await _onNotificationTap('loading_$alarmNotiId');
        } else {
          debugPrint('[Main] Navigator check FAILED after 5s. Moving to Main directly.');
        }
      });
    } catch (_) {}
  }

  Future<void> _checkAndShowPermissions() async {
    // iOS는 알림 권한만 요청하고 종료 (최적화 시트 불필요)
    if (!Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
      return;
    }

    // Android: 모든 권한을 최적화 시트에서 통합 관리
    // 1. 주요 권한 상태 확인
    final notificationStatus = await Permission.notification.status;
    final batteryStatus = await Permission.ignoreBatteryOptimizations.status;
    final systemAlertWindowStatus = await Permission.systemAlertWindow.status;
    final locationStatus = await Permission.location.status;
    
    // Android 12+ 정확한 알람 권한
    PermissionStatus? exactStatus;
    if (Platform.isAndroid) {
       exactStatus = await Permission.scheduleExactAlarm.status;
    }

    bool needsOptimization = false;

    // [수정] 위치 권한은 날씨용이므로 필수 최적화 대상에서 제외 (선택 사항)
    if (!notificationStatus.isGranted) needsOptimization = true;
    if (!batteryStatus.isGranted) needsOptimization = true;
    if (!systemAlertWindowStatus.isGranted) needsOptimization = true;
    if (exactStatus != null && !exactStatus.isGranted) needsOptimization = true;
    
    // 위치 권한이 없더라도 다른 필수 권한이 다 있으면 시트를 띄우지 않음
    // (사용자가 설정에서 나중에 켤 수 있음)

    if (needsOptimization && mounted) {
      showDialog(
        context: context,
        barrierDismissible: false, // 사용자가 강제로 닫을 수 없게 함 (선택 사항)
        builder: (context) => const OptimizationBottomSheet(),
      ).then((_) {
        // 설정 완료 후 날씨 정보 새로고침 (위치 권한 획득했을 수 있으므로)
        if (mounted) {
           ref.invalidate(weatherProvider);
        }
      });
    }
  }

  Future<void> _checkNotificationLaunch() async {
    if (_initialNotificationHandled) return;

    final notificationService = NotificationService();
    final details = await notificationService.flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails()
        .timeout(
          const Duration(seconds: 2),
          onTimeout: () => null,
        );
    
    if (details != null && details.didNotificationLaunchApp) {
      final response = details.notificationResponse;
      final payload = response?.payload;
      final actionId = response?.actionId;
      
      if (payload != null) {
        // --- 중복 처리 방지 로직 (이미 main에서 열린 box 사용) ---
        final appStateBox = Hive.box('app_state');
        final lastPayload = appStateBox.get('last_handled_launch_payload');
        
        if (lastPayload == payload) {
          debugPrint('[NotificationLaunch] Payload already handled: $payload. Skipping.');
          _initialNotificationHandled = true;
          return;
        }
        
        // 아직 처리 안 된 경우만 저장하고 진행
        await appStateBox.put('last_handled_launch_payload', payload);
        // ------------------------------

        _initialNotificationHandled = true;
        debugPrint('[NotificationLaunch] App launched by notification: $payload');
        
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (payload.startsWith('supplement_')) {
            _handleSupplementAction(actionId, payload);
          } else {
            _onNotificationTap(payload);
          }
        });
      }
    }
  }

  Future<void> _checkPendingAlarmFlag() async {
    debugPrint('[Main] _checkPendingAlarmFlag started.');
    try {
      final Box appStateBox = Hive.isBoxOpen('app_state')
          ? Hive.box('app_state')
          : await Hive.openBox('app_state');
      
      final payload = appStateBox.get('pending_alarm_payload');
      final setAtStr = appStateBox.get('pending_alarm_set_at');
      
      debugPrint('[Main] Pending check - Payload: $payload, SetAt: $setAtStr');
      
      if (payload == null || setAtStr == null) {
        debugPrint('[Main] No pending alarm flag found in Hive.');
        return;
      }
      
      final payloadStr = payload.toString();
      final setAt = DateTime.tryParse(setAtStr.toString());
      if (setAt == null) {
        debugPrint('[Main] Invalid setAt format: $setAtStr');
        return;
      }
      
      // 최근 10분 내 플래그만 유효하게 처리 (시간 범위를 30분으로 확장하여 더 안정적으로 포착)
      final now = DateTime.now();
      final diff = now.difference(setAt);
      debugPrint('[Main] Pending alarm age: ${diff.inSeconds}s (Now: $now, SetAt: $setAt)');
      
      if (diff > const Duration(minutes: 30)) {
        debugPrint('[Main] Pending alarm too old (>30m). Clearing.');
        await appStateBox.delete('pending_alarm_payload');
        await appStateBox.delete('pending_alarm_set_at');
        return;
      }

      // [Bug Fix] 알람이 이미 비활성화되었는지 확인 (사용자가 끄고 나갔는데 다시 울리는 문제 방지)
      try {
        final alarmsBox = Hive.isBoxOpen('alarms') 
            ? Hive.box<AlarmModel>('alarms') 
            : await Hive.openBox<AlarmModel>('alarms');
        
        // payloadStr이 실제 알람 ID인지, loading_ 접두사가 있는지 확인하여 처리
        String alarmId = payloadStr;
        if (payloadStr.startsWith('loading_')) {
          final stableId = int.tryParse(payloadStr.replaceFirst('loading_', ''));
          if (stableId != null) {
             for (final a in alarmsBox.values) {
               if (AlarmSchedulerService.getStableId(a.id) == stableId) {
                 alarmId = a.id;
                 break;
               }
             }
          }
        }
        
        final alarm = alarmsBox.get(alarmId);
        if (alarm != null && !alarm.isEnabled) {
           debugPrint('[Main] Pending alarm found ($alarmId) but it is DISABLED. Ignoring and clearing flag.');
           await appStateBox.delete('pending_alarm_payload');
           await appStateBox.delete('pending_alarm_set_at');
           await appStateBox.flush();
           return;
        }
      } catch (e) {
        debugPrint('[Main] Error checking alarm enabled status: $e');
        // 에러 발생 시 안전하게 진행 (알람을 울리는 쪽으로)
      }
      
      _initialNotificationHandled = true;
      debugPrint('[Main] VALID pending alarm found: $payloadStr. Navigating immediately...');

      // 처리 후 즉시 플래그 제거하여 중복 방지
      await appStateBox.delete('pending_alarm_payload');
      await appStateBox.delete('pending_alarm_set_at');
      await appStateBox.flush();
      
      // 네비게이터가 준비될 때까지 대기 (타임아웃 및 재시도 횟수 증가)
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        int retries = 0;
        while (navigatorKey.currentState == null && retries < 30) {
           debugPrint('[Main] Waiting for Navigator... ($retries/30)');
           await Future.delayed(const Duration(milliseconds: 100));
           retries++;
        }
        
        if (navigatorKey.currentState != null) {
           debugPrint('[Main] Navigator READY. Calling _onNotificationTap($payloadStr)');
           // _onNotificationTap 내부에서도 Navigator 대기 로직이 있으므로 안전함
           _onNotificationTap(payloadStr);
        } else {
           debugPrint('[Main] FATAL: NavigatorState is null after 3 seconds. Trying direct context navigation if possible...');
        }
      });
    } catch (e, stack) {
      debugPrint('[Main] Error in _checkPendingAlarmFlag: $e');
      debugPrint(stack.toString());
    }
  }

  Future<void> _checkActiveRingingRestore() async {
    if (_initialNotificationHandled) return;

    try {
      // app_state 박스가 이미 열려 있는지 확인하고 열려 있으면 그대로 사용
      final Box appStateBox = Hive.isBoxOpen('app_state') 
          ? Hive.box('app_state') 
          : await Hive.openBox('app_state');
          
      final alarmId = appStateBox.get('active_ringing_alarm_id') as String?;
      final setAtStr = appStateBox.get('active_ringing_set_at') as String?;

      if (alarmId == null || alarmId.isEmpty) return;

      bool shouldRestore = false;
      if (Platform.isAndroid) {
        try {
          if (await FlutterForegroundTask.isRunningService) {
            shouldRestore = true;
          }
        } catch (_) {}
      }

      if (!shouldRestore && setAtStr != null) {
        final setAt = DateTime.tryParse(setAtStr);
        if (setAt != null && DateTime.now().difference(setAt) <= const Duration(hours: 6)) {
          shouldRestore = true;
        }
      }

      if (!shouldRestore) return;

      try {
        final alarmsBox = Hive.isBoxOpen('alarms')
            ? Hive.box<AlarmModel>('alarms')
            : await Hive.openBox<AlarmModel>('alarms');
        final alarm = alarmsBox.get(alarmId);
        if (alarm == null || !alarm.isEnabled) {
          await appStateBox.delete('active_ringing_alarm_id');
          await appStateBox.delete('active_ringing_set_at');
          await appStateBox.flush();
          return;
        }
      } catch (_) {}

      _initialNotificationHandled = true;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        int retries = 0;
        while (navigatorKey.currentState == null && retries < 30) {
          await Future.delayed(const Duration(milliseconds: 100));
          retries++;
        }

        if (navigatorKey.currentState != null) {
          navigatorKey.currentState?.pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AlarmRingingScreen(alarmId: alarmId),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
            (route) => route.isFirst,
          );
        }
      });
    } catch (_) {}
  }

  Widget _buildNavItem(IconData icon, IconData selectedIcon, String label, int index) {
    final currentIndex = ref.watch(bottomNavProvider);
    final isSelected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 테마 설정에 따른 색상 적용
    final selectedColor = ref.watch(themeProvider).primaryColor; 
    final unselectedColor = isDark ? const Color(0xFF999999) : const Color(0xFF74777F);
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(bottomNavProvider.notifier).state = index;
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: isSelected ? 1.15 : 1.0),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Icon(
                      isSelected ? selectedIcon : icon,
                      size: 22,
                      color: isSelected ? selectedColor : unselectedColor,
                    ),
                  );
                },
              ),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? selectedColor : unselectedColor,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 초기화(알람 체크)가 완료되지 않았으면 스플래시 화면을 유지하여 목록 화면 노출 방지
    if (!_isStartupCheckDone) {
      // 알람 복원 모드라면 보라색 스플래시 대신 검은 화면을 보여줌 (자연스러운 전환)
      if (widget.isAlarmRestoreMode) {
        return const Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox.shrink(), // 인디케이터 제거: 검은 화면만 유지
        );
      }
      
      // [사용자 요청] 로딩 중일 때 SplashScreen 위젯을 그대로 반환하면 
      // SplashScreen의 initState에 있는 네비게이션 로직 때문에 무한 루프가 발생할 수 있음.
      // 따라서 SplashScreen의 UI만 가져와서 보여줌.
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/splash/splash_bg.webp',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Text(
                    "FORTUNE ALARM",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 4.0,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 60,
                    height: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final currentIndex = ref.watch(bottomNavProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 보상 다이얼로그 리스너
    ref.listen(missionProvider.select((s) => s.showRewardDialog), (previous, next) {
      if (next) {
        final rewardState = ref.read(missionProvider);
        final missions = rewardState.lastRewardMissions ?? 5;
        final cookies = rewardState.lastRewardCookies ?? 1;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Column(
              children: [
                const Text('🎉', style: TextStyle(fontSize: 40)),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.congratulations, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.missionRewardEarnedWithCount(missions, cookies),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.confirm, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
        ref.read(missionProvider).consumeRewardDialogEvent();
      }
    });

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final currentTab = ref.read(bottomNavProvider);
        debugPrint('[Main] onPopInvoked triggered: tab=$currentTab');

        // 1. 미션 탭(index 3)이고, 내부 네비게이터가 pop 가능한 상태인지 확인
        if (currentTab == 3) {
          final missionNavigator = missionNavigatorKey.currentState;
          // canPop()이 true이면 내부 화면이 스택에 있다는 뜻
          if (missionNavigator != null && missionNavigator.canPop()) {
            debugPrint('[Main] MissionTab: Popping internal route');
            missionNavigator.pop();
            return;
          }
          debugPrint('[Main] MissionTab: Root screen reached, showing exit dialog');
        }

        // 2. 그 외 모든 경우 (다른 탭이거나, 미션 탭의 루트 화면) -> 종료 다이얼로그 표시
        if (!context.mounted) return;

        final shouldExit = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) => AlertDialog(
            backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            surfaceTintColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              AppLocalizations.of(context)?.exitQuestion ?? 'Do you want to exit?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(false),
                            style: TextButton.styleFrom(
                              foregroundColor: isDark ? Colors.grey : Colors.black54,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                              ),
                            ),
                            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(true),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFFF97316),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)?.exitApp ?? 'Exit',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (!AdService.isSubscriber) ...[
                      const SizedBox(height: 20),
                      const ExitDialogAdWidget(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );

        if (shouldExit == true) {
          debugPrint('[Main] User confirmed exit. Calling SystemNavigator.pop()');
          SystemNavigator.pop();
        } else {
          debugPrint('[Main] Exit cancelled');
        }
      },
       child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: isDark ? const Color(0xFF121212) : Colors.white,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            // 상단 포춘쿠키 바
            SafeArea(
              bottom: false,
              child: const FortuneCookieBar(),
            ),
            
            const SizedBox(height: 4), // 모든 화면 공통 간격 4 적용
            
            // 타임 세일 배너
            StreamBuilder<int>(
              stream: CookieService().discountTimerStream,
              builder: (context, snapshot) {
                final remainingSeconds = snapshot.data ?? 0;
                if (remainingSeconds <= 0) return const SizedBox.shrink();
                
                final minutes = (remainingSeconds / 60).floor();
                final seconds = remainingSeconds % 60;
                final timeStr = "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";

                return GestureDetector(
                  onTap: () {
                    // 메인 화면의 _currentIndex를 2(포춘)로 변경하고,
                    // 포춘 화면에서 포춘패스 구독 탭(index 1)으로 이동하도록 처리
                    ref.read(bottomNavProvider.notifier).state = 2;
                    // 포춘패스 구독 화면(FortunePassScreen)으로 직접 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FortunePassScreen(initialTabIndex: 1),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF97316), Color(0xFFFB923C)],
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            timeStr,
                            style: const TextStyle(
                              color: Color(0xFFF97316),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.timeSaleCatchChance,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                );
              },
            ),
            
            Expanded(child: _screens[currentIndex]),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF121212) : Colors.white,
            border: Border(
              top: BorderSide(
                color: isDark ? Colors.white12 : const Color(0xFFE0E0E0),
                width: 0.5,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. 메뉴 아이콘 (메뉴바)
              SafeArea(
                top: false,
                bottom: false,
                child: Row(
                  children: [
                    _buildNavItem(Icons.alarm_outlined, Icons.alarm_rounded, AppLocalizations.of(context)!.alarm, 0),
                    _buildNavItem(Icons.calendar_month_outlined, Icons.calendar_month_rounded, AppLocalizations.of(context)!.calendar, 1),
                    _buildNavItem(Icons.auto_awesome_outlined, Icons.auto_awesome_rounded, AppLocalizations.of(context)!.fortune, 2),
                    _buildNavItem(Icons.task_alt_outlined, Icons.task_alt_rounded, AppLocalizations.of(context)!.mission, 3),
                    _buildNavItem(Icons.settings_outlined, Icons.settings_rounded, AppLocalizations.of(context)!.settings, 4),
                  ],
                ),
              ),
              
              // 2. 텍스트 광고 (메뉴바와 시스템 네비게이션바 사이)
              ListAdWidget(
                height: 35,
                margin: EdgeInsets.zero,
                backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
                factoryId: 'textBanner',
                showBorder: false,
                showShadow: false,
                borderRadius: 0,
                border: Border(
                  top: BorderSide(
                    color: isDark ? Colors.white12 : const Color(0xFFE0E0E0),
                    width: 0.5,
                  ),
                ),
              ),
              
              // 시스템 네비게이션바 영역 확보
              SafeArea(top: false, child: const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    ),
  );
  }
}
