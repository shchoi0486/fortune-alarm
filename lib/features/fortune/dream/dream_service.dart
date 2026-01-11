import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/dream_result.dart';

class DreamService {
  List<Map<String, dynamic>> _symbols = [];
  List<Map<String, dynamic>> _modifiers = [];
  bool _isLoaded = false;

  Future<void> loadData() async {
    if (_isLoaded) return;
    try {
      final jsonString = await rootBundle.loadString('assets/json/dream_data.json');
      final data = json.decode(jsonString);
      _symbols = List<Map<String, dynamic>>.from(data['symbols']);
      _modifiers = List<Map<String, dynamic>>.from(data['modifiers']);
      _isLoaded = true;
    } catch (e) {
      print('Error loading dream data: $e');
      // Fallback data just in case
      _symbols = [];
      _modifiers = [];
    }
  }

  DreamResult analyze(String input) {
    if (!_isLoaded) {
      return DreamResult(
        totalScore: 0,
        detectedKeywords: [],
        detectedModifiers: [],
        mainInterpretation: "데이터를 불러오는 중입니다.",
        subInterpretation: "",
        advice: "잠시 후 다시 시도해주세요.",
        type: "평몽",
      );
    }

    final normalizedInput = input.trim();
    if (normalizedInput.isEmpty) {
      return DreamResult(
        totalScore: 0,
        detectedKeywords: [],
        detectedModifiers: [],
        mainInterpretation: "꿈 내용을 입력해주세요.",
        subInterpretation: "",
        advice: "기억나는 단어나 상황을 적어주시면 해몽해드립니다.",
        type: "평몽",
      );
    }

    int totalScore = 0;
    List<Map<String, dynamic>> matchedSymbols = [];
    List<Map<String, dynamic>> matchedModifiers = [];
    
    // Create a list of all keywords with their source entry and type
    List<_KeywordMatch> allKeywords = [];
    for (var symbol in _symbols) {
      for (String k in symbol['keywords']) {
        allKeywords.add(_KeywordMatch(k, symbol, true));
      }
    }
    for (var modifier in _modifiers) {
      for (String k in modifier['keywords']) {
        allKeywords.add(_KeywordMatch(k, modifier, false));
      }
    }

    // Sort by length descending to match longest keywords first
    allKeywords.sort((a, b) => b.keyword.length.compareTo(a.keyword.length));

    String tempInput = normalizedInput;
    List<String> foundKeywords = [];
    Set<Map<String, dynamic>> matchedEntries = {};

    for (var km in allKeywords) {
      if (tempInput.contains(km.keyword)) {
        // If this entry hasn't been matched yet, add its score and entry
        if (!matchedEntries.contains(km.entry)) {
          matchedEntries.add(km.entry);
          if (km.isSymbol) {
            matchedSymbols.add(km.entry);
          } else {
            matchedModifiers.add(km.entry);
          }
          totalScore += (km.entry['score'] as int);
        }

        foundKeywords.add(km.keyword);

        // Mark this part of the input as used by replacing it with a placeholder
        // of the same length to preserve indices if needed, or just remove it.
        // Using a placeholder like '#' to avoid partial matches later.
        tempInput = tempInput.replaceAll(km.keyword, '#' * km.keyword.length);
      }
    }

    // 3. Result Generation
    if (matchedSymbols.isEmpty && matchedModifiers.isEmpty) {
      return DreamResult(
        totalScore: 0,
        detectedKeywords: [],
        detectedModifiers: [],
        mainInterpretation: "꿈의 핵심 키워드를 찾지 못했습니다.",
        subInterpretation: "조금 더 구체적인 단어(동물, 물건, 행동 등)를 포함해서 입력해주세요.",
        advice: "예: '뱀이 나를 쫓아왔어', '돈을 주웠어'",
        type: "평몽",
      );
    }

    String type;
    if (totalScore >= 3) {
      type = "길몽 (Good Dream)";
    } else if (totalScore <= -3) {
      type = "흉몽 (Bad Dream)";
    } else {
      type = "평몽 (Neutral)";
    }

    // Construct Text
    StringBuffer mainBuffer = StringBuffer();
    StringBuffer subBuffer = StringBuffer();
    StringBuffer adviceBuffer = StringBuffer();

    // Main Interpretation from primary symbol (highest score or first found)
    if (matchedSymbols.isNotEmpty) {
      // Sort by score abs descending to find most impactful symbol
      matchedSymbols.sort((a, b) => (b['score'] as int).abs().compareTo((a['score'] as int).abs()));

      var primary = matchedSymbols.first;
      String rawKeyword = primary['keywords'][0];
      String keyword = _removeParticle(rawKeyword);
      String particle = _getSubjectParticle(keyword);
      String description = primary['description'];
      String descParticle = _getObjectParticle(description);
      
      // 문구 자연스럽게 수정 (키워드 강조 및 문맥 추가)
      mainBuffer.write("꿈에 등장한 '$keyword'$particle $description$descParticle 의미합니다. ");
      subBuffer.write("${primary['advice']} ");
    } else {
      mainBuffer.write("구체적인 사물이나 대상은 명확하지 않지만, ");
    }

    // Add modifier context
    if (matchedModifiers.isNotEmpty) {
      var mod = matchedModifiers.first; // First modifier usually sets the tone
      String description = mod['description'];
      String descParticle = _getObjectParticle(description);
      
      mainBuffer.write("\n또한, 꿈속의 상황은 $description$descParticle 암시하고 있습니다.");
      subBuffer.write("\n${mod['advice']}");
    }

    // Final Advice
    if (totalScore >= 3) {
      adviceBuffer.write("전반적으로 매우 긍정적인 에너지가 느껴집니다. 자신감을 가지고 계획한 일을 추진해 보세요!");
    } else if (totalScore <= -3) {
      adviceBuffer.write("심리적으로 불안하거나 주의가 필요한 시기일 수 있습니다. 당분간은 무리한 결정보다 안정을 취하는 것이 좋겠습니다.");
    } else {
      adviceBuffer.write("나쁘지 않은 흐름입니다. 현재의 상황을 차분히 점검하고 나아가면 좋은 결과가 있을 것입니다.");
    }

    return DreamResult(
      totalScore: totalScore,
      detectedKeywords: foundKeywords,
      detectedModifiers: matchedModifiers.map((e) => e['keywords'][0] as String).toList(),
      mainInterpretation: mainBuffer.toString(),
      subInterpretation: subBuffer.toString(),
      advice: adviceBuffer.toString(),
      type: type,
    );
  }
  String _removeParticle(String keyword) {
    // 조사 목록 (길이가 긴 것부터 확인)
    const particles = ['에게', '에서', '으로', '을', '를', '이', '가', '은', '는', '로'];
    for (var particle in particles) {
      if (keyword.endsWith(particle)) {
        return keyword.substring(0, keyword.length - particle.length);
      }
    }
    return keyword;
  }

  String _getSubjectParticle(String word) {
    if (word.isEmpty) return "은(는)";
    int lastCode = word.runes.last;
    // 한글 유니코드 범위: AC00 ~ D7A3
    if (lastCode < 0xAC00 || lastCode > 0xD7A3) return "은(는)";
    // 받침 확인: (lastCode - 0xAC00) % 28 != 0 이면 받침 있음
    bool hasBatchim = (lastCode - 0xAC00) % 28 != 0;
    return hasBatchim ? "은" : "는";
  }
  
  String _getObjectParticle(String word) {
    if (word.isEmpty) return "을(를)";
    int lastCode = word.runes.last;
    if (lastCode < 0xAC00 || lastCode > 0xD7A3) return "을(를)";
    bool hasBatchim = (lastCode - 0xAC00) % 28 != 0;
    return hasBatchim ? "을" : "를";
  }
}

class _KeywordMatch {
  final String keyword;
  final Map<String, dynamic> entry;
  final bool isSymbol;

  _KeywordMatch(this.keyword, this.entry, this.isSymbol);
}
