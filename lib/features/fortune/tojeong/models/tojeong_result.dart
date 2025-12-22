class TojeongResult {
  final String key; // e.g., "761"
  final String totalLuck; // 총운
  final List<String> monthlyLuck; // 월별운 (12 strings)

  TojeongResult({
    required this.key,
    required this.totalLuck,
    required this.monthlyLuck,
  });
}
