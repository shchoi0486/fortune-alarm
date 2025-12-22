import '../../saju/models/saju_profile.dart';
import '../models/tojeong_result.dart';
import 'tojeong_content.dart';

class TojeongService {
  /// 2025년 (을사년) 토정비결 계산 및 결과 생성
  static TojeongResult calculate(SajuProfile profile, int targetYear) {
    // 1. 나이 계산 (한국 나이)
    // 토정비결은 음력 기준이지만, 프로필의 생년월일을 그대로 사용 (변환 불가 시)
    int age = targetYear - profile.birthDate.year + 1;

    // 2. 작괘 (Calculation of 3 Trigrams)
    // 2025년 을사년 기준 작괘법 (블로그/자료 참조)
    // 상수(Sangsu) = (나이 + 태세수) % 8. 을사년 태세수 = 1
    int sangsu = (age + 1) % 8;
    if (sangsu == 0) sangsu = 8;

    // 중수(Jungsu) = (생월 + 월건수) % 6. 을사년 월건수 = 3
    // 음력 기준이나, 입력된 월을 그대로 사용
    int jungsu = (profile.birthDate.month + 3) % 6;
    if (jungsu == 0) jungsu = 6;

    // 하수(Hasu) = (생일 + 일진수) % 3. 을사년 일진수 = 1
    int hasu = (profile.birthDate.day + 1) % 3;
    if (hasu == 0) hasu = 3;

    String key = "$sangsu$jungsu$hasu";

    // 3. 결과 텍스트 생성 (TojeongContent 사용)
    String totalLuck = TojeongContent.getDetailedTotalLuck(sangsu, jungsu, hasu);
    
    // 추가 운세 (재물, 직장, 연애)
    String wealthLuck = TojeongContent.getWealthLuck(sangsu, jungsu);
    String careerLuck = TojeongContent.getCareerLuck(sangsu, hasu);
    String loveLuck = TojeongContent.getLoveLuck(jungsu, hasu);
    
    // 총운에 섹션 추가
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
