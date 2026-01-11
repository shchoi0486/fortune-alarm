import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/mission_provider.dart';
import '../../widgets/ad_widgets.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';
import 'widgets/mission_tile.dart';
import 'widgets/add_mission_sheet.dart';
import 'water/water_mission_screen.dart';
import 'supplement/supplement_mission_screen.dart';
import 'water/providers/water_provider.dart';
import 'supplement/providers/supplement_provider.dart';

class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missionState = ref.watch(missionProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (missionState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final allMissions = missionState.missions;
    final completedIds = missionState.todayLog?.completedMissionIds ?? [];

    // 분류 (유효한 미션만 포함)
    final validMissionIds = allMissions.map((m) => m.id).toSet();
    final effectiveCompletedIds = completedIds.where((id) => validMissionIds.contains(id)).toSet();

    debugPrint('MissionScreen: completedCount=${effectiveCompletedIds.length}, isGoalAchieved=${missionState.isGoalAchieved}, cookies=${missionState.fortuneCookieCount}');

    final pendingMissions = allMissions.where((m) => !effectiveCompletedIds.contains(m.id)).toList();
    final completedMissions = allMissions.where((m) => effectiveCompletedIds.contains(m.id)).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
            // 1. 헤더 (달성률)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dailyMission,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: missionState.isGoalAchieved 
                              ? Colors.green.withOpacity(0.1) 
                              : Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            missionState.isGoalAchieved 
                                ? AppLocalizations.of(context)!.goalAchieved(missionState.completedCount)
                                : AppLocalizations.of(context)!.missionProgress(missionState.completedCount),
                            style: TextStyle(
                              color: missionState.isGoalAchieved ? Colors.green : Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 프로그레스 바 (폭을 나의 미션 기록 박스와 일치하도록 Padding 조정)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: (missionState.completedCount / 5).clamp(0.0, 1.0),
                          minHeight: 10,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            missionState.isGoalAchieved ? Colors.green : Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),



            // 1.3 보상 안내 배너 (도전 중 바로 위로 이동)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Text('🥠', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dailyFortuneCookieReward,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber[800],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            AppLocalizations.of(context)!.missionRewardInfo,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. 해야 할 미션 (Pending)
            if (pendingMissions.isNotEmpty) ...[
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 8),
                        sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.inProgress,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${pendingMissions.length}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // 초기화 버튼 (아이콘 위주로 심플하게)
                      IconButton(
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              title: Text(AppLocalizations.of(context)!.resetMissions, style: const TextStyle(fontWeight: FontWeight.bold)),
                              content: Text(AppLocalizations.of(context)!.resetMissionsConfirm),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(AppLocalizations.of(context)!.reset, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                          
                          if (confirm == true) {
                            // 1. 일반 미션 초기화
                            await ref.read(missionProvider).resetAllMissions();
                            
                            // 2. 특수 미션(물, 영양제) 초기화
                            await ref.read(waterProvider.notifier).resetIntake();
                            await ref.read(supplementProvider.notifier).resetCount();
                            
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(AppLocalizations.of(context)!.resetMissionsConfirm),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          }
                        },
                        icon: Icon(Icons.refresh, size: 20, color: isDark ? Colors.white54 : Colors.grey[600]),
                        tooltip: AppLocalizations.of(context)!.resetTooltip,
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(8),
                      ),
                      const SizedBox(width: 4),
                      // 미션 추가 버튼 (심플한 캡슐 버튼 스타일)
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            useRootNavigator: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                            ),
                            builder: (context) => AddMissionSheet(
                              onAdd: (title, icon, category, {bool? isCustom, String? id, String? alarmTime, bool? isAlarmEnabled}) {
                                ref.read(missionProvider).addMission(
                                  title, 
                                  icon, 
                                  category, 
                                  isCustom: isCustom ?? false, 
                                  id: id,
                                  alarmTime: alarmTime,
                                  isAlarmEnabled: isAlarmEnabled ?? false,
                                );
                              },
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.add, size: 16, color: Colors.blue),
                              const SizedBox(width: 4),
                              Text(
                                AppLocalizations.of(context)!.addMission,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final mission = pendingMissions[index];
                    VoidCallback? onTap;
                    if (mission.id == 'water_2l') {
                      onTap = () {
                        Navigator.of(context, rootNavigator: false).push(
                          MaterialPageRoute(
                            builder: (_) => const WaterMissionScreen(useSafeAreaTop: false),
                          ),
                        );
                      };
                    } else if (mission.id == 'supplement') {
                      onTap = () {
                        Navigator.of(context, rootNavigator: false).push(
                          MaterialPageRoute(
                            builder: (_) => const SupplementMissionScreen(useSafeAreaTop: false),
                          ),
                        );
                      };
                    }
                    return MissionTile(
                      mission: mission,
                      isCompleted: false,
                      onToggle: () => ref.read(missionProvider).toggleMission(mission.id),
                      onDelete: () => ref.read(missionProvider).deleteMission(mission.id),
                      onTap: onTap,
                    );
                  },
                  childCount: pendingMissions.length,
                ),
              ),
            ],

            // 3. 완료한 미션 (Completed)
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
              sliver: SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.completedMissions,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${completedMissions.length}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (completedMissions.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.white.withOpacity(0.12) : Colors.black.withOpacity(0.06),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.noCompletedMissionsHint,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: isDark ? Colors.white70 : Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final mission = completedMissions[index];
                    VoidCallback? onTap;
                    if (mission.id == 'water_2l') {
                      onTap = () {
                        Navigator.of(context, rootNavigator: false).push(
                          MaterialPageRoute(
                            builder: (_) => const WaterMissionScreen(useSafeAreaTop: false),
                          ),
                        );
                      };
                    } else if (mission.id == 'supplement') {
                      onTap = () {
                        Navigator.of(context, rootNavigator: false).push(
                          MaterialPageRoute(
                            builder: (_) => const SupplementMissionScreen(useSafeAreaTop: false),
                          ),
                        );
                      };
                    }
                    return MissionTile(
                      mission: mission,
                      isCompleted: true,
                      onToggle: () => ref.read(missionProvider).toggleMission(mission.id),
                      onDelete: () => ref.read(missionProvider).deleteMission(mission.id),
                      onTap: onTap,
                    );
                  },
                  childCount: completedMissions.length,
                ),
              ),
            
            // 4. 구분선 및 하단 섹션 분리
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Divider(
              thickness: 1,
              color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.white.withOpacity(0.1) 
                : Colors.black.withOpacity(0.05),
            ),
          ),
        ),

        // 5. 광고 (통계 패널 위로 이동)
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: DetailedAdWidget(),
          ),
        ),

            // 6. 통계 패널 (나의 미션 기록)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.white.withOpacity(0.2) 
                        : const Color(0xFFE2E8F0),
                      width: 1.2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 타이틀 영역
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Icon(Icons.bar_chart_rounded, color: Theme.of(context).colorScheme.primary, size: 22),
                            const SizedBox(width: 12),
                            Text(
                              AppLocalizations.of(context)!.myMissionRecord,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 내부 구분선
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).brightness == Brightness.dark 
                          ? Colors.white.withOpacity(0.1) 
                          : const Color(0xFFE2E8F0),
                      ),
                      // 데이터 영역
                      FutureBuilder<Map<String, dynamic>>(
                        future: ref.read(missionProvider).getMissionStatistics(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                            );
                          }
                          final stats = snapshot.data!;
                          return Padding(
                             padding: const EdgeInsets.symmetric(vertical: 20),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: _StatItem(
                                     label: AppLocalizations.of(context)!.consecutiveSuccess,
                                     value: AppLocalizations.of(context)!.daysCount(stats['streak']),
                                     icon: Icons.local_fire_department,
                                     color: Colors.orange,
                                   ),
                                 ),
                                 Container(width: 1, height: 30, color: Theme.of(context).dividerColor.withOpacity(0.1)),
                                 Expanded(
                                   child: _StatItem(
                                     label: AppLocalizations.of(context)!.successRate30Days,
                                     value: '${stats['successRate'].toStringAsFixed(1)}%',
                                     icon: Icons.pie_chart,
                                     color: Colors.blue,
                                   ),
                                 ),
                                 Container(width: 1, height: 30, color: Theme.of(context).dividerColor.withOpacity(0.1)),
                                 Expanded(
                                   child: _StatItem(
                                     label: AppLocalizations.of(context)!.totalSuccess,
                                     value: AppLocalizations.of(context)!.daysCount(stats['totalSuccess']),
                                     icon: Icons.check_circle_outline,
                                     color: Colors.green,
                                   ),
                                 ),
                               ],
                             ),
                           );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 하단 여백
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
      ],
    );
  }
}
