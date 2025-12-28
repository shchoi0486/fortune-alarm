import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import '../core/constants/mission_type.dart';
import 'ml_service.dart'; // Import MissionValidationResult

class MLService {
  Future<void> initialize() async {
    debugPrint("MLService stub: initialize called (Web)");
  }

  Future<List<Map<String, dynamic>>> getLabelsFromFile(dynamic imageFile) async {
     debugPrint("MLService stub: getLabelsFromFile called (Web)");
     return [];
  }

  Future<List<String>> extractLabelsFromImage(dynamic imageFile) async {
    debugPrint("MLService stub: extractLabelsFromImage called (Web)");
    return [];
  }

  Future<MissionValidationResult> validateMissionLabels({
    required CameraImage cameraImage,
    required CameraDescription camera,
    required MissionType missionType,
    List<String>? targetLabels,
    dynamic referenceFile,
    bool fastStart = false,
  }) async {
    debugPrint("MLService stub: validateMissionLabels called (Web)");
    return MissionValidationResult(isSuccess: true, message: "Web validation skipped (Not supported)");
  }

  static int computeMatchScore(double sim, double simEff, double texture, bool labelMatch) {
    return 0;
  }

  static bool shouldSucceed(double bestSim, double texture, int score) {
    return true; // Always succeed on web for now? Or fail?
  }
  
  static bool shouldRejectBackground(bool isBackground, double texture, double bestSim) {
    return false;
  }

  static dynamic overlayROIRectInt(int width, int height) {
    // Return something compatible if needed, or dynamic
    return null;
  }

  void dispose() {
    debugPrint("MLService stub: dispose called (Web)");
  }
}
