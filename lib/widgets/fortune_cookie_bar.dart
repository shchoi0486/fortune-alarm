import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mission_provider.dart';
import '../providers/weather_provider.dart';
import '../features/fortune/account_management_screen.dart';

class FortuneCookieBar extends ConsumerWidget {
  const FortuneCookieBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch fortuneCookieCount from missionProvider
    final count = ref.watch(missionProvider.select((s) => s.fortuneCookieCount));
    final weatherAsync = ref.watch(weatherProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : Colors.black87;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Weather Widget (Replaces Title)
          InkWell(
            onTap: () {
              ref.invalidate(weatherProvider);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const WeatherDetailSheet(),
              );
            },
            child: weatherAsync.when(
              data: (weather) => Row(
                children: [
                  Icon(
                    _getWeatherIconSmall(weather.condition), 
                    size: 24, 
                    color: iconColor
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${weather.temperature.toInt()}°C',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _getDustColor(weather.fineDustStatusKey),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '미세 ${_getLocalizedAirQuality(context, weather.fineDustStatusKey)}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: textColor.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              loading: () => const SizedBox(
                width: 20, 
                height: 20, 
                child: CircularProgressIndicator(strokeWidth: 2)
              ),
              error: (err, stack) => const Icon(Icons.error_outline, size: 24, color: Colors.red),
            ),
          ),
          
          // Right side actions
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Fortune Cookie Count Widget - Compact Style
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Text('🥠', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              
              // Search Icon
              Icon(Icons.search, size: 24, color: iconColor),
              
              const SizedBox(width: 8),
              
              // Profile Icon with Notification Dot
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountManagementScreen()),
                  );
                },
                child: Stack(
                  children: [
                    Icon(Icons.person_outline, size: 24, color: iconColor),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIconSmall(String condition) {
    switch (condition) {
      case 'Sunny': return Icons.wb_sunny_outlined;
      case 'Cloudy': return Icons.wb_cloudy_outlined;
      case 'Foggy': return Icons.cloud;
      case 'Rainy': return Icons.umbrella_outlined;
      case 'Snowy': return Icons.ac_unit_outlined;
      case 'Thunderstorm': return Icons.thunderstorm_outlined;
      default: return Icons.wb_cloudy_outlined;
    }
  }

  Color _getDustColor(String statusKey) {
    switch (statusKey) {
      case 'airQualityGood': return Colors.green;
      case 'airQualityNormal': return Colors.blue;
      case 'airQualityBad': return Colors.orange;
      case 'airQualityVeryBad': return Colors.red;
      default: return Colors.grey;
    }
  }
}

class WeatherDetailSheet extends ConsumerWidget {
  const WeatherDetailSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: weatherAsync.when(
        data: (weather) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.weatherToday,
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close, color: isDarkMode ? Colors.white70 : Colors.black54),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  ref.invalidate(weatherProvider);
                  // Optional: Show a small snackbar or feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.weatherUpdateMessage),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        _getLocalizedLocation(context, weather.location),
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
                Icon(
                  _getWeatherIcon(weather.condition),
                  size: 80,
                  color: _getWeatherColor(weather.condition),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${weather.temperature.toInt()}°C',
                      style: TextStyle(
                        fontSize: 48, 
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      weather.condition,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDustInfo(context, AppLocalizations.of(context)!.labelFineDust, weather.fineDustStatusKey),
                      Container(width: 1, height: 24, color: isDarkMode ? Colors.white24 : Colors.grey[300]),
                      _buildDustInfo(context, AppLocalizations.of(context)!.labelUltraFineDust, weather.ultraFineDustStatusKey),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  AppLocalizations.of(context)!.weatherDisclaimer,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black87,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.weatherSource,
                    style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildDustInfo(BuildContext context, String label, String statusKey) {
    Color valueColor = Colors.green;
    if (statusKey == 'airQualityBad') valueColor = Colors.orange;
    if (statusKey == 'airQualityVeryBad') valueColor = Colors.red;

    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 4),
        Text(
          _getLocalizedAirQuality(context, statusKey),
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition) {
      case 'Sunny': return Icons.wb_sunny_outlined;
      case 'Cloudy': return Icons.wb_cloudy_outlined;
      case 'Foggy': return Icons.foggy;
      case 'Rainy': return Icons.umbrella_outlined;
      case 'Snowy': return Icons.ac_unit_outlined;
      case 'Thunderstorm': return Icons.thunderstorm_outlined;
      default: return Icons.wb_cloudy_outlined;
    }
  }

  Color _getWeatherColor(String condition) {
    switch (condition) {
      case 'Sunny': return Colors.orange;
      case 'Cloudy': return Colors.blueGrey;
      case 'Foggy': return Colors.grey;
      case 'Rainy': return Colors.blue;
      case 'Snowy': return Colors.lightBlueAccent;
      case 'Thunderstorm': return Colors.deepPurple;
      default: return Colors.blue;
    }
  }
}

String _getLocalizedCondition(BuildContext context, String condition) {
  final l10n = AppLocalizations.of(context)!;
  switch (condition) {
    case 'Sunny': return l10n.weatherConditionSunny;
    case 'Cloudy': return l10n.weatherConditionCloudy;
    case 'Foggy': return l10n.weatherConditionFoggy;
    case 'Rainy': return l10n.weatherConditionRainy;
    case 'Snowy': return l10n.weatherConditionSnowy;
    case 'Thunderstorm': return l10n.weatherConditionThunderstorm;
    default: return condition;
  }
}

String _getLocalizedAirQuality(BuildContext context, String statusKey) {
  final l10n = AppLocalizations.of(context)!;
  switch (statusKey) {
    case 'airQualityGood': return l10n.airQualityGood;
    case 'airQualityNormal': return l10n.airQualityNormal;
    case 'airQualityBad': return l10n.airQualityBad;
    case 'airQualityVeryBad': return l10n.airQualityVeryBad;
    default: return statusKey;
  }
}

String _getLocalizedLocation(BuildContext context, String location) {
  final l10n = AppLocalizations.of(context)!;
  if (location == 'locationUnknown') return l10n.locationUnknown;
  if (location == 'locationError') return l10n.locationError;
  return location;
}
