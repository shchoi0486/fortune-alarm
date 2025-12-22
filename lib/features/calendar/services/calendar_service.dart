import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_event.dart';

class CalendarService {
  static const String _storageKey = 'calendar_events';

  Future<List<CalendarEvent>> loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_storageKey);
    if (data == null) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => CalendarEvent.fromJson(json)).toList();
  }

  Future<void> saveEvent(CalendarEvent event) async {
    final events = await loadEvents();
    final index = events.indexWhere((e) => e.id == event.id);
    
    if (index >= 0) {
      events[index] = event;
    } else {
      events.add(event);
    }
    
    await _saveToPrefs(events);
  }

  Future<void> deleteEvent(String id) async {
    final events = await loadEvents();
    events.removeWhere((e) => e.id == id);
    await _saveToPrefs(events);
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
