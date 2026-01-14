// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionModelAdapter extends TypeAdapter<MissionModel> {
  @override
  final int typeId = 3;

  @override
  MissionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MissionModel(
      id: fields[0] as String,
      title: fields[1] as String,
      icon: fields[2] as String,
      isSystemMission: fields[3] as bool,
      category: fields[4] as MissionCategory,
      alarmTime: fields[5] as String?,
      isAlarmEnabled: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MissionModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.isSystemMission)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.alarmTime)
      ..writeByte(6)
      ..write(obj.isAlarmEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
