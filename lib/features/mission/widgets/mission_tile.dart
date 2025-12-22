import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/mission_model.dart';
import '../water/providers/water_provider.dart';
import '../supplement/providers/supplement_provider.dart';

class MissionTile extends ConsumerWidget {
  final MissionModel mission;
  final bool isCompleted;
  final VoidCallback onToggle;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const MissionTile({
    super.key,
    required this.mission,
    required this.isCompleted,
    required this.onToggle,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 물 마시기/영양제/기상 알람 미션 여부 확인
    final isWaterMission = mission.title.contains('물') && mission.title.contains('2L');
    final isSupplementMission = mission.title.contains('영양제');
    final isWakeUpMission = mission.id == 'wakeup';
    final isSpecialMission = isWaterMission || isSupplementMission || isWakeUpMission;

    // 물 마시기 미션인 경우 진행률 표시
    Widget? subtitle;
    if (isWaterMission) {
       final waterState = ref.watch(waterProvider);
       final current = waterState.log.currentIntake;
       final goal = waterState.settings.dailyGoal;
       final cupSize = waterState.settings.cupSize;
       
       final currentCups = (current / cupSize).floor();
       final goalCups = (goal / cupSize).ceil();

       subtitle = Text(
         '($currentCups잔/$goalCups잔)',
         style: TextStyle(
           fontSize: 12,
           color: isCompleted 
               ? (isDark ? Colors.green[300]!.withOpacity(0.7) : Colors.green[700]!.withOpacity(0.7))
               : Colors.blueAccent,
           fontWeight: FontWeight.w500,
         ),
       );
    } else if (isSupplementMission) {
       final supplementState = ref.watch(supplementProvider);
       final current = supplementState.log.currentCount;
       final goal = supplementState.settings.dailyGoal;

       subtitle = Text(
         '($current회/$goal회)',
         style: TextStyle(
           fontSize: 12,
           color: isCompleted 
               ? (isDark ? Colors.green[300]!.withOpacity(0.7) : Colors.green[700]!.withOpacity(0.7))
               : Colors.orange[700],
           fontWeight: FontWeight.w500,
         ),
       );
    } else if (isWakeUpMission) {
      subtitle = Text(
        isCompleted ? '(1회/1회)' : '(0회/1회)',
        style: TextStyle(
          fontSize: 12,
          color: isCompleted 
              ? (isDark ? Colors.green[300]!.withOpacity(0.7) : Colors.green[700]!.withOpacity(0.7))
              : (isDark ? Colors.redAccent.withOpacity(0.8) : Colors.redAccent),
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget content = Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      decoration: BoxDecoration(
        color: isCompleted 
          ? (isDark ? Colors.grey[900]!.withOpacity(0.5) : Colors.grey[50])
          : (isDark ? const Color(0xFF1E1E1E) : Colors.white),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCompleted 
              ? (isDark ? Colors.white.withOpacity(0.05) : Colors.grey[200]!)
              : (isDark ? Colors.white.withOpacity(0.2) : const Color(0xFFE2E8F0)), // 연한 은색(실버/블루그레이) 테두리
          width: 1.2,
        ),
        boxShadow: isDark ? [] : [
          BoxShadow(
            color: Colors.black.withOpacity(isCompleted ? 0.01 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap ?? (isSpecialMission ? null : onToggle), // 특수 미션은 탭으로 상세 화면 이동
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2), // 더 컴팩트하게
        leading: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCompleted 
                ? (isDark ? Colors.green[900]!.withOpacity(0.2) : Colors.green[50])
                : (isDark ? Colors.blue[900]!.withOpacity(0.2) : Colors.blue[50]),
            shape: BoxShape.circle,
          ),
          child: Text(
            mission.icon,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                mission.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isCompleted ? FontWeight.w500 : FontWeight.w500,
                  color: isCompleted 
                      ? (isDark ? Colors.green[300] : Colors.green[800])
                      : (isDark ? Colors.white : Colors.black87),
                ),
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(width: 8),
              subtitle,
            ],
          ],
        ),
        trailing: InkWell(
          onTap: isSpecialMission ? null : onToggle, // 특수 미션은 체크박스 클릭 방지
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted 
                  ? const Color(0xFF4CAF50) // 성공 시 녹색
                  : (isSpecialMission ? (isDark ? Colors.grey[800] : Colors.grey[100]) : Colors.transparent),
              border: Border.all(
                color: isCompleted 
                    ? const Color(0xFF4CAF50) 
                    : (isSpecialMission 
                        ? (isDark ? Colors.grey[700]! : Colors.grey[200]!) 
                        : (isDark ? Colors.grey[600]! : Colors.grey[300]!)),
                width: 1.5,
              ),
            ),
            child: isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : (isSpecialMission 
                    ? Icon(Icons.lock_outline, size: 12, color: isDark ? Colors.grey[600] : Colors.grey[400]) 
                    : null),
          ),
        ),
      ),
    );

    // 시스템 미션이거나 삭제 기능이 없으면 스와이프 기능 제외
    if (mission.isSystemMission || onDelete == null) {
      return content;
    }

    // 스와이프하여 삭제 (Dismissible)
    return Dismissible(
      key: Key(mission.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              '미션 삭제',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              '\'${mission.title}\' 미션을 삭제하시겠습니까?',
              style: const TextStyle(fontSize: 15),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  '아니요',
                  style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  '네, 삭제할게요',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) => onDelete!(),
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.red[400],
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white, size: 20),
      ),
      child: content,
    );
  }
}
