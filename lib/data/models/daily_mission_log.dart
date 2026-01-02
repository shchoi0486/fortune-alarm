import 'package:hive/hive.dart';

part 'daily_mission_log.g.dart';

@HiveType(typeId: 4)
class DailyMissionLog extends HiveObject {
  @HiveField(0)
  final String dateKey; // "yyyy-MM-dd"

  @HiveField(1)
  List<String> completedMissionIds;

  @HiveField(2)
  bool isGoalAchieved;

  @HiveField(3)
  bool? isTenGoalAchieved;

  DailyMissionLog({
    required this.dateKey,
    required this.completedMissionIds,
    this.isGoalAchieved = false,
    this.isTenGoalAchieved,
  });

  DailyMissionLog copyWith({
    String? dateKey,
    List<String>? completedMissionIds,
    bool? isGoalAchieved,
    bool? isTenGoalAchieved,
  }) {
    return DailyMissionLog(
      dateKey: dateKey ?? this.dateKey,
      completedMissionIds: completedMissionIds ?? this.completedMissionIds,
      isGoalAchieved: isGoalAchieved ?? this.isGoalAchieved,
      isTenGoalAchieved: isTenGoalAchieved ?? this.isTenGoalAchieved,
    );
  }
}
