import 'package:flutter_test/flutter_test.dart';
import 'package:snap_alarm/services/ml_service.dart';

void main() {
  group('MLService logic', () {
    test('strong match succeeds by threshold', () {
      final bestSim = 0.76;
      final texture = 0.031;
      final score = MLService.computeMatchScore(0.76, 0.10, texture, false);
      final ok = MLService.shouldSucceed(bestSim, texture, score);
      expect(ok, isTrue);
    });

    test('score-based success when combined signals reach 3', () {
      final sim = 0.70;
      final simEff = 0.70;
      final texture = 0.02;
      final score = MLService.computeMatchScore(sim, simEff, texture, true);
      final bestSim = simEff > sim ? simEff : sim;
      final ok = MLService.shouldSucceed(bestSim, texture, score);
      expect(ok, isTrue);
    });

    test('insufficient similarity and score fails', () {
      final sim = 0.64;
      final simEff = 0.60;
      final texture = 0.025;
      final score = MLService.computeMatchScore(sim, simEff, texture, false);
      final bestSim = simEff > sim ? simEff : sim;
      final ok = MLService.shouldSucceed(bestSim, texture, score);
      expect(ok, isFalse);
    });
  });
}
