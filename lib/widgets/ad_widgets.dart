import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _loadAd();
    });
  }

  double get _effectiveHeight {
    if (widget.height != null) return widget.height!;
    return widget.factoryId == 'dialogAd' ? 215 : 80;
  }

  void _loadAd() async {
    final token = ++_loadToken;
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
      _nativeAd = NativeAd(
        adUnitId: AdService.nativeAdAdvancedUnitId,
        factoryId: widget.factoryId, // [수정] 위젯의 factoryId 사용
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
            if (!mounted || token != _loadToken) {
              ad.dispose();
              return;
            }
            setState(() {
              _isLoaded = true;
              _errorMessage = '';
            });
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('NativeAd failed to load: $error');
            ad.dispose();
            if (mounted && token == _loadToken) {
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
    return Container(
      height: _effectiveHeight,
      margin: widget.margin ?? EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? (isDarkMode ? const Color(0xFF2C2C2E) : Colors.white),
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
        child: AdWidget(
          key: ValueKey(ad.hashCode), 
          ad: ad,
        ),
      ),
    );
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
  bool _showAd = false;
  String? _adLoadError;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // UI가 먼저 렌더링된 후 광고를 로드하도록 지연 실행
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _loadAd();
    });
    
    // 1초 후에 광고 표시 (애니메이션 효과처럼)
    _timer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showAd = true;
        });
      }
    });

    // 안전장치: 2초가 지나도 반응이 없으면 타임아웃 처리 (사용자 요청: 광고가 빨리 안 붙으면 숨김)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && !_isAdLoaded && _adLoadError == null) {
        setState(() {
          _adLoadError = 'Timeout';
        });
      }
    });
  }

  void _loadAd() {
    _nativeAd?.dispose();
    _nativeAd = null;
    
    setState(() {
      _isAdLoaded = false;
      _adLoadError = null;
    });

    // 1. 사전 로드된 광고 확인
    final (preloadedAd, loadFuture) = AdService.getExitAd();
    if (preloadedAd != null) {
      debugPrint('Using Preloaded Exit Dialog Ad');
      _nativeAd = preloadedAd;
      
      loadFuture?.then((_) {
        if (mounted) {
          setState(() {
            _isAdLoaded = true;
            _adLoadError = null;
          });
        }
      }).catchError((error) {
        debugPrint('Preloaded Exit Ad failed: $error');
        if (mounted) {
           _loadNewAd();
        }
      });
      return;
    }

    // 2. 없으면 새로 로드
    _loadNewAd();
  }

  void _loadNewAd() {
    final l10n = AppLocalizations.of(context);
    _nativeAd = NativeAd(
      adUnitId: AdService.nativeAdUnitId, // 네이티브 광고 ID 사용
      factoryId: 'dialogAd', // 이미지/영상이 포함된 팩토리 ID 사용
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
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
              _adLoadError = null;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Exit Dialog Native Ad failed to load: $error');
          ad.dispose();
          if (mounted) {
            setState(() {
              _isAdLoaded = false;
              _nativeAd = null; // [수정] 실패 시 명시적으로 null 처리하여 렌더링 방지
              _adLoadError = '${l10n?.adLoadFailed ?? 'Ad failed to load'}: ${error.code}';
            });
          }
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _nativeAd?.dispose();
    // 다음 종료 시도를 위해 광고 다시 사전 로드
    AdService.preloadExitAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // 1. 광고 로드 완료 및 표시 시점 도달 시 광고 표시 (전체 영역)
    // [수정] _nativeAd가 null이 아닌지 재확인하여 안전성 확보
    if (_showAd && _isAdLoaded && _nativeAd != null && _adLoadError == null) {
      return Container(
        height: 200, // 고정 높이 부여
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
          // [수정] Key 추가: 광고 객체가 변경될 때 위젯을 새로 생성하여 내부 상태 충돌 방지
          child: AdWidget(
            key: ValueKey(_nativeAd!.hashCode),
            ad: _nativeAd!
          ),
        ),
      );
    }

    // 2. 로딩 중이거나 에러 발생 시 빈 공간 대신 귀여운 이미지 표시
    return Container(
      height: 200, // 고정 높이 부여
      margin: widget.margin ?? EdgeInsets.zero,
      child: _buildCuteImage(isLoading: _showAd && !_isAdLoaded && _adLoadError == null),
    );
  }

  Widget _buildCuteImage({bool isLoading = false}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 200, // 고정 높이 보장
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 말풍선 (Bye)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF3C3C3E) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: isDarkMode ? Border.all(color: Colors.white24) : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Bye',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 고양이 아이콘
              const Icon(
                Icons.pets,
                size: 80,
                color: Colors.orangeAccent,
              ),
            ],
          ),
          // 로딩 중일 때 하단에 표시
          if (isLoading)
            Positioned(
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)?.adLoading ?? 'Loading ad...',
                      style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white70 : Colors.black54),
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