// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmModelAdapter extends TypeAdapter<AlarmModel> {
  @override
  final int typeId = 0;

  @override
  AlarmModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    // 이전 빌드가 저장한 레코드는 필드가 없을 수 있다.
    // null 가드 없이 캐스팅하면 예외가 openBox 전체를 실패시켜
    // 박스의 모든 알람을 읽을 수 없게 만든다.
    final maxSnooze = (fields[16] as int?) ?? 3;
    return AlarmModel(
      id: fields[0] as String,
      time: fields[1] as DateTime,
      isEnabled: (fields[2] as bool?) ?? true,
      missionType: (fields[3] as MissionType?) ?? MissionType.none,
      label: (fields[4] as String?) ?? '',
      referenceImagePaths: (fields[14] as List?)?.cast<String>(),
      repeatDays: (fields[6] as List?)?.cast<bool>() ??
          const [false, false, false, false, false, false, false],
      isVibrationEnabled: (fields[7] as bool?) ?? true,
      isSoundEnabled: (fields[8] as bool?) ?? true,
      volume: (fields[9] as num?)?.toDouble() ?? 1.0,
      ringtonePath: fields[10] as String?,
      vibrationPattern: fields[11] as String?,
      isGradualVolume: (fields[12] as bool?) ?? false,
      backgroundPath: fields[13] as String?,
      snoozeInterval: (fields[15] as int?) ?? 5,
      maxSnoozeCount: maxSnooze,
      missionOrder: (fields[17] as int?) ?? 0,
      // 레거시 레코드에 이 필드가 없으면 허용 횟수에서 초기화한다.
      // (스누즈 알람 레코드일 경우 이 값이 남은 횟수를 결정하므로 0 이면
      //  스누즈 버튼이 사라져 체인이 끊긴다)
      remainingSnoozeCount: (fields[18] as int?) ?? maxSnooze,
      mathDifficulty: (fields[19] as MathDifficulty?) ?? MathDifficulty.normal,
      mathProblemCount: (fields[20] as int?) ?? 3,
      shakeCount: (fields[21] as int?) ?? 50,
      walkStepCount: (fields[22] as int?) ?? 20,
    )..referenceImagePath = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, AlarmModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.isEnabled)
      ..writeByte(3)
      ..write(obj.missionType)
      ..writeByte(4)
      ..write(obj.label)
      ..writeByte(5)
      ..write(obj.referenceImagePath)
      ..writeByte(6)
      ..write(obj.repeatDays)
      ..writeByte(7)
      ..write(obj.isVibrationEnabled)
      ..writeByte(8)
      ..write(obj.isSoundEnabled)
      ..writeByte(9)
      ..write(obj.volume)
      ..writeByte(10)
      ..write(obj.ringtonePath)
      ..writeByte(11)
      ..write(obj.vibrationPattern)
      ..writeByte(12)
      ..write(obj.isGradualVolume)
      ..writeByte(13)
      ..write(obj.backgroundPath)
      ..writeByte(14)
      ..write(obj.referenceImagePaths)
      ..writeByte(15)
      ..write(obj.snoozeInterval)
      ..writeByte(16)
      ..write(obj.maxSnoozeCount)
      ..writeByte(17)
      ..write(obj.missionOrder)
      ..writeByte(18)
      ..write(obj.remainingSnoozeCount)
      ..writeByte(19)
      ..write(obj.mathDifficulty)
      ..writeByte(20)
      ..write(obj.mathProblemCount)
      ..writeByte(21)
      ..write(obj.shakeCount)
      ..writeByte(22)
      ..write(obj.walkStepCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
