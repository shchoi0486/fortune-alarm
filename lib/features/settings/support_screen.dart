import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fortune_alarm/l10n/app_localizations.dart';

class SupportScreen extends StatefulWidget {
  final String title;
  final String description;
  final String email;

  const SupportScreen({
    super.key,
    required this.title,
    required this.description,
    this.email = 'seriessnap.co@gmail.com',
  });

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              l10n.supportContentTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                ),
              ),
              child: TextField(
                controller: _textController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: l10n.supportHint,
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.supportRecipient,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: widget.email));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(l10n.emailCopied),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy, size: 20),
                        tooltip: l10n.copyTooltip,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.supportWorkingDays,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  if (_textController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.supportEmptyError)),
                    );
                    return;
                  }
                  
                  // 1. 문의 내용 복사
                  final fullContent = "${l10n.supportSubjectPrefix}: ${widget.title}\n\n${l10n.supportContentPrefix}:\n${_textController.text}";
                  await Clipboard.setData(ClipboardData(text: fullContent));
                  
                  // 2. 메일 앱 실행을 위한 URI 생성
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: widget.email,
                    queryParameters: {
                      'subject': '[포춘알람 문의] ${widget.title}',
                      'body': '${l10n.supportContentPrefix}:\n\n${_textController.text}',
                    },
                  );

                  // 3. 안내 팝업 및 메일 앱 실행
                  if (!mounted) return;
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("문의 준비 완료"),
                      content: Text("문의 내용이 복사되었습니다.\n${widget.email} 로 메일을 보내시겠습니까?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(l10n.cancel),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            try {
                              if (await canLaunchUrl(emailLaunchUri)) {
                                await launchUrl(emailLaunchUri);
                              } else {
                                throw 'Could not launch $emailLaunchUri';
                              }
                            } catch (e) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('메일 앱을 실행할 수 없습니다. 메일 주소를 복사했습니다.')),
                              );
                              await Clipboard.setData(ClipboardData(text: widget.email));
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                          child: const Text("메일 앱 열기"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  l10n.supportSubmitButton,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
