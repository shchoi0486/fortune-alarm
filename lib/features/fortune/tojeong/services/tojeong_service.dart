import '../../saju/models/saju_profile.dart';
import '../models/tojeong_result.dart';
import 'tojeong_content.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class TojeongService {
  static TojeongResult calculate(SajuProfile profile, int targetYear, AppLocalizations l10n) {
    int age = targetYear - profile.birthDate.year + 1;

    int sangsu = (age + 1) % 8;
    if (sangsu == 0) sangsu = 8;

    int jungsu = (profile.birthDate.month + 3) % 6;
    if (jungsu == 0) jungsu = 6;

    int hasu = (profile.birthDate.day + 1) % 3;
    if (hasu == 0) hasu = 3;

    String key = "$sangsu$jungsu$hasu";

    String totalLuck = TojeongContent.getDetailedTotalLuck(sangsu, jungsu, hasu, l10n);
    
    String wealthLuck = TojeongContent.getWealthLuck(sangsu, jungsu, l10n);
    String careerLuck = TojeongContent.getCareerLuck(sangsu, hasu, l10n);
    String loveLuck = TojeongContent.getLoveLuck(jungsu, hasu, l10n);
    
    totalLuck += "\n\n[${l10n.wealthLuck}]\n$wealthLuck\n\n[${l10n.careerLuck}]\n$careerLuck\n\n[${l10n.loveLuck}]\n$loveLuck";

    List<String> monthlyLuck = _generateMonthlyLuck(sangsu, jungsu, hasu, l10n);

    return TojeongResult(
      key: key,
      totalLuck: totalLuck,
      monthlyLuck: monthlyLuck,
    );
  }

  static List<String> _generateMonthlyLuck(int sangsu, int jungsu, int hasu, AppLocalizations l10n) {
    List<String> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(TojeongContent.getMonthlyLuck(i, sangsu, jungsu, hasu, l10n));
    }
    return months;
  }
}
