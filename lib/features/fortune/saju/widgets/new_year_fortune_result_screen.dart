import 'package:flutter/material.dart';
import '../models/saju_data.dart';
import '../models/saju_profile.dart';
import '../services/saju_service.dart';

class NewYearFortuneResultScreen extends StatefulWidget {
  final SajuProfile profile;
  final int targetYear;

  const NewYearFortuneResultScreen({
    super.key, 
    required this.profile,
    this.targetYear = 2025
  });

  @override
  State<NewYearFortuneResultScreen> createState() => _NewYearFortuneResultScreenState();
}

class _NewYearFortuneResultScreenState extends State<NewYearFortuneResultScreen> {
  late Map<String, Ganji> _saju;
  late String _fortuneText;

  @override
  void initState() {
    super.initState();
    _saju = SajuService.calculateSaju(widget.profile);
    _fortuneText = SajuService.getYearlyFortune(widget.profile, _saju, widget.targetYear);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '나의 ${widget.targetYear}년 신년운세',
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkMode 
                ? [const Color(0xFF1C1C1E), const Color(0xFF1C1C1E)] 
                : [const Color(0xFFE8F3FF), Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildSajuChart(),
                const SizedBox(height: 24),
                _buildOhaengAnalysis(),
                const SizedBox(height: 24),
                _buildFortuneCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.profile.name,
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${widget.profile.birthDate.year}년 ${widget.profile.birthDate.month}월 ${widget.profile.birthDate.day}일 "
            "(${widget.profile.isLunar ? '음력' : '양력'}, ${widget.profile.birthTime})",
            style: TextStyle(
              fontSize: 14, 
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSajuChart() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            "사주 명식 (Saju Chart)",
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ),
        Row(
          children: [
            _buildSajuColumn("시주", _saju['hour']!, isDarkMode),
            _buildSajuColumn("일주", _saju['day']!, isDarkMode),
            _buildSajuColumn("월주", _saju['month']!, isDarkMode),
            _buildSajuColumn("년주", _saju['year']!, isDarkMode),
          ],
        ),
      ],
    );
  }

  Widget _buildSajuColumn(String title, Ganji ganji, bool isDarkMode) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title, 
            style: TextStyle(
              fontSize: 12, 
              color: isDarkMode ? Colors.grey[500] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          _buildGanjiBox(ganji.cheongan.hanja, true, isDarkMode),
          const SizedBox(height: 4),
          _buildGanjiBox(ganji.jiji.hanja, false, isDarkMode),
        ],
      ),
    );
  }

  Widget _buildGanjiBox(String text, bool isCheon, bool isDarkMode) {
    final element = SajuService.getElement(text);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: element.color.withOpacity(isDarkMode ? 0.5 : 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          Text(
            element.koreanName,
            style: TextStyle(
              fontSize: 12, 
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOhaengAnalysis() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final counts = SajuService.countOhaeng(_saju);
    final dominant = SajuService.getDominantOhaeng(counts);
    final explanation = SajuService.getOhaengExplanation(dominant);

    return Card(
      elevation: 0,
      color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "오행 분석 (Five Elements)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: dominant.color.withOpacity(isDarkMode ? 0.15 : 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: dominant.color.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "당신의 대표 오행: ${dominant.koreanName}(${dominant.symbol})",
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold, 
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    explanation,
                    style: TextStyle(
                      fontSize: 15, 
                      color: isDarkMode ? Colors.grey[300] : Colors.black87, 
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: Ohaeng.values.map((e) => Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: e.color.withOpacity(isDarkMode ? 0.2 : 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: e.color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${e.koreanName} : ${counts[e]}",
                      style: TextStyle(
                        fontSize: 12, 
                        color: isDarkMode ? Colors.grey[400] : Colors.black87,
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "※ 오행은 사주를 구성하는 다섯 가지 기운(목, 화, 토, 금, 수)을 의미합니다. 균형 잡힌 오행이 이상적이지만, 부족하거나 넘치는 기운을 통해 자신의 성향을 파악할 수 있습니다.",
                style: TextStyle(
                  fontSize: 12, 
                  color: isDarkMode ? Colors.grey[500] : Colors.grey,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFortuneCard() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 0,
      color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDarkMode ? Colors.grey[800]! : const Color(0xFFE8F3FF),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: Colors.amber, size: 28),
                const SizedBox(width: 12),
                Text(
                  "${widget.targetYear}년 총운",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _fortuneText,
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
                color: isDarkMode ? Colors.grey[300] : Colors.black87,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.05) : const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline, 
                    color: isDarkMode ? Colors.grey[500] : Colors.grey[600], 
                    size: 18
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "이 운세는 재미로 보는 것이며, 실제 삶은 본인의 의지에 달려있습니다.",
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[500] : Colors.grey[600], 
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
