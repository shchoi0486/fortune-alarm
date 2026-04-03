import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

import '../../main.dart';
import '../../services/ad_service.dart';
import '../../widgets/ad_widgets.dart';
import '../../providers/bottom_nav_provider.dart';
import '../../core/navigation/app_navigator.dart';

class WakeUpSummaryScreen extends ConsumerStatefulWidget {
  const WakeUpSummaryScreen({super.key});

  @override
  ConsumerState<WakeUpSummaryScreen> createState() => _WakeUpSummaryScreenState();
}

class _WakeUpSummaryScreenState extends ConsumerState<WakeUpSummaryScreen> {
  @override
  void initState() {
    super.initState();
    // 자동 종료 타이머 제거 - 사용자가 광고를 충분히 보고 직접 종료하도록 유도
  }

  void _closeToMain() {
    if (!mounted) return;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    ref.read(bottomNavProvider.notifier).state = 0;
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/main', (route) => false);
  }

  String _getRandomGreeting(AppLocalizations l10n) {
    final greetings = [
      l10n.goodDay,
      l10n.luckyDay,
      l10n.cheerUp,
      l10n.stayHappy,
      l10n.youCanDoIt,
    ];
    // 매번 다른 메시지를 보여주기 위해 시간 기반 시드 사용
    final random = math.Random(DateTime.now().millisecond);
    return greetings[random.nextInt(greetings.length)];
  }

  IconData _getGreetingIcon() {
    return Icons.auto_awesome_rounded;
  }

  Color _getGreetingColor() {
    return Colors.amberAccent;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final timeString = DateFormat('h:mm').format(now);
    final amPmString = DateFormat('a').format(now);
    final dateString = DateFormat(l10n.dateFormatMdyE, l10n.localeName).format(now);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 행운 아이콘
                      Icon(
                        _getGreetingIcon(),
                        color: _getGreetingColor(),
                        size: 64,
                      ),
                      const SizedBox(height: 24),
                      
                      // 응원 메시지
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          _getRandomGreeting(l10n),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                      // 현재 날짜
                      Text(
                        dateString,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // 현재 시간
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            timeString,
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            amPmString,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      
                      // 확인 버튼 (기다리지 않고 바로 가고 싶은 사용자를 위함)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: _closeToMain,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.3), // 불투명도 상향 (0.15 -> 0.3)
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.5), // 테두리 강조
                                width: 1.2,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            l10n.close,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // 하단 네이티브 광고 영역 (영상/이미지 노출 최적화 및 디자인 통일)
              if (!AdService.isSubscriber)
                ListAdWidget(
                  height: 215,
                  factoryId: 'dialogAd', // [수정] 영상/이미지가 꽉 차는 레이아웃 사용
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  backgroundColor: Colors.white.withOpacity(0.05),
                  borderRadius: 16,
                  showBorder: true,
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  showShadow: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
