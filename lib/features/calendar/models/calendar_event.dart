enum CalendarEventType { event, routine, memo }

class CalendarEvent {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final CalendarEventType type;
  final bool isCompleted; // 루틴용
  final String? alarmId; // 알람 연동용
  final int titleColor; // 제목 색상

  CalendarEvent({
    required this.id,
    required this.title,
    this.content = '',
    required this.date,
    required this.type,
    this.isCompleted = false,
    this.alarmId,
    this.titleColor = 0xFF000000, // 기본값 검정
  });

  CalendarEvent copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? date,
    CalendarEventType? type,
    bool? isCompleted,
    String? alarmId,
    int? titleColor,
  }) {
    return CalendarEvent(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      type: type ?? this.type,
      isCompleted: isCompleted ?? this.isCompleted,
      alarmId: alarmId ?? this.alarmId,
      titleColor: titleColor ?? this.titleColor,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'type': type.index,
      'isCompleted': isCompleted,
      'alarmId': alarmId,
      'titleColor': titleColor,
    };
  }

  factory CalendarEvent.fromJson(Map<String, dynamic> json) {
    return CalendarEvent(
      id: json['id'],
      title: json['title'],
      content: json['content'] ?? '',
      date: DateTime.parse(json['date']),
      type: CalendarEventType.values[json['type']],
      isCompleted: json['isCompleted'] ?? false,
      alarmId: json['alarmId'],
      titleColor: json['titleColor'] ?? 0xFF000000,
    );
  }
}
