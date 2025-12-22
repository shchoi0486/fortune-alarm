import 'package:flutter/material.dart';

class PillBoxWidget extends StatelessWidget {
  final int currentCount;
  final int dailyGoal;
  final VoidCallback? onTake;
  final VoidCallback? onRemove;

  const PillBoxWidget({
    super.key,
    required this.currentCount,
    required this.dailyGoal,
    this.onTake,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // 1줄에 최대 4개씩 배치
    int crossAxisCount = dailyGoal > 4 ? 4 : dailyGoal;
    if (crossAxisCount == 0) crossAxisCount = 1;

    // 전체 행 수 계산
    int rowCount = (dailyGoal / crossAxisCount).ceil();
    
    // 높이 계산 (대략적인 높이 + 패딩)
    double height = rowCount * 80.0 + (rowCount - 1) * 12 + 24;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F7FA), // 약통 본체 색상 (하늘색 플라스틱 느낌)
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
          // 내부 입체감을 위한 하이라이트
          const BoxShadow(
            color: Colors.white,
            blurRadius: 2,
            offset: Offset(-2, -2),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFE0F7FA),
            Colors.cyan.shade100,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 약통 라벨 제거됨
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: List.generate(dailyGoal, (index) {
              final isTaken = index < currentCount;
              return GestureDetector(
                onTap: () {
                  if (isTaken) {
                    // 어떤 이미 먹은 알약을 눌러도 하나 취소 (가장 최근 것)
                    onRemove?.call();
                  } else {
                    // 어떤 아직 안 먹은 알약을 눌러도 하나 섭취
                    onTake?.call();
                  }
                },
                child: _PillCompartment(
                  index: index,
                  isTaken: isTaken,
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _PillCompartment extends StatelessWidget {
  final int index;
  final bool isTaken;

  const _PillCompartment({
    required this.index,
    required this.isTaken,
  });

  @override
  Widget build(BuildContext context) {
    // 3D Isometric look simulation
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFCFD8DC),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          // Deep shadow for 3D depth
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4, 4),
            blurRadius: 6,
          ),
          // White highlight for plastic edge
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: const Offset(-1, -1),
            blurRadius: 2,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[300]!,
            Colors.grey[400]!,
            Colors.grey[500]!,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Inner Hole (Darker)
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: const Color(0xFFB0BEC5),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2) // Inner shadow
                ),
              ],
              gradient: RadialGradient(
                colors: [Colors.grey[400]!, Colors.grey[600]!],
                radius: 0.8,
              ),
            ),
          ),

          // 1. Inside Compartment (Pill or Empty)
          if (!isTaken)
            _buildPills(index)
          else
             Icon(
               Icons.check_circle, // Filled circle check
               size: 40,
               color: Colors.green.withOpacity(0.9),
             ),

          // 2. Lid (Animated)
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutBack,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(isTaken ? -2.2 : 0), // Rotate more to open fully
            transformAlignment: Alignment.topCenter,
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85), // More opaque
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.95),
                  Colors.white.withOpacity(0.7),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Center(
              child: isTaken
                  ? null
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPills(int index) {
    // 4 mixed pills
    return Stack(
      alignment: Alignment.center,
      children: [
        // Pill 1 (Top Left)
        Positioned(
          top: 18,
          left: 14,
          child: Transform.rotate(angle: 0.6, child: _buildCapsule(index, 0)),
        ),
        // Pill 2 (Top Right)
        Positioned(
          top: 20,
          right: 14,
          child: Transform.rotate(angle: -0.4, child: _buildCapsule(index, 1)),
        ),
        // Pill 3 (Bottom Left)
        Positioned(
          bottom: 20,
          left: 16,
          child: Transform.rotate(angle: -0.2, child: _buildCapsule(index, 2)),
        ),
        // Pill 4 (Bottom Right)
        Positioned(
          bottom: 18,
          right: 14,
          child: Transform.rotate(angle: 0.7, child: _buildCapsule(index, 3)),
        ),
      ],
    );
  }

  Widget _buildCapsule(int baseIndex, int offset) {
    // Two-tone capsule colors
    final colors = _getTwoToneColors(baseIndex + offset);
    
    return Container(
      width: 26,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
           BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.item1,
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(6)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.item2,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns a pair of colors for the capsule
  ({Color item1, Color item2}) _getTwoToneColors(int index) {
    const pairs = [
      (item1: Colors.redAccent, item2: Colors.yellowAccent), // Apple pill style
      (item1: Colors.blueAccent, item2: Colors.white),
      (item1: Colors.green, item2: Colors.lightGreenAccent),
      (item1: Colors.orange, item2: Colors.white),
      (item1: Colors.purpleAccent, item2: Colors.cyanAccent),
      (item1: Colors.pinkAccent, item2: Colors.amberAccent),
    ];
    return pairs[index % pairs.length];
  }

  Color _getPillColor(int index) {
     return Colors.transparent; // Not used directly anymore
  }
}
