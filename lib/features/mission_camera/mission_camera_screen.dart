import 'dart:io';
import 'dart:async';
import 'dart:math' as math; // Random
import 'package:audioplayers/audioplayers.dart'; // AudioPlayer
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// SystemNavigator
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

// 프로젝트 경로에 맞춰 임포트 경로 확인 필요
import '../../core/constants/mission_type.dart';
import '../../data/models/alarm_model.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/camera_service.dart';
import '../../services/ml_service.dart';

// Removed unused import '../alarm/alarm_screen.dart'
import '../../services/notification_service.dart';
import '../../providers/alarm_list_provider.dart';
import '../../core/constants/positive_messages.dart';
import '../alarm/add_alarm_screen.dart';
import '../mission/widgets/mission_success_overlay.dart';
import '../mission_tap_sprint/tap_sprint_mission_screen.dart';

class MissionCameraScreen extends ConsumerStatefulWidget {
  final MissionType missionType;
  // final String? referenceImagePath;
  final List<String>? referenceImagePaths; // 여러 장의 기준 이미지
  final String? alarmId; // 알람 ID 추가

  const MissionCameraScreen({
    super.key,
    this.missionType = MissionType.none, // 기본값은 테스트용
    // this.referenceImagePath,
    this.referenceImagePaths,
    this.alarmId,
  });

  @override
  ConsumerState<MissionCameraScreen> createState() =>
      _MissionCameraScreenState();
}

class _MissionCameraScreenState extends ConsumerState<MissionCameraScreen> with WidgetsBindingObserver {
  final MLService _mlService = MLService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _timeTimer;
  Timer? _inactivityTimer;
  bool _isProcessing = false;
  File? _referenceImage;
  List<String> _targetLabels = [];
  String _debugLabelText = "";
  bool _isDisposed = false;
  bool _isTransitioning = false; // 미션 성공 후 전환 중인지 여부 (중복 실행 방지)
  bool _isInitialized = false; // 초기화 완료 여부
  
  // 카메라 관련
// Field removed as it was unused
  DateTime _lastComparisonTime = DateTime.now();
  bool _isMissionSuccess = false;
  bool _isSuccess = false; // Add for standardized overlay
  int _currentMissionIndex = 0;
  List<String> _activeImagePaths = [];
  DateTime? _fastStartUntil;
  bool _showSuccessOverlay = false; // 중간 미션 성공 시 오버레이 표시 여부
  double _currentSimilarity = 0.0; // 현재 인식 유사도 (UI 표시용, 스무딩 적용)
  
  bool _showCorrectAnimation = false;
  String _lastMessage = '';

  AlarmModel? _alarm;

  Future<AlarmModel?> _applyResolvedRandomBackground(AlarmModel? alarm) async {
    if (alarm == null) return null;
    if (alarm.backgroundPath != 'random_background') return alarm;
    try {
      final box = await Hive.openBox('app_state');
      final resolved = box.get('active_alarm_mission_background_path') as String?;
      if (resolved == null || resolved.isEmpty) return alarm;
      return alarm.copyWith(backgroundPath: resolved);
    } catch (_) {
      return alarm;
    }
  }

  @override
  void initState() {
    super.initState();
    
    // 미션 진입 시 알람 진동이 남아있을 수 있으므로 명시적으로 정지
    Vibration.cancel();
    
    WidgetsBinding.instance.addObserver(this);
    
    _isDisposed = false;
    _startInactivityTimer();
    _initializeAll();
  }

  Future<void> _initializeAll() async {
    try {
      // 1. UI 상태 즉시 업데이트 (로딩 표시)
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }

      // 2. 카메라 렌즈 방향 결정
      CameraLensDirection lensDirection = CameraLensDirection.back;
      if (widget.missionType == MissionType.cameraFace || 
          widget.missionType == MissionType.faceDetection) {
        lensDirection = CameraLensDirection.front;
      }

      // 3. 카메라 초기화 시작
      await ref.read(cameraControllerProvider.notifier).initializeCamera(lensDirection: lensDirection);
      
      if (_isDisposed) return;

      // 4. 나머지 무거운 작업들은 백그라운드에서 진행 (UI 스레드 양보)
      Future.microtask(() async {
        if (_isDisposed) return;

        await Future.wait([
          if (widget.alarmId != null) _loadAlarmInfo(),
          _mlService.initialize(),
        ]);

        if (_isDisposed) return;

        // 4. 이미지 리스트 구성
        if (widget.referenceImagePaths != null && widget.referenceImagePaths!.isNotEmpty) {
          _activeImagePaths = widget.referenceImagePaths!;
        }

        // 5. 기준 이미지 로드 및 분석 (지연 실행)
        if (_activeImagePaths.isNotEmpty) {
          await _loadCurrentReferenceImage();
        }

        if (_isDisposed) return;

        // 6. 분석 스트림 시작 (UI 안정화 후)
        _fastStartUntil = DateTime.now().add(const Duration(seconds: 3));
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!_isDisposed && mounted) {
            _startImageStream();
          }
        });
      });
    } catch (e) {
      debugPrint('Error during initialization: $e');
      if (mounted) {
        final l10n = AppLocalizations.of(context)!; 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.initError)),
        );
      }
    }
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted && !_isDisposed) {
        debugPrint('[MissionCameraScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();

    // 기존 타이머가 있으면 취소하여 중복 실행 및 메모리 누수 방지
    _timeTimer?.cancel();
    _timeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && !_isDisposed) {
        setState(() {});
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _loadAlarmInfo() async {
    try {
      final alarmBox = await Hive.openBox<AlarmModel>('alarms');
      final alarm = await _applyResolvedRandomBackground(alarmBox.get(widget.alarmId));
      if (mounted) {
        setState(() {
          _alarm = alarm;
        });
      }
    } catch (e) {
      debugPrint('Error loading alarm info: $e');
    }
  }

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    debugPrint("[MissionCamera] Analyzing reference image: ${_referenceImage!.path}");
    try {
      // 소리 재생
      if (alarm.isSoundEnabled) {
        if (alarm.ringtonePath == 'default') {
           // 기본 알람음은 시스템 설정을 따르거나 FlutterRingtonePlayer 사용
           // 점점 커지는 볼륨은 오디오 파일 재생 시에만 완벽 지원
           await FlutterRingtonePlayer().playAlarm(
             looping: true, 
             volume: alarm.isGradualVolume ? 0.1 : alarm.volume, 
             asAlarm: true
           );
        } else {
           String path = alarm.ringtonePath ?? 'alarm_sound';
           String ext = 'ogg';
           
           await _audioPlayer.setReleaseMode(ReleaseMode.loop);
           await _audioPlayer.setSource(AssetSource('sounds/$path.$ext'));
           
           double initialVolume = alarm.isGradualVolume ? 0.1 : alarm.volume;
           await _audioPlayer.setVolume(initialVolume);
           await _audioPlayer.resume();
           
           if (alarm.isGradualVolume) {
             _startVolumeFadeIn(alarm.volume);
           }
        }
      }

      // 진동 재생
      if (alarm.isVibrationEnabled && await Vibration.hasVibrator() == true) {
         _playVibration(alarm.vibrationPattern);
      }
    } catch (e) {
      debugPrint('Error playing alarm: $e');
    }
  }

  void _startVolumeFadeIn(double targetVolume) {
    _volumeTimer?.cancel();
    double currentVolume = 0.1;
    _volumeTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      currentVolume += 0.1;
      if (currentVolume >= targetVolume) {
        currentVolume = targetVolume;
        timer.cancel();
      }
      await _audioPlayer.setVolume(currentVolume);
    });
  }

  void _playVibration(String? pattern) {
    Vibration.cancel();
    // repeat: 0 (인덱스 0부터 반복)
    switch (pattern) {
      case 'short':
        Vibration.vibrate(pattern: [0, 500, 500, 500, 500], repeat: 0);
        break;
      case 'long':
        Vibration.vibrate(pattern: [0, 2000, 2000, 2000, 2000], repeat: 0);
        break;
      case 'heartbeat':
        Vibration.vibrate(pattern: [0, 200, 100, 200, 1000, 200, 100, 200, 1000], repeat: 0);
        break;
      case 'sos':
        Vibration.vibrate(pattern: [0, 200, 100, 200, 100, 200, 500, 500, 200, 500, 200, 500, 500, 200, 100, 200, 100, 200], repeat: 0);
        break;
      case 'quick':
        Vibration.vibrate(pattern: [0, 100, 50, 100, 50, 100, 50, 100, 50, 100], repeat: 0);
        break;
      default:
        Vibration.vibrate(pattern: [0, 1000, 1000], repeat: 0);
    }
  }

  Future<void> _stopAlarm() async {
    try {
      _volumeTimer?.cancel();
      // 1. UI에서 재생한 소리/진동 정지
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
      
      // 2. 백그라운드 알림(Notification) 제거 및 소리 정지
      if (widget.alarmId != null) {
        final stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
        await NotificationService().cancelNotification(stableId);
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  Future<void> _loadCurrentReferenceImage() async {
    if (_activeImagePaths.isEmpty || _currentMissionIndex >= _activeImagePaths.length) return;
    
    final l10n = AppLocalizations.of(context)!; 
    setState(() {
      _referenceImage = File(_activeImagePaths[_currentMissionIndex]);
      _debugLabelText = l10n.analyzingNextTarget;
    });
    
    await _analyzeReferenceImage();
  }

  Future<void> _analyzeReferenceImage() async {
    if (_referenceImage == null) return;
    try {
      final labels = await _mlService.extractLabelsFromImage(_referenceImage!);
      if (mounted) {
        setState(() {
          _targetLabels = labels;
          // 디버깅용: 타겟 라벨 표시
          debugPrint("[MissionCamera] Target Labels for Mission ${_currentMissionIndex + 1}: $_targetLabels");
        });
      }
    } catch (e) {
      debugPrint("Error analyzing reference image: $e");
    }
  }

  void _startImageStream() {
    final controller = ref.read(cameraControllerProvider);
    if (controller != null && controller.value.isInitialized) {
      controller.startImageStream((image) async {
        if (_isDisposed || _isProcessing || _isTransitioning) return;
        _isProcessing = true;

        try {
          if (!mounted) return;

          // 0.4초에 한 번만 비교 (반응 속도 향상 및 연속 검증 강화)
          if (DateTime.now().difference(_lastComparisonTime).inMilliseconds < 400) {
            return;
          }
          _lastComparisonTime = DateTime.now();

          // 3단계 검증 파이프라인 실행 (상세 결과 반환)
          final result = await _mlService.validateMissionLabels(
            cameraImage: image,
            camera: controller.description,
            missionType: widget.missionType,
            targetLabels: _targetLabels,
            referenceFile: _referenceImage, // 기준 이미지 전달 (색상 비교용)
            fastStart: _fastStartUntil != null && DateTime.now().isBefore(_fastStartUntil!),
          );

              if (mounted) {
                setState(() {
                  // EMA 스무딩 계수 조정 (0.5 -> 0.4)
                  // 사용자의 피드백에 따라 반응성을 0.4로 미세 조정
                  if (_currentSimilarity == 0.0 && result.similarity > 0) {
                     _currentSimilarity = result.similarity;
                  } else {
                     _currentSimilarity = (_currentSimilarity * 0.6) + (result.similarity * 0.4);
                  }

              // 무언가 인식되고 있다면 (유사도 30% 이상) 활동 중인 것으로 간주하여 타이머 리셋
              if (result.similarity > 0.3) {
                _resetInactivityTimer();
              }
            });
          }

          if (result.isSuccess) {
             if (mounted) {
               setState(() {
                 _debugLabelText = result.message;
               });
             }
             _handleSuccess(result.message);
          } else {
             // 실시간 디버깅 정보 업데이트
             if (mounted) {
               setState(() {
                 // 상세 실패 사유 표시 (유사도 등)
                 _debugLabelText = result.message;
                 
                 // 인식된 라벨이 있으면 추가 표시
                 if (result.detectedLabels.isNotEmpty) {
                   _debugLabelText += "\n[인식됨: ${result.detectedLabels.take(3).join(", ")}]";
                 }
               });
             }
          }

        } catch (e) {
          debugPrint('Error processing image: $e');
          if (mounted) {
            final l10n = AppLocalizations.of(context)!;
            setState(() {
              _debugLabelText = l10n.errorOccurredGeneric;
            });
          }
        } finally {
          _isProcessing = false;
        }
      });
    }
  }

  void _handleSuccess(String label) {
    if (_isDisposed || !mounted || _isTransitioning) return;

    // 성공 애니메이션 설정
    final random = math.Random();
    _lastMessage = PositiveMessages.messages[random.nextInt(PositiveMessages.messages.length)];

    setState(() {
      _showCorrectAnimation = true;
    });

    // 현재 미션 성공
    if (_currentMissionIndex < _activeImagePaths.length - 1) {
      // 중복 실행 방지 플래그 설정
      _isTransitioning = true;
      
      // 다음 미션이 남음
      final completedMissionNumber = _currentMissionIndex + 1;
      final totalMissions = _activeImagePaths.length;

      // 1. 성공 사운드 및 UI 피드백 (오버레이 표시)
      _playTransitionSound();
      
      final l10n = AppLocalizations.of(context)!;
      setState(() {
        _showSuccessOverlay = true; // 성공 오버레이 표시
        _debugLabelText = l10n.missionSuccessWithCount(completedMissionNumber, totalMissions);
      });

      // 2. 0.5초 지연 후 오버레이 숨기고 다음 미션 준비 (빠른 전환)
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_isDisposed || !mounted) return;

        // 3. 다음 미션으로 상태 변경
        setState(() {
          _showSuccessOverlay = false; // 오버레이 숨김
          _showCorrectAnimation = false; // 성공 애니메이션 숨김
          _currentSimilarity = 0.0; // 유사도 초기화
          _currentMissionIndex++;
        });
        
        // 4. 다음 기준 이미지 로드 (오버레이가 사라진 후 로드 시작)
        _loadCurrentReferenceImage();

        // 5. 전환 완료 플래그 해제 (즉시 해제하여 다음 촬영 가능하도록)
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            setState(() {
              _isTransitioning = false;
            });
          }
        });
      });
      
    } else {
      // 중복 실행 방지 플래그 설정 (최종 성공 시에도 적용)
      _isTransitioning = true;
      
      final totalMissions = _activeImagePaths.length;
      final l10n = AppLocalizations.of(context)!;
      
      setState(() {
        _isMissionSuccess = true;
        _isSuccess = true;
        _debugLabelText = l10n.missionMatchSuccess(totalMissions);
        _currentSimilarity = 1.0;
      });
      try {
        HapticFeedback.heavyImpact();
        _playSfx('ui_success.ogg');
        if (Platform.isAndroid || Platform.isIOS) {
          Vibration.vibrate(pattern: [0, 100, 50, 100]);
        }
      } catch (_) {}
    }
  }

  Future<void> _playSfx(String assetPath) async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource('sounds/$assetPath'));
      player.onPlayerComplete.listen((_) => player.dispose());
    } catch (e) {
      debugPrint('Error playing SFX: $e');
    }
  }

  Future<void> _playTransitionSound() async {
     try {
       HapticFeedback.mediumImpact();
       _playSfx('ui_click.ogg');
     } catch (e) {
       // Ignore
     }
  }

  String _getMissionGuideText() {
    final l10n = AppLocalizations.of(context)!;
    if (_activeImagePaths.isNotEmpty) {
      if (_targetLabels.isEmpty) {
        return l10n.missionAnalyzing(_currentMissionIndex + 1, _activeImagePaths.length);
      }
      return l10n.missionPointObject(_currentMissionIndex + 1, _activeImagePaths.length);
    }
    switch (widget.missionType) {
      case MissionType.cameraSink:
        return l10n.missionPointSink;
      case MissionType.cameraRefrigerator:
        return l10n.missionPointRefrigerator;
      case MissionType.cameraScale:
        return l10n.missionPointScale;
      case MissionType.cameraFace:
        return l10n.missionPointFace;
      case MissionType.cameraOther:
        return l10n.missionPointObjectGeneric;
      case MissionType.none:
        return l10n.missionRecognizeObject;
      default:
        return l10n.missionPerform;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 미션 성공 후 결과 다이얼로그(광고)가 뜬 상태에서 앱이 일시정지되어도 
      // 다이얼로그가 닫히지 않도록 _isSuccess 상태 체크 추가
      if (mounted && !_isDisposed && !_isSuccess) {
        debugPrint('[MissionCameraScreen] App paused - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _isDisposed = true;
    _volumeTimer?.cancel();
    _timeTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    
    // 카메라 리소스 해제
    ref.read(cameraControllerProvider.notifier).disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; 
    final controller = ref.watch(cameraControllerProvider);
    
    // 로딩 상태 정의
    final bool isLoading = !_isInitialized || controller == null || !controller.value.isInitialized;

    BoxDecoration bgDecoration;
    if (_alarm != null && _alarm!.backgroundPath != null) {
      if (_alarm!.backgroundPath!.startsWith('color:')) {
        int colorValue = int.parse(_alarm!.backgroundPath!.split(':')[1]);
        bgDecoration = BoxDecoration(color: Color(colorValue));
      } else {
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(_alarm!.backgroundPath!)),
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      bgDecoration = const BoxDecoration(color: Colors.black);
    }

    return Listener(
      onPointerDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final layoutSize = constraints.biggest;

            return Stack(
              fit: StackFit.expand,
              children: [
                // 0. Background (Alarm Theme)
                Container(decoration: bgDecoration),

                // 1. 카메라 프리뷰 또는 로딩 인디케이터
                if (isLoading)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                        const SizedBox(height: 20),
                        Text(
                          l10n.loading,
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                else
                  Positioned.fromRect(
                    rect: CameraOverlayPainter.getFrameRect(layoutSize),
                    child: RepaintBoundary(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: controller.value.previewSize?.height ?? layoutSize.width,
                              height: controller.value.previewSize?.width ?? layoutSize.height,
                              child: CameraPreview(controller),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // 2. 오버레이 (가이드 라인 등)
                if (!isLoading)
                  Positioned.fill(
                    child: RepaintBoundary(
                      child: CustomPaint(
                        painter: CameraOverlayPainter(
                          similarity: _currentSimilarity,
                        ),
                      ),
                    ),
                  ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  bottom: false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateFormat('M월 d일 EEEE', 'ko_KR').format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(blurRadius: 5, color: Colors.black45)],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('HH:mm').format(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(blurRadius: 5, color: Colors.black45)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              if (_referenceImage != null)
                ReferenceImageOverlay(
                  image: FileImage(_referenceImage!),
                  top: 170, // 시계 텍스트와 겹치지 않도록 위치 조정
                ),

              // [추가] 카메라 전환 버튼
              Positioned(
                top: 0,
                right: 100, // 비상 버튼 왼쪽 옆에 위치
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
                        ),
                        child: const Icon(Icons.flip_camera_ios_rounded, color: Colors.white, size: 24),
                      ),
                      onPressed: () async {
                        try {
                          // 스트림 중지 후 전환
                          final controller = ref.read(cameraControllerProvider);
                          if (controller != null && controller.value.isStreamingImages) {
                            await controller.stopImageStream();
                          }
                          
                          await ref.read(cameraControllerProvider.notifier).switchCamera();
                          
                          // 스트림 재시작
                          if (mounted && !_isDisposed && !_isTransitioning) {
                            _startImageStream();
                          }
                        } catch (e) {
                          debugPrint('Error switching camera: $e');
                        }
                      },
                    ),
                  ),
                ),
              ),

              // [추가] 비상 버튼 (카메라 인식 불가 시 대체 미션)
              Positioned(
                top: 0,
                right: 16,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () async {
                        if (widget.alarmId != null) {
                           // 카메라 일시 중지 (리소스 절약)
                           try {
                             final controller = ref.read(cameraControllerProvider);
                             if (controller != null && controller.value.isStreamingImages) {
                               await controller.stopImageStream();
                             }
                           } catch (e) {
                             debugPrint('Error pausing camera stream: $e');
                           }

                           if (!mounted) return;

                           // 대체 미션: 터치 연타 100회
                           final result = await Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (_) => TapSprintMissionScreen(
                                 alarmId: widget.alarmId,
                                 goalTaps: 100,
                               ),
                             ),
                           );

                           if (!mounted) return;

                           // 미션 성공 또는 타임아웃 시 현재 화면도 종료하여 알람 끄기
                           if (result == true || result == 'timeout') {
                             Navigator.of(context).pop(result);
                           }
                           // 만약 뒤로가기로 돌아왔다면 카메라는 다시 활성화되어야 함 (현재 구조상 자동 재개 여부는 provider 상태에 따름)
                           // 필요 시 여기서 재초기화 로직을 호출할 수 있음.
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5252), // 선명한 빨강
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.touch_app_rounded, color: Colors.white, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              l10n.escape,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 4. Bottom: Instruction & Debug Info
              Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      // Debug Info (Optional, keeping it for now but smaller)
                      if (_debugLabelText.isNotEmpty)
                        Text(
                          _debugLabelText,
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      const SizedBox(height: 10),
                      Text(
                        _referenceImage != null ? l10n.pointObjectClearly : _getMissionGuideText(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // 5. Back Button (Top Left) - Optional but good for UX
              Positioned(
                top: 0,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              // 6. 중간 성공 애니메이션 및 정보 오버레이 (최종 성공 시에는 MissionSuccessOverlay가 담당)
              if ((_showCorrectAnimation || _showSuccessOverlay) && !_isSuccess)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    child: Center(
                      child: AnimatedOpacity(
                        opacity: _showCorrectAnimation ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.elasticOut,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    _isMissionSuccess ? l10n.matchingSuccess : l10n.missionComplete,
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black54,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // 진행도 표시 (예: 1/2 성공!)
                                  if (!_isMissionSuccess && _activeImagePaths.isNotEmpty)
                                    Text(
                                      l10n.missionSuccessWithCount(_currentMissionIndex + 1, _activeImagePaths.length),
                                      style: const TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  
                                  if (_isMissionSuccess)
                                    Text(
                                      l10n.allMissionsComplete,
                                      style: const TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  if (_lastMessage.isNotEmpty) ...[
                                    const SizedBox(height: 24),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                      margin: const EdgeInsets.symmetric(horizontal: 40),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        _lastMessage,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                if (_isSuccess)
                  Positioned.fill(
                    child: MissionSuccessOverlay(
                      onFinish: () async {
                        if (mounted) {
                          await _stopAlarm();

                          try {
                            final controller = ref.read(cameraControllerProvider);
                            if (controller != null && controller.value.isStreamingImages) {
                              await controller.stopImageStream();
                            }
                          } catch (e) {
                            debugPrint('Error stopping camera stream on success: $e');
                          }

                          if (!mounted) return;

                          if (mounted) {
                            if (widget.alarmId != null) {
                              Navigator.of(context).pop(true);
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
                                (route) => false,
                              );
                            }
                          }
                        }
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CameraOverlayPainter extends CustomPainter {
  final double similarity;

  CameraOverlayPainter({this.similarity = 0.0});

  static Rect getFrameRect(Size size) {
    final frameWidth = size.width * 0.8;
    final frameHeight = size.height * 0.45;
    final frameLeft = (size.width - frameWidth) / 2;
    final frameTop = size.height * 0.3;
    return Rect.fromLTWH(frameLeft, frameTop, frameWidth, frameHeight);
  }
  static Offset getFrameCenter(Size size) {
    final rect = getFrameRect(size);
    return rect.center;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // 유사도에 따라 색상 보간 (빨강 -> 노랑 -> 초록)
    // 보정된 유사도(adjustedSimilarity)를 사용하여 낮은 점수에서도 노란색/초록색이 더 빨리 나타나게 함
    final adjustedSimilarity = math.pow(similarity, 0.7).toDouble(); // 0.7 제곱근을 취해 값의 상승폭을 키움
    
    Color frameColor;
    if (adjustedSimilarity < 0.4) {
      frameColor = Color.lerp(Colors.redAccent, Colors.orangeAccent, adjustedSimilarity * 2.5)!;
    } else if (adjustedSimilarity < 0.7) {
      frameColor = Color.lerp(Colors.orangeAccent, Colors.yellowAccent, (adjustedSimilarity - 0.4) * 3.3)!;
    } else if (adjustedSimilarity < 0.9) {
      frameColor = Color.lerp(Colors.yellowAccent, Colors.greenAccent, (adjustedSimilarity - 0.7) * 5.0)!;
    } else {
      frameColor = Colors.greenAccent;
    }

    final paint = Paint()
      ..color = frameColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0; // 테두리 두께 약간 증가

    final rect = getFrameRect(size);
    final radius = 20.0; // ClipRRect의 radius와 일치

    // 1. 완전한 둥근 사각형 테두리 그리기
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      paint,
    );

    // Center Crosshair (유지)
    final centerPaint = Paint()
      ..color = frameColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
      
    double crossSize = 20.0;
    double cx = rect.center.dx;
    double cy = rect.center.dy;

    canvas.drawLine(Offset(cx - crossSize, cy), Offset(cx + crossSize, cy), centerPaint);
    canvas.drawLine(Offset(cx, cy - crossSize), Offset(cx, cy + crossSize), centerPaint);

    // 하단 유사도 게이지 바 (Progress Bar)
    final barWidth = size.width * 0.7;
    final barHeight = 8.0;
    final barLeft = (size.width - barWidth) / 2;
    final barTop = rect.bottom + 30;

    // 배경 바
    final bgBarPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(barLeft, barTop, barWidth, barHeight),
        const Radius.circular(4.0)
      ), 
      bgBarPaint
    );

    // 진행 바
    final progressWidth = barWidth * similarity.clamp(0.0, 1.0);
    final progressBarPaint = Paint()
      ..color = frameColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
      
    if (progressWidth > 0) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(barLeft, barTop, progressWidth, barHeight),
          const Radius.circular(4.0)
        ), 
        progressBarPaint
      );
    }
    
  }

  @override
  bool shouldRepaint(covariant CameraOverlayPainter oldDelegate) {
    return oldDelegate.similarity != similarity;
  }
}

class ReferenceImageOverlay extends StatelessWidget {
  final ImageProvider? image;
  final double top;
  final double right;
  const ReferenceImageOverlay({
    super.key,
    this.image,
    this.top = 90,
    this.right = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        key: const Key('reference_image_box'),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 4)),
          ],
          image: image != null
              ? DecorationImage(image: image!, fit: BoxFit.cover)
              : null,
          color: image == null ? Colors.black26 : null,
        ),
      ),
    );
  }
}
