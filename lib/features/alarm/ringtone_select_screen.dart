import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:path/path.dart' as path;

class RingtoneSelectScreen extends StatefulWidget {
  final String? initialRingtonePath;

  const RingtoneSelectScreen({
    super.key,
    this.initialRingtonePath,
  });

  @override
  State<RingtoneSelectScreen> createState() => _RingtoneSelectScreenState();
}

class _RingtoneSelectScreenState extends State<RingtoneSelectScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  // 카테고리별 벨소리 목록
  final Map<String, List<String>> _ringtonesByCategory = {
    'Standard': [],
    'Calm': [],
    'Upbeat': [],
    'Loud': [],
  };

  // 탭 라벨 (표시용)
  final Map<String, String> _categoryLabels = {
    'Standard': '기본음',
    'Calm': '차분한',
    'Upbeat': '활기찬',
    'Loud': '시끄러운',
  };

  String? _selectedPath;
  String? _playingPath;
  bool _isLoading = true;

  String _decodeAssetKey(String key) {
    try {
      return Uri.decodeFull(key);
    } catch (_) {
      return key;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedPath = widget.initialRingtonePath;
    _tabController = TabController(length: 4, vsync: this);
    _loadRingtones();
    
    // 초기 선택된 탭으로 이동
    if (_selectedPath != null && _selectedPath != 'default') {
      for (int i = 0; i < _ringtonesByCategory.keys.length; i++) {
        String category = _ringtonesByCategory.keys.elementAt(i);
        if (_selectedPath!.startsWith('$category/')) {
          _tabController.animateTo(i);
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadRingtones() async {
    try {
      for (final category in _ringtonesByCategory.keys) {
        _ringtonesByCategory[category]!.clear();
      }

      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final soundFiles = manifest
          .listAssets()
          .where(
            (key) =>
                key.replaceAll('\\', '/').startsWith('assets/sounds/') &&
                key.toLowerCase().endsWith('.ogg'),
          )
          .toList();

      for (String encodedFile in soundFiles) {
        final decoded = _decodeAssetKey(encodedFile);
        final normalized = decoded.replaceAll('\\', '/');
        final parts = normalized.split('/');
        String? matchedCategory;
        String? filename;

        if (parts.length >= 4) {
          final folderName = parts[2];
          filename = path.posix.basenameWithoutExtension(normalized);
          
          // ui_ 로 시작하는 효과음은 제외
          if (filename.startsWith('ui_')) continue;

          for (final key in _ringtonesByCategory.keys) {
            if (key.toLowerCase() == folderName.toLowerCase()) {
              matchedCategory = key;
              break;
            }
          }
        }

        if (matchedCategory != null && filename != null) {
          final entry = '$matchedCategory/$filename';
          if (!_ringtonesByCategory[matchedCategory]!.contains(entry)) {
            _ringtonesByCategory[matchedCategory]!.add(entry);
          }
        }
      }

      if (!_ringtonesByCategory['Standard']!.contains('default')) {
        _ringtonesByCategory['Standard']!.insert(0, 'default');
      }

      for (final category in _ringtonesByCategory.keys) {
        if (category == 'Standard') continue;
        _ringtonesByCategory[category]!.sort((a, b) => _getDisplayName(a).compareTo(_getDisplayName(b)));
      }

      final standard = _ringtonesByCategory['Standard']!;
      if (standard.length > 1) {
        final rest = standard.sublist(1)..sort((a, b) => _getDisplayName(a).compareTo(_getDisplayName(b)));
        standard
          ..removeRange(1, standard.length)
          ..addAll(rest);
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      if (!_ringtonesByCategory['Standard']!.contains('default')) {
        _ringtonesByCategory['Standard']!.insert(0, 'default');
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _getDisplayName(String path) {
    if (path == 'default') return '기본 벨소리';
    
    // "Category/filename" -> "filename"
    final filename = path.split('/').last;
    
    // 언더바를 공백으로 변환하고 첫 글자 대문자화 등 포맷팅
    return filename.replaceAll('_', ' ');
  }

  Future<void> _playPreview(String path) async {
    if (_playingPath == path) {
      await _stopPreview();
      return;
    }

    await _stopPreview();

    setState(() {
      _playingPath = path;
    });

    if (path == 'default') {
      await FlutterRingtonePlayer().playAlarm(looping: false);
    } else {
      try {
        // assets/sounds/Category/filename.ogg
        await _audioPlayer.setSource(AssetSource('sounds/$path.ogg'));
        await _audioPlayer.resume();
        
        // 재생 완료 시 상태 초기화
        _audioPlayer.onPlayerComplete.listen((event) {
          if (mounted) {
            setState(() {
              _playingPath = null;
            });
          }
        });
      } catch (e) {
        debugPrint('Error playing preview: $e');
        setState(() {
          _playingPath = null;
        });
      }
    }
  }

  Future<void> _stopPreview() async {
    await _audioPlayer.stop();
    await FlutterRingtonePlayer().stop();
    if (mounted) {
      setState(() {
        _playingPath = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Colors.cyan;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // 상단 핸들바 및 타이틀 영역
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '벨소리 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                // 닫기 버튼 (원형 배경)
                GestureDetector(
                  onTap: () {
                    _stopPreview();
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.black45 : Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: isDarkMode ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),

          // 탭 바
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDarkMode ? Colors.white10 : Colors.grey[200]!,
                  width: 1,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: primaryColor,
              unselectedLabelColor: isDarkMode ? Colors.grey : Colors.black54,
              indicatorColor: primaryColor,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              labelPadding: const EdgeInsets.symmetric(vertical: 8),
              tabs: _categoryLabels.entries.map((e) => Text(e.value)).toList(),
            ),
          ),

          // 벨소리 리스트
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(
                    controller: _tabController,
                    children: _categoryLabels.keys.map((category) {
                      final ringtones = _ringtonesByCategory[category] ?? [];
                      
                      if (ringtones.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.music_off, size: 48, color: isDarkMode ? Colors.white24 : Colors.grey[300]),
                              const SizedBox(height: 16),
                              Text(
                                '벨소리가 없습니다.',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.grey : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: ringtones.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          indent: 20,
                          endIndent: 20,
                          color: isDarkMode ? Colors.white10 : Colors.grey[100],
                        ),
                        itemBuilder: (context, index) {
                          final path = ringtones[index];
                          final isSelected = _selectedPath == path;
                          final isPlaying = _playingPath == path;

                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedPath = path;
                                });
                                _playPreview(path);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
                                child: Row(
                                  children: [
                                    // 재생/일시정지 아이콘
                                    GestureDetector(
                                      onTap: () {
                                        _playPreview(path);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: isPlaying ? primaryColor.withOpacity(0.1) : Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isPlaying ? primaryColor : (isDarkMode ? Colors.white24 : Colors.grey[300]!),
                                            width: 1.2,
                                          ),
                                        ),
                                        child: Icon(
                                          isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                                          color: isPlaying ? primaryColor : (isDarkMode ? Colors.grey : Colors.grey[600]),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    
                                    // 벨소리 이름
                                    Expanded(
                                      child: Text(
                                        _getDisplayName(path),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                          color: isSelected ? primaryColor : (isDarkMode ? Colors.white : const Color(0xFF1D1D1F)),
                                        ),
                                      ),
                                    ),

                                    // 선택 표시
                                    if (isSelected)
                                      Icon(Icons.check_circle, color: primaryColor, size: 24)
                                    else
                                      const SizedBox(width: 24),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
          ),
          
          // 하단 선택 완료 버튼
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    _stopPreview();
                    Navigator.pop(context, _selectedPath);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    '선택 완료',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
