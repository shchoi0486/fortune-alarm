import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_event.dart';

class CalendarService {
  static const String _storageKey = 'calendar_events';

  /// 저장/삭제는 항상 "전체 읽기 → 수정 → 전체 쓰기" 이므로 직렬화하지 않으면
  /// 겹친 호출 중 하나가 유실된다. (루틴 체크박스 연타, 편집 저장과 토글 동시 발생 등)
  Future<void> _writeQueue = Future<void>.value();

  Future<List<CalendarEvent>> loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_storageKey);
    if (data == null) return [];

    // 레코드 하나가 손상되어도 나머지는 살아 있어야 한다.
    // (예외가 밖으로 전파되면 _events 가 아예 대입되지 않아
    //  캘린더가 일정도 공휴일도 영구히 비게 되고 복구 방법이 없다)
    try {
      final dynamic decoded = jsonDecode(data);
      if (decoded is! List) {
        debugPrint('[CalendarService] Stored value is not a list. Resetting.');
        return [];
      }

      final List<CalendarEvent> events = [];
      for (final dynamic entry in decoded) {
        try {
          events.add(CalendarEvent.fromJson(entry));
        } catch (e) {
          debugPrint('[CalendarService] Skipping malformed event: $e');
        }
      }
      return events;
    } catch (e) {
      debugPrint('[CalendarService] Failed to decode events: $e');
      return [];
    }
  }

  Future<void> saveEvent(CalendarEvent event) => _enqueue(() async {
        final events = await loadEvents();
        final index = events.indexWhere((e) => e.id == event.id);

        if (index >= 0) {
          events[index] = event;
        } else {
          events.add(event);
        }

        await _saveToPrefs(events);
      });

  Future<void> deleteEvent(String id) => _enqueue(() async {
        final events = await loadEvents();
        events.removeWhere((e) => e.id == id);
        await _saveToPrefs(events);
      });

  /// 읽기-수정-쓰기를 직렬화한다.
  Future<void> _enqueue(Future<void> Function() action) {
    final result = _writeQueue.then((_) => action());
    // 한 번 실패해도 다음 작업이 계속 진행되도록 에러를 흡수한다.
    _writeQueue = result.then<void>((_) {}, onError: (Object _, StackTrace __) {});
    return result;
  }

  Future<void> _saveToPrefs(List<CalendarEvent> events) async {
    final prefs = await SharedPreferences.getInstance();
    final String data = jsonEncode(events.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, data);
  }

  Future<List<CalendarEvent>> getEventsForDay(DateTime day) async {
    final events = await loadEvents();
    return events.where((e) =>
      e.date.year == day.year &&
      e.date.month == day.month &&
      e.date.day == day.day
    ).toList();
  }
}
