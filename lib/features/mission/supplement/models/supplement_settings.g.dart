// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplement_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SupplementSettingsAdapter extends TypeAdapter<SupplementSettings> {
  @override
  final int typeId = 9;

  @override
  SupplementSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SupplementSettings(
      dailyGoal: fields[0] as int,
      isAlarmEnabled: fields[1] as bool,
      reminderTimes: (fields[2] as List).cast<String>(),
      defaultSnoozeInterval: fields[3] as int,
      ringtonePath: fields[4] as String?,
      volume: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SupplementSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dailyGoal)
      ..writeByte(1)
      ..write(obj.isAlarmEnabled)
      ..writeByte(2)
      ..write(obj.reminderTimes)
      ..writeByte(3)
      ..write(obj.defaultSnoozeInterval)
      ..writeByte(4)
      ..write(obj.ringtonePath)
      ..writeByte(5)
      ..write(obj.volume);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupplementSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
