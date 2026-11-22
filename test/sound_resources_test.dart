import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_alarm/core/constants/sound_resources.dart';

void main() {
  group('extractSoundFileName', () {
    test('카테고리/파일명 경로에서 파일명만 추출', () {
      expect(extractSoundFileName('Standard/morning'), 'morning');
      expect(extractSoundFileName('Upbeat/산뜻한 하루'), '산뜻한 하루');
    });

    test('확장자가 포함된 경로도 정규화', () {
      expect(extractSoundFileName('Standard/morning.ogg'), 'morning');
      expect(extractSoundFileName('morning.ogg'), 'morning');
    });

    test('default/빈 값/null 은 null', () {
      expect(extractSoundFileName('default'), isNull);
      expect(extractSoundFileName(''), isNull);
      expect(extractSoundFileName(null), isNull);
    });

    test('역슬래시 구분자도 처리', () {
      expect(extractSoundFileName('Standard\\morning'), 'morning');
    });
  });

  group('resolveRawSoundName', () {
    test('raw 에 존재하는 이름이면 그대로 반환', () {
      expect(resolveRawSoundName('Standard/morning'), 'morning');
      expect(resolveRawSoundName('Loud/door_knock'), 'door_knock');
    });

    test('raw 에 없는 이름이면 null', () {
      expect(resolveRawSoundName('Upbeat/산뜻한 하루'), isNull);
      expect(resolveRawSoundName('Upbeat/nonexistent'), isNull);
    });

    test('null/default 는 null', () {
      expect(resolveRawSoundName(null), isNull);
      expect(resolveRawSoundName('default'), isNull);
    });
  });

  group('sanitizeChannelSuffix', () {
    test('경로 조각의 슬래시/한글/공백을 안전한 문자로 변환', () {
      expect(sanitizeChannelSuffix('morning'), 'morning');
      expect(sanitizeChannelSuffix('door_knock'), 'door_knock');
      expect(sanitizeChannelSuffix('Upbeat/방긋한 하루'), 'upbeat');
      expect(sanitizeChannelSuffix(''), 'default');
      expect(sanitizeChannelSuffix(null), 'default');
    });
  });

  group('buildAlarmChannelId', () {
    test('유효한 raw 사운드면 해당 채널', () {
      expect(buildAlarmChannelId('Standard/morning'), 'alarm_channel_morning_v2');
    });

    test('유효하지 않으면 default 채널', () {
      expect(buildAlarmChannelId('Upbeat/산뜻한 하루'), 'alarm_channel_default_v2');
      expect(buildAlarmChannelId(null), 'alarm_channel_default_v2');
    });
  });

  group('buildSilentAlarmChannelId', () {
    test('무음 전용 채널은 하나로 고정 (유효한 채널과 섞지 않음)', () {
      expect(buildSilentAlarmChannelId(), 'alarm_channel_silent_v2');
    });
  });
}
