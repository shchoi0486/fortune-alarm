import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  final List<String> _laps = [];

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _onStartStopPressed() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _stopTimer();
    } else {
      _stopwatch.start();
      _startTimer();
    }
    setState(() {});
  }

  void _onResetLapPressed() {
    if (_stopwatch.isRunning) {
      // Lap 기능
      setState(() {
        _laps.insert(0, _formatTime(_stopwatch.elapsedMilliseconds));
      });
    } else {
      // Reset 기능
      _stopwatch.reset();
      setState(() {
        _laps.clear();
      });
    }
  }

  String _formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr.$hundredsStr";
  }

  @override
  void dispose() {
    if (_stopwatch.isRunning) {
      _stopTimer();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('스톱워치')),
      body: Column(
        children: [
          // 시간 표시 영역
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                _formatTime(_stopwatch.elapsedMilliseconds),
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w200, // 얇은 폰트 스타일
                  fontFeatures: [FontFeature.tabularFigures()], // 숫자 너비 고정
                ),
              ),
            ),
          ),
          
          // 버튼 영역
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Reset/Lap 버튼
                ElevatedButton(
                  onPressed: _onResetLapPressed,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    _stopwatch.isRunning ? '랩' : '초기화',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                
                // Start/Stop 버튼
                ElevatedButton(
                  onPressed: _onStartStopPressed,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(32),
                    backgroundColor: _stopwatch.isRunning ? Colors.redAccent : Colors.greenAccent,
                  ),
                  child: Text(
                    _stopwatch.isRunning ? '중지' : '시작',
                    style: TextStyle(
                      color: _stopwatch.isRunning ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // 랩타임 리스트 영역
          Expanded(
            flex: 4,
            child: ListView.separated(
              itemCount: _laps.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                // 랩 번호는 역순으로 계산
                final lapIndex = _laps.length - index;
                return ListTile(
                  leading: Text('랩 $lapIndex', style: const TextStyle(fontSize: 16)),
                  trailing: Text(
                    _laps[index],
                    style: const TextStyle(fontSize: 18, fontFamily: 'monospace'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
