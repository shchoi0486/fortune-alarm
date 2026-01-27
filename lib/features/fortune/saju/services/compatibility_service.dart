import 'package:fortune_alarm/l10n/app_localizations.dart';
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

  static String getZodiacSign(DateTime birthDate) {
    int month = birthDate.month;
    int day = birthDate.day;

    switch (month) {
      case 1: return day >= 20 ? "aquarius" : "capricorn";
      case 2: return day >= 19 ? "pisces" : "aquarius";
      case 3: return day >= 21 ? "aries" : "pisces";
      case 4: return day >= 20 ? "taurus" : "aries";
      case 5: return day >= 21 ? "gemini" : "taurus";
      case 6: return day >= 22 ? "cancer" : "gemini";
      case 7: return day >= 23 ? "leo" : "cancer";
      case 8: return day >= 23 ? "virgo" : "leo";
      case 9: return day >= 23 ? "libra" : "virgo";
      case 10: return day >= 24 ? "scorpio" : "libra";
      case 11: return day >= 23 ? "sagittarius" : "scorpio";
      case 12: return day >= 22 ? "capricorn" : "sagittarius";
      default: return "unknown";
    }
  }

  static String getLocalizedZodiacSign(String sign, AppLocalizations l10n) {
    switch (sign) {
      case "aries": return l10n.zodiacAries;
      case "taurus": return l10n.zodiacTaurus;
      case "gemini": return l10n.zodiacGemini;
      case "cancer": return l10n.zodiacCancer;
      case "leo": return l10n.zodiacLeo;
      case "virgo": return l10n.zodiacVirgo;
      case "libra": return l10n.zodiacLibra;
      case "scorpio": return l10n.zodiacScorpio;
      case "sagittarius": return l10n.zodiacSagittarius;
      case "capricorn": return l10n.zodiacCapricorn;
      case "aquarius": return l10n.zodiacAquarius;
      case "pisces": return l10n.zodiacPisces;
      default: return "";
    }
  }

  static String getZodiacElement(String sign) {
    switch (sign) {
      case "aries": case "leo": case "sagittarius": return "fire";
      case "taurus": case "virgo": case "capricorn": return "earth";
      case "gemini": case "libra": case "aquarius": return "air";
      case "cancer": case "scorpio": case "pisces": return "water";
      default: return "unknown";
    }
  }

  static String getLocalizedElement(String element, AppLocalizations l10n) {
    switch (element) {
      case "fire": return l10n.elementFire;
      case "earth": return l10n.elementEarth;
      case "air": return l10n.elementAir;
      case "water": return l10n.elementWater;
      default: return "";
    }
  }

  static String _getLocalizedAnimal(Jiji jiji, AppLocalizations l10n) {
    switch (jiji) {
      case Jiji.ja: return l10n.jijiJa;
      case Jiji.chuk: return l10n.jijiChuk;
      case Jiji.in_: return l10n.jijiIn;
      case Jiji.myo: return l10n.jijiMyo;
      case Jiji.jin: return l10n.jijiJin;
      case Jiji.sa: return l10n.jijiSa;
      case Jiji.o: return l10n.jijiO;
      case Jiji.mi: return l10n.jijiMi;
      case Jiji.sin: return l10n.jijiSin;
      case Jiji.yu: return l10n.jijiYu;
      case Jiji.sul: return l10n.jijiSul;
      case Jiji.hae: return l10n.jijiHae;
    }
  }

  static CompatibilityScore analyze(SajuProfile p1, SajuProfile p2, AppLocalizations l10n) {
    int score = 50; // Base score
    List<CompatibilityDetail> details = [];

    final saju1 = SajuService.calculateSaju(p1);
    final saju2 = SajuService.calculateSaju(p2);

    // 1. 띠 궁합 (겉궁합) - Year Pillar Jiji
    final year1 = saju1['year']!.jiji;
    final year2 = saju2['year']!.jiji;
    
    final animal1 = _getLocalizedAnimal(year1, l10n);
    final animal2 = _getLocalizedAnimal(year2, l10n);

    if (_samhap[year1]?.contains(year2) ?? false) {
      score += 20;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryZodiac,
        summary: l10n.compatibilitySummarySamhap,
        description: l10n.compatibilityDescSamhap(animal1, animal2),
        score: 9,
        isPositive: true,
      ));
    } else if (_yukhap[year1] == year2) {
      score += 15;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryZodiac,
        summary: l10n.compatibilitySummaryYukhap,
        description: l10n.compatibilityDescYukhap(animal1, animal2),
        score: 8,
        isPositive: true,
      ));
    } else if (_chung[year1] == year2) {
      score -= 10;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryZodiac,
        summary: l10n.compatibilitySummaryChung,
        description: l10n.compatibilityDescChung(animal1, animal2),
        score: 3,
        isPositive: false,
      ));
    } else if (_wonjin[year1] == year2) {
      score -= 10;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryZodiac,
        summary: l10n.compatibilitySummaryWonjin,
        description: l10n.compatibilityDescWonjin,
        score: 3,
        isPositive: false,
      ));
    } else {
      score += 5;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryZodiac,
        summary: l10n.compatibilitySummaryDefaultZodiac,
        description: l10n.compatibilityDescDefaultZodiac(animal1, animal2),
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
        category: l10n.compatibilityCategoryInner,
        summary: l10n.compatibilitySummaryCheonganHap,
        description: l10n.compatibilityDescCheonganHap,
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
          category: l10n.compatibilityCategoryInner,
          summary: l10n.compatibilitySummarySangsaeng,
          description: l10n.compatibilityDescSangsaeng,
          score: 8,
          isPositive: true,
        ));
      } else if (_isSanggeuk(ohaeng1, ohaeng2)) {
        score -= 5;
        details.add(CompatibilityDetail(
          category: l10n.compatibilityCategoryInner,
          summary: l10n.compatibilitySummarySanggeuk,
          description: l10n.compatibilityDescSanggeuk,
          score: 4,
          isPositive: false,
        ));
      } else {
        score += 5;
        details.add(CompatibilityDetail(
          category: l10n.compatibilityCategoryInner,
          summary: l10n.compatibilitySummaryDefaultInner,
          description: l10n.compatibilityDescDefaultInner,
          score: 6,
          isPositive: true,
        ));
      }
    }

    // 3. 별자리 궁합
    final sign1Key = getZodiacSign(p1.birthDate);
    final sign2Key = getZodiacSign(p2.birthDate);
    final elem1Key = getZodiacElement(sign1Key);
    final elem2Key = getZodiacElement(sign2Key);

    if (elem1Key == elem2Key) {
      score += 15;
      final localizedElem = getLocalizedElement(elem1Key, l10n);
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryConstellation,
        summary: l10n.compatibilitySummarySameElement,
        description: l10n.compatibilityDescSameElement(localizedElem),
        score: 8,
        isPositive: true,
      ));
    } else if (_isCompatibleElement(elem1Key, elem2Key)) {
      score += 10;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryConstellation,
        summary: l10n.compatibilitySummaryCompatibleElement,
        description: l10n.compatibilityDescCompatibleElement,
        score: 7,
        isPositive: true,
      ));
    } else if (_isIncompatibleElement(elem1Key, elem2Key)) {
      score -= 5;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryConstellation,
        summary: l10n.compatibilitySummaryIncompatibleElement,
        description: l10n.compatibilityDescIncompatibleElement,
        score: 4,
        isPositive: false,
      ));
    } else {
      score += 5;
      details.add(CompatibilityDetail(
        category: l10n.compatibilityCategoryConstellation,
        summary: l10n.compatibilitySummaryDefaultConstellation,
        description: l10n.compatibilityDescDefaultConstellation,
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
      title = l10n.compatibilityTitleBest;
      description = l10n.compatibilityDescBest;
    } else if (score >= 80) {
      title = l10n.compatibilityTitleGreat;
      description = l10n.compatibilityDescGreat;
    } else if (score >= 60) {
      title = l10n.compatibilityTitleGood;
      description = l10n.compatibilityDescGood;
    } else if (score >= 40) {
      title = l10n.compatibilityTitleEffort;
      description = l10n.compatibilityDescEffort;
    } else {
      title = l10n.compatibilityTitleDifficult;
      description = l10n.compatibilityDescDifficult;
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
    if ((e1 == 'fire' && e2 == 'air') || (e1 == 'air' && e2 == 'fire')) return true;
    if ((e1 == 'earth' && e2 == 'water') || (e1 == 'water' && e2 == 'earth')) return true;
    return false;
  }

  static bool _isIncompatibleElement(String e1, String e2) {
    if ((e1 == 'fire' && e2 == 'water') || (e1 == 'water' && e2 == 'fire')) return true;
    if ((e1 == 'earth' && e2 == 'air') || (e1 == 'air' && e2 == 'earth')) return true;
    return false;
  }
}
