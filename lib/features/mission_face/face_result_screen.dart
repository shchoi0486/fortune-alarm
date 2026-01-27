import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:fortune_alarm/features/fortune/mixins/fortune_access_mixin.dart';
import 'package:fortune_alarm/services/cookie_service.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../../services/notification_service.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/sharing_service.dart';
import '../../services/ad_service.dart';
import '../../widgets/ad_widgets.dart';

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
  bool _isResultInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isResultInitialized) {
      _result = _buildResult(context, widget.analysis);
      _isResultInitialized = true;
    }
  }

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
    // context를 initState에서 직접 사용하면 Localization 오류가 발생하므로 
    // didChangeDependencies에서 초기화하거나 임시 데이터로 세팅
    _result = FaceReadingResult(
      title: "",
      totalScore: 0,
      wealthScore: 0,
      loveScore: 0,
      careerScore: 0,
      healthScore: 0,
      eyeAnalysis: "",
      noseAnalysis: "",
      mouthAnalysis: "",
      overallAdvice: "",
      overallAnalysis: "",
      dailyFortune: "",
    );
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // 3초간 분석 연출
    )..forward().whenComplete(() async {
      if (!mounted) return;
      
      // 구독 상태 확인하여 잠금 여부 결정
      // AdService.isSubscriber와 로컬 쿠키 서비스 상태를 모두 확인하여 더 정확하게 판단
      final hasPass = await _localCookieService.hasActiveFortunePassSubscription();
      final isSubscriber = AdService.isSubscriber || hasPass;
      
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
          _isLocked = !isSubscriber; // 구독자면 잠금 해제 상태로 시작
          _result = _buildResult(context, widget.analysis);
        });
      }
    });
  }

  FaceReadingResult _buildResult(BuildContext context, FaceAnalysisMetrics? analysis) {
    final l10n = AppLocalizations.of(context)!;
    if (analysis == null) {
      return FaceReadingResult(
        title: l10n.faceAnalysisBasic,
        totalScore: 65,
        wealthScore: 62,
        loveScore: 64,
        careerScore: 66,
        healthScore: 68,
        eyeAnalysis: l10n.insufficientDataOverallImpression,
        noseAnalysis: l10n.noseStabilityWealthAccuracy,
        mouthAnalysis: l10n.mouthClarityInterpersonalAccuracy,
        overallAdvice: l10n.improveAnalysisQualityAdvice,
        overallAnalysis: l10n.basicAnalysisDescription,
        dailyFortune: l10n.defaultDailyFortune,
      );
    }

    final faceShape = _faceShapeLabel(context, analysis);
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
          _faceShapeWealthBias(context, faceShape),
    );

    final love = clampScore(
      50 +
          (smile * 35) +
          ((eyeOpen - 0.5) * 20) +
          (mouthOpen >= 0.04 && smile >= 0.55 ? 5 : 0) +
          _faceShapeLoveBias(context, faceShape),
    );

    final career = clampScore(
      55 +
          ((1 - clamp01(yawAbs / 25)) * 15) +
          ((1 - clamp01(rollAbs / 20)) * 8) +
          ((eyeOpen - 0.5) * 10) +
          _faceShapeCareerBias(context, faceShape),
    );

    final health = clampScore(
      50 +
          (eyeOpen * 25) +
          ((1 - clamp01(yawAbs / 35)) * 10) +
          ((1 - clamp01(rollAbs / 25)) * 8),
    );

    final total = clampScore((wealth * 0.27) + (love * 0.23) + (career * 0.30) + (health * 0.20));
    final title = _titleFromScores(context, wealth: wealth, love: love, career: career, health: health);

    final scoreMap = {
      l10n.wealth: wealth,
      l10n.love: love,
      l10n.career: career,
      l10n.health: health,
    };
    final sorted = scoreMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topKey = sorted.first.key;
    final bottomKey = sorted.last.key;

    final dailyFortune = _generateDailyFortune(
      context,
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
      context,
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
      eyeAnalysis: _eyeAnalysisText(context, eyeOpen: eyeOpen, yawAbs: yawAbs, rollAbs: rollAbs, smile: smile),
      noseAnalysis: _noseAnalysisText(context, noseWidth: noseWidth, noseLength: noseLength),
      mouthAnalysis: _mouthAnalysisText(context, mouthOpen: mouthOpen, smile: smile),
      overallAdvice: _adviceText(context, wealth: wealth, love: love, career: career, health: health),
      overallAnalysis: overallAnalysis,
      dailyFortune: dailyFortune,
    );
  }

  String _generateDailyFortune(
    BuildContext context, {
    required String topKey,
    required String bottomKey,
    required double smile,
    required double eyeOpen,
    required int wealth,
    required int love,
    required int career,
    required int health,
  }) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    // 날짜, 시간, 점수를 조합하여 더 다양한 인덱스 생성
    final daySeed = now.day + now.month + now.year;
    final hourSeed = now.hour;
    final scoreSum = wealth + love + career + health;
    
    // 다양한 인덱스 계산
    final vibeIndex = (daySeed + hourSeed + (smile * 100).toInt()) % 5;
    final toneIndex = (daySeed + (scoreSum % 7) + (eyeOpen * 100).toInt()) % 10;
    final tipIndex = (daySeed + (scoreSum % 11) + hourSeed) % 10;

    String faceVibe = "";
    if (smile >= 0.6) {
      final options = [
        l10n.faceVibeSmile0,
        l10n.faceVibeSmile1,
        l10n.faceVibeSmile2,
        l10n.faceVibeSmile3,
        l10n.faceVibeSmile4,
      ];
      faceVibe = options[vibeIndex];
    } else if (eyeOpen >= 0.6) {
      final options = [
        l10n.faceVibeEye0,
        l10n.faceVibeEye1,
        l10n.faceVibeEye2,
        l10n.faceVibeEye3,
        l10n.faceVibeEye4,
      ];
      faceVibe = options[vibeIndex];
    } else {
      final options = [
        l10n.faceVibeNeutral0,
        l10n.faceVibeNeutral1,
        l10n.faceVibeNeutral2,
        l10n.faceVibeNeutral3,
        l10n.faceVibeNeutral4,
      ];
      faceVibe = options[vibeIndex];
    }
    
    String headline = l10n.dailyFortuneHeadline(faceVibe, topKey, bottomKey);

    String mid;
    if (topKey == l10n.wealth) {
      final options = [
        l10n.dailyFortuneWealth0,
        l10n.dailyFortuneWealth1,
        l10n.dailyFortuneWealth2,
        l10n.dailyFortuneWealth3,
        l10n.dailyFortuneWealth4,
        l10n.dailyFortuneWealth5,
        l10n.dailyFortuneWealth6,
        l10n.dailyFortuneWealth7,
        l10n.dailyFortuneWealth8,
        l10n.dailyFortuneWealth9,
      ];
      mid = options[toneIndex];
    } else if (topKey == l10n.love) {
      final options = [
        l10n.dailyFortuneLove0,
        l10n.dailyFortuneLove1,
        l10n.dailyFortuneLove2,
        l10n.dailyFortuneLove3,
        l10n.dailyFortuneLove4,
        l10n.dailyFortuneLove5,
        l10n.dailyFortuneLove6,
        l10n.dailyFortuneLove7,
        l10n.dailyFortuneLove8,
        l10n.dailyFortuneLove9,
      ];
      mid = options[toneIndex];
    } else if (topKey == l10n.career) {
      final options = [
        l10n.dailyFortuneCareer0,
        l10n.dailyFortuneCareer1,
        l10n.dailyFortuneCareer2,
        l10n.dailyFortuneCareer3,
        l10n.dailyFortuneCareer4,
        l10n.dailyFortuneCareer5,
        l10n.dailyFortuneCareer6,
        l10n.dailyFortuneCareer7,
        l10n.dailyFortuneCareer8,
        l10n.dailyFortuneCareer9,
      ];
      mid = options[toneIndex];
    } else {
      final options = [
        l10n.dailyFortuneHealth0,
        l10n.dailyFortuneHealth1,
        l10n.dailyFortuneHealth2,
        l10n.dailyFortuneHealth3,
        l10n.dailyFortuneHealth4,
        l10n.dailyFortuneHealth5,
        l10n.dailyFortuneHealth6,
        l10n.dailyFortuneHealth7,
        l10n.dailyFortuneHealth8,
        l10n.dailyFortuneHealth9,
      ];
      mid = options[toneIndex];
    }

    String tip;
    if (bottomKey == l10n.wealth) {
      final options = [
        l10n.dailyFortuneTipWealth0,
        l10n.dailyFortuneTipWealth1,
        l10n.dailyFortuneTipWealth2,
        l10n.dailyFortuneTipWealth3,
        l10n.dailyFortuneTipWealth4,
        l10n.dailyFortuneTipWealth5,
        l10n.dailyFortuneTipWealth6,
        l10n.dailyFortuneTipWealth7,
        l10n.dailyFortuneTipWealth8,
        l10n.dailyFortuneTipWealth9,
      ];
      tip = options[tipIndex];
    } else if (bottomKey == l10n.love) {
      final options = [
        l10n.dailyFortuneTipLove0,
        l10n.dailyFortuneTipLove1,
        l10n.dailyFortuneTipLove2,
        l10n.dailyFortuneTipLove3,
        l10n.dailyFortuneTipLove4,
        l10n.dailyFortuneTipLove5,
        l10n.dailyFortuneTipLove6,
        l10n.dailyFortuneTipLove7,
        l10n.dailyFortuneTipLove8,
        l10n.dailyFortuneTipLove9,
      ];
      tip = options[tipIndex];
    } else if (bottomKey == l10n.career) {
      final options = [
        l10n.dailyFortuneTipCareer0,
        l10n.dailyFortuneTipCareer1,
        l10n.dailyFortuneTipCareer2,
        l10n.dailyFortuneTipCareer3,
        l10n.dailyFortuneTipCareer4,
        l10n.dailyFortuneTipCareer5,
        l10n.dailyFortuneTipCareer6,
        l10n.dailyFortuneTipCareer7,
        l10n.dailyFortuneTipCareer8,
        l10n.dailyFortuneTipCareer9,
      ];
      tip = options[tipIndex];
    } else {
      final options = [
        l10n.dailyFortuneTipHealth0,
        l10n.dailyFortuneTipHealth1,
        l10n.dailyFortuneTipHealth2,
        l10n.dailyFortuneTipHealth3,
        l10n.dailyFortuneTipHealth4,
        l10n.dailyFortuneTipHealth5,
        l10n.dailyFortuneTipHealth6,
        l10n.dailyFortuneTipHealth7,
        l10n.dailyFortuneTipHealth8,
        l10n.dailyFortuneTipHealth9,
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

  int _faceShapeWealthBias(BuildContext context, String faceShape) {
    final l10n = AppLocalizations.of(context)!;
    if (faceShape == l10n.faceShapeSquare) return 2;
    return 0;
  }

  int _faceShapeLoveBias(BuildContext context, String faceShape) {
    final l10n = AppLocalizations.of(context)!;
    if (faceShape == l10n.faceShapeRound) return 2;
    return 0;
  }

  int _faceShapeCareerBias(BuildContext context, String faceShape) {
    final l10n = AppLocalizations.of(context)!;
    if (faceShape == l10n.faceShapeLong || faceShape == l10n.faceShapeVLine) return 2;
    return 0;
  }

  String _faceShapeLabel(BuildContext context, FaceAnalysisMetrics analysis) {
    final l10n = AppLocalizations.of(context)!;
    final aspect = analysis.faceAspectRatio;
    final jawToCheek = analysis.jawToCheekRatio;
    
    // jawToCheekRatio: 턱 너비 / 광대 너비
    // 0.82 미만: 턱이 매우 좁음 (V라인)
    if (jawToCheek != null && jawToCheek < 0.82) return l10n.faceShapeVLine;
    
    // 0.94 이상: 턱과 광대 너비가 비슷함 (각진형/사각형)
    if (jawToCheek != null && jawToCheek > 0.94) return l10n.faceShapeSquare;
    
    // aspect ratio: 너비 / 높이
    if (aspect == null) return l10n.faceShapeBalanced;
    
    // 0.88 이상: 가로 너비가 넓음 (둥근형)
    if (aspect >= 0.88) return l10n.faceShapeRound;
    
    // 0.75 이하: 세로가 매우 김 (긴형)
    if (aspect <= 0.75) return l10n.faceShapeLong;
    
    return l10n.faceShapeOval;
  }

  String _titleFromScores(BuildContext context, {
    required int wealth,
    required int love,
    required int career,
    required int health,
  }) {
    final l10n = AppLocalizations.of(context)!;
    final scores = {
      l10n.wealth: wealth,
      l10n.love: love,
      l10n.career: career,
      l10n.health: health,
    };
    
    final sorted = scores.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topType = sorted.first.key;
    
    if (topType == l10n.wealth) return l10n.titleWealthOriented;
    if (topType == l10n.love) return l10n.titleLoveStrong;
    if (topType == l10n.career) return l10n.titleCareerNotable;
    return l10n.titleStableEnergy;
  }

  String _eyeAnalysisText(BuildContext context, {required double eyeOpen, required double yawAbs, required double rollAbs, required double smile}) {
    final l10n = AppLocalizations.of(context)!;
    // 1. 눈의 크기/뜸 정도에 따른 기본 성향 (Physiognomy)
    String eyeTypeDesc;
    if (eyeOpen >= 0.65) {
      eyeTypeDesc = l10n.eyeAnalysisTypeSharp;
    } else if (eyeOpen <= 0.35) {
      eyeTypeDesc = l10n.eyeAnalysisTypeDeep;
    } else {
      eyeTypeDesc = l10n.eyeAnalysisTypeBalanced;
    }

    // 2. 표정(웃음)과의 조화 (Dynamic Expression)
    String expressionDesc;
    if (smile >= 0.6) {
      if (eyeOpen >= 0.55) {
        expressionDesc = l10n.eyeExpressionBright;
      } else {
        expressionDesc = l10n.eyeExpressionGentle;
      }
    } else {
      if (eyeOpen >= 0.55) {
        expressionDesc = l10n.eyeExpressionStrong;
      } else {
        expressionDesc = l10n.eyeExpressionSteady;
      }
    }

    // 3. 자세(고개 각도)에 따른 조언
    String postureAdvice;
    if (yawAbs > 15 || rollAbs > 12) {
      postureAdvice = l10n.eyePostureTilt;
    } else {
      postureAdvice = l10n.eyePostureStraight;
    }

    return "$eyeTypeDesc $expressionDesc $postureAdvice";
  }

  String _noseAnalysisText(BuildContext context, {required double? noseWidth, required double? noseLength}) {
    final l10n = AppLocalizations.of(context)!;
    if (noseWidth == null && noseLength == null) {
      return l10n.noseInsufficient;
    }
    final w = (noseWidth ?? 0.25);
    final l = (noseLength ?? 0.30);
    
    String noseDesc;
    if (w >= 0.28 && l >= 0.33) {
      noseDesc = l10n.noseWealthRich;
    } else if (w <= 0.22) {
      noseDesc = l10n.noseWealthPlanner;
    } else {
      noseDesc = l10n.noseWealthBalanced;
    }

    return noseDesc;
  }

  String _mouthAnalysisText(BuildContext context, {required double mouthOpen, required double smile}) {
    final l10n = AppLocalizations.of(context)!;
    String mouthDesc;
    if (mouthOpen < 0.03) {
      if (smile >= 0.55) {
         mouthDesc = l10n.mouthExpressionBlessing;
      } else {
         mouthDesc = l10n.mouthExpressionReliable;
      }
    } else {
      if (smile >= 0.55) {
         mouthDesc = l10n.mouthExpressionLucky;
      } else {
         mouthDesc = l10n.mouthExpressionOpen;
      }
    }
    return mouthDesc;
  }

  String _overallAnalysisText(
    BuildContext context, {
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
    final l10n = AppLocalizations.of(context)!;
    final headline = l10n.overallHeadlineSimple(topKey, bottomKey);

    String vibeDesc;
    if (topKey == l10n.wealth) {
      vibeDesc = (noseWidth ?? 0.25) >= 0.28 
          ? l10n.overallVibeWealthRich
          : l10n.overallVibeWealthSteady;
    } else if (topKey == l10n.love) {
      vibeDesc = smile >= 0.5 
          ? l10n.overallVibeLoveCharisma
          : l10n.overallVibeLoveTrust;
    } else if (topKey == l10n.career) {
      vibeDesc = eyeOpen >= 0.55
          ? l10n.overallVibeCareerSmart
          : l10n.overallVibeCareerSteady;
    } else { // 건강
      vibeDesc = l10n.overallVibeHealth;
    }

    // 3. 행동 가이드
    String actionDesc;
    if (mouthOpen < 0.05) {
      actionDesc = l10n.overallActionPrudent;
    } else {
      actionDesc = l10n.overallActionConfident;
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
            padding: const EdgeInsets.only(bottom: 14.0), // 헤드라인 아래 간격 약간 확대
            child: Text(
              line,
              style: baseStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: isWarning ? warningColor : accentColor,
                fontSize: baseStyle.fontSize! + 0.5, // 너무 크게 차이나지 않게 조정 (기존 1 -> 0.5)
                height: 1.4,
              ),
            ),
          ),
        );
      } else {
        // 2. 나머지 문장들은 핵심 단어만 '굵게' 표시
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0), // 줄 간격 일관성 있게 조정
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
    // 강조할 핵심 단어 목록 (관상 관련 키워드 추가)
    final boldRegex = RegExp(r'(재물|금전|지출|구독|결제|계약|정리|투자|인연|대인|소통|연락|약속|말투|오해|직업|내일|지금|일|결정|성과|집중|우선순위|마감|건강|휴식|수면|컨디션|무리|산책|스트레칭|행운|기회|좋은|조심|주의|경계|실수|눈빛|미소|입매|콧망울|안색|기운|활력|총기|재백궁|도화|복|신뢰|카리스마)');
    
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
        // 띄어쓰기 유지를 위해 trim하지 않고 원문 그대로 사용
        spans.add(TextSpan(text: line.substring(index, start), style: baseStyle));
      }

      final matchText = match.group(0) ?? '';
      spans.add(TextSpan(
        text: matchText, 
        style: baseStyle.copyWith(
          fontWeight: FontWeight.bold, 
          color: Colors.black.withOpacity(0.9), // 약간 더 진하게
        ),
      ));
      index = start + matchText.length;
    }

    return Text.rich(
      TextSpan(children: spans),
      style: baseStyle,
      softWrap: true,
    );
  }

  String _adviceText(BuildContext context, {required int wealth, required int love, required int career, required int health}) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final daySeed = now.day + now.month + now.year;
    final index = daySeed % 3;

    final scores = {
      l10n.wealth: wealth,
      l10n.love: love,
      l10n.career: career,
      l10n.health: health,
    };
    final sorted = scores.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topKey = sorted.first.key;

    if (topKey == l10n.wealth) {
      return [l10n.adviceWealth0, l10n.adviceWealth1, l10n.adviceWealth2][index];
    } else if (topKey == l10n.love) {
      return [l10n.adviceLove0, l10n.adviceLove1, l10n.adviceLove2][index];
    } else if (topKey == l10n.career) {
      return [l10n.adviceCareer0, l10n.adviceCareer1, l10n.adviceCareer2][index];
    } else {
      return [l10n.adviceHealth0, l10n.adviceHealth1, l10n.adviceHealth2][index];
    }
  }

  Future<void> _unlockWithAd() async {
    final l10n = AppLocalizations.of(context)!;
    final granted = await showRewardedAd(() {
      setState(() {
        _isLocked = false;
      });
    });

    if (!mounted) return;
    if (granted) return;

    if (!lastRewardedAdHadTechnicalFailure) return;

    setState(() {
      _isLocked = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.adLoadFailFreeAccess),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _unlockWithCookies() async {
    final l10n = AppLocalizations.of(context)!;
    final count = await _localCookieService.getCookieCount();
    if (!mounted) return;

    if (count < 2) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(l10n.insufficientCookiesTitle, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          content: Text(
            l10n.insufficientCookiesMessage,
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.confirm, style: const TextStyle(color: Colors.amber)),
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
        SnackBar(content: Text(l10n.useCookiesSnackbar)),
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
    final l10n = AppLocalizations.of(context)!;
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
          Text(
            l10n.faceAnalysisComplete,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.chooseMethodToViewResult,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          
          // Ad Button
          if (!AdService.isSubscriber)
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
                label: Flexible(
                  child: Text(
                    l10n.watchAdForFree,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          
          if (!AdService.isSubscriber)
            const SizedBox(height: 16),
          
          // Cookie Button
          if (!AdService.isSubscriber)
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
                label: Flexible(
                  child: Text(
                    l10n.useTwoCookies,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),

          if (AdService.isSubscriber)
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => setState(() => _isLocked = false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  l10n.viewResult,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAnalyzingView() {
    final l10n = AppLocalizations.of(context)!;
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
          Text(
            l10n.aiAnalyzingFace,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCheckItem(l10n.faceRecognitionComplete, true),
              _buildCheckItem(l10n.extractingFeatures, true),
              _buildCheckItem(l10n.matchingFortuneData, false),
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
          Flexible(
            child: Text(
              text, 
              style: const TextStyle(color: Colors.black54, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultView() {
    final l10n = AppLocalizations.of(context)!;
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
            Text(
              l10n.todaysFaceAnalysis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1.2),
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
                  l10n.totalScoreWithPoints(_result.totalScore),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(height: 36),
            
            // 4대 운세 그래프
            _buildLuckBar(l10n.wealthLuck, _result.wealthScore, Colors.amber),
            _buildLuckBar(l10n.loveLuck, _result.loveScore, Colors.pinkAccent),
            _buildLuckBar(l10n.careerLuck, _result.careerScore, Colors.blueAccent),
            _buildLuckBar(l10n.healthLuck, _result.healthScore, Colors.green),
            
            const SizedBox(height: 32),
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
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
                      Text(
                        l10n.todaysFaceFortune,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
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

            const SizedBox(height: 24),
            // 결과 화면 네이티브 광고 추가 (수익화 강화)
            const DetailedAdWidget(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            ),
            const SizedBox(height: 32),

            Text(
              l10n.detailedAnalysis,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 14),
            _buildFeatureItem(l10n.eyeInsight, _result.eyeAnalysis),
            _buildFeatureItem(l10n.noseWealth, _result.noseAnalysis),
            _buildFeatureItem(l10n.mouthLateLuck, _result.mouthAnalysis),

            const SizedBox(height: 32),
            Text(
              l10n.overallAnalysisTitle,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black87),
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
                        l10n.todaysAdvice,
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
            SafeArea(
              top: false,
              child: Column(
                children: [
                  // 공유하기 버튼 추가
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        SharingService.showShareOptions(
                          context: context,
                          title: l10n.shareResultTitle,
                          description: l10n.shareResultDesc(_result.title),
                          results: {
                            l10n.shareResultTotalScore: l10n.totalScoreWithPoints(_result.totalScore),
                            l10n.shareResultWealth: '${_result.wealthScore}',
                            l10n.shareResultLove: '${_result.loveScore}',
                            l10n.shareResultCareer: '${_result.careerScore}',
                            l10n.shareResultHealth: '${_result.healthScore}',
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEE500),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.share, size: 20),
                          const SizedBox(width: 10),
                          Text(l10n.shareResultText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                      child: Text(
                        widget.alarmId != null ? l10n.wakeUpComplete : l10n.confirm,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
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
          SizedBox(
            width: 80, 
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                label, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
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
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label, 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16, 
                      color: Colors.black87,
                    ),
                  ),
                ),
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
