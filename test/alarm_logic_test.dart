import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_alarm/services/alarm_scheduler_service.dart';

void main() {
  group('AlarmSchedulerService.calculateNextTime Tests', () {
    // 2026-03-29 (일요일) 08:00 기준 테스트
    final DateTime sunday0800 = DateTime(2026, 3, 29, 8, 0);

    test('동일 요일, 1분 이상의 미래 시간이면 오늘 당일 알람 반환', () {
      final referenceTime = DateTime(2026, 3, 29, 7, 50); // 7:50 AM (10분 전)
      final repeatDays = List.generate(7, (_) => true); // 매일

      final result = AlarmSchedulerService.calculateNextTime(sunday0800, repeatDays, referenceTime: referenceTime);
      
      expect(result.year, 2026);
      expect(result.month, 3);
      expect(result.day, 29);
      expect(result.hour, 8);
      expect(result.minute, 0);
    });

    test('동일 요일, 1분 이내의 미래 시간이면 다음 예약 요일로 넘어감 (즉시 재울림 방지)', () {
      final referenceTime = DateTime(2026, 3, 29, 7, 59, 30); // 7:59:30 AM (30초 전)
      final repeatDays = List.generate(7, (_) => true); // 매일

      final result = AlarmSchedulerService.calculateNextTime(sunday0800, repeatDays, referenceTime: referenceTime);
      
      // 오늘이 아닌 내일(30일)로 예약되어야 함
      expect(result.day, 30);
      expect(result.hour, 8);
      expect(result.minute, 0);
    });

    test('동일 요일, 이미 지난 시간이면 다음 예약 요일로 넘어감', () {
      final referenceTime = DateTime(2026, 3, 29, 8, 5); // 8:05 AM (5분 지남)
      final repeatDays = List.generate(7, (_) => true); // 매일

      final result = AlarmSchedulerService.calculateNextTime(sunday0800, repeatDays, referenceTime: referenceTime);
      
      expect(result.day, 30);
      expect(result.hour, 8);
      expect(result.minute, 0);
    });

    test('특정 요일 반복 설정 시 다음 해당 요일을 정확히 계산함', () {
      final referenceTime = DateTime(2026, 3, 29, 8, 5); // 8:05 AM (일요일)
      // 월, 수, 금만 반복 (index 0, 2, 4)
      final repeatDays = [true, false, true, false, true, false, false]; 

      final result = AlarmSchedulerService.calculateNextTime(sunday0800, repeatDays, referenceTime: referenceTime);
      
      // 일요일 8:05에 체크했으므로 가장 가까운 월요일(30일)이 되어야 함
      expect(result.weekday, DateTime.monday);
      expect(result.day, 30);
      expect(result.hour, 8);
      expect(result.minute, 0);
    });

    test('금요일 밤에 월요일 알람을 기다리는 경우 (주말 건너뛰기)', () {
      final referenceTime = DateTime(2026, 3, 27, 23, 0); // 3월 27일 (금요일) 밤 11시
      // 월요일만 반복 (index 0)
      final repeatDays = [true, false, false, false, false, false, false]; 

      final result = AlarmSchedulerService.calculateNextTime(sunday0800, repeatDays, referenceTime: referenceTime);
      
      // 다음 월요일인 3월 30일이 되어야 함
      expect(result.year, 2026);
      expect(result.month, 3);
      expect(result.day, 30);
      expect(result.weekday, DateTime.monday);
    });

    test('반복 설정이 하나도 없는 경우 Fallback으로 내일 시간을 반환함', () {
      final referenceTime = DateTime(2026, 3, 29, 8, 0); 
      final repeatDays = List.generate(7, (_) => false); // 반복 없음

      final result = AlarmSchedulerService.calculateNextTime(sunday0800, repeatDays, referenceTime: referenceTime);
      
      expect(result.day, 30);
    });
  });
}
