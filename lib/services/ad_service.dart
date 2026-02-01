import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'cookie_service.dart';

class AdService {
  // 실제 광고 ID (사용자가 제공한 것)
  static const String _realBannerAdUnitId = 'ca-app-pub-7279511347629270/2023833925';
  static const String _realNativeAdUnitId = 'ca-app-pub-7279511347629270/9295803377';
  static const String _realNativeAdAdvancedUnitId = 'ca-app-pub-7279511347629270/9295803377'; // 네이티브 광고 고급형 추가
  static const String _realInterstitialAdUnitId = 'ca-app-pub-7279511347629270/4802040508'; // 전면광고 추가
  static const String _realRewardedAdUnitId = 'ca-app-pub-7279511347629270/4530561850';
  static const String _realRewardedInterstitialAdUnitId = 'ca-app-pub-7279511347629270/3273320503'; // 보상형 전면
  
  // 테스트 광고 ID (Google 제공)
  static const String _testBannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String _testNativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110';
  static const String _testInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  static const String _testRewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917';
  static const String _testRewardedInterstitialAdUnitId = 'ca-app-pub-3940256099942544/5354046379';

  // 개발 모드 여부
  // true: 항상 테스트 광고 사용
  // false: 릴리스 빌드에서 실제 광고 사용
  static const bool _forceTestMode = false; // [수정] 배포 시에는 반드시 false여야 함!

  static bool get _isTestMode => kDebugMode || _forceTestMode; 

  // [개발자 테스트용] 강제 유럽 설정 (배포 시에는 false여야 함)
  static bool showGdprTest = false; 

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

  // --- Preloading Logic ---
  
  static NativeAd? _preloadedExitAd;
  static Completer<void>? _exitAdLoadCompleter;

  static const int _listAdPoolSize = 3;
  static final List<NativeAd> _preloadedListAds = <NativeAd>[];
  static final List<DateTime> _preloadedListAdTimes = <DateTime>[];
  static final List<Completer<void>> _listAdWaiters = <Completer<void>>[];
  static int _listAdLoadingCount = 0;

  // 전면 광고 관련
  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialAdLoading = false;

  // 보상형 광고 프리로드 추가
  static RewardedAd? _preloadedRewardedAd;
  static Completer<RewardedAd?>? _rewardedAdCompleter;

  static const bool _isAdsEnabled = true;
  static bool get isAdsEnabled => _isAdsEnabled;

  // 구독 여부 (전면 광고 노출 제어용)
  static bool isSubscriber = false;

  /// 광고 시스템 초기화 및 초기 프리로드 시작
  static Future<void> init() async {
    // 1. UMP SDK를 통한 GDPR 동의 상태 확인 및 요청
    // (구독자도 배너 광고 등을 볼 수 있으므로 동의 절차는 동일하게 진행)
    ConsentRequestParameters params = ConsentRequestParameters();
    
    if (_isTestMode && showGdprTest) {
      // 테스트 중에는 상태를 초기화하여 항상 동의 창이 뜨도록 함
      await ConsentInformation.instance.reset();
      
      ConsentDebugSettings debugSettings = ConsentDebugSettings(
        debugGeography: DebugGeography.debugGeographyEea,
        testIdentifiers: ['76CC75FB16CA258B358B60382990B818'],
      );
      params = ConsentRequestParameters(consentDebugSettings: debugSettings);
      debugPrint('!!! GDPR TEST: Debug settings applied with EEA geography');
    }

    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        final isFormAvailable = await ConsentInformation.instance.isConsentFormAvailable();
        if (isFormAvailable) {
          loadForm();
        } else {
          _initializeAds();
        }
      },
      (FormError error) {
        debugPrint('Consent info update failed: ${error.errorCode} - ${error.message}');
        _initializeAds();
      },
    );
  }

  static void loadForm() {
    ConsentForm.loadAndShowConsentFormIfRequired(
      (FormError? error) {
        if (error != null) {
          debugPrint('Consent form error: ${error.errorCode} - ${error.message}');
        }
        _initializeAds();
      },
    );
  }

  static Future<void> _initializeAds() async {
    // 1. MobileAds 초기화 (대기하지 않고 백그라운드에서 실행)
    final initFuture = MobileAds.instance.initialize();
    
    // 테스트 기기 설정 (선택 사항)
    if (_isTestMode) {
      MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(testDeviceIds: ['76CC75FB16CA258B358B60382990B818']),
      );
    }
    
    // 2. 초기 광고들 프리로드 시작 (초기화 완료 후 실행되도록 함)
    initFuture.then((_) {
      debugPrint('AdMob SDK initialized');
      
      // 비구독자만 전면형 광고 프리로드
      if (!isSubscriber) {
        Timer(const Duration(seconds: 2), loadInterstitialAd);
        Timer(const Duration(seconds: 1), preloadRewardedAd);
        Timer(const Duration(seconds: 1), preloadExitAd);
      }
      
      // 네이티브 광고(리스트용)는 구독자도 보므로 항상 프리로드
      for (int i = 0; i < _listAdPoolSize; i++) {
        Timer(Duration(milliseconds: 250 * i), preloadListAd);
      }
    });

    // 4. 구독 상태 실시간 동기화 (CookieService 스트림 감시)
    // 별도의 static 변수로 구독을 관리하여 중복 구독 방지
    _subscriptionSync();
  }

  static StreamSubscription<bool>? _subscriberSubscription;
  
  static void _subscriptionSync() {
    _subscriberSubscription?.cancel();
    // CookieService의 fortunePassActiveStream을 구독하여 실시간으로 _isSubscriber 업데이트
    // dynamic import 피하기 위해 main에서 전달받거나 직접 인스턴스 생성
    final cookieService = CookieService();
    _subscriberSubscription = cookieService.fortunePassActiveStream.listen((isActive) {
      if (isSubscriber != isActive) {
        debugPrint('AdService: Subscription status updated via stream -> $isActive');
        isSubscriber = isActive;
        
        // 구독자가 된 경우, 이미 로드된 전면형 광고들 메모리 해제
        if (isActive) {
          _interstitialAd?.dispose();
          _interstitialAd = null;
          _preloadedRewardedAd?.dispose();
          _preloadedRewardedAd = null;
          _preloadedExitAd?.dispose();
          _preloadedExitAd = null;
        }
      }
    });
  }

  /// 개인정보 설정(GDPR) 양식 다시 표시 (설정 화면용)
  /// 비유럽 국가 사용자에게는 아예 표시되지 않도록 처리
  static Future<void> showPrivacyOptionsForm(Function(FormError?) onDismissed) async {
    // 동의가 필요한지 먼저 확인
    final status = await ConsentInformation.instance.getConsentStatus();
    // 동의가 필요 없거나(UNKNOWN), 필수 아님(NOT_REQUIRED)인 경우 팝업 띄우지 않음
    if (status == ConsentStatus.notRequired) {
       debugPrint('GDPR consent not required for this user.');
       onDismissed(null); 
       return;
    }

    ConsentForm.showPrivacyOptionsForm(onDismissed);
  }

  /// 개인정보 설정 버튼 표시 여부 확인
  static Future<bool> isPrivacyOptionsRequired() async {
    final status = await ConsentInformation.instance.getConsentStatus();
    // 동의가 필요한 경우(REQUIRED) 또는 이미 받은 경우(OBTAINED)에만 버튼 표시
    // NOT_REQUIRED(비유럽)인 경우 false 반환
    return status == ConsentStatus.required || status == ConsentStatus.obtained;
  }

  /// 전면 광고 로드
  static void loadInterstitialAd() {
    if (_interstitialAd != null || _isInterstitialAdLoading) return;
    
    _isInterstitialAdLoading = true;
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd loaded');
          _interstitialAd = ad;
          _isInterstitialAdLoading = false;
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
          _isInterstitialAdLoading = false;
          _interstitialAd = null;
        },
      ),
    );
  }

  /// 전면 광고 표시
  /// [onAdDismissed] 광고가 닫혔을 때 실행할 콜백
  static void showInterstitialAd({VoidCallback? onAdDismissed}) {
    // 구독자는 전면 광고를 보지 않음 (사용자 경험 개선)
    if (isSubscriber) {
      debugPrint('Skipping InterstitialAd for subscriber');
      onAdDismissed?.call();
      return;
    }

    if (_interstitialAd == null) {
      debugPrint('InterstitialAd not available');
      onAdDismissed?.call();
      loadInterstitialAd(); // 다음을 위해 로드 시도
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('InterstitialAd dismissed');
        ad.dispose();
        _interstitialAd = null;
        onAdDismissed?.call();
        loadInterstitialAd(); // 다음을 위해 로드 시도
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('InterstitialAd failed to show: $error');
        ad.dispose();
        _interstitialAd = null;
        onAdDismissed?.call();
        loadInterstitialAd(); // 다음을 위해 로드 시도
      },
    );

    _interstitialAd!.show();
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
        Future.microtask(preloadRewardedAd);
        return ad;
      }

      // 2. 로딩 중이면 완료될 때까지 대기 (최대 3초만 대기)
      if (_rewardedAdCompleter != null && !_rewardedAdCompleter!.isCompleted) {
        final ad = await _rewardedAdCompleter!.future.timeout(
          const Duration(seconds: 3),
          onTimeout: () => null,
        );
        if (ad == null) {
          return null;
        }
        _preloadedRewardedAd = null;
        _rewardedAdCompleter = null;
        Future.microtask(preloadRewardedAd);
        return ad;
      }

      // 3. 로드된 것도 없고 로딩 중도 아니면 새로 로드 시도
      preloadRewardedAd();
      if (_rewardedAdCompleter != null) {
        final currentCompleter = _rewardedAdCompleter!;
        final ad = await currentCompleter.future.timeout(
          const Duration(seconds: 3),
          onTimeout: () => null,
        );
        if (ad == null) {
          return null;
        }
        _preloadedRewardedAd = null;
        _rewardedAdCompleter = null;
        Future.microtask(preloadRewardedAd);
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
      nativeAdOptions: NativeAdOptions(
        videoOptions: VideoOptions(
          startMuted: true,
          customControlsRequested: false,
          clickToExpandRequested: false,
        ),
      ),
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
    if (_preloadedListAds.length + _listAdLoadingCount >= _listAdPoolSize) return;

    final now = DateTime.now();
    for (int i = _preloadedListAdTimes.length - 1; i >= 0; i--) {
      if (now.difference(_preloadedListAdTimes[i]).inHours >= 1) {
        final ad = _preloadedListAds.removeAt(i);
        _preloadedListAdTimes.removeAt(i);
        ad.dispose();
      }
    }

    if (_preloadedListAds.length + _listAdLoadingCount >= _listAdPoolSize) return;

    _listAdLoadingCount++;

    final completer = Completer<void>();
    final adToLoad = NativeAd(
      adUnitId: nativeAdAdvancedUnitId,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('Preloaded List Ad loaded');
          _listAdLoadingCount = (_listAdLoadingCount - 1).clamp(0, 999999);
          _preloadedListAds.add(ad as NativeAd);
          _preloadedListAdTimes.add(DateTime.now());
          if (!completer.isCompleted) {
            completer.complete();
          }
          if (_listAdWaiters.isNotEmpty) {
            final waiter = _listAdWaiters.removeAt(0);
            if (!waiter.isCompleted) waiter.complete();
          }
          if (_preloadedListAds.length + _listAdLoadingCount < _listAdPoolSize) {
            Timer(const Duration(milliseconds: 300), preloadListAd);
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Preloaded List Ad failed: $error');
          ad.dispose();
          _listAdLoadingCount = (_listAdLoadingCount - 1).clamp(0, 999999);
          if (!completer.isCompleted) {
             completer.completeError(error);
          }
          // 실패 시 30초 후 재시도
          Future.delayed(const Duration(seconds: 30), preloadListAd);
        },
      ),
    );
    adToLoad.load();
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
    if (_preloadedListAds.isNotEmpty) {
      final ad = _preloadedListAds.removeAt(0);
      _preloadedListAdTimes.removeAt(0);
      Timer(const Duration(milliseconds: 300), preloadListAd);
      return (ad, Future.value());
    }

    preloadListAd();
    final waiter = Completer<void>();
    _listAdWaiters.add(waiter);
    return (null, waiter.future);
  }
}
