import 'package:hive/hive.dart';

part 'supplement_log.g.dart';

@HiveType(typeId: 8)
class SupplementLog extends HiveObject {
  @HiveField(0)
  final String dateKey; // "yyyy-MM-dd"

  @HiveField(1)
  int currentCount; // Number of supplements taken today

  @HiveField(2)
  bool isGoalAchieved;

  SupplementLog({
    required this.dateKey,
    this.currentCount = 0,
    this.isGoalAchieved = false,
  });
}
