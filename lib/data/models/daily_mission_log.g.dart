// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_mission_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyMissionLogAdapter extends TypeAdapter<DailyMissionLog> {
  @override
  final int typeId = 4;

  @override
  DailyMissionLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyMissionLog(
      dateKey: fields[0] as String,
      completedMissionIds: (fields[1] as List).cast<String>(),
      isGoalAchieved: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DailyMissionLog obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateKey)
      ..writeByte(1)
      ..write(obj.completedMissionIds)
      ..writeByte(2)
      ..write(obj.isGoalAchieved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyMissionLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
