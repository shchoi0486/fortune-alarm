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

  Future<void> _loadInterstitialAd() async {
    if (_isInterstitialAdLoading || _isInterstitialAdLoaded) return;

    // 1. 먼저 AdService에서 사전 로드된 광고가 있는지 확인
    final preloadedAd = await AdService.getPreloadedInterstitialAd();
    if (preloadedAd != null) {
      debugPrint('Using preloaded InterstitialAd from AdService');
      _setupInterstitialAd(preloadedAd);
      return;
    }

    _isInterstitialAdLoading = true;
    InterstitialAd.load(
      adUnitId: AdService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd loaded successfully');
          _isInterstitialAdLoading = false;
          _setupInterstitialAd(ad);
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
                const SnackBar(content: Text('광고 로드에 실패했습니다. 네트워크 연결을 확인하고 다시 시도해주세요.')),
              );
            }
          }
        },
      ),
    );
  }

  void _setupInterstitialAd(InterstitialAd ad) {
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
  }

  Future<void> _loadRewardedAd() async {
    if (_isRewardedAdLoading || _isRewardedAdLoaded) return; // 이미 로딩 중이거나 로드된 경우 중단

    // 1. 먼저 AdService에서 사전 로드된 광고가 있는지 확인
    final preloadedAd = await AdService.getPreloadedRewardedAd();
    if (preloadedAd != null) {
      debugPrint('Using preloaded RewardedAd from AdService');
      _setupRewardedAd(preloadedAd);
      return;
    }

    _isRewardedAdLoading = true;
    RewardedAd.load(
      adUnitId: AdService.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('RewardedAd loaded successfully');
          _isRewardedAdLoading = false;
          _setupRewardedAd(ad);
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
                const SnackBar(content: Text('광고 로드에 실패했습니다. 네트워크 연결을 확인하고 다시 시도해주세요.')),
              );
            }
          }
        },
      ),
    );
  }

  void _setupRewardedAd(RewardedAd ad) {
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

  void showInterstitialAd(VoidCallback onAccessGranted) {
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

  void showRewardedAd(VoidCallback onAccessGranted) {
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
          const SnackBar(
            content: Text('네트워크 상태가 불안정하여 광고를 불러오지 못했습니다. 잠시 후 다시 시도해주세요.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }

  Future<void> showFortuneAccessDialog(VoidCallback onAccessGranted, {VoidCallback? onDirectAccess, bool isInterstitial = false}) async {
    if (!mounted) return;
    
    _useInterstitial = isInterstitial;

    // 1. 병렬로 체크하여 속도 개선 (최대 1.5초 대기)
    try {
      final results = await Future.wait([
        _cookieService.hasActiveFortunePassSubscription().timeout(
          const Duration(milliseconds: 1500),
          onTimeout: () => false,
        ),
        _cookieService.getCookieCount().timeout(
          const Duration(milliseconds: 1500),
          onTimeout: () => 0,
        ),
      ]).catchError((e) {
        debugPrint('Error checking background status: $e');
        return [false, 0];
      });

      final hasPass = results[0] as bool;
      if (hasPass) {
        if (onDirectAccess != null) {
          onDirectAccess();
        } else {
          onAccessGranted();
        }
        return;
      }
    } catch (e) {
      debugPrint('Error in showFortuneAccessDialog parallel check: $e');
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
                        showInterstitialAd(onAccessGranted);
                      } else {
                        showRewardedAd(onAccessGranted);
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
                      // 1. Check if user has active fortune pass (unlimited access)
                      final hasPass = await _cookieService.hasActiveFortunePassSubscription();
                      if (hasPass) {
                        if (!mounted) return;
                        Navigator.pop(context); // Close dialog
                        if (onDirectAccess != null) {
                          onDirectAccess();
                        } else {
                          onAccessGranted();
                        }
                        return;
                      }

                      // 2. Check cookie balance
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
                              '보유한 포춘쿠키가 부족합니다.\n미션을 수행하거나 광고를 보고 무료로 충전할 수 있습니다.',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('확인'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }

                      // Deduct cookies and grant access
                      final success = await _cookieService.useCookies(2);
                      if (success) {
                        if (!mounted) return;
                        Navigator.pop(context); // Close dialog
                        if (onDirectAccess != null) {
                          onDirectAccess();
                        } else {
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
                        const Icon(Icons.cookie, size: 24, color: Colors.orangeAccent),
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
