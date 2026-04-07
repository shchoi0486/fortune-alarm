import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_event.dart';

class HolidayService {
  static const String _holidayCachePrefix = 'cached_holidays_v2_';
  
  // 지원 국가 코드 매핑 (기기의 locale 정보를 바탕으로 ISO 3166-1 alpha-2 코드 반환)
  String _getCountryCode() {
    final locale = Platform.localeName; // 예: 'ko_KR', 'en_US', 'zh_Hans_CN', 'ca_ES_valencia'
    
    // 1. 구분자(_, -)로 분리하여 각 부분이 국가 코드(2글자)인지 확인
    final parts = locale.split(RegExp(r'[_-]'));
    
    // 뒤에서부터 확인하여 2글자로 된 국가 코드(region subtag)를 찾음
    for (int i = parts.length - 1; i >= 0; i--) {
      final part = parts[i].toUpperCase();
      if (part.length == 2 && _isValidCountryCode(part)) {
        return part;
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

  // 간단한 국가 코드 유효성 검사 (숫자나 특수문자가 포함되지 않았는지)
  bool _isValidCountryCode(String code) {
    return RegExp(r'^[A-Z]{2}$').hasMatch(code);
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
          String title = localName; 
          
          if (displayLocale == 'zh') {
            title = '$localName ($englishName)';
          } else if (displayLocale == 'en') {
            title = englishName;
          } else if (displayLocale != 'ko' && displayLocale != _getLanguageFromCountry(countryCode)) {
            // 사용자의 언어가 한국어가 아니고, 해당 국가의 언어도 아닐 경우 영어 병기
            title = '$localName ($englishName)';
          }

          // 특수 명칭 매핑 (한국 공휴일 기준 또는 공통 명칭)
          final nameLower = item['name'].toString().toLowerCase();
          if (nameLower.contains('alternative') || nameLower.contains('substitute')) {
            title = _getHolidayTerm('substitute', displayLocale);
          } else if (nameLower.contains('lunar new year')) {
            if (nameLower.endsWith("day")) {
              title = _getHolidayTerm('lunarNewYear', displayLocale);
            } else {
              title = _getHolidayTerm('lunarNewYearHoliday', displayLocale);
            }
          } else if (nameLower.contains('chuseok') || nameLower.contains('thanksgiving')) {
            // 한국의 추석 또는 일반적인 추수감사절 대응
            if (countryCode == 'KR') {
              if (nameLower.endsWith("day")) {
                title = _getHolidayTerm('chuseok', displayLocale);
              } else {
                title = _getHolidayTerm('chuseokHoliday', displayLocale);
              }
            } else if (nameLower.contains('thanksgiving')) {
              title = _getHolidayTerm('thanksgiving', displayLocale);
            }
          } else if (nameLower.contains('christmas')) {
            title = _getHolidayTerm('christmas', displayLocale);
          } else if (nameLower == "new year's day") {
            title = _getHolidayTerm('newYear', displayLocale);
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
          String altTitle = _getHolidayTerm('substitute', displayLocale);
          
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

  // 국가 코드로부터 해당 국가의 기본 언어 코드를 반환
  String _getLanguageFromCountry(String countryCode) {
    switch (countryCode.toUpperCase()) {
      case 'KR': return 'ko';
      case 'JP': return 'ja';
      case 'CN': return 'zh';
      case 'TW': return 'zh';
      case 'HK': return 'zh';
      case 'DE': return 'de';
      case 'FR': return 'fr';
      case 'ES': return 'es';
      case 'IT': return 'it';
      case 'RU': return 'ru';
      case 'IN': return 'hi';
      case 'US': return 'en';
      case 'GB': return 'en';
      case 'AU': return 'en';
      case 'CA': return 'en';
      default: return 'en';
    }
  }

  // 공통 공휴일 용어에 대한 로컬라이제이션 (API에서 제공하지 않거나 한국 특유의 경우)
  String _getHolidayTerm(String key, String locale) {
    switch (locale) {
      case 'ko':
        switch (key) {
          case 'substitute': return '대체공휴일';
          case 'lunarNewYear': return '설날';
          case 'lunarNewYearHoliday': return '설날 연휴';
          case 'chuseok': return '추석';
          case 'chuseokHoliday': return '추석 연휴';
          case 'thanksgiving': return '추수감사절';
          case 'christmas': return '크리스마스';
          case 'newYear': return '신정(새해)';
        }
        break;
      case 'ja':
        switch (key) {
          case 'substitute': return '振替休日';
          case 'lunarNewYear': return '旧正月';
          case 'lunarNewYearHoliday': return '旧正月連휴';
          case 'chuseok': return '秋夕';
          case 'chuseokHoliday': return '秋夕連休';
          case 'thanksgiving': return '感謝祭';
          case 'christmas': return 'クリスマス';
          case 'newYear': return '元日';
        }
        break;
      case 'zh':
        switch (key) {
          case 'substitute': return '替代放假日';
          case 'lunarNewYear': return '农历新年';
          case 'lunarNewYearHoliday': return '农历新年假期';
          case 'chuseok': return '中秋节';
          case 'chuseokHoliday': return '中秋节假期';
          case 'thanksgiving': return '感恩节';
          case 'christmas': return '圣诞节';
          case 'newYear': return '元旦';
        }
        break;
      case 'ru':
        switch (key) {
          case 'substitute': return 'Перенос выходного';
          case 'lunarNewYear': return 'Китайский Новый год';
          case 'lunarNewYearHoliday': return 'Праз드ник Весны';
          case 'chuseok': return 'Чусок';
          case 'chuseokHoliday': return 'Праз드ник урожая';
          case 'thanksgiving': return 'День благодарения';
          case 'christmas': return 'Рождество';
          case 'newYear': return 'Новый год';
        }
        break;
      case 'de':
        switch (key) {
          case 'substitute': return 'Ersatzfeiertag';
          case 'lunarNewYear': return 'Mondneujahr';
          case 'lunarNewYearHoliday': return 'Mondneujahr Feiertag';
          case 'chuseok': return 'Erntedankfest (Chuseok)';
          case 'chuseokHoliday': return 'Chuseok Feiertag';
          case 'thanksgiving': return 'Erntedankfest';
          case 'christmas': return 'Weihnachten';
          case 'newYear': return 'Neujahr';
        }
        break;
      case 'fr':
        switch (key) {
          case 'substitute': return 'Jour de remplacement';
          case 'lunarNewYear': return 'Nouvel An Lunaire';
          case 'lunarNewYearHoliday': return 'Congé du Nouvel An Lunaire';
          case 'chuseok': return 'Chuseok (Fête des récoltes)';
          case 'chuseokHoliday': return 'Congé de Chuseok';
          case 'thanksgiving': return 'Action de grâce';
          case 'christmas': return 'Noël';
          case 'newYear': return 'Jour de l\'An';
        }
        break;
      case 'es':
        switch (key) {
          case 'substitute': return 'Día sustituto';
          case 'lunarNewYear': return 'Año Nuevo Lunar';
          case 'lunarNewYearHoliday': return 'Vacaciones de Año Nuevo Lunar';
          case 'chuseok': return 'Chuseok (Festival de la Cosecha)';
          case 'chuseokHoliday': return 'Vacaciones de Chuseok';
          case 'thanksgiving': return 'Día de Acción de Gracias';
          case 'christmas': return 'Navidad';
          case 'newYear': return 'Año Nuevo';
        }
        break;
      case 'hi':
        switch (key) {
          case 'substitute': return 'स्थानापन्न अवकाश';
          case 'lunarNewYear': return 'चंद्र नव वर्ष';
          case 'lunarNewYearHoliday': return 'चंद्र नव वर्ष की छुट्टी';
          case 'chuseok': return 'चु석 (फसल उत्सव)';
          case 'chuseokHoliday': return 'चु석 की छुट्टी';
          case 'thanksgiving': return 'थैंक्सगिविंग';
          case 'christmas': return 'क्रिसमस';
          case 'newYear': return 'नया साल';
        }
        break;
      default:
        switch (key) {
          case 'substitute': return 'Substitute Holiday';
          case 'lunarNewYear': return 'Lunar New Year';
          case 'lunarNewYearHoliday': return 'Lunar New Year Holiday';
          case 'chuseok': return 'Chuseok';
          case 'chuseokHoliday': return 'Chuseok Holiday';
          case 'thanksgiving': return 'Thanksgiving';
          case 'christmas': return 'Christmas';
          case 'newYear': return 'New Year\'s Day';
        }
    }
    return '';
  }
}
