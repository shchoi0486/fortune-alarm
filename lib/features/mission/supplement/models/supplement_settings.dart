import 'package:hive/hive.dart';

part 'supplement_settings.g.dart';

@HiveType(typeId: 9)
class SupplementSettings extends HiveObject {
  @HiveField(0)
  int dailyGoal; // Total number of pills/times to take per day

  @HiveField(1)
  bool isAlarmEnabled;

  @HiveField(2)
  List<String> reminderTimes; // List of "HH:mm"

  @HiveField(3)
  int defaultSnoozeInterval; // Default snooze interval in minutes

  @HiveField(4)
  String? ringtonePath;

  @HiveField(5)
  double volume;

  SupplementSettings({
    this.dailyGoal = 3,
    this.isAlarmEnabled = false,
    this.reminderTimes = const ["08:00", "13:00", "19:00"],
    this.defaultSnoozeInterval = 10,
    this.ringtonePath = 'default',
    this.volume = 0.5,
  });

  SupplementSettings copyWith({
    int? dailyGoal,
    bool? isAlarmEnabled,
    List<String>? reminderTimes,
    int? defaultSnoozeInterval,
    String? ringtonePath,
    double? volume,
  }) {
    return SupplementSettings(
      dailyGoal: dailyGoal ?? this.dailyGoal,
      isAlarmEnabled: isAlarmEnabled ?? this.isAlarmEnabled,
      reminderTimes: reminderTimes ?? this.reminderTimes,
      defaultSnoozeInterval: defaultSnoozeInterval ?? this.defaultSnoozeInterval,
      ringtonePath: ringtonePath ?? this.ringtonePath,
      volume: volume ?? this.volume,
    );
  }
}
