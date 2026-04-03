import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/calendar_event.dart';
import 'services/calendar_service.dart';
import 'services/holiday_service.dart';
import 'widgets/add_event_sheet.dart';
import '../../services/alarm_scheduler_service.dart';
import '../../data/models/alarm_model.dart';
import '../../core/constants/mission_type.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/theme_provider.dart';

enum CalendarViewMode { year, month, week, day }

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late final ValueNotifier<List<CalendarEvent>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _lastClickedDay;
  DateTime? _lastClickedTime;
  
  final CalendarService _calendarService = CalendarService();
  final HolidayService _holidayService = HolidayService();
  bool _isMemoMode = false;
  
  // 테마 및 UI 상태
  Color _themeColor = const Color(0xFFF97316); // 기본 테마를 선명한 오렌지색으로 변경
  CalendarViewMode _viewMode = CalendarViewMode.month;
  bool _isExpanded = false;
  bool _isViewSelectorOpen = false;
  
  Color _getAccentColor(bool isDark) {
    if (_themeColor == Colors.transparent) {
      return const Color(0xFFF97316); // 오렌지색으로 변경
    }
    return _themeColor;
  }
  
  // 날짜별 이벤트 맵 (로컬 캐시용)
  Map<DateTime, List<CalendarEvent>> _events = {};

  // 페이지 컨트롤러
  PageController? _weekController;
  PageController? _dayController;
  late PageController _yearPageController;
  PageController get _weekPageController => _weekController ??= PageController(initialPage: _getWeekIndex(_focusedDay));
  PageController get _dayPageController => _dayController ??= PageController(initialPage: _getDayIndex(_focusedDay));
  final DateTime _kFirstDay = DateTime(2020, 1, 1);

  @override
  void initState() {
    super.initState();
    _yearPageController = PageController(initialPage: _focusedDay.year - 1900);
    // _weekPageController and _dayPageController are lazily initialized
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([]);
    
    // 공휴일 언어 수정을 위해 초기 1회 캐시 삭제
    _checkAndClearHolidayCache();
    
    _loadEvents();
  }

  Future<void> _checkAndClearHolidayCache() async {
    final prefs = await SharedPreferences.getInstance();
    const cacheVersionKey = 'holiday_cache_version_v3';
    final hasVersion = prefs.getBool(cacheVersionKey) ?? false;
    if (!hasVersion) {
      await _holidayService.clearCache();
      await prefs.setBool(cacheVersionKey, true);
      _loadEvents(); // 캐시 삭제 후 다시 로드
    }
  }

  @override
  void dispose() {
    _weekController?.dispose();
    _dayController?.dispose();
    _yearPageController.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  String _getDateTitle() {
    final locale = AppLocalizations.of(context)?.localeName ?? 'ko';
    switch (_viewMode) {
      case CalendarViewMode.year:
        return DateFormat.y(locale).format(_focusedDay);
      case CalendarViewMode.week:
        return DateFormat.yM(locale).format(_focusedDay);
      case CalendarViewMode.day:
        return DateFormat.yMd(locale).format(_focusedDay);
      default:
        return '';
    }
  }

  String _getDisplayContent(String content) {
    // 1. STK 마커에서 이모지만 추출
    // [[STK_😆|0.15...]] -> 😆
    String cleaned = content.replaceAllMapped(
      RegExp(r'\[\[STK_([^|\]]+)(?:\|[\d.]+)?\]\]'),
      (match) => match.group(1) ?? '',
    );

    // 2. IMG 마커를 [사진]으로 대체 (또는 제거하고 싶다면 '')
    // [[IMG_0|0.19...]] -> [사진]
    cleaned = cleaned.replaceAll(RegExp(r'\[\[IMG_[^|\]]+(?:\|[\d.]+)?\]\]'), '[${AppLocalizations.of(context)!.photo}]');

    return cleaned.trim();
  }

  Future<void> _loadEvents() async {
    final events = await _calendarService.loadEvents();
    final locale = AppLocalizations.of(context)?.localeName ?? 'ko';
    
    // 언어 변경 시 캐시를 지우고 새로 로드하기 위해 clearCache 호출 고려 가능
    // 하지만 매번 지우는 것은 비효율적이므로, locale이 포함된 cacheKey를 이미 사용 중임
    
    final holidays = await _holidayService.getHolidays(_focusedDay.year, appLocale: locale);
    
    setState(() {
      _events = {};
      
      // 공휴일 먼저 추가
      for (var holiday in holidays) {
        final date = DateTime(holiday.date.year, holiday.date.month, holiday.date.day);
        if (_events[date] == null) _events[date] = [];
        _events[date]!.add(holiday);
      }

      // 일반 이벤트 추가
      for (var event in events) {
        final date = DateTime(event.date.year, event.date.month, event.date.day);
        if (_events[date] == null) _events[date] = [];
        _events[date]!.add(event);
      }
      
      // 날짜별 이벤트 시간순 정렬
      _events.forEach((key, value) {
        value.sort((a, b) => a.date.compareTo(b.date));
      });
      
      // 현재 선택된 날짜의 이벤트 업데이트
      if (_selectedDay != null) {
        final date = DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day);
        _selectedEvents.value = (_events[date] ?? [])
            .where((e) => e.type != CalendarEventType.holiday)
            .toList();
      }
    });
  }

  List<CalendarEvent> _getEventsForDay(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    return _events[date] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // 더블 탭 감지 (같은 날짜를 300ms 이내에 다시 탭)
    final now = DateTime.now();
    if (_lastClickedDay != null && 
        isSameDay(_lastClickedDay, selectedDay) && 
        _lastClickedTime != null && 
        now.difference(_lastClickedTime!) < const Duration(milliseconds: 300)) {
      _showAddEventSheet(selectedDate: selectedDay);
      _lastClickedDay = null; // 리셋
      return;
    }

    _lastClickedDay = selectedDay;
    _lastClickedTime = now;

    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay)
          .where((e) => e.type != CalendarEventType.holiday)
          .toList();
    }
  }

  Future<void> _toggleRoutine(CalendarEvent event) async {
    if (event.type != CalendarEventType.routine) return;
    
    final updatedEvent = event.copyWith(isCompleted: !event.isCompleted);
    await _calendarService.saveEvent(updatedEvent);
    _loadEvents();
  }

  Future<void> _deleteEvent(CalendarEvent event) async {
    await _calendarService.deleteEvent(event.id);
    if (event.alarmId != null) {
      // 알람 모델을 직접 찾아서 삭제할 수 없으므로(ID매핑 문제), 
      // 여기서는 생략하거나 추후 개선.
      // 실제 앱에서는 AlarmListProvider를 통해 삭제하는 것이 안전함.
    }
    _loadEvents();
  }

  Future<bool> _confirmDeleteEvent(CalendarEvent event) async {
    final l10n = AppLocalizations.of(context)!;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.confirmDelete),
          content: Text(l10n.deleteConfirmMessage(event.title)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l10n.delete),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  void _showAddEventSheet({CalendarEvent? event, DateTime? selectedDate}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEventSheet(
          selectedDate: selectedDate ?? _selectedDay ?? DateTime.now(),
          event: event,
          themeColor: _getAccentColor(isDark),
          isFullScreen: true,
          onDelete: (eventToDelete) async {
            await _deleteEvent(eventToDelete);
          },
          onSave: (savedEvent, isTimeManuallySet) async {
            var eventToSave = savedEvent;

          // 시간이 수동으로 설정되지 않았고, 새로운 이벤트인 경우 자동 시간 설정 로직 적용
          if (!isTimeManuallySet && event == null) {
            final dateKey = DateTime(savedEvent.date.year, savedEvent.date.month, savedEvent.date.day);
            final dayEvents = _events[dateKey] ?? [];

            if (dayEvents.isEmpty) {
              // 해당 날짜에 이벤트가 없으면 오전 9시로 설정
              final newDate = DateTime(dateKey.year, dateKey.month, dateKey.day, 9, 0);
              eventToSave = savedEvent.copyWith(date: newDate);
            } else {
              // 이벤트가 있으면 마지막 이벤트의 1시간 뒤로 설정
              // 시간순 정렬
              final sortedEvents = List<CalendarEvent>.from(dayEvents);
              sortedEvents.sort((a, b) => a.date.compareTo(b.date));
              
              final lastEventTime = sortedEvents.last.date;
              final newDate = lastEventTime.add(const Duration(hours: 1));
              
              // 날짜가 넘어가버리면? (예: 23시 + 1시간 = 다음날 0시)
              // 사용자의 의도는 "다음 순서"이므로 날짜가 넘어가더라도 그대로 유지하거나,
              // 혹은 23:59 등으로 제한할 수도 있음.
              // 여기서는 일단 단순히 1시간 뒤로 설정 (날짜가 바뀔 수도 있음, 하지만 UI상으로는 해당 날짜 리스트에 안 보일 수도 있음)
              // 만약 날짜가 바뀌면 해당 날짜 리스트에서 사라지는게 맞음. 
              // 하지만 사용자는 "같은 날 겹쳐버림"을 해결하고 싶어하므로, 같은 날 내에서 해결하는게 좋겠지만,
              // "다음꺼는 1시간 이후"라고 했으므로 1시간 이후가 명확함.
              
              eventToSave = savedEvent.copyWith(date: newDate);
            }
          }

          await _calendarService.saveEvent(eventToSave);
          if (eventToSave.alarmId != null && eventToSave.type == CalendarEventType.event) {
            final alarm = AlarmModel(
              id: eventToSave.alarmId!,
              time: eventToSave.date,
              label: eventToSave.title,
              missionType: MissionType.none,
              isEnabled: true,
              isSoundEnabled: true,
              isVibrationEnabled: true,
              repeatDays: const [false, false, false, false, false, false, false],
            );
            await AlarmSchedulerService.scheduleAlarm(alarm);
          }
          _loadEvents();
        },
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    
    // 전역 테마 색상 적용
    _themeColor = ref.watch(themeProvider).primaryColor;
    
    return Scaffold(
      body: Container(
        color: isDark ? const Color(0xFF121212) : Colors.white,
        child: Column(
          children: [
            // Custom Header (Minimized Padding)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: Row(
                children: [
                  Text(
                    _isMemoMode ? AppLocalizations.of(context)!.notepad : AppLocalizations.of(context)!.calendar,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      final now = DateTime.now();
                      setState(() {
                        _focusedDay = now;
                        _selectedDay = now;
                        _selectedEvents.value = _getEventsForDay(now);
                        
                        if (_viewMode == CalendarViewMode.year) {
                          if (_yearPageController.hasClients) {
                            _yearPageController.jumpToPage(now.year - 1900);
                          }
                        } else if (_viewMode == CalendarViewMode.week) {
                          if (_weekController != null && _weekController!.hasClients) {
                            _weekController!.jumpToPage(_getWeekIndex(now));
                          }
                        } else if (_viewMode == CalendarViewMode.day) {
                          if (_dayController != null && _dayController!.hasClients) {
                            _dayController!.jumpToPage(_getDayIndex(now));
                          }
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _themeColor == Colors.transparent
                            ? (isDark ? Colors.grey[800] : Colors.grey[100])
                            : _themeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _themeColor == Colors.transparent
                              ? (isDark ? Colors.grey[700]! : Colors.grey[300]!)
                              : _themeColor.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.today_rounded,
                            size: 13,
                            color: _themeColor == Colors.transparent
                                ? (isDark ? Colors.white70 : Colors.black87)
                                : _themeColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!.today,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _themeColor == Colors.transparent
                                  ? (isDark ? Colors.white70 : Colors.black87)
                                  : _themeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // 뷰 모드 전환 (항상 표시하여 위치 고정)
                  IconButton(
                    icon: Icon(
                      _isViewSelectorOpen && !_isMemoMode
                          ? Icons.keyboard_arrow_up_rounded 
                          : Icons.calendar_month_rounded,
                      color: !_isMemoMode 
                          ? (_themeColor == Colors.transparent ? (isDark ? Colors.white : Colors.black) : _themeColor)
                          : (isDark ? Colors.white70 : Colors.black54),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      if (_isMemoMode) {
                        setState(() {
                          _isMemoMode = false;
                          _isViewSelectorOpen = false;
                        });
                      } else {
                        setState(() {
                          _isViewSelectorOpen = !_isViewSelectorOpen;
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  // 모드 전환 (모양 고정)
                  IconButton(
                    icon: Icon(
                      Icons.list_alt_rounded,
                      color: _isMemoMode 
                          ? (_themeColor == Colors.transparent ? (isDark ? Colors.white : Colors.black) : _themeColor)
                          : (isDark ? Colors.white70 : Colors.black54),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      setState(() {
                        _isMemoMode = true;
                        _isViewSelectorOpen = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            if (!_isMemoMode && _viewMode != CalendarViewMode.month)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _getDateTitle(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),

            // 메뉴 선택 영역 (보기 모드 또는 색상 팔레트)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: (_isViewSelectorOpen && !_isMemoMode) ? null : 0,
              child: Column(
                children: [
                  if (_isViewSelectorOpen && !_isMemoMode) _buildViewSelector(isDark),
                ],
              ),
            ),
            
            Expanded(
              child: _isMemoMode 
                  ? _buildMemoList() 
                  : _viewMode == CalendarViewMode.month 
                      ? _buildCalendarView(_themeColor) 
                      : _buildCustomView(isDark),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventSheet(),
        backgroundColor: _themeColor, // 전역 테마 색상 적용
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildViewSelector(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        border: Border(bottom: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[200]!)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildViewOption(Icons.calendar_today_rounded, l10n.yearView, CalendarViewMode.year, isDark),
          _buildViewOption(Icons.grid_view_rounded, l10n.monthView, CalendarViewMode.month, isDark),
          _buildViewOption(Icons.view_week_rounded, l10n.weekView, CalendarViewMode.week, isDark),
          _buildViewOption(Icons.view_day_rounded, l10n.dayView, CalendarViewMode.day, isDark),
        ],
      ),
    );
  }

  Widget _buildViewOption(IconData icon, String label, CalendarViewMode mode, bool isDark) {
    final isSelected = _viewMode == mode;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _viewMode = mode;
          _isViewSelectorOpen = false;
          
          if (mode == CalendarViewMode.year) {
             if (_yearPageController.hasClients) {
               _yearPageController.jumpToPage(_focusedDay.year - 1900);
             } else {
               _yearPageController = PageController(initialPage: _focusedDay.year - 1900);
             }
          }

          // TableCalendar의 포맷도 동기화 (월간/주간 전환 시 애니메이션 효과 등을 위해)
          if (mode == CalendarViewMode.month) {
            _calendarFormat = CalendarFormat.month;
            _isExpanded = false;
          } else if (mode == CalendarViewMode.week) {
             // 주간 뷰는 커스텀 뷰를 사용하므로 TableCalendar 포맷은 상관없으나, 
             // 상태 관리를 위해 업데이트하지 않음 (TableCalendar가 아예 안보일 것이므로)
          } else if (mode == CalendarViewMode.day) {
            _selectedDay = DateTime.now();
            _focusedDay = DateTime.now();
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected 
              ? (_themeColor == Colors.transparent 
                  ? (isDark ? Colors.white : Colors.black) 
                  : _themeColor) 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: isSelected 
              ? null
              : Border.all(color: isDark ? Colors.white12 : Colors.black12, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected 
                  ? Colors.white
                  : (isDark ? Colors.white70 : Colors.black54),
              size: 24,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected 
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.black54),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarView(Color themeColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) { // 아래로 드래그
          setState(() {
            _isExpanded = true;
            _calendarFormat = CalendarFormat.month; // 확장 시 월간 뷰로 전환
          });
        } else if (details.primaryVelocity! < 0) { // 위로 드래그
          setState(() {
            _isExpanded = false;
            // 축소 시 포맷은 유지 (사용자가 주간 뷰를 원하면 버튼 사용)
          });
        }
      },
      child: Column(
        children: [
          _isExpanded
              ? Expanded(child: _buildGestureCalendar(themeColor, true))
              : _buildGestureCalendar(themeColor, false),
          if (!_isExpanded) const SizedBox(height: 2),
          if (!_isExpanded)
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) { // 왼쪽으로 드래그 (다음 달)
                    final nextMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                    final oldYear = _focusedDay.year;
                    setState(() {
                      _focusedDay = nextMonth;
                      // 다음 달의 같은 날짜 혹은 마지막 날을 선택
                      final lastDayNextMonth = DateTime(nextMonth.year, nextMonth.month + 1, 0).day;
                      final currentDay = _selectedDay?.day ?? 1;
                      final targetDay = currentDay > lastDayNextMonth ? lastDayNextMonth : currentDay;
                      final newSelectedDay = DateTime(nextMonth.year, nextMonth.month, targetDay);
                      _selectedDay = newSelectedDay;
                      _selectedEvents.value = _getEventsForDay(newSelectedDay);
                      
                      if (oldYear != nextMonth.year) {
                        _loadEvents();
                      }
                    });
                  } else if (details.primaryVelocity! > 0) { // 오른쪽으로 드래그 (이전 달)
                    final prevMonth = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                    final oldYear = _focusedDay.year;
                    setState(() {
                      _focusedDay = prevMonth;
                      // 이전 달의 같은 날짜 혹은 마지막 날을 선택
                      final lastDayPrevMonth = DateTime(prevMonth.year, prevMonth.month + 1, 0).day;
                      final currentDay = _selectedDay?.day ?? 1;
                      final targetDay = currentDay > lastDayPrevMonth ? lastDayPrevMonth : currentDay;
                      final newSelectedDay = DateTime(prevMonth.year, prevMonth.month, targetDay);
                      _selectedDay = newSelectedDay;
                      _selectedEvents.value = _getEventsForDay(newSelectedDay);

                      if (oldYear != prevMonth.year) {
                        _loadEvents();
                      }
                    });
                  }
                },
                child: ValueListenableBuilder<List<CalendarEvent>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                  if (value.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Icon(
                            Icons.keyboard_double_arrow_down_rounded,
                            color: isDark ? Colors.white38 : Colors.black26,
                            size: 28,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppLocalizations.of(context)!.calendarDragGuide,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark ? Colors.white38 : Colors.black38,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            AppLocalizations.of(context)!.noEvents,
                            style: TextStyle(
                              fontSize: 13,
                              color: isDark ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final event = value[index];
                      return _buildEventItem(event);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }



  int _getWeekIndex(DateTime date) {
    // 2020년 1월 5일(일요일)을 기준으로 주차 계산
    final anchor = DateTime(2020, 1, 5);
    return date.difference(anchor).inDays ~/ 7;
  }

  DateTime _getDateFromWeekIndex(int index) {
    final anchor = DateTime(2020, 1, 5);
    return anchor.add(Duration(days: index * 7));
  }

  int _getDayIndex(DateTime date) {
    return date.difference(_kFirstDay).inDays;
  }

  DateTime _getDateFromDayIndex(int index) {
    return _kFirstDay.add(Duration(days: index));
  }

  Widget _buildCustomView(bool isDark) {
    // 뷰 모드가 변경될 때 컨트롤러 페이지 동기화
    if (_viewMode == CalendarViewMode.week) {
      final targetPage = _getWeekIndex(_focusedDay);
      if (_weekPageController.hasClients && _weekPageController.page?.round() != targetPage) {
        _weekPageController.jumpToPage(targetPage);
      }
    } else if (_viewMode == CalendarViewMode.day) {
      final targetPage = _getDayIndex(_focusedDay);
      if (_dayPageController.hasClients && _dayPageController.page?.round() != targetPage) {
        _dayPageController.jumpToPage(targetPage);
      }
    }

    switch (_viewMode) {
      case CalendarViewMode.year:
        return _buildYearView(_themeColor, isDark);
      case CalendarViewMode.week:
        return _buildWeekView(_themeColor, isDark);
      case CalendarViewMode.day:
        return _buildDayView(_themeColor, isDark);
      default:
        return Container();
    }
  }

  Widget _buildYearView(Color themeColor, bool isDark) {
    final accentColor = _getAccentColor(isDark);
    
    return PageView.builder(
      controller: _yearPageController,
      onPageChanged: (index) {
        final newYear = 1900 + index;
        if (newYear != _focusedDay.year) {
          setState(() {
            _focusedDay = DateTime(newYear, _focusedDay.month, _focusedDay.day);
          });
        }
      },
      itemBuilder: (context, index) {
        final year = 1900 + index;
        
        return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            physics: const AlwaysScrollableScrollPhysics(), // 10~12월까지 보이도록 스크롤 허용
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.95, // 카드 높이를 줄여서 더 많은 달이 보이도록 함
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 12,
          itemBuilder: (context, monthIndex) {
            final monthDate = DateTime(year, monthIndex + 1, 1);
            final isCurrentMonth = monthDate.year == DateTime.now().year && monthDate.month == DateTime.now().month;
            
            return GestureDetector(
              onTap: () {
                setState(() {
                  _focusedDay = monthDate;
                  _selectedDay = monthDate;
                  _viewMode = CalendarViewMode.month;
                  _calendarFormat = CalendarFormat.month;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2C2C2C) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: isCurrentMonth ? Border.all(color: accentColor, width: 2) : Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        DateFormat.M(AppLocalizations.of(context)?.localeName ?? 'ko').format(monthDate),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: isCurrentMonth ? accentColor : (isDark ? Colors.white : Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
                        child: _buildMiniMonthCalendar(monthDate, isDark),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMiniMonthCalendar(DateTime monthDate, bool isDark) {
    final daysInMonth = DateTime(monthDate.year, monthDate.month + 1, 0).day;
    final firstDayWeekday = DateTime(monthDate.year, monthDate.month, 1).weekday;
    // weekday: Mon=1, ..., Sun=7.
    // Grid starts at Sun.
    // If Mon(1), empty=1 (Sun).
    // If Sun(7), empty=0.
    final startOffset = firstDayWeekday % 7;
    
    return Column(
      children: [
        // Weekday Headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppLocalizations.of(context)!.daySun,
            AppLocalizations.of(context)!.dayMon,
            AppLocalizations.of(context)!.dayTue,
            AppLocalizations.of(context)!.dayWed,
            AppLocalizations.of(context)!.dayThu,
            AppLocalizations.of(context)!.dayFri,
            AppLocalizations.of(context)!.daySat,
          ].map((day) => 
            Text(
              day, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8, 
                color: day == AppLocalizations.of(context)!.daySun ? Colors.redAccent : (day == AppLocalizations.of(context)!.daySat ? Colors.blueAccent : (isDark ? Colors.grey : Colors.black54))
              )
            )
          ).toList(),
        ),
        const SizedBox(height: 2),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              if (index < startOffset || index >= startOffset + daysInMonth) {
                return const SizedBox();
              }
              final day = index - startOffset + 1;
              final date = DateTime(monthDate.year, monthDate.month, day);
              final isToday = isSameDay(date, DateTime.now());
              
              Color textColor;
              if (isToday) {
                textColor = Colors.white;
              } else if (date.weekday == DateTime.sunday || _hasHoliday(date)) {
                textColor = Colors.redAccent;
              } else if (date.weekday == DateTime.saturday) {
                textColor = Colors.blueAccent;
              } else {
                textColor = isDark ? Colors.white70 : Colors.black87;
              }

              return Container(
                alignment: Alignment.center,
                decoration: isToday ? const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ) : null,
                child: Text(
                  '$day',
                  style: TextStyle(
                    fontSize: 8,
                    color: textColor,
                    fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekView(Color themeColor, bool isDark) {
    return PageView.builder(
      controller: _weekPageController,
      onPageChanged: (index) {
        final newDate = _getDateFromWeekIndex(index);
        setState(() {
          _focusedDay = newDate;
        });
      },
      itemBuilder: (context, index) {
        // 해당 페이지(주)의 시작일 계산
        final startOfWeek = _getDateFromWeekIndex(index);

        return LayoutBuilder(
          builder: (context, constraints) {
            final rowHeight = (constraints.maxHeight - 8) / 7;
            return Column(
              children: List.generate(7, (i) {
                final day = startOfWeek.add(Duration(days: i));
                final events = _getEventsForDay(day)
                    .where((e) => e.type != CalendarEventType.holiday)
                    .toList();
                final isToday = isSameDay(day, DateTime.now());

                Color dateColor;
                if (day.weekday == DateTime.sunday || _hasHoliday(day)) {
                  dateColor = Colors.red;
                } else if (day.weekday == DateTime.saturday) {
                  dateColor = Colors.blue;
                } else {
                  dateColor = isDark ? Colors.white : Colors.black87;
                }

                return SizedBox(
                  height: rowHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[200]!)),
                      color: isToday ? themeColor.withOpacity(0.05) : null,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 56,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${day.day}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: dateColor,
                                    height: 1.0,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  DateFormat.E(AppLocalizations.of(context)?.localeName ?? 'ko').format(day),
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: dateColor.withOpacity(0.8),
                                    height: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: events.take(2).map((event) {
                                return GestureDetector(
                                  onTap: () => _showAddEventSheet(event: event),
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Color(event.titleColor).withOpacity(0.18),
                                      border: Border(left: BorderSide(color: Color(event.titleColor), width: 3)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            event.title,
                                            style: TextStyle(
                                              color: isDark ? Colors.white : Colors.black87,
                                              fontSize: 11,
                                              height: 1.1,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (event.date.hour != 0 || event.date.minute != 0)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Text(
                                              DateFormat.Hm(AppLocalizations.of(context)?.localeName ?? 'ko').format(event.date),
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: isDark ? Colors.grey[400] : Colors.grey[600],
                                                height: 1.1,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }

  Widget _buildDayView(Color themeColor, bool isDark) {
    return PageView.builder(
      controller: _dayPageController,
      onPageChanged: (index) {
        final newDate = _getDateFromDayIndex(index);
        setState(() {
          _focusedDay = newDate;
        });
      },
      itemBuilder: (context, index) {
        final day = _getDateFromDayIndex(index);
        final events = _getEventsForDay(day)
            .where((e) => e.type != CalendarEventType.holiday)
            .toList();
        
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 24 * 60.0 + 50, // 24시간 * 60px + 여유공간
            child: Stack(
              children: [
                // 시간 그리드
                Column(
                  children: List.generate(24, (index) {
                    return Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[200]!)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, right: 8),
                              child: Text(
                                '${index.toString().padLeft(2, '0')}:00',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: isDark ? Colors.grey[500] : Colors.grey[500],
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    );
                  }),
                ),
                
                // 현재 시간 표시선 (오늘인 경우에만)
                if (isSameDay(day, DateTime.now()))
                  Positioned(
                    top: (DateTime.now().hour * 60 + DateTime.now().minute).toDouble(),
                    left: 50,
                    right: 0,
                    child: Row(
                      children: [
                        Container(
                          width: 8, 
                          height: 8, 
                          decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        ),
                        Expanded(child: Container(height: 1, color: Colors.red)),
                      ],
                    ),
                  ),

                // 이벤트 배치
                ...events.map((event) {
                   // 시간 정보가 없으면 00:00으로 가정하고 상단에 배치하거나 해야 하지만,
                   // 여기서는 시간 기반으로 배치. (Duration 정보가 없으므로 기본 1시간)
                   final startMinute = event.date.hour * 60 + event.date.minute;
                   final duration = 60; // 기본 1시간
                   
                   return Positioned(
                     top: startMinute.toDouble(),
                     left: 60,
                     right: 8,
                     height: duration.toDouble(),
                     child: GestureDetector(
                       onTap: () => _showAddEventSheet(event: event),
                       child: Container(
                         padding: const EdgeInsets.all(4),
                         decoration: BoxDecoration(
                           color: Color(event.titleColor).withOpacity(0.7),
                           borderRadius: BorderRadius.circular(4),
                           border: Border.all(color: Color(event.titleColor)),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               event.title,
                               style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,
                             ),
                             Text(
                               DateFormat.Hm(AppLocalizations.of(context)?.localeName ?? 'ko').format(event.date),
                               style: const TextStyle(color: Colors.white70, fontSize: 10),
                             ),
                           ],
                         ),
                       ),
                     ),
                   );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _hasHoliday(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    final events = _events[date] ?? [];
    return events.any((e) => e.type == CalendarEventType.holiday);
  }

  String? _getHolidayTitle(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    final events = _events[date] ?? [];
    try {
      return events.firstWhere((e) => e.type == CalendarEventType.holiday).title;
    } catch (_) {
      return null;
    }
  }

  Widget _buildExpandedDayCell(BuildContext context, DateTime day, DateTime focusedDay) {
    final events = _getEventsForDay(day);
    final isToday = isSameDay(day, DateTime.now());
    final isSelected = isSameDay(day, _selectedDay);
    final isOutside = day.month != focusedDay.month;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 날짜 텍스트 스타일 결정
    Color textColor;
    FontWeight fontWeight = FontWeight.normal;
    BoxDecoration? dateDecoration;

    if (isOutside) {
      textColor = isDark ? Colors.white24 : Colors.black26;
    } else if (day.weekday == DateTime.sunday || _hasHoliday(day)) {
      textColor = Colors.redAccent;
    } else if (day.weekday == DateTime.saturday) {
      textColor = Colors.blueAccent;
    } else {
      textColor = isDark ? Colors.white : Colors.black87;
    }

    final accentColor = _getAccentColor(isDark);

      if (!isOutside && isSelected) {
        textColor = accentColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
        fontWeight = FontWeight.bold;
        dateDecoration = BoxDecoration(
          color: accentColor,
          shape: BoxShape.circle,
        );
      } else if (!isOutside && isToday) {
        textColor = accentColor;
        fontWeight = FontWeight.bold;
        dateDecoration = BoxDecoration(
          color: accentColor.withOpacity(0.2),
          shape: BoxShape.circle,
        );
      }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!, width: 0.5),
          right: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!, width: 0.5),
        ),
        color: isOutside ? (isDark ? Colors.black12 : Colors.grey[50]!) : null,
      ),
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          // 날짜 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: dateDecoration,
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: fontWeight,
                    fontSize: 12,
                  ),
                ),
              ),
              // 스티커 표시 (확장 뷰에서는 우측 상단)
              if (events.any((e) => e.sticker != null && e.sticker != '😐'))
                Text(
                  events.firstWhere((e) => e.sticker != null && e.sticker != '😐').sticker!,
                  style: const TextStyle(fontSize: 16),
                ),
            ],
          ),
          const SizedBox(height: 2),
          // 일정 목록 (칩 형태)
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: events.map((event) {
                  final isHoliday = event.type == CalendarEventType.holiday;
                  return GestureDetector(
                    onTap: () => isHoliday ? null : _showAddEventSheet(event: event),
                    child: Opacity(
                      opacity: isOutside ? 0.5 : 1.0,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: isHoliday ? Colors.redAccent.withOpacity(0.1) : Color(event.titleColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            isHoliday && event.title.length > 5 
                                ? '${event.title.substring(0, 5)}...' 
                                : event.title,
                            style: TextStyle(
                              fontSize: 10,
                              color: isHoliday ? Colors.redAccent : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGestureCalendar(Color themeColor, bool isExpanded) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = _getAccentColor(isDark);

    return TableCalendar<CalendarEvent>(
      availableGestures: AvailableGestures.horizontalSwipe,
      shouldFillViewport: isExpanded,
      locale: AppLocalizations.of(context)?.localeName ?? 'ko',
      firstDay: DateTime.utc(1900, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      eventLoader: _getEventsForDay,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekHeight: 32.0, // 요일 헤더 높이 축소
      calendarStyle: CalendarStyle(
        outsideDaysVisible: isExpanded, // 확장 상태일 때만 외부 날짜 표시 (전체 그리드 채우기 위해)
        cellMargin: isExpanded ? EdgeInsets.zero : const EdgeInsets.all(4), // 확장 시 여백 제거하여 그리드 연결
        
        // 기본 날짜 스타일 (빌더에서 처리하므로 기본값 유지)
        defaultTextStyle: const TextStyle(fontWeight: FontWeight.w500),
        
        // 선택된 날짜
        selectedDecoration: BoxDecoration(
          color: accentColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        
        // 오늘 날짜
        todayDecoration: BoxDecoration(
          color: accentColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: accentColor, 
          fontWeight: FontWeight.bold
        ),
        
        // 마커 스타일 (기본 마커 숨김)
        markerDecoration: const BoxDecoration(color: Colors.transparent),
      ),
      calendarBuilders: CalendarBuilders(
        // 확장된 뷰일 때 전체 셀 커스텀
        prioritizedBuilder: isExpanded ? (context, day, focusedDay) {
          return _buildExpandedDayCell(context, day, focusedDay);
        } : null,

        // 선택된 날짜 커스텀
        selectedBuilder: (context, day, focusedDay) {
          return Center(
            child: Container(
              width: 24, // 날짜 숫자만 감쌀 정도의 작은 사이즈
              height: 24,
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },

          // 오늘 날짜 커스텀
          todayBuilder: (context, day, focusedDay) {
            final isSelected = isSameDay(_selectedDay, day);
            if (isSelected) return null; // 선택된 상태면 selectedBuilder가 처리하도록 함

            return Center(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          },
          
          // 요일 헤더 커스텀 (토: 파랑, 일: 빨강)
          dowBuilder: (context, day) {
            final text = DateFormat.E(AppLocalizations.of(context)?.localeName ?? 'ko').format(day);
            Color color;
            if (day.weekday == DateTime.sunday) {
              color = Colors.redAccent;
            } else if (day.weekday == DateTime.saturday) {
              color = Colors.blueAccent;
            } else {
              color = isDark ? Colors.white70 : Colors.black54;
            }
            return Center(
              child: Text(
                text,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
            );
          },
          
          // 기본 날짜 셀 커스텀 (토: 파랑, 일: 빨강, 공휴일: 빨강)
          defaultBuilder: (context, day, focusedDay) {
            Color color = isDark ? Colors.white : Colors.black87;
            if (day.weekday == DateTime.sunday || _hasHoliday(day)) {
              color = Colors.redAccent;
            } else if (day.weekday == DateTime.saturday) {
              color = Colors.blueAccent;
            }
            return Center(
              child: Text(
                '${day.day}',
                style: TextStyle(color: color, fontWeight: FontWeight.w500),
              ),
            );
          },
          
          // 외부 날짜 셀 커스텀 (흐리게 표시하되 공휴일 색상은 유지)
          outsideBuilder: (context, day, focusedDay) {
            Color color = isDark ? Colors.white24 : Colors.black26;
            if (day.weekday == DateTime.sunday || _hasHoliday(day)) {
              color = Colors.redAccent.withOpacity(isDark ? 0.3 : 0.4);
            } else if (day.weekday == DateTime.saturday) {
              color = Colors.blueAccent.withOpacity(isDark ? 0.3 : 0.4);
            }
            return Center(
              child: Text(
                '${day.day}',
                style: TextStyle(color: color, fontWeight: FontWeight.w500),
              ),
            );
          },
          
          // 마커 커스텀 (바 형태 + 스티커 표시 + 공휴일 이름)
          markerBuilder: (context, day, events) {
            // 확장 뷰일 때는 하단 마커를 표시하지 않음 (이미 셀 내부에 표시됨)
            if (isExpanded) return const SizedBox.shrink();

            if (events.isNotEmpty) {
              final nonHolidayEvents = events.where((e) => e.type != CalendarEventType.holiday).toList();
              if (nonHolidayEvents.isEmpty) return null;

              final moodEvent = nonHolidayEvents.firstWhere(
                (e) => e.sticker != null && e.sticker != '😐',
                orElse: () => nonHolidayEvents.first,
              );
              final hasSticker = moodEvent.sticker != null && moodEvent.sticker != '😐';

              return Stack(
                alignment: Alignment.center,
                children: [
                  // 스티커를 중앙에 크게 표시 (투명도 적용)
                  if (hasSticker)
                     Center(
                       child: Opacity(
                         opacity: 0.55, // 날짜가 보이되 스티커가 더 잘 보이도록 투명도 조절
                         child: Text(
                          moodEvent.sticker!,
                          style: const TextStyle(fontSize: 20), // 원 사이즈(24)보다 약간 작게 조절
                        ),
                       ),
                     ),
                  // 이벤트 마커 (하단 배치)
                  Positioned(
                    bottom: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: nonHolidayEvents.take(4).map((event) => _buildEventMarker(event)).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return null;
          },
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
          leftChevronIcon: Icon(Icons.chevron_left_rounded, color: accentColor),
          rightChevronIcon: Icon(Icons.chevron_right_rounded, color: accentColor),
          headerMargin: EdgeInsets.zero,
          headerPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
        onDaySelected: _onDaySelected,
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
              if (format != CalendarFormat.month) _isExpanded = false;
            });
          }
        },
        onPageChanged: (focusedDay) {
          final oldYear = _focusedDay.year;
          _focusedDay = focusedDay;
          if (oldYear != focusedDay.year) {
            _loadEvents();
          }
        },
      );
    }

  Widget _buildMemoList() {
    // 공휴일을 제외한 이벤트만 필터링하여 날짜별로 그룹화
    final filteredEventsMap = <DateTime, List<CalendarEvent>>{};
    _events.forEach((date, events) {
      final nonHolidayEvents = events.where((e) => e.type != CalendarEventType.holiday).toList();
      if (nonHolidayEvents.isNotEmpty) {
        filteredEventsMap[date] = nonHolidayEvents;
      }
    });

    final sortedDates = filteredEventsMap.keys.toList()..sort();
    
    if (sortedDates.isEmpty) {
      return Center(child: Text(AppLocalizations.of(context)!.noSavedMemos));
    }

    return ListView.builder(
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final date = sortedDates[index];
        final events = filteredEventsMap[date]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                DateFormat.yMEd(AppLocalizations.of(context)?.localeName ?? 'ko').format(date),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            ...events.map((event) => _buildEventItem(event)),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildEventItem(CalendarEvent event) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    IconData icon;
    Color color;

    switch (event.type) {
      case CalendarEventType.event:
        icon = Icons.event;
        color = Colors.blueAccent;
        break;
      case CalendarEventType.routine:
        icon = event.isCompleted ? Icons.check_circle : Icons.check_circle_outline;
        color = event.isCompleted ? Colors.green : Colors.grey;
        break;
      case CalendarEventType.memo:
        icon = Icons.note;
        color = Colors.orangeAccent;
        break;
      case CalendarEventType.holiday:
        icon = Icons.calendar_today_outlined;
        color = Colors.redAccent;
        break;
    }

    final subtitleStyle = TextStyle(
      fontSize: 12,
      height: 1.15,
      color: isDark ? Colors.white60 : Colors.black54,
    );

    final tile = ListTile(
      onTap: event.type == CalendarEventType.holiday ? null : () => _showAddEventSheet(event: event),
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      minLeadingWidth: 28,
      leading: IconButton(
        icon: Icon(icon, color: color, size: 18),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
        onPressed: event.type == CalendarEventType.routine ? () => _toggleRoutine(event) : null,
      ),
      title: Row(
        children: [
          if (event.sticker != null && event.sticker != '😐')
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(event.sticker!, style: const TextStyle(fontSize: 16)),
            ),
          Expanded(
            child: Text(
              event.title,
              style: TextStyle(
                decoration: (event.type == CalendarEventType.routine && event.isCompleted)
                    ? TextDecoration.lineThrough
                    : null,
                color: event.type == CalendarEventType.holiday 
                    ? Colors.redAccent 
                    : (event.type == CalendarEventType.memo 
                        ? (isDark ? Colors.white : Colors.black87) 
                        : Color(event.titleColor)),
                fontWeight: event.type == CalendarEventType.holiday ? FontWeight.bold : null,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (event.type == CalendarEventType.memo && (event.images?.isNotEmpty ?? false))
            const Icon(Icons.image, size: 15, color: Colors.grey),
          if (event.type == CalendarEventType.memo && event.drawingData != null)
            const Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Icon(Icons.edit, size: 15, color: Colors.grey),
            ),
        ],
      ),
      subtitle: event.content.isNotEmpty
          ? Text(
              _getDisplayContent(event.content),
              style: subtitleStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : (event.type == CalendarEventType.event
              ? Text(
                  DateFormat.jm(AppLocalizations.of(context)?.localeName ?? 'ko').format(event.date),
                  style: subtitleStyle,
                )
              : (event.type == CalendarEventType.holiday ? Text(AppLocalizations.of(context)!.holiday, style: subtitleStyle) : null)),
      trailing: event.alarmId != null 
          ? const Icon(Icons.alarm, size: 15, color: Colors.grey) 
          : (event.type == CalendarEventType.routine ? Checkbox(
              value: event.isCompleted,
              onChanged: (_) => _toggleRoutine(event),
            ) : null),
    );

    if (event.type == CalendarEventType.holiday) return tile;

    return Dismissible(
      key: Key(event.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _confirmDeleteEvent(event),
      onDismissed: (_) => _deleteEvent(event),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: tile,
    );
  }

  Widget _buildEventMarker(CalendarEvent event) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      width: 6.0,
      height: 6.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(2.0),
        color: Color(event.titleColor),
      ),
    );
  }
}
