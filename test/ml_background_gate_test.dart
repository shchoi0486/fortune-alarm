import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_alarm/services/ml_service.dart';

void main() {
  group('Background gate', () {
    test('rejects when background with low texture', () {
      final reject = MLService.shouldRejectBackground(true, 0.015, 0.8);
      expect(reject, isTrue);
    });
    test('rejects when background with low similarity', () {
      final reject = MLService.shouldRejectBackground(true, 0.05, 0.4);
      expect(reject, isTrue);
    });
    test('passes when not background', () {
      final reject = MLService.shouldRejectBackground(false, 0.01, 0.3);
      expect(reject, isFalse);
    });
    test('passes when background but texture and similarity are good', () {
      final reject = MLService.shouldRejectBackground(true, 0.05, 0.7);
      expect(reject, isFalse);
    });
  });
}
