import 'package:hive/hive.dart';

part 'water_log.g.dart';

@HiveType(typeId: 6)
class WaterLog extends HiveObject {
  @HiveField(0)
  final String dateKey; // "yyyy-MM-dd"

  @HiveField(1)
  int currentIntake;

  @HiveField(2)
  bool isGoalAchieved;

  WaterLog({
    required this.dateKey,
    this.currentIntake = 0,
    this.isGoalAchieved = false,
  });
}
