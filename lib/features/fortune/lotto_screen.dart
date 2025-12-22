import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../services/lotto_service.dart';

class LottoScreen extends StatefulWidget {
  const LottoScreen({super.key});

  @override
  State<LottoScreen> createState() => _LottoScreenState();
}

class _LottoScreenState extends State<LottoScreen> {
  bool _isAnalyzing = false;
  bool _showResult = false;
  String _analysisStatus = "";
  double _progressValue = 0.0; // 진행률 (0.0 ~ 1.0)
  
  // { 'numbers': [1, 2, 3, 4, 5, 6], 'bonus': 7 } 형태의 리스트
  List<Map<String, dynamic>> _generatedNumbers = [];
  
  // Today's Fortune Theme Colors (Orange/Pink)
  final Color _primaryColor = const Color(0xFFFF512F);
  final Color _secondaryColor = const Color(0xFFDD2476);
  final Color _lightColor = const Color(0xFFFFF0F5);

  // Real Data Analysis
  Map<int, int> _frequencyMap = {};
  bool _isDataLoaded = false;

  void _startAnalysis() {
    setState(() {
      _isAnalyzing = true;
      _showResult = false;
      _analysisStatus = "실시간 당첨 정보 수집 중...";
      _progressValue = 0.0;
    });

    // Start fetching real data in background
    final dataFuture = LottoService.analyzeRecentRounds(30).then((map) {
      _frequencyMap = map;
      _isDataLoaded = true;
    });

    // UI Simulation Steps
    final steps = [
      "최신 30회차 당첨 번호 수집 중...",
      "번호별 출현 빈도 빅데이터 분석...",
      "홀짝/연속 번호 패턴 학습 중...",
      "AI 예측 모델 가중치 적용 중...",
      "최적의 행운 조합 산출 중...",
      "분석 완료! 행운 번호 생성"
    ];

    int stepIndex = 0;
    const totalDuration = 3000; 
    final stepDuration = totalDuration ~/ steps.length;

    Timer.periodic(Duration(milliseconds: stepDuration), (timer) async {
      if (stepIndex < steps.length) {
        setState(() {
          _analysisStatus = steps[stepIndex];
          _progressValue = (stepIndex + 1) / steps.length;
        });
        stepIndex++;
      } else {
        timer.cancel();
        // Wait for data if not ready
        if (!_isDataLoaded) {
          setState(() {
            _analysisStatus = "데이터 최종 처리 중...";
          });
          await dataFuture;
        }
        _generateNumbers();
      }
    });
  }

  void _generateNumbers() {
    final random = Random();
    List<Map<String, dynamic>> results = [];

    // Calculate weights if data is available, otherwise use default
    // Weight = Frequency + 1 (to ensure 0 frequency has some chance)
    final weights = <int, int>{};
    if (_isDataLoaded && _frequencyMap.isNotEmpty) {
      _frequencyMap.forEach((key, value) {
        weights[key] = value + 1; // Basic weight
      });
    } else {
      for (int i = 1; i <= 45; i++) {
        weights[i] = 1;
      }
    }

    // Weighted selection helper
    int weightedRandom(Map<int, int> weights, Set<int> exclude) {
      int totalWeight = 0;
      final candidates = <int, int>{};
      
      weights.forEach((k, v) {
        if (!exclude.contains(k)) {
          candidates[k] = v;
          totalWeight += v;
        }
      });

      if (totalWeight == 0) return random.nextInt(45) + 1; // Fallback

      int r = random.nextInt(totalWeight);
      for (var entry in candidates.entries) {
        r -= entry.value;
        if (r < 0) return entry.key;
      }
      return candidates.keys.last;
    }

    for (int i = 0; i < 5; i++) {
      Set<int> numbers = {};
      
      // Generate 6 numbers using weighted random
      while (numbers.length < 6) {
        numbers.add(weightedRandom(weights, numbers));
      }
      
      List<int> sortedNumbers = numbers.toList()..sort();

      // Bonus number
      int bonusNumber;
      do {
        bonusNumber = weightedRandom(weights, numbers);
      } while (numbers.contains(bonusNumber));

      results.add({
        'numbers': sortedNumbers,
        'bonus': bonusNumber,
      });
    }

    setState(() {
      _generatedNumbers = results;
      _isAnalyzing = false;
      _showResult = true;
    });
  }

  Color _getNumberColor(int number) {
    if (number <= 10) return const Color(0xFFFFB300); // Yellow
    if (number <= 20) return const Color(0xFF1E88E5); // Blue
    if (number <= 30) return const Color(0xFFE53935); // Red
    if (number <= 40) return const Color(0xFF757575); // Grey
    return const Color(0xFF43A047); // Green
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("나만의 행운 로또 번호", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: _isAnalyzing
            ? _buildAnalyzingView(textColor, subTextColor!)
            : _showResult
                ? _buildResultView(isDarkMode, textColor, subTextColor!)
                : _buildIntroView(isDarkMode, textColor, subTextColor!),
      ),
    );
  }

  Widget _buildIntroView(bool isDarkMode, Color textColor, Color subTextColor) {
    return Column(
      children: [
        const Spacer(),
        // 로또 아이콘 또는 일러스트
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: _lightColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(Icons.casino_rounded, size: 60, color: _primaryColor),
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          "나만의 행운 로또 번호",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFF512F)),
        ),
        const SizedBox(height: 10),
        Text(
          "AI가 생성하는 특별한 로또 6/45 번호",
          style: TextStyle(fontSize: 16, color: subTextColor),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFeatureItem(Icons.auto_awesome, "AI 추천", "스마트 알고리즘", isDarkMode, textColor, subTextColor),
            _buildFeatureItem(Icons.star_rounded, "스마트", "번호 추천", isDarkMode, textColor, subTextColor),
            _buildFeatureItem(Icons.emoji_events_rounded, "데이터 분석", "최적 조합", isDarkMode, textColor, subTextColor),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_primaryColor, _secondaryColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: _primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _startAnalysis,
                  borderRadius: BorderRadius.circular(16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_awesome, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "행운 번호 생성하기",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.auto_awesome, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          "매주 토요일 저녁 8시 35분 MBC 생방송 추첨\n로또 6/45 당첨 번호를 예측해보세요",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: subTextColor),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle, bool isDarkMode, Color textColor, Color subTextColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800] : _lightColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: _primaryColor, size: 30),
        ),
        const SizedBox(height: 12),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textColor)),
        const SizedBox(height: 4),
        Text(subtitle, style: TextStyle(fontSize: 12, color: subTextColor)),
      ],
    );
  }

  Widget _buildAnalyzingView(Color textColor, Color subTextColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 세련된 로딩 바 (LinearProgressIndicator)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: _progressValue,
                minHeight: 10,
                backgroundColor: textColor.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "번호 생성 중...",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 16),
            Text(
              _analysisStatus, // 현재 단계 표시
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: subTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              "${(_progressValue * 100).toInt()}%",
              style: TextStyle(fontSize: 14, color: _primaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView(bool isDarkMode, Color textColor, Color subTextColor) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "행운의 번호 생성 완료",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.analytics_outlined, size: 20, color: subTextColor),
                const SizedBox(width: 8),
                Text(
                  "6개 번호 + 보너스 번호",
                  style: TextStyle(fontSize: 16, color: subTextColor),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // 생성된 번호 리스트
            ..._generatedNumbers.asMap().entries.map((entry) {
              return _buildLottoRow(entry.key, entry.value, isDarkMode);
            }),

            const SizedBox(height: 20),
            Text(
              "※ 본 서비스는 재미를 위한 서비스로, 제공된 번호는 AI 알고리즘에 의해 생성된 참고용 번호이며 당첨을 보장하지 않습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: subTextColor),
            ),
            const SizedBox(height: 30),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _startAnalysis,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text(
                  "번호 다시 생성하기",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLottoRow(int index, Map<String, dynamic> data, bool isDarkMode) {
    final List<int> numbers = data['numbers'] as List<int>;
    final int bonus = data['bonus'] as int;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: isDarkMode ? Colors.grey[800]! : Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                String.fromCharCode(65 + index), // A, B, C, D, E
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              // 번호 6개 나열
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...numbers.map((n) => _buildBall(n)),
                    // + 아이콘
                    const Icon(Icons.add, size: 16, color: Colors.grey),
                    // 보너스 번호
                    _buildBall(bonus),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBall(int number) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: _getNumberColor(number),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _getNumberColor(number).withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "$number",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
