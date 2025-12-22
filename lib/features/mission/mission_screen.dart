import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/mission_provider.dart';
import '../../widgets/ad_banner_widget.dart';
import 'widgets/mission_tile.dart';
import 'widgets/add_mission_sheet.dart';
import 'water/water_mission_screen.dart';
import 'supplement/supplement_mission_screen.dart';

class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missionState = ref.watch(missionProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 보상 다이얼로그 리스너
    ref.listen(missionProvider.select((s) => s.showRewardDialog), (previous, next) {
      if (next == true) {
        _showRewardSuccessDialog(context, ref);
      }
    });
    
    if (missionState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final allMissions = missionState.missions;
    final completedIds = missionState.todayLog?.completedMissionIds ?? [];

    // 분류
    final pendingMissions = allMissions.where((m) => !completedIds.contains(m.id)).toList();
    final completedMissions = allMissions.where((m) => completedIds.contains(m.id)).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
          // 0. 보상 안내 배너
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
                            '오늘의 포춘쿠키 보상',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber[800],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '미션 5개 성공 시 1개, 10개 성공 시 2개 지급!',
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

            // 1. 헤더 (달성률)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '오늘의 미션',
                          style: TextStyle(
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
                                ? '🎉 ${missionState.completedCount}/5 목표 달성!' 
                                : '${missionState.completedCount}/5 달성',
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

            // 1.5 통계 패널
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.white.withOpacity(0.2) 
                        : const Color(0xFFE2E8F0),
                      width: 1.2,
                    ),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      minTileHeight: 43,
                      title: const Text(
                        '나의 미션 기록',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      leading: Icon(Icons.bar_chart_rounded, color: Theme.of(context).colorScheme.primary, size: 22),
                      children: [
                        FutureBuilder<Map<String, dynamic>>(
                          future: ref.read(missionProvider).getMissionStatistics(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                              );
                            }
                            final stats = snapshot.data!;
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _StatItem(
                                    label: '연속 성공',
                                    value: '${stats['streak']}일',
                                    icon: Icons.local_fire_department,
                                    color: Colors.orange,
                                  ),
                                  _StatItem(
                                    label: '성공률(30일)',
                                    value: '${stats['successRate'].toStringAsFixed(1)}%',
                                    icon: Icons.pie_chart,
                                    color: Colors.blue,
                                  ),
                                  _StatItem(
                                    label: '총 성공',
                                    value: '${stats['totalSuccess']}일',
                                    icon: Icons.emoji_events,
                                    color: Colors.amber,
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
            ),

            // 2. 해야 할 미션 (Pending)
            if (pendingMissions.isNotEmpty) ...[
              SliverPadding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 8),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '도전 중 🔥',
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
                              title: const Text('미션 초기화', style: TextStyle(fontWeight: FontWeight.bold)),
                              content: const Text('모든 도전 목록을 초기화하시겠습니까?\n(기본 시스템 미션 제외)'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: Text('취소', style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('초기화', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                          
                          if (confirm == true) {
                            ref.read(missionProvider).resetAllMissions();
                          }
                        },
                        icon: Icon(Icons.refresh, size: 20, color: isDark ? Colors.white54 : Colors.grey[600]),
                        tooltip: '초기화',
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
                            useRootNavigator: false,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (context) => AddMissionSheet(
                              onAdd: (title, icon, category, {bool? isCustom}) {
                                ref.read(missionProvider).addMission(title, icon, category, isCustom: isCustom ?? false);
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
                              const Text(
                                '미션 추가',
                                style: TextStyle(
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
                    return MissionTile(
                      mission: mission,
                      isCompleted: false,
                      onToggle: () => ref.read(missionProvider).toggleMission(mission.id),
                      onDelete: () => ref.read(missionProvider).deleteMission(mission.id),
                      onTap: () {
                        if (mission.title.contains('물')) {
                          Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (_) => const WaterMissionScreen(useSafeAreaTop: false)));
                        } else if (mission.title.contains('영양제')) {
                          Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (_) => const SupplementMissionScreen(useSafeAreaTop: false)));
                        }
                      },
                    );
                  },
                  childCount: pendingMissions.length,
                ),
              ),
            ],

            // 3. 완료한 미션 (Completed)
            if (completedMissions.isNotEmpty) ...[
              SliverPadding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 4),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '완료된 미션',
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final mission = completedMissions[index];
                    return MissionTile(
                      mission: mission,
                      isCompleted: true,
                      onToggle: () => ref.read(missionProvider).toggleMission(mission.id),
                      onDelete: () => ref.read(missionProvider).deleteMission(mission.id),
                      onTap: () {
                        if (mission.title.contains('물')) {
                          Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (_) => const WaterMissionScreen(useSafeAreaTop: false)));
                        } else if (mission.title.contains('영양제')) {
                          Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (_) => const SupplementMissionScreen(useSafeAreaTop: false)));
                        }
                      },
                    );
                  },
                  childCount: completedMissions.length,
                ),
              ),
            ],
            
            // 하단 여백
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
            ),
          ),
          const SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              child: Center(child: AdBannerWidget()),
            ),
          ),
        ],
      ),
    );
  }

  void _showRewardSuccessDialog(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🥠', style: TextStyle(fontSize: 60)),
            const SizedBox(height: 16),
            const Text(
              '축하합니다!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '오늘의 미션 5개를 완료하여\n포춘쿠키 1개를 획득했습니다!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(missionProvider).consumeRewardDialogEvent();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('확인', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
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
