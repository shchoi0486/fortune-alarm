import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import '../../../../services/sharing_service.dart';
import '../models/saju_profile.dart';
import '../services/compatibility_service.dart';
import '../services/saju_service.dart';

class CompatibilityResultScreen extends StatefulWidget {
  final SajuProfile myProfile;
  final SajuProfile partnerProfile;

  const CompatibilityResultScreen({
    super.key,
    required this.myProfile,
    required this.partnerProfile,
  });

  @override
  State<CompatibilityResultScreen> createState() => _CompatibilityResultScreenState();
}

class _CompatibilityResultScreenState extends State<CompatibilityResultScreen> with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late CompatibilityScore _result;
  late AnimationController _animationController;
  late Animation<double> _scoreAnimation;

  @override
  void initState() {
    super.initState();
    _result = CompatibilityService.analyze(widget.myProfile, widget.partnerProfile);
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scoreAnimation = Tween<double>(begin: 0, end: _result.totalScore.toDouble()).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
    _playRevealFeedback();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playSfx(String assetPath) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('sounds/$assetPath'));
    } catch (e) {
      debugPrint('Error playing SFX: $e');
    }
  }

  void _playRevealFeedback() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return;
      HapticFeedback.heavyImpact();
      // 효과음 제거 요청으로 주석 처리
      // _playSfx('ui_success.ogg');
      if (Platform.isAndroid || Platform.isIOS) {
        Vibration.vibrate(duration: 100);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFF0F5);
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("궁합 결과", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 1. Couple Header
              _buildCoupleHeader(isDarkMode, textColor),
              const SizedBox(height: 30),
  
              // 2. Score Circle
              _buildScoreCircle(isDarkMode),
              const SizedBox(height: 30),
  
              // 3. Summary Title
              Text(
                _result.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                _result.description,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // 4. Details List
              ..._result.details.map((detail) => _buildDetailCard(detail, isDarkMode)),
  
              const SizedBox(height: 40),
              
              // 공유하기 버튼 추가
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    SharingService.showShareOptions(
                      context: context,
                      title: '우리의 궁합 결과',
                      description: '${widget.myProfile.name} ❤️ ${widget.partnerProfile.name}\n${_result.title}',
                      results: {
                        '궁합 점수': '${_result.totalScore}점',
                        '결과 요약': '${_result.description.substring(0, _result.description.length > 30 ? 30 : _result.description.length)}...',
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE500),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, size: 20),
                      SizedBox(width: 10),
                      Text("결과 공유하기", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
  
              // 5. Retry Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pinkAccent,
                    side: const BorderSide(color: Colors.pinkAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "다른 사람과의 궁합 보기",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoupleHeader(bool isDarkMode, Color textColor) {
    final saju1 = SajuService.calculateSaju(widget.myProfile);
    final year1 = saju1['year']!.jiji;
    final saju2 = SajuService.calculateSaju(widget.partnerProfile);
    final year2 = saju2['year']!.jiji;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFF64B5F6).withOpacity(0.15),
              child: Text(
                year1.icon,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.myProfile.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Icon(Icons.favorite, color: Colors.pinkAccent, size: 32),
              const SizedBox(height: 4),
              Text(
                "vs",
                style: TextStyle(fontSize: 14, color: Colors.grey[500], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFFFF80AB).withOpacity(0.15),
              child: Text(
                year2.icon,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.partnerProfile.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreCircle(bool isDarkMode) {
    return AnimatedBuilder(
      animation: _scoreAnimation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 15,
                color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: _scoreAnimation.value / 100,
                strokeWidth: 15,
                backgroundColor: Colors.transparent,
                color: Colors.pinkAccent,
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "궁합 점수",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "${_scoreAnimation.value.toInt()}점",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailCard(CompatibilityDetail detail, bool isDarkMode) {
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: detail.isPositive ? Colors.pinkAccent.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: detail.isPositive ? Colors.pinkAccent.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  detail.category,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: detail.isPositive ? Colors.pinkAccent : Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              // Score bar
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: detail.score / 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: detail.isPositive ? Colors.pinkAccent : Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            detail.summary,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detail.description,
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
