// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionCategoryAdapter extends TypeAdapter<MissionCategory> {
  @override
  final int typeId = 5;

  @override
  MissionCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MissionCategory.health;
      case 1:
        return MissionCategory.study;
      case 2:
        return MissionCategory.routine;
      case 3:
        return MissionCategory.hobby;
      case 4:
        return MissionCategory.other;
      default:
        return MissionCategory.health;
    }
  }

  @override
  void write(BinaryWriter writer, MissionCategory obj) {
    switch (obj) {
      case MissionCategory.health:
        writer.writeByte(0);
        break;
      case MissionCategory.study:
        writer.writeByte(1);
        break;
      case MissionCategory.routine:
        writer.writeByte(2);
        break;
      case MissionCategory.hobby:
        writer.writeByte(3);
        break;
      case MissionCategory.other:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
