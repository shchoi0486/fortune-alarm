import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/weather_service.dart';

final weatherServiceProvider = Provider((ref) => WeatherService());

final weatherProvider = FutureProvider<WeatherModel>((ref) async {
  final service = ref.watch(weatherServiceProvider);
  
  // Refresh weather data every 30 minutes
  final timer = Timer(const Duration(minutes: 30), () {
    ref.invalidateSelf();
  });
  ref.onDispose(() => timer.cancel());

  return service.getCurrentWeather();
});
