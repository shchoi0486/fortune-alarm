import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:fortune_alarm/services/ad_service.dart';
import 'package:fortune_alarm/services/cookie_service.dart';

mixin FortuneAccessMixin<T extends StatefulWidget> on State<T> {
  final CookieService _cookieService = CookieService();
  RewardedAd? _rewardedAd;
  bool _isRewardedAdLoaded = false;
  bool _isRewardedAdLoading = false; // 보상형 광고 로딩 상태
  InterstitialAd? _interstitialAd; 
  bool _isInterstitialAdLoaded = false; 
  bool _isInterstitialAdLoading = false; // 전면 광고 로딩 상태

  bool _rewardEarned = false;
  bool _useInterstitial = false; // 현재 세션에서 전면 광고 사용 여부

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
    _loadInterstitialAd(); // 전면 광고 미리 로드
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadInterstitialAd() {
    if (_isInterstitialAdLoading || _isInterstitialAdLoaded) return;

    _isInterstitialAdLoading = true;
    InterstitialAd.load(
      adUnitId: AdService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd loaded successfully');
          _isInterstitialAdLoading = false;
          
          if (!mounted) {
            ad.dispose();
            return;
          }

          // 1. 콜백 설정 (Show 하기 전에 먼저 설정)
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('InterstitialAd dismissed');
              ad.dispose();
              if (mounted) {
                setState(() {
                  _interstitialAd = null;
                  _isInterstitialAdLoaded = false;
                });
              }
              _onAccessGrantedCallback?.call();
              _onAccessGrantedCallback = null;
              _loadInterstitialAd(); // 다음을 위해 미리 로드
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('InterstitialAd failed to show: $error');
              ad.dispose();
              if (mounted) {
                setState(() {
                  _interstitialAd = null;
                  _isInterstitialAdLoaded = false;
                });
              }
              _onAccessGrantedCallback?.call(); // 실패해도 일단 권한 부여
              _onAccessGrantedCallback = null;
              _loadInterstitialAd();
            },
          );

          setState(() {
            _interstitialAd = ad;
            _isInterstitialAdLoaded = true;
          });

          // 2. 전면 광고를 기다리고 있었다면 표시
          if (_isWaitingForAd && _useInterstitial) {
            _isWaitingForAd = false;
            debugPrint('Showing InterstitialAd from waiting state');
            if (mounted) {
              Navigator.of(context).pop(); // 로딩 다이얼로그 닫기
              ad.show();
            }
          }
        },
        onAdFailedToLoad: (error) {
          _isInterstitialAdLoading = false;
          debugPrint('InterstitialAd failed to load: $error');
          if (mounted) {
            setState(() {
              _isInterstitialAdLoaded = false;
            });
            if (_isWaitingForAd && _useInterstitial) {
              _isWaitingForAd = false;
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('광고를 불러오는데 실패했습니다.')),
              );
            }
          }
        },
      ),
    );
  }

  void _loadRewardedAd() {
    if (_isRewardedAdLoading || _isRewardedAdLoaded) return; // 이미 로딩 중이거나 로드된 경우 중단

    _isRewardedAdLoading = true;
    RewardedAd.load(
      adUnitId: AdService.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('RewardedAd loaded successfully');
          _isRewardedAdLoading = false;
          
          if (!mounted) {
            ad.dispose();
            return;
          }

          // 1. 콜백 설정 (Show 하기 전에 먼저 설정)
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('RewardedAd dismissed');
              ad.dispose();
              if (mounted) {
                setState(() {
                  _rewardedAd = null;
                  _isRewardedAdLoaded = false;
                });
              }
              
              // If reward was earned, execute callback now (when view is back)
              if (_rewardEarned) {
                _rewardEarned = false; // Reset flag
                _onAccessGrantedCallback?.call();
                _onAccessGrantedCallback = null;
              } else {
                // reward를 못 받았더라도 callback은 초기화해야 함
                _onAccessGrantedCallback = null;
              }
              
              _loadRewardedAd(); // Preload next one
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('RewardedAd failed to show: $error');
              ad.dispose();
              if (mounted) {
                setState(() {
                  _rewardedAd = null;
                  _isRewardedAdLoaded = false;
                });
              }
              _onAccessGrantedCallback?.call(); // 실패해도 일단 권한 부여
              _onAccessGrantedCallback = null;
              _loadRewardedAd();
            },
          );

          setState(() {
            _rewardedAd = ad;
            _isRewardedAdLoaded = true;
          });

          // 2. 보상형 광고를 기다리고 있었다면 표시
          if (_isWaitingForAd && !_useInterstitial) {
            _isWaitingForAd = false;
            debugPrint('Showing RewardedAd from waiting state');
            if (mounted) {
              Navigator.of(context).pop(); // Close loading dialog
              _showRewardedAdFromObject(ad); // Use helper to show with reward callback
            }
          }
        },
        onAdFailedToLoad: (error) {
          _isRewardedAdLoading = false; // 로딩 실패
          debugPrint('RewardedAd failed to load: $error');
          if (mounted) {
            setState(() {
              _isRewardedAdLoaded = false;
            });
            
            if (_isWaitingForAd && !_useInterstitial) {
              _isWaitingForAd = false;
              Navigator.of(context).pop(); // Close loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('광고를 불러오는데 실패했습니다. 다시 시도해주세요.')),
              );
            }
          }
        },
      ),
    );
  }

  // Helper to show rewarded ad with correct callback
  void _showRewardedAdFromObject(RewardedAd ad) {
    _rewardEarned = false;
    ad.show(onUserEarnedReward: (ad, reward) async {
      _rewardEarned = true;
      await _cookieService.addCookies(2);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('포춘쿠키 2개를 획득했습니다! 🎉')),
      );
      _cookieService.useCookies(2).then((success) {
         if (!success) debugPrint('Failed to deduct cookies after ad');
      });
    });
  }

  VoidCallback? _onAccessGrantedCallback;

  bool _isWaitingForAd = false;

  void _showInterstitialAd(VoidCallback onAccessGranted) {
    if (_interstitialAd != null && _isInterstitialAdLoaded) {
      _onAccessGrantedCallback = onAccessGranted;
      _interstitialAd!.show();
    } else {
      _isWaitingForAd = true;
      _useInterstitial = true;
      _onAccessGrantedCallback = onAccessGranted;
      
      _showLoadingDialog();
      _loadInterstitialAd();
    }
  }

  void _showRewardedAd(VoidCallback onAccessGranted) {
    if (_rewardedAd != null && _isRewardedAdLoaded) {
      _onAccessGrantedCallback = onAccessGranted;
      _showRewardedAdFromObject(_rewardedAd!);
    } else {
      // Show loading dialog instead of snackbar
      _isWaitingForAd = true;
      _useInterstitial = false;
      _onAccessGrantedCallback = onAccessGranted;
      
      _showLoadingDialog();
      _loadRewardedAd(); // Retry loading
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Colors.amber),
      ),
    );
    
    // 10초 후에도 광고가 로드되지 않으면 다이얼로그 닫기
    Future.delayed(const Duration(seconds: 10), () {
      if (_isWaitingForAd && mounted) {
        _isWaitingForAd = false;
        Navigator.of(context).pop(); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('광고를 불러오는 시간이 너무 오래 걸립니다. 네트워크를 확인해주세요.')),
        );
      }
    });
  }

  Future<void> showFortuneAccessDialog(VoidCallback onAccessGranted, {bool isInterstitial = false}) async {
    if (!mounted) return;
    
    _useInterstitial = isInterstitial;

    // Show loading dialog if needed, or just wait with timeout
    try {
      // 3초 타임아웃 추가 - 네트워크 지연 시 무한 대기 방지
      await _cookieService.getCookieCount().timeout(
        const Duration(seconds: 3),
        onTimeout: () => 0,
      );
    } catch (e) {
      debugPrint('Error getting cookie count: $e');
    }

    if (!mounted) return;

    // Show dialog
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon Header
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.auto_awesome, color: Colors.amber, size: 32),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Title
                Text(
                  '운세 확인하기',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Subtitle
                Text(
                  '운세 결과를 확인하고\n숨겨진 선물도 받아 가요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 32),
                
                // 1. Watch Ad Button (Primary)
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      if (_useInterstitial) {
                        _showInterstitialAd(onAccessGranted);
                      } else {
                        _showRewardedAd(onAccessGranted);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700), // Gold
                      foregroundColor: Colors.black87,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.play_circle_fill, color: Colors.black87, size: 24),
                        SizedBox(width: 10),
                        Text(
                          '광고 보고 무료 결과 보기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // 2. Use Cookies Button (Always visible)
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () async {
                      // Check balance first
                      final count = await _cookieService.getCookieCount();
                      
                      if (!mounted) return;

                      if (count < 2) {
                        // Insufficient cookies
                        if (!mounted) return;
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            title: Text(
                              '포춘쿠키 부족',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            content: Text(
                              '보유한 포춘쿠키가 부족합니다.\n광고를 보고 무료로 결과를 확인하시겠습니까?',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white70 : Colors.black87,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('취소', style: TextStyle(color: Colors.grey)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx); // Close alert
                                  if (mounted) Navigator.pop(context); // Close main dialog
                                  _showRewardedAd(onAccessGranted); // Watch ad
                                },
                                child: const Text('광고 보고 확인', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Sufficient cookies
                        if (mounted) Navigator.pop(context);
                        final success = await _cookieService.useCookies(2);
                        if (success) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('포춘쿠키 2개를 사용했습니다. 🥠')),
                          );
                          onAccessGranted();
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.white : Colors.black87,
                      side: BorderSide(
                        color: isDarkMode ? Colors.white24 : Colors.grey[300]!,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/cookie.png', width: 24, height: 24, errorBuilder: (c,o,s) => const Icon(Icons.cookie, size: 24)),
                        const SizedBox(width: 8),
                        const Flexible(
                            child: Text(
                              '포춘쿠키 2개 사용하기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
