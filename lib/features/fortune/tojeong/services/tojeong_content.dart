import 'dart:math';
import 'tojeong_monthly_data.dart';

class TojeongContent {
  // 상괘 (1-8) 해석: 전체적인 년운의 흐름 (하늘의 기운)
  static String getSangsuText(int sangsu) {
    switch (sangsu) {
      case 1: // 건 (하늘)
        return "하늘이 돕고 땅이 돕는 형국입니다. 강한 추진력으로 일을 진행하면 큰 성과를 거둘 수 있는 해입니다. 마치 용이 승천하듯 기운이 힘차고 밝습니다. 리더십을 발휘할 기회가 많아지며, 주위의 인정을 받게 됩니다. 다만, 너무 독단적으로 행동하면 주변의 반감을 살 수 있으니 포용력을 갖추는 것이 중요합니다.";
      case 2: // 태 (연못)
        return "잔잔한 호수에 돌을 던지니 파문이 이는 격입니다. 기쁨과 즐거움이 많은 해이나, 말실수로 인한 구설수를 조심해야 합니다. 대인 관계가 활발해지고 인기가 높아지지만, 그만큼 시기 질투도 따를 수 있습니다. 즐거운 모임이나 행사에서 좋은 인연을 만날 수 있습니다.";
      case 3: // 이 (불)
        return "밝은 태양이 온 세상을 비추는 것과 같습니다. 지성과 열정이 빛을 발하며, 학문이나 예술 분야에서 두각을 나타낼 수 있습니다. 명예운이 상승하여 이름을 알리게 되나, 불처럼 급한 성격을 다스려야 화를 면합니다. 겉으로는 화려해 보이나 속으로는 외로울 수 있으니 내실을 다져야 합니다.";
      case 4: // 진 (우레)
        return "마른하늘에 날벼락이 치듯 급격한 변화가 예상됩니다. 활동적이고 진취적인 기운이 강하여 새로운 일을 시작하기에 좋습니다. 이동수나 변동수가 있어 분주하게 움직이게 됩니다. 시작은 요란하나 끝이 흐지부지될 수 있으니 끈기를 가지고 마무리하는 자세가 필요합니다.";
      case 5: // 손 (바람)
        return "부드러운 봄바람이 불어오니 만물이 소생하는 시기입니다. 유연한 태도로 대처하면 막혔던 일이 술술 풀립니다. 사업이나 장사에서 이익을 얻을 수 있으며, 멀리서 좋은 소식이 들려옵니다. 다만, 우유부단함으로 인해 기회를 놓칠 수 있으니 결단력이 필요할 때입니다.";
      case 6: // 감 (물)
        return "깊은 물속을 헤엄치는 듯한 형국입니다. 겉으로는 평온해 보이나 속으로는 근심이 있을 수 있습니다. 지혜를 발휘하여 난관을 극복해야 하며, 무리한 투자나 확장은 피하는 것이 좋습니다. 인내심을 가지고 때를 기다리면 반드시 좋은 날이 올 것입니다. 건강 관리에 유의하세요.";
      case 7: // 간 (산)
        return "태산이 앞을 가로막고 있는 듯하나, 그 산을 넘으면 넓은 평야가 펼쳐집니다. 굳건한 의지로 어려움을 버티면 큰 결실을 맺습니다. 현재의 위치를 지키며 내실을 기하는 것이 유리합니다. 섣부른 변화보다는 안정을 추구하는 것이 좋으며, 신뢰를 쌓는 것이 중요합니다.";
      case 8: // 곤 (땅)
        return "넓은 대지 위에 씨앗을 뿌리는 시기입니다. 포용력과 인내심으로 주변을 감싸 안으면 덕을 쌓게 됩니다. 어머니와 같은 따뜻한 마음으로 사람을 대하면 귀인의 도움을 받을 수 있습니다. 당장의 성과보다는 미래를 위한 투자가 빛을 발하는 해입니다. 가정에 평화가 깃듭니다.";
      default:
        return "평범한 운세입니다.";
    }
  }

  // 중괘 (1-6) 해석: 인간 관계와 사건의 전개 (사람의 일)
  static String getJungsuText(int jungsu) {
    switch (jungsu) {
      case 1:
        return "귀인이 문 앞에 당도하니 기쁜 일이 생깁니다. 막혔던 일이 풀리고 재물이 들어오는 운입니다. 협력자를 만나 일을 도모하면 성공 확률이 높아집니다.";
      case 2:
        return "가정에 경사가 있거나 새로운 식구를 맞이할 수 있습니다. 문서운이 좋아 계약이나 매매에 유리합니다. 다만, 작은 다툼이 큰 싸움으로 번질 수 있으니 언행을 조심하세요.";
      case 3:
        return "타향에서 뜻을 펼치거나 먼 곳으로 이동할 운입니다. 여행이나 출장을 통해 새로운 기회를 얻을 수 있습니다. 변화를 두려워하지 말고 도전하면 좋은 결과를 얻습니다.";
      case 4:
        return "관운이 따르니 직장에서 승진하거나 명예를 얻게 됩니다. 시험 합격이나 자격증 취득에 유리한 시기입니다. 자신의 능력을 마음껏 발휘해보세요.";
      case 5:
        return "재물운이 왕성하나 지출 또한 많아질 수 있습니다. 금전 관리에 철저해야 하며, 충동적인 소비를 자제해야 합니다. 가까운 사람과의 금전 거래는 피하는 것이 좋습니다.";
      case 6:
        return "건강에 각별히 유의해야 할 시기입니다. 과로를 피하고 충분한 휴식을 취하세요. 예기치 않은 사고나 질병에 대비하여 보험 등을 점검하는 것도 좋습니다.";
      default:
        return "순조로운 흐름입니다.";
    }
  }

  // 하괘 (1-3) 해석: 결과와 결실 (땅의 결과)
  static String getHasuText(int hasu) {
    switch (hasu) {
      case 1: // 상 (성공/길)
        return "결과적으로 모든 일이 순조롭게 풀리고 소원을 성취하게 됩니다. 노력한 만큼의 대가를 반드시 얻게 되며, 주위의 부러움을 사게 됩니다. 초심을 잃지 않으면 복이 오래갈 것입니다.";
      case 2: // 중 (보통/노력)
        return "과정에서 다소 어려움이 있을 수 있으나, 끈기를 가지고 노력하면 결국에는 목표를 달성합니다. 쉽게 얻어지는 것은 없으니 땀 흘린 만큼의 결실을 맺게 됩니다. 대기만성형 운세입니다.";
      case 3: // 하 (주의/인내)
        return "뜻하지 않은 난관에 부딪힐 수 있으나, 좌절하지 않고 인내하면 위기를 기회로 바꿀 수 있습니다. 욕심을 버리고 마음을 비우면 오히려 좋은 일이 생깁니다. 전화위복의 지혜가 필요합니다.";
      default:
        return "무난한 결실을 맺습니다.";
    }
  }

  // 총운 상세 (조합 기반)
  static String getDetailedTotalLuck(int sangsu, int jungsu, int hasu) {
    // 144괘 조합에 따른 상세 총운 생성
    // 각 괘의 핵심 키워드를 조합하여 유기적인 문장을 생성합니다.

    String sangsuKeyword = _getSangsuKeyword(sangsu);
    String jungsuKeyword = _getJungsuKeyword(jungsu);
    String hasuKeyword = _getHasuKeyword(hasu);

    String coreMessage = "올해는 $sangsuKeyword 속에서 $jungsuKeyword, 결국 $hasuKeyword";

    // 예시: "강한 추진력이 필요한 시기 속에서 귀인의 도움을 만날 것이며, 결국에는 큰 성공을 거두게 됩니다."
    // 각 괘의 상세 설명을 조합하여 풍부한 내용 제공
    String sangsuDetail = getSangsuText(sangsu);
    String jungsuDetail = getJungsuText(jungsu);
    String hasuDetail = getHasuText(hasu);

    return "$coreMessage\n\n[총론]\n$sangsuDetail\n\n[과정]\n$jungsuDetail\n\n[결과]\n$hasuDetail";
  }

  // 상괘 키워드
  static String _getSangsuKeyword(int sangsu) {
    switch (sangsu) {
      case 1: return "강한 추진력과 리더십이 필요한 시기";
      case 2: return "활발한 대인관계와 즐거움이 가득한 시기";
      case 3: return "지성과 열정이 빛을 발하는 시기";
      case 4: return "급격한 변화와 새로운 시작이 예상되는 시기";
      case 5: return "유연한 태도와 부드러운 소통이 필요한 시기";
      case 6: return "지혜와 인내심으로 어려움을 극복해야 하는 시기";
      case 7: return "안정을 추구하며 내실을 다져야 하는 시기";
      case 8: return "포용력과 따뜻한 마음으로 덕을 쌓아야 하는 시기";
      default: return "";
    }
  }

  // 중괘 키워드
  static String _getJungsuKeyword(int jungsu) {
    switch (jungsu) {
      case 1: return "귀인의 도움을 만나게 될 것이며";
      case 2: return "문서나 계약에서 좋은 소식이 있을 것이며";
      case 3: return "새로운 도전과 변화의 기회를 맞이할 것이며";
      case 4: return "직장에서의 성공과 명예가 따를 것이며";
      case 5: return "재물의 흐름을 신중하게 관리해야 할 것이며";
      case 6: return "건강을 최우선으로 돌봐야 할 것이며";
      default: return "";
    }
  }

  // 하괘 키워드
  static String _getHasuKeyword(int hasu) {
    switch (hasu) {
      case 1: return "큰 성공을 거두게 됩니다.";
      case 2: return "노력한 만큼의 결실을 맺게 됩니다.";
      case 3: return "인내 끝에 위기를 기회로 만들게 됩니다.";
      default: return "";
    }
  }
  
  // 월별 운세 상세
  static String getMonthlyLuck(int month, int sangsu, int jungsu, int hasu) {
    // 시드 생성: 상/중/하수와 월을 조합하여 고유한 시드값 생성
    int seed = (sangsu * 10000) + (jungsu * 1000) + (hasu * 100) + month;
    final random = Random(seed);

    // 월별 특화 문장 선택 (랜덤)
    String monthlySpecialSentence = "";
    if (TojeongMonthlyData.monthlySentences.containsKey(month)) {
      final monthSentences = TojeongMonthlyData.monthlySentences[month]!;
      monthlySpecialSentence = monthSentences[random.nextInt(monthSentences.length)];
    }

    // 길흉 운세 문장 선택
    int luckCode = (sangsu + jungsu + hasu + month + (month ~/ 4)) % 3;
    String generalSentence = "";
    switch (luckCode) {
      case 0: // Good
        int index = random.nextInt(TojeongMonthlyData.goodSentences.length);
        generalSentence = TojeongMonthlyData.goodSentences[index];
        break;
      case 1: // Neutral
        int index = random.nextInt(TojeongMonthlyData.neutralSentences.length);
        generalSentence = TojeongMonthlyData.neutralSentences[index];
        break;
      case 2: // Caution
        int index = random.nextInt(TojeongMonthlyData.cautionSentences.length);
        generalSentence = TojeongMonthlyData.cautionSentences[index];
        break;
      default:
        generalSentence = "무난한 한 달이 될 것입니다.";
    }

    // 최종 문장 조합
    String finalSentence = monthlySpecialSentence.isNotEmpty
        ? "$monthlySpecialSentence\n$generalSentence"
        : generalSentence;

    return "$month월: $finalSentence";
  }
  
  // 재물운
  static String getWealthLuck(int sangsu, int jungsu) {
    // 특정 괘 조합에 대한 특별 해석
    if (sangsu == 1 && jungsu == 5) { // 건(하늘) + 재물 왕성
      return "하늘의 기운이 재물을 돕는 형국입니다. 큰 재물이 들어올 기회가 있으나, 그만큼 크게 나갈 수도 있습니다. 과감한 투자보다는 안정적인 자산 관리에 힘쓰는 것이 좋으며, 얻은 재물을 주변에 베풀면 더 큰 복이 되어 돌아옵니다.";
    }
    if (sangsu == 8 && jungsu == 1) { // 곤(땅) + 귀인
      return "땅의 기운처럼 꾸준하고 안정적인 재물운입니다. 특히 부동산이나 장기적인 투자에서 이익을 볼 수 있습니다. 귀인의 도움으로 재물을 얻게 되니, 주변 사람들과의 신뢰를 중요시해야 합니다.";
    }

    // 일반적인 해석
    if ((sangsu + jungsu) % 2 == 0) {
      return "재물운이 좋습니다. 생각지 못한 곳에서 수익이 발생하거나, 투자한 곳에서 좋은 성과를 거둘 수 있습니다. 다만, 들어오는 만큼 나가는 돈도 있을 수 있으니 저축에 힘쓰세요.";
    } else {
      return "재물의 흐름이 원활하지 않을 수 있습니다. 불필요한 지출을 줄이고 절약하는 습관을 들여야 합니다. 금전 거래는 신중하게 하고, 투자는 전문가와 상의하는 것이 좋습니다.";
    }
  }

  // 직장/사업운
  static String getCareerLuck(int sangsu, int hasu) {
    // 특정 괘 조합에 대한 특별 해석
    if (sangsu == 4 && hasu == 1) { // 진(우레) + 성공
      return "우레와 같이 명성을 떨칠 기회가 옵니다. 새로운 프로젝트나 사업을 시작하면 큰 성공을 거둘 수 있습니다. 과감한 결단력과 추진력이 빛을 발하는 시기이니, 망설이지 말고 앞으로 나아가세요.";
    }
    if (sangsu == 7 && hasu == 3) { // 간(산) + 인내
      return "태산 같은 어려움이 앞을 가로막는 듯하나, 끈기 있게 버티면 결국에는 정상에 오를 수 있습니다. 현재의 자리를 지키며 내실을 다지는 것이 중요합니다. 성급한 변화는 오히려 해가 될 수 있으니, 인내심을 가지고 때를 기다리세요.";
    }

    // 일반적인 해석
    if ((sangsu + hasu) % 2 == 1) {
      return "직장이나 사업에서 능력을 인정받을 기회가 옵니다. 승진이나 이직, 창업 등 새로운 변화를 시도하기에 좋은 시기입니다. 대인관계를 원만히 하면 더 큰 성과를 얻을 수 있습니다.";
    } else {
      return "현 상태를 유지하는 것이 좋습니다. 새로운 일을 벌이기보다는 맡은 일에 충실하며 실력을 쌓는 시기입니다. 동료나 상사와의 관계에서 스트레스를 받을 수 있으니 마음을 편안하게 가지세요.";
    }
  }
  
  // 연애/가정운
  static String getLoveLuck(int jungsu, int hasu) {
    // 특정 괘 조합에 대한 특별 해석
    if (jungsu == 2 && hasu == 1) { // 가정 경사 + 성공
      return "가정에 큰 경사가 있어 웃음꽃이 만발합니다. 결혼이나 출산 등 새로운 식구를 맞이할 기쁨이 있으며, 가족 구성원 모두가 화합하여 행복이 가득한 시기입니다. 연인과의 관계는 결실을 맺게 됩니다.";
    }
    if (jungsu == 3 && hasu == 2) { // 이동/변화 + 노력
      return "새로운 환경에서 좋은 인연을 만날 기회가 많습니다. 여행이나 새로운 모임에 적극적으로 참여해보세요. 현재 연인과의 관계에 권태를 느낀다면, 함께 새로운 활동을 시도하며 관계에 활력을 불어넣는 노력이 필요합니다.";
    }

    // 일반적인 해석
    if ((jungsu + hasu) % 2 == 0) {
      return "애정운이 상승하여 솔로는 좋은 인연을 만나고, 커플은 사랑이 더욱 깊어집니다. 가정에 웃음꽃이 피고 화목한 분위기가 조성됩니다. 결혼 혼담이 오갈 수도 있는 좋은 시기입니다.";
    } else {
      return "사소한 오해로 인해 다툼이 생길 수 있습니다. 서로의 입장을 이해하고 배려하는 마음이 필요합니다. 감정적인 대응보다는 이성적인 대화로 문제를 해결하려고 노력하세요.";
    }
  }
}
