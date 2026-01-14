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
  String get noCompletedMissionsHint => '还没有已完成的任务。去达成今天的任务目标吧。';

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
  String get totalFortune2026 => '2026年整体运势';

  @override
  String get traditionalFortune => '传统推算';

  @override
  String get traditionalSaju => '传统四柱八字';

  @override
  String get faceReading => '看面相';

  @override
  String get missionFaceReading => '面相任务';

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
  String get weatherConditionSunny => '晴';

  @override
  String get weatherConditionCloudy => '多云';

  @override
  String get weatherConditionFoggy => '雾';

  @override
  String get weatherConditionRainy => '雨';

  @override
  String get weatherConditionSnowy => '雪';

  @override
  String get weatherConditionThunderstorm => '雷暴';

  @override
  String get airQualityGood => '优';

  @override
  String get airQualityNormal => '良';

  @override
  String get airQualityBad => '差';

  @override
  String get airQualityVeryBad => '很差';

  @override
  String get locationUnknown => '未知位置';

  @override
  String get locationError => '定位错误';

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
  String get privacyPolicy =>
      '服务条款与隐私政策\n\n1. 总则\n\n第1条（目的）\n本条款旨在规定“幸运闹钟”（以下简称“本服务”）所提供服务的使用条件与流程，以及用户与开发者的权利、义务与责任等事项。\n\n第2条（隐私政策）\n\n1. 个人信息收集项目与方式\n本服务无需注册即可使用，不会在独立服务器上保存或收集用户的个人信息。\n但在使用过程中，以下信息可能会在设备上生成并本地保存：\n- 闹钟设置、任务完成记录、幸运饼干获取记录等\n\n2. 设备权限使用说明\n为提供服务，本服务仅在必要范围内使用以下权限：\n- 通知（必需）：用于闹钟运行及幸运饼干通知\n- 精确闹钟与电池优化排除（必需）：用于确保在省电模式下闹钟也能准时响铃\n- 在其他应用上层显示（必需）：用于在锁屏或使用其他应用时显示闹钟界面\n- 相机（可选）：仅用于“物体拍摄”任务；拍摄图片仅在设备上处理，不会上传至服务器\n\n3. 广告服务与数据处理\n为免费提供服务，本服务使用 Google AdMob 投放广告。\nGoogle 可能会为广告个性化设置收集广告标识符（ADID）等非个人身份信息。\n- Google 隐私政策：https://policies.google.com/privacy\n\n第3条（数据存储与删除）\n本服务为本地应用，数据存储在用户设备中。\n如删除应用，设备中保存的所有数据（闹钟、任务记录等）将立即删除且无法恢复。\n\n第4条（免责声明）\n1. 本服务提供的运势信息仅供娱乐参考，不保证其准确性或可靠性。\n2. 因设备设置变更（关闭通知、启用电池优化等）或系统错误导致闹钟未响，开发者不承担责任。\n\n第5条（联系方式）\n如有任何问题或意见，请通过以下邮箱联系我们：\n邮箱：seriessnap.co@gmail.com';

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
    return '恭喜！今天完成了$missions个任务，获得$cookies个幸运饼干！';
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
  String get customStyle => '自定义样式';

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
  String get missionFortuneCatch => '运势捕捉';

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
  String get missionFortuneCatchDescription => '抓住移动的 Fortuni！';

  @override
  String get missionWalk => '走路';

  @override
  String get missionWalkDescription => '走路即可关闭闹钟！';

  @override
  String get missionFaceDescription => '将脸保持在画面中5秒。';

  @override
  String get walkStepCount => '目标步数';

  @override
  String walkSteps(int count) {
    return '$count步';
  }

  @override
  String get missionNumberOrder => '数字顺序';

  @override
  String get missionNumberOrderDescription => '按顺序点击1到9。';

  @override
  String missionNumberOrderGuide(int nextNumber) {
    return '下一个：$nextNumber';
  }

  @override
  String get missionHiddenButton => '位置记忆';

  @override
  String get missionHiddenButtonDescription => '按顺序记住亮起的方块，并在10秒内点击它们。';

  @override
  String missionHiddenButtonDifficulty(int delta) {
    return 'Δ$delta';
  }

  @override
  String get missionTapSprint => '连点冲刺';

  @override
  String get missionTapSprintDescriptionShort => '连点填满进度条。';

  @override
  String missionTapSprintDescription(int goalTaps) {
    return '点击$goalTaps次以上填满进度条。';
  }

  @override
  String get missionTapSprintTapHere => '点击';

  @override
  String get missionTapSprintHint => '快速增长，停下会下降。';

  @override
  String get missionLeftRight => '左 / 右';

  @override
  String get missionLeftRightDescriptionShort => '按提示选择左或右。';

  @override
  String missionLeftRightDescription(int targetStreak) {
    return '连续答对$targetStreak次。';
  }

  @override
  String get missionLeftRightPromptLeft => '点击左边';

  @override
  String get missionLeftRightPromptRight => '点击右边';

  @override
  String get left => '左';

  @override
  String get right => '右';

  @override
  String get missionHintInactivity => '停止2分钟会重置。';

  @override
  String fortuneCatchScore(int score) {
    return '得分：$score';
  }

  @override
  String get fortuneCatchGoal => '目标：100';

  @override
  String fortuneCatchGoalDetail(int count, int min) {
    return '（捕捉：$count/$min）';
  }

  @override
  String fortuneCatchCombo(int combo) {
    return '$combo 连击！';
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
  String get shakeCount => '摇动次数';

  @override
  String shakeTimes(int count) {
    return '$count次';
  }

  @override
  String missionNumber(int number) {
    return '任务 $number';
  }

  @override
  String get soundBirds => '鸟鸣声';

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
  String get alarmSnooze => '闹钟延后';

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
  String get fortuneNewYearButton => '查看 2026 年新年运势';

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
  String get missionLearnWords => '背5个单词';

  @override
  String get missionVentilation => '通风';

  @override
  String get missionCleaning => '打扫房间';

  @override
  String get missionGratitudeDiary => '感恩日记';

  @override
  String get faqQuestion1 => '闹钟没有响。';

  @override
  String get faqAnswer1 =>
      '由于Android系统的电池优化功能，闹钟可能会延迟或被阻止。请在 设置 > 闹钟优化 菜单中将所有权限设置为\'允许\'。';

  @override
  String get faqQuestion2 => '我想更改任务。';

  @override
  String get faqAnswer2 => '点击闹钟列表中您想要编辑的闹钟，然后在任务选择菜单中将其更改为您想要的任务（数学、拍照、摇晃等）。';

  @override
  String get faqQuestion3 => '如何设置深色模式？';

  @override
  String get faqAnswer3 => '您可以通过 设置 > 常规 > 深色模式 开关更改屏幕主题。';

  @override
  String get faqQuestion4 => '如何收集幸运饼干？';

  @override
  String get faqAnswer4 => '每天早上关闭闹钟或完成任务时都可以获得幸运饼干。用收集的饼干查看您的每日运势！';

  @override
  String get faqQuestion5 => '如果删除应用，我的数据会消失吗？';

  @override
  String get faqAnswer5 => '是的，幸运闹钟将数据存储在设备内部，因此删除应用将删除您所有的闹钟设置和任务记录。请小心。';

  @override
  String get noticeLabel => '公告';

  @override
  String get notice1Title => '幸运闹钟正式上线';

  @override
  String get notice1Content =>
      '您好。幸运闹钟已正式上线。\n\n每天早上用闹钟查看您的每日运势，开启快乐的一天！\n我们将继续提供更多样化的功能和改进的服务。\n\n谢谢。';

  @override
  String get notice2Title => '版本 1.0.0 更新新闻';

  @override
  String get notice2Content =>
      '以下是版本 1.0.0 更新的内容。\n\n1. 营养品任务界面改进\n2. 精确闹钟的系统设置集成\n3. 深色模式支持\n4. 错误修复和稳定性改进\n\n立即体验最新版本！';

  @override
  String get notice3Title => '服务条款修订通知';

  @override
  String get notice3Content =>
      '服务条款已修订。\n\n主要修订：\n- 加强隐私政策\n- 指定服务使用范围\n\n详情可在 设置 > 条款 页面查看。';

  @override
  String get supportContentTitle => '咨询内容';

  @override
  String get supportHint => '请输入内容。';

  @override
  String get supportRecipient => '收件人 (客户支持)';

  @override
  String get emailCopied => '电子邮件地址已复制。';

  @override
  String get copyTooltip => '复制';

  @override
  String get supportWorkingDays => '我们将尝试在工作日24小时内回复。';

  @override
  String get supportEmptyError => '请输入内容。';

  @override
  String get supportSubjectPrefix => '咨询标题';

  @override
  String get supportContentPrefix => '咨询内容';

  @override
  String get supportCopySuccessTitle => '咨询已复制';

  @override
  String supportCopySuccessMessage(String email) {
    return '咨询内容已复制到剪贴板。\n您想发送邮件给 $email 吗？';
  }

  @override
  String get copyEmailAction => '复制电子邮件地址';

  @override
  String get copyEmailSuccessMessage => '电子邮件地址已复制。请将其粘贴到您的邮件应用中。';

  @override
  String get supportSubmitButton => '复制咨询并发送';

  @override
  String get shakePhone => '请摇晃手机！';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get fortuneCheckButton => '查看运势';

  @override
  String get fortuneSelectCards => '选择3张牌';

  @override
  String get fortuneDragCards => '拖动并选择3张牌';

  @override
  String get fortuneDetailTitle => '详细解读';

  @override
  String get labelFineDust => 'PM10';

  @override
  String get labelUltraFineDust => 'PM2.5';

  @override
  String get weatherToday => '今日天气';

  @override
  String get weatherUpdateMessage => '正在更新当前位置的天气信息。';

  @override
  String get weatherDisclaimer => '观测数据可能因当地条件或信号接收情况而有所不同。';

  @override
  String get weatherSource => '数据来源：气象厅、韩国环境公团';

  @override
  String get locationPermissionTitle => '允许位置权限';

  @override
  String get locationPermissionDesc => '显示天气信息所需。';
}
