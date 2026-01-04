import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import '../../../services/sharing_service.dart';
import 'models/tojeong_result.dart';
import 'package:fortune_alarm/features/fortune/saju/models/saju_profile.dart';

class TojeongResultScreen extends StatefulWidget {
  final SajuProfile profile;
  final int targetYear;
  final TojeongResult result;

  const TojeongResultScreen({
    super.key,
    required this.profile,
    required this.targetYear,
    required this.result,
  });

  @override
  State<TojeongResultScreen> createState() => _TojeongResultScreenState();
}

class _TojeongResultScreenState extends State<TojeongResultScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playRevealFeedback();
  }

  @override
  void dispose() {
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
      // _playSfx('ui_tada.mp3');
      if (Platform.isAndroid || Platform.isIOS) {
        Vibration.vibrate(duration: 100);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF11998e); // Tojeong Theme Color
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFFF5F7FA);
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("${widget.targetYear}년 토정비결"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Card
              Card(
                color: cardColor,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "${widget.profile.name}님의 ${widget.targetYear}년 운세",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor.withOpacity(0.3)),
                        ),
                        child: Text(
                          "괘: ${widget.result.key}",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
  
              // Total Luck Section
              Text(
                "총운 (Total Luck)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: cardColor,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.result.totalLuck,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: textColor.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
  
              // Monthly Luck Section
              Text(
                "월별 운세 (Monthly Fortune)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.result.monthlyLuck.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Card(
                    color: cardColor,
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${index + 1}월",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.result.monthlyLuck[index]
                                      .substring(widget.result.monthlyLuck[index].indexOf(':') + 1)
                                      .split('\n')[0]
                                      .trim(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                    height: 1.4,
                                  ),
                                ),
                                if (widget.result.monthlyLuck[index].contains('\n')) ...[
                                  const SizedBox(height: 6),
                                  Text(
                                    widget.result.monthlyLuck[index]
                                        .substring(widget.result.monthlyLuck[index].indexOf(':') + 1)
                                        .split('\n')[1]
                                        .trim(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColor.withOpacity(0.7),
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    _playSfx('ui_click.ogg');
                    SharingService.showShareOptions(
                       context: context,
                       title: '${widget.targetYear}년 토정비결 결과',
                       description: '${widget.profile.name}님의 토정비결 총평입니다.\n\n${widget.result.totalLuck.substring(0, widget.result.totalLuck.length > 50 ? 50 : widget.result.totalLuck.length)}...',
                       results: {
                         '이름': widget.profile.name,
                         '대상 연도': '${widget.targetYear}년',
                       },
                     );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE500),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
