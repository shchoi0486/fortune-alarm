import 'package:flutter_riverpod/flutter_riverpod.dart';

// 새로운 알림 여부를 관리하는 프로바이더
// 실제 운영 시에는 Firebase FCM 수신 시 true로 변경하고, 알림함을 확인하면 false로 변경하는 로직이 추가됩니다.
final hasNewNotificationProvider = StateProvider<bool>((ref) => false);
