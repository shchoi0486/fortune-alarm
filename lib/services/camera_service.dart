import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider = StateNotifierProvider<CameraServiceNotifier, CameraController?>((ref) {
  return CameraServiceNotifier();
});

class CameraServiceNotifier extends StateNotifier<CameraController?> {
  CameraServiceNotifier() : super(null);

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        // 기본적으로 첫 번째 카메라(후면) 사용
        final controller = CameraController(
          cameras[0],
          ResolutionPreset.medium,
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

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}
