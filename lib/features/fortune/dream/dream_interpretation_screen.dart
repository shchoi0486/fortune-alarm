import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../widgets/ad_widgets.dart';
import '../mixins/fortune_access_mixin.dart';
import 'dream_service.dart';
import 'models/dream_result.dart';

class DreamInterpretationScreen extends StatefulWidget {
  const DreamInterpretationScreen({super.key});

  @override
  State<DreamInterpretationScreen> createState() => _DreamInterpretationScreenState();
}

class _DreamInterpretationScreenState extends State<DreamInterpretationScreen> with FortuneAccessMixin {
  final TextEditingController _textController = TextEditingController();
  final DreamService _dreamService = DreamService();
  final ScrollController _scrollController = ScrollController();
  
  bool _isLoading = true;
  DreamResult? _result;
  bool _isAnalyzing = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _dreamService.loadData();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _analyzeDream() async {
    if (_textController.text.trim().isEmpty) return;

    FocusScope.of(context).unfocus();

    // [수정] 광고 시청 또는 포춘쿠키 사용 확인 로직 추가
    final success = await showFortuneAccessDialog(() {
      // Access granted (ad watched or cookie used)
      _proceedWithAnalysis();
    });
    
    if (!success) {
      debugPrint('Dream analysis access denied or cancelled');
    }
  }

  void _proceedWithAnalysis() async {
    setState(() {
      _isAnalyzing = true;
      _result = null;
    });

    // Simulate "thinking" time for better UX
    await Future.delayed(const Duration(milliseconds: 800));

    final result = _dreamService.analyze(_textController.text);

    if (mounted) {
      setState(() {
        _result = result;
        _isAnalyzing = false;
      });
      // Scroll to result
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? Colors.purpleAccent : Colors.deepPurple;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.grey[50];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("꿈해몽 분석"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isDarkMode),
                  const SizedBox(height: 20),
                  _buildInputSection(isDarkMode, primaryColor),
                  const SizedBox(height: 30),
                  if (_isAnalyzing)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text("꿈 내용을 분석하고 있습니다..."),
                          ],
                        ),
                      ),
                    ),
                  if (_result != null) ...[
                    _buildResultSection(isDarkMode),
                    const SizedBox(height: 20),
                    // 해몽 결과 화면 하단 네이티브 광고 추가
                    const DetailedAdWidget(),
                  ],
                  const SizedBox(height: 50), // Bottom padding
                ],
              ),
            ),
    );
  }

  Widget _buildHeader(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "어젯밤,\n어떤 꿈을 꾸셨나요?",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "꿈 내용을 자유롭게 적어주시면\n키워드를 분석해 해몽을 알려드립니다.",
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 12),
        // 해몽 인트로 화면 네이티브 광고 추가
        const DetailedAdWidget(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInputSection(bool isDarkMode, Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            maxLines: 5,
            maxLength: 300,
            style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black87),
            decoration: InputDecoration(
              hintText: "예) 길에서 반짝이는 금반지를 주웠어.",
              hintStyle: TextStyle(color: isDarkMode ? Colors.grey[600] : Colors.grey[400]),
              border: InputBorder.none,
              counterText: "",
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _analyzeDream,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "무료 해몽 분석하기",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultSection(bool isDarkMode) {
    final result = _result!;
    Color resultColor;
    IconData resultIcon;
    
    if (result.totalScore >= 3) {
      resultColor = Colors.orange;
      resultIcon = Icons.wb_sunny_rounded;
    } else if (result.totalScore <= -3) {
      resultColor = Colors.blueGrey;
      resultIcon = Icons.cloud_queue_rounded;
    } else {
      resultColor = Colors.green;
      resultIcon = Icons.balance_rounded;
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: resultColor.withOpacity(0.5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: resultColor.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(resultIcon, size: 48, color: resultColor),
              const SizedBox(height: 16),
              Text(
                result.type,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                result.mainInterpretation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: isDarkMode ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                result.subInterpretation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: isDarkMode ? Colors.grey[300] : Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: resultColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.tips_and_updates, size: 18, color: resultColor),
                        const SizedBox(width: 8),
                        Text(
                          "조언",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: resultColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      result.advice,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: isDarkMode ? Colors.grey[300] : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "본 해몽은 재미와 참고용이며 실제 의미를 단정하지 않습니다.",
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
