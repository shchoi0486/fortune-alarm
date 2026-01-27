import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider = StateNotifierProvider<CameraServiceNotifier, CameraController?>((ref) {
  return CameraServiceNotifier();
});

class CameraServiceNotifier extends StateNotifier<CameraController?> {
  CameraServiceNotifier() : super(null);

  static List<CameraDescription>? _cachedCameras;
  bool _isInitializing = false;

  Future<void> initializeCamera({CameraLensDirection? lensDirection}) async {
    if (_isInitializing) {
      debugPrint('[CameraService] Already initializing, ignoring request.');
      return;
    }
    
    // 이미 해당 방향으로 초기화되어 있다면 무시
    if (state != null && 
        state!.value.isInitialized && 
        (lensDirection == null || state!.description.lensDirection == lensDirection)) {
      debugPrint('[CameraService] Camera already initialized for direction: ${lensDirection ?? 'default'}');
      return;
    }
    
    _isInitializing = true;
    debugPrint('[CameraService] Starting camera initialization for direction: ${lensDirection ?? 'back'}');
    
    try {
      // 다른 방향으로 초기화되어 있다면 기존 것 해제
      if (state != null) {
        debugPrint('[CameraService] Disposing existing camera controller...');
        final oldController = state;
        state = null; // UI에 로딩 상태를 알리기 위해 먼저 null 설정
        await oldController?.dispose();
        // OS가 카메라 리소스를 해제할 시간을 주기 위해 짧은 지연 추가
        await Future.delayed(const Duration(milliseconds: 200));
      }
      
      _cachedCameras ??= await availableCameras();
      if (_cachedCameras == null || _cachedCameras!.isEmpty) {
        debugPrint('[CameraService] No cameras available. Retrying once...');
        _cachedCameras = await availableCameras();
      }

      if (_cachedCameras != null && _cachedCameras!.isNotEmpty) {
        // 원하는 방향의 카메라 찾기 (기본값은 후면)
        final direction = lensDirection ?? CameraLensDirection.back;
        CameraDescription? selectedCamera = _cachedCameras!.firstWhere(
          (camera) => camera.lensDirection == direction,
          orElse: () => _cachedCameras![0],
        );

        debugPrint('[CameraService] Selected camera: ${selectedCamera.name}, direction: ${selectedCamera.lensDirection}');

        final controller = CameraController(
          selectedCamera,
          ResolutionPreset.medium, // 초기화 호환성 및 속도를 위해 medium 유지
          enableAudio: false,
          imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.yuv420 : ImageFormatGroup.bgra8888,
        );
        
        try {
          await controller.initialize().timeout(const Duration(seconds: 5));
          debugPrint('[CameraService] Camera controller initialized successfully.');
          state = controller;
        } catch (e) {
          debugPrint('[CameraService] Controller initialization timeout or error: $e');
          await controller.dispose();
          state = null;
        }
      } else {
        debugPrint('[CameraService] Failed to find any available cameras.');
        state = null;
      }
    } catch (e) {
      debugPrint('[CameraService] Camera initialization failed: $e');
      state = null;
    } finally {
      _isInitializing = false;
    }
  }

  Future<void> switchCamera() async {
    if (state == null) return;
    final newDirection = state!.description.lensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;
    await initializeCamera(lensDirection: newDirection);
  }

  Future<void> disposeCamera() async {
    if (state != null) {
      final controller = state;
      state = null; // 상태를 먼저 null로 설정하여 UI에서 즉시 반응하도록 함
      await controller?.dispose();
    }
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}
