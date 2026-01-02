import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'providers/water_provider.dart';
import 'widgets/wave_progress.dart';
import 'water_alarm_screen.dart';
import 'water_record_screen.dart';
import '../widgets/mission_success_overlay.dart';

class WaterMissionScreen extends ConsumerStatefulWidget {
  final bool useSafeAreaTop;
  const WaterMissionScreen({super.key, this.useSafeAreaTop = true});

  @override
  ConsumerState<WaterMissionScreen> createState() => _WaterMissionScreenState();
}

class _WaterMissionScreenState extends ConsumerState<WaterMissionScreen> {
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    final waterState = ref.watch(waterProvider);
    final waterNotifier = ref.read(waterProvider.notifier);

    // 목표 달성 시 자동 팝업 및 이동
    ref.listen(waterProvider, (previous, next) {
      // previous가 false였고, next가 true일 때만 실행 (최초 달성 시점)
      if (previous != null && !previous.isGoalAchieved && next.isGoalAchieved) {
        if (!_isSuccess) {
          debugPrint('Water mission goal achieved! Showing success overlay.');
          setState(() {
            _isSuccess = true;
          });
        }
      }
    });

    if (waterState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentIntake = waterState.log.currentIntake;
    final dailyGoal = waterState.settings.dailyGoal;
    final percentage = dailyGoal == 0 ? 0.0 : currentIntake / dailyGoal;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                if (widget.useSafeAreaTop) SizedBox(height: MediaQuery.of(context).padding.top),
                // Custom Header for minimal spacing
                SizedBox(
                  height: 34,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            behavior: HitTestBehavior.opaque,
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        '물',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                // Text Info
                                Text(
                                  '${NumberFormat('#,###').format(currentIntake)} ml',
                                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${(percentage * 100).clamp(0, 100).toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF4FC3F7), // Light Blue
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                
                                // Progress Bar Line
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: percentage.clamp(0.0, 1.0),
                                      minHeight: 6,
                                      backgroundColor: Colors.grey[200],
                                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4FC3F7)),
                                    ),
                                  ),
                                ),
                                
                                const SizedBox(height: 10),
                                
                                // Wave Progress
                                WaveProgress(
                                  percentage: percentage,
                                  color: const Color(0xFF4FC3F7), // Light Blue
                                  size: 180,
                                ),
                                
                                const SizedBox(height: 10),
                                
                                // Controls
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove, size: 28),
                                      onPressed: () => waterNotifier.removeWater(),
                                    ),
                                    const SizedBox(width: 20),
                                    GestureDetector(
                                       onTap: () => waterNotifier.addWater(),
                                       child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: const Icon(Icons.local_drink, size: 40, color: Color(0xFF4FC3F7)),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    IconButton(
                                      icon: const Icon(Icons.add, size: 28),
                                      onPressed: () => waterNotifier.addWater(),
                                    ),
                                  ],
                                ),
                                 Text(
                                  '+ ${waterState.settings.cupSize} ml',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                ),
                                
                                const SizedBox(height: 20),
                                
                                // Bottom Menu - Pushed to bottom
                                const Spacer(),
                                
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      _buildMenuItem(
                                        context,
                                        icon: Icons.bar_chart_rounded,
                                        title: '미션 기록 보기',
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (_) => const WaterRecordScreen()));
                                        },
                                      ),
                                      const SizedBox(height: 8),
                                      _buildMenuItem(
                                        context,
                                        title: '목표',
                                        value: '${NumberFormat('#,###').format(dailyGoal)} ml',
                                        icon: Icons.edit_note,
                                        onTap: () {
                                          _showGoalSettingDialog(context, ref, dailyGoal);
                                        },
                                      ),
                                       const SizedBox(height: 8),
                                       _buildMenuItem(
                                        context,
                                        title: '알림',
                                        icon: Icons.notifications_none_rounded,
                                        onTap: () {
                                           Navigator.push(context, MaterialPageRoute(builder: (_) => const WaterAlarmScreen()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30), // Bottom padding
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            if (_isSuccess)
              Positioned.fill(
                child: MissionSuccessOverlay(
                  onFinish: () {
                    debugPrint('Success overlay finished. Popping WaterMissionScreen.');
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {
    IconData? icon,
    String? title,
    String? customLabel,
    String? value,
    bool isBlue = false,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isBlue ? const Color(0xFF0277BD) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? (isBlue ? Colors.white : const Color(0xFF0277BD)), size: 24),
              const SizedBox(width: 16),
            ],
            if (title != null)
              Text(
                title,
                style: TextStyle(
                  color: isBlue ? Colors.white : Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (customLabel != null)
               Text(
                customLabel,
                style: TextStyle(
                  color: isBlue ? Colors.white : Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const Spacer(),
            if (value != null)
              Text(
                value,
                style: TextStyle(
                  color: isBlue ? Colors.white : Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios,
              color: isBlue ? Colors.white70 : Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showGoalSettingDialog(BuildContext context, WidgetRef ref, int currentGoal) {
     final controller = TextEditingController(text: currentGoal.toString());
     showDialog(
       context: context,
       builder: (context) => AlertDialog(
         title: const Text("목표 설정 (ml)"),
         content: TextField(
           controller: controller,
           keyboardType: TextInputType.number,
           decoration: const InputDecoration(
             suffixText: "ml",
           ),
         ),
         actions: [
           TextButton(
             onPressed: () => Navigator.pop(context),
             child: const Text("취소"),
           ),
           TextButton(
             onPressed: () {
               final val = int.tryParse(controller.text);
               if (val != null && val > 0) {
                 ref.read(waterProvider.notifier).updateSettings(dailyGoal: val);
               }
               Navigator.pop(context);
             },
             child: const Text("저장"),
           ),
         ],
       ),
     );
  }
}
