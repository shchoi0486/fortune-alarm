import 'package:flutter/material.dart';

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final faqs = [
      FAQItem(
        question: '알람이 울리지 않아요.',
        answer: '안드로이드 시스템의 배터리 최적화 기능으로 인해 알람이 지연되거나 차단될 수 있습니다. 설정 > 알람 울림 최적화 메뉴에서 모든 권한을 허용으로 설정해 주세요.',
      ),
      FAQItem(
        question: '미션을 변경하고 싶어요.',
        answer: '알람 목록에서 수정을 원하는 알람을 탭한 후, 미션 선택 메뉴에서 원하는 미션(수학, 사진, 흔들기 등)으로 변경하실 수 있습니다.',
      ),
      FAQItem(
        question: '다크 모드는 어떻게 설정하나요?',
        answer: '설정 > 일반 > 다크 모드 토글을 통해 화면 테마를 변경하실 수 있습니다.',
      ),
      FAQItem(
        question: '포춘쿠키는 어떻게 모으나요?',
        answer: '매일 아침 알람을 해제하거나, 미션을 완료할 때마다 포춘쿠키를 획득할 수 있습니다. 모은 쿠키로 오늘의 운세를 확인해 보세요!',
      ),
      FAQItem(
        question: '앱을 삭제하면 데이터가 사라지나요?',
        answer: '네, 포춘 알람은 기기 내부에 데이터를 저장하므로 앱 삭제 시 설정한 알람과 미션 기록이 모두 삭제됩니다. 주의해 주세요.',
      ),
    ];

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('자주 묻는 질문', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
              ),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  faq.question,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    'Q',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                iconColor: Colors.blueAccent,
                collapsedIconColor: Colors.grey,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.black26 : Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        faq.answer,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: isDark ? Colors.grey[300] : Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
