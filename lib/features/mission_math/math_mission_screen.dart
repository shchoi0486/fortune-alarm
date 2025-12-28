import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:collection/collection.dart'; // for firstWhereOrNull
import 'package:hive_flutter/hive_flutter.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../services/notification_service.dart';
import '../../data/models/math_difficulty.dart';
import '../../data/models/alarm_model.dart';
import 'package:fortune_alarm/providers/alarm_list_provider.dart';
import '../../core/constants/positive_messages.dart';

class MathMissionScreen extends ConsumerStatefulWidget {
  final String? alarmId;

  const MathMissionScreen({super.key, this.alarmId});

  @override
  ConsumerState<MathMissionScreen> createState() => _MathMissionScreenState();
}

class _MathMissionScreenState extends ConsumerState<MathMissionScreen> with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _volumeTimer;
  Timer? _inactivityTimer;
  late int _num1;
  late int _num2;
  late String _operator;
  late int _answer;
  String _input = '';
  String _feedback = '문제를 풀어주세요.';
  
  bool _showCorrectAnimation = false;
  bool _isLastProblem = false;
  String _lastMessage = '';
  
  // 성공 횟수 관리 (3문제 맞춰야 해제 등)
  int _solvedCount = 0;
  int _targetCount = 3;
  MathDifficulty _difficulty = MathDifficulty.normal;
  AlarmModel? _alarm;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _loadAlarmSettings();
    _generateProblem(); // 초기 문제 생성 (기본값)
    _startInactivityTimer();
    
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    
    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // 시스템 바 설정 (투명 배경 및 가독성 확보)
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // 어두운 배경에서 밝은 아이콘 (흰색)
      statusBarBrightness: Brightness.dark, // iOS용
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 2), () {
      if (mounted) {
        debugPrint('[MathMissionScreen] Inactivity timeout - returning to ringing screen');
        Navigator.of(context).pop('timeout');
      }
    });
  }

  void _resetInactivityTimer() {
    _startInactivityTimer();
  }

  void _onKeyTap(String key) {
    _resetInactivityTimer(); // 입력 시 타이머 리셋
    setState(() {
      if (key == 'C') {
        _input = '';
      } else if (key == 'DEL') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else {
        if (_input.length < 10) { // 입력 길이 제한
          _input += key;
        }
      }
    });

    if (_input.isNotEmpty) {
      _checkAnswer(isAuto: true);
    }
  }

  Future<void> _loadAlarmSettings() async {
    if (widget.alarmId == null) return;
    
    // Try Provider first
    final alarmList = ref.read(alarmListProvider);
    var alarm = alarmList.firstWhereOrNull((a) => a.id == widget.alarmId);
    
    // If not found in provider, try Hive
    if (alarm == null) {
       try {
         final box = await Hive.openBox<AlarmModel>('alarms');
         alarm = box.get(widget.alarmId);
       } catch (e) {
         debugPrint('Error loading alarm settings: $e');
       }
    }

    if (alarm != null && mounted) {
      setState(() {
        _alarm = alarm;
        _targetCount = alarm!.mathProblemCount;
        _difficulty = alarm.mathDifficulty;
        _generateProblem(); // 설정된 난이도로 문제 재생성
      });
    }
  }

  void _generateProblem() {
    final random = Random();
    
    // 1자리(1~9) 또는 2자리(10~99) 숫자 생성 헬퍼 함수
    int getRandomNum() => random.nextBool() ? random.nextInt(9) + 1 : random.nextInt(90) + 10;

    switch (_difficulty) {
      case MathDifficulty.easy:
        // Easy: 1자리 또는 2자리 숫자, + 기호만
        _operator = '+';
        _num1 = getRandomNum();
        _num2 = getRandomNum();
        // 큰 숫자가 먼저 나오도록 정렬
        if (_num1 < _num2) {
          final temp = _num1;
          _num1 = _num2;
          _num2 = temp;
        }
        _answer = _num1 + _num2;
        break;

      case MathDifficulty.normal:
        // Normal: 1자리 또는 2자리 숫자, +, - 섞어서
        if (random.nextBool()) {
          _operator = '+';
          _num1 = getRandomNum();
          _num2 = getRandomNum();
          // 큰 숫자가 먼저 나오도록 정렬
          if (_num1 < _num2) {
            final temp = _num1;
            _num1 = _num2;
            _num2 = temp;
          }
          _answer = _num1 + _num2;
        } else {
          _operator = '-';
          _num1 = getRandomNum();
          _num2 = getRandomNum();
          
          if (_num1 < _num2) {
            final temp = _num1;
            _num1 = _num2;
            _num2 = temp;
          }
          _answer = _num1 - _num2;
        }
        break;

      case MathDifficulty.hard:
        // Hard: 1자리 또는 2자리 숫자, +, -, x 섞어서
        int opType = random.nextInt(3); // 0: +, 1: -, 2: x
        
        if (opType == 0) { // +
          _operator = '+';
          _num1 = getRandomNum();
          _num2 = getRandomNum();
          // 큰 숫자가 먼저 나오도록 정렬
          if (_num1 < _num2) {
            final temp = _num1;
            _num1 = _num2;
            _num2 = temp;
          }
          _answer = _num1 + _num2;
        } else if (opType == 1) { // -
          _operator = '-';
          _num1 = getRandomNum();
          _num2 = getRandomNum();
          
          if (_num1 < _num2) {
            final temp = _num1;
            _num1 = _num2;
            _num2 = temp;
          }
          _answer = _num1 - _num2;
        } else { // x
          _operator = 'x';
          _num1 = getRandomNum();
          _num2 = getRandomNum();
          // 큰 숫자가 먼저 나오도록 정렬
          if (_num1 < _num2) {
            final temp = _num1;
            _num1 = _num2;
            _num2 = temp;
          }
          _answer = _num1 * _num2;
        }
        break;
    }
    
    setState(() {
      _input = '';
      _feedback = '문제를 풀어주세요.';
    });
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
        final int stableId = AlarmSchedulerService.getStableId(widget.alarmId!);
        await NotificationService().cancelNotification(stableId);
      }
    } catch (e) {
      debugPrint('Error stopping alarm: $e');
    }
  }

  void _checkAnswer({bool isAuto = false}) {
    if (_input == _answer.toString()) {
      _solvedCount++;
      
      final isLast = _solvedCount >= _targetCount;
      
      // 정답 애니메이션 시작
      setState(() {
        _showCorrectAnimation = true;
        _isLastProblem = isLast;
        if (isLast) {
          final random = Random();
          _lastMessage = PositiveMessages.messages[random.nextInt(PositiveMessages.messages.length)];
          _feedback = '미션 완료!';
        } else {
          _feedback = '정답입니다!';
        }
      });

      // 대기 시간 (마지막 문제면 좀 더 길게 2.0초, 아니면 0.6초)
      final delayMs = isLast ? 2000 : 600;

      Future.delayed(Duration(milliseconds: delayMs), () {
        if (!mounted) return;
        
        setState(() {
          _showCorrectAnimation = false;
        });

        if (isLast) {
          _handleSuccess();
        } else {
          _generateProblem();
          setState(() {
            _input = '';
            _feedback = '문제를 풀어주세요.';
          });
        }
      });
    } else {
      if (!isAuto) {
        setState(() {
          _feedback = '틀렸습니다. 다시 시도하세요.';
          _input = '';
        });
      }
    }
  }

  void _handleSuccess() {
    _stopAlarm();
    // ref.read(alarmListProvider.notifier).completeAlarm(widget.alarmId!); // <--- AlarmRingingScreen에서 처리하도록 제거
    if (mounted) {
      debugPrint('[MathMissionScreen] Mission success - popping to AlarmRingingScreen');
      // 미션 성공 결과를 AlarmRingingScreen으로 전달
      Navigator.of(context).pop(true);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _volumeTimer?.cancel();
    _inactivityTimer?.cancel();
    _audioPlayer.dispose();
    _stopAlarm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightBg = true; // 기본적으로 밝은 배경(노란색)으로 가정
    BoxDecoration bgDecoration;

    if (_alarm != null && _alarm!.backgroundPath != null) {
      if (_alarm!.backgroundPath!.startsWith('color:')) {
        int colorValue = int.parse(_alarm!.backgroundPath!.split(':')[1]);
        Color color = Color(colorValue);
        bgDecoration = BoxDecoration(color: color);
        isLightBg = color.computeLuminance() > 0.5;
      } else if (_alarm!.backgroundPath!.startsWith('assets/')) {
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_alarm!.backgroundPath!),
            fit: BoxFit.cover,
          ),
        );
        isLightBg = false; // 이미지는 보통 어두운 텍스트(흰색)를 위해 어둡게 처리하거나 쉐도우 사용
      } else {
        bgDecoration = BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(_alarm!.backgroundPath!)),
            fit: BoxFit.cover,
          ),
        );
        isLightBg = false;
      }
    } else {
      bgDecoration = const BoxDecoration(color: Color(0xFFFFD54F)); // Default Yellow
      isLightBg = true;
    }

    // 밝은 배경일 경우 검은색 텍스트, 어두운 배경일 경우 흰색 텍스트
    final Color textColor = isLightBg ? Colors.black87 : Colors.white;
    final Color hintColor = isLightBg ? Colors.black38 : Colors.white24;
    final Color shadowColor = isLightBg ? Colors.white.withOpacity(0.5) : Colors.black26;

    return Listener(
      onPointerDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        extendBodyBehindAppBar: true, // 시스템 바가 배경 위에 나타나도록 함
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: bgDecoration,
            ),
            SafeArea(
              bottom: false, // 하단 키패드는 자체 패딩 사용
              child: Column(
                children: [
                  // 상단 상태바 및 진행도
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: isLightBg ? Colors.black.withOpacity(0.05) : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: isLightBg ? Colors.black12 : Colors.white.withOpacity(0.3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.calculate, size: 16, color: textColor),
                              const SizedBox(width: 6),
                              Text(
                                '${_solvedCount >= _targetCount ? _targetCount : _solvedCount + 1} / $_targetCount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isLightBg ? Colors.black.withOpacity(0.05) : Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.close, color: textColor, size: 18),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 문제 영역 (상단으로 정렬하여 키패드와 거리 확보)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start, // 중앙 대신 상단 정렬
                        children: [
                          // 문제 카드
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isLightBg ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isLightBg ? Colors.white.withOpacity(0.5) : Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                // 문제 텍스트
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '$_num1 $_operator $_num2',
                                    style: TextStyle(
                                      fontSize: 60, // 72 -> 60으로 더 줄임 (사용자 요청)
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                      letterSpacing: -2,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // 입력 영역
                                Container(
                                  constraints: const BoxConstraints(minHeight: 60), // 80 -> 60으로 줄임
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 200),
                                        child: _input.isEmpty 
                                          ? ScaleTransition(
                                              scale: _pulseAnimation,
                                              child: Text(
                                                '?',
                                                key: const ValueKey('empty'),
                                                style: TextStyle(
                                                  fontSize: 40, // 48 -> 40
                                                  fontWeight: FontWeight.w300,
                                                  color: textColor.withOpacity(0.3),
                                                ),
                                              ),
                                            )
                                          : Text(
                                              _input,
                                              key: ValueKey(_input),
                                              style: TextStyle(
                                                fontSize: 44, // 52 -> 44
                                                fontWeight: FontWeight.bold,
                                                color: isLightBg ? Colors.blue[800] : Colors.blue[300],
                                                letterSpacing: 4,
                                              ),
                                            ),
                                      ),
                                      const SizedBox(height: 2),
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        width: _input.isEmpty ? 40 : 120,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          gradient: LinearGradient(
                                            colors: _input.isEmpty 
                                              ? [Colors.transparent, textColor.withOpacity(0.1), Colors.transparent]
                                              : [Colors.transparent, Colors.blueAccent, Colors.transparent],
                                          ),
                                          boxShadow: _input.isEmpty ? [] : [
                                            BoxShadow(
                                              color: Colors.blueAccent.withOpacity(0.5),
                                              blurRadius: 10,
                                              spreadRadius: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15), // 20 -> 15
                                // 피드백 메시지
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    _feedback,
                                    key: ValueKey(_feedback),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15, // 16 -> 15
                                      color: _feedback.startsWith('정답') 
                                          ? Colors.green[700] 
                                          : (_feedback == '문제를 풀어주세요.' ? (isLightBg ? Colors.black54 : Colors.white70) : Colors.redAccent),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(), // 남은 공간을 밀어내어 키패드와 분리
                        ],
                      ),
                    ),
                  ),

                  // 커스텀 키패드 영역
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 25), // 하단 여백 확보
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 키패드 핸들러
                        Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        // 키패드 그리드
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          childAspectRatio: 1.8, // 버튼을 더 큼직하고 누르기 좋게 (상단 공간을 확보했으므로 가능)
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          children: [
                            _buildKey('1'),
                            _buildKey('2'),
                            _buildKey('3'),
                            _buildKey('4'),
                            _buildKey('5'),
                            _buildKey('6'),
                            _buildKey('7'),
                            _buildKey('8'),
                            _buildKey('9'),
                            _buildKey('C', color: Colors.red[50]!, textColor: Colors.redAccent),
                            _buildKey('0'),
                            _buildKey('DEL', color: Colors.blue[50]!, textColor: Colors.blueAccent),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // 정답 오버레이 애니메이션 (기존 로직 유지)
            if (_showCorrectAnimation)
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: _showCorrectAnimation ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 80,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              _isLastProblem ? '미션 완료!' : '정답!',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                shadows: [
                                  Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                            if (_isLastProblem && _lastMessage.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  _lastMessage,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

  Widget _buildKey(String label, {Color color = const Color(0xFFF5F5F5), Color textColor = Colors.black87}) {
    return InkWell(
      onTap: () => _onKeyTap(label),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
