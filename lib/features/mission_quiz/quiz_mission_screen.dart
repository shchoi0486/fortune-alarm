import 'dart:io';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:collection/collection.dart'; // for firstWhereOrNull
import 'package:hive_flutter/hive_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../services/notification_service.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../providers/alarm_list_provider.dart';
import '../../data/models/alarm_model.dart';

class QuizItem {
  final int id;
  final String text;

  QuizItem({required this.id, required this.text});
}


class QuizMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const QuizMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<QuizMissionScreen> createState() => _QuizMissionScreenState();
}

class _QuizMissionScreenState extends ConsumerState<QuizMissionScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _inactivityTimer;
  AlarmModel? _alarm;
  bool _isLoading = true;
  
  List<QuizItem> _leftItems = [];
  List<QuizItem> _rightItems = [];
  
  // 매칭 정보 (좌측 아이템 ID -> 우측 아이템 ID)
  final Set<int> _matchedIds = {};
  
  // 현재 선택 정보
  int? _selectedLeftIndex;
  int? _selectedRightIndex;
  bool _isProcessingMatch = false;

  @override
  void initState() {
    super.initState();
    _loadAlarm();
    // _generateQuiz() will be called after initState in the first frame or 
    // we can call it in didChangeDependencies if we need context.
    _playAlarm();
    _startInactivityTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Context is available here, so we can generate the quiz with l10n
    if (_leftItems.isEmpty) {
      _generateQuiz();
    }
  }

  Future<void> _loadAlarm() async {
    if (widget.alarmId == null) {
      setState(() => _isLoading = false);
      return;
    }
    
    try {
      final alarmBox = await Hive.openBox<AlarmModel>('alarms');
      final alarm = alarmBox.get(widget.alarmId);
      if (mounted) {
        setState(() {
          _alarm = alarm;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading alarm in QuizMissionScreen: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _generateQuiz() {
    final l10n = AppLocalizations.of(context)!;
    final List<Map<String, String>> fullVocab = [
      {'question': l10n.quizWord1, 'answer': l10n.quizWord1Ans},
      {'question': l10n.quizWord2, 'answer': l10n.quizWord2Ans},
      {'question': l10n.quizWord3, 'answer': l10n.quizWord3Ans},
      {'question': l10n.quizWord4, 'answer': l10n.quizWord4Ans},
      {'question': l10n.quizWord5, 'answer': l10n.quizWord5Ans},
      {'question': l10n.quizWord6, 'answer': l10n.quizWord6Ans},
      {'question': l10n.quizWord7, 'answer': l10n.quizWord7Ans},
      {'question': l10n.quizWord8, 'answer': l10n.quizWord8Ans},
      {'question': l10n.quizWord9, 'answer': l10n.quizWord9Ans},
      {'question': l10n.quizWord10, 'answer': l10n.quizWord10Ans},
      {'question': l10n.quizWord11, 'answer': l10n.quizWord11Ans},
      {'question': l10n.quizWord12, 'answer': l10n.quizWord12Ans},
      {'question': l10n.quizWord13, 'answer': l10n.quizWord13Ans},
      {'question': l10n.quizWord14, 'answer': l10n.quizWord14Ans},
      {'question': l10n.quizWord15, 'answer': l10n.quizWord15Ans},
    ];

    final tempVocab = List<Map<String, String>>.from(fullVocab)..shuffle();
    final List<Map<String, String>> selected = [];
    
    for (int i = 0; i < 5; i++) {
      selected.add(tempVocab[i]);
    }

    _leftItems = [];
    _rightItems = [];

    for (int i = 0; i < 5; i++) {
      _leftItems.add(QuizItem(id: i, text: selected[i]['answer']!));
      _rightItems.add(QuizItem(id: i, text: selected[i]['question']!));
    }

    _leftItems.shuffle();
    _rightItems.shuffle();
    
    _matchedIds.clear();
    _selectedLeftIndex = null;
    _selectedRightIndex = null;
    _isProcessingMatch = false;
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) {
        debugPrint('[QuizMissionScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  Future<void> _playAlarm() async {
    if (widget.alarmId == null) return;

    final alarmList = ref.read(alarmListProvider);
    final alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    if (alarm == null) return;

    try {
      if (alarm.isSoundEnabled) {
        if (alarm.ringtonePath == 'default') {
           await FlutterRingtonePlayer().playAlarm(
             looping: true, 
             volume: alarm.isGradualVolume ? 0.1 : alarm.volume, 
             asAlarm: true
           );
        } else {
           String path = alarm.ringtonePath ?? 'alarm_sound';
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

  void _handleSuccess() {
    _stopAlarm();
    Navigator.pop(context, true);
  }

  void _onLeftItemTap(int index) {
    if (_isProcessingMatch || _matchedIds.contains(_leftItems[index].id)) return;
    
    setState(() {
      if (_selectedLeftIndex == index) {
        _selectedLeftIndex = null;
      } else {
        _selectedLeftIndex = index;
        _checkMatch();
      }
    });
  }

  void _onRightItemTap(int index) {
    if (_isProcessingMatch || _matchedIds.contains(_rightItems[index].id)) return;
    
    setState(() {
      if (_selectedRightIndex == index) {
        _selectedRightIndex = null;
      } else {
        _selectedRightIndex = index;
        _checkMatch();
      }
    });
  }

  void _checkMatch() {
    if (_selectedLeftIndex != null && _selectedRightIndex != null) {
      final leftItem = _leftItems[_selectedLeftIndex!];
      final rightItem = _rightItems[_selectedRightIndex!];

      if (leftItem.id == rightItem.id) {
        // 정답
        setState(() {
          _matchedIds.add(leftItem.id);
          _selectedLeftIndex = null;
          _selectedRightIndex = null;
        });

        if (_matchedIds.length == 5) {
          Future.delayed(const Duration(milliseconds: 500), () {
            _handleSuccess();
          });
        }
      } else {
        // 오답 - 잠시 보여줬다가 선택 해제
        _isProcessingMatch = true;
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              _selectedLeftIndex = null;
              _selectedRightIndex = null;
              _isProcessingMatch = false;
            });
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _volumeTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    _stopAlarm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator(color: Colors.blueAccent)),
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
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(_alarm!.backgroundPath!)),
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      bgDecoration = const BoxDecoration(color: Color(0xFFFFD54F)); // Default Yellow
    }

    return Listener(
      onPointerDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        body: Container(
          decoration: bgDecoration,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.englishQuizMission,
                        style: const TextStyle(
                          fontSize: 24, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white, 
                          shadows: [Shadow(blurRadius: 8, color: Colors.black, offset: Offset(2, 2))]
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.quizInstruction,
                    style: const TextStyle(
                      fontSize: 18, 
                      color: Colors.white, 
                      fontWeight: FontWeight.w500,
                      shadows: [Shadow(blurRadius: 8, color: Colors.black, offset: Offset(1, 1))]
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Row(
                      children: [
                        // 좌측: 영어 단어
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(5, (index) {
                              final item = _leftItems[index];
                              final isMatched = _matchedIds.contains(item.id);
                              final isSelected = _selectedLeftIndex == index;
                              final isWrong = _isProcessingMatch && isSelected;

                              return GestureDetector(
                                onTap: () => _onLeftItemTap(index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    color: isMatched 
                                        ? Colors.green.withOpacity(0.4)
                                        : (isWrong 
                                            ? Colors.red.withOpacity(0.4)
                                            : (isSelected ? Colors.blue.withOpacity(0.4) : Colors.black.withOpacity(0.3))),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: isMatched 
                                          ? Colors.green.shade300 
                                          : (isWrong 
                                              ? Colors.red.shade300 
                                              : (isSelected ? Colors.blue.shade300 : Colors.white24)),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.text,
                                      style: const TextStyle(
                                        fontSize: 20, 
                                        fontWeight: FontWeight.bold, 
                                        color: Colors.white,
                                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // 우측: 한글 뜻
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(5, (index) {
                              final item = _rightItems[index];
                              final isMatched = _matchedIds.contains(item.id);
                              final isSelected = _selectedRightIndex == index;
                              final isWrong = _isProcessingMatch && isSelected;

                              return GestureDetector(
                                onTap: () => _onRightItemTap(index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    color: isMatched 
                                        ? Colors.green.withOpacity(0.4)
                                        : (isWrong 
                                            ? Colors.red.withOpacity(0.4)
                                            : (isSelected ? Colors.blue.withOpacity(0.4) : Colors.black.withOpacity(0.3))),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: isMatched 
                                          ? Colors.green.shade300 
                                          : (isWrong 
                                              ? Colors.red.shade300 
                                              : (isSelected ? Colors.blue.shade300 : Colors.white24)),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.text,
                                      style: const TextStyle(
                                        fontSize: 20, 
                                        fontWeight: FontWeight.bold, 
                                        color: Colors.white,
                                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


