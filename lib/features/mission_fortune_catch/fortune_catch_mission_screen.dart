import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../mission/widgets/mission_success_overlay.dart';

class FortuneCatchMissionScreen extends ConsumerStatefulWidget {
  final String alarmId;

  const FortuneCatchMissionScreen({super.key, required this.alarmId});

  @override
  ConsumerState<FortuneCatchMissionScreen> createState() => _FortuneCatchMissionScreenState();
}

class _FortuneCatchMissionScreenState extends ConsumerState<FortuneCatchMissionScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  int _score = 0;
  int _catchCount = 0;
  int _combo = 0;
  DateTime? _lastCatchTime;
  DateTime? _gameStartTime;
  int? _bestTimeSeconds;
  bool _isNewRecord = false;
  Timer? _gameTimer;
  int _elapsedSeconds = 0;
  
  final Random _random = Random();
  late final Random _layoutRandom;
  final AudioPlayer _sfxPlayer = AudioPlayer();
  Timer? _sfxStopTimer;
  bool? _hasVibrator;
  static const List<_SpawnSpec> _spawnPool = [
    _SpawnSpec(assetPath: 'assets/icon/fortuni1_trans.webp', points: 25, isFake: false, weight: 35),
    _SpawnSpec(assetPath: 'assets/icon/fortuni4_joyful_trans.webp', points: 35, isFake: false, weight: 10),
    _SpawnSpec(assetPath: 'assets/icon/fortuni5_shame_trans.webp', points: 25, isFake: false, weight: 10),
    _SpawnSpec(assetPath: 'assets/icon/rabit.webp', points: 0, isFake: false, weight: 9),
    _SpawnSpec(assetPath: 'assets/icon/panda.webp', points: 0, isFake: false, weight: 9),
    _SpawnSpec(assetPath: 'assets/icon/dog.webp', points: 0, isFake: false, weight: 9),
    _SpawnSpec(assetPath: 'assets/icon/fortuni6_angry2_trans.webp', points: -10, isFake: true, weight: 9),
    _SpawnSpec(assetPath: 'assets/icon/tiger.webp', points: 0, isFake: false, weight: 9),
  ];
  // Map hole index to character
  final Map<int, FortuneCharacter> _activeHoles = {};
  Timer? _spawnTimer;
  Timer? _inactivityTimer;
  
  bool _isGameOver = false;
  bool _isSuccess = false;
  final int _targetScore = 100;
  final int _minCatches = 5;
  
  late AnimationController _comboController;
  late Animation<double> _comboScale;

  late AnimationController _feedbackController;
  late Animation<double> _feedbackScale;
  String? _feedbackText;
  Color _feedbackColor = Colors.white;
  int _feedbackToken = 0;

  Size? _holeLayoutSize;
  List<_HoleLayout>? _holeLayouts;
  
  // Grid settings
  final int _gridRows = 3;
  final int _gridCols = 3;
  
  _CharacterCategory? _lastCategory;
  int _consecutiveCategoryCount = 0;
  
  @override
  void initState() {
    super.initState();

    // 미션 진입 시 알람 진동이 남아있을 수 있으므로 명시적으로 정지
    Vibration.cancel();
    
    WidgetsBinding.instance.addObserver(this);

    _layoutRandom = Random(DateTime.now().millisecondsSinceEpoch);
    _initDeviceFeedback();
    _loadBestRecord();
    _comboController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _comboScale = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _comboController, curve: Curves.elasticOut),
    );

    _feedbackController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _feedbackScale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _feedbackController, curve: Curves.easeOutBack),
    );
    
    _gameStartTime = DateTime.now();
    _startGame();
    _startInactivityTimer();
    _startGameTimer();
  }

  Future<void> _loadBestRecord() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final lastResetStr = prefs.getString('fortune_catch_last_reset');
    
    // Reset every 1st of the month
    if (lastResetStr == null || 
        DateTime.parse(lastResetStr).month != now.month || 
        DateTime.parse(lastResetStr).year != now.year) {
      await prefs.remove('fortune_catch_best_time');
      await prefs.setString('fortune_catch_last_reset', now.toIso8601String());
    }

    setState(() {
      _bestTimeSeconds = prefs.getInt('fortune_catch_best_time');
    });
  }

  void _startGameTimer() {
    _gameTimer?.cancel();
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isGameOver && mounted) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  Future<void> _initDeviceFeedback() async {
    _hasVibrator = await Vibration.hasVibrator();
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () async {
      if (mounted) {
        HapticFeedback.heavyImpact();
        if (_hasVibrator == true) {
          Vibration.vibrate(pattern: [0, 70, 60, 70]);
        }
        await _playSfx('sounds/ui_success.ogg', volume: 0.22, maxDuration: const Duration(milliseconds: 420));
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  final Map<int, AnimationController> _hitControllers = {};

  void _playHitEffect(int index) {
    if (_hitControllers.containsKey(index)) {
      _hitControllers[index]!.forward(from: 0);
    } else {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
      );
      _hitControllers[index] = controller;
      controller.forward();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 앱이 백그라운드로 가면(홈버튼 등) 미션 실패로 간주하고 알람 다시 울림
      if (mounted) {
        Navigator.of(context).pop('timeout');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    for (final c in _hitControllers.values) {
      c.dispose();
    }
    _spawnTimer?.cancel();
    _inactivityTimer?.cancel();
    _gameTimer?.cancel();
    _comboController.dispose();
    _feedbackController.dispose();
    _sfxStopTimer?.cancel();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _playSfx(String assetPath, {required double volume, Duration? maxDuration}) async {
    try {
      _sfxStopTimer?.cancel();
      await _sfxPlayer.stop();
      await _sfxPlayer.setReleaseMode(ReleaseMode.stop);
      await _sfxPlayer.play(AssetSource(assetPath), volume: volume);

      if (maxDuration != null) {
        _sfxStopTimer = Timer(maxDuration, () {
          _sfxPlayer.stop();
        });
      }
    } catch (_) {}
  }

  void _showFeedback(String text, Color color) {
    final token = ++_feedbackToken;
    setState(() {
      _feedbackText = text;
      _feedbackColor = color;
    });
    _feedbackController.forward(from: 0);
    Timer(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      if (_feedbackToken != token) return;
      setState(() {
        _feedbackText = null;
      });
    });
  }

  void _ensureHoleLayouts(Size size) {
    if (_holeLayoutSize == size && _holeLayouts != null) return;
    _holeLayoutSize = size;
    final layouts = <_HoleLayout>[];
    
    // Perspective field inset ratio (matches _FieldClipper)
    const topInsetRatio = 0.10;
    
    for (int i = 0; i < _gridRows * _gridCols; i++) {
      final row = i ~/ _gridCols;
      final col = i % _gridCols;
      final rowT = _gridRows == 1 ? 0.0 : row / (_gridRows - 1);
      
      final baseY = 0.22 + (rowT * 0.60);
      
      // Calculate valid horizontal bounds at this Y level based on perspective
      // At top (y=0), bounds are [0.10, 0.90]
      // At bottom (y=1), bounds are [0.0, 1.0]
      final currentInset = topInsetRatio * (1.0 - baseY);
      final validMinX = currentInset + 0.08; // Add padding for hole width
      final validMaxX = (1.0 - currentInset) - 0.08;
      
      final widthFactor = validMaxX - validMinX;
      
      // Distribute columns within the valid width
      final colT = _gridCols == 1 ? 0.5 : col / (_gridCols - 1);
      final baseX = validMinX + (colT * widthFactor);

      final jitterX = (_layoutRandom.nextDouble() - 0.5) * 0.04;
      final jitterY = (_layoutRandom.nextDouble() - 0.5) * 0.02;
      
      final x = (baseX + jitterX).clamp(validMinX, validMaxX);
      final y = (baseY + jitterY).clamp(0.15, 0.90); 
      
      final scale = 0.75 + (0.25 * rowT); 
      layouts.add(_HoleLayout(x: x, y: y, scale: scale));
    }
    _holeLayouts = layouts;
  }

  void _startGame() {
    _scheduleNextSpawn();
  }

  void _scheduleNextSpawn() {
    if (_isGameOver || !mounted) return;
    
    // Random delay between spawns: 200ms to 800ms (Previously 400ms to 1200ms)
    final delay = Duration(milliseconds: 200 + _random.nextInt(600));
    
    _spawnTimer = Timer(delay, () {
      if (!_isGameOver && mounted) {
        _spawnCharacter();
        _scheduleNextSpawn();
      }
    });
  }

  _SpawnSpec _pickSpawnSpec() {
    // Determine the category of each spec for filtering
    _CharacterCategory getCat(_SpawnSpec s) {
      if (s.isFake) return _CharacterCategory.bad;
      if (s.points > 0) return _CharacterCategory.good;
      return _CharacterCategory.neutral;
    }

    // Filter the pool if we've reached the consecutive limit
    List<_SpawnSpec> availablePool = _spawnPool;
    if (_consecutiveCategoryCount >= 2 && _lastCategory != null) {
      final filtered = _spawnPool.where((s) => getCat(s) != _lastCategory).toList();
      if (filtered.isNotEmpty) {
        availablePool = filtered;
      }
    }

    int totalWeight = 0;
    for (final s in availablePool) {
      totalWeight += s.weight;
    }
    
    int roll = _random.nextInt(totalWeight);
    _SpawnSpec selected = availablePool.first;
    for (final s in availablePool) {
      roll -= s.weight;
      if (roll < 0) {
        selected = s;
        break;
      }
    }

    // Update tracking
    final selectedCat = getCat(selected);
    if (selectedCat == _lastCategory) {
      _consecutiveCategoryCount++;
    } else {
      _lastCategory = selectedCat;
      _consecutiveCategoryCount = 1;
    }

    return selected;
  }

  void _spawnCharacter() {
    if (_activeHoles.isNotEmpty) return; // Only one character at a time as requested
    
    // Find empty holes
    final List<int> emptyHoles = [];
    for (int i = 0; i < _gridRows * _gridCols; i++) {
      if (!_activeHoles.containsKey(i)) {
        emptyHoles.add(i);
      }
    }
    
    if (emptyHoles.isEmpty) return;
    
    final holeIndex = emptyHoles[_random.nextInt(emptyHoles.length)];
    final spec = _pickSpawnSpec();
    
    final char = FortuneCharacter(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      holeIndex: holeIndex,
      assetPath: spec.assetPath,
      isFake: spec.isFake,
      points: spec.points,
      spawnTime: DateTime.now(),
      // Duration: 600ms to 1200ms (Previously 1000ms to 1600ms)
      duration: Duration(milliseconds: 600 + _random.nextInt(600)),
    );

    setState(() {
      _activeHoles[holeIndex] = char;
    });

    // 캐릭터 등장 피드백
    try {
      HapticFeedback.selectionClick();
    } catch (_) {}

    // Auto remove after duration
    Timer(char.duration, () {
      if (mounted && _activeHoles[holeIndex]?.id == char.id) {
        setState(() {
          _activeHoles.remove(holeIndex);
        });
      }
    });
  }

  void _onTapCharacter(int holeIndex) {
    if (_isGameOver) return;
    final char = _activeHoles[holeIndex];
    if (char == null) return;
    
    _resetInactivityTimer();
    bool shouldFinish = false;

    // Trigger hit effect
    _playHitEffect(holeIndex);

    setState(() {
      _activeHoles.remove(holeIndex);
      
      if (char.isFake) {
        // Angry Fortune: Reduce score, reset combo
        _score = max(0, _score + char.points);
        _combo = 0;
        _lastCatchTime = null;
      } else {
        // Normal character (Fortune or Animal)
        
        if (char.points > 0) {
          // It's a Fortune!
          _catchCount++;
          
          final now = DateTime.now();
          if (_lastCatchTime != null && now.difference(_lastCatchTime!) < const Duration(milliseconds: 1000)) {
            _combo++;
            _comboController.forward(from: 0);
          } else {
            _combo = 1;
          }
          _lastCatchTime = now;

          int bonus = (_combo > 1) ? (_combo * 5) : 0;
          _score += char.points + bonus;
        } else {
          // It's a 0-point animal
          _combo = 0;
          _lastCatchTime = null;
        }
      }

      // Mission completion check
      if (_score >= _targetScore && _catchCount >= _minCatches) {
        _isGameOver = true;
        shouldFinish = true;
      }
    });

    if (shouldFinish) {
      _finishMission();
      return;
    }

    if (char.isFake && char.points < 0) {
      HapticFeedback.vibrate(); // 더 강한 진동
      if (_hasVibrator == true) {
        Vibration.vibrate(pattern: [0, 50, 40, 60]);
      }
      _playSfx('sounds/alarm_sound.ogg', volume: 0.16, maxDuration: const Duration(milliseconds: 200));
      _showFeedback('감점 ${char.points}점', Colors.redAccent);
    } else {
      HapticFeedback.mediumImpact(); // light -> medium으로 강화
      if (char.points == 0) {
        _playSfx('sounds/ui_click.ogg', volume: 0.12, maxDuration: const Duration(milliseconds: 140));
      } else {
        _playSfx('sounds/ui_click.ogg', volume: 0.22, maxDuration: const Duration(milliseconds: 180));
      }
    }
  }

  void _finishMission() async {
    _spawnTimer?.cancel();
    _inactivityTimer?.cancel();
    _gameTimer?.cancel();

    final prefs = await SharedPreferences.getInstance();
    if (_bestTimeSeconds == null || _elapsedSeconds < _bestTimeSeconds!) {
      _isNewRecord = true;
      await prefs.setInt('fortune_catch_best_time', _elapsedSeconds);
    }
    
    if (mounted) {
      try {
        HapticFeedback.heavyImpact();
        if (_hasVibrator == true) {
          Vibration.vibrate(pattern: [0, 100, 50, 100, 50, 200]);
        }
        await _playSfx('sounds/ui_success.ogg', volume: 0.5);
      } catch (_) {}
      
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Background Colors (Green Field / Dark Night)
    final bgColors = isDarkMode 
        ? [const Color(0xFF1A237E), const Color(0xFF311B92)] // Deep Night Purple/Blue
        : [const Color(0xFF81C784), const Color(0xFF4CAF50)]; // Fresh Green
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: bgColors,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background Pattern (Grass/Stars)
              Positioned.fill(
                child: CustomPaint(
                  painter: GameBackgroundPainter(isDarkMode: isDarkMode),
                ),
              ),
              
              // Score Board
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.black45 : Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.missionFortuneCatch,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            Text(
                              '${l10n.fortuneCatchGoal} ${l10n.fortuneCatchGoalDetail(_catchCount, _minCatches)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: isDarkMode ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 14,
                                  color: isDarkMode ? Colors.white70 : Colors.black54,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '진행 시간: $_elapsedSeconds초',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: isDarkMode ? Colors.white70 : Colors.black54,
                                  ),
                                ),
                                if (_bestTimeSeconds != null) ...[
                                  const SizedBox(width: 8),
                                  const Icon(Icons.emoji_events_outlined, size: 14, color: Colors.amber),
                                  const SizedBox(width: 2),
                                  Text(
                                    '최고: $_bestTimeSeconds초',
                                    style: const TextStyle(fontSize: 11, color: Colors.amber, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  size: 14,
                                  color: Colors.redAccent.withOpacity(0.9),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '화난 포츄니는 감점!',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.amber.withOpacity(0.5), blurRadius: 8, offset: const Offset(0, 2))
                            ],
                          ),
                          child: Text(
                            l10n.fortuneCatchScore(_score),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Combo Text
              if (_combo > 1)
                Center(child: IgnorePointer(
                  child: ScaleTransition(
                    scale: _comboScale,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 15,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Text(
                        l10n.fortuneCatchCombo(_combo),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                )),

              if (_feedbackText != null)
                Positioned(
                  top: 108,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: ScaleTransition(
                      scale: _feedbackScale,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.14)),
                          ),
                          child: Text(
                            _feedbackText!,
                            style: TextStyle(
                              color: _feedbackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              
              // Game Grid
              Positioned(
                top: 200, // Increased top to prevent overlap with score board
                left: 0,  
                right: 0, 
                bottom: 60, 
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), 
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white24, width: 1.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.touch_app, size: 22, color: Colors.orangeAccent),
                            const SizedBox(width: 12),
                            Text(
                              '화난 포츄니를 피해서 잡으세요!',
                              style: TextStyle(
                                fontSize: 17, 
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                shadows: const [Shadow(color: Colors.black, offset: Offset(0, 1.5), blurRadius: 4)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final size = constraints.biggest;
                          _ensureHoleLayouts(size);
                          final layouts = _holeLayouts!;
                          const baseItem = 124.0;

                          return Stack(
                            clipBehavior: Clip.none, // Allow characters to pop out slightly if needed
                            children: [
                              Positioned.fill(
                                child: ClipPath(
                                  clipper: _FieldClipper(),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: isDarkMode
                                            ? [
                                                const Color(0xFF1A2A3D).withOpacity(0.55),
                                                const Color(0xFF0F1C2B).withOpacity(0.75),
                                              ]
                                            : [
                                                const Color(0xFF2E7D32).withOpacity(0.85),
                                                const Color(0xFF1B5E20).withOpacity(0.95),
                                              ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                                for (int index = 0; index < 9; index++)
                                  Positioned(
                                    left: (layouts[index].x * size.width) - ((baseItem * layouts[index].scale) / 2),
                                    top: (layouts[index].y * size.height) - ((baseItem * layouts[index].scale) / 2),
                                    width: baseItem * layouts[index].scale,
                                    height: baseItem * layouts[index].scale,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Transform.scale(
                                        scale: layouts[index].scale,
                                        child: SizedBox(
                                          width: baseItem,
                                          height: baseItem,
                                          child: MoleHole(
                                            character: _activeHoles[index],
                                            hitController: _hitControllers[index],
                                            onTap: () => _onTapCharacter(index),
                                            isDarkMode: isDarkMode,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Bottom Progress Bar
              Positioned(
                bottom: 30,
                left: 30,
                right: 30,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: (_score / _targetScore).clamp(0.0, 1.0),
                        minHeight: 16,
                        backgroundColor: isDarkMode ? Colors.white12 : Colors.black12,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.black.withOpacity(0.30) : Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(isDarkMode ? 0.12 : 0.22)),
                      ),
                      child: Text(
                        l10n.missionFortuneCatchDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white70 : Colors.white,
                          shadows: [Shadow(color: Colors.black45, offset: Offset(0, 1), blurRadius: 2)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (_isSuccess)
                MissionSuccessOverlay(
                  onFinish: () {
                    if (mounted) {
                      Navigator.of(context).pop(true);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameBackgroundPainter extends CustomPainter {
  final bool isDarkMode;
  GameBackgroundPainter({required this.isDarkMode});

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42);

    if (isDarkMode) {
      final starPaint = Paint()
        ..color = Colors.white.withOpacity(0.14)
        ..style = PaintingStyle.fill;

      for (int i = 0; i < 42; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height;
        final r = 1.0 + random.nextDouble() * 2.6;
        canvas.drawCircle(Offset(x, y), r, starPaint);
      }

      final glowPaint = Paint()
        ..color = Colors.white.withOpacity(0.10)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

      for (int i = 0; i < 10; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * (size.height * 0.75);
        final r = 3.0 + random.nextDouble() * 5.0;
        canvas.drawCircle(Offset(x, y), r, glowPaint);
      }
    } else {
      final dotPaint = Paint()
        ..color = Colors.white.withOpacity(0.12)
        ..style = PaintingStyle.fill;

      for (int i = 0; i < 26; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height;
        final r = 2.0 + random.nextDouble() * 5.0;
        canvas.drawCircle(Offset(x, y), r, dotPaint);
      }

      final bladePaint = Paint()
        ..color = Colors.white.withOpacity(0.08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

      for (int i = 0; i < 40; i++) {
        final x = random.nextDouble() * size.width;
        final y = (size.height * 0.55) + random.nextDouble() * (size.height * 0.45);
        final h = 10 + random.nextDouble() * 24;
        final sway = (random.nextDouble() - 0.5) * 10;
        final path = Path()
          ..moveTo(x, y)
          ..quadraticBezierTo(x + sway, y - h * 0.5, x + sway * 0.4, y - h);
        canvas.drawPath(path, bladePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MoleHole extends StatelessWidget {
  final FortuneCharacter? character;
  final AnimationController? hitController;
  final VoidCallback onTap;
  final bool isDarkMode;

  const MoleHole({
    super.key,
    this.character,
    this.hitController,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    // 2.5D Style Hole
    // Consists of: Back (Dark Hole), Character (Middle), Front (Mound Lip)
    
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Layer 1: Hole Background (Oval)
          Positioned(
            bottom: 5,
            child: IgnorePointer(
              child: Container(
                width: 88,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF2D1B15),
                  borderRadius: BorderRadius.all(Radius.elliptical(88, 38)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
              ),
            ),
          ),
  
          // Layer 2: Character with Mask
          if (character != null)
            Positioned(
              bottom: 14,
              child: IgnorePointer(
                child: TweenAnimationBuilder<double>(
                  key: ValueKey(character!.id),
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                  builder: (context, value, child) {
                    return Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Transform.translate(
                          offset: Offset(0, 25 * (1 - value)),
                          child: _buildCharacterImage(character!, popValue: value),
                        ),
                        if (hitController != null)
                          AnimatedBuilder(
                            animation: hitController!,
                            builder: (context, child) {
                              final effectValue = hitController!.value;
                              if (effectValue == 0 || effectValue == 1) return const SizedBox.shrink();
                              
                              final scale = 0.5 + (1.2 * effectValue);
                              final opacity = (1.0 - effectValue).clamp(0.0, 1.0);
                              
                              return Transform.scale(
                                scale: scale,
                                child: Opacity(
                                  opacity: opacity,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.5),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            
          // Layer 3: Front Mound (The Lip)
          Positioned(
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                width: 98,
                height: 24, 
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDarkMode 
                        ? [const Color(0xFF5E35B1), const Color(0xFF4527A0)]
                        : [const Color(0xFFA1887F), const Color(0xFF8D6E63)],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                    topLeft: Radius.circular(15), 
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterImage(FortuneCharacter char, {required double popValue}) {
    final img = Image.asset(
      char.assetPath,
      width: 100, // Reduced from 108
      height: 100, // Reduced from 108
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
    );

    final visibleFactor = (0.30 + (0.50 * popValue)).clamp(0.30, 0.80);

    return SizedBox(
      width: 100,
      height: 100,
      child: ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: visibleFactor,
          child: Transform.scale(
            scale: 1.35, // Slightly reduced scale to show more body
            alignment: Alignment.topCenter,
            child: img,
          ),
        ),
      ),
    );
  }
}

class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FortuneCharacter {
  final String id;
  final int holeIndex;
  final String assetPath;
  final bool isFake;
  final int points;
  final DateTime spawnTime;
  final Duration duration;

  FortuneCharacter({
    required this.id,
    required this.holeIndex,
    required this.assetPath,
    required this.isFake,
    required this.points,
    required this.spawnTime,
    required this.duration,
  });
}

class _SpawnSpec {
  final String assetPath;
  final int points;
  final bool isFake;
  final int weight;

  const _SpawnSpec({
    required this.assetPath,
    required this.points,
    required this.isFake,
    required this.weight,
  });
}

class _HoleLayout {
  final double x;
  final double y;
  final double scale;

  const _HoleLayout({
    required this.x,
    required this.y,
    required this.scale,
  });
}

class _FieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Ground fills the screen horizontally
    final topInset = size.width * 0.10; // Slightly less inset for a wider horizon
    const bottomInset = 0.0; // Fill to the edges at the bottom

    return Path()
      ..moveTo(topInset, 0)
      ..lineTo(size.width - topInset, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

enum _CharacterCategory { good, neutral, bad }
