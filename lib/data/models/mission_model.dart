import 'package:hive/hive.dart';
import '../../core/constants/mission_category.dart';

part 'mission_model.g.dart';

@HiveType(typeId: 3)
class MissionModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String icon;

  @HiveField(3)
  bool isSystemMission;

  @HiveField(4)
  MissionCategory category;

  @HiveField(5)
  String? alarmTime;

  @HiveField(6)
  bool isAlarmEnabled;

  MissionModel({
    required this.id,
    required this.title,
    required this.icon,
    this.isSystemMission = false,
    this.category = MissionCategory.other,
    this.alarmTime,
    this.isAlarmEnabled = false,
  });

  MissionModel copyWith({
    String? id,
    String? title,
    String? icon,
    bool? isSystemMission,
    MissionCategory? category,
    String? alarmTime,
    bool? isAlarmEnabled,
  }) {
    return MissionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      isSystemMission: isSystemMission ?? this.isSystemMission,
      category: category ?? this.category,
      alarmTime: alarmTime ?? this.alarmTime,
      isAlarmEnabled: isAlarmEnabled ?? this.isAlarmEnabled,
    );
  }
}
