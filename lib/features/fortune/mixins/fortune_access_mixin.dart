import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:fortune_alarm/services/ad_service.dart';
import 'package:fortune_alarm/services/cookie_service.dart';

mixin FortuneAccessMixin<T extends StatefulWidget> on State<T> {
  final CookieService _cookieService = CookieService();
  RewardedAd? _rewardedAd;
  bool _isRewardedAdLoading = false;
  bool _isRewardedAdLoaded = false;
  bool _lastRewardedAdHadTechnicalFailure = false;
  bool _lastRewardedAdWasUserCancelled = false;

  // 전면 광고 관련 필드 제거 (정책 준수)
  final bool _isInterstitialAdLoaded = false;

  bool _rewardEarned = false;
  Completer<bool>? _adCompleter;

  bool get lastRewardedAdHadTechnicalFailure => _lastRewardedAdHadTechnicalFailure;

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  // 전면 광고 관련 메서드 제거 (정책 준수를 위해 사용하지 않음)

  Future<void> _loadRewardedAd() async {
    if (_isRewardedAdLoading || _isRewardedAdLoaded) return; 

    _isRewardedAdLoading = true;

    // 1. 먼저 AdService에서 사전 로드된 광고가 있는지 확인
    try {
      final preloadedAd = await AdService.getPreloadedRewardedAd();
      
      if (preloadedAd != null) {
        debugPrint('Using preloaded RewardedAd from AdService');
        _isRewardedAdLoading = false;
        // 마운트 여부 확인 후 설정
        if (mounted) {
          _setupRewardedAd(preloadedAd);
        } else {
          preloadedAd.dispose();
        }
        return;
      }
    } catch (e) {
      debugPrint('Error getting preloaded ad: $e');
    }

    // 2. 사전 로드된 광고가 없으면 새로 로드
    RewardedAd.load(
      adUnitId: AdService.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('RewardedAd loaded successfully');
          _isRewardedAdLoading = false;
          if (mounted) {
            _setupRewardedAd(ad);
          } else {
            ad.dispose();
          }
        },
        onAdFailedToLoad: (error) {
          _isRewardedAdLoading = false; 
          _lastRewardedAdHadTechnicalFailure = true;
          debugPrint('RewardedAd failed to load: $error');
          if (mounted) {
            if (_isWaitingForAd) {
              _isWaitingForAd = false;
              Navigator.of(context).pop(); // Close loading dialog
              
              _onAccessGrantedCallback = null;
              
              if (_adCompleter != null && !_adCompleter!.isCompleted) {
                _adCompleter!.complete(false);
              }
              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('광고를 불러올 수 없습니다. 잠시 후 다시 시도해주세요.'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          }
        },
      ),
    );
  }

  void _forceReloadRewardedAd() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
    _isRewardedAdLoaded = false;
    _isRewardedAdLoading = false;
    Future.microtask(() => _loadRewardedAd());
  }

  void _setupRewardedAd(RewardedAd ad) {
    if (!mounted) {
      ad.dispose();
      return;
    }

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
        
        if (_rewardEarned) {
          _rewardEarned = false; 
          _onAccessGrantedCallback?.call();
          _onAccessGrantedCallback = null;
          if (_adCompleter != null && !_adCompleter!.isCompleted) {
            _adCompleter!.complete(true);
          }
        } else {
          _lastRewardedAdWasUserCancelled = true;
          _onAccessGrantedCallback = null;
          if (_adCompleter != null && !_adCompleter!.isCompleted) {
            _adCompleter!.complete(false);
          }
        }
        
        _loadRewardedAd(); 
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('RewardedAd failed to show: $error');
        _lastRewardedAdHadTechnicalFailure = true;
        ad.dispose();
        if (mounted) {
          setState(() {
            _rewardedAd = null;
            _isRewardedAdLoaded = false;
          });
        }
        _onAccessGrantedCallback = null;
        if (_adCompleter != null && !_adCompleter!.isCompleted) {
          _adCompleter!.complete(false);
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('광고를 표시할 수 없습니다. 잠시 후 다시 시도해주세요.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
        _loadRewardedAd();
      },
    );

    setState(() {
      _rewardedAd = ad;
      _isRewardedAdLoaded = true;
    });

    if (_isWaitingForAd) {
      _isWaitingForAd = false;
      if (mounted) {
        Navigator.of(context).pop(); // Close loading dialog
        _showRewardedAdFromObject(ad); 
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

  Future<bool> showRewardedAd(VoidCallback onAccessGranted) async {
    // 구독자는 보상형 광고를 시청할 필요가 없음 (이미 모든 권한이 있거나 프리미엄 혜택 대상)
    // AdService.isSubscriber와 로컬 쿠키 서비스 상태를 모두 확인하여 더 정확하게 판단
    final hasPass = await _cookieService.hasActiveFortunePassSubscription().timeout(
      const Duration(milliseconds: 500),
      onTimeout: () => false,
    );
    final isSubscriber = AdService.isSubscriber || hasPass;

    if (isSubscriber) {
      debugPrint('Skipping RewardedAd for subscriber');
      onAccessGranted();
      return true;
    }

    _adCompleter = Completer<bool>();
    _lastRewardedAdHadTechnicalFailure = false;
    _lastRewardedAdWasUserCancelled = false;
    
    if (_rewardedAd != null && _isRewardedAdLoaded) {
      _onAccessGrantedCallback = onAccessGranted;
      _showRewardedAdFromObject(_rewardedAd!);
    } else {
      _isWaitingForAd = true;
      _onAccessGrantedCallback = onAccessGranted;
      
      // 다이얼로그를 먼저 띄우고 광고 로드를 시작하여 체감 속도 향상
      _showLoadingDialog();
      
      // [사용자 요청] 2초 내로 광고가 안 뜨면 그냥 통과 (UX 개선)
      Timer(const Duration(seconds: 2), () {
        if (_isWaitingForAd && mounted) {
          debugPrint('Ad loading timed out (2s), skipping ad for better UX.');
          _isWaitingForAd = false;
          // 로딩 다이얼로그 닫기
          Navigator.of(context).pop();
          
          // 무료 통과 처리
          if (_onAccessGrantedCallback != null) {
            _onAccessGrantedCallback!();
            _onAccessGrantedCallback = null;
          }
          
          if (_adCompleter != null && !_adCompleter!.isCompleted) {
            _adCompleter!.complete(true);
          }
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('광고 없이 무료로 결과를 보여드립니다! 🎉'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      });
      
      // 마이크로태스크로 분리하여 다이얼로그 렌더링을 방해하지 않음
      Future.microtask(() => _loadRewardedAd());
    }
    
    return _adCompleter!.future;
  }

  void _showLoadingDialog() {
    StateSetter? dialogSetState;
    var showRetry = false;

    Future<void> enableRetryUiLater() async {
      await Future.delayed(const Duration(seconds: 8));
      if (!_isWaitingForAd || !mounted) return;
      if (dialogSetState == null) return;
      dialogSetState!(() {
        showRetry = true;
      });
    }

    Future.microtask(enableRetryUiLater);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          dialogSetState = setState;

          return WillPopScope(
            onWillPop: () async {
              _isWaitingForAd = false;
              return true;
            },
            child: Center(
              child: RepaintBoundary(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                          strokeWidth: 3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        '광고를 불러오는 중입니다...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (showRetry) ...[
                        const SizedBox(height: 12),
                        const Text(
                          '로드가 지연되고 있어요.\n잠시 후 다시 시도해주세요.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            decoration: TextDecoration.none,
                            height: 1.4,
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      if (showRetry)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                _forceReloadRewardedAd();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.amber,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                '다시 시도',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _lastRewardedAdWasUserCancelled = true;
                                _isWaitingForAd = false;
                                Navigator.of(context).pop();

                                if (_adCompleter != null && !_adCompleter!.isCompleted) {
                                  _adCompleter!.complete(false);
                                }
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white70,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: const Text(
                                '취소',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        )
                      else
                        TextButton(
                          onPressed: () {
                            _lastRewardedAdWasUserCancelled = true;
                            _isWaitingForAd = false;
                            Navigator.of(context).pop();

                            if (_adCompleter != null && !_adCompleter!.isCompleted) {
                              _adCompleter!.complete(false);
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white70,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: const Text(
                            '취소',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> showFortuneAccessDialog(VoidCallback onAccessGranted, {VoidCallback? onDirectAccess, bool isInterstitial = false}) async {
    if (!mounted) return false;
    
    bool accessGrantedResult = false;
    
    void internalOnAccessGranted() {
      accessGrantedResult = true;
      onAccessGranted();
    }

    // 1. 구독 상태 우선 확인 (캐시된 정보 사용으로 즉시 처리 시도)
    try {
      // 보상형 광고나 쿠키 사용 선택창을 띄우기 전에 구독 여부를 먼저 확인합니다.
      // 구독자는 아무런 대기 시간 없이 즉시 통과시켜 프리미엄 경험을 제공합니다.
      final hasPass = await _cookieService.hasActiveFortunePassSubscription().timeout(
        const Duration(milliseconds: 500), // 로컬 캐시가 있으면 매우 빠르게 응답함
        onTimeout: () => false,
      );

      if (hasPass) {
        // 구독자는 광고 없이 즉시 통과시켜 프리미엄 경험을 제공합니다.
        if (onDirectAccess != null) {
          onDirectAccess();
        } else {
          onAccessGranted();
        }
        return true;
      }
    } catch (e) {
      debugPrint('Error checking subscription in showFortuneAccessDialog: $e');
    }

    if (!mounted) return false;

    // 2. 쿠키 개수 체크 (UI에 표시하기 위함, 1초 대기)
    int cookieCount = 0;
    try {
      cookieCount = await _cookieService.getCookieCount().timeout(
        const Duration(seconds: 1),
        onTimeout: () => 0,
      );
    } catch (_) {}

    if (!mounted) return false;

    // Show dialog
    final String? choice = await showDialog<String>(
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
                      Navigator.pop(context, 'ad'); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, 
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
                        Navigator.pop(context, 'pass'); 
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
                        Navigator.pop(context, 'cookie'); 
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

    if (choice == 'ad') {
      final ok = await showRewardedAd(internalOnAccessGranted);
      if (ok) return true;
      if (!mounted) return false;
      if (!_lastRewardedAdHadTechnicalFailure) return false;

      internalOnAccessGranted();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('광고를 불러오지 못해 이번에는 무료로 진행합니다.'),
          duration: Duration(seconds: 3),
        ),
      );
      return true;
    } else if (choice == 'cookie' || choice == 'pass') {
      if (onDirectAccess != null) {
        onDirectAccess();
      } else {
        onAccessGranted();
      }
      return true;
    }
    
    return false;
  }
}
