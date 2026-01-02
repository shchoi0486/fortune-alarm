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
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../core/constants/mission_type.dart';
import '../../data/models/alarm_model.dart';
import '../../data/models/math_difficulty.dart';
import '../../services/alarm_scheduler_service.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
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
  List<String> _existingImages = []; // 기존 촬영된 이미지 목록
  bool _isDeleteMode = false;
  final Set<String> _selectedForDelete = {};
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
  
  // Walk Mission Settings
  late int _walkStepCount;
  
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
      _walkStepCount = widget.alarm!.walkStepCount;
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
      _backgroundPath = 'assets/images/alarm_bg.png';
      _snoozeInterval = 5; // Default 5 min
      _maxSnoozeCount = 3; // Default 3 times

      _mathDifficulty = MathDifficulty.normal;
      _mathProblemCount = 3;
      _shakeCount = 20;
      _walkStepCount = 20;
    }

    // Initialize Picker Controllers
    int hour = _selectedTime.hour;
    final isPm = hour >= 12;
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;

    _ampmController = FixedExtentScrollController(initialItem: isPm ? 1 : 0);
    _hourController = FixedExtentScrollController(initialItem: hour - 1);
    _minuteController = FixedExtentScrollController(initialItem: _selectedTime.minute);
    
    // 기존 이미지 로드
    _loadExistingImages();
    
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

  bool get _isCameraMission => [
    MissionType.cameraSink,
    MissionType.cameraRefrigerator,
    MissionType.cameraFace,
    MissionType.cameraOther,
    MissionType.cameraScale
  ].contains(_selectedMission);

  Future<Directory> _getMissionImagesDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final missionDir = Directory(path.join(appDir.path, 'mission_images'));
    if (!await missionDir.exists()) {
      await missionDir.create(recursive: true);
    }
    return missionDir;
  }

  Future<void> _loadExistingImages() async {
    try {
      final missionDir = await _getMissionImagesDir();
      final List<FileSystemEntity> files = missionDir.listSync();
      
      final List<String> images = [];
      for (final file in files) {
        if (file is File && (file.path.endsWith('.jpg') || file.path.endsWith('.png') || file.path.endsWith('.webp'))) {
          images.add(file.path);
        }
      }
      
      // 파일 수정 시간 역순으로 정렬 (최신 사진이 위로)
      images.sort((a, b) => File(b).lastModifiedSync().compareTo(File(a).lastModifiedSync()));

      if (mounted) {
        setState(() {
          _existingImages = images;
        });
      }
    } catch (e) {
      debugPrint('Error loading existing images: $e');
    }
  }

  Future<void> _pickImage(int index, ImageSource source) async {
    // 권한 확인
    if (source == ImageSource.gallery) {
      PermissionStatus status;
      if (Platform.isAndroid) {
        status = await Permission.photos.request();
        if (status.isDenied || status.isPermanentlyDenied) {
          status = await Permission.storage.request();
        }
      } else {
        status = await Permission.photos.request();
      }

      if (!status.isGranted && !status.isLimited) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('사진 접근 권한이 필요합니다.')),
          );
        }
        return;
      }
    }

    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      String finalPath = image.path;
      
      // 카메라로 찍은 경우 전용 폴더로 복사하여 저장
      if (source == ImageSource.camera) {
        final missionDir = await _getMissionImagesDir();
        final fileName = 'mission_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final savedFile = await File(image.path).copy(path.join(missionDir.path, fileName));
        finalPath = savedFile.path;
        
        // 목록 갱신
        _loadExistingImages();
      }

      setState(() {
        _referenceImagePaths[index] = finalPath;
      });
    }
  }

  Future<void> _deleteSelectedImages() async {
    if (_selectedForDelete.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('이미지 삭제'),
        content: Text('${_selectedForDelete.length}개의 이미지를 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('삭제'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      for (final path in _selectedForDelete) {
        try {
          final file = File(path);
          if (await file.exists()) {
            await file.delete();
          }
          
          // 현재 선택된 경로에서도 제거
          for (int i = 0; i < _referenceImagePaths.length; i++) {
            if (_referenceImagePaths[i] == path) {
              setState(() {
                _referenceImagePaths[i] = null;
              });
            }
          }
        } catch (e) {
          debugPrint('Error deleting file $path: $e');
        }
      }
      
      setState(() {
        _selectedForDelete.clear();
        _isDeleteMode = false;
      });
      _loadExistingImages();
    }
  }

  void _showImagePickerOptions(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                return SingleChildScrollView(
                  controller: scrollController,
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          leading: const Icon(Icons.camera_alt, color: Colors.cyan),
                          title: Text(AppLocalizations.of(context)!.takePhoto, style: const TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(index, ImageSource.camera);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo_library, color: Colors.cyan),
                          title: const Text("기기에서 선택하기", style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(index, ImageSource.gallery);
                          },
                        ),
                        if (_existingImages.isNotEmpty) ...[
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "기존 촬영 이미지",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                if (_isDeleteMode)
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setSheetState(() {
                                            _isDeleteMode = false;
                                            _selectedForDelete.clear();
                                          });
                                        },
                                        child: const Text('취소'),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: _selectedForDelete.isEmpty
                                            ? null
                                            : () async {
                                                await _deleteSelectedImages();
                                                setSheetState(() {});
                                              },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                        ),
                                        child: Text('${_selectedForDelete.length}개 삭제'),
                                      ),
                                    ],
                                  )
                                else
                                  TextButton.icon(
                                    onPressed: () {
                                      setSheetState(() {
                                        _isDeleteMode = true;
                                      });
                                    },
                                    icon: const Icon(Icons.delete_outline, size: 18),
                                    label: const Text('편집'),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                                childAspectRatio: 1,
                              ),
                              itemCount: _existingImages.length,
                              itemBuilder: (context, imgIndex) {
                                final path = _existingImages[imgIndex];
                                final isSelected = _selectedForDelete.contains(path);
                                return GestureDetector(
                                  onTap: () {
                                    if (_isDeleteMode) {
                                      setSheetState(() {
                                        if (isSelected) {
                                          _selectedForDelete.remove(path);
                                        } else {
                                          _selectedForDelete.add(path);
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        _referenceImagePaths[index] = path;
                                      });
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: isSelected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[300]!),
                                            width: isSelected ? 2 : 1,
                                          ),
                                          image: DecorationImage(
                                            image: FileImage(File(path)),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      if (_isDeleteMode)
                                        Positioned(
                                          top: 2,
                                          right: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: isSelected ? Colors.cyan : Colors.black45,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 1.5),
                                            ),
                                            child: Icon(
                                              isSelected ? Icons.check : Icons.close,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _clearReferenceImageAt(int index) {
    setState(() {
      _referenceImagePaths[index] = null;
      for (int i = index + 1; i < _referenceImagePaths.length; i++) {
        _referenceImagePaths[i] = null;
      }
    });
  }

  Widget _buildCameraMissionImageSlots() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    Widget buildSlot(int index) {
      final path = _referenceImagePaths[index];
      return GestureDetector(
        onTap: () {
          if (index > 0 && _referenceImagePaths[index - 1] == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('미션 이미지를 순서대로 설정해주세요.')),
            );
            return;
          }
          _showImagePickerOptions(index);
        },
        onLongPress: path == null ? null : () => _clearReferenceImageAt(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black26 : Colors.grey[100],
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                image: path == null
                    ? null
                    : DecorationImage(
                        image: FileImage(File(path)),
                        fit: BoxFit.cover,
                      ),
              ),
              child: path == null
                  ? Icon(Icons.add_a_photo_outlined, color: isDarkMode ? Colors.white70 : Colors.grey[700])
                  : null,
            ),
            const SizedBox(height: 8),
            Text(
              '미션 ${index + 1}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildSlot(0),
            buildSlot(1),
            buildSlot(2),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '길게 눌러 삭제할 수 있어요.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white54 : Colors.grey[600],
          ),
        ),
      ],
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
                    Text(AppLocalizations.of(context)!.selectAlarmBackground, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        // 안내 메시지
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AppLocalizations.of(context)!.addAssetInstructions)),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.howToAdd, style: const TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Gallery Option
                      _buildSpecialOption(Icons.image, AppLocalizations.of(context)!.gallery, _pickBackground),
                      const SizedBox(width: 16),
                      
                      // Default Asset Option
                      _buildAssetOption('assets/images/alarm_bg.png', AppLocalizations.of(context)!.defaultLabel),
                      const SizedBox(width: 16),
                      
                      // Colors
                      _buildColorOption(const Color(0xFFFFD54F)), // Yellow
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

  Widget _buildAssetOption(String assetPath, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _backgroundPath = assetPath;
        });
      },
      child: Column(
        children: [
          Container(
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
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
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
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
          const SizedBox(height: 4),
          const Text('', style: TextStyle(fontSize: 10)), // 빈 텍스트로 높이 맞춤
        ],
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
      return AppLocalizations.of(context)!.ringingNow;
    }

    if (difference.inSeconds < 60) {
      return AppLocalizations.of(context)!.lessThanAMinuteRemaining;
    }

    // Round up to the nearest minute for display
    final totalMinutes = (difference.inSeconds / 60).ceil();
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours > 0) {
      return AppLocalizations.of(context)!.hoursMinutesRemaining(hours, minutes);
    } else {
      return AppLocalizations.of(context)!.minutesRemaining(minutes);
    }
  }

  Widget _buildSettingSection({required String title, required Widget child, Widget? trailing}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.4 : 0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
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
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                  letterSpacing: -0.5,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 16),
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
            AppLocalizations.of(context)!.wakeUpAlarm,
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
                  title: AppLocalizations.of(context)!.setTime,
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

                // 기상 미션
                _buildSettingSection(
                  title: AppLocalizations.of(context)!.wakeUpMission,
                  child: Column(
                    children: [
                      _buildMissionSelector(),
                      if (_isCameraMission) ...[
                        const SizedBox(height: 16),
                        _buildCameraMissionImageSlots(),
                      ],
                    ],
                  ),
                ),

                if (_selectedMission == MissionType.math) ...[
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.difficulty,
                    child: _buildMathDifficultySelector(),
                  ),
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.problemCount,
                    child: _buildMathProblemCountSelector(),
                  ),
                ],

                if (_selectedMission == MissionType.shake)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.shakeCount,
                    child: _buildShakeCountSelector(),
                  ),

                if (_selectedMission == MissionType.numberOrder)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.problemCount,
                    child: _buildMathProblemCountSelector(),
                  ),

                if (_selectedMission == MissionType.hiddenButton)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.difficulty,
                    child: _buildMathDifficultySelector(),
                  ),

                if (_selectedMission == MissionType.tapSprint)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.shakeCount,
                    child: _buildShakeCountSelector(),
                  ),

                if (_selectedMission == MissionType.leftRight)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.shakeCount,
                    child: _buildShakeCountSelector(),
                  ),

                if (_selectedMission == MissionType.walk)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.walkStepCount,
                    child: _buildWalkStepCountSelector(),
                  ),
                
                // 반복 요일
                _buildSettingSection(
                  title: AppLocalizations.of(context)!.repeatDays,
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
                      Text(
                        AppLocalizations.of(context)!.repeatDaily, 
                        style: TextStyle(
                          fontSize: 15, 
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  child: _buildDaySelector(),
                ),
                
                // Snooze Settings
                _buildSettingSection(
                  title: AppLocalizations.of(context)!.snoozeSettings,
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          initialValue: _snoozeInterval,
                          isExpanded: true,
                          dropdownColor: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
                          icon: Icon(Icons.keyboard_arrow_down_rounded, color: isDarkMode ? Colors.white70 : Colors.black87),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(left: 14, right: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.interval,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 1,
                                    height: 16,
                                    color: isDarkMode ? Colors.white10 : Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            filled: true,
                            fillColor: isDarkMode ? Colors.black26 : Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.cyan, width: 2),
                            ),
                            isDense: true,
                          ),
                          items: {0, 3, 5, 10, 30, _snoozeInterval}.map((e) => DropdownMenuItem(value: e, child: Text(e == 0 ? AppLocalizations.of(context)!.none : AppLocalizations.of(context)!.minutesLater(e), style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F), fontWeight: FontWeight.w600)))).toList()..sort((a, b) => a.value!.compareTo(b.value!)),
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          initialValue: _maxSnoozeCount,
                          isExpanded: true,
                          dropdownColor: isDarkMode ? const Color(0xFF2C2C2E) : Colors.white,
                          icon: Icon(Icons.keyboard_arrow_down_rounded, color: isDarkMode ? Colors.white70 : Colors.black87),
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(left: 14, right: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.countLabel,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 1,
                                    height: 16,
                                    color: isDarkMode ? Colors.white10 : Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                            filled: true,
                            fillColor: isDarkMode ? Colors.black26 : Colors.grey[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.cyan, width: 2),
                            ),
                            isDense: true,
                          ),
                          items: {0, 2, 3, 5, _maxSnoozeCount}.map((e) => DropdownMenuItem(value: e, child: Text(e == 0 ? AppLocalizations.of(context)!.none : AppLocalizations.of(context)!.timesCount(e), style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F), fontWeight: FontWeight.w600)))).toList()..sort((a, b) => a.value!.compareTo(b.value!)),
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
                      ),
                    ],
                  ),
                ),

                // 알람 소리 및 진동 통합 섹션
                _buildSettingSection(
                  title: "${AppLocalizations.of(context)!.alarmSound} & ${AppLocalizations.of(context)!.vibration}",
                  child: Column(
                    children: [
                      // 소리 설정 행
                      Row(
                        children: [
                          const Icon(Icons.music_note, size: 22, color: Colors.cyan),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: _isSoundEnabled ? _showRingtonePicker : null,
                              child: Opacity(
                                opacity: _isSoundEnabled ? 1.0 : 0.5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _getPayloadTitle(_ringtonePath, isRingtone: true),
                                        style: TextStyle(
                                          fontSize: 14, 
                                          fontWeight: FontWeight.w600,
                                          color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: _isSoundEnabled,
                              activeThumbColor: Colors.cyan,
                              onChanged: (val) => setState(() => _isSoundEnabled = val),
                            ),
                          ),
                        ],
                      ),
                      if (_isSoundEnabled) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.volume_down, size: 18, color: Colors.grey),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 6,
                                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                                ),
                                child: Slider(
                                  value: _volume,
                                  activeColor: Colors.cyan,
                                  inactiveColor: Colors.cyan.withOpacity(0.1),
                                  onChanged: (val) => setState(() => _volume = val),
                                  onChangeEnd: (val) => _playPreviewSound(_ringtonePath),
                                ),
                              ),
                            ),
                            const Icon(Icons.volume_up, size: 18, color: Colors.grey),
                          ],
                        ),
                      ],
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(height: 1, thickness: 0.5),
                      ),
                      // 진동 설정 행
                      Row(
                        children: [
                          const Icon(Icons.vibration, size: 22, color: Colors.cyan),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: _isVibrationEnabled ? _showVibrationPicker : null,
                              child: Opacity(
                                opacity: _isVibrationEnabled ? 1.0 : 0.5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _getPayloadTitle(_vibrationPattern, isRingtone: false),
                                        style: TextStyle(
                                          fontSize: 14, 
                                          fontWeight: FontWeight.w600,
                                          color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: _isVibrationEnabled,
                              activeThumbColor: Colors.cyan,
                              onChanged: (val) => setState(() => _isVibrationEnabled = val),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 레이블 및 배경화면
                _buildSettingSection(
                  title: AppLocalizations.of(context)!.alarmNameAndBackground,
                  child: Column(
                    children: [
                      TextField(
                        controller: _labelController,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                        ),
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.alarmName,
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                          ),
                          hintText: AppLocalizations.of(context)!.enterAlarmName,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: isDarkMode ? Colors.white24 : Colors.grey[400],
                          ),
                          filled: true,
                          fillColor: isDarkMode ? Colors.black26 : Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: isDarkMode ? Colors.white10 : Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.cyan, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: _showBackgroundPicker,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.black26 : Colors.grey[50],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isDarkMode ? Colors.white10 : Colors.grey[300]!,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.wallpaper, size: 22, color: Colors.cyan),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.selectAlarmBackground,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                                  ),
                                ),
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _backgroundPath == null 
                                      ? Colors.grey[200]
                                      : (_backgroundPath!.startsWith('color:') 
                                          ? Color(int.parse(_backgroundPath!.split(':')[1])) 
                                          : Colors.transparent),
                                  image: _backgroundPath != null && !_backgroundPath!.startsWith('color:') 
                                      ? (_backgroundPath!.startsWith('assets/')
                                          ? DecorationImage(image: AssetImage(_backgroundPath!), fit: BoxFit.cover)
                                          : DecorationImage(image: FileImage(File(_backgroundPath!)), fit: BoxFit.cover))
                                      : null,
                                  border: Border.all(color: Colors.white24, width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                            ],
                          ),
                        ),
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
                height: 58,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _saveAlarm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 4,
                    shadowColor: Colors.cyan.withOpacity(0.4),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                        )
                      : Text(
                          AppLocalizations.of(context)!.save, 
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: -0.5),
                        ),
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
    final l10n = AppLocalizations.of(context)!;
    final days = [
      l10n.daySun,
      l10n.dayMon,
      l10n.dayTue,
      l10n.dayWed,
      l10n.dayThu,
      l10n.dayFri,
      l10n.daySat,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final modelIndex = (index + 6) % 7;
        final isSelected = _repeatDays[modelIndex];
        return GestureDetector(
          onTap: () {
            setState(() {
              _repeatDays[modelIndex] = !isSelected;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.cyan : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey[50]),
              border: Border.all(
                color: isSelected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[300]!),
                width: 1.5,
              ),
              boxShadow: isSelected ? [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ] : null,
            ),
            child: Text(
              days[index],
              style: TextStyle(
                color: isSelected ? Colors.white : (isDarkMode ? Colors.grey[400] : const Color(0xFF1D1D1F)),
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
                fontSize: 14,
                letterSpacing: -0.5,
              ),
            ),
          ),
        );
      }),
    );
  }

  IconData _getMissionIcon(MissionType type) {
    switch (type) {
      case MissionType.math: return Icons.calculate_outlined;
      case MissionType.shake: return Icons.vibration;
      case MissionType.fortune: return Icons.auto_awesome_outlined;
      case MissionType.walk: return Icons.directions_walk;
      case MissionType.faceDetection: return Icons.face_retouching_natural;
      case MissionType.tapSprint: return Icons.touch_app;
      case MissionType.hiddenButton: return Icons.visibility;
      case MissionType.numberOrder: return Icons.filter_9_plus;
      case MissionType.leftRight: return Icons.bolt;
      case MissionType.none: return Icons.not_interested;
      default: return Icons.alarm;
    }
  }

  Widget _buildMissionSelector() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: _showMissionPicker,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black26 : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? Colors.white10 : Colors.grey[200]!,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.mission,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _getMissionTitle(_selectedMission),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.cyan[700],
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (!_isCameraMission)
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: _selectedMission == MissionType.fortuneCatch
                      ? ClipOval(
                          child: Image.asset(
                            'assets/icon/fortuni1_trans.webp',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.face, color: Colors.cyan, size: 18),
                          ),
                        )
                      : Icon(
                          _getMissionIcon(_selectedMission),
                          color: Colors.cyan,
                          size: 18,
                        ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMathDifficultySelector() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget buildItem(MathDifficulty value, String label, String detail) {
      final selected = _mathDifficulty == value;
      final bg = selected
          ? Colors.cyan.withOpacity(isDarkMode ? 0.25 : 0.14)
          : (isDarkMode ? Colors.black26 : Colors.grey[50]);
      final border = selected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[200]!);

      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _mathDifficulty = value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: selected ? Colors.cyan : (isDarkMode ? Colors.white : const Color(0xFF1D1D1F)),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDarkMode ? Colors.white70 : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildItem(MathDifficulty.easy, l10n.difficultyEasy, '3'),
        const SizedBox(width: 10),
        buildItem(MathDifficulty.normal, l10n.difficultyNormal, '4'),
        const SizedBox(width: 10),
        buildItem(MathDifficulty.hard, l10n.difficultyHard, '5'),
      ],
    );
  }

  Widget _buildMathProblemCountSelector() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget buildItem(int value, String label) {
      final selected = _mathProblemCount == value;
      final bg = selected
          ? Colors.cyan.withOpacity(isDarkMode ? 0.25 : 0.14)
          : (isDarkMode ? Colors.black26 : Colors.grey[50]);
      final border = selected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[200]!);

      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _mathProblemCount = value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: selected ? Colors.cyan : (isDarkMode ? Colors.white : const Color(0xFF1D1D1F)),
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildItem(3, l10n.problemsCount(3)),
        const SizedBox(width: 10),
        buildItem(5, l10n.problemsCount(5)),
        const SizedBox(width: 10),
        buildItem(7, l10n.problemsCount(7)),
      ],
    );
  }

  Widget _buildShakeCountSelector() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget buildItem(int value, String label) {
      final selected = _shakeCount == value;
      final bg = selected
          ? Colors.cyan.withOpacity(isDarkMode ? 0.25 : 0.14)
          : (isDarkMode ? Colors.black26 : Colors.grey[50]);
      final border = selected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[200]!);

      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _shakeCount = value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.vibration,
                  size: 20,
                  color: selected ? Colors.cyan : (isDarkMode ? Colors.white70 : Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: selected ? Colors.cyan : (isDarkMode ? Colors.white : const Color(0xFF1D1D1F)),
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildItem(20, l10n.shakeTimes(20)),
        const SizedBox(width: 10),
        buildItem(50, l10n.shakeTimes(50)),
        const SizedBox(width: 10),
        buildItem(100, l10n.shakeTimes(100)),
      ],
    );
  }

  Widget _buildWalkStepCountSelector() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget buildItem(int value, String label) {
      final selected = _walkStepCount == value;
      final bg = selected
          ? Colors.cyan.withOpacity(isDarkMode ? 0.25 : 0.14)
          : (isDarkMode ? Colors.black26 : Colors.grey[50]);
      final border = selected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[200]!);

      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _walkStepCount = value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.directions_walk,
                  size: 20,
                  color: selected ? Colors.cyan : (isDarkMode ? Colors.white70 : Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: selected ? Colors.cyan : (isDarkMode ? Colors.white : const Color(0xFF1D1D1F)),
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildItem(10, l10n.walkSteps(10)),
        const SizedBox(width: 10),
        buildItem(20, l10n.walkSteps(20)),
        const SizedBox(width: 10),
        buildItem(30, l10n.walkSteps(30)),
      ],
    );
  }

  void _showMissionPicker() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1C1C1E) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "알람 해제 미션을 선택해주세요.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMissionPickerItem(l10n.none, l10n.missionNoDescription, MissionType.none, Icons.alarm_off),
                  _buildMissionPickerItem(l10n.missionMath, l10n.missionMathDescription, MissionType.math, Icons.calculate),
                  _buildMissionPickerItem(l10n.missionShake, l10n.missionShakeDescription, MissionType.shake, Icons.vibration),
                  _buildMissionPickerItem(l10n.missionFortune, l10n.missionFortuneDescription, MissionType.fortune, Icons.auto_awesome),
                  _buildMissionPickerItem(l10n.faceReading, l10n.missionFaceDescription, MissionType.faceDetection, Icons.face_retouching_natural),
                  _buildMissionPickerItem(l10n.missionSnap, l10n.missionCameraDescription, MissionType.cameraOther, Icons.camera_alt),
                  _buildMissionPickerItem(l10n.missionFortuneCatch, l10n.missionFortuneCatchDescription, MissionType.fortuneCatch, Icons.face),
                  _buildMissionPickerItem(l10n.missionWalk, l10n.missionWalkDescription, MissionType.walk, Icons.directions_walk),
                  _buildMissionPickerItem(l10n.missionNumberOrder, l10n.missionNumberOrderDescription, MissionType.numberOrder, Icons.filter_9_plus),
                  _buildMissionPickerItem(l10n.missionHiddenButton, l10n.missionHiddenButtonDescription, MissionType.hiddenButton, Icons.visibility),
                  _buildMissionPickerItem(l10n.missionTapSprint, l10n.missionTapSprintDescriptionShort, MissionType.tapSprint, Icons.touch_app),
                  _buildMissionPickerItem(l10n.missionLeftRight, l10n.missionLeftRightDescriptionShort, MissionType.leftRight, Icons.bolt),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionPickerItem(String title, String description, MissionType type, IconData fallbackIcon) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool isSelected = false;
    if (type == MissionType.none) {
      isSelected = _selectedMission == MissionType.none;
    } else if (type == MissionType.cameraOther) {
      isSelected = [MissionType.cameraSink, MissionType.cameraRefrigerator, MissionType.cameraFace, MissionType.cameraOther, MissionType.cameraScale].contains(_selectedMission);
    } else {
      isSelected = _selectedMission == type;
    }

    // 미션별 아이콘 최적화 (컬러풀한 스타일)
    Widget missionIcon;
    
    switch (type) {
      case MissionType.none:
        missionIcon = Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.not_interested, color: Colors.blueGrey, size: 22),
        );
        break;
      case MissionType.math:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.calculate, color: Colors.white, size: 22),
        );
        break;
      case MissionType.walk:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.directions_walk, color: Colors.white, size: 22),
        );
        break;
      case MissionType.shake:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.vibration, color: Colors.white, size: 22),
        );
        break;
      case MissionType.fortune:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 22),
        );
        break;
      case MissionType.cameraOther:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.camera_alt, color: Colors.white, size: 22),
        );
        break;
      case MissionType.faceDetection:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.face_retouching_natural, color: Colors.white, size: 22),
        );
        break;
      case MissionType.fortuneCatch:
        missionIcon = Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber.withOpacity(0.3), width: 1),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/icon/fortuni1_trans.webp',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.face, color: Colors.amber, size: 24),
            ),
          ),
        );
        break;
      case MissionType.numberOrder:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.filter_9_plus, color: Colors.white, size: 22),
        );
        break;
      case MissionType.hiddenButton:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.visibility, color: Colors.white, size: 22),
        );
        break;
      case MissionType.tapSprint:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.touch_app, color: Colors.white, size: 22),
        );
        break;
      case MissionType.leftRight:
        missionIcon = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFC371), Color(0xFFFF5F6D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.bolt, color: Colors.white, size: 22),
        );
        break;
      default:
        missionIcon = Icon(fallbackIcon, color: isDarkMode ? Colors.white70 : Colors.black54, size: 24);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMission = type;
        });
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected 
              ? (isDarkMode ? Colors.cyan.withValues(alpha: 0.2) : Colors.cyan.withValues(alpha: 0.1))
              : (isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.grey[100]),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.cyan : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black26 : Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isDarkMode)
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Center(child: missionIcon),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.cyan, size: 20),
          ],
        ),
      ),
    );
  }

  String _getMissionTitle(MissionType type) {
    final l10n = AppLocalizations.of(context)!;
    switch (type) {
      case MissionType.none: return l10n.none;
      case MissionType.cameraSink:
      case MissionType.cameraRefrigerator:
      case MissionType.cameraFace:
      case MissionType.cameraScale:
      case MissionType.cameraOther: return l10n.missionSnap;
      case MissionType.math: return l10n.missionMath;
      case MissionType.walk: return l10n.missionWalk;
      case MissionType.fortune: return l10n.missionFortune;
      case MissionType.shake: return l10n.missionShake;
      case MissionType.fortuneCatch: return l10n.missionFortuneCatch;
      case MissionType.numberOrder: return l10n.missionNumberOrder;
      case MissionType.hiddenButton: return l10n.missionHiddenButton;
      case MissionType.tapSprint: return l10n.missionTapSprint;
      case MissionType.leftRight: return l10n.missionLeftRight;
      case MissionType.faceDetection: return l10n.faceReading;
      default: return l10n.mission;
    }
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

    // 7초 후 자동 정지
    Future.delayed(const Duration(seconds: 7), () {
      if (mounted) {
        _audioPlayer.stop();
        FlutterRingtonePlayer().stop();
      }
    });
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
        walkStepCount: _walkStepCount,
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
