import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DrawingScreen extends StatefulWidget {
  final String? initialDrawingData;

  const DrawingScreen({super.key, this.initialDrawingData});

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  final List<Stroke> _strokes = [];
  final List<Stroke> _redoStack = [];
  List<Offset> _currentPoints = [];
  Color _selectedColor = Colors.black;
  double _strokeWidth = 3.0;

  final List<Color> _colors = [
    Colors.black,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void didUpdateWidget(covariant DrawingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDrawingData != oldWidget.initialDrawingData) {
      _loadInitialData();
    }
  }

  void _loadInitialData() {
    if (widget.initialDrawingData != null && widget.initialDrawingData!.isNotEmpty) {
      try {
        final decoded = jsonDecode(widget.initialDrawingData!);
        if (decoded is Map && decoded.containsKey('strokes')) {
          final List<dynamic> strokesJson = decoded['strokes'];
          setState(() {
            _strokes.clear();
            for (var s in strokesJson) {
              _strokes.add(Stroke.fromJson(s));
            }
          });
        } else if (decoded is List) {
          // Old format: List of points
          final List<Offset> points = decoded.map((p) => Offset(
            (p['x'] as num).toDouble(),
            (p['y'] as num).toDouble(),
          )).toList();
          if (points.isNotEmpty) {
            setState(() {
              _strokes.clear();
              _strokes.add(Stroke(points: points, color: Colors.black, width: 3.0));
            });
          }
        }
      } catch (e) {
        debugPrint('Error loading drawing data: $e');
      }
    }
  }

  void _undo() {
    if (_strokes.isNotEmpty) {
      setState(() {
        _redoStack.add(_strokes.removeLast());
      });
    }
  }

  void _redo() {
    if (_redoStack.isNotEmpty) {
      setState(() {
        _strokes.add(_redoStack.removeLast());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('필기', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo, color: Colors.black54),
            onPressed: _undo,
          ),
          IconButton(
            icon: const Icon(Icons.redo, color: Colors.black54),
            onPressed: _redo,
          ),
          TextButton(
            onPressed: () {
              if (_strokes.isEmpty) {
                Navigator.pop(context, null);
              } else {
                final data = jsonEncode({
                  'version': 2,
                  'strokes': _strokes.map((s) => s.toJson()).toList(),
                });
                Navigator.pop(context, data);
              }
            },
            child: const Text('완료', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        _currentPoints = [details.localPosition];
                        _redoStack.clear();
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        _currentPoints.add(details.localPosition);
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        if (_currentPoints.isNotEmpty) {
                          _strokes.add(Stroke(
                            points: List.from(_currentPoints),
                            color: _selectedColor,
                            width: _strokeWidth,
                          ));
                          _currentPoints = [];
                        }
                      });
                    },
                    child: CustomPaint(
                      painter: DrawingPainter(
                        strokes: _strokes,
                        currentPoints: _currentPoints,
                        currentColor: _selectedColor,
                        currentWidth: _strokeWidth,
                      ),
                      size: Size.infinite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _buildToolbox(),
        ],
      ),
    );
  }

  Widget _buildToolbox() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ..._colors.map((color) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColor == color ? Colors.blue : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                )),
                // Color Picker Icon Placeholder
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.red],
                    ),
                  ),
                  child: const Icon(Icons.colorize, size: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildToolItem(Icons.edit, '연필', (_strokeWidth >= 1.0 && _strokeWidth <= 5.0) && _selectedColor != Colors.white),
              _buildToolItem(Icons.brush, '사인펜', (_strokeWidth > 5.0 && _strokeWidth <= 15.0) && _selectedColor != Colors.white),
              _buildToolItem(Icons.cleaning_services, '지우개', _selectedColor == Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  void _showWidthPicker(String label) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
              return SafeArea(
                child: StatefulBuilder(
                  builder: (context, setModalState) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('$label 두께 조절', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 20),
                          Slider(
                            value: _strokeWidth,
                            min: 1.0,
                            max: 30.0,
                            divisions: 29,
                            label: _strokeWidth.round().toString(),
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setModalState(() => _strokeWidth = value);
                              setState(() => _strokeWidth = value);
                            },
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 100,
                            height: _strokeWidth,
                            decoration: BoxDecoration(
                              color: _selectedColor == Colors.white ? Colors.black : _selectedColor,
                              borderRadius: BorderRadius.circular(_strokeWidth / 2),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
    );
  }

  Widget _buildToolItem(IconData icon, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (label == '연필') {
            _strokeWidth = 3.0;
            if (_selectedColor == Colors.white) _selectedColor = Colors.black;
          } else if (label == '사인펜') {
            _strokeWidth = 8.0;
            if (_selectedColor == Colors.white) _selectedColor = Colors.black;
          } else if (label == '지우개') {
            _selectedColor = Colors.white;
            _strokeWidth = 20.0;
          }
        });
      },
      onLongPress: label == '지우개' ? null : () => _showWidthPicker(label),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: isSelected ? Colors.blue : Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: isSelected ? Colors.blue : Colors.black54)),
        ],
      ),
    );
  }
}

class Stroke {
  final List<Offset> points;
  final Color color;
  final double width;

  Stroke({
    required this.points,
    required this.color,
    required this.width,
  });

  Map<String, dynamic> toJson() => {
    'points': points.map((p) => {'x': p.dx, 'y': p.dy}).toList(),
    'color': color.value,
    'width': width,
  };

  factory Stroke.fromJson(Map<String, dynamic> json) {
    return Stroke(
      points: (json['points'] as List).map((p) => Offset(
        (p['x'] as num).toDouble(),
        (p['y'] as num).toDouble(),
      )).toList(),
      color: Color((json['color'] as num).toInt()),
      width: (json['width'] as num).toDouble(),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Stroke> strokes;
  final List<Offset> currentPoints;
  final Color currentColor;
  final double currentWidth;

  DrawingPainter({
    required this.strokes,
    required this.currentPoints,
    required this.currentColor,
    required this.currentWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var stroke in strokes) {
      _drawStroke(canvas, stroke.points, stroke.color, stroke.width);
    }
    _drawStroke(canvas, currentPoints, currentColor, currentWidth);
  }

  void _drawStroke(Canvas canvas, List<Offset> points, Color color, double width) {
    if (points.isEmpty) return;
    
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    if (points.length < 2) {
      canvas.drawCircle(points.first, width / 2, paint..style = PaintingStyle.fill);
      return;
    }

    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);
    
    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      
      // Use quadratic bezier for smoother lines
      final midPoint = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
      path.quadraticBezierTo(p1.dx, p1.dy, midPoint.dx, midPoint.dy);
    }
    
    path.lineTo(points.last.dx, points.last.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant DrawingPainter oldDelegate) => true;
}

