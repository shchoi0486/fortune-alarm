import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdService.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          if (!mounted || !identical(_bannerAd, ad)) {
            ad.dispose();
            return;
          }
          // [수정] microtask로 한 프레임 밀어서 빌드 사이클을 맞춤
          Future.microtask(() {
            if (mounted && identical(_bannerAd, ad)) {
              setState(() {
                _isLoaded = true;
              });
            }
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
          if (mounted && identical(_bannerAd, ad)) {
            setState(() {
              _isLoaded = false;
              _bannerAd = null;
            });
          }
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _bannerAd;
    if (_isLoaded && ad != null) {
      try {
        return SizedBox(
          width: ad.size.width.toDouble(),
          height: ad.size.height.toDouble(),
          // [수정] AdWidget 자체의 에러(빨간 배경)를 방지하기 위해 렌더링 시점에 추가 검증 및 지연 도입
          child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 150)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && 
                  _isLoaded && 
                  _bannerAd != null && 
                  ad.responseInfo != null &&
                  ad.responseInfo?.responseId != null &&
                  identical(_bannerAd, ad)) {
                return AdWidget(
                  key: ValueKey(ad.hashCode),
                  ad: ad
                );
              }
              return const SizedBox.shrink();
            },
          ),
        );
      } catch (e) {
        debugPrint('AdBannerWidget Rendering Error: $e');
        return const SizedBox.shrink();
      }
    }
    // 광고가 로드되지 않았을 때는 빈 공간 반환 (또는 높이 0)
    return const SizedBox.shrink();
  }
}
