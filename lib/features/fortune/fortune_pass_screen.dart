import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FortunePassScreen extends StatefulWidget {
  const FortunePassScreen({super.key});

  @override
  State<FortunePassScreen> createState() => _FortunePassScreenState();
}

class _FortunePassScreenState extends State<FortunePassScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _cookieCount = 0;
  Box? _fortuneBox;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initHive();
  }

  Future<void> _initHive() async {
    _fortuneBox = await Hive.openBox('fortune');
    if (mounted) {
      setState(() {
        _cookieCount = _fortuneBox?.get('cookies', defaultValue: 0) ?? 0;
      });
    }
  }

  void _updateCookies(int count) {
    setState(() {
      _cookieCount = count;
    });
    _fortuneBox?.put('cookies', count);
  }

  Future<void> _simulateAd() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.pop(context);
      _updateCookies(_cookieCount + 1);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('포춘패스를 획득했습니다! (현재: $_cookieCount개)'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("포춘패스 충전소"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "무료 충전소"),
            Tab(text: "포춘패스 구독"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFreeChargeTab(),
          _buildSubscriptionTab(),
        ],
      ),
    );
  }

  Widget _buildFreeChargeTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCurrentPassCard(),
          const SizedBox(height: 20),
          const Text(
            "광고를 보고 무료로 포춘패스를 충전하세요!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _simulateAd,
            icon: const Icon(Icons.play_circle_filled),
            label: const Text("광고 보고 무료 충전 (+1개)"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSubscriptionCard(
            title: "1개월 구독",
            price: "₩2,900",
            description: "월 정액제",
          ),
          const SizedBox(height: 16),
          _buildSubscriptionCard(
            title: "3개월 구독",
            price: "₩7,500",
            originalPrice: "₩8,700",
            description: "90일 정액제",
            isBest: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPassCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "나의 포춘패스",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                "보유량",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.stars, color: Colors.amber, size: 30),
              const SizedBox(width: 8),
              Text(
                "$_cookieCount",
                style: const TextStyle(color: Colors.amber, fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String price,
    String? originalPrice,
    required String description,
    bool isBest = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isBest ? Border.all(color: Colors.amber, width: 2) : Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBest)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "BEST",
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              if (originalPrice != null) ...[
                const SizedBox(width: 8),
                Text(
                  originalPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('준비 중인 기능입니다.')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A2E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("지금 시작하기"),
            ),
          ),
        ],
      ),
    );
  }
}
