import 'package:hive/hive.dart';

part 'math_difficulty.g.dart';

@HiveType(typeId: 2) // AlarmModel is typeId: 0. Ensure no conflict.
enum MathDifficulty {
  @HiveField(0)
  easy,

  @HiveField(1)
  normal,

  @HiveField(2)
  hard,
}
