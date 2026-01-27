import 'dart:async';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'tarot_data.dart'; // 타로 데이터 import
import '../../data/models/alarm_model.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/notification_service.dart';
import '../../providers/alarm_list_provider.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import '../../services/sharing_service.dart';
import '../../core/utils/image_helper.dart';
import 'mixins/fortune_access_mixin.dart';

class FortuneMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;
  final DateTime? targetDate;

  const FortuneMissionScreen({super.key, this.alarmId, this.targetDate});

  @override
  ConsumerState<FortuneMissionScreen> createState() => _FortuneMissionScreenState();
}

class _FortuneMissionScreenState extends ConsumerState<FortuneMissionScreen> with TickerProviderStateMixin, FortuneAccessMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _inactivityTimer;
  AlarmModel? _alarm;
  bool _isLoading = true;

  Future<AlarmModel?> _applyResolvedRandomBackground(AlarmModel? alarm) async {
    if (alarm == null) return null;
    if (alarm.backgroundPath != 'random_background') return alarm;
    try {
      final box = await Hive.openBox('app_state');
      final resolved = box.get('active_alarm_mission_background_path') as String?;
      if (resolved == null || resolved.isEmpty) return alarm;
      return alarm.copyWith(backgroundPath: resolved);
    } catch (_) {
      return alarm;
    }
  }
  
  // Mission State: 1=Selection, 2=Result, 3=Loading
  int _missionStep = 1; 
  
  // Loading State
  double _loadingProgress = 0.0;
  Timer? _loadingTimer;
  
  // Tarot State
  final List<int?> _selectedSlots = [null, null, null];
  TarotCard? _loveResult;
  TarotCard? _wealthResult;
  TarotCard? _successResult;

  // Animation State
  final List<GlobalKey> _gridKeys = List.generate(15, (index) => GlobalKey());
  final List<GlobalKey> _slotKeys = List.generate(3, (index) => GlobalKey());
  bool _isAnimating = false;
  bool _isChecking = false; // 결과 확인 중 상태
  int? _animatingCardIndex; // 현재 이동 중인 카드 인덱스

  @override
  void initState() {
    super.initState();
    
    // 미션 진입 시 알람 진동이 남아있을 수 있으므로 명시적으로 정지
    Vibration.cancel();
    
    _loadAlarm();
    _startInactivityTimer();
    // 미션 화면 진입 시 알람 소리를 직접 제어하지 않고 
    // AlarmRingingScreen에서 일시 정지된 상태로 진입함.
  }

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      setState(() => _isLoading = false);
      return;
    }
    
    try {
      final alarmBox = await Hive.openBox<AlarmModel>('alarms');
      final alarm = await _applyResolvedRandomBackground(alarmBox.get(widget.alarmId));
      if (mounted) {
        setState(() {
          _alarm = alarm;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading alarm in FortuneMissionScreen: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _getLocalizedTarotName(int id) {
    final l10n = AppLocalizations.of(context)!;
    switch (id) {
      case 0: return l10n.tarotName0;
      case 1: return l10n.tarotName1;
      case 2: return l10n.tarotName2;
      case 3: return l10n.tarotName3;
      case 4: return l10n.tarotName4;
      case 5: return l10n.tarotName5;
      case 6: return l10n.tarotName6;
      case 7: return l10n.tarotName7;
      case 8: return l10n.tarotName8;
      case 9: return l10n.tarotName9;
      case 10: return l10n.tarotName10;
      case 11: return l10n.tarotName11;
      case 12: return l10n.tarotName12;
      case 13: return l10n.tarotName13;
      case 14: return l10n.tarotName14;
      case 15: return l10n.tarotName15;
      case 16: return l10n.tarotName16;
      case 17: return l10n.tarotName17;
      case 18: return l10n.tarotName18;
      case 19: return l10n.tarotName19;
      case 20: return l10n.tarotName20;
      case 21: return l10n.tarotName21;
      default: return "";
    }
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) {
        debugPrint('[FortuneMissionScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _volumeTimer?.cancel();
    _loadingTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    try {
      if (alarm.isSoundEnabled) {
        bool useAudioPlayer = alarm.ringtonePath != 'default' || alarm.isGradualVolume;

        if (!useAudioPlayer) {
           await FlutterRingtonePlayer().playAlarm(
             looping: true, 
             volume: alarm.volume, 
             asAlarm: true
           );
        } else {
           String path = alarm.ringtonePath ?? 'alarm_sound';
           if (path == 'default') path = 'alarm_sound';
           String ext = 'ogg';
           
           await _audioPlayer.setReleaseMode(ReleaseMode.loop);
           await _audioPlayer.setSource(AssetSource('sounds/$path.$ext'));
           
           double initialVolume = alarm.isGradualVolume ? 0.1 : alarm.volume;
           await _audioPlayer.setVolume(initialVolume);
           await _audioPlayer.resume();
           
           if (alarm.isGradualVolume) {
             _startVolumeFadeIn(alarm.volume);
           }
        }
      }

      if (alarm.isVibrationEnabled && await Vibration.hasVibrator() == true) {
         _playVibration(alarm.vibrationPattern);
      }
    } catch (e) {
      debugPrint('Error playing alarm: $e');
    }
  }

  void _startVolumeFadeIn(double targetVolume) {
    _volumeTimer?.cancel();
    double currentVolume = 0.1;
    _volumeTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      currentVolume += 0.1;
      if (currentVolume >= targetVolume) {
        currentVolume = targetVolume;
        timer.cancel();
      }
      await _audioPlayer.setVolume(currentVolume);
    });
  }
  
  void _playVibration(String? pattern) {
    Vibration.cancel();
    switch (pattern) {
      case 'short':
        Vibration.vibrate(pattern: [0, 500, 500, 500, 500], repeat: 0);
        break;
      case 'long':
        Vibration.vibrate(pattern: [0, 2000, 2000, 2000, 2000], repeat: 0);
        break;
      case 'heartbeat':
        Vibration.vibrate(pattern: [0, 200, 100, 200, 1000, 200, 100, 200, 1000], repeat: 0);
        break;
      case 'sos':
        Vibration.vibrate(pattern: [0, 200, 100, 200, 100, 200, 500, 500, 200, 500, 200, 500, 500, 200, 100, 200, 100, 200], repeat: 0);
        break;
      case 'quick':
        Vibration.vibrate(pattern: [0, 100, 50, 100, 50, 100, 50, 100, 50, 100], repeat: 0);
        break;
      default:
        Vibration.vibrate(pattern: [0, 1000, 1000], repeat: 0);
    }
  }

  Future<void> _stopAlarm() async {
    try {
      _volumeTimer?.cancel();
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      Vibration.cancel();
      if (widget.alarmId != null) {
        final stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
        await NotificationService().cancelNotification(stableId);
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  Future<void> _playSfx(String assetPath, {double volume = 0.5, Duration? maxDuration}) async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource(assetPath), volume: volume);
      if (maxDuration != null) {
        Future.delayed(maxDuration, () => player.stop());
      }
      player.onPlayerComplete.listen((_) => player.dispose());
    } catch (e) {
      debugPrint('Error playing SFX: $assetPath - $e');
    }
  }

  Future<void> _checkResult() async {
    if (_isChecking) return;
    
    setState(() {
      _isChecking = true;
    });

    _stopAlarm();
    // ref.read(alarmListProvider.notifier).toggleAlarm(widget.alarmId!); // <--- AlarmRingingScreen에서 처리하도록 제거
    
    await showFortuneAccessDialog(
      _simulateAd,
      onDirectAccess: _processResult,
    );
    
    if (mounted) {
      setState(() {
        _isChecking = false;
      });
    }
  }

  void _simulateAd() {
    // Start full screen loading instead of dialog
    _startLoadingAnalysis();
  }

  void _startLoadingAnalysis() {
    setState(() {
      _missionStep = 3; // Loading state
      _loadingProgress = 0.0;
    });

    _playSfx('sounds/ui_click.ogg', volume: 0.2);

    _loadingTimer?.cancel();
    int totalSteps = 100;
    int durationMs = 3000; // 3 seconds
    int stepTime = durationMs ~/ totalSteps;

    _loadingTimer = Timer.periodic(Duration(milliseconds: stepTime), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _loadingProgress += 0.01;
        if (_loadingProgress >= 1.0) {
          _loadingProgress = 1.0;
          timer.cancel();
          _processResult();
        }
      });
    });
  }

  void _processResult() async {
    try {
      HapticFeedback.heavyImpact();
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(pattern: [0, 100, 50, 100]);
      }
      // 효과음 제거 요청으로 주석 처리
      // await _playSfx('sounds/ui_success.ogg', volume: 0.5);
    } catch (_) {}
    setState(() {
      _loveResult = TarotRepository.drawCard(category: "love", date: widget.targetDate);
      _wealthResult = TarotRepository.drawCard(category: "wealth", date: widget.targetDate);
      _successResult = TarotRepository.drawCard(category: "success", date: widget.targetDate);
      _missionStep = 2; // Go to result
    });
  }

  void _handleClose() {
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  void _handleCardTap(int cardIndex) {
    if (_isAnimating) return;
    if (_selectedSlots.contains(cardIndex)) return; // Already selected

    int emptyIndex = _selectedSlots.indexOf(null);
    if (emptyIndex != -1) {
      try {
        HapticFeedback.mediumImpact();
        _playSfx('sounds/ui_click.ogg', volume: 0.1, maxDuration: const Duration(milliseconds: 300));
      } catch (_) {}
      _startMovingAnimation(cardIndex, emptyIndex);
    }
  }

  void _startMovingAnimation(int cardIndex, int slotIndex) {
    final RenderBox? cardBox = _gridKeys[cardIndex].currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? slotBox = _slotKeys[slotIndex].currentContext?.findRenderObject() as RenderBox?;

    if (cardBox == null || slotBox == null) {
      // Fallback if keys are not ready
      setState(() {
        _selectedSlots[slotIndex] = cardIndex;
      });
      return;
    }

    final cardPos = cardBox.localToGlobal(Offset.zero);
    final slotPos = slotBox.localToGlobal(Offset.zero);
    final cardSize = cardBox.size;
    final slotSize = slotBox.size;

    setState(() {
      _isAnimating = true;
      _animatingCardIndex = cardIndex; // 이동 시작 시 인덱스 저장
    });

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => _MovingCardWidget(
        startPos: cardPos,
        endPos: slotPos,
        startSize: cardSize,
        endSize: slotSize,
        onComplete: () {
          overlayEntry.remove();
          if (mounted) {
            setState(() {
              _selectedSlots[slotIndex] = cardIndex;
              _isAnimating = false;
              _animatingCardIndex = null; // 이동 완료 후 초기화
            });
          }
        },
      ),
    );

    Overlay.of(context).insert(overlayEntry);
  }

  void _handleSlotTap(int slotIndex) {
    if (_selectedSlots[slotIndex] != null) {
      try {
        HapticFeedback.lightImpact();
        _playSfx('sounds/ui_click.ogg', volume: 0.05, maxDuration: const Duration(milliseconds: 200));
      } catch (_) {}
      setState(() {
        _selectedSlots[slotIndex] = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A1A2E),
        body: Center(child: CircularProgressIndicator(color: Color(0xFFFFD700))),
      );
    }

    BoxDecoration bgDecoration;
    if (_alarm != null && _alarm!.backgroundPath != null) {
      if (_alarm!.backgroundPath!.startsWith('color:')) {
        int colorValue = int.parse(_alarm!.backgroundPath!.split(':')[1]);
        bgDecoration = BoxDecoration(color: Color(colorValue));
      } else if (_alarm!.backgroundPath!.startsWith('assets/')) {
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_alarm!.backgroundPath!),
            fit: BoxFit.cover,
          ),
        );
      } else {
        final imageProvider = getFileImageProvider(_alarm!.backgroundPath!);
        if (imageProvider != null) {
          bgDecoration = BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          );
        } else {
          bgDecoration = const BoxDecoration(color: Color(0xFF1A1A2E));
        }
      }
    } else {
      bgDecoration = const BoxDecoration(color: Color(0xFF1A1A2E)); // Default Dark Blue for Fortune
    }

    return Listener(
      onPointerDown: (_) => _resetInactivityTimer(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Container(
            decoration: bgDecoration,
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
  
  Widget _buildBody() {
    if (_missionStep == 1) {
      return _buildSelectionScreen();
    } else if (_missionStep == 3) {
      return _buildLoadingScreen();
    } else {
      return _buildResultScreen();
    }
  }

  Widget _buildLoadingScreen() {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MysticBackgroundPainter(),
          size: Size.infinite,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.fortuneLoadingMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 10)]
                ),
              ),
              const SizedBox(height: 60),
              
              // Mystic Circle Animation
              const SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
                ),
              ),
              
              const SizedBox(height: 80),
              
              // Progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: _loadingProgress,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.fortuneAnalyzing((_loadingProgress * 100).toInt()),
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildSelectionScreen() {
    final allSelected = !_selectedSlots.contains(null);
    final usedIndices = _selectedSlots.whereType<int>().toSet();
    
    String title = AppLocalizations.of(context)!.fortuneSelectTitle;
    if (widget.targetDate != null) {
      title = AppLocalizations.of(context)!.fortuneSelectTitleDate(widget.targetDate!.month.toString(), widget.targetDate!.day);
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Rich Mystic Background
        CustomPaint(
          painter: MysticBackgroundPainter(),
          size: Size.infinite,
        ),
        
        /*
        // New Year Fortune Button
        Positioned(
          top: 10,
          right: 20,
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NewYearFortuneInputScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF0EA5E9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white54),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0EA5E9).withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.fortuneNewYearButton,
                      style: const TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        */

        // 2. Content
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                title,
                textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFFD700), 
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 2))
                ]
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 3. Selection Slots (Love, Wealth, Success)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSlot(0, AppLocalizations.of(context)!.loveFortune),
                  const SizedBox(width: 15),
                  _buildSlot(1, AppLocalizations.of(context)!.wealthFortune),
                  const SizedBox(width: 15),
                  _buildSlot(2, AppLocalizations.of(context)!.successFortune),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 4. Card Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 5 columns
                  childAspectRatio: 2/3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 15, // 15 cards (5x3)
                itemBuilder: (context, index) {
                  // 이미 선택된 카드거나 현재 애니메이션 중인 카드인 경우 빈 공간 표시
                  if (usedIndices.contains(index) || _animatingCardIndex == index) {
                     return Container(
                       key: _gridKeys[index],
                       decoration: BoxDecoration(
                         color: Colors.black.withOpacity(0.3),
                         borderRadius: BorderRadius.circular(4),
                         border: Border.all(color: Colors.white10),
                       ),
                     );
                  }

                  Widget cardWidget = Container(
                      key: _gridKeys[index],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                           BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 4, offset: Offset(0, 2))
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CustomPaint(painter: CardBackPainter()),
                      ),
                    );

                  return GestureDetector(
                    onTap: () => _handleCardTap(index),
                    child: cardWidget,
                  );
                },
              ),
            ),
            
            // Button
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: (allSelected && !_isChecking) ? _checkResult : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, 
                      foregroundColor: Colors.black,
                      disabledBackgroundColor: Colors.grey.withOpacity(0.3),
                      disabledForegroundColor: Colors.white30,
                      elevation: 10,
                      shadowColor: Colors.amber.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.amber.withOpacity(0.5))
                      ),
                    ),
                    child: _isChecking 
                      ? const SizedBox(
                          width: 24, 
                          height: 24, 
                          child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2)
                        )
                      : Text(
                          allSelected 
                              ? AppLocalizations.of(context)!.fortuneCheckButton 
                              : AppLocalizations.of(context)!.fortuneSelectCards,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
      ],
    );
  }

  Widget _buildSlot(int slotIndex, String label) {
    bool isFilled = _selectedSlots[slotIndex] != null;
    
    return GestureDetector(
      key: _slotKeys[slotIndex],
      onTap: () => _handleSlotTap(slotIndex),
      child: MysticDropZone(
        isFilled: isFilled,
        isHovering: false,
        label: label,
      ),
    );
  }

  Widget _buildResultScreen() {
    String title = AppLocalizations.of(context)!.fortuneResultTitle;
    if (widget.targetDate != null) {
      final l10n = AppLocalizations.of(context)!;
      if (Localizations.localeOf(context).languageCode == 'ko') {
        title = l10n.fortuneResultTitleDate(widget.targetDate!.year, widget.targetDate!.month.toString(), widget.targetDate!.day);
      } else {
        title = "${l10n.fortuneResultTitle} for ${DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(widget.targetDate!)}";
      }
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MysticBackgroundPainter(),
          size: Size.infinite,
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)]
                  ),
                ),
                const SizedBox(height: 30),
                _buildResultCard("love", AppLocalizations.of(context)!.loveFortune, const Color(0xFFE91E63), _loveResult!), // Deep Pink
                const SizedBox(height: 30),
                _buildResultCard("wealth", AppLocalizations.of(context)!.wealthFortune, const Color(0xFFB45309), _wealthResult!), // Darker Amber/Gold
                const SizedBox(height: 30),
                _buildResultCard("success", AppLocalizations.of(context)!.successFortune, const Color(0xFF2563EB), _successResult!), // Stronger Blue
                const SizedBox(height: 30),
                SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      // 공유 버튼
                      SizedBox(
                        width: double.infinity,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            final l10n = AppLocalizations.of(context)!;
                            SharingService.showShareOptions(
                              context: context,
                              title: title,
                              description: l10n.shareResultDescription,
                              results: {
                                l10n.loveFortune: _loveResult != null ? _getLocalizedTarotName(_loveResult!.id) : '',
                                l10n.wealthFortune: _wealthResult != null ? _getLocalizedTarotName(_wealthResult!.id) : '',
                                l10n.successFortune: _successResult != null ? _getLocalizedTarotName(_successResult!.id) : '',
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFEE500),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                const Icon(Icons.share, size: 20),
                                const SizedBox(width: 10),
                                Text(
                                  AppLocalizations.of(context)!.shareResultButton, 
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                ),
                              ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 64,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF334155), // Lighter Slate
                                Color(0xFF1E293B), // Darker Slate
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFFD700).withOpacity(0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _handleClose,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Use Container gradient
                              shadowColor: Colors.transparent,
                              foregroundColor: const Color(0xFFFFD700), // Gold Text
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(
                                  color: const Color(0xFFFFD700).withOpacity(0.6),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.auto_awesome, size: 20),
                                const SizedBox(width: 10),
                                Text(
                                  AppLocalizations.of(context)!.startDayButton, 
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard(String category, String title, Color color, TarotCard card) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    
    // Check if English content exists for all required fields
    bool hasEnglishContent = true;
    if (isEnglish) {
      if (card.enKeywords == null || card.enDescription == null) {
        hasEnglishContent = false;
      } else if (category == "love" && (card.enLoveMeaning == null || card.enLoveDetail == null)) {
        hasEnglishContent = false;
      } else if (category == "wealth" && (card.enWealthMeaning == null || card.enWealthDetail == null)) {
        hasEnglishContent = false;
      } else if (category == "success" && (card.enSuccessMeaning == null || card.enSuccessDetail == null)) {
        hasEnglishContent = false;
      }
    }

    // If English mode but content is missing, we follow the rule: hide/translate Korean interpretations in English mode.
    // We already checked hasEnglishContent. If it's English mode and we don't have English content,
    // we should NOT show Korean. We'll show a "Translation coming soon" or similar placeholder.
    
    String keywords = "";
    String description = "";
    String meaning = "";
    String detail = "";

    if (isEnglish) {
      if (card.enKeywords != null) {
        keywords = card.enKeywords!;
      } else {
        keywords = "Keywords available soon";
      }

      if (card.enDescription != null) {
        description = card.enDescription!;
      } else {
        description = "Interpretation for this card is being translated. Please check back later.";
      }

      if (category == "love") {
        meaning = card.enLoveMeaning ?? "Love fortune details are coming soon.";
        detail = card.enLoveDetail ?? "";
      } else if (category == "wealth") {
        meaning = card.enWealthMeaning ?? "Wealth fortune details are coming soon.";
        detail = card.enWealthDetail ?? "";
      } else {
        meaning = card.enSuccessMeaning ?? "Success fortune details are coming soon.";
        detail = card.enSuccessDetail ?? "";
      }
    } else {
      // Korean mode
      keywords = card.keywords;
      description = card.description;
      if (category == "love") {
        meaning = card.loveMeaning;
        detail = card.loveDetail;
      } else if (category == "wealth") {
        meaning = card.wealthMeaning;
        detail = card.wealthDetail;
      } else {
        meaning = card.successMeaning;
        detail = card.successDetail;
      }
    }

    // If we are in English mode and still have Korean content (heuristic: contains Korean characters)
    // we might want to hide it or show a placeholder. 
    // However, the best approach is to ensure tarot_data.dart has all en* fields.
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
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
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title, 
                      style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(_getLocalizedTarotName(card.id), style: const TextStyle(color: Colors.black45, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 150,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, spreadRadius: 2),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(card.imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // 1. 핵심 키워드 (짧고 굵게)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9), // 밝은 슬레이트 배경으로 가독성 확보
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.1), width: 1.5),
            ),
            child: Column(
              children: [
                Text(
                  keywords,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87, 
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // 2. 상세 풀이 (카드 설명 -> 상세 해석 순서)
          Row(
            children: [
              const Icon(Icons.menu_book, color: Colors.black87, size: 18),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.fortuneDetailTitle,
                style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // 카드 설명 (먼저 배치)
          Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: Colors.black12, width: 2)),
            ),
            child: Text(
              description,
              style: const TextStyle(color: Colors.black54, fontSize: 14, height: 1.5, fontStyle: FontStyle.italic),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // 핵심 의미 (강조)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border(left: BorderSide(color: color, width: 4)),
            ),
            child: Text(
              meaning,
              style: TextStyle(
                color: color, 
                fontSize: 16, 
                fontWeight: FontWeight.bold, 
                height: 1.5,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // 상세 내용
          Text(
            detail,
            style: const TextStyle(color: Colors.black87, fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class CardBackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    // 1. Background: Deep Galaxy
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        colors: [Color(0xFF2C3E50), Color(0xFF000000)],
        radius: 1.2,
        center: Alignment.center,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(4)),
      bgPaint
    );

    // 2. Intricate Border (Celtic Knot style)
    final borderPaint = Paint()
      ..color = const Color(0xFFD4AF37) // Antique Gold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
      
    final double borderPadding = 4.0;
    final borderRect = Rect.fromLTWH(
      borderPadding, 
      borderPadding, 
      size.width - borderPadding * 2, 
      size.height - borderPadding * 2
    );
    
    // Draw double border
    canvas.drawRRect(RRect.fromRectAndRadius(borderRect, const Radius.circular(2)), borderPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(borderRect.deflate(2), const Radius.circular(1)), 
      borderPaint..strokeWidth = 0.5
    );

    // 3. Central Mystic Symbol (Sun & Moon)
    // Sun
    final sunPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const RadialGradient(
        colors: [Color(0xFFFFD700), Color(0xFFDAA520)],
      ).createShader(Rect.fromCircle(center: center, radius: 15));
      
    canvas.drawCircle(center, 12, sunPaint);
    
    // Moon Crescent
    final moonPath = Path();
    moonPath.addArc(Rect.fromCircle(center: center.translate(2, -2), radius: 12), -math.pi / 2, math.pi);
    moonPath.addArc(Rect.fromCircle(center: center.translate(-2, -2), radius: 10), math.pi / 2, -math.pi);
    canvas.drawPath(moonPath, borderPaint..style = PaintingStyle.stroke..strokeWidth = 1);

    // 4. Geometry / Stars
    final starPaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.fill;
      
    // 4 Corner Stars
    final double starOffset = 10.0;
    _drawStar(canvas, Offset(borderPadding + starOffset, borderPadding + starOffset), 3, starPaint);
    _drawStar(canvas, Offset(size.width - borderPadding - starOffset, borderPadding + starOffset), 3, starPaint);
    _drawStar(canvas, Offset(borderPadding + starOffset, size.height - borderPadding - starOffset), 3, starPaint);
    _drawStar(canvas, Offset(size.width - borderPadding - starOffset, size.height - borderPadding - starOffset), 3, starPaint);
    
    // Rays from center
    final rayPaint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.3)
      ..strokeWidth = 0.5;
      
    for (int i = 0; i < 16; i++) {
      double angle = (math.pi / 8) * i;
      canvas.drawLine(
        center,
        Offset(
          center.dx + math.cos(angle) * size.width * 0.4,
          center.dy + math.sin(angle) * size.width * 0.4
        ),
        rayPaint
      );
    }
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      double angle = (math.pi * 2 / 5) * i - math.pi / 2;
      double x = center.dx + math.cos(angle) * radius;
      double y = center.dy + math.sin(angle) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      
      angle += math.pi / 5;
      x = center.dx + math.cos(angle) * radius * 0.5;
      y = center.dy + math.sin(angle) * radius * 0.5;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MovingCardWidget extends StatefulWidget {
  final Offset startPos;
  final Offset endPos;
  final Size startSize;
  final Size endSize;
  final VoidCallback onComplete;

  const _MovingCardWidget({
    required this.startPos,
    required this.endPos,
    required this.startSize,
    required this.endSize,
    required this.onComplete,
  });

  @override
  State<_MovingCardWidget> createState() => _MovingCardWidgetState();
}

class _MovingCardWidgetState extends State<_MovingCardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350), // Faster animation
    );

    _positionAnimation = Tween<Offset>(
      begin: widget.startPos,
      end: widget.endPos,
    ).animate(CurvedAnimation(
      parent: _controller, 
      curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
    ));

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.1), weight: 20), // Slight pop
      TweenSequenceItem(tween: Tween<double>(begin: 1.1, end: widget.endSize.width / widget.startSize.width), weight: 80),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.0, // No rotation as requested
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward().then((_) {
      // Add sound and haptic feedback on completion
      SystemSound.play(SystemSoundType.click);
      HapticFeedback.mediumImpact();
      widget.onComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Opacity fade-in effect
        final opacity = _controller.value < 0.1 ? _controller.value * 10 : 1.0;
        
        return Positioned(
          left: _positionAnimation.value.dx,
          top: _positionAnimation.value.dy,
          width: widget.startSize.width,
          height: widget.startSize.height,
          child: Opacity(
            opacity: opacity,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.6 * (1 - _controller.value * 0.5)),
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                      // Motion trail effect (simplified)
                      if (_controller.value > 0.2 && _controller.value < 0.8)
                        BoxShadow(
                          color: const Color(0xFFFFD700).withOpacity(0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CustomPaint(painter: CardBackPainter()),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SpinningMysticCircle extends StatefulWidget {
  const SpinningMysticCircle({super.key});

  @override
  State<SpinningMysticCircle> createState() => _SpinningMysticCircleState();
}

class _SpinningMysticCircleState extends State<SpinningMysticCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20), // Slow rotation
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SizedBox(
        width: 250,
        height: 250,
        child: CustomPaint(
          painter: MysticCirclePainter(),
        ),
      ),
    );
  }
}

class MysticCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // 1. Outer Rings
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFFFD700).withOpacity(0.5)
      ..strokeWidth = 2.0;
      
    canvas.drawCircle(center, radius, ringPaint);
    canvas.drawCircle(center, radius * 0.95, ringPaint..strokeWidth = 1.0);
    
    // 2. Inner Star (Hexagram)
    final starPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFFFD700).withOpacity(0.3)
      ..strokeWidth = 1.5;
      
    final path = Path();
    for (int i = 0; i < 2; i++) {
      double startAngle = (i * 60) * (math.pi / 180);
      for (int j = 0; j < 3; j++) {
        double angle = startAngle + (j * 120) * (math.pi / 180);
        double x = center.dx + math.cos(angle) * (radius * 0.8);
        double y = center.dy + math.sin(angle) * (radius * 0.8);
        if (j == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
    }
    canvas.drawPath(path, starPaint);
    
    // 3. Rays
    final rayPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1.0;
      
    for (int i = 0; i < 12; i++) {
      double angle = (i * 30) * (math.pi / 180);
      canvas.drawLine(
        Offset(center.dx + math.cos(angle) * (radius * 0.4), center.dy + math.sin(angle) * (radius * 0.4)),
        Offset(center.dx + math.cos(angle) * radius, center.dy + math.sin(angle) * radius),
        rayPaint
      );
    }
    
    // 4. Center Symbol (Moon)
    final moonPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFFFD700).withOpacity(0.8);
      
    final moonPath = Path();
    moonPath.addArc(Rect.fromCircle(center: center, radius: radius * 0.2), -math.pi/2, math.pi);
    moonPath.addArc(Rect.fromCircle(center: center.translate(radius * 0.05, 0), radius: radius * 0.15), math.pi/2, -math.pi);
    canvas.drawPath(moonPath, moonPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MysticDropZone extends StatefulWidget {
  final bool isFilled;
  final bool isHovering;
  final String label;

  const MysticDropZone({
    super.key,
    required this.isFilled,
    required this.isHovering,
    required this.label,
  });

  @override
  State<MysticDropZone> createState() => _MysticDropZoneState();
}

class _MysticDropZoneState extends State<MysticDropZone> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void didUpdateWidget(MysticDropZone oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isFilled && widget.isFilled) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 140,
      decoration: BoxDecoration(
        color: widget.isFilled 
            ? const Color(0xFF16213E) 
            : const Color(0xFFF1F5F9).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.isHovering 
              ? Colors.white 
              : (widget.isFilled 
                  ? const Color(0xFFFFD700) 
                  : const Color(0xFF94A3B8).withOpacity(0.3)),
          width: widget.isFilled || widget.isHovering ? 2 : 1.5,
        ),
        boxShadow: widget.isFilled || widget.isHovering ? [
          BoxShadow(
            color: const Color(0xFFFFD700).withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 2,
          )
        ] : [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Content
          widget.isFilled
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: CustomPaint(painter: CardBackPainter()),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add, 
                      color: const Color(0xFFCBD5E1).withOpacity(0.6), 
                      size: 24
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: const Color(0xFFCBD5E1).withOpacity(0.8), 
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
          
          // Magical Effect Overlay
          if (widget.isFilled)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  if (_controller.isDismissed) return const SizedBox.shrink();
                  return CustomPaint(
                    painter: MysticBurstPainter(progress: _controller.value),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class MysticBurstPainter extends CustomPainter {
  final double progress;

  MysticBurstPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress >= 1.0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width * 1.5;
    
    // 1. Shockwave Ring
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFFFD700).withOpacity((1 - progress) * 0.8)
      ..strokeWidth = 2 + (1 - progress) * 5;
      
    canvas.drawCircle(center, progress * maxRadius * 0.8, ringPaint);

    // 2. Burst Rays
    final rayPaint = Paint()
      ..color = Colors.white.withOpacity((1 - progress) * 0.6)
      ..strokeWidth = 2;
      
    for (int i = 0; i < 12; i++) {
      double angle = (math.pi * 2 / 12) * i;
      double startR = progress * maxRadius * 0.5;
      double length = (1 - progress) * 40;
      
      canvas.drawLine(
        Offset(center.dx + math.cos(angle) * startR, center.dy + math.sin(angle) * startR),
        Offset(center.dx + math.cos(angle) * (startR + length), center.dy + math.sin(angle) * (startR + length)),
        rayPaint
      );
    }
    
    // 3. Sparkles
    final random = math.Random(42);
    final starPaint = Paint()..style = PaintingStyle.fill;
    
    for (int i = 0; i < 20; i++) {
      double angle = random.nextDouble() * math.pi * 2;
      double speed = 0.5 + random.nextDouble();
      double r = progress * maxRadius * speed;
      
      if (r > maxRadius) continue;
      
      double opacity = (1 - progress) * random.nextDouble();
      starPaint.color = const Color(0xFFFFD700).withOpacity(opacity);
      
      canvas.drawCircle(
        Offset(center.dx + math.cos(angle) * r, center.dy + math.sin(angle) * r), 
        2 * (1 - progress), 
        starPaint
      );
    }
  }

  @override
  bool shouldRepaint(covariant MysticBurstPainter oldDelegate) => oldDelegate.progress != progress;
}

class MysticBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.45); // Center slightly above middle
    
    // 1. Deep Space Background
    final bgPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF1E293B), // Brighter Slate
          const Color(0xFF0F172A), // Darker Navy
        ],
        center: Alignment(0.0, -0.2),
        radius: 1.5,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);
    
    // 2. Stars (Random Gold Dust)
    final starPaint = Paint()..color = Colors.white.withOpacity(0.6);
    final random = math.Random(42); // Fixed seed for consistent stars
    
    for (int i = 0; i < 100; i++) {
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;
      double r = random.nextDouble() * 1.5;
      double opacity = random.nextDouble();
      starPaint.color = i % 5 == 0 ? const Color(0xFFFFD700).withOpacity(opacity) : Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), r, starPaint);
    }
    
    // 3. Central Golden Wheel (Astrological Compass)
    final wheelPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFDAA520).withOpacity(0.15) // Faint Gold
      ..strokeWidth = 1.0;
      
    // Concentric Circles
    double maxRadius = size.width * 0.45;
    canvas.drawCircle(center, maxRadius, wheelPaint);
    canvas.drawCircle(center, maxRadius * 0.85, wheelPaint);
    canvas.drawCircle(center, maxRadius * 0.6, wheelPaint..strokeWidth = 2.0..color = const Color(0xFFDAA520).withOpacity(0.2));
    
    // Rays/Spokes
    for (int i = 0; i < 12; i++) {
      double angle = (2 * math.pi / 12) * i;
      double innerR = maxRadius * 0.3;
      double outerR = maxRadius;
      canvas.drawLine(
        Offset(center.dx + innerR * math.cos(angle), center.dy + innerR * math.sin(angle)),
        Offset(center.dx + outerR * math.cos(angle), center.dy + outerR * math.sin(angle)),
        wheelPaint
      );
    }
    
    // Zodiac Symbols (Abstract representation)
    final symbolPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFFFD700).withOpacity(0.3)
      ..strokeWidth = 1.5;
      
    double symbolR = maxRadius * 0.72;
    for (int i = 0; i < 12; i++) {
      double angle = (2 * math.pi / 12) * i + (math.pi / 12);
      canvas.drawCircle(
        Offset(center.dx + symbolR * math.cos(angle), center.dy + symbolR * math.sin(angle)), 
        4, 
        symbolPaint
      );
    }
    
    // 4. Central Sun/Eye Glow
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFD700).withOpacity(0.2),
          Colors.transparent
        ],
      ).createShader(Rect.fromCircle(center: center, radius: 100));
      
    canvas.drawCircle(center, 100, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
