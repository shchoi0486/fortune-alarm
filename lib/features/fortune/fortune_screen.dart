import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../providers/saju_provider.dart';
import 'generic_fortune_screen.dart';
import 'fortune_mission_screen.dart';
import 'lotto_screen.dart';
import 'saju/widgets/new_year_fortune_input_screen.dart';
import 'saju/widgets/saju_profile_screen.dart';
import 'saju/widgets/compatibility_input_screen.dart';
import 'tojeong/tojeong_input_screen.dart';
import 'dart:math';
import 'package:fortune_alarm/services/cookie_service.dart';
import 'package:fortune_alarm/widgets/ad_widgets.dart';
import 'mixins/fortune_access_mixin.dart';

import 'dream/dream_interpretation_screen.dart';
import '../mission_face/face_detection_mission_screen.dart';

class FortuneScreen extends ConsumerStatefulWidget {
  const FortuneScreen({super.key});

  @override
  ConsumerState<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends ConsumerState<FortuneScreen> with FortuneAccessMixin {
  Box? _fortuneBox;
  // _cookieService is also in mixin but private there, so we keep this one for local usage
  final CookieService _localCookieService = CookieService();

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  @override
  void dispose() {
    // Mixin's dispose calls _rewardedAd.dispose() automatically
    super.dispose();
  }

  // Removed _loadRewardedAd, _showRewardedAd, _handleFortuneAccess as they are in mixin


  Future<void> _initHive() async {
    if (Hive.isBoxOpen('fortune')) {
      _fortuneBox = Hive.box('fortune');
    } else {
      _fortuneBox = await Hive.openBox('fortune');
    }
    if (mounted) setState(() {});
  }

  String _getZodiacAnimal(DateTime? birthDate) {
    if (birthDate == null) return 'assets/icon/fortuni1_trans.webp';
    final animals = ['🐭', '🐮', '🐯', '🐰', '🐲', '🐍', '🐴', '🐑', '🐵', '🐔', '🐶', '🐷'];
    // 띠 계산 공식: (연도 - 4) % 12
    final index = (birthDate.year - 4) % 12;
    return animals[index];
  }

  Map<String, dynamic> _getDailyLuck(String seed, BuildContext context) {
    final now = DateTime.now();
    // 매일 바뀌도록 날짜와 시드(이름 등)를 조합하여 랜덤 생성기 초기화
    final dateSeed = now.year * 10000 + now.month * 100 + now.day;
    final random = Random(dateSeed + seed.hashCode);

    final colors = [
      {'name': AppLocalizations.of(context)!.luckyColor, 'color': Colors.purple, 'bg': Colors.purple[100]},
      {'name': '보라색', 'color': Colors.purple, 'bg': Colors.purple[100]},
      {'name': '파란색', 'color': Colors.blue, 'bg': Colors.blue[100]},
      {'name': '노란색', 'color': Colors.amber, 'bg': Colors.amber[100]},
      {'name': '빨간색', 'color': Colors.red, 'bg': Colors.red[100]},
      {'name': '초록색', 'color': Colors.green, 'bg': Colors.green[100]},
      {'name': '분홍색', 'color': Colors.pink, 'bg': Colors.pink[100]},
      {'name': '주황색', 'color': Colors.orange, 'bg': Colors.orange[100]},
      {'name': '하얀색', 'color': Colors.grey, 'bg': Colors.grey[200]},
      {'name': '검정색', 'color': Colors.black, 'bg': Colors.grey[300]},
    ];

    final items = ['향수', '손수건', '반지', '시계', '안경', '모자', '책', '이어폰', '거울', '펜', '동전', '열쇠'];
    final directions = ['동쪽', '서쪽', '남쪽', '북쪽', '북동쪽', '남동쪽', '북서쪽', '남서쪽'];

    return {
      'color': colors[random.nextInt(colors.length)],
      'item': items[random.nextInt(items.length)],
      'direction': directions[random.nextInt(directions.length)],
    };
  }



  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;
    final dividerColor = isDarkMode ? Colors.grey[800] : (isDarkMode ? Colors.grey[800] : const Color(0xFFF2F4F6));

    final sajuState = ref.watch(sajuProvider);

    // 데이터 로딩 중일 때 로딩 화면 표시 (잘못된 UI 렌더링 방지)
    if (sajuState.isLoading || _fortuneBox == null) {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: CircularProgressIndicator(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      );
    }

    final isNameMissing = sajuState.mainProfile == null || sajuState.mainProfile!.name.isEmpty;
    final userName = isNameMissing ? "이름을 입력해주세요" : sajuState.mainProfile!.name;
    final zodiacIcon = _getZodiacAnimal(sajuState.mainProfile?.birthDate);
    final dailyLuck = _getDailyLuck(userName, context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            // Custom Header with SafeArea consideration
            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                0, // 공통 간격 4가 main.dart에서 적용되므로 0으로 설정
                20,
                20,
              ),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isNameMissing 
                            ? "이름을 입력해주세요"
                            : AppLocalizations.of(context)!.greeting(
                                userName.length > 2 
                                  ? userName.substring(1) 
                                  : userName
                              ),
                          style: TextStyle(
                            fontSize: isNameMissing ? 22 : 24, // 크기 살짝 조정
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            letterSpacing: -0.5,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalizations.of(context)!.welcomeFortune,
                          style: TextStyle(
                            fontSize: 13,
                            color: subTextColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.selectionClick();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SajuProfileScreen()),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.amber.withOpacity(0.5), width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 28, // 22에서 28로 확대
                            backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                            child: zodiacIcon.startsWith('assets/') 
                              ? ClipOval(
                                  child: Image.asset(
                                    zodiacIcon,
                                    fit: BoxFit.cover,
                                    width: 56, // radius * 2
                                    height: 56,
                                    alignment: const Alignment(0, -0.5), // 약간 위쪽(상반신) 강조
                                  ),
                                )
                              : Text(zodiacIcon, style: const TextStyle(fontSize: 28)), // 이모지도 크게
                          ),
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 오늘의 퀵 운세 섹션
                Row(
                  children: [
                    _buildQuickLuckChip(
                      AppLocalizations.of(context)!.luckyColor, 
                      dailyLuck['color']['name'] as String, 
                      dailyLuck['color']['bg'] as Color, 
                      dailyLuck['color']['color'] as Color, 
                      isDarkMode
                    ),
                    const SizedBox(width: 8),
                    _buildQuickLuckChip(AppLocalizations.of(context)!.luckyItem, dailyLuck['item'] as String, Colors.blue[100]!, Colors.blue, isDarkMode),
                    const SizedBox(width: 8),
                    _buildQuickLuckChip(AppLocalizations.of(context)!.luckyDirection, dailyLuck['direction'] as String, Colors.orange[100]!, Colors.orange, isDarkMode),
                  ],
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4), // 간격 최소화 (16 -> 4)
                  
                  // 메인 추천 카드 (오늘의 운세)
                  _buildFeaturedCard(isDarkMode),
                  
                  const SizedBox(height: 16),

                  // 리스트 네이티브 광고 (알람, 운세, 미션에만 노출)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DetailedAdWidget(),
                  ),

                  const SizedBox(height: 16),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context)!.viewVariousFortunes,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 6),
                  
                  // 운세 그리드 메뉴
                  _buildFortuneGrid(isDarkMode, textColor, subTextColor!),
                  
                  const SizedBox(height: 32),
                  
                  // 추가 콘텐츠
                  _buildExtraContent(textColor, subTextColor),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildQuickLuckChip(String label, String value, Color bgColor, Color textColor, bool isDarkMode) {
    String icon = "";
    if (label.contains("색")) {
      icon = "🎨";
    } else if (label.contains("물건")) icon = "✨";
    else if (label.contains("방향")) icon = "🧭";

    final isWhite = value == "하얀색";

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.05) : bgColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDarkMode 
                ? Colors.white.withOpacity(0.1) 
                : (isWhite ? const Color(0xFFCBD5E1) : bgColor.withOpacity(0.3)),
            width: isWhite ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text(
              label, 
              style: TextStyle(
                fontSize: 11, // 9에서 11로 확대
                fontWeight: FontWeight.bold, // 굵게 변경
                color: isDarkMode ? Colors.white70 : Colors.black87 // 가독성을 위해 색상도 살짝 진하게 조정
              )
            ),
            const SizedBox(height: 1),
            Text(
              value, 
              style: TextStyle(
                fontSize: 12, 
                fontWeight: FontWeight.bold, 
                color: isDarkMode ? Colors.white : textColor.withOpacity(0.9)
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(bool isDarkMode) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 120, // 115에서 120으로 소폭 늘려 오버플로우 해결
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDarkMode ? Colors.grey[800]! : const Color(0xFFE2E8F0),
          width: 1,
        ),
        gradient: LinearGradient(
          colors: isDarkMode 
            ? [const Color(0xFF1E1E1E), const Color(0xFF252525)] // 다크모드 배경색 수정
            : [const Color(0xFFFFFFFF), const Color(0xFFF8FAFC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.mediumImpact();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FortuneMissionScreen()),
            );
          },
          borderRadius: BorderRadius.circular(24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                Positioned(
                  right: -30,
                  top: -30,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          (isDarkMode ? Colors.blue : Colors.amber).withOpacity(0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // 상하 여백 조정
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: (isDarkMode ? Colors.blue : Colors.amber).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: (isDarkMode ? Colors.blue : Colors.amber).withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("✨", style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.blue[300] : Colors.amber[700])),
                            const SizedBox(width: 4),
                            Text(
                              "오늘의 추천",
                              style: TextStyle(
                                color: isDarkMode ? Colors.blue[300] : Colors.amber[700],
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "오늘의 운세 확인",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black87, // 다크모드 텍스트 색상 수정
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "신비로운 별들이 들려주는 오늘의 조언",
                        style: TextStyle(
                          color: isDarkMode ? Colors.grey[400] : Colors.black54, // 다크모드 설명 색상 수정
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 12, // 위치를 조금 더 아래로 조정
                  child: Container(
                    width: 32, // 크기를 살짝 줄여서 여백 확보
                    height: 32,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05), // 화살표 배경 수정
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_forward_ios, size: 12, color: isDarkMode ? Colors.white70 : Colors.black54), // 화살표 색상 수정
                  ),
                ),
                const Positioned(
                  right: 12, // 더 오른쪽으로 밀착
                  top: 10,   // 더 위쪽으로 밀착
                  child: Text("🔮", style: TextStyle(fontSize: 36)), // 크기를 살짝 줄임 (40 -> 36)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSpecificDateFortune(BuildContext context) async {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    DateTime tempDate = DateTime.now().add(const Duration(days: 1));

    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: 240,
            padding: const EdgeInsets.only(top: 6.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isDarkMode ? Colors.white12 : Colors.black12,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          style: TextStyle(
                            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, tempDate),
                        child: Text(
                          AppLocalizations.of(context)!.confirm,
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      brightness: isDarkMode ? Brightness.dark : Brightness.light,
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: tempDate,
                      minimumDate: DateTime.now(),
                      maximumDate: DateTime.now().add(const Duration(days: 365)),
                      itemExtent: 40,
                      onDateTimeChanged: (DateTime newDate) {
                        tempDate = newDate;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (pickedDate == null || !context.mounted) return;

    final dateStr = "${pickedDate.year}년 ${pickedDate.month}월 ${pickedDate.day}일";
    
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("📅", style: TextStyle(fontSize: 40)),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.viewSpecificDateFortune, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text("$dateStr 운세를 보시겠습니까?", textAlign: TextAlign.center),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(AppLocalizations.of(context)!.confirm, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(AppLocalizations.of(context)!.cancel, style: const TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );

    if (confirmed == true && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FortuneMissionScreen(targetDate: pickedDate)),
      );
    }
  }

  Widget _buildFortuneGrid(bool isDarkMode, Color textColor, Color subTextColor) {
    final gridItems = [
      {
        'title': AppLocalizations.of(context)!.luckyNumber,
        'subtitle': AppLocalizations.of(context)!.lottoRecommendation,
        'icon': '🎰',
        'colors': [const Color(0xFFFDC830), const Color(0xFFF37335)],
        'target': 'lotto'
      },
      {
        'title': AppLocalizations.of(context)!.specificDateFortune,
        'subtitle': AppLocalizations.of(context)!.specialDayFortune,
        'icon': '📅',
        'colors': [const Color(0xFF00C6FF), const Color(0xFF0072FF)],
        'target': 'specific_date'
      },
      {
        'title': AppLocalizations.of(context)!.newYearFortune,
        'subtitle': AppLocalizations.of(context)!.totalFortune2026,
        'icon': '🐴',
        'colors': [const Color(0xFFFF416C), const Color(0xFFFF4B2B)],
        'target': 'saju'
      },
      {
        'title': AppLocalizations.of(context)!.traditionalFortune,
        'subtitle': AppLocalizations.of(context)!.traditionalSaju,
        'icon': '📜',
        'colors': [const Color(0xFF11998e), const Color(0xFF38ef7d)],
        'target': 'tojeong'
      },
      {
        'title': AppLocalizations.of(context)!.faceReading,
        'subtitle': AppLocalizations.of(context)!.faceFate,
        'icon': '🧿',
        'colors': [const Color(0xFF8E2DE2), const Color(0xFF4A00E0)],
        'target': 'face'
      },
      {
        'title': AppLocalizations.of(context)!.compatibility,
        'subtitle': AppLocalizations.of(context)!.relationshipHarmony,
        'icon': '💖',
        'colors': [const Color(0xFFFF5F6D), const Color(0xFFFFC371)],
        'target': 'compatibility'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.15,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          final colors = item['colors'] as List<Color>;
          
          return Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[200]!,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDarkMode ? 0.15 : 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  HapticFeedback.selectionClick();
                  
                  if (item['target'] == 'specific_date') {
                    _handleSpecificDateFortune(context);
                  } else if (item['target'] == 'lotto') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LottoScreen()));
                  } else if (item['target'] == 'saju') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewYearFortuneInputScreen()));
                  } else if (item['target'] == 'tojeong') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TojeongInputScreen()));
                  } else if (item['target'] == 'face') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaceDetectionMissionScreen()));
                  } else if (item['target'] == 'compatibility') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CompatibilityInputScreen()));
                  } else if (item['target'] == 'dream') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DreamInterpretationScreen()));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GenericFortuneScreen(title: item['title'] as String)));
                  }
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: colors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: colors[0].withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            item['icon'] as String,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['title'] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExtraContent(Color textColor, Color subTextColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.amber, Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "내일을 위한 준비",
                style: TextStyle(
                  color: subTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "더 많은 행운을 만나는 방법",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 18),
          _buildListItem("💭", "꿈해몽 분석", "꿈에 담긴 신비로운 의미 풀이", textColor, subTextColor, target: 'dream'),
        ],
      ),
    );
  }

  Widget _buildListItem(String emoji, String title, String subtitle, Color textColor, Color subTextColor, {String? target}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.12) : const Color(0xFFE2E8F0),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            if (target == 'dream') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DreamInterpretationScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GenericFortuneScreen(title: title)),
              );
            }
          },
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800]!.withOpacity(0.5) : Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 24)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: subTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: subTextColor.withOpacity(0.5),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
