import 'package:hive/hive.dart';

part 'water_settings.g.dart';

@HiveType(typeId: 7)
class WaterSettings extends HiveObject {
  @HiveField(0)
  int dailyGoal;

  @HiveField(1)
  int cupSize;

  @HiveField(2)
  bool isAlarmEnabled;

  @HiveField(3)
  String startTime; // "HH:mm"

  @HiveField(4)
  String endTime; // "HH:mm"

  @HiveField(5)
  int intervalMinutes;

  WaterSettings({
    this.dailyGoal = 2000,
    this.cupSize = 250,
    this.isAlarmEnabled = false,
    this.startTime = "08:00",
    this.endTime = "22:00",
    this.intervalMinutes = 60,
  });
}
