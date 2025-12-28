import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherModel {
  final double temperature;
  final String condition; // e.g., 'Sunny', 'Cloudy', 'Rainy'
  final String location;
  final int fineDust; // PM10
  final int ultraFineDust; // PM2.5

  WeatherModel({
    required this.temperature,
    required this.condition,
    required this.location,
    required this.fineDust,
    required this.ultraFineDust,
  });

  Map<String, dynamic> toJson() => {
    'temperature': temperature,
    'condition': condition,
    'location': location,
    'fineDust': fineDust,
    'ultraFineDust': ultraFineDust,
  };

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    temperature: (json['temperature'] as num).toDouble(),
    condition: json['condition'] as String,
    location: json['location'] as String,
    fineDust: (json['fineDust'] as num).toInt(),
    ultraFineDust: (json['ultraFineDust'] as num).toInt(),
  );
  
  String get fineDustStatusKey {
    if (fineDust <= 30) return 'airQualityGood';
    if (fineDust <= 80) return 'airQualityNormal';
    if (fineDust <= 150) return 'airQualityBad';
    return 'airQualityVeryBad';
  }

  String get ultraFineDustStatusKey {
    if (ultraFineDust <= 15) return 'airQualityGood';
    if (ultraFineDust <= 35) return 'airQualityNormal';
    if (ultraFineDust <= 75) return 'airQualityBad';
    return 'airQualityVeryBad';
  }
}

class WeatherService {
  static const String _cacheKey = 'cached_weather_data';

  Future<WeatherModel> getCurrentWeather() async {
    try {
      final position = await determinePosition();
      final lat = position.latitude;
      final lon = position.longitude;

      final results = await Future.wait([
        http.get(Uri.parse(
            'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code')),
        http.get(Uri.parse(
            'https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$lat&longitude=$lon&current=pm10,pm2_5')),
        placemarkFromCoordinates(lat, lon).catchError((e) {
          print('Geocoding error: $e');
          return <Placemark>[];
        }),
      ]).timeout(const Duration(seconds: 10));

      final weatherResponse = results[0] as http.Response;
      final airQualityResponse = results[1] as http.Response;
      final placemarks = results[2] as List<Placemark>;

      String locationName = 'locationUnknown';
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        locationName = '${p.administrativeArea ?? ''} ${p.locality ?? p.subLocality ?? ''}'.trim();
        if (locationName.isEmpty) locationName = p.name ?? 'locationUnknown';
      }

      if (weatherResponse.statusCode == 200 && airQualityResponse.statusCode == 200) {
        final weatherData = json.decode(weatherResponse.body);
        final airData = json.decode(airQualityResponse.body);

        final temp = weatherData['current']['temperature_2m'].toDouble();
        final code = weatherData['current']['weather_code'];
        final pm10 = airData['current']['pm10'].toInt();
        final pm25 = airData['current']['pm2_5'].toInt();

        final model = WeatherModel(
          temperature: temp,
          condition: _mapWeatherCode(code),
          location: locationName,
          fineDust: pm10,
          ultraFineDust: pm25,
        );

        // Cache the successful result
        await _cacheWeatherData(model);

        return model;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Weather service error: $e');
      
      // Try to load from cache
      final cached = await _loadCachedWeatherData();
      if (cached != null) return cached;

      // Fallback to mock data if anything fails and no cache
      return WeatherModel(
        temperature: 10.0,
        condition: 'Cloudy',
        location: 'locationError',
        fineDust: 28,
        ultraFineDust: 14,
      );
    }
  }

  Future<void> _cacheWeatherData(WeatherModel weather) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_cacheKey, json.encode(weather.toJson()));
    } catch (e) {
      print('Error caching weather data: $e');
    }
  }

  Future<WeatherModel?> _loadCachedWeatherData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonStr = prefs.getString(_cacheKey);
      if (jsonStr != null) {
        return WeatherModel.fromJson(json.decode(jsonStr));
      }
    } catch (e) {
      print('Error loading cached weather data: $e');
    }
    return null;
  }


  String _mapWeatherCode(int code) {
    if (code == 0) return 'Sunny';
    if (code <= 3) return 'Cloudy';
    if (code <= 48) return 'Foggy';
    if (code <= 67) return 'Rainy';
    if (code <= 77) return 'Snowy';
    if (code <= 82) return 'Rainy';
    if (code <= 86) return 'Snowy';
    if (code <= 99) return 'Thunderstorm';
    return 'Cloudy';
  }
  
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('위치 서비스가 꺼져 있습니다.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('위치 권한이 거부되었습니다.');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error('위치 권한이 영구적으로 거부되었습니다.');
    } 

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 5),
      ),
    );
  }
}
