import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:snap_alarm/features/mission_camera/mission_camera_screen.dart';

void main() {
  test('CameraOverlayPainter.getFrameRect computes expected geometry', () {
    const size = Size(1080, 1920);
    final rect = CameraOverlayPainter.getFrameRect(size);
    expect(rect.width, closeTo(size.width * 0.8, 0.0001));
    expect(rect.height, closeTo(size.height * 0.45, 0.0001));
    expect(rect.left, closeTo((size.width - size.width * 0.8) / 2, 0.0001));
    expect(rect.top, closeTo(size.height * 0.3, 0.0001));
  });
}
