// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '幸運アラーム';

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
  String hoursMinutesRemaining(int hours, int minutes) {
    return '$hours時間$minutes分後に鳴ります';
  }

  @override
  String minutesRemaining(int minutes) {
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
  String get randomBackgroundDesc => 'アラームが鳴るたびに新しい背景に！';

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
  String snoozeInfo(int minutes, int count) {
    return '$minutes分, $count回';
  }

  @override
  String snoozeInfoUnlimited(int minutes) {
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
  String minutesLater(int minutes) {
    return '$minutes分後';
  }

  @override
  String get countLabel => '回数';

  @override
  String timesCount(int count) {
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
  String get missionSnap => 'スナップ';

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
  String missionSnoozeMessage(int minutes) {
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
  String get defaultRingtone => 'デフォルトの着信音';

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
  String snoozeMinutesUnlimited(int minutes) {
    return '$minutes分（無制限）';
  }

  @override
  String snoozeMinutesCount(int minutes, int current, int total) {
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
  String get tarotKeywords1 => '創造, 意志, 能力, 実現, 多才さ';

  @override
  String get tarotDescription1 =>
      '魔術師は赤いローブをまとい、片手を天に、もう片手を地に指して、天の力を地にもたらしています。テーブルの上には4つのエレメント（ワンド、カップ、ソード、ペンタクル）があり、これはあなたが目標を達成するためのすべての道具と能力をすでに持っていることを意味します。';

  @override
  String get tarotLoveMeaning1 =>
      'あなたの魅力が最高潮に達し、異性から人気を集める時期です。気になる人がいるなら、機転の利いた会話で関係を発展させ、リードすることができます。';

  @override
  String get tarotLoveDetail1 =>
      'あなたの魅力と才能が輝き、異性の心を掴む絶好のチャンスです。好きな人がいるなら、ためらわずに積極的にアプローチしてみてください。あなたのユーモアとセンスのある会話は相手を喜ばせ、主体的に関係をリードできるでしょう。フリーの方は複数の異性からアプローチを受ける可能性があり、カップルの方はデートコースをリードしたりイベントを準備したりすると、相手は非常に感動するでしょう。自信を持って愛を勝ち取ってください。';

  @override
  String get tarotWealthMeaning1 =>
      'あなたの能力と技術を活かして収益を生み出すのに適した時期です。頭の中にあるアイデアを形にすれば、経済的な成果につながります。';

  @override
  String get tarotWealthDetail1 =>
      'あなたの知識、技術、アイデアがお金になる時期です。給料だけに満足せず、副業やフリーランス活動を通じて追加収入を創出してみてください。独創的な企画、営業力、話術が遺憾なく発揮され、期待以上の収益が得られるでしょう。資金運用においてもあなたの判断が的中しやすいので、主体的に財務計画を立てて実行に移せば良い結果が得られます。';

  @override
  String get tarotSuccessMeaning1 =>
      'あなたの仕事能力が遺憾なく発揮され、周囲に認められるでしょう。計画していることがあれば、今が実行に移す時です。';

  @override
  String get tarotSuccessDetail1 =>
      '自分の能力を最大限に活かして、職場や学業で頭角を現すことができます。どんな問題に直面しても、あなた自身の機転とユーモアで解決でき、同僚や上司から「有能な人」として認められるでしょう。新しいプロジェクトを主導したり、重要なプレゼンテーションを行ったりすれば、成功裏に終えることができます。準備ができている者にチャンスが訪れるように、あなたはすでに十分な準備ができています。自分を信じて、ステージ上の主人公のように堂々と実力を発揮してください。';

  @override
  String get policy => '利用規約とプライバシーポリシー';

  @override
  String get support => 'サポート';

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
  String get times => '回';

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
  String categoryMissions(Object category) {
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
  String get notificationTime => '通知時間';

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
  String hourFormat(Object hour) {
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
  String get compatibilityTitleGreat => 'とても良い縁です 💕';

  @override
  String get compatibilityDescGreat => 'お互いに大きな力になる素晴らしいパートナーです。';

  @override
  String get compatibilityTitleGood => 'お似合いのカップルです 😊';

  @override
  String get compatibilityDescGood => '少しの違いはありますが、お互いに合わせながら素敵な恋ができます。';

  @override
  String get compatibilityTitleEffort => '努力が必要です 🧐';

  @override
  String get compatibilityDescEffort => '違う点が多いです。理解と思いやりが関係の鍵です。';

  @override
  String get compatibilityTitleDifficult => 'たくさん合わせる必要があります 😅';

  @override
  String get compatibilityDescDifficult =>
      '性格の違いが大きいかもしれません。お互いの違いを深く理解する必要があります。';

  @override
  String get compatibilityResultButton => '相性結果を見る';

  @override
  String get compatibilityDeleteTooltip => '削除';

  @override
  String get compatibilityGenderMale => '男性';

  @override
  String get compatibilityGenderFemale => '女性';

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
  String tojeongShareTitle(Object year) {
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
  String tojeongCoreMessage(Object hasu, Object jungsu, Object sangsu) {
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
}
