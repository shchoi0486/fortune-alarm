import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import '../models/calendar_event.dart';
import 'drawing_screen.dart';

class MemoBlock {
  final TextEditingController? controller;
  final String? imagePath;
  final String? sticker;
  final String? drawingData; // 그리기 데이터 추가
  final bool isImage;
  final bool isSticker;
  final FocusNode? focusNode;
  double widthFactor; // 너비 비율 (0.1 ~ 1.0)
  bool isSelected; // 크기 조절 모드 여부

  MemoBlock.text(String text) 
    : controller = TextEditingController(text: text), 
      imagePath = null, 
      sticker = null,
      drawingData = null,
      isImage = false,
      isSticker = false,
      widthFactor = 1.0,
      isSelected = false,
      focusNode = FocusNode();
      
  MemoBlock.image(String path, {double width = 1.0, this.drawingData}) 
    : controller = null, 
      imagePath = path, 
      sticker = null,
      isImage = true,
      isSticker = false,
      widthFactor = width,
      isSelected = false,
      focusNode = null;

  MemoBlock.sticker(String stickerEmoji, {double width = 0.2}) 
    : controller = null,
      imagePath = null,
      sticker = stickerEmoji,
      drawingData = null,
      isImage = false,
      isSticker = true,
      widthFactor = width,
      isSelected = false,
      focusNode = null;
      
  void dispose() {
    controller?.dispose();
    focusNode?.dispose();
  }
}

class AddEventSheet extends StatefulWidget {
  final DateTime selectedDate;
  final Function(CalendarEvent, bool) onSave;
  final CalendarEvent? event;
  final Color themeColor;
  final bool isFullScreen;

  const AddEventSheet({
    super.key,
    required this.selectedDate,
    required this.onSave,
    this.event,
    this.themeColor = const Color(0xFFE57373),
    this.isFullScreen = false,
  });

  @override
  State<AddEventSheet> createState() => _AddEventSheetState();
}

class _AddEventSheetState extends State<AddEventSheet> {
  final _titleController = TextEditingController();
  final List<MemoBlock> _memoBlocks = [];
  final LayerLink _iconLayerLink = LayerLink();
  final LayerLink _moodLayerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  OverlayEntry? _moodOverlayEntry;
  Color _selectedTitleColor = Colors.black87;
  
  // 메모 확장 데이터
  String? _selectedSticker;
  List<String> _imagePaths = [];
  String? _drawingData;
  bool _isFavorite = false;
  
  // 글꼴 설정
  double _fontSize = 16.0;
  String _fontFamily = 'Default';
  Color _contentTextColor = Colors.black87;
  TextAlign _textAlign = TextAlign.left;
  
  // 1. 기본 타입을 일정으로 변경
  CalendarEventType _type = CalendarEventType.event;
  
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 0);
  bool _isAlarmEnabled = false;
  bool _isTimeManuallySet = false;
  bool _showEmojiPicker = false;
  bool _isSaving = false; // 저장 중인지 여부
  bool _canPopNow = false; // PopScope에서 즉시 팝 가능 여부

  // 루틴 프리셋 데이터 (이모지와 함께)
  List<Map<String, String>> get _routinePresets {
    final l10n = AppLocalizations.of(context)!;
    return [
      {'emoji': '🏃', 'label': l10n.routineExercise},
      {'emoji': '⛰️', 'label': l10n.routineHiking},
      {'emoji': '🧹', 'label': l10n.routineCleaning},
      {'emoji': '🚗', 'label': l10n.routineTravel},
      {'emoji': '❤️', 'label': l10n.routineDate},
      {'emoji': '🎸', 'label': l10n.routineConcert},
      {'emoji': '🎞️', 'label': l10n.routineMovie},
      {'emoji': '🥂', 'label': l10n.routineMeeting},
    ];
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _moodOverlayEntry?.remove();
    _moodOverlayEntry = null;
    _titleController.dispose();
    for (var block in _memoBlocks) {
      block.dispose();
    }
    super.dispose();
  }

  List<DrawingStroke> _getDrawingStrokes(String? data) {
    if (data == null || data.isEmpty) return [];
    try {
      final decoded = jsonDecode(data);
      if (decoded is Map && decoded['version'] == 2) {
        final List<dynamic> strokesJson = decoded['strokes'];
        return strokesJson.map((s) => DrawingStroke(
          points: (s['points'] as List).map((p) => Offset(
            (p['x'] as num).toDouble(),
            (p['y'] as num).toDouble(),
          )).toList(),
          color: Color((s['color'] as num).toInt()),
          width: (s['width'] as num).toDouble(),
        )).toList();
      } else if (decoded is List) {
        // 구버전 호환성 유지
        final points = decoded.map((p) => Offset(
          (p['x'] as num).toDouble(),
          (p['y'] as num).toDouble(),
        )).toList();
        if (points.isNotEmpty) {
          return [DrawingStroke(points: points, color: Colors.black, width: 3.0)];
        }
      }
    } catch (e) {
      debugPrint('Error parsing drawing data: $e');
    }
    return [];
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _moodOverlayEntry?.remove();
    _moodOverlayEntry = null;
  }

  void _toggleMoodPicker() {
    if (_moodOverlayEntry != null) {
      _removeOverlay();
      return;
    }
    
    // 다른 오버레이가 있다면 닫기
    if (_overlayEntry != null) {
      _removeOverlay();
    }
    
    FocusScope.of(context).unfocus();
    
    // 약간의 지연을 주어 키보드가 닫히고 레이아웃이 안정된 후 표시
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;
      _moodOverlayEntry = _createMoodOverlayEntry();
      Overlay.of(context).insert(_moodOverlayEntry!);
    });
  }

  OverlayEntry _createMoodOverlayEntry() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final blueTheme = widget.themeColor == Colors.transparent 
        ? (isDark ? Colors.white : Colors.black) 
        : widget.themeColor;
    
    final moods = [
      '😐', '😊', '😁', '🥰', '😌',
      '😖', '😡', '☹️', '😢', '😭'
    ];

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          CompositedTransformFollower(
            link: _moodLayerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomRight,
            followerAnchor: Alignment.topRight,
            offset: const Offset(0, 8),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
              child: Container(
                width: 320,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.howIsYourMoodToday,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedSticker = null;
                            });
                            _removeOverlay();
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Opacity(
                            opacity: 0.3,
                            child: Text(
                              '😐',
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), // 여백을 최소한으로 줄임 (12 -> 4)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.0, // 크기를 줄이므로 1:1 비율로 복구
                      ),
                      itemCount: moods.length,
                      itemBuilder: (context, index) {
                        final isNoSticker = moods[index] == '😐';
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedSticker = isNoSticker ? null : moods[index];
                            });
                            _removeOverlay();
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.02),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity: isNoSticker ? 0.3 : 1.0,
                              child: Text(
                                moods[index],
                                style: const TextStyle(
                                  fontSize: 24,
                                  height: 1.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleRoutinePicker() {
    if (_overlayEntry != null) {
      _removeOverlay();
      return;
    }
    
    // 다른 오버레이가 있다면 닫기
    if (_moodOverlayEntry != null) {
      _removeOverlay();
    }
    
    // 키보드가 열려있다면 닫기
    FocusScope.of(context).unfocus();
    
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    });
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
            targetAnchor: Alignment.bottomRight,
            followerAnchor: Alignment.topRight,
            offset: const Offset(0, 4),
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

  void _showWheelTimePicker() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final blueTheme = widget.themeColor == Colors.transparent 
        ? (isDark ? Colors.white : Colors.black) 
        : widget.themeColor;

    int currentHour = _selectedTime.hour;
    int currentMinute = _selectedTime.minute;
    
    // 12시간 형식 변환
    bool isPm = currentHour >= 12;
    int displayHour = currentHour % 12;
    if (displayHour == 0) displayHour = 12;

    final ampmController = FixedExtentScrollController(initialItem: isPm ? 1 : 0);
    final hourController = FixedExtentScrollController(initialItem: displayHour - 1);
    final minuteController = FixedExtentScrollController(initialItem: currentMinute);

    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.setTime,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // 완료 시점의 값을 적용
                            int finalHour = displayHour;
                            if (isPm) {
                              if (finalHour != 12) finalHour += 12;
                            } else {
                              if (finalHour == 12) finalHour = 0;
                            }
                            
                            setState(() {
                              _selectedTime = TimeOfDay(hour: finalHour, minute: currentMinute);
                              _isTimeManuallySet = true;
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.complete,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: blueTheme,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 50,
                              width: 280,
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 오전/오후
                              SizedBox(
                                width: 100,
                                child: CupertinoPicker(
                                  itemExtent: 50,
                                  useMagnifier: true,
                                  magnification: 1.1,
                                  selectionOverlay: const SizedBox(),
                                  scrollController: ampmController,
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      isPm = index == 1;
                                    });
                                  },
                                  children: [
                                    Center(child: Text(AppLocalizations.of(context)!.amWithIcon, style: TextStyle(color: textColor, fontSize: 18))),
                                    Center(child: Text(AppLocalizations.of(context)!.pmWithIcon, style: TextStyle(color: textColor, fontSize: 18))),
                                  ],
                                ),
                              ),
                              // 시
                              SizedBox(
                                width: 70,
                                child: CupertinoPicker(
                                  itemExtent: 50,
                                  looping: true,
                                  useMagnifier: true,
                                  magnification: 1.1,
                                  selectionOverlay: const SizedBox(),
                                  scrollController: hourController,
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      displayHour = index + 1;
                                    });
                                  },
                                  children: List.generate(12, (index) => Center(
                                    child: Text(
                                      (index + 1).toString().padLeft(2, '0'),
                                      style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                ),
                              ),
                              Text(':', style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold)),
                              // 분
                              SizedBox(
                                width: 70,
                                child: CupertinoPicker(
                                  itemExtent: 50,
                                  looping: true,
                                  useMagnifier: true,
                                  magnification: 1.1,
                                selectionOverlay: const SizedBox(),
                                scrollController: minuteController,
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    currentMinute = index;
                                  });
                                },
                                children: List.generate(60, (index) => Center(
                                  child: Text(
                                    index.toString().padLeft(2, '0'),
                                    style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

  void _initializeBlocks(String content, List<String>? images, String? drawingData) {
    // 기존 리소스 정리
    for (var block in _memoBlocks) {
      block.dispose();
    }
    _memoBlocks.clear();

    // drawingData 파싱 (JSON 맵 형식: {"0": "data0", "1": "data1"})
    Map<String, String> drawingDataMap = {};
    if (drawingData != null && drawingData.startsWith('{')) {
      try {
        drawingDataMap = Map<String, String>.from(jsonDecode(drawingData));
      } catch (e) {
        debugPrint('Error parsing drawingData: $e');
      }
    }

    if (content.isEmpty) {
      _memoBlocks.add(MemoBlock.text(''));
      return;
    }

    // 마커: [[IMG_index|width]] 또는 [[STK_sticker|width]]
    final regExp = RegExp(r'\[\[(IMG|STK)_([^|\]]+)(?:\|([\d.]+))?\]\]');
    final matches = regExp.allMatches(content);
    
    int lastMatchEnd = 0;
    for (final match in matches) {
      // 마커 이전의 텍스트
      final textBefore = content.substring(lastMatchEnd, match.start);
      if (textBefore.isNotEmpty || _memoBlocks.isEmpty || _memoBlocks.last.isImage || _memoBlocks.last.isSticker) {
        _memoBlocks.add(MemoBlock.text(textBefore));
      } else if (_memoBlocks.isNotEmpty && !_memoBlocks.last.isImage && !_memoBlocks.last.isSticker) {
        // 이미 텍스트 블록이 있으면 텍스트 추가
        final lastBlock = _memoBlocks.last;
        lastBlock.controller!.text += textBefore;
      }
      
      final String type = match.group(1)!;
      final String value = match.group(2)!;
      final double widthFactor = match.group(3) != null ? double.parse(match.group(3)!) : (type == 'STK' ? 0.2 : 1.0);
      
      if (type == 'IMG') {
        final int imgIndex = int.parse(value);
        if (images != null && imgIndex < images.length) {
          final String? blockDrawingData = drawingDataMap[imgIndex.toString()];
          _memoBlocks.add(MemoBlock.image(images[imgIndex], width: widthFactor, drawingData: blockDrawingData));
        }
      } else if (type == 'STK') {
        _memoBlocks.add(MemoBlock.sticker(value, width: widthFactor));
      }
      
      lastMatchEnd = match.end;
    }
    
    // 마지막 마커 이후의 텍스트
    final textAfter = content.substring(lastMatchEnd);
    if (textAfter.isNotEmpty || _memoBlocks.isEmpty) {
      _memoBlocks.add(MemoBlock.text(textAfter));
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.event != null) {
      _titleController.text = widget.event!.title;
      _type = widget.event!.type;
      _selectedTime = TimeOfDay.fromDateTime(widget.event!.date);
      _isAlarmEnabled = widget.event!.alarmId != null;
      _selectedTitleColor = Color(widget.event!.titleColor);
      _selectedSticker = widget.event!.sticker;
      _imagePaths = widget.event!.images ?? [];
      _drawingData = widget.event!.drawingData;
      _isFavorite = widget.event!.isFavorite;
      _fontSize = widget.event!.fontSize;
      _fontFamily = widget.event!.fontFamily ?? 'Default';
      _contentTextColor = widget.event!.fontColor != null ? Color(widget.event!.fontColor!) : Colors.black87;
      _textAlign = TextAlign.values[widget.event!.textAlign];
      _isTimeManuallySet = true;
      _initializeBlocks(widget.event!.content, _imagePaths, _drawingData);
    } else {
      _selectedTime = const TimeOfDay(hour: 9, minute: 0);
      _isTimeManuallySet = false;
      _initializeBlocks('', [], null);
    }
  }

  Future<void> _pickImage() async {
    // 권한 확인
    PermissionStatus status;
    if (Platform.isAndroid) {
      status = await Permission.photos.request();
      if (status.isPermanentlyDenied || status.isDenied) {
        status = await Permission.storage.request();
      }
    } else {
      status = await Permission.photos.request();
    }

    if (status.isGranted || status.isLimited) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _type = CalendarEventType.memo;
          
          // 현재 포커스된 블록 찾기
          int focusedBlockIndex = _memoBlocks.indexWhere((b) => b.focusNode?.hasFocus ?? false);
          if (focusedBlockIndex == -1) focusedBlockIndex = _memoBlocks.length - 1;

          final currentBlock = _memoBlocks[focusedBlockIndex];
          MemoBlock? nextFocusedBlock;
          
          if (currentBlock.isImage || currentBlock.isSticker) {
            final newImage = MemoBlock.image(image.path);
            _memoBlocks.insert(focusedBlockIndex + 1, newImage);
            
            // 다음 블록이 없거나 텍스트 블록이 아니면 빈 텍스트 블록 추가
            if (focusedBlockIndex + 2 >= _memoBlocks.length || (_memoBlocks[focusedBlockIndex + 2].isImage || _memoBlocks[focusedBlockIndex + 2].isSticker)) {
              nextFocusedBlock = MemoBlock.text('');
              _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
            } else {
              nextFocusedBlock = _memoBlocks[focusedBlockIndex + 2];
            }
          } else {
            final controller = currentBlock.controller!;
            final selection = controller.selection;
            
            if (selection.isValid && selection.baseOffset < controller.text.length) {
              final textBefore = controller.text.substring(0, selection.baseOffset);
              final textAfter = controller.text.substring(selection.baseOffset);
              
              controller.text = textBefore;
              _memoBlocks.insert(focusedBlockIndex + 1, MemoBlock.image(image.path));
              nextFocusedBlock = MemoBlock.text(textAfter);
              _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
            } else {
              _memoBlocks.insert(focusedBlockIndex + 1, MemoBlock.image(image.path));
              
              // 다음 블록이 없거나 텍스트 블록이 아니면 빈 텍스트 블록 추가
              if (focusedBlockIndex + 2 >= _memoBlocks.length || (_memoBlocks[focusedBlockIndex + 2].isImage || _memoBlocks[focusedBlockIndex + 2].isSticker)) {
                nextFocusedBlock = MemoBlock.text('');
                _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
              } else {
                nextFocusedBlock = _memoBlocks[focusedBlockIndex + 2];
              }
            }
          }

          // 다음 텍스트 블록에 포커스
          WidgetsBinding.instance.addPostFrameCallback((_) {
            nextFocusedBlock?.focusNode?.requestFocus();
          });
                });
      }
    } else if (status.isPermanentlyDenied) {
      // 영구적으로 거부된 경우 설정으로 이동 안내
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.permissionRequired),
            content: Text(AppLocalizations.of(context)!.photoPermissionDescription),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.goToSettings),
              ),
            ],
          ),
        );
      }
    } else {
      // 일반 거부
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.photoPermissionNeeded)),
        );
      }
    }
  }

  void _showFontPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.fontSettings, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  _buildFontToolButton(Icons.format_align_left, _textAlign == TextAlign.left, () {
                    setState(() => _textAlign = TextAlign.left);
                    setSheetState(() {});
                  }),
                  _buildFontToolButton(Icons.format_align_center, _textAlign == TextAlign.center, () {
                    setState(() => _textAlign = TextAlign.center);
                    setSheetState(() {});
                  }),
                  _buildFontToolButton(Icons.format_align_right, _textAlign == TextAlign.right, () {
                    setState(() => _textAlign = TextAlign.right);
                    setSheetState(() {});
                  }),
                  const Spacer(),
                  _buildSizeButton('H1', 24, _fontSize == 24, () {
                    setState(() => _fontSize = 24);
                    setSheetState(() {});
                  }),
                  _buildSizeButton('H2', 20, _fontSize == 20, () {
                    setState(() => _fontSize = 20);
                    setSheetState(() {});
                  }),
                  _buildSizeButton('H3', 18, _fontSize == 18, () {
                    setState(() => _fontSize = 18);
                    setSheetState(() {});
                  }),
                  _buildSizeButton('H4', 16, _fontSize == 16, () {
                    setState(() => _fontSize = 16);
                    setSheetState(() {});
                  }),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Colors.black, Colors.grey, Colors.red, Colors.pink, 
                    Colors.purple, Colors.deepPurple, Colors.indigo, Colors.blue, 
                    Colors.teal, Colors.green, Colors.orange, Colors.brown
                  ].map((color) => GestureDetector(
                    onTap: () {
                      setState(() => _contentTextColor = color);
                      setSheetState(() {});
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _contentTextColor == color ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Note: 아래 폰트들을 사용하려면 pubspec.yaml에 폰트 에셋을 등록해야 합니다.
                    'Default', 'Bold', 'Single Day', 'Monospace', 'Nanum Pen Script', 'Gaegu', 'BM JUA'
                  ].map((font) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _buildFontFamilyButton(font, _fontFamily == font, () {
                      setState(() => _fontFamily = font);
                      setSheetState(() {});
                    }),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFontToolButton(IconData icon, bool isSelected, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
      onPressed: onTap,
    );
  }

  Widget _buildSizeButton(String label, double displaySize, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label, 
          style: TextStyle(
            fontSize: displaySize * 0.85, // 미리보기용으로 약간 조정
            color: isSelected ? Colors.blue : Colors.grey, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFontFamilyButton(String font, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.blue : Colors.transparent),
        ),
        child: Text(font, style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black87,
          fontFamily: font == 'Default' ? null : font,
          fontWeight: font == 'Bold' ? FontWeight.bold : FontWeight.normal,
        )),
      ),
    );
  }

  void _focusForEmoji() {
    // 1. 현재 타입 변경 및 메모 모드로 전환
    if (_type != CalendarEventType.memo) {
      setState(() {
        _type = CalendarEventType.memo;
      });
    }
    
    // 2. 이모지 피커 토글 및 키보드 제어
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
      
      if (_showEmojiPicker) {
        // 이모지 피커를 보여줄 때 키보드 숨김
        FocusScope.of(context).unfocus();
      } else {
        // 이모지 피커를 닫을 때 키보드 표시
        _focusOnLastTextBlock();
      }
    });
  }

  void _focusOnLastTextBlock() {
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      
      setState(() {
        // 모든 블록 선택 해제
        for (var b in _memoBlocks) {
          b.isSelected = false;
        }

        // 블록이 없거나 마지막 블록이 이미지/스티커인 경우
        if (_memoBlocks.isEmpty || _memoBlocks.last.isImage || _memoBlocks.last.isSticker) {
          final newBlock = MemoBlock.text('');
          _memoBlocks.add(newBlock);
          
          WidgetsBinding.instance.addPostFrameCallback((_) {
            newBlock.focusNode?.requestFocus();
            SystemChannels.textInput.invokeMethod('TextInput.show');
          });
        } else {
          // 마지막 블록이 텍스트인 경우
          final lastBlock = _memoBlocks.last;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            lastBlock.focusNode?.requestFocus();
            SystemChannels.textInput.invokeMethod('TextInput.show');
          });
        }
      });
    });
  }

  void _onEmojiSelected(Emoji emoji) {
    setState(() {
      // 모든 블록 선택 해제
      for (var b in _memoBlocks) {
        b.isSelected = false;
      }
      _type = CalendarEventType.memo;
      
      // 현재 포커스된 블록 찾기
      int focusedBlockIndex = _memoBlocks.indexWhere((b) => b.focusNode?.hasFocus ?? false);
      
      // 포커스된 블록이 없으면 마지막 텍스트 블록 찾기
      if (focusedBlockIndex == -1) {
        focusedBlockIndex = _memoBlocks.lastIndexWhere((b) => !b.isImage && !b.isSticker);
      }
      
      // 텍스트 블록이 하나도 없으면 새로 생성
      if (focusedBlockIndex == -1) {
        final newBlock = MemoBlock.text('');
        _memoBlocks.add(newBlock);
        focusedBlockIndex = _memoBlocks.length - 1;
      }

      final currentBlock = _memoBlocks[focusedBlockIndex];
      
      if (!currentBlock.isImage && !currentBlock.isSticker) {
        // 텍스트 블록인 경우 커서 위치에 이모지 삽입
        final controller = currentBlock.controller!;
        final text = controller.text;
        final selection = controller.selection;
        
        String newText;
        int newCursorPosition;
        
        if (selection.isValid && selection.start >= 0 && selection.start <= text.length && selection.end >= 0 && selection.end <= text.length) {
          newText = text.replaceRange(selection.start, selection.end, emoji.emoji);
          newCursorPosition = selection.start + emoji.emoji.length;
        } else {
          newText = text + emoji.emoji;
          newCursorPosition = newText.length;
        }
        
        controller.text = newText;
        controller.selection = TextSelection.collapsed(offset: newCursorPosition);
        currentBlock.focusNode?.requestFocus();
      } else {
        // 이미지/스티커 블록이 포커스된 경우 그 뒤에 새로운 텍스트 블록을 만들고 삽입
        final newBlock = MemoBlock.text(emoji.emoji);
        _memoBlocks.insert(focusedBlockIndex + 1, newBlock);
        
        WidgetsBinding.instance.addPostFrameCallback((_) {
          newBlock.focusNode?.requestFocus();
          newBlock.controller?.selection = TextSelection.collapsed(offset: emoji.emoji.length);
        });
      }
    });
  }

  Widget _buildEmojiPicker(bool isDark) {
    if (!_showEmojiPicker) return const SizedBox.shrink();
    
    return SizedBox(
      height: 280,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) => _onEmojiSelected(emoji),
        config: Config(
          height: 280,
          checkPlatformCompatibility: true,
          emojiViewConfig: EmojiViewConfig(
            emojiSizeMax: 32 * (Platform.isIOS ? 1.20 : 1.0),
            backgroundColor: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF2F2F2),
            columns: 7,
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
          ),
          categoryViewConfig: CategoryViewConfig(
            backgroundColor: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
          ),
          bottomActionBarConfig: const BottomActionBarConfig(
            showBackspaceButton: true,
            backgroundColor: Colors.transparent,
            buttonColor: Colors.transparent,
            buttonIconColor: Colors.grey,
          ),
          searchViewConfig: const SearchViewConfig(
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  void _openDrawingScreen({MemoBlock? targetBlock}) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => DrawingScreen(initialDrawingData: targetBlock?.drawingData), // 수정 시 기존 데이터 전달
      ),
    );

    if (result != null) {
      try {
        // 1. 그리기 데이터를 이미지 파일로 저장
        final strokes = _getDrawingStrokes(result);
        if (strokes.isEmpty) return;

        // 실제 그림이 있는 영역(Bounding Box) 계산
        double minX = double.infinity;
        double minY = double.infinity;
        double maxX = double.negativeInfinity;
        double maxY = double.negativeInfinity;

        for (var stroke in strokes) {
          for (var point in stroke.points) {
            if (point.dx < minX) minX = point.dx;
            if (point.dy < minY) minY = point.dy;
            if (point.dx > maxX) maxX = point.dx;
            if (point.dy > maxY) maxY = point.dy;
          }
        }

        // 약간의 여백(Padding) 추가
        const double padding = 20.0;
        double drawingWidth = (maxX - minX) + (padding * 2);
        double drawingHeight = (maxY - minY) + (padding * 2);

        // 최소 크기 보장
        drawingWidth = drawingWidth.clamp(100.0, 2000.0);
        drawingHeight = drawingHeight.clamp(100.0, 2000.0);

        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, drawingWidth, drawingHeight));
        
        // 배경 투명 처리
        final bgPaint = Paint()..color = Colors.white;
        canvas.drawRect(Rect.fromLTWH(0, 0, drawingWidth, drawingHeight), bgPaint);

        // 그림을 캔버스 중앙에 맞게 이동하여 그리기
        canvas.save();
        canvas.translate(-minX + padding, -minY + padding);
        
        for (var stroke in strokes) {
          if (stroke.points.isEmpty) continue;
          final paint = Paint()
            ..color = stroke.color
            ..strokeWidth = stroke.width
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round
            ..style = PaintingStyle.stroke;

          if (stroke.points.length < 2) {
            canvas.drawCircle(stroke.points.first, stroke.width / 2, paint..style = PaintingStyle.fill);
            continue;
          }

          final path = Path();
          path.moveTo(stroke.points.first.dx, stroke.points.first.dy);
          for (int i = 0; i < stroke.points.length - 1; i++) {
            final p1 = stroke.points[i];
            final p2 = stroke.points[i + 1];
            final midPoint = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
            path.quadraticBezierTo(p1.dx, p1.dy, midPoint.dx, midPoint.dy);
          }
          path.lineTo(stroke.points.last.dx, stroke.points.last.dy);
          canvas.drawPath(path, paint);
        }
        canvas.restore();

        final picture = recorder.endRecording();
        final img = await picture.toImage(drawingWidth.toInt(), drawingHeight.toInt());
        final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
        final buffer = byteData!.buffer.asUint8List();

        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/drawing_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File(filePath);
        await file.writeAsBytes(buffer);

        setState(() {
          _type = CalendarEventType.memo;
          _drawingData = result;
          
          if (targetBlock != null) {
            // 기존 블록 수정
            int index = _memoBlocks.indexOf(targetBlock);
            if (index != -1) {
              _memoBlocks[index] = MemoBlock.image(
                filePath, 
                width: targetBlock.widthFactor, 
                drawingData: result
              );
            }
          } else {
            // 새 블록 추가
            int focusedBlockIndex = _memoBlocks.indexWhere((b) => b.focusNode?.hasFocus ?? false);
            if (focusedBlockIndex == -1) focusedBlockIndex = _memoBlocks.length - 1;

            final currentBlock = _memoBlocks[focusedBlockIndex];
            MemoBlock? nextFocusedBlock;
            
            final imageBlock = MemoBlock.image(filePath, width: 1.0, drawingData: result);
            
            if (currentBlock.isImage || currentBlock.isSticker) {
              _memoBlocks.insert(focusedBlockIndex + 1, imageBlock);
              
              if (focusedBlockIndex + 2 >= _memoBlocks.length || (_memoBlocks[focusedBlockIndex + 2].isImage || _memoBlocks[focusedBlockIndex + 2].isSticker)) {
                nextFocusedBlock = MemoBlock.text('');
                _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
              } else {
                nextFocusedBlock = _memoBlocks[focusedBlockIndex + 2];
              }
            } else {
              final controller = currentBlock.controller!;
              final selection = controller.selection;
              
              if (selection.isValid && selection.baseOffset < controller.text.length) {
                final textBefore = controller.text.substring(0, selection.baseOffset);
                final textAfter = controller.text.substring(selection.baseOffset);
                
                controller.text = textBefore;
                _memoBlocks.insert(focusedBlockIndex + 1, imageBlock);
                nextFocusedBlock = MemoBlock.text(textAfter);
                _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
              } else {
                _memoBlocks.insert(focusedBlockIndex + 1, imageBlock);
                
                if (focusedBlockIndex + 2 >= _memoBlocks.length || (_memoBlocks[focusedBlockIndex + 2].isImage || _memoBlocks[focusedBlockIndex + 2].isSticker)) {
                  nextFocusedBlock = MemoBlock.text('');
                  _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
                } else {
                  nextFocusedBlock = _memoBlocks[focusedBlockIndex + 2];
                }
              }
            }

            WidgetsBinding.instance.addPostFrameCallback((_) {
              nextFocusedBlock?.focusNode?.requestFocus();
            });
          }
        });
      } catch (e) {
        debugPrint('Error saving drawing: $e');
      }
    }
  }

  Future<void> _handleContentInsertion(KeyboardInsertedContent content) async {
    if (content.data != null) {
      try {
        final Directory tempDir = await getTemporaryDirectory();
        final String extension = content.mimeType.split('/').last;
        final String filePath = '${tempDir.path}/keyboard_content_${DateTime.now().millisecondsSinceEpoch}.$extension';
        final File file = File(filePath);
        await file.writeAsBytes(content.data!);
        
        setState(() {
          // 현재 포커스된 블록 찾기
          int focusedBlockIndex = _memoBlocks.indexWhere((b) => b.focusNode?.hasFocus ?? false);
          if (focusedBlockIndex == -1) focusedBlockIndex = _memoBlocks.length - 1;

          final currentBlock = _memoBlocks[focusedBlockIndex];
          MemoBlock? nextFocusedBlock;

          if (currentBlock.isImage || currentBlock.isSticker) {
            // 이미지가 포커스된 경우, 그 뒤에 추가
            _memoBlocks.insert(focusedBlockIndex + 1, MemoBlock.image(filePath));
            
            // 다음 블록이 없거나 텍스트 블록이 아니면 빈 텍스트 블록 추가
            if (focusedBlockIndex + 2 >= _memoBlocks.length || (_memoBlocks[focusedBlockIndex + 2].isImage || _memoBlocks[focusedBlockIndex + 2].isSticker)) {
              nextFocusedBlock = MemoBlock.text('');
              _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
            } else {
              nextFocusedBlock = _memoBlocks[focusedBlockIndex + 2];
            }
          } else {
            final controller = currentBlock.controller!;
            final text = controller.text;
            final selection = controller.selection;
            final int cursorPosition = (selection.isValid && selection.start >= 0 && selection.start <= text.length) ? selection.start : text.length;
            
            final beforeText = text.substring(0, cursorPosition);
            final afterText = text.substring(cursorPosition);
            
            // 현재 블록은 앞부분만 가짐
            controller.text = beforeText;
            
            // 이미지 블록 삽입
            _memoBlocks.insert(focusedBlockIndex + 1, MemoBlock.image(filePath));
            
            if (afterText.isNotEmpty) {
              nextFocusedBlock = MemoBlock.text(afterText);
              _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
            } else {
              // 다음 블록이 없거나 텍스트 블록이 아니면 빈 텍스트 블록 추가
              if (focusedBlockIndex + 2 >= _memoBlocks.length || (_memoBlocks[focusedBlockIndex + 2].isImage || _memoBlocks[focusedBlockIndex + 2].isSticker)) {
                nextFocusedBlock = MemoBlock.text('');
                _memoBlocks.insert(focusedBlockIndex + 2, nextFocusedBlock);
              } else {
                nextFocusedBlock = _memoBlocks[focusedBlockIndex + 2];
              }
            }
          }

          // 다음 텍스트 블록에 포커스
          WidgetsBinding.instance.addPostFrameCallback((_) {
            nextFocusedBlock?.focusNode?.requestFocus();
          });
        
          if (_type != CalendarEventType.memo) {
            _type = CalendarEventType.memo;
          }
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.imageAddedFromKeyboard), duration: const Duration(seconds: 2)),
          );
        }
      } catch (e) {
        debugPrint('Error saving keyboard content: $e');
      }
    }
  }

  bool _hasChanges() {
    // 이미 존재하는 이벤트를 수정 중인 경우
    if (widget.event != null) {
      if (_titleController.text != widget.event!.title) return true;
      if (_type != widget.event!.type) return true;
      if (_selectedSticker != widget.event!.sticker) return true;
      if (_isAlarmEnabled != (widget.event!.alarmId != null)) return true;
      
      // 메모 블록 내용 비교는 복잡하므로 일단 내용이 있으면 변경된 것으로 간주하거나 
      // 더 정교하게 비교할 수 있지만, 여기서는 단순하게 처리
      if (_memoBlocks.length > 1) return true;
      if (_memoBlocks.isNotEmpty && _memoBlocks[0].controller != null && 
          _memoBlocks[0].controller!.text != (widget.event!.content)) {
        return true;
      }
    } else {
      // 새 이벤트를 작성 중인 경우
      if (_titleController.text.trim().isNotEmpty) return true;
      if (_selectedSticker != null) return true;
      if (_isTimeManuallySet) return true;
      if (_memoBlocks.length > 1) return true;
      if (_memoBlocks.isNotEmpty && _memoBlocks[0].controller != null && 
          _memoBlocks[0].controller!.text.trim().isNotEmpty) {
        return true;
      }
    }
    
    return false;
  }

  Future<bool> _showExitConfirmation() async {
    if (_isSaving || !_hasChanges()) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.cancelWriting),
        content: Text(AppLocalizations.of(context)!.cancelWritingConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.continueWriting),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.cancelWriting),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Widget _buildFullScreenLayout(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 메모 모드일 때 배경색 변경 (연한 파스텔 블루)
    final memoBgColor = isDark ? const Color(0xFF1E293B) : const Color(0xFFF0F7FF);
    final defaultBgColor = isDark ? const Color(0xFF121212) : const Color(0xFFF8FAFC);
    final backgroundColor = _type == CalendarEventType.memo ? memoBgColor : defaultBgColor;
    final bool isBackgroundDark = backgroundColor.computeLuminance() < 0.5;
    
    final textColor = isDark ? Colors.white : Colors.black87;
    final blueTheme = widget.themeColor == Colors.transparent 
        ? (isDark ? Colors.white : Colors.black) 
        : widget.themeColor;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop || _canPopNow) return;
        final shouldPop = await _showExitConfirmation();
        if (shouldPop && mounted) {
          setState(() => _canPopNow = true);
          Navigator.pop(context);
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isBackgroundDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: isBackgroundDark ? Brightness.dark : Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: isBackgroundDark ? Brightness.light : Brightness.dark,
              statusBarBrightness: isBackgroundDark ? Brightness.dark : Brightness.light,
            ),
            leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () async {
              if (await _showExitConfirmation()) {
                if (mounted) {
                  setState(() => _canPopNow = true);
                  Navigator.pop(context);
                }
              }
            },
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueTheme,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              child: Text(AppLocalizations.of(context)!.save, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 날짜 선택기 및 탭 (순서 변경: 탭 왼쪽, 날짜 오른쪽)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // 탭 버튼을 왼쪽으로 이동
                Container(
                  width: 130,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black26 : Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      _buildTypeTab(
                        AppLocalizations.of(context)!.event,
                        _type == CalendarEventType.event || _type == CalendarEventType.routine,
                        blueTheme,
                        isDark,
                        () => setState(() => _type = CalendarEventType.event),
                        isSmall: true,
                      ),
                      _buildTypeTab(
                        AppLocalizations.of(context)!.memo,
                        _type == CalendarEventType.memo,
                        blueTheme,
                        isDark,
                        () => setState(() => _type = CalendarEventType.memo),
                        isSmall: true,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // 날짜를 오른쪽으로 이동 및 형식 변경
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Row(
                       children: [
                         Text(
                           DateFormat.yMMMMd(AppLocalizations.of(context)?.localeName ?? 'ko').format(widget.selectedDate),
                           style: TextStyle(
                             fontSize: 18, 
                             fontWeight: FontWeight.bold, 
                             color: textColor
                           ),
                         ),
                         Icon(Icons.arrow_drop_down, color: (textColor ?? Colors.black).withOpacity(0.6)),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          Expanded(
            child: GestureDetector(
              onTap: _focusOnLastTextBlock,
              behavior: HitTestBehavior.opaque,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  if (_type != CalendarEventType.memo) ...[
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _showColorPicker(context),
                          child: Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: _selectedTitleColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark ? Colors.white24 : Colors.black12,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            contentInsertionConfiguration: ContentInsertionConfiguration(onContentInserted: _handleContentInsertion),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.title,
                              hintStyle: TextStyle(color: (textColor ?? Colors.black).withOpacity(0.4), fontSize: 20, fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold, 
                              color: (_selectedTitleColor == Colors.black87 || _selectedTitleColor == Colors.black) 
                                  ? textColor 
                                  : _selectedTitleColor
                            ),
                          ),
                        ),
                        CompositedTransformTarget(
                           link: _iconLayerLink,
                           child: GestureDetector(
                             onTap: _toggleRoutinePicker,
                             child: Container(
                               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                               decoration: BoxDecoration(
                                  color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8), // 라운드 값을 줄여 더 사각 형태로 (20 -> 8)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.routineSummary, // 간단 일정 -> 루틴 요약
                                      style: TextStyle(
                                       fontSize: 13,
                                       fontWeight: FontWeight.w600,
                                       color: (textColor ?? Colors.black).withOpacity(0.6),
                                     ),
                                   ),
                                   const SizedBox(width: 4),
                                   Icon(
                                     Icons.keyboard_arrow_down_rounded,
                                     size: 18,
                                     color: (textColor ?? Colors.black).withOpacity(0.4),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                        const SizedBox(width: 8),
                        CompositedTransformTarget(
                          link: _moodLayerLink,
                          child: GestureDetector(
                            onTap: _toggleMoodPicker,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _selectedSticker ?? '😐',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: _selectedSticker == null 
                                      ? (isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.2))
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 시간 설정
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white10 : Colors.black.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: _showWheelTimePicker,
                              child: Row(
                                children: [
                                  Icon(Icons.access_time_filled, color: blueTheme, size: 22),
                                  const SizedBox(width: 12),
                                  Text(
                                    _selectedTime.format(context),
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(height: 24, width: 1, color: (textColor ?? Colors.black).withOpacity(0.1), margin: const EdgeInsets.symmetric(horizontal: 16)),
                          GestureDetector(
                            onTap: () => setState(() => _isAlarmEnabled = !_isAlarmEnabled),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: _isAlarmEnabled ? blueTheme.withOpacity(0.1) : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: _isAlarmEnabled ? blueTheme : (textColor ?? Colors.black).withOpacity(0.2)),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    _isAlarmEnabled ? Icons.notifications_active : Icons.notifications_off,
                                    color: _isAlarmEnabled ? blueTheme : (textColor ?? Colors.black).withOpacity(0.4),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    _isAlarmEnabled ? AppLocalizations.of(context)!.alarmOn : AppLocalizations.of(context)!.alarmOff,
                                    style: TextStyle(
                                      color: _isAlarmEnabled ? blueTheme : (textColor ?? Colors.black).withOpacity(0.4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ] else ...[
                    // 메모 모드 제목 영역
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _showColorPicker(context),
                          child: Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: _selectedTitleColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark ? Colors.white24 : Colors.black12,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                          controller: _titleController,
                          contentInsertionConfiguration: ContentInsertionConfiguration(onContentInserted: _handleContentInsertion),
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.title,
                              hintStyle: TextStyle(color: (textColor ?? Colors.black).withOpacity(0.4), fontSize: 20, fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold, 
                              color: (_selectedTitleColor == Colors.black87 || _selectedTitleColor == Colors.black) 
                                  ? textColor 
                                  : _selectedTitleColor
                            ),
                          ),
                        ),
                        CompositedTransformTarget(
                          link: _moodLayerLink,
                          child: GestureDetector(
                            onTap: _toggleMoodPicker,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _selectedSticker ?? '😐',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: _selectedSticker == null 
                                      ? (isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.2))
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],

                  // 메모 내용 (블록 단위 렌더링)
                  Column(
                    children: _memoBlocks.map((block) {
                      if (block.isImage || block.isSticker) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return _buildResizableBlock(block, blueTheme, constraints.maxWidth);
                          },
                        );
                      } else {
                        return TextField(
                          controller: block.controller,
                          focusNode: block.focusNode,
                          contentInsertionConfiguration: ContentInsertionConfiguration(onContentInserted: _handleContentInsertion),
                          maxLines: null,
                          minLines: 1,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          textAlign: _textAlign,
                          decoration: InputDecoration(
                            hintText: (_memoBlocks.indexOf(block) == 0 && block.controller!.text.isEmpty) ? AppLocalizations.of(context)!.contentHint : '',
                            hintStyle: TextStyle(
                              color: (textColor ?? Colors.black).withOpacity(0.4),
                              fontSize: _fontSize,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: TextStyle(
                            fontSize: _fontSize, 
                            color: _type == CalendarEventType.memo ? _contentTextColor : textColor,
                            fontFamily: _fontFamily == 'Default' ? null : _fontFamily,
                            fontWeight: _fontFamily == 'Bold' ? FontWeight.bold : FontWeight.normal,
                            height: 1.6,
                          ),
                        );
                      }
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
          
          // 하단 툴바
          _buildBottomToolbar(isDark, blueTheme),
          
          // 이모지 피커
          _buildEmojiPicker(isDark),
        ],
      ),
    ),
    ),
    );
  }

  Widget _buildBottomToolbar(bool isDark, Color blueTheme, {bool showBackground = true}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: showBackground ? MediaQuery.of(context).padding.bottom + 4 : 4, 
        top: 4
      ),
      decoration: showBackground ? BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 일정 모드
          if (_type != CalendarEventType.memo) ...[
            IconButton(
              icon: Icon(_isFavorite ? Icons.star : Icons.star_border, color: _isFavorite ? Colors.amber : null), 
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              }
            ),
            IconButton(icon: const Icon(Icons.text_fields), onPressed: _showFontPicker),
            IconButton(
              icon: const Icon(Icons.notes), 
              onPressed: _focusOnLastTextBlock, // 내용 입력창으로 포커스 이동
            ),
          ] else ...[
            // 메모 모드에서는 모든 꾸미기 기능 제공
            IconButton(icon: const Icon(Icons.image_outlined), onPressed: _pickImage),
            IconButton(
              icon: Icon(_isFavorite ? Icons.star : Icons.star_border, color: _isFavorite ? Colors.amber : null), 
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              }
            ),
            IconButton(icon: const Icon(Icons.sentiment_satisfied_alt_outlined), onPressed: _focusForEmoji),
            IconButton(icon: const Icon(Icons.text_fields), onPressed: _showFontPicker),
            IconButton(
              icon: Icon(Icons.edit_note, color: _drawingData != null ? blueTheme : null), 
              onPressed: _openDrawingScreen
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFullScreen) {
      return _buildFullScreenLayout(context);
    }

    final double bottomInset = MediaQuery.of(context).viewInsets.bottom;
    // 하단 탭바 높이 (대략 56~80) + 여유 공간
    final double bottomNavHeight = 100.0;

    // 키보드가 올라오면 이모지 피커 닫기
    if (bottomInset > 0 && _showEmojiPicker) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _showEmojiPicker) {
          setState(() {
            _showEmojiPicker = false;
          });
        }
      });
    }

    // 테마 관련 색상 정의
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
     final backgroundColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
     final bool isBackgroundDark = backgroundColor.computeLuminance() < 0.5;

     // 강제로 라이트 모드 아이콘이 나오도록 설정 (배경이 밝은 경우)
      final systemUiStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isBackgroundDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isBackgroundDark ? Brightness.dark : Brightness.light,
      );

      final blueTheme = widget.themeColor == Colors.transparent 
          ? (isDark ? Colors.white : Colors.black) 
          : widget.themeColor;
      final textColor = isDark ? Colors.white : Colors.grey[800];
      final inputFillColor = isDark ? Colors.grey[800] : Colors.grey[50];
      final tabBackgroundColor = isDark ? Colors.grey[900] : Colors.grey[100];
      final dividerColor = isDark ? Colors.grey[700] : Colors.grey[300];
      final hintColor = isDark ? Colors.grey[500] : Colors.grey;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop || _canPopNow) return;
        final shouldPop = await _showExitConfirmation();
        if (shouldPop && mounted) {
          setState(() => _canPopNow = true);
          Navigator.pop(context);
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiStyle,
        child: Padding(
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
        child: GestureDetector(
          onTap: () {
            setState(() {
              _focusOnLastTextBlock();
              // 모든 블록 선택 해제
              for (var b in _memoBlocks) {
                b.isSelected = false;
              }
            });
          },
          behavior: HitTestBehavior.opaque,
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
              AppLocalizations.of(context)!.addEvent,
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
                    AppLocalizations.of(context)!.event,
                    _type == CalendarEventType.event || _type == CalendarEventType.routine,
                    blueTheme,
                    isDark,
                    () {
                      setState(() {
                      _type = CalendarEventType.event;
                    });
                    },
                  ),
                  _buildTypeTab(
                    AppLocalizations.of(context)!.memo,
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

            // 제목 입력
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    contentInsertionConfiguration: ContentInsertionConfiguration(onContentInserted: _handleContentInsertion),
                    scrollPadding: const EdgeInsets.only(bottom: 120),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.title,
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
                                border: Border.all(color: hintColor?.withOpacity(0.5) ?? Colors.grey.withOpacity(0.5), width: 1.5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      suffixIcon: _type != CalendarEventType.memo ? CompositedTransformTarget(
                        link: _iconLayerLink,
                        child: IconButton(
                          icon: Icon(Icons.arrow_drop_down_circle_outlined, color: hintColor),
                          onPressed: _toggleRoutinePicker,
                        ),
                      ) : null,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      isDense: true,
                    ),
                    style: TextStyle(
                      fontSize: 14, 
                      color: (_selectedTitleColor == Colors.black87 || _selectedTitleColor == Colors.black) 
                          ? textColor 
                          : _selectedTitleColor, 
                      fontWeight: _type == CalendarEventType.memo ? FontWeight.bold : FontWeight.normal
                    ),
                    onChanged: (text) {
                      if (_type == CalendarEventType.routine && !_routinePresets.any((e) => "${e['emoji']} ${e['label']}" == text)) {
                        setState(() {
                          _type = CalendarEventType.event;
                        });
                      }
                    },
                  ),
                ),
                if (_type == CalendarEventType.memo) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _toggleMoodPicker,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: inputFillColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _selectedSticker ?? '😐',
                        style: TextStyle(
                          fontSize: 24,
                          color: _selectedSticker == null 
                              ? (isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.2))
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),

            // 내용 입력 (블록 단위 렌더링)
            Column(
              children: _memoBlocks.map((block) {
                if (block.isImage || block.isSticker) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return _buildResizableBlock(block, blueTheme, constraints.maxWidth);
                    },
                  );
                } else {
                  return GestureDetector(
                    onLongPress: () => _showBlockActionDialog(block),
                    child: TextField(
                      controller: block.controller,
                      focusNode: block.focusNode,
                      contentInsertionConfiguration: ContentInsertionConfiguration(onContentInserted: _handleContentInsertion),
                      maxLines: null,
                      minLines: 1,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      textAlign: _textAlign,
                      decoration: InputDecoration(
                        hintText: (_memoBlocks.indexOf(block) == 0 && block.controller!.text.isEmpty) ? AppLocalizations.of(context)!.contentHint : '',
                        hintStyle: TextStyle(
                          color: hintColor,
                          fontSize: _fontSize,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 4),
                        isDense: true,
                      ),
                      style: TextStyle(
                        fontSize: _fontSize, 
                        color: _type == CalendarEventType.memo ? _contentTextColor : textColor,
                        fontFamily: _fontFamily == 'Default' ? null : _fontFamily,
                        fontWeight: _fontFamily == 'Bold' ? FontWeight.bold : FontWeight.normal,
                        height: 1.6,
                      ),
                    ),
                  );
                }
              }).toList(),
            ),
            const SizedBox(height: 8),

            // 시간 및 알람 설정 (메모가 아닐 경우 표시)
            if (_type != CalendarEventType.memo) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: inputFillColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: (dividerColor ?? Colors.grey).withOpacity(0.5)),
                ),
                child: Row(
                  children: [
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
                        child: Row(
                          children: [
                            Icon(Icons.access_time_filled, color: blueTheme, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              _selectedTime.format(context),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      color: dividerColor,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isAlarmEnabled = !_isAlarmEnabled;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: _isAlarmEnabled ? blueTheme.withOpacity(0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _isAlarmEnabled ? blueTheme : Colors.transparent),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _isAlarmEnabled ? Icons.notifications_active : Icons.notifications_off,
                              color: _isAlarmEnabled ? blueTheme : hintColor,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _isAlarmEnabled ? AppLocalizations.of(context)!.alarmOn : AppLocalizations.of(context)!.alarmOff,
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
              const SizedBox(height: 12),
            ],

            // 하단 툴바 (꾸미기 기능)
            _buildBottomToolbar(isDark, blueTheme, showBackground: false),
            
            // 이모지 피커
            _buildEmojiPicker(isDark),
            
            const SizedBox(height: 16),

            // 저장 버튼
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueTheme,
                foregroundColor: blueTheme.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.save,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    ),
    ),
    ),
    );
  }

  void _showBlockActionDialog(MemoBlock block) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.manageItem),
        content: Text(AppLocalizations.of(context)!.manageItemDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (block.isImage) {
                // 이미지 블록은 무조건 그리기 모드로 수정 시도 (기존 데이터 있으면 로드)
                _openDrawingScreen(targetBlock: block);
              } else if (!block.isSticker) {
                // 텍스트 블록: 포커스 주기
                setState(() {
                  block.focusNode?.requestFocus();
                });
              } else {
                // 스티커 블록: 선택 모드(크기 조절) 활성화
                setState(() {
                  for (var b in _memoBlocks) {
                    b.isSelected = (b == block);
                  }
                });
              }
            },
            child: Text(AppLocalizations.of(context)!.edit),
          ),
          TextButton(
            onPressed: () {
              setState(() => _memoBlocks.remove(block));
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );
  }

  Widget _buildResizableBlock(MemoBlock block, Color blueTheme, double maxWidth) {
    Alignment alignment;
    switch (_textAlign) {
      case TextAlign.left:
        alignment = Alignment.centerLeft;
        break;
      case TextAlign.right:
        alignment = Alignment.centerRight;
        break;
      default:
        alignment = Alignment.center;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: alignment,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // 다른 블록 선택 해제
              for (var b in _memoBlocks) {
                if (b != block) b.isSelected = false;
              }
              block.isSelected = !block.isSelected;
              // 키보드 닫기
              FocusScope.of(context).unfocus();
            });
          },
          onLongPress: () => _showBlockActionDialog(block),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: maxWidth * block.widthFactor,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: block.isSelected ? blueTheme : Colors.transparent, 
                    width: 1.5
                  ),
                  boxShadow: block.isSelected ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ] : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: block.isImage 
                    ? Image.file(File(block.imagePath!), fit: BoxFit.contain)
                    : Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            block.sticker!, 
                            style: TextStyle(fontSize: maxWidth * block.widthFactor * 0.6)
                          ),
                        ),
                      ),
                ),
              ),
              // 선택되었을 때만 삭제 버튼과 핸들 표시
              if (block.isSelected) ...[
                // 삭제 버튼
                Positioned(
                  top: -12,
                  right: -12,
                  child: GestureDetector(
                    onTap: () => setState(() => _memoBlocks.remove(block)),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: const Icon(Icons.close, size: 16, color: Colors.white),
                    ),
                  ),
                ),
                
                // 크기 조절 핸들들
                _buildHandle(
                  top: -8, left: -8,
                  blueTheme: blueTheme,
                  onPanUpdate: (details) {
                    setState(() {
                      double delta = details.delta.dx + details.delta.dy;
                      double newWidth = maxWidth * block.widthFactor - delta;
                      block.widthFactor = (newWidth / maxWidth).clamp(0.15, 1.0);
                    });
                  }
                ),
                _buildHandle(
                  top: -8, right: -8,
                  blueTheme: blueTheme,
                  onPanUpdate: (details) {
                    setState(() {
                      double delta = details.delta.dx - details.delta.dy;
                      double newWidth = maxWidth * block.widthFactor + delta;
                      block.widthFactor = (newWidth / maxWidth).clamp(0.15, 1.0);
                    });
                  }
                ),
                _buildHandle(
                  bottom: -8, left: -8,
                  blueTheme: blueTheme,
                  onPanUpdate: (details) {
                    setState(() {
                      double delta = -details.delta.dx + details.delta.dy;
                      double newWidth = maxWidth * block.widthFactor + delta;
                      block.widthFactor = (newWidth / maxWidth).clamp(0.15, 1.0);
                    });
                  }
                ),
                _buildHandle(
                  bottom: -8, right: -8,
                  blueTheme: blueTheme,
                  onPanUpdate: (details) {
                    setState(() {
                      double delta = details.delta.dx + details.delta.dy;
                      double newWidth = maxWidth * block.widthFactor + delta;
                      block.widthFactor = (newWidth / maxWidth).clamp(0.15, 1.0);
                    });
                  }
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle({double? top, double? bottom, double? left, double? right, required Color blueTheme, required Function(DragUpdateDetails) onPanUpdate}) {
    return Positioned(
      top: top, bottom: bottom, left: left, right: right,
      child: GestureDetector(
        onPanUpdate: (details) => onPanUpdate(details),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: blueTheme,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: const Icon(Icons.aspect_ratio, size: 10, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTypeTab(String label, bool isSelected, Color activeColor, bool isDark, VoidCallback onTap, {bool isSmall = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: isSmall ? 6 : 12),
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(isSmall ? 8 : 10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: activeColor.withOpacity(0.3),
                      blurRadius: isSmall ? 4 : 8,
                      offset: Offset(0, isSmall ? 1 : 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected 
                  ? (activeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white)
                  : (isDark ? Colors.grey[400] : Colors.grey[600]),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: isSmall ? 13 : 15,
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    String title = _titleController.text.trim();
    if (title.isEmpty) {
      title = AppLocalizations.of(context)!.noTitle;
    }

    final date = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
      widget.selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    // 블록들을 하나의 문자열과 이미지 리스트로 병합
    String mergedContent = '';
    List<String> mergedImages = [];
    Map<String, String> drawingDataMap = {};
    
    for (var block in _memoBlocks) {
      if (block.isImage) {
        final imgIndex = mergedImages.length;
        mergedContent += '[[IMG_$imgIndex|${block.widthFactor}]]';
        mergedImages.add(block.imagePath!);
        if (block.drawingData != null) {
          drawingDataMap[imgIndex.toString()] = block.drawingData!;
        }
      } else if (block.isSticker) {
        mergedContent += '[[STK_${block.sticker}|${block.widthFactor}]]';
      } else {
        mergedContent += block.controller!.text;
      }
    }

    final event = CalendarEvent(
      id: widget.event?.id ?? const Uuid().v4(),
      title: title,
      content: mergedContent,
      date: date,
      type: _type,
      alarmId: _isAlarmEnabled ? (widget.event?.alarmId ?? const Uuid().v4()) : null,
      titleColor: _selectedTitleColor.toARGB32(),
      sticker: _selectedSticker,
      images: _type == CalendarEventType.memo ? mergedImages : null,
      drawingData: _type == CalendarEventType.memo ? jsonEncode(drawingDataMap) : null,
      isFavorite: _isFavorite,
      fontSize: _fontSize,
      fontFamily: _fontFamily,
      fontColor: _contentTextColor.toARGB32(),
      textAlign: _textAlign.index,
    );

    widget.onSave(event, _isTimeManuallySet);
    setState(() {
      _isSaving = true;
      _canPopNow = true;
    });
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
      const Color(0xFFDCE775), // Soft Lime
      const Color(0xFFFFF176), // Soft Yellow
      const Color(0xFFFFD54F), // Soft Amber
      const Color(0xFFFFB74D), // Soft Orange
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
          title: Text(AppLocalizations.of(context)!.selectTitleColor, style: const TextStyle(fontWeight: FontWeight.bold)),
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
              child: Text(AppLocalizations.of(context)!.cancel),
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

class DrawingStroke {
  final List<Offset> points;
  final Color color;
  final double width;

  DrawingStroke({
    required this.points,
    required this.color,
    required this.width,
  });
}

class DrawingPreviewPainter extends CustomPainter {
  final List<DrawingStroke> strokes;
  final bool scaleToFit;

  DrawingPreviewPainter({required this.strokes, this.scaleToFit = false});

  @override
  void paint(Canvas canvas, Size size) {
    if (strokes.isEmpty) return;

    canvas.save();
    
    if (scaleToFit) {
      // 모든 점을 포함하는 바운딩 박스 계산
      double minX = double.infinity;
      double minY = double.infinity;
      double maxX = double.negativeInfinity;
      double maxY = double.negativeInfinity;

      for (var stroke in strokes) {
        for (var point in stroke.points) {
          if (point.dx < minX) minX = point.dx;
          if (point.dy < minY) minY = point.dy;
          if (point.dx > maxX) maxX = point.dx;
          if (point.dy > maxY) maxY = point.dy;
        }
      }

      // 바운딩 박스가 유효한 경우 스케일링 적용
      if (minX != double.infinity) {
        final drawingWidth = maxX - minX;
        final drawingHeight = maxY - minY;
        
        if (drawingWidth > 0 && drawingHeight > 0) {
          final scaleX = size.width / drawingWidth;
          final scaleY = size.height / drawingHeight;
          final scale = scaleX < scaleY ? scaleX : scaleY;
          
          // 중앙 정렬을 위한 오프셋
          final offsetX = (size.width - drawingWidth * scale) / 2 - minX * scale;
          final offsetY = (size.height - drawingHeight * scale) / 2 - minY * scale;
          
          canvas.translate(offsetX, offsetY);
          canvas.scale(scale);
        }
      }
    }

    for (var stroke in strokes) {
      if (stroke.points.isEmpty) continue;

      final paint = Paint()
        ..color = stroke.color
        ..strokeWidth = stroke.width
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;

      if (stroke.points.length < 2) {
        canvas.drawCircle(stroke.points.first, stroke.width / 2, paint..style = PaintingStyle.fill);
        continue;
      }

      final path = Path();
      path.moveTo(stroke.points.first.dx, stroke.points.first.dy);

      for (int i = 0; i < stroke.points.length - 1; i++) {
        final p1 = stroke.points[i];
        final p2 = stroke.points[i + 1];
        final midPoint = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
        path.quadraticBezierTo(p1.dx, p1.dy, midPoint.dx, midPoint.dy);
      }

      path.lineTo(stroke.points.last.dx, stroke.points.last.dy);
      canvas.drawPath(path, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DrawingPreviewPainter oldDelegate) => true;
}
