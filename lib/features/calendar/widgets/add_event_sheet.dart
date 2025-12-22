import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/calendar_event.dart';

class AddEventSheet extends StatefulWidget {
  final DateTime selectedDate;
  final Function(CalendarEvent, bool) onSave;
  final CalendarEvent? event;
  final Color themeColor;

  const AddEventSheet({
    super.key,
    required this.selectedDate,
    required this.onSave,
    this.event,
    this.themeColor = const Color(0xFF2979FF),
  });

  @override
  State<AddEventSheet> createState() => _AddEventSheetState();
}

class _AddEventSheetState extends State<AddEventSheet> {
  final _titleController = TextEditingController();
    final _contentController = TextEditingController();
    final LayerLink _iconLayerLink = LayerLink();
    OverlayEntry? _overlayEntry;
    Color _selectedTitleColor = Colors.black87;
    
    // 1. 기본 타입을 일정으로 변경
  CalendarEventType _type = CalendarEventType.event;
  String _selectedRoutinePreset = 'custom';
  
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isAlarmEnabled = false;
  bool _isTimeManuallySet = false;

  // 루틴 프리셋 데이터 (이모지와 함께)
  final List<Map<String, String>> _routinePresets = [
    {'emoji': '🏃', 'label': '운동'},
    {'emoji': '⛰️', 'label': '등산'},
    {'emoji': '🧹', 'label': '대청소'},
    {'emoji': '🚗', 'label': '여행'},
    {'emoji': '❤️', 'label': '데이트'},
    {'emoji': '🎸', 'label': '콘서트 '},
    {'emoji': '🎞️', 'label': '영화관람'},
    {'emoji': '🥂', 'label': '모임'},

  ];

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleRoutinePicker() {
    if (_overlayEntry != null) {
      _removeOverlay();
      return;
    }
    
    // 키보드가 열려있다면 닫기
    FocusScope.of(context).unfocus();
    
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final borderColor = isDark ? Colors.grey[700]! : Colors.grey[200]!;
    final dividerColor = isDark ? Colors.grey[700] : const Color(0xFFEEEEEE);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 배경을 터치하면 닫기
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          CompositedTransformFollower(
            link: _iconLayerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.topRight,
            followerAnchor: Alignment.bottomRight,
            offset: const Offset(0, 0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              color: backgroundColor,
              child: Container(
                width: 160,
                height: 200, // 약 5개 항목 높이 (40 * 5)
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: _routinePresets.length,
                  separatorBuilder: (context, index) => Divider(height: 1, thickness: 1, color: dividerColor),
                  itemBuilder: (context, index) {
                    final selection = _routinePresets[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _type = CalendarEventType.routine;
                          _titleController.text = "${selection['emoji']} ${selection['label']}";
                        });
                        _removeOverlay();
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          "${selection['emoji']} ${selection['label']}", 
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      _titleController.text = widget.event!.title;
      _contentController.text = widget.event!.content;
      _type = widget.event!.type;
      _selectedTime = TimeOfDay.fromDateTime(widget.event!.date);
      _isAlarmEnabled = widget.event!.alarmId != null;
      _selectedTitleColor = Color(widget.event!.titleColor);
      _isTimeManuallySet = true;
    } else {
      _selectedTime = TimeOfDay.now();
      _isTimeManuallySet = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final blueTheme = widget.themeColor;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    // 하단 탭바 높이 (대략 56~80) + 여유 공간
    final double bottomNavHeight = 100.0;

    // 테마 관련 색상 정의
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.grey[800];
    final inputFillColor = isDark ? Colors.grey[800] : Colors.grey[50];
    final tabBackgroundColor = isDark ? Colors.grey[900] : Colors.grey[100];
    final dividerColor = isDark ? Colors.grey[700] : Colors.grey[300];
    final hintColor = isDark ? Colors.grey[500] : Colors.grey;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        margin: EdgeInsets.only(
          left: 16, 
          right: 16, 
          bottom: bottomInset > 0 ? 16 : bottomNavHeight + 32
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            // 핸들바
            Center(
              child: Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: dividerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            Text(
              '일정 추가',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // 탭 버튼 (일정 -> 메모 순서)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: tabBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTypeTab(
                    '일정',
                    _type == CalendarEventType.event || _type == CalendarEventType.routine,
                    blueTheme,
                    isDark,
                    () {
                      setState(() {
                        _type = CalendarEventType.event;
                        _selectedRoutinePreset = 'custom';
                      });
                    },
                  ),
                  _buildTypeTab(
                    '메모',
                    _type == CalendarEventType.memo,
                    blueTheme,
                    isDark,
                    () {
                      setState(() {
                        _type = CalendarEventType.memo;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 제목 입력 (통합된 입력창)
            if (_type != CalendarEventType.memo) ...[
              Container(
                child: TextField(
                  controller: _titleController,
                  scrollPadding: const EdgeInsets.only(bottom: 120),
                  decoration: InputDecoration(
                    hintText: '제목을 입력하거나 선택하세요',
                    hintStyle: TextStyle(color: hintColor),
                    filled: true,
                    fillColor: inputFillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => _showColorPicker(context),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: _selectedTitleColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: hintColor?.withOpacity(0.5) ?? Colors.grey.withOpacity(0.5), width:
                              1.5),),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.title, color: hintColor, size: 20),
                        const SizedBox(width: 4),
                      ],
                    ),
                    suffixIcon: CompositedTransformTarget(
                      link: _iconLayerLink,
                      child: IconButton(
                        icon: Icon(Icons.arrow_drop_down_circle_outlined, color: hintColor),
                        onPressed: _toggleRoutinePicker,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    isDense: true,
                  ),
                  style: TextStyle(fontSize: 14, color: textColor),
                  onChanged: (text) {
                    if (_type == CalendarEventType.routine && !_routinePresets.any((e) => "${e['emoji']} ${e['label']}" == text)) {
                      setState(() {
                        _type = CalendarEventType.event;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],

            // 제목 직접 입력 필드 (메모 탭일 경우)
            if (_type == CalendarEventType.memo)
              TextField(
                controller: _titleController,
                scrollPadding: const EdgeInsets.only(bottom: 120),
                decoration: InputDecoration(
                  hintText: '제목',
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: const Color(0xFFFFF9C4), // 스티커 메모
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () => _showColorPicker(context),
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: _selectedTitleColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black.withOpacity(0.3), width: 1.5),
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  isDense: true,
                ),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _selectedTitleColor),
                textInputAction: TextInputAction.next,
              ),
            if (_type == CalendarEventType.memo) const SizedBox(height: 8),
            
            // 내용 입력 (항상 표시)
            TextField(
              controller: _contentController,
              scrollPadding: const EdgeInsets.only(bottom: 120),
              maxLines: _type == CalendarEventType.memo ? null : 3,
              minLines: _type == CalendarEventType.memo ? 12 : 1,
              keyboardType: _type == CalendarEventType.memo ? TextInputType.multiline : TextInputType.text,
              decoration: InputDecoration(
                hintText: _type == CalendarEventType.memo ? '자유롭게 내용을 작성하세요' : '메모나 세부 내용을 입력하세요',
                hintStyle: TextStyle(color: _type == CalendarEventType.memo ? Colors.black54 : hintColor),
                filled: true,
                fillColor: _type == CalendarEventType.memo ? const Color(0xFFFFF9C4) : inputFillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: _type == CalendarEventType.memo ? null : Icon(Icons.notes, color: hintColor, size: 20),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                isDense: true,
              ),
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: _type == CalendarEventType.memo ? Colors.black87 : textColor,
              ),
            ),
            const SizedBox(height: 8),

            // 시간 및 알람 설정 (메모가 아닐 경우 표시)
            if (_type != CalendarEventType.memo)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: inputFillColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: hintColor, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                          );
                          if (time != null) {
                            setState(() {
                              _selectedTime = time;
                              _isTimeManuallySet = true;
                            });
                          }
                        },
                        child: Text(
                          _selectedTime.format(context),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: dividerColor,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isAlarmEnabled = !_isAlarmEnabled;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              _isAlarmEnabled ? Icons.notifications_active : Icons.notifications_off,
                              color: _isAlarmEnabled ? blueTheme : hintColor,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _isAlarmEnabled ? '알람 켜짐' : '알람 꺼짐',
                              style: TextStyle(
                                color: _isAlarmEnabled ? blueTheme : hintColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),

            // 저장 버튼
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueTheme,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                '저장',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildTypeTab(String label, bool isSelected, Color activeColor, bool isDark, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: activeColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : (isDark ? Colors.grey[400] : Colors.grey[600]),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_titleController.text.trim().isEmpty) return;

    final date = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
      widget.selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final event = CalendarEvent(
      id: widget.event?.id ?? const Uuid().v4(),
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      date: date,
      type: _type,
      alarmId: _isAlarmEnabled ? Uuid().v4() : null,
      titleColor: _selectedTitleColor.value,
    );

    widget.onSave(event, _isTimeManuallySet);
    Navigator.pop(context);
  }

  void _showColorPicker(BuildContext context) {
    // 세련된 파스텔 및 현대적인 색상 팔레트 (CalendarScreen과 통일감 유지)
    final List<Color> colors = [
      const Color(0xFFE57373), // Soft Red
      const Color(0xFFF06292), // Soft Pink
      const Color(0xFFBA68C8), // Soft Purple
      const Color(0xFF9575CD), // Soft Deep Purple
      const Color(0xFF7986CB), // Soft Indigo
      const Color(0xFF64B5F6), // Soft Blue
      const Color(0xFF4FC3F7), // Soft Light Blue
      const Color(0xFF4DD0E1), // Soft Cyan
      const Color(0xFF4DB6AC), // Soft Teal
      const Color(0xFF81C784), // Soft Green
      const Color(0xFFAED581), // Soft Light Green
      const Color(0xFFFF8A65), // Soft Deep Orange
      const Color(0xFFA1887F), // Soft Brown
      const Color(0xFF90A4AE), // Soft Blue Grey
      const Color(0xFF263238), // Charcoal
      Colors.black87,          // Basic Black
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('제목 색상 선택', style: TextStyle(fontWeight: FontWeight.bold)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              alignment: WrapAlignment.center,
              children: colors.map((color) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTitleColor = color;
                  });
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedTitleColor == color ? Colors.blueAccent : Colors.transparent,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _selectedTitleColor == color
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : null,
                ),
              )).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
