// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplement_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SupplementLogAdapter extends TypeAdapter<SupplementLog> {
  @override
  final int typeId = 8;

  @override
  SupplementLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SupplementLog(
      dateKey: fields[0] as String,
      currentCount: fields[1] as int,
      isGoalAchieved: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SupplementLog obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateKey)
      ..writeByte(1)
      ..write(obj.currentCount)
      ..writeByte(2)
      ..write(obj.isGoalAchieved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupplementLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
