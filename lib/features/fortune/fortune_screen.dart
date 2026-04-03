import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../providers/saju_provider.dart';
import '../../providers/theme_provider.dart';
import 'generic_fortune_screen.dart';
import 'fortune_mission_screen.dart';
import 'lucky_number_screen.dart';
import 'saju/widgets/new_year_fortune_input_screen.dart';
import 'saju/widgets/saju_profile_screen.dart';
import 'saju/widgets/compatibility_input_screen.dart';
import 'tojeong/tojeong_input_screen.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/services/cookie_service.dart';
import '../../services/user_activity_service.dart';
import 'package:fortune_alarm/widgets/ad_widgets.dart';
import 'mixins/fortune_access_mixin.dart';

import '../mission_face/face_detection_mission_screen.dart';

class FortuneScreen extends ConsumerStatefulWidget {
  const FortuneScreen({super.key});

  @override
  ConsumerState<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends ConsumerState<FortuneScreen> with FortuneAccessMixin {
  Box? _fortuneBox;
  Color get primaryColor => ref.watch(themeProvider).primaryColor;
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
    // Zodiac calculation formula: (Year - 4) % 12
    final index = (birthDate.year - 4) % 12;
    return animals[index];
  }

  Map<String, dynamic> _getDailyLuck(String seed, BuildContext context) {
    final now = DateTime.now();
    final l10n = AppLocalizations.of(context)!;
    // Initialize random generator combining date and seed (name, etc.) to change daily
    final dateSeed = now.year * 10000 + now.month * 100 + now.day;
    final random = Random(dateSeed + seed.hashCode);

    final colors = [
      {'name': l10n.colorPurple, 'color': Colors.purple, 'bg': Colors.purple[100]},
      {'name': l10n.colorBlue, 'color': Colors.blue, 'bg': Colors.blue[100]},
      {'name': l10n.colorYellow, 'color': Colors.amber, 'bg': Colors.amber[100]},
      {'name': l10n.colorRed, 'color': Colors.red, 'bg': Colors.red[100]},
      {'name': l10n.colorGreen, 'color': Colors.green, 'bg': Colors.green[100]},
      {'name': l10n.colorPink, 'color': Colors.pink, 'bg': Colors.pink[100]},
      {'name': l10n.colorOrange, 'color': primaryColor, 'bg': primaryColor.withOpacity(0.1)},
      {'name': l10n.colorWhite, 'color': Colors.grey, 'bg': Colors.grey[200]},
      {'name': l10n.colorBlack, 'color': Colors.black, 'bg': Colors.grey[300]},
    ];

    final items = [
      l10n.itemPerfume, l10n.itemHandkerchief, l10n.itemRing, l10n.itemWatch, 
      l10n.itemGlasses, l10n.itemHat, l10n.itemBook, l10n.itemEarphones, 
      l10n.itemMirror, l10n.itemPen, l10n.itemCoin, l10n.itemKey
    ];
    
    final directions = [
      l10n.dirEast, l10n.dirWest, l10n.dirSouth, l10n.dirNorth, 
      l10n.dirNorthEast, l10n.dirSouthEast, l10n.dirNorthWest, l10n.dirSouthWest
    ];

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
    final cardColor = isDarkMode ? const Color(0xFF1C1C1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;
    final dividerColor = isDarkMode ? Colors.grey[800] : const Color(0xFFF2F4F6);

    final sajuState = ref.watch(sajuProvider);

    // 데이터 로딩 중일 때 로딩 화면 표시 (잘못된 UI 렌더링 방지)
    if (sajuState.isLoading || _fortuneBox == null) {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      );
    }

    final isNameMissing = sajuState.mainProfile == null || sajuState.mainProfile!.name.isEmpty;
    final l10n = AppLocalizations.of(context)!;
    final userName = isNameMissing ? l10n.enterName : sajuState.mainProfile!.name;
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
                12, // 20에서 12로 축소
              ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
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
                            ? l10n.enterName
                            : l10n.greeting(userName),
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
                            border: Border.all(color: primaryColor.withOpacity(0.5), width: 2),
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
                      dailyLuck['color']['color'] as Color, 
                      dailyLuck['color']['color'] as Color, 
                      isDarkMode
                    ),
                    const SizedBox(width: 8),
                    _buildQuickLuckChip(AppLocalizations.of(context)!.luckyItem, dailyLuck['item'] as String, isDarkMode ? Colors.white70 : Colors.blueGrey, isDarkMode ? Colors.white : Colors.black87, isDarkMode),
                    const SizedBox(width: 8),
                    _buildQuickLuckChip(AppLocalizations.of(context)!.luckyDirection, dailyLuck['direction'] as String, isDarkMode ? Colors.white70 : Colors.blueGrey, isDarkMode ? Colors.white : Colors.black87, isDarkMode),
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
                  const SizedBox(height: 12), // 4에서 12로 증대하여 상단 헤더와의 간격 확보
                  
                  // 메인 추천 카드 (오늘의 운세)
                  _buildFeaturedCard(isDarkMode),
                  
                  const SizedBox(height: 12), // 10에서 12로 증대하여 상단 카드와의 간격 통일

                  // Native Ad (Top) - Removed and moved to bottom of MainScreen
                  
                  const SizedBox(height: 12), // 10에서 12로 증대하여 하단 텍스트와의 간격 통일
                  
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
                  
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildQuickLuckChip(String label, String value, Color accentColor, Color textColor, bool isDarkMode) {
    final l10n = AppLocalizations.of(context)!;
    String icon = "";
    if (label == l10n.luckyColor) {
      icon = "🎨";
    } else if (label == l10n.luckyItem) {
      icon = "✨";
    } else if (label == l10n.luckyDirection) {
      icon = "🧭";
    }

    final isWhite = value == l10n.colorWhite;
    // 배경색을 흰색(라이트) 또는 짙은회색(다크)으로 통일
    final chipBgColor = isDarkMode ? const Color(0xFF1C1C1E) : Colors.white;
    final borderColor = isDarkMode 
        ? Colors.white.withOpacity(0.08) 
        : (isWhite ? const Color(0xFFE2E8F0) : accentColor.withOpacity(0.15));

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          color: chipBgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          children: [
            // 아이콘 배경
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.05) : accentColor.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
              child: Text(icon, style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 10),
            Text(
              label, 
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white54 : Colors.black54,
                letterSpacing: -0.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              value, 
              style: TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.bold, 
                color: isDarkMode ? Colors.white : textColor.withOpacity(0.85),
                letterSpacing: -0.3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(bool isDarkMode) {
    final l10n = AppLocalizations.of(context)!;
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
            ? [const Color(0xFF1C1C1E), const Color(0xFF252525)] // 다크모드 배경색 수정
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
            UserActivityService.recordFortuneView();
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
                          primaryColor.withOpacity(0.1),
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
                          color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("✨", style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white70 : Colors.black54)),
                            const SizedBox(width: 4),
                            Text(
                              l10n.todaysRecommendation,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white70 : Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        l10n.checkTodaysFortune,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black87, // 다크모드 텍스트 색상 수정
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.todaysAdvice,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          style: TextStyle(
                            color: primaryColor,
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

    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final dateStr = DateFormat.yMd(locale).format(pickedDate);
    
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
            Text(l10n.viewSpecificDateFortune, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(l10n.fortuneDateConfirm(dateStr), textAlign: TextAlign.center),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: primaryColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(l10n.confirm, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l10n.cancel, style: const TextStyle(color: Colors.grey)),
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
    final l10n = AppLocalizations.of(context)!;
    final gridItems = [
      {
        'title': l10n.luckyNumber,
        'subtitle': l10n.luckyNumberRecommendation,
        'icon': '🎰',
        'colors': [const Color(0xFFFDC830), const Color(0xFFF37335)],
        'target': 'luckyNumber'
      },
      {
        'title': l10n.specificDateFortune,
        'subtitle': l10n.specialDayFortune,
        'icon': '📅',
        'colors': [const Color(0xFF00C6FF), const Color(0xFF0072FF)],
        'target': 'specific_date'
      },
      {
        'title': l10n.newYearFortune,
        'subtitle': l10n.totalFortune2026,
        'icon': '🐴',
        'colors': [const Color(0xFFFF416C), const Color(0xFFFF4B2B)],
        'target': 'saju'
      },
      {
        'title': l10n.traditionalFortune,
        'subtitle': l10n.traditionalSaju,
        'icon': '📜',
        'colors': [const Color(0xFF11998e), const Color(0xFF38ef7d)],
        'target': 'tojeong'
      },
      {
        'title': l10n.faceReading,
        'subtitle': l10n.faceFate,
        'icon': '🧿',
        'colors': [const Color(0xFF8E2DE2), const Color(0xFF4A00E0)],
        'target': 'face'
      },
      {
        'title': l10n.compatibility,
        'subtitle': l10n.relationshipHarmony,
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
          childAspectRatio: 1.25, // 0.95에서 1.25로 변경하여 눌린 직사각형 형태 생성
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          final colors = item['colors'] as List<Color>;
          
          return Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF1C1C1E) : Colors.white,
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
                  UserActivityService.recordFortuneView();
                  
                  if (item['target'] == 'specific_date') {
                    _handleSpecificDateFortune(context);
                  } else if (item['target'] == 'luckyNumber') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LuckyNumberScreen()));
                  } else if (item['target'] == 'saju') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewYearFortuneInputScreen()));
                  } else if (item['target'] == 'tojeong') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TojeongInputScreen()));
                  } else if (item['target'] == 'face') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaceDetectionMissionScreen()));
                  } else if (item['target'] == 'compatibility') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CompatibilityInputScreen()));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GenericFortuneScreen(title: item['title'] as String)));
                  }
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2), // 4에서 2로 축소
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 34, // 40에서 34로 축소
                        height: 34, // 40에서 34로 축소
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: colors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8), // 10에서 8로 조정
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
                            style: const TextStyle(fontSize: 18), // 22에서 18로 축소
                          ),
                        ),
                      ),
                      const SizedBox(height: 4), // 6에서 4로 조정
                      Text(
                        item['title'] as String,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11, // 12에서 11로 소폭 축소
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          letterSpacing: -0.5,
                          height: 1.0, // 줄 간격 최소화
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
    final l10n = AppLocalizations.of(context)!;
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
                  gradient: LinearGradient(
                    colors: [primaryColor.withOpacity(0.7), primaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                l10n.preparationForTomorrow,
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
            l10n.howToMeetMoreLuck,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 18),
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
            UserActivityService.recordFortuneView();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenericFortuneScreen(title: title)),
            );
          },
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
