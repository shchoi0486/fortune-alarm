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
import '../../services/ad_service.dart';
import '../../services/user_activity_service.dart';
import '../../widgets/ad_banner_widget.dart';
import 'mixins/fortune_access_mixin.dart';

import '../mission_face/face_detection_mission_screen.dart';

class FortuneScreen extends ConsumerStatefulWidget {
  const FortuneScreen({super.key});

  @override
  ConsumerState<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends ConsumerState<FortuneScreen> with FortuneAccessMixin {
  Box? _fortuneBox;
  final Set<String> _revealedChips = {}; // 공개된 칩 카테고리 저장
  bool _isAdShowing = false; // 광고 표시 중 중복 클릭 방지
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
    super.dispose();
  }

  // Removed _loadRewardedAd, _showRewardedAd, _handleFortuneAccess as they are in mixin


  Future<void> _initHive() async {
    if (Hive.isBoxOpen('fortune')) {
      _fortuneBox = Hive.box('fortune');
    } else {
      _fortuneBox = await Hive.openBox('fortune');
    }
    
    if (_fortuneBox != null) {
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final savedDate = _fortuneBox!.get('revealedDate');
      
      if (savedDate != today) {
        // 날짜가 지났으면 모든 일일 데이터 초기화
        await _fortuneBox!.delete('revealedChips');
        await _fortuneBox!.delete('dailyLuckIndices'); // 기존 indices도 삭제
        await _fortuneBox!.put('revealedDate', today);
      } else {
        final savedChips = _fortuneBox!.get('revealedChips', defaultValue: <String>[]);
        if (savedChips is List) {
          _revealedChips.addAll(savedChips.cast<String>());
        }
      }
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
    final today = DateFormat('yyyy-MM-dd').format(now);
    
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

    int colorIdx, itemIdx, dirIdx;

    // 캐시 확인: 오늘 이미 생성된 행운 정보가 있으면 그것을 사용
    // dailyLuckIndices와 revealedDate가 일치할 때만 캐시를 사용하도록 보강
    final cachedLuck = _fortuneBox?.get('dailyLuckIndices');
    final cachedDate = _fortuneBox?.get('revealedDate');

    if (cachedLuck != null && cachedDate == today) {
      colorIdx = cachedLuck['colorIdx'] ?? 0;
      itemIdx = cachedLuck['itemIdx'] ?? 0;
      dirIdx = cachedLuck['dirIdx'] ?? 0;
    } else {
      // 새로운 행운 정보 생성
      // dateSeed는 당일 내내 동일
      final dateSeed = now.year * 10000 + now.month * 100 + now.day;
      // 처음 생성되는 시점의 seed(이름 등)를 기반으로 랜덤성 부여
      final random = Random(dateSeed + seed.hashCode);
      
      colorIdx = random.nextInt(colors.length);
      itemIdx = random.nextInt(items.length);
      dirIdx = random.nextInt(directions.length);
      
      // 캐시에 즉시 저장하여 당일 내 다른 시점(이름 변경 등)에서도 동일 결과 유지
      if (_fortuneBox != null) {
        _fortuneBox!.put('dailyLuckIndices', {
          'colorIdx': colorIdx,
          'itemIdx': itemIdx,
          'dirIdx': dirIdx,
        });
        _fortuneBox!.put('revealedDate', today);
      }
    }

    return {
      'color': colors[colorIdx % colors.length],
      'item': items[itemIdx % items.length],
      'direction': directions[dirIdx % directions.length],
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
    
    // 언어 변경 시에도 결과가 유지되도록 고정된 seed 사용
    final seed = isNameMissing ? "GuestUser" : sajuState.mainProfile!.name;
    final userName = isNameMissing ? l10n.enterName : sajuState.mainProfile!.name;
    
    final zodiacIcon = _getZodiacAnimal(sajuState.mainProfile?.birthDate);
    final dailyLuck = _getDailyLuck(seed, context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          color: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Custom Header (Standardized)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "🔮",
                            style: TextStyle(fontSize: 22, height: 1.0),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          l10n.fortune,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.fromLTRB(2, 4, 0, 4),
                      constraints: const BoxConstraints(),
                      icon: Icon(Icons.person_outline_rounded, color: textColor, size: 28),
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SajuProfileScreen()),
                        );
                      },
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
                      // Sub Header with Greeting and Quick Luck
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 16), // 좌우 패딩을 20->4로 줄임 (부모 컨테이너가 16px 마진을 가짐)
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      HapticFeedback.selectionClick();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SajuProfileScreen()),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          isNameMissing 
                                            ? l10n.defaultFortuneGreeting
                                            : l10n.greeting(userName),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: textColor,
                                            letterSpacing: -0.5,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        if (isNameMissing)
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: primaryColor.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.add_circle_outline_rounded, size: 14, color: primaryColor),
                                                const SizedBox(width: 6),
                                                Text(
                                                  l10n.registerProfile,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        else
                                          Text(
                                            l10n.welcomeFortune,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: subTextColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                GestureDetector(
                                  onTap: () {
                                    HapticFeedback.selectionClick();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SajuProfileScreen()),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                                    child: zodiacIcon.startsWith('assets/') 
                                      ? ClipOval(
                                          child: Image.asset(
                                            zodiacIcon,
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                            alignment: const Alignment(0, -0.5),
                                          ),
                                        )
                                      : Text(zodiacIcon, style: const TextStyle(fontSize: 30)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _buildQuickLuckChip(
                                  "lucky_color",
                                  l10n.luckyColor, 
                                  dailyLuck['color']['name'] as String, 
                                  dailyLuck['color']['color'] as Color, 
                                  dailyLuck['color']['color'] as Color, 
                                  isDarkMode
                                ),
                                const SizedBox(width: 8),
                                _buildQuickLuckChip("lucky_item", l10n.luckyItem, dailyLuck['item'] as String, isDarkMode ? Colors.white70 : Colors.blueGrey, isDarkMode ? Colors.white : Colors.black87, isDarkMode),
                                const SizedBox(width: 8),
                                _buildQuickLuckChip("lucky_direction", l10n.luckyDirection, dailyLuck['direction'] as String, isDarkMode ? Colors.white70 : Colors.blueGrey, isDarkMode ? Colors.white : Colors.black87, isDarkMode),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 4),
                  
                  // 메인 추천 카드 (오늘의 운세)
                  _buildFeaturedCard(isDarkMode),
                  
                  const SizedBox(height: 12),

                  // 배너 광고 (카드 스타일)
                  const AdBannerWidget(
                    useCardStyle: true,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
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
                  
                  const SizedBox(height: 24),
                  _buildExtraContent(textColor, subTextColor!),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
}

  void _handleRevealChip(String category) {
    if (_isAdShowing) return;
    
    setState(() {
      _isAdShowing = true;
    });

    // 전면 광고 로드 및 표시
    AdService.showInterstitialAd(
      onAdDismissed: () {
        if (mounted) {
          setState(() {
            _isAdShowing = false;
            _revealedChips.add(category);
            // 공개 상태 저장
            if (_fortuneBox != null) {
              _fortuneBox!.put('revealedChips', _revealedChips.toList());
              _fortuneBox!.put('revealedDate', DateFormat('yyyy-MM-dd').format(DateTime.now()));
            }
          });
          try {
            HapticFeedback.mediumImpact();
          } catch (_) {}
        }
      },
    );
  }

  // 퀵 행운 칩 (색상, 아이템, 방향)
  Widget _buildQuickLuckChip(String category, String label, String value, Color accentColor, Color textColor, bool isDarkMode) {
    final isRevealed = _revealedChips.contains(category);
    
    return Expanded(
      child: GestureDetector(
        onTap: isRevealed ? null : () => _handleRevealChip(category),
        child: SizedBox(
          height: 85, // 고정 높이 추가로 렌더링 오류 방지
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final rotate = Tween(begin: pi, end: 0.0).animate(animation);
              return AnimatedBuilder(
                animation: rotate,
                child: child,
                builder: (context, child) {
                  final isBack = rotate.value > pi / 2;
                  return Transform(
                    transform: Matrix4.rotationY(rotate.value),
                    alignment: Alignment.center,
                    child: isBack 
                      ? Transform(
                          transform: Matrix4.rotationY(pi),
                          alignment: Alignment.center,
                          child: _buildQuickLuckChipBack(category, label, isDarkMode),
                        )
                      : child,
                  );
                },
              );
            },
            child: isRevealed 
              ? _buildQuickLuckChipFront(label, value, accentColor, textColor, isDarkMode)
              : _buildQuickLuckChipBack(category, label, isDarkMode),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLuckChipBack(String category, String label, bool isDarkMode) {
    IconData icon;
    Color iconColor;
    
    switch (category) {
      case "lucky_color":
        icon = Icons.palette_outlined;
        iconColor = Colors.purpleAccent;
        break;
      case "lucky_item":
        icon = Icons.auto_awesome_outlined;
        iconColor = Colors.blueAccent;
        break;
      case "lucky_direction":
        icon = Icons.explore_outlined;
        iconColor = Colors.greenAccent;
        break;
      default:
        icon = Icons.help_outline;
        iconColor = Colors.grey;
    }

    return Container(
      key: const ValueKey('back'),
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : const Color(0xFFCBD5E1),
          width: isDarkMode ? 1.0 : 0.5,
        ),
        gradient: LinearGradient(
          colors: isDarkMode 
            ? [const Color(0xFF1C1C1E), const Color(0xFF2C2C2E)]
            : [Colors.white, const Color(0xFFF8FAFC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white70 : Colors.black87,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 2),
          Icon(
            Icons.touch_app,
            size: 10,
            color: isDarkMode ? Colors.white24 : Colors.black12,
          ),
        ],
      ),
    );
  }


  Widget _buildQuickLuckChipFront(String label, String value, Color accentColor, Color textColor, bool isDarkMode) {
    return Container(
      key: const ValueKey('front'),
      width: double.infinity,
      height: 85, // 고정 높이 추가
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: accentColor.withOpacity(0.3),
          width: isDarkMode ? 1.0 : 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white54 : Colors.black45,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // 메인 추천 카드 (오늘의 운세)
  Widget _buildFeaturedCard(bool isDarkMode) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      height: 120,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          UserActivityService.recordFortuneView();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FortuneMissionScreen()),
          );
        },
        child: _buildFeaturedCardFront(isDarkMode, l10n),
      ),
    );
  }


  Widget _buildFeaturedCardFront(bool isDarkMode, AppLocalizations l10n) {
    return Container(
      key: const ValueKey('featured_front'),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.12) : const Color(0xFFCBD5E1),
          width: isDarkMode ? 1.0 : 0.5,
        ),
        gradient: LinearGradient(
          colors: isDarkMode 
            ? [const Color(0xFF1C1C1E), const Color(0xFF2C2C2E)]
            : [Colors.white, const Color(0xFFF8FAFC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(isDarkMode ? 0.15 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildSmallLuckTag("💰 ${l10n.wealthFortune}", isDarkMode, color: Colors.orange),
                    const SizedBox(width: 4),
                    _buildSmallLuckTag("🚀 ${l10n.successFortune}", isDarkMode, color: Colors.blue),
                    const SizedBox(width: 4),
                    _buildSmallLuckTag("❤️ ${l10n.loveFortune}", isDarkMode, color: Colors.pink),
                  ],
                ),
                const Spacer(),
                Text(
                  l10n.todaysFortuneTitle,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.fortuneCheckSubtitle,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white54 : Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_forward_ios, size: 14, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallLuckTag(String text, bool isDarkMode, {Color? color}) {
    final tagColor = color ?? (isDarkMode ? Colors.white38 : Colors.black45);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: tagColor.withOpacity(isDarkMode ? 0.12 : 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: tagColor.withOpacity(isDarkMode ? 0.25 : 0.15),
          width: isDarkMode ? 1.0 : 0.5,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: isDarkMode ? tagColor.withOpacity(0.85) : tagColor.withOpacity(0.8),
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
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.35, // 1.25 -> 1.35로 증대하여 높이 축소
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          final colors = item['colors'] as List<Color>;
          
          return Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF1C1C1E) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDarkMode ? Colors.white.withOpacity(0.12) : const Color(0xFFCBD5E1),
                width: isDarkMode ? 1.0 : 0.5,
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
                borderRadius: BorderRadius.circular(12),
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
                      const SizedBox(height: 3), // 4 -> 3 축소
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
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

  Widget _buildListItem(String emoji, String title, String subtitle, Color textColor, Color subTextColor) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.12) : const Color(0xFFCBD5E1),
          width: isDarkMode ? 1.0 : 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.04),
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
                    borderRadius: BorderRadius.circular(12),
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
