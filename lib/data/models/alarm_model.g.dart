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
    return AlarmModel(
      id: fields[0] as String,
      time: fields[1] as DateTime,
      isEnabled: fields[2] as bool,
      missionType: fields[3] as MissionType,
      label: fields[4] as String,
      referenceImagePaths: (fields[14] as List?)?.cast<String>(),
      repeatDays: (fields[6] as List).cast<bool>(),
      isVibrationEnabled: fields[7] as bool,
      isSoundEnabled: fields[8] as bool,
      volume: fields[9] as double,
      ringtonePath: fields[10] as String?,
      vibrationPattern: fields[11] as String?,
      isGradualVolume: fields[12] as bool,
      backgroundPath: fields[13] as String?,
      snoozeInterval: fields[15] as int,
      maxSnoozeCount: fields[16] as int,
      missionOrder: fields[17] as int,
      remainingSnoozeCount: fields[18] as int,
      mathDifficulty: fields[19] as MathDifficulty,
      mathProblemCount: fields[20] as int,
      shakeCount: fields[21] == null ? 50 : fields[21] as int,
      walkStepCount: fields[22] == null ? 20 : fields[22] as int,
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
