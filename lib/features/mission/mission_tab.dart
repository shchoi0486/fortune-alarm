import 'package:flutter/material.dart';
import '../../main.dart';
import 'mission_screen.dart';

class MissionTab extends StatefulWidget {
  const MissionTab({super.key});

  @override
  State<MissionTab> createState() => _MissionTabState();
}

class _MissionTabState extends State<MissionTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: missionNavigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const MissionScreen(),
        );
      },
    );
  }
}
