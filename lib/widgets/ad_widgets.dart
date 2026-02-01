import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../services/ad_service.dart';

class DetailedAdWidget extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  const DetailedAdWidget({super.key, this.margin});

  @override
  State<DetailedAdWidget> createState() => _DetailedAdWidgetState();
}

class _DetailedAdWidgetState extends State<DetailedAdWidget> {
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

    // 10초 타임아웃 처리는 _loadAd 내부에서 관리하도록 변경함
  }

  void _loadAd() async {
    final token = ++_loadToken;
    final oldAd = _nativeAd;
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        oldAd.dispose();
      });
    }

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

    if (!mounted || token != _loadToken) return;
    _loadNewAd(token);
  }

  void _loadNewAd(int token) {
      _nativeAd = NativeAd(
        adUnitId: AdService.nativeAdAdvancedUnitId,
        factoryId: 'listTile', // Android 네이티브 팩토리 ID
        request: const AdRequest(),
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
    // AdService.preloadListAd()는 이제 getListAd()에서 자동으로 호출되므로 
    // 여기서 중복 호출할 필요가 없거나, 필요 시에만 호출하도록 변경 가능
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (_isLoaded && _nativeAd != null) {
      return Container(
        height: 80, // 높이 약간 상향 (콘텐츠 여유 확보)
        margin: widget.margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
          borderRadius: BorderRadius.circular(20), // 다른 카드와 통일
          border: Border.all(
            color: isDarkMode ? Colors.white.withOpacity(0.15) : Colors.black.withOpacity(0.1),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDarkMode ? 0.4 : 0.05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AdWidget(ad: _nativeAd!),
        ),
      );
    }
    
    // 1. 로딩 실패 시 빈 공간 반환 (에러 메시지 숨김)
    if (_errorMessage.isNotEmpty) {
      return const SizedBox.shrink();
    }

    // 2. 로딩 중일 때 (스켈레톤 UI 표시로 체감 속도 향상)
    // 사용자 요청: 광고 로드가 안 되면 숨겨야 함. 
    return const SizedBox.shrink();
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
    if (_showAd && _isAdLoaded && _nativeAd != null) {
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
          child: AdWidget(ad: _nativeAd!),
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
