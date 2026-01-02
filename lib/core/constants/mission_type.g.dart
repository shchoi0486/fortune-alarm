// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionTypeAdapter extends TypeAdapter<MissionType> {
  @override
  final int typeId = 1;

  @override
  MissionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MissionType.none;
      case 1:
        return MissionType.cameraSink;
      case 2:
        return MissionType.cameraRefrigerator;
      case 3:
        return MissionType.cameraFace;
      case 4:
        return MissionType.math;
      case 6:
        return MissionType.fortune;
      case 7:
        return MissionType.cameraScale;
      case 8:
        return MissionType.cameraOther;
      case 9:
        return MissionType.shake;
      case 10:
        return MissionType.supplement;
      case 11:
        return MissionType.fortuneCatch;
      case 12:
        return MissionType.numberOrder;
      case 13:
        return MissionType.hiddenButton;
      case 15:
        return MissionType.tapSprint;
      case 16:
        return MissionType.leftRight;
      case 17:
        return MissionType.walk;
      case 18:
        return MissionType.faceDetection;
      default:
        return MissionType.none;
    }
  }

  @override
  void write(BinaryWriter writer, MissionType obj) {
    switch (obj) {
      case MissionType.none:
        writer.writeByte(0);
        break;
      case MissionType.cameraSink:
        writer.writeByte(1);
        break;
      case MissionType.cameraRefrigerator:
        writer.writeByte(2);
        break;
      case MissionType.cameraFace:
        writer.writeByte(3);
        break;
      case MissionType.math:
        writer.writeByte(4);
        break;
      case MissionType.fortune:
        writer.writeByte(6);
        break;
      case MissionType.cameraScale:
        writer.writeByte(7);
        break;
      case MissionType.cameraOther:
        writer.writeByte(8);
        break;
      case MissionType.shake:
        writer.writeByte(9);
        break;
      case MissionType.supplement:
        writer.writeByte(10);
        break;
      case MissionType.fortuneCatch:
        writer.writeByte(11);
        break;
      case MissionType.numberOrder:
        writer.writeByte(12);
        break;
      case MissionType.hiddenButton:
        writer.writeByte(13);
        break;
      case MissionType.tapSprint:
        writer.writeByte(15);
        break;
      case MissionType.leftRight:
        writer.writeByte(16);
        break;
      case MissionType.walk:
        writer.writeByte(17);
        break;
      case MissionType.faceDetection:
        writer.writeByte(18);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
