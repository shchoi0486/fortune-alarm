import 'package:flutter/material.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../providers/mission_provider.dart';
import '../providers/weather_provider.dart';
import '../providers/notification_provider.dart';
import '../features/fortune/account_management_screen.dart';

class FortuneCookieBar extends ConsumerWidget {
  const FortuneCookieBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch fortuneCookieCount from missionProvider
    final count = ref.watch(missionProvider.select((s) => s.fortuneCookieCount));
    final hasNewNotification = ref.watch(hasNewNotificationProvider);
    final weatherAsync = ref.watch(weatherProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : Colors.black87;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
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
                enableDrag: true,
                builder: (context) => const WeatherDetailSheet(),
              );
            },
            child: weatherAsync.when(
              data: (weather) => Row(
                children: [
                  Text(
                    _getWeatherEmoji(weather.condition),
                    style: const TextStyle(fontSize: 18, height: 1),
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
                            '${l10n.labelFineDust} ${_getLocalizedAirQuality(context, weather.fineDustStatusKey)}',
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountManagementScreen()),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
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
              ),
              const SizedBox(width: 8),
              
              // Notification Icon
               Stack(
                 children: [
                   GestureDetector(
                     onTap: () {
                       ref.read(hasNewNotificationProvider.notifier).state = false;
                       
                       // TODO: Implement notification list or popup
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           content: Text(l10n.noNotifications ?? 'No new notifications.'),
                           duration: const Duration(seconds: 1),
                         ),
                       );
                     },
                     child: Icon(Icons.notifications_outlined, size: 24, color: iconColor),
                   ),
                   // New notification badge - 새로운 알림이 있을 때만 표시
                   if (hasNewNotification)
                     Positioned(
                       top: 2,
                       right: 2,
                       child: Container(
                         width: 6,
                         height: 6,
                         decoration: const BoxDecoration(
                           color: Colors.red,
                           shape: BoxShape.circle,
                         ),
                       ),
                     ),
                 ],
               ),
              
              const SizedBox(width: 8),
              
              // Profile Icon
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountManagementScreen()),
                  );
                },
                child: Icon(Icons.person_outline, size: 24, color: iconColor),
              ),
            ],
          ),
        ],
      ),
    );
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
    final l10n = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.35,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF121212) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(
              color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.04),
            ),
          ),
          child: SafeArea(
            top: false,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                ...weatherAsync.when(
                  data: (weather) => [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40,
                              height: 5,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: isDarkMode ? Colors.white24 : Colors.grey[300],
                                borderRadius: BorderRadius.circular(2.5),
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 40),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      l10n.weatherToday,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: isDarkMode ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.refresh_rounded,
                                    color: isDarkMode ? Colors.white70 : Colors.black54,
                                  ),
                                  onPressed: () => ref.invalidate(weatherProvider),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () => ref.invalidate(weatherProvider),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      size: 14,
                                      color: isDarkMode ? Colors.blueAccent[100] : Colors.blueAccent,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _getLocalizedLocation(context, weather.location),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isDarkMode ? Colors.white60 : Colors.black54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: isDarkMode
                                      ? [const Color(0xFF2C2C2C), const Color(0xFF1E1E1E)]
                                      : [Colors.blue[50]!, Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.04),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(isDarkMode ? 0.18 : 0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${weather.temperature.toInt()}°',
                                          style: TextStyle(
                                            fontSize: 48,
                                            fontWeight: FontWeight.bold,
                                            color: isDarkMode ? Colors.white : Colors.black87,
                                            height: 1.05,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          _getLocalizedCondition(context, weather.condition),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: _getWeatherColor(weather.condition),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 46,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      color: _getWeatherColor(weather.condition).withOpacity(isDarkMode ? 0.18 : 0.12),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _getWeatherEmoji(weather.condition),
                                        style: const TextStyle(fontSize: 20, height: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildDustCard(
                                    context,
                                    l10n.labelFineDust,
                                    weather.fineDustStatusKey,
                                    isDarkMode,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildDustCard(
                                    context,
                                    l10n.labelUltraFineDust,
                                    weather.ultraFineDustStatusKey,
                                    isDarkMode,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (weather.hourlyForecasts.isNotEmpty) ...[
                              _buildSectionTitle(l10n.hourlyForecast, isDarkMode),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 90,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: weather.hourlyForecasts.length,
                                  itemBuilder: (context, index) {
                                    final hourly = weather.hourlyForecasts[index];
                                    return Container(
                                      width: 58,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[50],
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: isDarkMode ? Colors.white10 : Colors.grey[200]!,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            l10n.hourFormat(hourly.time.hour.toString()),
                                            style: TextStyle(
                                              color: isDarkMode ? Colors.white60 : Colors.black54,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            _getWeatherEmoji(hourly.condition),
                                            style: const TextStyle(fontSize: 18, height: 1),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${hourly.temperature.toInt()}°',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: isDarkMode ? Colors.white : Colors.black87,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (weather.dailyForecasts.isNotEmpty) ...[
                              _buildSectionTitle(l10n.weeklyForecast, isDarkMode),
                              const SizedBox(height: 6),
                              ...weather.dailyForecasts.map((daily) => _buildDailyRow(context, daily, isDarkMode)),
                            ],
                            const SizedBox(height: 22),
                            Text(
                              l10n.weatherDisclaimer,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white38 : Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                              decoration: BoxDecoration(
                                color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[100],
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                l10n.weatherSource,
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white54 : Colors.grey[600],
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  loading: () => [
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ],
                  error: (err, stack) => [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildErrorState(context, l10n, isDarkMode, ref),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDustCard(BuildContext context, String label, String statusKey, bool isDarkMode) {
    Color valueColor = Colors.green;
    if (statusKey == 'airQualityBad') valueColor = Colors.orange;
    if (statusKey == 'airQualityVeryBad') valueColor = Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? Colors.white10 : Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDarkMode ? Colors.white38 : Colors.grey[600],
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: valueColor, borderRadius: BorderRadius.circular(3.5)),
          ),
          const SizedBox(width: 6),
          Text(
            _getLocalizedAirQuality(context, statusKey),
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyRow(BuildContext context, dynamic daily, bool isDarkMode) {
    final weekDay = _getWeekdayName(context, daily.date.weekday);
    final dateStr = '${daily.date.month}/${daily.date.day}';
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[100]!,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(weekDay, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: isDarkMode ? Colors.white : Colors.black87)),
                Text(dateStr, style: TextStyle(fontSize: 11, color: isDarkMode ? Colors.white38 : Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 22,
            child: Center(
              child: Text(
                _getWeatherEmoji(daily.condition),
                style: const TextStyle(fontSize: 16, height: 1),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${daily.maxTemp.toInt()}°',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black87),
                ),
                const SizedBox(width: 6),
                Text(
                  '${daily.minTemp.toInt()}°',
                  style: TextStyle(fontSize: 13, color: isDarkMode ? Colors.white38 : Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.water_drop_rounded, size: 11, color: Colors.blueAccent[100]),
                const SizedBox(width: 2),
                Text('${daily.precipitationProbability}%', style: const TextStyle(fontSize: 10, color: Colors.blueAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n, bool isDarkMode, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48),
                Text(l10n.weatherToday, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () => ref.invalidate(weatherProvider),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Icon(Icons.location_off_rounded, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 24),
            Text(l10n.locationPermissionTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(l10n.locationPermissionDesc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => openAppSettings(),
                    child: Text(l10n.openSettings),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => ref.invalidate(weatherProvider),
                    child: Text(l10n.retry),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Global Helper Functions
String _getWeekdayName(BuildContext context, int weekday) {
  final l10n = AppLocalizations.of(context)!;
  switch (weekday) {
    case DateTime.monday: return l10n.dayMonFull;
    case DateTime.tuesday: return l10n.dayTueFull;
    case DateTime.wednesday: return l10n.dayWedFull;
    case DateTime.thursday: return l10n.dayThuFull;
    case DateTime.friday: return l10n.dayFriFull;
    case DateTime.saturday: return l10n.daySatFull;
    case DateTime.sunday: return l10n.daySunFull;
    default: return '';
  }
}

String _getWeatherEmoji(String condition) {
  switch (condition) {
    case 'Sunny': return '☀️';
    case 'PartlyCloudy': return '⛅️';
    case 'Cloudy': return '☁️';
    case 'Foggy': return '🌫️';
    case 'Drizzle': return '🌦️';
    case 'Rainy': return '🌧️';
    case 'FreezingRain': return '🌧️';
    case 'Snowy': return '🌨️';
    case 'SnowGrains': return '🌨️';
    case 'RainShowers': return '🌧️';
    case 'SnowShowers': return '🌨️';
    case 'Thunderstorm': return '⛈️';
    default: return '☁️';
  }
}

Color _getWeatherColor(String condition) {
  switch (condition) {
    case 'Sunny': return Colors.orange;
    case 'PartlyCloudy': return Colors.blueGrey;
    case 'Cloudy': return Colors.grey;
    case 'Foggy': return Colors.blueGrey[200]!;
    case 'Drizzle': return Colors.lightBlue;
    case 'Rainy': return Colors.blue;
    case 'FreezingRain': return Colors.cyan;
    case 'Snowy': return Colors.lightBlue[100]!;
    case 'SnowGrains': return Colors.lightBlue[50]!;
    case 'RainShowers': return Colors.blueAccent;
    case 'SnowShowers': return Colors.cyan[100]!;
    case 'Thunderstorm': return Colors.deepPurple;
    default: return Colors.grey;
  }
}

String _getLocalizedCondition(BuildContext context, String condition) {
  final l10n = AppLocalizations.of(context)!;
  switch (condition) {
    case 'Sunny': return l10n.weatherConditionSunny;
    case 'PartlyCloudy': return l10n.weatherConditionPartlyCloudy;
    case 'Cloudy': return l10n.weatherConditionCloudy;
    case 'Foggy': return l10n.weatherConditionFoggy;
    case 'Drizzle': return l10n.weatherConditionDrizzle;
    case 'Rainy': return l10n.weatherConditionRainy;
    case 'FreezingRain': return l10n.weatherConditionFreezingRain;
    case 'Snowy': return l10n.weatherConditionSnowy;
    case 'SnowGrains': return l10n.weatherConditionSnowGrains;
    case 'RainShowers': return l10n.weatherConditionRainShowers;
    case 'SnowShowers': return l10n.weatherConditionSnowShowers;
    case 'Thunderstorm': return l10n.weatherConditionThunderstorm;
    default: return l10n.weatherConditionCloudy;
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
