import 'package:fortune_alarm/l10n/app_localizations.dart';

class TojeongMonthlyData {
  static String getMonthlySpecial(AppLocalizations l10n, int month, int index) {
    switch (month) {
      case 1:
        if (index == 0) return l10n.tojeongMonthlySpecial_1_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_1_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_1_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_1_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_1_4;
        break;
      case 2:
        if (index == 0) return l10n.tojeongMonthlySpecial_2_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_2_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_2_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_2_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_2_4;
        break;
      case 3:
        if (index == 0) return l10n.tojeongMonthlySpecial_3_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_3_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_3_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_3_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_3_4;
        break;
      case 4:
        if (index == 0) return l10n.tojeongMonthlySpecial_4_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_4_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_4_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_4_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_4_4;
        break;
      case 5:
        if (index == 0) return l10n.tojeongMonthlySpecial_5_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_5_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_5_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_5_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_5_4;
        break;
      case 6:
        if (index == 0) return l10n.tojeongMonthlySpecial_6_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_6_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_6_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_6_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_6_4;
        break;
      case 7:
        if (index == 0) return l10n.tojeongMonthlySpecial_7_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_7_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_7_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_7_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_7_4;
        break;
      case 8:
        if (index == 0) return l10n.tojeongMonthlySpecial_8_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_8_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_8_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_8_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_8_4;
        break;
      case 9:
        if (index == 0) return l10n.tojeongMonthlySpecial_9_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_9_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_9_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_9_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_9_4;
        break;
      case 10:
        if (index == 0) return l10n.tojeongMonthlySpecial_10_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_10_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_10_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_10_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_10_4;
        break;
      case 11:
        if (index == 0) return l10n.tojeongMonthlySpecial_11_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_11_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_11_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_11_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_11_4;
        break;
      case 12:
        if (index == 0) return l10n.tojeongMonthlySpecial_12_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_12_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_12_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_12_3;
        if (index == 4) return l10n.tojeongMonthlySpecial_12_4;
        break;
    }
    return "";
  }

  static String getGoodSentence(AppLocalizations l10n, int index) {
    switch (index % 5) {
      case 0: return l10n.tojeongMonthlyGood_0;
      case 1: return l10n.tojeongMonthlyGood_1;
      case 2: return l10n.tojeongMonthlyGood_2;
      case 3: return l10n.tojeongMonthlyGood_3;
      case 4: return l10n.tojeongMonthlyGood_4;
      default: return l10n.tojeongMonthlyGood_0;
    }
  }

  static String getNeutralSentence(AppLocalizations l10n, int index) {
    switch (index % 5) {
      case 0: return l10n.tojeongMonthlyNeutral_0;
      case 1: return l10n.tojeongMonthlyNeutral_1;
      case 2: return l10n.tojeongMonthlyNeutral_2;
      case 3: return l10n.tojeongMonthlyNeutral_3;
      case 4: return l10n.tojeongMonthlyNeutral_4;
      default: return l10n.tojeongMonthlyNeutral_0;
    }
  }

  static String getCautionSentence(AppLocalizations l10n, int index) {
    switch (index % 5) {
      case 0: return l10n.tojeongMonthlyCaution_0;
      case 1: return l10n.tojeongMonthlyCaution_1;
      case 2: return l10n.tojeongMonthlyCaution_2;
      case 3: return l10n.tojeongMonthlyCaution_3;
      case 4: return l10n.tojeongMonthlyCaution_4;
      default: return l10n.tojeongMonthlyCaution_0;
    }
  }

  // 월별 특화 문장
  static const Map<int, List<String>> monthlySentences = {
    1: [
      "새해의 맑은 기운이 함께하니, 계획한 바를 시작하면 순조롭게 풀릴 것입니다.",
      "연초에는 귀인의 도움이 따르니, 주변 사람들과의 관계를 소중히 하세요.",
      "의욕이 앞서 일을 그르칠 수 있습니다. 차분하게 장기적인 관점에서 계획을 점검하세요.",
      "시작이 반입니다. 미뤄왔던 일을 과감하게 시작하면 의외의 성과를 얻습니다.",
      "작은 습관의 변화가 큰 운의 흐름을 바꿉니다. 일찍 일어나는 습관을 들여보세요."
    ],
    2: [
      "아직은 때가 아니니, 수면 아래에서 힘을 기르며 기회를 엿보아야 합니다.",
      "오래된 문제나 갈등이 수면 위로 드러날 수 있습니다. 회피하지 말고 정면으로 해결하세요.",
      "겉으로 보이는 성과보다 내실을 다지는 것이 중요한 시기입니다. 섣부른 움직임은 손해를 부릅니다.",
      "겨울의 끝자락에서 봄을 기다리듯, 인내심을 가지고 준비하는 자에게 기회가 옵니다.",
      "주변의 소란스러움에 동요하지 말고 자신의 길을 묵묵히 걸어가야 합니다."
    ],
    3: [
      "만물이 소생하는 기운이 당신에게 새로운 기회를 가져다줍니다. 망설이지 말고 도전하세요.",
      "새로운 인연이 시작될 수 있는 달입니다. 긍정적인 마음으로 사람들을 대하면 좋은 결실을 맺습니다.",
      "변화의 바람 속에서 중심을 잃기 쉽습니다. 사소한 감정 변화에 휘둘리지 않도록 마음을 다스리세요.",
      "새싹이 땅을 뚫고 나오듯, 당신의 잠재력이 폭발하는 시기입니다. 자신감을 가지세요.",
      "귀한 인연이 찾아오니 마음의 문을 활짝 열고 사람을 맞이하세요."
    ],
    4: [
      "따스한 기운과 함께 재물운이 상승합니다. 노력의 결실이 금전적 보상으로 이어질 것입니다.",
      "문서운이 길하여 계약이나 시험에서 좋은 결과를 얻을 수 있습니다. 신중하게 검토하세요.",
      "예상치 못한 지출이 발생할 수 있으니, 금전 관리에 각별히 신경 써야 합니다.",
      "꽃이 만개하듯 당신의 매력이 돋보이는 달입니다. 대인관계에서 주도권을 잡으세요.",
      "재물운이 따르니 투자를 하거나 저축을 늘리기에 좋은 시기입니다."
    ],
    5: [
      "가정에 화목한 기운이 깃드니, 가족과의 관계에서 기쁨을 얻고 안정을 찾게 됩니다.",
      "주변 사람들에게 베푼 친절이 복이 되어 돌아옵니다. 인덕이 쌓여 어려움을 해결해 줍니다.",
      "사소한 오해로 가까운 사람과 다툼이 생길 수 있습니다. 역지사지의 자세가 필요합니다.",
      "가정의 달인 만큼 가족과의 시간에 집중하세요. 집안의 화목이 모든 일의 근본입니다.",
      "마음의 여유를 가지고 주변을 둘러보면, 놓치고 있던 소중한 것들을 발견하게 됩니다."
    ],
    6: [
      "그동안의 노력이 결실을 맺어 주변의 인정을 받게 됩니다. 승진이나 명예의 기회가 있습니다.",
      "활동적인 기운이 강해지니, 새로운 분야로의 확장이나 이직을 고려해볼 만합니다.",
      "너무 앞서나가면 구설에 오를 수 있습니다. 겸손한 태도를 유지하고 주변을 살피세요.",
      "더위가 시작되기 전, 체력을 비축해두어야 합니다. 건강 검진을 받아보는 것도 좋습니다.",
      "상반기를 마무리하고 하반기를 계획하는 중간 점검의 시간을 가지세요."
    ],
    7: [
      "뜨거운 열정이 성과로 이어지는 시기입니다. 과감하게 추진하면 목표를 달성할 수 있습니다.",
      "여행이나 이동 중에 귀인을 만나거나 새로운 기회를 얻게 될 수 있습니다.",
      "건강을 해치기 쉬운 시기입니다. 과로를 피하고 충분한 휴식을 취하는 것이 중요합니다.",
      "무더위 속에서도 지치지 않는 열정이 필요합니다. 땀 흘린 만큼 결실이 있을 것입니다.",
      "휴식을 통해 재충전의 시간을 가지세요. 멀리 떠나는 여행이 행운을 가져다줍니다."
    ],
    8: [
      "인내의 시간이 지나고 점차 운이 트이기 시작합니다. 조급해하지 말고 때를 기다리세요.",
      "해결되지 않던 묵은 문제가 실마리를 찾게 됩니다. 지혜를 발휘하여 해결하세요.",
      "결실을 앞두고 방심하기 쉽습니다. 마지막까지 긴장의 끈을 놓지 마세요.",
      "결실의 계절을 앞두고 마지막 스퍼트를 올려야 할 때입니다. 긴장을 늦추지 마세요.",
      "뜻하지 않은 도움의 손길이 있습니다. 어려움이 있다면 주변에 조언을 구하세요."
    ],
    9: [
      "풍성한 결실의 계절처럼, 재물운과 애정운이 모두 풍요로워지는 시기입니다.",
      "그동안 공들인 일이 있다면, 기대 이상의 좋은 결과를 얻게 될 것입니다.",
      "들어오는 것이 많은 만큼 나가는 것도 많을 수 있습니다. 현명한 소비 계획이 필요합니다.",
      "황금 들판처럼 풍요로운 시기입니다. 베푸는 마음을 가지면 더 큰 복이 들어옵니다.",
      "그동안의 오해나 갈등을 풀기에 좋은 시기입니다. 먼저 손을 내밀어 보세요."
    ],
    10: [
      "명예운이 높아져 당신의 이름이 널리 알려지게 됩니다. 주변의 신망을 얻게 될 것입니다.",
      "지적인 활동에서 큰 성과를 거둘 수 있습니다. 학업이나 연구에 매진하기 좋은 때입니다.",
      "높아진 위상만큼 책임감도 무거워집니다. 언행에 신중을 기해야 합니다.",
      "높고 푸른 하늘처럼 명예운이 상승합니다. 자신의 능력을 마음껏 펼쳐보세요.",
      "깊이 있는 사색과 독서를 통해 내면의 지혜를 쌓기에 좋은 달입니다."
    ],
    11: [
      "한 해를 돌아보며 미래를 준비하는 지혜가 필요한 시기입니다. 성찰을 통해 한 단계 성장하게 됩니다.",
      "금전적인 안정을 찾게 되나, 큰 이익을 좇아 무리한 투자를 하는 것은 금물입니다.",
      "인간관계에서 외로움을 느낄 수 있습니다. 먼저 마음을 열고 다가가는 노력이 필요합니다.",
      "차가운 바람이 불어오니 옷깃을 여미듯, 실속을 챙기고 내실을 다져야 합니다.",
      "한 해를 정리하며 부족했던 점을 되돌아보고 내년을 준비하는 지혜가 필요합니다."
    ],
    12: [
      "연말에 뜻밖의 행운이 찾아옵니다. 금전적인 이득이나 좋은 소식을 기대해 보세요.",
      "오랜 시간 노력해온 일에 대한 보상을 받게 됩니다. 유종의 미를 거두는 달입니다.",
      "모임이 잦아져 건강을 해치거나 불필요한 지출을 할 수 있으니, 절제가 필요합니다.",
      "끝은 새로운 시작입니다. 아쉬움보다는 희망찬 미래를 설계하며 한 해를 마무리하세요.",
      "따뜻한 나눔을 실천하면 그 온기가 당신에게 행운으로 돌아옵니다."
    ]
  };

  static const List<String> goodSentences = [
    "동쪽에서 귀인이 찾아오니 기쁜 소식을 듣게 됩니다. 오랫동안 기다리던 일이 성사될 운세입니다.",
    "재물이 샘솟듯 하니 곳간이 가득 찹니다. 하는 일마다 순조로우니 근심이 사라집니다.",
    "노력의 결실을 맺어 주변의 축하를 받게 됩니다. 승진의 기쁨이나 좋은 성과가 기대됩니다.",
    "어두운 밤이 지나고 아침 해가 떠오르는 형상입니다. 고진감래라, 고생 끝에 낙이 옵니다.",
    "뜻밖의 횡재수가 있으니 주머니가 두둑해집니다. 작은 투자로 큰 이익을 얻을 수 있습니다.",
    "봄바람에 꽃이 피듯 만사가 형통합니다. 주변 사람들의 도움으로 어려운 일을 쉽게 해결합니다.",
    "직장에서 인정을 받고 명예가 올라갑니다. 승진이나 영전의 기회가 찾아올 것입니다.",
    "가뭄에 단비가 내리니 만물이 소생합니다. 막혔던 자금줄이 풀리고 사업이 번창합니다.",
    "천리길도 한 걸음부터입니다. 시작은 미약하나 그 끝은 창대할 것입니다.",
    "귀인의 도움으로 위기를 모면하고 오히려 기회를 잡게 됩니다. 전화위복의 달입니다.",
    "문서운이 좋아 계약이나 매매가 성사될 시기입니다. 신중하게 결정하면 큰 이득을 봅니다.",
    "주변 사람들과의 관계가 더욱 돈독해지고, 그 속에서 기쁨을 찾게 되는 시기입니다.",
    "우연히 만난 인연이 훗날 큰 도움이 됩니다. 대인 관계를 넓히기에 좋은 시기입니다.",
    "하늘이 돕고 땅이 도우니 못 이룰 것이 없습니다. 자신감을 가지고 도전해 보세요.",
    "오랫동안 묵혀두었던 문제가 해결의 실마리를 찾습니다. 마음의 짐을 덜게 됩니다.",
    "새로운 지식이나 기술을 배우기에 더없이 좋은 시기입니다. 배움의 즐거움이 가득할 것입니다.",
    "오랫동안 계획했던 여행을 떠나게 되거나, 새로운 경험을 통해 시야가 넓어집니다.",
    "예상치 못한 곳에서 당신의 재능을 인정받고 새로운 기회를 얻게 됩니다."
  ];

  static const List<String> neutralSentences = [
    "평온한 일상이 이어지는 달입니다. 특별한 사건 없이 무난하게 지나갑니다.",
    "욕심을 버리고 현재에 만족하면 마음이 편안해집니다. 소소한 행복을 즐겨보세요.",
    "바쁜 일상 속에서도 잠시 휴식을 취하는 것이 좋겠습니다. 건강 관리에 유의하세요.",
    "새로운 일을 벌이기보다는 현재 하던 일을 꾸준히 유지하는 것이 유리합니다.",
    "주변 사람들과의 소통이 중요한 시기입니다. 오해를 사지 않도록 언행에 주의하세요.",
    "노력한 만큼의 대가가 따르는 정직한 달입니다. 요행을 바라지 말고 성실하게 임하세요.",
    "가까운 곳으로 여행을 떠나 기분 전환을 하는 것도 좋겠습니다.",
    "옛 친구를 만나 회포를 풀기에 좋은 때입니다. 추억을 나누며 에너지를 얻으세요.",
    "독서나 취미 생활로 내면을 가꾸기에 적절한 시기입니다.",
    "재물의 흐름이 원활하지 않으나 큰 손해는 없습니다. 지출 관리에 신경 쓰세요.",
    "조급함을 버리고 때를 기다리는 지혜가 필요합니다. 서두르면 오히려 그르칠 수 있습니다.",
    "중요한 결정은 잠시 미루고 상황을 지켜보는 것이 좋겠습니다.",
    "규칙적인 생활과 꾸준한 자기 관리가 필요한 시기입니다. 건강이 가장 큰 자산입니다.",
    "말 한마디로 천 냥 빚을 갚을 수 있습니다. 긍정적이고 신중한 언어 습관이 중요합니다."
  ];

  static const List<String> cautionSentences = [
    "매사 신중해야 할 달입니다. 돌다리도 두들겨 보고 건너는 지혜가 필요합니다.",
    "건강에 유의하고 무리한 활동은 피하세요. 과로가 병이 될 수 있습니다.",
    "구설수에 휘말릴 수 있으니 남의 말에 끼어들지 않는 것이 상책입니다.",
    "지나친 욕심은 화를 부릅니다. 분수에 맞는 생활을 하는 것이 안전합니다.",
    "믿었던 사람에게 실망할 수 있으니 금전 거래는 피하는 것이 좋습니다.",
    "먼 여행은 삼가는 것이 좋겠습니다. 집안에서 조용히 지내는 것이 유리합니다.",
    "사소한 다툼이 큰 싸움으로 번질 수 있으니 한 발 양보하는 미덕을 발휘하세요.",
    "새로운 투자나 사업 확장은 불리한 시기입니다. 현상 유지에 힘쓰세요.",
    "도난이나 분실의 우려가 있으니 문단속을 철저히 하고 소지품을 잘 챙기세요.",
    "생각지 못한 지출이 발생할 수 있습니다. 비상금을 마련해 두는 것이 좋겠습니다.",
    "찬바람이 불어오니 마음이 쓸쓸합니다. 멘탈 관리에 신경 써야 할 때입니다.",
    "달콤한 유혹에 넘어가지 마세요. 사기나 기만에 주의해야 합니다.",
    "운전 시 주의가 필요합니다. 급한 마음을 버리고 안전 운전하세요.",
    "감정적인 소비는 후회를 남길 수 있습니다. 지출하기 전에 한 번 더 생각하는 습관을 들이세요.",
    "익숙한 길도 다시 한번 확인하세요. 사소한 부주의가 예상치 못한 문제로 이어질 수 있습니다."
  ];
}
