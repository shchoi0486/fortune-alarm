import 'dart:math' as math;
import 'package:flutter/material.dart';

class PillBottleProgress extends StatelessWidget {
  final int currentCount;
  final int dailyGoal;
  final double size;

  const PillBottleProgress({
    super.key,
    required this.currentCount,
    required this.dailyGoal,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bottle Shape Background
          CustomPaint(
            size: Size(size * 0.6, size * 0.9),
            painter: BottlePainter(color: Colors.grey[200]!),
          ),
          
          // Pills inside the bottle
          SizedBox(
            width: size * 0.5,
            height: size * 0.7,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.end,
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                dailyGoal,
                (index) => AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: index < currentCount ? 1.0 : 0.1,
                  child: Transform.rotate(
                    angle: (index * 45) * math.pi / 180,
                    child: Container(
                      width: size * 0.12,
                      height: size * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            _getPillColor(index),
                            _getPillColor(index).withOpacity(0.7),
                          ],
                        ),
                        boxShadow: index < currentCount ? [
                          BoxShadow(
                            color: _getPillColor(index).withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ] : [],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Bottle Outline/Glass Effect
          CustomPaint(
            size: Size(size * 0.6, size * 0.9),
            painter: BottlePainter(
              color: Colors.white.withOpacity(0.2),
              isOutline: true,
            ),
          ),
        ],
      ),
    );
  }

  Color _getPillColor(int index) {
    final colors = [
      Colors.orange,
      Colors.yellow[700]!,
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent,
    ];
    return colors[index % colors.length];
  }
}

class BottlePainter extends CustomPainter {
  final Color color;
  final bool isOutline;

  BottlePainter({required this.color, this.isOutline = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = isOutline ? PaintingStyle.stroke : PaintingStyle.fill
      ..strokeWidth = 2;

    final path = Path();
    final w = size.width;
    final h = size.height;

    // Bottle Neck
    path.moveTo(w * 0.35, 0);
    path.lineTo(w * 0.65, 0);
    path.lineTo(w * 0.65, h * 0.15);
    
    // Shoulder
    path.quadraticBezierTo(w * 0.9, h * 0.15, w * 0.95, h * 0.3);
    
    // Body
    path.lineTo(w * 0.95, h * 0.9);
    
    // Bottom
    path.quadraticBezierTo(w * 0.95, h, w * 0.8, h);
    path.lineTo(w * 0.2, h);
    path.quadraticBezierTo(w * 0.05, h, w * 0.05, h * 0.9);
    
    // Left side
    path.lineTo(w * 0.05, h * 0.3);
    path.quadraticBezierTo(w * 0.1, h * 0.15, w * 0.35, h * 0.15);
    path.close();

    canvas.drawPath(path, paint);
    
    if (isOutline) {
      // Shine effect
      final shinePaint = Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      
      canvas.drawArc(
        Rect.fromLTWH(w * 0.15, h * 0.35, w * 0.1, h * 0.4),
        math.pi * 0.8,
        math.pi * 0.4,
        false,
        shinePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
