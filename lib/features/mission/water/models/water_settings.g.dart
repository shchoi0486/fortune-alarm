// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterSettingsAdapter extends TypeAdapter<WaterSettings> {
  @override
  final int typeId = 7;

  @override
  WaterSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterSettings(
      dailyGoal: fields[0] as int,
      cupSize: fields[1] as int,
      isAlarmEnabled: fields[2] as bool,
      startTime: fields[3] as String,
      endTime: fields[4] as String,
      intervalMinutes: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WaterSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dailyGoal)
      ..writeByte(1)
      ..write(obj.cupSize)
      ..writeByte(2)
      ..write(obj.isAlarmEnabled)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.intervalMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
