import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../core/constants/mission_type.dart';
import 'ml_service.dart'; // Import MissionValidationResult


// 이미지 디코딩을 위한 최상위 함수 (Isolate에서 실행용)
img.Image? _decodeImage(Uint8List bytes) {
  return img.decodeImage(bytes);
}

class MLService {
  // Singleton pattern
  static final MLService _instance = MLService._internal();
  factory MLService() => _instance;
  MLService._internal();

  // TensorFlow Lite Components
  Interpreter? _interpreter;
  Interpreter? _efficientNetInterpreter;
  List<String> _labels = [];
  bool _isModelLoaded = false;
  
  // Face Detector (ML Kit)
  FaceDetector? _faceDetector;
  ObjectDetector? _objectDetector;
  
  // Caching
  String? _cachedReferencePath;
  List<double> _lastInferenceVector = [];
  List<double>? _cachedReferenceVector; // 통합된 참조 벡터 (EfficientNet or MobileNet)
  List<double>? _cachedReferenceHistogram; // 색상 히스토그램 캐시
  int _successStreak = 0;

  // 얼굴 감지 메서드 (외부 호출용)
  Future<List<Face>> processFaces(InputImage inputImage) async {
    if (_faceDetector == null) await initialize();
    return await _faceDetector!.processImage(inputImage);
  }

  Future<void> initialize() async {
    if (_isModelLoaded && _faceDetector != null && _objectDetector != null) return;
    
    try {
      // 1. ML Kit Detectors 초기화
      _faceDetector ??= FaceDetector(
        options: FaceDetectorOptions(
          performanceMode: FaceDetectorMode.fast,
          enableLandmarks: true,
          enableContours: true,
          enableClassification: true,
          minFaceSize: 0.15,
        ),
      );

      _objectDetector ??= ObjectDetector(
        options: ObjectDetectorOptions(
          mode: DetectionMode.stream,
          classifyObjects: true,
          multipleObjects: true,
        ),
      );

      // 2. TFLite Models 초기화
      if (!_isModelLoaded) {
        final options = InterpreterOptions();
        
        _interpreter = await Interpreter.fromAsset(
          'assets/ml/mobilenet_v1_1.0_224_quant.tflite',
          options: options,
        );
        
        final labelData = await rootBundle.loadString('assets/ml/labels_mobilenet_quant_v1_224.txt');
        _labels = labelData.split('\n');

        try {
          _efficientNetInterpreter = await Interpreter.fromAsset(
            'assets/ml/efficientnet-lite0.tflite',
            options: options,
          );
          debugPrint('EfficientNet Lite0 model loaded');
        } catch (e) {
          _efficientNetInterpreter = null;
          debugPrint('EfficientNet Lite0 model load failed: $e');
        }
        
        _isModelLoaded = true;
        debugPrint('TensorFlow Lite Model Loaded: ${_labels.length} labels');
      }
    } catch (e) {
      debugPrint('Failed to initialize MLService: $e');
    }
  }

  // 파일에서 라벨 추출 (기준 이미지 분석용)
  Future<List<Map<String, dynamic>>> getLabelsFromFile(File imageFile) async {
    if (!_isModelLoaded) await initialize();
    if (_interpreter == null) return [];

    try {
      final bytes = await imageFile.readAsBytes();
      // compute를 사용하여 별도 Isolate에서 이미지 디코딩 (UI 스레드 차단 방지)
      final image = await compute(_decodeImage, bytes);
      if (image == null) return [];

      return _runInference(image);
    } catch (e) {
      debugPrint('Error getting labels from file: $e');
      return [];
    }
  }

  // 편리한 사용을 위한 래퍼 메소드 (String 리스트 반환)
  Future<List<String>> extractLabelsFromImage(File imageFile) async {
    final results = await getLabelsFromFile(imageFile);
    // 상위 5개 라벨만 반환 (신뢰도 순)
    return results.take(5).map((e) => e['label'] as String).toList();
  }

  // 색상 히스토그램 계산 (RGB 4x4x4 = 64 bins)
  List<double> _calculateColorHistogram(img.Image image) {
    // 입력 이미지가 너무 크면 리사이징 (속도 최적화)
    img.Image processImage = image;
    if (image.width > 100 || image.height > 100) {
      processImage = img.copyResize(image, width: 100, height: 100);
    }

    final bins = List<double>.filled(64, 0.0);
    final totalPixels = processImage.width * processImage.height;

    for (final pixel in processImage) {
      final r = pixel.r.toInt();
      final g = pixel.g.toInt();
      final b = pixel.b.toInt();

      // 0~255 -> 0~3
      final rBin = (r >> 6).clamp(0, 3);
      final gBin = (g >> 6).clamp(0, 3);
      final bBin = (b >> 6).clamp(0, 3);

      final index = (rBin * 16) + (gBin * 4) + bBin;
      bins[index] += 1.0;
    }

    // 정규화
    for (int i = 0; i < bins.length; i++) {
      bins[i] /= totalPixels;
    }

    return bins;
  }

  // 히스토그램 교차 유사도 (Histogram Intersection)
  double _histogramIntersection(List<double> h1, List<double> h2) {
    if (h1.length != h2.length) return 0.0;
    double intersection = 0.0;
    for (int i = 0; i < h1.length; i++) {
      intersection += math.min(h1[i], h2[i]);
    }
    return intersection;
  }

  // 3단계 검증 파이프라인 (TFLite 기반)
  Future<MissionValidationResult> validateMissionLabels({
    required CameraImage cameraImage,
    required CameraDescription camera,
    required MissionType missionType,
    List<String>? targetLabels,
    File? referenceFile,
    bool fastStart = false,
  }) async {
    if (!_isModelLoaded) await initialize();

    final step = fastStart ? 6 : 4;
    img.Image? inputImage = _convertYUV420ToImage(cameraImage, camera.sensorOrientation, step);
    
    if (inputImage == null) {
      return MissionValidationResult(isSuccess: false, message: "카메라 입력 오류");
    }

    final roiImage = _cropToOverlayROI(inputImage);
    List<Map<String, dynamic>> predictions = [];
    List<String> detectedLabelStrings = [];
    double maxSimilarity = 0.0;

    try {
      // 1. ROI 분석 및 벡터 추출
      predictions = _runInference(roiImage);
      
      List<double> currentVectorROI = [];
      if (_efficientNetInterpreter != null) {
        currentVectorROI = _runEfficientNetVector(roiImage);
      }

      // 2. Center Crop 1 (0.8) 분석
      final centerCropped1 = _centerCrop(roiImage, 0.8);
      List<double> currentVectorCenter1 = [];
      if (_efficientNetInterpreter != null) {
        currentVectorCenter1 = _runEfficientNetVector(centerCropped1);
      }

      // 3. Center Crop 2 (0.6) 분석
      final centerCropped2 = _centerCrop(roiImage, 0.6);
      List<double> currentVectorCenter2 = [];
      if (_efficientNetInterpreter != null) {
        currentVectorCenter2 = _runEfficientNetVector(centerCropped2);
      }

      // 4. Center Crop 3 (0.4) 분석 - 센터 물체에 초집중
      final centerCropped3 = _centerCrop(roiImage, 0.4);
      List<double> currentVectorCenter3 = [];
      if (_efficientNetInterpreter != null) {
        currentVectorCenter3 = _runEfficientNetVector(centerCropped3);
      }

      // 디버깅을 위해 상위 5개 예측 결과 로그 출력
      if (predictions.isNotEmpty) {
        final top5 = predictions.take(5).map((p) => "${p['label']}: ${(p['confidence'] * 100).toStringAsFixed(1)}%").join(", ");
        debugPrint("ML Detection Raw: $top5");
      }
      
      detectedLabelStrings = predictions
          .where((p) => (p['confidence'] as double) >= 0.3)
          .map((p) => "${p['label']}(${(p['confidence'] * 100).toInt()}%)")
          .toList();

      if (targetLabels != null && targetLabels.isNotEmpty) {
        final brightness = _calculateImageBrightness(roiImage);
        final texture = _calculateTextureComplexity(roiImage);

        if (referenceFile != null) {
          if (_cachedReferencePath != referenceFile.path || _cachedReferenceVector == null) {
            final bytes = await referenceFile.readAsBytes();
            final refImage = await compute(_decodeImage, bytes);
            if (refImage != null) {
              _cachedReferencePath = referenceFile.path;
              
              // 참조 이미지도 ROI 영역에 맞춰 크롭 후 센터 벡터 추출
              final refRoi = _cropToOverlayROI(refImage);
              final refCenter = _centerCrop(refRoi, 0.5); // 참조 이미지의 중앙 50%
              
              List<double> refVector = [];
              if (_efficientNetInterpreter != null) {
                refVector = _runEfficientNetVector(refCenter);
              }
              if (refVector.isEmpty) {
                _runInference(refCenter); // MobileNet 실행
                refVector = List.from(_lastInferenceVector);
              }
              _cachedReferenceVector = refVector;
              
              // 색상 히스토그램 캐싱 (중앙 집중)
              _cachedReferenceHistogram = _calculateColorHistogram(refCenter);
            }
          }

          double simEff = 0.0;
          double colorSim = 0.0;

          // 형태 유사도 계산 (EfficientNet)
          if (_cachedReferenceVector != null && _cachedReferenceVector!.isNotEmpty) {
            final s1 = currentVectorROI.isNotEmpty
                ? _cosineSimilarity(_cachedReferenceVector!, currentVectorROI)
                : 0.0;
            final s2 = currentVectorCenter1.isNotEmpty
                ? _cosineSimilarity(_cachedReferenceVector!, currentVectorCenter1)
                : 0.0;
            final s3 = currentVectorCenter2.isNotEmpty
                ? _cosineSimilarity(_cachedReferenceVector!, currentVectorCenter2)
                : 0.0;
            final s4 = currentVectorCenter3.isNotEmpty
                ? _cosineSimilarity(_cachedReferenceVector!, currentVectorCenter3)
                : 0.0;
            
            // 중앙부 가중치 적용 (s3, s4에 더 높은 가중치 부여하여 max 계산)
            // 센터 물체에 집중하라는 사용자 요청 반영
            simEff = math.max(s1 * 0.8, math.max(s2 * 0.9, math.max(s3, s4 * 1.1)));
            simEff = simEff.clamp(0.0, 1.0);
          }
          
          // 색상 유사도 계산 (Histogram Intersection)
          if (_cachedReferenceHistogram != null) {
            final currentHistROI = _calculateColorHistogram(roiImage);
            final currentHistCenter1 = _calculateColorHistogram(centerCropped1);
            final currentHistCenter2 = _calculateColorHistogram(centerCropped2);
            final currentHistCenter3 = _calculateColorHistogram(centerCropped3);
            
            final c1 = _histogramIntersection(_cachedReferenceHistogram!, currentHistROI);
            final c2 = _histogramIntersection(_cachedReferenceHistogram!, currentHistCenter1);
            final c3 = _histogramIntersection(_cachedReferenceHistogram!, currentHistCenter2);
            final c4 = _histogramIntersection(_cachedReferenceHistogram!, currentHistCenter3);
            
            colorSim = math.max(c1 * 0.8, math.max(c2 * 0.9, math.max(c3, c4 * 1.1)));
            colorSim = colorSim.clamp(0.0, 1.0);
          }

          debugPrint('Shape Similarity: ${(simEff * 100).toStringAsFixed(1)}%');
          debugPrint('Color Similarity: ${(colorSim * 100).toStringAsFixed(1)}%');

          // 하이브리드 점수 계산 개선
          // 사용자 요청: "색만 비슷해도 일치되는 경우 방지" & "약간 떨어져도 인식되게"
          // EfficientNet(형태) 비중을 높이고 색상 비중을 낮춤
          // 색상 유사도가 아무리 높아도 형태가 어느 정도 맞지 않으면 감점
          double finalScore = 0.0;
          if (simEff > 0) {
            // 형태 75%, 색상 25% (형태 비중 대폭 상향)
            finalScore = (simEff * 0.75) + (colorSim * 0.25);
            
            // 색상만 너무 높은 경우(형태는 낮은데) 페널티 부여
            if (colorSim > 0.8 && simEff < 0.4) {
              finalScore *= 0.8; // 점수 20% 삭감
            }
          } else {
            // EfficientNet 실패 시 색상에 의존하되 기준을 엄격히 함
            finalScore = colorSim * 0.7; 
          }
          
          debugPrint('Final Hybrid Score: ${(finalScore * 100).toStringAsFixed(1)}%');
          
          if (finalScore > maxSimilarity) {
            maxSimilarity = finalScore;
          }

          final blacklisted = {
            'wall',
            'floor',
            'ceiling',
            'room',
            'sky',
          };

          final topLabel = predictions.isNotEmpty ? (predictions.first['label'] as String).toLowerCase() : '';

          bool isBackgroundByMlKit = false;
          final mlKitInput = _inputImageFromCameraImage(cameraImage, camera);
          if (mlKitInput != null) {
            try {
              final objects = await _objectDetector?.processImage(mlKitInput);
              final bgNames = {
                'wall',
                'floor',
                'ceiling',
                'room',
                'sky',
              };
              for (final obj in objects ?? []) {
                for (final label in obj.labels ?? []) {
                  final text = label.text.toLowerCase();
                  if (bgNames.contains(text)) {
                    isBackgroundByMlKit = true;
                    break;
                  }
                }
                if (isBackgroundByMlKit) {
                  break;
                }
              }
            } catch (e) {
              debugPrint('MLKit object detection error: $e');
            }
          }

          if (brightness < 0.2) {
            return MissionValidationResult(
              isSuccess: false,
              message: "환경이 너무 어둡습니다. 조명을 켜주세요.",
              detectedLabels: detectedLabelStrings,
              similarity: maxSimilarity,
            );
          }

          final isMobileNetBackground = blacklisted.contains(topLabel);
          final isBackground = isMobileNetBackground || isBackgroundByMlKit;

          // 배경 체크 시에도 최종 점수(maxSimilarity) 사용
          if (MLService.shouldRejectBackground(isBackground, texture, maxSimilarity)) {
            return MissionValidationResult(
              isSuccess: false,
              message: "배경으로 인식되었습니다. 물체를 더 가깝게 비춰주세요.",
              detectedLabels: detectedLabelStrings,
              similarity: maxSimilarity,
            );
          }

          bool labelMatch = false;
          String matchedLabel = "";

          final top10Predictions = predictions.take(10);

          for (final target in targetLabels) {
            for (final prediction in top10Predictions) {
              final label = prediction['label'] as String;
              final confidence = prediction['confidence'] as double;
              if (confidence >= 0.3 &&
                  (label.toLowerCase().contains(target.toLowerCase()) ||
                   target.toLowerCase().contains(label.toLowerCase()))) {
                labelMatch = true;
                matchedLabel = label;
                break;
              }
            }
            if (labelMatch) break;
          }

          // 개선된 성공 조건 (하이브리드 점수 기반):
          // 1. 라벨 일치
          // 2. 최종 점수가 0.55 이상 (기준 추가 완화: 0.60 -> 0.55) - 인식 난이도 하향
          // 3. 최종 점수가 0.65 이상이면 라벨 불일치 무시 (기준 추가 완화: 0.70 -> 0.65)
          // 4. 색상 유사도가 매우 높고(0.80 이상) 형태 유사도도 어느정도(0.45 이상) 있으면 성공
          
          final bool highColorMatch = (colorSim >= 0.80 && simEff >= 0.45);
          
          // 더 유연한 성공 조건: 라벨이 일치하더라도 최소한의 유사도(0.45)는 있어야 함
          final bool strictLabelMatch = labelMatch && maxSimilarity >= 0.45;
          
          final bool successCandidate = (strictLabelMatch || maxSimilarity >= 0.55 || highColorMatch);
          
          if (successCandidate) {
            _successStreak += 1;
          } else {
            // 연속 성공이 끊기면 0으로 초기화
            _successStreak = 0;
          }
          
          // 연속 2회 이상 성공해야 최종 인정 (약 1초 유지 필요 - 사용자 편의성 향상)
          if (_successStreak >= 2) {
            final msg = maxSimilarity > 0
                ? "물체 일치! (일치율: ${(maxSimilarity * 100).toInt()}%)"
                : (labelMatch ? "$matchedLabel 확인됨" : "물체 인식 성공");
            return MissionValidationResult(
              isSuccess: true,
              message: msg,
              detectedLabels: detectedLabelStrings,
              similarity: maxSimilarity,
            );
          }
        }
      } else {
        // 일반 미션 모드
        String targetKeyword = '';
        switch (missionType) {
          case MissionType.cameraSink: targetKeyword = 'washbasin'; break; // MobileNet Label check needed
          case MissionType.cameraRefrigerator: targetKeyword = 'refrigerator'; break;
          case MissionType.cameraScale: targetKeyword = 'scale'; break;
          case MissionType.cameraOther: return MissionValidationResult(isSuccess: true, message: "물체 인식 성공", detectedLabels: detectedLabelStrings, similarity: 1.0); // 기타는 인식 성공으로 간주하거나 추가 로직 필요
          case MissionType.cameraFace:
            // 얼굴은 ML Kit 사용 (훨씬 정확함)
            final mlKitInput = _inputImageFromCameraImage(cameraImage, camera);
            if (mlKitInput != null) {
              final faces = await _faceDetector?.processImage(mlKitInput);
              if (faces?.isNotEmpty ?? false) {
                return MissionValidationResult(
                  isSuccess: true, 
                  message: "얼굴 인식 성공", 
                  detectedLabels: ["Face"]
                );
              }
            }
            break;
          default:
            break; 
        }
        
        // MobileNet V1 labels check:
        // 'washbasin', 'hand blower', 'tub' etc. might be related to sink.
        // 'refrigerator', 'icebox' etc.
        
        if (missionType == MissionType.cameraSink) {
          // Sink 관련 키워드 확장
          for (final prediction in predictions) {
             final label = (prediction['label'] as String).toLowerCase();
             final confidence = prediction['confidence'] as double;
             if (confidence >= 0.4 && 
                 (label.contains('washbasin') || label.contains('tub') || label.contains('sink'))) {
                return MissionValidationResult(isSuccess: true, message: "세면대 인식 성공", detectedLabels: detectedLabelStrings);
             }
          }
        } else if (targetKeyword.isNotEmpty) {
           for (final prediction in predictions) {
             final label = (prediction['label'] as String).toLowerCase();
             final confidence = prediction['confidence'] as double;
             if (confidence >= 0.4 && label.contains(targetKeyword.toLowerCase())) {
               return MissionValidationResult(
                 isSuccess: true, 
                 message: "$targetKeyword 인식 성공", 
                 detectedLabels: detectedLabelStrings
               );
             }
           }
        }
      }
    } catch (e) {
      debugPrint('Object detection error: $e');
    }

    String failMessage = "물체 탐색 중";
    if (referenceFile != null) {
        // 유사도가 0이어도 표시하여 디버깅 지원
        failMessage = "비슷한 물체 찾는 중 (유사도: ${(maxSimilarity * 100).toInt()}%)";
    }

    return MissionValidationResult(
      isSuccess: false, 
      message: failMessage, 
      detectedLabels: detectedLabelStrings,
      similarity: maxSimilarity, // 실패 시에도 유사도 전달
    );
  }

  // TFLite Inference Core
  List<Map<String, dynamic>> _runInference(img.Image image) {
    if (_interpreter == null) return [];

    // 1. Center Crop (Focus on center)
    // 화면 중앙(십자가) 부분에 집중하기 위해 크롭 영역을 더 좁힘 (0.7 -> 0.5)
    // 사용자 요청: "가운데 십자가 부분에 맞춘 물체를 우선적으로 인식하게"
    int baseSize = math.min(image.width, image.height);
    // 중앙 50% 영역만 크롭 (더 좁은 시야로 중앙 집중)
    int size = (baseSize * 0.5).toInt(); 
    if (size <= 0 || size > baseSize) {
      size = baseSize;
    }
    final cropped = img.copyCrop(
      image, 
      x: (image.width - size) ~/ 2, 
      y: (image.height - size) ~/ 2, 
      width: size, 
      height: size
    );
    final resized = img.copyResize(cropped, width: 224, height: 224);

    // 2. Preprocess Input (Uint8 [1, 224, 224, 3])
    // MobileNet Quantized expects 0-255 values
    final input = _imageToByteListUint8(resized, 224);

    // 3. Output Buffer [1, 1001]
    // Output tensor shape depends on model, usually [1, 1001] for MobileNet
    final output = List.filled(1 * 1001, 0).reshape([1, 1001]);

    // 4. Run
    _interpreter!.run(input, output);

    // 5. Post-process
    final outputList = output[0] as List<dynamic>;
    List<Map<String, dynamic>> results = [];
    _lastInferenceVector = []; // Reset

    for (var i = 0; i < outputList.length; i++) {
      // Quantized model output is 0-255 (uint8) usually mapped to probability
      // But TFLite Flutter usually returns the raw tensor data.
      // If output tensor type is uint8, it's 0-255.
      // If float32, it's 0.0-1.0.
      // MobileNet Quant output is uint8.
      int value = outputList[i];
      _lastInferenceVector.add(value / 255.0); // Store normalized vector

      if (value > 0) {
        // label index might need offset if background is 0
        // label index might need offset if background is 0
        String label = (i < _labels.length) ? _labels[i] : "Unknown";
        // Ignore 'background' if it's index 0 and has high score? 
        // Usually index 0 is background.
        
        results.add({
          'label': label,
          'confidence': value / 255.0,
          'index': i
        });
      }
    }

    // Sort by confidence
    results.sort((a, b) => (b['confidence'] as double).compareTo(a['confidence'] as double));

    return results;
  }

  List<double> _runEfficientNetVector(img.Image image) {
    if (_efficientNetInterpreter == null) return [];

    // 사용자 요청: "가운데 십자가 부분에 맞춘 물체를 우선적으로 인식하게"
    // EfficientNet 벡터 추출 시에도 중앙 50% 영역을 사용하여 중앙 물체 특징을 더 강하게 반영
    int baseSize = math.min(image.width, image.height);
    int size = (baseSize * 0.5).toInt(); // 0.7 -> 0.5
    if (size <= 0 || size > baseSize) {
      size = baseSize;
    }
    final cropped = img.copyCrop(
      image,
      x: (image.width - size) ~/ 2,
      y: (image.height - size) ~/ 2,
      width: size,
      height: size,
    );
    final resized = img.copyResize(cropped, width: 224, height: 224);

    final input = _imageToByteListUint8(resized, 224);

    final outputTensor = _efficientNetInterpreter!.getOutputTensor(0);
    final shape = outputTensor.shape;
    final output = List.filled(shape.reduce((a, b) => a * b), 0).reshape(shape);

    _efficientNetInterpreter!.run(input, output);

    debugPrint('EfficientNet raw output type: ${output.runtimeType}');
    debugPrint('EfficientNet output shape: ${output.shape}');
    debugPrint('EfficientNet output length: ${output.length}');
    if (output.isNotEmpty) {
      debugPrint('EfficientNet output[0] type: ${output[0].runtimeType}');
      if (output[0] is List<dynamic>) {
        debugPrint('EfficientNet output[0] length: ${(output[0] as List<dynamic>).length}');
        // 첫 5개 값 샘플 출력
        final sampleList = output[0] as List<dynamic>;
        if (sampleList.length > 5) {
          debugPrint('EfficientNet output[0] first 5 values: ${sampleList.take(5).toList()}');
        }
      } else if (output[0] is num) {
        debugPrint('EfficientNet output[0] value: ${output[0]}');
        // 첫 5개 값 샘플 출력
        if (output.length > 5) {
          debugPrint('EfficientNet first 5 values: ${output.take(5).toList()}');
        }
      }
    }
    
    if (output.isEmpty) {
      debugPrint('Warning: EfficientNet output is empty');
      return [];
    }

    // 출력 형식에 따른 다양한 처리
    List<double> lastEfficientNetVector = [];
    
    if (output[0] is List<dynamic>) {
      final outputList = output[0] as List<dynamic>;
      debugPrint('EfficientNet output[0] length: ${outputList.length}');
      
      for (var i = 0; i < outputList.length; i++) {
        if (outputList[i] is num) {
          final value = (outputList[i] as num).toDouble();
          lastEfficientNetVector.add(value);
        } else {
          debugPrint('Warning: Non-numeric value in outputList at index $i: ${outputList[i]}');
          lastEfficientNetVector.add(0.0);
        }
      }
    } else if (output[0] is num) {
      // 1D 배열인 경우
      for (var i = 0; i < output.length; i++) {
        if (output[i] is num) {
          final value = (output[i] as num).toDouble();
          lastEfficientNetVector.add(value);
        } else {
          debugPrint('Warning: Non-numeric value in output at index $i: ${output[i]}');
          lastEfficientNetVector.add(0.0);
        }
      }
    } else {
      debugPrint('Warning: Unknown output format: ${output[0].runtimeType}');
      return [];
    }

    // 벡터 정규화 (L2 정규화)
    if (lastEfficientNetVector.isNotEmpty) {
      double norm = 0.0;
      for (final value in lastEfficientNetVector) {
        norm += value * value;
      }
      norm = math.sqrt(norm);
      
      if (norm > 0) {
        for (int i = 0; i < lastEfficientNetVector.length; i++) {
          lastEfficientNetVector[i] = lastEfficientNetVector[i] / norm;
        }
        debugPrint('EfficientNet vector normalized (norm: $norm)');
      }
    }

    return List<double>.from(lastEfficientNetVector);
  }

  static int computeMatchScore(double sim, double simEff, double texture, bool labelMatch) {
    int score = 0;
    if (sim >= 0.75) {
      score += 2;
    } else if (sim >= 0.65) {
      score += 1;
    }
    if (simEff >= 0.75) {
      score += 2;
    } else if (simEff >= 0.65) {
      score += 1;
    }
    if (labelMatch) {
      score += 1;
    }
    if (texture >= 0.04) {
      score += 1;
    }
    return score;
  }

  static bool shouldSucceed(double bestSim, double texture, int score) {
    if (bestSim >= 0.75 && texture >= 0.03) {
      return true;
    }
    if (score >= 3) {
      return true;
    }
    return false;
  }
  static bool shouldRejectBackground(bool isBackground, double texture, double bestSim) {
    if (!isBackground) return false;
    if (texture < 0.02) return true;
    if (bestSim < 0.5) return true;
    return false;
  }

  double _cosineSimilarity(List<double> a, List<double> b) {
    if (a.isEmpty || b.isEmpty || a.length != b.length) {
      return 0.0;
    }
    double dot = 0.0;
    double normA = 0.0;
    double normB = 0.0;
    for (int i = 0; i < a.length; i++) {
      final va = a[i];
      final vb = b[i];
      dot += va * vb;
      normA += va * va;
      normB += vb * vb;
    }
    if (normA == 0 || normB == 0) return 0.0;
    return dot / (math.sqrt(normA) * math.sqrt(normB));
  }

  Uint8List _imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    int pixelIndex = 0;
    
    // img.Image stores as ABGR or similar depending on version.
    // We need RGB.
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        // int r = pixel.r.toInt();
        // int g = pixel.g.toInt();
        // int b = pixel.b.toInt();
        // image package v4 access
        convertedBytes[pixelIndex++] = pixel.r.toInt();
        convertedBytes[pixelIndex++] = pixel.g.toInt();
        convertedBytes[pixelIndex++] = pixel.b.toInt();
      }
    }
    return convertedBytes;
  }

  img.Image _centerCrop(img.Image image, double ratio) {
    final w = image.width;
    final h = image.height;
    final cw = (w * ratio).round().clamp(1, w);
    final ch = (h * ratio).round().clamp(1, h);
    final x = ((w - cw) / 2).round();
    final y = ((h - ch) / 2).round();
    return img.copyCrop(image, x: x, y: y, width: cw, height: ch);
  }

  // YUV420 -> Image (RGB) 변환
  img.Image? _convertYUV420ToImage(CameraImage image, int rotation, [int step = 4]) {
    try {
      final int width = image.width;
      final int height = image.height;
      final int uvRowStride = image.planes[1].bytesPerRow;
      final int uvPixelStride = image.planes[1].bytesPerPixel ?? 1;

      final int outWidth = (width / step).ceil();
      final int outHeight = (height / step).ceil();

      var buffer = img.Image(width: outWidth, height: outHeight);

      for (int y = 0; y < height; y += step) {
        for (int x = 0; x < width; x += step) {
          final int uvIndex = uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
          final int index = y * width + x;

          if (index >= image.planes[0].bytes.length) continue;
          final yp = image.planes[0].bytes[index];
          
          if (uvIndex >= image.planes[1].bytes.length || uvIndex >= image.planes[2].bytes.length) continue;
          final up = image.planes[1].bytes[uvIndex];
          final vp = image.planes[2].bytes[uvIndex];

          int r = (yp + 1.402 * (vp - 128)).toInt();
          int g = (yp - 0.344136 * (up - 128) - 0.714136 * (vp - 128)).toInt();
          int b = (yp + 1.772 * (up - 128)).toInt();

          buffer.setPixelRgb(x ~/ step, y ~/ step, r.clamp(0, 255), g.clamp(0, 255), b.clamp(0, 255));
        }
      }

      // 회전 처리
      if (rotation != 0) {
        buffer = img.copyRotate(buffer, angle: rotation);
      }
      return buffer;
    } catch (e) {
      debugPrint("Error converting image: $e");
      return null;
    }
  }

  // ML Kit용 InputImage 생성 (얼굴 인식 전용)
  InputImage? _inputImageFromCameraImage(CameraImage image, CameraDescription camera) {
    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation = _orientations[sensorOrientation];
      if (rotationCompensation == null) return null;
      rotation = rotationCompensation;
    }
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    final validFormat = format ?? InputImageFormat.nv21;

    if (image.planes.isEmpty) return null;

    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final metadata = InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: rotation,
      format: validFormat,
      bytesPerRow: image.planes[0].bytesPerRow,
    );

    return InputImage.fromBytes(bytes: bytes, metadata: metadata);
  }

  static final _orientations = {
    0: InputImageRotation.rotation0deg,
    90: InputImageRotation.rotation90deg,
    180: InputImageRotation.rotation180deg,
    270: InputImageRotation.rotation270deg,
  };
  


  // 이미지 밝기 계산 (0.0 ~ 1.0)
  double _calculateImageBrightness(img.Image image) {
    double totalBrightness = 0.0;
    int pixelCount = 0;
    
    for (final pixel in image) {
      // RGB를 밝기 값으로 변환 (0.299*R + 0.587*G + 0.114*B)
      final brightness = (0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b) / 255.0;
      totalBrightness += brightness;
      pixelCount++;
    }
    
    return totalBrightness / pixelCount;
  }

  double _calculateTextureComplexity(img.Image image) {
    double sum = 0.0;
    double sumSq = 0.0;
    int count = 0;
    for (final pixel in image) {
      final v = (0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b) / 255.0;
      sum += v;
      sumSq += v * v;
      count++;
    }
    if (count == 0) return 0.0;
    final mean = sum / count;
    final variance = (sumSq / count) - mean * mean;
    return variance.abs();
  }

  static Rect overlayROIRectInt(int width, int height) {
    final roiW = (width * 0.8).round();
    final roiH = (height * 0.45).round();
    final left = ((width - roiW) / 2).round();
    final top = (height * 0.3).round();
    return Rect.fromLTWH(left.toDouble(), top.toDouble(), roiW.toDouble(), roiH.toDouble());
  }

  img.Image _cropToOverlayROI(img.Image image) {
    final roiW = (image.width * 0.8).round();
    final roiH = (image.height * 0.45).round();
    final left = ((image.width - roiW) / 2).round();
    final top = (image.height * 0.3).round();
    final x = left.clamp(0, image.width - 1);
    final y = top.clamp(0, image.height - 1);
    final w = roiW.clamp(1, image.width - x);
    final h = roiH.clamp(1, image.height - y);
    try {
      return img.copyCrop(image, x: x, y: y, width: w, height: h);
    } catch (_) {
      return image;
    }
  }
  void dispose() {
    _interpreter?.close();
    _efficientNetInterpreter?.close();
    _faceDetector?.close();
    _objectDetector?.close();
    
    _interpreter = null;
    _efficientNetInterpreter = null;
    _faceDetector = null;
    _objectDetector = null;
    _isModelLoaded = false;
    debugPrint('MLService disposed and resources released');
  }
}
