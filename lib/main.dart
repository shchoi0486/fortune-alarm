import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 로컬라이제이션 패키지 임포트
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase Core 임포트
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

import 'features/alarm/alarm_ringing_screen.dart';
import 'providers/theme_provider.dart';
import 'l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

import 'features/mission/supplement/supplement_mission_screen.dart';
import 'widgets/fortune_cookie_bar.dart';
import 'widgets/ad_widgets.dart'; // 광고 위젯 임포트
import 'widgets/optimization_bottom_sheet.dart';
import 'services/cookie_service.dart';
import 'providers/weather_provider.dart';
import 'providers/mission_provider.dart';
import 'features/mission/supplement/models/supplement_settings.dart';
import 'features/mission/supplement/models/supplement_log.dart';
import 'providers/bottom_nav_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final container = ProviderContainer();

// 백그라운드와 통신하기 위한 포트 이름
const String kAlarmPortName = 'alarm_notification_port';
const MethodChannel _foregroundChannel = MethodChannel('com.seriessnap.fortunealarm/foreground');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('App starting: Initializing services...');
  
  // 시스템 내비게이션 바 색상 설정 (하얀색)
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  
  try {
    // Hive 초기화를 위한 경로 설정
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    debugPrint('Step 1: Hive initialized');
    
    _registerAdapters();
    
    // 앱 상태 저장을 위한 박스 미리 열기
    await Hive.openBox('app_state');
    debugPrint('Step 2: App state box opened');

    // 날짜/시간 포맷팅 초기화
    await initializeDateFormatting();

    final notificationService = NotificationService();
    await notificationService.init(
      _onNotificationTap, 
      onNotificationResponse: _onNotificationResponse
    );
    await AlarmSchedulerService.init();
    SupplementAlarmService.init(hivePath: appDocumentDir.path);
    debugPrint('Step 3: Basic services initialized');

    // Firebase 초기화는 앱 시작을 위해 필수적이므로 여기서 대기하되, 오류 발생 시 무시
    debugPrint('Step 4: Initializing Firebase...');
    try {
      await Firebase.initializeApp().timeout(const Duration(seconds: 5));
      debugPrint('Step 5: Firebase initialized');
    } catch (e) {
      debugPrint('Firebase initialization failed or timed out: $e');
    }

    // AdMob은 배경에서 초기화
    MobileAds.instance.initialize().then((_) {
      debugPrint('AdMob initialized in background');
      // 앱 시작 시 광고 사전 로드 시작
      AdService.preloadRewardedAd();
      AdService.preloadInterstitialAd();
      AdService.preloadExitAd();
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
    final box = await Hive.openBox('app_state');
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

    final payloadBaseId = payload.replaceAll('_snooze', '');
    return payloadBaseId == activeBaseId;
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

  if (response.payload != null && response.payload!.startsWith('mission_')) {
    _handleMissionAction(response.actionId, response.payload);
    return;
  }

  if (response.payload != null && await _shouldSuppressAlarmHandling(response.payload!)) {
    try {
      await NotificationService().cancelNotification(AlarmSchedulerService.getStableId(response.payload!));
    } catch (_) {}
    return;
  }
  
  // 기존 알람 처리
  await _onNotificationTap(response.payload);
}

Map<String, DateTime> _handledSupplementAlarms = {};

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

// 알림 클릭 시 실행될 콜백
Future<void> _onNotificationTap(String? payload) async {
  debugPrint('[Main] _onNotificationTap called with payload: $payload');
  if (payload == null || payload.isEmpty) return;

  if (await _shouldSuppressAlarmHandling(payload)) {
    try {
      await NotificationService().cancelNotification(AlarmSchedulerService.getStableId(payload));
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

  // 커스텀 미션 알림 처리
  if (payload.startsWith('mission_')) {
    _handleMissionAction(null, payload);
    return;
  }

  // 운세 알림 처리
  if (payload == 'fortune_daily') {
    final currentState = navigatorKey.currentState;
    if (currentState != null) {
      currentState.push(
        MaterialPageRoute(builder: (context) => const FortuneScreen()),
      );
    }
    return;
  }

  final box = await Hive.openBox<AlarmModel>('alarms');
  AlarmModel? alarm = box.get(payload);

  if (alarm == null) {
    debugPrint('[Main] Alarm with ID $payload not found in Hive. Searching all values...');
    // ID로 직접 못 찾을 경우 전체 탐색 (드문 경우 대비)
    for (var a in box.values) {
      if (a.id == payload) {
        alarm = a;
        break;
      }
    }
    
    if (alarm == null) {
      debugPrint('[Main] Alarm not found even after full search. Ignoring tap.');
      return;
    }
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
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => AlarmRingingScreen(alarmId: payload),
      ),
      (route) => route.isFirst,
    );
  } else {
    debugPrint('Navigator state is null even after retries. Cannot navigate to AlarmRingingScreen.');
  }
}

class FortuneAlarmApp extends ConsumerWidget {
  const FortuneAlarmApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    
    return MaterialApp(
      navigatorKey: navigatorKey, // Navigator Key 등록
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      title: 'Fortune Alarm', // 기본 타이틀 (로컬라이제이션 로딩 전)
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ).copyWith(
          surface: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.blueAccent.withOpacity(0.1),
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
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/supplement': (context) => const SupplementMissionScreen(),
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

  void _navigateToMain() async {
    // 앱 초기화 시간을 고려하여 1.5초 정도 대기 후 메인 화면으로 이동
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 배경 이미지 (네이티브 스플래시와 동일하게 설정)
          Image.asset(
            'assets/images/alarm_bg.png',
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
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final List<Widget> _screens = [
    const AlarmScreen(),
    const CalendarScreen(),
    const FortuneScreen(),
    const MissionTab(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // 앱 시작 시 주요 광고 사전 로드 (최적화)
    AdService.preloadExitAd();
    AdService.preloadListAd();

    _checkNotificationLaunch();
    // 권한 확인 및 최적화 시트 표시 (필요한 경우)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndShowPermissions();
    });
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

    // 배터리 최적화가 되어있지 않거나 (즉, 권한 거부 상태), 
    // 다른 앱 위에 표시 권한이 없거나,
    // 위치 권한이 없거나,
    // 정확한 알람 권한이 없는 경우 시트 표시
    if (!notificationStatus.isGranted) needsOptimization = true;
    if (!batteryStatus.isGranted) needsOptimization = true;
    if (!systemAlertWindowStatus.isGranted) needsOptimization = true;
    if (!locationStatus.isGranted) needsOptimization = true;
    if (exactStatus != null && !exactStatus.isGranted) needsOptimization = true;

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
    final details = await notificationService.flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    
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

  Widget _buildNavItem(IconData icon, IconData selectedIcon, String label, int index) {
    final currentIndex = ref.watch(bottomNavProvider);
    final isSelected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 이미지와 유사한 세련된 하늘색 계열
    final selectedColor = const Color(0xFF3894FF); 
    final unselectedColor = isDark ? const Color(0xFF999999) : const Color(0xFF74777F);
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(bottomNavProvider.notifier).state = index;
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.only(top: 6, bottom: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: isSelected ? 1.2 : 1.0),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Icon(
                      isSelected ? selectedIcon : icon,
                      size: 24,
                      color: isSelected ? selectedColor : unselectedColor,
                    ),
                  );
                },
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? selectedColor : unselectedColor,
                  letterSpacing: -0.3,
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

    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 상단: 제목
                  const Text(
                    '종료하시겠습니까?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  
                  // 중단: 버튼 영역 (사용자 요청: "취소 종료를 위에")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          style: TextButton.styleFrom(
                            foregroundColor: isDark ? Colors.grey : Colors.black54,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                            ),
                          ),
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('종료', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // 하단: 광고 영역 (꽉 차게)
                  const ExitDialogAdWidget(),
                ],
              ),
            ),
          ),
        );
        return shouldExit ?? false;
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
                        colors: [Colors.redAccent, Colors.orangeAccent],
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
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "50% 할인 기회를 꼭 잡으세요!",
                            style: TextStyle(
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
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF121212) : Colors.white,
                border: Border(
                  top: BorderSide(
                    color: isDark ? Colors.white12 : const Color(0xFFE0E0E0),
                    width: 0.5,
                  ),
                ),
              ),
              child: SafeArea(
                bottom: false, // 광고가 아래에 있으므로 SafeArea bottom은 false
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
          ),
          // 광고와 내비게이션 바 사이의 미세한 경계 및 여백
          Divider(
            height: 1,
            thickness: 0.5,
            color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
          ),
          // 시스템 내비게이션 바(뒤로가기 버튼 등) 위에 광고가 표시되도록 SafeArea 적용
          // top: false로 설정하여 위쪽 여백은 무시하고 아래쪽(시스템 바)만 고려
          // minimum 패딩을 추가하여 광고 dismiss 창 등이 내비게이션 바를 침범하지 않도록 함
          const SafeArea(
            top: false,
            bottom: true,
            minimum: EdgeInsets.only(bottom: 4.0),
            child: BottomBannerAd(),
          ),
          ],
        ),
      ),
    ),
  );
  }
}
