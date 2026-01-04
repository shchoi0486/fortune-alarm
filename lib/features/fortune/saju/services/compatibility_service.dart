import '../models/saju_data.dart';
import '../models/saju_profile.dart';
import 'saju_service.dart';

class CompatibilityScore {
  final int totalScore;
  final String title;
  final String description;
  final List<CompatibilityDetail> details;

  CompatibilityScore({
    required this.totalScore,
    required this.title,
    required this.description,
    required this.details,
  });
}

class CompatibilityDetail {
  final String category;
  final String summary;
  final String description;
  final int score; // -10 to 10 scale for visual representation
  final bool isPositive;

  CompatibilityDetail({
    required this.category,
    required this.summary,
    required this.description,
    required this.score,
    required this.isPositive,
  });
}

class CompatibilityService {
  static const Map<Jiji, List<Jiji>> _samhap = {
    Jiji.sin: [Jiji.ja, Jiji.jin],
    Jiji.ja: [Jiji.sin, Jiji.jin],
    Jiji.jin: [Jiji.sin, Jiji.ja],
    Jiji.sa: [Jiji.yu, Jiji.chuk],
    Jiji.yu: [Jiji.sa, Jiji.chuk],
    Jiji.chuk: [Jiji.sa, Jiji.yu],
    Jiji.in_: [Jiji.o, Jiji.sul],
    Jiji.o: [Jiji.in_, Jiji.sul],
    Jiji.sul: [Jiji.in_, Jiji.o],
    Jiji.hae: [Jiji.myo, Jiji.mi],
    Jiji.myo: [Jiji.hae, Jiji.mi],
    Jiji.mi: [Jiji.hae, Jiji.myo],
  };

  static const Map<Jiji, Jiji> _yukhap = {
    Jiji.ja: Jiji.chuk, Jiji.chuk: Jiji.ja,
    Jiji.in_: Jiji.hae, Jiji.hae: Jiji.in_,
    Jiji.myo: Jiji.sul, Jiji.sul: Jiji.myo,
    Jiji.jin: Jiji.yu, Jiji.yu: Jiji.jin,
    Jiji.sa: Jiji.sin, Jiji.sin: Jiji.sa,
    Jiji.o: Jiji.mi, Jiji.mi: Jiji.o,
  };

  static const Map<Jiji, Jiji> _chung = {
    Jiji.ja: Jiji.o, Jiji.o: Jiji.ja,
    Jiji.chuk: Jiji.mi, Jiji.mi: Jiji.chuk,
    Jiji.in_: Jiji.sin, Jiji.sin: Jiji.in_,
    Jiji.myo: Jiji.yu, Jiji.yu: Jiji.myo,
    Jiji.jin: Jiji.sul, Jiji.sul: Jiji.jin,
    Jiji.sa: Jiji.hae, Jiji.hae: Jiji.sa,
  };

  static const Map<Jiji, Jiji> _wonjin = {
    Jiji.ja: Jiji.mi, Jiji.mi: Jiji.ja,
    Jiji.chuk: Jiji.o, Jiji.o: Jiji.chuk,
    Jiji.in_: Jiji.yu, Jiji.yu: Jiji.in_,
    Jiji.myo: Jiji.sin, Jiji.sin: Jiji.myo,
    Jiji.jin: Jiji.hae, Jiji.hae: Jiji.jin,
    Jiji.sa: Jiji.sul, Jiji.sul: Jiji.sa,
  };

  static const Map<Cheongan, Cheongan> _cheonganHap = {
    Cheongan.gap: Cheongan.gi, Cheongan.gi: Cheongan.gap,
    Cheongan.eul: Cheongan.gyeong, Cheongan.gyeong: Cheongan.eul,
    Cheongan.byeong: Cheongan.sin, Cheongan.sin: Cheongan.byeong,
    Cheongan.jeong: Cheongan.im, Cheongan.im: Cheongan.jeong,
    Cheongan.mu: Cheongan.gye, Cheongan.gye: Cheongan.mu,
  };

  // Simplified Zodiac Date Ranges
  static String getZodiacSign(DateTime date) {
    int day = date.day;
    switch (date.month) {
      case 1: return day >= 20 ? "물병자리" : "염소자리";
      case 2: return day >= 19 ? "물고기자리" : "물병자리";
      case 3: return day >= 21 ? "양자리" : "물고기자리";
      case 4: return day >= 20 ? "황소자리" : "양자리";
      case 5: return day >= 21 ? "쌍둥이자리" : "황소자리";
      case 6: return day >= 22 ? "게자리" : "쌍둥이자리";
      case 7: return day >= 23 ? "사자자리" : "게자리";
      case 8: return day >= 23 ? "처녀자리" : "사자자리";
      case 9: return day >= 23 ? "천칭자리" : "처녀자리";
      case 10: return day >= 23 ? "전갈자리" : "천칭자리";
      case 11: return day >= 23 ? "사수자리" : "전갈자리";
      case 12: return day >= 25 ? "염소자리" : "사수자리";
      default: return "알 수 없음";
    }
  }

  static String getZodiacElement(String sign) {
    switch (sign) {
      case "양자리": case "사자자리": case "사수자리": return "불";
      case "황소자리": case "처녀자리": case "염소자리": return "흙";
      case "쌍둥이자리": case "천칭자리": case "물병자리": return "공기";
      case "게자리": case "전갈자리": case "물고기자리": return "물";
      default: return "알 수 없음";
    }
  }

  static CompatibilityScore analyze(SajuProfile p1, SajuProfile p2) {
    int score = 50; // Base score
    List<CompatibilityDetail> details = [];

    final saju1 = SajuService.calculateSaju(p1);
    final saju2 = SajuService.calculateSaju(p2);

    // 1. 띠 궁합 (겉궁합) - Year Pillar Jiji
    final year1 = saju1['year']!.jiji;
    final year2 = saju2['year']!.jiji;
    
    if (_samhap[year1]?.contains(year2) ?? false) {
      score += 20;
      details.add(CompatibilityDetail(
        category: "띠 궁합",
        summary: "최고의 띠 궁합 (삼합)",
        description: "${year1.animal}띠와 ${year2.animal}띠는 서로 부족한 점을 채워주는 최고의 궁합입니다. 함께하면 시너지가 나는 관계입니다.",
        score: 9,
        isPositive: true,
      ));
    } else if (_yukhap[year1] == year2) {
      score += 15;
      details.add(CompatibilityDetail(
        category: "띠 궁합",
        summary: "아주 좋은 띠 궁합 (육합)",
        description: "${year1.animal}띠와 ${year2.animal}띠는 서로 끌리는 매력이 강한 궁합입니다. 처음부터 호감을 느끼기 쉽습니다.",
        score: 8,
        isPositive: true,
      ));
    } else if (_chung[year1] == year2) {
      score -= 10;
      details.add(CompatibilityDetail(
        category: "띠 궁합",
        summary: "노력이 필요한 관계 (상충)",
        description: "${year1.animal}띠와 ${year2.animal}띠는 서로의 기질이 달라 부딪힐 수 있습니다. 서로 다름을 인정하고 배려가 필요합니다.",
        score: 3,
        isPositive: false,
      ));
    } else if (_wonjin[year1] == year2) {
      score -= 10;
      details.add(CompatibilityDetail(
        category: "띠 궁합",
        summary: "이해와 배려가 필요한 관계 (원진)",
        description: "가끔 이유 없이 미워지거나 서운할 수 있는 관계입니다. 오해를 줄이도록 대화를 많이 하는 것이 좋습니다.",
        score: 3,
        isPositive: false,
      ));
    } else {
      score += 5;
      details.add(CompatibilityDetail(
        category: "띠 궁합",
        summary: "무난한 띠 궁합",
        description: "${year1.animal}띠와 ${year2.animal}띠는 크게 부딪힘 없이 무난하게 잘 어울리는 관계입니다.",
        score: 6,
        isPositive: true,
      ));
    }

    // 2. 속궁합 (일간 궁합) - Day Pillar Cheongan
    final dayStem1 = saju1['day']!.cheongan;
    final dayStem2 = saju2['day']!.cheongan;

    if (_cheonganHap[dayStem1] == dayStem2) {
      score += 25;
      details.add(CompatibilityDetail(
        category: "속마음 궁합",
        summary: "영혼의 단짝 (천간합)",
        description: "두 사람의 성격과 가치관이 찰떡궁합입니다. 말하지 않아도 서로의 마음을 잘 알아주는 소울메이트입니다.",
        score: 10,
        isPositive: true,
      ));
    } else {
      // 오행 상생/상극 체크
      final ohaeng1 = dayStem1.ohaeng;
      final ohaeng2 = dayStem2.ohaeng;

      if (_isSangsaeng(ohaeng1, ohaeng2)) {
        score += 15;
        details.add(CompatibilityDetail(
          category: "속마음 궁합",
          summary: "서로 돕는 관계 (상생)",
          description: "서로에게 힘이 되어주고 발전할 수 있도록 돕는 긍정적인 관계입니다.",
          score: 8,
          isPositive: true,
        ));
      } else if (_isSanggeuk(ohaeng1, ohaeng2)) {
        score -= 5;
        details.add(CompatibilityDetail(
          category: "속마음 궁합",
          summary: "조율이 필요한 관계 (상극)",
          description: "성격 차이가 있을 수 있으나, 서로의 단점을 보완해줄 수 있는 관계이기도 합니다.",
          score: 4,
          isPositive: false,
        ));
      } else {
        score += 5;
        details.add(CompatibilityDetail(
          category: "속마음 궁합",
          summary: "친구 같은 편안함",
          description: "비슷한 성향을 가지고 있어 친구처럼 편안하게 지낼 수 있는 관계입니다.",
          score: 6,
          isPositive: true,
        ));
      }
    }

    // 3. 별자리 궁합
    final sign1 = getZodiacSign(p1.birthDate);
    final sign2 = getZodiacSign(p2.birthDate);
    final elem1 = getZodiacElement(sign1);
    final elem2 = getZodiacElement(sign2);

    if (elem1 == elem2) {
      score += 15;
      details.add(CompatibilityDetail(
        category: "별자리 궁합",
        summary: "같은 성향의 만남",
        description: "두 분 다 '$elem1'의 성향을 가지고 있어 가치관이나 행동 방식이 매우 비슷합니다.",
        score: 8,
        isPositive: true,
      ));
    } else if (_isCompatibleElement(elem1, elem2)) {
      score += 10;
      details.add(CompatibilityDetail(
        category: "별자리 궁합",
        summary: "잘 어울리는 조화",
        description: "서로 다른 매력이 있지만 조화롭게 어우러지는 관계입니다.",
        score: 7,
        isPositive: true,
      ));
    } else if (_isIncompatibleElement(elem1, elem2)) {
      score -= 5;
       details.add(CompatibilityDetail(
        category: "별자리 궁합",
        summary: "다른 매력의 만남",
        description: "서로 정반대의 성향을 가질 수 있습니다. 서로의 차이를 즐기면 더욱 깊은 관계가 될 수 있습니다.",
        score: 4,
        isPositive: false,
      ));
    } else {
      score += 5;
      details.add(CompatibilityDetail(
        category: "별자리 궁합",
        summary: "평범한 조화",
        description: "별자리로 보았을 때 무난하게 어울리는 관계입니다.",
        score: 6,
        isPositive: true,
      ));
    }

    // Score Capping
    if (score > 100) score = 100;
    if (score < 20) score = 20;

    String title;
    String description;

    if (score >= 90) {
      title = "천생연분이에요! ❤️";
      description = "더 이상 바랄 게 없는 최고의 궁합입니다. 서로를 놓치지 마세요!";
    } else if (score >= 80) {
      title = "아주 좋은 인연이에요 💕";
      description = "서로에게 큰 힘이 되는 훌륭한 파트너입니다.";
    } else if (score >= 60) {
      title = "잘 어울리는 커플이에요 😊";
      description = "약간의 차이는 있지만 서로 맞춰가며 예쁜 사랑을 할 수 있습니다.";
    } else if (score >= 40) {
      title = "노력이 필요해요 🧐";
      description = "서로 다른 점이 많습니다. 이해와 배려가 관계의 핵심입니다.";
    } else {
      title = "많이 맞춰가야 해요 😅";
      description = "성격 차이가 클 수 있습니다. 서로의 다름을 깊이 이해해야 합니다.";
    }

    return CompatibilityScore(
      totalScore: score,
      title: title,
      description: description,
      details: details,
    );
  }

  static bool _isSangsaeng(Ohaeng o1, Ohaeng o2) {
    // 목->화->토->금->수->목
    if (o1 == Ohaeng.wood && o2 == Ohaeng.fire) return true;
    if (o1 == Ohaeng.fire && o2 == Ohaeng.earth) return true;
    if (o1 == Ohaeng.earth && o2 == Ohaeng.metal) return true;
    if (o1 == Ohaeng.metal && o2 == Ohaeng.water) return true;
    if (o1 == Ohaeng.water && o2 == Ohaeng.wood) return true;
    // Reverse direction (receiving support) is also good
    if (o2 == Ohaeng.wood && o1 == Ohaeng.fire) return true;
    if (o2 == Ohaeng.fire && o1 == Ohaeng.earth) return true;
    if (o2 == Ohaeng.earth && o1 == Ohaeng.metal) return true;
    if (o2 == Ohaeng.metal && o1 == Ohaeng.water) return true;
    if (o2 == Ohaeng.water && o1 == Ohaeng.wood) return true;
    return false;
  }

  static bool _isSanggeuk(Ohaeng o1, Ohaeng o2) {
    // 목->토->수->화->금->목
    if (o1 == Ohaeng.wood && o2 == Ohaeng.earth) return true;
    if (o1 == Ohaeng.earth && o2 == Ohaeng.water) return true;
    if (o1 == Ohaeng.water && o2 == Ohaeng.fire) return true;
    if (o1 == Ohaeng.fire && o2 == Ohaeng.metal) return true;
    if (o1 == Ohaeng.metal && o2 == Ohaeng.wood) return true;
    // Reverse
    if (o2 == Ohaeng.wood && o1 == Ohaeng.earth) return true;
    if (o2 == Ohaeng.earth && o1 == Ohaeng.water) return true;
    if (o2 == Ohaeng.water && o1 == Ohaeng.fire) return true;
    if (o2 == Ohaeng.fire && o1 == Ohaeng.metal) return true;
    if (o2 == Ohaeng.metal && o1 == Ohaeng.wood) return true;
    return false;
  }

  static bool _isCompatibleElement(String e1, String e2) {
    if ((e1 == '불' && e2 == '공기') || (e1 == '공기' && e2 == '불')) return true;
    if ((e1 == '흙' && e2 == '물') || (e1 == '물' && e2 == '흙')) return true;
    return false;
  }

  static bool _isIncompatibleElement(String e1, String e2) {
    if ((e1 == '불' && e2 == '물') || (e1 == '물' && e2 == '불')) return true;
    if ((e1 == '흙' && e2 == '공기') || (e1 == '공기' && e2 == '흙')) return true;
    return false;
  }
}
