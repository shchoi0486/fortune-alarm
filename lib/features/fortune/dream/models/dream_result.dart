class DreamResult {
  final int totalScore;
  final List<String> detectedKeywords;
  final List<String> detectedModifiers;
  final String mainInterpretation;
  final String subInterpretation;
  final String advice;
  final String type; // 길몽, 흉몽, 평몽(보통)

  DreamResult({
    required this.totalScore,
    required this.detectedKeywords,
    required this.detectedModifiers,
    required this.mainInterpretation,
    required this.subInterpretation,
    required this.advice,
    required this.type,
  });
}
