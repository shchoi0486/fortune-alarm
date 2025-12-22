import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_alarm/services/ml_service.dart';

void main() {
  test('overlay ROI rect computes expected geometry', () {
    const width = 1000;
    const height = 2000;
    final rect = MLService.overlayROIRectInt(width, height);
    expect(rect.width, closeTo(width * 0.8, 0.5));
    expect(rect.height, closeTo(height * 0.45, 0.5));
    expect(rect.left, closeTo((width - width * 0.8) / 2, 0.5));
    expect(rect.top, closeTo(height * 0.3, 0.5));
  });
}
