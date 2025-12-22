class TojeongService {
  // 2025 Eulsa Year Constants
  // Taese for 2025 is Eulsa (Snake).
  // Calculation constants are often kept secret or vary by school.
  // We use a simplified modulo model for the app.
  static const int _taeseConstant = 1;

  // Calculate the 3-digit Gua (e.g., 144)
  // Input: Birth Year, Lunar Month, Lunar Day
  static Map<String, int> calculateGua(int birthYear, int lunarMonth, int lunarDay) {
    // 1. Upper Gua (Sang-Gwae)
    // Age = 2025 - birthYear + 1
    int age = 2025 - birthYear + 1;
    int upper = (age + _taeseConstant) % 8;
    if (upper == 0) upper = 8;

    // 2. Middle Gua (Jung-Gwae)
    // Wolgeon Constant for 2025 (Estimated: (Month + 3) % 6)
    int wolgeonConstant = 3; 
    int middle = (lunarMonth + wolgeonConstant) % 6;
    if (middle == 0) middle = 6;

    // 3. Lower Gua (Ha-Gwae)
    // Iljin Constant for 2025
    int iljinConstant;
    int mod3 = lunarMonth % 3;
    if (mod3 == 1) {
      iljinConstant = 2;      // Month 1, 4, 7, 10
    } else if (mod3 == 2) iljinConstant = 3; // Month 2, 5, 8, 11
    else iljinConstant = 1;                // Month 3, 6, 9, 12 (0)
    
    int lower = (lunarDay + iljinConstant) % 3;
    if (lower == 0) lower = 3;

    return {
      'upper': upper,
      'middle': middle,
      'lower': lower,
      'code': upper * 100 + middle * 10 + lower,
    };
  }

  static String getFortuneText(int code) {
    if (_fortuneTexts.containsKey(code)) {
      return _fortuneTexts[code]!;
    }
    return _generateDynamicFortune(code);
  }

  // Combinatoric Text Generation for 144 outcomes
  static String _generateDynamicFortune(int code) {
    int upper = code ~/ 100;
    int middle = (code % 100) ~/ 10;
    int lower = code % 10;

    String upperMeaning = _upperGuaMeanings[upper] ?? "하늘의 기운이 평범하니";
    String middleMeaning = _middleGuaMeanings[middle] ?? "땅의 흐름이 무난하고";
    String lowerMeaning = _lowerGuaMeanings[lower] ?? "사람의 노력이 필요한 시기입니다.";
    
    String advice = _getAdvice(upper, middle, lower);

    return "$upperMeaning\n$middleMeaning\n$lowerMeaning\n\n$advice";
  }

  static String _getAdvice(int u, int m, int l) {
    int sum = u + m + l;
    if (sum >= 15) return "대운이 들어오니 과감하게 도전하셔도 좋습니다. 재물과 명예가 함께 따를 것입니다.";
    if (sum >= 12) return "운세가 상승 곡선을 그리고 있습니다. 꾸준히 노력하면 좋은 결실을 맺을 것입니다.";
    if (sum >= 9) return "평탄한 운세이나 방심은 금물입니다. 주변 사람들과의 관계를 소중히 하세요.";
    if (sum >= 6) return "다소 어려움이 있을 수 있으나, 지혜롭게 대처하면 전화위복의 기회가 될 것입니다.";
    return "매사에 신중을 기해야 할 때입니다. 새로운 시작보다는 현재를 지키는 것에 집중하세요.";
  }

  static final Map<int, String> _upperGuaMeanings = {
    1: "하늘이 맑고 구름이 없으니 앞길이 훤히 트였습니다.", // Heaven (Geon)
    2: "연못에 물이 가득하니 기쁨이 넘치는 형상입니다.", // Lake (Tae)
    3: "밝은 불이 세상을 비추니 지혜가 샘솟습니다.", // Fire (Ri)
    4: "우레가 진동하니 만물이 깨어나고 활기가 돕니다.", // Thunder (Jin)
    5: "부드러운 바람이 불어오니 순리대로 일이 풀립니다.", // Wind (Son)
    6: "깊은 물속을 건너야 하니 조심스러움이 필요합니다.", // Water (Gam)
    7: "높은 산이 앞을 가로막고 있으니 잠시 쉬어가야 합니다.", // Mountain (Gan)
    8: "넓은 대지가 만물을 품으니 포용력이 필요한 때입니다.", // Earth (Gon)
  };

  static final Map<int, String> _middleGuaMeanings = {
    1: "기초가 튼튼하여 흔들림이 없으니",
    2: "변화의 바람이 불어오니 새로운 기회가 생기고",
    3: "재물이 모이고 곳간이 풍족해지니",
    4: "장애물이 나타나 잠시 주춤할 수 있으나",
    5: "귀인의 도움으로 어려움을 극복하고",
    6: "주변과의 갈등이 예상되니 양보가 필요하며",
  };

  static final Map<int, String> _lowerGuaMeanings = {
    1: "자신의 뜻을 펼치기에 더없이 좋은 시기입니다.",
    2: "성급함을 버리고 차분히 기다리면 복이 찾아옵니다.",
    3: "노력한 만큼의 대가를 얻기 어려우니 마음을 비우는 것이 좋습니다.",
  };

  // Specific Traditional Texts (Samples)
  static final Map<int, String> _fortuneTexts = {
    144: "비룡이 승천하니 만사가 형통하다.\n뜻하는 바를 이루고 재물이 들어오는 대길의 운세입니다.\n가정이 화목하고 자손에게 경사가 있을 것입니다.",
    863: "물고기가 물을 만난 격이라.\n어려움이 사라지고 활기가 넘치는 한 해가 될 것입니다.\n새로운 일을 시작하기에 좋은 시기입니다.",
    111: "봄바람에 꽃이 피니 향기가 만발하다.\n오랫동안 기다리던 소식이 들려오고 기쁨이 가득합니다.\n다만 건강에는 유의하는 것이 좋겠습니다.",
    761: "달이 구름을 벗어나니 광명이 비친다.\n어려웠던 일이 해결되고 희망이 보입니다.\n재물운은 평범하나 명예운이 따릅니다.",
    112: "봄바람에 화초가 무성하게 자라나는 격이라.\n작은 것으로 큰 것을 이루니 이익이 많으리라.",
    113: "꽃이 떨어지고 열매를 맺으니 결실의 계절이라.\n노력한 보람이 나타나기 시작하리라.",
    121: "구름이 걷히고 달이 밝으니 근심이 사라지리라.\n귀인을 만나 도움을 얻으니 만사가 순조롭다.",
    122: "가뭄에 단비를 만난 격이라.\n어려운 고비마다 도움의 손길이 있어 해결되리라.",
    123: "산에 올라 옥을 얻으니 이름이 널리 알려지리라.\n시험이나 승진에 좋은 운수가 있다.",
  };
}
