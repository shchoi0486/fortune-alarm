import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';

class AdBannerWidget extends StatefulWidget {
  final bool useCardStyle;
  final EdgeInsetsGeometry? margin;

  const AdBannerWidget({
    super.key,
    this.useCardStyle = false,
    this.margin,
  });

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _isAdRequestPending = false;
  double? _availableWidth;

  Future<void> _loadAd(double width) async {
    if (_isAdRequestPending || width <= 0) return;
    _isAdRequestPending = true;

    try {
      if (!AdService.isInitialized) {
        await AdService.initializationFuture;
      }

      final screenWidth = width.truncate();
      final adSize =
          await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(screenWidth) ?? AdSize.banner;

      final bannerAd = BannerAd(
        adUnitId: AdService.bannerAdUnitId,
        request: const AdRequest(),
        size: adSize,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            if (!mounted || !identical(_bannerAd, ad)) {
              ad.dispose();
              return;
            }
            _isAdRequestPending = false;
            setState(() {
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, err) {
            debugPrint('BannerAd failed to load: $err');
            ad.dispose();
            _isAdRequestPending = false;
            if (mounted && identical(_bannerAd, ad)) {
              setState(() {
                _isLoaded = false;
                _bannerAd = null;
              });
            }

            Future.delayed(const Duration(seconds: 2), () {
              if (mounted && _availableWidth != null && _bannerAd == null) {
                _loadAd(_availableWidth!);
              }
            });
          },
        ),
      );

      _bannerAd?.dispose();
      _bannerAd = bannerAd;
      bannerAd.load();
    } catch (e) {
      _isAdRequestPending = false;
      debugPrint('AdBannerWidget Load Error: $e');
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_availableWidth == null || (_availableWidth! - constraints.maxWidth).abs() > 1) {
          _availableWidth = constraints.maxWidth;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _availableWidth != null) {
              _loadAd(_availableWidth!);
            }
          });
        }

        final ad = _bannerAd;
        if (_isLoaded && ad != null) {
          try {
            Widget adContent = SizedBox(
              width: ad.size.width.toDouble(),
              height: ad.size.height.toDouble(),
              child: AdWidget(
                key: ValueKey(ad.hashCode),
                ad: ad,
              ),
            );

            if (widget.useCardStyle) {
              final isDarkMode = Theme.of(context).brightness == Brightness.dark;
              adContent = Container(
                width: double.infinity,
                margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode ? Colors.white.withOpacity(0.12) : const Color(0xFFCBD5E1),
                    width: isDarkMode ? 1.0 : 0.5,
                  ),
                  color: isDarkMode ? const Color(0xFF1C1C1E) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDarkMode ? 0.15 : 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(child: adContent),
              );
            } else if (widget.margin != null) {
              adContent = Padding(
                padding: widget.margin!,
                child: Center(child: adContent),
              );
            }

            return adContent;
          } catch (e) {
            debugPrint('AdBannerWidget Rendering Error: $e');
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
