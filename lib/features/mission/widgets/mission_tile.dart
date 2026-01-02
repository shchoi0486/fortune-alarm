import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
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
    final isWaterMission = mission.id == 'water_2l';
    final isSupplementMission = mission.id == 'supplement';
    final isWakeUpMission = mission.id == 'wakeup';
    final isSpecialMission = isWaterMission || isSupplementMission || isWakeUpMission;

    String displayTitle = mission.title;
    if (isWaterMission) {
      displayTitle = AppLocalizations.of(context)!.missionWater;
    } else if (isSupplementMission) {
      displayTitle = AppLocalizations.of(context)!.missionSupplement;
    } else if (isWakeUpMission) {
      displayTitle = AppLocalizations.of(context)!.missionWakeUp;
    } else if (mission.isSystemMission) {
      // Other system missions from defaultMissions list
      switch (mission.id) {
        case 'gym': displayTitle = AppLocalizations.of(context)!.missionGym; break;
        case 'workout': displayTitle = AppLocalizations.of(context)!.missionWorkout; break;
        case 'diary': displayTitle = AppLocalizations.of(context)!.missionDiary; break;
        case 'bed_making': displayTitle = AppLocalizations.of(context)!.missionBedMaking; break;
        case 'stretching': displayTitle = AppLocalizations.of(context)!.missionStretching; break;
        case 'reading': displayTitle = AppLocalizations.of(context)!.missionReading; break;
        case 'planning': displayTitle = AppLocalizations.of(context)!.missionPlanning; break;
        case 'breakfast': displayTitle = AppLocalizations.of(context)!.missionBreakfast; break;
        case 'meditation': displayTitle = AppLocalizations.of(context)!.missionMeditation; break;
        case 'english_words': displayTitle = AppLocalizations.of(context)!.missionEnglishWords; break;
        case 'ventilation': displayTitle = AppLocalizations.of(context)!.missionVentilation; break;
        case 'cleaning': displayTitle = AppLocalizations.of(context)!.missionCleaning; break;
        case 'gratitude_diary': displayTitle = AppLocalizations.of(context)!.missionGratitudeDiary; break;
      }
    }

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
         AppLocalizations.of(context)!.cupsCount(currentCups, goalCups),
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
         AppLocalizations.of(context)!.timesCount(current),
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
        isCompleted ? AppLocalizations.of(context)!.timesCount(1) : AppLocalizations.of(context)!.timesCount(0),
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
              : (isDark ? Colors.white.withOpacity(0.2) : const Color(0xFFE2E8F0)),
          width: isDark ? 1.2 : 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.05),
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
                displayTitle,
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

    // 기상 알람 미션이거나 삭제 기능이 없으면 스와이프 기능 제외
    // (영양제, 물 마시기 등 다른 시스템 미션은 삭제 가능해야 함)
    if (isWakeUpMission || onDelete == null) {
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
