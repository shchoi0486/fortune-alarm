import 'dart:math';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'tojeong_monthly_data.dart';

class TojeongContent {
  // 상괘 (1-8) 해석: 전체적인 년운의 흐름 (하늘의 기운)
  static String getSangsuText(int sangsu, AppLocalizations l10n) {
    switch (sangsu) {
      case 1: return l10n.tojeongSangsuDetail1;
      case 2: return l10n.tojeongSangsuDetail2;
      case 3: return l10n.tojeongSangsuDetail3;
      case 4: return l10n.tojeongSangsuDetail4;
      case 5: return l10n.tojeongSangsuDetail5;
      case 6: return l10n.tojeongSangsuDetail6;
      case 7: return l10n.tojeongSangsuDetail7;
      case 8: return l10n.tojeongSangsuDetail8;
      default: return "";
    }
  }

  // 중괘 (1-6) 해석: 인간 관계와 사건의 전개 (사람의 일)
  static String getJungsuText(int jungsu, AppLocalizations l10n) {
    switch (jungsu) {
      case 1: return l10n.tojeongJungsuDetail1;
      case 2: return l10n.tojeongJungsuDetail2;
      case 3: return l10n.tojeongJungsuDetail3;
      case 4: return l10n.tojeongJungsuDetail4;
      case 5: return l10n.tojeongJungsuDetail5;
      case 6: return l10n.tojeongJungsuDetail6;
      default: return "";
    }
  }

  // 하괘 (1-3) 해석: 결과와 결실 (땅의 결과)
  static String getHasuText(int hasu, AppLocalizations l10n) {
    switch (hasu) {
      case 1: return l10n.tojeongHasuDetail1;
      case 2: return l10n.tojeongHasuDetail2;
      case 3: return l10n.tojeongHasuDetail3;
      default: return "";
    }
  }

  // 총운 상세 (조합 기반)
  static String getDetailedTotalLuck(int sangsu, int jungsu, int hasu, AppLocalizations l10n) {
    String sangsuKeyword = _getSangsuKeyword(sangsu, l10n);
    String jungsuKeyword = _getJungsuKeyword(jungsu, l10n);
    String hasuKeyword = _getHasuKeyword(hasu, l10n);

    String coreMessage = l10n.tojeongCoreMessage(sangsuKeyword, jungsuKeyword, hasuKeyword);

    String sangsuDetail = getSangsuText(sangsu, l10n);
    String jungsuDetail = getJungsuText(jungsu, l10n);
    String hasuDetail = getHasuText(hasu, l10n);

    return "$coreMessage\n\n[${l10n.tojeongTotalLuck}]\n$sangsuDetail\n\n[${l10n.tojeongProcess}]\n$jungsuDetail\n\n[${l10n.tojeongResult}]\n$hasuDetail";
  }

  // 상괘 키워드
  static String _getSangsuKeyword(int sangsu, AppLocalizations l10n) {
    switch (sangsu) {
      case 1: return l10n.tojeongSangsuKeyword1;
      case 2: return l10n.tojeongSangsuKeyword2;
      case 3: return l10n.tojeongSangsuKeyword3;
      case 4: return l10n.tojeongSangsuKeyword4;
      case 5: return l10n.tojeongSangsuKeyword5;
      case 6: return l10n.tojeongSangsuKeyword6;
      case 7: return l10n.tojeongSangsuKeyword7;
      case 8: return l10n.tojeongSangsuKeyword8;
      default: return "";
    }
  }

  // 중괘 키워드
  static String _getJungsuKeyword(int jungsu, AppLocalizations l10n) {
    switch (jungsu) {
      case 1: return l10n.tojeongJungsuKeyword1;
      case 2: return l10n.tojeongJungsuKeyword2;
      case 3: return l10n.tojeongJungsuKeyword3;
      case 4: return l10n.tojeongJungsuKeyword4;
      case 5: return l10n.tojeongJungsuKeyword5;
      case 6: return l10n.tojeongJungsuKeyword6;
      default: return "";
    }
  }

  // 하괘 키워드
  static String _getHasuKeyword(int hasu, AppLocalizations l10n) {
    switch (hasu) {
      case 1: return l10n.tojeongHasuKeyword1;
      case 2: return l10n.tojeongHasuKeyword2;
      case 3: return l10n.tojeongHasuKeyword3;
      default: return "";
    }
  }
  
  // 월별 운세 상세
  static String getMonthlyLuck(int month, int sangsu, int jungsu, int hasu, AppLocalizations l10n) {
    // 시드 생성: 상/중/하수와 월을 조합하여 고유한 시드값 생성
    int seed = (sangsu * 10000) + (jungsu * 1000) + (hasu * 100) + month;
    final random = Random(seed);

    String monthlySpecialSentence = "";
    String generalSentence = "";

    if (l10n.localeName == 'ko') {
      // 한국어 버전: 기존의 방대한 데이터 사용
      if (TojeongMonthlyData.monthlySentences.containsKey(month)) {
        final monthSentences = TojeongMonthlyData.monthlySentences[month]!;
        monthlySpecialSentence = monthSentences[random.nextInt(monthSentences.length)];
      }

      int luckCode = (sangsu + jungsu + hasu + month + (month ~/ 4)) % 3;
      switch (luckCode) {
        case 0: // Good
          generalSentence = TojeongMonthlyData.goodSentences[random.nextInt(TojeongMonthlyData.goodSentences.length)];
          break;
        case 1: // Neutral
          generalSentence = TojeongMonthlyData.neutralSentences[random.nextInt(TojeongMonthlyData.neutralSentences.length)];
          break;
        case 2: // Caution
          generalSentence = TojeongMonthlyData.cautionSentences[random.nextInt(TojeongMonthlyData.cautionSentences.length)];
          break;
        default:
          generalSentence = "무난한 한 달이 될 것입니다.";
      }
    } else {
      // 다국어 버전: ARB에 정의된 번역된 문구 사용
      int specialIndex = random.nextInt(5); // ARB에는 각 월별로 5개씩 정의됨
      monthlySpecialSentence = _getTranslatedSpecial(month, specialIndex, l10n);

      int luckCode = (sangsu + jungsu + hasu + month + (month ~/ 4)) % 3;
      int luckIndex = random.nextInt(5); // 각 행운 타입별로 5개씩 정의됨
      switch (luckCode) {
        case 0: generalSentence = _getTranslatedGood(luckIndex, l10n); break;
        case 1: generalSentence = _getTranslatedNeutral(luckIndex, l10n); break;
        case 2: generalSentence = _getTranslatedCaution(luckIndex, l10n); break;
        default: generalSentence = "A stable month is expected.";
      }
    }

    // 최종 문장 조합
    String finalSentence = monthlySpecialSentence.isNotEmpty
        ? "$monthlySpecialSentence\n$generalSentence"
        : generalSentence;

    final monthLabel = l10n.localeName == 'ko' 
        ? "$month${l10n.month}" 
        : DateFormat.MMMM(l10n.localeName).format(DateTime(2026, month));

    return "$monthLabel: $finalSentence";
  }

  static String _getTranslatedSpecial(int month, int index, AppLocalizations l10n) {
    switch (month) {
      case 1:
        if (index == 0) return l10n.tojeongMonthlySpecial_1_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_1_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_1_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_1_3;
        return l10n.tojeongMonthlySpecial_1_4;
      case 2:
        if (index == 0) return l10n.tojeongMonthlySpecial_2_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_2_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_2_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_2_3;
        return l10n.tojeongMonthlySpecial_2_4;
      case 3:
        if (index == 0) return l10n.tojeongMonthlySpecial_3_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_3_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_3_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_3_3;
        return l10n.tojeongMonthlySpecial_3_4;
      case 4:
        if (index == 0) return l10n.tojeongMonthlySpecial_4_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_4_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_4_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_4_3;
        return l10n.tojeongMonthlySpecial_4_4;
      case 5:
        if (index == 0) return l10n.tojeongMonthlySpecial_5_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_5_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_5_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_5_3;
        return l10n.tojeongMonthlySpecial_5_4;
      case 6:
        if (index == 0) return l10n.tojeongMonthlySpecial_6_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_6_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_6_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_6_3;
        return l10n.tojeongMonthlySpecial_6_4;
      case 7:
        if (index == 0) return l10n.tojeongMonthlySpecial_7_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_7_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_7_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_7_3;
        return l10n.tojeongMonthlySpecial_7_4;
      case 8:
        if (index == 0) return l10n.tojeongMonthlySpecial_8_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_8_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_8_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_8_3;
        return l10n.tojeongMonthlySpecial_8_4;
      case 9:
        if (index == 0) return l10n.tojeongMonthlySpecial_9_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_9_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_9_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_9_3;
        return l10n.tojeongMonthlySpecial_9_4;
      case 10:
        if (index == 0) return l10n.tojeongMonthlySpecial_10_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_10_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_10_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_10_3;
        return l10n.tojeongMonthlySpecial_10_4;
      case 11:
        if (index == 0) return l10n.tojeongMonthlySpecial_11_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_11_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_11_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_11_3;
        return l10n.tojeongMonthlySpecial_11_4;
      case 12:
        if (index == 0) return l10n.tojeongMonthlySpecial_12_0;
        if (index == 1) return l10n.tojeongMonthlySpecial_12_1;
        if (index == 2) return l10n.tojeongMonthlySpecial_12_2;
        if (index == 3) return l10n.tojeongMonthlySpecial_12_3;
        return l10n.tojeongMonthlySpecial_12_4;
      default:
        return "";
    }
  }

  static String _getTranslatedGood(int index, AppLocalizations l10n) {
    switch (index) {
      case 0: return l10n.tojeongMonthlyGood_0;
      case 1: return l10n.tojeongMonthlyGood_1;
      case 2: return l10n.tojeongMonthlyGood_2;
      case 3: return l10n.tojeongMonthlyGood_3;
      case 4: return l10n.tojeongMonthlyGood_4;
      default: return l10n.tojeongMonthlyGood_0;
    }
  }

  static String _getTranslatedNeutral(int index, AppLocalizations l10n) {
    switch (index) {
      case 0: return l10n.tojeongMonthlyNeutral_0;
      case 1: return l10n.tojeongMonthlyNeutral_1;
      case 2: return l10n.tojeongMonthlyNeutral_2;
      case 3: return l10n.tojeongMonthlyNeutral_3;
      case 4: return l10n.tojeongMonthlyNeutral_4;
      default: return l10n.tojeongMonthlyNeutral_0;
    }
  }

  static String _getTranslatedCaution(int index, AppLocalizations l10n) {
    switch (index) {
      case 0: return l10n.tojeongMonthlyCaution_0;
      case 1: return l10n.tojeongMonthlyCaution_1;
      case 2: return l10n.tojeongMonthlyCaution_2;
      case 3: return l10n.tojeongMonthlyCaution_3;
      case 4: return l10n.tojeongMonthlyCaution_4;
      default: return l10n.tojeongMonthlyCaution_0;
    }
  }
  
  // 재물운
  static String getWealthLuck(int sangsu, int jungsu, AppLocalizations l10n) {
    // 특정 괘 조합에 대한 특별 해석
    if (sangsu == 1 && jungsu == 5) { // 건(하늘) + 재물 왕성
       return l10n.localeName == 'ko' 
         ? "하늘의 기운이 재물을 돕는 형국입니다. 큰 재물이 들어올 기회가 있으나, 그만큼 크게 나갈 수도 있습니다. 과감한 투자보다는 안정적인 자산 관리에 힘쓰는 것이 좋으며, 얻은 재물을 주변에 베풀면 더 큰 복이 되어 돌아옵니다."
         : "The energy of heaven is helping your wealth. There is a chance for large wealth to come in, but it could also go out just as much. It's better to focus on stable asset management rather than bold investments, and sharing your wealth will bring even greater blessings.";
    }
    if (sangsu == 8 && jungsu == 1) { // 곤(땅) + 귀인
       return l10n.localeName == 'ko'
         ? "땅의 기운처럼 꾸준하고 안정적인 재물운입니다. 특히 부동산이나 장기적인 투자에서 이익을 볼 수 있습니다. 귀인의 도움으로 재물을 얻게 되니, 주변 사람들과의 신뢰를 중요시해야 합니다."
         : "It is a steady and stable wealth luck like the energy of the earth. You can especially see profits in real estate or long-term investments. Since you will gain wealth with the help of a helper, you should value trust with those around you.";
    }

    // 일반적인 해석
    if ((sangsu + jungsu) % 2 == 0) {
      return l10n.tojeongGeneralWealthGood;
    } else {
      return l10n.tojeongGeneralWealthBad;
    }
  }

  // 직장/사업운
  static String getCareerLuck(int sangsu, int hasu, AppLocalizations l10n) {
    // 특정 괘 조합에 대한 특별 해석
    if (sangsu == 4 && hasu == 1) { // 진(우레) + 성공
       return l10n.localeName == 'ko'
         ? "우레와 같이 명성을 떨칠 기회가 옵니다. 새로운 프로젝트나 사업을 시작하면 큰 성공을 거둘 수 있습니다. 과감한 결단력과 추진력이 빛을 발하는 시기이니, 망설이지 말고 앞으로 나아가세요."
         : "An opportunity to gain fame like thunder is coming. Starting a new project or business could lead to great success. It's a time when bold decisiveness and drive shine, so move forward without hesitation.";
    }
    if (sangsu == 7 && hasu == 3) { // 간(산) + 인내
       return l10n.localeName == 'ko'
         ? "태산 같은 어려움이 앞을 가로막는 듯하나, 끈기 있게 버티면 결국에는 정상에 오를 수 있습니다. 현재의 자리를 지키며 내실을 다지는 것이 중요합니다. 성급한 변화는 오히려 해가 될 수 있으니, 인내심을 가지고 때를 기다리세요."
         : "Difficulties like a great mountain may block your path, but if you persevere, you will eventually reach the summit. It's important to maintain your current position and build inner strength. Hasty changes could be harmful, so wait patiently for the right time.";
    }

    // 일반적인 해석
    if ((sangsu + hasu) % 2 == 1) {
      return l10n.tojeongGeneralCareerGood;
    } else {
      return l10n.tojeongGeneralCareerBad;
    }
  }
  
  // 연애/가정운
  static String getLoveLuck(int jungsu, int hasu, AppLocalizations l10n) {
    // 특정 괘 조합에 대한 특별 해석
    if (jungsu == 2 && hasu == 1) { // 가정 경사 + 성공
       return l10n.localeName == 'ko'
         ? "가정에 큰 경사가 있어 웃음꽃이 만발합니다. 결혼이나 출산 등 새로운 식구를 맞이할 기쁨이 있으며, 가족 구성원 모두가 화합하여 행복이 가득한 시기입니다. 연인과의 관계는 결실을 맺게 됩니다."
         : "There's a big celebration at home, and laughter abounds. There's joy in welcoming a new family member such as marriage or childbirth, and it's a time full of happiness with all family members in harmony. Relationships with partners will bear fruit.";
    }
    if (jungsu == 3 && hasu == 2) { // 이동/변화 + 노력
       return l10n.localeName == 'ko'
         ? "새로운 환경에서 좋은 인연을 만날 기회가 많습니다. 여행이나 새로운 모임에 적극적으로 참여해보세요. 현재 연인과의 관계에 권태를 느낀다면, 함께 새로운 활동을 시도하며 관계에 활력을 불어넣는 노력이 필요합니다."
         : "There are many opportunities to meet good people in a new environment. Actively participate in travel or new gatherings. If you feel bored in your current relationship, efforts are needed to revitalize the relationship by trying new activities together.";
    }

    // 일반적인 해석
    if ((jungsu + hasu) % 2 == 0) {
      return l10n.tojeongGeneralLoveGood;
    } else {
      return l10n.tojeongGeneralLoveBad;
    }
  }
}
