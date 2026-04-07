import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';

class ListAdWidget extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final double? height;
  final Color? backgroundColor;
  final bool showBorder;
  final bool showShadow;
  final double borderRadius;
  final Border? border;
  final String factoryId;

  const ListAdWidget({
    super.key, 
    this.margin, 
    this.height,
    this.backgroundColor,
    this.showBorder = true,
    this.showShadow = true,
    this.borderRadius = 20,
    this.border,
    this.factoryId = 'listTile',
  });

  @override
  State<ListAdWidget> createState() => _ListAdWidgetState();
}

class _ListAdWidgetState extends State<ListAdWidget> {
  NativeAd? _nativeAd;
  bool _isLoaded = false;
  String _errorMessage = ''; // 에러 메시지 저장용
  int _loadToken = 0;
  Future<void>? _delayFuture; // [추가] 렌더링 지연용 퓨처 저장
  Brightness? _lastBrightness; // [추가] 마지막으로 로드된 테마 상태 저장

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _lastBrightness = Theme.of(context).brightness;
        _loadAd();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentBrightness = Theme.of(context).brightness;
    if (_lastBrightness != null && _lastBrightness != currentBrightness) {
      debugPrint('ListAdWidget: Theme changed from $_lastBrightness to $currentBrightness. Reloading ad.');
      _lastBrightness = currentBrightness;
      _loadAd();
    } else if (_lastBrightness == null) {
      // 초기 상태 저장 (첫 didChangeDependencies 호출 시)
      _lastBrightness = currentBrightness;
    }
  }

  double get _effectiveHeight {
    if (widget.height != null) return widget.height!;
    return widget.factoryId == 'dialogAd' ? 215 : 80;
  }

  void _loadAd() async {
    final token = ++_loadToken;
    _delayFuture = null; // [추가] 새 광고 로드 시 지연 퓨처 초기화
    final oldAd = _nativeAd;
    // [수정] oldAd는 아래에서 dispose하고, 일단 null로 초기화하여 UI에서 즉시 제거
    _nativeAd = null;

    if (!(Platform.isAndroid || Platform.isIOS)) return;

    if (mounted) {
      setState(() {
        _isLoaded = false;
        _errorMessage = '';
      });
    }

    // MobileAds SDK 초기화 대기
    if (!AdService.isInitialized) {
      await AdService.initializationFuture.timeout(
        const Duration(seconds: 3),
        onTimeout: () => null,
      );
    }

    if (!mounted || token != _loadToken) return;

    // 2초 타임아웃 처리 (사용자 요청: 광고가 빨리 안 붙으면 숨김)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && token == _loadToken && !_isLoaded && _errorMessage.isEmpty) {
        setState(() {
          _errorMessage = 'Timeout';
        });
      }
    });

    if (oldAd != null) {
      // [수정] 이전 광고 해제 시점 조절: 새 프레임 이후 안전하게 해제
      WidgetsBinding.instance.addPostFrameCallback((_) {
        oldAd.dispose();
      });
    }

    // 1. 사전 로드된 광고 확인 (기본 listTile인 경우에만)
    if (widget.factoryId == 'listTile') {
      final (preloadedAd, loadFuture) = AdService.getListAd();
      if (preloadedAd != null) {
        if (!mounted || token != _loadToken) {
          preloadedAd.dispose();
          return;
        }
        setState(() {
          _nativeAd = preloadedAd;
          _isLoaded = true;
          _errorMessage = '';
        });
        return;
      }

      if (loadFuture != null) {
        try {
          await loadFuture.timeout(const Duration(milliseconds: 800));
        } catch (_) {}
        if (!mounted || token != _loadToken) return;
        final (ad2, _) = AdService.getListAd();
        if (ad2 != null) {
          setState(() {
            _nativeAd = ad2;
            _isLoaded = true;
            _errorMessage = '';
          });
          return;
        }
      }
    }

    if (!mounted || token != _loadToken) return;
    _loadNewAd(token);
  }

  void _loadNewAd(int token) {
      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
      _nativeAd = NativeAd(
        adUnitId: AdService.nativeAdAdvancedUnitId,
        factoryId: widget.factoryId, // [수정] 위젯의 factoryId 사용
        customOptions: {'theme': isDarkMode ? 'dark' : 'light'},
        request: const AdRequest(),
        nativeAdOptions: NativeAdOptions(
          mediaAspectRatio: MediaAspectRatio.landscape, // 영상/이미지 비율 설정
          videoOptions: VideoOptions(
            startMuted: true, // 소리 없이 자동 재생 시작
            customControlsRequested: true, // [수정] 커스텀 컨트롤러 사용 요청 (기본 버튼 숨기기 위함)
            clickToExpandRequested: false,
          ),
        ),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('Native Ad loaded successfully: ${ad.responseInfo}');
            if (!mounted || token != _loadToken || !identical(_nativeAd, ad)) {
              ad.dispose();
              return;
            }
            // [수정] microtask로 한 프레임 밀어서 빌드 사이클을 맞춤
            Future.microtask(() {
              if (mounted && token == _loadToken && identical(_nativeAd, ad)) {
                setState(() {
                  _isLoaded = true;
                  _errorMessage = '';
                });
              }
            });
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('NativeAd failed to load: $error');
            ad.dispose();
            if (mounted && token == _loadToken && identical(_nativeAd, ad)) {
              setState(() {
                _isLoaded = false;
                _nativeAd = null; // [수정] 실패 시 명시적으로 null 처리
                _errorMessage = 'Code: ${error.code}\n${error.message}'; // 에러 메시지 저장
              });
            }
          },
        ),
      )..load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (AdService.isSubscriber) return const SizedBox.shrink();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // 1. 에러가 있거나, 로드되지 않았거나, 광고 객체가 없으면 무조건 숨김
    // [수정] 빌드 전 null 체크를 더 엄격하게 수행하여 Render Error 원천 차단
    final ad = _nativeAd;
    if (_errorMessage.isNotEmpty || !_isLoaded || ad == null) {
      return const SizedBox.shrink();
    }

    // 2. 정상 로드 시에만 표시
    try {
      return Container(
        height: _effectiveHeight,
        margin: widget.margin ?? EdgeInsets.zero,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? (isDarkMode ? const Color(0xFF1C1C1E) : Colors.white),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: widget.border ?? (widget.showBorder 
              ? Border.all(
                  color: isDarkMode ? Colors.white.withOpacity(0.15) : Colors.black.withOpacity(0.1),
                  width: 1.2,
                )
              : null),
          boxShadow: widget.showShadow 
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDarkMode ? 0.4 : 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          // [수정] AdWidget 자체의 에러(빨간 배경)를 방지하기 위해 렌더링 시점에 추가 검증 및 지연 도입
          // [수정] 빌드 시마다 지연되지 않도록 퓨처 저장
          child: FutureBuilder(
            future: _delayFuture ??= Future.delayed(const Duration(milliseconds: 300)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && 
                  _isLoaded && 
                  _nativeAd != null && 
                  ad.responseInfo != null && 
                  ad.responseInfo?.responseId != null &&
                  identical(_nativeAd, ad)) {
                return AdWidget(
                  key: ValueKey(ad.hashCode), 
                  ad: ad,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    } catch (e) {
      // [추가] 렌더링 중 예상치 못한 오류 발생 시에도 빨간 화면 대신 빈 화면 반환
      debugPrint('AdWidget Rendering Error: $e');
      return const SizedBox.shrink();
    }
  }
}

class ExitDialogAdWidget extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  const ExitDialogAdWidget({super.key, this.margin});

  @override
  State<ExitDialogAdWidget> createState() => _ExitDialogAdWidgetState();
}

class _ExitDialogAdWidgetState extends State<ExitDialogAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;
  bool _canRenderAd = false;
  String? _adLoadError;
  int _loadToken = 0;
  Brightness? _lastBrightness; // [추가] 마지막으로 로드된 테마 상태 저장

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _lastBrightness = Theme.of(context).brightness;
        _loadAd();
      }
    });

    // 초기화 대기 및 타임아웃
    AdService.initializationFuture.then((_) {
      if (mounted && !_isAdLoaded && _adLoadError == null) {
        // 이미 _loadAd()가 시작되었으므로 별도 호출 불필요
      }
    });

    Future.delayed(const Duration(seconds: 4), () { // 초기화 시간 고려하여 타임아웃 연장
      if (mounted && !_isAdLoaded && _adLoadError == null) {
        setState(() {
          _adLoadError = 'Timeout';
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentBrightness = Theme.of(context).brightness;
    if (_lastBrightness != null && _lastBrightness != currentBrightness) {
      debugPrint('ExitDialogAdWidget: Theme changed from $_lastBrightness to $currentBrightness. Reloading ad.');
      _lastBrightness = currentBrightness;
      _loadAd();
    } else if (_lastBrightness == null) {
      // 초기 상태 저장 (첫 didChangeDependencies 호출 시)
      _lastBrightness = currentBrightness;
    }
  }

  void _loadAd() async {
    final token = ++_loadToken;
    final oldAd = _nativeAd;
    _nativeAd = null;

    if (oldAd != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        oldAd.dispose();
      });
    }

    setState(() {
      _isAdLoaded = false;
      _canRenderAd = false;
      _adLoadError = null;
    });

    // MobileAds SDK 초기화 대기
    if (!AdService.isInitialized) {
      await AdService.initializationFuture.timeout(
        const Duration(seconds: 3),
        onTimeout: () => null,
      );
    }

    if (!mounted || token != _loadToken) return;

    // 1. 사전 로드된 광고 확인
    final (preloadedAd, loadFuture) = AdService.getExitAd();
    if (preloadedAd != null) {
      _nativeAd = preloadedAd;
      
      // [수정] 즉시 _isAdLoaded를 true로 설정하지 않고, 로딩 완료를 기다림
      if (loadFuture != null) {
        loadFuture.then((_) {
          if (mounted && token == _loadToken && identical(_nativeAd, preloadedAd)) {
            _startRenderSequence(token, preloadedAd);
          }
        }).catchError((e) {
          if (mounted && token == _loadToken) {
            _handleLoadFailure(token, preloadedAd, e.toString());
          }
        });
      } else {
        _startRenderSequence(token, preloadedAd);
      }
      return;
    }

    _loadNewAd(token);
  }

  void _startRenderSequence(int token, NativeAd ad) {
    if (!mounted || token != _loadToken) return;
    
    setState(() {
      _isAdLoaded = true;
      _canRenderAd = false;
      _adLoadError = null;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && token == _loadToken && identical(_nativeAd, ad)) {
        setState(() {
          _canRenderAd = true;
        });
      }
    });
  }

  void _handleLoadFailure(int token, NativeAd ad, String error) {
    if (mounted && token == _loadToken) {
      setState(() {
        _isAdLoaded = false;
        _canRenderAd = false;
        _nativeAd = null;
        _adLoadError = error;
      });
      // [추가] 실패 시 명시적으로 dispose (AdService에서 핸드오프된 광고일 수 있으므로)
      ad.dispose();
    }
  }

  void _loadNewAd(int token) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    _nativeAd = NativeAd(
      adUnitId: AdService.nativeAdUnitId,
      factoryId: 'dialogAd',
      customOptions: {'theme': isDarkMode ? 'dark' : 'light'},
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
          debugPrint('Exit Dialog Native Ad loaded');
          if (!mounted || token != _loadToken || !identical(_nativeAd, ad)) {
            ad.dispose();
            return;
          }
          _startRenderSequence(token, ad as NativeAd);
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Exit Dialog Native Ad failed to load: $error');
          ad.dispose();
          _handleLoadFailure(token, ad as NativeAd, error.message);
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _loadToken++; // 현재 진행 중인 모든 로드 작업을 무효화
    final ad = _nativeAd;
    _nativeAd = null;
    if (ad != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ad.dispose();
      });
    }
    // 다음 종료 시도를 위해 광고 다시 사전 로드
    AdService.preloadExitAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (AdService.isSubscriber) return const SizedBox.shrink();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (_adLoadError != null) {
      return const SizedBox.shrink();
    }

    final ad = _nativeAd;
    // [수정] _canRenderAd 게이트를 더 철저히 검증하고, 광고 객체 상태를 직접 확인
    if (ad == null || !_isAdLoaded || !_canRenderAd) {
      return const SizedBox.shrink();
    }

    try {
      // [추가] ad.responseInfo가 있어도 실제로 렌더링 준비가 되었는지 한 번 더 확인
      if (ad.responseInfo == null || ad.responseInfo?.responseId == null || !identical(_nativeAd, ad)) {
        debugPrint('ExitDialogAdWidget: Ad not ready for rendering yet (responseId is null)');
        return const SizedBox.shrink();
      }

      // [추가] adId가 0이 아닌지 (Dart-side ID) 및 ad object 유효성 검증
      // 0인 경우라도 Native side에서 인식이 안 되면 오류 발생하므로, 
      // 렌더링 게이트(_canRenderAd)를 더 신뢰함.
      
      return Container(
        height: 200,
        margin: widget.margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDarkMode ? Colors.white.withOpacity(0.15) : Colors.black.withOpacity(0.1),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDarkMode ? 0.4 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AdWidget(
            key: ValueKey(ad.hashCode),
            ad: ad,
          ),
        ),
      );
    } catch (e) {
      debugPrint('ExitDialogAdWidget Rendering Error: $e');
      return const SizedBox.shrink();
    }
  }
}
