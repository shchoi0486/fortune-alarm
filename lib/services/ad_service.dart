import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  // 실제 광고 ID (사용자가 제공한 것)
  static const String _realBannerAdUnitId = 'ca-app-pub-7279511347629270/2023833925';
  static const String _realNativeAdUnitId = 'ca-app-pub-7279511347629270/9295803377';
  static const String _realNativeAdAdvancedUnitId = 'ca-app-pub-7279511347629270/9295803377'; // 네이티브 광고 고급형 추가
  static const String _realInterstitialAdUnitId = 'ca-app-pub-7279511347629270/4802040508'; // 전면광고 추가
  static const String _realRewardedAdUnitId = 'ca-app-pub-7279511347629270/4530561850';
  static const String _realRewardedInterstitialAdUnitId = 'ca-app-pub-7279511347629270/3273320503'; // 보상형 전면
  static const String _realAppOpenAdUnitId = 'ca-app-pub-4511718702168477/4090905707'; // 앱 오프닝
  
  // 테스트 광고 ID (Google 제공)
  static const String _testBannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String _testNativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110';
  static const String _testInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  static const String _testRewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917';
  static const String _testRewardedInterstitialAdUnitId = 'ca-app-pub-3940256099942544/5354046379';
  static const String _testAppOpenAdUnitId = 'ca-app-pub-3940256099942544/3419835294';

  // 개발 모드 여부 (배포 시 false로 변경하거나 kReleaseMode 사용)
  // 주의: "검토 필요" 상태에서는 실제 광고 ID가 작동하지 않습니다. 테스트를 위해 true로 두세요.
  static bool get _isTestMode => kDebugMode; 

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testBannerAdUnitId : _realBannerAdUnitId;
    }
    return _testBannerAdUnitId;
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testNativeAdUnitId : _realNativeAdUnitId;
    }
    return _testNativeAdUnitId;
  }

  static String get nativeAdAdvancedUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testNativeAdUnitId : _realNativeAdAdvancedUnitId;
    }
    return _testNativeAdUnitId;
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testInterstitialAdUnitId : _realInterstitialAdUnitId;
    }
    return _testInterstitialAdUnitId;
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testRewardedAdUnitId : _realRewardedAdUnitId;
    }
    return _testRewardedAdUnitId;
  }
  
  static String get rewardedInterstitialAdUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testRewardedInterstitialAdUnitId : _realRewardedInterstitialAdUnitId;
    }
    return _testRewardedInterstitialAdUnitId;
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return _isTestMode ? _testAppOpenAdUnitId : _realAppOpenAdUnitId;
    }
    return _testAppOpenAdUnitId;
  }

  // --- Preloading Logic ---
  
  static NativeAd? _preloadedExitAd;
  static Completer<void>? _exitAdLoadCompleter;

  static NativeAd? _preloadedListAd;
  static Completer<void>? _listAdLoadCompleter;

  // 보상형 광고 프리로드 추가
  static RewardedAd? _preloadedRewardedAd;
  static Completer<RewardedAd?>? _rewardedAdCompleter;
  
  /// 광고 시스템 초기화 및 초기 프리로드 시작
  static Future<void> init() async {
    await MobileAds.instance.initialize();
    // 초기 광고들 프리로드 시작
    preloadRewardedAd();
    preloadExitAd();
    preloadListAd();
  }

  /// 보상형 광고 사전 로드
  static void preloadRewardedAd() {
    if (_preloadedRewardedAd != null || (_rewardedAdCompleter != null && !_rewardedAdCompleter!.isCompleted)) return;

    final completer = Completer<RewardedAd?>();
    _rewardedAdCompleter = completer;

    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('Preloaded Rewarded Ad loaded');
          _preloadedRewardedAd = ad;
          if (!completer.isCompleted) completer.complete(ad);
        },
        onAdFailedToLoad: (error) {
          debugPrint('Preloaded Rewarded Ad failed: $error');
          _preloadedRewardedAd = null;
          if (!completer.isCompleted) completer.complete(null);
          // 실패 시 잠시 후 다시 시도 (지수 백오프 대신 단순 지연)
          Future.delayed(const Duration(seconds: 10), () => preloadRewardedAd());
        },
      ),
    );
  }

  /// 전면 광고 사전 로드 제거 (정책 준수)

  /// 사전 로드된 보상형 광고 가져오기 (사용 후 소모됨)
  /// 로딩 중인 경우 Future를 반환하여 대기 가능하게 함
  static Future<RewardedAd?> getPreloadedRewardedAd() async {
    try {
      // 1. 이미 로드된 광고가 있으면 즉시 반환
      if (_preloadedRewardedAd != null) {
        final ad = _preloadedRewardedAd;
        _preloadedRewardedAd = null;
        _rewardedAdCompleter = null;
        preloadRewardedAd(); // 다음을 위해 로드 시작
        return ad;
      }

      // 2. 로딩 중이면 완료될 때까지 대기 (최대 3초만 대기)
      if (_rewardedAdCompleter != null && !_rewardedAdCompleter!.isCompleted) {
        final ad = await _rewardedAdCompleter!.future.timeout(
          const Duration(seconds: 3),
          onTimeout: () => null,
        );
        _preloadedRewardedAd = null;
        _rewardedAdCompleter = null;
        preloadRewardedAd();
        return ad;
      }

      // 3. 로드된 것도 없고 로딩 중도 아니면 새로 로드 시도
      preloadRewardedAd();
      if (_rewardedAdCompleter != null) {
        final ad = await _rewardedAdCompleter!.future.timeout(
          const Duration(seconds: 3),
          onTimeout: () => null,
        );
        _preloadedRewardedAd = null;
        _rewardedAdCompleter = null;
        preloadRewardedAd();
        return ad;
      }
    } catch (e) {
      debugPrint('Error in getPreloadedRewardedAd: $e');
    }
    
    return null;
  }

  // 전면 광고 가져오기 메서드 제거 (정책 준수를 위해 사용하지 않음)

  /// 종료 다이얼로그용 광고 사전 로드
  static void preloadExitAd() {
    if (_preloadedExitAd != null) return; // 이미 로드 중이거나 로드됨

    final completer = Completer<void>();
    _exitAdLoadCompleter = completer;

    _preloadedExitAd = NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: 'dialogAd',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('Preloaded Exit Ad loaded');
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Preloaded Exit Ad failed: $error');
          ad.dispose();
          // 현재 프리로드된 광고가 실패한 광고라면 초기화
          if (_preloadedExitAd == ad) {
            _preloadedExitAd = null;
            _exitAdLoadCompleter = null;
          }
          if (!completer.isCompleted) {
             completer.completeError(error);
          }
        },
      ),
    )..load();
  }

  /// 리스트용 광고 사전 로드
  static void preloadListAd() {
    if (_preloadedListAd != null) return; 

    final completer = Completer<void>();
    _listAdLoadCompleter = completer;

    _preloadedListAd = NativeAd(
      adUnitId: nativeAdAdvancedUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('Preloaded List Ad loaded');
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Preloaded List Ad failed: $error');
          ad.dispose();
          // 현재 프리로드된 광고가 실패한 광고라면 초기화
          if (_preloadedListAd == ad) {
            _preloadedListAd = null;
            _listAdLoadCompleter = null;
          }
          if (!completer.isCompleted) {
             completer.completeError(error);
          }
        },
      ),
    )..load();
  }

  /// 사전 로드된 종료 광고 가져오기 (소비됨)
  /// 반환값: (광고 객체, 로딩 완료 Future)
  static (NativeAd?, Future<void>?) getExitAd() {
    final ad = _preloadedExitAd;
    final future = _exitAdLoadCompleter?.future;
    
    // 가져가면 다음 사용을 위해 변수 초기화 (1회용)
    // 참고: 사용자는 다이얼로그를 닫고 다시 열 수 있으므로, 다이얼로그가 닫힐 때 다시 preloadExitAd를 호출해야 함.
    _preloadedExitAd = null;
    _exitAdLoadCompleter = null;
    
    return (ad, future);
  }

  /// 사전 로드된 리스트 광고 가져오기 (소비됨)
  static (NativeAd?, Future<void>?) getListAd() {
    final ad = _preloadedListAd;
    final future = _listAdLoadCompleter?.future;
    
    _preloadedListAd = null;
    _listAdLoadCompleter = null;
    
    return (ad, future);
  }
}
