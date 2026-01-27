import 'package:flutter/material.dart';
import 'package:fortune_alarm/services/ad_service.dart';
import 'package:fortune_alarm/widgets/ad_widgets.dart';
import 'package:fortune_alarm/features/fortune/fortune_pass_screen.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class MissionResultDialog extends StatelessWidget {
  const MissionResultDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // 구독자인 경우 다이얼로그를 보여주지 않거나, 광고 없이 내용만 보여줄 수 있음.
    // 하지만 이 다이얼로그는 '광고를 보여주는 것'이 주 목적이므로, 
    // 호출하는 쪽에서 구독자 체크를 하고 구독자라면 바로 성공 처리하는 것이 좋음.
    // 여기서는 안전장치로 구독자일 경우 빈 컨테이너 반환 (혹은 바로 닫기 처리 필요)
    if (AdService.isSubscriber) {
      return const SizedBox.shrink(); 
    }

    return PopScope(
      canPop: false, // 뒤로가기 방지 (X 버튼으로만 닫기)
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 광고 영역 (이미지/영상)
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 320, // 네이티브 광고 높이 고정
                      child: ExitDialogAdWidget(),
                    ),
                    
                    // 광고 제거하기 버튼 (인앱 결제 유도)
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FortunePassScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E1E1E), // 어두운 배경
                        ),
                        child: Center(
                          child: Text(
                            l10n.removeAds,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // 닫기 (X) 버튼
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true), // true 반환 (성공 확인)
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.black, size: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.close,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
