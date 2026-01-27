import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../services/lucky_number_service.dart';
import '../../services/sharing_service.dart';
import '../../widgets/ad_widgets.dart';
import 'mixins/fortune_access_mixin.dart';

class LuckyNumberScreen extends StatefulWidget {
  const LuckyNumberScreen({super.key});

  @override
  State<LuckyNumberScreen> createState() => _LuckyNumberScreenState();
}

class _LuckyNumberScreenState extends State<LuckyNumberScreen> with FortuneAccessMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isAnalyzing = false;
  bool _showResult = false;
  String _analysisStatus = "";
  double _progressValue = 0.0; // Progress (0.0 ~ 1.0)
  // List of { 'numbers': [1, 2, 3, 4, 5, 6], 'bonus': 7 }
  List<Map<String, dynamic>> _generatedNumbers = [];
  
  // Today's Fortune Theme Colors (Orange/Pink)
  final Color _primaryColor = const Color(0xFFFF512F);
  final Color _secondaryColor = const Color(0xFFDD2476);
  final Color _lightColor = const Color(0xFFFFF0F5);

  // Real Data Analysis
  Map<int, int> _frequencyMap = {};
  bool _isDataLoaded = false;

  void _startAnalysis() {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _isAnalyzing = true;
      _showResult = false;
      _analysisStatus = l10n.luckyNumberAnalysisStep1;
      _progressValue = 0.0;
    });

    // Start fetching real data in background (Optimized: 10 rounds, 3s timeout)
    final dataFuture = LuckyNumberService.analyzeRecentRounds(10).timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        debugPrint('Analysis timed out, using default weights');
        return <int, int>{};
      },
    ).then((map) {
      _frequencyMap = map;
      _isDataLoaded = true;
    }).catchError((e) {
      debugPrint('Error in analysis: $e');
      _isDataLoaded = true; 
    });

    // UI Simulation Steps
    final steps = [
      l10n.luckyNumberAnalysisStep2,
      l10n.luckyNumberAnalysisStep3,
      l10n.luckyNumberAnalysisStep4,
      l10n.luckyNumberAnalysisStep5,
      l10n.luckyNumberAnalysisStep6,
      l10n.luckyNumberAnalysisStep7,
    ];

    int stepIndex = 0;
    const totalDuration = 3000; 
    final stepDuration = totalDuration ~/ steps.length;

    Timer.periodic(Duration(milliseconds: stepDuration), (timer) async {
      if (stepIndex < steps.length) {
        if (mounted) {
          setState(() {
            _analysisStatus = steps[stepIndex];
            _progressValue = (stepIndex + 1) / steps.length;
          });
        }
        HapticFeedback.lightImpact();
        stepIndex++;
      } else {
        timer.cancel();
        // Wait at most 1 more second if data is not ready after animation
        if (!_isDataLoaded) {
          if (mounted) {
            setState(() {
              _analysisStatus = l10n.luckyNumberAnalysisFinal;
            });
          }
          try {
            await Future.any([
              dataFuture,
              Future.delayed(const Duration(seconds: 1)),
            ]);
          } catch (e) {
            debugPrint('Error waiting for dataFuture: $e');
          }
        }
        
        if (mounted) {
          final success = await showFortuneAccessDialog(() {
            _generateNumbers();
          });
          
          if (!success && mounted) {
            setState(() {
              _isAnalyzing = false;
            });
          }
        }
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

    // Add result generation feedback
    _playSuccessFeedback();

    setState(() {
      _generatedNumbers = results;
      _isAnalyzing = false;
      _showResult = true;
    });
  }

  Future<void> _playSuccessFeedback() async {
    try {
      HapticFeedback.heavyImpact();
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 100, 50, 100]);
      }
      // Commented out as sound effects removal was requested
      // await _audioPlayer.play(AssetSource('sounds/ui_tada.mp3'), volume: 0.5);
    } catch (_) {}
  }

  Color _getNumberColor(int number) {
    if (number <= 10) return const Color(0xFFFFC107); // Amber
    if (number <= 20) return const Color(0xFFFF9800); // Orange
    if (number <= 30) return const Color(0xFFFF5722); // Deep Orange
    if (number <= 40) return const Color(0xFFE91E63); // Pink
    return const Color(0xFF9C27B0); // Purple
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(l10n.luckyNumberTitle, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
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
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        const Spacer(),
        // Lucky Icon
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: _lightColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(Icons.auto_awesome, size: 60, color: _primaryColor),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          l10n.luckyNumberTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFF512F)),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            l10n.luckyNumberSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: subTextColor),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildFeatureItem(Icons.auto_awesome, l10n.luckyNumberFeatureAiTitle, l10n.luckyNumberFeatureAiDesc, isDarkMode, textColor, subTextColor)),
              Expanded(child: _buildFeatureItem(Icons.star_rounded, l10n.luckyNumberFeatureSmartTitle, l10n.luckyNumberFeatureSmartDesc, isDarkMode, textColor, subTextColor)),
              Expanded(child: _buildFeatureItem(Icons.emoji_events_rounded, l10n.luckyNumberFeatureDataTitle, l10n.luckyNumberFeatureDataDesc, isDarkMode, textColor, subTextColor)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Intro screen native ad
        const DetailedAdWidget(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  onTap: () {
                    HapticFeedback.selectionClick();
                    _startAnalysis();
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.auto_awesome, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      l10n.luckyNumberGenerateButton,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.auto_awesome, color: Colors.white),
                  ],
                ),
                ),
              ),
            ),
          ),
        ),
        Text(
          l10n.luckyNumberGuideText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: subTextColor),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle, bool isDarkMode, Color textColor, Color subTextColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        Text(
          title, 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textColor),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          subtitle, 
          style: TextStyle(fontSize: 11, color: subTextColor),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildAnalyzingView(Color textColor, Color subTextColor) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Modern loading bar (LinearProgressIndicator)
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
              l10n.luckyNumberGenerating,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 16),
            Text(
              _analysisStatus, // Display current stage
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: subTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              "${(_progressValue * 100).toInt()}%",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: _primaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView(bool isDarkMode, Color textColor, Color subTextColor) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      bottom: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  l10n.luckyNumberResultTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.luckyNumberResultSubtitle,
                style: TextStyle(fontSize: 16, color: subTextColor),
              ),
              const SizedBox(height: 30),
              // Generated number list
              ..._generatedNumbers.asMap().entries.map((entry) {
                return _buildLuckyNumberRow(entry.key, entry.value, isDarkMode);
              }),
              const SizedBox(height: 20),
              // Result screen native ad
              const DetailedAdWidget(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.luckyNumberDisclaimer,
                style: TextStyle(fontSize: 12, color: subTextColor, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Bottom buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        SharingService.showShareOptions(
                          context: context,
                          title: l10n.luckyNumberShareTitle,
                          description: l10n.luckyNumberShareDescription,
                          results: Map.fromEntries(
                            _generatedNumbers.asMap().entries.map(
                                  (e) => MapEntry(
                                l10n.luckyNumberSetLabel(String.fromCharCode(65 + e.key)),
                                (e.value['numbers'] as List<int>).join(", "),
                              ),
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: _primaryColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        l10n.shareResultButton,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        _startAnalysis();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: _primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: Text(
                        l10n.luckyNumberRegenerateButton,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLuckyNumberRow(int index, Map<String, dynamic> data, bool isDarkMode) {
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
              // List 6 numbers
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...numbers.map((n) => _buildBall(n)),
                    // + Icon
                    const Icon(Icons.add, size: 16, color: Colors.grey),
                    // Bonus number
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
