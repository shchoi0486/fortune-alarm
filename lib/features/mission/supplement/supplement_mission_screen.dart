import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'providers/supplement_provider.dart';
import 'widgets/pill_box_widget.dart';
import 'supplement_alarm_screen.dart';
import 'supplement_record_screen.dart';
import 'supplement_ringing_screen.dart';
import 'dart:async';
import '../../../../services/supplement_alarm_service.dart';

class SupplementMissionScreen extends ConsumerStatefulWidget {
  final bool useSafeAreaTop;
  const SupplementMissionScreen({super.key, this.useSafeAreaTop = true});

  @override
  ConsumerState<SupplementMissionScreen> createState() => _SupplementMissionScreenState();
}

class _SupplementMissionScreenState extends ConsumerState<SupplementMissionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkArguments();
    });
  }

  bool _isRingingScreenPushed = false;

  void _checkArguments() {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      final action = args['action'];
      final payload = args['payload'];
      
      // 인자를 소모했음을 표시하기 위해 null로 처리하거나 플래그 사용
      // 여기서는 플래그를 사용하여 중복 실행 방지
      if (action == 'take_now') {
         // 바로 섭취 처리하지 않고, 사용자가 직접 누르도록 유도
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('영양제를 드시고 기록해주세요!')));
         // 인자 제거
         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>..remove('action');
      } else if (action == 'snooze') {
         _showSnoozeDialog(payload);
         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>..remove('action');
      } else if (action == 'show_ringing') {
         if (_isRingingScreenPushed) return;
         _isRingingScreenPushed = true;

         int? alarmId;
         if (payload != null && payload.startsWith('supplement_')) {
           alarmId = int.tryParse(payload.split('_').last);
         }
         alarmId ??= 10000;
         
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => SupplementRingingScreen(alarmId: alarmId!),
             settings: const RouteSettings(name: '/supplement_ringing'),
             fullscreenDialog: true,
           ),
         ).then((_) => _isRingingScreenPushed = false);
         
         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>..remove('action');
      }
    }
  }

  void _showSnoozeDialog(String? payload) {
    int? alarmId;
    if (payload != null && payload.startsWith('supplement_')) {
       alarmId = int.tryParse(payload.split('_').last);
    }
    alarmId ??= 10000; // Fallback ID

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '언제 다시 알려드릴까요?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _snoozeOptionButton(context, 5, alarmId!),
                _snoozeOptionButton(context, 10, alarmId),
                _snoozeOptionButton(context, 20, alarmId),
                _snoozeOptionButton(context, 30, alarmId),
                _snoozeOptionButton(context, 60, alarmId),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _snoozeOptionButton(BuildContext context, int minutes, int alarmId) {
    final label = minutes >= 60 ? '${minutes ~/ 60}시간' : '$minutes분';
    return InkWell(
      onTap: () {
        _snooze(minutes, alarmId);
        Navigator.pop(context);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 72) / 3,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF334155),
              ),
            ),
            const Text(
              '후에',
              style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
          ],
        ),
      ),
    );
  }

  void _snooze(int minutes, int id) {
     final time = DateTime.now().add(Duration(minutes: minutes));
     // 원래 알람 ID(10000~)를 유지하면 정기 알람(매일 반복)이 취소될 수 있으므로
     // 스누즈용 임시 ID를 사용합니다. (예: 기존 ID + 50000)
     final snoozeId = id + 50000;
     SupplementAlarmService.scheduleOneTime(time, snoozeId);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$minutes분 후에 다시 알림을 보냅니다.')));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(supplementProvider);
    final notifier = ref.read(supplementProvider.notifier);

    // 목표 달성 시 자동 팝업 및 이동
    ref.listen(supplementProvider, (previous, next) {
      if (previous != null && !previous.isGoalAchieved && next.isGoalAchieved) {
        _showSuccessDialog();
      }
    });

    if (state.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentCount = state.log.currentCount;
    final dailyGoal = state.settings.dailyGoal;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: widget.useSafeAreaTop,
          child: Column(
            children: [
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
                      '영양제',
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
                      Text(
                        '$currentCount회 섭취',
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '목표: 하루 $dailyGoal회',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                      const SizedBox(height: 50),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: PillBoxWidget(
                          currentCount: currentCount,
                          dailyGoal: dailyGoal,
                          onTake: () => notifier.takeSupplement(),
                          onRemove: () => notifier.removeSupplement(),
                        ),
                      ),
                      
                      const SizedBox(height: 10),
                      
                      // Controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _ControlButton(
                            icon: Icons.remove,
                            onPressed: () => notifier.removeSupplement(),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: () => notifier.takeSupplement(),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange[50],
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.orange[200]!),
                              ),
                              child: Icon(Icons.medication, size: 40, color: Colors.orange[700]),
                            ),
                          ),
                          const SizedBox(width: 30),
                          _ControlButton(
                            icon: Icons.add,
                            onPressed: () => notifier.takeSupplement(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '영양제를 챙겨 드셨나요?',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Bottom Menu - Pushed to bottom with Spacer
                      const Spacer(), 
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            _MenuItem(
                              title: '미션 기록 보기',
                              icon: Icons.bar_chart_rounded,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const SupplementRecordScreen()));
                              },
                            ),
                            const SizedBox(height: 10),
                            _MenuItem(
                              title: '섭취 목표 설정',
                              value: '$dailyGoal회',
                              icon: Icons.edit_note,
                              onTap: () => _showGoalDialog(dailyGoal),
                            ),
                            const SizedBox(height: 10),
                            _MenuItem(
                              title: '알림',
                              icon: Icons.notifications_none_rounded,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const SupplementAlarmScreen()));
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
),
      ),
    );
  }

  void _showSuccessDialog() {
    Timer? autoCloseTimer;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        // 3초 후 자동 닫기 타이머 시작
        autoCloseTimer = Timer(const Duration(seconds: 3), () {
          if (dialogContext.mounted && Navigator.canPop(dialogContext)) {
            Navigator.pop(dialogContext);
          }
        });

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.orange[700], size: 80),
                const SizedBox(height: 20),
                const Text(
                  '건강을 챙기셨네요!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '잠시 후 미션 화면으로 이동합니다.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('확인'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      autoCloseTimer?.cancel();
      if (context.mounted && Navigator.canPop(context)) {
        Navigator.pop(context); // Screen 닫기
      }
    });
  }

  void _showGoalDialog(int currentGoal) {
    showDialog(
      context: context,
      builder: (context) {
        int tempGoal = currentGoal;
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('일일 섭취 목표'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('하루에 몇 번 영양제를 드시나요?'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => setState(() => tempGoal = (tempGoal - 1).clamp(1, 10)),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text('$tempGoal회', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed: () => setState(() => tempGoal = (tempGoal + 1).clamp(1, 10)),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
              TextButton(
                onPressed: () {
                  ref.read(supplementProvider.notifier).updateSettings(dailyGoal: tempGoal);
                  Navigator.pop(context);
                },
                child: const Text('저장'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ControlButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black87),
        onPressed: onPressed,
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final String? value;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;

  const _MenuItem({
    required this.title,
    this.value,
    required this.icon,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.orange[700], size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            if (value != null)
              Text(
                value!,
                style: TextStyle(
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
