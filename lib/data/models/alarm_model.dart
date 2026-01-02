import 'package:hive/hive.dart';
import '../../core/constants/mission_type.dart';
import 'math_difficulty.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 0)
class AlarmModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  DateTime time;
  @HiveField(2)
  bool isEnabled;
  @HiveField(3)
  MissionType missionType;
  @HiveField(4)
  String label;
  @HiveField(5)
  String? referenceImagePath;
  @HiveField(6)
  List<bool> repeatDays;
  @HiveField(7)
  bool isVibrationEnabled;
  @HiveField(8)
  bool isSoundEnabled;
  @HiveField(9)
  double volume;
  @HiveField(10)
  String? ringtonePath;
  @HiveField(11)
  String? vibrationPattern;
  @HiveField(12)
  bool isGradualVolume;
  @HiveField(13)
  String? backgroundPath;
  @HiveField(14)
  List<String>? referenceImagePaths;
  @HiveField(15)
  int snoozeInterval;
  @HiveField(16)
  int maxSnoozeCount;
  @HiveField(17)
  int missionOrder;
  @HiveField(18)
  int remainingSnoozeCount;
  @HiveField(19)
  MathDifficulty mathDifficulty;
  @HiveField(20)
  int mathProblemCount;
  @HiveField(21, defaultValue: 50)
  int shakeCount;
  @HiveField(22, defaultValue: 20)
  int walkStepCount;

  AlarmModel({
    required this.id,
    required this.time,
    this.isEnabled = true,
    this.missionType = MissionType.none,
    this.label = '',
    this.referenceImagePaths,
    this.repeatDays = const [false, false, false, false, false, false, false],
    this.isVibrationEnabled = true,
    this.isSoundEnabled = true,
    this.volume = 1.0,
    this.ringtonePath,
    this.vibrationPattern,
    this.isGradualVolume = false,
    this.backgroundPath,
    this.snoozeInterval = 5,
    this.maxSnoozeCount = 3,
    this.missionOrder = 0,
    this.remainingSnoozeCount = 0,
    this.mathDifficulty = MathDifficulty.normal,
    this.mathProblemCount = 3,
    this.shakeCount = 50,
    this.walkStepCount = 20,
  });

  AlarmModel copyWith({
    String? id,
    DateTime? time,
    bool? isEnabled,
    MissionType? missionType,
    String? label,
    List<String>? referenceImagePaths,
    List<bool>? repeatDays,
    bool? isVibrationEnabled,
    bool? isSoundEnabled,
    double? volume,
    String? ringtonePath,
    String? vibrationPattern,
    bool? isGradualVolume,
    String? backgroundPath,
    int? snoozeInterval,
    int? maxSnoozeCount,
    int? missionOrder,
    int? remainingSnoozeCount,
    MathDifficulty? mathDifficulty,
    int? mathProblemCount,
    int? shakeCount,
    int? walkStepCount,
  }) {
    return AlarmModel(
      id: id ?? this.id,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
      missionType: missionType ?? this.missionType,
      label: label ?? this.label,
      referenceImagePaths: referenceImagePaths ?? this.referenceImagePaths,
      repeatDays: repeatDays ?? this.repeatDays,
      isVibrationEnabled: isVibrationEnabled ?? this.isVibrationEnabled,
      isSoundEnabled: isSoundEnabled ?? this.isSoundEnabled,
      volume: volume ?? this.volume,
      ringtonePath: ringtonePath ?? this.ringtonePath,
      vibrationPattern: vibrationPattern ?? this.vibrationPattern,
      isGradualVolume: isGradualVolume ?? this.isGradualVolume,
      backgroundPath: backgroundPath ?? this.backgroundPath,
      snoozeInterval: snoozeInterval ?? this.snoozeInterval,
      maxSnoozeCount: maxSnoozeCount ?? this.maxSnoozeCount,
      missionOrder: missionOrder ?? this.missionOrder,
      remainingSnoozeCount: remainingSnoozeCount ?? this.remainingSnoozeCount,
      mathDifficulty: mathDifficulty ?? this.mathDifficulty,
      mathProblemCount: mathProblemCount ?? this.mathProblemCount,
      shakeCount: shakeCount ?? this.shakeCount,
      walkStepCount: walkStepCount ?? this.walkStepCount,
    );
  }
}