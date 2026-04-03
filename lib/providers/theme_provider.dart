import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState {
  final ThemeMode themeMode;
  final Color primaryColor;

  ThemeState({
    required this.themeMode,
    required this.primaryColor,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    Color? primaryColor,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState(themeMode: ThemeMode.light, primaryColor: const Color(0xFFF97316))) {
    _loadTheme();
  }

  static const String _themeKey = 'theme_mode';
  static const String _primaryColorKey = 'primary_color';

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Theme Mode
    final themeString = prefs.getString(_themeKey);
    ThemeMode mode = ThemeMode.light;
    if (themeString == 'light') {
      mode = ThemeMode.light;
    } else if (themeString == 'dark') {
      mode = ThemeMode.dark;
    }

    // Primary Color
    final colorInt = prefs.getInt(_primaryColorKey);
    Color color = const Color(0xFFF97316);
    if (colorInt != null) {
      color = Color(colorInt);
    }

    state = ThemeState(themeMode: mode, primaryColor: color);
  }

  Future<void> toggleTheme(bool isDark) async {
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    state = state.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, isDark ? 'dark' : 'light');
  }
  
  Future<void> setTheme(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    String value = 'system';
    if (mode == ThemeMode.light) value = 'light';
    if (mode == ThemeMode.dark) value = 'dark';
    await prefs.setString(_themeKey, value);
  }

  Future<void> setPrimaryColor(Color color) async {
    state = state.copyWith(primaryColor: color);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_primaryColorKey, color.value);
  }
}
