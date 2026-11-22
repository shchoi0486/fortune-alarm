import 'dart:math';

/// 푸시 메시지 풀 (하루 2회: 오전 응원 + 저녁 마무리 응원).
/// 오전 풀은 하루를 응원하는 메시지, 저녁 풀은 하루를 마무리하는 응원 메시지.
/// 운세 확인 유도·미션/기능 홍보 문구는 넣지 않는다 (과다 푸시 방지 정책).
class PushMessages {
  static final _random = Random();

  // 오전 푸시: 하루를 응원하는 메시지
  static const List<Map<String, String>> morningMessages = [
    {"title": "좋은 아침이에요 ☀️", "body": "오늘 하루도 가볍게 시작해보세요."},
    {"title": "오늘도 당신을 응원해요 🌟", "body": "어제보다 조금 더 빛나는 하루가 되길 바랄게요."},
    {"title": "기지개 한 번 켜볼까요 🧘", "body": "가벼운 스트레칭으로 활기차게 시작하세요."},
    {"title": "당신은 생각보다 훨씬 멋진 사람이에요 ✨", "body": "자신감을 가지고 오늘을 즐겨보세요."},
    {"title": "오늘의 첫걸음을 응원합니다 👣", "body": "천천히 가도 괜찮아요. 당신의 속도대로."},
    {"title": "깊게 숨 한 번 쉬어보세요 🌿", "body": "차분한 마음이 좋은 하루를 만듭니다."},
    {"title": "새로운 하루, 새로운 가능성 🚀", "body": "오늘은 어떤 좋은 일이 생길까요?"},
    {"title": "오늘 할 일 딱 하나만 정해보세요 📝", "body": "하나씩 해내면 충분해요."},
    {"title": "물 한 잔으로 개운하게 💧", "body": "몸도 마음도 깨워보세요."},
    {"title": "햇살처럼 따뜻한 하루 되세요 ☀️", "body": "당신 주변에도 온기가 가득하길."},
    {"title": "오늘도 파이팅이에요 💪", "body": "당신의 노력이 빛을 발할 거예요."},
    {"title": "거울 속 당신에게 미소 지어보세요 😊", "body": "미소가 행운을 부른대요."},
    {"title": "오늘은 어제보다 1%만 더 잘해보세요 🌱", "body": "작은 진전도 충분히 멋져요."},
    {"title": "따뜻한 아침 식사로 에너지 충전 🍳", "body": "든든하게 하루를 시작해보세요."},
    {"title": "오늘 만날 사람들을 기대해보세요 🤝", "body": "좋은 인연이 기다리고 있을 거예요."},
    {"title": "작은 감사로 시작하는 아침 🙏", "body": "감사한 마음 하나가 하루를 바꿔요."},
    {"title": "오늘은 도전하기 좋은 날 🎯", "body": "망설였던 그 일, 오늘 시작해보세요."},
    {"title": "당신의 오늘이 어제보다 행복하길 🍀", "body": "진심으로 응원합니다."},
    {"title": "오늘도 멋지게 해낼 거예요 👍", "body": "저는 당신을 믿어요."},
    {"title": "바쁜 아침에도 여유 한 스푼 ☕", "body": "따뜻한 음료와 함께 숨 고르기."},
    {"title": "좋아하는 음악과 함께 시작하는 아침 🎶", "body": "기분 좋은 리듬으로 하루를 열어보세요."},
    {"title": "창밖 날씨처럼 맑은 하루 되세요 🌤", "body": "기분 좋은 시작으로 하루를 열어보세요."},
    {"title": "오늘의 행운은 당신 편이에요 🍀", "body": "자신 있게 하루를 맞이하세요."},
    {"title": "오늘도 수고할 당신을 위해 👏", "body": "작은 행복이 가득한 하루가 되기를 응원합니다."},
  ];

  // 저녁 푸시: 하루를 마무리하는 응원 메시지
  static const List<Map<String, String>> eveningMessages = [
    {"title": "오늘 하루 수고 많으셨어요 👏", "body": "이제 편안히 쉬어도 괜찮아요."},
    {"title": "오늘도 잘 버텨낸 당신, 정말 대단해요 🌟", "body": "스스로를 칭찬해주세요."},
    {"title": "하루를 마무리하는 따뜻한 시간 🌙", "body": "오늘 있었던 좋은 일을 하나 떠올려보세요."},
    {"title": "애쓴 당신에게 박수를 보냅니다 👏👏", "body": "내일은 더 가벼운 하루가 될 거예요."},
    {"title": "오늘 못다 한 일은 내일의 당신에게 맡기세요 📦", "body": "지금은 쉬는 게 더 중요해요."},
    {"title": "따뜻한 저녁 식사 하셨나요? 🍲", "body": "든든하게 드시고 힘내세요."},
    {"title": "오늘의 수고로움은 내일의 양분이 됩니다 🌱", "body": "잘하고 있어요, 정말로."},
    {"title": "편안한 밤 되세요 😴", "body": "좋은 꿈 꾸시길 바랄게요."},
    {"title": "오늘 웃었던 순간을 기억하세요 😊", "body": "그 기억이 내일의 힘이 돼요."},
    {"title": "완벽하지 않아도 괜찮아요 💛", "body": "오늘의 당신도 충분히 잘했어요."},
    {"title": "하루의 끝, 고생한 어깨를 토닥여주세요 💆", "body": "스스로에게 고생했다고 말해주세요."},
    {"title": "조용한 밤, 마음도 쉬어갑니다 🌃", "body": "걱정은 잠시 내려놓으세요."},
    {"title": "오늘도 한 걸음 나아갔어요 👣", "body": "그걸로 충분합니다."},
    {"title": "내일은 오늘보다 조금 더 쉬운 하루이길 🌠", "body": "응원합니다."},
    {"title": "따뜻한 차 한 잔의 여유 🍵", "body": "하루를 차분히 정리하는 시간."},
    {"title": "당신 덕분에 오늘이 특별했어요 ✨", "body": "내일도 잘 부탁해요."},
    {"title": "스마트폰은 잠시 내려놓고 📵", "body": "눈과 마음에 휴식을 주세요."},
    {"title": "오늘 배운 게 있다면 그걸로 성공 🎓", "body": "작은 배움이 쌓여 큰 힘이 돼요."},
    {"title": "가족·친구에게 안부 한마디 어때요? 💌", "body": "따뜻한 말이 서로를 살립니다."},
    {"title": "내일 입을 옷을 미리 준비하는 여유 👔", "body": "아침이 한결 가벼워져요."},
    {"title": "오늘 흘린 땀을 기억합니다 💧", "body": "노력은 절대 배신하지 않아요."},
    {"title": "별빛처럼 빛나는 당신 🌌", "body": "오늘도 빛나셨어요."},
    {"title": "깊은 잠이 보약이에요 🛌", "body": "일찍 주무시고 내일을 맞이하세요."},
    {"title": "오늘도 고생한 나에게 “수고했어” 🗣️", "body": "큰 소리로 말해보세요. 진짜 힘이 돼요."},
  ];

  static const List<Map<String, String>> enMorningMessages = [
    {"title": "Good morning ☀️", "body": "Let's start the day light and easy."},
    {"title": "Cheering for you today 🌟", "body": "May today shine a little brighter than yesterday."},
    {"title": "How about a quick stretch? 🧘", "body": "Wake up your body with light movement."},
    {"title": "You are more amazing than you think ✨", "body": "Enjoy today with confidence."},
    {"title": "Take it one step at a time 👣", "body": "Your own pace is perfectly fine."},
    {"title": "One deep breath 🌿", "body": "A calm mind makes a good day."},
    {"title": "Today is full of new possibilities 🚀", "body": "Something good might happen."},
    {"title": "Just pick one thing for today 📝", "body": "One at a time is enough."},
    {"title": "Start with a glass of water 💧", "body": "Wake up your body and mind."},
    {"title": "Have a warm and sunny day ☀️", "body": "Good vibes are on your side."},
    {"title": "You've got this 💪", "body": "Your efforts will shine today."},
    {"title": "Smile at yourself in the mirror 😊", "body": "A smile brings good luck."},
  ];

  static const List<Map<String, String>> enEveningMessages = [
    {"title": "Great job today 👏", "body": "Now it's okay to rest."},
    {"title": "You made it through today 🌟", "body": "Give yourself some praise."},
    {"title": "Time to wind down 🌙", "body": "Recall one good thing from today."},
    {"title": "Leave the rest for tomorrow 📦", "body": "Rest matters more right now."},
    {"title": "You don't have to be perfect 💛", "body": "You did well enough today."},
    {"title": "Sleep well 😴", "body": "Sweet dreams to you."},
    {"title": "One step forward today 👣", "body": "That is more than enough."},
    {"title": "May tomorrow be a little easier 🌠", "body": "Cheering for you."},
    {"title": "A cup of warm tea 🍵", "body": "Time to calmly close the day."},
    {"title": "Put the phone down for a while 📵", "body": "Give your eyes and mind a break."},
    {"title": "Your efforts never betray you 💧", "body": "Remember today's hard work."},
    {"title": "Tell yourself 'well done' 🗣️", "body": "Say it out loud — it really helps."},
  ];

  static const List<Map<String, String>> jaMorningMessages = [
    {"title": "おはようございます ☀️", "body": "今日も軽やかに始めましょう。"},
    {"title": "今日のあなたを応援しています 🌟", "body": "昨日より少し輝く一日になりますように。"},
    {"title": "軽くストレッチしませんか 🧘", "body": "体を目覚めさせて元気にスタート。"},
    {"title": "あなたは思っている以上に素敵です ✨", "body": "自信を持って今日を楽しんでください。"},
    {"title": "一歩ずつで大丈夫 👣", "body": "あなたのペースで進みましょう。"},
    {"title": "深呼吸ひとつ 🌿", "body": "穏やかな心が良い一日を作ります。"},
    {"title": "新しい一日、新しい可能性 🚀", "body": "今日はどんな良いことがあるでしょう。"},
    {"title": "今日やることを一つだけ決めましょう 📝", "body": "一つずつで十分です。"},
    {"title": "お水一杯でスッキリ 💧", "body": "体も心も目覚めさせましょう。"},
    {"title": "温かく晴れやかな一日を ☀️", "body": "良い流れがあなたと共にありますように。"},
    {"title": "あなたならできる 💪", "body": "今日の努力がきっと光ります。"},
    {"title": "鏡の自分に微笑んでみましょう 😊", "body": "笑顔が幸運を呼びます。"},
  ];

  static const List<Map<String, String>> jaEveningMessages = [
    {"title": "今日もお疲れさまでした 👏", "body": "もうゆっくり休んで大丈夫です。"},
    {"title": "今日を乗り切ったあなたは立派です 🌟", "body": "自分を褒めてあげてください。"},
    {"title": "一日を締めくくる時間 🌙", "body": "今日の良かったことを一つ思い出してみましょう。"},
    {"title": "残りは明日に任せましょう 📦", "body": "今は休むことが一番大切です。"},
    {"title": "完璧じゃなくて大丈夫 💛", "body": "今日のあなたも十分よく頑張りました。"},
    {"title": "おやすみなさい 😴", "body": "良い夢を見られますように。"},
    {"title": "今日も一歩前進 👣", "body": "それだけで十分です。"},
    {"title": "明日が今日より少し優しい日でありますように 🌠", "body": "応援しています。"},
    {"title": "温かいお茶でひと息 🍵", "body": "静かに一日を整理する時間。"},
    {"title": "スマホを少し置いてみましょう 📵", "body": "目と心に休息を。"},
    {"title": "努力は裏切りません 💧", "body": "今日の頑張りを覚えています。"},
    {"title": "「お疲れさま」と声に出してみましょう 🗣️", "body": "本当に力になりますよ。"},
  ];

  static const List<Map<String, String>> zhMorningMessages = [
    {"title": "早上好 ☀️", "body": "轻松开启今天吧。"},
    {"title": "为今天的你加油 🌟", "body": "愿今天比昨天更加闪亮。"},
    {"title": "伸个懒腰吧 🧘", "body": "用轻微的运动唤醒身体。"},
    {"title": "你比想象中更出色 ✨", "body": "自信地享受今天吧。"},
    {"title": "一步一步来 👣", "body": "按自己的节奏就好。"},
    {"title": "深呼吸一次 🌿", "body": "平静的心带来美好的一天。"},
    {"title": "新的一天，新的可能 🚀", "body": "今天会有好事发生吗？"},
    {"title": "今天只定一个小目标 📝", "body": "一件一件来就足够了。"},
    {"title": "喝杯水，清爽一下 💧", "body": "唤醒身体和心情。"},
    {"title": "愿你有温暖晴朗的一天 ☀️", "body": "好运与你同在。"},
  ];

  static const List<Map<String, String>> zhEveningMessages = [
    {"title": "今天辛苦了 👏", "body": "现在可以好好休息了。"},
    {"title": "坚持到今天的你很了不起 🌟", "body": "给自己一些夸奖吧。"},
    {"title": "一天结束的时间 🌙", "body": "回想一件今天的好事吧。"},
    {"title": "剩下的交给明天 📦", "body": "现在休息最重要。"},
    {"title": "不完美也没关系 💛", "body": "今天的你已经足够好了。"},
    {"title": "晚安 😴", "body": "祝你有个好梦。"},
    {"title": "今天也前进了一步 👣", "body": "这样就足够了。"},
    {"title": "愿明天比今天更轻松一点 🌠", "body": "为你加油。"},
    {"title": "喝杯热茶，歇一歇 🍵", "body": "静静整理今天的时间。"},
    {"title": "对自己说声“辛苦了” 🗣️", "body": "大声说出来，真的很有力量。"},
  ];

  static const List<Map<String, String>> thMorningMessages = [
    {"title": "อรุณสวัสดิ์ ☀️", "body": "เริ่มต้นวันนี้อย่างเบาสบายกัน"},
    {"title": "เป็นกำลังใจให้คุณวันนี้ 🌟", "body": "ขอให้วันนี้สดใสกว่าเมื่อวาน"},
    {"title": "ยืดเส้นสักหน่อยไหม 🧘", "body": "ปลุกร่างกายด้วยการขยับเบาๆ"},
    {"title": "คุณยอดเยี่ยมกว่าที่คิด ✨", "body": "ใช้วันนี้อย่างมั่นใจ"},
    {"title": "ทีละก้าวก็พอ 👣", "body": "ไปในจังหวะของคุณเองได้เลย"},
    {"title": "หายใจลึกๆ สักครั้ง 🌿", "body": "ใจที่สงบสร้างวันที่ดี"},
    {"title": "วันใหม่ ความเป็นไปได้ใหม่ๆ 🚀", "body": "วันนี้จะมีเรื่องดีอะไรนะ"},
    {"title": "ตั้งเป้าหมายแค่อย่างเดียววันนี้ 📝", "body": "ทีละอย่างก็เพียงพอแล้ว"},
    {"title": "ดื่มน้ำสักแก้วให้สดชื่น 💧", "body": "ปลุกร่างกายและจิตใจ"},
    {"title": "ขอให้เป็นวันที่อบอุ่นสดใส ☀️", "body": "โชคดีอยู่ข้างคุณ"},
  ];

  static const List<Map<String, String>> thEveningMessages = [
    {"title": "วันนี้เหนื่อยหน่อยนะ 👏", "body": "ตอนนี้พักได้แล้ว"},
    {"title": "คุณที่ผ่านวันนี้มาได้เก่งมาก 🌟", "body": "ชื่นชมตัวเองหน่อย"},
    {"title": "ได้เวลาปิดท้ายวัน 🌙", "body": "นึกถึงเรื่องดีๆ สักเรื่องของวันนี้"},
    {"title": "ที่เหลือไว้พรุ่งนี้ 📦", "body": "ตอนนี้การพักสำคัญที่สุด"},
    {"title": "ไม่สมบูรณ์แบบก็ไม่เป็นไร 💛", "body": "วันนี้คุณทำดีพอแล้ว"},
    {"title": "ราตรีสวัสดิ์ 😴", "body": "ฝันดีนะ"},
    {"title": "วันนี้ก็ก้าวไปข้างหน้าหนึ่งก้าว 👣", "body": "แค่นั้นก็เพียงพอแล้ว"},
    {"title": "ขอให้พรุ่งนี้เบากว่าวันนี้ 🌠", "body": "เป็นกำลังใจให้"},
    {"title": "ชาร้อนสักถ้วย 🍵", "body": "เวลาทบทวนวันอย่างสงบ"},
    {"title": "บอกตัวเองว่า “เหนื่อยหน่อยนะ” 🗣️", "body": "พูดออกมาดังๆ มีพลังจริงๆ"},
  ];

  static const List<Map<String, String>> esMorningMessages = [
    {"title": "¡Buenos días! ☀️", "body": "Empecemos el día con calma."},
    {"title": "¡Te animo hoy! 🌟", "body": "Que hoy brille más que ayer."},
    {"title": "¿Estiramos un poco? 🧘", "body": "Despierta tu cuerpo con movimiento suave."},
    {"title": "Eres más increíble de lo que crees ✨", "body": "Disfruta el día con confianza."},
    {"title": "Paso a paso 👣", "body": "A tu propio ritmo está bien."},
    {"title": "Respira profundo 🌿", "body": "Una mente tranquila crea un buen día."},
    {"title": "Un nuevo día, nuevas posibilidades 🚀", "body": "Algo bueno puede pasar hoy."},
    {"title": "Sonríete en el espejo 😊", "body": "Una sonrisa atrae la buena suerte."},
  ];

  static const List<Map<String, String>> esEveningMessages = [
    {"title": "¡Buen trabajo hoy! 👏", "body": "Ahora puedes descansar."},
    {"title": "Lo lograste hoy 🌟", "body": "Date un reconocimiento."},
    {"title": "Hora de cerrar el día 🌙", "body": "Recuerda algo bueno de hoy."},
    {"title": "Lo demás puede esperar a mañana 📦", "body": "Descansar es lo más importante."},
    {"title": "No tienes que ser perfecto 💛", "body": "Hoy lo hiciste bien."},
    {"title": "¡Buenas noches! 😴", "body": "Dulces sueños."},
    {"title": "Hoy avanzaste un paso 👣", "body": "Eso es más que suficiente."},
    {"title": "Dite 'bien hecho' 🗣️", "body": "Dilo en voz alta, de verdad ayuda."},
  ];

  static const List<Map<String, String>> frMorningMessages = [
    {"title": "Bonjour ! ☀️", "body": "Commençons la journée en douceur."},
    {"title": "Je te soutiens aujourd'hui 🌟", "body": "Que ce jour brille plus qu'hier."},
    {"title": "Et si on s'étirait un peu ? 🧘", "body": "Réveille ton corps en douceur."},
    {"title": "Tu es plus formidable que tu ne le crois ✨", "body": "Profite de ta journée avec confiance."},
    {"title": "Un pas à la fois 👣", "body": "Ton rythme est parfait."},
    {"title": "Respire profondément 🌿", "body": "Un esprit calme fait une belle journée."},
    {"title": "Un nouveau jour, de nouvelles possibilités 🚀", "body": "Quelque chose de bien peut arriver."},
    {"title": "Souris-toi dans le miroir 😊", "body": "Un sourire attire la chance."},
  ];

  static const List<Map<String, String>> frEveningMessages = [
    {"title": "Beau travail aujourd'hui ! 👏", "body": "Maintenant tu peux te reposer."},
    {"title": "Tu as tenu bon aujourd'hui 🌟", "body": "Félicite-toi."},
    {"title": "L'heure de clore la journée 🌙", "body": "Repense à un bon moment d'aujourd'hui."},
    {"title": "Le reste peut attendre demain 📦", "body": "Se reposer est le plus important."},
    {"title": "Pas besoin d'être parfait 💛", "body": "Tu as bien fait aujourd'hui."},
    {"title": "Bonne nuit ! 😴", "body": "Fais de beaux rêves."},
    {"title": "Aujourd'hui tu as avancé d'un pas 👣", "body": "C'est déjà beaucoup."},
    {"title": "Dis-toi « bravo » 🗣️", "body": "Dis-le à voix haute, ça aide vraiment."},
  ];

  static const List<Map<String, String>> deMorningMessages = [
    {"title": "Guten Morgen! ☀️", "body": "Starten wir entspannt in den Tag."},
    {"title": "Ich drücke dir heute die Daumen 🌟", "body": "Möge heute heller strahlen als gestern."},
    {"title": "Wie wäre es mit etwas Dehnen? 🧘", "body": "Wecke deinen Körper sanft auf."},
    {"title": "Du bist großartiger, als du denkst ✨", "body": "Genieße den Tag mit Zuversicht."},
    {"title": "Schritt für Schritt 👣", "body": "Dein Tempo ist genau richtig."},
    {"title": "Atme einmal tief durch 🌿", "body": "Ein ruhiger Geist macht einen guten Tag."},
    {"title": "Ein neuer Tag, neue Möglichkeiten 🚀", "body": "Heute kann etwas Gutes passieren."},
    {"title": "Lächle dich im Spiegel an 😊", "body": "Ein Lächeln zieht Glück an."},
  ];

  static const List<Map<String, String>> deEveningMessages = [
    {"title": "Gut gemacht heute! 👏", "body": "Jetzt darfst du dich ausruhen."},
    {"title": "Du hast den Tag gemeistert 🌟", "body": "Lobe dich selbst."},
    {"title": "Zeit, den Tag abzuschließen 🌙", "body": "Erinnere dich an etwas Schönes von heute."},
    {"title": "Der Rest kann bis morgen warten 📦", "body": "Ausruhen ist jetzt am wichtigsten."},
    {"title": "Du musst nicht perfekt sein 💛", "body": "Du warst heute gut genug."},
    {"title": "Gute Nacht! 😴", "body": "Träum was Schönes."},
    {"title": "Heute bist du einen Schritt weiter 👣", "body": "Das ist mehr als genug."},
    {"title": "Sag dir „gut gemacht“ 🗣️", "body": "Sag es laut, es hilft wirklich."},
  ];

  static const List<Map<String, String>> ruMorningMessages = [
    {"title": "Доброе утро! ☀️", "body": "Начнём день легко и спокойно."},
    {"title": "Болею за тебя сегодня 🌟", "body": "Пусть сегодня сияет ярче, чем вчера."},
    {"title": "Как насчёт лёгкой разминки? 🧘", "body": "Разбуди тело мягким движением."},
    {"title": "Ты круче, чем думаешь ✨", "body": "Наслаждайся днём с уверенностью."},
    {"title": "Шаг за шагом 👣", "body": "Твой собственный темп — это нормально."},
    {"title": "Глубоко вдохни 🌿", "body": "Спокойный ум делает день хорошим."},
    {"title": "Новый день — новые возможности 🚀", "body": "Сегодня может случиться что-то хорошее."},
    {"title": "Улыбнись себе в зеркале 😊", "body": "Улыбка притягивает удачу."},
  ];

  static const List<Map<String, String>> ruEveningMessages = [
    {"title": "Отличная работа сегодня! 👏", "body": "Теперь можно отдохнуть."},
    {"title": "Ты справился с сегодняшним днём 🌟", "body": "Похвали себя."},
    {"title": "Время завершить день 🌙", "body": "Вспомни что-то хорошее из сегодняшнего дня."},
    {"title": "Остальное подождёт до завтра 📦", "body": "Сейчас важнее всего отдых."},
    {"title": "Не обязательно быть идеальным 💛", "body": "Сегодня ты был достаточно хорош."},
    {"title": "Спокойной ночи! 😴", "body": "Приятных снов."},
    {"title": "Сегодня ты сделал шаг вперёд 👣", "body": "Этого более чем достаточно."},
    {"title": "Скажи себе «молодец» 🗣️", "body": "Скажи вслух — это действительно помогает."},
  ];

  static const List<Map<String, String>> hiMorningMessages = [
    {"title": "सुप्रभात! ☀️", "body": "आइए दिन की शुरुआत आराम से करें।"},
    {"title": "आज आपके साथ हूँ 🌟", "body": "आज का दिन कल से ज्यादा चमके।"},
    {"title": "थोड़ा स्ट्रेच करें? 🧘", "body": "हल्की हलचल से शरीर को जगाएं।"},
    {"title": "आप सोच से कहीं ज्यादा शानदार हैं ✨", "body": "आत्मविश्वास के साथ दिन का आनंद लें।"},
    {"title": "एक-एक कदम 👣", "body": "अपनी गति से चलना बिल्कुल ठीक है।"},
    {"title": "एक गहरी सांस लें 🌿", "body": "शांत मन अच्छा दिन बनाता है।"},
    {"title": "नया दिन, नई संभावनाएं 🚀", "body": "आज कुछ अच्छा हो सकता है।"},
    {"title": "आईने में खुद को देखकर मुस्कुराएं 😊", "body": "मुस्कान सौभाग्य लाती है।"},
  ];

  static const List<Map<String, String>> hiEveningMessages = [
    {"title": "आज बहुत अच्छा किया! 👏", "body": "अब आप आराम कर सकते हैं।"},
    {"title": "आपने आज का दिन पूरा कर लिया 🌟", "body": "खुद की तारीफ करें।"},
    {"title": "दिन समाप्त करने का समय 🌙", "body": "आज की कोई अच्छी बात याद करें।"},
    {"title": "बाकी काम कल के लिए 📦", "body": "अभी आराम सबसे जरूरी है।"},
    {"title": "पूर्ण होना जरूरी नहीं 💛", "body": "आज आप काफी अच्छे थे।"},
    {"title": "शुभ रात्रि! 😴", "body": "मीठे सपने आएं।"},
    {"title": "आज आप एक कदम आगे बढ़े 👣", "body": "इतना ही काफी है।"},
    {"title": "खुद से कहें “शाबाश” 🗣️", "body": "जोर से कहें — सच में असर होता है।"},
  ];

  static Map<String, String> getRandomMorningMessage([String languageCode = 'ko']) {
    switch (languageCode) {
      case 'ko':
        return morningMessages[_random.nextInt(morningMessages.length)];
      case 'ja':
        return jaMorningMessages[_random.nextInt(jaMorningMessages.length)];
      case 'zh':
        return zhMorningMessages[_random.nextInt(zhMorningMessages.length)];
      case 'th':
        return thMorningMessages[_random.nextInt(thMorningMessages.length)];
      case 'es':
        return esMorningMessages[_random.nextInt(esMorningMessages.length)];
      case 'fr':
        return frMorningMessages[_random.nextInt(frMorningMessages.length)];
      case 'de':
        return deMorningMessages[_random.nextInt(deMorningMessages.length)];
      case 'ru':
        return ruMorningMessages[_random.nextInt(ruMorningMessages.length)];
      case 'hi':
        return hiMorningMessages[_random.nextInt(hiMorningMessages.length)];
      default:
        return enMorningMessages[_random.nextInt(enMorningMessages.length)];
    }
  }

  static Map<String, String> getRandomEveningMessage([String languageCode = 'ko']) {
    switch (languageCode) {
      case 'ko':
        return eveningMessages[_random.nextInt(eveningMessages.length)];
      case 'ja':
        return jaEveningMessages[_random.nextInt(jaEveningMessages.length)];
      case 'zh':
        return zhEveningMessages[_random.nextInt(zhEveningMessages.length)];
      case 'th':
        return thEveningMessages[_random.nextInt(thEveningMessages.length)];
      case 'es':
        return esEveningMessages[_random.nextInt(esEveningMessages.length)];
      case 'fr':
        return frEveningMessages[_random.nextInt(frEveningMessages.length)];
      case 'de':
        return deEveningMessages[_random.nextInt(deEveningMessages.length)];
      case 'ru':
        return ruEveningMessages[_random.nextInt(ruEveningMessages.length)];
      case 'hi':
        return hiEveningMessages[_random.nextInt(hiEveningMessages.length)];
      default:
        return enEveningMessages[_random.nextInt(enEveningMessages.length)];
    }
  }
}
