import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:fortune_alarm/services/ad_service.dart';
import 'package:fortune_alarm/services/cookie_service.dart';

mixin FortuneAccessMixin<T extends StatefulWidget> on State<T> {
  final CookieService _cookieService = CookieService();
  bool _isWaitingForAd = false;
  Completer<bool>? _adCompleter;
  VoidCallback? _onAccessGrantedCallback;

  @override
  void initState() {
    super.initState();
    // 초기 로딩 시 광고 프리로드 확인
    AdService.preloadRewardedAd();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> showRewardedAd(VoidCallback onAccessGranted) async {
    // 1. 구독 상태 확인
    final hasPass = await _cookieService.hasActiveFortunePassSubscription().timeout(
      const Duration(milliseconds: 500),
      onTimeout: () => false,
    );
    final isSubscriber = AdService.isSubscriber || hasPass;

    if (isSubscriber) {
      debugPrint('FortuneAccessMixin: Skipping RewardedAd for subscriber');
      onAccessGranted();
      return true;
    }

    if (_adCompleter != null && !_adCompleter!.isCompleted) {
      return _adCompleter!.future;
    }

    _adCompleter = Completer<bool>();
    _onAccessGrantedCallback = onAccessGranted;
    
    // 2. 이미 광고가 로드되어 있으면 바로 표시
    if (AdService.isRewardedAdLoaded) {
      _showAdDirectly();
    } else {
      // 3. 광고가 없으면 로딩 다이얼로그 표시 후 대기
      _isWaitingForAd = true;
      _showLoadingDialog();
      
      // AdService에서 광고를 가져와서 표시
      _loadAndShowAd();
    }
    
    return _adCompleter!.future;
  }

  void _showAdDirectly() {
    AdService.showRewardedAd(
      onRewardEarned: () async {
        await _cookieService.addCookies(2);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.earnCookies(2))),
        );
        _cookieService.useCookies(2).then((success) {
           if (!success) debugPrint('Failed to deduct cookies after ad');
        });
        
        _onAccessGrantedCallback?.call();
        if (_adCompleter != null && !_adCompleter!.isCompleted) {
          _adCompleter!.complete(true);
        }
      },
      onAdClosed: () {
        if (_adCompleter != null && !_adCompleter!.isCompleted) {
          _adCompleter!.complete(false);
        }
      },
    );
  }

  void _loadAndShowAd() {
    Timer? timeoutTimer;
    
    // 타임아웃 설정 (AdService와 동기화하여 8초 정도로 설정)
    timeoutTimer = Timer(const Duration(seconds: 8), () {
      if (_isWaitingForAd && mounted) {
        debugPrint('FortuneAccessMixin: Ad loading timed out (8s), giving free pass.');
        _isWaitingForAd = false;
        Navigator.of(context, rootNavigator: true).pop(); // Close loading dialog
        
        _onAccessGrantedCallback?.call();
        if (_adCompleter != null && !_adCompleter!.isCompleted) {
          _adCompleter!.complete(true);
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.freePassAfterTimeout),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });

    AdService.showRewardedAd(
      onRewardEarned: () async {
        timeoutTimer?.cancel();
        if (!_isWaitingForAd) return;
        _isWaitingForAd = false;
        
        if (mounted) {
          Navigator.of(context, rootNavigator: true).pop(); // Close loading dialog
        }

        await _cookieService.addCookies(2);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.earnCookies(2))),
          );
        }
        _cookieService.useCookies(2).then((success) {
           if (!success) debugPrint('Failed to deduct cookies after ad');
        });
        
        _onAccessGrantedCallback?.call();
        if (_adCompleter != null && !_adCompleter!.isCompleted) {
          _adCompleter!.complete(true);
        }
      },
      onAdClosed: () {
        timeoutTimer?.cancel();
        if (!_isWaitingForAd) return;
        _isWaitingForAd = false;
        
        if (mounted) {
          Navigator.of(context, rootNavigator: true).pop(); // Close loading dialog
        }
        
        if (_adCompleter != null && !_adCompleter!.isCompleted) {
          _adCompleter!.complete(false);
        }
      },
      onAdLoadFailed: () {
        timeoutTimer?.cancel();
        // AdService.showRewardedAd 내부에서 onRewardEarned를 호출하므로 
        // 여기서는 별도 처리를 하지 않아도 됨 (무료 패스 로직이 onRewardEarned로 흐름)
      },
    );
  }

  void _showLoadingDialog() {
    StateSetter? dialogSetState;
    var showRetry = false;

    Future<void> enableRetryUiLater() async {
      await Future.delayed(const Duration(seconds: 5));
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
      useRootNavigator: true,
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
                      Text(
                        AppLocalizations.of(context)!.adLoading,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (showRetry) ...[
                        const SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.adLoadDelay,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                                // 재시도 시 AdService 프리로드 강제 호출
                                AdService.preloadRewardedAd();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.amber,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.retry,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _isWaitingForAd = false;
                                Navigator.of(context, rootNavigator: true).pop();

                                if (_adCompleter != null && !_adCompleter!.isCompleted) {
                                  _adCompleter!.complete(false);
                                }
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white70,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.cancel,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        )
                      else
                        TextButton(
                          onPressed: () {
                            _isWaitingForAd = false;
                            Navigator.of(context, rootNavigator: true).pop();

                            if (_adCompleter != null && !_adCompleter!.isCompleted) {
                              _adCompleter!.complete(false);
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white70,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(fontSize: 15),
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
      useRootNavigator: true,
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
                  AppLocalizations.of(context)!.fortuneAccessTitle,
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
                  AppLocalizations.of(context)!.fortuneAccessSubtitle,
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
                      children: [
                        const Icon(Icons.play_circle_fill, color: Colors.black87, size: 24),
                        const SizedBox(width: 10),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              AppLocalizations.of(context)!.watchAdButtonText,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                          useRootNavigator: true,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            title: Text(
                              AppLocalizations.of(context)!.insufficientCookiesTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            content: Text(
                              AppLocalizations.of(context)!.insufficientCookiesMessage,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: Text(AppLocalizations.of(context)!.confirm),
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
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              AppLocalizations.of(context)!.useCookiesButtonText(2),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      
      // showRewardedAd가 false를 반환했다면 사용자가 취소했거나 로드에 실패한 것임.
      // 이미 showRewardedAd 내부에서 타임아웃 시 무료 패스를 지급하므로 
      // 여기서는 추가 처리가 필요 없음.
      return false;
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
