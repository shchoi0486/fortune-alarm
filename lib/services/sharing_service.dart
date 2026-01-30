import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart' hide Link;
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart' as kakao;
import 'package:share_plus/share_plus.dart';
import 'package:fortune_alarm/l10n/app_localizations.dart';

class SharingService {
  // 카카오 개발자 콘솔에서 발급받은 네이티브 앱 키
  static const String kakaoNativeAppKey = '5016b25fc9754eefe21695fefa908954'; 
  static const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.seriessnap.fortunealarm';

  static void init() {
    KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  }

  static Future<void> showShareOptions({
    required BuildContext context,
    required String title,
    required String description,
    String? imageUrl,
    Map<String, String>? results,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                l10n.shareResult,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFEE500),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chat_bubble, color: Colors.black, size: 20),
              ),
              title: Text(l10n.shareViaKakao),
              onTap: () {
                Navigator.pop(context);
                shareFortune(title: title, description: description, imageUrl: imageUrl, results: results, l10n: l10n);
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.share, color: Colors.black, size: 20),
              ),
              title: Text(l10n.shareViaSNS),
              onTap: () {
                Navigator.pop(context);
                shareGeneral(title: title, description: description, results: results, l10n: l10n);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Future<void> shareGeneral({
    required String title,
    required String description,
    Map<String, String>? results,
    AppLocalizations? l10n,
  }) async {
    try {
      StringBuffer sb = StringBuffer();
      sb.writeln('✨ $title ✨');
      sb.writeln('━━━━━━━━━━━━━━━━━━━━');
      if (results != null && results.isNotEmpty) {
        results.forEach((key, value) {
          sb.writeln('📍 $key: $value');
        });
        sb.writeln('━━━━━━━━━━━━━━━━━━━━');
      }
      sb.writeln(description);
      sb.writeln('\n👇 ${l10n?.checkDetailResult ?? "Check detailed result"}');
      sb.writeln(playStoreUrl);

      await Share.share(
        sb.toString(),
        subject: title,
      );
    } catch (e) {
      debugPrint('Error general sharing: $e');
    }
  }

  static Future<void> shareFortune({
    required String title,
    required String description,
    String? imageUrl,
    Map<String, String>? results,
    AppLocalizations? l10n,
  }) async {
    try {
      // 우선적으로 카카오톡 공유 시도
      bool isKakaoTalkSharingAvailable = await ShareClient.instance.isKakaoTalkSharingAvailable();

      if (isKakaoTalkSharingAvailable) {
        // 상세 결과를 ItemContent 리스트로 변환
        List<kakao.ItemInfo>? itemContents;
        if (results != null && results.isNotEmpty) {
          itemContents = results.entries.map((e) => kakao.ItemInfo(item: e.key, itemOp: e.value)).toList();
        }

        // 카카오톡으로 공유
        final FeedTemplate template = FeedTemplate(
          content: Content(
            title: title,
            description: description,
            imageUrl: Uri.parse(imageUrl ?? 'https://raw.githubusercontent.com/seriessnap/fortune_alarm/main/assets/icon/share_banner.png'),
            link: kakao.Link(
              mobileWebUrl: Uri.parse(playStoreUrl),
              webUrl: Uri.parse(playStoreUrl),
            ),
          ),
          itemContent: itemContents != null ? kakao.ItemContent(
            items: itemContents,
          ) : null,
          buttons: [
            kakao.Button(
              title: l10n?.viewMyFortuneResult ?? 'View my fortune result',
              link: kakao.Link(
                mobileWebUrl: Uri.parse(playStoreUrl),
                webUrl: Uri.parse(playStoreUrl),
              ),
            ),
          ],
        );

        await ShareClient.instance.shareDefault(template: template);
      } else {
        // 카카오톡이 없으면 일반 공유
        await shareGeneral(title: title, description: description, results: results, l10n: l10n);
      }
    } catch (e) {
      debugPrint('Error sharing: $e');
      // 에러 발생 시 일반 공유 시도
      await shareGeneral(title: title, description: description, results: results, l10n: l10n);
    }
  }
}
