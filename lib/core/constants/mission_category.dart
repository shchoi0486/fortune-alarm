import 'package:hive/hive.dart';

part 'mission_category.g.dart';

@HiveType(typeId: 5)
enum MissionCategory {
  @HiveField(0)
  health,
  @HiveField(1)
  study,
  @HiveField(2)
  routine,
  @HiveField(3)
  hobby,
  @HiveField(4)
  other
}
