import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_event.dart';

class HolidayService {
  static const String _holidayCachePrefix = 'cached_holidays_v2_';
  
  // 지원 국가 코드 매핑
  String _getCountryCode() {
    final locale = Platform.localeName;
    if (locale.contains('KR')) return 'KR';
    if (locale.contains('JP')) return 'JP';
    if (locale.contains('CN')) return 'CN';
    if (locale.contains('RU')) return 'RU';
    if (locale.contains('IN')) return 'IN';
    return 'US'; // 기본값
  }

  Future<List<CalendarEvent>> getHolidays(int year) async {
    final countryCode = _getCountryCode();
    final cacheKey = '$_holidayCachePrefix${countryCode}_$year';
    
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
          final localName = item['localName'] ?? item['name'];
          // 명칭 수정 로직 (한국 기준)
          String title = localName;
          if (countryCode == 'KR') {
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

        // 한국의 경우 대체공휴일 자동 계산 (API 누락 대비)
        if (countryCode == 'KR') {
          final List<CalendarEvent> extraHolidays = [];
          for (var holiday in holidays) {
            final name = holiday.content;
            final date = holiday.date;
            
            bool needsAlternative = false;
            // 대체공휴일 적용 대상 확대 (2023년 기준: 신정, 현충일 제외 모든 공휴일)
            if (name == '3·1절' || name == '광복절' || name == '개천절' || name == '한글날' || 
                name == '어린이날' || name == '부처님 오신 날' || name == '크리스마스') {
              if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
                needsAlternative = true;
              }
            } else if (name == '설날' || name == '추석') {
              // 설날/추석 연휴 중 일요일이 포함된 경우
              if (date.weekday == DateTime.sunday) {
                needsAlternative = true;
              }
            }

            if (needsAlternative) {
              DateTime altDate = date;
              bool isFound = false;
              
              // 다음 가용 영업일(공휴일이 아닌 날) 찾기
              while (!isFound) {
                altDate = altDate.add(const Duration(days: 1));
                // 토요일/일요일은 건너뜀 (단, 설날/추석은 이미 연휴이므로 체크 필요)
                if (altDate.weekday == DateTime.saturday || altDate.weekday == DateTime.sunday) continue;
                
                // 이미 공휴일 목록에 있는지 확인
                final dateStr = "${altDate.year}-${altDate.month.toString().padLeft(2, '0')}-${altDate.day.toString().padLeft(2, '0')}";
                bool isExistingHoliday = holidays.any((e) {
                  final eDate = e.date;
                  return eDate.year == altDate.year && eDate.month == altDate.month && eDate.day == altDate.day;
                });
                
                if (!isExistingHoliday) {
                  isFound = true;
                }
              }

              // 이미 대체공휴일이 목록에 있는지 최종 확인
              bool alreadyAdded = extraHolidays.any((e) => 
                e.date.year == altDate.year && e.date.month == altDate.month && e.date.day == altDate.day);
              
              if (!alreadyAdded) {
                extraHolidays.add(CalendarEvent(
                  id: 'holiday_alt_${altDate.year}${altDate.month}${altDate.day}',
                  title: '대체공휴일',
                  content: '대체공휴일',
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
