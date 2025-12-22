import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_alarm/features/mission_camera/mission_camera_screen.dart';

void main() {
  test('CameraOverlayPainter.getFrameCenter returns rect center', () {
    const size = Size(1080, 1920);
    final rect = CameraOverlayPainter.getFrameRect(size);
    final center = CameraOverlayPainter.getFrameCenter(size);
    expect(center.dx, closeTo(rect.center.dx, 0.0001));
    expect(center.dy, closeTo(rect.center.dy, 0.0001));
  });
}
