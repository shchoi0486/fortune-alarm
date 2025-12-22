// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'math_difficulty.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MathDifficultyAdapter extends TypeAdapter<MathDifficulty> {
  @override
  final int typeId = 2;

  @override
  MathDifficulty read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MathDifficulty.easy;
      case 1:
        return MathDifficulty.normal;
      case 2:
        return MathDifficulty.hard;
      default:
        return MathDifficulty.easy;
    }
  }

  @override
  void write(BinaryWriter writer, MathDifficulty obj) {
    switch (obj) {
      case MathDifficulty.easy:
        writer.writeByte(0);
        break;
      case MathDifficulty.normal:
        writer.writeByte(1);
        break;
      case MathDifficulty.hard:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MathDifficultyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
