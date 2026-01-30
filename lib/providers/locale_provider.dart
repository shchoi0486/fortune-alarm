import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _loadLocale();
  }

  static const String _settingsBoxName = 'settings';
  static const String _languageKey = 'language';

  Future<void> _loadLocale() async {
    try {
      final box = await Hive.openBox(_settingsBoxName);
      final String? languageCode = box.get(_languageKey);
      
      if (languageCode != null && languageCode.isNotEmpty) {
        state = Locale(languageCode);
      } else {
        // 기본값은 시스템 언어 (또는 null로 두어 MaterialApp이 처리하게 함)
        // 여기서는 명시적으로 시스템 언어를 가져오지 않고 null을 유지하여 MaterialApp의 기본 동작을 따릅니다.
        state = null;
      }
    } catch (e) {
      state = null;
    }
  }

  Future<void> setLocale(String languageCode) async {
    state = Locale(languageCode);
    try {
      final box = await Hive.openBox(_settingsBoxName);
      await box.put(_languageKey, languageCode);
    } catch (e) {
      // 에러 처리
    }
  }

  Future<void> clearLocale() async {
    state = null;
    try {
      final box = await Hive.openBox(_settingsBoxName);
      await box.delete(_languageKey);
    } catch (e) {
      // 에러 처리
    }
  }
}
