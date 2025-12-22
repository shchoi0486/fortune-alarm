import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:async';

import 'providers/supplement_provider.dart';

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
                // Main Toggle
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
                              Text('알림 활성화', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('설정한 시간에 알림을 보내드려요', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          Switch(
                            value: settings.isAlarmEnabled,
                            activeThumbColor: Colors.orange[700],
                            onChanged: (val) async {
                              if (val) {
                                if (Platform.isAndroid) {
                                  // 정확한 알람 권한 확인
                                  final status = await Permission.scheduleExactAlarm.status;
                                  if (status.isDenied) {
                                    // 권한 요청
                                    // Android 12+에서는 scheduleExactAlarm 권한이 별도로 관리됨
                                    // request() 호출 시 시스템 정책에 따라 다르게 동작할 수 있음
                                    final result = await Permission.scheduleExactAlarm.request();
                                    
                                    if (!result.isGranted) {
                                      if (context.mounted) {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text('알람 권한 필요'),
                                            content: const Text('정확한 시간에 알람을 울리기 위해 권한 설정이 필요합니다.\n설정 화면으로 이동하시겠습니까?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(ctx),
                                                child: const Text('취소'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(ctx);
                                                  openAppSettings();
                                                },
                                                child: const Text('설정으로 이동'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return; // 권한 없으면 켜지 않음
                                    }
                                  }
                                }
                              }
                              notifier.updateSettings(isAlarmEnabled: val);
                            },
                          ),
                        ],
                      ),
                      if (settings.isAlarmEnabled) ...[
                        const Divider(height: 32),
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
                          onTap: () => _showRingtonePicker(context, settings.ringtonePath ?? 'default', settings.volume),
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
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                if (settings.isAlarmEnabled) ...[
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 12),
                    child: Text('알림 시간 목록', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  
                  if (settings.reminderTimes.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.notifications_off_outlined, size: 48, color: Colors.grey[300]),
                            const SizedBox(height: 16),
                            const Text('설정된 알림 시간이 없습니다', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: settings.reminderTimes.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return _buildAlarmCard(context, ref, settings.reminderTimes[index], index, settings.reminderTimes);
                      },
                    ),
                ],
              ],
            ),
            
            // Floating Action Button for adding time
            if (settings.isAlarmEnabled)
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton.extended(
                  onPressed: () => _showCustomTimePicker(context, ref, settings.reminderTimes),
                  backgroundColor: Colors.orange[700],
                  icon: const Icon(Icons.add_alarm, color: Colors.white),
                  label: const Text('시간 추가', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getRingtoneTitle(String path) {
    switch (path) {
      case 'default': return '기본 벨소리';
      case 'alarm_sound': return '클래식 알람';
      case 'morning': return '디지털 알람';
      case 'birds': return '새소리';
      case 'waves': return '파도 소리';
      default: return '기본 벨소리';
    }
  }

  void _showRingtonePicker(BuildContext context, String currentPath, double volume) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final settings = ref.watch(supplementProvider).settings;
            final ringtonePath = settings.ringtonePath ?? 'default';
            
            return ListView(
              shrinkWrap: true,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("벨소리 선택", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildRingtoneItem("기본 벨소리", 'default', ringtonePath, volume),
                _buildRingtoneItem("클래식 알람", 'alarm_sound', ringtonePath, volume),
                _buildRingtoneItem("디지털 알람", 'morning', ringtonePath, volume),
                _buildRingtoneItem("새소리", 'birds', ringtonePath, volume),
                _buildRingtoneItem("파도 소리", 'waves', ringtonePath, volume),
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

  Widget _buildRingtoneItem(String title, String path, String currentPath, double volume) {
    final isSelected = currentPath == path;
    return ListTile(
      title: Text(title, style: TextStyle(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? Colors.orange : Colors.black87,
      )),
      trailing: isSelected ? const Icon(Icons.check, color: Colors.orange) : null,
      onTap: () {
        ref.read(supplementProvider.notifier).updateSettings(ringtonePath: path);
        _playPreview(path, volume);
      },
    );
  }

  void _playPreview(String path, double volume) async {
    _previewTimer?.cancel();
    await _audioPlayer.stop();
    await FlutterRingtonePlayer().stop();
    
    if (path == 'default') {
      await FlutterRingtonePlayer().playAlarm(volume: volume, looping: true);
    } else {
      try {
        await _audioPlayer.setSource(AssetSource('sounds/$path.ogg'));
        await _audioPlayer.setVolume(volume);
        await _audioPlayer.setReleaseMode(ReleaseMode.loop);
        await _audioPlayer.resume();
      } catch (e) {
        debugPrint('Error playing preview: $e');
      }
    }

    // 5초 후에 정지
    _previewTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        _audioPlayer.stop();
        FlutterRingtonePlayer().stop();
      }
    });
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

