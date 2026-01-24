// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'フォーチュンアラーム';

  @override
  String get morningGreeting => 'おはようございます！幸運な一日を始めましょう。';

  @override
  String get missionWakeUp => '起床ミッション';

  @override
  String get missionSupplement => 'サプリメント摂取';

  @override
  String get missionWater => '水2L以上飲む';

  @override
  String get fortuneCookie => 'フォーチュンクッキー';

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
  String get viewVariousFortunes => '様々な運勢を見る';

  @override
  String get todaysRecommendation => '今日のすすめ';

  @override
  String get checkTodaysFortune => '今日の運勢を確認';

  @override
  String get todaysAdvice => '神秘的な星々が語る今日の助言';

  @override
  String get viewSpecificDateFortune => '指定日の運勢を見る';

  @override
  String get lottoRecommendation => 'ロト番号のおすすめ';

  @override
  String get luckyNumber => 'ラッキーナンバー';

  @override
  String get specificDateFortune => '指定日運勢';

  @override
  String get specialDayFortune => '特別な日の運勢';

  @override
  String get newYearFortune => '新年の運勢';

  @override
  String get totalFortune2026 => '2026年全体の運勢';

  @override
  String get traditionalFortune => '土亭秘訣';

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
  String get weatherConditionCloudy => 'くもり';

  @override
  String get weatherConditionFoggy => '霧';

  @override
  String get weatherConditionRainy => '雨';

  @override
  String get weatherConditionSnowy => '雪';

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
  String get gallery => 'ギャラリー';

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
  String get interval => '間隔';

  @override
  String get wakeUpAlarm => '起床アラーム';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval分, $count回';
  }

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
  String get none => 'なし';

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
  String get save => '保存';

  @override
  String get missionNone => 'ミッションなし';

  @override
  String get missionSnap => 'Snap';

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
  String get shakeCount => '振った回数';

  @override
  String shakeTimes(int count) {
    return '$count回';
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
  String get defaultVibration => 'デフォルトの振動';

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
  String get permissionRequired => '権限が必要';

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
  String get cameraMissionSequentialImageError => 'ミッション画像を順番に設定してください。';

  @override
  String errorOccurred(String error) {
    return 'エラーが発生しました: $error';
  }

  @override
  String get openSettings => '設定を開く';

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
  String fortuneSelectTitleDate(int month, int day) {
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
  String fortuneResultTitleDate(int year, int month, int day) {
    return '$year年$month月$day日の運勢';
  }

  @override
  String get startDayButton => '今日一日を始める';

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
  String get copyEmailAction => 'メールアドレスをコピー';

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
}
