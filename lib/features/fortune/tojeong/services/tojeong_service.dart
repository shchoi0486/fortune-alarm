import '../../saju/models/saju_profile.dart';
import '../models/tojeong_result.dart';
import 'tojeong_content.dart';

class TojeongService {
  static TojeongResult calculate(SajuProfile profile, int targetYear) {
    int age = targetYear - profile.birthDate.year + 1;

    int sangsu = (age + 1) % 8;
    if (sangsu == 0) sangsu = 8;

    int jungsu = (profile.birthDate.month + 3) % 6;
    if (jungsu == 0) jungsu = 6;

    int hasu = (profile.birthDate.day + 1) % 3;
    if (hasu == 0) hasu = 3;

    String key = "$sangsu$jungsu$hasu";

    String totalLuck = TojeongContent.getDetailedTotalLuck(sangsu, jungsu, hasu);
    
    String wealthLuck = TojeongContent.getWealthLuck(sangsu, jungsu);
    String careerLuck = TojeongContent.getCareerLuck(sangsu, hasu);
    String loveLuck = TojeongContent.getLoveLuck(jungsu, hasu);
    
    totalLuck += "\n\n[재물운]\n$wealthLuck\n\n[직장/사업운]\n$careerLuck\n\n[연애/가정운]\n$loveLuck";

    List<String> monthlyLuck = _generateMonthlyLuck(sangsu, jungsu, hasu);

    return TojeongResult(
      key: key,
      totalLuck: totalLuck,
      monthlyLuck: monthlyLuck,
    );
  }

  static List<String> _generateMonthlyLuck(int sangsu, int jungsu, int hasu) {
    List<String> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(TojeongContent.getMonthlyLuck(i, sangsu, jungsu, hasu));
    }
    return months;
  }
}
