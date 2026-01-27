import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
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

    // 1. Try to get preloaded ad from AdService
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

    // 2. If not, load new one (fallback)
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
            _isRewardedAdLoading = false;
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
            _isRewardedAdLoading = false;
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
        SnackBar(content: Text(AppLocalizations.of(context)!.adLoadError)),
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
        content: Text(AppLocalizations.of(context)!.earnCookies(1)),
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
      'fortune_pass_yearly_sale',
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
    // Update subscription status in AdService
    AdService.isSubscriber = hasActive;
    
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
        SnackBar(content: Text(AppLocalizations.of(context)!.fortunePassPaymentFailed)),
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
            SnackBar(content: Text(AppLocalizations.of(context)!.fortunePassPaymentFailed)),
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
    if (id != 'fortune_pass_monthly' && 
        id != 'fortune_pass_6months' && 
        id != 'fortune_pass_yearly' && 
        id != 'fortune_pass_yearly_sale') return;

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
          SnackBar(content: Text(AppLocalizations.of(context)!.fortunePassApplyFailed)),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.fortunePassApplied)),
      );
    } finally {
      if (mounted) setState(() => _isPurchasing = false);
    }
  }

  Future<void> _restorePurchases() async {
    if (_isPurchasing) return;
    setState(() => _isPurchasing = true);
    try {
      await _iap.restorePurchases();
      if (!mounted) return;
      await _refreshSubscriptionStatus();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.fortunePassRestored)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.fortunePassRestoreFailed)),
      );
    } finally {
      if (mounted) setState(() => _isPurchasing = false);
    }
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
    final l10n = AppLocalizations.of(context)!;
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
            Text(
              l10n.fortunePassTimeSaleTitle,
              style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
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
                    Text(
                      l10n.fortunePassOffLabel(50).split(" ").last,
                      style: const TextStyle(color: Colors.redAccent, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.fortunePassTimeSalePriceOriginal("58,800"),
              style: const TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.lineThrough),
            ),
            Text(
              l10n.fortunePassTimeSalePriceDiscount("29,400"),
              style: const TextStyle(color: Colors.redAccent, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.fortunePassTimeSaleBadge,
              style: const TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold),
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
                child: Text(
                  l10n.fortunePassTimeSaleButton,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                l10n.fortunePassTimeSaleCancel,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startCountdown() {
    final l10n = AppLocalizations.of(context)!;
    _cookieService.startDiscountTimer(const Duration(minutes: 3));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.fortunePassTimeSaleStartMessage),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
          title: Text(l10n.fortunePassTitle, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
          iconTheme: IconThemeData(color: textColor),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            labelColor: isDark ? Colors.white : Colors.blueAccent,
            unselectedLabelColor: isDark ? Colors.grey : Colors.grey[400],
            tabs: [
              Tab(text: l10n.fortunePassTabFree),
              Tab(text: l10n.fortunePassTabPremium),
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
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCurrentPassCard(isDark, cardColor, borderColor, textColor, subTextColor),
          const SizedBox(height: 20),
          Text(
            l10n.fortunePassFreeChargeTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _showRewardedAd,
            icon: const Icon(Icons.play_circle_filled),
            label: Text(l10n.fortunePassFreeChargeButton),
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
    final l10n = AppLocalizations.of(context)!;
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
                          _hasActiveSubscription ? l10n.fortunePassActivePlan : l10n.fortunePassNoSubscription,
                          style: TextStyle(fontWeight: FontWeight.bold, color: subTextColor),
                        ),
                        TextButton(
                          onPressed: _isStoreAvailable ? _restorePurchases : null,
                          child: Text(l10n.fortunePassRestore, style: const TextStyle(color: Colors.blueAccent)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                _buildSubscriptionCard(
                  title: l10n.fortunePassMonth1Title,
                  productId: 'fortune_pass_monthly',
                  description: l10n.fortunePassMonth1Desc,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  textColor: textColor,
                  subTextColor: subTextColor,
                ),
                _buildSubscriptionCard(
                  title: l10n.fortunePassMonth6Title,
                  productId: 'fortune_pass_6months',
                  description: l10n.fortunePassMonth6Desc,
                  isDark: isDark,
                  cardColor: cardColor,
                  borderColor: borderColor,
                  textColor: textColor,
                  subTextColor: subTextColor,
                ),
                _buildSubscriptionCard(
                  title: l10n.fortunePassYear1Title,
                  productId: 'fortune_pass_yearly',
                  description: l10n.fortunePassYear1Desc,
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
                  String targetId = _selectedProductId;
                  // Change to sale product ID if time sale is active
                  if (_remainingDiscountSeconds > 0 && targetId == 'fortune_pass_yearly') {
                    targetId = 'fortune_pass_yearly_sale';
                  }
                  
                  final product = _productById(targetId);
                  if (product != null) {
                    _buy(product);
                  } else {
                    // Show error dialog if store info is missing
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(l10n.fortunePassStoreErrorTitle),
                        content: Text(l10n.fortunePassStoreErrorContent),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(l10n.confirm),
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
                    : Text(_remainingDiscountSeconds > 0 ? l10n.fortunePassSubscribeSale(50) : l10n.fortunePassSubscribeNow, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCurrentPassCard(bool isDark, Color cardColor, Color borderColor, Color textColor, Color subTextColor) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.fortunePassMyCookies,
                style: TextStyle(fontSize: 14, color: subTextColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Text("🍪", style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      "$_cookieCount",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.fortunePassCurrentStatus,
                style: TextStyle(fontSize: 14, color: subTextColor),
              ),
              Text(
                _hasActiveSubscription ? l10n.fortunePassStatusPremium : l10n.fortunePassStatusFree,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _hasActiveSubscription ? Colors.blueAccent : subTextColor,
                ),
              ),
            ],
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
    final l10n = AppLocalizations.of(context)!;
    final product = _productById(productId);
    
    // Price setting (Based on 4,900 KRW)
    int originalMonthlyPrice = 4900;
    int currentMonthlyPrice = 0;
    int totalPlanPrice = 0;
    int originalTotalPlanPrice = 0; // Add regular price
    String planUnit = "";
    String discountLabel = "";
    bool isDiscountedPlan = false;

    if (productId == 'fortune_pass_monthly') {
      currentMonthlyPrice = 4900;
      planUnit = l10n.fortunePassUnitMonth;
    } else if (productId == 'fortune_pass_6months') {
      currentMonthlyPrice = 3900; 
      totalPlanPrice = 23400;
      originalTotalPlanPrice = 29400; // 4900 * 6
      planUnit = l10n.fortunePassUnit6Months;
      discountLabel = l10n.fortunePassOffLabel(20);
      isDiscountedPlan = true;
    } else if (productId == 'fortune_pass_yearly') {
      currentMonthlyPrice = 3200; 
      totalPlanPrice = 38400;
      originalTotalPlanPrice = 58800; // 4900 * 12
      planUnit = l10n.fortunePassUnitYear;
      discountLabel = l10n.fortunePassOffLabel(35);
      isDiscountedPlan = true;
    }

    // Apply 3-minute time sale (50% discount for 12-month plan only)
    final isTimeSaleActive = _remainingDiscountSeconds > 0;
    if (isTimeSaleActive && productId == 'fortune_pass_yearly') {
      currentMonthlyPrice = 2450; 
      totalPlanPrice = 29400;     
      originalTotalPlanPrice = 58800; // Regular price is still 58,800 KRW during time sale
      discountLabel = l10n.fortunePassTimeSaleLabel(50);
      isDiscountedPlan = true;
    }

    String priceText = "₩${currentMonthlyPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}";
    
    // Generate regular price text
    String originalPriceText = originalTotalPlanPrice > 0 
        ? "₩${originalTotalPlanPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}"
        : "";

    String detailPriceText = totalPlanPrice > 0 
        ? l10n.fortunePassTotalPrice("₩${totalPlanPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}", planUnit)
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
                child: Text(
                  l10n.fortunePassBestPlan,
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
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
                  // Selection radio button
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
                  // Product name and description
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
                  // Price information
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          if (isTimeSaleActive && productId == 'fortune_pass_yearly') ...[
                            Text(
                              "₩4,900",
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
                            l10n.fortunePassPerMonth,
                            style: TextStyle(
                              color: subTextColor, 
                              fontSize: 13, 
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          if (isDiscountedPlan && originalPriceText.isNotEmpty)
                            Text(
                              originalPriceText,
                              style: TextStyle(
                                color: isDark ? Colors.white38 : Colors.black38,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.0,
                              ),
                            ),
                          if (isDiscountedPlan && originalPriceText.isNotEmpty)
                            const SizedBox(width: 4),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
