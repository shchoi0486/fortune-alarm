import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

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
  
  String get fineDustStatus {
    if (fineDust <= 30) return '좋음';
    if (fineDust <= 80) return '보통';
    if (fineDust <= 150) return '나쁨';
    return '매우나쁨';
  }

  String get ultraFineDustStatus {
    if (ultraFineDust <= 15) return '좋음';
    if (ultraFineDust <= 35) return '보통';
    if (ultraFineDust <= 75) return '나쁨';
    return '매우나쁨';
  }
}

class WeatherService {
  Future<WeatherModel> getCurrentWeather() async {
    try {
      final position = await determinePosition();
      final lat = position.latitude;
      final lon = position.longitude;

      // 1. Fetch Weather Data (Open-Meteo)
      final weatherResponse = await http.get(Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code'));

      // 2. Fetch Air Quality Data (Open-Meteo)
      final airQualityResponse = await http.get(Uri.parse(
          'https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$lat&longitude=$lon&current=pm10,pm2_5'));

      // 3. Get Location Name (Reverse Geocoding)
      String locationName = '알 수 없는 위치';
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          locationName = '${p.administrativeArea ?? ''} ${p.locality ?? p.subLocality ?? ''}'.trim();
          if (locationName.isEmpty) locationName = p.name ?? '알 수 없는 위치';
        }
      } catch (e) {
        print('Geocoding error: $e');
      }

      if (weatherResponse.statusCode == 200 && airQualityResponse.statusCode == 200) {
        final weatherData = json.decode(weatherResponse.body);
        final airData = json.decode(airQualityResponse.body);

        final temp = weatherData['current']['temperature_2m'].toDouble();
        final code = weatherData['current']['weather_code'];
        final pm10 = airData['current']['pm10'].toInt();
        final pm25 = airData['current']['pm2_5'].toInt();

        return WeatherModel(
          temperature: temp,
          condition: _mapWeatherCode(code),
          location: locationName,
          fineDust: pm10,
          ultraFineDust: pm25,
        );
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Weather service error: $e');
      // Fallback to mock data if anything fails
      return WeatherModel(
        temperature: 10.0,
        condition: 'Cloudy',
        location: '전북특별자치도 (오류)',
        fineDust: 28,
        ultraFineDust: 14,
      );
    }
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
      desiredAccuracy: LocationAccuracy.low,
      timeLimit: const Duration(seconds: 5),
    );
  }
}
