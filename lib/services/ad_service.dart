import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
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
  static const bool _forceTestMode = false; // [배포용/홍보용 이미지 촬영용] false로 변경

  static bool get _isTestMode => _forceTestMode; // kDebugMode 제외 (홍보용 이미지 촬영을 위해 실광고 ID 사용)

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
  static bool _isRewardedAdLoading = false; // 로딩 중 상태 추가

  static const bool _isAdsEnabled = true;
  static bool get isAdsEnabled => _isAdsEnabled;

  // SDK 초기화 상태 관리
  static bool _isInitialized = false;
  static bool get isInitialized => _isInitialized;
  static bool _isInitializing = false;
  static final Completer<void> _initCompleter = Completer<void>();
  static Future<void> get initializationFuture => _initCompleter.future;

  // 구독 여부 (전면 광고 노출 제어용)
  static bool isSubscriber = false;

  /// 광고 시스템 초기화 및 초기 프리로드 시작
  static Future<void> init() async {
    // 이미 초기화 진행 중이거나 완료된 경우 중복 실행 방지
    if (_isInitialized || _isInitializing) return;
    
    debugPrint('AdService: Initializing with UMP...');

    // 1. UMP SDK를 통한 GDPR 동의 상태 확인 및 요청
    // 타임아웃을 설정하여 GDPR 확인이 너무 오래 걸리면 바로 광고 초기화 진행
    bool consentCheckDone = false;
    
    // 타임아웃용 타이머
    Timer(const Duration(seconds: 3), () {
      if (!consentCheckDone) {
        debugPrint('AdService: Consent check timed out, proceeding with initialization');
        consentCheckDone = true;
        _initializeAds();
      }
    });

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

    try {
      ConsentInformation.instance.requestConsentInfoUpdate(
        params,
        () async {
          if (consentCheckDone) return;
          consentCheckDone = true;
          
          final isFormAvailable = await ConsentInformation.instance.isConsentFormAvailable();
          if (isFormAvailable) {
            loadForm();
          } else {
            _initializeAds();
          }
        },
        (FormError error) {
          if (consentCheckDone) return;
          consentCheckDone = true;
          debugPrint('AdService: Consent info update failed: ${error.errorCode} - ${error.message}');
          _initializeAds();
        },
      );
    } catch (e) {
      if (!consentCheckDone) {
        consentCheckDone = true;
        debugPrint('AdService: Error during consent request: $e');
        _initializeAds();
      }
    }
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
    if (_isInitialized || _isInitializing) return;
    _isInitializing = true;

    debugPrint('AdService: Starting AdMob SDK initialization...');
    
    try {
      // [최적화] 초기화 전에 미리 설정을 업데이트하여 첫 광고 로드 시 반영되도록 함
      final requestConfig = RequestConfiguration(
        testDeviceIds: _isTestMode ? ['76CC75FB16CA258B358B60382990B818'] : [],
        tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
        tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.unspecified,
        maxAdContentRating: MaxAdContentRating.g,
      );
      await MobileAds.instance.updateRequestConfiguration(requestConfig);
      
      // 1. MobileAds 초기화 (v7.0.0+ 에서는 백그라운드에서 실행됨)
      final status = await MobileAds.instance.initialize();
      debugPrint('AdService: AdMob SDK initialization completed. Status: ${status.adapterStatuses}');
      
      _isInitialized = true;
      _isInitializing = false;
      if (!_initCompleter.isCompleted) {
        _initCompleter.complete();
      }
      
      // 2. 초기화 직후 광고 로드 시 실패율이 높으므로 짧은 대기 후 프리로드 시작
      debugPrint('AdService: Waiting 1.5s before initial preloading...');
      await Future.delayed(const Duration(milliseconds: 1500));
      
      if (!isSubscriber) {
        loadInterstitialAd();
        preloadRewardedAd();
        preloadExitAd();
      }
      
      for (int i = 0; i < _listAdPoolSize; i++) {
        Timer(Duration(milliseconds: 300 * i), preloadListAd);
      }
    } catch (e) {
      debugPrint('AdService: Error during MobileAds initialization: $e');
      _isInitializing = false;
      if (!_initCompleter.isCompleted) {
        _initCompleter.complete();
      }
    }

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
  static void loadInterstitialAd() async {
    if (!_isInitialized) await initializationFuture;
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
  static void preloadRewardedAd({int attempt = 1}) async {
    if (!_isInitialized) {
      debugPrint('AdService: Waiting for initialization before preloading...');
      await initializationFuture;
    }
    
    // 이미 광고가 있거나 로딩 중이면 중복 로드 방지
    if (_preloadedRewardedAd != null) {
      debugPrint('AdService: Rewarded ad already preloaded.');
      return;
    }
    
    if (_isRewardedAdLoading) {
      debugPrint('AdService: Rewarded ad is already loading...');
      return;
    }

    debugPrint('AdService: Starting preloading RewardedAd (Attempt $attempt)...');
    
    _isRewardedAdLoading = true;
    _rewardedAdCompleter = Completer<RewardedAd?>();

    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('AdService: Preloaded Rewarded Ad loaded successfully');
          _preloadedRewardedAd = ad;
          _isRewardedAdLoading = false;
          if (_rewardedAdCompleter != null && !_rewardedAdCompleter!.isCompleted) {
            _rewardedAdCompleter!.complete(ad);
          }
        },
        onAdFailedToLoad: (error) {
          debugPrint('AdService: Preloaded Rewarded Ad failed to load (Attempt $attempt): $error');
          _preloadedRewardedAd = null;
          _isRewardedAdLoading = false;
          if (_rewardedAdCompleter != null && !_rewardedAdCompleter!.isCompleted) {
            _rewardedAdCompleter!.complete(null);
          }
          
          // 실패 시 재시도 전략: 초기화 직후 실패인 경우 3초 후 재시도, 그 외에는 10초 후 재시도
          if (attempt < 3) {
            final delay = attempt == 1 ? 3 : 10;
            debugPrint('AdService: Retrying RewardedAd preload in $delay seconds...');
            Future.delayed(Duration(seconds: delay), () => preloadRewardedAd(attempt: attempt + 1));
          } else {
            // 최대 시도 횟수 초과 시 일반적인 간격(30초)으로 재시도 예약
            Future.delayed(const Duration(seconds: 30), () => preloadRewardedAd());
          }
        },
      ),
    );
  }

  /// 전면 광고 사전 로드 제거 (정책 준수)

  /// 사전 로드된 보상형 광고 가져오기 (사용 후 소모됨)
  /// 로딩 중인 경우 Future를 반환하여 대기 가능하게 함
  static Future<RewardedAd?> getPreloadedRewardedAd() async {
    try {
      // SDK 초기화 대기 (아직 초기화 전이면 기다림)
      if (!_isInitialized) {
        debugPrint('AdService: Waiting for SDK initialization before getting ad...');
        await initializationFuture.timeout(
          const Duration(seconds: 2),
          onTimeout: () => null,
        );
      }

      // 1. 이미 로드된 광고가 있으면 즉시 반환
      if (_preloadedRewardedAd != null) {
        debugPrint('AdService: Returning preloaded ad from cache');
        final ad = _preloadedRewardedAd;
        _preloadedRewardedAd = null;
        _rewardedAdCompleter = null;
        _isRewardedAdLoading = false;
        Future.microtask(preloadRewardedAd);
        return ad;
      }

      // 2. 로딩 중이면 완료될 때까지 대기 (최대 3초 대기)
      if (_isRewardedAdLoading && _rewardedAdCompleter != null) {
        debugPrint('AdService: Waiting for active ad loading completer (max 3s)...');
        final ad = await _rewardedAdCompleter!.future.timeout(
          const Duration(seconds: 3),
          onTimeout: () => null,
        );
        if (ad != null) {
          _preloadedRewardedAd = null;
          _rewardedAdCompleter = null;
          _isRewardedAdLoading = false;
          Future.microtask(preloadRewardedAd);
          return ad;
        }
        debugPrint('AdService: Ad loading completer timed out or failed');
      }

      // 3. 로드된 것도 없고 로딩 중도 아니면 새로 로드 시도
      debugPrint('AdService: No preloaded ad found, starting fresh load...');
      preloadRewardedAd();
      
      // 새로 로드 시작했으므로 완료될 때까지 잠시 대기 (최대 2초)
      if (_rewardedAdCompleter != null) {
        return await _rewardedAdCompleter!.future.timeout(
          const Duration(seconds: 2),
          onTimeout: () => null,
        );
      }
      
      return null;
    } catch (e) {
      debugPrint('Error in getPreloadedRewardedAd: $e');
    }
    
    return null;
  }

  // 전면 광고 가져오기 메서드 제거 (정책 준수를 위해 사용하지 않음)

  /// 보상형 광고가 사전 로드되어 있는지 확인
  static bool get isRewardedAdLoaded => _preloadedRewardedAd != null;

  /// 보상형 광고 표시
  /// [onRewardEarned] 보상을 획득했을 때 실행할 콜백
  /// [onAdClosed] 광고가 닫혔을 때 실행할 콜백 (보상 획득 여부와 관계없이 호출)
  static void showRewardedAd({
    required VoidCallback onRewardEarned,
    VoidCallback? onAdClosed,
    VoidCallback? onAdLoadFailed, // 광고 로드 실패 시 콜백 추가
  }) async {
    // 구독자는 광고 없이 바로 보상 획득
    if (isSubscriber) {
      debugPrint('Skipping RewardedAd for subscriber');
      onRewardEarned();
      if (onAdClosed != null) onAdClosed();
      return;
    }

    // 1. 사전 로드된 광고 확인 (로딩 중이면 대기 포함)
    final preloadedAd = await getPreloadedRewardedAd();
    
    if (preloadedAd != null) {
      debugPrint('Showing RewardedAd from AdService cache/loader');
      preloadedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          debugPrint('RewardedAd dismissed');
          ad.dispose();
          if (onAdClosed != null) onAdClosed();
          preloadRewardedAd(); // 다음을 위해 로드
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('RewardedAd failed to show: $error');
          ad.dispose();
          if (onAdClosed != null) onAdClosed();
          preloadRewardedAd(); // 다음을 위해 로드
          // 실패 시에도 일단 진행할 수 있도록 콜백 호출 (UX 고려)
          onRewardEarned();
        },
      );
      
      await preloadedAd.show(onUserEarnedReward: (ad, reward) {
        debugPrint('User earned reward: ${reward.amount} ${reward.type}');
        onRewardEarned();
      });
      return;
    }

    // 2. 광고 로드 실패 (getPreloadedRewardedAd가 null 반환)
    debugPrint('AdService: Failed to get rewarded ad (none preloaded and fresh load timed out/failed)');
    if (onAdLoadFailed != null) onAdLoadFailed();
    if (onAdClosed != null) onAdClosed();
    
    // UX를 위해 광고 로드 실패 시에도 보상을 지급할지 여부는 호출부에서 결정하거나
    // 여기서 정책적으로 결정할 수 있음. 현재는 UX를 위해 지급하는 방향 유지 (이전 코드 참고)
    // 단, mixin에서 처리하므로 여기서는 최소한의 알림만 수행
    onRewardEarned(); 
    preloadRewardedAd();
  }

  /// 종료 다이얼로그용 광고 사전 로드
  static void preloadExitAd({Brightness? brightness}) async {
    if (!_isInitialized) await initializationFuture;
    if (_preloadedExitAd != null) return; // 이미 로드 중이거나 로드됨

    final completer = Completer<void>();
    _exitAdLoadCompleter = completer;

    final isDarkMode = (brightness ?? WidgetsBinding.instance.platformDispatcher.platformBrightness) == Brightness.dark;

    _preloadedExitAd = NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: 'dialogAd',
      customOptions: {'theme': isDarkMode ? 'dark' : 'light'},
      request: const AdRequest(),
      nativeAdOptions: NativeAdOptions(
        videoOptions: VideoOptions(
          startMuted: true,
          customControlsRequested: true, // [수정] 재생/음소거 버튼 숨김
          clickToExpandRequested: false,
        ),
      ),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('Preloaded Exit Ad loaded (Theme: ${isDarkMode ? "dark" : "light"})');
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Preloaded Exit Ad failed: $error');
          // [수정] 이미 핸드오프된 광고인 경우 여기서 dispose하지 않음 (UI에서 처리)
          if (identical(_preloadedExitAd, ad)) {
            ad.dispose();
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
  static void preloadListAd({Brightness? brightness}) async {
    if (!_isInitialized) await initializationFuture;
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
    final isDarkMode = (brightness ?? WidgetsBinding.instance.platformDispatcher.platformBrightness) == Brightness.dark;

    final adToLoad = NativeAd(
      adUnitId: nativeAdAdvancedUnitId,
      factoryId: 'listTile',
      customOptions: {'theme': isDarkMode ? 'dark' : 'light'},
      request: const AdRequest(),
      nativeAdOptions: NativeAdOptions(
        mediaAspectRatio: MediaAspectRatio.landscape, // 영상/이미지가 잘 보이도록 가로 비율 설정
        videoOptions: VideoOptions(
          startMuted: true, // 소리 없이 시작 (알람 소리와 겹치지 않게)
          customControlsRequested: true, // [수정] 재생/음소거 버튼 숨김
          clickToExpandRequested: false,
        ),
      ),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('Preloaded List Ad loaded (Theme: ${isDarkMode ? "dark" : "light"})');
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
            Timer(const Duration(milliseconds: 300), () => preloadListAd(brightness: brightness));
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Preloaded List Ad failed: $error');
          ad.dispose();
          _listAdLoadingCount = (_listAdLoadingCount - 1).clamp(0, 999999);
          for (final waiter in _listAdWaiters) {
            if (!waiter.isCompleted) {
              waiter.completeError(error);
            }
          }
          _listAdWaiters.clear();
          if (!completer.isCompleted) {
             completer.completeError(error);
          }
          // 실패 시 30초 후 재시도
          Future.delayed(const Duration(seconds: 30), () => preloadListAd(brightness: brightness));
        },
      ),
    );
    adToLoad.load();
  }

  /// 모든 사전 로드된 광고 제거 (테마 변경 시 호출)
  static void clearPreloadedAds() {
    debugPrint('AdService: Clearing all preloaded ads due to theme change');
    
    // 리스트 광고 제거
    for (final ad in _preloadedListAds) {
      ad.dispose();
    }
    _preloadedListAds.clear();
    _preloadedListAdTimes.clear();
    
    // 종료 광고 제거
    _preloadedExitAd?.dispose();
    _preloadedExitAd = null;
    _exitAdLoadCompleter = null;
    
    // 로딩 중 카운트 초기화 (이미 로딩 중인 광고는 dispose logic에 의해 폐기됨)
    _listAdLoadingCount = 0;
  }

  /// 사전 로드된 종료 광고 가져오기 (소비됨)
  /// 반환값: (광고 객체, 로딩 완료 Future)
  static (NativeAd?, Future<void>?) getExitAd() {
    final ad = _preloadedExitAd;
    final future = _exitAdLoadCompleter?.future;
    
    // 가져가면 다음 사용을 위해 변수 초기화 (1회용)
    _preloadedExitAd = null;
    _exitAdLoadCompleter = null;
    
    // 만약 광고는 있는데 future가 없다면, 이미 로드되었거나 로드에 실패한 상태일 수 있음.
    // 안전을 위해 광고가 있을 때만 반환하고, future가 없으면 이미 완료된 것으로 간주할 수 있도록 함.
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
