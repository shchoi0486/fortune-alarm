import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:collection/collection.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
import 'package:fortune_alarm/services/notification_service.dart';
import 'package:fortune_alarm/services/alarm_scheduler_service.dart';

import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../services/ml_service.dart';
import 'face_result_screen.dart';

class FaceDetectionMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const FaceDetectionMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<FaceDetectionMissionScreen> createState() => _FaceDetectionMissionScreenState();
}

class _FaceDetectionMissionScreenState extends ConsumerState<FaceDetectionMissionScreen> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  final MLService _mlService = MLService();
  CameraController? _controller;
  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  
  late AnimationController _scanController;
  
  Timer? _timer;
  int _elapsedMilliseconds = 0;
  final int _targetMilliseconds = 5000; // 5초
  bool _isFaceDetected = false;
  bool _isSuccess = false;
  CameraDescription? _camera;
  Face? _detectedFace;
  Size? _lastImageSize;
  InputImageRotation? _lastRotation;
  final _FaceAnalysisAccumulator _analysisAccumulator = _FaceAnalysisAccumulator();

  @override
  void initState() {
    super.initState();
    
    // 미션 진입 시 알람 진동이 남아있을 수 있으므로 명시적으로 정지
    Vibration.cancel();
    
    WidgetsBinding.instance.addObserver(this);
    
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _stopAlarm(); // Start mission in silence as requested
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    // 전면 카메라 찾기
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );
    _camera = frontCamera;

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.nv21 : ImageFormatGroup.bgra8888,
    );

    try {
      await _controller!.initialize();
      if (!mounted) return;
      
      setState(() {
        _isCameraInitialized = true;
      });

      _controller!.startImageStream(_processImage);
    } catch (e) {
      debugPrint('Camera initialization failed: $e');
    }
  }

  void _processImage(CameraImage image) async {
    if (_isProcessing || _isSuccess || !_isCameraInitialized || _controller == null) return;
    _isProcessing = true;

    try {
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) {
        _isProcessing = false;
        return;
      }

      final faces = await _mlService.processFaces(inputImage);
      
      if (!mounted) return;

      // 얼굴이 감지되었더라도 눈, 코, 입 등 주요 특징점이 어느 정도 확보되어야 '진짜 얼굴'로 판단
      final validFaces = faces.where((face) {
        // 1. 얼굴 윤곽이 감지되었는지 확인 (최소한의 형태)
        final hasFaceContour = face.contours[FaceContourType.face]?.points.isNotEmpty == true;
        
        if (!hasFaceContour) return false;

        // 2. 가이드 영역 안에 있는지 체크 (위치 및 크기)
        // 저조도나 기기별 해상도 차이를 고려하여 검증 로직을 더 유연하게 수정
        return _checkFacePosition(face, inputImage.metadata!.size, inputImage.metadata!.rotation);
      }).toList();

      if (validFaces.isNotEmpty) {
        final mainFace = validFaces.reduce((a, b) {
          final aArea = a.boundingBox.width * a.boundingBox.height;
          final bArea = b.boundingBox.width * b.boundingBox.height;
          return aArea >= bArea ? a : b;
        });
        
        if (mounted) {
          setState(() {
            _detectedFace = mainFace;
            _lastImageSize = inputImage.metadata!.size;
            _lastRotation = inputImage.metadata!.rotation;
          });
        }
        
        _analysisAccumulator.addFace(mainFace);
        _onFaceDetected();
      } else {
        if (mounted && _detectedFace != null) {
          setState(() {
            _detectedFace = null;
          });
        }
        _analysisAccumulator.reset();
        _onFaceLost();
      }
    } catch (e) {
      debugPrint('Error processing face: $e');
    } finally {
      _isProcessing = false;
    }
  }

  bool _checkFacePosition(Face face, Size imageSize, InputImageRotation rotation) {
    // raw 이미지 상의 중심점 및 크기 비율 계산
    final double rawCenterX = face.boundingBox.center.dx / imageSize.width;
    final double rawCenterY = face.boundingBox.center.dy / imageSize.height;
    final double rawWidthRatio = face.boundingBox.width / imageSize.width;
    final double rawHeightRatio = face.boundingBox.height / imageSize.height;

    double horizontalPos, verticalPos, faceSizeRatio;

    // 회전 각도에 따라 UI상의 좌표로 매핑
    if (rotation == InputImageRotation.rotation90deg || rotation == InputImageRotation.rotation270deg) {
      // 90/270도 회전 시 가로-세로축이 뒤바뀜
      horizontalPos = rawCenterY;
      verticalPos = rawCenterX;
      faceSizeRatio = rawHeightRatio; // 세로로 세워진 UI 기준 얼굴의 가로 비중
    } else {
      horizontalPos = rawCenterX;
      verticalPos = rawCenterY;
      faceSizeRatio = rawWidthRatio;
    }

    // 1. 위치 검증 (0.0 ~ 1.0 범위)
    // 가로/세로 모두 중앙에서 40% 범위 내에 있으면 허용 (0.1 ~ 0.9) - 완화됨
    final bool isHorizontalValid = (horizontalPos > 0.10 && horizontalPos < 0.90);
    final bool isVerticalValid = (verticalPos > 0.10 && verticalPos < 0.90);
    
    // 2. 크기 검증
    // 얼굴이 너무 작으면 분석 품질이 떨어지므로 최소 15% 이상은 차지해야 함 - 완화됨
    final bool isSizeValid = (faceSizeRatio > 0.15);

    return isHorizontalValid && isVerticalValid && isSizeValid;
  }

  void _onFaceDetected() {
    if (_isFaceDetected) return; // 이미 감지 상태면 리턴
    
    try {
      HapticFeedback.mediumImpact();
      _playSfx('ui_click.ogg'); // 감지 시작 시 가벼운 효과음
    } catch (_) {}

    setState(() {
      _isFaceDetected = true;
    });

    // 타이머 시작
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      setState(() {
        _elapsedMilliseconds += 100;
      });

      if (_elapsedMilliseconds >= _targetMilliseconds) {
        _onSuccess();
      }
    });
  }

  void _onFaceLost() {
    if (!_isFaceDetected) return; // 이미 미감지 상태면 리턴

    try {
      HapticFeedback.selectionClick();
    } catch (_) {}

    setState(() {
      _isFaceDetected = false;
      _elapsedMilliseconds = 0; // 초기화
    });
    _timer?.cancel();
    _analysisAccumulator.reset();
  }

  Future<void> _playSfx(String assetPath) async {
    try {
      await _audioPlayer.play(AssetSource('sounds/$assetPath'));
    } catch (e) {
      debugPrint('Error playing SFX: $e');
    }
  }

  Future<void> _onSuccess() async {
    if (_isSuccess) return;
    _isSuccess = true;
    _timer?.cancel();
    _controller?.stopImageStream();
    
    // 성공 피드백
    try {
      HapticFeedback.heavyImpact();
      await _playSfx('ui_success.ogg'); // 성공 시 밝은 효과음
    } catch (_) {}
    
    // 알람 소리 및 알림 확실하게 종료 (await 사용)
    await _stopAlarm();
    
    // 알람 미션 성공 처리 (알람 영구 정지 및 스케줄링 업데이트)
    if (widget.alarmId != null) {
      ref.read(alarmListProvider.notifier).completeAlarm(widget.alarmId!);
    }
    
    if (!mounted) return;

    final analysis = _analysisAccumulator.toMetrics();
    
    if (!mounted) return;
    
    // [수정] pushReplacement 대신 push를 사용하여 AlarmRingingScreen이 계속 대기하도록 함
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FaceResultScreen(alarmId: widget.alarmId, analysis: analysis)),
    );
    
    // FaceResultScreen에서 반환된 결과(true)를 그대로 상위(AlarmRingingScreen)로 전달
    if (mounted) {
      Navigator.of(context).pop(result);
    }
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_controller == null || _camera == null) return null;

    final sensorOrientation = _camera!.sensorOrientation;
    
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation = _orientations[_controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (_camera!.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null) return null;

    // Bytes merging for Android (nv21 has 3 planes, iOS bgra8888 has 1)
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: image.planes.first.bytesPerRow,
      ),
    );
  }

  static final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    try {
      // 미션 수행 화면에서는 알람 소리 재생하지 않음
      // 알람 소리는 알람 울림 스크린(alarm_ringing_screen.dart)에서만 재생

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
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
      
      // 알림(Notification) 소리 및 노티 제거 추가
      if (widget.alarmId != null) {
        final int stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
        await NotificationService().cancelNotification(stableId);
        debugPrint('[FaceDetectionMission] Alarm stopped and notification cancelled for $stableId');
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 미션 성공 후 광고 등이 뜰 때 화면이 닫히지 않도록 _isSuccess 체크 추가
      if (mounted && !_isSuccess) {
        Navigator.of(context).pop('timeout');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scanController.dispose();
    _timer?.cancel();
    _controller?.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = _elapsedMilliseconds / _targetMilliseconds;
    final remainingSeconds = ((_targetMilliseconds - _elapsedMilliseconds) / 1000).ceil();
    
    if (!_isCameraInitialized || _controller == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CameraPreview(_controller!),
          
          // Guide Overlay
          AnimatedBuilder(
            animation: _scanController,
            builder: (context, child) {
              return CustomPaint(
                painter: FaceGuidePainter(
                  isFaceDetected: _isFaceDetected,
                  progress: progress,
                  detectedFace: _detectedFace,
                  imageSize: _lastImageSize,
                  rotation: _lastRotation,
                  scanAnimationValue: _scanController.value,
                ),
              );
            },
          ),
          
          // Text Instructions
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _isFaceDetected 
                            ? "$remainingSeconds" 
                            : l10n.showFace,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _isFaceDetected ? Colors.greenAccent : Colors.white, 
                            fontSize: _isFaceDetected ? 48 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (_isFaceDetected)
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            l10n.keepWatching,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      l10n.recognizingFaceForFortune,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      l10n.dataNotStored,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white30, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FaceGuidePainter extends CustomPainter {
  final bool isFaceDetected;
  final double progress;
  final Face? detectedFace;
  final Size? imageSize;
  final InputImageRotation? rotation;
  final double scanAnimationValue;

  FaceGuidePainter({
    required this.isFaceDetected, 
    required this.progress,
    this.detectedFace,
    this.imageSize,
    this.rotation,
    required this.scanAnimationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    // Face shape dimensions (Oval)
    final faceWidth = size.width * 0.7;
    final faceHeight = size.width * 0.95; 
    
    final faceRect = Rect.fromCenter(
      center: center, 
      width: faceWidth, 
      height: faceHeight
    );

    // 배경 어둡게 처리 (얼굴 영역 제외)
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    
    final holePath = Path()
      ..addOval(faceRect);
    
    final overlayPath = Path.combine(
      PathOperation.difference,
      path,
      holePath,
    );

    canvas.drawPath(
      overlayPath,
      Paint()..color = Colors.black.withOpacity(0.6),
    );

    // 가이드 라인
    final paint = Paint()
      ..color = isFaceDetected ? Colors.greenAccent : Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawOval(faceRect, paint);

    // 진행률 표시 (타원형 프로그래스)
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = Colors.blueAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6.0
        ..strokeCap = StrokeCap.round;
      
      canvas.drawArc(
        faceRect,
        -math.pi / 2, 
        2 * math.pi * progress,
        false,
        progressPaint,
      );
    }
    
    // 얼굴 감지 시 HUD 효과
    if (isFaceDetected) {
      _drawHUD(canvas, size, faceRect, holePath);
      
      if (detectedFace != null && imageSize != null && rotation != null) {
        _drawFaceLandmarks(canvas, size, faceRect);
      }
    }
  }

  void _drawHUD(Canvas canvas, Size size, Rect faceRect, Path holePath) {
    // 1. 더 촘촘한 그리드
    final gridPaint = Paint()
      ..color = Colors.greenAccent.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;
      
    canvas.save();
    canvas.clipPath(holePath);
    
    const step = 20.0; // 더 촘촘하게 수정
    for (double x = faceRect.left; x <= faceRect.right; x += step) {
      canvas.drawLine(Offset(x, faceRect.top), Offset(x, faceRect.bottom), gridPaint);
    }
    
    final scanY = faceRect.top + (faceRect.height * scanAnimationValue);
    
    for (double y = faceRect.top; y <= faceRect.bottom; y += step) {
      // 스캔 라인 근처의 그리드 선은 더 밝게 표시
      final distanceFromScan = (y - scanY).abs();
      if (distanceFromScan < 40) {
        final highlightPaint = Paint()
          ..color = Colors.greenAccent.withOpacity(0.6 * (1 - distanceFromScan / 40))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2;
        canvas.drawLine(Offset(faceRect.left, y), Offset(faceRect.right, y), highlightPaint);
      } else {
        canvas.drawLine(Offset(faceRect.left, y), Offset(faceRect.right, y), gridPaint);
      }
    }

    // 2. 스캐닝 라인 애니메이션
    final scanPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.greenAccent.withOpacity(0),
          Colors.greenAccent.withOpacity(0.7),
          Colors.greenAccent.withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(faceRect.left, scanY - 30, faceRect.width, 60));

    canvas.drawRect(
      Rect.fromLTWH(faceRect.left, scanY - 2, faceRect.width, 4),
      Paint()..color = Colors.greenAccent.withOpacity(0.9),
    );
    canvas.drawRect(
      Rect.fromLTWH(faceRect.left, scanY - 20, faceRect.width, 40),
      scanPaint,
    );
    
    canvas.restore();

    // 3. 모서리 가이드 (Corner Brackets)
    final bracketPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    
    const bracketSize = 20.0;
    // Top Left
    canvas.drawPath(Path()
      ..moveTo(faceRect.left, faceRect.top + bracketSize)
      ..lineTo(faceRect.left, faceRect.top)
      ..lineTo(faceRect.left + bracketSize, faceRect.top), bracketPaint);
    // Top Right
    canvas.drawPath(Path()
      ..moveTo(faceRect.right - bracketSize, faceRect.top)
      ..lineTo(faceRect.right, faceRect.top)
      ..lineTo(faceRect.right, faceRect.top + bracketSize), bracketPaint);
    // Bottom Left
    canvas.drawPath(Path()
      ..moveTo(faceRect.left, faceRect.bottom - bracketSize)
      ..lineTo(faceRect.left, faceRect.bottom)
      ..lineTo(faceRect.left + bracketSize, faceRect.bottom), bracketPaint);
    // Bottom Right
    canvas.drawPath(Path()
      ..moveTo(faceRect.right - bracketSize, faceRect.bottom)
      ..lineTo(faceRect.right, faceRect.bottom)
      ..lineTo(faceRect.right, faceRect.bottom - bracketSize), bracketPaint);
  }

  void _drawFaceLandmarks(Canvas canvas, Size size, Rect faceRect) {
    if (detectedFace == null || imageSize == null || rotation == null) return;

    // 카메라 이미지 좌표를 화면 좌표로 변환하기 위한 스케일 계산
    // 전면 카메라의 경우 가로세로가 뒤집혀 있을 수 있음 (90, 270도)
    final bool isPortrait = rotation == InputImageRotation.rotation90deg || 
                           rotation == InputImageRotation.rotation270deg;
    
    final double srcWidth = isPortrait ? imageSize!.height : imageSize!.width;
    final double srcHeight = isPortrait ? imageSize!.width : imageSize!.height;
    
    final double scaleX = size.width / srcWidth;
    final double scaleY = size.height / srcHeight;

    Offset mapPoint(Offset point) {
      double x = point.dx * scaleX;
      double y = point.dy * scaleY;
      
      // 전면 카메라 좌우 반전 처리
      x = size.width - x;
      
      return Offset(x, y);
    }

    final leftEye = detectedFace!.landmarks[FaceLandmarkType.leftEye]?.position;
    final rightEye = detectedFace!.landmarks[FaceLandmarkType.rightEye]?.position;
    final nose = detectedFace!.landmarks[FaceLandmarkType.noseBase]?.position;
    final mouth = detectedFace!.landmarks[FaceLandmarkType.bottomMouth]?.position;

    if (leftEye == null || rightEye == null || nose == null || mouth == null) return;

    final landmarks = {
      'EYE_L': mapPoint(Offset(leftEye.x.toDouble(), leftEye.y.toDouble())),
      'EYE_R': mapPoint(Offset(rightEye.x.toDouble(), rightEye.y.toDouble())),
      'NOSE': mapPoint(Offset(nose.x.toDouble(), nose.y.toDouble())),
      'MOUTH': mapPoint(Offset(mouth.x.toDouble(), mouth.y.toDouble())),
    };

    final linePaint = Paint()
      ..color = Colors.greenAccent.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final pointPaint = Paint()
      ..color = Colors.greenAccent.withOpacity(0.9)
      ..style = PaintingStyle.fill;

    // 1. 부위 간 연결선 (Wireframe Mesh)
    final meshPath = Path();
    meshPath.moveTo(landmarks['EYE_L']!.dx, landmarks['EYE_L']!.dy);
    meshPath.lineTo(landmarks['EYE_R']!.dx, landmarks['EYE_R']!.dy);
    meshPath.lineTo(landmarks['MOUTH']!.dx, landmarks['MOUTH']!.dy);
    meshPath.close();
    
    meshPath.moveTo(landmarks['EYE_L']!.dx, landmarks['EYE_L']!.dy);
    meshPath.lineTo(landmarks['NOSE']!.dx, landmarks['NOSE']!.dy);
    meshPath.lineTo(landmarks['EYE_R']!.dx, landmarks['EYE_R']!.dy);
    
    meshPath.moveTo(landmarks['NOSE']!.dx, landmarks['NOSE']!.dy);
    meshPath.lineTo(landmarks['MOUTH']!.dx, landmarks['MOUTH']!.dy);
    
    canvas.drawPath(meshPath, linePaint);

    // 2. 각 부위별 테크니컬 라벨
    landmarks.forEach((key, point) {
      canvas.drawRect(Rect.fromCenter(center: point, width: 5, height: 5), pointPaint);
      
      final textPainter = TextPainter(
        text: TextSpan(
          text: '$key\n${point.dx.toInt()},${point.dy.toInt()}',
          style: TextStyle(
            color: Colors.greenAccent.withOpacity(0.9),
            fontSize: 9,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
            backgroundColor: Colors.black.withOpacity(0.3),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(point.dx + 8, point.dy - 12));
    });
  }

  @override
  bool shouldRepaint(FaceGuidePainter oldDelegate) {
    return oldDelegate.isFaceDetected != isFaceDetected || 
           oldDelegate.progress != progress ||
           oldDelegate.scanAnimationValue != scanAnimationValue ||
           oldDelegate.detectedFace != detectedFace;
  }
}

class _FaceAnalysisAccumulator {
  int _samples = 0;

  double _sumAspect = 0;

  double _sumJawToCheek = 0;
  int _jawToCheekCount = 0;

  double _sumEyeOpen = 0;
  int _eyeOpenCount = 0;

  double _sumSmile = 0;
  int _smileCount = 0;

  double _sumNoseWidth = 0;
  int _noseWidthCount = 0;

  double _sumNoseLength = 0;
  int _noseLengthCount = 0;

  double _sumMouthOpen = 0;
  int _mouthOpenCount = 0;

  double _sumAbsYaw = 0;
  int _yawCount = 0;

  double _sumAbsRoll = 0;
  int _rollCount = 0;

  void reset() {
    _samples = 0;
    _sumAspect = 0;
    _sumJawToCheek = 0;
    _jawToCheekCount = 0;
    _sumEyeOpen = 0;
    _eyeOpenCount = 0;
    _sumSmile = 0;
    _smileCount = 0;
    _sumNoseWidth = 0;
    _noseWidthCount = 0;
    _sumNoseLength = 0;
    _noseLengthCount = 0;
    _sumMouthOpen = 0;
    _mouthOpenCount = 0;
    _sumAbsYaw = 0;
    _yawCount = 0;
    _sumAbsRoll = 0;
    _rollCount = 0;
  }

  void addFace(Face face) {
    final rect = face.boundingBox;
    if (rect.width <= 0 || rect.height <= 0) return;

    _samples += 1;
    _sumAspect += rect.width / rect.height;

    final jawToCheek = _estimateJawToCheekRatio(face);
    if (jawToCheek != null) {
      _sumJawToCheek += jawToCheek;
      _jawToCheekCount += 1;
    }

    final eyeOpen = _avgEyeOpenProbability(face);
    if (eyeOpen != null) {
      _sumEyeOpen += eyeOpen;
      _eyeOpenCount += 1;
    }

    final smile = face.smilingProbability;
    if (smile != null) {
      _sumSmile += smile;
      _smileCount += 1;
    }

    final noseWidth = _estimateNoseWidthRatio(face);
    if (noseWidth != null) {
      _sumNoseWidth += noseWidth;
      _noseWidthCount += 1;
    }

    final noseLength = _estimateNoseLengthRatio(face);
    if (noseLength != null) {
      _sumNoseLength += noseLength;
      _noseLengthCount += 1;
    }

    final mouthOpen = _estimateMouthOpenRatio(face);
    if (mouthOpen != null) {
      _sumMouthOpen += mouthOpen;
      _mouthOpenCount += 1;
    }

    final yaw = face.headEulerAngleY;
    if (yaw != null) {
      _sumAbsYaw += yaw.abs();
      _yawCount += 1;
    }

    final roll = face.headEulerAngleZ;
    if (roll != null) {
      _sumAbsRoll += roll.abs();
      _rollCount += 1;
    }
  }

  FaceAnalysisMetrics? toMetrics() {
    if (_samples == 0) return null;

    double? avgOrNull(double sum, int count) => count == 0 ? null : (sum / count);

    return FaceAnalysisMetrics(
      faceAspectRatio: _sumAspect / _samples,
      jawToCheekRatio: avgOrNull(_sumJawToCheek, _jawToCheekCount),
      eyeOpenProbability: avgOrNull(_sumEyeOpen, _eyeOpenCount),
      smileProbability: avgOrNull(_sumSmile, _smileCount),
      noseWidthRatio: avgOrNull(_sumNoseWidth, _noseWidthCount),
      noseLengthRatio: avgOrNull(_sumNoseLength, _noseLengthCount),
      mouthOpenRatio: avgOrNull(_sumMouthOpen, _mouthOpenCount),
      yawDegreesAbs: avgOrNull(_sumAbsYaw, _yawCount),
      rollDegreesAbs: avgOrNull(_sumAbsRoll, _rollCount),
    );
  }

  double? _avgEyeOpenProbability(Face face) {
    final left = face.leftEyeOpenProbability;
    final right = face.rightEyeOpenProbability;
    if (left == null && right == null) return null;
    if (left == null) return right;
    if (right == null) return left;
    return (left + right) / 2;
  }

  double? _estimateJawToCheekRatio(Face face) {
    final rect = face.boundingBox;
    final contour = face.contours[FaceContourType.face];
    final points = contour?.points;
    if (points == null || points.length < 8) return null;

    double? widthAt(double fromRelY, double toRelY) {
      double? minX;
      double? maxX;
      for (final p in points) {
        final relY = (p.y - rect.top) / rect.height;
        if (relY < fromRelY || relY > toRelY) continue;
        final x = p.x.toDouble();
        minX = minX == null ? x : math.min(minX, x);
        maxX = maxX == null ? x : math.max(maxX, x);
      }
      if (minX == null || maxX == null) return null;
      final w = maxX - minX;
      if (w <= 0) return null;
      return w;
    }

    final cheekWidth = widthAt(0.35, 0.55);
    final jawWidth = widthAt(0.75, 0.92);
    if (cheekWidth == null || jawWidth == null) return null;
    if (cheekWidth <= 0) return null;
    return jawWidth / cheekWidth;
  }

  double? _estimateNoseWidthRatio(Face face) {
    final rect = face.boundingBox;
    final contour = face.contours[FaceContourType.noseBottom];
    final points = contour?.points;
    if (points == null || points.length < 3) return null;

    double minX = points.first.x.toDouble();
    double maxX = points.first.x.toDouble();
    for (final p in points) {
      final x = p.x.toDouble();
      if (x < minX) minX = x;
      if (x > maxX) maxX = x;
    }

    final width = maxX - minX;
    if (width <= 0 || rect.width <= 0) return null;
    return width / rect.width;
  }

  double? _estimateNoseLengthRatio(Face face) {
    final rect = face.boundingBox;
    final bridge = face.contours[FaceContourType.noseBridge]?.points;
    final bottom = face.contours[FaceContourType.noseBottom]?.points;
    if (bridge == null || bridge.isEmpty || bottom == null || bottom.isEmpty) return null;

    double minY = bridge.first.y.toDouble();
    for (final p in bridge) {
      final y = p.y.toDouble();
      if (y < minY) minY = y;
    }

    double maxY = bottom.first.y.toDouble();
    for (final p in bottom) {
      final y = p.y.toDouble();
      if (y > maxY) maxY = y;
    }

    final length = maxY - minY;
    if (length <= 0 || rect.height <= 0) return null;
    return length / rect.height;
  }

  double? _estimateMouthOpenRatio(Face face) {
    final rect = face.boundingBox;
    final upper = face.contours[FaceContourType.upperLipBottom]?.points;
    final lower = face.contours[FaceContourType.lowerLipTop]?.points;
    if (upper == null || upper.isEmpty || lower == null || lower.isEmpty) return null;

    final upperMid = upper[upper.length ~/ 2];
    final lowerMid = lower[lower.length ~/ 2];
    final gap = (lowerMid.y - upperMid.y).toDouble();
    if (gap <= 0 || rect.height <= 0) return null;
    return gap / rect.height;
  }
}
