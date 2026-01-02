import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../providers/saju_provider.dart';
import '../../providers/mission_provider.dart';
import 'saju/widgets/saju_profile_screen.dart';
import 'fortune_pass_screen.dart';
import '../../services/cookie_service.dart';

class AccountManagementScreen extends ConsumerStatefulWidget {
  const AccountManagementScreen({super.key});

  @override
  ConsumerState<AccountManagementScreen> createState() => _AccountManagementScreenState();
}

class _AccountManagementScreenState extends ConsumerState<AccountManagementScreen> {
  Box? _fortuneBox;
  int _cookieCount = 0;

  bool _hasActivePass = false;

  @override
  void initState() {
    super.initState();
    _initHive();
    _checkFortunePass();
  }

  Future<void> _checkFortunePass() async {
    final cookieService = CookieService();
    final hasActive = await cookieService.hasActiveFortunePassSubscription();
    if (mounted) {
      setState(() {
        _hasActivePass = hasActive;
      });
    }
  }

  Future<void> _initHive() async {
    _fortuneBox = await Hive.openBox('fortune');
    if (mounted) {
      setState(() {
        _cookieCount = _fortuneBox?.get('cookies', defaultValue: 0) ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sajuState = ref.watch(sajuProvider);
    final userName = sajuState.mainProfile?.name ?? "사용자";
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFFF8F9FA);
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none, color: textColor), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings_outlined, color: textColor), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: const Text('🐷', style: TextStyle(fontSize: 30)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "회원",
                          style: TextStyle(color: Colors.grey[500], fontSize: 14),
                        ),
                        Text(
                          userName,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SajuProfileScreen()),
                      );
                    },
                    child: Text(
                      "사주정보 관리",
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            // Main Card (Cookies & Passes)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Fortune Cookies
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("포춘쿠키", style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "${ref.watch(missionProvider).fortuneCookieCount}",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.chevron_right, color: Colors.grey[400]),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FortunePassScreen(initialTabIndex: 0),
                            ),
                          ).then((_) => _initHive());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFF176),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: const Text("무료충전", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),
                  // Fortune Passes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("포춘패스", style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                _hasActivePass ? "무제한 이용 중" : "무제한 미구독",
                                style: TextStyle(
                                  color: _hasActivePass ? Colors.blue[600] : textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.chevron_right, color: Colors.grey[400]),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FortunePassScreen(initialTabIndex: 1),
                            ),
                          ).then((_) {
                            _initHive();
                            _checkFortunePass();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2C2C2C),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text(_hasActivePass ? "구독 관리" : "구독하기", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Secondary Actions
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.assignment_outlined, "구매내역", textColor),
                  _buildActionButton(Icons.confirmation_number_outlined, "쿠폰함", textColor),
                  _buildActionButton(Icons.favorite_border, "찜", textColor),
                  _buildActionButton(Icons.chat_bubble_outline, "상담내역", textColor),
                  _buildActionButton(Icons.edit_outlined, "후기관리", textColor),
                ],
              ),
            ),

            // Banner
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB388FF), Color(0xFF8C9EFF)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: Icon(Icons.face, size: 80, color: Colors.white.withOpacity(0.3)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "상담 이용 가이드",
                            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "1:1 실시간 상담 이용가이드",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
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

  Widget _buildActionButton(IconData icon, String label, Color textColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.black87, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 12)),
      ],
    );
  }
}
