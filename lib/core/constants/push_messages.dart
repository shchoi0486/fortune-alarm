import 'dart:math';

class PushMessages {
  static final _random = Random();

  // 운세 알림 랜덤 문구 리스트 (50개)
  static const List<Map<String, String>> fortuneMessages = [
    {"title": "오늘은 재물운이 강한 날이에요 💰", "body": "지금 운세를 확인하고 행운을 잡아보세요!"},
    {"title": "뜻밖의 연락이 올 수 있어요 📩", "body": "오늘의 인연운을 확인해보시겠어요?"},
    {"title": "오전보다 오후 운이 좋아요 🌤", "body": "오후를 준비하는 마음으로 운세를 확인해보세요."},
    {"title": "오늘은 말 한마디가 중요해요 🗣", "body": "대화하기 전에 오늘의 운세를 참고해보세요."},
    {"title": "지금 운세를 보면 하루가 편해져요 ✨", "body": "미리 보는 오늘의 흐름, 지금 확인하세요."},
    {"title": "오늘 하루, 당신을 위한 특별한 조언 💌", "body": "운세가 알려주는 힌트를 놓치지 마세요."},
    {"title": "행운의 여신이 미소 짓고 있어요 🍀", "body": "어떤 행운이 기다리고 있을까요?"},
    {"title": "오늘은 직감에 귀 기울여보세요 🎯", "body": "당신의 촉이 맞는지 운세로 확인해보세요."},
    {"title": "새로운 기회가 찾아올지도 몰라요 🎁", "body": "오늘의 운세가 힌트를 줄 거예요."},
    {"title": "오늘의 행운의 색깔은 무엇일까요? 🎨", "body": "행운의 아이템을 확인하고 하루를 시작하세요."},
    {"title": "기분 좋은 일이 생길 것 같은 예감 😊", "body": "운세를 보면 예감이 확신으로 바뀔 거예요."},
    {"title": "오늘은 작은 행복이 큰 기쁨으로 🌈", "body": "어떤 소소한 즐거움이 있을지 확인해보세요."},
    {"title": "주의해야 할 점을 미리 알아볼까요? 🚦", "body": "운세를 통해 오늘 하루를 더 안전하게 보내세요."},
    {"title": "오늘 당신의 매력이 빛나는 날 ✨", "body": "운세에서 당신의 매력 포인트를 찾아보세요."},
    {"title": "금전운이 솟아오르는 중! 📈", "body": "어디서 좋은 소식이 올지 확인해보세요."},
    {"title": "오늘은 휴식과 여유가 필요한 날 ☕", "body": "운세가 추천하는 재충전 방법을 알아보세요."},
    {"title": "인간관계에서 좋은 소식이 있어요 🤝", "body": "오늘 만날 귀인은 누구일까요?"},
    {"title": "오늘 하루, 에너지가 넘쳐요 ⚡", "body": "이 에너지를 어디에 쓰면 좋을지 운세로 확인하세요."},
    {"title": "뜻밖의 행운이 당신을 기다립니다 🎊", "body": "어떤 행운일지 지금 바로 확인해보세요!"},
    {"title": "오늘은 긍정적인 생각만 하세요 🌟", "body": "좋은 생각이 좋은 운을 부릅니다. 운세를 확인하세요."},
    {"title": "오늘의 키워드는 '성장'입니다 🌱", "body": "어떤 부분에서 발전이 있을지 알아보세요."},
    {"title": "잠깐! 오늘 중요한 일정이 있나요? ⏰", "body": "운세를 보고 일정을 계획해보세요."},
    {"title": "오늘은 당신이 주인공인 날 👑", "body": "자신감을 가지고 하루를 시작하세요. 운세가 응원합니다."},
    {"title": "건강운이 좋은 날이에요 💪", "body": "활기찬 하루를 위한 운세 조언을 확인하세요."},
    {"title": "오늘의 애정운은 맑음 ☀️", "body": "사랑하는 사람과의 좋은 시간을 위한 운세 힌트!"},
    {"title": "마음의 평화가 찾아오는 하루 🕊️", "body": "운세를 보며 차분하게 하루를 정리해보세요."},
    {"title": "오늘은 새로운 도전을 하기에 좋은 날 🚀", "body": "운세가 당신의 도전을 지지합니다."},
    {"title": "행운의 숫자가 궁금하신가요? 🔢", "body": "오늘 당신을 도와줄 숫자를 확인해보세요."},
    {"title": "오늘은 주변 사람들에게 감사하는 날 🙏", "body": "운세가 전하는 따뜻한 메시지를 확인하세요."},
    {"title": "뜻밖의 선물이 기다리고 있을지도? 🎀", "body": "오늘의 운세에서 힌트를 찾아보세요."},
    {"title": "오늘의 운세가 당신을 부르고 있어요 📣", "body": "아직 운세를 확인하지 않으셨네요. 지금 확인해보세요!"},
    {"title": "점심시간, 운세 보기 딱 좋은 시간 🍱", "body": "식사 후 가볍게 운세를 즐겨보세요."},
    {"title": "오늘 남은 시간의 운세는 어떨까요? ⏳", "body": "오후의 운세 흐름을 미리 파악해보세요."},
    {"title": "운세를 보면 스트레스가 풀릴지도 몰라요 💆", "body": "잠시 쉬어가며 오늘의 운세를 확인하세요."},
    {"title": "오늘은 어떤 별자리가 가장 운이 좋을까요? 🌌", "body": "당신의 별자리 운세를 확인해보세요."},
    {"title": "오늘의 운세, 확인 안 하시면 후회할지도 몰라요 😉", "body": "지금 바로 확인하고 행운을 챙기세요."},
    {"title": "운세가 알려주는 오늘의 주의사항 ⚠️", "body": "미리 알아두면 도움이 될 운세 팁을 확인하세요."},
    {"title": "오늘은 어떤 음식이 행운을 가져다줄까요? 🍲", "body": "운세에서 행운의 음식을 찾아보세요."},
    {"title": "운세를 보면 기분 좋은 하루가 시작됩니다 🎶", "body": "오늘의 운세와 함께 즐거운 하루를 만드세요."},
    {"title": "오늘은 당신의 노력이 결실을 맺는 날 🍎", "body": "운세가 전하는 희망찬 메시지를 확인하세요."},
    {"title": "운세가 당신의 고민을 덜어줄 거예요 🎈", "body": "오늘의 운세에서 해답의 실마리를 찾아보세요."},
    {"title": "오늘은 어떤 인연이 당신을 기다릴까요? 🌸", "body": "운세로 만남의 행운을 점쳐보세요."},
    {"title": "운세와 함께하는 즐거운 오후 시간 ☕", "body": "따뜻한 차 한 잔과 함께 운세를 확인해보세요."},
    {"title": "오늘의 운세 점수는 몇 점일까요? 💯", "body": "당신의 오늘 운세 점수를 확인해보세요."},
    {"title": "운세가 전하는 오늘의 명언 📜", "body": "마음에 새길 운세 한 줄을 확인하세요."},
    {"title": "오늘은 새로운 아이디어가 떠오르는 날 💡", "body": "운세가 영감을 더해줄 거예요."},
    {"title": "운세를 보며 오늘 하루를 리프레시하세요 🌿", "body": "지친 일상에 활력을 불어넣어 줄 운세!"},
    {"title": "오늘은 어떤 즐거운 일이 생길까요? 🎉", "body": "운세에서 오늘의 즐거움을 찾아보세요."},
    {"title": "운세가 당신의 성공을 응원합니다 🏆", "body": "오늘의 운세와 함께 목표를 향해 나아가세요."},
    {"title": "오늘의 운세, 지금 바로 확인해볼까요? 👀", "body": "아직 늦지 않았어요. 오늘의 운세를 확인하세요."},
  ];

  // 루틴 알림 랜덤 문구 리스트 (50개)
  static const List<Map<String, String>> routineMessages = [
    {"title": "어제 루틴을 완료 못했어요 😢", "body": "오늘은 성공해볼까요? 지금 바로 시작해보세요!"},
    {"title": "오늘의 루틴, 아직 잊지 않으셨죠? 🤔", "body": "조금만 시간을 내서 루틴을 완료해보세요."},
    {"title": "루틴 하나가 당신의 내일을 바꿉니다 🌱", "body": "오늘도 멋지게 루틴을 해내볼까요?"},
    {"title": "오늘 하루 수고 많으셨어요! 👏", "body": "마무리로 루틴 체크 어떠세요?"},
    {"title": "루틴을 완료하면 기분이 좋아질 거예요 😌", "body": "작은 성취감을 느껴보세요."},
    {"title": "당신의 꾸준함이 빛을 발할 거예요 ✨", "body": "오늘도 루틴을 이어가세요."},
    {"title": "루틴 체크, 지금 1분이면 충분해요 ⏱️", "body": "더 미루기 전에 지금 바로 해볼까요?"},
    {"title": "오늘 루틴을 달성하면 완벽한 하루! 💯", "body": "마지막 퍼즐을 맞춰주세요."},
    {"title": "루틴은 나를 사랑하는 방법입니다 💖", "body": "오늘도 나를 위해 루틴을 실천하세요."},
    {"title": "조금 귀찮더라도 해내면 뿌듯할 거예요 💪", "body": "당신의 의지력을 보여주세요!"},
    {"title": "오늘의 루틴 달성률은 100%가 될 수 있어요 🚀", "body": "지금 바로 체크해보세요."},
    {"title": "루틴을 꾸준히 하는 당신, 정말 멋져요 👍", "body": "오늘도 잊지 말고 루틴을 완료하세요."},
    {"title": "하루를 마무리하는 가장 좋은 방법 🌙", "body": "루틴을 완료하고 편안하게 쉬세요."},
    {"title": "루틴 체크하고 꿀잠 주무세요 😴", "body": "오늘 할 일을 다 마치면 잠도 더 잘 올 거예요."},
    {"title": "당신의 성장 기록, 오늘도 업데이트할까요? 📈", "body": "루틴 완료로 하루를 기록하세요."},
    {"title": "루틴을 완료하고 나에게 칭찬 한마디 🗣️", "body": "오늘도 해냈어! 멋지다 나 자신!"},
    {"title": "루틴은 습관을 만들고 습관은 인생을 만듭니다 🛤️", "body": "오늘도 좋은 습관을 이어가세요."},
    {"title": "오늘도 잊지 않고 찾아온 루틴 알리미 🔔", "body": "당신의 루틴 성공을 응원합니다."},
    {"title": "루틴 완료하고 상쾌한 내일을 맞이하세요 🌅", "body": "미루지 않고 오늘 해내는 것이 중요해요."},
    {"title": "당신의 루틴, 오늘도 순항 중인가요? ⛵", "body": "루틴을 확인하고 방향을 잡아보세요."},
    {"title": "루틴 체크 잊으신 건 아니죠? 😉", "body": "아직 시간이 있어요. 지금 바로 해보세요."},
    {"title": "오늘의 작은 실천이 내일의 큰 기쁨으로 🎁", "body": "루틴을 완료하고 성취감을 맛보세요."},
    {"title": "루틴을 완료하면 마음이 한결 가벼워질 거예요 🎈", "body": "오늘의 숙제를 끝내보세요."},
    {"title": "당신의 루틴 파트너가 응원합니다 📣", "body": "오늘도 파이팅! 루틴을 완료하세요."},
    {"title": "루틴 체크, 지금이 딱 좋은 타이밍! 🎯", "body": "생각났을 때 바로 하는 게 최고죠."},
    {"title": "오늘 루틴을 완료하면 어떤 보상을 줄까요? 🍩", "body": "작은 보상과 함께 루틴을 즐겨보세요."},
    {"title": "루틴은 당신을 배신하지 않아요 🤝", "body": "꾸준함의 힘을 믿고 오늘도 실천하세요."},
    {"title": "오늘 하루의 끝자락, 루틴으로 마무리해요 🌆", "body": "차분하게 하루를 정리하는 시간."},
    {"title": "루틴 완료 버튼을 누를 때의 쾌감! 🖱️", "body": "지금 바로 그 쾌감을 느껴보세요."},
    {"title": "당신의 완벽한 하루를 위한 마지막 미션 🧩", "body": "루틴 체크하고 완벽하게 하루를 끝내세요."},
    {"title": "루틴을 완료하고 나면 푹 쉴 수 있어요 🛋️", "body": "조금만 더 힘내서 루틴을 마쳐보세요."},
    {"title": "오늘 루틴을 건너뛰면 내일 두 배로 힘들어요 😭", "body": "오늘 할 일은 오늘 끝내자고요!"},
    {"title": "루틴은 나를 발전시키는 마법의 주문 🪄", "body": "오늘도 스스로에게 마법을 걸어보세요."},
    {"title": "당신의 루틴, 오늘 밤엔 꼭 확인하세요 🌃", "body": "하루가 지나가기 전에 루틴을 완료하세요."},
    {"title": "루틴 체크하고 뿌듯한 마음으로 잠자리에 들어요 🛌", "body": "오늘도 수고한 나를 위한 작은 선물."},
    {"title": "루틴을 완료하면 내일의 시작이 달라집니다 🌞", "body": "가벼운 마음으로 내일을 맞이하세요."},
    {"title": "당신의 루틴 기록이 쌓여가고 있어요 📚", "body": "오늘도 한 페이지를 멋지게 채워보세요."},
    {"title": "루틴은 작은 성공의 반복입니다 🔄", "body": "오늘도 작은 성공을 경험하세요."},
    {"title": "루틴 체크, 혼자가 아니에요. 함께 해요! 👭", "body": "많은 사람들이 지금 루틴을 완료하고 있어요."},
    {"title": "오늘 루틴을 완료하면 행운이 찾아올지도? 🍀", "body": "기분 좋은 상상과 함께 루틴을 실천하세요."},
    {"title": "루틴은 당신의 건강한 삶을 위한 투자 🏦", "body": "오늘도 나를 위한 투자를 잊지 마세요."},
    {"title": "당신의 루틴, 오늘 하루의 화룡점정 🐉", "body": "마지막까지 멋지게 장식해보세요."},
    {"title": "루틴 체크하고 홀가분해지세요 🌬️", "body": "머릿속에 맴도는 할 일을 끝내버리세요."},
    {"title": "루틴을 완료하면 자신감이 쑥쑥! 📈", "body": "스스로에 대한 믿음을 키워가세요."},
    {"title": "당신의 루틴은 소중하니까요 💎", "body": "오늘도 잊지 말고 루틴을 챙겨주세요."},
    {"title": "루틴 체크, 미루다 보면 눈덩이처럼 커져요 ⛄", "body": "지금 당장 해결해버리세요!"},
    {"title": "루틴을 완료하고 여유로운 저녁 시간을 보내세요 🍷", "body": "할 일을 마친 후의 휴식은 꿀맛이죠."},
    {"title": "당신의 루틴, 오늘도 성공 예감! 🎯", "body": "자신 있게 루틴 완료 버튼을 눌러보세요."},
    {"title": "루틴 체크하고 나면 기분이 상쾌해질 거예요 🍃", "body": "마음의 먼지를 털어내는 시간."},
    {"title": "오늘도 루틴을 완료한 당신에게 박수를 보냅니다 👏👏", "body": "정말 잘하셨어요! 내일도 화이팅!"},
  ];

  static const List<Map<String, String>> enFortuneMessages = [
    {"title": "Today's fortune is calling you 🌟", "body": "Check your daily fortune and find out what awaits!"},
    {"title": "A lucky day ahead! 🍀", "body": "Don't miss out on today's fortune. Check it now."},
    {"title": "Curious about your luck today? ✨", "body": "Take a moment to see your daily fortune."},
    {"title": "Good things are coming your way 🎁", "body": "Check your fortune and claim your luck!"},
    {"title": "Your daily advice is ready 💌", "body": "See what the universe has planned for you today."},
  ];

  static const List<Map<String, String>> jaFortuneMessages = [
    {"title": "今日の運勢があなたを待っています 🌟", "body": "運勢をチェックして、今日一日のヒントを見つけましょう！"},
    {"title": "幸運な一日が待っています！ 🍀", "body": "今日の運勢を見逃さないで。今すぐチェックしましょう。"},
    {"title": "今日の運勢が気になりませんか？ ✨", "body": "少し時間を作って、今日の運勢を見てみましょう。"},
    {"title": "良いことがあなたに向かっています 🎁", "body": "運勢をチェックして、幸運を手に入れましょう！"},
    {"title": "今日のアドバイスをお届けします 💌", "body": "今日を乗り切るための特別なヒントを見てみましょう。"},
  ];

  static const List<Map<String, String>> zhFortuneMessages = [
    {"title": "今日运势已更新 🌟", "body": "快来看看今天有什么好运在等着您！"},
    {"title": "好运正在路上！ 🍀", "body": "不要错过今天的运势，现在就来查看吧。"},
    {"title": "好奇今天的运气吗？ ✨", "body": "花点时间看看您的每日专属运势。"},
    {"title": "幸运即将降临 🎁", "body": "查看运势，抓住属于您的好运！"},
    {"title": "您的每日建议已准备好 💌", "body": "快来看看今天有什么特别的指引吧。"},
  ];

  static const List<Map<String, String>> esFortuneMessages = [
    {"title": "¡Tu horóscopo de hoy te espera! 🌟", "body": "¡Revisa tu suerte diaria y descubre qué te espera!"},
    {"title": "¡Te espera un día lleno de suerte! 🍀", "body": "No te pierdas la fortuna de hoy. Revísala ahora."},
    {"title": "¿Curioso sobre tu suerte hoy? ✨", "body": "Tómate un momento para leer tu fortuna diaria."},
    {"title": "Cosas buenas vienen en camino 🎁", "body": "¡Revisa tu fortuna y reclama tu suerte!"},
    {"title": "Tu consejo diario está listo 💌", "body": "Descubre qué te deparan los astros hoy."},
  ];

  static const List<Map<String, String>> frFortuneMessages = [
    {"title": "Votre horoscope du jour vous attend ! 🌟", "body": "Vérifiez votre chance quotidienne et découvrez ce qui vous attend !"},
    {"title": "Une journée chanceuse s'annonce ! 🍀", "body": "Ne manquez pas la fortune d'aujourd'hui. Vérifiez-la maintenant."},
    {"title": "Curieux de votre chance aujourd'hui ? ✨", "body": "Prenez un moment pour lire votre horoscope."},
    {"title": "De bonnes choses arrivent 🎁", "body": "Vérifiez votre fortune et saisissez votre chance !"},
    {"title": "Votre conseil quotidien est prêt 💌", "body": "Découvrez ce que les astres vous réservent aujourd'hui."},
  ];

  static const List<Map<String, String>> deFortuneMessages = [
    {"title": "Dein heutiges Horoskop wartet auf dich! 🌟", "body": "Überprüfe dein tägliches Glück und finde heraus, was dich erwartet!"},
    {"title": "Ein glücklicher Tag liegt vor dir! 🍀", "body": "Verpasse nicht das heutige Glück. Sieh gleich nach."},
    {"title": "Neugierig auf dein Glück heute? ✨", "body": "Nimm dir einen Moment Zeit für dein tägliches Horoskop."},
    {"title": "Gute Dinge kommen auf dich zu 🎁", "body": "Überprüfe dein Glück und nutze deine Chancen!"},
    {"title": "Dein täglicher Rat ist bereit 💌", "body": "Finde heraus, was die Sterne heute für dich bereithalten."},
  ];

  static const List<Map<String, String>> ruFortuneMessages = [
    {"title": "Ваш гороскоп на сегодня уже ждет вас! 🌟", "body": "Проверьте свою удачу и узнайте, что вас ждет!"},
    {"title": "Впереди удачный день! 🍀", "body": "Не упустите свой шанс. Проверьте гороскоп сейчас."},
    {"title": "Интересно, как вам повезет сегодня? ✨", "body": "Уделите минутку, чтобы прочитать свой прогноз."},
    {"title": "К вам идут хорошие события 🎁", "body": "Проверьте свою удачу и заберите её!"},
    {"title": "Ваш совет на день уже готов 💌", "body": "Посмотрите, что звезды приготовили для вас сегодня."},
  ];

  static const List<Map<String, String>> hiFortuneMessages = [
    {"title": "आज का राशिफल आपका इंतजार कर रहा है 🌟", "body": "अपना दैनिक भाग्य देखें और पता करें कि आपका क्या इंतजार कर रहा है!"},
    {"title": "एक भाग्यशाली दिन आगे है! 🍀", "body": "आज के भाग्य को याद मत करो। इसे अभी जांचें।"},
    {"title": "आज अपने भाग्य के बारे में उत्सुक हैं? ✨", "body": "अपना दैनिक भाग्य देखने के लिए एक क्षण निकालें।"},
    {"title": "अच्छी चीजें आपके रास्ते में आ रही हैं 🎁", "body": "अपना भाग्य जांचें और अपना भाग्य मांगें!"},
    {"title": "आपकी दैनिक सलाह तैयार है 💌", "body": "देखें कि सितारों ने आज आपके लिए क्या योजना बनाई है।"},
  ];

  static const List<Map<String, String>> enRoutineMessages = [
    {"title": "Don't forget your routine today! 🌱", "body": "Take a small step towards your goals."},
    {"title": "Have you checked your missions? 🚀", "body": "Complete your daily routine and feel accomplished."},
    {"title": "A perfect day starts with a routine 💯", "body": "Let's finish what you started today."},
    {"title": "Time for your daily check-in ⏰", "body": "Keep up the good work and complete your routine."},
    {"title": "Wrap up your day with your routine 🌙", "body": "Finish your tasks and enjoy a peaceful evening."},
  ];

  static const List<Map<String, String>> jaRoutineMessages = [
    {"title": "今日のルーティンはお済みですか？ 🌱", "body": "目標に向けて小さな一歩を踏み出しましょう。"},
    {"title": "今日のタスクはチェックしましたか？ 🚀", "body": "毎日のルーティンを完了して達成感を味わいましょう。"},
    {"title": "完璧な一日はルーティンから 💯", "body": "今日決めたことを最後までやり遂げましょう。"},
    {"title": "毎日のチェックインの時間です ⏰", "body": "あともう少し！ルーティンを完了させましょう。"},
    {"title": "ルーティンを終わらせて一日を締めくくる 🌙", "body": "タスクを終えて、穏やかな夜を楽しみましょう。"},
  ];

  static const List<Map<String, String>> zhRoutineMessages = [
    {"title": "今天也别忘了完成日常哦！ 🌱", "body": "朝着您的目标迈出一小步。"},
    {"title": "今天的任务完成了吗？ 🚀", "body": "完成您的日常任务，感受满满的成就感。"},
    {"title": "完美的一天从日常开始 💯", "body": "让我们完成今天定下的小目标吧。"},
    {"title": "每日打卡时间 ⏰", "body": "坚持就是胜利，快来完成您的日常。"},
    {"title": "用日常结束您的一天 🌙", "body": "完成今天的任务，享受宁静的夜晚。"},
  ];

  static const List<Map<String, String>> esRoutineMessages = [
    {"title": "¡No olvides completar tu rutina hoy! 🌱", "body": "Da un pequeño paso hacia tus metas."},
    {"title": "¿Ya completaste tus tareas de hoy? 🚀", "body": "Completa tu rutina diaria y siéntete realizado."},
    {"title": "Un día perfecto comienza con una rutina 💯", "body": "Terminemos lo que empezaste hoy."},
    {"title": "Hora de tu registro diario ⏰", "body": "Sigue así y termina tus tareas del día."},
    {"title": "Termina tu día con tu rutina 🌙", "body": "Termina tus tareas y disfruta de una noche tranquila."},
  ];

  static const List<Map<String, String>> frRoutineMessages = [
    {"title": "N'oubliez pas votre routine aujourd'hui ! 🌱", "body": "Faites un petit pas vers vos objectifs."},
    {"title": "Avez-vous accompli vos tâches ? 🚀", "body": "Complétez votre routine quotidienne et soyez fier de vous."},
    {"title": "Une journée parfaite commence par une routine 💯", "body": "Finissons ce que vous avez commencé aujourd'hui."},
    {"title": "C'est l'heure de votre bilan quotidien ⏰", "body": "Continuez votre bon travail et complétez votre routine."},
    {"title": "Terminez votre journée avec votre routine 🌙", "body": "Terminez vos tâches et profitez d'une soirée paisible."},
  ];

  static const List<Map<String, String>> deRoutineMessages = [
    {"title": "Vergiss deine Routine heute nicht! 🌱", "body": "Mache einen kleinen Schritt in Richtung deiner Ziele."},
    {"title": "Hast du deine heutigen Aufgaben erledigt? 🚀", "body": "Schließe deine tägliche Routine ab und fühle dich erfüllt."},
    {"title": "Ein perfekter Tag beginnt mit einer Routine 💯", "body": "Lass uns beenden, was du heute begonnen hast."},
    {"title": "Zeit für dein tägliches Check-in ⏰", "body": "Mach weiter so und schließe deine Routine ab."},
    {"title": "Beende deinen Tag mit deiner Routine 🌙", "body": "Beende deine Aufgaben und genieße einen friedlichen Abend."},
  ];

  static const List<Map<String, String>> ruRoutineMessages = [
    {"title": "Не забудьте выполнить свои задачи на сегодня! 🌱", "body": "Сделайте небольшой шаг к своим целям."},
    {"title": "Вы уже выполнили свои задания? 🚀", "body": "Завершите свою ежедневную рутину и почувствуйте удовлетворение."},
    {"title": "Идеальный день начинается с рутины 💯", "body": "Давайте закончим то, что вы запланировали на сегодня."},
    {"title": "Время для вашей ежедневной проверки ⏰", "body": "Продолжайте в том же духе и завершите свою рутину."},
    {"title": "Завершите свой день рутиной 🌙", "body": "Закончите свои задачи и наслаждайтесь спокойным вечером."},
  ];

  static const List<Map<String, String>> hiRoutineMessages = [
    {"title": "आज के अपने रूटीन को पूरा करना न भूलें! 🌱", "body": "अपने लक्ष्यों की दिशा में एक छोटा कदम उठाएं।"},
    {"title": "क्या आपने अपने मिशन पूरे कर लिए हैं? 🚀", "body": "अपनी दैनिक दिनचर्या पूरी करें और उपलब्धि महसूस करें।"},
    {"title": "एक सही दिन की शुरुआत दिनचर्या से होती है 💯", "body": "आइए वह समाप्त करें जो आपने आज शुरू किया था।"},
    {"title": "आपके दैनिक चेक-इन का समय ⏰", "body": "अच्छा काम जारी रखें और अपनी दिनचर्या पूरी करें।"},
    {"title": "अपनी दिनचर्या के साथ अपने दिन का समापन करें 🌙", "body": "अपने कार्यों को समाप्त करें और शांतिपूर्ण शाम का आनंद लें।"},
  ];

  static Map<String, String> getRandomFortuneMessage([String languageCode = 'ko']) {
    switch (languageCode) {
      case 'ko':
        return fortuneMessages[_random.nextInt(fortuneMessages.length)];
      case 'ja':
        return jaFortuneMessages[_random.nextInt(jaFortuneMessages.length)];
      case 'zh':
        return zhFortuneMessages[_random.nextInt(zhFortuneMessages.length)];
      case 'es':
        return esFortuneMessages[_random.nextInt(esFortuneMessages.length)];
      case 'fr':
        return frFortuneMessages[_random.nextInt(frFortuneMessages.length)];
      case 'de':
        return deFortuneMessages[_random.nextInt(deFortuneMessages.length)];
      case 'ru':
        return ruFortuneMessages[_random.nextInt(ruFortuneMessages.length)];
      case 'hi':
        return hiFortuneMessages[_random.nextInt(hiFortuneMessages.length)];
      default:
        return enFortuneMessages[_random.nextInt(enFortuneMessages.length)];
    }
  }

  static Map<String, String> getRandomRoutineMessage([String languageCode = 'ko']) {
    switch (languageCode) {
      case 'ko':
        return routineMessages[_random.nextInt(routineMessages.length)];
      case 'ja':
        return jaRoutineMessages[_random.nextInt(jaRoutineMessages.length)];
      case 'zh':
        return zhRoutineMessages[_random.nextInt(zhRoutineMessages.length)];
      case 'es':
        return esRoutineMessages[_random.nextInt(esRoutineMessages.length)];
      case 'fr':
        return frRoutineMessages[_random.nextInt(frRoutineMessages.length)];
      case 'de':
        return deRoutineMessages[_random.nextInt(deRoutineMessages.length)];
      case 'ru':
        return ruRoutineMessages[_random.nextInt(ruRoutineMessages.length)];
      case 'hi':
        return hiRoutineMessages[_random.nextInt(hiRoutineMessages.length)];
      default:
        return enRoutineMessages[_random.nextInt(enRoutineMessages.length)];
    }
  }
}
