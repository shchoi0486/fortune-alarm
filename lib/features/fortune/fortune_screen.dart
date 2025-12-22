import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../providers/saju_provider.dart';
import 'generic_fortune_screen.dart';
import 'fortune_mission_screen.dart';
import 'lotto_screen.dart';
import 'saju/widgets/new_year_fortune_input_screen.dart';
import 'saju/widgets/saju_profile_screen.dart';
import 'tojeong/tojeong_input_screen.dart';
import 'dart:math';

class FortuneScreen extends ConsumerStatefulWidget {
  const FortuneScreen({super.key});

  @override
  ConsumerState<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends ConsumerState<FortuneScreen> {
  Box? _fortuneBox;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    _fortuneBox = await Hive.openBox('fortune');
  }

  String _getZodiacAnimal(DateTime? birthDate) {
    if (birthDate == null) return '🐷';
    final animals = ['🐭', '🐮', '🐯', '🐰', '🐲', '🐍', '🐴', '🐑', '🐵', '🐔', '🐶', '🐷'];
    // 띠 계산 공식: (연도 - 4) % 12
    final index = (birthDate.year - 4) % 12;
    return animals[index];
  }

  Map<String, dynamic> _getDailyLuck(String seed) {
    final now = DateTime.now();
    // 매일 바뀌도록 날짜와 시드(이름 등)를 조합하여 랜덤 생성기 초기화
    final dateSeed = now.year * 10000 + now.month * 100 + now.day;
    final random = Random(dateSeed + seed.hashCode);

    final colors = [
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
    final userName = sajuState.mainProfile?.name ?? "사용자";
    final zodiacIcon = _getZodiacAnimal(sajuState.mainProfile?.birthDate);
    final dailyLuck = _getDailyLuck(userName);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Custom Header
          Container(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
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
                          "안녕하세요, $userName님",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "신비로운 운세의 세계에 오신 것을 환영합니다",
                          style: TextStyle(
                            fontSize: 13,
                            color: subTextColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
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
                          radius: 22,
                          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                          child: Text(zodiacIcon, style: const TextStyle(fontSize: 24)),
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
                      "행운의 색", 
                      dailyLuck['color']['name'] as String, 
                      dailyLuck['color']['bg'] as Color, 
                      dailyLuck['color']['color'] as Color, 
                      isDarkMode
                    ),
                    const SizedBox(width: 8),
                    _buildQuickLuckChip("행운의 물건", dailyLuck['item'] as String, Colors.blue[100]!, Colors.blue, isDarkMode),
                    const SizedBox(width: 8),
                    _buildQuickLuckChip("길한 방향", dailyLuck['direction'] as String, Colors.orange[100]!, Colors.orange, isDarkMode),
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
                  const SizedBox(height: 16),
                  
                  // 메인 추천 카드 (오늘의 운세)
                  _buildFeaturedCard(isDarkMode),
                  
                  const SizedBox(height: 16),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "다양한 운세 보기",
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
    );
  }

  Widget _buildQuickLuckChip(String label, String value, Color bgColor, Color textColor, bool isDarkMode) {
    String icon = "";
    if (label.contains("색")) icon = "🎨";
    else if (label.contains("물건")) icon = "✨";
    else if (label.contains("방향")) icon = "🧭";

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.05) : bgColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDarkMode ? Colors.white.withOpacity(0.1) : bgColor.withOpacity(0.3),
            width: 1,
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
          color: isDarkMode ? Colors.white.withOpacity(0.1) : const Color(0xFFE2E8F0),
          width: 1,
        ),
        gradient: LinearGradient(
          colors: isDarkMode 
            ? [const Color(0xFFF8FAFC), const Color(0xFFF1F5F9)]
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
                          color: isDarkMode ? Colors.black87 : Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "신비로운 별들이 들려주는 오늘의 조언",
                        style: TextStyle(
                          color: isDarkMode ? Colors.black54 : Colors.black54,
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
                      color: isDarkMode ? Colors.black.withOpacity(0.05) : Colors.black.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black54),
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
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blueAccent,
              onPrimary: Colors.white,
              onSurface: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
          ),
          child: child!,
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
            const Text("지정일 운세보기", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                child: const Text("확인", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("취소", style: TextStyle(color: Colors.grey)),
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
        'title': '행운의 번호',
        'subtitle': '로또 번호 추천',
        'icon': '🎰',
        'colors': [const Color(0xFFFDC830), const Color(0xFFF37335)],
        'target': 'lotto'
      },
      {
        'title': '지정일 운세',
        'subtitle': '특별한 날 운세',
        'icon': '📅',
        'colors': [const Color(0xFF00C6FF), const Color(0xFF0072FF)],
        'target': 'specific_date'
      },
      {
        'title': '신년운세',
        'subtitle': '2025년 전체운',
        'icon': '🐲',
        'colors': [const Color(0xFFFF416C), const Color(0xFFFF4B2B)],
        'target': 'saju'
      },
      {
        'title': '토정비결',
        'subtitle': '전통 사주 풀이',
        'icon': '📜',
        'colors': [const Color(0xFF11998e), const Color(0xFF38ef7d)],
        'target': 'tojeong'
      },
      {
        'title': '관상 보기',
        'subtitle': '얼굴 관상 운명',
        'icon': '🧿',
        'colors': [const Color(0xFF8E2DE2), const Color(0xFF4A00E0)],
        'target': 'face'
      },
      {
        'title': '궁합 보기',
        'subtitle': '인연과의 조화',
        'icon': '💖',
        'colors': [const Color(0xFFFF5F6D), const Color(0xFFFFC371)],
        'target': 'generic'
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
                  if (item['target'] == 'lotto') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LottoScreen()));
                  } else if (item['target'] == 'specific_date') {
                    _handleSpecificDateFortune(context);
                  } else if (item['target'] == 'saju') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewYearFortuneInputScreen()));
                  } else if (item['target'] == 'tojeong') {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TojeongInputScreen()));
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
          const SizedBox(height: 20),
          _buildListItem("💎", "프리미엄 운세", "더 깊이 있는 사주 풀이", textColor, subTextColor),
          _buildListItem("🌟", "천생연분 찾기", "나의 진정한 인연은 어디에?", textColor, subTextColor),
          _buildListItem("🧿", "액운 방지 부적", "부정적인 기운을 막아주는 비법", textColor, subTextColor),
        ],
      ),
    );
  }

  Widget _buildListItem(String emoji, String title, String subtitle, Color textColor, Color subTextColor) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[100]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenericFortuneScreen(title: title)),
            );
          },
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800]!.withOpacity(0.5) : Colors.grey[50],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 26)),
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textColor,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: subTextColor.withOpacity(0.7),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward_ios, color: subTextColor.withOpacity(0.4), size: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
