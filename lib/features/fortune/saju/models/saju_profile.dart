import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SajuProfile {
  final String name;
  final String gender; // 'male' or 'female'
  final DateTime birthDate;
  final String? birthTime; // 'unknown' or 'HH:mm'
  final bool isLunar;

  SajuProfile({
    required this.name,
    required this.gender,
    required this.birthDate,
    this.birthTime,
    this.isLunar = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'birthDate': birthDate.toIso8601String(),
      'birthTime': birthTime,
      'isLunar': isLunar,
    };
  }

  factory SajuProfile.fromJson(Map<String, dynamic> json) {
    return SajuProfile(
      name: json['name'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birthDate']),
      birthTime: json['birthTime'],
      isLunar: json['isLunar'] ?? false,
    );
  }

  static Future<void> saveProfile(SajuProfile profile) async {
    // Legacy support: save as single profile but also add to list if not exists
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saju_profile', jsonEncode(profile.toJson()));
    
    // Also update list
    List<SajuProfile> profiles = await loadProfiles();
    // Check if profile already exists (simple duplicate check by name and birthdate)
    int index = profiles.indexWhere((p) => p.name == profile.name && p.birthDate.year == profile.birthDate.year && p.birthDate.month == profile.birthDate.month && p.birthDate.day == profile.birthDate.day);
    if (index >= 0) {
      profiles[index] = profile;
    } else {
      profiles.insert(0, profile); // Add to beginning
    }
    
    // Limit to last 10 profiles
    if (profiles.length > 10) {
      profiles = profiles.sublist(0, 10);
    }
    
    await saveProfiles(profiles);
  }

  static Future<SajuProfile?> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonStr = prefs.getString('saju_profile');
    if (jsonStr == null) return null;
    return SajuProfile.fromJson(jsonDecode(jsonStr));
  }
  
  static Future<void> saveProfiles(List<SajuProfile> profiles) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonStr = jsonEncode(profiles.map((p) => p.toJson()).toList());
    await prefs.setString('saju_profiles', jsonStr);
  }

  static Future<List<SajuProfile>> loadProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonStr = prefs.getString('saju_profiles');
    
    List<SajuProfile> profiles = [];
    if (jsonStr != null) {
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      profiles = jsonList.map((json) => SajuProfile.fromJson(json)).toList();
    }
    
    // Migration: If list is empty but single profile exists, add it
    if (profiles.isEmpty) {
      final singleProfile = await loadProfile();
      if (singleProfile != null) {
        profiles.add(singleProfile);
        await saveProfiles(profiles);
      }
    }
    
    return profiles;
  }
  
  static Future<void> deleteProfile(SajuProfile profile) async {
    List<SajuProfile> profiles = await loadProfiles();
    profiles.removeWhere((p) => 
      p.name == profile.name && 
      p.birthDate.year == profile.birthDate.year && 
      p.birthDate.month == profile.birthDate.month && 
      p.birthDate.day == profile.birthDate.day
    );
    await saveProfiles(profiles);
  }

  static Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saju_profile');
  }
}
