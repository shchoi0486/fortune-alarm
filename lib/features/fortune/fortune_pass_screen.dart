import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../services/ad_service.dart';
import '../../services/cookie_service.dart';

class FortunePassScreen extends StatefulWidget {
  final int initialTabIndex;
  const FortunePassScreen({super.key, this.initialTabIndex = 0});

  @override
  State<FortunePassScreen> createState() => _FortunePassScreenState();
}

class _FortunePassScreenState extends State<FortunePassScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _cookieCount = 0;
  final InAppPurchase _iap = InAppPurchase.instance;
  final CookieService _cookieService = CookieService();
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;
  StreamSubscription<int>? _cookieCountSubscription;
  bool _isStoreAvailable = false;
  bool _isLoadingProducts = true;
  bool _isPurchasing = false;
  List<ProductDetails> _products = [];
  bool _hasActiveSubscription = false;
  String _selectedProductId = 'fortune_pass_monthly';

  RewardedAd? _rewardedAd;
  bool _isRewardedAdLoaded = false;
  bool _isRewardedAdLoading = false;
  bool _rewardEarned = false;

  StreamSubscription<int>? _discountTimerSubscription;
  int _remainingDiscountSeconds = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, 
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
    _initCookieCount();
    _initPurchases();
    _loadRewardedAd();
    _initDiscountTimer();
  }

  void _initDiscountTimer() {
    _discountTimerSubscription?.cancel();
    _discountTimerSubscription = _cookieService.discountTimerStream.listen((seconds) {
      if (!mounted) return;
      setState(() {
        _remainingDiscountSeconds = seconds;
      });
    });
  }

  Future<void> _loadRewardedAd() async {
    if (_isRewardedAdLoading || _isRewardedAdLoaded) return;
    
    setState(() => _isRewardedAdLoading = true);

    // 1. AdService에서 사전 로드된 광고 가져오기 시도
    final preloadedAd = await AdService.getPreloadedRewardedAd();
    
    if (preloadedAd != null) {
      debugPrint('Using preloaded RewardedAd in FortunePassScreen');
      if (!mounted) {
        preloadedAd.dispose();
        return;
      }
      _setupRewardedAd(preloadedAd);
      return;
    }

    // 2. 없으면 새로 로드 (AdService를 통하지 않고 직접 로드하는 것은 폴백용)
    RewardedAd.load(
      adUnitId: AdService.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('RewardedAd loaded successfully in FortunePassScreen (Direct)');
          if (!mounted) {
            ad.dispose();
            return;
          }
          _setupRewardedAd(ad);
        },
        onAdFailedToLoad: (error) {
          debugPrint('RewardedAd failed to load: $error');
          if (mounted) {
            setState(() {
              _isRewardedAdLoading = false;
              _isRewardedAdLoaded = false;
            });
          }
        },
      ),
    );
  }

  void _setupRewardedAd(RewardedAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        if (mounted) {
          setState(() {
            _rewardedAd = null;
            _isRewardedAdLoaded = false;
          });
        }
        if (_rewardEarned) {
          _rewardEarned = false;
          _onRewardCompleted();
        }
        _loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        if (mounted) {
          setState(() {
            _rewardedAd = null;
            _isRewardedAdLoaded = false;
          });
        }
        _loadRewardedAd();
      },
    );

    setState(() {
      _rewardedAd = ad;
      _isRewardedAdLoaded = true;
      _isRewardedAdLoading = false;
    });
  }

  void _showRewardedAd() {
    if (_rewardedAd == null || !_isRewardedAdLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('광고를 불러오는 중입니다. 잠시 후 다시 시도해주세요.')),
      );
      _loadRewardedAd();
      return;
    }

    _rewardEarned = false;
    _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
      _rewardEarned = true;
    });
  }

  Future<void> _onRewardCompleted() async {
    await _cookieService.addCookies(1);
    final latest = await _cookieService.getCookieCount();
    _updateCookies(latest);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('포춘쿠키를 획득했습니다! (현재: $_cookieCount개)'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _initCookieCount() async {
    final current = await _cookieService.getCookieCount();
    if (!mounted) return;
    setState(() {
      _cookieCount = current;
    });

    await _cookieCountSubscription?.cancel();
    _cookieCountSubscription = _cookieService.cookieCountStream.listen((count) {
      if (!mounted) return;
      if (_cookieCount == count) return;
      setState(() {
        _cookieCount = count;
      });
    });
  }

  Future<void> _initPurchases() async {
    _purchaseSubscription?.cancel();
    _purchaseSubscription = _iap.purchaseStream.listen(
      _onPurchaseUpdated,
      onError: (_) {},
    );

    final isAvailable = await _iap.isAvailable();
    if (!mounted) return;
    setState(() {
      _isStoreAvailable = isAvailable;
    });

    if (!isAvailable) {
      if (!mounted) return;
      setState(() {
        _isLoadingProducts = false;
      });
      await _refreshSubscriptionStatus();
      return;
    }

    const productIds = <String>{
      'fortune_pass_monthly',
      'fortune_pass_6months',
      'fortune_pass_yearly',
    };

    final response = await _iap.queryProductDetails(productIds);
    if (!mounted) return;
    setState(() {
      _products = response.productDetails;
      _isLoadingProducts = false;
    });
    await _refreshSubscriptionStatus();
  }

  Future<void> _refreshSubscriptionStatus() async {
    final hasActive = await _cookieService.hasActiveFortunePassSubscription();
    if (!mounted) return;
    setState(() {
      _hasActiveSubscription = hasActive;
    });
  }

  void _updateCookies(int count) {
    if (!mounted) return;
    setState(() {
      _cookieCount = count;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _purchaseSubscription?.cancel();
    _cookieCountSubscription?.cancel();
    _discountTimerSubscription?.cancel();
    _rewardedAd?.dispose();
    super.dispose();
  }

  ProductDetails? _productById(String id) {
    for (final p in _products) {
      if (p.id == id) return p;
    }
    return null;
  }

  Future<void> _buy(ProductDetails product) async {
    if (_isPurchasing) return;
    setState(() => _isPurchasing = true);
    try {
      final param = PurchaseParam(productDetails: product);
      await _iap.buyNonConsumable(purchaseParam: param);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isPurchasing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('결제 요청에 실패했습니다.')),
      );
    }
  }

  Future<void> _onPurchaseUpdated(List<PurchaseDetails> purchases) async {
    bool anyPending = false;
    for (final purchase in purchases) {
      if (purchase.status == PurchaseStatus.pending) {
        anyPending = true;
        continue;
      }

      if (purchase.status == PurchaseStatus.error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('결제에 실패했습니다.')),
          );
        }
      }

      if (purchase.status == PurchaseStatus.purchased || purchase.status == PurchaseStatus.restored) {
        await _deliverPurchase(purchase);
      }

      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }

    if (!mounted) return;
    setState(() => _isPurchasing = anyPending);
  }

  Future<void> _deliverPurchase(PurchaseDetails purchase) async {
    final id = purchase.productID;
    if (id != 'fortune_pass_monthly' && id != 'fortune_pass_6months' && id != 'fortune_pass_yearly') return;

    String rawKey = purchase.purchaseID?.trim() ?? '';
    if (rawKey.isEmpty) rawKey = purchase.verificationData.serverVerificationData.trim();
    if (rawKey.isEmpty) rawKey = purchase.verificationData.localVerificationData.trim();
    if (rawKey.isEmpty) rawKey = '${purchase.productID}_${purchase.transactionDate ?? ''}';

    try {
      final applied = await _cookieService.applyFortunePassPurchase(
        purchaseKey: _cookieService.makePurchaseKey(rawKey),
        productId: id,
        source: purchase.verificationData.source,
        purchaseToken: purchase.verificationData.serverVerificationData,
        serverVerificationData: purchase.verificationData.serverVerificationData,
        localVerificationData: purchase.verificationData.localVerificationData,
        purchaseId: purchase.purchaseID,
        transactionDate: purchase.transactionDate,
      );
      if (!mounted) return;
      await _refreshSubscriptionStatus();
      if (!mounted) return;
      if (!applied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('구독 적용에 실패했습니다. 네트워크를 확인해주세요.')),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('포춘패스 구독이 적용되었습니다.')),
      );
    } finally {
      if (mounted) setState(() => _isPurchasing = false);
    }
  }

  Future<void> _restorePurchases() async {
    if (_isPurchasing) return;
    setState(() => _isPurchasing = true);
    await _iap.restorePurchases();
    if (!mounted) return;
    await _refreshSubscriptionStatus();
    if (!mounted) return;
    setState(() => _isPurchasing = false);
  }

  static bool _hasShownDiscountPopup = false;

  Future<bool> _onWillPop() async {
    if (_hasActiveSubscription || _hasShownDiscountPopup) return true;

    _hasShownDiscountPopup = true;
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildDiscountPopup(context),
    );
    return result ?? false;
  }

  Widget _buildDiscountPopup(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
          border: Border.all(color: Colors.redAccent.withOpacity(0.3), width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context, true),
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const Text(
              "잠깐만요! 선물이 도착했어요 🎁",
              style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.card_giftcard,
                  size: 150,
                  color: Colors.redAccent.withOpacity(0.05),
                ),
                Column(
                  children: [
                    const Text(
                      "50%",
                      style: TextStyle(color: Colors.redAccent, fontSize: 60, fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      "OFF",
                      style: TextStyle(color: Colors.redAccent, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "기본 가격 연 ₩34,800",
              style: TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.lineThrough),
            ),
            const Text(
              "연 ₩17,400",
              style: TextStyle(color: Colors.black87, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "3분 내 구독 시 50% 할인 혜택!",
              style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                  _startCountdown();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text(
                  "할인받고 프로 시작하기",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                "아쉽지만 다음에 할게요",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startCountdown() {
    _cookieService.startDiscountTimer(const Duration(minutes: 3));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('3분 할인 혜택이 시작되었습니다! 상단 배너를 확인하세요.'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF1A1A2E) : Colors.white;
    final cardColor = isDark ? Colors.white.withOpacity(0.05) : const Color(0xFFF8F9FA);
    final borderColor = isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05);
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text("포춘패스 프리미엄", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
          iconTheme: IconThemeData(color: textColor),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            labelColor: isDark ? Colors.white : Colors.blueAccent,
            unselectedLabelColor: isDark ? Colors.grey : Colors.grey[400],
            tabs: const [
              Tab(text: "무료 충전소"),
              Tab(text: "포춘패스 구독"),
            ],
          ),
        ),
        body: SafeArea(
          bottom: true,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildFreeChargeTab(isDark, cardColor, borderColor, textColor, subTextColor),
              _buildSubscriptionTab(isDark, cardColor, borderColor, textColor, subTextColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFreeChargeTab(bool isDark, Color cardColor, Color borderColor, Color textColor, Color subTextColor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCurrentPassCard(isDark, cardColor, borderColor, textColor, subTextColor),
          const SizedBox(height: 20),
          Text(
            "광고를 보고 무료로 포춘쿠키를 충전하세요!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _showRewardedAd,
            icon: const Icon(Icons.play_circle_filled),
            label: const Text("광고 보고 무료 충전 (+1개)"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionTab(bool isDark, Color cardColor, Color borderColor, Color textColor, Color subTextColor) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (_isLoadingProducts)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(child: CircularProgressIndicator(color: Colors.blueAccent)),
                  )
                else ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _hasActiveSubscription ? "현재 구독 중인 요금제" : "구독 정보가 없습니다",
                          style: TextStyle(fontWeight: FontWeight.bold, color: subTextColor),
                        ),
                        TextButton(
                          onPressed: _isStoreAvailable ? _restorePurchases : null,
                          child: const Text("복원하기", style: TextStyle(color: Colors.blueAccent)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                _buildSubscriptionCard(
                  title: "1개월 구독",
                  productId: 'fortune_pass_monthly',
                  description: "월 정액제",
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  textColor: textColor,
                  subTextColor: subTextColor,
                ),
                _buildSubscriptionCard(
                  title: "6개월 구독",
                  productId: 'fortune_pass_6months',
                  description: "180일 정액제",
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  textColor: textColor,
                  subTextColor: subTextColor,
                ),
                _buildSubscriptionCard(
                  title: "12개월 구독",
                  productId: 'fortune_pass_yearly',
                  description: "1년 정액제",
                  isBest: true,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  textColor: textColor,
                  subTextColor: subTextColor,
                ),
              ],
            ),
          ),
        ),
        if (!_hasActiveSubscription)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isPurchasing ? null : () {
                  final product = _productById(_selectedProductId);
                  if (product != null) {
                    _buy(product);
                  } else {
                    // 스토어 정보가 없을 때 안내 팝업 표시
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("구독 불가"),
                        content: const Text("현재 스토어에서 상품 정보를 가져올 수 없습니다.\n\n[확인 사항]\n1. Google Play / App Store 로그인 상태\n2. 인터넷 연결 확인\n3. 테스트 기기 등록 여부"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("확인"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _remainingDiscountSeconds > 0 ? Colors.redAccent : Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: _isPurchasing 
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : Text(_remainingDiscountSeconds > 0 ? "50% 할인 받고 구독하기" : "지금 바로 구독하기", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCurrentPassCard(bool isDark, Color cardColor, Color borderColor, Color textColor, Color subTextColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.cookie, color: Colors.blueAccent),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "보유 중인 포춘쿠키",
                  style: TextStyle(color: subTextColor, fontSize: 13),
                ),
                Text(
                  "$_cookieCount개",
                  style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (_hasActiveSubscription)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "패스 사용 중",
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String productId,
    required String description,
    required bool isDark,
    required Color cardColor,
    required Color borderColor,
    required Color textColor,
    required Color subTextColor,
    bool isBest = false,
  }) {
    final product = _productById(productId);
    
    // 가격 설정 (3,900원 기준)
    int originalMonthlyPrice = 3900;
    int currentMonthlyPrice = 0;
    int totalPlanPrice = 0;
    String planUnit = "";
    String discountLabel = "";
    bool isDiscountedPlan = false;

    if (productId == 'fortune_pass_monthly') {
      currentMonthlyPrice = 3900;
      planUnit = "월 정가";
    } else if (productId == 'fortune_pass_6months') {
      currentMonthlyPrice = 3300; // 19,800 / 6
      totalPlanPrice = 19800;
      planUnit = "6개월";
      discountLabel = "15% OFF";
      isDiscountedPlan = true;
    } else if (productId == 'fortune_pass_yearly') {
      currentMonthlyPrice = 2900; // 34,800 / 12
      totalPlanPrice = 34800;
      planUnit = "년";
      discountLabel = "25% OFF";
      isDiscountedPlan = true;
    }

    // 3분 타임세일 적용 (50% 할인)
    final isTimeSaleActive = _remainingDiscountSeconds > 0;
    if (isTimeSaleActive) {
      currentMonthlyPrice = (currentMonthlyPrice * 0.5).round();
      if (totalPlanPrice > 0) {
        totalPlanPrice = (totalPlanPrice * 0.5).round();
      }
      discountLabel = "50% 타임세일!";
    }

    String priceText = "₩${currentMonthlyPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}";
    String detailPriceText = totalPlanPrice > 0 
        ? "총 ₩${totalPlanPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} / $planUnit"
        : planUnit;

    final isSelected = _selectedProductId == productId;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isTimeSaleActive 
            ? Colors.redAccent.withOpacity(isDark ? 0.05 : 0.03) 
            : cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected 
              ? (isTimeSaleActive ? Colors.redAccent : Colors.blueAccent) 
              : borderColor,
          width: isSelected ? 2.5 : 1.5,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: (isTimeSaleActive ? Colors.redAccent : Colors.blueAccent).withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 2,
            ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isBest && !isTimeSaleActive)
            Positioned(
              left: 16,
              top: -12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  "인기 요금제",
                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          if (discountLabel.isNotEmpty)
            Positioned(
              right: -2,
              top: -12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  discountLabel,
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedProductId = productId;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  // 선택 라디오 버튼
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected 
                            ? (isTimeSaleActive ? Colors.redAccent : Colors.blueAccent) 
                            : (isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.1)),
                        width: 2,
                      ),
                      color: isSelected ? (isTimeSaleActive ? Colors.redAccent : Colors.blueAccent) : Colors.transparent,
                    ),
                    child: isSelected 
                        ? const Icon(Icons.check, size: 14, color: Colors.white) 
                        : null,
                  ),
                  const SizedBox(width: 14),
                  // 상품명 및 설명
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: textColor, 
                            fontSize: 16, 
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          style: TextStyle(color: subTextColor, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  // 가격 정보
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          if (isTimeSaleActive) ...[
                            Text(
                              "₩${(totalPlanPrice > 0 ? (productId == 'fortune_pass_6months' ? 3300 : 2900) : 3900).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                              style: TextStyle(
                                color: isDark ? Colors.white30 : Colors.black26,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            priceText,
                            style: TextStyle(
                              color: isTimeSaleActive 
                                  ? Colors.redAccent 
                                  : (isDiscountedPlan ? (isDark ? Colors.blueAccent : const Color(0xFF1976D2)) : textColor), 
                              fontSize: 22, 
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            " /월",
                            style: TextStyle(
                              color: subTextColor, 
                              fontSize: 13, 
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        detailPriceText,
                        style: TextStyle(
                          color: isDiscountedPlan || isTimeSaleActive ? subTextColor : (isDark ? Colors.white38 : Colors.black26), 
                          fontSize: 11,
                          fontWeight: isDiscountedPlan || isTimeSaleActive ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
