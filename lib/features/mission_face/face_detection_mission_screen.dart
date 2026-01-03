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

import '../../services/ml_service.dart';
import 'face_result_screen.dart';

class FaceDetectionMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const FaceDetectionMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<FaceDetectionMissionScreen> createState() => _FaceDetectionMissionScreenState();
}

class _FaceDetectionMissionScreenState extends ConsumerState<FaceDetectionMissionScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  final MLService _mlService = MLService();
  CameraController? _controller;
  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  
  Timer? _timer;
  int _elapsedMilliseconds = 0;
  final int _targetMilliseconds = 10000; // 10초
  bool _isFaceDetected = false;
  bool _isSuccess = false;
  CameraDescription? _camera;
  final _FaceAnalysisAccumulator _analysisAccumulator = _FaceAnalysisAccumulator();

  @override
  void initState() {
    super.initState();
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
        _analysisAccumulator.addFace(mainFace);
        _onFaceDetected();
      } else {
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

  Future<void> _onSuccess() async {
    if (_isSuccess) return;
    _isSuccess = true;
    _timer?.cancel();
    _controller?.stopImageStream();
    
    // 알람 소리 및 알림 확실하게 종료 (await 사용)
    await _stopAlarm();
    
    // 알람 미션 성공 처리 (알람 영구 정지 및 스케줄링 업데이트)
    if (widget.alarmId != null) {
      ref.read(alarmListProvider.notifier).completeAlarm(widget.alarmId!);
    }
    
    if (!mounted) return;

    final analysis = _analysisAccumulator.toMetrics();
    
    // [수정] pushReplacement 대신 push를 사용하여 AlarmRingingScreen이 계속 대기하도록 함
    // 이렇게 해야 FaceResultScreen이 닫힐 때까지 AlarmRingingScreen이 '실패/취소'로 오판하여 알람을 다시 울리지 않음
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
  void dispose() {
    _stopAlarm();
    _timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!;
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
          CustomPaint(
            painter: FaceGuidePainter(
              isFaceDetected: _isFaceDetected,
              progress: progress,
            ),
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
                    children: [
                      Text(
                        _isFaceDetected 
                          ? "$remainingSeconds" 
                          : "얼굴을 보여주세요",
                        style: TextStyle(
                          color: _isFaceDetected ? Colors.greenAccent : Colors.white, 
                          fontSize: _isFaceDetected ? 48 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_isFaceDetected)
                        const Text(
                          "화면을 계속 응시하세요",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  "관상 분석을 위해 얼굴을 인식 중입니다",
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Text(
                  "데이터는 저장되지 않습니다",
                  style: TextStyle(color: Colors.white30, fontSize: 12),
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

  FaceGuidePainter({required this.isFaceDetected, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    // Face shape dimensions (Oval)
    final faceWidth = size.width * 0.7;
    final faceHeight = size.width * 0.95; // More oval shape (height > width)
    
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
      ..strokeWidth = 4.0;

    canvas.drawOval(faceRect, paint);

    // 진행률 표시 (타원형 프로그래스)
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = Colors.blueAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0
        ..strokeCap = StrokeCap.round;
      
      canvas.drawArc(
        faceRect,
        -math.pi / 2, // 12시 방향부터 시작
        2 * math.pi * progress,
        false,
        progressPaint,
      );
    }
    
    // 얼굴 감지 시 얼굴 영역에 그물망 효과 (아이언맨 HUD 느낌)
    if (isFaceDetected) {
      final gridPaint = Paint()
        ..color = Colors.greenAccent.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
        
      // 간단한 그리드 그리기 (클리핑 필요)
      canvas.save();
      canvas.clipPath(holePath);
      
      const step = 40.0;
      for (double x = faceRect.left; x <= faceRect.right; x += step) {
        canvas.drawLine(Offset(x, faceRect.top), Offset(x, faceRect.bottom), gridPaint);
      }
      for (double y = faceRect.top; y <= faceRect.bottom; y += step) {
        canvas.drawLine(Offset(faceRect.left, y), Offset(faceRect.right, y), gridPaint);
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(FaceGuidePainter oldDelegate) {
    return oldDelegate.isFaceDetected != isFaceDetected || oldDelegate.progress != progress;
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
