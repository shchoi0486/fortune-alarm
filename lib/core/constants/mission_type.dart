import 'package:hive/hive.dart';

part 'mission_type.g.dart';

@HiveType(typeId: 1)
enum MissionType {
  @HiveField(0)
  none,
  @HiveField(1)
  cameraSink,
  @HiveField(2)
  cameraRefrigerator,
  @HiveField(3)
  cameraFace,
  @HiveField(4)
  math,
  @HiveField(5)
  quiz,
  @HiveField(6)
  fortune,
  @HiveField(7)
  cameraScale,
  @HiveField(8)
  cameraOther,
  @HiveField(9)
  shake,
  @HiveField(10)
  supplement,
}
