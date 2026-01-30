import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'models/water_log.dart';

class WaterRecordScreen extends ConsumerStatefulWidget {
  const WaterRecordScreen({super.key});

  @override
  ConsumerState<WaterRecordScreen> createState() => _WaterRecordScreenState();
}

class _WaterRecordScreenState extends ConsumerState<WaterRecordScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Box<WaterLog>? _logBox;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    if (Hive.isBoxOpen('water_logs')) {
      _logBox = Hive.box<WaterLog>('water_logs');
    } else {
      _logBox = await Hive.openBox<WaterLog>('water_logs');
    }
    setState(() {
      _isLoading = false;
    });
  }

  List<WaterLog> _getEventsForDay(DateTime day) {
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
    final l10n = AppLocalizations.of(context)!;
    if (_logBox == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white, // Light grey background like image
      appBar: AppBar(
        title: Text(l10n.summary, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMonthlySummary(context),
              const SizedBox(height: 20),
              _buildCalendar(context),
              const SizedBox(height: 20),
              _buildLegend(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthlySummary(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final isCurrentMonth = now.year == _focusedDay.year && now.month == _focusedDay.month;
    
    // Calculate stats for the month
    // If current month, calculate up to yesterday. If past month, calculate all days.
    
    int totalDays = 0;
    int successDays = 0;
    
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
    
    if (isCurrentMonth && now.day == 1 && calculationStart.isAfter(now.subtract(const Duration(days: 1)))) {
       // Just started the month and calculationStart is after yesterday (e.g. today is 1st, start is today)
       totalDays = 0;
    } else {
       // Calculate days from calculationStart to endDate
       if (firstDayOfMonth.isAfter(now)) {
         totalDays = 0; // Future month
       } else if (endDate.isBefore(calculationStart)) {
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
        const Icon(Icons.local_drink, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Text(
          l10n.monthlySummary,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        if (totalDays > 0)
          Text(
            l10n.monthlySuccessRate(_focusedDay.month, percentage.toString(), successDays, totalDays),
            style: const TextStyle(fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.bold),
          )
        else
          Text(
            l10n.noMonthlyRecord(_focusedDay.month),
             style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildCalendar(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
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
      child: TableCalendar<WaterLog>(
        locale: locale,
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: {CalendarFormat.month: l10n.monthView},
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
            
            // Prioritize Goal Achieved (Blue) over just Intake (Gray)
            if (log.isGoalAchieved) {
               return Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFF4FC3F7), // Light Blue
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${date.day}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            } else if (log.currentIntake > 0) {
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
             // Custom Today Builder to not conflict with markers if we want markers to override today style
             // Or we can just let markers handle it if there's an event.
             // If no event, show default today circle.
             final events = _getEventsForDay(date);
             if (events.isNotEmpty && (events.first.isGoalAchieved || events.first.currentIntake > 0)) {
               return null; // Let marker builder handle it
             }
             return Container(
               margin: const EdgeInsets.all(6),
               decoration: BoxDecoration(
                 border: Border.all(color: const Color(0xFF4FC3F7)),
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

  Widget _buildLegend(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        _legendItem(Colors.grey[300]!, l10n.waterIntake),
        const SizedBox(width: 20),
        _legendItem(const Color(0xFF4FC3F7), l10n.goalAchievedTitle),
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
