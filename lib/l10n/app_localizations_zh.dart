// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '幸运闹钟';

  @override
  String get morningGreeting => '早上好！开启你幸运的一天。';

  @override
  String get missionWakeUp => '起床任务';

  @override
  String get missionSupplement => '服用营养品';

  @override
  String get missionWater => '饮水2L以上';

  @override
  String get fortuneCookie => '幸运饼干';

  @override
  String get settings => '设置';

  @override
  String get alarm => '闹钟';

  @override
  String get calendar => '日历';

  @override
  String get mission => '任务';

  @override
  String get fortune => '运势';

  @override
  String get congratulations => '恭喜！';

  @override
  String get allMissionsCompleted => '您已完成今天的全部5项任务。';

  @override
  String get rewardReceived => '作为奖励，您获得1个幸运饼干！ 🥠';

  @override
  String get confirm => '确认';

  @override
  String get exactAlarmPermissionRequired => '为了在准确时间响铃，需要“准确闹钟”权限。';

  @override
  String get overlayPermissionRequired => '为了显示全屏通知，需要“在其他应用上层显示”权限。';

  @override
  String get deleteAllAlarms => '删除所有闹钟';

  @override
  String get noAlarms => '没有已注册的闹钟。';

  @override
  String get lessThanAMinuteRemaining => '不到1分钟后响铃';

  @override
  String hoursMinutesRemaining(int hours, int minutes) {
    return '$hours小时$minutes分钟后响铃';
  }

  @override
  String minutesRemaining(int minutes) {
    return '$minutes分钟后响铃';
  }

  @override
  String get am => '上午';

  @override
  String get pm => '下午';

  @override
  String get dailyFortuneCookieReward => '今日幸运饼干奖励';

  @override
  String get missionRewardInfo => '成功完成5个任务奖励1个，10个奖励2个！';

  @override
  String get dailyMission => '今日任务';

  @override
  String goalAchieved(int completed) {
    return '🎉 已达成 $completed/5 目标！';
  }

  @override
  String missionProgress(int completed) {
    return '已达成 $completed/5';
  }

  @override
  String get myMissionRecord => '我的任务记录';

  @override
  String get consecutiveSuccess => '连续成功';

  @override
  String get successRate30Days => '成功率(30天)';

  @override
  String get totalSuccess => '总成功天数';

  @override
  String get inProgress => '进行中 🔥';

  @override
  String get resetMissions => '重置任务';

  @override
  String get resetMissionsConfirm => '确定要重置所有挑战列表吗？\n（基本系统任务除外）';

  @override
  String get cancel => '取消';

  @override
  String get reset => '重置';

  @override
  String get addMission => '添加任务';

  @override
  String get completedMissions => '已完成的任务';

  @override
  String greeting(String userName) {
    return '您好，$userName';
  }

  @override
  String get welcomeFortune => '欢迎来到神秘的运势世界';

  @override
  String get luckyColor => '幸运色';

  @override
  String get luckyItem => '幸运物品';

  @override
  String get luckyDirection => '吉利方向';

  @override
  String get viewVariousFortunes => '查看各种运势';

  @override
  String get todaysRecommendation => '今日推荐';

  @override
  String get checkTodaysFortune => '查看今日运势';

  @override
  String get todaysAdvice => '神秘星辰给出的今日建议';

  @override
  String get viewSpecificDateFortune => '查看指定日期运势';

  @override
  String get lottoRecommendation => '乐透号码推荐';

  @override
  String get luckyNumber => '幸运数字';

  @override
  String get specificDateFortune => '指定日期运势';

  @override
  String get specialDayFortune => '特别日子运势';

  @override
  String get newYearFortune => '新年运势';

  @override
  String get totalFortune2025 => '2025年整体运势';

  @override
  String get traditionalFortune => '传统推算';

  @override
  String get traditionalSaju => '传统四柱八字';

  @override
  String get faceReading => '看面相';

  @override
  String get missionFaceReading => 'Face Reading Mission';

  @override
  String get faceFate => '面相与命运';

  @override
  String get compatibility => '查看配对';

  @override
  String get relationshipHarmony => '缘分和谐度';

  @override
  String get general => '常规';

  @override
  String get darkMode => '深色模式';

  @override
  String get darkModeDescription => '将屏幕设置为深色。';

  @override
  String get alarmSettings => '闹钟设置';

  @override
  String get information => '信息';

  @override
  String get notice => '公告';

  @override
  String get weatherConditionSunny => 'Sunny';

  @override
  String get weatherConditionCloudy => 'Cloudy';

  @override
  String get weatherConditionFoggy => 'Foggy';

  @override
  String get weatherConditionRainy => 'Rainy';

  @override
  String get weatherConditionSnowy => 'Snowy';

  @override
  String get weatherConditionThunderstorm => 'Thunderstorm';

  @override
  String get airQualityGood => 'Good';

  @override
  String get airQualityNormal => 'Normal';

  @override
  String get airQualityBad => 'Bad';

  @override
  String get airQualityVeryBad => 'Very Bad';

  @override
  String get locationUnknown => 'Unknown Location';

  @override
  String get locationError => 'Location Error';

  @override
  String get faq => '常见问题';

  @override
  String get sendFeedback => '发送反馈';

  @override
  String get feedbackDescription =>
      '如果您在使用幸运闹钟时遇到任何不便或有建议的功能，请随时告知我们。\n您的宝贵意见将帮助我们提供更好的服务。';

  @override
  String get reportCopyright => '报告版权侵权';

  @override
  String get copyrightDescription =>
      '如果您认为幸运闹钟内的内容侵犯了版权，请通过电子邮件举报。\n核实后我们将立即采取行动。';

  @override
  String get termsOfService => '服务条款';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get alarmOptimization => '闹钟响铃优化';

  @override
  String get allOptimizationsCompleted => '所有优化设置已完成';

  @override
  String get optimizationNeeded => '为了闹钟准时响铃，需要进行设置。';

  @override
  String get optimizationDescription =>
      '由于Android系统设置，闹钟可能会延迟或不响铃。请将所有选项设置为允许。';

  @override
  String get allowNotificationPermission => '允许通知权限';

  @override
  String get notificationPermissionDescription => '响铃时显示通知所需。';

  @override
  String get excludeBatteryOptimization => '电池优化排除';

  @override
  String get batteryOptimizationDescription => '确保在省电模式下闹钟也能立即响铃。';

  @override
  String get allowExactAlarm => '允许准确闹钟';

  @override
  String get exactAlarmDescription => '确保闹钟准时响铃，不受系统延迟影响。';

  @override
  String get drawOverOtherApps => '在其他应用上层显示';

  @override
  String get overlayDescription => '即使在锁屏或使用其他应用时也能显示闹钟界面。';

  @override
  String get allSettingsCompleted => '所有设置已完成。';

  @override
  String get manualSettingsInfo => '您可以直接在Android系统设置中取消设置。';

  @override
  String get takePhoto => '拍照';

  @override
  String get selectPhoto => '选择照片';

  @override
  String get selectAlarmBackground => '选择闹钟背景';

  @override
  String get defaultLabel => '默认';

  @override
  String get howToAdd => '如何添加';

  @override
  String get addAssetInstructions =>
      '将图片放入 assets/images/ 文件夹并在 pubspec.yaml 中注册。';

  @override
  String get gallery => '相册';

  @override
  String get ringingNow => '现在响铃';

  @override
  String get setTime => '设置时间';

  @override
  String get repeatDays => '重复日期';

  @override
  String get repeatDaily => '每天重复';

  @override
  String get snoozeSettings => '贪睡设置';

  @override
  String get interval => '间隔';

  @override
  String get wakeUpAlarm => '起床闹钟';

  @override
  String snoozeInfo(int interval, int count) {
    return '$interval分钟, $count次';
  }

  @override
  String get daySun => '日';

  @override
  String get dayMon => '一';

  @override
  String get dayTue => '二';

  @override
  String get dayWed => '三';

  @override
  String get dayThu => '四';

  @override
  String get dayFri => '五';

  @override
  String get daySat => '六';

  @override
  String get missionRewardEarned => '恭喜！您已完成今天的5项任务，获得1个幸运饼干！';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return 'Congratulations! You completed $missions missions today and earned $cookies Fortune Cookie(s)!';
  }

  @override
  String daysCount(int count) {
    return '$count天';
  }

  @override
  String get user => '用户';

  @override
  String get none => '无';

  @override
  String minutesLater(int minutes) {
    return '$minutes分钟后';
  }

  @override
  String get countLabel => '次数';

  @override
  String timesCount(int count) {
    return '$count次 (共$count次)';
  }

  @override
  String get wakeUpMission => '起床任务';

  @override
  String get alarmSound => '闹钟声音';

  @override
  String get gradualVolume => '音量渐强';

  @override
  String get vibration => '震动';

  @override
  String get alarmNameAndBackground => '闹钟名称和背景';

  @override
  String get alarmName => '闹钟名称';

  @override
  String get enterAlarmName => '请输入闹钟名称';

  @override
  String get save => '保存';

  @override
  String get missionNone => '无任务';

  @override
  String get missionSnap => 'Snap';

  @override
  String get missionMath => '计算';

  @override
  String get missionFortune => '运势';

  @override
  String get missionShake => '摇晃';

  @override
  String get missionFortuneCatch => 'Fortune Catch';

  @override
  String get missionNoDescription => '无任务直接响铃。';

  @override
  String get missionCameraDescription => '按顺序拍摄指定物品以关闭闹钟。';

  @override
  String get missionMathDescription => '解决数学题以关闭闹钟。';

  @override
  String get missionFortuneDescription => '已选择运势任务。';

  @override
  String get missionShakeDescription => '摇晃手机以关闭闹钟。';

  @override
  String get missionFortuneCatchDescription => 'Catch the moving Fortuni!';

  @override
  String get missionWalk => 'Walk';

  @override
  String get missionWalkDescription => 'Walk to turn off the alarm!';

  @override
  String get missionFaceDescription => 'Keep your face in the frame for 10s.';

  @override
  String get walkStepCount => 'Target Steps';

  @override
  String walkSteps(int count) {
    return '$count steps';
  }

  @override
  String get missionNumberOrder => 'Number Order';

  @override
  String get missionNumberOrderDescription =>
      'Tap numbers from 1 to 9 in order.';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return 'Next: $nextNumber';
  }

  @override
  String get missionHiddenButton => 'Position Memory';

  @override
  String get missionHiddenButtonDescription =>
      'Memorize the lit tiles in order and tap them within 10 seconds.';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => 'Tap Sprint';

  @override
  String get missionTapSprintDescriptionShort => 'Tap to fill the meter.';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return 'Tap $goalTaps+ times to fill the meter.';
  }

  @override
  String get missionTapSprintTapHere => 'Tap';

  @override
  String get missionTapSprintHint => 'Fills up fast, drains if you pause.';

  @override
  String get missionLeftRight => 'Left / Right';

  @override
  String get missionLeftRightDescriptionShort =>
      'Follow the prompt and pick left or right.';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return 'Get $targetStreak correct in a row.';
  }

  @override
  String get missionLeftRightPromptLeft => 'Tap LEFT';

  @override
  String get missionLeftRightPromptRight => 'Tap RIGHT';

  @override
  String get left => 'Left';

  @override
  String get right => 'Right';

  @override
  String get missionHintInactivity => 'If you stop for 2 minutes, it resets.';

  @override
  String fortuneCatchScore(int score) {
    return 'Score: $score';
  }

  @override
  String get fortuneCatchGoal => 'Goal: 100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '(Catches: $count/$min)';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo Combo!';
  }

  @override
  String get difficulty => '难度';

  @override
  String get difficultyEasy => '简单';

  @override
  String get difficultyNormal => '普通';

  @override
  String get difficultyHard => '困难';

  @override
  String get problemCount => '题目数量';

  @override
  String problemsCount(int count) {
    return '$count题';
  }

  @override
  String get shakeCount => 'Shake Count';

  @override
  String shakeTimes(int count) {
    return '$count times';
  }

  @override
  String missionNumber(int number) {
    return 'Mission $number';
  }

  @override
  String get soundBirds => 'Bird Sounds';

  @override
  String get shakeCountLabel => '摇晃次数';

  @override
  String missionIndex(int index) {
    return '任务 $index';
  }

  @override
  String get ringtoneSelect => '选择铃声';

  @override
  String get vibrationSelect => '选择震动模式';

  @override
  String get defaultRingtone => '默认铃声';

  @override
  String get classicAlarm => '经典闹钟';

  @override
  String get digitalAlarm => '数字闹钟';

  @override
  String get birdsSound => '鸟鸣声';

  @override
  String get wavesSound => '海浪声';

  @override
  String get defaultVibration => '默认振动';

  @override
  String get shortVibration => '短促重复';

  @override
  String get longVibration => '长震动重复';

  @override
  String get heartbeatVibration => '心跳震动';

  @override
  String get sosVibration => 'SOS';

  @override
  String get quickVibration => '快速跳动';

  @override
  String get permissionRequired => '需要权限';

  @override
  String get exactAlarmPermissionDesc => '为了在准确时间响铃，需要“日程与提醒”权限。';

  @override
  String get batteryOptimizationPermissionDesc => '为了确保闹钟准时，需要关闭电池优化。';

  @override
  String get overlayPermissionDesc => '为了在响铃时显示任务界面，需要“在其他应用上层显示”权限。';

  @override
  String get cameraMissionFirstImageError => '请至少设置第一张任务图片。';

  @override
  String get cameraMissionSequentialImageError => '请按顺序设置任务图片。';

  @override
  String errorOccurred(String error) {
    return '发生错误: $error';
  }

  @override
  String get openSettings => '打开设置';

  @override
  String get exactAlarmPermissionFail => '闹钟设置失败。需要开启准确闹钟权限。';

  @override
  String get batteryOptimizationPermissionFail => '闹钟设置失败。需要关闭电池优化。';

  @override
  String get overlayPermissionFail => '闹钟设置失败。需要开启“在其他应用上层显示”权限。';

  @override
  String get unknownAlarmError => '闹钟设置失败。发生未知错误。';

  @override
  String get resetTooltip => '重置';

  @override
  String get errorLoadingAlarm => '无法加载闹钟信息。';

  @override
  String get alarmNotFound => '未找到闹钟信息。';

  @override
  String repeatAlarmCount(int current, int max) {
    return '重复闹钟 ($current/$max)';
  }

  @override
  String get turnOffAlarm => '关闭闹钟';

  @override
  String get startMission => '开始任务';

  @override
  String get fortuneTitle => '查看运势';

  @override
  String get fortuneMessage => '查看您的运势结果\n并获得隐藏的礼物！';

  @override
  String get fortuneAdButton => '观看广告并查看结果';

  @override
  String get fortuneLoadingMessage => '体验占卜师特别的塔罗牌解读。';

  @override
  String fortuneAnalyzing(int progress) {
    return '正在分析您选择的塔罗牌... $progress%';
  }

  @override
  String get fortuneSelectTitle => '思考今天的能量\n并选择3张牌。';

  @override
  String fortuneSelectTitleDate(int month, int day) {
    return '思考 $month月$day日的能量\n并选择3张牌。';
  }

  @override
  String get fortuneNewYearButton => '查看 2025 年新年运势';

  @override
  String get loveFortune => '爱情运';

  @override
  String get wealthFortune => '财运';

  @override
  String get successFortune => '成功运';

  @override
  String get fortuneResultTitle => '这是您今天的运势结果。';

  @override
  String fortuneResultTitleDate(int year, int month, int day) {
    return '$year年$month月$day日的运势';
  }

  @override
  String get startDayButton => '开始新的一天';

  @override
  String get policy => '服务条款和隐私政策';

  @override
  String get support => '支持';

  @override
  String get defaultAlarmBehavior => '默认闹钟行为';

  @override
  String get defaultAlarmVolume => '默认闹钟音量';

  @override
  String get defaultAlarmVolumeDescription => '创建新闹钟时应用的默认音量。';

  @override
  String get gradualVolumeDescription => '设置闹钟声音逐渐增大。';

  @override
  String get defaultVibrationDescription => '创建新闹钟时默认启用振动。';

  @override
  String get defaultInterval => '默认间隔';

  @override
  String get maxSnoozeCountLabel => '最大重复次数';

  @override
  String get minutes => '分';

  @override
  String get times => '次';

  @override
  String cupsCount(int current, int goal) {
    return '($current杯/$goal杯)';
  }

  @override
  String timesCountProgress(int current, int goal) {
    return '($current次/$goal次)';
  }

  @override
  String get missionGym => '去健身房';

  @override
  String get missionWorkout => '家庭训练';

  @override
  String get missionDiary => '写日记';

  @override
  String get missionBedMaking => '整理床铺';

  @override
  String get missionStretching => '拉伸';

  @override
  String get missionReading => '阅读10分钟';

  @override
  String get missionPlanning => '制定今日计划';

  @override
  String get missionBreakfast => '吃早餐';

  @override
  String get missionMeditation => '冥想5分钟';

  @override
  String get missionEnglishWords => '背5个单词';

  @override
  String get missionVentilation => '通风';

  @override
  String get missionCleaning => '打扫房间';

  @override
  String get missionGratitudeDiary => '感恩日记';

  @override
  String get faqQuestion1 => 'Alarms are not ringing.';

  @override
  String get faqAnswer1 =>
      'Alarms may be delayed or blocked due to the Android system\'s battery optimization feature. Please set all permissions to \'Allow\' in the Settings > Alarm Optimization menu.';

  @override
  String get faqQuestion2 => 'I want to change the mission.';

  @override
  String get faqAnswer2 =>
      'You can change it to the mission you want (Math, Photo, Shake, etc.) in the mission selection menu after tapping the alarm you want to edit in the alarm list.';

  @override
  String get faqQuestion3 => 'How do I set Dark Mode?';

  @override
  String get faqAnswer3 =>
      'You can change the screen theme through the Settings > General > Dark Mode toggle.';

  @override
  String get faqQuestion4 => 'How do I collect fortune cookies?';

  @override
  String get faqAnswer4 =>
      'You can earn fortune cookies every time you dismiss an alarm in the morning or complete a mission. Check your daily fortune with the cookies you\'ve collected!';

  @override
  String get faqQuestion5 => 'Will my data disappear if I delete the app?';

  @override
  String get faqAnswer5 =>
      'Yes, Fortune Alarm stores data inside the device, so deleting the app will delete all your set alarms and mission records. Please be careful.';

  @override
  String get noticeLabel => 'Notice';

  @override
  String get notice1Title => 'Fortune Alarm Official Launch';

  @override
  String get notice1Content =>
      'Hello. Fortune Alarm has been officially launched.\\n\\nCheck your daily fortune with your alarm every morning and start a happy day!\\nWe will continue to provide more diverse features and improved services.\\n\\nThank you.';

  @override
  String get notice2Title => 'Version 1.0.0 Update News';

  @override
  String get notice2Content =>
      'Here is the content of the version 1.0.0 update.\\n\\n1. Supplement mission UI improvement\\n2. System setting integration for accurate alarms\\n3. Dark mode support\\n4. Bug fixes and stability improvements\\n\\nExperience the latest version now!';

  @override
  String get notice3Title => 'Terms of Service Revision Notice';

  @override
  String get notice3Content =>
      'The Terms of Service have been revised.\\n\\nKey revisions:\\n- Strengthened Privacy Policy\\n- Specified service usage scope\\n\\nDetails can be found on the Settings > Terms page.';

  @override
  String get supportContentTitle => 'Inquiry Content';

  @override
  String get supportHint => 'Please enter the content.';

  @override
  String get supportRecipient => 'Recipient (Customer Support)';

  @override
  String get emailCopied => 'Email address copied.';

  @override
  String get copyTooltip => 'Copy';

  @override
  String get supportWorkingDays =>
      'We will try to respond within 24 hours on weekdays.';

  @override
  String get supportEmptyError => 'Please enter the content.';

  @override
  String get supportSubjectPrefix => 'Inquiry Title';

  @override
  String get supportContentPrefix => 'Inquiry Content';

  @override
  String get supportCopySuccessTitle => 'Inquiry Copied';

  @override
  String supportCopySuccessMessage(String email) {
    return 'Inquiry content has been copied to clipboard.\\nWould you like to send an email to $email?';
  }

  @override
  String get copyEmailAction => 'Copy Email Address';

  @override
  String get copyEmailSuccessMessage =>
      'Email address copied. Please paste it in your email app.';

  @override
  String get supportSubmitButton => 'Copy Inquiry and Send';

  @override
  String get shakePhone => '请摇晃手机！';

  @override
  String get englishQuizMission => '英语问答任务';

  @override
  String get quizInstruction => '按顺序点击左侧单词和右侧意思进行匹配。';

  @override
  String get missionSuccess => '任务成功！';

  @override
  String get goHome => '返回首页';

  @override
  String get quizWord1 => '苹果';

  @override
  String get quizWord1Ans => 'apple';

  @override
  String get quizWord2 => '香蕉';

  @override
  String get quizWord2Ans => 'banana';

  @override
  String get quizWord3 => '学校';

  @override
  String get quizWord3Ans => 'school';

  @override
  String get quizWord4 => '电脑';

  @override
  String get quizWord4Ans => 'computer';

  @override
  String get quizWord5 => '水';

  @override
  String get quizWord5Ans => 'water';

  @override
  String get quizWord6 => '朋友';

  @override
  String get quizWord6Ans => 'friend';

  @override
  String get quizWord7 => '家人';

  @override
  String get quizWord7Ans => 'family';

  @override
  String get quizWord8 => '房子';

  @override
  String get quizWord8Ans => 'house';

  @override
  String get quizWord9 => '书';

  @override
  String get quizWord9Ans => 'book';

  @override
  String get quizWord10 => '爱';

  @override
  String get quizWord10Ans => 'love';

  @override
  String get quizWord11 => '太阳';

  @override
  String get quizWord11Ans => 'sun';

  @override
  String get quizWord12 => '月亮';

  @override
  String get quizWord12Ans => 'moon';

  @override
  String get quizWord13 => '大海';

  @override
  String get quizWord13Ans => 'sea';

  @override
  String get quizWord14 => '天空';

  @override
  String get quizWord14Ans => 'sky';

  @override
  String get quizWord15 => '树';

  @override
  String get quizWord15Ans => 'tree';

  @override
  String get missionComplete => '任务完成！';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get fortuneCheckButton => 'Check Fortune';

  @override
  String get fortuneSelectCards => 'Select 3 cards';

  @override
  String get fortuneDragCards => 'Drag and select 3 cards';

  @override
  String get fortuneDetailTitle => '详细解读';

  @override
  String get labelFineDust => 'Fine Dust';

  @override
  String get labelUltraFineDust => 'Ultra Fine Dust';

  @override
  String get weatherToday => 'Today\'s Weather';

  @override
  String get weatherUpdateMessage =>
      'Updating weather information for current location.';

  @override
  String get weatherDisclaimer =>
      'Observed data may vary depending on local conditions or reception status.';

  @override
  String get weatherSource =>
      'Provided by Meteorological Administration, Korea Environment Corporation';

  @override
  String get locationPermissionTitle => 'Allow Location Permission';

  @override
  String get locationPermissionDesc =>
      'Required to display weather information.';
}
