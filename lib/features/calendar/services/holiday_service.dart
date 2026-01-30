import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_event.dart';

class HolidayService {
  static const String _holidayCachePrefix = 'cached_holidays_v2_';
  
  // 지원 국가 코드 매핑 (기기의 locale 정보를 바탕으로 ISO 3166-1 alpha-2 코드 반환)
  String _getCountryCode() {
    final locale = Platform.localeName; // 예: 'ko_KR', 'en_US', 'zh_Hans_CN'
    
    // 1. 구분자(_, -)로 분리하여 마지막 부분이 국가 코드인지 확인
    final parts = locale.split(RegExp(r'[_-]'));
    if (parts.length > 1) {
      final potentialCountry = parts.last.toUpperCase();
      if (potentialCountry.length == 2) {
        return potentialCountry;
      }
    }
    
    // 2. 국가 코드를 명시적으로 알 수 없는 경우 언어 코드를 기준으로 기본 국가 매핑
    final langCode = parts.first.toLowerCase();
    switch (langCode) {
      case 'ko': return 'KR';
      case 'ja': return 'JP';
      case 'zh': return 'CN';
      case 'ru': return 'RU';
      case 'hi': return 'IN';
      case 'de': return 'DE';
      case 'fr': return 'FR';
      case 'es': return 'ES';
      case 'it': return 'IT';
      case 'en': return 'US';
      default: return 'US';
    }
  }

  Future<List<CalendarEvent>> getHolidays(int year, {String? appLocale}) async {
    final countryCode = _getCountryCode();
    // 표시 언어 (기본값은 한국어)
    final displayLocale = appLocale ?? 'ko';
    final cacheKey = '$_holidayCachePrefix${countryCode}_${displayLocale}_$year';
    
    // 1. 캐시 확인
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(cacheKey);
    if (cachedData != null) {
      final List<dynamic> jsonList = jsonDecode(cachedData);
      return jsonList.map((json) => CalendarEvent.fromJson(json)).toList();
    }

    // 2. API 호출 (Nager.Date API - 무료 및 오픈 소스)
    try {
      final response = await http.get(
        Uri.parse('https://date.nager.at/api/v3/PublicHolidays/$year/$countryCode')
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final holidays = data.map((item) {
          final englishName = item['name'] ?? '';
          final localName = item['localName'] ?? englishName;
          
          // 표시 언어 및 국가에 따라 제목 결정
          String title = localName; // 기본적으로 현지 언어 사용 (프랑스는 프랑스어, 일본은 일본어 등)
          
          if (displayLocale == 'zh') {
            title = '$localName ($englishName)';
          } else if (displayLocale == 'en') {
            title = englishName;
          }

          // 한국어 표시일 때만 특수 명칭 매핑 (한국 기준)
          if (displayLocale == 'ko' && countryCode == 'KR') {
            if (item['name'].toString().contains('Alternative')) {
              title = '대체공휴일';
            } else if (item['name'].toString().contains('Lunar New Year')) {
              if (item['name'].toString().endsWith("Day")) {
                title = '설날';
              } else {
                title = '설날 연휴';
              }
            } else if (item['name'].toString().contains('Chuseok')) {
              if (item['name'].toString().endsWith("Day")) {
                title = '추석';
              } else {
                title = '추석 연휴';
              }
            }
          }

          return CalendarEvent(
            id: 'holiday_${item['date']}_${item['name']}',
            title: title,
            content: localName,
            date: DateTime.parse(item['date']),
            type: CalendarEventType.holiday,
            titleColor: 0xFFFF5252,
          );
        }).toList();

        // 한국 공휴일의 경우 대체공휴일 자동 계산 (표시 언어에 맞춰 제목 설정)
        if (countryCode == 'KR') {
          final List<CalendarEvent> extraHolidays = [];
          String altTitle = 'Substitute Holiday';
          if (displayLocale == 'ko') {
            altTitle = '대체공휴일';
          } else if (displayLocale == 'zh') {
            altTitle = '替代放假日 (Substitute Holiday)';
          }
          
          for (var holiday in holidays) {
            final name = holiday.content; // API 원본 localName 기준 체크
            final date = holiday.date;
            
            bool needsAlternative = false;
            if (name == '3·1절' || name == '광복절' || name == '개천절' || name == '한글날' || 
                name == '어린이날' || name == '부처님 오신 날' || name == '크리스마스' ||
                name == '신정' || name == '새해') {
              if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
                needsAlternative = true;
              }
            } else if (name == '설날' || name == '추석') {
              if (date.weekday == DateTime.sunday) {
                needsAlternative = true;
              }
            }

            if (needsAlternative) {
              DateTime altDate = date;
              bool isFound = false;
              
              while (!isFound) {
                altDate = altDate.add(const Duration(days: 1));
                if (altDate.weekday == DateTime.saturday || altDate.weekday == DateTime.sunday) continue;
                
                bool isExistingHoliday = holidays.any((e) {
                  final eDate = e.date;
                  return eDate.year == altDate.year && eDate.month == altDate.month && eDate.day == altDate.day;
                });
                
                if (!isExistingHoliday) {
                  isFound = true;
                }
              }

              bool alreadyAdded = extraHolidays.any((e) => 
                e.date.year == altDate.year && e.date.month == altDate.month && e.date.day == altDate.day);
              
              if (!alreadyAdded) {
                extraHolidays.add(CalendarEvent(
                  id: 'holiday_alt_${altDate.year}${altDate.month}${altDate.day}',
                  title: altTitle,
                  content: altTitle,
                  date: altDate,
                  type: CalendarEventType.holiday,
                  titleColor: 0xFFFF5252,
                ));
              }
            }
          }
          holidays.addAll(extraHolidays);
          holidays.sort((a, b) => a.date.compareTo(b.date));
        }

        // 3. 캐시 저장
        await prefs.setString(cacheKey, jsonEncode(holidays.map((e) => e.toJson()).toList()));
        return holidays;
      }
    } catch (e) {
      print('Holiday API error: $e');
    }

    return [];
  }

  // 캐시 강제 삭제 (언어 설정 변경 등 갱신 필요 시 호출)
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      if (key.startsWith(_holidayCachePrefix)) {
        await prefs.remove(key);
      }
    }
  }
}
