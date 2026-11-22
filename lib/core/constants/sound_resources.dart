/// 알람 사운드 경로 ↔ Android `res/raw` 리소스 매핑.
///
/// ## 왜 필요한가
/// `AlarmModel.ringtonePath`는 `ringtone_select_screen`이
/// `"<카테고리>/<파일명>"` (예: `"Standard/morning"`, `"Upbeat/산뜻한 하루"`)
/// 형태로 저장한다. 앱 내 재생은 `AssetSource('sounds/$path.ogg')`로 정상 동작하지만,
/// OS 알림 채널은 `RawResourceAndroidNotificationSound(name)` 를 쓰기 때문에
/// **bare 리소스 이름**이 반드시 필요하다. `"Category/name"` 을 그대로 넘기면
/// `android.resource://<pkg>/raw/Standard/morning` 이 되어 해석에 실패하고,
/// 그 채널은 사운드가 고정(생성 후 변경 불가)되어 **영구히 무음**이 된다.
///
/// ## 전략
/// 1. 경로에서 파일명만 추출한다.
/// 2. `res/raw`에 실제로 존재하는(=`_availableRawSounds`) 이름이면 그대로 사용한다.
/// 3. 없으면 raw 사운드를 지정하지 않는다. 이 경우 알림 채널은 시스템 기본 알림음으로
///    울리고, 실제 벨소리는 앱 내 `AudioPlayer`가 재생한다.
///    (조용해지는 것보다 확실히 낫다. APK에 사운드를 복제하면 +30MB.)
library;

/// `android/app/src/main/res/raw` 에 존재하는 사운드 리소스 이름들.
///
/// 새 벨소스를 추가할 때 리소스를 함께 추가한 뒤 이 목록에도 넣어야 한다.
const Set<String> _availableRawSounds = {
  'alarm_sound',
  'birds',
  'cuckoo_cuckoo_clock',
  'discreet',
  'door_knock',
  'early_sunrise',
  'good_morning',
  'in_a_hurry',
  'loving_you',
  'morning',
  'siren_air_raid',
  'swinging',
  'telephone_busy_signal',
  'waves',
};

/// `AlarmModel.ringtonePath`에서 파일명 부분을 추출한다.
///
/// `"Standard/morning"` → `"morning"`, `"Upbeat/산뜻한 하루"` → `"산뜻한 하루"`,
/// `"morning"` → `"morning"`.
String? extractSoundFileName(String? ringtonePath) {
  if (ringtonePath == null) return null;
  var value = ringtonePath.trim();
  if (value.isEmpty || value == 'default') return null;

  value = value.replaceAll('\\', '/');
  final slashIndex = value.lastIndexOf('/');
  if (slashIndex != -1) {
    value = value.substring(slashIndex + 1);
  }

  // 확장어가 붙어 저장된 경우 제거
  final dotIndex = value.lastIndexOf('.');
  if (dotIndex > 0) {
    value = value.substring(0, dotIndex);
  }

  value = value.trim();
  if (value.isEmpty) return null;
  return value;
}

/// `ringtonePath`에 대응하는 `res/raw` 리소스 이름을 반환한다.
/// 매칭되는 리소스가 없으면 `null` (호출자는 사운드 미지정으로 처리).
String? resolveRawSoundName(String? ringtonePath) {
  final fileName = extractSoundFileName(ringtonePath);
  if (fileName == null) return null;
  if (!_availableRawSounds.contains(fileName)) return null;
  return fileName;
}

/// 알림 채널 ID에 사용할 수 있도록 문자열을 정규화한다.
///
/// 채널 ID가 `"Upbeat/산뜻한 하루"` 같은 형태면 Android 채널 관리가 불안정해지므로
/// 소문자 + `[a-z0-9_]` 만 남긴다. 비어 있으면 접두어만 남긴다.
String sanitizeChannelSuffix(String? value) {
  if (value == null) return 'default';
  final sanitized = value
      .toLowerCase()
      .replaceAll(RegExp('[^a-z0-9]+'), '_')
      .replaceAll(RegExp('^_+|_+\$'), '');
  return sanitized.isEmpty ? 'default' : sanitized;
}

/// 알람 채널 ID를 만든다.
///
/// raw 사운드로 해석되면 벨소리별 채널을 만들고, 그렇지 않으면 공유 기본 채널을 쓴다.
/// (채널 사운드는 생성 후 변경할 수 없으므로 해석 실패 사운드들이 한 채널에 몰려야 한다.)
String buildAlarmChannelId(String? ringtonePath) {
  final rawSound = resolveRawSoundName(ringtonePath);
  return 'alarm_channel_${sanitizeChannelSuffix(rawSound)}_v2';
}

/// 사운드를 끈 알람 전용 채널.
/// 채널 사운드는 생성 후 변경할 수 없으므로, 유효한 벨소리 채널과 섞으면 안 된다.
String buildSilentAlarmChannelId() => 'alarm_channel_silent_v2';
