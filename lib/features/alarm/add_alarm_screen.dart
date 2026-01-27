import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../core/constants/mission_type.dart';
import '../../data/models/alarm_model.dart';
import '../../data/models/math_difficulty.dart';
import '../../services/alarm_scheduler_service.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
import '../../widgets/ad_widgets.dart';
import 'ringtone_select_screen.dart';

final ValueNotifier<bool> _gridVideoPlaybackEnabled = ValueNotifier<bool>(true);

class AddAlarmScreen extends ConsumerStatefulWidget {
  final AlarmModel? alarm;

  const AddAlarmScreen({super.key, this.alarm});

  @override
  ConsumerState<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends ConsumerState<AddAlarmScreen> {
  bool _isSaving = false;
  bool _didHydrateFromHive = false;
  late DateTime _selectedTime;
  late MissionType _selectedMission;
  late TextEditingController _labelController;
  List<String?> _referenceImagePaths = [null, null, null];
  List<String> _existingImages = []; // 기존 촬영된 이미지 목록
  List<String> _userBackgroundImages = []; // 사용자 업로드 배경 이미지 목록
  List<int> _userColors = []; // 사용자 추가 단색 배경 목록
  List<Map<String, dynamic>> _animalAssets = [
    {'title': 'cat1', 'image': 'assets/images/animal/cat1.mp4', 'color': 0xFF000000},
    {'title': 'dog1', 'image': 'assets/images/animal/dog1.mp4', 'color': 0xFF000000},
    {'title': 'dog2', 'image': 'assets/images/animal/dog2.mp4', 'color': 0xFF000000},
    {'title': 'dog3', 'image': 'assets/images/animal/dog3.mp4', 'color': 0xFF000000},
    {'title': 'dog4', 'image': 'assets/images/animal/dog4.mp4', 'color': 0xFF000000},
  ];
  List<Map<String, dynamic>> _characterAssets = [
    {'title': 'default', 'image': 'assets/images/character/default.webp', 'color': 0xFFE0E0E0},
    {'title': 'all', 'image': 'assets/images/character/all.webp', 'color': 0xFFFFE0B2},
    {'title': 'dog', 'image': 'assets/images/character/dog.webp', 'color': 0xFFC8E6C9},
    {'title': 'panda', 'image': 'assets/images/character/panda.webp', 'color': 0xFFE1BEE7},
    {'title': 'rabbit', 'image': 'assets/images/character/rabbit.webp', 'color': 0xFFF8BBD0},
    {'title': 'tiger', 'image': 'assets/images/character/tiger.webp', 'color': 0xFFFFCCBC},
  ];
  List<Map<String, dynamic>> _illustrationAssets = [
    {'title': 'bear', 'image': 'assets/images/illustration/bear.webp', 'color': 0xFF1A237E},
    {'title': 'enjoy the little things', 'image': 'assets/images/illustration/enjoy the little things.webp', 'color': 0xFF1A237E},
    {'title': 'keepshining', 'image': 'assets/images/illustration/keepshining.webp', 'color': 0xFF1A237E},
    {'title': 'moon', 'image': 'assets/images/illustration/moon.webp', 'color': 0xFF1A237E},
    {'title': 'motji', 'image': 'assets/images/illustration/motji.webp', 'color': 0xFF1A237E},
  ];
  List<Map<String, dynamic>> _landscapeAssets = [
    {'title': 'sea1', 'image': 'assets/images/landscape/badaui-mul-e-amseog-ui-sujig-syas.webp', 'color': 0xFF90CAF9},
    {'title': 'bridge', 'image': 'assets/images/landscape/bridge.webp', 'color': 0xFF90CAF9},
    {'title': 'road', 'image': 'assets/images/landscape/road.webp', 'color': 0xFF90CAF9},
    {'title': 'sea2', 'image': 'assets/images/landscape/sea.webp', 'color': 0xFF90CAF9},
    {'title': 'sky', 'image': 'assets/images/landscape/sky.webp', 'color': 0xFF90CAF9},
  ]; 
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
  int _lastSnoozeInterval = 5;
  int _lastMaxSnoozeCount = 3;

  // Math Mission Settings
  late MathDifficulty _mathDifficulty;
  late int _mathProblemCount;

  // Shake Mission Settings
  late int _shakeCount;
  
  // Left Right Mission Settings
  late int _leftRightStreak;

  // Tap Sprint Mission Settings
  late int _tapSprintGoal;

  // Walk Mission Settings
  late int _walkStepCount;
  
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _playingPreviewPath;
  StateSetter? _ringtoneModalSetState;

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
      _maxSnoozeCount = widget.alarm!.maxSnoozeCount;
      if (_snoozeInterval > 0 && _maxSnoozeCount > 0) {
        _lastSnoozeInterval = _snoozeInterval;
        _lastMaxSnoozeCount = _maxSnoozeCount;
      }

      _mathDifficulty = widget.alarm!.mathDifficulty;
      _mathProblemCount = widget.alarm!.mathProblemCount;
      _shakeCount = widget.alarm!.shakeCount;
      _leftRightStreak = widget.alarm!.missionType == MissionType.leftRight ? widget.alarm!.shakeCount : 5;
      _tapSprintGoal = widget.alarm!.missionType == MissionType.tapSprint ? widget.alarm!.shakeCount : 20;
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
      _backgroundPath = 'assets/images/character/default.webp';
      _snoozeInterval = 5; // Default 5 min
      _maxSnoozeCount = 3; // Default 3 times
      _lastSnoozeInterval = _snoozeInterval;
      _lastMaxSnoozeCount = _maxSnoozeCount;

      _mathDifficulty = MathDifficulty.normal;
      _mathProblemCount = 3;
      _shakeCount = 20;
      _leftRightStreak = 5;
      _tapSprintGoal = 20;
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
    _loadUserBackgrounds();
    _loadUserColors();
    _loadCategoryAssets();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _hydrateFromHiveIfNeeded();
    });
    
    // 1초마다 남은 시간 업데이트
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _playingPreviewPath = null;
        });
        _ringtoneModalSetState?.call(() {});
      }
    });
  }

  void _syncTimeControllersToSelectedTime() {
    final hour24 = _selectedTime.hour;
    final isPm = hour24 >= 12;
    int hour12 = hour24 % 12;
    if (hour12 == 0) hour12 = 12;

    if (_ampmController.hasClients) {
      _ampmController.jumpToItem(isPm ? 1 : 0);
    }
    if (_hourController.hasClients) {
      _hourController.jumpToItem(hour12 - 1);
    }
    if (_minuteController.hasClients) {
      _minuteController.jumpToItem(_selectedTime.minute);
    }
  }

  Future<void> _hydrateFromHiveIfNeeded() async {
    if (_didHydrateFromHive) return;
    if (widget.alarm == null) return;
    _didHydrateFromHive = true;

    try {
      final alarmId = widget.alarm!.id;
      final box = await Hive.openBox<AlarmModel>('alarms');
      final stored = box.get(alarmId);
      if (stored == null) return;
      if (!mounted) return;

      setState(() {
        _selectedTime = stored.time;
        _selectedMission = stored.missionType;
        _labelController.text = stored.label;
        _repeatDays = List.from(stored.repeatDays);
        _isVibrationEnabled = stored.isVibrationEnabled;
        _isSoundEnabled = stored.isSoundEnabled;
        _volume = stored.volume;
        _ringtonePath = stored.ringtonePath ?? 'default';
        _vibrationPattern = stored.vibrationPattern ?? 'default';
        _isGradualVolume = stored.isGradualVolume;
        _backgroundPath = stored.backgroundPath;
        _snoozeInterval = stored.snoozeInterval;
        _maxSnoozeCount = stored.maxSnoozeCount;
        if (_snoozeInterval > 0 && _maxSnoozeCount > 0) {
          _lastSnoozeInterval = _snoozeInterval;
          _lastMaxSnoozeCount = _maxSnoozeCount;
        }
        _mathDifficulty = stored.mathDifficulty;
        _mathProblemCount = stored.mathProblemCount;
        _shakeCount = stored.shakeCount;
        _walkStepCount = stored.walkStepCount;
        if (_selectedMission == MissionType.leftRight) {
          _leftRightStreak = stored.shakeCount;
        }
        if (_selectedMission == MissionType.tapSprint) {
          _tapSprintGoal = stored.shakeCount;
        }
        if (stored.referenceImagePaths?.isNotEmpty == true) {
          _referenceImagePaths = [null, null, null];
          for (int i = 0; i < stored.referenceImagePaths!.length; i++) {
            if (i < 3) _referenceImagePaths[i] = stored.referenceImagePaths![i];
          }
        }
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _syncTimeControllersToSelectedTime();
      });
    } catch (_) {}
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

  /// 피커 컨트롤러의 현재 값을 _selectedTime 변수에 동기화합니다.
  void _updateSelectedTimeFromControllers() {
    if (!mounted) return;
    
    // 컨트롤러가 뷰에 연결되어 있는지 확인 (오류 방지)
    if (!_ampmController.hasClients || !_hourController.hasClients || !_minuteController.hasClients) {
      return;
    }
    
    final isPm = _ampmController.selectedItem == 1;
    int hour = _hourController.selectedItem + 1; // 1-12
    if (isPm && hour < 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;
    final minute = _minuteController.selectedItem;

    final now = DateTime.now();
    _selectedTime = DateTime(now.year, now.month, now.day, hour, minute);
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

  Future<Directory> _getBackgroundImagesDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final bgDir = Directory(path.join(appDir.path, 'background_images'));
    if (!await bgDir.exists()) {
      await bgDir.create(recursive: true);
    }
    return bgDir;
  }

  Future<void> _loadUserBackgrounds() async {
    try {
      final bgDir = await _getBackgroundImagesDir();
      if (!await bgDir.exists()) return;
      
      final List<FileSystemEntity> files = bgDir.listSync();
      final List<String> images = [];
      for (final file in files) {
        if (file is File && (file.path.endsWith('.jpg') || file.path.endsWith('.png') || file.path.endsWith('.webp') || file.path.endsWith('.jpeg'))) {
          images.add(file.path);
        }
      }
      
      images.sort((a, b) => File(b).lastModifiedSync().compareTo(File(a).lastModifiedSync()));

      if (mounted) {
        setState(() {
          _userBackgroundImages = images;
        });
      }
    } catch (e) {
      debugPrint('Error loading user backgrounds: $e');
    }
  }

  Future<void> _loadUserColors() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? colors = prefs.getStringList('user_bg_colors');
      if (colors != null && mounted) {
        setState(() {
          _userColors = colors.map((e) => int.parse(e)).toList();
        });
      }
    } catch (e) {
      debugPrint('Error loading user colors: $e');
    }
  }

  Future<void> _saveUserColors() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> colors = _userColors.map((e) => e.toString()).toList();
      await prefs.setStringList('user_bg_colors', colors);
    } catch (e) {
      debugPrint('Error saving user colors: $e');
    }
  }

  Future<void> _loadCategoryAssets() async {
    try {
      // Use rootBundle to avoid context issues and ensure access to the main bundle
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      
      // 디버깅: 매니페스트의 모든 키를 출력
      debugPrint('Loaded AssetManifest. Total keys: ${manifestMap.length}');
      
      final validExtensions = ['.mp4', '.webm', '.jpg', '.jpeg', '.png', '.webp'];

      bool isValidAsset(String key) {
        return validExtensions.any((ext) => key.toLowerCase().endsWith(ext));
      }

      String getTitle(String path) {
        final fileName = path.split('/').last;
        final nameWithoutExt = fileName.substring(0, fileName.lastIndexOf('.'));
        
        // Decode URI component just in case
        final decodedName = Uri.decodeFull(nameWithoutExt);

        final l10n = AppLocalizations.of(context)!;
        // 간단한 매핑 예시 (필요 시 확장 가능)
        if (decodedName == 'all') return l10n.bgFortuneFriends;
        if (decodedName == 'dog') return l10n.bgMongChuni;
        if (decodedName == 'panda') return l10n.bgPanChuni;
        if (decodedName == 'rabbit') return l10n.bgToChuni;
        if (decodedName == 'tiger') return l10n.bgHoChuni;
        if (decodedName == 'moon') return l10n.bgMoon;
        if (decodedName == 'bear') return l10n.bgBear;
        if (decodedName == 'motji') return 'Motji';
        if (decodedName == 'keepshining') return 'Keep Shining';
        if (decodedName == 'enjoy the little things') return 'Enjoy the little things';
        if (decodedName == 'badaui-mul-e-amseog-ui-sujig-syas') return l10n.bgSea;
        if (decodedName == 'cat1') return '${l10n.assetCat(1)}';
        if (decodedName == 'dog1') return '${l10n.assetDog(1)}';
        if (decodedName == 'dog2') return '${l10n.assetDog(2)}';
        if (decodedName == 'dog3') return '${l10n.assetDog(3)}';
        if (decodedName == 'puppy') return '${l10n.assetDog(4)}';
        if (decodedName == 'dog4') return '${l10n.assetDog(4)}';
        if (decodedName == 'bridge') return l10n.bgBridge;
        if (decodedName == 'road') return l10n.bgRoad;
        if (decodedName == 'sea') return '${l10n.assetSea(2)}';
        if (decodedName == 'sky') return l10n.bgSky;
        return decodedName;
      }

      // Helper to check if key belongs to a category folder
      // We use contains to be more robust against leading slashes or encoded paths
      bool isInFolder(String key, String folderName) {
        final decodedKey = Uri.decodeFull(key);
        // Check for specific folder path structure
        return decodedKey.contains('/$folderName/') || decodedKey.startsWith('assets/images/$folderName/');
      }

      final animalPaths = manifestMap.keys
          .where((key) => isInFolder(key, 'animal') && isValidAsset(key))
          .toList();

      final characterPaths = manifestMap.keys
          .where((key) => isInFolder(key, 'character') && isValidAsset(key))
          .toList();

      final illustrationPaths = manifestMap.keys
          .where((key) => isInFolder(key, 'illustration') && isValidAsset(key))
          .toList();

      final landscapePaths = manifestMap.keys
          .where((key) => isInFolder(key, 'landscape') && isValidAsset(key))
          .toList();

      debugPrint('Animal paths found: ${animalPaths.length}');
      debugPrint('Character paths found: ${characterPaths.length}');
      debugPrint('Illustration paths found: ${illustrationPaths.length}');
      debugPrint('Landscape paths found: ${landscapePaths.length}');

      // 2. 기본 배경을 맨 앞으로 정렬
      if (mounted) {
        setState(() {
          if (animalPaths.isNotEmpty) {
            _animalAssets = animalPaths.map((path) => {
              'title': getTitle(path),
              'image': path, 
              'color': 0xFF000000
            }).toList();
          }

          if (characterPaths.isNotEmpty) {
            // default.webp가 있으면 맨 앞으로, 나머지는 이름순 등
            final defaultIndex = characterPaths.indexWhere((p) => p.toLowerCase().endsWith('default.webp'));
            if (defaultIndex != -1) {
              final defaultPath = characterPaths.removeAt(defaultIndex);
              characterPaths.insert(0, defaultPath);
            }
            
            _characterAssets = characterPaths.map((path) {
               String title = getTitle(path);
               if (path.toLowerCase().endsWith('default.webp')) {
                 title = '기본 배경';
               }
               return {
                'title': title,
                'image': path,
                'color': 0xFF000000 // 기본값, 필요 시 수정
              };
            }).toList();
          }

          if (illustrationPaths.isNotEmpty) {
            _illustrationAssets = illustrationPaths.map((path) => {
              'title': getTitle(path),
              'image': path,
              'color': 0xFF000000
            }).toList();
          }

          if (landscapePaths.isNotEmpty) {
            _landscapeAssets = landscapePaths.map((path) => {
              'title': getTitle(path),
              'image': path,
              'color': 0xFF000000
            }).toList();
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading category assets: $e');
    }
  }

  String _getLocalizedTitle(BuildContext context, String title) {
    final l10n = AppLocalizations.of(context)!;

    // Handle "Cat X" or "Dog X" or "Sea X"
    final catRegExp = RegExp(r'고양이 (\d+)');
    final dogRegExp = RegExp(r'강아지 (\d+)');
    final seaRegExp = RegExp(r'바다 (\d+)');

    var match = catRegExp.firstMatch(title);
    if (match != null) {
      return l10n.assetCat(int.parse(match.group(1)!));
    }

    match = dogRegExp.firstMatch(title);
    if (match != null) {
      return l10n.assetDog(int.parse(match.group(1)!));
    }

    match = seaRegExp.firstMatch(title);
    if (match != null) {
      return l10n.assetSea(int.parse(match.group(1)!));
    }

    switch (title) {
      case '기본 배경':
        return l10n.assetDefaultBackground;
      case '포츄니친구들':
        return l10n.assetFortuneyFriends;
      case '몽츄니':
        return l10n.assetMongchuny;
      case '판츄니':
        return l10n.assetPanchuny;
      case '토춘이':
        return l10n.assetTochuny;
      case '호츄니':
        return l10n.assetHochuny;
      case '곰돌이':
        return l10n.assetBear;
      case '달':
        return l10n.assetMoon;
      case '다리':
        return l10n.assetBridge;
      case '도로':
        return l10n.assetRoad;
      case '하늘':
        return l10n.assetSky;
      case '바다':
        return l10n.assetSea(1);
      case '미니멀 그레이':
        return l10n.assetMinimalGray;
      case '다크 모드':
        return l10n.assetDarkMode;
      case '소프트 블루':
        return l10n.assetSoftBlue;
      case '웜 베이지':
        return l10n.assetWarmBeige;
      default:
        return title;
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
            SnackBar(content: Text(AppLocalizations.of(context)!.photoPermissionRequired)),
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
        title: Text(AppLocalizations.of(context)!.deleteImage),
        content: Text(AppLocalizations.of(context)!.deleteSelectedImagesConfirm(_selectedForDelete.length)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.delete),
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
                          title: Text(AppLocalizations.of(context)!.pickFromDevice, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                                Text(
                                  AppLocalizations.of(context)!.existingCapturedImages,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                                        child: Text(AppLocalizations.of(context)!.cancel),
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
                                        child: Text(AppLocalizations.of(context)!.deleteCount(_selectedForDelete.length)),
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
                                    label: Text(AppLocalizations.of(context)!.edit),
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
                                            image: ResizeImage(FileImage(File(path)), width: 200, height: 200),
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
              SnackBar(content: Text(AppLocalizations.of(context)!.cameraMissionSequentialImageError)),
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
              AppLocalizations.of(context)!.missionNumber(index + 1),
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
          AppLocalizations.of(context)!.longPressToDelete,
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
    final previousPlaybackEnabled = _gridVideoPlaybackEnabled.value;
    _gridVideoPlaybackEnabled.value = false;
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1440,
        maxHeight: 2560,
        imageQuality: 85,
      );
      if (image != null) {
        final bgDir = await _getBackgroundImagesDir();
        final fileName = 'bg_${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';
        final savedFile = await File(image.path).copy(path.join(bgDir.path, fileName));

        await _loadUserBackgrounds();

        if (!mounted) return;
        setState(() {
          _backgroundPath = savedFile.path;
        });
      }
    } finally {
      _gridVideoPlaybackEnabled.value = previousPlaybackEnabled;
    }
  }

  Future<void> _deleteUserBackground(String filePath, {VoidCallback? onDeleted}) async {
     try {
       final file = File(filePath);
       if (await file.exists()) {
         await file.delete();
       }

       if (_backgroundPath == filePath) {
        setState(() {
          _backgroundPath = 'assets/images/character/default.webp';
        });
      }
       
       await _loadUserBackgrounds();
       
       if (onDeleted != null) {
         onDeleted();
       }
       
       if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(AppLocalizations.of(context)!.backgroundDeleted)),
           );
         }
     } catch (e) {
       debugPrint('Error deleting user background: $e');
     }
   }

  void _showBackgroundPicker() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // 2. 기본 배경이 이미 _characterAssets에 포함되어 있으므로 별도 추가 로직 제거
    // final defaultBg = {'title': '기본 배경', 'image': 'assets/images/character/default.webp', 'color': 0xFFE0E0E0};
    // final characterAssetsCombined = [defaultBg, ..._characterAssets];
    
    // 하지만 _loadCategoryAssets에서 기본 배경이 정렬되지 않을 수 있으므로, 
    // 로드된 리스트에서 'default.webp'를 찾아 맨 앞으로 보내는 로직이 필요할 수 있음.
    // 여기서는 간단히 _characterAssets를 그대로 사용.
    // _loadCategoryAssets에서 default.webp 처리를 보강하는 것이 좋음.

    final l10n = AppLocalizations.of(context)!;
    final Map<String, List<Map<String, dynamic>>> categories = {
      l10n.categoryCharacter: _characterAssets,
      l10n.categoryAnimal: _animalAssets,
      l10n.categoryIllustration: _illustrationAssets,
      l10n.categoryLandscape: _landscapeAssets,
      l10n.categorySimple: [
        {'title': '미니멀 그레이', 'image': 'color:0xFFF5F5F5', 'color': 0xFFF5F5F5},
        {'title': '다크 모드', 'image': 'color:0xFF212121', 'color': 0xFF212121},
        {'title': '소프트 블루', 'image': 'color:0xFFE3F2FD', 'color': 0xFFE3F2FD},
        {'title': '웜 베이지', 'image': 'color:0xFFF5F5DC', 'color': 0xFFF5F5DC},
      ],
    };

    final tabKeys = [
      l10n.categoryCharacter,
      l10n.categoryAnimal,
      l10n.categoryIllustration,
      l10n.categoryLandscape,
      l10n.categorySimple
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DefaultTabController(
              length: tabKeys.length,
              child: DraggableScrollableSheet(
                initialChildSize: 0.85,
                minChildSize: 0.5,
                maxChildSize: 0.95,
                builder: (_, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        // 핸들바
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white24 : Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // 헤더 (제목 + 액션 버튼)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                l10n.alarmBackground,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Row(
                            children: [
                              _buildHeaderActionButton(
                                icon: Icons.shuffle_rounded,
                                label: l10n.random,
                                onTap: () {
                                  _showBackgroundPreview('random_background', setSheetState);
                                },
                              ),
                              const SizedBox(width: 12),
                              _buildHeaderActionButton(
                                icon: Icons.photo_library_rounded,
                                label: l10n.gallery,
                                onTap: () async {
                                  await _pickBackground();
                                  if (_backgroundPath != null) {
                                    _showBackgroundPreview(_backgroundPath!, setSheetState);
                                  }
                                },
                              ),
                            ],
                          ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // 탭바
                        TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                          labelColor: isDarkMode ? Colors.white : Colors.black,
                          unselectedLabelColor: isDarkMode ? Colors.white38 : Colors.grey,
                          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                          indicatorColor: isDarkMode ? Colors.white : Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          dividerColor: Colors.transparent,
                          tabs: tabKeys.map((key) => Tab(text: key)).toList(),
                        ),
                        const SizedBox(height: 16),

                        // 그리드 뷰
                        Expanded(
                          child: TabBarView(
                            children: tabKeys.map((key) {
                              return _buildImageGrid(
                                category: key,
                                items: categories[key]!,
                                scrollController: scrollController,
                                isDarkMode: isDarkMode,
                                setSheetState: setSheetState,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeaderActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white10 : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: isDarkMode ? Colors.white : Colors.black87),
      ),
    );
  }

  Widget _buildImageGrid({
    required String category,
    required List<Map<String, dynamic>> items,
    required ScrollController scrollController,
    required bool isDarkMode,
    StateSetter? setSheetState,
  }) {
    final l10n = AppLocalizations.of(context)!;
    final isSimple = category == l10n.categorySimple;
    final userColorsCount = isSimple ? _userColors.length : 0;
    // 심플: 1(피커) + 사용자 컬러 + 기본 아이템
    // 기타: 기본 아이템
    final itemCount = isSimple ? (1 + userColorsCount + items.length) : items.length;

    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      cacheExtent: 0,
      addAutomaticKeepAlives: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.56,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        // 심플 카테고리의 첫 번째 아이템은 컬러 피커
        if (isSimple && index == 0) {
          return GestureDetector(
            onTap: () async {
              await _showColorPicker();
              if (setSheetState != null) {
                setSheetState(() {});
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white10 : Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDarkMode ? Colors.white10 : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.color_lens_rounded, color: Colors.purple, size: 28),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.selectSolidColor,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // 사용자 추가 단색 처리 (심플 카테고리인 경우)
        if (isSimple && index > 0 && index <= userColorsCount) {
          final colorValue = _userColors[index - 1];
          final color = Color(colorValue);
          final bgPath = 'color:$colorValue';
          final isSelected = _backgroundPath == bgPath;

          return GestureDetector(
            onTap: () {
              _showBackgroundPreview(bgPath, setSheetState);
            },
            onLongPress: () async {
              // 삭제 확인 다이얼로그
              final result = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(l10n.deleteColor),
                  content: Text(l10n.deleteColorConfirm),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(l10n.cancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(l10n.delete, style: const TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );

              if (result == true) {
                setState(() {
                  _userColors.removeAt(index - 1);
                  if (_backgroundPath == bgPath) {
                    _backgroundPath = 'assets/images/character/default.webp'; // 기본값으로 리셋
                  }
                });
                await _saveUserColors();
                if (setSheetState != null) {
                  setSheetState(() {});
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
                border: isSelected ? Border.all(color: Colors.cyan, width: 3) : Border.all(color: Colors.black12, width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          );
        }

        // 기본 아이템 처리
        final itemIndex = isSimple ? (index - 1 - userColorsCount) : index;
        final item = items[itemIndex];
        final isSelected = _backgroundPath == item['image'];
        
        final title = _getLocalizedTitle(context, item['title'] as String);
        final isDefaultBg = item['title'] == '기본 배경';
        // isSimple is already defined in outer scope, removing shadowed variable
        // final isSimple = category == '심플'; 
        // 기본 배경과 심플(색상)만 이름 표시, 나머지는 숨김
        final showLabel = isSimple || isDefaultBg; 
        
        final imagePath = item['image'].toString();
        final isVideo = imagePath.toLowerCase().endsWith('.mp4') || imagePath.toLowerCase().endsWith('.webm');

        return GestureDetector(
          onTap: () {
            _showBackgroundPreview(item['image'] as String, setSheetState);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // 라운드 증가
              color: Color(item['color'] as int),
              // border를 BoxDecoration에서 제거하고 Stack 상단에 배치하여 모서리 짤림 방지
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (isVideo)
                  VideoThumbnailWidget(
                    key: ValueKey(imagePath),
                    videoPath: imagePath,
                    autoplay: true,
                    loopDuration: const Duration(seconds: 4),
                    initDelay: Duration(milliseconds: 120 * (index % 6)),
                  )
                else if (imagePath.startsWith('assets/'))
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    cacheWidth: 300, // Optimize memory usage for thumbnails
                  ),

                if (showLabel)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                if (showLabel)
                  Positioned(
                    bottom: 12,
                    left: 10,
                    right: 10,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),

                // 선택 테두리를 가장 상단에 배치하여 모서리 부분까지 완벽하게 표시
                if (isSelected)
                  IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.cyan, width: 3),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }


  void _showBackgroundPreview(String bgPath, StateSetter? setSheetState) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final isRandom = bgPath == 'random_background';
    final lower = bgPath.toLowerCase();
    final isVideo = lower.endsWith('.mp4') || lower.endsWith('.webm');

    if (isVideo) _gridVideoPlaybackEnabled.value = false;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.black,
      builder: (context) {
        final safePadding = MediaQuery.of(context).padding;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: VideoPreviewWidget(
            bgPath: bgPath,
            child: Stack(
              children: [
                // 상단 그라데이션 (상단바 가독성 확보)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 160,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                
                // 랜덤 배경일 때 안내 텍스트
              if (isRandom)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shuffle_rounded, color: Colors.white54, size: 80),
                        const SizedBox(height: 16),
                        Text(
                          l10n.randomBackgroundDesc,
                          style: const TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                
              // 상단 닫기 버튼
              Positioned(
                top: safePadding.top + 8,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              
              // 시간 및 날짜 (알람 화면 스타일)
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: safePadding.top + 60),
                    Text(
                      DateFormat(l10n.dateFormatMdyE, Localizations.localeOf(context).toString()).format(now),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black54)],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${now.hour}:${now.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black54)],
                      ),
                    ),
                    
                    const Spacer(flex: 2),
                    
                    // 선택 완료 버튼
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 16, 30, 24 + safePadding.bottom),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _backgroundPath = bgPath;
                            });
                            // 미리보기 닫기
                            Navigator.pop(context);
                            // 배경 선택 시트 닫기
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF3B30),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black45,
                          ),
                          child: Text(
                            l10n.selectionComplete,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        );
      },
    ).whenComplete(() {
      if (isVideo) _gridVideoPlaybackEnabled.value = true;
    });
  }

  void _showSnoozePicker() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool isIntervalExpanded = false;
    bool isCountExpanded = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            Widget buildOption(String label, int value, int currentValue, Function(int) onChanged) {
              final isSelected = value == currentValue;
              return InkWell(
                onTap: () => onChanged(value),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 21,
                        height: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.cyan : (isDarkMode ? Colors.white24 : Colors.grey[400]!),
                            width: 1.5,
                          ),
                          color: isSelected ? Colors.cyan : Colors.transparent,
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 6.5,
                                  height: 6.5,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected 
                              ? (isDarkMode ? Colors.white : Colors.black)
                              : (isDarkMode ? Colors.white70 : Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            Widget buildSection({
              required String title,
              required String currentValueText,
              required List<Widget> children,
              required bool isExpanded,
              required VoidCallback onToggle,
            }) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF1C1C1E) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isDarkMode ? [] : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
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
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          currentValueText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ...children,
                    const SizedBox(height: 2),
                    const Divider(height: 1, thickness: 0.5),
                    const SizedBox(height: 6),
                    InkWell(
                      onTap: onToggle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isExpanded ? l10n.collapseOptions : l10n.expandOptions,
                            style: TextStyle(
                              fontSize: 13.5,
                              color: isDarkMode ? Colors.white38 : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 19,
                            color: isDarkMode ? Colors.white38 : Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            void updateSnooze(int interval, int count) {
              setModalState(() {
                setState(() {
                  _snoozeInterval = interval;
                  _maxSnoozeCount = count;
                  if (_snoozeInterval > 0 && _maxSnoozeCount > 0) {
                    _lastSnoozeInterval = _snoozeInterval;
                    _lastMaxSnoozeCount = _maxSnoozeCount;
                  }
                });
              });
            }

            final List<int> allIntervals = [1, 5, 10, 15, 20, 25, 30];
            final List<int> visibleIntervals = isIntervalExpanded 
                ? allIntervals 
                : allIntervals.where((i) => [1, 5, 10].contains(i) || i == _snoozeInterval).toSet().toList()..sort();

            final List<int> allCounts = [999, 1, 2, 3, 5, 10];
            final List<int> visibleCounts = isCountExpanded 
                ? allCounts 
                : [999, 3, 5, if (![999, 3, 5].contains(_maxSnoozeCount)) _maxSnoozeCount]..sort((a, b) {
                    if (a == 999) return -1;
                    if (b == 999) return 1;
                    return a.compareTo(b);
                  });

            return DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder: (_, scrollController) {
                final isSnoozeEnabled = _snoozeInterval > 0 && _maxSnoozeCount > 0;

                return Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF000000) : const Color(0xFFF2F2F7),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white24 : Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                            child: Column(
                              children: [
                                // 마스터 토글 섹션
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isDarkMode ? const Color(0xFF1C1C1E) : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        l10n.snoozeAlarm,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: isDarkMode ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: isSnoozeEnabled,
                                        activeColor: Colors.cyan,
                                        onChanged: (val) {
                                          if (val) {
                                            updateSnooze(_lastSnoozeInterval, _lastMaxSnoozeCount);
                                          } else {
                                            updateSnooze(0, 0);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                
                                // 간격 및 횟수 섹션 (토글 상태에 따라 불투명도 조절)
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity: isSnoozeEnabled ? 1.0 : 0.5,
                                  child: IgnorePointer(
                                    ignoring: !isSnoozeEnabled,
                                    child: Column(
                                      children: [
                                        buildSection(
                                          title: l10n.interval,
                                          currentValueText: _snoozeInterval == 0 
                                              ? AppLocalizations.of(context)!.none 
                                              : AppLocalizations.of(context)!.minutesLater(_snoozeInterval),
                                          isExpanded: isIntervalExpanded,
                                          onToggle: () => setModalState(() => isIntervalExpanded = !isIntervalExpanded),
                                          children: visibleIntervals.map((min) => buildOption(
                                            AppLocalizations.of(context)!.minutesLater(min),
                                            min,
                                            _snoozeInterval,
                                            (val) => updateSnooze(val, _maxSnoozeCount),
                                          )).toList(),
                                        ),
                                        const SizedBox(height: 8),
                                        buildSection(
                                          title: l10n.maxSnoozeCount,
                                          currentValueText: _maxSnoozeCount == 0 
                                              ? AppLocalizations.of(context)!.none 
                                              : (_maxSnoozeCount == 999 ? l10n.unlimited : AppLocalizations.of(context)!.timesCount(_maxSnoozeCount)),
                                          isExpanded: isCountExpanded,
                                          onToggle: () => setModalState(() => isCountExpanded = !isCountExpanded),
                                          children: visibleCounts.map((count) => buildOption(
                                            count == 999 ? l10n.unlimited : AppLocalizations.of(context)!.timesCount(count),
                                            count,
                                            _maxSnoozeCount,
                                            (val) => updateSnooze(_snoozeInterval, val),
                                          )).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

  Future<void> _showColorPicker() async {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Color> colors = [
      const Color(0xFFFFD54F), // Yellow
      const Color(0xFFFFB347), // Orange
      const Color(0xFFFFC1CC), // Pastel Pink
      const Color(0xFF77DD77), // Pastel Green
      const Color(0xFFB39EB5), // Pastel Purple
      const Color(0xFFAEC6CF), // Pastel Blue
      Colors.grey,
      Colors.white,
      Colors.black,
    ];

    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(AppLocalizations.of(context)!.selectSolidColor, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      final color = colors[index];
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            // 현재 선택된 색상으로 배경 설정
                            _backgroundPath = 'color:${color.value}';
                            
                            // 사용자 색상 목록에 추가 (중복 방지)
                            if (!_userColors.contains(color.value)) {
                              _userColors.insert(0, color.value);
                            } else {
                              // 이미 있으면 맨 앞으로 이동
                              _userColors.remove(color.value);
                              _userColors.insert(0, color.value);
                            }
                          });
                          
                          // 저장
                          await _saveUserColors();
                          
                          if (mounted) Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isDarkMode ? Colors.white24 : Colors.grey[300]!,
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpecialOption(IconData icon, String label, VoidCallback onTap) {
    final l10n = AppLocalizations.of(context)!;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.grey[700], size: label == l10n.random ? 20 : 24),
                if (label == l10n.random)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
              ],
            ),
          ),
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
              border: Border.all(
                color: _backgroundPath == assetPath ? Colors.cyan : Colors.transparent,
                width: 2,
              ),
              image: DecorationImage(
                image: ResizeImage(AssetImage(assetPath), width: 200, height: 200),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserFileOption(String filePath, {VoidCallback? onDeleted}) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _backgroundPath = filePath;
                });
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ResizeImage(FileImage(File(filePath)), width: 200, height: 200),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: _backgroundPath == filePath ? Colors.cyan : Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => _deleteUserBackground(filePath, onDeleted: onDeleted),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMathDifficultySelector(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(height: 1, thickness: 0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            AppLocalizations.of(context)!.problemCount,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        _buildMathProblemCountSelector(),
                      ],
                    ),
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
                    title: AppLocalizations.of(context)!.countLabel,
                    child: _buildTapSprintCountSelector(),
                  ),

                if (_selectedMission == MissionType.leftRight)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.problemCount,
                    child: _buildLeftRightCountSelector(),
                  ),

                if (_selectedMission == MissionType.walk)
                  _buildSettingSection(
                    title: AppLocalizations.of(context)!.walkStepCount,
                    child: _buildWalkStepCountSelector(),
                  ),
                
                // 반복 및 스누즈 설정 통합
                _buildSettingSection(
                  title: AppLocalizations.of(context)!.repeatDays,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
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
                          fontSize: 14, 
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDaySelector(),
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
                              onChanged: (val) {
                                setState(() => _isSoundEnabled = val);
                              },
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
                                  onChanged: (val) {
                                    setState(() => _volume = val);
                                  },
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
                              onChanged: (val) {
                                setState(() => _isVibrationEnabled = val);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 레이블 및 배경화면
                _buildSettingSection(
            title: AppLocalizations.of(context)!.customStyle,
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(height: 1, thickness: 0.5),
                      ),
                      InkWell(
                        onTap: _showBackgroundPicker,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              const Icon(Icons.wallpaper, size: 22, color: Colors.cyan),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.selectAlarmBackground,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                                  ),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: 80,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: (_backgroundPath == null || _backgroundPath == 'random_background')
                                      ? (isDarkMode ? Colors.white10 : Colors.grey[200])
                                      : (_backgroundPath!.startsWith('color:') ? Color(int.parse(_backgroundPath!.split(':')[1])) : Colors.transparent),
                                  image: (_backgroundPath != null && !_backgroundPath!.startsWith('color:') && _backgroundPath != 'random_background' && !(_backgroundPath!.toLowerCase().endsWith('.mp4') || _backgroundPath!.toLowerCase().endsWith('.webm')))
                                      ? (_backgroundPath!.startsWith('assets/')
                                          ? DecorationImage(image: ResizeImage(AssetImage(_backgroundPath!), width: 300, height: 500), fit: BoxFit.cover)
                                          : DecorationImage(image: ResizeImage(FileImage(File(_backgroundPath!)), width: 300, height: 500), fit: BoxFit.cover))
                                      : null,
                                  border: Border.all(
                                    color: isDarkMode ? Colors.white24 : Colors.grey[400]!,
                                    width: 1.5,
                                  ),
                                ),
                                child: _backgroundPath == 'random_background'
                                    ? Icon(Icons.shuffle, size: 24, color: isDarkMode ? Colors.white70 : Colors.grey[600])
                                    : (_backgroundPath != null && (_backgroundPath!.toLowerCase().endsWith('.mp4') || _backgroundPath!.toLowerCase().endsWith('.webm')))
                                        ? VideoThumbnailWidget(videoPath: _backgroundPath!, fit: BoxFit.cover)
                                        : (_backgroundPath == null)
                                            ? Icon(Icons.wallpaper, size: 24, color: isDarkMode ? Colors.white30 : Colors.grey[400])
                                            : null,
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(height: 1, thickness: 0.5),
                      ),
                      InkWell(
                        onTap: _showSnoozePicker,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              const Icon(Icons.access_time_rounded, size: 22, color: Colors.cyan),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.alarmSnooze,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isDarkMode ? Colors.white : const Color(0xFF1D1D1F),
                                  ),
                                ),
                              ),
                              Text(
                                (_snoozeInterval > 0 && _maxSnoozeCount > 0)
                                  ? (_maxSnoozeCount == 999 
                                        ? AppLocalizations.of(context)!.snoozeInfoUnlimited(_snoozeInterval)
                                        : AppLocalizations.of(context)!.snoozeInfo(_snoozeInterval, _maxSnoozeCount))
                                    : AppLocalizations.of(context)!.none,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: isDarkMode ? Colors.white70 : Colors.black54,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const DetailedAdWidget(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                ),
                const SizedBox(height: 24), // Bottom padding
              ],
            ),
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
    
    const double itemExtent = 45.0;
    
    return SizedBox(
      height: 150,
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
                  children: [
                        Center(child: Text('☀️ ${AppLocalizations.of(context)!.am}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                        Center(child: Text('🌙 ${AppLocalizations.of(context)!.pm}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
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
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
              
              // Colon separator
              const SizedBox(
                width: 20,
                child: Center(
                child: Text(":", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.1)),
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
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                color: isSelected 
                    ? Colors.white 
                    : (index == 0 
                        ? Colors.redAccent.withOpacity(isDarkMode ? 0.7 : 0.9) // 일요일
                        : (index == 6 
                            ? Colors.blueAccent.withOpacity(isDarkMode ? 0.7 : 0.9) // 토요일
                            : (isDarkMode ? Colors.grey[400] : const Color(0xFF1D1D1F)))),
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
      case MissionType.leftRight: return Icons.compare_arrows;
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
          onTap: () {
            setState(() => _mathDifficulty = value);
          },
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
                "$label($detail)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: selected ? Colors.cyan : (isDarkMode ? Colors.white : const Color(0xFF1D1D1F)),
                  letterSpacing: -0.5,
                ),
              ),
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
          onTap: () {
            setState(() => _mathProblemCount = value);
          },
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

  Widget _buildLeftRightCountSelector() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget buildItem(int value, String label) {
      final selected = _leftRightStreak == value;
      final bg = selected
          ? Colors.cyan.withOpacity(isDarkMode ? 0.25 : 0.14)
          : (isDarkMode ? Colors.black26 : Colors.grey[50]);
      final border = selected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[200]!);

      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _leftRightStreak = value),
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
                  Icons.compare_arrows,
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
        buildItem(5, l10n.shakeTimes(5)),
        const SizedBox(width: 10),
        buildItem(10, l10n.shakeTimes(10)),
        const SizedBox(width: 10),
        buildItem(15, l10n.shakeTimes(15)),
      ],
    );
  }

  Widget _buildTapSprintCountSelector() {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget buildItem(int value, String label) {
      final selected = _tapSprintGoal == value;
      final bg = selected
          ? Colors.cyan.withOpacity(isDarkMode ? 0.25 : 0.14)
          : (isDarkMode ? Colors.black26 : Colors.grey[50]);
      final border = selected ? Colors.cyan : (isDarkMode ? Colors.white10 : Colors.grey[200]!);

      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _tapSprintGoal = value),
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
                  Icons.touch_app,
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
        buildItem(20, l10n.tapTimes(20)),
        const SizedBox(width: 10),
        buildItem(50, l10n.tapTimes(50)),
        const SizedBox(width: 10),
        buildItem(100, l10n.tapTimes(100)),
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
      builder: (context) => SafeArea(
        child: Container(
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
                  AppLocalizations.of(context)!.selectMissionTitle,
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
                    _buildMissionPickerItem(l10n.missionFortuneCatch, l10n.missionFortuneCatchDescription, MissionType.fortuneCatch, Icons.face),
                    _buildMissionPickerItem(l10n.missionFortune, l10n.missionFortuneDescription, MissionType.fortune, Icons.auto_awesome),
                    _buildMissionPickerItem(l10n.missionFaceReading, l10n.missionFaceDescription, MissionType.faceDetection, Icons.face_retouching_natural),
                    _buildMissionPickerItem(l10n.missionSnap, l10n.missionCameraDescription, MissionType.cameraOther, Icons.camera_alt),
                    _buildMissionPickerItem(l10n.missionWalk, l10n.missionWalkDescription, MissionType.walk, Icons.directions_walk),
                    _buildMissionPickerItem(l10n.missionShake, l10n.missionShakeDescription, MissionType.shake, Icons.vibration),
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
          child: const Icon(Icons.compare_arrows, color: Colors.white, size: 22),
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
      case MissionType.faceDetection: return l10n.missionFaceReading;
      default: return l10n.mission;
    }
  }

  String _getPayloadTitle(String key, {required bool isRingtone}) {
    final l10n = AppLocalizations.of(context)!;
    if (isRingtone) {
      switch (key) {
        case 'default': return l10n.defaultRingtone;
        case 'alarm_sound': return l10n.classicAlarm;
        case 'morning': return l10n.digitalAlarm;
        case 'birds': return l10n.birdsSound;
        case 'waves': return l10n.wavesSound;
        case 'cuckoo_cuckoo_clock': return l10n.cuckooClock;
        case 'discreet': return l10n.calmAlarm;
        case 'door_knock': return l10n.doorKnock;
        case 'early_sunrise': return l10n.earlySunrise;
        case 'good_morning': return l10n.goodMorningSound;
        case 'in_a_hurry': return l10n.inAHurry;
        case 'loving_you': return l10n.lovingYou;
        case 'siren_air_raid': return l10n.sirenSound;
        case 'swinging': return l10n.swingingSound;
        case 'telephone_busy_signal': return l10n.telephoneBusy;
      }

      if (key.contains('/')) {
        final filename = key.split('/').last;
        return filename.replaceAll('_', ' ');
      }
      
      return l10n.defaultRingtone;
    } else {
      switch (key) {
        case 'default': return l10n.defaultVibration;
        case 'short': return l10n.shortVibration;
        case 'long': return l10n.longVibration;
        case 'heartbeat': return l10n.heartbeatVibration;
        case 'sos': return l10n.sosVibration;
        case 'quick': return l10n.quickVibration;
        default: return l10n.defaultVibration;
      }
    }
  }

  void _playPreviewSound(String path) async {
    // 이미 같은 소리가 재생 중이면 중지
    if (_playingPreviewPath == path) {
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      setState(() {
        _playingPreviewPath = null;
      });
      _ringtoneModalSetState?.call(() {});
      return;
    }

    await _audioPlayer.stop();
    await FlutterRingtonePlayer().stop();
    
    setState(() {
      _playingPreviewPath = path;
    });
    _ringtoneModalSetState?.call(() {});
    
    if (path == 'default') {
      FlutterRingtonePlayer().playAlarm(volume: _volume, looping: false);
      // FlutterRingtonePlayer는 완료 이벤트를 제공하지 않으므로 타이머 사용 (기본 벨소리만)
      _previewTimer?.cancel();
      _previewTimer = Timer(const Duration(seconds: 5), () {
        if (mounted && _playingPreviewPath == 'default') {
          setState(() {
            _playingPreviewPath = null;
          });
          _ringtoneModalSetState?.call(() {});
        }
      });
    } else {
      String ext = 'ogg';
      try {
        await _audioPlayer.setSource(AssetSource('sounds/$path.$ext'));
        await _audioPlayer.setVolume(_volume);
        await _audioPlayer.resume();
      } catch (e) {
        debugPrint('Error playing preview: $e');
        setState(() {
          _playingPreviewPath = null;
        });
        _ringtoneModalSetState?.call(() {});
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

  void _showRingtonePicker() async {
    final selectedPath = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: RingtoneSelectScreen(
          initialRingtonePath: _ringtonePath,
        ),
      ),
    );

    if (selectedPath != null && mounted) {
      setState(() {
        _ringtonePath = selectedPath;
      });
    }
  }

  void _showVibrationPicker() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(l10n.selectVibration, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  _buildPickerItem(l10n.defaultVibration, 'default', false, setModalState),
                  _buildPickerItem(l10n.shortVibration, 'short', false, setModalState),
                  _buildPickerItem(l10n.longVibration, 'long', false, setModalState),
                  _buildPickerItem(l10n.heartbeatVibration, 'heartbeat', false, setModalState),
                  _buildPickerItem(l10n.sosVibration, 'sos', false, setModalState),
                  _buildPickerItem(l10n.quickVibration, 'quick', false, setModalState),
                ],
              );
            },
          ),
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
    final isPlaying = _playingPreviewPath == value;

    return ListTile(
      title: Text(title, style: TextStyle(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? Colors.cyan : (isDarkMode ? Colors.white : Colors.black87),
      )),
      trailing: isRingtone ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected) const Icon(Icons.check, color: Colors.cyan),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
              color: isPlaying ? Colors.cyan : Colors.grey,
              size: 28,
            ),
            onPressed: () {
              _playPreviewSound(value);
            },
          ),
        ],
      ) : (isSelected ? const Icon(Icons.check, color: Colors.cyan) : null),
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
          // 선택 시에도 재생되도록 유지 (단, 이미 재생 중이면 다시 재생하지 않음)
          if (!isPlaying) {
            _playPreviewSound(value);
          }
        } else {
          _playPreviewVibration(value);
        }
      },
    );
  }

  Future<void> _saveAlarm() async {
    final l10n = AppLocalizations.of(context)!;
    // 권한 확인 (알람 스케줄링)
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.isDenied) {
        await _showPermissionDialog(l10n.permissionRequired, l10n.exactAlarmPermissionDesc);
        if (await Permission.scheduleExactAlarm.isDenied) return;
      }
      
      if (await Permission.ignoreBatteryOptimizations.isDenied) {
        await _showPermissionDialog(l10n.permissionRequired, l10n.batteryOptimizationPermissionDesc);
        if (await Permission.ignoreBatteryOptimizations.isDenied) return;
      }

      if (await Permission.systemAlertWindow.isDenied) {
        await _showPermissionDialog(l10n.permissionRequired, l10n.overlayPermissionDesc);
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
            SnackBar(content: Text(l10n.cameraMissionFirstImageError)),
          );
          return;
       }
       // 중간에 빈 이미지가 있으면 안됨 (순서대로 채워야 함)
       if (_referenceImagePaths[0] != null && _referenceImagePaths[2] != null && _referenceImagePaths[1] == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.cameraMissionSequentialImageError)),
          );
          return;
       }
    }

    setState(() => _isSaving = true);

    try {
      _updateSelectedTimeFromControllers();
      debugPrint('[AddAlarmScreen] Saving alarm. ringtonePath=$_ringtonePath, vibrationPattern=$_vibrationPattern');
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

      int finalShakeCount = _shakeCount;
      if (_selectedMission == MissionType.leftRight) {
        finalShakeCount = _leftRightStreak;
      } else if (_selectedMission == MissionType.tapSprint) {
        finalShakeCount = _tapSprintGoal;
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
        shakeCount: finalShakeCount,
        walkStepCount: _walkStepCount,
      );
      
      debugPrint('[AddAlarmScreen] Created alarm model: ID=${alarm.id}, Ringtone=${alarm.ringtonePath}');


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
            await _showPermissionDialog(l10n.permissionRequired, l10n.exactAlarmFailMessage);
          } else if (isIgnoreBatteryOptimizationsDenied) {
            if (!mounted) return;
            await _showPermissionDialog(l10n.permissionRequired, l10n.batteryOptimFailMessage);
          } else if (isSystemAlertWindowDenied) {
            if (!mounted) return;
            await _showPermissionDialog(l10n.permissionRequired, l10n.overlayFailMessage);
          } else {
            // 모든 권한이 허용되었는데도 실패한 경우 (예외 상황)
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.alarmSaveError),
                action: SnackBarAction(
                  label: AppLocalizations.of(context)!.openSettings,
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
                content: Text(AppLocalizations.of(context)!.alarmSaveError),
                action: SnackBarAction(
                  label: AppLocalizations.of(context)!.openSettings,
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
          SnackBar(content: Text(AppLocalizations.of(context)!.errorOccurred(e.toString()))),
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
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text(AppLocalizations.of(context)!.openSettings),
          ),
        ],
      ),
    );
  }
}

class VideoThumbnailWidget extends StatefulWidget {
  final String videoPath;
  final BoxFit fit;
  final bool autoplay;
  final Duration? loopDuration;
  final Duration initDelay;

  const VideoThumbnailWidget({
    super.key,
    required this.videoPath,
    this.fit = BoxFit.cover,
    this.autoplay = false,
    this.loopDuration,
    this.initDelay = const Duration(milliseconds: 200),
  });

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  Object? _error;
  Timer? _debounceTimer;
  bool _isInitializing = false;
  bool _isLoopSeeking = false;

  @override
  void initState() {
    super.initState();
    _gridVideoPlaybackEnabled.addListener(_handlePlaybackToggle);
    if (_gridVideoPlaybackEnabled.value) {
      _scheduleInitialization();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_gridVideoPlaybackEnabled.value && _controller == null && _error == null) {
      _scheduleInitialization();
    }
  }

  void _scheduleInitialization() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.initDelay, () {
      if (mounted) _initializeVideo();
    });
  }

  @override
  void didUpdateWidget(VideoThumbnailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath ||
        oldWidget.autoplay != widget.autoplay ||
        oldWidget.loopDuration != widget.loopDuration ||
        oldWidget.initDelay != widget.initDelay ||
        oldWidget.fit != widget.fit) {
      _disposeController(shouldSetState: true);
      if (_gridVideoPlaybackEnabled.value) {
        _scheduleInitialization();
      }
    }
  }

  void _handlePlaybackToggle() {
    if (!_gridVideoPlaybackEnabled.value) {
      _disposeController(shouldSetState: true);
      return;
    }

    if (_controller == null) {
      _scheduleInitialization();
    }
  }

  void _disposeController({required bool shouldSetState}) {
    _debounceTimer?.cancel();
    final controller = _controller;
    if (controller == null) {
      _isInitializing = false;
      _error = null;
      _isLoopSeeking = false;
      if (shouldSetState && mounted) setState(() {});
      return;
    }

    _controller = null;
    _isInitialized = false;
    _error = null;
    _isInitializing = false;
    _isLoopSeeking = false;
    if (shouldSetState && mounted) setState(() {});

    controller.removeListener(_handleLoop);
    controller.pause();
    controller.dispose();
  }

  void _handleLoop() {
    final controller = _controller;
    final loopDuration = widget.loopDuration;
    if (controller == null || loopDuration == null || !widget.autoplay) return;
    final value = controller.value;
    if (!value.isInitialized) return;
    if (_isLoopSeeking) return;
    if (value.position >= loopDuration) {
      _isLoopSeeking = true;
      controller.seekTo(Duration.zero).whenComplete(() {
        _isLoopSeeking = false;
      });
    }
  }

  Future<void> _initializeVideo() async {
    try {
      if (!TickerMode.of(context)) return;
      if (_isInitializing) return;
      _isInitializing = true;
      _error = null;
      _isInitialized = false;
      if (mounted) setState(() {});

      final videoOptions = VideoPlayerOptions(mixWithOthers: true);

      final controller = widget.videoPath.startsWith('assets/')
          ? VideoPlayerController.asset(
              widget.videoPath,
              videoPlayerOptions: videoOptions,
            )
          : VideoPlayerController.file(
              File(widget.videoPath),
              videoPlayerOptions: videoOptions,
            );

      _controller = controller;

      await controller.initialize().timeout(const Duration(seconds: 30));
      
      debugPrint('Video initialized successfully: ${widget.videoPath}');

      if (!mounted || !_gridVideoPlaybackEnabled.value || _controller != controller) {
        if (_controller == controller) {
          _controller = null;
        }
        controller.removeListener(_handleLoop);
        controller.pause();
        controller.dispose();
        _isInitializing = false;
        return;
      }

      await controller.setVolume(0);
      await controller.seekTo(Duration.zero);
      controller.removeListener(_handleLoop);
      _isLoopSeeking = false;

      if (widget.autoplay) {
        await controller.setLooping(widget.loopDuration == null);
        if (widget.loopDuration != null) {
          controller.addListener(_handleLoop);
        }
        await controller.play();
      } else {
        await controller.setLooping(false);
        await controller.pause();
      }

      if (mounted && _controller == controller) {
        setState(() {
          _isInitialized = true;
          _isInitializing = false;
        });
      }
    } catch (e, st) {
      final controller = _controller;
      _controller = null;
      _isInitialized = false;
      _error = e;
      _isInitializing = false;
      debugPrint('Error loading video thumbnail: $e\n$st');
      if (mounted) setState(() {});
      controller?.removeListener(_handleLoop);
      controller?.pause();
      controller?.dispose();
    }
  }

  @override
  void deactivate() {
    if (!TickerMode.of(context)) {
      _disposeController(shouldSetState: false);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _gridVideoPlaybackEnabled.removeListener(_handlePlaybackToggle);
    _debounceTimer?.cancel();
    _disposeController(shouldSetState: false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_isInitialized && _controller != null) {
      return SizedBox.expand(
        child: FittedBox(
          fit: widget.fit,
          child: SizedBox(
            width: _controller!.value.size.width,
            height: _controller!.value.size.height,
            child: VideoPlayer(_controller!),
          ),
        ),
      );
    }

    if (!_gridVideoPlaybackEnabled.value) {
      return Container(
        color: Colors.black87,
      );
    }

    if (_error != null) {
      final message = _error is TimeoutException ? l10n.loadingDelay : '${l10n.previewFail}\n${_error.toString().split(':').last.trim()}';
      return GestureDetector(
        onTap: () {
          if (_gridVideoPlaybackEnabled.value) {
            _initializeVideo();
          }
        },
        child: Container(
          color: Colors.black87,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.videocam_off_rounded, color: Colors.white24, size: 22),
              const SizedBox(height: 6),
              Text(
                message, 
                style: const TextStyle(color: Colors.white24, fontSize: 10),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: Colors.black87,
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white24),
      ),
    );
  }
}

class VideoPreviewWidget extends StatefulWidget {
  final String bgPath;
  final Widget child;

  const VideoPreviewWidget({
    super.key, 
    required this.bgPath,
    required this.child,
  });

  @override
  State<VideoPreviewWidget> createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  VideoPlayerController? _controller;
  Object? _error;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    final path = widget.bgPath.toLowerCase();
    if (path.endsWith('.mp4') || path.endsWith('.webm')) {
      
      final videoOptions = VideoPlayerOptions(mixWithOthers: true);

      final old = _controller;
      _controller = null;
      old?.dispose();

      if (widget.bgPath.startsWith('assets/')) {
        _controller = VideoPlayerController.asset(widget.bgPath, videoPlayerOptions: videoOptions);
      } else {
        _controller = VideoPlayerController.file(File(widget.bgPath), videoPlayerOptions: videoOptions);
      }
      
      try {
        _error = null;
        _isLoading = true;
        if (mounted) setState(() {});

        await _controller!.initialize().timeout(const Duration(seconds: 20));
        await _controller!.setVolume(0);
        _controller!.setLooping(true);
        _controller!.play();
        _isLoading = false;
        if (mounted) setState(() {});
      } catch (e, st) {
        _error = e;
        _isLoading = false;
        final controller = _controller;
        _controller = null;
        controller?.dispose();
        debugPrint('Error initializing video preview: $e\n$st');
        if (mounted) setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final path = widget.bgPath.toLowerCase();
    final isVideo = path.endsWith('.mp4') || path.endsWith('.webm');

    if (_controller != null && _controller!.value.isInitialized) {
      return Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller!.value.size.width,
              height: _controller!.value.size.height,
              child: VideoPlayer(_controller!),
            ),
          ),
          widget.child,
        ],
      );
    }

    if (isVideo) {
      if (_error != null) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Colors.black),
            Center(
              child: GestureDetector(
                onTap: _initializeVideo,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.videocam_off_rounded, color: Colors.white54, size: 32),
                    const SizedBox(height: 8),
                    Text(AppLocalizations.of(context)!.videoLoadFailed, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white54, fontSize: 13)),
                  ],
                ),
              ),
            ),
            widget.child,
          ],
        );
      }

      if (_isLoading) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Colors.black),
            const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white24)),
            widget.child,
          ],
        );
      }
    }
    
    // Fallback for non-video or loading
    final isColor = widget.bgPath.startsWith('color:');
    final isRandom = widget.bgPath == 'random_background';
    final size = MediaQuery.sizeOf(context);
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final targetWidth = (size.width * dpr).round().clamp(1, 4096);
    final targetHeight = (size.height * dpr).round().clamp(1, 4096);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: isColor
          ? BoxDecoration(color: Color(int.parse(widget.bgPath.split(':')[1])))
          : isRandom
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2C3E50), Color(0xFF000000)],
                  ),
                )
              : BoxDecoration(
                  image: DecorationImage(
                    image: widget.bgPath.startsWith('assets/')
                        ? ResizeImage(AssetImage(widget.bgPath), width: targetWidth, height: targetHeight)
                        : ResizeImage(FileImage(File(widget.bgPath)), width: targetWidth, height: targetHeight),
                    fit: BoxFit.cover,
                  ),
                ),
      child: widget.child,
    );
  }
}
