import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_alarm_screen.dart';

class FirstAlarmStepScreen extends ConsumerStatefulWidget {
  const FirstAlarmStepScreen({super.key});

  @override
  ConsumerState<FirstAlarmStepScreen> createState() => _FirstAlarmStepScreenState();
}

class _FirstAlarmStepScreenState extends ConsumerState<FirstAlarmStepScreen> {
  late DateTime _selectedTime;
  late FixedExtentScrollController _ampmController;
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;

  @override
  void initState() {
    super.initState();
    // [사용자 요청] 초기 시간을 오전 7:00로 설정
    final now = DateTime.now();
    _selectedTime = DateTime(now.year, now.month, now.day, 7, 0);
    
    // 만약 오전 7시가 이미 지났다면 다음날 오전 7시로 설정
    if (_selectedTime.isBefore(now)) {
      _selectedTime = _selectedTime.add(const Duration(days: 1));
    }
    
    _ampmController = FixedExtentScrollController(initialItem: 0); // 오전(AM)
    _hourController = FixedExtentScrollController(initialItem: 6); // 7시 (0부터 시작하므로 6)
    _minuteController = FixedExtentScrollController(initialItem: 0); // 00분
  }

  @override
  void dispose() {
    _ampmController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _updateTime() {
    final isPm = _ampmController.selectedItem == 1;
    int hour = _hourController.selectedItem + 1;
    final minute = _minuteController.selectedItem;

    if (isPm && hour < 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;

    final now = DateTime.now();
    var newTime = DateTime(now.year, now.month, now.day, hour, minute);
    
    // 만약 설정한 시간이 현재보다 이전이면 다음날로 설정
    if (newTime.isBefore(now)) {
      newTime = newTime.add(const Duration(days: 1));
    }
    
    setState(() {
      _selectedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 0, // AppBar 영역을 최소화하여 상태바와 일체감 형성
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // 상단 닫기 버튼 영역
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: const EdgeInsets.all(16),
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Brand Logo & Name
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/Fortune Icon_tran.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      l10n.appTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // Welcome & Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      l10n.welcomeMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.whenToRing,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.0,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Time Picker
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 64,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // AM/PM
                        SizedBox(
                          width: 70,
                          child: CupertinoPicker(
                            scrollController: _ampmController,
                            itemExtent: 60,
                            onSelectedItemChanged: (_) => _updateTime(),
                            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent),
                            children: [
                              Center(child: Text('☀️ ${l10n.am}', style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),
                              Center(child: Text('🌙 ${l10n.pm}', style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        // Hour
                        SizedBox(
                          width: 70,
                          child: CupertinoPicker(
                            scrollController: _hourController,
                            itemExtent: 60,
                            onSelectedItemChanged: (_) => _updateTime(),
                            looping: true,
                            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent),
                            children: List.generate(12, (index) {
                              return Center(
                                child: Text(
                                  (index + 1).toString().padLeft(2, '0'),
                                  style: const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                              );
                            }),
                          ),
                        ),
                        const Text(':', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                        // Minute
                        SizedBox(
                          width: 70,
                          child: CupertinoPicker(
                            scrollController: _minuteController,
                            itemExtent: 60,
                            onSelectedItemChanged: (_) => _updateTime(),
                            looping: true,
                            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent),
                            children: List.generate(60, (index) {
                              return Center(
                                child: Text(
                                  index.toString().padLeft(2, '0'),
                                  style: const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              // Next Button
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAlarmScreen(initialTime: _selectedTime),
                        ),
                      );
                      
                      if (result == true && mounted) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('first_run_completed', true);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7F27),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 2,
                      shadowColor: const Color(0xFFFF7F27).withOpacity(0.5),
                    ),
                    child: Text(
                      l10n.next,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
