import 'dart:io';
import 'dart:async';
import 'dart:math'; // Random
import 'package:audioplayers/audioplayers.dart'; // AudioPlayer
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// SystemNavigator
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

class _MissionCameraScreenState extends ConsumerState<MissionCameraScreen> {
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
  
  // 카메라 관련
// Field removed as it was unused
  DateTime _lastComparisonTime = DateTime.now();
  bool _isMissionSuccess = false;
  int _currentMissionIndex = 0;
  List<String> _activeImagePaths = [];
  DateTime? _fastStartUntil;
  bool _showSuccessOverlay = false; // 중간 미션 성공 시 오버레이 표시 여부
  double _currentSimilarity = 0.0; // 현재 인식 유사도 (UI 표시용, 스무딩 적용)
  
  bool _showCorrectAnimation = false;
  String _lastMessage = '';

  AlarmModel? _alarm;

  @override
  void initState() {
    super.initState();
    _isDisposed = false;
    _startInactivityTimer();

    // 알람 정보 로드
    if (widget.alarmId != null) {
      _loadAlarmInfo();
    }

    // 사용할 이미지 리스트 구성
    if (widget.referenceImagePaths != null && widget.referenceImagePaths!.isNotEmpty) {
      _activeImagePaths = widget.referenceImagePaths!;
    }

    // 첫 번째 기준 이미지 로드 및 라벨 분석
    if (_activeImagePaths.isNotEmpty) {
      _loadCurrentReferenceImage();
    }

    Future.microtask(() {
      _mlService.initialize().then((_) {
        return ref.read(cameraControllerProvider.notifier).initializeCamera();
      }).then((_) {
        // 기준 이미지가 있더라도 자동 스트림 시작 (실시간 비교를 위해)
        _fastStartUntil = DateTime.now().add(const Duration(seconds: 2));
        _startImageStream();
      });
    });
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

    // 미션 화면 진입 시 알람 소리를 직접 제어하지 않고 
    // AlarmRingingScreen에서 일시 정지된 상태로 진입함.

    _timeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _loadAlarmInfo() async {
    try {
      final alarmBox = await Hive.openBox<AlarmModel>('alarms');
      final alarm = alarmBox.get(widget.alarmId);
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
    
    setState(() {
      _referenceImage = File(_activeImagePaths[_currentMissionIndex]);
      _debugLabelText = "다음 목표 분석 중...";
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
              // EMA 스무딩 적용 (alpha = 0.3)
              // 급격한 변화를 줄이고 부드럽게 게이지가 차오르도록 함
              if (_currentSimilarity == 0.0 && result.similarity > 0) {
                 _currentSimilarity = result.similarity; // 첫 인식 시 바로 적용
              } else {
                 _currentSimilarity = (_currentSimilarity * 0.7) + (result.similarity * 0.3);
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
            setState(() {
              _debugLabelText = "오류 발생";
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
    final random = Random();
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
      
      setState(() {
        _showSuccessOverlay = true; // 성공 오버레이 표시
        _debugLabelText = "$completedMissionNumber/$totalMissions 성공!";
      });

      // 2. 2.5초 지연 후 다음 미션 시작
      Future.delayed(const Duration(milliseconds: 2500), () {
        if (_isDisposed || !mounted) return;

        // 3. 다음 미션으로 상태 변경
        setState(() {
          _showSuccessOverlay = false; // 오버레이 숨김
          _currentSimilarity = 0.0; // 유사도 초기화
          _currentMissionIndex++;
          _isTransitioning = false; // 전환 완료 후 플래그 해제
        });
        
        // 4. 다음 기준 이미지 로드
        _loadCurrentReferenceImage();
      });
      
    } else {
      // 중복 실행 방지 플래그 설정 (최종 성공 시에도 적용)
      _isTransitioning = true;
      
      final totalMissions = _activeImagePaths.length;
      
      setState(() {
        _isMissionSuccess = true;
        _debugLabelText = "$totalMissions/$totalMissions 성공! 매칭 성공!";
        _currentSimilarity = 1.0;
        _showSuccessOverlay = true;
      });

      Future.delayed(const Duration(milliseconds: 2000), () async {
        if (mounted) {
          // 성공 애니메이션/오버레이를 충분히 보여준 후 알람 정지
          _stopAlarm();
          
          // [추가] 사용자 경험 개선: 스누즈 안내
          if (widget.alarmId != null && _alarm != null) {
             final bool hasMoreSnooze = _alarm!.snoozeInterval > 0 && 
                                      (_alarm!.remainingSnoozeCount > 1 || 
                                      (!_alarm!.id.endsWith('_snooze') && _alarm!.maxSnoozeCount > 0));
             
             if (hasMoreSnooze) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('미션 성공! 하지만 설정에 따라 ${_alarm!.snoozeInterval}분 뒤 다시 울립니다.'),
                    duration: const Duration(seconds: 3),
                  ),
                );
             }
          }

          // ref.read(alarmListProvider.notifier).completeAlarm(widget.alarmId!); // <--- AlarmRingingScreen에서 처리하도록 제거

          try {
            // 카메라 스트림 명시적 중지 (크래시 방지)
            final controller = ref.read(cameraControllerProvider);
            if (controller != null && controller.value.isStreamingImages) {
              await controller.stopImageStream();
            }
          } catch (e) {
            debugPrint('Error stopping camera stream on success: $e');
          }

          if (!mounted) return;
          
          // 알람 해제 모드인 경우 성공 화면으로 이동
          if (widget.alarmId != null) {
            debugPrint('[MissionCameraScreen] Mission success - popping to AlarmRingingScreen');
            // 미션 성공 결과를 AlarmRingingScreen으로 전달
            Navigator.of(context).pop(true);
          } else {
            // 미션 테스트/설정 모드인 경우 알람 설정 화면으로 이동
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
              (route) => false,
            );
          }
        }
      });
    }
  }

  Future<void> _playTransitionSound() async {
     try {
       await FlutterRingtonePlayer().playNotification();
     } catch (e) {
       // Ignore
     }
  }

  String _getMissionGuideText() {
    if (_activeImagePaths.isNotEmpty) {
      if (_targetLabels.isEmpty) {
        return "미션 ${_currentMissionIndex + 1}/${_activeImagePaths.length} 분석 중...";
      }
      return "미션 ${_currentMissionIndex + 1}/${_activeImagePaths.length}: 가이드 속 물체를 화면에 비춰주세요.";
    }
    switch (widget.missionType) {
      case MissionType.cameraSink:
        return "세면대를 비춰주세요.";
      case MissionType.cameraRefrigerator:
        return "냉장고를 비춰주세요.";
      case MissionType.cameraScale:
        return "체중계를 비춰주세요.";
      case MissionType.cameraFace:
        return "얼굴을 화면에 비춰주세요.";
      case MissionType.cameraOther:
        return "지정된 물체를 비춰주세요.";
      case MissionType.none:
        return "사물을 인식시켜주세요.";
      default:
        return "미션을 수행해주세요.";
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _volumeTimer?.cancel();
    _timeTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    final controller = ref.read(cameraControllerProvider);
    if (controller != null && controller.value.isStreamingImages) {
      controller.stopImageStream();
    }
    _stopAlarm(); // 화면 나갈 때 알람/진동 정지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(cameraControllerProvider);
// unused screenSize removed

    // 알람 데이터/시간 포맷은 현재 화면 표시에서 사용하지 않음

    if (controller == null || !controller.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

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

              // 1. 카메라 프리뷰 (지정된 프레임 안에만 보이도록 ClipRRect 사용)
              Positioned.fromRect(
                rect: CameraOverlayPainter.getFrameRect(layoutSize),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // 프레임 모서리를 둥글게
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

              Positioned.fill(
                child: CustomPaint(
                  painter: CameraOverlayPainter(
                    similarity: _currentSimilarity, // 유사도 전달
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
                  label: _targetLabels.isNotEmpty ? _targetLabels.first : "목표물",
                  top: 170, // 시계 텍스트와 겹치지 않도록 위치 조정
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
                        _referenceImage != null ? "목표물이 잘 보이게 찍으세요" : _getMissionGuideText(),
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

              // 6. Success Overlay (중간 미션 성공 및 최종 성공 통합)
              if (_isMissionSuccess || _showSuccessOverlay)
                Container(
                  color: Colors.black.withValues(alpha: 0.7),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.greenAccent,
                          size: 120,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _isMissionSuccess 
                              ? "매칭 성공!" 
                              : "${_currentMissionIndex + 1}/${_activeImagePaths.length} 성공!",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (!_isMissionSuccess && _currentMissionIndex < _activeImagePaths.length - 1)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "다음 미션: ${_currentMissionIndex + 2} / ${_activeImagePaths.length}",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        if (_isMissionSuccess)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "모든 미션 완료!",
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

              // 성공 애니메이션 오버레이
              if (_showCorrectAnimation)
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _showCorrectAnimation ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Center(
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
                                const SizedBox(height: 20),
                                const Text(
                                  '미션 완료!',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                if (_lastMessage.isNotEmpty) ...[
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
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
            ],
          );
        }
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
    Color frameColor;
    if (similarity < 0.5) {
      frameColor = Color.lerp(Colors.redAccent, Colors.yellowAccent, similarity * 2)!;
    } else if (similarity < 0.8) {
      frameColor = Color.lerp(Colors.yellowAccent, Colors.greenAccent, (similarity - 0.5) * 3.3)!;
    } else {
      frameColor = Color.lerp(Colors.greenAccent, Colors.cyanAccent, (similarity - 0.8) * 5)!;
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
      ..color = frameColor.withValues(alpha: 0.5)
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
      ..color = Colors.grey.withValues(alpha: 0.5)
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
  final String label;
  final double top;
  final double right;
  const ReferenceImageOverlay({
    super.key,
    this.image,
    this.label = "목표물",
    this.top = 90,
    this.right = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
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
          const SizedBox(height: 5),
          Container(
            key: const Key('reference_label_chip'),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
