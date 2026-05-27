import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
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
  static const Map<String, String> _weatherHeaders = {
    'User-Agent': 'SnapAlarm/1.0 (support@seriessnap.com)',
    'Accept': 'application/json',
  };

  Future<WeatherModel> getCurrentWeather({bool requestPermission = true}) async {
    try {
      // 1. 언어 설정 가져오기
      String languageCode = Platform.localeName.split('_')[0];
      try {
        final settingsBox = await Hive.openBox('settings');
        if (settingsBox.containsKey('language')) {
          languageCode = settingsBox.get('language');
        }
      } catch (_) {}

      // 2. 위치 가져오기 (LastKnown -> Current 순서로 시도하여 속도 개선)
      final position = await determinePosition(requestPermission: requestPermission);
      final lat = position.latitude;
      final lon = position.longitude;

      // 3. API 호출
      final weatherFuture = http.get(
        Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&timezone=auto',
        ),
        headers: _weatherHeaders,
      );
      
      final airQualityFuture = http.get(Uri.parse(
          'https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$lat&longitude=$lon&current=pm10,pm2_5'));

      // geocoding 언어 설정 적용 (setLocaleIdentifier 사용)
      final geocodingFuture = () async {
        try {
          await setLocaleIdentifier(languageCode);
          return await placemarkFromCoordinates(lat, lon);
        } catch (e) {
          debugPrint('Geocoding error: $e');
          return <Placemark>[];
        }
      }();

      // 4. 결과 대기 (타임아웃 10초)
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

      WeatherModel model;
      if (weatherResponse.statusCode == 200) {
        final weatherData = json.decode(weatherResponse.body) as Map<String, dynamic>;
        model = _parseOpenMeteoWeather(weatherData, locationName, pm10, pm25);
      } else {
        debugPrint('Open-Meteo forecast failed (${weatherResponse.statusCode}). Falling back to MET Norway.');
        final fallbackResponse = await http.get(
          Uri.parse('https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=$lat&lon=$lon'),
          headers: _weatherHeaders,
        ).timeout(const Duration(seconds: 10));

        if (fallbackResponse.statusCode != 200) {
          throw Exception('Failed to load weather data: ${weatherResponse.statusCode}');
        }

        final fallbackData = json.decode(fallbackResponse.body) as Map<String, dynamic>;
        model = _parseMetNoWeather(fallbackData, locationName, pm10, pm25);
      }

      await _cacheWeatherData(model);
      return model;
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

  WeatherModel _parseOpenMeteoWeather(
    Map<String, dynamic> weatherData,
    String locationName,
    int pm10,
    int pm25,
  ) {
    final current = weatherData['current'];
    final temp = current['temperature_2m'].toDouble();
    final code = current['weather_code'];

    final hourlyList = <HourlyForecast>[];
    try {
      final hourly = weatherData['hourly'];
      final times = hourly['time'] as List;
      final temps = hourly['temperature_2m'] as List;
      final codes = hourly['weather_code'] as List;

      final now = DateTime.now();
      for (int i = 0; i < times.length; i++) {
        final t = DateTime.parse(times[i]);
        if ((t.isAfter(now) || t.isAtSameMomentAs(now)) && hourlyList.length < 24) {
          hourlyList.add(HourlyForecast(
            time: t,
            temperature: (temps[i] as num).toDouble(),
            condition: _mapWeatherCode(codes[i]),
          ));
        }
      }
    } catch (e) {
      debugPrint('Error parsing hourly forecast: $e');
    }

    final dailyList = <DailyForecast>[];
    try {
      final daily = weatherData['daily'];
      final dates = daily['time'] as List;
      final codes = daily['weather_code'] as List;
      final maxTemps = daily['temperature_2m_max'] as List;
      final minTemps = daily['temperature_2m_min'] as List;
      final probs = daily['precipitation_probability_max'] as List;

      for (int i = 0; i < dates.length && dailyList.length < 7; i++) {
        dailyList.add(DailyForecast(
          date: DateTime.parse(dates[i]),
          maxTemp: (maxTemps[i] as num).toDouble(),
          minTemp: (minTemps[i] as num).toDouble(),
          condition: _mapWeatherCode(codes[i]),
          precipitationProbability: (probs[i] as num?)?.toInt() ?? 0,
        ));
      }
    } catch (e) {
      debugPrint('Error parsing daily forecast: $e');
    }

    return WeatherModel(
      temperature: temp,
      condition: _mapWeatherCode(code),
      location: locationName,
      fineDust: pm10,
      ultraFineDust: pm25,
      hourlyForecasts: hourlyList,
      dailyForecasts: dailyList,
    );
  }

  WeatherModel _parseMetNoWeather(
    Map<String, dynamic> weatherData,
    String locationName,
    int pm10,
    int pm25,
  ) {
    final series = (weatherData['properties']?['timeseries'] as List?) ?? [];
    if (series.isEmpty) {
      throw Exception('Failed to load weather data: fallback source returned no timeseries');
    }

    final now = DateTime.now();
    final hourlyList = <HourlyForecast>[];
    final Map<String, List<Map<String, dynamic>>> groupedByDate = {};

    Map<String, dynamic>? currentEntry;
    for (final item in series.cast<Map<String, dynamic>>()) {
      final time = DateTime.parse(item['time'] as String);
      if (currentEntry == null && (time.isAfter(now) || time.isAtSameMomentAs(now))) {
        currentEntry = item;
      }
      if ((time.isAfter(now) || time.isAtSameMomentAs(now)) && hourlyList.length < 24) {
        final details = item['data']?['instant']?['details'] as Map<String, dynamic>? ?? {};
        hourlyList.add(HourlyForecast(
          time: time,
          temperature: (details['air_temperature'] as num?)?.toDouble() ?? 0,
          condition: _mapMetNoSymbol(item),
        ));
      }

      final dateKey = '${time.year}-${time.month}-${time.day}';
      groupedByDate.putIfAbsent(dateKey, () => []).add(item);
    }

    currentEntry ??= series.first as Map<String, dynamic>;
    final currentDetails = currentEntry['data']?['instant']?['details'] as Map<String, dynamic>? ?? {};

    final dailyList = <DailyForecast>[];
    for (final entry in groupedByDate.entries.take(7)) {
      final values = entry.value;
      double maxTemp = -1000;
      double minTemp = 1000;
      String condition = 'Cloudy';
      int precipitationProbability = 0;

      for (final item in values) {
        final details = item['data']?['instant']?['details'] as Map<String, dynamic>? ?? {};
        final temp = (details['air_temperature'] as num?)?.toDouble() ?? 0;
        if (temp > maxTemp) maxTemp = temp;
        if (temp < minTemp) minTemp = temp;

        final time = DateTime.parse(item['time'] as String);
        if (time.hour >= 12 && time.hour <= 15) {
          condition = _mapMetNoSymbol(item);
          final nextHour = item['data']?['next_1_hours']?['details'] as Map<String, dynamic>?;
          precipitationProbability =
              (nextHour?['probability_of_precipitation'] as num?)?.toInt() ?? precipitationProbability;
        }
      }

      dailyList.add(DailyForecast(
        date: DateTime.parse('${entry.key.split('-')[0]}-${entry.key.split('-')[1].padLeft(2, '0')}-${entry.key.split('-')[2].padLeft(2, '0')}'),
        maxTemp: maxTemp == -1000 ? 0 : maxTemp,
        minTemp: minTemp == 1000 ? 0 : minTemp,
        condition: condition,
        precipitationProbability: precipitationProbability,
      ));
    }

    return WeatherModel(
      temperature: (currentDetails['air_temperature'] as num?)?.toDouble() ?? 0,
      condition: _mapMetNoSymbol(currentEntry),
      location: locationName,
      fineDust: pm10,
      ultraFineDust: pm25,
      hourlyForecasts: hourlyList,
      dailyForecasts: dailyList,
    );
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

  String _mapMetNoSymbol(Map<String, dynamic> item) {
    final data = item['data'] as Map<String, dynamic>? ?? {};
    final symbol =
        data['next_1_hours']?['summary']?['symbol_code'] ??
        data['next_6_hours']?['summary']?['symbol_code'] ??
        data['next_12_hours']?['summary']?['symbol_code'] ??
        'cloudy';

    final value = symbol.toString();
    if (value.contains('clearsky')) return 'Sunny';
    if (value.contains('fair') || value.contains('partlycloudy')) return 'PartlyCloudy';
    if (value.contains('cloudy')) return 'Cloudy';
    if (value.contains('fog')) return 'Foggy';
    if (value.contains('sleet') || value.contains('rain') || value.contains('showers')) return 'Rainy';
    if (value.contains('snow')) return 'Snowy';
    if (value.contains('thunder')) return 'Thunderstorm';
    return 'Cloudy';
  }
  
  Future<Position> determinePosition({bool requestPermission = true}) async {
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
      if (!requestPermission) {
        return Future.error('위치 권한이 거부되었습니다.');
      }
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
