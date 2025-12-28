import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider = StateNotifierProvider<CameraServiceNotifier, CameraController?>((ref) {
  return CameraServiceNotifier();
});

class CameraServiceNotifier extends StateNotifier<CameraController?> {
  CameraServiceNotifier() : super(null);

  static List<CameraDescription>? _cachedCameras;

  Future<void> initializeCamera() async {
    if (state != null && state!.value.isInitialized) return;
    
    try {
      _cachedCameras ??= await availableCameras();
      if (_cachedCameras != null && _cachedCameras!.isNotEmpty) {
        // 기본적으로 첫 번째 카메라(후면) 사용
        final controller = CameraController(
          _cachedCameras![0],
          ResolutionPreset.low, // 성능 최적화를 위해 해상도 낮춤 (medium -> low)
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.yuv420,
        );
        await controller.initialize();
        state = controller;
      }
    } catch (e) {
      // 카메라 초기화 실패 처리
      debugPrint('Camera initialization failed: $e');
    }
  }

  void disposeCamera() {
    state?.dispose();
    state = null;
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}
