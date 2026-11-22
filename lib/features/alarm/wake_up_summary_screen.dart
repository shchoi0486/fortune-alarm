import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

import '../../providers/bottom_nav_provider.dart';
import '../../providers/saju_provider.dart';

/// 기상 완료 화면.
///
/// 알람을 해제한 직후에 '오늘의 운세' 핵심 요약(행운의 색·행운의 물건·길한 방향·오늘의 조언)을
/// 광고나 쿠키 없이 바로 보여줍니다. 상세 운세(타로·토정비결 등)는 '자세한 결과 확인하기'를
/// 눌렀을 때만 기존 운세 탭 경로를 사용합니다.
///
/// ※ 이 화면에는 광고를 넣지 않습니다. (알람 해제 순간은 광고 금지 구역)
class WakeUpSummaryScreen extends ConsumerStatefulWidget {
  const WakeUpSummaryScreen({super.key});

  @override
  ConsumerState<WakeUpSummaryScreen> createState() => _WakeUpSummaryScreenState();
}

class _WakeUpSummaryScreenState extends ConsumerState<WakeUpSummaryScreen> {
  /// MainScreen 탭 순서: 0 알람, 1 캘린더, 2 운세, 3 미션, 4 설정
  static const int _fortuneTabIndex = 2;

  bool _isLoading = true;
  int _colorIndex = 0;
  int _itemIndex = 0;
  int _directionIndex = 0;
  int _score = 0;
  int _adviceIndex = 0;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadDailyFortune();
  }

  /// 운세 탭(FortuneScreen)과 같은 규칙으로 오늘의 행운 정보를 계산한다.
  /// 시드는 '대표 사주 프로필 이름'(없으면 GuestUser)이고, 계산 결과를 fortune 박스에
  /// 캐시해 운세 탭과 이 화면이 같은 값을 보여주도록 한다.
  Future<void> _loadDailyFortune() async {
    String seed = 'GuestUser';
    String userName = '';

    try {
      final sajuState = ref.read(sajuProvider);
      final profile = sajuState.mainProfile;
      if (profile != null && profile.name.isNotEmpty) {
        seed = profile.name;
        userName = profile.name;
      }
    } catch (e) {
      debugPrint('[WakeUpSummary] Failed to load saju profile: $e');
    }

    final now = DateTime.now();
    final String today = DateFormat('yyyy-MM-dd').format(now);
    final int dateSeed = now.year * 10000 + now.month * 100 + now.day;

    int colorIndex = 0;
    int itemIndex = 0;
    int directionIndex = 0;

    try {
      final box = Hive.isBoxOpen('fortune')
          ? Hive.box('fortune')
          : await Hive.openBox('fortune');
      final cached = box.get('dailyLuckIndices');
      final cachedDate = box.get('revealedDate');

      if (cached is Map && cachedDate == today) {
        colorIndex = (cached['colorIdx'] as int?) ?? 0;
        itemIndex = (cached['itemIdx'] as int?) ?? 0;
        directionIndex = (cached['dirIdx'] as int?) ?? 0;
      } else {
        final random = math.Random(dateSeed + seed.hashCode);
        colorIndex = random.nextInt(9);
        itemIndex = random.nextInt(12);
        directionIndex = random.nextInt(8);
        await box.put('dailyLuckIndices', {
          'colorIdx': colorIndex,
          'itemIdx': itemIndex,
          'dirIdx': directionIndex,
        });
        await box.put('revealedDate', today);
      }
    } catch (e) {
      debugPrint('[WakeUpSummary] Failed to load cached daily luck: $e');
      final random = math.Random(dateSeed + seed.hashCode);
      colorIndex = random.nextInt(9);
      itemIndex = random.nextInt(12);
      directionIndex = random.nextInt(8);
    }

    // 총점(62~96)과 오늘의 조언은 당일 동안 같은 값이 나오도록 날짜 시드로 고정한다.
    final scoreRandom = math.Random(dateSeed + seed.hashCode + 7);
    final int score = 62 + scoreRandom.nextInt(35);
    final int adviceIndex = scoreRandom.nextInt(12);

    if (!mounted) return;
    setState(() {
      _colorIndex = colorIndex % 9;
      _itemIndex = itemIndex % 12;
      _directionIndex = directionIndex % 8;
      _score = score;
      _adviceIndex = adviceIndex % 12;
      _userName = userName;
      _isLoading = false;
    });
  }

  void _closeToMain() {
    if (!mounted) return;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    ref.read(bottomNavProvider.notifier).state = 0;

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/main',
      (route) => false,
      arguments: {'skipSplash': true},
    );
  }

  void _openFortuneTab() {
    if (!mounted) return;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    ref.read(bottomNavProvider.notifier).state = _fortuneTabIndex;

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/main',
      (route) => false,
      arguments: {'skipSplash': true},
    );
  }

  /// 운세 탭의 행운의 색 목록과 같은 순서를 유지한다.
  List<String> _colorNames(AppLocalizations l10n) => [
        l10n.colorPurple,
        l10n.colorBlue,
        l10n.colorYellow,
        l10n.colorRed,
        l10n.colorGreen,
        l10n.colorPink,
        l10n.colorOrange,
        l10n.colorWhite,
        l10n.colorBlack,
      ];

  List<Color> get _colorSwatches => [
        Colors.purple,
        Colors.blue,
        Colors.amber,
        Colors.red,
        Colors.green,
        Colors.pink,
        Colors.orange,
        Colors.white,
        Colors.black,
      ];

  List<String> _itemNames(AppLocalizations l10n) => [
        l10n.itemPerfume,
        l10n.itemHandkerchief,
        l10n.itemRing,
        l10n.itemWatch,
        l10n.itemGlasses,
        l10n.itemHat,
        l10n.itemBook,
        l10n.itemEarphones,
        l10n.itemMirror,
        l10n.itemPen,
        l10n.itemCoin,
        l10n.itemKey,
      ];

  List<IconData> get _itemIcons => [
        Icons.spa_rounded,
        Icons.crop_square_rounded,
        Icons.circle_outlined,
        Icons.watch_rounded,
        Icons.remove_red_eye_outlined,
        Icons.check_box_outline_blank_rounded,
        Icons.menu_book_rounded,
        Icons.headphones_rounded,
        Icons.flip_rounded,
        Icons.edit_rounded,
        Icons.monetization_on_outlined,
        Icons.vpn_key_rounded,
      ];

  List<String> _directionNames(AppLocalizations l10n) => [
        l10n.dirEast,
        l10n.dirWest,
        l10n.dirSouth,
        l10n.dirNorth,
        l10n.dirNorthEast,
        l10n.dirSouthEast,
        l10n.dirNorthWest,
        l10n.dirSouthWest,
      ];

  List<String> _adviceList(AppLocalizations l10n) => [
        l10n.adviceHealth0,
        l10n.adviceHealth1,
        l10n.adviceHealth2,
        l10n.adviceWealth0,
        l10n.adviceWealth1,
        l10n.adviceWealth2,
        l10n.adviceLove0,
        l10n.adviceLove1,
        l10n.adviceLove2,
        l10n.adviceCareer0,
        l10n.adviceCareer1,
        l10n.adviceCareer2,
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final String timeString = DateFormat('h:mm').format(now);
    final String amPmString = DateFormat('a').format(now);
    final String dateString = DateFormat(l10n.dateFormatMdyE, l10n.localeName).format(now);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.wb_sunny_rounded,
                  color: Colors.amberAccent,
                  size: 48,
                ),
                const SizedBox(height: 16),
                if (_userName.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      _userName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                Text(
                  l10n.morningGreeting,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      timeString,
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      amPmString,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  dateString,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 24),
                _buildFortuneCard(l10n),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _openFortuneTab,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.checkDetailResult,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _closeToMain,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    l10n.close,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFortuneCard(AppLocalizations l10n) {
    final String colorName = _colorNames(l10n)[_colorIndex % _colorNames(l10n).length];
    final String itemName = _itemNames(l10n)[_itemIndex % _itemNames(l10n).length];
    final String directionName = _directionNames(l10n)[_directionIndex % _directionNames(l10n).length];
    final String advice = _adviceList(l10n)[_adviceIndex % _adviceList(l10n).length];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🔮', style: TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.todaysFortuneTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              if (_isLoading)
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.amberAccent,
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    l10n.totalScoreWithPoints(_score),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.white.withOpacity(0.1), height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildLuckTile(
                  icon: Icons.palette_rounded,
                  iconColor: _colorSwatches[_colorIndex % _colorSwatches.length],
                  label: l10n.luckyColor,
                  value: colorName,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildLuckTile(
                  icon: _itemIcons[_itemIndex % _itemIcons.length],
                  iconColor: Colors.amberAccent,
                  label: l10n.luckyItem,
                  value: itemName,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildLuckTile(
                  icon: Icons.explore_rounded,
                  iconColor: Colors.lightBlueAccent,
                  label: l10n.luckyDirection,
                  value: directionName,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            l10n.todaysAdvice,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5),
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            advice,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLuckTile({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
