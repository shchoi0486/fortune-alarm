
export 'ml_service_io.dart' if (dart.library.html) 'ml_service_web.dart';

class MissionValidationResult {
  final bool isSuccess;
  final String message;
  final double similarity;
  final List<String> detectedLabels;

  MissionValidationResult({
    required this.isSuccess,
    required this.message,
    this.similarity = 0.0,
    this.detectedLabels = const [],
  });
}
