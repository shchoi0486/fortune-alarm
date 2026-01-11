import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'providers/supplement_provider.dart';
import '../../alarm/ringtone_select_screen.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class SupplementAlarmScreen extends ConsumerStatefulWidget {
  const SupplementAlarmScreen({super.key});

  @override
  ConsumerState<SupplementAlarmScreen> createState() => _SupplementAlarmScreenState();
}

class _SupplementAlarmScreenState extends ConsumerState<SupplementAlarmScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double? _draggingVolume;
  Timer? _previewTimer;
  String? _playingPath;
  StateSetter? _ringtoneModalSetState;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _playingPath = null;
        });
        _ringtoneModalSetState?.call(() {});
      }
    });
  }

  @override
  void dispose() {
    _previewTimer?.cancel();
    _audioPlayer.dispose();
    FlutterRingtonePlayer().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(supplementProvider);
    final notifier = ref.read(supplementProvider.notifier);
    final settings = state.settings;

    final nextAlarmStr = _getNextAlarmString(settings.reminderTimes, settings.isAlarmEnabled);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: const Text('영양제 알림', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
              children: [
                if (nextAlarmStr.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 4),
                    child: Row(
                      children: [
                        Icon(Icons.alarm, size: 16, color: Colors.orange[700]),
                        const SizedBox(width: 8),
                        Text(
                          nextAlarmStr,
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                // Settings Container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('알림 미루기 시간', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('나중에 먹기 선택 시 기본 시간입니다', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          DropdownButton<int>(
                            value: settings.defaultSnoozeInterval,
                            underline: const SizedBox(),
                            items: [5, 10, 20, 30, 60].map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value >= 60 ? '1시간' : '$value분'),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) {
                                notifier.updateSettings(defaultSnoozeInterval: val);
                              }
                            },
                          ),
                        ],
                      ),
                      const Divider(height: 32),
                      // 벨소리 설정
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('알람 벨소리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        subtitle: Text(_getRingtoneTitle(settings.ringtonePath ?? 'default'), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                        onTap: () async {
                          final selectedPath = await showModalBottomSheet<String>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => RingtoneSelectScreen(
                              initialRingtonePath: settings.ringtonePath ?? 'default',
                            ),
                          );
                          if (selectedPath != null) {
                            notifier.updateSettings(ringtonePath: selectedPath);
                          }
                        },
                      ),
                      const Divider(height: 32),
                      // 볼륨 설정
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('알람 볼륨', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text('${((_draggingVolume ?? settings.volume) * 100).toInt()}%', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange)),
                            ],
                          ),
                          Slider(
                            value: _draggingVolume ?? settings.volume,
                            activeColor: Colors.orange,
                            onChanged: (val) {
                              setState(() {
                                _draggingVolume = val;
                              });
                            },
                            onChangeEnd: (val) {
                              setState(() {
                                _draggingVolume = null;
                              });
                              notifier.updateSettings(volume: val);
                              _playPreview(settings.ringtonePath ?? 'default', val);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('알림 시간 목록', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      if (settings.reminderTimes.length < 5)
                        TextButton.icon(
                          onPressed: () => _showCustomTimePicker(context, ref, settings.reminderTimes),
                          icon: const Icon(Icons.add_rounded, size: 20),
                          label: const Text('추가'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.orange[700],
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                    ],
                  ),
                ),
                if (settings.reminderTimes.isEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.notifications_off_outlined, size: 48, color: Colors.grey[300]),
                          const SizedBox(height: 12),
                          const Text('추가된 알림 시간이 없습니다', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  )
                else
                  ...settings.reminderTimes.asMap().entries.map((entry) {
                    final index = entry.key;
                    final timeStr = entry.value;
                    return _buildAlarmCard(context, ref, timeStr, index, settings.reminderTimes);
                  }),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getRingtoneTitle(String path) {
    if (path == 'default') return '기본 벨소리';
    
    // "Category/filename" -> "filename"
    final filename = path.split('/').last;
    
    // 언더바를 공백으로 변환하고 첫 글자 대문자화 등 포맷팅
    return filename.replaceAll('_', ' ');
  }

  void _playPreview(String path, double volume) async {
    // 이미 같은 소리가 재생 중이면 중지
    if (_playingPath == path) {
      await _audioPlayer.stop();
      await FlutterRingtonePlayer().stop();
      setState(() {
        _playingPath = null;
      });
      _ringtoneModalSetState?.call(() {});
      return;
    }

    _previewTimer?.cancel();
    await _audioPlayer.stop();
    await FlutterRingtonePlayer().stop();
    
    setState(() {
      _playingPath = path;
    });
    _ringtoneModalSetState?.call(() {});

    if (path == 'default') {
      await FlutterRingtonePlayer().playAlarm(volume: volume, looping: false);
      // FlutterRingtonePlayer는 완료 이벤트를 제공하지 않으므로 타이머 사용 (기본 벨소리만)
      _previewTimer = Timer(const Duration(seconds: 5), () {
        if (mounted && _playingPath == 'default') {
          setState(() {
            _playingPath = null;
          });
          _ringtoneModalSetState?.call(() {});
        }
      });
    } else {
      try {
        // assets/sounds/Category/filename.ogg
        await _audioPlayer.setSource(AssetSource('sounds/$path.ogg'));
        await _audioPlayer.setVolume(volume);
        await _audioPlayer.setReleaseMode(ReleaseMode.release); // 루프 제거
        await _audioPlayer.resume();
      } catch (e) {
        debugPrint('Error playing preview: $e');
        setState(() {
          _playingPath = null;
        });
        _ringtoneModalSetState?.call(() {});
      }
    }
  }

  Widget _buildAlarmCard(BuildContext context, WidgetRef ref, String timeStr, int index, List<String> currentTimes) {
    final parts = timeStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final period = hour >= 12 ? '오후' : '오전';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    final displayMinute = minute.toString().padLeft(2, '0');

    return Dismissible(
      key: Key('supplement_alarm_$timeStr'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final newList = List<String>.from(currentTimes);
        newList.removeAt(index);
        ref.read(supplementProvider.notifier).updateSettings(reminderTimes: newList);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('알림 시간이 삭제되었습니다'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      background: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_forever, color: Colors.white, size: 28),
      ),
      child: InkWell(
        onTap: () => _showCustomTimePicker(context, ref, currentTimes, index: index),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      period,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${displayHour.toString().padLeft(2, '0')}:$displayMinute',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  String _getNextAlarmString(List<String> reminderTimes, bool isEnabled) {
    if (!isEnabled || reminderTimes.isEmpty) return '';

    final now = DateTime.now();
    DateTime? nextAlarmTime;

    for (final timeStr in reminderTimes) {
      try {
        final parts = timeStr.split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);

        var alarmTime = DateTime(now.year, now.month, now.day, hour, minute);
        if (alarmTime.isBefore(now)) {
          alarmTime = alarmTime.add(const Duration(days: 1));
        }

        if (nextAlarmTime == null || alarmTime.isBefore(nextAlarmTime)) {
          nextAlarmTime = alarmTime;
        }
      } catch (e) {
        continue;
      }
    }

    if (nextAlarmTime == null) return '';

    final difference = nextAlarmTime.difference(now);
    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;

    if (hours == 0 && minutes == 0) return '1분 미만 후에 울려요';
    if (hours > 0) return '$hours시간 $minutes분 후에 울려요';
    return '$minutes분 후에 울려요';
  }

  void _showCustomTimePicker(BuildContext context, WidgetRef ref, List<String> currentTimes, {int? index}) {
    int initialHour = 9;
    int initialMinute = 0;

    if (index != null) {
      final parts = currentTimes[index].split(':');
      initialHour = int.parse(parts[0]);
      initialMinute = int.parse(parts[1]);
    }

    int selectedHour = initialHour;
    int selectedMinute = initialMinute;
    bool isPm = selectedHour >= 12;
    int displayHour = selectedHour > 12 ? selectedHour - 12 : (selectedHour == 0 ? 12 : selectedHour);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('취소', style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                      Text(
                        index == null ? '알림 시간 추가' : '알림 시간 수정',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          final formatted = '${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')}';
                          final newList = List<String>.from(currentTimes);
                          
                          if (index == null) {
                            if (!newList.contains(formatted)) {
                              newList.add(formatted);
                            }
                          } else {
                            newList[index] = formatted;
                          }
                          
                          newList.sort();
                          ref.read(supplementProvider.notifier).updateSettings(reminderTimes: newList);
                          Navigator.pop(context);
                        },
                        child: Text('저장', style: TextStyle(color: Colors.orange[700], fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // AM/PM Picker
                        SizedBox(
                          width: 80,
                          child: CupertinoPicker(
                            itemExtent: 50,
                            useMagnifier: true,
                            magnification: 1.2,
                            scrollController: FixedExtentScrollController(initialItem: isPm ? 1 : 0),
                            onSelectedItemChanged: (idx) {
                              setModalState(() {
                                isPm = idx == 1;
                                if (isPm && selectedHour < 12) {
                                  selectedHour += 12;
                                } else if (!isPm && selectedHour >= 12) {
                                  selectedHour -= 12;
                                }
                              });
                            },
                            children: const [
                              Center(child: Text('오전', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                              Center(child: Text('오후', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        // Hour Picker
                        SizedBox(
                          width: 80,
                          child: CupertinoPicker(
                            itemExtent: 50,
                            useMagnifier: true,
                            magnification: 1.2,
                            looping: true,
                            scrollController: FixedExtentScrollController(initialItem: displayHour - 1),
                            onSelectedItemChanged: (idx) {
                              setModalState(() {
                                displayHour = idx + 1;
                                if (isPm) {
                                  selectedHour = displayHour == 12 ? 12 : displayHour + 12;
                                } else {
                                  selectedHour = displayHour == 12 ? 0 : displayHour;
                                }
                              });
                            },
                            children: List.generate(12, (idx) => Center(
                              child: Text((idx + 1).toString().padLeft(2, '0'), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                            )),
                          ),
                        ),
                        const Text(':', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                        // Minute Picker
                        SizedBox(
                          width: 80,
                          child: CupertinoPicker(
                            itemExtent: 50,
                            useMagnifier: true,
                            magnification: 1.2,
                            looping: true,
                            scrollController: FixedExtentScrollController(initialItem: selectedMinute),
                            onSelectedItemChanged: (idx) {
                              setModalState(() {
                                selectedMinute = idx;
                              });
                            },
                            children: List.generate(60, (idx) => Center(
                              child: Text(idx.toString().padLeft(2, '0'), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

