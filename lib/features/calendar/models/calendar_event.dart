import 'package:flutter/material.dart';

enum CalendarEventType { event, routine, memo, holiday }

class CalendarEvent {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final CalendarEventType type;
  final bool isCompleted; // 루틴용
  final String? alarmId; // 알람 연동용
  final int titleColor; // 제목 색상
  final String? sticker; // 스티커 (이모지 등)
  final List<String>? images; // 이미지 경로 리스트
  final String? drawingData; // 필기 데이터 (JSON 등)
  final bool isFavorite; // 즐겨찾기 여부
  final double fontSize; // 글꼴 크기
  final String? fontFamily; // 글꼴 패밀리
  final int? fontColor; // 글꼴 색상
  final int textAlign; // 텍스트 정렬 (TextAlign.index)

  CalendarEvent({
    required this.id,
    required this.title,
    this.content = '',
    required this.date,
    required this.type,
    this.isCompleted = false,
    this.alarmId,
    this.titleColor = 0xFF000000,
    this.sticker,
    this.images,
    this.drawingData,
    this.isFavorite = false,
    this.fontSize = 16.0,
    this.fontFamily,
    this.fontColor,
    this.textAlign = 0, // TextAlign.left
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
    String? sticker,
    List<String>? images,
    String? drawingData,
    bool? isFavorite,
    double? fontSize,
    String? fontFamily,
    int? fontColor,
    int? textAlign,
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
      sticker: sticker ?? this.sticker,
      images: images ?? this.images,
      drawingData: drawingData ?? this.drawingData,
      isFavorite: isFavorite ?? this.isFavorite,
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      fontColor: fontColor ?? this.fontColor,
      textAlign: textAlign ?? this.textAlign,
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
      'sticker': sticker,
      'images': images,
      'drawingData': drawingData,
      'isFavorite': isFavorite,
      'fontSize': fontSize,
      'fontFamily': fontFamily,
      'fontColor': fontColor,
      'textAlign': textAlign,
    };
  }

  factory CalendarEvent.fromJson(Map<String, dynamic> json) {
    return CalendarEvent(
      id: json['id'],
      title: json['title'],
      content: json['content'] ?? '',
      date: DateTime.parse(json['date']),
      type: _enumValue(CalendarEventType.values, json['type'], CalendarEventType.event),
      isCompleted: json['isCompleted'] ?? false,
      alarmId: json['alarmId'],
      titleColor: json['titleColor'] ?? 0xFF000000,
      sticker: json['sticker'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      drawingData: json['drawingData'],
      isFavorite: json['isFavorite'] ?? false,
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 16.0,
      fontFamily: json['fontFamily'],
      fontColor: json['fontColor'],
      // 저장된 값이 범위를 벗어나면(구버전 스키마, 수동 편집 등) 기본값으로 되돌린다.
      // 그대로 두면 상세 화면에서 TextAlign.values[...] 인덱싱 시 RangeError 가 난다.
      textAlign: _enumValue(TextAlign.values, json['textAlign'], TextAlign.left).index,
    );
  }

  /// 저장된 인덱스가 유효하지 않으면 [fallback] 을 돌려준다.
  static T _enumValue<T>(List<T> values, dynamic raw, T fallback) {
    if (raw is int && raw >= 0 && raw < values.length) return values[raw];
    return fallback;
  }
}
