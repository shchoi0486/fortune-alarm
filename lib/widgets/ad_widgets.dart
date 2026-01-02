import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';

class BottomBannerAd extends StatefulWidget {
  const BottomBannerAd({super.key});

  @override
  State<BottomBannerAd> createState() => _BottomBannerAdState();
}

class _BottomBannerAdState extends State<BottomBannerAd> {
  NativeAd? _nativeAd;
  bool _isLoaded = false;
  String? _errorMessage;
  
  @override
  void initState() {
    super.initState();
    _loadAd();

    // 타임아웃 10초
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && !_isLoaded && _errorMessage == null) {
        setState(() {
          _errorMessage = 'Timeout';
        });
      }
    });
  }

  void _loadAd() {
    setState(() {
      _isLoaded = false;
      _errorMessage = null;
    });

    _nativeAd = NativeAd(
      adUnitId: AdService.nativeAdUnitId, 
      factoryId: 'textBanner',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('Text Banner Ad loaded');
          if (mounted) {
            setState(() {
              _isLoaded = true;
              _errorMessage = null;
            });
          }
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Text Banner Ad failed to load: $err');
          ad.dispose();
          if (mounted) {
            setState(() {
              _isLoaded = false;
              _errorMessage = '${err.code}';
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
    // 다크모드 여부 확인
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;

    // 네이티브 광고는 높이를 직접 지정해야 함 (텍스트 한 줄 + 패딩 고려하여 약 50~60dp)
    // 사용자 피드백: 여백이 너무 많음 -> 높이를 45.0으로 축소
    const double height = 45.0;

    // 1. 로드 실패 시 에러 표시 및 재시도
    if (_errorMessage != null) {
      return Container(
        color: backgroundColor,
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: _loadAd,
          child: SingleChildScrollView( // 에러 메시지가 길 경우를 대비
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, size: 14, color: isDarkMode ? Colors.grey[600] : Colors.grey),
                const SizedBox(width: 4),
                Text(
                  'Ad error (Tap to retry)', 
                  style: TextStyle(
                    fontSize: 10, 
                    color: isDarkMode ? Colors.grey[600] : Colors.grey,
                  )
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 2. 로딩 중
    if (!_isLoaded || _nativeAd == null) {
      return Container(
        color: backgroundColor,
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 12, 
              height: 12, 
              child: CircularProgressIndicator(
                strokeWidth: 2, 
                color: isDarkMode ? Colors.grey[700] : Colors.grey[300]
              )
            ),
            const SizedBox(width: 8),
            Text(
              'Loading Ad...', 
              style: TextStyle(
                fontSize: 10, 
                color: isDarkMode ? Colors.grey[600] : Colors.grey,
                fontWeight: FontWeight.w500
              )
            ),
          ],
        ),
      );
    }
    
    // 3. 광고 표시
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      child: AdWidget(ad: _nativeAd!),
    );
  }
}

class DetailedAdWidget extends StatefulWidget {
  const DetailedAdWidget({super.key});

  @override
  State<DetailedAdWidget> createState() => _DetailedAdWidgetState();
}

class _DetailedAdWidgetState extends State<DetailedAdWidget> {
  NativeAd? _nativeAd;
  bool _isLoaded = false;
  String _errorMessage = ''; // 에러 메시지 저장용

  @override
  void initState() {
    super.initState();
    _loadAd();

    // 10초 타임아웃 처리
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && !_isLoaded && _errorMessage.isEmpty) {
        setState(() {
          _errorMessage = '광고 로드 시간이 초과되었습니다.';
        });
      }
    });
  }

  void _loadAd() {
    // 이미 로딩된 광고가 있다면 정리
    _nativeAd?.dispose();
    _nativeAd = null;
    
    if (Platform.isAndroid || Platform.isIOS) {
      setState(() {
        _isLoaded = false;
        _errorMessage = '';
      });

      // 1. 사전 로드된 광고 확인
      final (preloadedAd, loadFuture) = AdService.getListAd();
      if (preloadedAd != null) {
        debugPrint('Using Preloaded List Ad');
        _nativeAd = preloadedAd;
        
        loadFuture?.then((_) {
          if (mounted) {
            setState(() {
              _isLoaded = true;
              _errorMessage = '';
            });
          }
        }).catchError((error) {
          debugPrint('Preloaded List Ad failed: $error');
          if (mounted) {
             _loadNewAd(); // 실패 시 새로 로드 시도
          }
        });
        return;
      }

      // 2. 없으면 새로 로드
      _loadNewAd();
    }
  }

  void _loadNewAd() {
      _nativeAd = NativeAd(
        adUnitId: AdService.nativeAdUnitId,
        factoryId: 'listTile', // Android 네이티브 팩토리 ID
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('Native Ad loaded successfully: ${ad.responseInfo}');
            if (mounted) {
              setState(() {
                _isLoaded = true;
                _errorMessage = '';
              });
            }
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('NativeAd failed to load: $error');
            ad.dispose();
            if (mounted) {
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
    // 다음 표시를 위해 광고 다시 사전 로드
    AdService.preloadListAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (_isLoaded && _nativeAd != null) {
      return Container(
        height: 72, // 높이 유지 (내부 콘텐츠에 딱 맞음)
        // margin: const EdgeInsets.symmetric(vertical: 8), // 상하 여백 제거 (사용자 요청)
        margin: EdgeInsets.zero, // 여백 완전 제거하여 다른 카드들과 간격 통일성 확보
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(16), // 둥근 모서리
          border: Border.all(
            color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!, // 테두리
            width: isDarkMode ? 1 : 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AdWidget(ad: _nativeAd!),
        ),
      );
    }
    
    // 로딩 실패 시 에러 메시지 표시 (디버깅용)
    if (_errorMessage.isNotEmpty) {
      return GestureDetector(
        onTap: _loadAd, // 탭하면 재시도
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.red.withOpacity(0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 10),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, size: 12, color: Colors.red),
                  SizedBox(width: 4),
                  Text('탭하여 재시도', style: TextStyle(color: Colors.red, fontSize: 10)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    // 로딩 중일 때 (스켈레톤 UI 표시로 체감 속도 향상)
    return Container(
       height: 72, // 로드 완료 시와 동일한 높이
       // margin: EdgeInsets.zero,
       margin: EdgeInsets.zero,
       decoration: BoxDecoration(
         color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
         borderRadius: BorderRadius.circular(16),
         border: Border.all(
           color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
           width: 1,
         ),
       ),
       child: Center(
         child: Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             SizedBox(
               width: 12, 
               height: 12, 
               child: CircularProgressIndicator(
                 strokeWidth: 2, 
                 color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
               ),
             ),
             const SizedBox(width: 8),
             Text(
               'AD',
               style: TextStyle(
                 color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                 fontWeight: FontWeight.bold,
                 fontSize: 12,
               ),
             ),
           ],
         ),
       ),
    );
  }
}

class ExitDialogAdWidget extends StatefulWidget {
  const ExitDialogAdWidget({super.key});

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
    _loadAd();
    
    // 1초 후에 광고 표시 (애니메이션 효과처럼)
    _timer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showAd = true;
        });
      }
    });

    // 안전장치: 10초가 지나도 반응이 없으면 타임아웃 처리 (팩토리 미등록 등 네이티브 통신 문제 의심)
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && !_isAdLoaded && _adLoadError == null) {
        setState(() {
          _adLoadError = '광고 응답 없음\n앱을 완전히 종료 후 다시 실행해주세요.';
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
    _nativeAd = NativeAd(
      adUnitId: AdService.nativeAdUnitId, // 네이티브 광고 ID 사용
      factoryId: 'dialogAd', // 이미지/영상이 포함된 팩토리 ID 사용
      request: const AdRequest(),
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
              _adLoadError = '광고 로드 실패: ${error.code}';
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
    return AspectRatio(
      aspectRatio: 1.0, // 정사각형
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    // 1. 광고 로드 완료 및 표시 시점 도달 시 광고 표시 (전체 영역)
    if (_showAd && _isAdLoaded && _nativeAd != null) {
      return AdWidget(ad: _nativeAd!);
    }

    // 2. 에러 발생 시 재시도 버튼 표시
    if (_adLoadError != null) {
      return Stack(
        children: [
          _buildCuteImage(),
          Container(
            color: Colors.white.withOpacity(0.8),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Colors.red[300], size: 32),
                const SizedBox(height: 8),
                Text(
                  _adLoadError!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _loadAd,
                  icon: const Icon(Icons.refresh, size: 16),
                  label: const Text('재시도'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                    elevation: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // 3. 로딩 중이거나 대기 상태일 때 귀여운 이미지 표시
    return _buildCuteImage(isLoading: _showAd && !_isAdLoaded);
  }

  Widget _buildCuteImage({bool isLoading = false}) {
    return Container(
      color: const Color(0xFFFFF8E1), // 연한 노란색 배경
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Bye',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '광고 로딩 중...',
                      style: TextStyle(fontSize: 10, color: Colors.black54),
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
