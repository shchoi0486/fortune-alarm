// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => 'おはようございます！素敵な一日を始めましょう。';

  @override
  String get missionWakeUp => '起床ミッション';

  @override
  String get missionSupplement => 'サプリメント摂取';

  @override
  String get missionWater => '水2L以上飲む';

  @override
  String get fortuneCookie => '幸運クッキー';

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get languageKorean => '韓国語';

  @override
  String get languageEnglish => '英語';

  @override
  String get languageJapanese => '日本語';

  @override
  String get languageChinese => '中国語';

  @override
  String get languageRussian => 'ロシア語';

  @override
  String get languageHindi => 'ヒンディー語';

  @override
  String get languageSpanish => 'スペイン語';

  @override
  String get languageFrench => 'フランス語';

  @override
  String get languageGerman => 'ドイツ語';

  @override
  String get alarm => 'アラーム';

  @override
  String get calendar => 'カレンダー';

  @override
  String get mission => 'ミッション';

  @override
  String get fortune => '運勢';

  @override
  String get congratulations => 'おめでとうございます！';

  @override
  String get allMissionsCompleted => '今日のミッション5つをすべて達成しました。';

  @override
  String get rewardReceived => '報酬としてフォーチュンクッキー1個を支給します！ 🥠';

  @override
  String get confirm => '確認';

  @override
  String get missionSuccess => 'ミッション成功！';

  @override
  String get cheeringMessage1 => '今日も一日楽しく過ごしましょう！';

  @override
  String get cheeringMessage2 => '今日のあなたを応援しています！';

  @override
  String get cheeringMessage3 => '今日も素敵な一日になるでしょう。';

  @override
  String get todaysCheering => '今日のメッセージ';

  @override
  String get notificationWakeUpBody => '起きる時間です！';

  @override
  String get notificationMissionBody => 'ミッションを遂行してアラームを止めてください！';

  @override
  String get notificationSafetyBody => 'アラームが強制終了されました！ミッションを完了してください。';

  @override
  String get notificationRingingBody => 'アラームが鳴っています！';

  @override
  String get snoozePrefix => '[スヌーズ]';

  @override
  String get exactAlarmPermissionRequired =>
      '正確な時間にアラームを鳴らすには、「正確なアラーム」権限が必要です。';

  @override
  String get overlayPermissionRequired => '全画面通知のために、「他のアプリの上に表示」権限が必要です。';

  @override
  String get deleteAllAlarms => 'すべてのアラームを削除';

  @override
  String get noAlarms => '登録されたアラームがありません。';

  @override
  String get lessThanAMinuteRemaining => '1分未満で鳴ります';

  @override
  String hoursMinutesRemaining(String hours, String minutes) {
    return '$hours時間$minutes分後に鳴ります';
  }

  @override
  String minutesRemaining(String minutes) {
    return '$minutes分後に鳴ります';
  }

  @override
  String get am => '午前';

  @override
  String get pm => '午後';

  @override
  String get dailyFortuneCookieReward => '今日のフォーチュンクッキー報酬';

  @override
  String get missionRewardInfo => 'ミッション5個成功で1個、10個成功で2個支給！';

  @override
  String get dailyMission => '今日のミッション';

  @override
  String goalAchieved(int completed) {
    return '🎉 $completed/5 目標達成！';
  }

  @override
  String missionProgress(int completed) {
    return '$completed/5 達成';
  }

  @override
  String get myMissionRecord => 'マイミッション記録';

  @override
  String get consecutiveSuccess => '連続成功';

  @override
  String get successRate30Days => '成功率(30日)';

  @override
  String get totalSuccess => '総成功';

  @override
  String get inProgress => '挑戦中 🔥';

  @override
  String get resetMissions => 'ミッション初期化';

  @override
  String get resetMissionsConfirm => 'すべての挑戦リストを初期化しますか？\n（基本システムミッションを除く）';

  @override
  String get cancel => 'キャンセル';

  @override
  String get reset => '初期化';

  @override
  String get addMission => 'ミッション追加';

  @override
  String get completedMissions => '完了したミッション';

  @override
  String get noCompletedMissionsHint => 'まだ完了したミッションがありません。今日の目標を達成しましょう。';

  @override
  String greeting(String userName) {
    return 'こんにちは、$userNameさん';
  }

  @override
  String get welcomeFortune => '神秘的な運勢の世界へようこそ';

  @override
  String get luckyColor => 'ラッキーカラー';

  @override
  String get luckyItem => 'ラッキーアイテム';

  @override
  String get luckyDirection => '吉方位';

  @override
  String get viewVariousFortunes => '運勢一覧';

  @override
  String get todaysRecommendation => '今日のおすすめ';

  @override
  String get checkTodaysFortune => '今日の運勢を占う';

  @override
  String get todaysAdvice => '今日のアドバイス';

  @override
  String get viewSpecificDateFortune => '日付を指定して占う';

  @override
  String get luckyNumberRecommendation => 'ラッキーナンバーのおすすめ';

  @override
  String get luckyNumber => 'ラッキーナンバー';

  @override
  String get specificDateFortune => '指定日の運勢';

  @override
  String get specialDayFortune => '特別な日の運勢';

  @override
  String get newYearFortune => '新年の運勢';

  @override
  String get totalFortune2026 => '2026年の運勢';

  @override
  String get traditionalFortune => '土亭秘訣（トジョンビギョル）';

  @override
  String get traditionalSaju => '伝統的な四柱推命';

  @override
  String get faceReading => '観相（人相）占い';

  @override
  String get missionFaceReading => '観相ミッション';

  @override
  String get faceFate => '顔の観相と運命';

  @override
  String get compatibility => '相性占い';

  @override
  String get relationshipHarmony => '縁の調和';

  @override
  String get ohaengWood => '木';

  @override
  String get ohaengFire => '火';

  @override
  String get ohaengEarth => '土';

  @override
  String get ohaengMetal => '金';

  @override
  String get ohaengWater => '水';

  @override
  String get ohaengWoodSymbol => '木';

  @override
  String get ohaengFireSymbol => '火';

  @override
  String get ohaengEarthSymbol => '土';

  @override
  String get ohaengMetalSymbol => '金';

  @override
  String get ohaengWaterSymbol => '水';

  @override
  String get ohaengWoodExplanation =>
      '木（木）の気が強いあなたは、成長と意欲に溢れ、人情深く進取的な傾向を持っています。';

  @override
  String get ohaengFireExplanation =>
      '火（火）の気が強いあなたは、情熱的で礼儀正しく、活発で華やかなものを好む傾向があります。';

  @override
  String get ohaengEarthExplanation =>
      '土（土）の気が強いあなたは、信頼と包容力があり、重厚で変わらない傾向を持っています。';

  @override
  String get ohaengMetalExplanation =>
      '金（金）の気が強いあなたは、決断力と義理があり、冷静で原則を重視する傾向を持っています。';

  @override
  String get ohaengWaterExplanation =>
      '水（水）の気が強いあなたは、知恵と柔軟性があり、聡明で適応力に優れた傾向を持っています。';

  @override
  String get cheonganGap => '甲';

  @override
  String get cheonganEul => '乙';

  @override
  String get cheonganByeong => '丙';

  @override
  String get cheonganJeong => '丁';

  @override
  String get cheonganMu => '戊';

  @override
  String get cheonganGi => '己';

  @override
  String get cheonganGyeong => '庚';

  @override
  String get cheonganSin => '辛';

  @override
  String get cheonganIm => '壬';

  @override
  String get cheonganGye => '癸';

  @override
  String get jijiJa => '子';

  @override
  String get jijiChuk => '丑';

  @override
  String get jijiIn => '寅';

  @override
  String get jijiMyo => '卯';

  @override
  String get jijiJin => '辰';

  @override
  String get jijiSa => '巳';

  @override
  String get jijiO => '午';

  @override
  String get jijiMi => '未';

  @override
  String get jijiSin => '申';

  @override
  String get jijiYu => '酉';

  @override
  String get jijiSul => '戌';

  @override
  String get jijiHae => '亥';

  @override
  String get jijiAnimalRat => '子（ねずみ）';

  @override
  String get jijiAnimalOx => '丑（うし）';

  @override
  String get jijiAnimalTiger => '寅（とら）';

  @override
  String get jijiAnimalRabbit => '卯（うさぎ）';

  @override
  String get jijiAnimalDragon => '辰（たつ）';

  @override
  String get jijiAnimalSnake => '巳（へび）';

  @override
  String get jijiAnimalHorse => '午（うま）';

  @override
  String get jijiAnimalSheep => '未（ひつじ）';

  @override
  String get jijiAnimalMonkey => '申（さる）';

  @override
  String get jijiAnimalRooster => '酉（とり）';

  @override
  String get jijiAnimalDog => '戌（いぬ）';

  @override
  String get jijiAnimalPig => '亥（い）';

  @override
  String get assetDefaultBackground => '標準背景';

  @override
  String get assetFortuneyFriends => '幸運な友達';

  @override
  String get assetMongchuny => 'モンチュニー';

  @override
  String get assetPanchuny => 'パンチュニー';

  @override
  String get assetTochuny => 'トチュニー';

  @override
  String get assetHochuny => 'ホチュニー';

  @override
  String get assetBear => 'クマ';

  @override
  String get assetMoon => '月';

  @override
  String get assetBridge => '橋';

  @override
  String get assetRoad => '道';

  @override
  String get assetSky => '空';

  @override
  String get assetMinimalGray => 'ミニマルグレー';

  @override
  String get assetDarkMode => 'ダークモード';

  @override
  String get assetSoftBlue => 'ソフトブルー';

  @override
  String get assetWarmBeige => 'ウォームベージュ';

  @override
  String assetCat(int number) {
    return '猫 $number';
  }

  @override
  String assetDog(int number) {
    return '犬 $number';
  }

  @override
  String assetSea(int number) {
    return '海 $number';
  }

  @override
  String get categoryCharacter => 'キャラクター';

  @override
  String get categoryAnimal => '動物';

  @override
  String get categoryIllustration => 'イラスト';

  @override
  String get categoryLandscape => '風景';

  @override
  String get categorySimple => 'シンプル';

  @override
  String get alarmBackground => 'アラームの背景';

  @override
  String get random => 'ランダム';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get selectSolidColor => '単色を選択';

  @override
  String get deleteColor => '色を削除';

  @override
  String get deleteColorConfirm => 'この色をリストから削除してもよろしいですか？';

  @override
  String get deleteMission => 'ミッションを削除';

  @override
  String get deleteMissionConfirm => 'このミッションを削除してもよろしいですか？';

  @override
  String get randomBackgroundDesc => 'アラーム가鳴るたびに新しい背景に！';

  @override
  String get backgroundDeleted => '背景画像が削除されました。';

  @override
  String get pickFromDevice => 'デバイスから選択';

  @override
  String get alarmSaveError => 'アラームの保存に失敗しました。不明なエラーが発生しました。';

  @override
  String errorOccurred(String error) {
    return 'エラーが発生しました: $error';
  }

  @override
  String get openSettings => '設定を開く';

  @override
  String get videoLoadFailed => 'ビデオの読み込みに失敗しました\nタップして再試行';

  @override
  String get itsTimeToWakeUp => '起きる時間です！';

  @override
  String get dismissAlarm => 'アラームを解除';

  @override
  String get slideToDismiss => 'スライドして解除';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes分 x $count回';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '$minutes分, 無制限';
  }

  @override
  String get noActiveAlarms => '有効なアラームはありません';

  @override
  String get wealth => '財運';

  @override
  String get love => '恋愛運';

  @override
  String get career => '仕事運';

  @override
  String get health => '健康運';

  @override
  String get faceAnalysisBasic => '顔分析 (基本)';

  @override
  String get insufficientDataOverallImpression =>
      '測定データが不足しているため、全体的な印象に基づいて解釈されました。';

  @override
  String get noseStabilityWealthAccuracy => '鼻の輪郭の安定性は、財運解釈の精度を高めます。';

  @override
  String get mouthClarityInterpersonalAccuracy =>
      '口の輪郭の鮮明さは、対人運と言語運の解釈を洗練させます。';

  @override
  String get improveAnalysisQualityAdvice => 'より明るい照明で正面を向くと、分析の質が向上します。';

  @override
  String get basicAnalysisDescription =>
      '顔の輪郭や表情の測定が不十分なため、この結果は基本的な解釈として表示されます。\n目の開き、鼻の輪郭、口元の領域などの指標の安定性は、正面を向き、より良い照明を当てることで向上します。\n再試行すると、スコアの分布や説明がより具体的になります。';

  @override
  String get defaultDailyFortune =>
      '今日は穏やかな心で一日を始めるのに良い日です。\n鏡の前で笑顔になり、ポジティブなエネルギーで自分を満たしてください。\n少しの余裕が予期せぬ幸運をもたらします。';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '$vibe今日、あなたの$topKeyが最も際立っています。一方、$bottomKeyは注意が必要なようです。';
  }

  @override
  String get faceShapeVLine => 'Vライン';

  @override
  String get faceShapeSquare => '四角形';

  @override
  String get faceShapeBalanced => 'バランス型';

  @override
  String get faceShapeRound => '丸型';

  @override
  String get faceShapeLong => '面長';

  @override
  String get faceShapeOval => '卵型';

  @override
  String get titleWealthOriented => '財運に恵まれた顔';

  @override
  String get titleLoveStrong => '強い恋愛運を持つ顔';

  @override
  String get titleCareerNotable => '顕著な仕事運を持つ顔';

  @override
  String get titleStableEnergy => '安定したエネルギーの顔';

  @override
  String get faceAnalysisComplete => '顔分析が完了しました！';

  @override
  String get chooseUnlockMethod => 'あなたの顔に隠された運勢を確認するには、\n以下の方法のいずれかを選択してください。';

  @override
  String get watchAdForFreeResult => '広告を見て無料で結果を確認';

  @override
  String get useTwoCookies => 'フォーチュンクッキーを2個使用';

  @override
  String get checkResult => '結果を確認';

  @override
  String get aiAnalyzingFace => 'AIが顔を分析しています...';

  @override
  String get faceRecognitionComplete => '顔認識完了';

  @override
  String get extractingFeatures => '特徴を抽出中...';

  @override
  String get matchingFortuneData => '運勢データと照合中...';

  @override
  String get adLoadFailedFreeUnlock => '広告の読み込みに失敗したため、今回は無料でロックを解除しました。';

  @override
  String get insufficientCookies => 'クッキーが不足しています';

  @override
  String get insufficientCookiesDesc => 'フォーチュンクッキーが足りません。\n広告を見て無料で確認しましょう！';

  @override
  String get usingTwoCookiesToast => 'フォーチュンクッキーを2個使用して結果を確認します。';

  @override
  String get todaysFaceAnalysis => '今日の顔分析';

  @override
  String totalScoreWithPoints(int score) {
    return '合計スコア $score点';
  }

  @override
  String get adLoadFailFreeAccess => '広告の読み込みに失敗しました。今回は無料でロックを解除しました。';

  @override
  String get insufficientCookiesTitle => 'フォーチュンクッキーが不足しています';

  @override
  String get insufficientCookiesMessage =>
      'フォーチュンクッキーが足りません。\nミッションをクリアするか、広告を見て獲得できます。';

  @override
  String get useCookiesSnackbar => 'フォーチュンクッキーを2個使用して結果を確認します。';

  @override
  String get faceAnalysisComplete_v2 => '顔分析が完了しました！';

  @override
  String get chooseMethodToViewResult =>
      'あなたの顔に隠された運勢を確認するには、\n以下の方法のいずれかを選択してください。';

  @override
  String get watchAdForFree => '広告を見て無料で結果を確認';

  @override
  String get useTwoCookies_v2 => 'クッキーを2枚使う';

  @override
  String get viewResult => '結果を見る';

  @override
  String get aiAnalyzingFace_v2 => 'AIが顔を解析しています...';

  @override
  String get faceRecognitionComplete_v2 => '認識が完了しました';

  @override
  String get extractingFeatures_v2 => '特徴を抽出しています...';

  @override
  String get matchingFortuneData_v2 => 'データを照合しています...';

  @override
  String get wealthLuck => '💰 財運';

  @override
  String get loveLuck => '❤️ 恋愛運';

  @override
  String get careerLuck => '💼 仕事運';

  @override
  String get healthLuck => '💪 健康運';

  @override
  String get tojeongMonthlyGood_0 =>
      '東の方から貴人が現れ、うれしい知らせを持ってきます。待ち望んでいた計画が実を結ぶでしょう。';

  @override
  String get tojeongMonthlyGood_1 => '財物が泉のように湧き出ます。すべてのことが順調に進み、悩みも消えるでしょう。';

  @override
  String get tojeongMonthlyGood_2 => '努力が実を結び、お祝いを受けることになります。昇進や大きな成果が期待されます。';

  @override
  String get tojeongMonthlyGood_3 => '暗い夜が明けて朝日が昇ります。苦労が終わり、幸せが訪れるでしょう。';

  @override
  String get tojeongMonthlyGood_4 =>
      '思わぬ横財運があり、懐が豊かになります。小さな投資が大きな利益となって戻ってきます。';

  @override
  String get tojeongMonthlyNeutral_0 => '穏やかな日常が続きます。特別な出来事なく、無難に過ぎる時期です。';

  @override
  String get tojeongMonthlyNeutral_1 => '足るを知る心を持てば、心が安らかになります。小さな幸せを享受してください。';

  @override
  String get tojeongMonthlyNeutral_2 => '忙しい日常の中でしばらく休息をとってください。健康管理に気を使う時期です。';

  @override
  String get tojeongMonthlyNeutral_3 => '新しいことを始めるよりは、現在のことを守り維持する方が有利です。';

  @override
  String get tojeongMonthlyNeutral_4 =>
      'コミュニケーションが重要です。言葉一言に注意すれば、誤解を避けることができます。';

  @override
  String get tojeongMonthlyCaution_0 => 'すべてのことに慎重を期してください。石橋も叩いて渡る姿勢が必要です。';

  @override
  String get tojeongMonthlyCaution_1 => '健康に特に留意し、無理な活動は避けるのが良いでしょう。';

  @override
  String get tojeongMonthlyCaution_2 =>
      '口説に巻き込まれないように注意してください。他人の仕事に深く関与しない方がいいです。';

  @override
  String get tojeongMonthlyCaution_3 => '過度な欲心は災いを呼びます。分相応に生活すれば大きな問題はありません。';

  @override
  String get tojeongMonthlyCaution_4 => '金銭取引は避けてください。信じていた人に失望することがあります。';

  @override
  String get tojeongMonthlySpecial_1_0 => '新年の清らかな気が共にあります。計画したことが順調に始まります。';

  @override
  String get tojeongMonthlySpecial_1_1 => '年の初めに助けてくれる人が現れます。人間関係を大切にしてください。';

  @override
  String get tojeongMonthlySpecial_1_2 =>
      'モチベーションが高すぎると、間違ったことをしてしまう可能性があります。長期的な視点で冷静に計画を見直しましょう。';

  @override
  String get tojeongMonthlySpecial_1_3 =>
      '始まりは半分終わった。後回しにしていたことに思い切って取り組んでみると、思わぬ成果が得られるでしょう。';

  @override
  String get tojeongMonthlySpecial_1_4 =>
      '習慣を少し変えるだけで、運気の流れが変わることがあります。早起きする習慣をつけましょう。';

  @override
  String get tojeongMonthlySpecial_2_0 => 'まだ時期ではありません。実力を蓄え、時機を待ってください。';

  @override
  String get tojeongMonthlySpecial_2_1 => '過去の問題が再び浮上することがあります。正面から解決してください。';

  @override
  String get tojeongMonthlySpecial_2_2 =>
      '表面的なパフォーマンスよりも、中身を構築することが重要な時期です。性急な動きは損傷を引き起こす可能性があります。';

  @override
  String get tojeongMonthlySpecial_2_3 =>
      '冬の終わりに春を待つのと同じように、忍耐強く準備をしている人にはチャンスがやって来ます。';

  @override
  String get tojeongMonthlySpecial_2_4 => '周囲の騒音に邪魔されず、静かに自分の道を歩まなければなりません。';

  @override
  String get tojeongMonthlySpecial_3_0 => '万物が蘇る時期です。躊躇せずに挑戦してみてください。';

  @override
  String get tojeongMonthlySpecial_3_1 => '新しい縁が始まることがあります。肯定的な心が良い結果をもたらします。';

  @override
  String get tojeongMonthlySpecial_3_2 =>
      '変化の風の中で集中力を失いがちです。些細な感情の変化に振り回されないように、心をコントロールしましょう。';

  @override
  String get tojeongMonthlySpecial_3_3 =>
      '大地を突き破る新芽のように、あなたの可能性が爆発する時です。自信を持ってください。';

  @override
  String get tojeongMonthlySpecial_3_4 => '大切なご縁があなたに訪れるので、心の扉を開いて人々を歓迎してください。';

  @override
  String get tojeongMonthlySpecial_4_0 => '暖かい風と共に財物運が上昇します。努力が経済的な補償につながります。';

  @override
  String get tojeongMonthlySpecial_4_1 => '契約や試験で良い結果があります。几帳面に検討してください。';

  @override
  String get tojeongMonthlySpecial_4_2 =>
      '予期せぬ出費が発生する場合もありますので、金銭管理には特に注意が必要です。';

  @override
  String get tojeongMonthlySpecial_4_3 =>
      '満開の花のようにあなたの魅力が際立つ月です。対人関係においては主導権を握りましょう。';

  @override
  String get tojeongMonthlySpecial_4_4 => '富に恵まれるので、投資や貯蓄を増やすのに良い時期です。';

  @override
  String get tojeongMonthlySpecial_5_0 => '家の中が和気藹々とし、安定と喜びが溢れます。';

  @override
  String get tojeongMonthlySpecial_5_1 => '他人に施した親切が福となって戻ってくる時期です。';

  @override
  String get tojeongMonthlySpecial_5_2 =>
      'ちょっとした誤解から、身近な人と喧嘩が起きる可能性があります。逆姿勢が必要です。';

  @override
  String get tojeongMonthlySpecial_5_3 =>
      '家族月間なので、家族と過ごす時間を大切にしてください。家族の調和はすべての基礎です。';

  @override
  String get tojeongMonthlySpecial_5_4 =>
      '安心して周りを見回してみると、見逃していた大切なものが見つかるかもしれません。';

  @override
  String get tojeongMonthlySpecial_6_0 => '努力が認められます。昇進や名誉を得る機会があります。';

  @override
  String get tojeongMonthlySpecial_6_1 => '活動的なエネルギーが強いです。拡張や変化を模索するのも良いでしょう。';

  @override
  String get tojeongMonthlySpecial_6_2 =>
      'あまり先へ進みすぎると、トラブルに巻き込まれる可能性があります。謙虚さを保ち、周りを見渡してください。';

  @override
  String get tojeongMonthlySpecial_6_3 =>
      '暑さが始まる前にスタミナを蓄えておく必要があります。健康診断を受けてみるのも良いでしょう。';

  @override
  String get tojeongMonthlySpecial_6_4 => '中間レビューに時間をかけて上半期を終え、下半期の計画を立てましょう。';

  @override
  String get tojeongMonthlySpecial_7_0 => '情熱が成果につながります。果敢な行動が目標達成を早めます。';

  @override
  String get tojeongMonthlySpecial_7_1 => '旅先で助っ人に会ったり、新しい機会を発見したりします。';

  @override
  String get tojeongMonthlySpecial_7_2 => '健康を害しやすい時期です。過労を避け、十分な休息をとることが大切です。';

  @override
  String get tojeongMonthlySpecial_7_3 => '炎天下でもたゆまぬ情熱が必要です。汗をかいた分だけ結果が出ます。';

  @override
  String get tojeongMonthlySpecial_7_4 =>
      '休息を通じてエネルギーを充電する時間を取りましょう。長い旅は幸運をもたらします。';

  @override
  String get tojeongMonthlySpecial_8_0 => '忍耐の末に甘い実を結びます。運が少しずつ開け始めます。';

  @override
  String get tojeongMonthlySpecial_8_1 => '古い悩みが解決の糸口を見つけます。知恵を発揮してください。';

  @override
  String get tojeongMonthlySpecial_8_2 => '成果が出ると油断しがちです。最後まで緊張感を緩めないでください。';

  @override
  String get tojeongMonthlySpecial_8_3 =>
      '実りの季節に向けてラストスパートの時期が来た。リラックスしないでください。';

  @override
  String get tojeongMonthlySpecial_8_4 =>
      '思わぬ救いの手がある。困ったことがあれば、周りの人にアドバイスを求めてください。';

  @override
  String get tojeongMonthlySpecial_9_0 => '収穫の季節のように財物と愛が豊かになります。';

  @override
  String get tojeongMonthlySpecial_9_1 => '努力した分、それ以上の結果を得られる幸運な時期です。';

  @override
  String get tojeongMonthlySpecial_9_2 =>
      'たくさんのものが入ってくるのと同じように、たくさんのものが出ていく可能性があります。賢明な支出計画が必要です。';

  @override
  String get tojeongMonthlySpecial_9_3 =>
      '黄金の野原のように豊かな時代です。あなたが与える心を持っていれば、より大きな祝福があなたに訪れるでしょう。';

  @override
  String get tojeongMonthlySpecial_9_4 => 'これは誤解や対立を解決する良い機会です。まずは手を差し伸べてください。';

  @override
  String get tojeongMonthlySpecial_10_0 => '名誉が高まり、名前が知られるようになります。';

  @override
  String get tojeongMonthlySpecial_10_1 => '知的な活動で大きな成果があります。学業に集中してください。';

  @override
  String get tojeongMonthlySpecial_10_2 =>
      '地位が上がると責任も重くなります。自分の言葉や行動には注意しなければなりません。';

  @override
  String get tojeongMonthlySpecial_10_3 =>
      'あなたの名声は高く青い空のように高まります。自分の能力を最大限に発揮してください。';

  @override
  String get tojeongMonthlySpecial_10_4 => '今月は、深い熟考と読書を通じて内なる知恵を築くのに最適な月です。';

  @override
  String get tojeongMonthlySpecial_11_0 => '知恵を蓄え、振り返る時間です。未来のために準備してください。';

  @override
  String get tojeongMonthlySpecial_11_1 => '金銭的に安定しますが、無理な投資は禁物です。';

  @override
  String get tojeongMonthlySpecial_11_2 =>
      '人間関係の中で孤独を感じるかもしれません。まず、広い心で人々に接するように努力する必要があります。';

  @override
  String get tojeongMonthlySpecial_11_3 =>
      '冷たい風が吹いたときに襟を調整するのと同じように、実用性を重視し、内面の強さを強化する必要があります。';

  @override
  String get tojeongMonthlySpecial_11_4 =>
      '一年の締めくくりに、自分たちに何が足りなかったのかを振り返り、来年に備える知恵が必要です。';

  @override
  String get tojeongMonthlySpecial_12_0 => '年末に思わぬ幸運が訪れます。うれしい知らせを待ってみてください。';

  @override
  String get tojeongMonthlySpecial_12_1 => 'これまでの努力が報われます。有終の美を飾る時期です。';

  @override
  String get tojeongMonthlySpecial_12_2 =>
      '頻繁に集まると健康を害したり、不必要な出費につながる可能性があるため、節度が必要です。';

  @override
  String get tojeongMonthlySpecial_12_3 =>
      '終わりは新たな始まりです。後悔するのではなく、希望に満ちた将来を計画して一年を締めくくりましょう。';

  @override
  String get tojeongMonthlySpecial_12_4 =>
      '温かい分かち合いを実践すると、その温かさが幸運となってあなたに戻ってきます。';

  @override
  String get todaysFaceFortune => '今日の顔占い';

  @override
  String get detailedAnalysis => '詳細分析';

  @override
  String get eyeInsight => '👁️ 目 (洞察力)';

  @override
  String get noseWealth => '👃 鼻 (財運)';

  @override
  String get mouthLateLuck => '👄 口 (晩年運)';

  @override
  String get overallAnalysisTitle => '総合分析';

  @override
  String get shareResultTitle => '今日の顔分析結果';

  @override
  String shareResultDesc(String title) {
    return 'AI顔分析結果。\n$title';
  }

  @override
  String get shareResultTotalScore => '合計スコア';

  @override
  String get shareResultWealth => '財運';

  @override
  String get shareResultLove => '恋愛運';

  @override
  String get shareResultCareer => '仕事運';

  @override
  String get shareResultHealth => '健康運';

  @override
  String get shareResultText => '結果を共有';

  @override
  String get wakeUpComplete => '起床完了！';

  @override
  String get collapseOptions => 'オプションを閉じる';

  @override
  String get expandOptions => '詳細オプション';

  @override
  String get snoozeAlarm => 'スヌーズ';

  @override
  String get interval => '間隔';

  @override
  String get maxSnoozeCount => '最大スヌーズ回数';

  @override
  String get unlimited => '無制限';

  @override
  String get permissionRequired => '権限が必要';

  @override
  String get exactAlarmFailMessage =>
      'アラームの登録に失敗しました。正確なアラーム権限がオフになっているため、設定が必要です。';

  @override
  String get batteryOptimFailMessage => 'アラームの登録に失敗しました。バッテリー最適化の例外権限がありません。';

  @override
  String get overlayFailMessage => 'アラームの登録に失敗しました。他のアプリの上に表示する権限がありません。';

  @override
  String get loadingDelay => '読み込みの遅延';

  @override
  String get loading => '読み込み中...';

  @override
  String get previewFail => 'プレビューに失敗しました';

  @override
  String get bgDefault => 'デフォルト背景';

  @override
  String get bgFortuneFriends => 'フォーチュニーフレンズ';

  @override
  String get bgMongChuni => 'モンチュニー';

  @override
  String get bgPanChuni => 'パンチュニー';

  @override
  String get bgToChuni => 'トチュニー';

  @override
  String get bgHoChuni => 'ホチュニー';

  @override
  String get bgBear => 'クマ';

  @override
  String get bgMoon => '月';

  @override
  String get bgSea => '海';

  @override
  String get bgBridge => '橋';

  @override
  String get bgRoad => '道路';

  @override
  String get bgSky => '空';

  @override
  String get bgMinimalGray => 'ミニマルグレー';

  @override
  String get bgDarkMode => 'ダークモード';

  @override
  String get bgSoftBlue => 'ソフトブルー';

  @override
  String get bgWarmBeige => 'ウォームベージュ';

  @override
  String get dateFormatMdyE => 'MMM d日 (E)';

  @override
  String get deleteAlarm => 'アラームを削除';

  @override
  String get confirmDelete => '本当に削除しますか？';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get wealthLuckWithIcon => '💰 財運';

  @override
  String get loveLuckWithIcon => '❤️ 恋愛運';

  @override
  String get careerLuckWithIcon => '💼 仕事運';

  @override
  String get healthLuckWithIcon => '💪 健康運';

  @override
  String get mouthFortune => '👄 口 (晩年運)';

  @override
  String get comprehensiveAnalysis => '総合分析';

  @override
  String get todaysFaceResult => '今日の顔分析結果';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'AI顔分析結果です。\n$title';
  }

  @override
  String get shareResult => '結果を共有';

  @override
  String get faceVibeSmile0 => '口元の明るい笑顔が、周りにポジティブなエネルギーを広げています。';

  @override
  String get faceVibeSmile1 => '明るく咲いた笑顔から、今日の明るいエネルギーが感じられます。';

  @override
  String get faceVibeSmile2 => '柔らかな口元のラインが、貴人を呼ぶ魅力的なエネルギーを放っています。';

  @override
  String get faceVibeSmile3 => '自信に満ちた笑顔は、今日のどんな障害も簡単に解決する鍵となるでしょう。';

  @override
  String get faceVibeSmile4 => '爽やかな笑顔のおかげで、滞っていたエネルギーが解消され、幸運が舞い込む準備が整いました。';

  @override
  String get faceVibeEye0 => 'キラキラした目から、今日をリードする強い意志が感じられます。';

  @override
  String get faceVibeEye1 => '鋭い目は、鋭い判断力と直感を予見しています。';

  @override
  String get faceVibeEye2 => '澄んだ深い目は、誠実なエネルギーで朗報を待っています。';

  @override
  String get faceVibeEye3 => 'まっすぐ前を見つめる堂々とした眼差しが、今日のあなたの存在感を高めるでしょう。';

  @override
  String get faceVibeEye4 => '目の中の情熱は、周囲の人々に強い信頼を与える一日です。';

  @override
  String get faceVibeNeutral0 => '全体的に、穏やかで安定した顔のエネルギーが心の安らぎをもたらします。';

  @override
  String get faceVibeNeutral1 => '落ち着いた顔立ちは、慎重で賢明なエネルギーを示しています。';

  @override
  String get faceVibeNeutral2 => 'バランスの取れた顔の調和は、波乱のない今日一日の平穏を象徴しています。';

  @override
  String get faceVibeNeutral3 => '真剣な雰囲気の顔は、今日の重要な決断を下すのに最適です。';

  @override
  String get faceVibeNeutral4 => '心地よい顔のエネルギーは周囲の人々に安心感を与えるため、協力がうまくいくでしょう。';

  @override
  String get dailyFortuneWealth0 => '鼻のエネルギーがしっかりしているので、小さな整理と検証が金運の流れを大きくします。';

  @override
  String get dailyFortuneWealth1 =>
      '財白宮（鼻）に力が宿る日です。急いでいるときほど、もう一度計算すれば利益が残ります。';

  @override
  String get dailyFortuneWealth2 =>
      '顔の中心である鼻のエネルギーが良いので、一歩一歩慎重に進むことが予期せぬ結果につながります。';

  @override
  String get dailyFortuneWealth3 => '金運に恵まれた顔立ちです。意外な場所で小さな利益が発生する流れです。';

  @override
  String get dailyFortuneWealth4 => '小鼻の活力が良いので、経済感覚が鋭くなります。投資や購入の決定に有利な日です。';

  @override
  String get dailyFortuneWealth5 =>
      'お金を呼ぶエネルギーが強いです。財布を整理したり、銀行の明細を確認したりすると運がついてきます。';

  @override
  String get dailyFortuneWealth6 => '財庫が着実に満たされる顔です。誠実な努力が実を結び始めています。';

  @override
  String get dailyFortuneWealth7 =>
      '安定した金運が入ってきています。大きな支出よりも継続的な貯蓄がさらに運気を高めます。';

  @override
  String get dailyFortuneWealth8 => '経済的なチャンスを捉える目が輝いています。周囲の情報に耳を傾けてみてください。';

  @override
  String get dailyFortuneWealth9 =>
      '顔に豊かなエネルギーが満ちています。分かち合う心がより大きな富として戻ってくる不思議な日です。';

  @override
  String get dailyFortuneLove0 => '口角のエネルギーが柔らかいので、まず一言声をかければ関係がほぐれます。';

  @override
  String get dailyFortuneLove1 => '言葉を込める口元が整っています。真心を持って接することで誤解を減らせます。';

  @override
  String get dailyFortuneLove2 => '明るい顔色は貴人のエネルギーを引き寄せます。小さな配慮が大きな縁となって戻ってきます。';

  @override
  String get dailyFortuneLove3 =>
      '人を惹きつける魅力が際立つ日です。新しい出会いからポジティブなエネルギーを得られるでしょう。';

  @override
  String get dailyFortuneLove4 => '対人関係のエネルギーが澄んでいるので、葛藤が解消され調和が保たれます。';

  @override
  String get dailyFortuneLove5 => '口元の柔らかさが相手の心を開きます。今日は聞き役に徹することが最高の会話術です。';

  @override
  String get dailyFortuneLove6 => '周囲から助けを得られる顔です。一人で悩まず、アドバイスを求めてみてください。';

  @override
  String get dailyFortuneLove7 => '誠実な眼差しが信頼を築きます。約束を大切にすれば、より大きな縁が届くでしょう。';

  @override
  String get dailyFortuneLove8 => '家庭や職場に調和のエネルギーが満ちています。笑い声が絶えない一日になるでしょう。';

  @override
  String get dailyFortuneLove9 => '縁の糸が美しく解ける日です。大切な人々に感謝の気持ちを伝えてみてください。';

  @override
  String get dailyFortuneCareer0 => '眼光が鋭いので、優先順位を絞れば集中力が成果に変わります。';

  @override
  String get dailyFortuneCareer1 => '観察力が際立つ目元です。今日は決断はシンプルに、実行は着実に行うのが良いでしょう。';

  @override
  String get dailyFortuneCareer2 =>
      '額と目のエネルギーが澄んでいるので、今日は任された仕事を最後までやり遂げる力が大きいです。';

  @override
  String get dailyFortuneCareer3 => 'リーダーシップを発揮する顔です。あなたの意見が周囲に大きな影響を与えるでしょう。';

  @override
  String get dailyFortuneCareer4 => '判断力が最高潮に達する日です。複雑な問題も明快に解決できるでしょう。';

  @override
  String get dailyFortuneCareer5 => '業務処理が的確で周囲から認められます。昇進や成果へのエネルギーが強いです。';

  @override
  String get dailyFortuneCareer6 =>
      '新しいプロジェクトや仕事を始めるのに最適なエネルギーです。自信を持って挑戦してください。';

  @override
  String get dailyFortuneCareer7 => '業務効率が大幅に上がる日です。後回しにしていた仕事を処理するのに適しています。';

  @override
  String get dailyFortuneCareer8 => '独創的なアイデアが湧き出る目です。メモを取る習慣が幸運を呼びます。';

  @override
  String get dailyFortuneCareer9 => '粘り強さと忍耐が光る日です。最後まで集中すれば、大きな報酬が続くでしょう。';

  @override
  String get dailyFortuneHealth0 => '顔色全体が安定しているので、リズムを整えればコンディションがすぐに回復します。';

  @override
  String get dailyFortuneHealth1 => '顔の活力が際立っています。無理をせずテンポを維持すれば、一日が快適になります。';

  @override
  String get dailyFortuneHealth2 => '目と肌のエネルギーが澄んでいるので、短い休息が集中力と気分を同時に高めます。';

  @override
  String get dailyFortuneHealth3 => '身体のリズムが最高の調和を成しています。軽い運動がエネルギーをより鮮明にします。';

  @override
  String get dailyFortuneHealth4 =>
      '充電されたエネルギーが顔に満ちています。今日は疲れを知らずに楽しく過ごせるでしょう。';

  @override
  String get dailyFortuneHealth5 => '心身の安定が際立っています。瞑想や深呼吸がさらに運気を高めます。';

  @override
  String get dailyFortuneHealth6 => '回復力が良い日です。少しの疲労もすぐに洗い流せる活力があります。';

  @override
  String get dailyFortuneHealth7 => '肌のツヤが良いので、健康そうに見えると言われる流れです。';

  @override
  String get dailyFortuneHealth8 =>
      '節制された食事と休息が運の根を強くします。自分の体をいたわる一日を過ごしてください。';

  @override
  String get dailyFortuneHealth9 => '新鮮な空気と水分補給が今日の薬です。活力に満ちた一日を楽しんでください。';

  @override
  String get dailyFortuneTipWealth0 =>
      '支出、サブスクリプション、支払いを「今」ではなく「明日」もう一度確認してください。';

  @override
  String get dailyFortuneTipWealth1 => '予定のない消費を避け、必要なものだけを持つようにすることが利益になります。';

  @override
  String get dailyFortuneTipWealth2 => '金銭に関する会話の記録を残しておけば、不必要な損失を防げます。';

  @override
  String get dailyFortuneTipWealth3 => '少額であっても漏れがないか確認してください。';

  @override
  String get dailyFortuneTipWealth4 => '今日は衝動買いの誘惑が強いです。支払う前に10分間考えてみてください。';

  @override
  String get dailyFortuneTipWealth5 =>
      '投資や大きな取引は、今日は慎重になるべきです。専門家のアドバイスを参考にしてください。';

  @override
  String get dailyFortuneTipWealth6 => '貸したお金や受け取る予定のお金を明確に整理する必要があります。';

  @override
  String get dailyFortuneTipWealth7 => '財布の管理に注意してください。損失や浪費のエネルギーがわずかに見えます。';

  @override
  String get dailyFortuneTipWealth8 => '外見を重視した消費よりも、実利を取る知恵が必要です。';

  @override
  String get dailyFortuneTipWealth9 => '無料のものを期待するよりも、適正な価格を支払うことが運を保つ道です。';

  @override
  String get dailyFortuneTipLove0 => '口調が鋭くなりやすいので、「一休みしてから」答えるようにしましょう。';

  @override
  String get dailyFortuneTipLove1 => '誤解が生じたら、長い説明よりも短い確認の方が効果的です。';

  @override
  String get dailyFortuneTipLove2 => '今日は、約束の時間を守るだけで信頼が築けます。';

  @override
  String get dailyFortuneTipLove3 => '結論から話し始めると、感情的な消耗を減らせます。';

  @override
  String get dailyFortuneTipLove4 =>
      '親しい間柄でも礼儀を守りましょう。親しさに甘えて相手を傷つけてしまうかもしれません。';

  @override
  String get dailyFortuneTipLove5 => '批判の前に褒め言葉をかけてみてください。相手の閉ざされた心が開くでしょう。';

  @override
  String get dailyFortuneTipLove6 => '失言が心配される日です。大切な話はテキストでもう一度整理して伝えましょう。';

  @override
  String get dailyFortuneTipLove7 => '他人の事に深く干渉しすぎないことが、噂を防ぐ秘訣です。';

  @override
  String get dailyFortuneTipLove8 => '感情的な対応よりも理性的な会話が、関係を健康に保ちます。';

  @override
  String get dailyFortuneTipLove9 => '予定が重ならないようスケジュールを注意深く確認してください。信頼は資産です。';

  @override
  String get dailyFortuneTipCareer0 => '物事を始めることよりも、「一つを終わらせること」が運を育てます。';

  @override
  String get dailyFortuneTipCareer1 => '完璧よりも締め切りが優先です。今日は80%の完成度で確認を受けましょう。';

  @override
  String get dailyFortuneTipCareer2 => '後回しにしていたことを一つ整理すれば、頭がすっきりします。';

  @override
  String get dailyFortuneTipCareer3 => '自分の仕事と他人の仕事を分けることで、ストレスを減らせます。';

  @override
  String get dailyFortuneTipCareer4 =>
      '小さなミスが仕事をこじらせることがあります。最終チェックを忘れないでください。';

  @override
  String get dailyFortuneTipCareer5 => '上司や同僚との摩擦が予想されます。意見の違いを尊重する態度が必要です。';

  @override
  String get dailyFortuneTipCareer6 =>
      '今日は集中力が散漫になりやすいです。50分仕事をして10分休むリズムを守りましょう。';

  @override
  String get dailyFortuneTipCareer7 =>
      '過度な責任感は毒になることがあります。自分がこなせる分だけを引き受けてください。';

  @override
  String get dailyFortuneTipCareer8 => '今日は公的な仕事に私情を混ぜないように注意してください。';

  @override
  String get dailyFortuneTipCareer9 => '書類やメールを送る前に、宛先と添付ファイルをもう一度確認してください。';

  @override
  String get dailyFortuneTipHealth0 =>
      'コンディションを安定させるために、睡眠不足、過食、過度なカフェインを避けてください。';

  @override
  String get dailyFortuneTipHealth1 => '首と肩の緊張をほぐすだけで、今日の疲労が大幅に軽減されます。';

  @override
  String get dailyFortuneTipHealth2 => '短い散歩が考えを整理し、エネルギーをリフレッシュさせます。';

  @override
  String get dailyFortuneTipHealth3 => '一杯の水と1分間のストレッチが運の土台を支えます。';

  @override
  String get dailyFortuneTipHealth4 =>
      '目の疲れがひどくなることがあります。スマートフォンの使用を一時的に減らしましょう。';

  @override
  String get dailyFortuneTipHealth5 => '急な活動よりも、体を十分に温めてから動く方が良いでしょう。';

  @override
  String get dailyFortuneTipHealth6 =>
      '気温の変化に敏感になる可能性があるため、体温調節のために上着を持ち歩きましょう。';

  @override
  String get dailyFortuneTipHealth7 => '腸の健康と肌のために、今日は刺激的な食べ物を避けてください。';

  @override
  String get dailyFortuneTipHealth8 => '十分な睡眠が最高の薬です。今日はいつもより早めに就寝しましょう。';

  @override
  String get dailyFortuneTipHealth9 => 'お気に入りの音楽や香りで気分転換し、ストレスを溜め込まないようにしましょう。';

  @override
  String get eyeAnalysisTypeSharp => 'あなたの目は強烈で澄んでおり、瞬間的な判断力と推進力が非常に際立っています。';

  @override
  String get eyeAnalysisTypeDeep => 'あなたの目は穏やかで深く、動く前に注意深く観察し考える賢明な顔立ちです。';

  @override
  String get eyeAnalysisTypeBalanced => '目のエネルギーがバランス良く、感情と理性を適切に調整して安定感を与えます。';

  @override
  String get eyeExpressionBright =>
      '特に、明るい瞳と笑顔が調和し、人を惹きつける「桃花（とうか）」のエネルギーを強く放っています。';

  @override
  String get eyeExpressionGentle =>
      '穏やかな瞳の中に優しい笑顔が隠れており、「外柔内剛」型の柔らかいカリスマ性を感じさせます。';

  @override
  String get eyeExpressionStrong =>
      '笑顔のない強い瞳は決断力とリーダーシップを象徴し、目標に向かって突き進む力を示しています。';

  @override
  String get eyeExpressionSteady =>
      '全体的に穏やかで真剣な雰囲気であり、軽い言動よりも重みのある態度で信頼を得るタイプです。';

  @override
  String get eyePostureTilt =>
      'ただし、頭が少し傾いているため、心の中心が揺らぐ可能性があります。まっすぐ前を見つめることで運気がより鮮明になります。';

  @override
  String get eyePostureStraight => 'まっすぐ前を見つめる姿勢が、目のエネルギーをより鮮明で直立したものにしています。';

  @override
  String get noseInsufficient => '鼻の輪郭の測定が不十分なため、鼻の解釈は控えめに表示されます。';

  @override
  String get noseWealthRich =>
      '鼻筋が太く長さがあるため、富を集めて守る「財白宮（ざいはくぐゅう）」のエネルギーが非常に良好です。';

  @override
  String get noseWealthPlanner => '鼻が鋭く整っており、財産を注意深く管理し計画的に増やす実務家タイプです。';

  @override
  String get noseWealthBalanced =>
      '鼻の比率が適切でバランスが取れており、入ってくる富を安定して維持する力を持っています。';

  @override
  String get mouthExpressionBlessing =>
      '口は閉じられていますが口角が上がっているため、言葉の端々に福が宿り、周囲から好感を得る顔立ちです。';

  @override
  String get mouthExpressionReliable =>
      '固く結ばれた口元は信頼と責任感を示しており、軽い言葉よりも行動で示すタイプです。';

  @override
  String get mouthExpressionLucky =>
      '大きく開いた笑顔が爽やかで、ポジティブなエネルギーを放ち、対人関係に幸運を呼び込みます。';

  @override
  String get supplementAlarmTitle => 'サプリメントを飲む時間です！ ��';

  @override
  String get alarmVolume => 'アラーム音量';

  @override
  String get alarmTimeList => 'アラーム時刻リスト';

  @override
  String get noAlarmTimesAdded => '追加されたアラーム時刻はありません';

  @override
  String get alarmTimeDeleted => 'アラーム時刻が削除されました';

  @override
  String get addAlarmTime => 'アラーム時刻の追加';

  @override
  String get editAlarmTime => 'アラーム時刻の編集';

  @override
  String get defaultRingtone => 'デフォルトの着信音';

  @override
  String get takeSupplementsNow => 'サプリメントを飲んで記録してください！';

  @override
  String get nextTime => '後で飲む';

  @override
  String get take => '飲む';

  @override
  String get notifications => '通知';

  @override
  String get notificationTime => '通知時間';

  @override
  String get start => '開始';

  @override
  String get end => '終了';

  @override
  String get notificationInterval => '通知間隔';

  @override
  String get waterDrankToday => '今日飲んだ水';

  @override
  String get goal => '目標';

  @override
  String get cup => 'コップ';

  @override
  String get waterIntakeRecord => '水分摂取の記録';

  @override
  String get remainingAmount => '残り';

  @override
  String get ml => 'ml';

  @override
  String minutesFormat(String minutes) {
    return '$minutes分';
  }

  @override
  String get drinkWater => '水を飲む';

  @override
  String get supplement => 'サプリメント';

  @override
  String get water => '水分';

  @override
  String get morning => '午前';

  @override
  String get afternoon => '午後';

  @override
  String get evening => '夜';

  @override
  String get takeSupplement => 'サプリメントを飲む';

  @override
  String get goalAchievedTitle => '目標達成！';

  @override
  String get waterIntake => '水分摂取';

  @override
  String get remindTime => '通知時間';

  @override
  String get alarmRingtone => 'アラームの着信音';

  @override
  String get snoozeTime => 'スヌーズ時間';

  @override
  String get snoozeDescription => '「後で飲む」を選択した際のデフォルト時間です';

  @override
  String get oneHour => '1時間';

  @override
  String get mouthExpressionOpen =>
      '口が少し開いており、開放的で正直な性格を示していますが、時には失言に注意する必要があります。';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return '今日のポイントは$topKey、注意すべき点は$bottomKeyです。';
  }

  @override
  String get overallVibeWealthRich =>
      '財白宮（鼻）のエネルギーが厚く活き活きとしており、経済的なチャンスを掴むのに非常に良い顔色です。';

  @override
  String get overallVibeWealthSteady =>
      '顔の中心である鼻周辺のエネルギーが穏やかであり、実利を取り、着実に富を蓄積するのに適した流れです。';

  @override
  String get overallVibeLoveCharisma =>
      '口角から始まる明るい笑顔が「桃花」のエネルギーを増幅させているため、人が集まり、貴人に会える顔立ちです。';

  @override
  String get overallVibeLoveTrust =>
      '瞳の真剣さが相手に深い信頼感を与えるため、軽い出会いよりも深い関係を築くのに良い日です。';

  @override
  String get overallVibeCareerSmart =>
      '瞳に宿る知的なエネルギーが判断力を高めているため、複雑な業務や重要な決断を下すのに最適な状態です。';

  @override
  String get overallVibeCareerSteady =>
      '下顔面の安定したエネルギーが持続力を支えているため、黙々と自分の場所を守る努力が大きな成果につながります。';

  @override
  String get overallVibeHealth =>
      '顔全体を巡る活力と澄んだ顔色は、身体のリズムが安定していることを示しており、活力を充電するのに適しています。';

  @override
  String get overallActionPrudent =>
      '固く結ばれた口元の慎重な姿に晩年の福が感じられます。今日は言葉よりも行動で実践することで運がついてきます。';

  @override
  String get overallActionConfident =>
      '爽やかに開いた口元のラインがポジティブなエネルギーを呼び込みます。自信に満ちた声で意見を提示すれば、良い反応が得られるでしょう。';

  @override
  String get adviceHealth0 => 'コンディション管理が運の土台を支えます。今日は無理なスケジュールから整理しましょう。';

  @override
  String get adviceHealth1 => '体の声に耳を傾けてください。短い休息がより大きな結果をもたらします。';

  @override
  String get adviceHealth2 => '十分な睡眠と水分補給だけで、今日の運気がクリアになります。';

  @override
  String get adviceWealth0 => 'お金は入ってくる分だけ出ていきやすいものです。支出や契約をもう一度確認してください。';

  @override
  String get adviceWealth1 => '小さな支出を減らすことが、大きな富を築く第一歩です。';

  @override
  String get adviceWealth2 => '経済的な決定を明日に先送りすることが、かえって利益になる場合があります。';

  @override
  String get adviceLove0 => '言葉一つ、表情一つが対人運を左右します。まずは柔らかく接することから始めましょう。';

  @override
  String get adviceLove1 => '話を聞く態度が、相手の心を開く鍵になります。';

  @override
  String get adviceLove2 => '親しい間柄でも礼儀を守ることが、運を守る道です。';

  @override
  String get adviceCareer0 => '今日は目標を広げるよりも、「一つのことを確実にこなす」日です。優先順位を絞りましょう。';

  @override
  String get adviceCareer1 => '焦らないでください。一歩ずつ着実に進むことが、結局は一番の近道です。';

  @override
  String get adviceCareer2 => '周囲のアドバイスを参考にしつつも、最終的な決定は自分の直感を信じてください。';

  @override
  String get sajuFortune2024Gap =>
      '🌿 2024年 甲辰（きのえたつ）年 甲（きのえ）木 全体運: 「新たな始まりと飛躍の年」\n\n2024年はあなたにとって「比肩（ひけん）」と「偏財（へんざい）」のエネルギーが入ってくる年です。うっそうとした森の中に新しい木が植えられ、広大な大地が広がるようなものです。明確な主観を持って新しいことを計画し、実行するのに素晴らしい一年になるでしょう。\n\n💼 [仕事・ビジネス]\n自信が溢れ、推進力が強まる時期です。同僚やパートナーと協力して大きなプロジェクトを成功させるチャンスが訪れます。起業や転職を考えていたなら、今年が適期かもしれません。ただし、独断に陥りやすいため、人の意見を聞く姿勢も必要です。\n\n💰 [金運]\n大きな財に触れる機会が訪れます。予期せぬ横財運や投資収益が期待されます。ただし、出ていくお金も多くなる可能性があるため、徹底した資産管理が求められます。長期的な視点での投資が有利です。\n\n❤️ [恋愛・対人関係]\n人間関係を広げ、新しい縁を結ぶのに良い時期です。シングルの場合は魅力的な相手に出会う可能性が高く、カップルの場合は関係がより深まるでしょう。ただし、ライバルの出現には注意してください。\n\n⚠️ [注意点]\n肝臓や胆嚢の健康に注意し、ストレス管理を心がけてください。また、過度な自信による独断的な決定は避けるのが賢明です。';

  @override
  String get sajuFortune2024Eul =>
      '🌿 2024年 甲辰（きのえたつ）年 乙（きのと）木 全体運: 「助力者と共に成長する年」\n\n2024年はあなたにとって「劫財（ごうざい）」と「正財（せいざい）」のエネルギーが入ってくる年です。蔦が大木を伝って空を見るようなものです。一人よりも周囲の助けを借りることで、より大きな成果を上げることができる年になるでしょう。\n\n💼 [仕事・ビジネス]\n協力とネットワーキングが重要です。有能な協力者に出会い、仕事の効率が上がり、認められるでしょう。ただし、成果を分け合わなければならない状況も発生する可能性があるため、公平な分配に注意してください。競争の中で存在感を示すのに良い時期です。\n\n💰 [金運]\n安定した収入が保証されます。誠実な努力に対する報酬が続き、貯蓄や不動産投資に有利な時期です。ただし、同僚や知人との金銭取引は避け、支出管理に気を配ってください。\n\n❤️ [恋愛・対人関係]\n社交的な集まりが多くなり、人気が高まるでしょう。恋愛関係では、些細な誤解が生じる可能性があるため、正直な会話が必要です。友人や同僚を通じて自然に新しい縁が訪れる可能性があります。\n\n⚠️ [注意点]\n神経系の不調や偏頭痛に注意してください。また、周囲の人との対立に苦しむ可能性があるため、柔軟な態度を保つことが大切です。';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 2024年 甲辰（きのえたつ）年 丙（ひのえ）火 全体運: 「情熱と知恵が輝く年」\n\n2024年はあなたにとって「偏印（へんいん）」と「食神（しょくじん）」のエネルギーが入ってくる年です。太陽が森を照らし、生命を吹き込むようなものです。独創的なアイデアが湧き出し、才能を存分に発揮できる年になるでしょう。\n\n💼 [仕事・ビジネス]\n専門分野で頭角を現し、独創的な成果を上げるでしょう。研究、芸術、技術職の人に特に有利です。ただし、考えすぎて実行力が落ちる可能性があるため、計画を立てたらすぐに実行に移すよう努力してください。\n\n💰 [金運]\n才能とアイデアがお金につながる時期です。副業や趣味が収入を生む可能性があります。ただし、損失を防ぐために、契約書類や投資は慎重に検討してください。\n\n❤️ [恋愛・対人関係]\n弁舌が立ち、魅力が溢れる時期です。関係をリードし、多くの人の好感を得るでしょう。恋愛関係では、楽しいデートやイベントが多く、関係が深まるでしょう。\n\n⚠️ [注意点]\n消化器系や心血管系の健康に注意してください。また、考えすぎて憂鬱になることがあるため、屋外活動でエネルギーを発散するのが良いでしょう。';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 2024年 甲辰（きのえたつ）年 丁（ひのと）火 全体運: 「安定の中で内面を強化する年」\n\n2024年はあなたにとって「正印（せいいん）」と「傷官（しょうかん）」のエネルギーが入ってくる年です。夜空の灯火が森を照らすようなものです。勉強や資格取得など自己啓発に集中し、内面を強化するのに良い年になるでしょう。\n\n💼 [仕事・ビジネス]\n上司や先輩の助けで職場環境が改善し、昇進や異動の機会が訪れます。自分の意見を説得力を持って伝え、周囲の同意を得るのに有利な時期です。ただし、批判的な態度は噂になる可能性があるため、言動には注意してください。\n\n💰 [金運]\n文書に関する運が良いです。不動産契約や資格取得による収入アップが期待できます。安定した資産管理に集中し、衝動的な消費を控えるのが良いでしょう。\n\n❤️ [恋愛・対人関係]\n礼儀正しく温かい姿で周囲の人から信頼を得るでしょう。恋愛関係では、お互いへの配慮が深まり、安定した交際が続きます。結婚の準備をするのにも良い年です。\n\n⚠️ [注意点]\n眼病や神経衰弱に注意してください。また、才能をひけらかすと周囲の反感を買う可能性があるため、謙虚な態度を保ってください。';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ 2024年 甲辰（きのえたつ）年 戊（つちのえ）土 全体運: 「責任と挑戦の年」\n\n2024年はあなたにとって「偏官（へんかん）」と「比肩（ひけん）」のエネルギーが入ってくる年です。巨大な山が森と調和して威容を誇るようなものです。責任は増しますが、それを乗り越えることで一段階成長する年になるでしょう。\n\n💼 [仕事・ビジネス]\n難しい課題を任されたり、リーダーシップを発揮しなければならない状況が多くなるでしょう。競争の激しい環境で実力を証明する機会が訪れます。大変な分、達成感も大きいため、最後までやり遂げる粘り強さが必要です。\n\n💰 [金運]\n今年は支出が多少増える可能性があります。投資よりも元本を守ることに重点を置き、周囲の人との金銭関係で損をしないように注意してください。長期的な視点で資産計画を立てることが重要です。\n\n❤️ [恋愛・対人関係]\n強いカリスマ性で異性からの注目を集めるでしょう。ただし、頑固な態度はパートナーとの喧嘩の原因になるため、相手の立場を考える努力が必要です。友人との友情が深まる時期でもあります。\n\n⚠️ [注意点]\n胃腸障害や筋肉痛など、肉体的な過労に注意してください。十分な休息とストレッチが必要で、精神的なプレッシャーを和らげる趣味を持つのが良いでしょう。';

  @override
  String get sajuFortune2024Gi =>
      '🌾 2024年 甲辰（きのえたつ）年 己（つちのと）土 全体運: 「結実と調和の年」\n\n2024年はあなたにとって「正官（せいかん）」と「劫財（ごうざい）」のエネルギーが入ってくる年です。広い野原に木々が茂り、実を結ぶようなものです。社会的地位が上がり、名誉を得られる快適な年になるでしょう。\n\n💼 [仕事・ビジネス]\n組織内で認められ、重要な役職に就くでしょう。就職や昇進の運が非常に強い年です。ルールを守り、誠実に働けば、期待以上の成果を上げることができます。ただし、同僚との競争でストレスを感じる可能性があるため、心の余裕を持ってください。\n\n💰 [金運]\n安定した収入があり、着実に富が蓄積される年です。成果や名誉に応じた報酬が期待できます。ただし、周囲の人に施すことが多くなり支出があるかもしれないので、適切な調整が必要です。\n\n❤️ [恋愛・対人関係]\n結婚運が強く入ってくる時期です。シングルの場合は、信頼できるパートナーに出会い、真剣な関係に発展する可能性があります。カップルの場合は、円滑なコミュニケーションを通じて多くの人から支持を得られるでしょう。\n\n⚠️ [注意点]\n脾臓や膵臓の機能に注意し、規則正しい食習慣を維持してください。また、他人のことに深入りしすぎて自分の利益を損なわないように注意してください。';

  @override
  String get sajuFortune2024Gyeong =>
      '⚔️ 2024年 甲辰（きのえたつ）年 庚（かのえ）金 全体運: 「変化と革新の年」\n\n2024年はあなたにとって「偏財（へんざい）」と「偏印（へんいん）」のエネルギーが入ってくる年です。鋭い剣で森を切り開き、新しい道を作るようなものです。既存の枠組みを壊し、新しい分野に挑戦して大きな変化を迎える年になるでしょう。\n\n💼 [仕事・ビジネス]\n新しいビジネスのアイデアが浮かび、大胆な決断力を発揮するでしょう。海外勤務や移動の運が強く、変化を恐れない態度が成功の鍵です。ただし、独断的な行動は組織内で対立を引き起こす可能性があるため、調整能力が必要です。\n\n💰 [金運]\n金運の変動が大きい年です。大きな利益を得る可能性もありますが、無理な投資は大きな損失につながる可能性があります。徹底的な分析と計画の下で動く必要があり、投機的な投資は避けた方が良いでしょう。\n\n❤️ [恋愛・対人関係]\n新しい人に出会う機会が多くなり、活発な社会活動を行うでしょう。恋愛への好奇心が高まる時期です。ただし、熱しやすく冷めやすいため、真剣な態度が必要です。\n\n⚠️ [注意点]\n呼吸器や大腸の健康に注意してください。また、せっかちな性格が原因で事故が起こる可能性があるため、常に冷静さを保ち、安全に注意してください。';

  @override
  String get sajuFortune2024Sin =>
      '💎 2024年 甲辰（きのえたつ）年 辛（かのと）金 全体運: 「宝石が輝き名誉を得る年」\n\n2024年はあなたにとって「正財（せいざい）」と「正印（せいいん）」のエネルギーが入ってくる年です。森の中で宝石が輝き、その価値が認められるようなものです。努力に対する正当な報酬を受け取り、名誉を高める年になるでしょう。\n\n💼 [仕事・ビジネス]\n誠実さと几帳面さが光り、周囲からの信頼を得るでしょう。専門性を認められ、重要なプロジェクトの責任者になったり、昇進の喜びを味わうかもしれません。計画通りに物事が進む安定した時期です。\n\n💰 [金運]\n金運は非常に安定しており良好です。安定した収入が保証され、貯蓄や財テクで良い成果を上げるでしょう。親や目上の人から遺産を相続したり、経済的な援助を受ける可能性もあります。\n\n❤️ [恋愛・対人関係]\n気品のある礼儀正しい姿で異性に大きな魅力をアピールするでしょう。恋愛関係ではお互いの信頼が深まり、結婚を約束するのに良い年です。対人関係も円満で平和です。\n\n⚠️ [注意点]\n肺の健康や皮膚疾患に注意してください。また、完璧を求めすぎると自分でストレスを抱え込むことがあるため、時には気持ちを楽に持つ必要があります。';

  @override
  String get sajuFortune2024Im =>
      '🌊 2024年 甲辰（きのえたつ）年 壬（みずのえ）水 全体運: 「流れる水のように柔軟に成長する年」\n\n2024年はあなたにとって「食神（しょくじん）」と「偏官（へんかん）」のエネルギーが入ってくる年です。大きな海が森を潤し、生命を育むようなものです。知恵を発揮して困難な問題を解決し、自分の領域を広げる年になるでしょう。\n\n💼 [仕事・ビジネス]\n創造的な問題解決能力が際立つ時期です。困難な状況でも突破口を見つけ、能力を認められるでしょう。特に教育、相談、企画分野で良い成果が期待できます。ただし、過度な業務量で疲弊する可能性があるため、ペース配分が必要です。\n\n💰 [金運]\n自分の技術や才能で収入を生み出すのに良い年です。食録と財運が共に入ってくる時期です。ただし、突然の支出が発生する可能性があるため、非常用資金を確保しておくと賢明です。\n\n❤️ [恋愛・対人関係]\n理解と寛容さが増し、周囲の人と良い関係を維持するでしょう。恋愛関係では深い対話を通じてお互いの本心を確認することになります。シングルの場合、一緒にいて心地よい相手に出会う可能性が高いです。\n\n⚠️ [注意点]\n腎臓や膀胱系の健康に注意してください。また、一度に多くのことを処理しようとすると健康を害する恐れがあるため、優先順位を決めて行動してください。';

  @override
  String get sajuFortune2024Gye =>
      '💧 2024年 甲辰（きのえたつ）年 癸（みずのと）水 全体運: 「変化の中でチャンスを掴む年」\n\n2024年はあなたにとって「傷官（しょうかん）」と「正官（せいかん）」のエネルギーが入ってくる年です。甘い雨が森を潤し、万物を蘇らせるようなものです。自分の声を高めて存在感を世に知らしめ、新しいチャンスを掴む年になるでしょう。\n\n💼 [仕事・ビジネス]\n弁舌が立ち、独創的なアイデアが溢れます。マーケティング、広報、芸術分野で優れた才能を発揮するでしょう。ただし、上司や組織のルールに対する反発心が芽生えることがあるため、柔軟に対処する知恵が必要です。\n\n💰 [金運]\nお金の流れが活発になる年です。機転と瞬発力を発揮して収入を増やすチャンスが訪れます。ただし、衝動的な消費や外見を飾るための支出が大きくなる可能性があるため注意してください。\n\n❤️ [恋愛・対人関係]\n溢れる魅力と巧みな話術で人気者になるでしょう。恋愛関係では率直な感情表現で活力を吹き込みますが、鋭い言葉が相手を傷つけることもあるため配慮が必要です。\n\n⚠️ [注意点]\n泌尿器系疾患や血液循環に注意してください。また、他人の悪口を言ったりすると噂の対象になる可能性があるため、常に言動を慎み謙虚さを保ってください。';

  @override
  String get sajuFortune2025Gap =>
      '🌿 2025年 乙巳（きのとみ）年 甲（きのえ）木 全体運: 「新しい舞台と競争の中で成長する年」\n\n2025年はあなたにとって「劫財（ごうざい）」と「食神（しょくじん）」のエネルギーが入ってくる年です。森の大きな木が蔦（乙木）と調和して共に成長するようなものです。一人よりも共にいる時に相乗効果が生まれますが、同時に激しい競争も避けられない年になるでしょう。\n\n💼 [仕事・ビジネス]\n活動が活発になり、表現欲求が強くなります。自分のアイデアや才能を世に広く知らせるチャンスが訪れます。フリーランサー、芸能関係、営業職の方には特に優れた成果が期待できます。ただし、同僚やライバルとの関係で微妙な対立が生じる可能性があるため、敵ではなく協力者にする知恵が必要です。\n\n💰 [金運]\nお金の流れは活発ですが、入ってくる分だけ出ていくお金も多いかもしれません（劫財の影響）。友人や同僚との集まりや投資の勧誘などで支出が発生する可能性があるため注意が必要です。お金を貯めるよりも、自己啓発や事業拡大に投資する方が長期的には有利です。\n\n❤️ [恋愛・対人関係]\n社交性が高まり、多くの新しい人に出会うでしょう。集まりや団体活動で人気が高まり、異性に魅力をアピールするのに良い時期です。ただし、ライバルが現れる可能性もあるため、好きな人がいれば積極的に表現するのが良いでしょう。\n\n⚠️ [注意点]\n過度な競争心はトラブルを招く可能性があります。また、「巳（み）」の火のエネルギーにより移動運が増加するため、交通安全や体力管理に注意してください。';

  @override
  String get sajuFortune2025Eul =>
      '🌿 2025年 乙巳（きのとみ）年 乙（きのと）木 全体運: 「自分らしさが輝く飛躍の年」\n\n2025年はあなたにとって「比肩（ひけん）」と「傷官（しょうかん）」のエネルギーが入ってくる年です。暖かい日差しの下で野原の花々が満開になるようなものです。自分の個性と才能を存分に発揮し、大衆の注目を集めるダイナミックな年になるでしょう。\n\n💼 [仕事・ビジネス]\n創造性と芸術的センスが絶頂に達します。企画やアイデアを出す業務で大きく頭角を現すでしょう。実力が認められ、独立したり新しいプロジェクトを主導する機会が訪れます。ただし、あまり先走ろうとすると既存のルールと衝突する可能性があるため、調整が必要です。\n\n💰 [金運]\n機転と技術を基に収入が生み出される年です。副業や創作活動を通じて予期せぬ収入を得るかもしれません。ただし、華やかなものを追い求めて品位維持費や遊興費の支出が増える可能性があるため、経済観念を失わないでください。\n\n❤️ [恋愛・対人関係]\n魅力が溢れ、異性からの注目を一身に受ける時期です。恋愛関係では楽しく活気のある時間を過ごしますが、時には自分の頑固さで喧嘩になることもあります。シングルの場合は運命的な出会いが期待できます。\n\n⚠️ [注意点]\n舌禍（失言）による噂の対象になりやすい年なので、言葉には注意してください。また、エネルギーの消耗が激しく疲れやすいため、規則正しい睡眠と休息が不可欠です。';

  @override
  String get sajuFortune2026Gap =>
      '🌳 2026年 丙午（ひのえうま）年 甲（きのえ）木 全体運: 「情熱の炎、活動の最大化」\n\n2026年は甲（きのえ）木のあなたにとって「食神（しょくじん）」（生産性）と「傷官（しょうかん）」（表現）のエネルギーが非常に強い年です。木が火に出会い勢いよく燃え上がる局面で、あなたの才能と表現が世の中に惜しみなくほとばしる時期です。じっとしていても存在感が現れ、活動範囲が劇的に広がります。\n\n💼 [仕事・ビジネス]\n新しいプロジェクトや事業を始めるのに非常に良い時期です。アイデアが現実化し、情熱的に仕事に没頭するでしょう。芸術、放送、営業、教育など自分を表現する分野で大きな成果を上げることができます。ただし、前だけを見て走るとミスをする可能性があるため、慎重さと再確認が必要です。\n\n💰 [金運]\n活動した分だけ富がついてきます。事業収入や副業による収入が増える可能性があります。ただし、稼ぐ分だけ投資や消費で出ていくお金も多いかもしれません。未来のための投資は良いですが、衝動的な支出は警戒すべきです。\n\n❤️ [恋愛・対人関係]\n率直で積極的な態度で異性にアピールします。恋愛運は盛り上がりますが、過度な感情表現は相手に負担を与える可能性があります。子供運（女性の場合）が非常に強く入ってくる年でもあります。\n\n⚠️ [注意点]\nエネルギーの消耗が激しい年です。「燃え尽き症候群」になる可能性があるため、体力管理が必須です。失言による噂に注意し、自分の主張ばかりを通さないように努力してください。';

  @override
  String get sajuFortune2026Eul =>
      '🌸 2026年 丙午（ひのえうま）年 乙（きのと）木 全体運: 「華麗な開花、才能の満開」\n\n2026年は乙（きのと）木のあなたにとって「傷官（しょうかん）」（表現）が重なる年です。熱い太陽の下で花が満開になる局面で、あなたの魅力と才能が絶頂に達する時期です。どこに行っても注目を浴びる主人公となり、華々しい成果を味わうでしょう。\n\n💼 [仕事・ビジネス]\n既存の枠を破る破格の試みが成功します。デザイン、ファッション、美容、芸能分野で頭角を現すでしょう。職場で昇進やスカウトの提案を受けることもありますが、上司との摩擦には注意してください。自由な環境で能力が倍増します。\n\n💰 [金運]\n富を生み出す能力が優れています。自分のブランド価値が上がり、身代金が高くなります。ただし、華やかさを追うと贅沢や浪費につながる可能性があるため、財布の紐をしっかり締める必要があります。\n\n❤️ [恋愛・対人関係]\n異性からの人気が爆発します。華やかで情熱的な恋愛をするでしょうが、短く太く終わる可能性もあります。既婚者は子供のことで悩むことが多くなるかもしれません。\n\n⚠️ [注意点]\n感情の起伏が激しくなる可能性があります。カッとする気質を抑えられないと、せっかく積み上げた成果が崩れるかもしれません。遵法精神を持ち、法的問題や噂を避けてください。';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ 2026年 丙午（ひのえうま）年 丙（ひのえ）火 全体運: 「二つの太陽、激しい競争と跳躍」\n\n2026年は丙（ひのえ）火のあなたにとって「比肩（ひけん）」（友人）と「劫財（ごうざい）」（競争者）が非常に強い年です。空に二つの太陽が昇った局面で、自尊心と競争心が空を突く時期です。主体性が強くなり、干渉されるのを嫌い、自分の道を力強く推し進めます。\n\n💼 [仕事・ビジネス]\n競争のある場所で勝利し、勝ち取る運です。パートナーシップや協業を通じて規模を拡大できますが、利益配分問題で葛藤が生じる可能性もあります。フリーランサーや専門職は自分の名前を広く知らせる良い機会です。\n\n💰 [金運]\nお金は入ってきますが、出ていく穴も大きいです。兄弟、友人、同僚によってお金が出ていくことがあります。保証人になったりお金を貸すことは絶対禁物です。お金を貯めるよりは、名誉や勢力を育てることに投資する方が良いです。\n\n❤️ [恋愛・対人関係]\n友達のような恋人に出会ったり、友達から恋人に発展する可能性があります。ただし、パートナーがいる場合、三角関係やライバルが現れる可能性があるので注意してください。\n\n⚠️ [注意点]\n独断的な行動は周囲の反感を買います。「謙虚さ」が最高の処世術です。心血管疾患や目の健康に注意してください。';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 2026年 丙午（ひのえうま）年 丁（ひのと）火 全体運: 「巨大な炎、勢力の拡大」\n\n2026年は丁（ひのと）火のあなたにとって「劫財（ごうざい）」と「比肩（ひけん）」の年です。ろうそくが溶鉱炉に出会ったかのように、あなたの力が強大になる時期です。一人では不可能だったことも、周囲の助けや協力を通じて成し遂げることができるでしょう。\n\n💼 [仕事・ビジネス]\n強力な推進力が生まれます。競争相手を圧倒したり、自分の味方にする知恵を持つようになります。チームプロジェクトや組織生活でリーダーシップを発揮する機会が訪れるでしょう。ただし、成果を独占しようとすると裏切られる可能性があるため、功績を分かち合う姿勢が必要です。\n\n💰 [金運]\n投機的な傾向が強まります。「ハイリスク・ハイリターン」を追求するようになり、運が良ければ大金を手にすることもありますが、失敗した場合の打撃も大きいです。予想外の支出が発生する可能性があるので、非常用資金を準備しておくと良いでしょう。\n\n❤️ [恋愛・対人関係]\n社交的な集まりや団体活動で縁に出会う確率が高いです。男性は妻や恋人を疎かにする可能性があるので注意が必要です。今年は周囲の人々との関係が資産となります。\n\n⚠️ [注意点]\n欲を出しすぎると災いを招きます。無理な拡張や投資は控えましょう。怒りやストレスによる病気に注意してください。';

  @override
  String get sajuFortune2026Mu =>
      '🌋 2026年 丙午（ひのえうま）年 戊（つちのえ）土 全体運: 「強烈な熱気の中の忍耐と準備」\n\n2026年は戊（つちのえ）土のあなたにとって「偏印（へんいん）」と「正印（せいいん）」のエネルギーが強い年です。火山が爆発する直前のようにエネルギーが凝縮された状態です。勉強、芸術、資格取得などを通じて内面を満たし、実力を育てるのに最適な時期です。\n\n💼 [仕事・ビジネス]\n活動的な仕事よりは、企画、研究、戦略樹立などの頭脳労働が光ります。文書運が良く、契約や許認可関連の業務で成果があります。ただし、考えすぎて実行を先延ばしにすると機会を逃す可能性があるため、果敢な決断力も必要です。\n\n💰 [金運]\n不動産文書運が非常に強いです。売買や契約を通じて資産を増やすチャンスです。現金の流れは多少もどかしいかもしれませんが、長期的な観点での投資は有望です。\n\n❤️ [恋愛・対人関係]\n母親や目上の人からの干渉が増えるかもしれません。恋愛においては精神的な交感を重視するようになり、年上の人との縁ができることもあります。\n\n⚠️ [注意点]\n考えすぎると憂鬱になったり無気力になったりします。野外活動や運動で汗を流すことが開運に役立ちます。熱気で土地がひび割れるように、皮膚の乾燥や胃腸障害に注意してください。';

  @override
  String get sajuFortune2026Gi =>
      '🌾 2026年 丙午（ひのえうま）年 己（つちのと）土 全体運: 「強固な基盤と確実な後援」\n\n2026年は己（つちのと）土のあなたにとって「正印（せいいん）」と「偏印（へんいん）」の年です。暖かい日差しが大地を照らし、穀物を実らせる状況です。目上の人からの全面的な支援と愛を受けながら、安定した基盤を固める時期です。\n\n💼 [仕事・ビジネス]\n昇進試験、資格試験、学位取得など、勉強に関連することでは最高の結果を得られます。職場では上司の信頼を得て、重要な職責を任されます。教育、不動産、相談、福祉分野で頭角を現すでしょう。\n\n💰 [金運]\n文書を握る運です。マイホーム購入の目標を達成したり、相続や贈与を受けることもあります。安定した資産増殖が可能で、財物よりは名誉が光る年です。\n\n❤️ [恋愛・対人関係]\n愛される年です。恋人から頼もしい愛を受けたり、条件の良いパートナーに出会うことができます。結婚運も入ってきて、家庭生活が和やかになります。\n\n⚠️ [注意点]\n受け身でいると怠惰になりがちです。受けた分だけ分かち合う姿勢が必要です。依存心を捨てて自立心を育てましょう。';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ 2026年 丙午（ひのえうま）年 庚（かのえ）金 全体運: 「試練を越えて生まれる名剣」\n\n2026年は庚（かのえ）金のあなたにとって「偏官（へんかん）」と「正官（せいかん）」の威力が非常に強い年です。原石を溶鉱炉で溶かして名剣を作る状況です。強いプレッシャーやストレスがあるかもしれませんが、それに耐えれば強大な権限と名誉を手にすることができます。\n\n💼 [仕事・ビジネス]\n責任の重い役職に就いたり、難しいプロジェクトを担当することになります。しかし、これはあなたを試す過程であり、成功すれば一気に地位が上昇します。公職、軍人、警察、法曹界にいる人にとっては昇進のチャンスです。\n\n💰 [金運]\nお金よりは名誉と肩書きの運です。地位が上がれば富は自然についてきますが、品位維持や接待などで出ていくお金も少なくありません。\n\n❤️ [恋愛・対人関係]\n女性にとってはカリスマ性があり能力のある男性が現れる運です。男性は子供運が強いです。職場の目上の人や年長者との関係が重要になります。\n\n⚠️ [注意点]\n健康管理が最優先です。過労による病気や事故に注意してください。特に肺や大腸が弱くなる可能性があります。ストレス解消法を見つけましょう。';

  @override
  String get sajuFortune2026Sin =>
      '💎 2026年 丙午（ひのえうま）年 辛（かのと）金 全体運: 「輝く宝石、名誉の絶頂」\n\n2026年は辛（かのと）金のあなたにとって「正官（せいかん）」と「偏官（へんかん）」の年です。照明を受けた宝石のように、世の中に自分の価値が知られ、名誉が高まる時期です。誠実で安定した職場や組織と深い縁があります。\n\n💼 [仕事・ビジネス]\n就職、昇進、異動運が非常に良いです。実力を認められてスカウトの提案を受けることもあります。原則を守り正しく処理すれば、誰からも尊敬を受けるでしょう。\n\n💰 [金運]\n安定した給料や固定収入が保証されます。財物を追うより名誉を守れば、富は自然とついてきます。夫や職場のおかげで利益を得ることができます。\n\n❤️ [恋愛・対人関係]\n女性にとっては最高の結婚運、恋愛運です。誠実で能力のある配偶者に出会えます。男性は子供を得たり、子供のことで慶事があります。\n\n⚠️ [注意点]\n熱すぎると宝石が溶けてしまいます。過度な業務やストレスで神経過敏になる可能性があります。原則主義的な傾向が強くなり融通が利かないように見えることがあるので注意してください。';

  @override
  String get sajuFortune2026Im =>
      '🌊 2026年 丙午（ひのえうま）年 壬（みずのえ）水 全体運: 「活動領域が広がるダイナミックな年」\n\n2026年は壬（みずのえ）水のあなたにとって「偏財（へんざい）」と「正財（せいざい）」のエネルギーが入ってくる年です。太陽の熱を受けて巨大な海が活発に循環し、広い世界へと進んでいくようなものです。経済活動が活発になり、大きな富を手にする機会が訪れるダイナミックな一年になるでしょう。\n\n💼 [仕事・ビジネス]\n事業的感覚が最大限に発揮されます。新しい市場を開拓したり、投資で大きな利益を上げるのに非常に良い年です。国内を超えて海外へと活動範囲が広がる運気もあります。果敢な決断が良い結果を生みますが、綿密な検討は必須です。\n\n💰 [金運]\n財運が絶頂に達します。予想外の横財数（思いがけない収入）や大規模な事業収益が期待できます。お金の流れにうまく乗れば大きな資産を形成できます。ただし、入ってくる分だけ出ていくお金も大きくなるので管理が重要です。\n\n❤️ [恋愛・対人関係]\n社交性が良くなり、溢れる魅力で周囲に異性が多く集まります。活発な恋愛を楽しむのに良い時期です。恋人がいる場合、華やかなデートや旅行を楽しみ幸せな時間を過ごします。ただし、忙しすぎてパートナーを疎かにしないよう注意してください。\n\n⚠️ [注意点]\n腎臓機能や血液循環に注意してください。また、過度な欲は災いを招く可能性があるため、適度なところで満足する知恵も必要です。';

  @override
  String get sajuFortune2026Gye =>
      '💧 2026年 丙午（ひのえうま）年 癸（みずのと）水 全体運: 「内実を固め実利を得る」\n\n2026年は癸（みずのと）水のあなたにとって「正財（せいざい）」と「偏財（へんざい）」のエネルギーが入ってくる年です。甘い雨が降った後に日差しが差し込み、大地が生命力と豊かさに満ちるようなものです。安定した収入を基に経済的な安定を成し遂げ、ささやかな幸せを見つけるでしょう。\n\n💼 [仕事・ビジネス]\n誠実さと几帳面さで、与えられた業務を完璧に処理します。財務、会計、管理業務などで優れた能力を発揮します。過度な欲よりは、任された仕事に最善を尽くすときに認定と報酬がついてきます。安定した環境で実力を積みながら一歩一歩成長できます。\n\n💰 [金運]\n財運は非常に良いです。着実で安定した収入が発生し、財テクや貯蓄を通じて資産を増やす楽しみを味わえます。小さいけれど確実な利益が集まり、大きな報酬となります。倹約的な消費習慣が光る年です。\n\n❤️ [恋愛・対人関係]\n心優しく繊細な配慮で相手に深い信頼を与えます。日常を共有しながら、小さいけれど温かい愛を育んでいきます。対人関係も円満で平和です。周囲の人々の頼れる相談相手となるでしょう。\n\n⚠️ [注意点]\n目の病気や泌尿器系の健康に注意してください。また、あまりに細かいことにこだわると大きな流れを見逃すことがあるので、時には広い視野で世の中を見る練習もしてください。';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 2025年 乙巳（きのとみ）年 丙（ひのえ）火 全体運: 「情熱溢れる達成と競争」\n\n2025年はあなたにとって「正印（せいいん）」と「比肩（ひけん）」のエネルギーが入ってくる年です。空の太陽が 地上の熱気に出会い、さらに激しく燃え上がるようなものです。強力な支援勢力を得て、自信を持って目標に向かって迷わず突き進むでしょう。\n\n💼 [仕事・ビジネス]\n心強い助っ人やメンターの助けを借りて、大きな成長を遂げることができます。資格取得や学問的な成果を上げるのに非常に有利です。同僚との協業が光り、リーダーシップを発揮してチームを成功に導くでしょう。ただし、過度な競争心は人間関係を損なう可能性があるため注意が必要です。\n\n💰 [金運]\n周囲の人々と情報を共有しながら富を増やす時期です。共同投資や協力による収益が期待できます。ただし、プライドや他人の目を意識して過度な支出をする可能性があるため、実利を重んじることが重要です。\n\n❤️ [恋愛・対人関係]\n人々との集まりが多くなり、友情が深まる年です。恋愛関係では、友達のような心地よさが強まります。ただし、恋人より友達を優先して葛藤が生じる可能性があるため、適切なバランスが必要です。\n\n⚠️ [注意点]\n血圧や心臓など、循環器系の健康に注意してください。また、火のような性格による衝動的な感情が物事を台無しにしないよう、常に心の平安を保つようにしてください。';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 2025年 乙巳（きのとみ）年 丁（ひのと）火 全体運: 「変化の中で見つける安定と機会」\n\n2025年はあなたにとって「偏印（へんいん）」と「劫財（ごうざい）」のエネルギーが入ってくる年です。風に揺れるろうそくの灯のようですが、結局は周囲を照らし、自分の存在感を示すことになるでしょう。予想外の変化が訪れるかもしれませんが、それを賢く克服してチャンスに変える一年になります。\n\n💼 [仕事・ビジネス]\n独創的な アイデアと直感が光ります。他人が考えつかなかったニッチ市場を攻略したり、専門分野で深い成果を上げたりするでしょう。ただし、同僚との競争が激しくなり、成果を横取りしようとする人が現れる可能性があるため、セキュリティ維持と人間関係の管理に注意してください。\n\n💰 [金運]\n財運に変動がある年です。予想外の支出が発生したり、投資で損失を見る可能性があるため、保守的な資産管理が必要です。ただし、自分だけの専門技術を利用した収入は安定して入ってくるでしょう。金銭取引は避けるのが賢明です。\n\n❤️ [恋愛・対人関係]\n考えが多くなり、恋愛に消極的になるかもしれません。恋愛関係では些細なことに失望しやすいため、相手を信頼し、広い心で接することが重要です。一人で過ごす時間を通じて内面を満たすのも良い方法です。\n\n⚠️ [注意点]\nストレスによる神経疾患や不眠症に注意してください。瞑想や軽い運動を通じて心を管理することが重要であり、否定的な考えよりも肯定的なマインドを持つように努力してください。';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ 2025年 乙巳（きのとみ）年 戊（つちのえ）土 全体運: 「知恵深く内面を固める成熟の年」\n\n2025年はあなたにとって「正官（せいかん）」と「偏印（へんいん）」のエネルギーが入ってくる年です。巨大な山の下に温かい熱気が染み込み、すべてを包み込むようなものです。社会的な名誉を守りつつ、自分だけの深みを加える充実した一年になるでしょう。\n\n💼 [仕事・ビジネス]\n組織内で責任ある地位に就いたり、昇進の機会が訪れたりします。原則を重んじ誠実に業務に取り組めば、大きな認めを受けるでしょう。同時に、専門知識の習得や研究課題で優れた成果を上げます。ただし、固定観念に囚われて変化を拒む可能性があるため、柔軟な思考が必要です。\n\n💰 [金運]\n安定した収入が保障されます。誠実に貯蓄し、資産を管理するのが有利です。不動産や文書に関連する運気が良いため、長期的な投資を検討してみる価値があります。ただし、周囲の誘惑に負けて無理な投資をすることは避けてください。\n\n❤️ [恋愛・対人関係]\n重厚な言動で人々から信頼を得ます。恋愛関係では、お互いを尊重し合い真剣な関係へと発展するのに良い時期です。結婚を考えているなら、具体的な計画を立てるのも良いでしょう。\n\n⚠️ [注意点]\n消化器系や皮膚の健康に注意してください。また、考えすぎて決断を下せない「決定障害」を経験する可能性があるため、周囲のアドバイスに耳を傾け、迅速に判断を下す練習をしてください。';

  @override
  String get sajuFortune2025Gi =>
      '🌾 2025年 乙巳（きのとみ）年 己（つちのと）土 全体運: 「責任感を持って目標を達成する」\n\n2025年はあなたにとって「偏官（へんかん）」と「正印（せいいん）」のエネルギーが入ってくる年です。広い大地に雨が降った後、日差しが差し込み穀物が育つようなものです。大変な過程があるかもしれませんが、結局は名誉を手にし、目標を達成するやりがいのある一年になるでしょう。\n\n💼 [仕事・ビジネス]\n業務の強度が高まり、難しい課題が与えられるかもしれません。しかし、それを自分の実力と忍耐で克服し、リーダーとしての資質を証明することになります。目上の人や上司の助けや支持を得て危機を乗り越え、その結果、大きな達成感を味わうでしょう。\n\n💰 [金運]\n支出管理に注意が必要な年です。予想外の税金や公課金など、出ていくお金が多いかもしれません。しかし、たゆまぬ努力の結果としてインセンティブやボーナスを期待できるため、誠実さが富を呼ぶ鍵となります。\n\n❤️ [恋愛・対人関係]\n責任感のある姿が異性に魅力的に映ります。恋愛関係では、お互いの苦労を聞いて慰め合いながら絆が深まります。ただし、忙しい日常のためにパートナーを疎かにする可能性があるため、短くても頻繁に連絡を取り合う努力が必要です。\n\n⚠️ [注意点]\n過労による免疫力低下に注意してください。規則正しい食事と運動で体力を管理し、肯定的な考えでストレスを解消することが重要です。';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ 2025年 乙巳（きのとみ）年 庚（かのえ）金 全体運: 「実利を取りながら名誉を得る」\n\n2025年はあなたにとって「正財（せいざい）」と「偏官（へんかん）」のエネルギーが入ってくる年です。堅い岩が火に熱せられ、貴重な宝剣として生まれ変わるようなものです。努力に対する確実な報酬を得て、社会的に自分の価値を証明することになるでしょう。\n\n💼 [仕事・ビジネス]\n結果中心の思考と推進力で大きな成果を上げます。特に財務、管理、技術分野で能力を認められます。難しい問題を解決して名誉を得る運気が強いですが、責任も大きくなるためプレッシャーを感じるかもしれません。自分を信じて果敢に進んでください。\n\n💰 [金運]\n財運が非常に良いです。安定した収入以外にも、投資や副業を通じて実利的な利益を得られます。お金の流れを正確に把握し、効率的に資産を管理するでしょう。ただし、名誉のために大金を使うことは控えてください。\n\n❤️ [恋愛・対人関係]\n誠実で頼もしい姿で異性にアピールします。恋愛関係では、責任感のある態度で相手に安心感を与えます。人間関係において、やや厳しい印象を与えることがあるため、たまには柔らかなユーモアを交えて会話をすると良いでしょう。\n\n⚠️ [注意点]\n骨や関節の健康、呼吸器疾患に注意してください。また、完璧主義的な傾向から自分を追い詰める可能性があるため、「これくらいで十分だ」という心で自分をなだめてあげてください。';

  @override
  String get sajuFortune2025Sin =>
      '💎 2025年 乙巳（きのとみ）年 辛（かのと）金 全体運: 「変化の中で知恵が光る年」\n\n2025年はあなたにとって「偏財（へんざい）」と「正官（せいかん）」のエネルギーが入ってくる年です。洗練された宝石が華やかな照明の下でその価値を現すようなものです。予想外の横財（思いがけない幸運）と共に社会的な地位も上がる楽しい一年になるでしょう。\n\n💼 [仕事・ビジネス]\n事業的 感覚が冴え、新しい機会を捉える能力が卓越します。果敢な挑戦が大きな利益となって返ってくる時期です。組織内では合理的な判断で信頼を得て、昇進や異動のチャンスを掴むでしょう。ただし、結果にこだわりすぎて過程を疎かにしないよう注意してください。\n\n💰 [金運]\n金運が入ってくる年です。予想外の投資収益や遺産など、大きな富に触れる機会が生じます。ただし、支出も華やかになりやすいため、計画的な消費習慣を維持することが重要です。\n\n❤️ [恋愛・対人関係]\n華やかで魅力的な姿で社交の場の主人公になります。恋愛運が非常に強く、多くの人からアプローチを受けるかもしれません。恋愛関係では、情熱的で楽しい時間を過ごします。真剣な出会いへと発展させるのに良い年です。\n\n⚠️ [注意点]\n肺の健康や皮膚疾患に注意してください。また、過度な自信により周囲に傲慢に見える可能性があるため、常に謙虚さを保ち、他人を思いやる心を忘れないでください。';

  @override
  String get sajuFortune2025Im =>
      '🌊 2025年 乙巳（きのとみ）年 壬（みずのえ）水 全体運: 「知恵を発揮して結実を生み出す」\n\n2025年はあなたにとって「傷官（しょうかん）」と「偏財（へんざい）」のエネルギーが入ってくる年です。大きな川が曲がりくねりながら広い野原を潤すようなものです。自分の才能と言い回しを発揮して大きな富を得て、活動範囲を広げるダイナミックな一年になるでしょう。\n\n💼 [仕事・ビジネス]\n口才（話し方）が良くなり、マーケティングや広報分野で優れた成果を上げます。自分のアイデアを商品化したり、新しい市場を開拓したりするのに非常に良い時期です。クリエイティブな仕事をする人にとっては最高の年になるでしょう。ただし、上司との摩擦が生じる可能性があるため、礼儀を尽くすことが重要です。\n\n💰 [金運]\n財運が活発に動きます。自分の技術で稼ぐ運気が強く、大きなお金を動かす機会が訪れます。ただし、投機的な投資には注意が必要であり、稼いだ分だけ分かち合う心を持ってこそ、財運が長く維持されます。\n\n❤️ [恋愛・対人関係]\n溢れるユーモアと魅力で、周囲に人が絶えません。異性に人気が高く、楽しいデートを楽しめる年です。恋愛関係では、多彩なデートを通じて活力を吹き込みます。ただし、何気ない一言が誤解を招く可能性があるため、言葉選びには注意してください。\n\n⚠️ [注意点]\n腎臓や泌尿器系の健康に注意してください。また、活動範囲が広いため体力を消耗しやすいので、適切な休息と栄養摂取に気を配ってください。';

  @override
  String get sajuFortune2025Gye =>
      '💧 2025年 乙巳（きのとみ）年 癸（みずのと）水 全体運: 「誠実さが安定した結実を生む年」\n\n2025年はあなたにとって「食神（しょくじん）」と「正財（せいざい）」のエネルギーが入ってくる年です。澄んだ霧雨が大地を潤し、豊かな収穫を準備するようなものです。努力が着実に積み重なり、安定した富と幸せとなって返ってくる温かい一年になるでしょう。\n\n💼 [仕事・ビジネス]\n誠実さが最大の武器になる年です。責任を持って業務を遂行し、同僚からの信頼を得て着実な成果を上げます。専門性を高めるのに良い時期であり、自分が好きな仕事を通じてやりがいを感じるでしょう。安定した環境で一歩一歩成長できます。\n\n💰 [金運]\n経済的にゆとりがあり安定した時期です。着実な収入が発生し、コツコツと資産を増やす楽しみを感じるでしょう。衣食住の運があり、生活全般に豊かさが溢れます。無理な投資よりも貯蓄が有利です。\n\n❤️ [恋愛・対人関係]\n温かい心でパートナーに安心感を与えます。お互いを細やかに気遣いながら、美しい愛を育んでいく年です。シングルの場合は、会話が弾み価値観の似た相手に出会う確率が高いです。\n\n⚠️ [注意点]\n胃腸の健康や食習慣の管理に注意してください。安住しすぎて怠惰になる可能性があるため、たまには新しい刺激を与えて活力を探すのが良いでしょう。';

  @override
  String get preparationForTomorrow => '明日のための準備';

  @override
  String get howToMeetMoreLuck => 'もっと幸運に出会う方法';

  @override
  String get enterName => '名前を入力してください';

  @override
  String fortuneDateConfirm(String date) {
    return '$dateの運勢を確認しますか？';
  }

  @override
  String get colorPurple => '紫';

  @override
  String get colorBlue => '青';

  @override
  String get colorYellow => '黄';

  @override
  String get colorRed => '赤';

  @override
  String get colorGreen => '緑';

  @override
  String get colorPink => 'ピンク';

  @override
  String get colorOrange => 'オレンジ';

  @override
  String get colorWhite => '白';

  @override
  String get colorBlack => '黒';

  @override
  String get itemPerfume => '香水';

  @override
  String get itemHandkerchief => 'ハンカチ';

  @override
  String get itemRing => '指輪';

  @override
  String get itemWatch => '時計';

  @override
  String get itemGlasses => 'メガネ';

  @override
  String get itemHat => '帽子';

  @override
  String get itemBook => '本';

  @override
  String get itemEarphones => 'イヤホン';

  @override
  String get itemMirror => '鏡';

  @override
  String get itemPen => 'ペン';

  @override
  String get itemCoin => 'コイン';

  @override
  String get itemKey => '鍵';

  @override
  String get dirEast => '東';

  @override
  String get dirWest => '西';

  @override
  String get dirSouth => '南';

  @override
  String get dirNorth => '北';

  @override
  String get dirNorthEast => '北東';

  @override
  String get dirSouthEast => '南東';

  @override
  String get dirNorthWest => '北西';

  @override
  String get dirSouthWest => '南西';

  @override
  String get general => '一般';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get darkModeDescription => '画面を暗く設定します。';

  @override
  String get alarmSettings => 'アラーム設定';

  @override
  String get privacySettings => 'プライバシー設定';

  @override
  String get information => '情報';

  @override
  String get notice => 'お知らせ';

  @override
  String get weatherConditionSunny => '晴れ';

  @override
  String get weatherConditionPartlyCloudy => '時々くもり';

  @override
  String get weatherConditionCloudy => 'くもり';

  @override
  String get weatherConditionFoggy => '霧';

  @override
  String get weatherConditionDrizzle => '霧雨';

  @override
  String get weatherConditionRainy => '雨';

  @override
  String get weatherConditionFreezingRain => '着氷性の雨';

  @override
  String get weatherConditionSnowy => '雪';

  @override
  String get weatherConditionSnowGrains => '霧雪';

  @override
  String get weatherConditionRainShowers => 'にわか雨';

  @override
  String get weatherConditionSnowShowers => 'にわか雪';

  @override
  String get weatherConditionThunderstorm => '雷雨';

  @override
  String get airQualityGood => '良い';

  @override
  String get airQualityNormal => '普通';

  @override
  String get airQualityBad => '悪い';

  @override
  String get airQualityVeryBad => '非常に悪い';

  @override
  String get locationUnknown => '不明な位置';

  @override
  String get locationError => '位置情報エラー';

  @override
  String get faq => 'よくある質問';

  @override
  String get sendFeedback => 'フィードバックを送る';

  @override
  String get feedbackDescription =>
      'フォーチュンアラームをご利用中にご不便な点やご要望がございましたら、いつでもお知らせください。\n皆様の貴重なご意見がより良いサービスを作ります。';

  @override
  String get reportCopyright => '著作権侵害を報告する';

  @override
  String get copyrightDescription =>
      'フォーチュンアラーム内のコンテンツが著作権を侵害していると思われる場合は、その内容をメールで報告してください。\n確認後、速やかに対応いたします。';

  @override
  String get termsOfService => '利用規約';

  @override
  String get privacyPolicy =>
      '利用規約およびプライバシーポリシー\n\n1. 総則\n\n第1条（目的）\n本規約は、「フォーチュンアラーム」（以下「本サービス」）が提供するサービスの利用条件および手続、利用者と開発者の権利・義務・責任等を定めることを目的とします。\n\n第2条（プライバシーポリシー）\n\n1. 個人情報の収集項目および方法\n本サービスは会員登録なしで利用でき、利用者の個人情報を別途サーバーに保存または収集しません。\nただし、サービス利用の過程で次の情報が生成され、端末内に保存される場合があります：\n- アラーム設定、ミッション達成記録、フォーチュンクッキー獲得履歴 など\n\n2. 端末権限の利用について\n本サービスは、機能提供に必要な範囲で次の権限を利用します：\n- 通知（必須）：アラーム実行およびフォーチュンクッキー通知のため\n- 正確なアラーム／バッテリー最適化の除外（必須）：省電力時でも定刻に鳴動させるため\n- 他のアプリの上に表示（必須）：ロック画面や他アプリ使用中でもアラーム画面を表示するため\n- カメラ（任意）：「オブジェクトスナップ」ミッションでのみ使用。撮影画像は端末内で処理され、サーバーへ送信されません。\n\n3. 広告サービスとデータ処理\n本サービスは無料提供のため、Google AdMob を利用して広告を配信します。\nGoogle は広告の最適化のために広告識別子（ADID）等の非個人情報を収集する場合があります。\n- Google プライバシーポリシー：https://policies.google.com/privacy\n\n第3条（データの保存および削除）\n本サービスは利用者の端末にデータを保存するローカルアプリです。\nアプリを削除すると、端末内に保存されたすべてのデータ（アラーム、ミッション記録等）は直ちに削除され、復元できません。\n\n第4条（免責）\n1. 本サービスが提供する運勢情報は娯楽目的の参考情報であり、正確性・信頼性を保証しません。\n2. 端末設定の変更（通知オフ、バッテリー最適化等）やシステム不具合によりアラームが鳴らない場合、開発者は責任を負いません。\n\n第5条（お問い合わせ）\n本サービスに関するお問い合わせは下記メールアドレスまでご連絡ください。\nメール：seriessnap.co@gmail.com';

  @override
  String get alarmOptimization => 'アラーム最適化';

  @override
  String get allOptimizationsCompleted => 'すべての最適化設定が完了しました';

  @override
  String get optimizationNeeded => '正確なアラームのために設定が必要です。';

  @override
  String get optimizationDescription =>
      'Androidシステムの設定により、アラームが遅れたり鳴らなかったりすることがあります。すべての項目を「許可」に設定してください。';

  @override
  String get allowNotificationPermission => '通知権限を許可';

  @override
  String get notificationPermissionDescription => 'アラーム発生時に通知を表示するために必要です。';

  @override
  String get excludeBatteryOptimization => '電池の最適化から除外';

  @override
  String get batteryOptimizationDescription => '省電力モードでもアラームが即座に鳴るようにします。';

  @override
  String get allowExactAlarm => '正確なアラームを許可';

  @override
  String get exactAlarmDescription => 'システムによって遅延されることなく、定刻にアラームを鳴らします。';

  @override
  String get drawOverOtherApps => '他のアプリの上に重ねて表示';

  @override
  String get overlayDescription => 'ロック画面や他のアプリの使用中にもアラーム画面を表示します。';

  @override
  String get allSettingsCompleted => 'すべての設定が完了しました。';

  @override
  String get allowAllItems => 'すべての項目を許可してください';

  @override
  String get manualSettingsInfo => '設定の解除は、Androidシステムの設定から直接行うことができます。';

  @override
  String get takePhoto => '撮影する';

  @override
  String get selectPhoto => '選択する';

  @override
  String get selectAlarmBackground => 'アラーム背景の選択';

  @override
  String get defaultLabel => 'デフォルト';

  @override
  String get howToAdd => '追加方法';

  @override
  String get addAssetInstructions =>
      'assets/images/ フォルダに画像を入れ、pubspec.yamlに登録してください。';

  @override
  String get ringingNow => '今鳴っています';

  @override
  String get setTime => '時間設定';

  @override
  String get repeatDays => '繰り返し曜日';

  @override
  String get repeatDaily => '毎日繰り返し';

  @override
  String get snoozeSettings => 'スヌーズ設定';

  @override
  String get wakeUpAlarm => '起床アラーム';

  @override
  String get daySun => '日';

  @override
  String get dayMon => '月';

  @override
  String get dayTue => '火';

  @override
  String get dayWed => '水';

  @override
  String get dayThu => '木';

  @override
  String get dayFri => '金';

  @override
  String get daySat => '土';

  @override
  String get daySunFull => '日曜日';

  @override
  String get dayMonFull => '月曜日';

  @override
  String get dayTueFull => '火曜日';

  @override
  String get dayWedFull => '水曜日';

  @override
  String get dayThuFull => '木曜日';

  @override
  String get dayFriFull => '金曜日';

  @override
  String get daySatFull => '土曜日';

  @override
  String get missionRewardEarned =>
      'おめでとうございます！今日のミッション5つを完了し、フォーチュンクッキー1個を獲得しました！';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'おめでとうございます！今日は$missions個のミッションを達成し、フォーチュンクッキーを$cookies個獲得しました！';
  }

  @override
  String daysCount(int count) {
    return '$count日';
  }

  @override
  String get user => 'ユーザー';

  @override
  String get member => '会員';

  @override
  String get manageSajuInfo => '四柱推命情報の管理';

  @override
  String get freeCharge => '無料充電';

  @override
  String get fortunePass => 'フォーチュンパス';

  @override
  String get unlimitedNotSubscribed => '無制限未購読';

  @override
  String get unlimitedInUse => '無制限利用中';

  @override
  String get subscribe => '購読する';

  @override
  String get manageSubscription => '購読管理';

  @override
  String get purchaseHistory => '購入履歴';

  @override
  String get customerCenter => 'カスタマーセンター';

  @override
  String get noNewNotifications => '新しいお知らせはありません。';

  @override
  String get noPurchaseHistory => '購入履歴がありません。';

  @override
  String get none => 'なし';

  @override
  String deleteConfirmMessage(String title) {
    return '\"$title\"を削除しますか？';
  }

  @override
  String get delete => '削除';

  @override
  String get notepad => 'メモ帳';

  @override
  String get today => '今日';

  @override
  String get yearView => '年';

  @override
  String get monthView => '月';

  @override
  String get weekView => '週';

  @override
  String get dayView => '日';

  @override
  String get noEvents => '予定がありません。';

  @override
  String get calendarDragGuide => '下にドラッグして詳細なカレンダーを表示。';

  @override
  String get noSavedMemos => '保存されたメモや予定はありません。';

  @override
  String get holiday => '祝日';

  @override
  String get photo => '写真';

  @override
  String get drawing => 'お絵かき';

  @override
  String get drawingTitle => 'お絵かき';

  @override
  String get pencil => '鉛筆';

  @override
  String get marker => 'マーカー';

  @override
  String get eraser => '消しゴム';

  @override
  String adjustThickness(String label) {
    return '$labelの太さを調整';
  }

  @override
  String get sticker => 'ステッカー';

  @override
  String get event => 'イベント';

  @override
  String get memo => 'メモ';

  @override
  String get routineExercise => '運動';

  @override
  String get routineHiking => 'ハイキング';

  @override
  String get routineCleaning => '掃除';

  @override
  String get routineTravel => '旅行';

  @override
  String get routineDate => 'デート';

  @override
  String get routineConcert => 'コンサート';

  @override
  String get routineMovie => '映画';

  @override
  String get routineMeeting => '会議';

  @override
  String get howIsYourMoodToday => '今日の気分はどうですか？';

  @override
  String get complete => '完了';

  @override
  String get amWithIcon => '☀️ 午前';

  @override
  String get pmWithIcon => '🌙 午後';

  @override
  String get photoPermissionDescription => '写真を追加するには、設定で写真へのアクセスを許可する必要があります。';

  @override
  String get goToSettings => '設定へ移動';

  @override
  String get photoPermissionNeeded => '写真へのアクセス権限が必要です。';

  @override
  String get fontSize => 'フォントサイズ';

  @override
  String get fontFamily => 'フォント';

  @override
  String get textColor => 'テキストの色';

  @override
  String get textAlign => '整列';

  @override
  String get alignLeft => '左寄せ';

  @override
  String get alignCenter => '中央寄せ';

  @override
  String get alignRight => '右寄せ';

  @override
  String get edit => '編集';

  @override
  String get fontSettings => 'フォント設定';

  @override
  String get imageAddedFromKeyboard => 'キーボードから画像が追加されました。';

  @override
  String get cancelWriting => '作成をキャンセル';

  @override
  String get cancelWritingConfirm => '作成中の内容があります。キャンセルして終了しますか？';

  @override
  String get continueWriting => '作成を続ける';

  @override
  String get title => 'タイトル';

  @override
  String get content => '内容';

  @override
  String get selectTime => '時間を選択';

  @override
  String get noTime => '時間なし';

  @override
  String minutesLater(String minutes) {
    return '$minutes分後';
  }

  @override
  String get countLabel => '回数';

  @override
  String timesCount(String count) {
    return '$count回 (合計$count回)';
  }

  @override
  String get wakeUpMission => '起床ミッション';

  @override
  String get alarmSound => 'アラーム音';

  @override
  String get gradualVolume => 'だんだん大きく';

  @override
  String get vibration => 'バイブレーション';

  @override
  String get alarmNameAndBackground => 'アラーム名と背景';

  @override
  String get customStyle => 'カスタムスタイル';

  @override
  String get alarmName => 'アラーム名';

  @override
  String get enterAlarmName => 'アラーム名を入力してください';

  @override
  String get routineSummary => 'ルーチン要約';

  @override
  String get alarmOn => 'アラーム ON';

  @override
  String get alarmOff => 'アラーム OFF';

  @override
  String get contentHint => '内容を追加';

  @override
  String get addEvent => 'イベント追加';

  @override
  String get manageItem => 'アイテム管理';

  @override
  String get manageItemDescription => 'このアイテムをどうしますか？';

  @override
  String get noTitle => 'タイトルなし';

  @override
  String get selectTitleColor => 'タイトルの色を選択';

  @override
  String get save => '保存';

  @override
  String get missionNone => 'ミッションなし';

  @override
  String get missionSnap => '物体撮影';

  @override
  String get missionMath => '計算';

  @override
  String get missionFortune => '運勢';

  @override
  String get missionShake => '振る';

  @override
  String get missionFortuneCatch => 'フォーチュニキャッチ';

  @override
  String get missionNoDescription => 'ミッションなしでアラームが鳴ります。';

  @override
  String get missionCameraDescription => '指定された物体を順番に撮影するとアラームが止まります。';

  @override
  String get missionMathDescription => '数学問題を解くとアラームが止まります。';

  @override
  String get missionFortuneDescription => '運勢ミッションが選択されました。';

  @override
  String get missionShakeDescription => '携帯電話を振るとアラームが止まります。';

  @override
  String get missionFortuneCatchDescription => '動くフォーチュニを捕まえよう！';

  @override
  String get missionWalk => '歩く';

  @override
  String get missionWalkDescription => '歩いてアラームを止めよう！';

  @override
  String get missionFaceDescription => '顔を枠内に5秒キープしてください。';

  @override
  String get walkStepCount => '目標歩数';

  @override
  String walkSteps(int count) {
    return '$count歩';
  }

  @override
  String get missionNumberOrder => '数字順';

  @override
  String get missionNumberOrderDescription => '1から9まで順番にタップしてください。';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return '次: $nextNumber';
  }

  @override
  String get missionHiddenButton => '位置記憶';

  @override
  String get missionHiddenButtonDescription => '光ったタイルを順番に覚えて、10秒以内にタップしてください。';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => '連打スプリント';

  @override
  String get missionTapSprintDescriptionShort => 'タップしてメーターを満たす。';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return '$goalTaps回以上タップしてメーターを満たす。';
  }

  @override
  String get missionTapSprintTapHere => 'タップ';

  @override
  String get missionTapSprintHint => 'すぐ溜まりますが、止めると減ります。';

  @override
  String get missionLeftRight => '左 / 右';

  @override
  String get missionLeftRightDescriptionShort => '指示に従って左か右を選んでください。';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return '$targetStreak回連続で正解しましょう。';
  }

  @override
  String get missionLeftRightPromptLeft => '左をタップ';

  @override
  String get missionLeftRightPromptRight => '右をタップ';

  @override
  String get left => '左';

  @override
  String get right => '右';

  @override
  String get missionHintInactivity => '2分停止するとリセットされます。';

  @override
  String fortuneCatchScore(int score) {
    return 'スコア: $score';
  }

  @override
  String get fortuneCatchGoal => '目標: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '（捕獲: $count/$min）';
  }

  @override
  String fortuneCatchTime(int seconds) {
    return 'タイム: $seconds秒';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return 'ベスト: $seconds秒';
  }

  @override
  String get fortuneCatchAngryHint => '怒ったフォーチュニーはペナルティです！';

  @override
  String get fortuneCatchInstruction => '怒ったフォーチュニーを避けて捕まえよう！';

  @override
  String fortuneCatchPointMinus(int points) {
    return '$points点 減点';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points点';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo コンボ！';
  }

  @override
  String get difficulty => '難易度';

  @override
  String get difficultyEasy => '易しい';

  @override
  String get difficultyNormal => '普通';

  @override
  String get difficultyHard => '難しい';

  @override
  String get problemCount => '問題数';

  @override
  String problemsCount(int count) {
    return '$count問';
  }

  @override
  String missionAnalyzing(int index, int total) {
    return 'ミッション $index/$total 分析中...';
  }

  @override
  String missionPointObject(int index, int total) {
    return 'ミッション $index/$total: ガイドの物体を指してください。';
  }

  @override
  String get missionPointSink => '流し台を指してください。';

  @override
  String get missionPointRefrigerator => '冷蔵庫を指してください。';

  @override
  String get missionPointScale => '体重計を指してください。';

  @override
  String get missionPointFace => '顔を指してください。';

  @override
  String get missionPointObjectGeneric => '指定された物体を指してください。';

  @override
  String get missionRecognizeObject => '物体を認識させてください。';

  @override
  String get missionPerform => 'ミッションを実行してください。';

  @override
  String get initError => '初期化中にエラーが発生しました。';

  @override
  String get analyzingNextTarget => '次のターゲットを分析中...';

  @override
  String get errorOccurredGeneric => 'エラーが発生しました';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total 成功！';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total 成功！マッチング成功！';
  }

  @override
  String get escape => '終了';

  @override
  String get pointObjectClearly => '対象がはっきり見えるように撮影してください';

  @override
  String get matchingSuccess => 'マッチング成功！';

  @override
  String get missionComplete => 'ミッション完了！';

  @override
  String get allMissionsComplete => 'すべてのミッション完了！';

  @override
  String missionSnoozeMessage(String minutes) {
    return 'ミッション成功！設定により$minutes分後に再度鳴ります。';
  }

  @override
  String get showFace => '顔を見せてください';

  @override
  String get keepWatching => '画面を見続けてください';

  @override
  String get recognizingFaceForFortune => '観相分析のために顔を認識しています';

  @override
  String get dataNotStored => 'データは保存されません';

  @override
  String get solveProblem => '問題を解いてください。';

  @override
  String get correctAnswer => '正解です！';

  @override
  String get wrongAnswerRetry => '不正解です。もう一度お試しください。';

  @override
  String get correct => '正解！';

  @override
  String get walkToDismiss => 'スマートフォンを持って歩いてください';

  @override
  String get shakeCount => '振った回数';

  @override
  String shakeTimes(int count) {
    return '$count回';
  }

  @override
  String tapTimes(int count) {
    return 'タップ $count回';
  }

  @override
  String missionNumber(int number) {
    return 'ミッション $number';
  }

  @override
  String get soundBirds => '鳥の鳴き声';

  @override
  String get shakeCountLabel => '振る回数';

  @override
  String missionIndex(int index) {
    return 'ミッション $index';
  }

  @override
  String get ringtoneSelect => 'ベル音選択';

  @override
  String get vibrationSelect => 'バイブレーションパターンの選択';

  @override
  String get selectMissionTitle => 'アラーム解除ミッションを選択してください。';

  @override
  String get ringtoneCategoryStandard => '標準';

  @override
  String get ringtoneCategoryCalm => '穏やか';

  @override
  String get ringtoneCategoryUpbeat => '明るい';

  @override
  String get ringtoneCategoryLoud => '大きい';

  @override
  String get noRingtones => '着信音が見つかりません。';

  @override
  String get photoPermissionRequired => '写真へのアクセス権限が必要です。';

  @override
  String get deleteImage => '画像を削除';

  @override
  String get longPressToDelete => '長押しで削除します。';

  @override
  String get videoLoadFail => '動画の読み込みに失敗しました\nタップして再試行';

  @override
  String get existingCapturedImages => '既存の撮影画像';

  @override
  String deleteCount(int count) {
    return '$count個を削除';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return '$count個の画像を削除しますか？\nこの操作は取り消せません。';
  }

  @override
  String get classicAlarm => 'クラシックアラーム';

  @override
  String get digitalAlarm => 'デジタルアラーム';

  @override
  String get birdsSound => '鳥のさえずり';

  @override
  String get wavesSound => '波の音';

  @override
  String get cuckooClock => '鳩時計';

  @override
  String get calmAlarm => '穏やかなアラーム';

  @override
  String get doorKnock => 'ドアをノックする音';

  @override
  String get earlySunrise => '朝の日の出';

  @override
  String get goodMorningSound => 'グッドモーニング';

  @override
  String get inAHurry => '急いでいる時';

  @override
  String get lovingYou => 'ラビング・ユー';

  @override
  String get sirenSound => 'サイレン';

  @override
  String get swingingSound => 'スウィング';

  @override
  String get telephoneBusy => '話し中の電話音';

  @override
  String get shortVibration => '短い繰り返し';

  @override
  String get longVibration => '長い繰り返し';

  @override
  String get heartbeatVibration => '心臓の鼓動';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => '速い鼓動';

  @override
  String get exactAlarmPermissionDesc =>
      'アラームを正確な時間に鳴らすには、「スケジュールとリマインダー」権限が必要です。';

  @override
  String get batteryOptimizationPermissionDesc =>
      'アラームを時間通りに鳴らすには、バッテリーの最適化を無効にする必要があります。';

  @override
  String get overlayPermissionDesc =>
      'アラーム作動時にミッション画面を表示するには、「他のアプリの上に表示」権限が必要です。';

  @override
  String get cameraMissionFirstImageError => '少なくとも最初のミッション画像を設定してください。';

  @override
  String get retry => '再試行';

  @override
  String get exactAlarmPermissionFail =>
      'アラームの登録に失敗しました。正確なアラーム権限が無効になっているため、設定が必要です。';

  @override
  String get batteryOptimizationPermissionFail =>
      'アラームの登録に失敗しました。バッテリーの最適化例外権限がないため、設定が必要です。';

  @override
  String get overlayPermissionFail =>
      'アラームの登録に失敗しました。「他のアプリの上に表示」権限がないため、設定が必要です。';

  @override
  String get unknownAlarmError => 'アラームの登録に失敗しました。不明なエラーが発生しました。';

  @override
  String get resetTooltip => '初期化';

  @override
  String get errorLoadingAlarm => 'アラーム情報の読み込みに失敗しました。';

  @override
  String get alarmNotFound => 'アラーム情報が見つかりません。';

  @override
  String repeatAlarmCount(int current, int max) {
    return '繰り返しアラーム ($current/$max)';
  }

  @override
  String get turnOffAlarm => 'アラームを止める';

  @override
  String get startMission => 'ミッション開始';

  @override
  String get alarmSnooze => 'アラームをスヌーズ';

  @override
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes分（無制限）';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes分（$current/$total）';
  }

  @override
  String get ringtone_fluttering_day => 'ときめく一日';

  @override
  String get ringtone_cozy_day => 'ほっとする一日';

  @override
  String get ringtone_sensible_day => '落ち着いた一日';

  @override
  String get ringtone_play_with_me => '一緒に遊ぼう';

  @override
  String get ringtone_refreshing_day => 'さわやかな一日';

  @override
  String get ringtone_new_beginning => '新しい始まり';

  @override
  String get ringtone_self_love => 'セルフラブ';

  @override
  String get cherry_stained_finger => 'チェリー色の指 (Cherry Stained Finger)';

  @override
  String get dancing_in_the_stars => '星影のダンス (Dancing In The Stars)';

  @override
  String get nice_day => '良き日 (Nice Day)';

  @override
  String get fortuneTitle => '運勢を確認する';

  @override
  String get fortuneMessage => '運勢の結果を確認して、\n隠されたプレゼントも手に入れましょう！';

  @override
  String get fortuneAdButton => '広告を見て結果を確認';

  @override
  String get fortuneLoadingMessage => '占い師の特別なタロット解釈を体験してください。';

  @override
  String fortuneAnalyzing(int progress) {
    return '選択したタロットを分析しています... $progress%';
  }

  @override
  String get fortuneSelectTitle => '今日の運気を感じながら、\nカードを3枚選んでください。';

  @override
  String fortuneSelectTitleDate(String month, int day) {
    return '$month月$day日の運気を感じながら、\nカードを3枚選んでください。';
  }

  @override
  String get fortuneNewYearButton => '2026年の新正月運勢を見る';

  @override
  String get loveFortune => '恋愛運';

  @override
  String get wealthFortune => '金運';

  @override
  String get successFortune => '成功運';

  @override
  String get fortuneResultTitle => '今日の運勢の結果です。';

  @override
  String fortuneResultTitleDate(int year, String month, int day) {
    return '$year年$month月$day日の運勢';
  }

  @override
  String get startDayButton => '今日一日を始める';

  @override
  String get tarotName0 => '愚者';

  @override
  String get tarotName1 => '魔術師';

  @override
  String get tarotName2 => '女教皇';

  @override
  String get tarotName3 => '女帝';

  @override
  String get tarotName4 => '皇帝';

  @override
  String get tarotName5 => '法王';

  @override
  String get tarotName6 => '恋人';

  @override
  String get tarotName7 => '戦車';

  @override
  String get tarotName8 => '力';

  @override
  String get tarotName9 => '隠者';

  @override
  String get tarotName10 => '運命の輪';

  @override
  String get tarotName11 => '正義';

  @override
  String get tarotName12 => '吊るされた男';

  @override
  String get tarotName13 => '死神';

  @override
  String get tarotName14 => '節制';

  @override
  String get tarotName15 => '悪魔';

  @override
  String get tarotName16 => '塔';

  @override
  String get tarotName17 => '星';

  @override
  String get tarotName18 => '月';

  @override
  String get tarotName19 => '太陽';

  @override
  String get tarotName20 => '審判';

  @override
  String get tarotName21 => '世界';

  @override
  String get tarotKeywords0 => '新たな始まり, 冒険, 純粋, 自由, 軽率';

  @override
  String get tarotDesc0 => '愚者は華やかな服をまとい、崖の縁に危うく立っていますが、視線は遠くを向いて希望に満ちています。';

  @override
  String get tarotLoveMeaning0 => '予期せぬ新しい愛が訪れたり、一目惚れするような運命的な出会いがあるかもしれません。';

  @override
  String get tarotLoveDetail0 =>
      '子供のような純粋な心で愛を始めることができる時期です。過去の傷や複雑な条件はすべて忘れ、今この瞬間の感情に忠実になってみてください。';

  @override
  String get tarotWealthMeaning0 =>
      '新しい投資先やビジネスアイテムが目に入るかもしれません。お金に縛られず、楽しく働くことで収益がついてくる時期です。';

  @override
  String get tarotWealthDetail0 =>
      '金銭的に新しい機会が開かれる時期です。他人が試したことのない新しい分野や独創的なアイテムに投資すれば、意外な成果を収めることができます。';

  @override
  String get tarotSuccessMeaning0 => '新しいプロジェクトを始めたり、全く別の分野へ転職するのに良い時期です。';

  @override
  String get tarotSuccessDetail0 =>
      '現在準備していることがあるなら、果敢に第一歩を踏み出してください。慣れ親しんだ環境を離れ、新しい挑戦をするのに最も適した時期です。';

  @override
  String get tarotKeywords1 => '創造性, 自信, 器用さ, 意志力, 潜在能力';

  @override
  String get tarotDesc1 =>
      '魔術師は片手を天に、もう片手を地に向け、無限の可能性を象徴しています。テーブルの上には4つの元素（ワンド、カップ、ソード、ペンタクル）が置かれており、すべてを現実に変える力を持っていることを示しています。';

  @override
  String get tarotLoveMeaning1 =>
      '自分の魅力を存分に発揮できる時期です。自信を持ってアプローチすれば、望む愛を手に入れることができるでしょう。';

  @override
  String get tarotLoveDetail1 =>
      'あなたの魅力と才能が光を放ち、異性の心をつかむ絶好の機会です。気になる相手がいるなら、迷わず積極的にアプローチしてください。あなたのユーモアとセンスのある会話が相手を楽しま、関係を主導的に導くことができるでしょう。自分を信じて、堂々と愛を勝ち取ってください。';

  @override
  String get tarotWealthMeaning1 => 'あなたの能力と技術を活用して収益を創出できる適期です。';

  @override
  String get tarotWealthDetail1 =>
      'あなたが持っている知識、技術、アイデアがすぐにお金になる時期です。単に給料を受け取ることに満足せず、副業や複業などを通じて追加収益を創出してみてください。独創的な企画や営業能力が卓越に発揮され、期待以上の収益を上げることができるでしょう。';

  @override
  String get tarotSuccessMeaning1 => '業務能力が卓越に発揮され、周囲の認めを受けます。';

  @override
  String get tarotSuccessDetail1 =>
      '職場や学業において、あなたの能力を十分に発揮して頭角を現すことができます。どんな問題が起きても、あなたならではの機転と知恵で解決でき、周囲の同僚や上司から「実力者」として認められるようになります。自信を持って、堂々と実力を見せてください。';

  @override
  String get tarotKeywords2 => '直感, 知恵, 神秘, 秘密, プラトニック';

  @override
  String get tarotDesc2 =>
      '神秘的なベールの後ろに座っている女教皇は、手に知恵の巻物を持ち、バランスを保ちながら深い洞察力を象徴しています。';

  @override
  String get tarotLoveMeaning2 => '精神的な交感が重要なプラトニックな愛を意味します。';

  @override
  String get tarotLoveDetail2 =>
      '肉体的な魅力よりも、精神的な深さと会話が通じる人に惹かれるようになります。相手の心を見抜く直感力が発達し、言葉にしなくてもお互いの感情を理解できるでしょう。しかし、あまりにも慎重な態度は誤解を招くことがあるので、たまには素直に心を表現してみてください。';

  @override
  String get tarotWealthMeaning2 => '今は積極的に投資するよりも、資産を守り状況を静観すべき時です。';

  @override
  String get tarotWealthDetail2 =>
      '目の前の利益を追ってむやみに動くよりも、冷徹に市場状況を分析し勉強すべき時期です。今は種をまいて待つ時期なので、当面の収益が出ないからといって焦らないでください。不動産や株式など、長期的な観点からの投資を考慮するのが良いでしょう。';

  @override
  String get tarotSuccessMeaning2 => '学業、研究、専門職分野で良い成果を出すことができます。';

  @override
  String get tarotSuccessDetail2 =>
      '表向きに華やかに現れる成果よりも、内実を固めて実力を育てることに集中すべきです。研究、企画、分析など深い思考が必要な業務で卓越した成果を出すことができます。あなたの賢明で慎重な態度は、決定的な瞬間に問題解決の鍵となるでしょう。';

  @override
  String get tarotKeywords3 => '豊穣, 母性, 自然, 美しさ, 結実';

  @override
  String get tarotDesc3 => '豊かな自然の中でリラックスして座っている女帝は、物質的、精神的な豊かさの象徴です。';

  @override
  String get tarotLoveMeaning3 => '愛が溢れ、関係がさらに深まる時期です。';

  @override
  String get tarotLoveDetail3 =>
      'あなたの女性らしい（または包容力のある）魅力が最大化され、異性に非常に魅力的に映る時期です。恋愛中なら、相手を温かく包み込み、気遣う姿で大きな愛を受けることになり、結婚の話が出るかもしれません。ソロなら、外見を整えたりスタイルを変化させてみることが恋愛運を高めるのに大きな助けになります。';

  @override
  String get tarotWealthMeaning3 => '物質的に非常に豊かで安定した時期です。';

  @override
  String get tarotWealthDetail3 =>
      '財物運が大きく花開く時期です。努力した分、いやそれ以上の報酬が伴い、経済的に余裕を満喫することができます。事業や投資で期待以上の収益を収めたり、思いがけないボーナスやプレゼントを受け取ることもあります。豊かなエネルギーを周囲の人々と分かち合えば、さらに大きな幸運が訪れるでしょう。';

  @override
  String get tarotSuccessMeaning3 => '進行中のプロジェクトが順調に成長し、良い成果を出します。';

  @override
  String get tarotSuccessDetail3 =>
      '仕事の結果が目に見えて現れる時期です。プロジェクトが成功裏に終わり、成果給を受け取ったり昇進の機会を掴むことができます。特に美的感覚や創造力が必要な分野で、あなたの才能が光を放ちます。余裕を持って過程を楽しみながら働くことが、むしろより良い結果をもたらすでしょう。';

  @override
  String get tarotKeywords4 => '権威, 構造, 安定, リーダーシップ, 責任感';

  @override
  String get tarotDesc4 => '硬い石の玉座に座った皇帝は、鎧を身にまとい、確固たる支配力と秩序を象徴しています。';

  @override
  String get tarotLoveMeaning4 => '信頼でき、責任感のある相手との安定した恋愛を意味します。';

  @override
  String get tarotLoveDetail4 =>
      '燃え上がるような情熱よりも、信頼と安定をベースにした関係が持続します。相手があなたを心強く守り、リードしてくれるでしょう。ただし、あまりにもコントロールしようとしたり、意地を張ったりしないように注意してください。ソロなら、能力があり社会的地位がある人に出会う機会が生まれるでしょう。';

  @override
  String get tarotWealthMeaning4 => '体系的な資産管理で安定した富を蓄積できます。';

  @override
  String get tarotWealthDetail4 =>
      '金銭管理において原則と計画を立てることが重要です。一攫千金を狙う投機よりも、定期預金、不動産など安全で確実な資産に投資して基盤を固めるのが良いでしょう。あなたの現実的な判断力と推進力が、富を蓄積するのに大きな助けになるでしょう。';

  @override
  String get tarotSuccessMeaning4 => '職場で昇進したり、リーダーの座に就くことができる運気です。';

  @override
  String get tarotSuccessDetail4 =>
      '組織内でのあなたの立場が固まる時期です。リーダーシップを認められ、チームリーダーや管理職に昇進することができ、重要なプロジェクトの総括責任を任されることもあるでしょう。感情に振り回されず、理性的で冷徹な判断で業務を処理し、上司の信頼を得るでしょう。';

  @override
  String get tarotKeywords5 => '伝統, 教え, 信念, 助言, 仲裁';

  @override
  String get tarotDesc5 => '法王は社会的規範と伝統を重視し、賢明な助言で人々を導く精神的な師です。';

  @override
  String get tarotLoveMeaning5 => '信頼と尊重をベースにした真剣で健全な出会いが続きます。';

  @override
  String get tarotLoveDetail5 =>
      '軽い出会いよりも、結婚を前提とした真剣な交際を望むようになります。紹介や合コン、あるいは健全な集まりで良い縁に出会うことができます。恋人との間に葛藤があるなら、周囲の大人や先輩に助言を求めてみてください。彼らの賢明な助言が関係回復に大きな助けになるでしょう。';

  @override
  String get tarotWealthMeaning5 => '伝統的で安全な方式の財テクが良いでしょう。';

  @override
  String get tarotWealthDetail5 =>
      '冒険的な投資よりも安定性を最優先にすべきです。銀行の預貯金や保険など伝統的な金融商品を活用するのが良いでしょう。専門家のコンサルティングを受けてみたり、正直で透明な金銭取引を維持することが、あなたの信用と財産を守る道です。';

  @override
  String get tarotSuccessMeaning5 => '契約、提携、協力関係が円満に締結される運気です。';

  @override
  String get tarotSuccessDetail5 =>
      '一人で問題を解決しようとするよりも、周囲の助けを借りるのが賢明です。職場の同僚や上司、メンターなど目上の人に助言を求めれば、意外と簡単に解決策を見つけることができます。社内の規則と手順をよく守ることが良い評価を受ける近道であり、重要な契約を締結するのにも良い運気です。';

  @override
  String get tarotKeywords6 => '愛, 調和, 選択, 結合, パートナーシップ';

  @override
  String get tarotDesc6 => '温かい太陽の下、天使の祝福を受けるアダムとイブが立っています。';

  @override
  String get tarotLoveMeaning6 => '愛が花開く最高の時期の一つです。';

  @override
  String get tarotLoveDetail6 =>
      '胸が高鳴るロマンスが待っています。好意を持っている相手と急速に親しくなり、目を見るだけで通じ合うテレパシーのような交感を感じることができるでしょう。告白を準備中なら成功確率が非常に高いので、勇気を出してください。ただし、一時の誘惑に流されるよりは、真心が向かう先を選択する知恵が必要です。';

  @override
  String get tarotWealthMeaning6 => '一人よりも一緒の時、金運が上昇します。';

  @override
  String get tarotWealthDetail6 =>
      '心の合う人と一緒に仕事を企てれば、相乗効果が出て金銭的利益が大きくなります。共同事業の提案があるなら前向きに検討してみてください。周囲の人々とのコミュニケーションを通じて有益な投資情報を得られる時期です。ただし、楽しむための支出が過多になる可能性があるので、適切な調節が必要です。';

  @override
  String get tarotSuccessMeaning6 => 'チームワークが光を放つ時期です。';

  @override
  String get tarotSuccessDetail6 =>
      '職場の同僚やビジネスパートナーとの呼吸がぴったり合い、働くことが楽しいです。一人でする業務よりはチームプロジェクトでより良い成果を出すことができ、円満な対人関係が成功の鍵となります。あなたが本当に好きで楽しめる仕事を選択するなら、後悔のない結果を得るでしょう。';

  @override
  String get tarotKeywords7 => '勝利, 意志, 前進, 征服, 移動';

  @override
  String get tarotDesc7 => '戦車に乗った若い王が強い意志で目標に向かって迷わず突き進み、勝利を勝ち取る姿です。';

  @override
  String get tarotLoveMeaning7 => '積極的な愛情攻勢が成功する時期です。';

  @override
  String get tarotLoveDetail7 =>
      '愛を勝ち取るために突き進むべき時です。ためらわずに自分の心を素直に堂々と表現すれば、ライバルがいても勝利することができます。サム（友達以上恋人未満）の状態なら、関係をはっきりと定義してリードするのが良いでしょう。ダイナミックなデートや一緒に旅行に出かけることが、愛情を深めてくれるでしょう。';

  @override
  String get tarotWealthMeaning7 => '目標とした収益を達成するために攻撃的に動くべき時です。';

  @override
  String get tarotWealthDetail7 =>
      '金銭的な目標を達成するために強力な推進力が必要な時期です。ためらわずにチャンスが来た時に果敢に決定する推進力が収益をもたらします。短期的に成果が出るプロジェクトに集中するのが有利であり、足で稼ぐ分だけ実績が上がる運勢です。移動に関連する支出が生じる可能性がありますが、これは新しい機会のための投資となるでしょう。';

  @override
  String get tarotSuccessMeaning7 => '競争で勝利し、目標を勝ち取る運気です。';

  @override
  String get tarotSuccessDetail7 =>
      '昇進、合格、契約成立など、明確な目標達成が予見されます。競争が激しいほどあなたの闘志が燃え上がり、結局勝利を手にすることになるでしょう。障害が立ちはだかっても正面突破するあなたの姿が周囲に深い印象を残し、出張や移動が多い業務で卓越した能力を発揮することになります。';

  @override
  String get tarotKeywords8 => '忍耐, 勇気, 内面の力, 包容, 外柔内剛';

  @override
  String get tarotDesc8 => '白い服を着た女性が、物理的な力ではなく精神的な力と忍耐強さで猛獣を優しく手なずける姿です。';

  @override
  String get tarotLoveMeaning8 => '相手をありのままに受け入れ、理解する包容力が必要な時期です。';

  @override
  String get tarotLoveDetail8 =>
      '今の愛は忍耐強さと知恵を要求します。相手の短所やわがままを広い心で受け入れ、包み込んであげる時、関係が一段階さらに発展することができます。柔らかい態度で相手をリードする外柔内剛の姿勢が必要であり、根気強く傍を守ってあげれば、結局あなたの真心が相手の心を開かせるでしょう。';

  @override
  String get tarotWealthMeaning8 => 'たゆまぬ貯蓄と健全な消費習慣が財産を集める秘訣です。';

  @override
  String get tarotWealthDetail8 =>
      '財物運が徐々に上昇する流れです。すぐに大金が入ってこなくても失望せず、誠実に資産を管理すれば、後で大きなまとまったお金になって戻ってくるでしょう。投資においては短期的な騰落に一喜一憂せず、粘り強く耐えるのが有利です。自分の衝動的な消費欲をうまくコントロールすることが金持ちになる近道です。';

  @override
  String get tarotSuccessMeaning8 => '難しい課題や気難しい上司に出会っても、賢明に対処できます。';

  @override
  String get tarotSuccessDetail8 =>
      '大変なプロジェクトや気難しい業務を任されるかもしれませんが、あなたにはこれを解決する十分な底力があります。外見は柔らかそうに見えますが、内面の強い意志で難関を一つずつ克服していく姿が際立ちます。冷静さを失わずに問題を解決するあなたの姿に、周囲から深い信頼が寄せられるようになるでしょう。';

  @override
  String get tarotKeywords9 => '内省, 孤独, 探求, 知恵, 休息';

  @override
  String get tarotDesc9 => '暗い雪山の上で灯火を持った老人が、内面の声に耳を傾けながら真理を探求する姿です。';

  @override
  String get tarotLoveMeaning9 => '一人だけの時間が必要だったり、恋愛について深く悩む時期です。';

  @override
  String get tarotLoveDetail9 =>
      '今は活発な恋愛よりは自分を見つめ直す時間が必要な時です。寂しさを紛らわすために誰でも会うよりは、自分が本当に望む愛が何なのか深く悩んでみてください。恋人がいても、しばらく距離を置いて各自の時間を持つことが、むしろ関係の本質を悟るのに役立つことがあります。';

  @override
  String get tarotWealthMeaning9 => '金銭的な活動が多少萎縮することがあります。';

  @override
  String get tarotWealthDetail9 =>
      '財物に関しては保守的な態度を取るべきです。新しい投資をしたり事業を広げるよりは、現在の資産を几帳面に点検し、漏れていくお金を防ぐことが重要です。代わりに自分の価値を高めるための勉強や技術習得に費用を支出することは、後でより大きな収益を上げることができる素晴らしい投資です。';

  @override
  String get tarotSuccessMeaning9 => '専門的な知識や技術を深く研究する分野で成果を出します。';

  @override
  String get tarotSuccessDetail9 =>
      '研究、企画、開発など、一人で深く掘り下げる業務で卓越した成果を出すことができます。他人に目立つことはありませんが、黙々と実力を積み重ねていく時期であり、職場内の人間関係よりは業務の本質に集中するのが有利です。解決されない問題があるなら、経験豊富なメンターを訪ねて助言を求めてみてください。';

  @override
  String get tarotKeywords10 => '運命, 転換点, 幸運, サイクル, 変化';

  @override
  String get tarotDesc10 => '雲の上に巨大な運命の輪があり、四元素を象徴する天使たちが本を読んでいます。';

  @override
  String get tarotLoveMeaning10 => '運命的な出会いや、関係の劇的な変化が訪れる予感です。流れに身を任せてみてください。';

  @override
  String get tarotLoveDetail10 =>
      '映画のような運命的な愛があなたを訪れます。思いがけない場所での出会いや、意外な再会など、ドラマチックな出来事が起こる可能性があるので、心を開いておきましょう。フリーの方は一目惚れする相手に出会えるかもしれませんし、カップルの方は関係が一歩前進するきっかけが訪れるでしょう。';

  @override
  String get tarotWealthMeaning10 => '金運の流れが良くなっています。';

  @override
  String get tarotWealthDetail10 =>
      '幸運の女神があなたに微笑んでいます。思いがけない収入や投資の利益など、金運が上昇カーブを描く時期です。ただし、運は巡るものです。良い時期こそ自惚れず、将来のために貯蓄する知恵も必要です。';

  @override
  String get tarotSuccessMeaning10 => 'チャンスが到来しています。タイミングを逃さず、波に乗ることが成功への近道です。';

  @override
  String get tarotSuccessDetail10 =>
      '滞っていた物事がスムーズに動き出す、人生のターニングポイントが訪れました。周囲の状況があなたに有利に働いているので、新しいチャンスが来た時は迷わず掴んでください。変化を恐れずに流れに身を任せれば、良い結果がついてくるでしょう。';

  @override
  String get tarotKeywords11 => '公正, 均衡, 責任, 真実, 因果応報';

  @override
  String get tarotDesc11 =>
      '赤い服を着た裁判官が、右手に剣、左手に天秤を持っています。これは客観的な判断と、自分の行動に対する責任を象徴しています。';

  @override
  String get tarotLoveMeaning11 => '感情よりも理性が優先される関係です。';

  @override
  String get tarotLoveDetail11 =>
      '今は感情に流されるよりは、理性的な判断が必要な時期です。相手と自分の関係が均衡を保っているか、自分が犠牲になりすぎていないか、あるいは逆に受け取ってばかりいないか振り返ってみてください。結婚を考えているなら、相手の条件や背景を几帳面に問い詰めることになる可能性があり、率直で公正な対話が関係改善の解決策になるでしょう。';

  @override
  String get tarotWealthMeaning11 => '金銭取引や契約において几帳面な確認が必要です。';

  @override
  String get tarotWealthDetail11 =>
      '金銭的な部分で是非を正さなければならないことが生じる可能性があります。貸したお金を返してもらったり、逆に返すべきお金を精算するなど、財務関係をきれいに整理するのに良い時です。契約書を書く時は毒素条項がないか几帳面に調べ、僥倖や便法よりは正直で透明に原則通りに処理するのが良いでしょう。';

  @override
  String get tarotSuccessMeaning11 => '公正な評価を受け、正当な報酬を受け取ることになります。';

  @override
  String get tarotSuccessDetail11 =>
      'あなたの業務成果に対して、公正で客観的な評価を受けることになります。これまで一生懸命働いたなら、昇進やボーナスなど妥当な報酬が伴うでしょうし、法曹界や会計など正確性が要求される分野で能力を発揮できます。意思決定を下す時は感情を排除し、徹底的にデータと事実に基盤して判断してください。';

  @override
  String get tarotKeywords12 => '犠牲, 忍耐, 新しい視点, 停滞, 悟り';

  @override
  String get tarotDesc12 =>
      '木に逆さまに吊るされた男が、自発的な苦難を通じて世界を新しい視点で見つめ、悟りを得る姿です。彼の頭の後ろにある後光は、精神的な成長を意味します。';

  @override
  String get tarotLoveMeaning12 => '関係が停滞したり、片思いが長引く可能性があります。';

  @override
  String get tarotLoveDetail12 =>
      '恋愛が進展せずもどかしさを感じることがありますが、今は急いでも解決されることではありません。しばらく立ち止まって、現在の状況を別の観点から眺め、自分が自分のやり方だけで愛を強要していないか反省してみる必要があります。相手の立場になって考え、配慮する忍耐が、結局相手の心を開く鍵となるでしょう。';

  @override
  String get tarotWealthMeaning12 => '資金の流れが滞ったり、損失を甘受しなければならないこともあります。';

  @override
  String get tarotWealthDetail12 =>
      '金銭的に行き詰まったような感じを受けることがあります。投資したお金が凍結されたり、予定されていた収入が遅延することがありますが、あがくほどさらにもつれる可能性があるので、今はむしろ心を空にして静観するのが上策です。この時期を通じて自分の消費習慣を点検し、お金に対する価値観を新しく定立してみる時間にしてください。';

  @override
  String get tarotSuccessMeaning12 => '物事が計画通りに進まず遅延することがあります。';

  @override
  String get tarotSuccessDetail12 =>
      'プロジェクトが中断されたり業務が遅延してストレスを受けることがありますが、これは失敗ではなく「一時停止」の信号です。無理に進めようとせず、一歩下がって全体的な絵を書き直してみてください。固定観念を壊した時、他人が考えられない奇抜なアイデアが出ることがあり、今の試練はあなたに新しい悟りを与えるでしょう。';

  @override
  String get tarotKeywords13 => '終結, 変化, 再生, 別れ, 新しい始まり';

  @override
  String get tarotDesc13 =>
      '古いものの完全な終結と、それによる新しい始まりを象徴し、苦痛ですが避けられない変化の過程を表しています。';

  @override
  String get tarotLoveMeaning13 => '関係の終結や大きな変化を意味します。';

  @override
  String get tarotLoveDetail13 =>
      '今の関係が限界を迎えている可能性があります。無理に引き留めようとするよりは、自然に流す勇気が必要であり、別れは痛いですが、その終わりには必ずより良い新しい始まりが待っています。過去の未練や傷から完全に脱してこそ、新しい人が入る場所ができるという点を肝に銘じてください。';

  @override
  String get tarotWealthMeaning13 => '金銭的な損失や投資失敗など大変な状況が来ることがあります。';

  @override
  String get tarotWealthDetail13 =>
      '財政的に大きな変化が予想されます。信じていた投資先で損失が出たり、予期せぬ支出で困難を経験することがありますが、これはこれまでの非効率的な資産管理方式を変えなさいという信号です。負債を整理し不必要な支出を完全に遮断して、より健康的で安定した財務構造を備えるための足がかりにしてください。';

  @override
  String get tarotSuccessMeaning13 => '進行していたことが中断されたり失敗することがあります。';

  @override
  String get tarotSuccessDetail13 =>
      '精魂込めたプロジェクトが霧散したり職場で大きな変化を経験することがあります。当面は挫折感が大きいでしょうが、これはあなたに合わない仕事を整理し、より大きな成功のために新しい道を探しなさいという運命の啓示です。古い方式を捨てて完全に新しい心構えで始めれば、人生のより素敵な次のチャプターが開かれるでしょう。';

  @override
  String get tarotKeywords14 => '均衡, 節制, 和合, 治癒, 中庸';

  @override
  String get tarotDesc14 =>
      '二つのカップの間で水を移し替えながら、現実と理想の間の完璧な均衡と調和のとれた流れを象徴しています。';

  @override
  String get tarotLoveMeaning14 => '異なる二人が出会い、調和を成していく過程です。';

  @override
  String get tarotLoveDetail14 =>
      '燃え上がるような情熱よりも、ほのかで持続的な愛が似合う時期です。お互いの相違点を認め、補完し合いながら深い絆を築いていくことになり、争いがあっても冷静に対話で解いていく知恵が必要です。あなたの穏やかで配慮深い態度が相手の心をリラックスさせ、安定した関係を作ってくれるでしょう。';

  @override
  String get tarotWealthMeaning14 => '収入と支出の均衡を合わせることが重要です。';

  @override
  String get tarotWealthDetail14 =>
      '財物運が安定した流れに乗ります。一攫千金を狙うよりは現在の資産を効率的に配分し管理することに集中し、収入が増えた分、支出も適切に調節する習慣が必要です。投資をするならリスク管理のために分散投資をするのが良く、地道な管理が結局富をもたらすでしょう。';

  @override
  String get tarotSuccessMeaning14 => '異なる意見を調整し和合を導き出す能力が際立ちます。';

  @override
  String get tarotSuccessDetail14 =>
      'チームプロジェクトで仲裁者の役割を立派に遂行し、葛藤を解決して業務効率を高めます。あなたの柔軟な思考と適応力が周囲に認められるようになり、仕事と休息のバランスをうまく合わせてバーンアウトを予防する知恵が際立つ時期です。全体的な流れを見守りながら着実に進めるのが最も良い結果につながります。';

  @override
  String get tarotKeywords15 => '誘惑, 束縛, 執着, 物質主義, 中毒';

  @override
  String get tarotDesc15 =>
      '自分を拘束する欲望と執着、そしてその気になれば脱出できるけれどそうしない物質的な誘惑を象徴しています。';

  @override
  String get tarotLoveMeaning15 => '強烈な肉体的魅力に惹かれたり執着する関係を意味します。';

  @override
  String get tarotLoveDetail15 =>
      '異性の魅力に強力に魅了され、理性的な判断を下しにくい時期です。熱いロマンスが始まることもありますが、一方で相手に対する過度な執着と拘束で大変になる可能性があるので注意が必要です。自分の感情が真実の愛なのか、それとも単純な所有欲なのか冷静に振り返り、自分をコントロールしなければなりません。';

  @override
  String get tarotWealthMeaning15 => '物質的な欲が強くなり無謀な投資をしたり、遊興に大金を使う可能性があります。';

  @override
  String get tarotWealthDetail15 =>
      '金銭的な誘惑が多い時期です。甘い言葉に騙されて危険な場所に投資したり、衝動的な消費で財産を使い果たす危険があるので警戒しなければなりません。お金の奴隷になって周囲の信頼を裏切らないように注意し、新しい投資をするよりは現在持っているものを守り、自分の過度な物欲をコントロールすべき時です。';

  @override
  String get tarotSuccessMeaning15 => '成功のために手段と方法を選ばないようにすることがあります。';

  @override
  String get tarotSuccessDetail15 =>
      '権力や名誉に対する欲が大きくなり、周囲の同僚を競争相手としてのみ見るようになることがあります。成果のために無理な日程を組んだり、健康を顧みない仕事中毒に陥る恐れがあるので注意してください。正当な努力なしに得ようとする心を捨てて、正直に業務に臨む姿勢が必要であり、自分で作った拘束から脱しなければなりません。';

  @override
  String get tarotKeywords16 => '崩壊, 衝撃, 急激な変化, 解放, 真実の暴露';

  @override
  String get tarotDesc16 =>
      '落雷が塔を直撃し、塔が崩れ落ち、人々が落下しています。これは予期せぬ外部の力による古い価値観の破壊と、それによる新しい真実との遭遇を象徴しています。';

  @override
  String get tarotLoveMeaning16 => '関係に大きな危機や突然の別れが訪れる可能性があります。';

  @override
  String get tarotLoveDetail16 =>
      'まるで青天の霹靂のように予期せぬ事件が恋愛戦線に発生することがあります。信じていた相手に失望したり、手に負えない争いで関係が根こそぎ揺らぐことがありますが、絶望しないでください。これは不健康な関係や誤解が解け、真実に向き合う過程であり、崩れた場所には結局より強固な愛を築く機会が来るでしょう。';

  @override
  String get tarotWealthMeaning16 => '突然の金銭的損失や災難に備えなければなりません。';

  @override
  String get tarotWealthDetail16 =>
      '財政的に非常に不安定な時期です。予想外の場所から大金が出ていったり、投資していた場所が崩壊するなど衝撃的な知らせに接することがあるので、資産を安全な場所に移して備えなければなりません。しかし、この崩壊は間違った経済観念を正す契機となるでしょうし、底を打てば二度と崩れない丈夫な基盤を築く機会が来ます。';

  @override
  String get tarotSuccessMeaning16 =>
      'プロジェクトが中断されたり職場で突然の人事異動など衝撃的な変化が生じることがあります。';

  @override
  String get tarotSuccessDetail16 =>
      'これまで精魂込めて築いてきた塔が崩れるような挫折感を感じることがありますが、これはあなたの能力が不足しているからではなく、避けられない変化の流れのためです。慌てずに事態を冷静に把握して古いシステムを捨て、新しい道を模索してください。今の危機をチャンスに変えて再整備すれば、はるかに高い場所へと跳躍できるでしょう。';

  @override
  String get tarotKeywords17 => '希望, 霊感, 治癒, 楽観主義, 所望成就';

  @override
  String get tarotDesc17 => '夜空の明るい星の光の下で女性が水を注ぎ、苦難の後に訪れる平和と未来への希望を象徴しています。';

  @override
  String get tarotLoveMeaning17 => '理想に近い人に出会ったり、恋愛に対する夢が叶う時期です。';

  @override
  String get tarotLoveDetail17 =>
      '暗い夜を照らす星のように、あなたの恋愛にも輝く希望が訪れます。心に描いていた理想の人に出会うことができ、あなたの純粋な魅力が異性に大きくアピールする時期です。過去の痛い記憶は今や癒やされ、新しい愛を夢見ることができる明るいエネルギーが生まれるでしょう。';

  @override
  String get tarotWealthMeaning17 => '金銭的に徐々に状況が良くなります。';

  @override
  String get tarotWealthDetail17 =>
      '財物運が肯定的な方向に流れ始めます。これまでの経済的な困難が解消され、一筋の光が見える時期であり、創造的なアイデアを通じて副収入を上げる機会が生じることがあります。当面の大きな利得よりは、長期的な観点で将来価値の高い場所に投資する眼識が、あなたを財政的安定へと導くでしょう。';

  @override
  String get tarotSuccessMeaning17 => '創造的な霊感が湧き上がり、自分の才能を広く知らせる機会を得ます。';

  @override
  String get tarotSuccessDetail17 =>
      'あなたのアイデアが光を放ち、周囲の称賛を受けることになります。特に芸術的な感覚や広報、マーケティング分野で頭角を現すことができ、普段夢見ていたプロジェクトを始めるのに非常に良いタイミングです。自信を持って自分を表現すれば、大衆の人気を得たり名誉を得ることができる運気が入っているので、チャンスを掴んでください。';

  @override
  String get tarotKeywords18 => '不安, 幻想, 曖昧さ, 直感, 無意識';

  @override
  String get tarotDesc18 => '月明かりの下、不安と曖昧さが共存しており、見えない裏側の真実と無意識の世界を象徴しています。';

  @override
  String get tarotLoveMeaning18 => '相手の気持ちが分からずもどかしかったり、誤解や疑念が芽生えやすいです。';

  @override
  String get tarotLoveDetail18 =>
      '霧の中にいるように相手の本心が分からず不安な時期です。些細な誤解が大きくなって疑いになり、不安感のせいで夜も眠れないかもしれませんが、性急に問い詰めるよりは状況を落ち着いて見守るのが良いでしょう。感情に流されて不確実な関係にあまり執着するよりは、理性的に考えて心の中心を保つことが優先です。';

  @override
  String get tarotWealthMeaning18 => '投資の見通しが不透明で、詐欺の危険が潜んでいます。';

  @override
  String get tarotWealthDetail18 =>
      '金銭的な面で視野が曇っており、それらしく見える投資情報や甘言に騙される危険が高いです。見えない場所に罠が隠されているので、石橋を叩いて渡る心情で極度に注意すべき時期です。新しいことを企てるよりは現状を維持し、現実的な検証過程を徹底的に経ることが財産を守る道です。';

  @override
  String get tarotSuccessMeaning18 => '業務の方向が曖昧だったり、隠れた敵がいる可能性があり、混乱する時期です。';

  @override
  String get tarotSuccessDetail18 =>
      '先が見えない漠然とした状況に置かれることがあり、プロジェクトの方向性が揺らいだり、職場内の流言飛語に巻き込まれる可能性があるので言動に注意してください。今は性急に動くよりは状況が明確になるまで待つのが賢明であり、他人の話をむやみに信じず、黙々と自分の場所を守りながらメンタル管理に努めるのが良いでしょう。';

  @override
  String get tarotKeywords19 => '喜び, 成功, 活力, 純粋, 祝福';

  @override
  String get tarotDesc19 => '太陽が輝き、子供が馬に乗って無邪気に笑っています。最高の幸運を象徴します。';

  @override
  String get tarotLoveMeaning19 => '最高に明るく幸せな愛。周囲からも祝福される喜びの時です。';

  @override
  String get tarotLoveDetail19 =>
      'この上なく完璧で幸せな愛があなたと共にあります。これまでの誤解や葛藤が雪のように消え去り、信頼が深まるでしょう。フリーの方は明るいエネルギーを持つ人に出会える絶好の機会です。結婚や妊娠など、おめでたいニュースも期待できます。';

  @override
  String get tarotWealthMeaning19 => '金運が最高潮に達しています。';

  @override
  String get tarotWealthDetail19 =>
      'ついに日の目を見る時が来ました。金運が非常に強力で、何をやっても収益につながる時期です。事業は繁栄し、投資も大きな利益を生む兆しがあります。この良い運気を周囲と分かち合うことで、さらに大きな幸運が返ってくるでしょう。';

  @override
  String get tarotSuccessMeaning19 => 'あなたの能力が認められ、スポットライトを浴びる時です。';

  @override
  String get tarotSuccessDetail19 =>
      '成功のファンファーレが鳴り響いています。これまで努力してきたことが実を結び、世間に認められる時です。合格や昇進など、目に見える成果を手にすることができるでしょう。自信に満ちた態度が周囲を魅了し、リーダーとしての素質も高く評価されます。';

  @override
  String get tarotKeywords20 => '復活, 報酬, 知らせ, 決断, 再会';

  @override
  String get tarotDesc20 =>
      '空で天使がラッパを吹くと、棺の中にいた人々が目覚めて歓喜します。これは過去の努力に対する報いと、新しい生への目覚めを象徴しています。';

  @override
  String get tarotLoveMeaning20 => '別れた恋人から連絡が来たり、再会する機会が生じます。';

  @override
  String get tarotLoveDetail20 =>
      '待ちわびていた知らせが届きます。忘れられなかった昔の恋人から連絡が来たり、再会を望んでいたなら叶う可能性が非常に高く、遅々として進まなかったサムの関係が確実に恋人に発展する結実を見ることになるでしょう。昔知っていた人と新しい縁がつながることもあるので、心の声に耳を傾け、後悔のない決断を下してください。';

  @override
  String get tarotWealthMeaning20 => '過去に投資した場所から収益が出たり、貸したお金を返してもらえるかもしれません。';

  @override
  String get tarotWealthDetail20 =>
      '過去の努力に対する報酬を受ける時期です。忘れていた株が上がったり、もらえないと思っていたお金を返してもらうなど、思いがけない横財数があり、以前に失敗したアイデアを再試行して成功するチャンスが訪れます。今下す決定がこれからの財物運を大きく左右することになるので、慎重かつ果敢な決断が必要な時です。';

  @override
  String get tarotSuccessMeaning20 => 'これまでの努力が認められ昇進したり、褒賞を受けたりします。';

  @override
  String get tarotSuccessDetail20 =>
      '審判の日が来ました。これまで流した汗に対する正当な評価と報酬が与えられ、昇進や合格など嬉しい知らせがラッパの音のように鳴り響くでしょう。停滞していた状況から脱してもう一度飛翔できるスカウトの提案や転職の機会が来る可能性があるので、変化を恐れずにチャンスを掴んで新しいチャプターを始めてください。';

  @override
  String get tarotKeywords21 => '完成, 統合, 達成, ハッピーエンド, 完璧';

  @override
  String get tarotDesc21 =>
      '長い旅の末に目標を完全に達成し、完璧な調和を成した状態を表す最高のハッピーエンドを象徴しています。四隅の聖獣は完成された世界を祝福し、新しい旅の始まりをも予感させます。';

  @override
  String get tarotLoveMeaning21 => '愛の結実を意味します。理想の相手と結ばれたり、最高に幸せな瞬間を迎えられます。';

  @override
  String get tarotLoveDetail21 =>
      '長い恋愛の終止符を打ち、結婚という新しい世界へと進む完璧な時期です。お互いがお互いにとって最高のパートナーであることを確認し、祝福の中で一つになる幸せを享受することになるでしょう。ソロなら、あなたの理想に合致する運命の相手に出会うことができます。海外旅行や異国的な環境で縁がつながる運勢でもあります。';

  @override
  String get tarotWealthMeaning21 => '目標としていた金額を達成し、経済的自由を享受することになります。';

  @override
  String get tarotWealthDetail21 =>
      '金銭的な目標を100%達成する快挙を成し遂げ、経済的自由を享受できる段階に到達しました。海外株式や貿易などグローバルな分野で大きな収益を上げることができ、あなたの投資ポートフォリオが完璧な調和を成して安定した収益をもたらしてくれるでしょう。これからは豊かさを満喫しながら、より広い世界に向かって視野を広げてみてください。';

  @override
  String get tarotSuccessMeaning21 => 'プロジェクトを成功裏に完遂し、最高の誉れを得ます。';

  @override
  String get tarotSuccessDetail21 =>
      'あなたのキャリアに頂点を極める時期です。任されたプロジェクトを完璧に成功させ、最高の賛辞を受けることになり、目標としていたことをすべて成し遂げて、より大きな世界へと進む準備をすることになるでしょう。留学や海外就職など活動の舞台が世界に広がる運勢なので、現在の成功を足がかりに、より遠大な夢を描いて飛躍してください。';

  @override
  String get supplementRecordPrompt => 'サプリメントを飲んで記録しましょう！';

  @override
  String get snoozeQuestion => 'いつまたお知らせしましょうか？';

  @override
  String get hoursShort => '時間';

  @override
  String get minutesShort => '分';

  @override
  String get after => '後';

  @override
  String snoozeMessage(int minutes) {
    return 'アラームは $minutes 分後に再び鳴ります。';
  }

  @override
  String timesTaken(int count) {
    return '$count 回服用';
  }

  @override
  String dailyGoalTimes(int goal) {
    return '目標：1日 $goal 回';
  }

  @override
  String get didYouTakeSupplement => 'サプリメントは飲みましたか？';

  @override
  String get viewMissionRecords => 'ミッション記録を見る';

  @override
  String get setTakingGoal => '摂取目標を設定';

  @override
  String get times => '回';

  @override
  String get dailyTakingGoal => '1日の摂取目標';

  @override
  String get howManyTimesADay => 'サプリメントは1日に何回飲みますか？';

  @override
  String get setGoalMl => '目標設定 (ml)';

  @override
  String get sleepAnalysis => '睡眠分析';

  @override
  String get todaysSleep => '今日の睡眠';

  @override
  String get sleepDuration => '睡眠時間';

  @override
  String get wakeUpTime => '起床時間';

  @override
  String get weeklySleepPattern => '週間睡眠パターン';

  @override
  String get sleepAdvice => '規則正しい睡眠習慣を維持しています。昨日より30分早く就寝しました！';

  @override
  String get stopwatch => 'ストップウォッチ';

  @override
  String get lap => 'ラップ';

  @override
  String get stop => '停止';

  @override
  String lapLabel(int index) {
    return 'ラップ $index';
  }

  @override
  String get monday => '月';

  @override
  String get tuesday => '火';

  @override
  String get wednesday => '水';

  @override
  String get thursday => '木';

  @override
  String get friday => '金';

  @override
  String get saturday => '土';

  @override
  String get sunday => '日';

  @override
  String get policy => '利用規約とプライバシーポリシー';

  @override
  String get support => 'お問い合わせ';

  @override
  String get defaultAlarmBehavior => 'デフォルトのアラーム動作';

  @override
  String get defaultAlarmVolume => 'デフォルトのアラーム音量';

  @override
  String get defaultAlarmVolumeDescription => '新しいアラーム作成時に適用されるデフォルトの音量です。';

  @override
  String get gradualVolumeDescription => 'アラーム音が徐々に大きくなるように設定します。';

  @override
  String get defaultVibration => 'デフォルトのバイブレーション';

  @override
  String get defaultVibrationDescription => '新しいアラーム作成時にデフォルトで振動をオンにします。';

  @override
  String get defaultInterval => 'デフォルトの間隔';

  @override
  String get maxSnoozeCountLabel => '最大回数';

  @override
  String get minutes => '分';

  @override
  String cupsCount(int current, int goal) {
    return '($current杯/$goal杯)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current回/$goal回)';
  }

  @override
  String get missionGym => 'ジムに行く';

  @override
  String get missionWorkout => 'ホームトレーニング';

  @override
  String get missionDiary => '日記を書く';

  @override
  String get missionBedMaking => '布団の整理';

  @override
  String get missionStretching => 'ストレッチ';

  @override
  String get missionReading => '読書10分';

  @override
  String get missionPlanning => '今日の計画を立てる';

  @override
  String get missionBreakfast => '朝食を食べる';

  @override
  String get missionMeditation => '瞑想5分';

  @override
  String get missionLearnWords => '英単語5個覚える';

  @override
  String get missionVentilation => '換気';

  @override
  String get missionCleaning => '部屋を掃除する';

  @override
  String get missionGratitudeDiary => '感謝日記';

  @override
  String get faqQuestion1 => 'アラームが鳴りません。';

  @override
  String get faqAnswer1 =>
      'Androidシステムのバッテリー最適化機能により、アラームが遅延したりブロックされたりすることがあります。[設定] > [アラームの最適化]メニューで、すべての権限を「許可」に設定してください。';

  @override
  String get faqQuestion2 => 'ミッションを変更したいです。';

  @override
  String get faqAnswer2 =>
      'アラームリストで編集したいアラームをタップした後、ミッション選択メニューで希望のミッション（数学、写真、シェイクなど）に変更できます。';

  @override
  String get faqQuestion3 => 'ダークモードの設定方法は？';

  @override
  String get faqAnswer3 => '[設定] > [全般] > [ダークモード]のトグルから画面テーマを変更できます。';

  @override
  String get faqQuestion4 => 'フォーチュンクッキーはどうやって集めますか？';

  @override
  String get faqAnswer4 =>
      '毎朝アラームを解除したり、ミッションを完了したりするたびにフォーチュンクッキーを獲得できます。集めたクッキーで今日の運勢をチェックしましょう！';

  @override
  String get faqQuestion5 => 'アプリを削除するとデータは消えますか？';

  @override
  String get faqAnswer5 =>
      'はい、フォーチュンアラームはデバイス内にデータを保存するため、アプリを削除すると設定したアラームやミッションの記録がすべて削除されます。ご注意ください。';

  @override
  String get noticeLabel => 'お知らせ';

  @override
  String get notice1Title => 'フォーチュンアラーム公式リリース';

  @override
  String get notice1Content =>
      'こんにちは。フォーチュンアラームが公式にリリースされました。\\n\\n毎朝のアラームと一緒に今日の運勢をチェックして、楽しい一日を始めましょう！\\n今後、より多様な機能と改善されたサービスを提供していきます。\\n\\nありがとうございます。';

  @override
  String get notice2Title => 'バージョン 1.0.0 アップデートのお知らせ';

  @override
  String get notice2Content =>
      'バージョン 1.0.0 のアップデート内容です。\\n\\n1. サプリメントミッションのUI改善\\n2. 正確なアラームのためのシステム設定の統合\\n3. ダークモードのサポート\\n4. バグ修正と安定性の向上\\n\\n今すぐ最新バージョンを体験してください！';

  @override
  String get notice3Title => '利用規約改定のお知らせ';

  @override
  String get notice3Content =>
      '利用規約が改定されました。\\n\\n主な改定内容：\\n- プライバシーポリシーの強化\\n- サービス利用範囲の具体化\\n\\n詳細は [設定] > [規約] ページで確認できます。';

  @override
  String get supportContentTitle => 'お問い合わせ内容';

  @override
  String get supportHint => '内容を入力してください。';

  @override
  String get supportRecipient => '宛先 (カスタマーサポート)';

  @override
  String get emailCopied => 'メールアドレスがコピーされました。';

  @override
  String get copyTooltip => 'コピー';

  @override
  String get supportWorkingDays => '平日24時間以内に回答できるよう努めます。';

  @override
  String get supportEmptyError => '内容を入力してください。';

  @override
  String get supportSubjectPrefix => 'お問い合わせ件名';

  @override
  String get supportContentPrefix => 'お問い合わせ内容';

  @override
  String get supportCopySuccessTitle => 'お問い合わせ内容をコピーしました';

  @override
  String supportCopySuccessMessage(String email) {
    return 'お問い合わせ内容がクリップボードにコピーされました。\\n$email 宛にメールを送信しますか？';
  }

  @override
  String get selectionComplete => '選択完了';

  @override
  String get selectVibration => 'バイブレーションパターンの選択';

  @override
  String get cameraMissionSequentialImageError => 'ミッション画像を順番に設定してください。';

  @override
  String get copyEmailAction => 'メールアドレスをコピー';

  @override
  String get addMissionTitle => '新しいミッションを追加';

  @override
  String get recommendedMissionList => 'おすすめミッション';

  @override
  String get recommendedMissionDesc => '健康的な一日のためのおすすめミッションです。';

  @override
  String get all => 'すべて';

  @override
  String get allMissions => 'すべてのミッション';

  @override
  String categoryMissions(String category) {
    return '$categoryミッション';
  }

  @override
  String get deselectAll => 'すべて解除';

  @override
  String get selectAll => 'すべて選択';

  @override
  String get myCustomMissions => 'マイカスタムミッション';

  @override
  String get myCustomMissionsDesc => '以前に作成したミッションを追加します。';

  @override
  String get createYourOwnMission => 'ミッションを自作する';

  @override
  String get createYourOwnMissionDesc => '希望のミッションがない場合は作成してください。';

  @override
  String get missionNameHint => 'ミッション名を入力（例：ジムに行く）';

  @override
  String get selectCategory => 'カテゴリーを選択';

  @override
  String get getNotification => '通知を受け取る';

  @override
  String get missionCategoryHealth => '健康';

  @override
  String get missionCategoryStudy => '勉強';

  @override
  String get missionCategoryRoutine => 'ルーチン';

  @override
  String get missionCategoryHobby => '趣味';

  @override
  String get missionCategoryOther => 'その他';

  @override
  String get copyEmailSuccessMessage => 'メールアドレスがコピーされました。メールアプリで貼り付けてください。';

  @override
  String get supportSubmitButton => 'お問い合わせ内容をコピーして送信';

  @override
  String get shakePhone => '携帯電話を振ってください！';

  @override
  String version(String version) {
    return 'バージョン $version';
  }

  @override
  String get fortuneCheckButton => '運勢を見る';

  @override
  String get fortuneSelectCards => 'カードを3枚選ぶ';

  @override
  String get fortuneDragCards => 'ドラッグして3枚選択';

  @override
  String get fortuneDetailTitle => '詳細な解釈';

  @override
  String get labelFineDust => '微小粉じん';

  @override
  String get labelUltraFineDust => '超微小粉じん';

  @override
  String get weatherToday => '今日の天気';

  @override
  String get weatherUpdateMessage => '現在地の天気情報を更新しています。';

  @override
  String get weatherDisclaimer => '観測データは地域の状況や受信状態により異なる場合があります。';

  @override
  String get weatherSource => '気象データ提供：信頼できる気象機関';

  @override
  String get locationPermissionTitle => '位置情報の権限を許可';

  @override
  String get locationPermissionDesc => '天気情報を表示するために必要です。';

  @override
  String get hourlyForecast => '1時間ごとの予報';

  @override
  String get weeklyForecast => '週間予報';

  @override
  String hourFormat(String hour) {
    return '$hour時';
  }

  @override
  String get noNotifications => '新しい通知はありません。';

  @override
  String get adLoadFailed => '広告の読み込みに失敗しました';

  @override
  String get adLoading => '広告を読み込み中...';

  @override
  String get removeAds => '広告を削除';

  @override
  String get close => '閉じる';

  @override
  String get exitQuestion => 'アプリを終了しますか？';

  @override
  String get exitApp => '終了';

  @override
  String get shareResultDescription => 'フォーチュンアラームが分析した運勢の結果です。';

  @override
  String get shareResultButton => '結果を共有';

  @override
  String get unknownTime => '時間不明';

  @override
  String get adLoadError => '広告を読み込めませんでした。しばらくしてからもう一度お試しください。';

  @override
  String get adShowError => '広告を表示できませんでした。しばらくしてからもう一度お試しください。';

  @override
  String earnCookies(int count) {
    return 'フォーチュンクッキー$count個を獲得しました！ 🎉';
  }

  @override
  String get freePassAfterTimeout => '広告なしで結果を無料で表示します！ 🎉';

  @override
  String get adLoadDelay => '読み込みが遅れています。\nしばらくしてからもう一度お試しください。';

  @override
  String get fortuneAccessTitle => '運勢を確認';

  @override
  String get fortuneAccessSubtitle => '運勢の結果を確認して、\n隠されたプレゼントを手に入れましょう！';

  @override
  String get watchAdButtonText => '広告を見て無料で結果を確認';

  @override
  String useCookiesButtonText(int count) {
    return 'フォーチュンクッキー$count個を使用';
  }

  @override
  String get adFailFreePass => '広告を読み込めなかったため、今回は無料でお通しします。';

  @override
  String get luckyNumberTitle => '私だけのラッキーナンバー';

  @override
  String get luckyNumberSubtitle => 'AIが生成する特別なラッキーナンバー';

  @override
  String get luckyNumberGenerateButton => 'ラッキーナンバーを生成する';

  @override
  String get luckyNumberGuideText =>
      'フォーチュンアラームのAIアルゴリズムを通じて\nあなただけのラッキーナンバーを確認しましょう';

  @override
  String get luckyNumberAnalysisStep1 => '幸運データを収集中...';

  @override
  String get luckyNumberAnalysisStep2 => '最近のナンバーパターンを分析中...';

  @override
  String get luckyNumberAnalysisStep3 => '番号ごとのエネルギーを分析中...';

  @override
  String get luckyNumberAnalysisStep4 => '幾何学的パターンを学習中...';

  @override
  String get luckyNumberAnalysisStep5 => 'AI予測モデルの重みを適用中...';

  @override
  String get luckyNumberAnalysisStep6 => '最適な幸運の組み合わせを算出中...';

  @override
  String get luckyNumberAnalysisStep7 => '分析完了！ラッキーナンバーを生成';

  @override
  String get luckyNumberAnalysisFinal => 'データの最終処理中...';

  @override
  String get luckyNumberAnalyzing => 'エネルギー分析中...';

  @override
  String get luckyNumberGeometric => '幾何学的分析...';

  @override
  String get luckyNumberPatterns => 'パターンマッチング...';

  @override
  String get luckyNumberEnergy => 'エネルギー調和中...';

  @override
  String get luckyNumberCompleted => '分析完了！';

  @override
  String get luckyNumberShare => '結果を共有';

  @override
  String get luckyNumberRestart => 'もう一度試す';

  @override
  String get luckyNumberGenerating => 'ラッキーナンバーを生成中...';

  @override
  String get luckyNumberResultTitle => 'ラッキーナンバーの生成完了';

  @override
  String get luckyNumberResultSubtitle => '6つの番号 + ボーナス番号';

  @override
  String get luckyNumberDisclaimer =>
      '※ 本サービスはエンターテインメント目的であり、提供される番号はAIアルゴリズムによって生成された参考用であり、当選を保証するものではありません。';

  @override
  String get luckyNumberShareTitle => '今日のラッキーナンバー';

  @override
  String get luckyNumberShareDescription => 'フォーチュンアラームが分析したラッキーナンバーです。';

  @override
  String luckyNumberSetLabel(String label) {
    return 'セット $label';
  }

  @override
  String get luckyNumberRegenerateButton => '番号を再生成する';

  @override
  String get luckyNumberFeatureAiTitle => 'AI推奨';

  @override
  String get luckyNumberFeatureAiDesc => 'スマートアルゴリズム';

  @override
  String get luckyNumberFeatureSmartTitle => 'スマート';

  @override
  String get luckyNumberFeatureSmartDesc => 'ラッキーナンバー推奨';

  @override
  String get luckyNumberFeatureDataTitle => 'データ分析';

  @override
  String get luckyNumberFeatureDataDesc => '最適な組み合わせ';

  @override
  String get fortunePassTitle => 'フォーチュンパス・プレミアム';

  @override
  String get fortunePassTabFree => '無料チャージ';

  @override
  String get fortunePassTabPremium => 'フォーチュンパス';

  @override
  String get fortunePassFreeChargeTitle => '広告を見てフォーチュンクッキーを無料でチャージしましょう！';

  @override
  String get fortunePassFreeChargeButton => '広告を見てチャージ (+1)';

  @override
  String get fortunePassActivePlan => '現在の購読プラン';

  @override
  String get fortunePassNoSubscription => '購読情報が見つかりません';

  @override
  String get fortunePassRestore => '復元';

  @override
  String get fortunePassMonth1Title => '1ヶ月購読';

  @override
  String get fortunePassMonth1Desc => '月間プラン';

  @override
  String get fortunePassMonth6Title => '6ヶ月購読';

  @override
  String get fortunePassMonth6Desc => '180日間プラン';

  @override
  String get fortunePassYear1Title => '12ヶ月購読';

  @override
  String get fortunePassYear1Desc => '1年間プラン';

  @override
  String get fortunePassBestPlan => '人気';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '$percent% タイムセール！';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% OFF';
  }

  @override
  String get fortunePassPerMonth => ' /月';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return '合計 $price / $unit';
  }

  @override
  String get fortunePassUnitMonth => '月';

  @override
  String get fortunePassUnit6Months => '6ヶ月';

  @override
  String get fortunePassUnitYear => '年';

  @override
  String get fortunePassMyCookies => '保有クッキー';

  @override
  String get fortunePassCurrentStatus => 'パスの状態';

  @override
  String get fortunePassStatusPremium => 'プレミアムパス利用中';

  @override
  String get fortunePassStatusFree => '一般ユーザー';

  @override
  String get fortunePassStoreErrorTitle => '利用不可';

  @override
  String get fortunePassStoreErrorContent =>
      'ストアから商品情報を取得できません。\n\n[チェックリスト]\n1. Google Play / App Storeのログイン状態\n2. インターネット接続\n3. テストデバイスの登録状態';

  @override
  String fortunePassSubscribeSale(int percent) {
    return '$percent% OFFで購読';
  }

  @override
  String get fortunePassSubscribeNow => '今すぐ購読';

  @override
  String get fortunePassApplied => 'フォーチュンパスが適用されました。';

  @override
  String get fortunePassApplyFailed => '適用に失敗しました。ネットワークを確認してください。';

  @override
  String get fortunePassRestored => '購入履歴を復元しました。';

  @override
  String get fortunePassRestoreFailed => '復元に失敗しました。';

  @override
  String get fortunePassTimeSaleTitle => 'ちょっと待って！プレゼントが届きました 🎁';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return '通常価格 ₩$price/年';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '₩$price/年';
  }

  @override
  String get fortunePassTimeSaleBadge => '3分以内の購読で50% OFF！';

  @override
  String get fortunePassTimeSaleButton => '割引を受けてProを始める';

  @override
  String get fortunePassTimeSaleCancel => 'また今度';

  @override
  String get fortunePassTimeSaleStartMessage =>
      '3分間限定の割引が始まりました！上部バナーを確認してください。';

  @override
  String get fortunePassSubscribeButton => '今すぐ購読';

  @override
  String get fortunePassSubscribeDiscountButton => '50% OFFで購読';

  @override
  String get fortunePassCookieBalance => '保有クッキー';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => 'パス有効';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return '合計 ₩$price / $unit';
  }

  @override
  String get fortunePassPopularPlan => '人気のプラン';

  @override
  String get fortunePassPricePerMonth => ' /月';

  @override
  String get fortunePassPaymentFailed => '決済リクエストに失敗しました。';

  @override
  String get fortunePassSubscriptionFailed => '適用に失敗しました。ネットワークを確認してください。';

  @override
  String get fortunePassSubscriptionSuccess => 'フォーチュンパスが適用されました。';

  @override
  String get fortunePassCannotSubscribeTitle => '購読できません';

  @override
  String get fortunePassCannotSubscribeMessage =>
      '現在、ストアから商品情報を取得できません。\n\n[チェックリスト]\n1. Google Play / App Storeのログイン状態\n2. インターネット接続\n3. テストデバイスの登録状態';

  @override
  String get year => '年';

  @override
  String get month => '月';

  @override
  String get day => '日';

  @override
  String get sajuProfileTitle => 'メイン四柱推命プロフィールの編集';

  @override
  String get sajuNameLabel => '名前';

  @override
  String get sajuNameHint => '名前を入力してください';

  @override
  String get sajuNameHelper => '最大6文字まで';

  @override
  String get sajuGenderLabel => '性別';

  @override
  String get sajuGenderMale => '男性';

  @override
  String get sajuGenderFemale => '女性';

  @override
  String get sajuBirthDateLabel => '生年月日';

  @override
  String get sajuBirthTimeLabel => '出生時間';

  @override
  String get sajuUnknownTime => '時間不明';

  @override
  String get sajuEditComplete => '編集完了';

  @override
  String get sajuSolar => '陽暦';

  @override
  String get sajuLunar => '陰暦';

  @override
  String get sajuSelectBirthDate => '生年月日を選択';

  @override
  String get sajuSelectBirthTime => '生まれた時間を選択';

  @override
  String get compatibilityTitle => '相性を確認する';

  @override
  String get compatibilityInputHeader => 'お二人の情報を入力してください';

  @override
  String get compatibilityInputSubtitle => '四柱推命の情報に基づいて、正確な相性を分析します。';

  @override
  String get compatibilityMyInfo => '私の情報';

  @override
  String get compatibilityInputMyNameGuide => '名前を入力してください';

  @override
  String get compatibilityInputPartnerNameGuide => '相手の名前を入力してください';

  @override
  String get compatibilityPartnerInfo => '相手の情報';

  @override
  String get compatibilityLoadSaved => '保存された情報を読み込む';

  @override
  String get compatibilityTitleBest => '最高の相性です！ ❤️';

  @override
  String get compatibilityDescBest => 'これ以上望むものはない最高の相性です。お互いを離さないでください！';

  @override
  String get compatibilityDescBest_Youth =>
      'お二人は、若々しく情熱的な愛を分かち合う最高のパートナーです。お互いの夢を応援し、共に成長する姿がとても美しいですね！学業や進路の悩みを共有し、お互いに良い刺激を与え合う関係です。今のようにお互いを大切に想い合えば、どんな困難も共に乗り越えられる最高の相性です。';

  @override
  String get compatibilityDescBest_Mature =>
      '人生の大切な時期に、お互いの心強い支えとなれる最高の相性です。信頼に基づいた、安定した深い愛を築くことができます。現実的な問題を共に解決していく過程で、お互いの大切さをより強く感じることでしょう。価値観が一致しており、共に未来を設計するのにこれ以上ない素晴らしい縁です。';

  @override
  String get compatibilityDescBest_Senior =>
      '人生の伴侶として、お互いに温かい慰めと安らぎの場となれる最高の縁です。言葉にしなくても心が通じ合う、深い絆で結ばれています。健康と平安を共に守りながら、ゆとりある人生を楽しめる成熟した関係です。お互いの人生の知恵を尊重し、包み込む姿は周囲の模範となる美しい同行です。';

  @override
  String get compatibilityTitleGreat => 'とても良い縁です 💕';

  @override
  String get compatibilityDescGreat => 'お互いに大きな力になる素晴らしいパートナーです。';

  @override
  String get compatibilityDescGreat_Youth =>
      'お互いにポジティブなエネルギーを与え合う、とても良い縁です。一緒にいると時間を忘れるほど楽しく、幸せな時間を過ごせます。時にはお互いの個性のためにぶつかることもあるかもしれませんが、対話を通じてすぐに仲直りし、より深い仲へと発展できる、生命力あふれる関係です。';

  @override
  String get compatibilityDescGreat_Mature =>
      '現実的な問題を共にかしこく乗り越えていける、素晴らしいパートナーです。お互いの足りない部分を補い合い、相乗効果を生み出す関係です。仕事、愛、家庭のバランスをうまく保ちながら、お互いの発展を応援し合う成熟したカップルで、共に歩むほどその輝きが増していく安定した相性です。';

  @override
  String get compatibilityDescGreat_Senior =>
      '健康と平安を共に守りながら、ゆとりある人生を楽しめる、とても良いパートナーです。お互いの存在そのものが大きな力となり、慰めになります。趣味や散歩など、ささやかな日常を共有しながら、精神的に深い絆を築いていく関係です。お互いの健康を細やかに気遣う、温かい情にあふれた縁です。';

  @override
  String get compatibilityTitleGood => 'お似合いのカップルです 😊';

  @override
  String get compatibilityDescGood => '少しの違いはありますが、お互いに合わせながら素敵な恋ができます。';

  @override
  String get compatibilityDescGood_Youth =>
      '好みや価値観がよく合うカップルです。時には喧嘩することもあるかもしれませんが、その過程さえもお互いをより深く知るための大切な時間になるでしょう。お互いの違いを個性として認め、少しずつ譲り合う美徳を発揮すれば、十分に幸せな恋愛を続けていける良い相性です。';

  @override
  String get compatibilityDescGood_Mature =>
      'お互いの価値観を尊重し、調和のとれたカップルです。現実と理想の間でバランスを保ちながら、愛を育んでいくことができます。時にはお互いの頑固さから葛藤が生じることもありますが、お互いへの信頼が深いため、大きな問題なく乗り越えていける堅実な関係です。';

  @override
  String get compatibilityDescGood_Senior =>
      '長年の経験と知恵をもとに、お互いを包み込む調和のとれたカップルです。ささやかな日常を共有しながら、穏やかな幸せを享受できます。お互いの生活習慣を尊重し、配慮しながら、友人のように心地よく過ごせる関係です。お互いのそばをしっかりと守るだけで、十分に満足できる絆です。';

  @override
  String get compatibilityTitleEffort => '努力が必要です 🧐';

  @override
  String get compatibilityDescEffort => '違う点が多いです。理解と思いやりが関係の鍵です。';

  @override
  String get compatibilityDescEffort_Youth =>
      '異なる環境で育ってきた分、合わせていくべき部分が多いです。自分の主張ばかりを通すのではなく、まず相手の気持ちを汲み取ろうとする努力が必要です。小さな誤解が大きくならないよう、素直に感情を表現し、対話の時間を増やすことが関係維持に大きな助けとなります。';

  @override
  String get compatibilityDescEffort_Mature =>
      'それぞれの主観がはっきりしているため、ぶつかる点が生じることがあります。お互いの生活スタイルを尊重し、少しずつ譲り合う心が関係維持の鍵です现实的な問題で葛藤が生じたときは、感情的に対応するのではなく、冷静にお互いの立場を整理してみる知恵が必要な時期です。';

  @override
  String get compatibilityDescEffort_Senior =>
      '長年培ってきた生活習慣の違いから、不便さを感じることがあるかもしれません。お互いの領域を認め、配慮する心が、心地よい関係を築く近道です。自分のやり方だけに固執するのではなく、相手の心地よさをまず考える温かい心が必要です。共に過ごす時間の質を高めることに集中してみてください。';

  @override
  String get compatibilityTitleDifficult => 'たくさん合わせる必要があります 😅';

  @override
  String get compatibilityDescDifficult =>
      '性格の違いが大きいかもしれません。お互いの違いを深く理解する必要があります。';

  @override
  String get compatibilityDescDifficult_Youth =>
      '性格やライフスタイルの違いが大きく感じられるかもしれません。感情的に対応するのではなく、冷静な対話を通じてお互いの違いを認める方法を学ぶ必要があります。お互いを変えようとするのではなく、ありのままの姿を受け入れる忍耐が、関係を築く鍵となるでしょう。';

  @override
  String get compatibilityDescDifficult_Mature =>
      '価値観の違いや現実的な問題で、悩みが深くなることがあります。深い理解と忍耐が必要であり、お互いの違いを認めようとする意志が重要です。お互いに多くを期待しすぎるのではなく、小さなことから感謝する心を持ってみてください。対話の方法を変えてみるのも、良い解決策になるかもしれません。';

  @override
  String get compatibilityDescDifficult_Senior =>
      'お互いのこだわりが強く、コミュニケーションに難しさを感じることがあります。過去の経験にとらわれるのではなく、現在の相手をありのままに受け入れる努力が大切です。沈黙よりも温かい一言が、関係改善のきっかけになります。お互いの自律性を尊重しながら、最低限の礼儀を保つ姿勢が求められます。';

  @override
  String get compatibilityAdvice_Youth =>
      'お互いの夢を共有し、応援する時間を増やしてみてください。新しい趣味を始めたり、旅行に出かけたりするなど、多彩な経験を積むことが関係の大きな活力になります。話すときは、批判よりもまず共感を示してあげましょう。';

  @override
  String get compatibilityAdvice_Mature =>
      '忙しい日常の中でも、二人だけの時間を確保することが大切です。お互いの労をねぎらい、温かい言葉をかけてあげてください。記念日を大切にしたり、定期的にデートを楽しんだりして、付き合い始めのときめきを忘れない努力が必要です。';

  @override
  String get compatibilityAdvice_Senior =>
      '健康を共に気遣いながら、散歩や軽い旅行を楽しんでみてください。お互いの人生の知恵を分かち合い、精神的な絆を深めるのが良いでしょう。無理な活動よりも、共に心地よく休める時間を増やしてみてください。お互いの健康状態をこまめにチェックし、いたわる心が大切です。';

  @override
  String get compatibilityLuck_Youth =>
      'お二人のエネルギーが合わさり、学業やキャリアで大きな成果を収められる運勢です。お互いがお互いのラッキーチャームとなり、計画していることがスムーズに運ぶ良い気運が漂っています。';

  @override
  String get compatibilityLuck_Mature =>
      '共に資産を管理したり、将来の設計をしたりする際に、大きな幸運が訪れる相性です。相乗効果が非常に高く、経済的に安定し、社会的地位も共に上昇できる、強力な財運と成功運があります。';

  @override
  String get compatibilityLuck_Senior =>
      '精神的な安定と平安が訪れる運勢です。お互いがお互いにとって最高の健康サプリメントとなり、無病息災で穏やかな老後を過ごせる福に満ちた気運に溢れています。子孫にも良い影響を与える、徳のある縁です。';

  @override
  String get tarotLoveMeaning0_Senior => '新しいときめきよりは、日常の小さな変化から喜びを見つける時期です。';

  @override
  String get tarotLoveDetail0_Senior =>
      '大げさな計画よりは、長い時間積み重ねてきたあなただけのノウハウや才能を周囲の人々と分かち合ってみてください。誰かに助けを与えたり、アドバイスをしたりする過程で、大きなやりがいと深い絆を感じることでしょう。';

  @override
  String get tarotLoveMeaning1_Senior => '賢明で落ち着いた対話が、関係をさらに深めます。';

  @override
  String get tarotLoveDetail1_Senior =>
      '相手の言葉に耳を傾け、共感してあげるだけで十分な時期です。焦らずゆっくりと心を通わせていけば、言葉にしなくても伝わる深い絆を感じることができるはずです。自分の内面を整える時間も持ってみてください。';

  @override
  String get tarotLoveMeaning2_Senior => '包容力のある心が、周囲の人々を幸せにします。';

  @override
  String get tarotLoveDetail2_Senior =>
      '温かい母親のような心で周囲をいたわるようになる時期です。配偶者や家族にかける温かい一言が、大きな力となって返ってくるでしょう。家の中に平和が満ちているので、ゆったりとした心で日常を楽しんでください。';

  @override
  String get tarotLoveMeaning3_Senior => '責任感のある態度が、家庭の調和を守ります。';

  @override
  String get tarotLoveDetail3_Senior =>
      '家庭内で中心となって導いていくべき時期です。時には厳格さも必要かもしれませんが、最終的には家族への深い愛が基本になければなりません。あなたの献身と努力が家族に安定感を与えるでしょう。';

  @override
  String get tarotLoveMeaning4_Senior => '伝統と礼儀を重んじ、安定した関係を維持します。';

  @override
  String get tarotLoveDetail4_Senior =>
      '長い間守ってきた価値観やルールが関係に安定を与えます。周囲のアドバイスに耳を傾けつつ、あなたの信念を失わないでください。礼儀をわきまえた丁重な態度が、相手に深い信頼を与えるでしょう。';

  @override
  String get tarotLoveMeaning5_Senior => '選択の岐路で、慎重さが必要な時期です。';

  @override
  String get tarotLoveDetail5_Senior =>
      '周囲の誘惑や新しい変化よりは、現在の尊い縁に集中してください。心が揺れる時は、あなたの豊かな人生経験を思い返してみるのが助けになります。正しい選択が、結局は平穏な未来をもたらすでしょう。';

  @override
  String get tarotLoveMeaning6_Senior => '強い意志で困難を克服し、和合を成し遂げます。';

  @override
  String get tarotLoveDetail6_Senior =>
      '葛藤が生じても諦めずに対話で解決していきましょう。あなたの固い意志と忍耐が、最終的に良い結実を結ばせるでしょう。共に目標を立てて努力する過程で、より強い絆が生まれるはずです。';

  @override
  String get tarotLoveMeaning7_Senior => '忍耐と慈愛で、関係を円滑にします。';

  @override
  String get tarotLoveDetail7_Senior =>
      '強要するよりは、優しい説得と理解が必要な時期です。あなたの成熟した態度が、相手の心を動かすことになるでしょう。怒るよりは、もう一度笑ってあげる余裕を持ってみてください。';

  @override
  String get tarotLoveMeaning8_Senior => '孤独の中で真の自己を発見し、知恵を得ます。';

  @override
  String get tarotLoveDetail8_Senior =>
      'しばし一人だけの時間を持ち、歩んできた人生を振り返ってみるのも良いでしょう。静寂の中で得た悟りが、これからの関係をより豊かにしてくれるはずです。焦らずゆっくりと自分自身と向き合ってみてください。';

  @override
  String get tarotLoveMeaning9_Senior => '運命の流れに身を任せ、変化を受け入れてください。';

  @override
  String get tarotLoveDetail9_Senior =>
      '予期せぬ変化が起きても慌てないでください。これはより良い未来のための過程かもしれません。ポジティブな心で変化を受け入れれば、新しい幸運があなたの縁に訪れるでしょう。';

  @override
  String get tarotLoveMeaning10_Senior => '冷静な判断と正義感のある態度が、信頼を築きます。';

  @override
  String get tarotLoveDetail10_Senior =>
      '感情に流されるよりは、客観的な視点で状況を見つめてください。公正で正直な態度が、周囲の人々から尊敬を受けるきっかけになるでしょう。善悪をはっきりさせつつ、温かい配慮も忘れないでください。';

  @override
  String get tarotLoveMeaning11_Senior => '忍耐と犠牲が、より大きな愛となって返ってきます。';

  @override
  String get tarotLoveDetail11_Senior =>
      '目先の見返りを求めるよりは、黙々と自分の場所を守り、献身する時期です。あなたの真心が最終的に相手に伝わり、深い感動を与えるでしょう。困難な状況も賢明に耐え抜けば、最終的に光が見えてくるはずです。';

  @override
  String get tarotLoveMeaning12_Senior => '不要なものを手放し、新しい始まりを準備してください。';

  @override
  String get tarotLoveDetail12_Senior =>
      '過去の執着や古い習慣を捨てるべき時です。空いた場所に新しい希望と気運が満たされるでしょう。変化を恐れずに、勇気を持って一歩を踏み出してみてください。';

  @override
  String get tarotLoveMeaning13_Senior => '節制と調和を通じて、平穏な関係を維持します。';

  @override
  String get tarotLoveDetail13_Senior =>
      '行き過ぎないように心を律し、バランスを保つことが重要です。お互いの違いを認め、調和を図ろうと努力する時に真の平和が訪れます。素朴な日常から幸せを見つけてください。';

  @override
  String get tarotLoveMeaning14_Senior => '本能的な欲求よりは、理性的なコントロールが必要な時期です。';

  @override
  String get tarotLoveDetail14_Senior =>
      '執着や拘束よりは、自由で快適な関係を目指してください。心の中の暗い影を払い、明るい場所へ進もうと努力すべきです。自分自身を愛する心が、関係改善の始まりです。';

  @override
  String get tarotLoveMeaning15_Senior => '突然の変化の中でも、揺るぎない中心を保ってください。';

  @override
  String get tarotLoveDetail15_Senior =>
      '予期せぬ葛藤が生じるかもしれませんが、これはむしろ関係を再整備する機会になります。慌てずに冷静に対処すれば、より強固な絆を形成することができるでしょう。';

  @override
  String get tarotLoveMeaning16_Senior => '希望の星明かりが、あなたの縁を明るく照らします。';

  @override
  String get tarotLoveDetail16_Senior =>
      '困難な時期が過ぎ、平和と安息が訪れる時期です。未来に対するポジティブな夢を持ち、共に計画を立ててみてください。あなたの明るいエネルギーが周囲の人々にも大きな喜びとなるでしょう。';

  @override
  String get tarotLoveMeaning17_Senior => '不安を振り払い、直感を信じて進んでください。';

  @override
  String get tarotLoveDetail17_Senior =>
      '心の中の疑念よりは、お互いへの信頼を第一に考えてください。霧が晴れた後の晴天のように、時間が経てば真実が明らかになるでしょう。焦らずに落ち着いて待つ知恵が必要です。';

  @override
  String get tarotLoveMeaning18_Senior => '明るい太陽の下、喜びと祝福に満ちた時期です。';

  @override
  String get tarotLoveDetail18_Senior =>
      '活気に満ち、ポジティブなエネルギーが溢れ出る時です。家族や知人と共に楽しい時間を過ごし、幸せを満喫してください。あなたの明るい笑顔がすべての葛藤を溶かしてくれるでしょう。';

  @override
  String get tarotLoveMeaning19_Senior => '努力に対する結実を見て、新しい飛躍を準備してください。';

  @override
  String get tarotLoveDetail19_Senior =>
      'これまでの労苦が認められ、やりがいを感じるようになる時期です。嬉しい知らせが届くかもしれないので、オープンな心で受け入れてください。過去を整理し、新しい希望に向かって進む時です。';

  @override
  String get tarotLoveMeaning20_Senior => '完成と調和を成し遂げ、最高の幸せを享受します。';

  @override
  String get tarotLoveDetail20_Senior =>
      '長い旅の果てに得た平穏と満足感が満ちている時期です。これ以上望むものがない完璧な調和を成し遂げ、日常の幸せを楽しんでください。あなたの知恵が周囲を照らす光となるでしょう。';

  @override
  String get tarotLoveMeaning21_Senior => '自由で純粋な心で、日常の楽しみを満喫してください。';

  @override
  String get tarotLoveDetail21_Senior =>
      '縛られない自由な魂で、周囲の人々と交流してみてください。新しい出会いや経験があなたの人生に活力を吹き込んでくれるでしょう。軽い心で世界を眺める余裕を持ってください。';

  @override
  String get tarotWealthMeaning0_Senior => '安定した資産管理と分かち合いの知恵が必要な時期です。';

  @override
  String get tarotWealthDetail0_Senior =>
      '新しい投資よりは、現在の資産をしっかり守り管理することに集中してください。あなたの経験をもとに、家族や周囲の人々に経済的な助けやアドバイスを与えることも大きなやりがいになるでしょう。';

  @override
  String get tarotWealthMeaning1_Senior => '知識と経験を活かした収益創出が期待されます。';

  @override
  String get tarotWealthDetail1_Senior =>
      '長い時間積み重ねてきたあなただけの専門知識や技術が、経済的な価値となって返ってくるかもしれません。焦らずに落ち着いて機会を待てば、良い結実を結ぶでしょう。';

  @override
  String get tarotWealthMeaning2_Senior => '豊かな結実を家族と共に分かち合う喜びを享受してください。';

  @override
  String get tarotWealthDetail2_Senior =>
      '家の中に財が集まり、安定を見つける時期です。あなたのゆとりある心が周囲を温かくし、その福が再びあなたに返ってくるでしょう。ゆったりとした心で日常を楽しんでください。';

  @override
  String get tarotSuccessMeaning0_Senior => '新しい挑戦よりは、有終の美を飾ることが重要な時です。';

  @override
  String get tarotSuccessDetail0_Senior =>
      'これまで築き上げてきた成果をしっかり整理し、締めくくることに集中してください。あなたの成功は結果より、その過程で見せた誠実さと知恵にあります。周囲にポジティブな影響力を伝播させてください。';

  @override
  String get tarotSuccessMeaning1_Senior => '内面の平和と精神的な成長が真の成功です。';

  @override
  String get tarotSuccessDetail1_Senior =>
      '社会的な地位や名誉よりは、あなたの心がどれほど平穏であるかが重要です。瞑想や読書などを通じて内面を整える時間を持ってみてください。深い洞察力があなたをさらに輝かせるでしょう。';

  @override
  String get tarotSuccessMeaning2_Senior => '家庭の和睦と健康が最高の成就です。';

  @override
  String get tarotSuccessDetail2_Senior =>
      '家族と仲良く過ごし、健康を維持することだけでも十分に成功した人生です。些細な日常から幸せを見つけ、感謝する心を持ってください。あなたの存在自体が家族にとって大きな力になります。';

  @override
  String get tarotWealthMeaning3_Senior => '責任感のある資産運用が家門の繁栄をもたらします。';

  @override
  String get tarotWealthDetail3_Senior =>
      '安定した収入源と計画的な消費を通じて、家計の安定を維持してください。あなたの経済的知恵が子供たちに大きな教訓となるでしょう。';

  @override
  String get tarotWealthMeaning4_Senior => '伝統的な方式の貯蓄と管理が有利な時期です。';

  @override
  String get tarotWealthDetail4_Senior =>
      '複雑な金融商品よりは、検証された方式の資産管理をお勧めします。慎重で保守的な態度が財産を守る核心です。';

  @override
  String get tarotWealthMeaning5_Senior => '財物に関連する選択で人生の知恵を発揮してください。';

  @override
  String get tarotWealthDetail5_Senior =>
      '欲を張るよりは、現在の生活に満足し、内実を期すのが良いでしょう。正しい選択が老後の平穏を保障します。';

  @override
  String get tarotWealthMeaning6_Senior => '厳しい経済状況も忍耐強く克服できます。';

  @override
  String get tarotWealthDetail6_Senior =>
      '一時的な資金圧迫があるかもしれませんが、賢明に対処すれば危機を機会に変えることができます。不必要な支出を減らしてください。';

  @override
  String get tarotWealthMeaning7_Senior => '施しを通じてより大きな豊かさを得ることになる時期です。';

  @override
  String get tarotWealthDetail7_Senior =>
      '周囲に徳を積めば、思いがけない場所から財運が伴うようになります。分かち合いの喜びがあなたの人生をさらに豊かにするでしょう。';

  @override
  String get tarotWealthMeaning8_Senior => '素朴な生活の中で真の富の意味を悟ります。';

  @override
  String get tarotWealthDetail8_Senior =>
      '物質的な豊かさより心の余裕を見つけることが重要です。節制された生活が、かえって経済的な安定をもたらしてくれるでしょう。';

  @override
  String get tarotWealthMeaning9_Senior => '財の流れが変わる時期なので、柔軟に対処してください。';

  @override
  String get tarotWealthDetail9_Senior =>
      '予期せぬ収益や支出が生じるかもしれません。変化に順応し、賢明に資産を運用すれば大きな無理はないでしょう。';

  @override
  String get tarotWealthMeaning10_Senior => '公正で透明な財産管理が信頼を高めます。';

  @override
  String get tarotWealthDetail10_Senior =>
      '相続や贈与など財産問題で原則を守ることが重要です。正直な態度が紛争を防ぎ、平和をもたらします。';

  @override
  String get tarotWealthMeaning11_Senior => '目先の利益より未来のための犠牲が価値ある時期です。';

  @override
  String get tarotWealthDetail11_Senior =>
      '子供や子孫のための経済的な後押しが、後で大きなやりがいとなって返ってくるでしょう。忍耐を持って長期的な観点を維持してください。';

  @override
  String get tarotWealthMeaning12_Senior => '財物に対する執着を捨て、心の平和を見つけてください。';

  @override
  String get tarotWealthDetail12_Senior =>
      '空けることで、かえって満たされる神秘的な経験をすることになるでしょう。不必要な所有欲を手放し、軽い心で日常に接してください。';

  @override
  String get tarotWealthMeaning13_Senior => 'バランスの取れた消費習慣が経済的自由を与えます。';

  @override
  String get tarotWealthDetail13_Senior =>
      '収入と支出の調和を図り、無理な欲を警戒してください。節制された生活が、あなたに持続的な安定をもたらしてくれるでしょう。';

  @override
  String get tarotWealthMeaning14_Senior => '物質的な誘惑に打ち勝ち、理性的に判断してください。';

  @override
  String get tarotWealthDetail14_Senior =>
      '甘い投資の提案や無理な拡張に注意する必要があります。あなたの豊かな経験を信じ、慎重に決定することが財産を守る道です。';

  @override
  String get tarotWealthMeaning15_Senior => '突然の経済的変化に落ち着いて対応してください。';

  @override
  String get tarotWealthDetail15_Senior =>
      '危機的な状況ほど、基本に立ち返る知恵が必要です。慌てずに資産の状態を細かく点検し、被害を最小限に抑えてください。';

  @override
  String get tarotWealthMeaning16_Senior => '財運の明るい星があなたの行く末を照らします。';

  @override
  String get tarotWealthDetail16_Senior =>
      '経済的な苦境が解決され、安定した流れが始まる時期です。ポジティブな心で未来を設計し、平穏を享受してください。';

  @override
  String get tarotWealthMeaning17_Senior => '不確実な情報に惑わされず、直感を信じてください。';

  @override
  String get tarotWealthDetail17_Senior =>
      '財物に関連する霧が晴れ、真実が明らかになるまで待つ忍耐が必要です。焦った決定よりは時間を置いて見守ってください。';

  @override
  String get tarotWealthMeaning18_Senior => '豊かな財運と共に喜びが満ちる時期です。';

  @override
  String get tarotWealthDetail18_Senior =>
      '努力に対する十分な補償が伴い、経済的な余裕が生まれます。周囲の人々と幸せを分かち合い、祝福された時間を過ごしてください。';

  @override
  String get tarotWealthMeaning19_Senior => '正当な補償を受け、新しい経済的計画を立ててください。';

  @override
  String get tarotWealthDetail19_Senior =>
      'これまでの誠実さが経済的な成果として認められる時です。過去を整理し、安定した未来のための新しい一歩を踏み出してみてください。';

  @override
  String get tarotWealthMeaning20_Senior => '財運が完成し、申し分のない豊かさを享受します。';

  @override
  String get tarotWealthDetail20_Senior =>
      '経済的な安定が最高潮に達し、平穏な老後を保障されます。あなたの賢明な資産管理が光を放つ瞬間です。';

  @override
  String get tarotWealthMeaning21_Senior => '財物に縛られない自由な豊かさを満喫してください。';

  @override
  String get tarotWealthDetail21_Senior =>
      '物質的な所有より人生の楽しみに価値を置く時期です。余裕のある心で世界を楽しんでいれば、財は自然についてくるでしょう。';

  @override
  String get tarotSuccessMeaning3_Senior => '人生の経輪が光を放ち、尊敬を受ける時期です。';

  @override
  String get tarotSuccessDetail3_Senior =>
      'あなたのリーダーシップと知恵が周囲の人々に大きな手本となります。権威よりは包容力で導く時、真の成功を味わうことになるでしょう。';

  @override
  String get tarotSuccessMeaning4_Senior => '長年の信念を守ってきたあなたの人生そのものが成功です。';

  @override
  String get tarotSuccessDetail4_Senior =>
      '揺るぎなく守ってきた価値観が結実を結ぶ時です。あなたの原則ある人生が後輩たちに正しい道を示す道しるべになるでしょう。';

  @override
  String get tarotSuccessMeaning5_Senior => '正しい価値観の確立が人生後半の成功を左右します。';

  @override
  String get tarotSuccessDetail5_Senior =>
      '名誉と実利の間で賢明な選択をすべき時期です。あなたの豊かな経験をもとに下した決定が、平穏な未来を保障するでしょう。';

  @override
  String get tarotSuccessMeaning6_Senior => '粘り強い努力がついに勝利をもたらします。';

  @override
  String get tarotSuccessDetail6_Senior =>
      'どんな障害物もあなたの意志を折ることはできません。諦めずに進むあなたの姿自体が、すでに大きな成功です。';

  @override
  String get tarotSuccessMeaning7_Senior => '内面の強靭さが柔らかいカリスマとして現れます。';

  @override
  String get tarotSuccessDetail7_Senior =>
      '柔らかさが強さに勝つ時期です。忍耐と慈愛で周囲を包み込む時、あなたの名誉はさらに高まるでしょう。';

  @override
  String get tarotSuccessMeaning8_Senior => '孤独な修行の果てに得た知恵が最高の成就です。';

  @override
  String get tarotSuccessDetail8_Senior =>
      '他の人が見ることができない深い真理を悟ることになる時です。静かな省察の時間が、あなたをさらに成熟し深みのある人間にするでしょう。';

  @override
  String get tarotSuccessMeaning9_Senior => '変化の波に乗り、新しい機会を掴んでください。';

  @override
  String get tarotSuccessDetail9_Senior =>
      '人生の新しい章が開かれる時期です。変化を恐れずにポジティブに受け入れれば、予想外の大きな成果を収めるでしょう。';

  @override
  String get tarotSuccessMeaning10_Senior => '公明正大な態度があなたの名誉をさらに輝かせます。';

  @override
  String get tarotSuccessDetail10_Senior =>
      '私利私欲より正義に従う姿が周囲の尊敬を呼びます。あなたの正直さが結局、最も大きな成功の鍵となるでしょう。';

  @override
  String get tarotSuccessMeaning11_Senior => '犠牲を恐れない高潔な精神が勝利します。';

  @override
  String get tarotSuccessDetail11_Senior =>
      '今は大変でも崇高な目標のために忍耐する時期です。あなたの献身は後日、歴史と人々の記憶の中に美しい成功として残るでしょう。';

  @override
  String get tarotSuccessMeaning12_Senior => '古い成功の基準を捨て、新しい価値を見つけてください。';

  @override
  String get tarotSuccessDetail12_Senior =>
      '過去の栄光に執着するより、現在の尊さを悟ることが重要です。空けることで得る平和が、真の人生の成功です。';

  @override
  String get tarotSuccessMeaning13_Senior => '調和と節制の美学が完成する時期です。';

  @override
  String get tarotSuccessDetail13_Senior =>
      'どちらか一方に偏らないバランスの取れた生活が最高の美徳です。あなたの節制された姿が周囲に平和と安定を伝播させるでしょう。';

  @override
  String get tarotSuccessMeaning14_Senior => '内面の闇を克服し、自由を得ることが成功です。';

  @override
  String get tarotSuccessDetail14_Senior =>
      '自分自身を縛り付けていた拘束から脱し、真の自己を見つけてください。心の自由を得る瞬間、あなたは世界の誰よりも成功した人になるでしょう。';

  @override
  String get tarotSuccessMeaning15_Senior => '危機を機会に変える大胆さが必要な時です。';

  @override
  String get tarotSuccessDetail15_Senior =>
      '突然の変化はあなたをより強くする過程です。落ち着いて対応し、新しい秩序を打ち立てる時、より大きな成就が伴うでしょう。';

  @override
  String get tarotSuccessMeaning16_Senior => '希望の未来を夢見ながら、新しいインスピレーションを得てください。';

  @override
  String get tarotSuccessDetail16_Senior =>
      '疲れた魂に安息が訪れ、新しい夢が生まれる時期です。あなたのクリエイティブなエネルギーが周囲を照らし、幸せな結実を結ばせるでしょう。';

  @override
  String get tarotSuccessMeaning17_Senior => '直感を信じて、黙々とあなたの道を行ってください。';

  @override
  String get tarotSuccessDetail17_Senior =>
      '混乱した状況の中でも、あなたの内面の声に耳を傾けてください。時間が経てば、あなたの選択が正しかったことが証明されるでしょう。';

  @override
  String get tarotSuccessMeaning18_Senior => '生命力溢れるエネルギーが最高の成就をもたらします。';

  @override
  String get tarotSuccessDetail18_Senior =>
      '心身ともに健康で活気に満ちた時期です。ポジティブなエネルギーを周囲と分かち合い、生の喜びを満喫することが真の成功です。';

  @override
  String get tarotSuccessMeaning19_Senior => '呼びかけに応じ、新しい社会的役割を遂行してください。';

  @override
  String get tarotSuccessDetail19_Senior =>
      'あなたの経験と知恵を必要とする場所が生まれます。新しい使命感を持って社会に貢献する時、より大きなやりがいと成功を感じるでしょう。';

  @override
  String get tarotSuccessMeaning20_Senior => '人生の旅路を完成させ、完璧な調和を成し遂げます。';

  @override
  String get tarotSuccessDetail20_Senior =>
      'これ以上成し遂げるものがない完璧な満足と平和の状態です。あなたの人生そのものが一つの作品となり、周囲に深い感動を与えるでしょう。';

  @override
  String get tarotSuccessMeaning21_Senior => '縛られることのない自由な人生が最高の成功です。';

  @override
  String get tarotSuccessDetail21_Senior =>
      '世の中の基準から外れ、あなただけの幸せを楽しんでください。軽い心で世界を旅するように生きるあなたが、真の勝利者です。';

  @override
  String get compatibilityResultButton => '相性結果を見る';

  @override
  String get compatibilityDeleteTooltip => '削除';

  @override
  String get compatibilityGenderMale => '男性';

  @override
  String get compatibilityGenderFemale => '女性';

  @override
  String get compatibilityInputTitle => '相性情報入力';

  @override
  String get tojeongInputTitle => '土亭秘訣 情報入力';

  @override
  String tojeongCheckFortune(int year) {
    return '$year年の\n土亭秘訣（トジョンビギョル）を確認しましょう';
  }

  @override
  String get tojeongInputGuide => '正確な分析のために\n生年月日と時間を入力してください。';

  @override
  String tojeongViewResult(int year) {
    return '$year年の運勢を見る';
  }

  @override
  String get tojeongCheckButton => '運勢を確認する';

  @override
  String get tojeongSaveAndCheck => '保存して運勢を見る';

  @override
  String get tojeongYearSelect => '運勢の年を選択';

  @override
  String tojeongResultTitle(int year) {
    return '$year年 土亭秘訣';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return '$nameさんの$year年の運勢';
  }

  @override
  String tojeongGua(String gua) {
    return '卦: $gua';
  }

  @override
  String get tojeongTotalLuck => '総合運';

  @override
  String get tojeongProcess => '進行過程';

  @override
  String get tojeongResult => '最終結果';

  @override
  String get tojeongMonthlyLuck => '月別運勢';

  @override
  String get tojeongShareResult => '結果を共有する';

  @override
  String tojeongShareTitle(int year) {
    return '$year年 土亭秘訣の結果';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return '$nameさんの土亭秘訣の総評です。\n\n$desc...';
  }

  @override
  String get tojeongShareTargetYear => '対象年度';

  @override
  String get sajuDeleteTitle => '四柱推命情報の削除';

  @override
  String sajuDeleteConfirm(String name) {
    return '$nameさんの情報を削除してもよろしいですか？';
  }

  @override
  String get sajuProfileSelect => '四柱情報（サジュ）を選択';

  @override
  String get add => '追加';

  @override
  String get modify => '修正';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title\nサービス準備中です。';
  }

  @override
  String get fortuneUnderConstructionSubtitle =>
      'より正確で役立つ運勢情報を提供できるよう、現在準備を進めております！';

  @override
  String get goBack => '戻る';

  @override
  String get name => '名前';

  @override
  String get nameInputGuide => '名前を入力してください';

  @override
  String get sajuLunarSolar => '陽暦/陰暦';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year年$month月$day日';
  }

  @override
  String get sajuSelectFortuneYear => '運勢を見る年を選択';

  @override
  String sajuYearDisplay(int year) {
    return '$year';
  }

  @override
  String get sajuSelectProfile => 'プロフィールを選択';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get newYearFortuneInputTitle => '新年の運勢情報入力';

  @override
  String newYearFortuneHeader(int year) {
    return '$year年\n私の運勢はどうでしょうか？';
  }

  @override
  String get newYearFortuneSubHeader => '正確な四柱推命分析のために、生年月日と時間を入力してください。';

  @override
  String newYearFortuneViewButton(int year) {
    return '$year年の運勢を見る';
  }

  @override
  String get newYearFortuneCheckButton => '運勢を確認する';

  @override
  String get newYearFortuneSaveAndCheckButton => '保存して運勢を見る';

  @override
  String newYearFortuneResultTitle(int year) {
    return '私の$year年 新年の運勢';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return '私の$year年 新年の運勢結果';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return '$nameさんの新年の運勢です。\n\n$desc...';
  }

  @override
  String get sajuChartTitle => '四柱推命命式';

  @override
  String get sajuHour => '時';

  @override
  String get sajuDay => '日';

  @override
  String get sajuMonth => '月';

  @override
  String get sajuYear => '年';

  @override
  String get ohaengAnalysisTitle => '五行分析';

  @override
  String dominantOhaeng(String name, String symbol) {
    return 'あなたの守護五行: $name($symbol)';
  }

  @override
  String get ohaengDisclaimer =>
      '※ 五行（木、火、土、金、水）は四柱推命の基本エネルギーです。バランスが良いのが理想的ですが、これらの要素を通じて自分の傾向を理解することができます。';

  @override
  String yearlyTotalLuck(int year) {
    return '$year年 総合運';
  }

  @override
  String get fortuneDisclaimer => 'この運勢は娯楽用です。あなたの人生はあなた自身の意志にかかっています。';

  @override
  String get compatibilityResultTitle => '相性分析結果';

  @override
  String get compatibilityScore => '相性スコア';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => '二人の相性';

  @override
  String get compatibilityShareResult => '結果を共有';

  @override
  String get compatibilityRetryButton => '他の人との相性も見る';

  @override
  String get compatibilitySummary => '要約';

  @override
  String get compatibilitySectionLuck => '運勢のシナジー';

  @override
  String get compatibilitySectionAdvice => '関係へのアドバイス';

  @override
  String get compatibilitySectionPositive => 'ポジティブな部分';

  @override
  String get compatibilitySectionCaution => '注意点';

  @override
  String get compatibilityLunarDisclaimer =>
      '※ 現在、旧暦の誕生日は新暦を基準に分析されています。より正確な分析のために、今後旧暦変換機能がアップデートされる予定です。';

  @override
  String get tojeongSaveAndCheckButton => '保存して土亭秘訣を見る';

  @override
  String get tojeongSangsuKeyword1 => '強い推進力とリーダーシップが必要な時期';

  @override
  String get tojeongSangsuKeyword2 => '活発な対人関係と喜びに満ちた時期';

  @override
  String get tojeongSangsuKeyword3 => '知性と情熱が輝く時期';

  @override
  String get tojeongSangsuKeyword4 => '急激な変化と新しい始まりの時期';

  @override
  String get tojeongSangsuKeyword5 => '柔軟な姿勢と柔らかなコミュニケーションが必要な時期';

  @override
  String get tojeongSangsuKeyword6 => '知恵と忍耐で困難を克服する時期';

  @override
  String get tojeongSangsuKeyword7 => '安定を求め、内面を鍛える時期';

  @override
  String get tojeongSangsuKeyword8 => '包容力と温かい心で徳を積む時期';

  @override
  String get tojeongJungsuKeyword1 => '助けてくれる人に巡り会えます';

  @override
  String get tojeongJungsuKeyword2 => '書類や契約に関して良い知らせがあります';

  @override
  String get tojeongJungsuKeyword3 => '新しい挑戦と機会が訪れます';

  @override
  String get tojeongJungsuKeyword4 => '仕事での成功と名誉が続きます';

  @override
  String get tojeongJungsuKeyword5 => '慎重な金銭管理が必要です';

  @override
  String get tojeongJungsuKeyword6 => '健康管理を最優先すべきです';

  @override
  String get tojeongHasuKeyword1 => '大きな成功を収めるでしょう。';

  @override
  String get tojeongHasuKeyword2 => '努力の成果を収穫できるでしょう。';

  @override
  String get tojeongHasuKeyword3 => '忍耐を通じて、危機をチャンスに変えるでしょう。';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return '今年は$sangsuの中で$jungsuがあり、最終的には$hasu';
  }

  @override
  String get tojeongSangsuDetail1 =>
      '天と地があなたを助けている状況です。強い推進力を持って進めば、大きな成果を収められる年です。龍が天に昇るように、あなたのエネルギーは強力で輝いています。リーダーシップを発揮し、周囲から認められる機会が多いでしょう。ただし、独断的な行動は反感を買う可能性があるため、包容力を持つことが重要です。';

  @override
  String get tojeongSangsuDetail2 =>
      '穏やかな湖に石を投げ入れ、波紋が広がるような時期です。喜びや楽しみに満ちた年ですが、言葉の乱れによる噂話には注意が必要です。社交生活が活発になり人気も高まりますが、それが嫉妬を招くこともあります。楽しい集まりやイベントで良いパートナーに出会えるかもしれません。';

  @override
  String get tojeongSangsuDetail3 =>
      '明るい太陽が世界中を照らしているような時期です。あなたの知性と情熱が輝き、学問や芸術の分野で頭角を現すでしょう。評判が高まり有名になりますが、火のように激しい気性を抑えないとトラブルを招く可能性があります。外見は華やかですが、内面では孤独を感じることもあるため、内実を充実させることに集中しましょう。';

  @override
  String get tojeongSangsuDetail4 =>
      '晴天の霹靂のように、急激な変化が予想されます。あなたのエネルギーは活動的で進取の気性に富んでおり、新しいことを始めるのに良い時期です。引っ越しや環境の変化で忙しくなるでしょう。始まりは勢いがあっても終わりが曖昧になりがちなので、始めたことを最後までやり遂げる忍耐力が必要です。';

  @override
  String get tojeongSangsuDetail5 =>
      '穏やかな春風が吹き、万物が蘇る時期です。柔軟な姿勢で対応すれば、滞っていた道もスムーズに開けるでしょう。ビジネスや取引で利益を得ることができ、遠方から良い知らせが届くでしょう。ただし、優柔不断さはチャンスを逃すことにつながるため、時が来たら決断力が必要です。';

  @override
  String get tojeongSangsuDetail6 =>
      '深い水の中を泳いでいるような時期です。表面上は穏やかに見えますが、内面には悩みがあるかもしれません。知恵を絞って困難を克服しなければならず、過度な投資や拡大は控えるのが賢明です。忍耐強く適切な時期を待てば、必ず良い日が来ます。健康に注意してください。';

  @override
  String get tojeongSangsuDetail7 =>
      '大きな山が道を塞いでいるようですが、一度それを越えれば広大な平野が広がります。強い意志で困難を耐え抜けば、大きな実を結ぶでしょう。現在の地位を維持し、内部の安定に集中するのが有利です。性急な変化よりも安定が良く、信頼を築くことが重要です。';

  @override
  String get tojeongSangsuDetail8 =>
      '広大な土地に種をまく時期です。包容力と忍耐で周囲を受け入れれば、徳を積むことができます。温かい母親のような心で人に接すれば、他人からの助けを得られます。目先の利益よりも将来への投資が、今年輝きを放つでしょう。家庭に平和が訪れます。';

  @override
  String get tojeongJungsuDetail1 =>
      '助っ人が玄関に現れ、喜ばしい出来事をもたらします。滞っていた問題が解決し、富が流れ込んでくるでしょう。パートナーと一緒に計画を立てれば、成功の確率が高まります。';

  @override
  String get tojeongJungsuDetail2 =>
      '家庭でお祝い事があったり、新しい家族を迎えたりするかもしれません。書類運が良く、契約や売買に有利です。ただし、小さな口論が大きな喧嘩に発展する可能性があるため、言動には注意してください。';

  @override
  String get tojeongJungsuDetail3 =>
      '異国の地で羽を広げたり、遠くへ移動したりする運命にあります。旅行や出張を通じて新しい機会を得ることができます。変化を恐れずに挑戦すれば、良い結果が得られるでしょう。';

  @override
  String get tojeongJungsuDetail4 =>
      '職場で認められたり昇進したりして、名誉が続きます。試験の合格や資格取得に有利な時期です。自分の能力を存分に発揮してください。';

  @override
  String get tojeongJungsuDetail5 =>
      '金運は強いですが、支出も増える可能性があります。金銭管理を徹底し、衝動買いを控えなければなりません。親しい知人との金銭取引は避けるのが最善です。';

  @override
  String get tojeongJungsuDetail6 =>
      '健康に特に注意すべき時期です。過労を避け、十分な休息をとってください。予期せぬ事故や病気に備えて、保険を確認しておくのも良いでしょう。';

  @override
  String get tojeongHasuDetail1 =>
      'その結果、すべてがスムーズに解決し、願いが叶うでしょう。努力が必ず報われ、周囲から羨望の眼差しを向けられるでしょう。初心を忘れなければ、その福は長く続くでしょう。';

  @override
  String get tojeongHasuDetail2 =>
      '過程で多少の困難はあるかもしれませんが、忍耐強く努力すれば、最終的には目標を達成できるでしょう。簡単に得られるものは何もないので、努力した分だけ収穫があります。大器晩成の運勢です。';

  @override
  String get tojeongHasuDetail3 =>
      '予期せぬ障害に遭遇するかもしれませんが、挫折せずに耐え抜けば、危機をチャンスに変えることができます。欲を捨てて心を空っぽにすれば、かえって良いことが起こるでしょう。災いを転じて福となす知恵が必要です。';

  @override
  String get tojeongGeneralWealthGood =>
      '金運が良いです。予期せぬ場所から収入が発生したり、投資が良い結果をもたらしたりするでしょう。ただし、お金が入ってくる分、出ていくこともあるので、貯蓄に励みましょう。';

  @override
  String get tojeongGeneralWealthBad =>
      '富の流れがスムーズでないかもしれません。不必要な支出を減らし、節約する習慣を身につけるべきです。金銭取引には慎重になり、投資については専門家に相談してください。';

  @override
  String get tojeongGeneralCareerGood =>
      'キャリアやビジネスで認められる機会が訪れます。昇進、転職、起業に良い時期です。人間関係を良好に保つことで、より良い結果が得られるでしょう。';

  @override
  String get tojeongGeneralCareerBad =>
      '現状を維持するのが最善です。新しい事業を始めるよりも、現在の業務に集中し、スキルを磨きましょう。同僚や上司との関係でストレスを感じるかもしれませんが、心を落ち着けて過ごしましょう。';

  @override
  String get tojeongGeneralLoveGood =>
      '恋愛運が上昇し、シングルの方は良いパートナーに出会い、カップルの方は愛が深まるでしょう。家庭は笑いと調和に包まれます。結婚の話を進めるのにも良い時期です。';

  @override
  String get tojeongGeneralLoveBad =>
      '些細な誤解から口論が生じる可能性があります。お互いの立場に対する理解と思いやりに欠けないよう注意が必要です。感情的な対応ではなく、理性的な対話を通じて問題を解決するように努めてください。';

  @override
  String get optional => '（任意）';

  @override
  String get sajuSolarHint => '土亭秘訣は旧暦の誕生日を基準に分析するのが最も正確です。';

  @override
  String get yourFortune => 'あなたの運勢';

  @override
  String get guaUpper => '上卦';

  @override
  String get guaMiddle => '中卦';

  @override
  String get guaLower => '下卦';

  @override
  String get guaCode => '卦番号';

  @override
  String get viewAgain => 'もう一度確認する';

  @override
  String get zodiacAries => '牡羊座';

  @override
  String get zodiacTaurus => '牡牛座';

  @override
  String get zodiacGemini => '双子座';

  @override
  String get zodiacCancer => '蟹座';

  @override
  String get zodiacLeo => '獅子座';

  @override
  String get zodiacVirgo => '乙女座';

  @override
  String get zodiacLibra => '天秤座';

  @override
  String get zodiacScorpio => '蠍座';

  @override
  String get zodiacSagittarius => '射手座';

  @override
  String get zodiacCapricorn => '山羊座';

  @override
  String get zodiacAquarius => '水瓶座';

  @override
  String get zodiacPisces => '魚座';

  @override
  String get elementFire => '火';

  @override
  String get elementEarth => '地';

  @override
  String get elementAir => '風';

  @override
  String get elementWater => '水';

  @override
  String get compatibilityCategoryZodiac => '干支の相性';

  @override
  String get compatibilityCategoryInner => '内面の相性';

  @override
  String get compatibilityCategoryConstellation => '星座の相性';

  @override
  String get compatibilitySummarySamhap => '最高の相性 (三合)';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return '$animal1と$animal2は最高の相性で、お互いの足りない部分を補い合います。一緒にいることで大きな相乗効果が生まれる関係です。';
  }

  @override
  String get compatibilitySummaryYukhap => '抜群の相性 (六合)';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return '$animal1と$animal2は強く惹かれ合う関係です。出会った瞬間から深いつながりを感じやすいでしょう。';
  }

  @override
  String get compatibilitySummaryChung => '努力が必要な関係 (冲)';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return '$animal1と$animal2は気質が異なり、衝突することがあります。お互いの違いを認め、思いやりを持つことが大切です。';
  }

  @override
  String get compatibilitySummaryWonjin => '理解が必要な関係 (怨辰)';

  @override
  String get compatibilityDescWonjin =>
      '理由もなく恨みや悲しみを感じることがある関係です。誤解を減らすために、こまめな対話を心がけましょう。';

  @override
  String get compatibilitySummaryDefaultZodiac => '平均的な相性';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return '$animal1と$animal2は大きな衝突もなく、円満な関係です。';
  }

  @override
  String get compatibilitySummaryCheonganHap => '運命の相手 (天干合)';

  @override
  String get compatibilityDescCheonganHap =>
      'お互いの性格や価値観が完璧に一致しています。言葉がなくても通じ合える、最高のパートナーです。';

  @override
  String get compatibilitySummarySangsaeng => 'お互いに助け合う関係 (相生)';

  @override
  String get compatibilityDescSangsaeng => 'お互いをサポートし、共に成長できるポジティブな関係です。';

  @override
  String get compatibilitySummarySanggeuk => '歩み寄りが必要な関係 (相克)';

  @override
  String get compatibilityDescSanggeuk =>
      '性格の違いがあるかもしれませんが、お互いの弱点を補完し合える関係でもあります。';

  @override
  String get compatibilitySummaryDefaultInner => '友達のような心地よさ';

  @override
  String get compatibilityDescDefaultInner => '傾向が似ており、友達のように気兼ねなく過ごせる関係です。';

  @override
  String get compatibilitySummarySameElement => '似た者同士の出会い';

  @override
  String compatibilityDescSameElement(String element) {
    return 'お二人とも「$element」の気質を持っており、価値観や行動パターンが非常に似ています。';
  }

  @override
  String get compatibilitySummaryCompatibleElement => '調和のとれたバランス';

  @override
  String get compatibilityDescCompatibleElement => '異なる魅力が調和し、バランスのとれた関係です。';

  @override
  String get compatibilitySummaryIncompatibleElement => '異なる魅力';

  @override
  String get compatibilityDescIncompatibleElement =>
      '気質が異なるため、最初は戸惑うこともあるかもしれませんが、知れば知るほど新しい発見がある関係です。';

  @override
  String get compatibilitySummaryDefaultConstellation => '平均的な調和';

  @override
  String get compatibilityDescDefaultConstellation => '星座の観点から見て、まずまずの相性です。';

  @override
  String get routineMorningTitle => '爽やかな朝です！ ☀️';

  @override
  String get routineMorningBody => '今日計画したルーチンミッションを忘れていませんか？';

  @override
  String get routineEveningTitle => '今日もお疲れ様でした！ ✨';

  @override
  String get routineEveningBody => '今日のミッションはすべて完了しましたか？ルーチンを締めくくりましょう。';

  @override
  String get routineCheckTitle => '今日のミッションを確認しましょう！ 🚀';

  @override
  String get routineCheckBody => 'ルーチンミッションを守って、気持ちの良い一日を過ごしましょう。';

  @override
  String get supplementNotificationTitle => 'サプリメント通知';

  @override
  String get waterNotificationTitle => '水分補給通知';

  @override
  String get routineNotificationTitle => 'デイルーチン通知';

  @override
  String get routineNotificationDescription =>
      'ルーチンミッションに遅れないよう、朝と夕方に通知を受け取ります。';

  @override
  String get morningRoutineTime => 'モーニングルーチンの時間';

  @override
  String get eveningRoutineTime => 'イブニングルーチンの時間';

  @override
  String get todaysFortuneNotificationTitle => '今日の運勢';

  @override
  String get afternoonFortuneNotificationBody => '午後の運勢はどうでしょうか？今すぐ確認してみてください！';

  @override
  String get morningFortuneNotificationBody => '今日の運勢を確認して、元気に一日を始めましょう！';

  @override
  String get fortunePassExpiryTitle => 'フォーチュンパス本日期限切れ';

  @override
  String get fortunePassExpiryBody =>
      '本日、フォーチュンパスのメンバーシップが期限切れになります。特典を継続するには更新してください！';

  @override
  String get takeNow => '今飲む';

  @override
  String get later => '後で';

  @override
  String get turnOffAlarmAction => 'アラームを止める';

  @override
  String get todaysFortuneNotification => '今日の運勢通知';

  @override
  String get enableNotification => '通知を有効にする';

  @override
  String get fortuneNotificationDescription => '指定した時間に今日の運勢をお知らせします。';

  @override
  String get morningNotificationTime => '午前の通知時間';

  @override
  String get afternoonNotificationTime => '午後の通知時間';

  @override
  String get morningFortuneTitle => '今日の運勢 (午前)';

  @override
  String get afternoonFortuneTitle => '今日の運勢 (午後)';

  @override
  String get type => 'タイプ';

  @override
  String get supplementChannelDesc => 'サプリメント摂取通知チャンネル。';

  @override
  String get waterChannelDesc => '水分補給習慣のための通知チャンネル。';

  @override
  String get waterSummaryTitle => '水分補給通知';

  @override
  String get dailyRoutineChannelDesc => '今日のミッション確認と習慣作りのための通知チャンネル。';

  @override
  String get dailyRoutineSummaryTitle => 'デイリールーチン通知';

  @override
  String get missionChannelName => 'ミッション通知';

  @override
  String get missionChannelDesc => '一般ミッション遂行のための通知チャンネル。';

  @override
  String get fortuneChannelName => '運勢通知';

  @override
  String get fortuneChannelDesc => '毎朝の運勢確認のための通知チャンネル。';

  @override
  String get subscriptionChannelName => '購読通知';

  @override
  String get subscriptionChannelDesc => 'フォーチュンパスの期限切れおよび購読関連の通知チャンネル。';

  @override
  String get alarmChannelName => 'アラーム';

  @override
  String get alarmChannelDesc => '起床およびミッション遂行のためのアラームチャンネル。';

  @override
  String get shareViaKakao => 'KakaoTalkで共有';

  @override
  String get shareViaSNS => '他のSNSで共有 (Instagram, Twitterなど)';

  @override
  String get checkDetailResult => '詳細な結果を確認';

  @override
  String get viewMyFortuneResult => '自分の運勢結果を見る';

  @override
  String get takeSupplementNow => 'サプリメントを飲んでください！';

  @override
  String get takeNowQuestion => '今飲みますか？';

  @override
  String get eatNow => '今飲む';

  @override
  String get eatLater => '後で飲む';

  @override
  String snoozeMessageGeneric(int minutes) {
    return '$minutes分後に再度お知らせします。';
  }

  @override
  String get hours => '時間';

  @override
  String get cheeringMessage4 => '活気ある朝、幸せなスタート！';

  @override
  String get cheeringMessage5 => '笑顔あふれる一日を。';

  @override
  String get cheeringMessage6 => '今日も一日頑張りましょう！';

  @override
  String get cheeringMessage7 => 'あなたは今日、十分に輝くでしょう。';

  @override
  String get cheeringMessage8 => '何かいいことが起こりそうな予感！';

  @override
  String get cheeringMessage9 => '今日もお疲れ様です。元気なスタートを！';

  @override
  String get cheeringMessage10 => '幸せはいつもあなたのそばにあります。';

  @override
  String get cheeringMessage11 => '今日のあなたの夢を応援しています。';

  @override
  String get cheeringMessage12 => '爽やかな朝、心地よい一日！';

  @override
  String get cheeringMessage13 => '今日という日に勝利しましょう！';

  @override
  String get cheeringMessage14 => 'あなたはありのままの姿で尊い存在です。';

  @override
  String get cheeringMessage15 => '楽しいこといっぱの一日になりますように。';

  @override
  String get cheeringMessage16 => '今日一日がキラキラ輝きますように！';

  @override
  String get cheeringMessage17 => 'あなたの笑顔が世界を明るくします。';

  @override
  String get cheeringMessage18 => 'あなたらしく過ごせる一日を！';

  @override
  String get cheeringMessage19 => '今日をときめく心で始めましょう。';

  @override
  String get cheeringMessage20 => '素晴らしい一日があなたを待っています。';

  @override
  String get cheeringMessage21 => 'ポジティブなパワーで今日を！';

  @override
  String get cheeringMessage22 => 'あなたの歩む道を応援しています。';

  @override
  String get cheeringMessage23 => '今日を最高の日にしましょう！';

  @override
  String get cheeringMessage24 => '幸運があなたと共にありますように！';

  @override
  String get cheeringMessage25 => '今日も温かい一日をお過ごしください。';

  @override
  String get cheeringMessage26 => 'あなたならできます！';

  @override
  String get cheeringMessage27 => '今日を感謝の気持ちで始めましょう。';

  @override
  String get cheeringMessage28 => 'あなたの価値は無限大です。';

  @override
  String get cheeringMessage29 => 'あなたの一日が笑顔で満開になりますように。';

  @override
  String get cheeringMessage30 => '良い人たちと楽しい時間を！';

  @override
  String get cheeringMessage31 => '今日、夢に一歩近づけますように！';

  @override
  String get cheeringMessage32 => '今日のあなたが一番素敵です。';

  @override
  String get cheeringMessage33 => '奇跡のような一日が訪れるでしょう。';

  @override
  String get cheeringMessage34 => '今日はゆったりと一日を楽しんでください。';

  @override
  String get cheeringMessage35 => 'あなたの努力は裏切りません。';

  @override
  String get cheeringMessage36 => '今日も健康な一日を。';

  @override
  String get cheeringMessage37 => 'あなたは愛されるために生まれてきました！';

  @override
  String get cheeringMessage38 => '今日一日、勇気を持って！';

  @override
  String get cheeringMessage39 => '明るい未来があなたを待っています。';

  @override
  String get cheeringMessage40 => '情熱あふれる一日を！';

  @override
  String get cheeringMessage41 => 'あなたの心が安らかでありますように。';

  @override
  String get cheeringMessage42 => '今日、小さな幸せを見つけてください。';

  @override
  String get cheeringMessage43 => 'あなたはもう十分に頑張っています。';

  @override
  String get cheeringMessage44 => '今日を希望を持って始めましょう。';

  @override
  String get cheeringMessage45 => 'あなたの親切は誰かの大きな力になります。';

  @override
  String get cheeringMessage46 => '今日も実りある一日を。';

  @override
  String get cheeringMessage47 => 'あなたには世界を変える力があります。';

  @override
  String get cheeringMessage48 => '晴れやかな一日を！';

  @override
  String get cheeringMessage49 => 'あなたの魅力を存分に発揮してください。';

  @override
  String get cheeringMessage50 => '今日一日を幸せでいっぱいにしましょう！';

  @override
  String get locationServiceDisabled => '位置情報サービスが無効になっています。';

  @override
  String get locationPermissionDenied => '位置情報の権限が拒否されました。';

  @override
  String get locationPermissionPermanentlyDenied => '位置情報の権限が永久に拒否されました。';

  @override
  String get deleteMissionTitle => 'ミッションを削除';

  @override
  String get yesDelete => 'はい、削除します';

  @override
  String get waterAlarmTitle => '水を飲む時間です！ 💧';

  @override
  String get waterAlarmBody => '健康のために冷たい水を一杯いかがですか？';

  @override
  String get supplementAlarmBody => '今日のサプリメントを忘れずに服用してください。';

  @override
  String get waterHabitChannelDesc => '水飲み習慣のための通知チャンネル。';

  @override
  String get pleaseSolveMath => '問題を解いてください。';

  @override
  String detectedLabel(String labels) {
    return '[認識済み: $labels]';
  }

  @override
  String get defaultSleepDuration => '7時間30分';

  @override
  String get year2024Name => '甲辰年（青い龍の年）';

  @override
  String get year2025Name => '乙巳年（青い蛇の年）';

  @override
  String get year2026Name => '丙午年（赤い馬の年）';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle お問い合わせ] $title';
  }

  @override
  String get summary => '要約';

  @override
  String get monthlySummary => '月間要約';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month月 成功率: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return '$month月の記録なし';
  }

  @override
  String get missionRecord => 'ミッション記録';

  @override
  String get supplementRecord => '摂取記録';

  @override
  String get timeSaleCatchChance => '50%割引のチャンスをつかもう！';
}
