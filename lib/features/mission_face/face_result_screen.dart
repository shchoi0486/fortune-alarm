import 'package:flutter/material.dart';
import 'package:fortune_alarm/features/fortune/mixins/fortune_access_mixin.dart';
import 'package:fortune_alarm/services/cookie_service.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../../services/notification_service.dart';
import '../../services/alarm_scheduler_service.dart';

class FaceResultScreen extends StatefulWidget {
  final String? alarmId;
  final FaceAnalysisMetrics? analysis;

  const FaceResultScreen({super.key, this.alarmId, this.analysis});

  @override
  State<FaceResultScreen> createState() => _FaceResultScreenState();
}

class _FaceResultScreenState extends State<FaceResultScreen> with SingleTickerProviderStateMixin, FortuneAccessMixin {
  bool _isAnalyzing = true;
  bool _isLocked = false;
  late AnimationController _controller;
  late FaceReadingResult _result;
  final CookieService _localCookieService = CookieService();

  @override
  void initState() {
    super.initState();
    
    // 안전장치: 결과 화면 진입 시 알람 소리 강제 종료
    // 미션 화면에서 종료했더라도, 혹시 모를 타이밍 이슈나 백그라운드 재생 방지
    FlutterRingtonePlayer().stop();
    if (widget.alarmId != null) {
      final stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
      NotificationService().cancelNotification(stableId);
    }

    // 초기값 설정 (late 초기화 오류 방지)
    _result = _buildResult(widget.analysis);
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // 3초간 분석 연출
    )..forward().whenComplete(() {
      if (!mounted) return;
      setState(() {
        _isAnalyzing = false;
        _isLocked = true; // 분석 완료 후 잠금 상태로 전환
        _result = _buildResult(widget.analysis);
      });
    });
  }

  FaceReadingResult _buildResult(FaceAnalysisMetrics? analysis) {
    if (analysis == null) {
      return FaceReadingResult(
        title: "관상 분석(기본)",
        totalScore: 65,
        wealthScore: 62,
        loveScore: 64,
        careerScore: 66,
        healthScore: 68,
        eyeAnalysis: "측정값이 충분하지 않아, 전체적인 인상 중심으로 해석했습니다.",
        noseAnalysis: "코 윤곽이 안정적으로 잡히면 재물운 해석의 정확도가 올라갑니다.",
        mouthAnalysis: "입 주변 윤곽이 뚜렷할수록 말운·대인운 해석이 구체화됩니다.",
        overallAdvice: "조명을 밝게 하고 정면을 바라보면 분석 품질이 좋아집니다.",
        overallAnalysis: "이번 결과는 얼굴 윤곽/표정 측정이 충분하지 않아 기본 해석으로 표시됩니다.\n정면 응시와 조명 상태가 좋아지면, 눈 뜸·코 윤곽·입 주변 지표가 더 안정적으로 측정됩니다.\n다시 시도하면 점수 분포와 문장이 더 구체적으로 바뀝니다.",
        dailyFortune: "오늘은 평온한 마음으로 하루를 시작하기 좋은 날입니다.\n거울 속 미소로 긍정적인 기운을 채워보세요.\n작은 여유가 뜻밖의 행운을 불러옵니다.",
      );
    }

    final faceShape = _faceShapeLabel(analysis);
    final eyeOpen = (analysis.eyeOpenProbability ?? 0.5).clamp(0.0, 1.0);
    final smile = (analysis.smileProbability ?? 0.3).clamp(0.0, 1.0);
    final mouthOpen = (analysis.mouthOpenRatio ?? 0.0).clamp(0.0, 0.25);
    final yawAbs = (analysis.yawDegreesAbs ?? 0.0).clamp(0.0, 90.0);
    final rollAbs = (analysis.rollDegreesAbs ?? 0.0).clamp(0.0, 90.0);

    int clampScore(double value) => value.round().clamp(35, 95);
    double clamp01(double value) => value.clamp(0.0, 1.0);

    final noseWidth = analysis.noseWidthRatio;
    final noseLength = analysis.noseLengthRatio;

    final wealth = clampScore(
      55 +
          _wealthDeltaFromNose(noseWidth: noseWidth, noseLength: noseLength) +
          _faceShapeWealthBias(faceShape),
    );

    final love = clampScore(
      50 +
          (smile * 35) +
          ((eyeOpen - 0.5) * 20) +
          (mouthOpen >= 0.04 && smile >= 0.55 ? 5 : 0) +
          _faceShapeLoveBias(faceShape),
    );

    final career = clampScore(
      55 +
          ((1 - clamp01(yawAbs / 25)) * 15) +
          ((1 - clamp01(rollAbs / 20)) * 8) +
          ((eyeOpen - 0.5) * 10) +
          _faceShapeCareerBias(faceShape),
    );

    final health = clampScore(
      50 +
          (eyeOpen * 25) +
          ((1 - clamp01(yawAbs / 35)) * 10) +
          ((1 - clamp01(rollAbs / 25)) * 8),
    );

    final total = clampScore((wealth * 0.27) + (love * 0.23) + (career * 0.30) + (health * 0.20));
    final title = _titleFromScores(wealth: wealth, love: love, career: career, health: health);

    final scoreMap = {
      "재물": wealth,
      "인연": love,
      "직업": career,
      "건강": health,
    };
    final sorted = scoreMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topKey = sorted.first.key;
    final bottomKey = sorted.last.key;

    final dailyFortune = _generateDailyFortune(
      topKey: topKey,
      bottomKey: bottomKey,
      smile: smile,
      eyeOpen: eyeOpen,
      wealth: wealth,
      love: love,
      career: career,
      health: health,
    );

    final overallAnalysis = _overallAnalysisText(
      topKey: topKey,
      bottomKey: bottomKey,
      wealth: wealth,
      love: love,
      career: career,
      health: health,
      eyeOpen: eyeOpen,
      smile: smile,
      mouthOpen: mouthOpen,
      noseWidth: noseWidth,
      noseLength: noseLength,
    );

    return FaceReadingResult(
      title: title,
      totalScore: total,
      wealthScore: wealth,
      loveScore: love,
      careerScore: career,
      healthScore: health,
      eyeAnalysis: _eyeAnalysisText(eyeOpen: eyeOpen, yawAbs: yawAbs, rollAbs: rollAbs, smile: smile),
      noseAnalysis: _noseAnalysisText(noseWidth: noseWidth, noseLength: noseLength),
      mouthAnalysis: _mouthAnalysisText(mouthOpen: mouthOpen, smile: smile),
      overallAdvice: _adviceText(wealth: wealth, love: love, career: career, health: health),
      overallAnalysis: overallAnalysis,
      dailyFortune: dailyFortune,
    );
  }

  String _generateDailyFortune({
    required String topKey,
    required String bottomKey,
    required double smile,
    required double eyeOpen,
    required int wealth,
    required int love,
    required int career,
    required int health,
  }) {
    final now = DateTime.now();
    final daySeed = now.day + now.month + now.year;
    final toneIndex = (daySeed + (smile * 100).toInt() + (eyeOpen * 100).toInt()) % 3;
    final tipIndex = (daySeed + wealth + love + career + health) % 4;

    String headline = "오늘은 $topKey 운이 들어오는 날입니다. $bottomKey 쪽은 한 번 더 조심하세요.";

    String mid;
    if (topKey == "재물") {
      final options = [
        "작은 정리와 확인이 돈의 흐름을 더 크게 만들어줍니다.",
        "급할수록 계산을 한 번 더 하면 이득이 남습니다.",
        "알뜰하게 챙긴 한 가지가 예상 밖의 성과로 이어집니다.",
      ];
      mid = options[toneIndex];
    } else if (topKey == "인연") {
      final options = [
        "먼저 한마디 건네면 관계가 부드럽게 풀립니다.",
        "진심을 짧게 전하는 것이 오해를 줄여줍니다.",
        "작은 배려가 귀인의 기운을 끌어옵니다.",
      ];
      mid = options[toneIndex];
    } else if (topKey == "직업") {
      final options = [
        "우선순위를 좁히면 집중력이 성과로 바뀝니다.",
        "결정은 간단히, 실행은 꾸준히가 통하는 날입니다.",
        "오늘은 맡은 일을 끝까지 마무리하는 힘이 큽니다.",
      ];
      mid = options[toneIndex];
    } else {
      final options = [
        "리듬을 고르면 컨디션이 금방 회복됩니다.",
        "무리하지 않고 템포를 지키면 하루가 편안해집니다.",
        "작은 휴식이 집중력과 기분을 함께 끌어올립니다.",
      ];
      mid = options[toneIndex];
    }

    String tip;
    if (bottomKey == "재물") {
      final options = [
        "지출·구독·결제는 ‘지금’보다 ‘내일’ 한 번 더 확인하세요.",
        "약속 없는 소비는 피하고, 필요한 것만 담는 게 이득입니다.",
        "금전 관련 대화는 기록을 남기면 불필요한 손해를 막습니다.",
        "작은 금액이라도 새는 구멍이 없는지 체크해보세요.",
      ];
      tip = options[tipIndex];
    } else if (bottomKey == "인연") {
      final options = [
        "말투가 날카로워지기 쉬우니 ‘한 박자 쉬고’ 답하세요.",
        "오해가 생기면 길게 설명보다 짧게 확인이 더 좋습니다.",
        "오늘은 약속 시간을 지키는 것만으로도 신뢰가 쌓입니다.",
        "대화는 결론부터 말하면 감정 소모가 줄어듭니다.",
      ];
      tip = options[tipIndex];
    } else if (bottomKey == "직업") {
      final options = [
        "일을 벌리기보다 ‘하나를 끝내는 것’이 운을 키웁니다.",
        "완벽보다 마감이 먼저입니다. 오늘은 80%에서 확정하세요.",
        "미루고 있던 한 가지를 정리하면 머리가 맑아집니다.",
        "내가 할 일과 남의 일을 분리하면 스트레스가 줄어듭니다.",
      ];
      tip = options[tipIndex];
    } else {
      final options = [
        "수면·과식·카페인 과다만 피하면 컨디션이 안정됩니다.",
        "목·어깨 긴장을 풀어주면 하루 피로가 확 줄어듭니다.",
        "짧은 산책이 생각을 정리해주고 기운을 환기합니다.",
        "물 한 잔, 스트레칭 1분이 운의 바닥을 받칩니다.",
      ];
      tip = options[tipIndex];
    }

    return "$headline\n$mid\n$tip";
  }

  double _wealthDeltaFromNose({required double? noseWidth, required double? noseLength}) {
    final w = (noseWidth ?? 0.25).clamp(0.15, 0.40);
    final l = (noseLength ?? 0.30).clamp(0.15, 0.55);
    final wDelta = (w - 0.25) * 160;
    final lDelta = (l - 0.30) * 120;
    return wDelta + lDelta;
  }

  int _faceShapeWealthBias(String faceShape) {
    if (faceShape == "각진형") return 2;
    return 0;
  }

  int _faceShapeLoveBias(String faceShape) {
    if (faceShape == "둥근형") return 2;
    return 0;
  }

  int _faceShapeCareerBias(String faceShape) {
    if (faceShape == "긴형" || faceShape == "V라인형") return 2;
    return 0;
  }

  String _faceShapeLabel(FaceAnalysisMetrics analysis) {
    final aspect = analysis.faceAspectRatio;
    final jawToCheek = analysis.jawToCheekRatio;
    
    // jawToCheekRatio: 턱 너비 / 광대 너비
    // 0.82 미만: 턱이 매우 좁음 (V라인)
    if (jawToCheek != null && jawToCheek < 0.82) return "V라인형";
    
    // 0.94 이상: 턱과 광대 너비가 비슷함 (각진형/사각형)
    if (jawToCheek != null && jawToCheek > 0.94) return "각진형";
    
    // aspect ratio: 너비 / 높이
    if (aspect == null) return "균형형";
    
    // 0.88 이상: 가로 너비가 넓음 (둥근형)
    if (aspect >= 0.88) return "둥근형";
    
    // 0.75 이하: 세로가 매우 김 (긴형)
    if (aspect <= 0.75) return "긴형";
    
    return "타원형";
  }

  String _titleFromScores({
    required int wealth,
    required int love,
    required int career,
    required int health,
  }) {
    final scores = {
      "재물운": wealth,
      "인연운": love,
      "직업운": career,
      "건강운": health,
    };
    
    final sorted = scores.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topType = sorted.first.key;
    
    if (topType == "재물운") return "재물운 중심의 상";
    if (topType == "인연운") return "인연운이 강한 상";
    if (topType == "직업운") return "직업운이 돋보이는 상";
    return "기운이 안정된 상";
  }

  String _eyeAnalysisText({required double eyeOpen, required double yawAbs, required double rollAbs, required double smile}) {
    // 1. 눈의 크기/뜸 정도에 따른 기본 성향 (Physiognomy)
    String eyeTypeDesc;
    if (eyeOpen >= 0.65) {
      eyeTypeDesc = "눈빛이 강렬하고 또렷하여, 순간적인 판단력과 추진력이 매우 돋보이는 상입니다.";
    } else if (eyeOpen <= 0.35) {
      eyeTypeDesc = "눈매가 차분하고 깊어, 신중하게 관찰하고 생각한 뒤 움직이는 현명한 상입니다.";
    } else {
      eyeTypeDesc = "눈의 기운이 균형 잡혀 있어, 감정과 이성을 적절히 조율하며 안정감을 주는 상입니다.";
    }

    // 2. 표정(웃음)과의 조화 (Dynamic Expression)
    String expressionDesc;
    if (smile >= 0.6) {
      if (eyeOpen >= 0.55) {
        expressionDesc = "특히 밝은 눈빛과 미소가 어우러져, 사람을 끄는 도화(桃花)의 기운이 강하게 발현됩니다.";
      } else {
        expressionDesc = "차분한 눈매 속에 은은한 미소가 서려 있어, 외유내강형의 부드러운 카리스마가 느껴집니다.";
      }
    } else {
      if (eyeOpen >= 0.55) {
        expressionDesc = "웃음기 없는 강한 눈빛은 결단력과 리더십을 상징하며, 목표를 향해 직진하는 힘이 느껴집니다.";
      } else {
        expressionDesc = "전체적으로 차분하고 진중한 분위기라, 가벼운 언행보다는 무게감 있는 태도로 신뢰를 얻습니다.";
      }
    }

    // 3. 자세(고개 각도)에 따른 조언
    String postureAdvice;
    if (yawAbs > 15 || rollAbs > 12) {
      postureAdvice = "다만 고개가 다소 기울어 있어 마음의 중심이 흔들릴 수 있으니, 정면을 응시하면 운기가 더 맑아집니다.";
    } else {
      postureAdvice = "정면을 바르게 응시하는 자세가 눈의 기운을 더욱 맑고 올곧게 만들어줍니다.";
    }

    return "$eyeTypeDesc $expressionDesc $postureAdvice";
  }

  String _noseAnalysisText({required double? noseWidth, required double? noseLength}) {
    if (noseWidth == null && noseLength == null) {
      return "코 윤곽 측정이 충분하지 않아, 코에 대한 해석은 절제해 표시합니다.";
    }
    final w = (noseWidth ?? 0.25);
    final l = (noseLength ?? 0.30);
    
    String noseDesc;
    if (w >= 0.28 && l >= 0.33) {
      noseDesc = "콧망울이 두툼하고 코 길이가 길어, 재물을 모으고 지키는 '재백궁(제물창고)'의 기운이 아주 좋습니다.";
    } else if (w <= 0.22) {
      noseDesc = "코가 날렵하고 정갈하여, 재물을 꼼꼼하게 관리하고 계획적으로 불려나가는 실속파입니다.";
    } else {
      noseDesc = "코의 비율이 적당하고 균형이 잡혀 있어, 들어오는 재물을 안정적으로 유지하는 힘이 있습니다.";
    }

    return noseDesc;
  }

  String _mouthAnalysisText({required double mouthOpen, required double smile}) {
    String mouthDesc;
    if (mouthOpen < 0.03) {
      if (smile >= 0.55) {
         mouthDesc = "입을 다물고 있지만 입꼬리가 올라가 있어, 말 한마디에 복이 깃들고 주변의 호감을 사는 상입니다.";
      } else {
         mouthDesc = "입을 굳게 다문 모습에서 신뢰감과 책임감이 느껴지며, 가벼운 말보다 행동으로 보여주는 타입입니다.";
      }
    } else {
      if (smile >= 0.55) {
         mouthDesc = "활짝 웃는 입매가 시원하여, 긍정적인 에너지를 발산하고 대인관계에서 행운을 불러옵니다.";
      } else {
         mouthDesc = "입이 살짝 벌어져 있어 개방적이고 솔직한 성격이 보이지만, 때로는 말실수를 조심해야 합니다.";
      }
    }
    return mouthDesc;
  }

  String _overallAnalysisText({
    required String topKey,
    required String bottomKey,
    required int wealth,
    required int love,
    required int career,
    required int health,
    required double eyeOpen,
    required double smile,
    required double mouthOpen,
    required double? noseWidth,
    required double? noseLength,
  }) {
    final headline = "오늘의 중심은 $topKey, 조심할 포인트는 $bottomKey 입니다.";

    final top = topKey;
    String vibeDesc;
    if (top == "재물") {
      vibeDesc = (noseWidth ?? 0.25) >= 0.28 
          ? "특히 오늘은 재백궁(코)의 기운이 좋아 금전적인 이득을 기대해볼 만합니다."
          : "오늘은 실속을 챙기며 재물을 차곡차곡 모으기에 적합한 흐름입니다.";
    } else if (top == "인연") {
      vibeDesc = smile >= 0.5 
          ? "밝은 미소가 도화의 기운을 증폭시켜, 새로운 인연이나 귀인을 만날 수 있습니다."
          : "차분한 태도가 신뢰를 주어, 깊이 있는 관계를 형성하기 좋은 날입니다.";
    } else if (top == "직업") {
      vibeDesc = eyeOpen >= 0.55
          ? "눈빛에 서린 총기가 판단력을 높여주니, 중요한 결정을 내리기에 최적입니다."
          : "묵묵히 자리를 지키는 끈기가 인정받아, 성과로 이어지는 하루입니다.";
    } else { // 건강
      vibeDesc = "신체의 리듬이 안정적이니, 새로운 활력을 충전하고 내실을 다지기 좋습니다.";
    }

    // 3. 행동 가이드 (6줄 제한을 위해 간결하게)
    String actionDesc;
    if (mouthOpen < 0.05) {
      actionDesc = "입을 다문 신중함이 실수를 막아줍니다. 말보다는 행동으로 보여주면 결과가 따릅니다.";
    } else {
      actionDesc = "적극적인 표현이 행운을 부릅니다. 자신감 있게 의견을 개진하면 좋은 반응을 얻습니다.";
    }

    return "$headline\n$vibeDesc\n$actionDesc";
  }

  Widget _buildHighlightedText(String text, {required TextStyle baseStyle, bool isPrimary = true}) {
    final lines = text.split('\n');
    if (lines.isEmpty) return const SizedBox.shrink();

    final accentColor = isPrimary ? Colors.deepPurple[700] : Colors.black87;
    final warningColor = isPrimary ? Colors.red[700] : Colors.black87;

    final List<Widget> widgets = [];

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;

      // 1. 첫 번째 문장(요약/헤드라인) 처리
      if (i == 0) {
        final isWarning = line.contains('조심') || line.contains('주의') || line.contains('실수');
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              line,
              style: baseStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: isWarning ? warningColor : accentColor,
                fontSize: baseStyle.fontSize! + (isPrimary ? 1 : 0.5),
              ),
            ),
          ),
        );
      } else {
        // 2. 나머지 문장들은 핵심 단어만 '굵게' 표시
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: _buildLineWithBoldOnly(line, baseStyle),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _buildLineWithBoldOnly(String line, TextStyle baseStyle) {
    final boldRegex = RegExp(r'(재물|금전|지출|결제|계약|정리|투자|인연|대인|소통|연락|약속|말투|오해|직업|일|결정|성과|집중|우선순위|마감|건강|휴식|수면|컨디션|무리|산책|스트레칭|행운|기회|좋은|조심|주의|경계|실수)');
    
    int index = 0;
    final spans = <TextSpan>[];

    while (index < line.length) {
      final match = boldRegex.firstMatch(line.substring(index));
      if (match == null) {
        spans.add(TextSpan(text: line.substring(index), style: baseStyle));
        break;
      }

      final start = index + match.start;
      if (start > index) {
        spans.add(TextSpan(text: line.substring(index, start), style: baseStyle));
      }

      final matchText = match.group(0) ?? '';
      spans.add(TextSpan(
        text: matchText, 
        style: baseStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
      ));
      index = start + matchText.length;
    }

    return RichText(
      text: TextSpan(style: baseStyle, children: spans),
    );
  }

  String _adviceText({required int wealth, required int love, required int career, required int health}) {
    final now = DateTime.now();
    final daySeed = now.day + now.month + now.year;
    
    final minScore = [wealth, love, career, health].reduce((a, b) => a < b ? a : b);
    final variantIndex = (daySeed + minScore) % 3;

    if (minScore == health) {
      final options = [
        "컨디션 관리가 운의 바닥을 받칩니다. 오늘은 무리한 일정부터 정리하세요.",
        "몸의 신호에 귀를 기울이세요. 짧은 휴식이 더 큰 성과를 가져옵니다.",
        "충분한 수면과 수분 섭취만으로도 오늘의 운기가 맑아집니다.",
      ];
      return options[variantIndex];
    }
    if (minScore == wealth) {
      final options = [
        "돈은 들어오는 만큼 새기 쉽습니다. 지출·계약은 한 번 더 확인하세요.",
        "작은 지출을 줄이는 것이 큰 재물을 모으는 시작입니다.",
        "금전적인 결정은 내일로 미루는 것이 이득이 될 수 있습니다.",
      ];
      return options[variantIndex];
    }
    if (minScore == love) {
      final options = [
        "말투 한 번, 표정 한 번이 인연운을 좌우합니다. 먼저 부드럽게 시작하세요.",
        "경청하는 자세가 상대방의 마음을 여는 열쇠가 됩니다.",
        "가까운 사람일수록 예의를 지키는 것이 운을 지키는 길입니다.",
      ];
      return options[variantIndex];
    }
    
    final options = [
      "목표를 넓히기보다 '하나를 확실히' 잡는 날입니다. 우선순위를 줄이세요.",
      "서두르지 마세요. 차근차근 진행하는 것이 가장 빠른 길입니다.",
      "주변의 조언을 참고하되, 최종 결정은 본인의 직관을 믿으세요.",
    ];
    return options[variantIndex];
  }

  void _unlockWithAd() {
    showRewardedAd(() {
      setState(() {
        _isLocked = false;
      });
    });
  }

  Future<void> _unlockWithCookies() async {
    final count = await _localCookieService.getCookieCount();
    if (!mounted) return;

    if (count < 2) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('포춘쿠키 부족', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          content: const Text(
            '보유한 포춘쿠키가 부족합니다.\n광고를 보고 무료로 확인해보세요!',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('확인', style: TextStyle(color: Colors.amber)),
            ),
          ],
        ),
      );
      return;
    }

    final success = await _localCookieService.useCookies(2);
    if (success) {
      if (!mounted) return;
      setState(() {
        _isLocked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('포춘쿠키 2개를 사용하여 결과를 확인합니다.')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onComplete() {
    // 미션 완료 결과 반환
    Navigator.of(context).pop(true); 
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // 뒤로가기 방지
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isAnalyzing) return _buildAnalyzingView();
    if (_isLocked) return _buildLockScreen();
    return _buildResultView();
  }

  Widget _buildLockScreen() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey[50]!],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.lock_outline, size: 60, color: Colors.purple),
          ),
          const SizedBox(height: 32),
          const Text(
            "관상 분석이 완료되었습니다!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "당신의 얼굴에 숨겨진 운세를 확인하려면\n아래 방법 중 하나를 선택해주세요.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          
          // Ad Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _unlockWithAd,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              icon: const Icon(Icons.play_circle_filled),
              label: const Text(
                "광고 보고 무료로 결과 보기",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Cookie Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton.icon(
              onPressed: _unlockWithCookies,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                side: BorderSide(color: Colors.grey[400]!),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              icon: const Icon(Icons.cookie, color: Colors.amber),
              label: const Text(
                "포춘쿠키 2개 사용하기",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyzingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 뇌파/분석 아이콘 애니메이션
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(seconds: 3),
            builder: (context, value, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 8,
                      backgroundColor: Colors.grey[200],
                      color: Colors.purpleAccent,
                    ),
                  ),
                  const Icon(Icons.face_retouching_natural, size: 60, color: Colors.purple),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          const Text(
            "AI가 관상을 분석 중입니다...",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCheckItem("얼굴 인식 완료", true),
              _buildCheckItem("특징점 추출 중...", true),
              _buildCheckItem("운세 데이터 대조 중...", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isChecked ? Icons.check_circle : Icons.circle_outlined,
            color: isChecked ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black54, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildResultView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.face_retouching_natural, size: 36, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "오늘의 관상 분석",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1.2),
            ),
            const SizedBox(height: 6),
            Text(
              _result.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87, letterSpacing: -0.5),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
                  ],
                ),
                child: Text(
                  "총점 ${_result.totalScore}점",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(height: 36),
            
            // 4대 운세 그래프
            _buildLuckBar("💰 재물운", _result.wealthScore, Colors.amber),
            _buildLuckBar("❤️ 애정운", _result.loveScore, Colors.pinkAccent),
            _buildLuckBar("💼 직업운", _result.careerScore, Colors.blueAccent),
            _buildLuckBar("💪 건강운", _result.healthScore, Colors.green),
            
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FD),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepPurpleAccent.withOpacity(0.08)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.auto_awesome, color: Colors.deepPurpleAccent, size: 18),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "오늘의 관상 운세",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildHighlightedText(
                    _result.dailyFortune,
                    baseStyle: const TextStyle(fontSize: 15, height: 1.6, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 32),
            const Text(
              "종합 분석",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50]!.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueGrey.withOpacity(0.1)),
              ),
              child: _buildHighlightedText(
                _result.overallAnalysis,
                baseStyle: const TextStyle(fontSize: 15, height: 1.65, color: Colors.black87),
                isPrimary: false,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "상세 분석",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 14),
            _buildFeatureItem("👁️ 눈 (통찰력)", _result.eyeAnalysis),
            _buildFeatureItem("👃 코 (재물복)", _result.noseAnalysis),
            _buildFeatureItem("👄 입 (말년운)", _result.mouthAnalysis),

            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.withOpacity(0.05), Colors.deepPurpleAccent.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.purple.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lightbulb_outline, color: Colors.purple[400], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "오늘의 조언",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _result.overallAdvice,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, height: 1.55, color: Colors.black87.withOpacity(0.8), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: _onComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  shadowColor: Colors.purple.withOpacity(0.3),
                ),
                child: const Text(
                  "기상 완료!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildLuckBar(String label, int score, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: score / 100,
                backgroundColor: Colors.grey[200],
                color: color,
                minHeight: 8,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 30, 
            child: Text(
              "$score", 
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 15),
            )
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String label, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 16, 
                  color: Colors.black87,
                )
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            desc, 
            style: TextStyle(
              color: Colors.black87.withOpacity(0.75), 
              fontSize: 15, 
              height: 1.55,
            )
          ),
        ],
      ),
    );
  }
}

class FaceAnalysisMetrics {
  final double? faceAspectRatio;
  final double? jawToCheekRatio;
  final double? eyeOpenProbability;
  final double? smileProbability;
  final double? noseWidthRatio;
  final double? noseLengthRatio;
  final double? mouthOpenRatio;
  final double? yawDegreesAbs;
  final double? rollDegreesAbs;

  const FaceAnalysisMetrics({
    required this.faceAspectRatio,
    required this.jawToCheekRatio,
    required this.eyeOpenProbability,
    required this.smileProbability,
    required this.noseWidthRatio,
    required this.noseLengthRatio,
    required this.mouthOpenRatio,
    required this.yawDegreesAbs,
    required this.rollDegreesAbs,
  });
}

class FaceReadingResult {
  final String title;
  final int totalScore;
  final int wealthScore;
  final int loveScore;
  final int careerScore;
  final int healthScore;
  final String eyeAnalysis;
  final String noseAnalysis;
  final String mouthAnalysis;
  final String overallAdvice;

  final String overallAnalysis; // 종합 분석 내용 추가
  final String dailyFortune; // 오늘의 관상 운세 추가

  FaceReadingResult({
    required this.title,
    required this.totalScore,
    required this.wealthScore,
    required this.loveScore,
    required this.careerScore,
    required this.healthScore,
    required this.eyeAnalysis,
    required this.noseAnalysis,
    required this.mouthAnalysis,
    required this.overallAdvice,
    required this.overallAnalysis,
    required this.dailyFortune,
  });
}
