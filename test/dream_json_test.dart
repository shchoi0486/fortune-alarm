import 'dart:convert';
import 'dart:io';

void main() {
  // Use absolute path or relative from project root assuming test is run from root
  final file = File('assets/json/dream_data.json');
  if (!file.existsSync()) {
    print('Error: JSON file not found at ${file.absolute.path}');
    return;
  }

  final jsonString = file.readAsStringSync();
  try {
    final data = json.decode(jsonString);
    final symbols = List<Map<String, dynamic>>.from(data['symbols']);
    final modifiers = List<Map<String, dynamic>>.from(data['modifiers']);

    print('Successfully loaded ${symbols.length} symbols and ${modifiers.length} modifiers.');

    // Test Cases
    testAnalysis("뱀을 죽이다", symbols, modifiers);
    testAnalysis("이빨이 빠지다", symbols, modifiers);
    testAnalysis("돼지가 집으로 들어오다", symbols, modifiers);
    testAnalysis("가위 눌리다", symbols, modifiers);
    testAnalysis("맑은 물에서 수영하다", symbols, modifiers);
    testAnalysis("도둑이 들어서 무섭다", symbols, modifiers);
    
    // New Test Cases
    testAnalysis("무지개가 떴다", symbols, modifiers);
    testAnalysis("빨간 사과를 먹다", symbols, modifiers);
    testAnalysis("검은 고양이를 보다", symbols, modifiers);
    testAnalysis("경찰에게 쫓기다", symbols, modifiers);
    testAnalysis("시험에 합격하다", symbols, modifiers);
    testAnalysis("진돗개만한 엄청나게 큰 바퀴벌레가 미친듯이 날 쫓아오더니 내 발목을 물었어.", symbols, modifiers);

  } catch (e) {
    print('Error parsing JSON: $e');
  }
}

void testAnalysis(String input, List<Map<String, dynamic>> symbols, List<Map<String, dynamic>> modifiers) {
  int totalScore = 0;
  List<String> found = [];
  
  // Logic from dream_service.dart
  List<_KeywordMatch> allKeywords = [];
  for (var symbol in symbols) {
    for (String k in symbol['keywords']) {
      allKeywords.add(_KeywordMatch(k, symbol, true));
    }
  }
  for (var modifier in modifiers) {
    for (String k in modifier['keywords']) {
      allKeywords.add(_KeywordMatch(k, modifier, false));
    }
  }

  allKeywords.sort((a, b) => b.keyword.length.compareTo(a.keyword.length));

  String tempInput = input;
  Set<Map<String, dynamic>> matchedEntries = {};

  for (var km in allKeywords) {
    if (tempInput.contains(km.keyword)) {
      if (!matchedEntries.contains(km.entry)) {
        matchedEntries.add(km.entry);
        totalScore += (km.entry['score'] as int);
      }
      found.add(km.keyword);
      tempInput = tempInput.replaceAll(km.keyword, '#' * km.keyword.length);
    }
  }

  print("Input: '$input' -> Score: $totalScore, Found: $found");
}

class _KeywordMatch {
  final String keyword;
  final Map<String, dynamic> entry;
  final bool isSymbol;
  _KeywordMatch(this.keyword, this.entry, this.isSymbol);
}
