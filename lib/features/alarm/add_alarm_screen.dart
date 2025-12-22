import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/constants/mission_type.dart';
import '../../data/models/alarm_model.dart';
import '../../data/models/math_difficulty.dart';
import '../../services/alarm_scheduler_service.dart';
import 'package:snap_alarm/providers/alarm_list_provider.dart';
import '../../widgets/ad_widgets.dart';

class AddAlarmScreen extends ConsumerStatefulWidget {
  final AlarmModel? alarm;

  const AddAlarmScreen({super.key, this.alarm});

  @override
  ConsumerState<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends ConsumerState<AddAlarmScreen> {
  bool _isSaving = false;
  late DateTime _selectedTime;
  late MissionType _selectedMission;
  late TextEditingController _labelController;
  List<String?> _referenceImagePaths = [null, null, null];
  final ImagePicker _picker = ImagePicker();
  
  late List<bool> _repeatDays;
  late bool _isVibrationEnabled;
  late bool _isSoundEnabled;
  late double _volume;
  late String _ringtonePath;
  late String _vibrationPattern;
  late bool _isGradualVolume;
  String? _backgroundPath;
  late int _snoozeInterval;
  late int _maxSnoozeCount;

  // Math Mission Settings
  late MathDifficulty _mathDifficulty;
  late int _mathProblemCount;

  // Shake Mission Settings
  late int _shakeCount;
  
  final AudioPlayer _audioPlayer = AudioPlayer();

  Timer? _timer;
  Timer? _previewTimer;

  late FixedExtentScrollController _ampmController;
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  
  // Mission Category State
  // Field removed; category selection is driven by _selectedMission instead.

  @override
  void initState() {
    super.initState();
    if (widget.alarm != null) {
      _selectedTime = widget.alarm!.time;
      _selectedMission = widget.alarm!.missionType;
      _labelController = TextEditingController(text: widget.alarm!.label);
      
      // Initialize image paths
      if (widget.alarm!.referenceImagePaths?.isNotEmpty == true) {
        for (int i = 0; i < widget.alarm!.referenceImagePaths!.length; i++) {
          if (i < 3 && widget.alarm!.referenceImagePaths != null && i < widget.alarm!.referenceImagePaths!.length) {
            _referenceImagePaths[i] = widget.alarm!.referenceImagePaths![i];
          }
        }
      }
      
      _repeatDays = List.from(widget.alarm!.repeatDays);
      _isVibrationEnabled = widget.alarm!.isVibrationEnabled;
      _isSoundEnabled = widget.alarm!.isSoundEnabled;
      _volume = widget.alarm!.volume;
      _ringtonePath = widget.alarm!.ringtonePath ?? 'default';
      _vibrationPattern = widget.alarm!.vibrationPattern ?? 'default';
      _isGradualVolume = widget.alarm!.isGradualVolume;
      _backgroundPath = widget.alarm!.backgroundPath;
      _snoozeInterval = widget.alarm!.snoozeInterval;
      if (_snoozeInterval == 1) _snoozeInterval = 5;
      _maxSnoozeCount = widget.alarm!.maxSnoozeCount;
      if (_maxSnoozeCount == 1) _maxSnoozeCount = 2;

      _mathDifficulty = widget.alarm!.mathDifficulty;
      _mathProblemCount = widget.alarm!.mathProblemCount;
      _shakeCount = widget.alarm!.shakeCount;
    } else {
      _selectedTime = DateTime.now().add(const Duration(minutes: 1));
      _selectedMission = MissionType.none;
      _labelController = TextEditingController();
      _referenceImagePaths = [null, null, null];
      _repeatDays = List.generate(7, (index) => false);
      _isVibrationEnabled = true;
      _isSoundEnabled = true;
      _volume = 1.0;
      _ringtonePath = 'default';
      _vibrationPattern = 'default';
      _isGradualVolume = false;
      _backgroundPath = null;
      _snoozeInterval = 5; // Default 5 min
      _maxSnoozeCount = 3; // Default 3 times

      _mathDifficulty = MathDifficulty.normal;
      _mathProblemCount = 3;
      _shakeCount = 20;
    }

    // Initialize Picker Controllers
    int hour = _selectedTime.hour;
    final isPm = hour >= 12;
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;

    _ampmController = FixedExtentScrollController(initialItem: isPm ? 1 : 0);
    _hourController = FixedExtentScrollController(initialItem: hour - 1);
    _minuteController = FixedExtentScrollController(initialItem: _selectedTime.minute);
    
    // 1초마다 남은 시간 업데이트
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _labelController.dispose();
    _audioPlayer.dispose();
    _ampmController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(int index, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _referenceImagePaths[index] = image.path;
        // 첫 번째 이미지를 대표 이미지로 설정 (하위 호환성)
        if (index == 0) {
          // _referenceImagePath = image.path; // Legacy single-image field removed
        }
      });
    }
  }

  void _showImagePickerOptions(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('촬영하기'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('선택하기'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickBackground() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _backgroundPath = image.path;
      });
    }
  }

  void _showBackgroundPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            height: 180,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("알람 배경화면 선택", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        // 안내 메시지
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('assets/images/ 폴더에 이미지를 넣고 pubspec.yaml에 등록하세요.')),
                        );
                      },
                      child: const Text("추가 방법", style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Gallery Option
                      _buildSpecialOption(Icons.image, "갤러리", _pickBackground),
                      const SizedBox(width: 16),
                      
                      // Colors
                      _buildColorOption(const Color(0xFFFFD54F)), // Yellow (Default)
                      const SizedBox(width: 16),
                      _buildColorOption(Colors.grey), // Gray
                      const SizedBox(width: 16),
                      _buildColorOption(const Color(0xFFFFC1CC)), // Pastel Pink
                      const SizedBox(width: 16),
                      _buildColorOption(const Color(0xFFAEC6CF)), // Pastel Blue
                      const SizedBox(width: 16),
                      _buildColorOption(const Color(0xFF77DD77)), // Pastel Green
                      const SizedBox(width: 16),
                      _buildColorOption(const Color(0xFFB39EB5)), // Pastel Purple
                      const SizedBox(width: 16),
                      _buildColorOption(const Color(0xFFFFB347)), // Pastel Orange
                      const SizedBox(width: 16),
                      _buildColorOption(Colors.white),
                      const SizedBox(width: 16),
                      _buildColorOption(Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpecialOption(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Icon(icon, color: Colors.grey[700]),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildAssetOption(String assetPath) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _backgroundPath = assetPath;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
            // Fallback if asset doesn't exist yet
            onError: (exception, stackTrace) => debugPrint('Asset not found: $assetPath'),
          ),
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _backgroundPath = 'color:${color.value}';
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  String _getRemainingTimeText() {
    final now = DateTime.now();
    
    // Create base target time with today's date and selected hour/minute
    DateTime targetTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime.hour,
      _selectedTime.minute,
      0, 0,
    );

    // Initial check for non-repeating alarms: if time passed today, move to tomorrow
    if (targetTime.isBefore(now)) {
      // 1분 이내의 과거는 오늘로 간주하는 grace period 적용
      final diff = now.difference(targetTime);
      if (diff.inMinutes >= 1) {
        targetTime = targetTime.add(const Duration(days: 1));
      } else {
        debugPrint('[AddAlarm] Non-repeating time is within 1 minute grace period. Keeping today.');
      }
    }

    // Handle repeating days if any are selected
    if (_repeatDays.any((d) => d)) {
      int currentWeekdayIndex = now.weekday - 1; // 0=Mon, ..., 6=Sun
      
      // If today's alarm time has passed, we must start checking from tomorrow
      int startOffset = 0;
      final todayTarget = DateTime(now.year, now.month, now.day, _selectedTime.hour, _selectedTime.minute, 0, 0);
      if (todayTarget.isBefore(now)) {
        // 1분 이내의 과거는 오늘로 간주하는 grace period 적용
        final diff = now.difference(todayTarget);
        if (diff.inMinutes >= 1) {
          startOffset = 1;
        }
      }

      for (int i = 0; i < 7; i++) {
        final checkIndex = (currentWeekdayIndex + startOffset + i) % 7;
        if (_repeatDays[checkIndex]) {
          targetTime = DateTime(
            now.year,
            now.month,
            now.day,
            _selectedTime.hour,
            _selectedTime.minute,
            0, 0,
          ).add(Duration(days: startOffset + i));
          break;
        }
      }
    }

    final difference = targetTime.difference(now);
    
    if (difference.isNegative || difference.inSeconds <= 0) {
      return "지금 울려요";
    }

    if (difference.inSeconds < 60) {
      return "1분 미만 후에 울려요";
    }

    // Round up to the nearest minute for display
    final totalMinutes = (difference.inSeconds / 60).ceil();
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours > 0) {
      if (minutes > 0) {
        return "$hours시간 $minutes분 후에 울려요";
      } else {
        return "$hours시간 후에 울려요";
      }
    } else {
      return "$minutes분 후에 울려요";
    }
  }

  Widget _buildSettingSection({required String title, required Widget child, Widget? trailing}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 6),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AnnotatedRegion(
      value: (isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark).copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: isDarkMode ? const Color(0xFF1C1C1E) : const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: Text(
            '기상 알람',
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          leading: IconButton(
            icon: Icon(Icons.close, color: isDarkMode ? Colors.white : Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 12),
                _buildSettingSection(
                  title: "시간 설정",
                  child: Column(
                    children: [
                      _buildCustomTimePicker(),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          _getRemainingTimeText(),
                          style: TextStyle(
                            color: Colors.cyan[700],
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                
                // 반복 요일
                _buildSettingSection(
                  title: "반복 요일",
                  trailing: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _repeatDays.every((day) => day),
                          activeColor: Colors.cyan,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          onChanged: (bool? value) {
                            setState(() {
                              final newValue = value ?? false;
                              for (int i = 0; i < _repeatDays.length; i++) {
                                _repeatDays[i] = newValue;
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text("매일 반복", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  child: _buildDaySelector(),
                ),
                
                // Snooze Settings
                _buildSettingSection(
                  title: "반복 알람 (스누즈)",
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("간격", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            DropdownButtonFormField<int>(
                              value: _snoozeInterval,
                              isExpanded: true,
                              dropdownColor: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: isDarkMode ? Colors.white70 : Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                filled: true,
                                fillColor: isDarkMode ? Colors.black26 : Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Colors.cyan, width: 1.5),
                                ),
                                isDense: true,
                              ),
                              items: {0, 3, 5, 10, _snoozeInterval}.map((e) => DropdownMenuItem(value: e, child: Text(e == 0 ? '없음' : '$e분 후', style: TextStyle(fontSize: 13, color: isDarkMode ? Colors.white : Colors.black87, fontWeight: FontWeight.w500)))).toList()..sort((a, b) => a.value!.compareTo(b.value!)),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _snoozeInterval = val;
                                    if (val == 0) {
                                      _maxSnoozeCount = 0;
                                    } else if (_maxSnoozeCount == 0) {
                                      _maxSnoozeCount = 3; // 간격 선택 시 기본 횟수 자동 선택
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("횟수", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            DropdownButtonFormField<int>(
                              value: _maxSnoozeCount,
                              isExpanded: true,
                              dropdownColor: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: isDarkMode ? Colors.white70 : Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                filled: true,
                                fillColor: isDarkMode ? Colors.black26 : Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Colors.cyan, width: 1.5),
                                ),
                                isDense: true,
                              ),
                              items: {0, 2, 3, 5, 10, _maxSnoozeCount}.map((e) => DropdownMenuItem(value: e, child: Text(e == 0 ? '없음' : '$e회 (총 $e번)', style: TextStyle(fontSize: 13, color: isDarkMode ? Colors.white : Colors.black87, fontWeight: FontWeight.w500)))).toList()..sort((a, b) => a.value!.compareTo(b.value!)),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _maxSnoozeCount = val;
                                    if (val == 0) {
                                      _snoozeInterval = 0;
                                    } else if (_snoozeInterval == 0) {
                                      _snoozeInterval = 5; // 횟수 선택 시 기본 간격 자동 선택
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 기상 미션
                _buildSettingSection(
                  title: "기상 미션",
                  child: _buildMissionSelector(),
                ),

                // 알람 소리
                _buildSettingSection(
                  title: "알람 소리",
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: _isSoundEnabled,
                      activeThumbColor: Colors.cyan,
                      onChanged: (val) => setState(() => _isSoundEnabled = val),
                    ),
                  ),
                  child: AnimatedOpacity(
                    opacity: _isSoundEnabled ? 1.0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: IgnorePointer(
                      ignoring: !_isSoundEnabled,
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            leading: const Icon(Icons.music_note, size: 20),
                            title: Text(_getPayloadTitle(_ringtonePath, isRingtone: true), style: const TextStyle(fontSize: 13)),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 12),
                            onTap: () {
                              _showRingtonePicker();
                            },
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.volume_mute, size: 20),
                              Expanded(
                                child: Slider(
                                  value: _volume,
                                  activeColor: Colors.cyan,
                                  inactiveColor: Colors.cyan.withOpacity(0.2),
                                  onChanged: (val) {
                                    setState(() => _volume = val);
                                  },
                                  onChangeEnd: (val) {
                                    _playPreviewSound(_ringtonePath);
                                  },
                                ),
                              ),
                              const Icon(Icons.volume_up, size: 20),
                            ],
                          ),
                          const SizedBox(height: 4),
                          CheckboxListTile(
                            title: const Text("점점 커지게", style: TextStyle(fontSize: 13)),
                            value: _isGradualVolume,
                            onChanged: (val) => setState(() => _isGradualVolume = val!),
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            activeColor: Colors.cyan,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 진동
                _buildSettingSection(
                  title: "진동",
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: _isVibrationEnabled,
                      activeThumbColor: Colors.cyan,
                      onChanged: (val) => setState(() => _isVibrationEnabled = val),
                    ),
                  ),
                  child: AnimatedOpacity(
                    opacity: _isVibrationEnabled ? 1.0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: IgnorePointer(
                      ignoring: !_isVibrationEnabled,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        leading: const Icon(Icons.vibration, size: 20),
                        title: Text(_getPayloadTitle(_vibrationPattern, isRingtone: false), style: const TextStyle(fontSize: 13)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 12),
                        onTap: () {
                          _showVibrationPicker();
                        },
                      ),
                    ),
                  ),
                ),

                // 레이블 및 배경화면
                _buildSettingSection(
                  title: "알람 이름 및 배경",
                  child: Column(
                    children: [
                      TextField(
                        controller: _labelController,
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          labelText: '알람 이름',
                          labelStyle: const TextStyle(fontSize: 13),
                          hintText: '알람 이름을 입력해주세요',
                          hintStyle: const TextStyle(fontSize: 13),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.wallpaper, size: 20),
                        title: const Text("알람 배경화면", style: TextStyle(fontSize: 13)),
                        trailing: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _backgroundPath == null 
                                ? const Color(0xFFFFD54F) // Default Yellow to match Ringing screen
                                : (_backgroundPath!.startsWith('color:') 
                                    ? Color(int.parse(_backgroundPath!.split(':')[1])) 
                                    : Colors.transparent),
                            image: _backgroundPath != null && !_backgroundPath!.startsWith('color:') 
                                ? (_backgroundPath!.startsWith('assets/')
                                    ? DecorationImage(image: AssetImage(_backgroundPath!), fit: BoxFit.cover)
                                    : DecorationImage(image: FileImage(File(_backgroundPath!)), fit: BoxFit.cover))
                                : null,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                        ),
                        onTap: _showBackgroundPicker,
                      ),
                    ],
                  ),
                ),

                const DetailedAdWidget(),
                const SizedBox(height: 24), // Bottom padding
              ],
            ),
          ),
          
          // 하단 저장 버튼
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _saveAlarm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: _isSaving
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("저장", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildCustomTimePicker() {
    // 12-hour format logic
    int hour = _selectedTime.hour;
    final isPm = hour >= 12;
    // Use the variable to avoid the lint warning
    if (isPm) hour -= 12;
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;
    
    const double itemExtent = 55.0;
    
    return SizedBox(
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Unified Selection Overlay
          Center(
            child: Container(
              width: 310, // Increased width slightly
              height: itemExtent,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AM/PM (Korean Style First with Emojis)
              SizedBox(
                width: 110,
                child: CupertinoPicker(
                  itemExtent: itemExtent,
                  selectionOverlay: const SizedBox(),
                  useMagnifier: true,
                  magnification: 1.2,
                  scrollController: _ampmController,
                  onSelectedItemChanged: (index) {
                    final newIsPm = index == 1;
                    int currentHour = _selectedTime.hour;
                    final isCurrentlyPm = currentHour >= 12;
                    
                    if (isCurrentlyPm != newIsPm) {
                       if (newIsPm) {
                         currentHour += 12;
                       } else {
                         currentHour -= 12;
                       }
                       setState(() {
                          _selectedTime = DateTime(
                            _selectedTime.year,
                            _selectedTime.month,
                            _selectedTime.day,
                            currentHour,
                            _selectedTime.minute,
                            0, 0,
                          );
                       });
                    }
                  },
                  children: const [
                    Center(child: Text('☀️ 오전', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                    Center(child: Text('🌙 오후', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),

              // Hour
              SizedBox(
                width: 80,
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: itemExtent,
                  selectionOverlay: const SizedBox(),
                  useMagnifier: true,
                  magnification: 1.2,
                  scrollController: _hourController,
                  onSelectedItemChanged: (index) {
                    int newHour = index + 1;
                    final isPm = _selectedTime.hour >= 12;
                    
                    if (isPm) {
                      if (newHour != 12) newHour += 12;
                    } else {
                      if (newHour == 12) newHour = 0;
                    }
                    setState(() {
                      _selectedTime = DateTime(
                        _selectedTime.year,
                        _selectedTime.month,
                        _selectedTime.day,
                        newHour,
                        _selectedTime.minute,
                        0, 0,
                      );
                    });
                  },
                  children: List.generate(12, (index) => Center(
                    child: Text(
                      (index + 1).toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
              
              // Colon separator
              const SizedBox(
                width: 20,
                child: Center(
                  child: Text(":", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, height: 1.1)),
                ),
              ),
              
              // Minute
              SizedBox(
                width: 80,
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: itemExtent,
                  selectionOverlay: const SizedBox(),
                  useMagnifier: true,
                  magnification: 1.2,
                  scrollController: _minuteController,
                  onSelectedItemChanged: (index) {
                    final oldMinute = _selectedTime.minute;
                    final newMinute = index;
                    int newHour = _selectedTime.hour;

                    // Calculate delta to determine direction (shortest path)
                    final delta = newMinute - oldMinute;
                    
                    if (delta > 30 || delta < -30) {
                      if (delta > 30) {
                        // Wrapped backward (e.g. 0 -> 59)
                        newHour--;
                      } else {
                        // Wrapped forward (e.g. 59 -> 0)
                        newHour++;
                      }
                      
                      // Handle hour wrapping and AM/PM controller sync
                      if (newHour < 0) newHour = 23;
                      if (newHour > 23) newHour = 0;
                      
                      // Update Hour and AM/PM controllers UI
                      int displayHour = newHour;
                      final isPm = displayHour >= 12;
                      if (displayHour > 12) displayHour -= 12;
                      if (displayHour == 0) displayHour = 12;
                      
                      _hourController.animateToItem(displayHour - 1, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
                      _ampmController.animateToItem(isPm ? 1 : 0, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
                    }
                    
                    setState(() {
                      _selectedTime = DateTime(
                        _selectedTime.year,
                        _selectedTime.month,
                        _selectedTime.day,
                        newHour,
                        newMinute,
                        0, 0,
                      );
                    });
                  },
                  children: List.generate(60, (index) => Center(
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final days = ['일', '월', '화', '수', '목', '금', '토'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        // UI index 0(Sun) -> Model index 6
        // UI index 1(Mon) -> Model index 0
        final modelIndex = (index + 6) % 7;
        final isSelected = _repeatDays[modelIndex];
        return GestureDetector(
          onTap: () {
            setState(() {
              _repeatDays[modelIndex] = !isSelected;
            });
          },
          child: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.cyan : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.cyan : (isDarkMode ? Colors.grey[700]! : Colors.grey),
                width: 1.5,
              ),
            ),
            child: Text(
              days[index],
              style: TextStyle(
                color: isSelected ? Colors.white : (isDarkMode ? Colors.grey[400] : Colors.grey[700]),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMissionSelector() {
    return Column(
      children: [
        // Category Buttons (Icons)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              _buildCategoryButton("없음", Icons.alarm_off, 0),
              const SizedBox(width: 6),
              _buildCategoryButton("Snap", Icons.camera_alt, 1),
              const SizedBox(width: 6),
              _buildCategoryButton("계산", Icons.calculate, 2),
              const SizedBox(width: 6),
              _buildCategoryButton("퀴즈", Icons.quiz, 3),
              const SizedBox(width: 6),
              _buildCategoryButton("운세", Icons.auto_awesome, 4),
              const SizedBox(width: 6),
              _buildCategoryButton("흔들기", Icons.vibration, 5),
              const SizedBox(width: 6),
              _buildCategoryButton("영양제", Icons.medication, 6),
            ],
          ),
        ),
        const SizedBox(height: 12),
        
        // Content based on category
        if (_selectedMission == MissionType.none) ...[
           const Text("미션 없이 알람이 울립니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
        ] else if (_selectedMission == MissionType.supplement) ...[
           const Text("영양제 섭취 확인 화면이 나타납니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
        ] else if ([
          MissionType.cameraSink,
          MissionType.cameraRefrigerator,
          MissionType.cameraFace,
          MissionType.cameraOther,
          MissionType.cameraScale
        ].contains(_selectedMission)) ...[
           const Text("지정된 물체를 순서대로 촬영해야 알람이 꺼집니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
           const SizedBox(height: 16),
           
           // 3 Sequential Image Slots
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               _buildImageSlot(0),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 8),
                 child: Icon(Icons.arrow_forward, color: Colors.grey, size: 20),
               ),
               _buildImageSlot(1),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 8),
                 child: Icon(Icons.arrow_forward, color: Colors.grey, size: 20),
               ),
               _buildImageSlot(2),
             ],
           ),
        ] else if (_selectedMission == MissionType.math) ...[
           const Text("수학 문제를 풀어야 알람이 꺼집니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
           const SizedBox(height: 16),
           Row(
             children: [
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text("난이도", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                     const SizedBox(height: 8),
                     DropdownButtonFormField<MathDifficulty>(
                       value: [MathDifficulty.easy, MathDifficulty.normal, MathDifficulty.hard].contains(_mathDifficulty) ? _mathDifficulty : MathDifficulty.normal,
                       isExpanded: true,
                       dropdownColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2C2C2E) : Colors.white,
                       icon: Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black54),
                       decoration: InputDecoration(
                         contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                         filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black26 : Colors.grey[100],
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: const BorderSide(color: Colors.cyan, width: 1.5),
                         ),
                         isDense: true,
                       ),
                       items: const [
                         DropdownMenuItem(value: MathDifficulty.easy, child: Text("쉬움", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                         DropdownMenuItem(value: MathDifficulty.normal, child: Text("보통", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                         DropdownMenuItem(value: MathDifficulty.hard, child: Text("어려움", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                       ],
                       onChanged: (val) {
                         if (val != null) {
                           setState(() {
                             _mathDifficulty = val;
                           });
                         }
                       },
                     ),
                   ],
                 ),
               ),
               const SizedBox(width: 12),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text("문제 수", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                     const SizedBox(height: 8),
                     DropdownButtonFormField<int>(
                       value: [1, 3, 5].contains(_mathProblemCount) ? _mathProblemCount : 3,
                       isExpanded: true,
                       dropdownColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2C2C2E) : Colors.white,
                       icon: Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black54),
                       decoration: InputDecoration(
                         contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                         filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black26 : Colors.grey[100],
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: const BorderSide(color: Colors.cyan, width: 1.5),
                         ),
                         isDense: true,
                       ),
                       items: [1, 3, 5].map((e) => DropdownMenuItem(
                         value: e,
                         child: Text("$e문제", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                       )).toList(),
                       onChanged: (val) {
                         if (val != null) {
                           setState(() {
                             _mathProblemCount = val;
                           });
                         }
                       },
                     ),
                   ],
                 ),
               ),
             ],
           ),
        ] else if (_selectedMission == MissionType.quiz) ...[
           const Text("퀴즈 미션이 선택되었습니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
        ] else if (_selectedMission == MissionType.fortune) ...[
           const Text("운세 미션이 선택되었습니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
        ] else if (_selectedMission == MissionType.shake) ...[
           const Text("핸드폰을 흔들어야 알람이 꺼집니다.", style: TextStyle(color: Colors.grey, fontSize: 13)),
           const SizedBox(height: 16),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text("흔들기 횟수", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                   Text("$_shakeCount회", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 13)),
                 ],
               ),
               Slider(
                 value: _shakeCount.toDouble(),
                 min: 5,
                 max: 100,
                 divisions: 19,
                 label: "$_shakeCount",
                 activeColor: Colors.cyan,
                 inactiveColor: Colors.cyan.withOpacity(0.2),
                 onChanged: (val) {
                   setState(() {
                     _shakeCount = val.toInt();
                   });
                 },
               ),
             ],
           ),
        ],
      ],
    );
  }

  Widget _buildImageSlot(int index) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final path = _referenceImagePaths[index];
    return GestureDetector(
      onTap: () => _showImagePickerOptions(index),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDarkMode ? Colors.grey[800]! : Colors.grey[400]!),
          image: path != null
              ? DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover)
              : null,
        ),
        child: path == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 28, color: isDarkMode ? Colors.grey[600] : Colors.grey),
                  const SizedBox(height: 4),
                  Text("미션 ${index + 1}", style: TextStyle(color: isDarkMode ? Colors.grey[600] : Colors.grey, fontSize: 12)),
                ],
              )
            : null,
      ),
    );
  }

  Widget _buildCategoryButton(String label, IconData icon, int index) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Determine if this button is selected based on _selectedMission
    bool isSelected = false;
    if (index == 0) {
      isSelected = _selectedMission == MissionType.none;
    } else if (index == 1) {
      isSelected = [MissionType.cameraSink, MissionType.cameraRefrigerator, MissionType.cameraFace, MissionType.cameraOther, MissionType.cameraScale].contains(_selectedMission);
    } else if (index == 2) {
      isSelected = _selectedMission == MissionType.math;
    } else if (index == 3) {
      isSelected = _selectedMission == MissionType.quiz;
    } else if (index == 4) {
      isSelected = _selectedMission == MissionType.fortune;
    } else if (index == 5) {
      isSelected = _selectedMission == MissionType.shake;
    } else if (index == 6) {
      isSelected = _selectedMission == MissionType.supplement;
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (index == 0) {
              _selectedMission = MissionType.none;
            } else if (index == 1) {
              _selectedMission = MissionType.cameraOther; // Default to generic camera
            } else if (index == 2) {
              _selectedMission = MissionType.math;
            } else if (index == 3) {
              _selectedMission = MissionType.quiz;
            } else if (index == 4) {
              _selectedMission = MissionType.fortune;
            } else if (index == 5) {
              _selectedMission = MissionType.shake;
            } else if (index == 6) {
              _selectedMission = MissionType.supplement;
            }
          });
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: isSelected 
                ? Colors.cyan.withOpacity(0.1) 
                : (isDarkMode ? Colors.grey[850] : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.cyan : (isDarkMode ? Colors.grey[800]! : Colors.grey[300]!),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.cyan : (isDarkMode ? Colors.grey[400] : Colors.grey[600]),
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.cyan : (isDarkMode ? Colors.grey[400] : Colors.grey[600]),
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPayloadTitle(String key, {required bool isRingtone}) {
    if (isRingtone) {
      switch (key) {
        case 'default': return '기본 벨소리';
        case 'alarm_sound': return '클래식 알람';
        case 'morning': return '디지털 알람'; // Replaced name for morning.ogg
        case 'birds': return '새소리';
        case 'waves': return '파도 소리';
        default: return '기본 벨소리';
      }
    } else {
      switch (key) {
        case 'default': return '기본 진동';
        case 'short': return '짧게 반복';
        case 'long': return '길게 반복';
        case 'heartbeat': return '심장 박동';
        case 'sos': return 'SOS';
        case 'quick': return '빠른 박동';
        default: return '기본 진동';
      }
    }
  }

  void _playPreviewSound(String path) async {
    await _audioPlayer.stop();
    await FlutterRingtonePlayer().stop();
    
    if (path == 'default') {
      FlutterRingtonePlayer().playAlarm(volume: _volume, looping: false);
    } else {
      // 모든 커스텀 사운드는 이제 OGG 형식입니다.
      String ext = 'ogg';
      
      try {
        await _audioPlayer.setSource(AssetSource('sounds/$path.$ext'));
        await _audioPlayer.setVolume(_volume);
        await _audioPlayer.resume();
      } catch (e) {
        debugPrint('Error playing preview: $e');
      }
    }
  }

  void _playPreviewVibration(String pattern) async {
    if (await Vibration.hasVibrator() == true) {
      Vibration.cancel();
      switch (pattern) {
        case 'short':
          Vibration.vibrate(pattern: [0, 500, 200, 500]);
          break;
        case 'long':
          Vibration.vibrate(pattern: [0, 1000, 500, 1000]);
          break;
        case 'heartbeat':
          Vibration.vibrate(pattern: [0, 200, 100, 200]);
          break;
        case 'sos':
          Vibration.vibrate(pattern: [0, 200, 100, 200, 100, 200, 500, 500, 200, 500, 200, 500, 500, 200, 100, 200, 100, 200]);
          break;
        case 'quick':
          Vibration.vibrate(pattern: [0, 100, 50, 100, 50, 100]);
          break;
        default:
          Vibration.vibrate();
          break;
      }
    }
  }

  void _showRingtonePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return ListView(
              shrinkWrap: true,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("벨소리 선택", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildPickerItem("기본 벨소리", 'default', true, setModalState),
                _buildPickerItem("클래식 알람", 'alarm_sound', true, setModalState),
                _buildPickerItem("디지털 알람", 'morning', true, setModalState),
                _buildPickerItem("새소리", 'birds', true, setModalState),
                _buildPickerItem("파도 소리", 'waves', true, setModalState),
              ],
            );
          },
        );
      },
    ).whenComplete(() {
      _audioPlayer.stop();
      FlutterRingtonePlayer().stop();
    });
  }

  void _showVibrationPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return ListView(
              shrinkWrap: true,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("진동 패턴 선택", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildPickerItem("기본 진동", 'default', false, setModalState),
                _buildPickerItem("짧게 반복", 'short', false, setModalState),
                _buildPickerItem("길게 반복", 'long', false, setModalState),
                _buildPickerItem("심장 박동", 'heartbeat', false, setModalState),
                _buildPickerItem("SOS", 'sos', false, setModalState),
                _buildPickerItem("빠른 박동", 'quick', false, setModalState),
              ],
            );
          },
        );
      },
    ).whenComplete(() {
      Vibration.cancel();
    });
  }

  Widget _buildPickerItem(String title, String value, bool isRingtone, StateSetter setModalState) {
    final selectedValue = isRingtone ? _ringtonePath : _vibrationPattern;
    final isSelected = selectedValue == value;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      title: Text(title, style: TextStyle(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? Colors.cyan : (isDarkMode ? Colors.white : Colors.black87),
      )),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.cyan) : null,
      onTap: () {
        setModalState(() {
          // Update parent state as well
          setState(() {
            if (isRingtone) {
              _ringtonePath = value;
            } else {
              _vibrationPattern = value;
            }
          });
        });
        
        if (isRingtone) {
          _playPreviewSound(value);
        } else {
          _playPreviewVibration(value);
        }
      },
    );
  }

  Future<void> _saveAlarm() async {
    // 권한 확인 (알람 스케줄링)
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await _showPermissionDialog('권한 필요', '알람을 정확한 시간에 울리기 위해 "스케줄 및 리마인더" 권한이 필요합니다.');
        if (await Permission.scheduleExactAlarm.isDenied) return;
      }
      
      if (await Permission.ignoreBatteryOptimizations.isDenied) {
        await _showPermissionDialog('권한 필요', '알람이 정시에 울리려면 배터리 최적화를 해제해야 합니다.');
        if (await Permission.ignoreBatteryOptimizations.isDenied) return;
      }

      if (await Permission.systemAlertWindow.isDenied) {
        await _showPermissionDialog('권한 필요', '알람 실행 시 미션 화면을 띄우기 위해 "다른 앱 위에 표시" 권한이 필요합니다.');
        if (await Permission.systemAlertWindow.isDenied) return;
      }
    }

    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
      if (await Permission.notification.isDenied) return;
    }
    
    // 미션 선택 시 이미지 확인 (카메라 미션인 경우에만)
    final isCameraMission = _selectedMission == MissionType.cameraSink ||
        _selectedMission == MissionType.cameraRefrigerator ||
        _selectedMission == MissionType.cameraFace ||
        _selectedMission == MissionType.cameraOther ||
        _selectedMission == MissionType.cameraScale;

    if (isCameraMission) {
       // 첫 번째 이미지는 필수
       if (_referenceImagePaths[0] == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('적어도 첫 번째 미션 이미지는 설정해주세요.')),
          );
          return;
       }
       // 중간에 빈 이미지가 있으면 안됨 (순서대로 채워야 함)
       if (_referenceImagePaths[0] != null && _referenceImagePaths[2] != null && _referenceImagePaths[1] == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('미션 이미지를 순서대로 설정해주세요.')),
          );
          return;
       }
    }

    setState(() => _isSaving = true);

    try {
      final now = DateTime.now();
      DateTime alarmTime = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime.hour,
        _selectedTime.minute,
        0, // seconds
        0, // milliseconds
      );

      if (_repeatDays.any((d) => d)) {
        // 반복 요일이 있는 경우: 가장 가까운 활성화된 요일 찾기
        int dayOffset = 0;
        while (true) {
          final checkDate = alarmTime.add(Duration(days: dayOffset));
          // checkDate.weekday: 1(Mon)..7(Sun) -> index: 0..6
          final weekdayIndex = checkDate.weekday - 1;
          
          if (_repeatDays[weekdayIndex]) {
            // 해당 요일이 활성화됨
            // 만약 '오늘'인데 이미 시간이 지났다면 스킵 (단, 1분 이내 과거는 오늘로 유지)
            if (dayOffset == 0 && checkDate.isBefore(now)) {
              final diff = now.difference(checkDate);
              if (diff.inMinutes >= 1) {
                dayOffset++;
                continue;
              } else {
                debugPrint('[AddAlarm] Repeating alarm time is within 1 minute grace period. Keeping today.');
              }
            }
            // 찾음
            alarmTime = checkDate;
            break;
          }
          dayOffset++;
          if (dayOffset > 8) break; // 안전장치
        }
      } else {
        // 반복 없음: 과거면 내일로 (단, 1분 이내 과거는 오늘로 유지하여 즉시 울리게 함)
        if (alarmTime.isBefore(now)) {
          final diff = now.difference(alarmTime);
          if (diff.inMinutes >= 1) {
            alarmTime = alarmTime.add(const Duration(days: 1));
          } else {
            debugPrint('[AddAlarm] Time is within 1 minute grace period. Keeping today.');
          }
        }
      }

      final alarm = AlarmModel(
        id: widget.alarm?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        time: alarmTime,
        isEnabled: true,
        missionType: _selectedMission,
        label: _labelController.text,
        referenceImagePaths: _referenceImagePaths.whereType<String>().toList(),
        repeatDays: _repeatDays,
        isVibrationEnabled: _isVibrationEnabled,
        isSoundEnabled: _isSoundEnabled,
        volume: _volume,
        ringtonePath: _ringtonePath,
        vibrationPattern: _vibrationPattern,
        isGradualVolume: _isGradualVolume,
        backgroundPath: _backgroundPath,
        snoozeInterval: _snoozeInterval,
        maxSnoozeCount: _maxSnoozeCount,
        mathDifficulty: _mathDifficulty,
        mathProblemCount: _mathProblemCount,
        shakeCount: _shakeCount,
      );

      bool scheduled = true;
      if (alarm.isEnabled) {
        try {
          scheduled = await AlarmSchedulerService.scheduleAlarm(alarm);
        } catch (e) {
          scheduled = false;
          debugPrint('Error scheduling alarm: $e');
        }
      }

      if (!scheduled && mounted) {
        if (Platform.isAndroid) {
          bool isExactAlarmDenied = await Permission.scheduleExactAlarm.isDenied;
          bool isIgnoreBatteryOptimizationsDenied = await Permission.ignoreBatteryOptimizations.isDenied;
          bool isSystemAlertWindowDenied = await Permission.systemAlertWindow.isDenied;

          if (isExactAlarmDenied) {
            if (!mounted) return;
            await _showPermissionDialog('권한 필요', '알람 등록에 실패했습니다. 정확한 알람 권한이 꺼져있어 설정이 필요합니다.');
          } else if (isIgnoreBatteryOptimizationsDenied) {
            if (!mounted) return;
            await _showPermissionDialog('권한 필요', '알람 등록에 실패했습니다. 배터리 최적화 예외 권한이 없어 설정이 필요합니다.');
          } else if (isSystemAlertWindowDenied) {
            if (!mounted) return;
            await _showPermissionDialog('권한 필요', '알람 등록에 실패했습니다. 다른 앱 위에 표시 권한이 없어 설정이 필요합니다.');
          } else {
            // 모든 권한이 허용되었는데도 실패한 경우 (예외 상황)
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('알람 등록 실패. 알 수 없는 오류가 발생했습니다.'),
                action: SnackBarAction(
                  label: '설정 열기',
                  onPressed: () => openAppSettings(),
                ),
                duration: const Duration(seconds: 5),
              ),
            );
          }
        } else {
          // Android가 아닌 다른 플랫폼에서 실패한 경우
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('알람 등록 실패. 알 수 없는 오류가 발생했습니다.'),
              action: SnackBarAction(
                label: '설정 열기',
                onPressed: () => openAppSettings(),
              ),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      }

      if (widget.alarm != null) {
        final notifier = ref.read(alarmListProvider.notifier);
        await notifier.updateAlarm(alarm);
      } else {
        final notifier = ref.read(alarmListProvider.notifier);
        await notifier.addAlarm(alarm);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('오류 발생: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _showPermissionDialog(String title, String content) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('설정 열기'),
          ),
        ],
      ),
    );
  }
}
