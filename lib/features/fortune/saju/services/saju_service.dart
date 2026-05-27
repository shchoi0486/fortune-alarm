import '../models/saju_data.dart';
import '../models/saju_profile.dart';
import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class SajuService {
  // 60 Ganji List (Gapja to Gyehae)
  static final List<Ganji> _sixtyGanji = _generateSixtyGanji();

  static List<Ganji> _generateSixtyGanji() {
    List<Ganji> list = [];
    for (int i = 0; i < 60; i++) {
      list.add(Ganji(
        Cheongan.values[i % 10],
        Jiji.values[i % 12],
      ));
    }
    return list;
  }

  // Solar Terms (Approximate dates for modern years)
  // Format: Month, Day
  static final List<Map<String, int>> _solarTerms = [
    {'month': 2, 'day': 4}, // Ipchun (Start of Spring) - Tiger
    {'month': 3, 'day': 6}, // Gyeongchip - Rabbit
    {'month': 4, 'day': 5}, // Cheongmyeong - Dragon
    {'month': 5, 'day': 6}, // Ipha - Snake
    {'month': 6, 'day': 6}, // Mangjong - Horse
    {'month': 7, 'day': 7}, // Soseo - Sheep
    {'month': 8, 'day': 8}, // Ipchu - Monkey
    {'month': 9, 'day': 8}, // Baengno - Rooster
    {'month': 10, 'day': 8}, // Hallo - Dog
    {'month': 11, 'day': 7}, // Ipdong - Pig
    {'month': 12, 'day': 7}, // Daeseol - Rat
    {'month': 1, 'day': 6}, // Sohan - Ox
  ];

  // Calculate Saju (Four Pillars)
  static Map<String, Ganji> calculateSaju(SajuProfile profile) {
    DateTime birthDate = profile.birthDate;
    
    // 1. Year Pillar (Se-ju)
    // Standard: Change year at Ipchun (Feb 4 approx)
    int year = birthDate.year;
    bool isBeforeIpchun = false;
    
    if (birthDate.month < 2 || (birthDate.month == 2 && birthDate.day < 4)) {
      isBeforeIpchun = true;
      year--;
    }

    // Year Ganji Calculation
    // 1984 is Gap-Ja (0).
    // (Year - 1984) % 60. But careful with negative.
    // Alternatively: (Year - 4) % 60. 
    // 2024 (Gap-Chin): (2024-4)%60 = 2020%60 = 40 (Gap-Chin is 40? No, Gap-Ja is 0).
    // Gap-Ja(0), Eul-Chuk(1)...
    // 1924 = Gap-Ja. 1984 = Gap-Ja.
    // 2024 should be Gap-Chin (40).
    // Let's verify: Gap(0) Chin(4). 0-4 = -4. 
    // Formula: (Year - 4) % 60.
    // 2024 - 4 = 2020. 2020 % 60 = 40.
    // 40th Ganji: Cheongan (40%10=0 Gap), Jiji (40%12=4 Jin). Correct.
    
    int yearIndex = (year - 4) % 60;
    if (yearIndex < 0) yearIndex += 60;
    Ganji yearPillar = _sixtyGanji[yearIndex];


    // 2. Month Pillar (Wol-ju)
    // Depends on the Solar Term.
    // Determine the month index (0 = Feb/Tiger, 1 = Mar/Rabbit ... 11 = Jan/Ox)
    // Based on _solarTerms.
    int monthIndex = -1;
    
    // Simple lookup
    // If date is >= Feb 4, it's Tiger (Index 0)
    // ...
    // If date is >= Jan 6, it's Ox (Index 11)
    
    // Logic: Find the latest solar term passed.
    // Adjust for year boundary (Jan 1 to Feb 3 belongs to previous year's Dec/Ox or Nov/Rat?)
    // Actually, if isBeforeIpchun is true, we are in the previous year's context.
    
    // Let's simplify:
    // Feb 4 ~ Mar 5: Tiger (0)
    // Mar 6 ~ Apr 4: Rabbit (1)
    // ...
    // Jan 6 ~ Feb 3: Ox (11)
    
    // Check against standard dates
    int m = birthDate.month;
    int d = birthDate.day;
    
    // Find the current solar term index (0-11)
    // Starts checking from the last one (Jan/Ox) backwards or just logic
    
    if (m == 2 && d >= 4) {
      monthIndex = 0; // In
    } else if (m == 3) monthIndex = (d >= 6) ? 1 : 0;
    else if (m == 4) monthIndex = (d >= 5) ? 2 : 1;
    else if (m == 5) monthIndex = (d >= 6) ? 3 : 2;
    else if (m == 6) monthIndex = (d >= 6) ? 4 : 3;
    else if (m == 7) monthIndex = (d >= 7) ? 5 : 4;
    else if (m == 8) monthIndex = (d >= 8) ? 6 : 5;
    else if (m == 9) monthIndex = (d >= 8) ? 7 : 6;
    else if (m == 10) monthIndex = (d >= 8) ? 8 : 7;
    else if (m == 11) monthIndex = (d >= 7) ? 9 : 8;
    else if (m == 12) monthIndex = (d >= 7) ? 10 : 9;
    else if (m == 1) monthIndex = (d >= 6) ? 11 : 10;
    else if (m == 2 && d < 4) monthIndex = 11;
    
    // Month Stem Calculation (Dun-Wol-Beop)
    // Depends on Year Stem (yearPillar.cheongan)
    // Gap/Gi Year -> Byeong-In (2) start
    // Eul/Gyeong Year -> Mu-In (4) start
    // Byeong/Sin Year -> Gyeong-In (6) start
    // Jeong/Im Year -> Im-In (8) start
    // Mu/Gye Year -> Gap-In (0) start
    
    int yearStemIndex = yearPillar.cheongan.index; // 0-9
    int monthStemStartOffset = 0;
    
    if (yearStemIndex == 0 || yearStemIndex == 5) {
      monthStemStartOffset = 2; // Byeong
    } else if (yearStemIndex == 1 || yearStemIndex == 6) monthStemStartOffset = 4; // Mu
    else if (yearStemIndex == 2 || yearStemIndex == 7) monthStemStartOffset = 6; // Gyeong
    else if (yearStemIndex == 3 || yearStemIndex == 8) monthStemStartOffset = 8; // Im
    else if (yearStemIndex == 4 || yearStemIndex == 9) monthStemStartOffset = 0; // Gap
    
    int monthStemIndex = (monthStemStartOffset + monthIndex) % 10;
    // Month Branch is always: In(2), Myo(3)... for index 0, 1...
    // Wait, my monthIndex 0 is In(Tiger).
    // Jiji.in is index 2.
    // Jiji: Ja(0), Chuk(1), In(2)...
    
    // Map monthIndex(0=In) to Jiji index
    int monthBranchIndex = (2 + monthIndex) % 12;
    
    Ganji monthPillar = Ganji(
      Cheongan.values[monthStemIndex],
      Jiji.values[monthBranchIndex]
    );


    // 3. Day Pillar (Il-ju)
    // Reference: 2024-01-01 is Gap-Ja (0).
    // Use UTC for consistent day difference calculation (avoids DST issues)
    DateTime dateOnly = DateTime.utc(birthDate.year, birthDate.month, birthDate.day);
    DateTime referenceDate = DateTime.utc(2024, 1, 1);
    
    // Calculate difference in days (exactly 24-hour periods in UTC)
    int diffDays = dateOnly.difference(referenceDate).inDays;
    
    // 2024-01-01 is 0 (Gap-Ja).
    // Future date: 0 + diff
    // Past date: 0 + diff (diff is negative)
    
    int dayIndex = diffDays % 60;
    if (dayIndex < 0) dayIndex += 60;
    
    Ganji dayPillar = _sixtyGanji[dayIndex];


    // 4. Hour Pillar (Si-ju)
    // Determined by Day Stem and Time.
    // Time slots:
    // 23:30 - 01:29 : Ja (Rat)
    // 01:30 - 03:29 : Chuk (Ox)
    // ...
    // 12 slots.
    
    int hourBranchIndex = 0; // Ja default
    
    if (profile.birthTime != null) {
      try {
        List<String> parts = profile.birthTime!.split(':');
        int hour = int.parse(parts[0]);
        int minute = int.parse(parts[1]);
        
        // Convert to minutes for easier comparison
        int totalMinutes = hour * 60 + minute;
        
        // Shift by 30 mins to align (standard Korea time correction is often +30m, but traditional is just 2hr blocks centered on even hours)
        // Traditional: 23-1 is Ja.
        // Modern Korea (UTC+9): Real solar time is approx -30m vs Tokyo.
        // Usually standard Saju uses 23:30~01:29 as Ja-Si.
        
        if (totalMinutes >= 23 * 60 + 30 || totalMinutes < 1 * 60 + 30) {
          hourBranchIndex = 0; // Ja
        } else if (totalMinutes < 3 * 60 + 30) hourBranchIndex = 1; // Chuk
        else if (totalMinutes < 5 * 60 + 30) hourBranchIndex = 2; // In
        else if (totalMinutes < 7 * 60 + 30) hourBranchIndex = 3; // Myo
        else if (totalMinutes < 9 * 60 + 30) hourBranchIndex = 4; // Jin
        else if (totalMinutes < 11 * 60 + 30) hourBranchIndex = 5; // Sa
        else if (totalMinutes < 13 * 60 + 30) hourBranchIndex = 6; // O
        else if (totalMinutes < 15 * 60 + 30) hourBranchIndex = 7; // Mi
        else if (totalMinutes < 17 * 60 + 30) hourBranchIndex = 8; // Sin
        else if (totalMinutes < 19 * 60 + 30) hourBranchIndex = 9; // Yu
        else if (totalMinutes < 21 * 60 + 30) hourBranchIndex = 10; // Sul
        else hourBranchIndex = 11; // Hae
      } catch (e) {
        // Fallback for parsing error
        hourBranchIndex = 0;
      }
    } else {
      // Unknown time - often treat as midday or skip
      // For now, let's default to Ja (Rat) or handle as unknown?
      // Let's just default to Ja(0) but mark it?
      hourBranchIndex = 0;
    }
    
    // Hour Stem Calculation (Dun-Si-Beop)
    // Depends on Day Stem
    // Gap/Gi Day -> Gap-Ja (0) start
    // Eul/Gyeong Day -> Byeong-Ja (2) start
    // Byeong/Sin Day -> Mu-Ja (4) start
    // Jeong/Im Day -> Gyeong-Ja (6) start
    // Mu/Gye Day -> Im-Ja (8) start
    
    int dayStemIndex = dayPillar.cheongan.index;
    int hourStemStartOffset = 0;
    
    if (dayStemIndex == 0 || dayStemIndex == 5) {
      hourStemStartOffset = 0; // Gap
    } else if (dayStemIndex == 1 || dayStemIndex == 6) hourStemStartOffset = 2; // Byeong
    else if (dayStemIndex == 2 || dayStemIndex == 7) hourStemStartOffset = 4; // Mu
    else if (dayStemIndex == 3 || dayStemIndex == 8) hourStemStartOffset = 6; // Gyeong
    else if (dayStemIndex == 4 || dayStemIndex == 9) hourStemStartOffset = 8; // Im
    
    int hourStemIndex = (hourStemStartOffset + hourBranchIndex) % 10;
    
    Ganji hourPillar = Ganji(
      Cheongan.values[hourStemIndex],
      Jiji.values[hourBranchIndex]
    );

    return {
      'year': yearPillar,
      'month': monthPillar,
      'day': dayPillar,
      'hour': hourPillar,
    };
  }

  // Generate Yearly Fortune Text with context for localization
  static String getYearlyFortune(BuildContext context, SajuProfile profile, Map<String, Ganji> saju, int targetYear) {
    final l10n = AppLocalizations.of(context)!;
    
    // Check for 2026 which have detailed localizations
    if (targetYear == 2026) {
      final dayMaster = saju['day']!.cheongan;
      switch (dayMaster) {
        case Cheongan.gap: return l10n.sajuFortune2026Gap;
        case Cheongan.eul: return l10n.sajuFortune2026Eul;
        case Cheongan.byeong: return l10n.sajuFortune2026Byeong;
        case Cheongan.jeong: return l10n.sajuFortune2026Jeong;
        case Cheongan.mu: return l10n.sajuFortune2026Mu;
        case Cheongan.gi: return l10n.sajuFortune2026Gi;
        case Cheongan.gyeong: return l10n.sajuFortune2026Gyeong;
        case Cheongan.sin: return l10n.sajuFortune2026Sin;
        case Cheongan.im: return l10n.sajuFortune2026Im;
        case Cheongan.gye: return l10n.sajuFortune2026Gye;
      }
    }

    // Fallback for other years or when detailed fortune is not available
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'en') {
      return _generateEnglishYearlyFortune(profile, saju, targetYear);
    }
    return _generateYearlyFortune(l10n, profile, saju, targetYear);
  }

  // 영어 운세 생성
  static String _generateEnglishYearlyFortune(SajuProfile profile, Map<String, Ganji> saju, int targetYear) {
    Cheongan dayMaster = saju['day']!.cheongan;
    Ohaeng myElement = dayMaster.ohaeng;
    
    String yearName = "";
    if (targetYear == 2025) {
      yearName = "2025 (Year of the Blue Snake)";
    } else if (targetYear == 2026) {
      yearName = "2026 (Year of the Red Horse)";
    } else {
      yearName = "$targetYear";
    }

    if (targetYear == 2025) {
      switch (dayMaster) {
        case Cheongan.gap:
        case Cheongan.eul:
          return "🌿 $yearName Total Luck for Wood: 'A Year of Growth and New Opportunities'\n\n"
              "2025 brings vibrant energy for you. You'll find yourself more creative and expressive. "
              "It's a great time to start new projects and showcase your talents to the world.\n\n"
              "💼 [Career & Business]\n"
              "New doors will open. Your ideas will be well-received by others. Collaborative work is favored.\n\n"
              "💰 [Wealth]\n"
              "Steady income is expected. Focus on long-term investments rather than quick gains.\n\n"
              "❤️ [Relationship]\n"
              "You'll be more social and charming. Great time to meet new people or deepen existing bonds.\n\n"
              "⚠️ [Note]\n"
              "Don't overextend yourself. Balance your passion with rest.";
        case Cheongan.byeong:
        case Cheongan.jeong:
          return "🔥 $yearName Total Luck for Fire: 'Passionate Achievements and Recognition'\n\n"
              "The year 2025 amplifies your natural energy. You'll feel a strong drive to succeed and gain recognition for your hard work.\n\n"
              "💼 [Career & Business]\n"
              "Your leadership skills will shine. Expect promotion or significant progress in your field.\n\n"
              "💰 [Wealth]\n"
              "Financial luck is strong. Success in business or investments is likely.\n\n"
              "❤️ [Relationship]\n"
              "Dynamic and passionate relationships. You'll be the center of attention in social circles.\n\n"
              "⚠️ [Note]\n"
              "Watch out for your temper. Keep a cool head when dealing with competition.";
        case Cheongan.mu:
        case Cheongan.gi:
          return "⛰️ $yearName Total Luck for Earth: 'Stability and Inner Growth'\n\n"
              "2025 is a year for you to solidify your foundations. You'll find peace and stability in both your personal and professional life.\n\n"
              "💼 [Career & Business]\n"
              "Steady progress in your current position. It's a good time to acquire new skills or certifications.\n\n"
              "💰 [Wealth]\n"
              "A good year for saving and building assets. Real estate related matters are favorable.\n\n"
              "❤️ [Relationship]\n"
              "Deep and stable connections. Sincerity will be the key to your relationship success.\n\n"
              "⚠️ [Note]\n"
              "Avoid being too stubborn. Stay open to new ideas and perspectives.";
        case Cheongan.gyeong:
        case Cheongan.sin:
          return "💎 $yearName Total Luck for Metal: 'Refinement and Strategic Success'\n\n"
              "In 2025, your strategic thinking and attention to detail will lead you to success. It's a year to refine your goals and execute them with precision.\n\n"
              "💼 [Career & Business]\n"
              "You'll excel in roles that require planning and organization. Your expertise will be highly valued.\n\n"
              "💰 [Wealth]\n"
              "Wealth luck is stable. Prudent financial planning will yield good results.\n\n"
              "❤️ [Relationship]\n"
              "Intellectual connections will be important. You'll appreciate partners who share your values.\n\n"
              "⚠️ [Note]\n"
              "Don't be too critical of yourself or others. Practice flexibility.";
        case Cheongan.im:
        case Cheongan.gye:
          return "💧 $yearName Total Luck for Water: 'Fluidity and Creative Breakthroughs'\n\n"
              "2025 brings a wave of change and inspiration. Your intuition will be your best guide as you navigate new experiences.\n\n"
              "💼 [Career & Business]\n"
              "Great for jobs involving communication, travel, or innovation. You'll adapt well to changes.\n\n"
              "💰 [Wealth]\n"
              "Money flow is active. You might find new ways to increase your income through creative pursuits.\n\n"
              "❤️ [Relationship]\n"
              "Emotional and intuitive bonds. You'll connect with others on a deeper level.\n\n"
              "⚠️ [Note]\n"
              "Manage your stress levels. Don't let yourself get overwhelmed by small details.";
      }
    } else if (targetYear == 2026) {
      switch (dayMaster) {
        case Cheongan.gap:
          return "🌳 $yearName Total Luck for Gap-Wood: 'Fires of Passion, Maximizing Activity'\n\n"
              "2026 is a year of strong creative and expressive energy. Your talents will burst forth, and your activity range will expand significantly.\n\n"
              "💼 [Career & Business]\n"
              "Excellent for starting new projects or business. Your ideas will become reality. Success in arts, media, and sales is likely.\n\n"
              "💰 [Wealth]\n"
              "Wealth follows your active efforts. Side income or business profits will increase. Beware of impulsive spending.\n\n"
              "❤️ [Relationship]\n"
              "Your honest and active approach will attract others. It's a passionate year for romance and family news.\n\n"
              "⚠️ [Note]\n"
              "Watch out for burnout. Manage your energy and be careful with your words to avoid misunderstandings.";
        case Cheongan.eul:
          return "🌸 $yearName Total Luck for Eul-Wood: 'Splendid Bloom, Full Bloom of Talent'\n\n"
              "Your charm and talent reach their peak in 2026. You'll find yourself in the spotlight, achieving brilliant results through your unique expression.\n\n"
              "💼 [Career & Business]\n"
              "Unconventional ideas will lead to success. Great for design, fashion, and entertainment fields. Watch out for friction with authorities.\n\n"
              "💰 [Wealth]\n"
              "High ability to create wealth. Your brand value rises. However, avoid luxury and unnecessary waste.\n\n"
              "❤️ [Relationship]\n"
              "Explosive popularity among others. Expect passionate romances. For those in relationships, children might be a key focus.\n\n"
              "⚠️ [Note]\n"
              "Manage your mood swings. Staying calm and following rules will prevent unnecessary legal or social issues.";
        case Cheongan.byeong:
          return "☀️ $yearName Total Luck for Byeong-Fire: 'Two Suns, Fierce Competition and Leap'\n\n"
              "A year of intense pride and competitive spirit. You'll push forward with your own path, gaining strength from your natural element.\n\n"
              "💼 [Career & Business]\n"
              "Success comes through winning in competitive environments. Freelancers can make a significant name for themselves.\n\n"
              "💰 [Wealth]\n"
              "Money comes in but also goes out quickly. Avoid lending money to friends or family. Invest in your reputation.\n\n"
              "❤️ [Relationship]\n"
              "You might find a partner who feels like a close friend. Be cautious of love triangles or competition in romance.\n\n"
              "⚠️ [Note]\n"
              "Humility is your best strategy. Avoid dogmatic actions and pay attention to your cardiovascular health.";
        case Cheongan.jeong:
          return "🔥 $yearName Total Luck for Jeong-Fire: 'Giant Flame, Expansion of Power'\n\n"
              "Your influence and power grow in 2026. Cooperation and help from others will allow you to achieve goals that were previously out of reach.\n\n"
              "💼 [Career & Business]\n"
              "Strong drive and leadership. You'll excel in team projects. Remember to share the credit to maintain loyalty.\n\n"
              "💰 [Wealth]\n"
              "High risk, high return opportunities may appear. While you can gain significantly, keep emergency funds for unexpected expenses.\n\n"
              "❤️ [Relationship]\n"
              "Active social life leads to new connections. For men, pay extra attention to your partner to avoid neglect.\n\n"
              "⚠️ [Note]\n"
              "Excessive greed can lead to trouble. Avoid over-expansion and manage your stress levels carefully.";
        case Cheongan.mu:
          return "🌋 $yearName Total Luck for Mu-Earth: 'Patience and Preparation in the Heat'\n\n"
              "A year for condensed energy and inner growth. Best time for studying, gaining certifications, and refining your professional skills.\n\n"
              "💼 [Career & Business]\n"
              "Mental and strategic work shines more than physical activity. Success in contracts and planning is highlighted.\n\n"
              "💰 [Wealth]\n"
              "Strong luck with real estate and documents. While cash flow might be slow, long-term investments are very promising.\n\n"
              "❤️ [Relationship]\n"
              "You'll value deep mental connections. Potential for meeting partners through elders or family introductions.\n\n"
              "⚠️ [Note]\n"
              "Avoid overthinking, which can lead to lethargy. Physical exercise and outdoor activities will improve your luck.";
        case Cheongan.gi:
          return "🌾 $yearName Total Luck for Gi-Earth: 'Solid Foundation and Sure Support'\n\n"
              "Warm support from elders and superiors helps you ripen your goals. A year to build a stable foundation for the future.\n\n"
              "💼 [Career & Business]\n"
              "Excellent results in exams, certifications, and academic pursuits. You'll gain the trust of superiors and take on key roles.\n\n"
              "💰 [Wealth]\n"
              "Luck with important documents. Buying a home or asset growth is likely. Honor and reputation shine more than pure wealth.\n\n"
              "❤️ [Relationship]\n"
              "A year of receiving love and appreciation. Good for marriage or strengthening family bonds. Harmony is at its peak.\n\n"
              "⚠️ [Note]\n"
              "Don't become too dependent on others. Practice gratitude and develop your own independent skills.";
        case Cheongan.gyeong:
          return "⚔️ $yearName Total Luck for Gyeong-Metal: 'Birth of a Great Sword Beyond Trials'\n\n"
              "Intense pressure and responsibility act as a furnace, refining your character. Overcoming these trials will lead to great authority.\n\n"
              "💼 [Career & Business]\n"
              "Heavy responsibilities may feel stressful, but succeeding will elevate your status. Great for public service and law fields.\n\n"
              "💰 [Wealth]\n"
              "Focus on honor over immediate wealth. Status rise brings natural financial gain, but maintain your budget for social costs.\n\n"
              "❤️ [Relationship]\n"
              "For women, meeting charismatic and capable partners is likely. Relationships with superiors will be key this year.\n\n"
              "⚠️ [Note]\n"
              "Health should be your priority. Manage overwork-related stress and pay attention to your respiratory system.";
        case Cheongan.sin:
          return "💎 $yearName Total Luck for Sin-Metal: 'Shining Gem, Peak of Honor'\n\n"
              "Your value is revealed to the world in 2026. A year where your honor rises and you find strong connections with stable organizations.\n\n"
              "💼 [Career & Business]\n"
              "Excellent for career moves, promotions, or scout offers. Earn respect through your principled and fair work ethic.\n\n"
              "💰 [Wealth]\n"
              "Stable fixed income is guaranteed. Honor brings wealth naturally. You may also benefit from your partner's success.\n\n"
              "❤️ [Relationship]\n"
              "Best year for romance and marriage, especially for women. Meet principled and capable partners who share your values.\n\n"
              "⚠️ [Note]\n"
              "Avoid overwork and excessive stress. Practice flexibility to maintain smooth relationships with colleagues.";
        case Cheongan.im:
          return "🌊 $yearName Total Luck for Im-Water: 'Sun over the River, Opportunity for Great Wealth'\n\n"
              "Wealth luck explodes in 2026 as the sun shines on your element. A year for potential life-changing financial turnarounds.\n\n"
              "💼 [Career & Business]\n"
              "Excellent for business expansion, even overseas. Employees can expect significant bonuses or performance incentives.\n\n"
              "💰 [Wealth]\n"
              "Big money opportunities. High investment gains and business profits are likely. Manage your greed to maintain health.\n\n"
              "❤️ [Relationship]\n"
              "High popularity among the opposite sex. You'll find yourself surrounded by many potential connections.\n\n"
              "⚠️ [Note]\n"
              "Obsession with wealth or romance can lead to trouble. Be careful with scams and monitor your blood pressure.";
        case Cheongan.gye:
          return "🌧️ $yearName Total Luck for Gye-Water: 'Rainbow Season of Results'\n\n"
              "Honest rewards for your sincere efforts arrive in 2026. A financially prosperous and stable year where your life feels balanced.\n\n"
              "💼 [Career & Business]\n"
              "Success comes from attention to detail. Great for finance, data, and accounting fields. Stable business operations are favored.\n\n"
              "💰 [Wealth]\n"
              "Small savings grow into significant assets. Fixed income increases, providing a sense of security and comfort.\n\n"
              "❤️ [Relationship]\n"
              "Men may meet wise and supportive partners. Seek realistic and stable relationships that provide peace of mind.\n\n"
              "⚠️ [Note]\n"
              "Avoid over-activity that leads to exhaustion. Don't lose the big picture while focusing on small immediate gains.";
      }
    }
    
    return "Total Luck for $targetYear: 'A New Journey Begins'\n\n"
        "This year brings a fresh flow of energy. Use the strength of your element, ${myElement.name.toUpperCase()}, to find balance and harmony.\n\n"
        "Focus on your goals and stay positive throughout the year!";
  }

  // 한국어 운세 생성 (기존 로직)
  static String _generateYearlyFortune(AppLocalizations l10n, SajuProfile profile, Map<String, Ganji> saju, int targetYear) {
    Cheongan dayMaster = saju['day']!.cheongan;
    Ohaeng myElement = dayMaster.ohaeng;
    String fortune = "";

    String yearName = "";
    if (targetYear == 2026) {
      yearName = "병오년 (적마의 해)";
    }

    if (targetYear == 2026) {
       // 2026년 병오년 (붉은 말의 해) 상세 운세
       switch (dayMaster) {
        case Cheongan.gap: // 갑목 (甲)
          fortune = "🌳 2026년 병오년 갑목(甲木) 총운: '열정의 불꽃, 활동력의 극대화'\n\n"
              "2026년은 갑목인 당신에게 '식신(食神)'과 '상관(傷官)'의 기운이 매우 강한 해입니다. "
              "목(나무)이 화(불)를 만나 활활 타오르는 형상(목화통명)으로, 당신의 재능과 표현력이 세상 밖으로 거침없이 뿜어져 나오는 시기입니다. "
              "가만히 있어도 존재감이 드러나며, 활동 범위가 획기적으로 넓어집니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "새로운 프로젝트를 시작하거나 창업을 하기에 아주 좋은 시기입니다. 당신의 아이디어가 현실로 구현되며, 열정적으로 일에 몰입하게 됩니다. "
              "예술, 방송, 영업, 교육 등 자신을 표현하는 분야에서 큰 성과를 거둘 수 있습니다. "
              "다만, 너무 앞만 보고 달리다 보면 실수를 할 수 있으니 돌다리도 두들겨 보는 신중함이 필요합니다.\n\n"
              "💰 [재물운]\n"
              "열심히 활동한 만큼 재물도 따라옵니다. 사업 소득이나 부업을 통한 수익이 늘어날 수 있습니다. "
              "하지만 벌어들이는 만큼 투자나 소비로 나가는 돈도 많을 수 있습니다. "
              "미래를 위한 투자라면 좋지만, 충동적인 지출은 경계해야 합니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "솔직하고 적극적인 태도로 이성에게 어필합니다. 연애운이 뜨겁게 달아오르지만, 감정 표현이 지나쳐 상대방에게 부담을 줄 수도 있습니다. "
              "자녀운이 매우 강하게 들어오는 해이기도 합니다.\n\n"
              "⚠️ [주의사항]\n"
              "에너지 소모가 극심한 해입니다. '번아웃'이 올 수 있으니 체력 안배가 필수적입니다. "
              "말실수로 인한 구설수를 조심하고, 너무 자신의 주장만 내세우지 않도록 하세요.";
          break;
        case Cheongan.eul: // 을목 (乙)
          fortune = "🌸 2026년 병오년 을목(乙木) 총운: '화려한 개화, 재능의 만개'\n\n"
              "2026년은 을목인 당신에게 '상관(傷官)'이 중중한 해입니다. "
              "꽃나무가 뜨거운 태양 아래 만개하는 형상으로, 당신의 매력과 재능이 절정에 달하는 시기입니다. "
              "어디를 가나 주목받는 주인공이 되며, 화려한 성취를 맛볼 수 있습니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "기존의 틀을 깨는 파격적인 시도가 성공을 거둡니다. 디자인, 패션, 뷰티, 엔터테인먼트 분야에서 두각을 나타냅니다. "
              "직장에서는 승진이나 스카우트 제의를 받을 수 있으나, 상사와의 마찰(상관견관)은 주의해야 합니다. "
              "자유로운 환경에서 능력이 배가됩니다.\n\n"
              "💰 [재물운]\n"
              "재물을 만들어내는 능력이 탁월해집니다. 자신의 브랜드 가치가 올라가며 몸값이 상승합니다. "
              "하지만 화려함을 쫓다 보면 사치나 낭비가 심해질 수 있으니, 지갑을 잘 지켜야 합니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "이성에게 인기가 폭발합니다. 화려하고 열정적인 연애를 하게 되지만, 짧고 굵게 끝날 수도 있습니다. "
              "기혼자는 자녀 문제로 신경 쓸 일이 많아질 수 있습니다.\n\n"
              "⚠️ [주의사항]\n"
              "감정 기복이 심해질 수 있습니다. 욱하는 성질을 다스리지 못하면 공들인 탑이 무너질 수 있습니다. "
              "법적인 문제나 관재구설에 휘말리지 않도록 준법정신을 가지세요.";
          break;
        case Cheongan.byeong: // 병화 (丙)
          fortune = "☀️ 2026년 병오년 병화(丙火) 총운: '두 개의 태양, 치열한 경쟁과 도약'\n\n"
              "2026년은 병화인 당신에게 '비견(比肩)'과 '겁재(刦財)'가 매우 강한 해입니다. "
              "하늘에 태양이 두 개가 뜬 형상으로, 자존심과 경쟁심이 하늘을 찌르는 시기입니다. "
              "주체성이 강해져 누구의 간섭도 받기 싫어하며, 자신의 길을 뚝심 있게 밀고 나갑니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "경쟁이 치열한 곳에서 승리하여 쟁취하는 운입니다. 동업이나 협업을 통해 규모를 키울 수 있지만, 수익 배분 문제로 갈등이 생길 수도 있습니다. "
              "프리랜서나 전문직 종사자에게는 자신의 이름을 널리 알릴 수 있는 좋은 기회입니다.\n\n"
              "💰 [재물운]\n"
              "돈이 들어오기도 하지만, 나가는 구멍도 큽니다(군겁쟁재). "
              "형제, 친구, 동료로 인해 돈이 나갈 일이 생길 수 있습니다. 보증이나 돈 거래는 절대 금물입니다. "
              "돈을 모으기보다는 명예나 세력을 키우는 데 투자하는 것이 낫습니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "친구 같은 연인을 만나거나, 친구에서 연인으로 발전할 수 있습니다. "
              "하지만 연인이 있는 경우 삼각관계나 경쟁자가 나타날 수 있으니 주의가 필요합니다.\n\n"
              "⚠️ [주의사항]\n"
              "독단적인 행동으로 주변의 반감을 살 수 있습니다. '겸손'이 최고의 처세술입니다. "
              "심혈관 질환이나 눈 건강에 유의하세요.";
          break;
        case Cheongan.jeong: // 정화 (丁)
          fortune = "🔥 2026년 병오년 정화(丁火) 총운: '거대한 불길, 세력의 확장'\n\n"
              "2026년은 정화인 당신에게 '겁재(刦財)'와 '비견(比肩)'의 해입니다. "
              "촛불이 용광로를 만난 격으로, 당신의 세력이 거대해지는 시기입니다. "
              "혼자서는 불가능했던 일들을 주변의 도움이나 협력을 통해 이루어낼 수 있습니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "강력한 추진력이 생깁니다. 경쟁자를 압도하거나, 혹은 경쟁자를 내 편으로 만들어 활용하는 지혜가 발휘됩니다. "
              "팀 프로젝트나 조직 생활에서 리더십을 발휘할 기회가 옵니다. "
              "다만, 성과를 독식하려 하면 배신을 당할 수 있으니 공을 나누는 자세가 필요합니다.\n\n"
              "💰 [재물운]\n"
              "투기적인 성향이 강해집니다. '하이 리스크 하이 리턴'을 추구하게 되는데, 운이 좋으면 큰 돈을 만지지만 실패하면 타격도 큽니다. "
              "예상치 못한 지출이 발생할 수 있으니 비상금을 마련해두는 것이 좋습니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "사교 모임이나 단체 활동에서 인연을 만날 확률이 높습니다. "
              "남성은 아내나 여자친구에게 소홀해질 수 있으니 신경 써야 합니다. "
              "주변 사람들과의 관계가 재산이 되는 해입니다.\n\n"
              "⚠️ [주의사항]\n"
              "욕심이 과하면 화를 입습니다. 무리한 확장이나 투자는 자제하세요. "
              "화병이나 스트레스로 인한 질환을 조심해야 합니다.";
          break;
        case Cheongan.mu: // 무토 (戊)
          fortune = "🌋 2026년 병오년 무토(戊土) 총운: '뜨거운 열기 속의 인내와 준비'\n\n"
              "2026년은 무토인 당신에게 '편인(偏印)'과 '정인(正印)'의 기운이 강한 해입니다. "
              "화산이 폭발하기 직전의 응축된 에너지와 같습니다. "
              "학문과 예술, 자격증 취득 등 내면을 채우고 실력을 키우기에 최적의 시기입니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "활동적인 일보다는 기획, 연구, 전략 수립 등 정신적인 노동이 빛을 발합니다. "
              "문서운이 좋아 계약이나 인허가 관련 업무에서 성과가 있습니다. "
              "하지만 너무 생각만 하고 실행을 미루면 기회를 놓칠 수 있으니, 과감한 결단력도 필요합니다.\n\n"
              "💰 [재물운]\n"
              "부동산 문서운이 매우 강합니다. 매매나 계약을 통해 자산을 늘릴 수 있는 기회입니다. "
              "현금 흐름은 다소 답답할 수 있으나, 장기적인 관점에서의 투자는 유망합니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "어머니나 윗사람의 간섭이 심해질 수 있습니다. "
              "연애에서는 정신적인 교감을 중요시하게 되며, 연상과 인연이 닿을 수 있습니다.\n\n"
              "⚠️ [주의사항]\n"
              "생각이 너무 많아 우울해지거나 무기력해질 수 있습니다(토다매금). "
              "야외 활동이나 운동을 통해 땀을 흘리는 것이 개운에 도움이 됩니다. "
              "너무 뜨거운 기운으로 인해 땅이 갈라지듯, 피부 건조나 위장 장애를 조심하세요.";
          break;
        case Cheongan.gi: // 기토 (己)
          fortune = "🌾 2026년 병오년 기토(己土) 총운: '단단한 기반과 확실한 후원'\n\n"
              "2026년은 기토인 당신에게 '정인(正印)'과 '편인(偏印)'의 해입니다. "
              "따뜻한 햇살이 대지를 비추어 곡식을 익게 하는 형상입니다. "
              "윗사람의 전폭적인 지원과 사랑을 받으며, 안정적인 기반을 다지는 시기입니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "승진 시험, 자격증 시험, 학위 취득 등 공부와 관련된 모든 일에서 최고의 성과를 냅니다. "
              "직장에서는 상사의 신임을 얻어 중요한 직책을 맡게 됩니다. "
              "교육, 부동산, 상담, 복지 분야에서 두각을 나타냅니다.\n\n"
              "💰 [재물운]\n"
              "문서를 잡는 운입니다. 내 집 마련의 꿈을 이룰 수도 있고, 상속이나 증여를 받을 수도 있습니다. "
              "안정적인 자산 증식이 가능하며, 재물보다는 명예가 더 빛나는 해입니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "사랑받는 해입니다. 연인에게 듬직한 사랑을 받거나, 좋은 조건의 상대를 만날 수 있습니다. "
              "결혼운도 들어오며, 가정 생활이 화목해집니다.\n\n"
              "⚠️ [주의사항]\n"
              "너무 받아먹기만 하려다 보면 게을러질 수 있습니다(모자멸자). "
              "받은 만큼 베푸는 자세가 필요합니다. 의존심을 버리고 자립심을 키우세요.";
          break;
        case Cheongan.gyeong: // 경금 (庚)
          fortune = "⚔️ 2026년 병오년 경금(庚金) 총운: '시련을 넘어선 명검의 탄생'\n\n"
              "2026년은 경금인 당신에게 '편관(偏官)'과 '정관(正官)'이 매우 강력한 해입니다. "
              "용광로 불에 원석을 녹여 명검을 만드는 형상입니다. "
              "강한 압박과 스트레스가 있을 수 있지만, 이를 견뎌내면 엄청난 권위와 명예를 얻게 됩니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "책임감이 막중한 자리에 오르거나, 감당하기 힘든 프로젝트를 맡을 수 있습니다. "
              "하지만 이것은 당신을 시험하는 과정이며, 성공적으로 완수하면 단숨에 지위가 상승합니다. "
              "공직, 군인, 경찰, 법조계 등 권력 기관 종사자에게는 승진의 기회입니다.\n\n"
              "💰 [재물운]\n"
              "돈보다는 명예와 감투를 쓰는 운입니다. 지위가 오르면서 자연스럽게 재물도 따라오겠지만, "
              "품위 유지비나 접대비 등으로 나가는 돈도 만만치 않습니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "여성에게는 카리스마 넘치고 능력 있는 남자가 나타나는 운입니다(관살혼잡 주의). "
              "남성은 자녀운이 강하게 들어옵니다. 직장 상사나 윗사람과의 관계가 중요해집니다.\n\n"
              "⚠️ [주의사항]\n"
              "건강 관리가 최우선입니다. 과로로 인한 질병이나 사고수를 조심해야 합니다. "
              "특히 폐, 대장 등 호흡기 계통이 약해질 수 있습니다. 스트레스 해소법을 찾으세요.";
          break;
        case Cheongan.sin: // 신금 (辛)
          fortune = "💎 2026년 병오년 신금(辛金) 총운: '빛나는 보석, 명예의 정점'\n\n"
              "2026년은 신금인 당신에게 '정관(正官)'과 '편관(偏官)'의 해입니다. "
              "보석이 조명을 받아 반짝이는 형상으로, 당신의 가치가 세상에 드러나고 명예가 드높아지는 시기입니다. "
              "반듯하고 안정적인 직장이나 조직과 인연이 깊습니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "취업, 승진, 영전 등 직장 변동운이 아주 좋습니다. "
              "자신의 능력을 인정받아 스카우트 제의를 받을 수도 있습니다. "
              "원칙을 지키고 바르게 일처리를 하면 만인의 존경을 받습니다.\n\n"
              "💰 [재물운]\n"
              "안정적인 월급이나 고정 수입이 보장됩니다. "
              "재물을 쫓기보다는 명예를 지키면 재물은 자연스럽게 따라옵니다. "
              "남편이나 직장의 덕을 볼 수 있습니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "여성에게는 최고의 결혼운이자 연애운입니다. 반듯하고 능력 있는 배우자를 만날 수 있습니다. "
              "남성은 자녀를 얻거나 자녀로 인해 기쁜 일이 생깁니다.\n\n"
              "⚠️ [주의사항]\n"
              "너무 뜨거운 불은 보석을 녹일 수도 있습니다. 지나친 업무나 스트레스는 신경 과민을 유발할 수 있습니다. "
              "원칙주의적인 성향이 강해져 융통성이 없어 보일 수 있으니 주의하세요.";
          break;
        case Cheongan.im: // 임수 (壬)
          fortune = "🌊 2026년 병오년 임수(壬水) 총운: '강물 위의 태양, 일확천금의 기회'\n\n"
              "2026년은 임수인 당신에게 '편재(偏財)'와 '정재(正財)'가 매우 왕성한 해입니다. "
              "호수 위에 태양이 비치어 물결이 금빛으로 빛나는 형상(수화기제)입니다. "
              "재물운이 폭발하며, 인생 역전의 기회를 잡을 수도 있는 시기입니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "사업가에게는 더할 나위 없이 좋은 해입니다. 사업이 번창하고 활동 무대가 해외로까지 넓어질 수 있습니다. "
              "직장인은 성과급이나 인센티브를 두둑하게 챙길 수 있습니다. "
              "결과를 중시하고 실속을 챙기는 실용적인 태도가 성공을 부릅니다.\n\n"
              "💰 [재물운]\n"
              "큰 돈을 만질 수 있는 운입니다. 투자 수익, 사업 소득, 횡재수 등이 따릅니다. "
              "하지만 재물을 다루는 힘(신강/신약)이 약하다면 오히려 돈 때문에 건강을 잃을 수도 있으니(재다신약), "
              "감당할 수 있는 선에서 욕심을 내야 합니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "남성에게는 여자운이 홍수처럼 밀려옵니다. 매력적인 이성들이 주변에 넘쳐납니다. "
              "여성은 시어머니와의 관계가 부각되거나, 능력 있는 남자를 만날 수 있습니다.\n\n"
              "⚠️ [주의사항]\n"
              "재물과 이성에 대한 집착이 화를 부를 수 있습니다. "
              "무리한 욕심은 건강 악화(신장, 방광, 혈압)로 이어질 수 있으니 주의하세요. "
              "돈 관리에 철저해야 하며, 사기수를 조심해야 합니다.";
          break;
        case Cheongan.gye: // 계수 (癸)
          fortune = "🌧️ 2026년 병오년 계수(癸水) 총운: '무지개가 뜨는 결실의 계절'\n\n"
              "2026년은 계수인 당신에게 '정재(正財)'와 '편재(偏財)'의 해입니다. "
              "아지랑이 피어오르는 따뜻한 봄날에 단비가 내리는 형상입니다. "
              "노력한 만큼 정직한 대가를 얻으며, 재정적으로 매우 풍요롭고 안정적인 시기입니다.\n\n"
              "💼 [직장 및 사업운]\n"
              "성실함과 꼼꼼함으로 승부하면 반드시 보상을 받습니다. "
              "재무, 회계, 금융, 데이터 분석 등 꼼꼼함을 요하는 분야에서 능력을 발휘합니다. "
              "안정적인 직장 생활이나 알짜배기 사업을 운영하기에 좋습니다.\n\n"
              "💰 [재물운]\n"
              "알뜰살뜰 모은 돈이 목돈이 되어 돌아옵니다. 저축, 적금, 안전한 투자로 자산을 불릴 수 있습니다. "
              "고정 수입이 늘어나고 생활의 여유가 생깁니다. 낭비벽만 조심하면 됩니다.\n\n"
              "❤️ [연애 및 대인관계]\n"
              "남성은 현모양처 스타일의 배우자를 만나거나 결혼을 할 수 있는 좋은 운입니다. "
              "여성은 현실적이고 안정적인 연애를 추구하게 됩니다. "
              "대인관계가 원만하고 신용을 얻게 됩니다.\n\n"
              "⚠️ [주의사항]\n"
              "너무 뜨거운 열기는 비(계수)를 증발시킬 수 있습니다. "
              "지나친 활동이나 욕심은 체력을 고갈시킬 수 있으니, 적절한 휴식이 필요합니다. "
              "눈앞의 이익에만 급급해 큰 그림을 놓치지 않도록 주의하세요.";
          break;
      }
    } else if (targetYear == 2024) {
        // 2024 Gap-Chin (Wood/Earth)
         switch (myElement) {
          case Ohaeng.wood:
            fortune = "$targetYear년 $yearName은 경쟁과 재물이 함께하는 해입니다. 목(木)인 당신에게 같은 목 기운은 경쟁자를, 토(土) 기운은 재물을 의미합니다. 경쟁 속에서 성취를 이룰 수 있으니 적극적으로 움직이세요.";
            break;
          case Ohaeng.fire:
            fortune = "$targetYear년 $yearName은 당신을 돕는 귀인과 표현의 기회가 오는 해입니다. 화(火)인 당신에게 목(木)은 인성(후원자), 토(土)는 식상(표현)입니다. 배운 것을 펼치기에 아주 좋은 시기입니다.";
            break;
          case Ohaeng.earth:
            fortune = "$targetYear년 $yearName은 명예와 책임이 따르는 해입니다. 토(土)인 당신에게 목(木)은 관성(명예/직장)입니다. 승진이나 취업 운이 좋으며, 조직 내에서 입지를 다질 수 있습니다.";
            break;
          case Ohaeng.metal:
            fortune = "$targetYear년 $yearName은 재물과 문서 운이 있는 해입니다. 금(金)인 당신에게 목(木)은 재성(재물), 토(土)는 인성(문서)입니다. 부동산 계약이나 투자 등에서 이익을 볼 수 있습니다.";
            break;
          case Ohaeng.water:
            fortune = "$targetYear년 $yearName은 자신의 능력을 발휘하고 명예를 얻는 해입니다. 수(水)인 당신에게 목(木)은 식상(활동), 토(土)는 관성(명예)입니다. 활발한 활동을 통해 이름을 알릴 수 있습니다.";
            break;
        }
    } else {
        // 2026 or others - Default generic
         fortune = "$targetYear년 $yearName, 새로운 흐름이 시작됩니다. 당신의 오행인 ${myElement.koreanName}의 기운을 잘 활용하여 균형을 잡는 것이 중요합니다. 긍정적인 마음으로 한 해를 설계하세요.";
    }
    
    return fortune;
  }

  static Ohaeng getElement(String hanja) {
    for (var c in Cheongan.values) {
      if (c.hanja == hanja) return c.ohaeng;
    }
    for (var j in Jiji.values) {
      if (j.hanja == hanja) return j.ohaeng;
    }
    return Ohaeng.wood;
  }

  static Map<Ohaeng, int> countOhaeng(Map<String, Ganji> saju) {
    Map<Ohaeng, int> counts = {
      Ohaeng.wood: 0,
      Ohaeng.fire: 0,
      Ohaeng.earth: 0,
      Ohaeng.metal: 0,
      Ohaeng.water: 0,
    };

    saju.forEach((key, ganji) {
      counts[ganji.cheongan.ohaeng] = counts[ganji.cheongan.ohaeng]! + 1;
      counts[ganji.jiji.ohaeng] = counts[ganji.jiji.ohaeng]! + 1;
    });
    return counts;
  }

  static Ohaeng getDominantOhaeng(Map<Ohaeng, int> counts) {
    Ohaeng dominant = Ohaeng.wood;
    int max = -1;
    counts.forEach((k, v) {
      if (v > max) {
        max = v;
        dominant = k;
      }
    });
    return dominant;
  }

  static String getOhaengExplanation(BuildContext context, Ohaeng ohaeng) {
    final l10n = AppLocalizations.of(context)!;
    switch (ohaeng) {
      case Ohaeng.wood:
        return l10n.ohaengWoodExplanation;
      case Ohaeng.fire:
        return l10n.ohaengFireExplanation;
      case Ohaeng.earth:
        return l10n.ohaengEarthExplanation;
      case Ohaeng.metal:
        return l10n.ohaengMetalExplanation;
      case Ohaeng.water:
        return l10n.ohaengWaterExplanation;
    }
  }

  static String getLocalizedOhaengName(BuildContext context, Ohaeng ohaeng) {
    final l10n = AppLocalizations.of(context)!;
    switch (ohaeng) {
      case Ohaeng.wood:
        return l10n.ohaengWood;
      case Ohaeng.fire:
        return l10n.ohaengFire;
      case Ohaeng.earth:
        return l10n.ohaengEarth;
      case Ohaeng.metal:
        return l10n.ohaengMetal;
      case Ohaeng.water:
        return l10n.ohaengWater;
    }
  }

  static String getLocalizedOhaengSymbol(BuildContext context, Ohaeng ohaeng) {
    final l10n = AppLocalizations.of(context)!;
    switch (ohaeng) {
      case Ohaeng.wood:
        return l10n.ohaengWoodSymbol;
      case Ohaeng.fire:
        return l10n.ohaengFireSymbol;
      case Ohaeng.earth:
        return l10n.ohaengEarthSymbol;
      case Ohaeng.metal:
        return l10n.ohaengMetalSymbol;
      case Ohaeng.water:
        return l10n.ohaengWaterSymbol;
    }
  }
}
