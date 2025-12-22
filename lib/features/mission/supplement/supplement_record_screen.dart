import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'models/supplement_log.dart';

class SupplementRecordScreen extends ConsumerStatefulWidget {
  const SupplementRecordScreen({super.key});

  @override
  ConsumerState<SupplementRecordScreen> createState() => _SupplementRecordScreenState();
}

class _SupplementRecordScreenState extends ConsumerState<SupplementRecordScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Box<SupplementLog>? _logBox;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    if (Hive.isBoxOpen('supplement_logs')) {
      _logBox = Hive.box<SupplementLog>('supplement_logs');
    } else {
      _logBox = await Hive.openBox<SupplementLog>('supplement_logs');
    }
    setState(() {
      _isLoading = false;
    });
  }

  List<SupplementLog> _getEventsForDay(DateTime day) {
    if (_logBox == null) return [];
    final dateKey = DateFormat('yyyy-MM-dd').format(day);
    final log = _logBox!.get(dateKey);
    if (log != null) {
      return [log];
    }
    return [];
  }

  DateTime? _getStartDate() {
    if (_logBox == null || _logBox!.isEmpty) return null;
    
    // Assuming keys are "yyyy-MM-dd" strings, we can sort them or just iterate.
    // Iterating is safer in case of non-date keys (though unlikely given our code).
    DateTime? minDate;
    for (var key in _logBox!.keys) {
      if (key is String) {
        try {
          final date = DateFormat('yyyy-MM-dd').parse(key);
          if (minDate == null || date.isBefore(minDate)) {
            minDate = date;
          }
        } catch (e) {
          // ignore
        }
      }
    }
    return minDate;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('미션 기록', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMonthlySummary(),
            const SizedBox(height: 20),
            _buildCalendar(),
            const SizedBox(height: 20),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlySummary() {
    final now = DateTime.now();
    final isCurrentMonth = now.year == _focusedDay.year && now.month == _focusedDay.month;
    
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    
    final endDate = isCurrentMonth ? now.subtract(const Duration(days: 1)) : lastDayOfMonth;
    
    // Determine the actual start day for this month's calculation
    // Start counting from the mission creation date (earliest log date)
    final missionStartDate = _getStartDate();
    DateTime calculationStart = firstDayOfMonth;
    
    if (missionStartDate != null && missionStartDate.isAfter(firstDayOfMonth)) {
      calculationStart = missionStartDate;
    }
    
    int totalDays = 0;
    int successDays = 0;

    if (isCurrentMonth && now.day == 1 && calculationStart.isAfter(now.subtract(const Duration(days: 1)))) {
       // Just started the month and calculationStart is after yesterday (e.g. today is 1st, start is today)
       totalDays = 0;
    } else {
       if (endDate.isBefore(calculationStart)) {
         totalDays = 0;
       } else {
         totalDays = endDate.difference(calculationStart).inDays + 1;
       }
    }

    if (totalDays > 0) {
      for (int i = 0; i < totalDays; i++) {
        final date = calculationStart.add(Duration(days: i));
        final dateKey = DateFormat('yyyy-MM-dd').format(date);
        final log = _logBox!.get(dateKey);
        if (log != null && log.isGoalAchieved) {
          successDays++;
        }
      }
    }

    final percentage = totalDays == 0 ? 0 : ((successDays / totalDays) * 100).toInt();

    return Row(
      children: [
        const Icon(Icons.medication, color: Colors.orangeAccent),
        const SizedBox(width: 8),
        const Text(
          '월간 요약',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        if (totalDays > 0)
          Text(
            '${_focusedDay.month}월 성공률: $percentage% ($successDays/$totalDays)',
            style: const TextStyle(fontSize: 16, color: Colors.orangeAccent, fontWeight: FontWeight.bold),
          )
        else
          Text(
            '${_focusedDay.month}월 기록 없음',
             style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: TableCalendar<SupplementLog>(
        locale: 'ko_KR',
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        eventLoader: _getEventsForDay,
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
        ),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(color: Colors.red),
          holidayTextStyle: TextStyle(color: Colors.red),
        ),
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isEmpty) return null;
            final log = events.first;
            
            if (log.isGoalAchieved) {
               return Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${date.day}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            } else if (log.currentCount > 0) {
               return Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                 child: Text(
                  '${date.day}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            }
            return null;
          },
          todayBuilder: (context, date, _) {
             final events = _getEventsForDay(date);
             if (events.isNotEmpty && (events.first.isGoalAchieved || events.first.currentCount > 0)) {
               return null; 
             }
             return Container(
               margin: const EdgeInsets.all(6),
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.orangeAccent),
                 shape: BoxShape.circle,
               ),
               alignment: Alignment.center,
               child: Text(
                 '${date.day}',
                 style: const TextStyle(color: Colors.black),
               ),
             );
          },
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _legendItem(Colors.grey[300]!, '섭취 기록'),
        const SizedBox(width: 20),
        _legendItem(Colors.orangeAccent, '목표 달성'),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
