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
  
  // 추가된 필드: 시간대별 예보 및 주간 예보
  final List<HourlyForecast> hourlyForecasts;
  final List<DailyForecast> dailyForecasts;

  WeatherModel({
    required this.temperature,
    required this.condition,
    required this.location,
    required this.fineDust,
    required this.ultraFineDust,
    this.hourlyForecasts = const [],
    this.dailyForecasts = const [],
  });

  Map<String, dynamic> toJson() => {
    'temperature': temperature,
    'condition': condition,
    'location': location,
    'fineDust': fineDust,
    'ultraFineDust': ultraFineDust,
    'hourlyForecasts': hourlyForecasts.map((e) => e.toJson()).toList(),
    'dailyForecasts': dailyForecasts.map((e) => e.toJson()).toList(),
  };

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    temperature: (json['temperature'] as num).toDouble(),
    condition: json['condition'] as String,
    location: json['location'] as String,
    fineDust: (json['fineDust'] as num).toInt(),
    ultraFineDust: (json['ultraFineDust'] as num).toInt(),
    hourlyForecasts: (json['hourlyForecasts'] as List?)?.map((e) => HourlyForecast.fromJson(e)).toList() ?? [],
    dailyForecasts: (json['dailyForecasts'] as List?)?.map((e) => DailyForecast.fromJson(e)).toList() ?? [],
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

class HourlyForecast {
  final DateTime time;
  final double temperature;
  final String condition;

  HourlyForecast({required this.time, required this.temperature, required this.condition});

  Map<String, dynamic> toJson() => {
    'time': time.toIso8601String(),
    'temperature': temperature,
    'condition': condition,
  };

  factory HourlyForecast.fromJson(Map<String, dynamic> json) => HourlyForecast(
    time: DateTime.parse(json['time']),
    temperature: (json['temperature'] as num).toDouble(),
    condition: json['condition'] as String,
  );
}

class DailyForecast {
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final int precipitationProbability; // 강수확률

  DailyForecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.precipitationProbability,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'maxTemp': maxTemp,
    'minTemp': minTemp,
    'condition': condition,
    'precipitationProbability': precipitationProbability,
  };

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
    date: DateTime.parse(json['date']),
    maxTemp: (json['maxTemp'] as num).toDouble(),
    minTemp: (json['minTemp'] as num).toDouble(),
    condition: json['condition'] as String,
    precipitationProbability: (json['precipitationProbability'] as num).toInt(),
  );
}

class WeatherService {
  static const String _cacheKey = 'cached_weather_data';

  Future<WeatherModel> getCurrentWeather() async {
    try {
      // 1. 위치 가져오기 (LastKnown -> Current 순서로 시도하여 속도 개선)
      final position = await determinePosition();
      final lat = position.latitude;
      final lon = position.longitude;

      // 2. API 호출 (병렬 처리하되, 실패 시 안전값 사용을 위해 개별 await 고려했으나 속도를 위해 Future.wait 유지하고 catchError 강화)
      // hourly=temperature_2m,weather_code : 시간대별 예보
      // daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max : 주간 예보
      final weatherFuture = http.get(Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&timezone=auto'));
      
      final airQualityFuture = http.get(Uri.parse(
          'https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$lat&longitude=$lon&current=pm10,pm2_5'));

      // 다국어 지원을 위해 로케일 정보 전달 (geocoding 패키지 버전에 따라 지원 여부 상이, 제거하고 시스템 로케일 사용)
      final geocodingFuture = placemarkFromCoordinates(lat, lon).catchError((e) {
        print('Geocoding error: $e');
        return <Placemark>[];
      });

      // 3. 결과 대기 (타임아웃 10초)
      final results = await Future.wait([
        weatherFuture,
        airQualityFuture,
        geocodingFuture,
      ]).timeout(const Duration(seconds: 10));

      final weatherResponse = results[0] as http.Response;
      final airQualityResponse = results[1] as http.Response;
      final placemarks = results[2] as List<Placemark>;

      // 4. 주소 파싱
      String locationName = 'locationUnknown';
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        // 행정구역(administrativeArea)과 시/군/구(locality) 등을 조합
        // 한국어 예: 서울특별시 강남구, 경기도 수원시 등
        // 영어 예: California San Francisco
        List<String> parts = [];
        if (p.administrativeArea != null && p.administrativeArea!.isNotEmpty) parts.add(p.administrativeArea!);
        if (p.locality != null && p.locality!.isNotEmpty) parts.add(p.locality!);
        if (p.subLocality != null && p.subLocality!.isNotEmpty && parts.length < 2) parts.add(p.subLocality!);
        
        locationName = parts.join(' ').trim();
        if (locationName.isEmpty) locationName = p.name ?? 'locationUnknown';
      }

      // 5. 날씨 데이터 파싱
      if (weatherResponse.statusCode == 200) {
        final weatherData = json.decode(weatherResponse.body);
        final current = weatherData['current'];
        final temp = current['temperature_2m'].toDouble();
        final code = current['weather_code'];
        
        // 시간대별 예보 파싱 (현재 시간 이후 24시간)
        List<HourlyForecast> hourlyList = [];
        try {
          final hourly = weatherData['hourly'];
          final times = hourly['time'] as List;
          final temps = hourly['temperature_2m'] as List;
          final codes = hourly['weather_code'] as List;
          
          final now = DateTime.now();
          for (int i = 0; i < times.length; i++) {
            final t = DateTime.parse(times[i]);
            if (t.isAfter(now) || t.isAtSameMomentAs(now)) {
              if (hourlyList.length < 24) { // 24시간만 가져옴
                hourlyList.add(HourlyForecast(
                  time: t,
                  temperature: (temps[i] as num).toDouble(),
                  condition: _mapWeatherCode(codes[i]),
                ));
              }
            }
          }
        } catch (e) {
          print('Error parsing hourly forecast: $e');
        }

        // 주간 예보 파싱 (오늘 포함 7일)
        List<DailyForecast> dailyList = [];
        try {
          final daily = weatherData['daily'];
          final dates = daily['time'] as List;
          final codes = daily['weather_code'] as List;
          final maxTemps = daily['temperature_2m_max'] as List;
          final minTemps = daily['temperature_2m_min'] as List;
          final probs = daily['precipitation_probability_max'] as List;

          for (int i = 0; i < dates.length; i++) {
            if (dailyList.length < 7) {
              dailyList.add(DailyForecast(
                date: DateTime.parse(dates[i]),
                maxTemp: (maxTemps[i] as num).toDouble(),
                minTemp: (minTemps[i] as num).toDouble(),
                condition: _mapWeatherCode(codes[i]),
                precipitationProbability: (probs[i] as num).toInt(),
              ));
            }
          }
        } catch (e) {
          print('Error parsing daily forecast: $e');
        }

        // 대기질은 실패해도 날씨는 보여줘야 함
        int pm10 = 0;
        int pm25 = 0;
        if (airQualityResponse.statusCode == 200) {
          try {
            final airData = json.decode(airQualityResponse.body);
            pm10 = airData['current']['pm10']?.toInt() ?? 0;
            pm25 = airData['current']['pm2_5']?.toInt() ?? 0;
          } catch (_) {}
        }

        final model = WeatherModel(
          temperature: temp,
          condition: _mapWeatherCode(code),
          location: locationName,
          fineDust: pm10,
          ultraFineDust: pm25,
          hourlyForecasts: hourlyList,
          dailyForecasts: dailyList,
        );

        // 성공 시 캐시 저장
        await _cacheWeatherData(model);

        return model;
      } else {
        throw Exception('Failed to load weather data: ${weatherResponse.statusCode}');
      }
    } catch (e) {
      print('Weather service error: $e');
      
      // 에러 발생 시 캐시 데이터 로드 시도
      final cached = await _loadCachedWeatherData();
      if (cached != null) return cached;
      
      // 캐시도 없으면 에러 전파 (UI에서 처리)
      throw Exception(e.toString());
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
    if (code <= 2) return 'PartlyCloudy';
    if (code == 3) return 'Cloudy';
    if (code <= 48) return 'Foggy';
    if (code <= 55) return 'Drizzle';
    if (code <= 65) return 'Rainy';
    if (code <= 67) return 'FreezingRain';
    if (code <= 75) return 'Snowy';
    if (code == 77) return 'SnowGrains';
    if (code <= 82) return 'RainShowers';
    if (code <= 86) return 'SnowShowers';
    if (code <= 99) return 'Thunderstorm';
    return 'Cloudy';
  }
  
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 꺼져있어도 마지막 위치 시도해볼 수 있음 (안드로이드 등)
      // 하지만 보통 서비스가 꺼지면 못 가져옴. 바로 에러 던짐.
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

    // 1. 마지막으로 알려진 위치 먼저 시도 (속도 최적화)
    try {
      final lastKnown = await Geolocator.getLastKnownPosition();
      if (lastKnown != null) {
        // 마지막 위치가 너무 오래된 것인지 체크할 수도 있지만, 날씨는 대략적인 위치면 되므로 사용
        return lastKnown;
      }
    } catch (_) {}

    // 2. 현재 위치 가져오기 (타임아웃 10초로 완화)
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low, // 날씨용이므로 low도 충분 (약 10km 오차 허용, 배터리 절약 및 속도)
        timeLimit: Duration(seconds: 10),
      ),
    );
  }
}
