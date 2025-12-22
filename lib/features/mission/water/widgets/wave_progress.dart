import 'dart:math' as math;
import 'package:flutter/material.dart';

class WaveProgress extends StatefulWidget {
  final double percentage; // 0.0 to 1.0
  final Color color;
  final double size;

  const WaveProgress({
    super.key,
    required this.percentage,
    required this.color,
    required this.size,
  });

  @override
  State<WaveProgress> createState() => _WaveProgressState();
}

class _WaveProgressState extends State<WaveProgress> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          // Background Shape (Dry State)
          ClipPath(
            clipper: HumanShapeClipper(),
            child: Container(
              color: Colors.grey[200], // Dry / Empty color
            ),
          ),
          // Wave (Filling State)
          ClipPath(
            clipper: HumanShapeClipper(),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _WavePainter(
                    animationValue: _controller.value,
                    percentage: widget.percentage,
                    color: widget.color,
                  ),
                );
              },
            ),
          ),
          // Glass effect highlight (optional)
          IgnorePointer(
            child: ClipPath(
              clipper: HumanShapeClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HumanShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    
    // Head
    path.addOval(Rect.fromCircle(center: Offset(w / 2, h * 0.15), radius: w * 0.12));
    
    // Body
    path.addRRect(RRect.fromRectAndCorners(
      Rect.fromLTWH(w * 0.25, h * 0.32, w * 0.5, h * 0.68),
      topLeft: Radius.circular(w * 0.2),
      topRight: Radius.circular(w * 0.2),
      bottomLeft: Radius.circular(w * 0.1),
      bottomRight: Radius.circular(w * 0.1),
    ));
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _WavePainter extends CustomPainter {
  final double animationValue;
  final double percentage;
  final Color color;

  _WavePainter({
    required this.animationValue,
    required this.percentage,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    
    // Clamp percentage
    final safePercentage = percentage.clamp(0.0, 1.0);
    
    // Water height based on percentage
    final waterHeight = height * (1 - safePercentage);
    
    // Wave parameters
    const amplitude = 12.0;
    final phase = animationValue * 2 * math.pi;

    // Draw Back Wave (lighter)
    final path2 = Path();
    path2.moveTo(0, height);
    path2.lineTo(0, waterHeight);
    
    for (double x = 0; x <= width; x++) {
      final y = waterHeight + amplitude * math.sin((x / width * 2 * math.pi) + phase + 1.5);
      path2.lineTo(x, y);
    }
    
    path2.lineTo(width, height);
    path2.lineTo(0, height);
    path2.close();
    
    canvas.drawPath(path2, Paint()..color = color.withOpacity(0.4)..style = PaintingStyle.fill);

    // Draw Front Wave (darker)
    final path = Path();
    path.moveTo(0, height);
    path.lineTo(0, waterHeight);

    for (double x = 0; x <= width; x++) {
      final y = waterHeight + amplitude * math.sin((x / width * 2 * math.pi) + phase);
      path.lineTo(x, y);
    }

    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, Paint()..color = color..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
           oldDelegate.percentage != percentage;
  }
}
