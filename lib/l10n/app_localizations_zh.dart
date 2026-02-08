// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Fortune Alarm';

  @override
  String get morningGreeting => '早上好！开启幸运的一天。';

  @override
  String get missionWakeUp => '起床任务';

  @override
  String get missionSupplement => '服用营养品';

  @override
  String get missionWater => '喝2升以上水';

  @override
  String get fortuneCookie => '幸运饼干';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get languageKorean => '韩语';

  @override
  String get languageEnglish => '英语';

  @override
  String get languageJapanese => '日语';

  @override
  String get languageChinese => '中文';

  @override
  String get languageRussian => '俄语';

  @override
  String get languageHindi => '印地语';

  @override
  String get languageSpanish => '西班牙语';

  @override
  String get languageFrench => '法语';

  @override
  String get languageGerman => '德语';

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
  String get allMissionsCompleted => '今日5项任务全部完成！';

  @override
  String get rewardReceived => '获得1个幸运饼干奖励！ 🥠';

  @override
  String get confirm => '确认';

  @override
  String get missionSuccess => '任务成功！';

  @override
  String get cheeringMessage1 => '祝您今天度过愉快的一天！';

  @override
  String get cheeringMessage2 => '今天也为您加油！';

  @override
  String get cheeringMessage3 => '今天会是美好的一天。';

  @override
  String get todaysCheering => '今日寄语';

  @override
  String get notificationWakeUpBody => '该起床了！';

  @override
  String get notificationMissionBody => '请执行任务并关闭闹钟！';

  @override
  String get notificationSafetyBody => '闹钟已被强制关闭！请完成任务。';

  @override
  String get notificationRingingBody => '闹钟正在响铃！';

  @override
  String get snoozePrefix => '[稍后提醒]';

  @override
  String get exactAlarmPermissionRequired => '为了确保闹钟准时响铃，请开启“精确闹钟”权限。';

  @override
  String get overlayPermissionRequired => '为了显示全屏通知，需要“在其他应用上层显示”权限。';

  @override
  String get deleteAllAlarms => '删除所有闹钟';

  @override
  String get noAlarms => '没有已注册的闹钟。';

  @override
  String get lessThanAMinuteRemaining => '不到1分钟后响铃';

  @override
  String hoursMinutesRemaining(String hours, String minutes) {
    return '$hours小时$minutes分钟后响铃';
  }

  @override
  String minutesRemaining(String minutes) {
    return '$minutes分钟后响铃';
  }

  @override
  String get am => '上午';

  @override
  String get pm => '下午';

  @override
  String get dailyFortuneCookieReward => '今日幸运饼干奖励';

  @override
  String get missionRewardInfo => '完成5个任务得1个，10个得2个！';

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
  String get noCompletedMissionsHint => '暂无已完成任务。去完成今日目标吧。';

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
  String get todaysAdvice => '今日建议';

  @override
  String get viewSpecificDateFortune => '查看指定日期运势';

  @override
  String get luckyNumberRecommendation => '幸运数字推荐';

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
  String get traditionalFortune => '传统推算（土亭秘诀）';

  @override
  String get traditionalSaju => '传统四柱八字';

  @override
  String get faceReading => 'AI面相分析';

  @override
  String get missionFaceReading => '面相任务';

  @override
  String get faceFate => '面相与命运';

  @override
  String get compatibility => '契合度分析';

  @override
  String get relationshipHarmony => '缘分和谐度';

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
  String get ohaengWoodExplanation => '您的木气较强，充满成长动力和意志，待人友善且具有进取心。';

  @override
  String get ohaengFireExplanation => '您的火气较强，热情且讲究礼仪，性格活泼，喜欢华丽的事物。';

  @override
  String get ohaengEarthExplanation => '您的土气较强，值得信赖且包容力强，性格稳重，持之以恒。';

  @override
  String get ohaengMetalExplanation => '您的金气较强，果断且讲义气，性格冷静，非常重视原则。';

  @override
  String get ohaengWaterExplanation => '您的水气较强，富有智慧且灵活，聪明伶俐，适应能力极强。';

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
  String get jijiAnimalRat => '鼠';

  @override
  String get jijiAnimalOx => '牛';

  @override
  String get jijiAnimalTiger => '虎';

  @override
  String get jijiAnimalRabbit => '兔';

  @override
  String get jijiAnimalDragon => '龙';

  @override
  String get jijiAnimalSnake => '蛇';

  @override
  String get jijiAnimalHorse => '马';

  @override
  String get jijiAnimalSheep => '羊';

  @override
  String get jijiAnimalMonkey => '猴';

  @override
  String get jijiAnimalRooster => '鸡';

  @override
  String get jijiAnimalDog => '狗';

  @override
  String get jijiAnimalPig => '猪';

  @override
  String get assetDefaultBackground => '默认背景';

  @override
  String get assetFortuneyFriends => '福妮伙伴们';

  @override
  String get assetMongchuny => '梦春妮';

  @override
  String get assetPanchuny => '盼春妮';

  @override
  String get assetTochuny => '土春妮';

  @override
  String get assetHochuny => '虎春妮';

  @override
  String get assetBear => '小熊';

  @override
  String get assetMoon => '月亮';

  @override
  String get assetBridge => '桥';

  @override
  String get assetRoad => '路';

  @override
  String get assetSky => '天空';

  @override
  String get assetMinimalGray => '极简灰';

  @override
  String get assetDarkMode => '暗色模式';

  @override
  String get assetSoftBlue => '柔和蓝';

  @override
  String get assetWarmBeige => '暖米色';

  @override
  String assetCat(int number) {
    return '猫 $number';
  }

  @override
  String assetDog(int number) {
    return '狗 $number';
  }

  @override
  String assetSea(int number) {
    return '海 $number';
  }

  @override
  String get categoryCharacter => '角色';

  @override
  String get categoryAnimal => '动物';

  @override
  String get categoryIllustration => '插画';

  @override
  String get categoryLandscape => '风景';

  @override
  String get categorySimple => '简约';

  @override
  String get alarmBackground => '闹钟背景';

  @override
  String get random => '随机';

  @override
  String get gallery => '相册';

  @override
  String get selectSolidColor => '选择纯色';

  @override
  String get deleteColor => '删除颜色';

  @override
  String get deleteColorConfirm => '确定要从列表中删除该颜色吗？';

  @override
  String get deleteMission => '删除任务';

  @override
  String get deleteMissionConfirm => '您确定要删除这个任务吗？';

  @override
  String get randomBackgroundDesc => '每次闹钟响起都会换一张新背景！';

  @override
  String get backgroundDeleted => '背景已删除。';

  @override
  String get pickFromDevice => '从设备选择';

  @override
  String get alarmSaveError => '闹钟保存失败，发生未知错误。';

  @override
  String errorOccurred(String error) {
    return '发生错误: $error';
  }

  @override
  String get openSettings => '打开设置';

  @override
  String get videoLoadFailed => '视频加载失败\n点击重试';

  @override
  String get itsTimeToWakeUp => '该起床了！';

  @override
  String get dismissAlarm => '关闭闹钟';

  @override
  String get slideToDismiss => '滑动关闭';

  @override
  String snoozeInfo(String minutes, String count) {
    return '$minutes分钟 x $count次';
  }

  @override
  String snoozeInfoUnlimited(String minutes) {
    return '$minutes 分钟 · 不限次数';
  }

  @override
  String get noActiveAlarms => '没有正在响的闹钟';

  @override
  String get wealth => '财运';

  @override
  String get love => '感情';

  @override
  String get career => '事业';

  @override
  String get health => '健康';

  @override
  String get faceAnalysisBasic => '基础面相分析';

  @override
  String get insufficientDataOverallImpression => '整体信息不足';

  @override
  String get noseStabilityWealthAccuracy => '鼻部稳定度：财运与判断力';

  @override
  String get mouthClarityInterpersonalAccuracy => '口部清晰度：人际与表达';

  @override
  String get improveAnalysisQualityAdvice => '光线充足、正脸、无遮挡会让分析更准确。';

  @override
  String get basicAnalysisDescription => '快速看看你今天的整体气场与运势走向。';

  @override
  String get defaultDailyFortune => '今日默认运势';

  @override
  String dailyFortuneHeadline(String vibe, String topKey, String bottomKey) {
    return '$vibe今天是 $topKey 运势最突出的日子。相反，$bottomKey 方面似乎需要格外注意。';
  }

  @override
  String get faceShapeVLine => 'V 字脸';

  @override
  String get faceShapeSquare => '方形脸';

  @override
  String get faceShapeBalanced => '均衡型';

  @override
  String get faceShapeRound => '圆脸';

  @override
  String get faceShapeLong => '长脸';

  @override
  String get faceShapeOval => '椭圆脸';

  @override
  String get titleWealthOriented => '偏财运型';

  @override
  String get titleLoveStrong => '桃花旺盛型';

  @override
  String get titleCareerNotable => '事业运突出型';

  @override
  String get titleStableEnergy => '气场稳定型';

  @override
  String get faceAnalysisComplete => '面相分析完成！';

  @override
  String get chooseUnlockMethod => '想查看你脸上隐藏的运势\n请选择以下一种方式。';

  @override
  String get watchAdForFreeResult => '看广告免费解锁';

  @override
  String get useTwoCookies => '使用 2 个幸运饼干';

  @override
  String get checkResult => '查看结果';

  @override
  String get aiAnalyzingFace => 'AI 正在分析你的面相...';

  @override
  String get faceRecognitionComplete => '识别完成';

  @override
  String get extractingFeatures => '正在提取特征...';

  @override
  String get matchingFortuneData => '正在匹配运势数据...';

  @override
  String get adLoadFailedFreeUnlock => '广告加载失败，这次直接为你免费解锁。';

  @override
  String get insufficientCookies => '幸运饼干不足';

  @override
  String get insufficientCookiesDesc => '你的幸运饼干不够。\n可以看广告免费查看！';

  @override
  String get usingTwoCookiesToast => '已使用 2 个幸运饼干解锁结果。';

  @override
  String get todaysFaceAnalysis => '今日面相分析';

  @override
  String totalScoreWithPoints(int score) {
    return '总分 $score 分';
  }

  @override
  String get adLoadFailFreeAccess => '广告加载失败，这次直接为你免费解锁。';

  @override
  String get insufficientCookiesTitle => '幸运饼干不足';

  @override
  String get insufficientCookiesMessage => '你的幸运饼干不够。\n完成任务或看广告都能免费补充。';

  @override
  String get useCookiesSnackbar => '已使用 2 个幸运饼干解锁结果。';

  @override
  String get faceAnalysisComplete_v2 => '面相分析完成！';

  @override
  String get chooseMethodToViewResult => '想查看你脸上隐藏的运势\n请选择以下一种方式。';

  @override
  String get watchAdForFree => '看广告免费查看';

  @override
  String get useTwoCookies_v2 => '使用 2 个饼干';

  @override
  String get viewResult => '查看结果';

  @override
  String get aiAnalyzingFace_v2 => 'AI 正在分析你的面相...';

  @override
  String get faceRecognitionComplete_v2 => '识别完成';

  @override
  String get extractingFeatures_v2 => '正在提取特征...';

  @override
  String get matchingFortuneData_v2 => '正在匹配数据...';

  @override
  String get wealthLuck => '财运';

  @override
  String get loveLuck => '感情运';

  @override
  String get careerLuck => '事业运';

  @override
  String get healthLuck => '健康运';

  @override
  String get tojeongMonthlyGood_0 => '一位来自东方的贵人带来了好消息。你期待已久的计划终于要实现了。';

  @override
  String get tojeongMonthlyGood_1 => '财富如泉水般涌流。随着一切进展顺利，烦恼也随之消散。';

  @override
  String get tojeongMonthlyGood_2 => '努力开花结果，你将收到祝贺。预期会有晋升或重大的成果。';

  @override
  String get tojeongMonthlyGood_3 => '黑夜过后，晨曦微露。苦难结束，幸福降临。';

  @override
  String get tojeongMonthlyGood_4 => '意外的横财填满了你的口袋。小额投资将带来巨大利润。';

  @override
  String get tojeongMonthlyNeutral_0 => '平和的日常生活仍在继续。这段时间没有特别的大事发生。';

  @override
  String get tojeongMonthlyNeutral_1 => '知足常乐。享受这些小小的幸福吧。';

  @override
  String get tojeongMonthlyNeutral_2 => '在忙碌的生活中休息一下。请特别注意健康管理。';

  @override
  String get tojeongMonthlyNeutral_3 => '与其开始新事物，不如维持现状。';

  @override
  String get tojeongMonthlyNeutral_4 => '沟通是关键。注意言辞，避免误解。';

  @override
  String get tojeongMonthlyCaution_0 => '凡事都要谨慎。防患于未然总比事后后悔好。';

  @override
  String get tojeongMonthlyCaution_1 => '关注健康，避免过度劳累。';

  @override
  String get tojeongMonthlyCaution_2 => '远离流言蜚语，不要插手他人的私事。';

  @override
  String get tojeongMonthlyCaution_3 => '过度的贪婪会带来麻烦。量力而行。';

  @override
  String get tojeongMonthlyCaution_4 => '避免金钱交易，你可能会被信任的人所辜负。';

  @override
  String get tojeongMonthlySpecial_1_0 => '新年气象清明，计划推进会很顺利。';

  @override
  String get tojeongMonthlySpecial_1_1 => '年初会出现贵人。好好珍惜缘分与人脉。';

  @override
  String get tojeongMonthlySpecial_1_2 => '新的开始带来意想不到的机会，保持开放心态。';

  @override
  String get tojeongMonthlySpecial_1_3 => '专注与毅力会带来突破性的进展。';

  @override
  String get tojeongMonthlySpecial_1_4 => '过往的经验与智慧，会指引你应对新的挑战。';

  @override
  String get tojeongMonthlySpecial_2_0 => '时机未到，先蓄力等待机会。';

  @override
  String get tojeongMonthlySpecial_2_1 => '旧问题可能再度出现，正面处理会更轻松。';

  @override
  String get tojeongMonthlySpecial_2_2 => '本月以耐心为王，观察与学习会有收获。';

  @override
  String get tojeongMonthlySpecial_2_3 => '避免仓促决定，更好的时机很快到来。';

  @override
  String get tojeongMonthlySpecial_2_4 => '今天的小步前进，会成为未来的大收获。';

  @override
  String get tojeongMonthlySpecial_3_0 => '万物复苏，别犹豫，勇敢迎接挑战。';

  @override
  String get tojeongMonthlySpecial_3_1 => '新的缘分可能开始，积极心态会带来好结果。';

  @override
  String get tojeongMonthlySpecial_3_2 => '意想不到的领域正在成长，顺势而为。';

  @override
  String get tojeongMonthlySpecial_3_3 => '你的能量会感染他人，用善意与勇气带头。';

  @override
  String get tojeongMonthlySpecial_3_4 => '创意灵感涌现，把想法大胆说出来。';

  @override
  String get tojeongMonthlySpecial_4_0 => '财运随暖意上升，努力会转化为实际回报。';

  @override
  String get tojeongMonthlySpecial_4_1 => '合约与考试运佳，细致复盘会更稳。';

  @override
  String get tojeongMonthlySpecial_4_2 => '事业稳定向上，保持现在的节奏就很好。';

  @override
  String get tojeongMonthlySpecial_4_3 => '现在做财务规划，今年后续会收获更大。';

  @override
  String get tojeongMonthlySpecial_4_4 => '有望出现互利合作，携手更容易成功。';

  @override
  String get tojeongMonthlySpecial_5_0 => '家中和气带来稳定与喜悦。';

  @override
  String get tojeongMonthlySpecial_5_1 => '对他人的善意，会以祝福的形式回到你身边。';

  @override
  String get tojeongMonthlySpecial_5_2 => '平静与安宁围绕你，珍惜这段舒适时光。';

  @override
  String get tojeongMonthlySpecial_5_3 => '真诚沟通能加深家人之间的连结。';

  @override
  String get tojeongMonthlySpecial_5_4 => '你的内在光芒很强，会自然地鼓舞周围的人。';

  @override
  String get tojeongMonthlySpecial_6_0 => '努力被看见，有机会迎来晋升或被表彰。';

  @override
  String get tojeongMonthlySpecial_6_1 => '行动力很强，适合考虑扩展或职业转向。';

  @override
  String get tojeongMonthlySpecial_6_2 => '领导力被需要，带着自信做主导。';

  @override
  String get tojeongMonthlySpecial_6_3 => '重要目标近在咫尺，盯紧终点就能拿下。';

  @override
  String get tojeongMonthlySpecial_6_4 => '新的职业视野正在打开，勇敢去探索。';

  @override
  String get tojeongMonthlySpecial_7_0 => '热情带来成绩，大胆行动更容易达成目标。';

  @override
  String get tojeongMonthlySpecial_7_1 => '出行中易遇贵人，也可能发现新机会。';

  @override
  String get tojeongMonthlySpecial_7_2 => '适合换个环境，新的风景会让心情焕然一新。';

  @override
  String get tojeongMonthlySpecial_7_3 => '你的干劲会吸引好结果，把目标定大一点。';

  @override
  String get tojeongMonthlySpecial_7_4 => '能量很足，持续向前推进就对了。';

  @override
  String get tojeongMonthlySpecial_8_0 => '耐心会得到回报，运势会慢慢打开。';

  @override
  String get tojeongMonthlySpecial_8_1 => '旧问题会出现解法，靠你的智慧就能化解。';

  @override
  String get tojeongMonthlySpecial_8_2 => '稳住节奏、坚持到底，困难终会过去。';

  @override
  String get tojeongMonthlySpecial_8_3 => '复盘能带来清晰感，找到真正适合自己的方向。';

  @override
  String get tojeongMonthlySpecial_8_4 => '远方传来好消息，准备迎接喜悦。';

  @override
  String get tojeongMonthlySpecial_9_0 => '像丰收季一样，财运与感情都更充盈。';

  @override
  String get tojeongMonthlySpecial_9_1 => '辛苦会得到超出预期的回报。';

  @override
  String get tojeongMonthlySpecial_9_2 => '懂得感恩会吸引更多丰盛，也别忘了分享喜悦。';

  @override
  String get tojeongMonthlySpecial_9_3 => '情绪满足感很高，好好享受爱与被爱。';

  @override
  String get tojeongMonthlySpecial_9_4 => '成果甜美可见，值得为自己庆祝。';

  @override
  String get tojeongMonthlySpecial_10_0 => '名望上升，更容易被人记住与认可。';

  @override
  String get tojeongMonthlySpecial_10_1 => '学业/思考运佳，适合专注学习与研究。';

  @override
  String get tojeongMonthlySpecial_10_2 => '专业能力被看见，勇敢表达你的观点。';

  @override
  String get tojeongMonthlySpecial_10_3 => '本月学业或事业上的成功概率很高。';

  @override
  String get tojeongMonthlySpecial_10_4 => '影响力正在变强，把它用在更有意义的地方。';

  @override
  String get tojeongMonthlySpecial_11_0 => '适合沉淀与思考，为未来做准备。';

  @override
  String get tojeongMonthlySpecial_11_1 => '财务趋于稳定，但避免高风险投资。';

  @override
  String get tojeongMonthlySpecial_11_2 => '通过安静与冥想更容易找到内心的平和。';

  @override
  String get tojeongMonthlySpecial_11_3 => '现在的战略布局，会让明年走得更顺。';

  @override
  String get tojeongMonthlySpecial_11_4 => '相信直觉，它会带你避开风险、走向更稳的选择。';

  @override
  String get tojeongMonthlySpecial_12_0 => '年末有意外好运，值得期待好消息。';

  @override
  String get tojeongMonthlySpecial_12_1 => '长期努力迎来收尾成果，漂亮地画上句号。';

  @override
  String get tojeongMonthlySpecial_12_2 => '这一年以高光收场，为自己的旅程感到骄傲。';

  @override
  String get tojeongMonthlySpecial_12_3 => '旧门关闭，新门打开，带着期待迎接未来。';

  @override
  String get tojeongMonthlySpecial_12_4 => '分享温暖会带来回馈，把节日的喜悦传出去。';

  @override
  String get todaysFaceFortune => '今日面相运势';

  @override
  String get detailedAnalysis => '详细分析';

  @override
  String get eyeInsight => '👁️ 眼（洞察）';

  @override
  String get noseWealth => '👃 鼻（财运）';

  @override
  String get mouthLateLuck => '👄 口（晚运）';

  @override
  String get overallAnalysisTitle => '整体分析';

  @override
  String get shareResultTitle => '今日面相结果';

  @override
  String shareResultDesc(String title) {
    return 'AI 面相分析结果。\n$title';
  }

  @override
  String get shareResultTotalScore => '总分';

  @override
  String get shareResultWealth => '财运';

  @override
  String get shareResultLove => '感情运';

  @override
  String get shareResultCareer => '事业运';

  @override
  String get shareResultHealth => '健康运';

  @override
  String get shareResultText => '分享结果';

  @override
  String get wakeUpComplete => '起床成功！';

  @override
  String get collapseOptions => '收起选项';

  @override
  String get expandOptions => '更多选项';

  @override
  String get snoozeAlarm => '稍后再响';

  @override
  String get interval => '间隔';

  @override
  String get maxSnoozeCount => '最大贪睡次数';

  @override
  String get unlimited => '不限';

  @override
  String get permissionRequired => '需要权限';

  @override
  String get exactAlarmFailMessage => '闹钟注册失败：未开启“精确闹钟”权限。';

  @override
  String get batteryOptimFailMessage => '闹钟注册失败：未允许忽略电池优化。';

  @override
  String get overlayFailMessage => '闹钟注册失败：未开启“在其他应用上层显示”。';

  @override
  String get loadingDelay => '加载延迟';

  @override
  String get loading => '加载中...';

  @override
  String get previewFail => '预览失败';

  @override
  String get bgDefault => '默认背景';

  @override
  String get bgFortuneFriends => '福妮伙伴们';

  @override
  String get bgMongChuni => '梦春妮';

  @override
  String get bgPanChuni => '盼春妮';

  @override
  String get bgToChuni => '土春妮';

  @override
  String get bgHoChuni => '虎春妮';

  @override
  String get bgBear => '小熊';

  @override
  String get bgMoon => '月亮';

  @override
  String get bgSea => '海';

  @override
  String get bgBridge => '桥';

  @override
  String get bgRoad => '路';

  @override
  String get bgSky => '天空';

  @override
  String get bgMinimalGray => '极简灰';

  @override
  String get bgDarkMode => '暗色模式';

  @override
  String get bgSoftBlue => '柔和蓝';

  @override
  String get bgWarmBeige => '暖米色';

  @override
  String get dateFormatMdyE => 'M月d日（E）';

  @override
  String get deleteAlarm => '删除闹钟';

  @override
  String get confirmDelete => '确认删除';

  @override
  String get yes => '是';

  @override
  String get no => '不';

  @override
  String get wealthLuckWithIcon => '💰 财运';

  @override
  String get loveLuckWithIcon => '❤️ 感情运';

  @override
  String get careerLuckWithIcon => '💼 事业运';

  @override
  String get healthLuckWithIcon => '💪 健康运';

  @override
  String get mouthFortune => '👄 口（晚运）';

  @override
  String get comprehensiveAnalysis => '综合分析';

  @override
  String get todaysFaceResult => '今日面相分析结果';

  @override
  String faceAnalysisShareDesc(String title) {
    return 'AI 面相分析结果。\n$title';
  }

  @override
  String get shareResult => '分享结果';

  @override
  String get faceVibeSmile0 => '你灿烂的笑容为周围的人带来了正能量。';

  @override
  String get faceVibeSmile1 => '那灿烂的笑容显示出你今天充满了活力。';

  @override
  String get faceVibeSmile2 => '你温柔的神情带有一种迷人的魅力，能吸引贵人相助。';

  @override
  String get faceVibeSmile3 => '自信的笑容将是你今天克服任何困难的最大武器。';

  @override
  String get faceVibeSmile4 => '你清爽的笑容正在扫除负能量，为好运腾出空间。';

  @override
  String get faceVibeEye0 => '你闪烁的双眼展现出主宰今天局势的强烈意志。';

  @override
  String get faceVibeEye1 => '那敏锐而专注的眼神预示着卓越的判断力和直觉。';

  @override
  String get faceVibeEye2 => '你清澈深邃的目光反映出一颗真诚的心，正等待着好消息。';

  @override
  String get faceVibeEye3 => '你威严的神情和坚定的目光今天将赢得他人的尊重。';

  @override
  String get faceVibeEye4 => '你眼中的激情激发了周围人对你的信任和信心。';

  @override
  String get faceVibeNeutral0 => '你平和稳定的表情带来了一种内在的平静。';

  @override
  String get faceVibeNeutral1 => '冷静的面色反映出你审慎而睿智的能量。';

  @override
  String get faceVibeNeutral2 => '你均衡的五官预示着今天将平稳顺利。';

  @override
  String get faceVibeNeutral3 => '你严肃的态度非常适合今天做出重要的决定。';

  @override
  String get faceVibeNeutral4 => '你沉着的表情让别人感到安心，有利于顺畅的合作。';

  @override
  String get dailyFortuneWealth0 => '五官非常专注，稍微整理一下将有助于财富增长。';

  @override
  String get dailyFortuneWealth1 => '你今天的财运能量很高。花点时间复核账目，会有额外收益。';

  @override
  String get dailyFortuneWealth2 => '均衡的五官预示着关注细节将带来意想不到的收获。';

  @override
  String get dailyFortuneWealth3 => '你的面色显示出极佳的财运。在不经意的地方可能会有小财进账。';

  @override
  String get dailyFortuneWealth4 => '你敏锐的专注力有利于明智的财务决策。今天是投资或消费的好日子。';

  @override
  String get dailyFortuneWealth5 => '你有很强的吸金能量。试着整理一下钱包或查看账目。';

  @override
  String get dailyFortuneWealth6 => '五官显示出财富的稳步积累。真诚的努力正开始获得回报。';

  @override
  String get dailyFortuneWealth7 => '稳定的财运就在你身边。持之以恒的储蓄比大手大脚的消费更适合你。';

  @override
  String get dailyFortuneWealth8 => '敏锐的观察力将帮助你发现商机。请保持耳聪目明。';

  @override
  String get dailyFortuneWealth9 => '富足的能量围绕着你。今天的慷慨将会带给你更丰厚的回报。';

  @override
  String get dailyFortuneLove0 => '温柔的神情预示着主动沟通将缓解任何紧张的人际关系。';

  @override
  String get dailyFortuneLove1 => '清澈诚实的目光能减少误解。真诚是你今天最好的策略。';

  @override
  String get dailyFortuneLove2 => '明亮的色泽能吸引贵人。小小的善举将带来深厚的缘分。';

  @override
  String get dailyFortuneLove3 => '你天生的魅力在今天尤为突出。期待从新相遇中获得正能量。';

  @override
  String get dailyFortuneLove4 => '清晰的感情能量有助于解决旧冲突，带来和谐。';

  @override
  String get dailyFortuneLove5 => '亲切的面容能打开他人的心扉。今天，倾听是你最有力的工具。';

  @override
  String get dailyFortuneLove6 => '你有一张天生能吸引帮助的脸。不要独自烦恼，试着寻求建议。';

  @override
  String get dailyFortuneLove7 => '真诚的目光能建立深厚的信任。信守承诺将带来更牢固的关系。';

  @override
  String get dailyFortuneLove8 => '和谐的能量充满你的家庭和工作场所。今天是充满欢笑和快乐的一天。';

  @override
  String get dailyFortuneLove9 => '缘分的丝线正美妙地解开。向你珍视的人表达感激之情吧。';

  @override
  String get dailyFortuneCareer0 => '敏锐的专注力将使你在今天把重点转化为巅峰表现。';

  @override
  String get dailyFortuneCareer1 => '敏锐的观察力脱颖而出。保持决策简单，执行稳健。';

  @override
  String get dailyFortuneCareer2 => '双眼中清澈的能量让你有能力坚持到底完成每一项任务。';

  @override
  String get dailyFortuneCareer3 => '天生的领导力正在显现。你的意见今天将具有举足轻重的分量。';

  @override
  String get dailyFortuneCareer4 => '你的判断力处于巅峰。即使是复杂的问题今天也能找到明确的解决方案。';

  @override
  String get dailyFortuneCareer5 => '你高效的工作方式正受到关注。你在晋升或成就方面处于有利地位。';

  @override
  String get dailyFortuneCareer6 => '你拥有开始新项目的完美能量。充满自信地向前迈进吧。';

  @override
  String get dailyFortuneCareer7 => '工作效率正在提升。今天是处理那些推迟已久的任务的好日子。';

  @override
  String get dailyFortuneCareer8 => '创造性的想法层出不穷。养成记录下来的习惯，会带来好运。';

  @override
  String get dailyFortuneCareer9 => '你的毅力和耐心在今天将获得回报。坚持到最后会取得伟大的成果。';

  @override
  String get dailyFortuneHealth0 => '稳定的面色预示着只要保持规律的节奏，就能快速恢复活力。';

  @override
  String get dailyFortuneHealth1 => '面部活力很强。保持舒适的节奏，不要过度劳累。';

  @override
  String get dailyFortuneHealth2 => '双眼和皮肤中清澈的能量意味着短时间的休息将极大地提升你的心情和专注力。';

  @override
  String get dailyFortuneHealth3 => '身体节奏处于完美和谐的状态。适度的运动将使你的能量更加清爽。';

  @override
  String get dailyFortuneHealth4 => '你充满了活力。你可以精力充沛地度过这一天而不会感到疲倦。';

  @override
  String get dailyFortuneHealth5 => '身心稳定是重点。冥想或深呼吸将提升你的运势。';

  @override
  String get dailyFortuneHealth6 => '你今天的韧性很高。你能从任何轻微的疲劳中迅速恢复。';

  @override
  String get dailyFortuneHealth7 => '健康的色泽非常明显。期待别人今天赞美你充满活力的容貌吧。';

  @override
  String get dailyFortuneHealth8 => '均衡的饮食和充足的休息将巩固你的运势基础。照顾好自己的身体。';

  @override
  String get dailyFortuneHealth9 => '清新的空气和保持水分是你今天最好的良药。享受你的活力吧。';

  @override
  String get dailyFortuneTipWealth0 => '今天请再次确认你的支出和订阅服务。';

  @override
  String get dailyFortuneTipWealth1 => '避免冲动消费；坚持只买真正需要的东西就是巨大的胜利。';

  @override
  String get dailyFortuneTipWealth2 => '记录财务谈话，以防未来产生误解。';

  @override
  String get dailyFortuneTipWealth3 => '留意预算中的微小“漏洞”。';

  @override
  String get dailyFortuneTipWealth4 => '今天消费欲望很高。在购买任何东西前请等待10分钟。';

  @override
  String get dailyFortuneTipWealth5 => '今天处理大额交易请保持谨慎。必要时寻求专家建议。';

  @override
  String get dailyFortuneTipWealth6 => '今天请结清任何未清偿的债务或欠款。';

  @override
  String get dailyFortuneTipWealth7 => '看好你的钱包。今天你周围有一种轻微的损耗能量。';

  @override
  String get dailyFortuneTipWealth8 => '优先考虑实际收益，而不是为了面子挥霍。';

  @override
  String get dailyFortuneTipWealth9 => '公平竞争是保持好运的方式。避免投机取巧。';

  @override
  String get dailyFortuneTipLove0 => '如果你感到烦躁，请在回应他人前深呼吸。';

  @override
  String get dailyFortuneTipLove1 => '如果产生误解，简短的确认比长篇大论的解释更好。';

  @override
  String get dailyFortuneTipLove2 => '今天准时到达将建立显著的信任。';

  @override
  String get dailyFortuneTipLove3 => '直奔主题，避免不必要的情感消耗。';

  @override
  String get dailyFortuneTipLove4 => '即使是对最亲近的人，也要注意礼貌。';

  @override
  String get dailyFortuneTipLove5 => '试着在批评前先给予赞美。它将打开原本关闭的大门。';

  @override
  String get dailyFortuneTipLove6 => '三思而后言。为了安全起见，请以书面形式确认重要细节。';

  @override
  String get dailyFortuneTipLove7 => '远离他人的闲事是避免谣言的最好方法。';

  @override
  String get dailyFortuneTipLove8 => '保持理智。冷静的交谈是今天维持健康关系的关键。';

  @override
  String get dailyFortuneTipLove9 => '仔细核对你的行程。可靠是你今天最宝贵的资产。';

  @override
  String get dailyFortuneTipCareer0 => '专注于彻底完成一项任务，而不是开始好几项新任务。';

  @override
  String get dailyFortuneTipCareer1 => '进步胜过完美。今天目标是“完成”而非“完美”。';

  @override
  String get dailyFortuneTipCareer2 => '完成那件你一直拖延的事情，让头脑清爽起来。';

  @override
  String get dailyFortuneTipCareer3 => '专注于自己的职责，以保持较低的压力水平。';

  @override
  String get dailyFortuneTipCareer4 => '小错误可能会像滚雪球一样越滚越大。今天不要跳过最后的检查。';

  @override
  String get dailyFortuneTipCareer5 => '尊重不同的意见，避免与同事或上司产生摩擦。';

  @override
  String get dailyFortuneTipCareer6 => '注意力可能会波动。试着以“工作50分钟，休息10分钟”的节奏进行。';

  @override
  String get dailyFortuneTipCareer7 => '不要承担超过你能力范围的工作。了解自己的极限是一种优势。';

  @override
  String get dailyFortuneTipCareer8 => '今天请将职业生活和私人生活分开。';

  @override
  String get dailyFortuneTipCareer9 => '在点击“发送”前，仔细检查收件人和附件。';

  @override
  String get dailyFortuneTipHealth0 => '优先保证睡眠，今天避免过量饮食或摄入过多咖啡因。';

  @override
  String get dailyFortuneTipHealth1 => '伸展颈部和肩膀将显著减轻你的疲劳感。';

  @override
  String get dailyFortuneTipHealth2 => '短距离散步将清空思绪并刷新能量水平。';

  @override
  String get dailyFortuneTipHealth3 => '一杯水和简单的拉伸将为你的一天定下积极的基调。';

  @override
  String get dailyFortuneTipHealth4 => '让眼睛休息一下。今天试着限制屏幕使用时间。';

  @override
  String get dailyFortuneTipHealth5 => '在进行任何剧烈运动前，请做好充分的热身。';

  @override
  String get dailyFortuneTipHealth6 => '带上一件轻便的外衣。你今天可能对温度变化更敏感。';

  @override
  String get dailyFortuneTipHealth7 => '为了肠胃和皮肤，请坚持清淡健康的饮食。';

  @override
  String get dailyFortuneTipHealth8 => '睡眠是最好的良药。今晚试着早点休息。';

  @override
  String get dailyFortuneTipHealth9 => '听听你喜欢的音乐或闻闻清新的香气，让压力远离。';

  @override
  String get eyeAnalysisTypeSharp => '你锐利清澈的双眼反映出快速的判断力和坚强的意志。';

  @override
  String get eyeAnalysisTypeDeep => '你沉稳深邃的目光预示着睿智而深思熟虑的性格。';

  @override
  String get eyeAnalysisTypeBalanced => '你的双眼展现出情感与理智的完美平衡，给人以稳定感。';

  @override
  String get eyeExpressionBright => '你明亮的双眼和温暖的笑容营造出一种亲切的气场，自然地吸引着人们。';

  @override
  String get eyeExpressionGentle => '你沉稳目光中隐藏的温柔笑意，反映出一种柔和而坚定的魅力。';

  @override
  String get eyeExpressionStrong => '你专注而强烈的目光象征着卓越的领导力和达成目标的动力。';

  @override
  String get eyeExpressionSteady => '你冷静严肃的神态赢得了他人的信任和尊重。';

  @override
  String get eyePostureTilt => '稍微倾斜头部可能暗示着不确定性；保持昂首挺胸并直视前方将带来更好的专注和好运。';

  @override
  String get eyePostureStraight => '直视前方展现出自信，并为你通往成功的道路扫清障碍。';

  @override
  String get noseInsufficient => '由于图像清晰度受限，鼻部分析结果有限；提供一般性解读。';

  @override
  String get noseWealthRich => '挺拔且轮廓分明的鼻子预示着积累和守护财富的巨大潜力。';

  @override
  String get noseWealthPlanner => '敏锐且比例适中的鼻子表明你拥有管理和增长财务的实际头脑。';

  @override
  String get noseWealthBalanced => '均衡的五官预示着财运平稳流动。';

  @override
  String get mouthExpressionBlessing => '上扬的嘴角预示着积极的天性，能自然地吸引好运和他人的青睐。';

  @override
  String get mouthExpressionReliable => '紧闭且坚定的双唇反映了可靠性，以及行动胜过空谈的偏好。';

  @override
  String get mouthExpressionLucky => '灿烂开朗的笑容散发着正能量，为你的社交关系带来好运。';

  @override
  String get supplementAlarmTitle => '该吃营养补充剂了！ 💊';

  @override
  String get alarmVolume => '闹钟音量';

  @override
  String get alarmTimeList => '闹钟时间列表';

  @override
  String get noAlarmTimesAdded => '未添加闹钟时间';

  @override
  String get alarmTimeDeleted => '闹钟时间已删除';

  @override
  String get addAlarmTime => '添加闹钟时间';

  @override
  String get editAlarmTime => '编辑闹钟时间';

  @override
  String get defaultRingtone => '默认铃声';

  @override
  String get takeSupplementsNow => '请服用营养剂并记录！';

  @override
  String get nextTime => '下次再吃';

  @override
  String get take => '服用';

  @override
  String get notifications => '通知';

  @override
  String get notificationTime => '通知时间';

  @override
  String get start => '开始';

  @override
  String get end => '结束';

  @override
  String get notificationInterval => '通知间隔';

  @override
  String get waterDrankToday => '今天喝的水';

  @override
  String get goal => '目标';

  @override
  String get cup => '杯';

  @override
  String get waterIntakeRecord => '水分摄入记录';

  @override
  String get remainingAmount => '剩余量';

  @override
  String get ml => '毫升';

  @override
  String minutesFormat(String minutes) {
    return '$minutes 分钟';
  }

  @override
  String get drinkWater => '喝水';

  @override
  String get supplement => '营养剂';

  @override
  String get water => '水分';

  @override
  String get morning => '上午';

  @override
  String get afternoon => '下午';

  @override
  String get evening => '晚上';

  @override
  String get takeSupplement => '服用营养剂';

  @override
  String get goalAchievedTitle => '目标达成！';

  @override
  String get waterIntake => '水分摄入';

  @override
  String get remindTime => '提醒时间';

  @override
  String get alarmRingtone => '闹钟铃声';

  @override
  String get snoozeTime => '稍后提醒时间';

  @override
  String get snoozeDescription => '选择“下次再吃”时的默认时间';

  @override
  String get oneHour => '1 小时';

  @override
  String get mouthExpressionOpen => '坦率的神情预示着诚实，但在敏感场合请注意言辞。';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return '今日重点是 $topKey，需要留意的点是 $bottomKey。';
  }

  @override
  String get overallVibeWealthRich => '你的五官散发着财务活力，是抓住新机遇的绝佳日子。';

  @override
  String get overallVibeWealthSteady => '冷静而稳定的专注将帮助你明智地管理财务并建立持久的财富。';

  @override
  String get overallVibeLoveCharisma => '你灿烂的笑容今天会自然地吸引积极的人和有用的连接。';

  @override
  String get overallVibeLoveTrust => '你真诚而坚定的目光建立了深厚的信任，是建立深层联系的完美时刻。';

  @override
  String get overallVibeCareerSmart => '你敏锐的专注力增强了判断力，是处理复杂任务或重大决策的完美时机。';

  @override
  String get overallVibeCareerSteady => '你稳定的能量支持着坚持；专注于目标将带来伟大的成果。';

  @override
  String get overallVibeHealth => '你清澈的面色反映了平衡的内在节奏，是进行体力活动的绝佳日子。';

  @override
  String get overallActionPrudent => '你沉着的表情预示着智慧。今天，让你的行动胜过你的言语。';

  @override
  String get overallActionConfident => '自信坦率的神情会吸引积极的结果。清晰自信地表达你的想法吧。';

  @override
  String get adviceHealth0 => '健康的常规是好运的基石。今天避免过度承诺。';

  @override
  String get adviceHealth1 => '关注你身体的需求。现在的短暂休息会带来以后更好的结果。';

  @override
  String get adviceHealth2 => '保持水分充足并获得充足休息；简单是刷新好运的关键。';

  @override
  String get adviceWealth0 => '今天请注意你的支出。仔细检查所有开销和合同。';

  @override
  String get adviceWealth1 => '今天削减小额开支是建立显著财富的第一步。';

  @override
  String get adviceWealth2 => '等到明天再做财务决定可能会对你更有利。';

  @override
  String get adviceLove0 => '一句亲切的话语和温柔的表情可以提升你在人际关系中的运势。';

  @override
  String get adviceLove1 => '做一个好的倾听者是今天赢得他人青睐的秘诀。';

  @override
  String get adviceLove2 => '即使是对亲近的人也要保持礼貌，这将维护你的正能量。';

  @override
  String get adviceCareer0 => '今天专注于一个关键目标，而不是试图同时做所有事情。';

  @override
  String get adviceCareer1 => '不要操之过急。一步一个脚印是通往成功最快的路。';

  @override
  String get adviceCareer2 => '考虑他人的建议，但最终决定请信任你的直觉。';

  @override
  String get sajuFortune2024Gap =>
      '🌿 2024年 甲辰年 (木龙): \'开启新篇章与跃升的一年\'\n\n2024年对你来说是‘比肩’和‘偏财’能量进入的一年。就像茂密的森林中种下了新树，广阔的土地正在铺开。这将是确立自我主张并规划新事物的一年。\n\n💼 [事业与商务]\n这是一个信心爆棚、执行力变强的时期。通过与同事或合作伙伴协作，你将有机会在大型项目中取得成功。如果你一直考虑创业或换工作，今年可能是个好时机。但要注意避免固执，倾听他人的意见很有必要。\n\n💰 [财运]\n触碰大额财富的机会将会到来。预期的横财或投资回报值得期待。但开支也可能较多，因此需要彻底的资产管理。从长远角度投资更有利。\n\n❤️ [爱情与关系]\n这是一个扩大社交圈、结识新缘分的好时机。单身者很有可能遇到有吸引力的伴侣；有伴侣的人关系会更加深厚。但要注意竞争者的出现。\n\n⚠️ [注意事项]\n关注肝胆健康，管理压力。同时，避免因过度自信而做出武断的决定。';

  @override
  String get sajuFortune2024Eul =>
      '🌿 2024年 甲辰年 (木龙): \'与贵人共同成长的一年\'\n\n2024年对你来说是‘劫财’和‘正财’能量进入的一年。就像常春藤攀附大树仰望天空。这将是你通过他人帮助而非单打独斗取得更大成果的一年。\n\n💼 [事业与商务]\n协作和人际网络非常重要。你会遇到得力的助手，提高工作效率并获得认可。但在需要分享成果的情况下，请注意公平分配。这是在竞争中展现存在感的好时机。\n\n💰 [财运]\n稳定的收入是有保障的。真诚的努力会带来回报，是储蓄或房地产投资的有利时期。但要避免与同事或熟人发生金钱交易，并注意开支管理。\n\n❤️ [爱情与关系]\n社交聚会增多，人气提升。在恋爱关系中，可能会出现小误会，需要坦诚交流。新缘分往往会通过朋友或同事自然而然地到来。\n\n⚠️ [注意事项]\n预防神经系统疾病或偏头痛。同时，由于可能与周围人发生冲突，请保持灵活的态度。';

  @override
  String get sajuFortune2024Byeong =>
      '🔥 2024年 甲辰年 (木龙): \'激情与智慧闪耀的一年\'\n\n2024年对你来说是‘偏印’和‘食神’能量进入的一年。就像阳光照耀森林，赋予万物生机。创造性想法将层出不穷，这将是你充分展示才华的一年。\n\n💼 [事业与商务]\n你将在专业领域脱颖而出，取得原创性成果。对从事研究、艺术或技术工作的人尤为有利。但由于想法太多可能导致执行力下降，所以一旦有了计划，请努力立即付诸实践。\n\n💰 [财运]\n这是一个才华和创意转化为金钱的时期。副业或爱好可能会创造收入。但要仔细审查文件合同或投资，以防损失。\n\n❤️ [爱情与关系]\n表达能力提升，魅力四射。你将在关系中占据主导地位，赢得许多人的青睐。恋爱关系中会有许多愉快的约会和活动，使感情升温。\n\n⚠️ [注意事项]\n关注消化系统或心血管健康。此外，可能会因思虑过多而感到压抑，通过户外活动释放能量会很有帮助。';

  @override
  String get sajuFortune2024Jeong =>
      '🔥 2024年 甲辰年 (木龙): \'在稳定中强化内在基础的一年\'\n\n2024年对你来说是‘正印’和‘伤官’能量进入的一年。就像夜空中的一盏明灯照亮森林。这将是专注于自我提升（如学习或考取证书）并强化内在基础的好年份。\n\n💼 [事业与商务]\n在长辈或前辈的帮助下，工作环境得到改善，晋升或调动的机会随之而来。这是说服他人并获得共识的有利时期。但要注意言行，因为批判性的态度可能会引发流言蜚语。\n\n💰 [财运]\n文书方面的运势很好。房地产合同或通过获取证书提高收入值得期待。宜专注于稳定的资产管理，克制冲动消费。\n\n❤️ [爱情与关系]\n你礼貌而温暖的形象将赢得周围人的信任。恋爱关系中，双方更加体谅彼此，维持稳定的交往。也是准备结婚的好年份。\n\n⚠️ [注意事项]\n预防眼疾或神经衰弱。同时，保持谦逊的态度，因为炫耀才华可能会引起周围人的反感。';

  @override
  String get sajuFortune2024Mu =>
      '⛰️ 2024年 甲辰年 (木龙): \'责任与挑战的一年\'\n\n2024年对你来说是‘偏官’和‘比肩’能量进入的一年。就像一座雄伟的山与森林和谐共处，展现威严。责任会增加，但通过克服这些困难，你将更进一步地成长。\n\n💼 [事业与商务]\n你经常被赋予艰巨的任务或需要行使领导力。在激烈竞争的环境中，证明实力的机会将会到来。虽然辛苦，但成就感会很大，因此需要毅力坚持到底。\n\n💰 [财运]\n今年的支出可能会有所增加。专注于保本而非盲目投资是明智的，并且要小心与周围人的金钱往来可能导致损失。以长远眼光制定资产计划非常重要。\n\n❤️ [爱情与关系]\n你强烈的魅力将吸引异性的目光。但固执的态度可能会导致与伴侣争吵，需要努力体谅对方。与朋友的友谊也会更加深厚。\n\n⚠️ [注意事项]\n预防肠胃不适或肌肉疼痛等体力透支情况。需要充分的休息和拉伸，拥有能缓解精神压力的爱好会很好。';

  @override
  String get sajuFortune2024Gi =>
      '🌾 2024年 甲辰年 (木龙): \'开花结果与和谐的一年\'\n\n2024年对你来说是‘正官’和‘劫财’能量进入的一年。就像肥沃的土地上绿树成荫，硕果累累。这将是社会地位提升、赢得荣誉的愉快一年。\n\n💼 [事业与商务]\n你将在组织内获得认可并担任重要职务。这是就业或晋升运势极强的一年。如果你遵守规则并诚实工作，你可以取得超出预期的成果。但要注意与同事竞争带来的压力，保持平常心。\n\n💰 [财运]\n稳定的收入持续产生，财富稳步积累。根据表现获得的奖励或荣誉值得期待。但由于需要打点周围的人，开支可能会较多，需要适当调整。\n\n❤️ [爱情与关系]\n结婚运势强劲。单身者可以遇到可靠的伴侣并发展成严肃的关系。在社交中，通过顺畅的沟通，你将获得许多人的支持。\n\n⚠️ [注意事项]\n注意脾胰功能并保持规律的饮食习惯。同时，要小心因过度参与他人的事务而忽略了自己的利益。';

  @override
  String get sajuFortune2024Gyeong =>
      '⚔️ 2024年 甲辰年 (木龙): \'变革与创新的一年\'\n\n2024年对你来说是‘偏财’和‘偏印’能量进入的一年。就像一把利剑劈开森林，开辟出一条新路。这将是你打破现有框架、挑战新领域并面临巨大变革的一年。\n\n💼 [事业与商务]\n新的商业点子会涌现，你将展现果断的决策力。海外业务或变动运势强劲，不畏变革的态度是成功的关键。但由于武断的行为可能导致组织内冲突，需要协调能力。\n\n💰 [财运]\n财运波动较大的一年。你可能会获得巨额利润，但无理的投资也可能导致重大损失。必须在彻底的分析和计划下行动，最好避免投机性投资。\n\n❤️ [爱情与关系]\n会有很多结识新朋友的机会，你将参与活跃的社交活动。恋爱中好奇心增加。但需要认真的态度，因为感情可能来得快去得也快。\n\n⚠️ [注意事项]\n关注呼吸系统或大肠健康。同时，时刻保持冷静并注意安全，因为急性子可能会导致意外发生。';

  @override
  String get sajuFortune2024Sin =>
      '💎 2024年 甲辰年 (木龙): \'珠宝闪耀与荣誉的一年\'\n\n2024年对你来说是‘正财’和‘正印’能量进入的一年。就像森林中的一颗珠宝展现其价值。这将是你为努力获得应有回报并提升荣誉的一年。\n\n💼 [事业与商务]\n诚实和细致闪耀，赢得周围所有人的信任。你可能因专业性获得认可，成为重要项目的负责人或享受晋升的喜悦。这是一个万事如意、按计划进行的稳定时期。\n\n💰 [财运]\n财运非常稳定且良好。稳定的收入有保障，在储蓄或理财方面也会取得好成绩。你也可能从父母或长辈那里继承财产或获得经济帮助。\n\n❤️ [爱情与关系]\n你端庄有礼的形象将对异性产生巨大魅力。恋爱关系中，双方的信任加深，是承诺终身的好年份。人际关系也顺畅平和。\n\n⚠️ [注意事项]\n关注肺部健康或皮肤病。同时，有时需要放松心情，因为过度追求完美会导致自我压力过大。';

  @override
  String get sajuFortune2024Im =>
      '🌊 2024年 甲辰年 (木龙): \'如流水般灵活成长的一年\'\n\n2024年对你来说是‘食神’和‘偏官’能量进入的一年。就像大海滋润森林，孕育生命。这将是你运用智慧解决难题并扩张领地的一年。\n\n💼 [事业与商务]\n这是一个创造性解决问题的能力突出的时期。即使在困难的情况下，你也能找到突破口并获得认可。在教育、咨询和策划领域有望取得好成绩。但由于工作量过大可能导致精疲力竭，需要调整节奏。\n\n💰 [财运]\n这是一个通过你的技能或才华创造收入的好年份。衣食运和财运同时进入。但由于可能会有突发性开支，预留应急资金是明智的。\n\n❤️ [爱情与关系]\n随着理解和包容力的增加，你将与周围人保持良好的关系。在恋爱关系中，你们将通过深度对话确认彼此的真心。单身者很有可能遇到让你感到舒适的伴侣。\n\n⚠️ [注意事项]\n关注肾脏或膀胱系统健康。同时，优先安排行动，因为试图同时处理太多事情可能会损害健康。';

  @override
  String get sajuFortune2024Gye =>
      '💧 2024年 甲辰年 (木龙): \'在变革中抓住机遇\'\n\n2024年对你来说是‘伤官’和‘正官’能量进入的一年。就像甘霖滋润森林，使万物复苏。这将是你向世界发声、宣告你的存在并抓住新机遇的一年。\n\n💼 [事业与商务]\n表达能力提升，创意想法丰富。你将在营销、公关和艺术领域展现卓越才华。但由于可能对上司或组织规则产生抵触情绪，需要灵活应对的智慧。\n\n💰 [财运]\n金钱流向变得活跃的一年。通过发挥机智和敏捷增加收入的机会将会到来。但要小心因冲动消费或虚荣心导致开支变大。\n\n❤️ [爱情与关系]\n你将因过人的魅力和良好的谈吐而大受欢迎。在恋爱关系中，你通过坦诚的情感表达注入活力，但需要体谅，因为尖锐的话语有时可能会伤人。\n\n⚠️ [注意事项]\n预防泌尿系统疾病或血液循环问题。同时，避免在背后议论他人，始终保持谦虚的言行，因为你可能会成为谣言的对象。';

  @override
  String get sajuFortune2025Gap =>
      '🌿 2025年 乙巳年 (木蛇): \'在新阶段与竞争中成长\'\n\n2025年对你来说是‘劫财’和‘食神’能量进入的一年。就像森林中的大树与常春藤（乙木）和谐共处，共同成长。合作会产生协同效应，但同时也将是无法避免激烈竞争的一年。\n\n💼 [事业与商务]\n活动变得频繁，表现欲望增强。向世界广泛宣传你的想法和才华的机会将会到来。对于自由职业者、从事演艺事业或销售的人，预期的结果会很好。但与同事或竞争对手之间可能会产生微妙的冲突，需要化敌为友的智慧。\n\n💰 [财运]\n金钱流向活跃，但开支可能与收入一样多（劫财的影响）。由于与朋友/同事的聚会或投资建议，可能会产生支出，需要注意。从长远来看，投资于自我提升或扩大业务比存钱更有利。\n\n❤️ [爱情与关系]\n社交能力提高，你会结识许多新朋友。在聚会或团体活动中人气上升，是向异性展示魅力的好时机。但由于可能出现竞争对手，如果你有喜欢的人，最好积极表达自己。\n\n⚠️ [注意事项]\n过度的竞争心可能会导致麻烦。同时，受‘巳火’能量影响，变动运势增加，请注意交通安全和体力管理。';

  @override
  String get sajuFortune2025Eul =>
      '🌿 2025年 乙巳年 (木蛇): \'展现自我色彩的华丽跃升\'\n\n2025年对你来说是‘比肩’和‘伤官’能量进入的一年。就像田野里的花朵在温暖的阳光下盛开。这将是充满活力的一年，你将充分展示个性和才华，并获得公众关注。\n\n💼 [事业与商务]\n创造力和艺术感达到顶峰。你将在策划和展示想法的任务中表现出色。随着技能获得认可，独立或领导新项目的机会将会出现。但需要协调，因为试图走得太远可能会与现有规则产生冲突。\n\n💰 [财运]\n这是一个基于机智和技能创造收入的年份。你可能会通过副业或创作活动获得意外收入。但由于追求华丽的事物，维持体面的开支或娱乐支出可能会增加，所以不要失去理财意识。\n\n❤️ [爱情与关系]\n魅力四射，受到异性关注。在恋爱关系中，你们度过了愉快而活泼的时光，但有时可能会因自己的固执而发生争吵。如果是单身，你可以期待一场命中注定的相遇。\n\n⚠️ [注意事项]\n小心言多必失，因为今年很容易成为谣言的对象。同时，规律的睡眠和休息必不可少，因为你可能会消耗太多精力，容易感到疲倦。';

  @override
  String get sajuFortune2026Gap =>
      '🌳 2026年 丙午年 (火马): \'热情的火焰，活动的极大化\'\n\n2026年对你来说是‘食神’和‘伤官’能量非常强劲的一年。就像木头遇到了熊熊烈火，这是一个你的才华和表达欲毫不犹豫地迸发出来的时期。即使你保持静止，你的存在感也会显现出来，你的活动范围将急剧扩大。\n\n💼 [事业与商务]\n这是开始新项目或创业的极佳时机。你的想法得以实现，你将充满激情地投入工作。你可以在表现自我的领域（如艺术、广播、销售和教育）取得巨大成果。但你需要谨慎并复核一切，因为如果你只顾向前冲，可能会犯错。\n\n💰 [财运]\n财运随着你的活跃而到来。来自商业或副业的收入可能会增加。但正如你赚得很多，也可能会有很多钱用于投资或消费。为未来投资是好的，但应防范冲动消费。\n\n❤️ [爱情与关系]\n以诚实和积极的态度吸引异性。恋爱运势升温，但过度的情感表达可能会给伴侣带来负担。这也是子孙运势非常强劲的一年。\n\n⚠️ [注意事项]\n这是一个能量消耗极大的年份。可能会出现‘倦怠’，因此体力管理至关重要。小心言多必失引发的谣言，尽量不要只坚持自己的主张。';

  @override
  String get sajuFortune2026Eul =>
      '🌸 2026年 丙午年 (火马): \'华丽绽放，才华的全面盛开\'\n\n2026年对你来说是‘伤官’能量沉重的一年。就像花朵在烈日下绽放，这是一个你的魅力和才华达到顶峰的时期。你将成为到处受到关注的主角，品尝到辉煌的成就。\n\n💼 [事业与商务]\n打破现有框架的非常规尝试会取得成功。你将在设计、时尚、美容和娱乐领域脱颖而出。你可能会在工作中收到晋升或挖角邀请，但要小心与上司的摩擦。你的能力在自由的环境中会翻倍。\n\n💰 [财运]\n创造财富的能力变得卓越。你的品牌价值提升，身价增加。然而，追求华丽可能会导致奢侈或浪费，所以你必须守好钱包。\n\n❤️ [爱情与关系]\n异性缘爆发。你将拥有一段辉煌而热烈的恋情，但它可能既短暂又强烈。已婚者可能在子女方面有很多操心的事情。\n\n⚠️ [注意事项]\n情绪波动可能会变得剧烈。如果你不能控制脾气，辛勤换来的成就可能会崩溃。要有守法意识，避免法律问题或谣言。';

  @override
  String get sajuFortune2026Byeong =>
      '☀️ 2026年 丙午年 (火马): \'双日并出，激烈的竞争与跃升\'\n\n2026年对你来说是‘比肩’和‘劫财’非常强劲的一年。就像天空中出现了两个太阳，这是一个自尊心和竞争心达到顶点的时期。自主性变强，你讨厌任何干涉，并以坚定的决心开辟自己的道路。\n\n💼 [事业与商务]\n这是在竞争场所获胜并取得成就的好运。你可以通过合伙或协作扩大规模，但可能会因利润分配问题产生冲突。对于自由职业者或专业人士来说，这是扬名立万的好机会。\n\n💰 [财运]\n钱进来了，但流出的漏洞也很大。可能会因为兄弟姐妹、朋友或同事而花钱。绝对禁止担保或借钱给他人。与其存钱，不如投资于荣誉或增长力量。\n\n❤️ [爱情与关系]\n你可能会遇到像朋友一样的爱人，或者从朋友发展为爱人。但如果你已有伴侣，请小心，因为可能会出现三角关系或竞争对手。\n\n⚠️ [注意事项]\n武断的行为可能会引起周围人的反感。‘谦逊’是最好的策略。关注心血管疾病或眼睛健康。';

  @override
  String get sajuFortune2026Jeong =>
      '🔥 2026年 丙午年 (火马): \'巨型火焰，力量的扩张\'\n\n2026年对你来说是‘劫财’和‘比肩’的一年。就像蜡烛遇到了熔炉，这是一个你的力量变得庞大的时期。你可以通过周围人的帮助或合作实现单打独斗无法完成的事情。\n\n💼 [事业与商务]\n强劲的驱动力产生。你将拥有压倒竞争对手或将其转化为自己人的智慧。在团队项目或组织生活中行使领导力的机会将会到来。但如果你试图垄断成果，可能会遭到背叛，因此分享功劳的姿态是必要的。\n\n💰 [财运]\n投机倾向变强。你会追求‘高风险高回报’，如果幸运，你会触碰大笔金钱，但失败的影响也很大。可能会发生意外开支，所以最好准备应急资金。\n\n❤️ [爱情与关系]\n很有可能在社交聚会或团体活动中结识缘分。男性应注意不要冷落妻子或女友。今年与周围人的关系会成为你的资产。\n\n⚠️ [注意事项]\n贪婪会导致麻烦。克制无理的扩张或投资。小心因愤怒或压力引起的疾病。';

  @override
  String get sajuFortune2026Mu =>
      '🌋 2026年 丙午年 (火马): \'酷热中的耐心与准备\'\n\n2026年对你来说是‘偏印’和‘正印’能量强劲的一年。就像火山喷发前凝聚的能量。这是通过学习、艺术和获取证书来充实内在并增长技能的最佳时机。\n\n💼 [事业与商务]\n策划、研究和战略制定等脑力劳动比活跃的工作更闪耀。文书运势很好，因此在合同或许可相关的任务中有成果。但如果你只思考而推迟执行，可能会错失良机，所以也需要大胆的决断力。\n\n💰 [财运]\n房地产文书运势非常强劲。这是通过买卖或合同增加资产的机会。现金流可能有些令人沮丧，但从长期来看，投资是有前景的。\n\n❤️ [爱情与关系]\n来自母亲或长辈的干涉可能会增加。在恋爱中，你会看重精神层面的交流，可能会与年长的人结缘。\n\n⚠️ [注意事项]\n想法太多可能导致抑郁或乏力。户外活动或通过运动流汗有助于提升运势。由于酷热导致地面裂开，请注意皮肤干燥或肠胃不适。';

  @override
  String get sajuFortune2026Gi =>
      '🌾 2026年 丙午年 (火马): \'坚实的基础与明确的支持\'\n\n2026年对你来说是‘正印’和‘偏印’的一年。就像温暖的阳光照耀大地，使庄稼成熟。这是一个巩固稳定基础，同时获得长辈充分支持和关爱的时期。\n\n💼 [事业与商务]\n你在与学习相关的一切事情上（如晋升考试、考证和获得学位）都将取得最佳成果。在工作中，你将赢得长辈的信任并担任重要职务。你将在教育、房地产、咨询和福利领域脱颖而出。\n\n💰 [财运]\n这是掌握文书的好运。你可能会实现购房目标，或获得继承、赠与。稳定的资产增长是可能的，这是一个荣誉比财富更闪耀的年份。\n\n❤️ [爱情与关系]\n这是一个被爱包围的年份。你会从爱人那里获得可靠的爱，或遇到条件优越的伴侣。结婚运势也随之进入，家庭生活变得和谐。\n\n⚠️ [注意事项]\n如果你只想索取，可能会变得懒惰。分享与获得同样多的姿态是必要的。抛弃依赖心理，增强自立能力。';

  @override
  String get sajuFortune2026Gyeong =>
      '⚔️ 2026年 丙午年 (火马): \'历经磨难后的杰作诞生\'\n\n2026年对你来说是‘偏官’和‘正官’能量非常强大的一年。就像在熔炉中熔化矿石以打造传世宝剑。可能会有强烈的压力和紧张，但如果你能忍受，你将获得巨大的权威和荣誉。\n\n💼 [事业与商务]\n你可能会担任责任重大的职位或处理困难的项目。然而，这是对你的考验，如果成功完成，你的地位将瞬间提升。对于在公职、军队、警察和法律领域的人来说，这是晋升的机会。\n\n💰 [财运]\n这是荣誉和头衔的好运，而非单纯的金钱。随着地位提升，财富自然会随之而来，但用于维持体面或社交的支出也会很大。\n\n❤️ [爱情与关系]\n对于女性，这是一个充满魅力且有能力的男性出现的好运。男性有强劲的子孙运。与工作上司或长辈的关系变得重要。\n\n⚠️ [注意事项]\n健康管理是首要任务。警惕过劳引起的疾病或意外。尤其肺和大肠可能会变弱。寻找缓解压力的方法。';

  @override
  String get sajuFortune2026Sin =>
      '💎 2026年 丙午年 (火马): \'闪耀的珠宝，荣誉的顶峰\'\n\n2026年对你来说是‘正官’和‘偏官’的一年。就像在灯光下闪耀的珠宝，这是一个你的价值向世界揭示、荣誉提升的时期。你与正直、稳定的工作场所或组织有深厚的缘分。\n\n💼 [事业与商务]\n求职、晋升和调动运势非常好。你也可能因技能获得认可而收到挖角邀请。如果你遵守原则并正确处理工作，你将赢得所有人的尊重。\n\n💰 [财运]\n稳定的薪水或固定收入是有保障的。如果你保护荣誉而非追求财富，财富自然会随之而来。你可以从丈夫或工作中获益。\n\n❤️ [爱情与关系]\n这是女性最好的结婚和恋爱运势。你可以遇到一位正直且有能力的配偶。男性将喜得贵子，或因子女而有喜事。\n\n⚠️ [注意事项]\n过高的热度可能会熔化珠宝。过量的工作或压力可能会导致神经质。你可能会因强烈的原则导向倾向而显得死板，所以请小心。';

  @override
  String get sajuFortune2026Im =>
      '🌊 2026年 丙午年 (火马): \'江面上的太阳，巨额财富的机会\'\n\n2026年对你来说是‘偏财’和‘正财’非常活跃的一年。就像太阳照在湖面上，波光粼粼。财运爆发，这是一个你可能抓住人生逆转机会的时期。\n\n💼 [事业与商务]\n对企业主来说，这是一个格外好的年份。生意兴隆，活动舞台可能扩展到海外。上班族可以获得丰厚的奖金或红利。重视结果和实际利益的务实态度会招来成功。\n\n💰 [财运]\n这是你可以触碰大笔金钱的好运。投资回报、商业收入和意外横财随之而来。然而，如果你的理财能力较弱，可能会因钱失健，所以请在可控范围内追求财富。\n\n❤️ [爱情与关系]\n对于男性，异性缘如潮水般涌入。有吸引力的伴侣就在你身边。女性可能会在与婆婆的关系中表现突出，或遇到有能力的男性。\n\n⚠️ [注意事项]\n对财富和伴侣的执着可能会导致麻烦。盲目的贪婪可能会导致健康恶化（肾脏、膀胱、血压），所以请小心。理财要彻底，谨防诈骗。';

  @override
  String get sajuFortune2026Gye =>
      '🌧️ 2026年 丙午年 (火马): \'伴随彩虹的收获季节\'\n\n2026年对你来说是‘正财’和‘偏财’的一年。就像在伴有热气的暖日落下的春雨。你将为自己的努力获得诚实的回报，这是一个财务上非常繁荣且稳定的时期。\n\n💼 [事业与商务]\n如果你以真诚和细致去竞争，你一定会得到回报。你将在需要细致入微的领域（如金融、会计、银行和数据分析）展现才华。适合经营稳定的工作场所或扎实的生意。\n\n💰 [财运]\n勤奋存下的钱会变成一笔巨款。你可以通过储蓄、分期付款和安全投资增加资产。固定收入增加，生活变得从容。只需注意防范浪费。\n\n❤️ [爱情与关系]\n男性有很好的运气遇到贤妻良母型的配偶或结婚。女性将追求现实且稳定的恋爱。人际关系顺畅，你将赢得信誉。\n\n⚠️ [注意事项]\n过高的热度可能会蒸发雨水（癸水）。过度的活动或贪婪可能会耗尽体力，因此需要适当的休息。小心不要因纠结于眼前利益而错失大局。';

  @override
  String get sajuFortune2025Byeong =>
      '🔥 2025年 乙巳年 (木蛇): \'激情洋溢的成就与竞争\'\n\n2025年对你来说是‘正印’和‘比肩’能量进入的一年。就像天空中的太阳遇到了地面的热气，燃烧得更加炽热。你将获得强大的支持力量，并在自信的基础上毫不犹豫地推向目标。\n\n💼 [事业与商务]\n在可靠的助手或导师的帮助下，你将实现巨大的成长。对于考取证书或学术成就非常有利。与同事的协作闪耀，你将通过发挥领导力带领团队走向成功。但要警惕过度的竞争心可能会损害人际关系。\n\n💰 [财运]\n这是一个在与周围人分享信息的同时增加财富的时期。预期会有通过共同投资或合作获得的收入。但重要的是要维护实际利益，因为你可能会因自尊心或在意他人的目光而过度消费。\n\n❤️ [爱情与关系]\n随着与人们的聚会增多，友谊会加深。在恋爱关系中，像朋友般的舒适感变得更强。但需要适当的平衡，因为优先考虑朋友可能会导致与伴侣产生冲突。\n\n⚠️ [注意事项]\n关注血压或心脏健康等血液循环系统。同时，始终保持内心的平静，因为火爆脾气导致的冲动情绪可能会毁掉事情。';

  @override
  String get sajuFortune2025Jeong =>
      '🔥 2025年 乙巳年 (木蛇): \'在变革中寻找稳定与机遇\'\n\n2025年对你来说是‘偏印’和‘劫财’能量进入的一年。就像蜡烛在风中摇曳，但最终照亮了周围并展现出它的存在。可能会出现意想不到的变化，但这将是你明智地克服它们并将其转化为机遇的一年。\n\n💼 [事业与商务]\n原创性的想法和直觉闪耀。你将瞄准别人没想到的利基市场，或在专业领域取得深厚成果。但与同事的竞争变得激烈，可能会有人试图抢夺成果，因此请注意安全维护和关系管理。\n\n💰 [财运]\n财运可能会有波动的一年。需要保守的资产管理，因为可能会产生意外开支或在投资中受损。但利用自身专业技能获得的收入将稳定进入。最好避免金钱交易。\n\n❤️ [爱情与关系]\n随着想法增加，恋爱中可能会变得被动。在恋爱关系中，很容易因小事感到失望，所以信任对方并以开放的心态对待很重要。通过独处时间充实内心也是个好方法。\n\n⚠️ [注意事项]\n警惕压力导致的神经系统不适或失眠。通过冥想或轻微运动管理情绪很重要，努力保持积极的心态而非消极的想法。';

  @override
  String get sajuFortune2025Mu =>
      '⛰️ 2025年 乙巳年 (木蛇): \'明智地强化内在基础的成熟之年\'\n\n2025年对你来说是‘正官’和‘偏印’能量进入的一年。就像温暖的热气渗透进一座大山之下，包容万物。这将是增加自身深度同时保持社会荣誉的充实一年。\n\n💼 [事业与商务]\n你将升至组织内的负责职位，或者晋升机会将会到来。如果你重视原则并诚实工作，你将获得巨大的认可。同时，你在获取专业知识或研究任务方面取得优异成果。但需要灵活思考，因为你可能会因陷入刻板印象而拒绝变化。\n\n💰 [财运]\n稳定的收入是有保障的。诚实地储蓄和管理资产是有利的。房地产或文书方面的运势很好，因此值得考虑长远投资。但要避免因受周围诱惑影响而进行无理投资。\n\n❤️ [爱情与关系]\n你端庄的言行赢得了人们的信任。在恋爱关系中，这是互相尊重并发展成严肃关系的好时机。如果考虑结婚，现在制定具体计划也很好。\n\n⚠️ [注意事项]\n关注消化系统或皮肤健康。同时，练习听取周围建议并快速做出决定，因为你可能会因思虑过多而面临决策困境。';

  @override
  String get sajuFortune2025Gi =>
      '🌾 2025年 乙巳年 (木蛇): \'以责任感达成目标\'\n\n2025年对你来说是‘偏官’和‘正印’能量进入的一年。就像雨后的阳光照耀在广阔的土地上，使庄稼茁壮成长。可能会有艰辛的过程，但这将是最终获得荣誉并达成目标的丰收年。\n\n💼 [事业与商务]\n工作强度可能会增加，可能会被赋予艰巨的任务。然而，你将通过技能和耐心克服困难，证明你作为领导者的素质。你将在长辈的帮助或支持下度过危机，并因此体会到巨大的成就感。\n\n💰 [财运]\n需要注意开支管理的一年。可能会有很多钱流出，如意外的税收或公共事业费用。但由于持之以恒的努力有望获得奖金或红利，诚实是招财的关键。\n\n❤️ [爱情与关系]\n负责任的形象对异性很有吸引力。在恋爱关系中，通过倾听彼此的辛劳并互相安慰，纽带会加深。但即使时间很短，也需要努力频繁沟通，因为你可能会因忙碌的日常生活而忽略伴侣。\n\n⚠️ [注意事项]\n警惕过劳导致的免疫力下降。通过规律的饮食和运动管理体力，并用积极的想法缓解压力非常重要。';

  @override
  String get sajuFortune2025Gyeong =>
      '⚔️ 2025年 乙巳年 (木蛇): \'获得荣誉的同时兼顾实际利益\'\n\n2025年对你来说是‘正财’和‘偏官’能量进入的一年。就像坚硬的岩石被火加热，重生成为珍贵的宝剑。你将为自己的努力获得明确的回报，并在社会上证明自己的价值。\n\n💼 [事业与商务]\n你凭借结果导向的思维和执行力取得巨大成果。尤其在金融、管理和技术领域的才华获得认可。解决难题并获得荣誉的运势强劲，但责任也在增长，你可能会感到压力。相信自己，大胆前进吧。\n\n💰 [财运]\n财运非常好。除了稳定的收入，你还可以通过投资或副业获得实际利润。你将准确掌握金钱流向，并高效管理资产。但请克制为了荣誉而大肆挥霍的行为。\n\n❤️ [爱情与关系]\n以真诚可靠的形象吸引异性。在恋爱关系中，你以负责任的态度给对方安全感。在人际关系中，你可能会给人一种略显严厉的印象，所以偶尔进行一些柔和幽默的谈话会很好。\n\n⚠️ [注意事项]\n关注骨骼或关节健康，以及呼吸系统疾病。同时，以‘这样就足够了’的心态安抚自己，因为你可能会因完美主义倾向而苛责自己。';

  @override
  String get sajuFortune2025Sin =>
      '💎 2025年 乙巳年 (木蛇): \'在变革中闪耀智慧的一年\'\n\n2025年对你来说是‘偏财’和‘正官’能量进入的一年。就像一颗精致的珠宝在灿烂的灯光下展现价值。这将是社会地位提升并伴随意外横财的愉快一年。\n\n💼 [事业与商务]\n商业嗅觉提升，捕捉新机遇的能力卓越。这是一个大胆挑战会转化为巨额利润的时期。在组织内部，你凭借理性的判断赢得信任，并抓住晋升或调动的机会。但要注意不要因过于关注结果而忽视过程。\n\n💰 [财运]\n这是一个招财的年份。触碰大额财富的机会（如意外的投资回报或继承）会出现。但由于开支也可能变得奢华，维持计划性的消费习惯很重要。\n\n❤️ [爱情与关系]\n你以华丽动人的外表成为社交聚会的主角。恋爱运势非常强劲，你可能会收到许多人的追求。在恋爱关系中，你们度过了激情而愉快的时光。是发展成严肃交往的好年份。\n\n⚠️ [注意事项]\n关注肺部健康或皮肤病。同时，始终保持谦虚，不要忘记体谅他人的心，因为你可能会因过度自信而显得傲慢。';

  @override
  String get sajuFortune2025Im =>
      '🌊 2025年 乙巳年 (木蛇): \'发挥智慧产生结果\'\n\n2025年对你来说是‘伤官’和‘偏财’能量进入的一年。就像大河蜿蜒滋润着广阔的田野。这将是发挥你的才华和口才，获得巨额财富并扩大活动范围的充满活力的一年。\n\n💼 [事业与商务]\n表达能力提升，在营销或公关领域取得优异成果。是商业化你的想法或开拓新市场的极佳时机。对从事创造性工作的人来说将是最好的一年。但重要的是保持礼貌，因为可能会与上司产生摩擦。\n\n💰 [财运]\n财运变动活跃。用自己的技能赚钱的运势强劲，滚动大笔金钱的机会将会到来。但对于投机性投资需谨慎，只有抱着赚多少给多少的心态，财运才能长久维持。\n\n❤️ [爱情与关系]\n凭借过人的幽默感和魅力，身边总是围满了人。这是你可以享受愉快约会、在异性中人气很高的一年。在恋爱关系中，你通过多样化的约会注入活力。但要小心，哪怕是一个轻微的词语也可能引起误解。\n\n⚠️ [注意事项]\n关注肾脏或泌尿系统健康。同时，注意适当的休息和营养，因为体力可能会因广泛的活动范围而透支。';

  @override
  String get sajuFortune2025Gye =>
      '💧 2025年 乙巳年 (木蛇): \'真诚产生稳定成果的一年\'\n\n2025年对你来说是‘食神’和‘正财’能量进入的一年。就像清澈的细雨滋润大地，为丰收做准备。这将是温暖的一年，你的努力稳步积累，并转化为稳定的财富和幸福。\n\n💼 [事业与商务]\n真诚成为最强大的武器的一年。你通过履行职责产生稳定的成果，并赢得同事的信任。是增长专业知识的好时机，你会通过喜欢的工作感受到回报。你可以在稳定的环境中步步为营地成长。\n\n💰 [财运]\n经济上从容稳定的一年。产生稳定的收入，你会感受到勤俭节约增加资产的乐趣。衣食无忧，整体生活充满富足。储蓄比无理的投资更有利。\n\n❤️ [爱情与关系]\n你以温厚的神情给伴侣带来舒适感。这是你们在细致体谅彼此的同时，培育美丽爱情的一年。如果是单身，你很有可能遇到沟通顺畅、价值观相似的伴侣。\n\n⚠️ [注意事项]\n关注胃部健康或饮食管理。偶尔通过给予新刺激来寻找活力会很好，因为你可能会因安于现状而变得懒惰。';

  @override
  String get preparationForTomorrow => '明日准备';

  @override
  String get howToMeetMoreLuck => '如何遇见更多好运';

  @override
  String get enterName => '请输入姓名';

  @override
  String fortuneDateConfirm(String date) {
    return '要查看 $date 的运势吗？';
  }

  @override
  String get colorPurple => '紫色';

  @override
  String get colorBlue => '蓝色';

  @override
  String get colorYellow => '黄色';

  @override
  String get colorRed => '红色';

  @override
  String get colorGreen => '绿色';

  @override
  String get colorPink => '粉色';

  @override
  String get colorOrange => '橙色';

  @override
  String get colorWhite => '白色';

  @override
  String get colorBlack => '黑色';

  @override
  String get itemPerfume => '香水';

  @override
  String get itemHandkerchief => '手帕';

  @override
  String get itemRing => '戒指';

  @override
  String get itemWatch => '手表';

  @override
  String get itemGlasses => '眼镜';

  @override
  String get itemHat => '帽子';

  @override
  String get itemBook => '书';

  @override
  String get itemEarphones => '耳机';

  @override
  String get itemMirror => '小镜子';

  @override
  String get itemPen => '笔';

  @override
  String get itemCoin => '硬币';

  @override
  String get itemKey => '钥匙';

  @override
  String get dirEast => '东';

  @override
  String get dirWest => '西';

  @override
  String get dirSouth => '南';

  @override
  String get dirNorth => '北';

  @override
  String get dirNorthEast => '东北';

  @override
  String get dirSouthEast => '东南';

  @override
  String get dirNorthWest => '西北';

  @override
  String get dirSouthWest => '西南';

  @override
  String get general => '常规';

  @override
  String get darkMode => '深色模式';

  @override
  String get darkModeDescription => '开启深色模式，享受更舒适的视觉体验。';

  @override
  String get alarmSettings => '闹钟设置';

  @override
  String get privacySettings => '隐私设置';

  @override
  String get information => '信息';

  @override
  String get notice => '公告';

  @override
  String get weatherConditionSunny => '晴';

  @override
  String get weatherConditionPartlyCloudy => '多云间晴';

  @override
  String get weatherConditionCloudy => '多云';

  @override
  String get weatherConditionFoggy => '雾';

  @override
  String get weatherConditionDrizzle => '毛毛雨';

  @override
  String get weatherConditionRainy => '雨';

  @override
  String get weatherConditionFreezingRain => '冻雨';

  @override
  String get weatherConditionSnowy => '雪';

  @override
  String get weatherConditionSnowGrains => '雪粒';

  @override
  String get weatherConditionRainShowers => '阵雨';

  @override
  String get weatherConditionSnowShowers => '阵雪';

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
  String get alarmOptimization => '闹钟运行优化';

  @override
  String get allOptimizationsCompleted => '所有设置已优化。';

  @override
  String get optimizationNeeded => '为了确保闹钟准时响铃，需要进行必要设置。';

  @override
  String get optimizationDescription => '受系统设置影响，闹钟可能会延迟或无法响铃。请允许以下所有权限。';

  @override
  String get allowNotificationPermission => '允许通知';

  @override
  String get notificationPermissionDescription => '用于在闹钟响铃及运势更新时提醒您。';

  @override
  String get excludeBatteryOptimization => '电池优化排除';

  @override
  String get batteryOptimizationDescription => '防止系统为省电而延迟闹钟响铃。';

  @override
  String get allowExactAlarm => '允许精确闹钟';

  @override
  String get exactAlarmDescription => '确保闹钟在设定时间准时触发。';

  @override
  String get drawOverOtherApps => '在其他应用上层显示';

  @override
  String get overlayDescription => '即使在锁屏或使用其他应用时也能显示闹钟界面。';

  @override
  String get allSettingsCompleted => '所有设置已完成。';

  @override
  String get allowAllItems => '请开启所有权限。';

  @override
  String get manualSettingsInfo => '您可以在系统设置菜单中随时管理这些权限。';

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
  String get ringingNow => '闹钟响铃中';

  @override
  String get setTime => '设置时间';

  @override
  String get repeatDays => '重复日期';

  @override
  String get repeatDaily => '每天重复';

  @override
  String get snoozeSettings => '贪睡设置';

  @override
  String get wakeUpAlarm => '起床闹钟';

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
  String get daySunFull => '星期日';

  @override
  String get dayMonFull => '星期一';

  @override
  String get dayTueFull => '星期二';

  @override
  String get dayWedFull => '星期三';

  @override
  String get dayThuFull => '星期四';

  @override
  String get dayFriFull => '星期五';

  @override
  String get daySatFull => '星期六';

  @override
  String get missionRewardEarned => '太棒了！您已完成今日的5个任务，获得1个幸运饼干！';

  @override
  String missionRewardEarnedWithCount(int missions, int cookies) {
    return '干得漂亮！您今天完成了$missions个任务，获得$cookies个幸运饼干！';
  }

  @override
  String daysCount(int count) {
    return '$count天';
  }

  @override
  String get user => '用户';

  @override
  String get member => '会员';

  @override
  String get manageSajuInfo => '管理四柱信息';

  @override
  String get freeCharge => '免费补充';

  @override
  String get fortunePass => '福气通行证';

  @override
  String get unlimitedNotSubscribed => '未订阅（无法使用不限次数）';

  @override
  String get unlimitedInUse => '不限次数使用中';

  @override
  String get subscribe => '订阅';

  @override
  String get manageSubscription => '管理订阅';

  @override
  String get purchaseHistory => '购买记录';

  @override
  String get customerCenter => '客服中心';

  @override
  String get noNewNotifications => '暂无新通知。';

  @override
  String get noPurchaseHistory => '暂无购买记录。';

  @override
  String get none => '无';

  @override
  String deleteConfirmMessage(String title) {
    return '要删除“$title”吗？';
  }

  @override
  String get delete => '删除';

  @override
  String get notepad => '备忘录';

  @override
  String get today => '今天';

  @override
  String get yearView => '年';

  @override
  String get monthView => '月';

  @override
  String get weekView => '周';

  @override
  String get dayView => '日';

  @override
  String get noEvents => '暂无日程。';

  @override
  String get calendarDragGuide => '向下滑动以查看详细日历。';

  @override
  String get noSavedMemos => '暂无保存的备忘录。';

  @override
  String get holiday => '节假日';

  @override
  String get photo => '照片';

  @override
  String get drawing => '涂鸦';

  @override
  String get drawingTitle => '涂鸦';

  @override
  String get pencil => '铅笔';

  @override
  String get marker => '马克笔';

  @override
  String get eraser => '橡皮擦';

  @override
  String adjustThickness(String label) {
    return '调整$label粗细';
  }

  @override
  String get sticker => '贴纸';

  @override
  String get event => '日程';

  @override
  String get memo => '备忘录';

  @override
  String get routineExercise => '运动';

  @override
  String get routineHiking => '徒步';

  @override
  String get routineCleaning => '打扫';

  @override
  String get routineTravel => '旅行';

  @override
  String get routineDate => '约会';

  @override
  String get routineConcert => '演唱会';

  @override
  String get routineMovie => '电影';

  @override
  String get routineMeeting => '会议';

  @override
  String get howIsYourMoodToday => '今天心情如何？';

  @override
  String get complete => '完成';

  @override
  String get amWithIcon => '☀️ 上午';

  @override
  String get pmWithIcon => '🌙 下午';

  @override
  String get photoPermissionDescription => '如需添加照片，请在设置中允许访问相册/照片。';

  @override
  String get goToSettings => '去设置';

  @override
  String get photoPermissionNeeded => '需要相册权限';

  @override
  String get fontSize => '字号';

  @override
  String get fontFamily => '字体';

  @override
  String get textColor => '文字颜色';

  @override
  String get textAlign => '对齐方式';

  @override
  String get alignLeft => '左对齐';

  @override
  String get alignCenter => '居中';

  @override
  String get alignRight => '右对齐';

  @override
  String get edit => '编辑';

  @override
  String get fontSettings => '字体设置';

  @override
  String get imageAddedFromKeyboard => '已从键盘添加图片';

  @override
  String get cancelWriting => '取消编辑';

  @override
  String get cancelWritingConfirm => '当前内容尚未保存，确定取消并退出吗？';

  @override
  String get continueWriting => '继续编辑';

  @override
  String get title => '标题';

  @override
  String get content => '内容';

  @override
  String get selectTime => '选择时间';

  @override
  String get noTime => '不设置时间';

  @override
  String minutesLater(String minutes) {
    return '$minutes分钟后';
  }

  @override
  String get countLabel => '次数';

  @override
  String timesCount(String count) {
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
  String get routineSummary => '日程概览';

  @override
  String get alarmOn => '闹钟已开启';

  @override
  String get alarmOff => '闹钟已关闭';

  @override
  String get contentHint => '请输入内容';

  @override
  String get addEvent => '添加日程';

  @override
  String get manageItem => '管理项目';

  @override
  String get manageItemDescription => '管理你的日程与备忘录条目。';

  @override
  String get noTitle => '无标题';

  @override
  String get selectTitleColor => '选择标题颜色';

  @override
  String get save => '保存';

  @override
  String get missionNone => '无任务';

  @override
  String get missionSnap => '物体拍摄';

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
  String fortuneCatchTime(int seconds) {
    return '时间：${seconds}s';
  }

  @override
  String fortuneCatchBest(int seconds) {
    return '最佳：${seconds}s';
  }

  @override
  String get fortuneCatchAngryHint => '避开生气的福尼，避免扣分！';

  @override
  String get fortuneCatchInstruction => '抓住开心的福尼，躲开生气的福尼！';

  @override
  String fortuneCatchPointMinus(int points) {
    return '扣除 $points 分';
  }

  @override
  String fortuneCatchPointPlus(int points) {
    return '+$points 分';
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
  String missionAnalyzing(int index, int total) {
    return '任务 $index/$total 分析中…';
  }

  @override
  String missionPointObject(int index, int total) {
    return '任务 $index/$total：请对准提示中的物品。';
  }

  @override
  String get missionPointSink => '请对准水槽。';

  @override
  String get missionPointRefrigerator => '请对准冰箱。';

  @override
  String get missionPointScale => '请对准体重秤。';

  @override
  String get missionPointFace => '请对准你的脸。';

  @override
  String get missionPointObjectGeneric => '请对准指定物品。';

  @override
  String get missionRecognizeObject => '请识别物品。';

  @override
  String get missionPerform => '请完成任务。';

  @override
  String get initError => '初始化时发生错误。';

  @override
  String get analyzingNextTarget => '正在分析下一个目标…';

  @override
  String get errorOccurredGeneric => '发生错误';

  @override
  String missionSuccessWithCount(int completed, int total) {
    return '$completed/$total 成功！';
  }

  @override
  String missionMatchSuccess(int total) {
    return '$total/$total 成功！匹配完成！';
  }

  @override
  String get escape => '逃脱';

  @override
  String get pointObjectClearly => '请清晰对准物体';

  @override
  String get matchingSuccess => '匹配成功';

  @override
  String get missionComplete => '任务完成';

  @override
  String get allMissionsComplete => '全部任务完成';

  @override
  String missionSnoozeMessage(String minutes) {
    return '任务成功！不过将按设置在 $minutes 分钟后再次响铃。';
  }

  @override
  String get showFace => '请露出脸';

  @override
  String get keepWatching => '请继续看着屏幕';

  @override
  String get recognizingFaceForFortune => '正在识别面相信息…';

  @override
  String get dataNotStored => '数据不会被保存';

  @override
  String get solveProblem => '请解题。';

  @override
  String get correctAnswer => '答对了！';

  @override
  String get wrongAnswerRetry => '不对哦，再试一次。';

  @override
  String get correct => '正确！';

  @override
  String get walkToDismiss => '请拿着手机走动';

  @override
  String get shakeCount => '摇动次数';

  @override
  String shakeTimes(int count) {
    return '$count次';
  }

  @override
  String tapTimes(int count) {
    return '$count 次点击';
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
  String get selectMissionTitle => '选择闹钟任务';

  @override
  String get ringtoneCategoryStandard => '标准';

  @override
  String get ringtoneCategoryCalm => '舒缓';

  @override
  String get ringtoneCategoryUpbeat => '轻快';

  @override
  String get ringtoneCategoryLoud => '强烈';

  @override
  String get noRingtones => '未找到铃声。';

  @override
  String get photoPermissionRequired => '需要相册访问权限。';

  @override
  String get deleteImage => '删除图片';

  @override
  String get longPressToDelete => '长按可删除';

  @override
  String get videoLoadFail => '视频加载失败';

  @override
  String get existingCapturedImages => '已拍摄的照片';

  @override
  String deleteCount(int count) {
    return '删除 $count';
  }

  @override
  String deleteSelectedImagesConfirm(int count) {
    return '确定要删除 $count 张图片吗？\n此操作无法撤销。';
  }

  @override
  String get classicAlarm => '经典闹钟';

  @override
  String get digitalAlarm => '数字闹钟';

  @override
  String get birdsSound => '鸟鸣声';

  @override
  String get wavesSound => '海浪声';

  @override
  String get cuckooClock => '布谷钟';

  @override
  String get calmAlarm => '舒缓闹钟';

  @override
  String get doorKnock => '敲门声';

  @override
  String get earlySunrise => '清晨日出 (Early Sunrise)';

  @override
  String get goodMorningSound => '早安 (Good Morning)';

  @override
  String get inAHurry => '匆忙 (In a Hurry)';

  @override
  String get lovingYou => '爱着你 (Loving You)';

  @override
  String get sirenSound => '警报声 (Siren)';

  @override
  String get swingingSound => '摇摆 (Swinging)';

  @override
  String get telephoneBusy => '电话忙音';

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
  String get exactAlarmPermissionDesc => '为了在准确时间响铃，需要“日程与提醒”权限。';

  @override
  String get batteryOptimizationPermissionDesc => '为了确保闹钟准时，需要关闭电池优化。';

  @override
  String get overlayPermissionDesc => '为了在响铃时显示任务界面，需要“在其他应用上层显示”权限。';

  @override
  String get cameraMissionFirstImageError => '请至少设置第一张任务图片。';

  @override
  String get retry => '重试';

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
  String snoozeMinutesUnlimited(String minutes) {
    return '$minutes 分钟（不限次数）';
  }

  @override
  String snoozeMinutesCount(String minutes, int current, int total) {
    return '$minutes 分钟（$current/$total）';
  }

  @override
  String get ringtone_fluttering_day => '心动的一天 (Fluttering Day)';

  @override
  String get ringtone_cozy_day => '温暖的一天 (Cozy Day)';

  @override
  String get ringtone_sensible_day => '理性的一天 (Sensible Day)';

  @override
  String get ringtone_play_with_me => '和我玩 (Play with Me)';

  @override
  String get ringtone_refreshing_day => '清爽的一天 (Refreshing Day)';

  @override
  String get ringtone_new_beginning => '新的开始 (New Beginning)';

  @override
  String get ringtone_self_love => '爱自己 (Self Love)';

  @override
  String get cherry_stained_finger => '樱桃渍手指 (Cherry Stained Finger)';

  @override
  String get dancing_in_the_stars => '星间舞动 (Dancing In The Stars)';

  @override
  String get nice_day => '美好的一天 (Nice Day)';

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
  String fortuneSelectTitleDate(String month, int day) {
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
  String fortuneResultTitleDate(int year, String month, int day) {
    return '$year年$month月$day日的运势';
  }

  @override
  String get startDayButton => '开始新的一天';

  @override
  String get tarotName0 => '愚者';

  @override
  String get tarotName1 => '魔术师';

  @override
  String get tarotName2 => '女祭司';

  @override
  String get tarotName3 => '女皇';

  @override
  String get tarotName4 => '皇帝';

  @override
  String get tarotName5 => '教皇';

  @override
  String get tarotName6 => '恋人';

  @override
  String get tarotName7 => '战车';

  @override
  String get tarotName8 => '力量';

  @override
  String get tarotName9 => '隐士';

  @override
  String get tarotName10 => '命运之轮';

  @override
  String get tarotName11 => '正义';

  @override
  String get tarotName12 => '倒吊人';

  @override
  String get tarotName13 => '死神';

  @override
  String get tarotName14 => '节制';

  @override
  String get tarotName15 => '恶魔';

  @override
  String get tarotName16 => '高塔';

  @override
  String get tarotName17 => '星星';

  @override
  String get tarotName18 => '月亮';

  @override
  String get tarotName19 => '太阳';

  @override
  String get tarotName20 => '审判';

  @override
  String get tarotName21 => '世界';

  @override
  String get tarotKeywords0 => '新的开始, 冒险, 纯真, 自由, 鲁莽';

  @override
  String get tarotDesc0 =>
      '愚者身穿华丽的衣服，站在悬崖边缘，目光却望向远方，充满希望。一只小狗跟在他身后，仿佛在吠叫提醒。这象征着不考虑现实风险的纯粹热情和新旅程的开始。';

  @override
  String get tarotLoveMeaning0 => '可能会有一段意想不到的新恋情，或者是一场一见钟情的命中注定的相遇。';

  @override
  String get tarotLoveDetail0 =>
      '这是一个你可以像孩子一样以纯真之心开始恋爱的时期。忘掉过去所有的伤痛或复杂的条件，忠于当下的感受。';

  @override
  String get tarotWealthMeaning0 =>
      '新的投资机会或商业项目可能会引起你的注意。这是一个在不被金钱束缚、快乐工作时会有收益的时期。';

  @override
  String get tarotWealthDetail0 =>
      '这是一个在财务上开启新机会的时期。如果你投资于别人没尝试过的新领域或创意项目，可能会获得意想不到的结果。';

  @override
  String get tarotSuccessMeaning0 => '这是开始新项目或跳槽到完全不同领域的好时机。';

  @override
  String get tarotSuccessDetail0 =>
      '如果你有正在准备的事情，请大胆迈出第一步。这是离开熟悉环境、接受新挑战的最合适时机。';

  @override
  String get tarotKeywords1 => '创造, 意志, 能力, 实现, 多才多艺';

  @override
  String get tarotDesc1 =>
      '魔术师身穿红袍，一手指天，一手拍地，将上天的力量带到人间。桌上有四种元素（权杖、圣杯、宝剑、钱币），意味着你已经拥有了实现目标的所有工具和能力。';

  @override
  String get tarotLoveMeaning1 => '这是你的魅力达到顶峰、受到异性欢迎的时期。';

  @override
  String get tarotLoveDetail1 =>
      '这是利用你的魅力和才华俘获心仪对象之心的绝佳机会。如果你有喜欢的人，请不要犹豫，积极靠近。你的幽默感和机智的谈话会令对方感到愉快，你将能够主导这段关系的发展。请保持自信，大胆追求你的真爱。';

  @override
  String get tarotWealthMeaning1 => '这是利用你的能力和技能创造收入的最佳时机。';

  @override
  String get tarotWealthDetail1 =>
      '这是一个你的知识、技能和想法变成金钱的时期。不要满足于只领工资，尝试通过副业或兼职创造额外收入。你的创意策划或销售能力将得到卓越发挥，有望获得超出预期的收益。';

  @override
  String get tarotSuccessMeaning1 => '你的工作能力得到卓越发挥并获得周围人的认可。';

  @override
  String get tarotSuccessDetail1 =>
      '在职场或学业中，你可以充分发挥自己的能力并脱颖而出。无论遇到什么问题，你都能凭借自己的机智和才干将其解决，同事和上司都会认可你为“能者”。请相信自己，堂堂正正地展示你的实力。';

  @override
  String get tarotKeywords2 => '直觉, 智慧, 神秘, 秘密, 柏拉图式';

  @override
  String get tarotDesc2 => '坐在神秘面纱后的女祭司手中拿着智慧卷轴，在黑白柱子之间保持平衡，象征着深刻的洞察力。';

  @override
  String get tarotLoveMeaning2 => '意味着精神交流很重要的柏拉图式爱情。';

  @override
  String get tarotLoveDetail2 =>
      '比起肉体魅力，你更倾向于被精神深度和能够交流的人吸引。你敏锐的直觉能让你洞察对方的心思，即使不言语也能相互理解。但过于谨慎的态度可能会导致误解，偶尔也请坦率地表达你的心意。';

  @override
  String get tarotWealthMeaning2 => '现在是保护资产、观察局势的时候，而不是积极投资。';

  @override
  String get tarotWealthDetail2 =>
      '这是一个你应该冷静分析和研究市场局势，而不是追求眼前利益的时期。现在是播种和等待的阶段，不要因为暂时没有收益而感到焦虑。考虑房地产或股票等长期投资视角会更合适。';

  @override
  String get tarotSuccessMeaning2 => '你可以在研究、专业领域取得好成绩。';

  @override
  String get tarotSuccessDetail2 =>
      '比起追求华丽的表面成就，你应该专注于充实内在和提高技能。在研究、策划、分析等需要深思熟虑的工作中，你能取得卓越成果。你睿智且谨慎的态度将在关键时刻成为解决问题的钥匙。';

  @override
  String get tarotKeywords3 => '丰收, 母亲, 自然, 美丽, 成果';

  @override
  String get tarotDesc3 => '皇后安详地坐在丰饶的大自然中，是物质和精神富足的象征。';

  @override
  String get tarotLoveMeaning3 => '这是一个爱意满溢、关系进一步深化的时期。';

  @override
  String get tarotLoveDetail3 =>
      '你的女性化（或包容性）魅力达到极致，对异性非常有吸引力。恋爱中的人会因为给予对方温暖的关怀而获得巨大的爱，甚至可能谈及婚嫁。单身的人可以通过打扮或改变风格来显著提升恋爱运。';

  @override
  String get tarotWealthMeaning3 => '这是一个物质上非常富足和稳定的时期。';

  @override
  String get tarotWealthDetail3 =>
      '财运正盛。付出会有回报，甚至超出预期，可以享受经济上的从容。你可能会在事业或投资中获得惊喜收益，或者收到意想不到的奖金或礼物。与周围人分享这份富足的能量，会带来更大的幸运。';

  @override
  String get tarotSuccessMeaning3 => '进行中的项目进展顺利，会取得好成果。';

  @override
  String get tarotSuccessDetail3 =>
      '这是工作成果显现的时期。项目圆满完成，你可能获得奖金或晋升机会。特别是在需要审美或创造力的领域，你的才华将大放异彩。保持从容的心态并享受过程，反而会带来更好的结果。';

  @override
  String get tarotKeywords4 => '权威, 结构, 稳定, 领导力, 责任感';

  @override
  String get tarotDesc4 => '皇帝坐在坚硬的石座上，身穿盔甲，象征着坚定的支配力和秩序。';

  @override
  String get tarotLoveMeaning4 => '意味着与可靠、有责任感的对象建立稳定的恋爱关系。';

  @override
  String get tarotLoveDetail4 =>
      '比起热烈的激情，基于信任和稳定的关系会持续下去。对方会给予你坚实的依靠和引导。不过请注意不要过度控制对方或过于固执。单身的人有机会遇到有能力且有社会地位的对象。';

  @override
  String get tarotWealthMeaning4 => '通过系统的资产管理可以积累稳定的财富。';

  @override
  String get tarotWealthDetail4 =>
      '在理财方面，建立原则和计划非常重要。比起追求暴利的投机，投资于储蓄、房地产等安全可靠的资产来夯实基础会更好。你现实的判断力和执行力将极大地帮助你积累财富。';

  @override
  String get tarotSuccessMeaning4 => '有晋升或担任领导职务的运气。';

  @override
  String get tarotSuccessDetail4 =>
      '你在组织中的地位变得稳固。你的领导力获得认可，可能晋升为团队负责人或经理，甚至被委以重要项目的总负责人。凭借理性和冷静的判断处理业务，你将赢得老板的信任。';

  @override
  String get tarotKeywords5 => '传统, 教导, 信念, 建议, 调解';

  @override
  String get tarotDesc5 => '教皇重视社会规范和传统，是凭借智慧建议引导人们的精神导师。';

  @override
  String get tarotLoveMeaning5 => '基于信任和尊重的严肃且健康的交往将持续。';

  @override
  String get tarotLoveDetail5 =>
      '比起轻率的交往，你更倾向于以结婚为前提的严肃恋爱。在相亲或健康的聚会中你可能遇到良缘。如果恋人之间有矛盾，请向长辈或前辈寻求建议，他们的睿智会极大地帮助关系恢复。';

  @override
  String get tarotWealthMeaning5 => '传统且安全的理财方式较好。';

  @override
  String get tarotWealthDetail5 =>
      '比起冒险的投资，应将稳定性放在首位。利用银行储蓄或保险等传统金融产品会更合适。寻求专家的咨询或保持诚实透明的资金交易是守护你信用和财产的途径。';

  @override
  String get tarotSuccessMeaning5 => '契约、合作、协作关系将圆满达成。';

  @override
  String get tarotSuccessDetail5 =>
      '比起独自解决问题，寻求周围的帮助是明智的。向同事或上司等前辈寻求建议，往往能出乎意料地轻松找到解决方案。遵守公司规章制度是获得好评的捷径，也是签订重要合同的好运期。';

  @override
  String get tarotKeywords6 => '爱情, 和谐, 选择, 结合, 伙伴关系';

  @override
  String get tarotDesc6 => '在温暖的太阳下，亚当和夏娃正接受天使的祝福。这象征着灵魂的结合与重要的选择。';

  @override
  String get tarotLoveMeaning6 => '这是爱情开花结果的最佳时期之一。';

  @override
  String get tarotLoveDetail6 =>
      '令人心跳加速的浪漫正等待着你。与好感对象迅速接近，感受深刻的共鸣。如果你打算表白，成功几率非常高。但请记住，比起被瞬间的诱惑冲昏头脑，选择真心所属的方向才是明智之举。';

  @override
  String get tarotWealthMeaning6 => '比起独自一人，合作时财运会上升。';

  @override
  String get tarotWealthDetail6 =>
      '与志同道合的人一起共事会产生协同效应，增加经济利益。如果有合作建议，请积极考虑。这是一个通过与人沟通获得有益投资信息的时期。不过请注意调节娱乐支出，避免过度消费。';

  @override
  String get tarotSuccessMeaning6 => '这是团队合作大放异彩的时期。';

  @override
  String get tarotSuccessDetail6 =>
      '与同事或合作伙伴默契十足，工作进行得非常愉快。比起独自工作，在团队项目中你能取得更好的成果，圆融的人际关系将成为成功的关键。如果你选择自己真心热爱的工作，将会获得无悔的结果。';

  @override
  String get tarotKeywords7 => '胜利, 意志, 前进, 征服, 移动';

  @override
  String get tarotDesc7 => '坐在战车上的年轻国王手持指挥棒，以坚定的意志向着目标冲锋，势不可挡。';

  @override
  String get tarotLoveMeaning7 => '积极的爱情攻势会取得成功的时期。';

  @override
  String get tarotLoveDetail7 =>
      '是时候为了争取爱情而冲锋了。不要犹豫，坦率而堂堂正正地表达你的心意，即使有竞争者也能胜出。如果处于暧昧阶段，最好由你来主导并明确关系。充满活力的约会或共同旅行将加深你们的感情。';

  @override
  String get tarotWealthMeaning7 => '为了达到目标收益，需要积极行动的时期。';

  @override
  String get tarotWealthDetail7 =>
      '为了实现财务目标，需要强大推进力的时期。不要犹豫，抓住机会果断决策。集中精力于短期见效的项目会更有利，这是一个多跑动就能多出业绩的运势。虽然可能会有与移动相关的支出，但这将是对新机会的投资。';

  @override
  String get tarotSuccessMeaning7 => '在竞争中获胜并夺取目标的运气。';

  @override
  String get tarotSuccessDetail7 =>
      '预见将达成明确的目标，如晋升、合格、签约成功等。竞争越激烈，你的斗志就越旺盛，最终将夺得胜利。即使遇到障碍，你正面突破的身姿也会给周围留下深刻印象。在出差或移动较多的业务中，你将发挥卓越能力。';

  @override
  String get tarotKeywords8 => '耐心, 勇气, 内在力量, 包容, 柔中带刚';

  @override
  String get tarotDesc8 => '身穿白衣的女子正温柔地抚摸着狮子的嘴，这象征着通过精神力量和耐心而非武力来驯服猛兽。';

  @override
  String get tarotLoveMeaning8 => '这是一个需要包容力去接受和理解对方本来面貌的时期。';

  @override
  String get tarotLoveDetail8 =>
      '现在的爱情需要耐心和智慧。以宽大的胸怀接纳对方的缺点或牢骚时，关系会得到发展。你需要以温柔的态度引导对方，这种柔中带刚的姿态至关重要。如果你能持之以恒地守护在旁，你的真心最终会叩开对方的心扉。';

  @override
  String get tarotWealthMeaning8 => '持之以恒的储蓄和健康的消费习惯是积累财富的秘诀。';

  @override
  String get tarotWealthDetail8 =>
      '财运正缓慢上升。即使现在没有大笔资金进入，也不要失望，坚持管理资产，未来会积少成多。在投资方面，不要因为短期的波动而患得患失，保持定力会更有利。克制自己的冲动消费欲望是通往财富的捷径。';

  @override
  String get tarotSuccessMeaning8 => '即使遇到困难的课题或挑剔的上司，也能智慧地应对。';

  @override
  String get tarotSuccessDetail8 =>
      '虽然可能承担艰巨的项目或挑剔的任务，但你有足够的底气去解决它。你外柔内刚，凭借内在强大的意志一个个克服难关。你冷静解决问题的样子将赢得周围人的深厚信任。';

  @override
  String get tarotKeywords9 => '反省, 孤独, 探索, 智慧, 休息';

  @override
  String get tarotDesc9 => '在黑暗的雪山上，一位老人手持灯火独自站立，倾听内在的声音并探求真理。';

  @override
  String get tarotLoveMeaning9 => '这是一个需要独处时间或深度思考爱情的时期。';

  @override
  String get tarotLoveDetail9 =>
      '比起活跃的恋爱，现在更需要时间去反思自我。不要为了缓解孤独而随意约会，请深思自己真正想要的爱情是什么。即使有恋人，暂时保持距离、拥有各自的空间，反而有助于看清关系的本质。';

  @override
  String get tarotWealthMeaning9 => '金钱活动可能会有些萎缩。';

  @override
  String get tarotWealthDetail9 =>
      '在财富方面应采取保守态度。现在是守护资金比增加资金更重要的时期，仔细检查当前资产并堵住资金漏洞至关重要。相比之下，将费用支出在学习技能或提升自我价值上，是未来获得更大收益的极佳投资。';

  @override
  String get tarotSuccessMeaning9 => '在深入研究专业知识或技术的领域会取得成果。';

  @override
  String get tarotSuccessDetail9 =>
      '在研究、策划、开发等需要独自深入钻研的工作中能取得卓越成果。这是一个默默积累实力的时期，专注于业务本质而非职场人际关系会更有利。如果遇到无法解决的问题，请寻找经验丰富的导师寻求建议。';

  @override
  String get tarotKeywords10 => '命运, 变化, 机会, 循环, 转折点';

  @override
  String get tarotDesc10 =>
      '巨大的命运之轮正在转动，宣告着不可避免的命运流向和新周期的开始。四角有象征四元素的天使正在看书，意味着智慧与规律。';

  @override
  String get tarotLoveMeaning10 => '命运般的邂逅正等待着你。';

  @override
  String get tarotLoveDetail10 =>
      '像电影一样命运般的爱情会找上你。可能会发生偶然相遇、意外重逢等戏剧性事件，请保持心门敞开。单身的人可能遇到一见钟情的对象，恋爱中的人则会迎来关系更进一步的契机。请不要错过当前的大好趋势。';

  @override
  String get tarotWealthMeaning10 => '财运流向正在变好。';

  @override
  String get tarotWealthDetail10 =>
      '幸运女神正在向你微笑。意想不到的金钱进入，或投资产生收益，财运呈上升曲线。资金周转变得顺畅，你需要果断抓住机会。不过运气总是循环往复的，在财源广进时也别忘了为未来储蓄的智慧，以便在周期变化时保持从容。';

  @override
  String get tarotSuccessMeaning10 => '形势对你有利。';

  @override
  String get tarotSuccessDetail10 =>
      '这是将成为人生转折点的重要时期。停滞的事情变得顺畅，周围情况向有利于你的方向发展。晋升或跳槽等变化的机会将成为带你走向更高处的上升气流。顺势而为并勇敢抓住新机遇，会带来意想不到的好结果。';

  @override
  String get tarotKeywords11 => '公正, 平衡, 责任, 真理, 因果报应';

  @override
  String get tarotDesc11 => '身穿红衣的审判官右手持剑，左手持天平，进行客观且冷静的判断。这象征着对行为负责和维护正义。';

  @override
  String get tarotLoveMeaning11 => '这是一段理性先于感情的关系。';

  @override
  String get tarotLoveDetail11 =>
      '现在是需要理性判断而非感情用事的时期。请反思你与对方的关系是否平衡，你是否付出了太多或者只是一味索取。如果你在考虑结婚，可能会仔细权衡对方的条件和背景。坦诚公正的对话将是改善关系的良药。';

  @override
  String get tarotWealthMeaning11 => '在金钱交易或契约中需要仔细确认。';

  @override
  String get tarotWealthDetail11 =>
      '在金钱方面可能会发生需要分辨是非的事情。现在是清理债务、结算财务关系、理清财务状况的好时机。签订合同时请仔细检查是否有不利条款，比起走捷径，坚持诚实透明的原则会更好。';

  @override
  String get tarotSuccessMeaning11 => '获得公正评价并得到正当报酬。';

  @override
  String get tarotSuccessDetail11 =>
      '你的工作成果将获得公正且客观的评价。如果你一直以来努力工作，晋升或奖金等相应的报酬将会到来。在法律或会计等需要精确性的领域，你将大展身手。决策时请排除感情干扰，彻底基于数据和事实进行判断。';

  @override
  String get tarotKeywords12 => '牺牲, 耐心, 新视角, 停滞, 觉醒';

  @override
  String get tarotDesc12 => '倒吊在树上的男人通过自愿的苦难，以全新的视角观察世界并获得觉醒。他脑后的光环意味着精神上的成长。';

  @override
  String get tarotLoveMeaning12 => '关系可能停滞不前，或者单恋会持续较长时间。';

  @override
  String get tarotLoveDetail12 =>
      '你可能会因为恋爱进度缓慢而感到郁闷，但现在急于求成并不能解决问题。请暂时停下脚步，换个角度审视现状，反思自己是否在以自己的方式强求爱情。换位思考并给予对方体贴与耐心，最终将成为开启对方心扉的钥匙。';

  @override
  String get tarotWealthMeaning12 => '资金流向可能受阻，或者需要承担一定的损失。';

  @override
  String get tarotWealthDetail12 =>
      '你可能会感到财务上的阻塞。投资的资金被套牢或预定的收入延迟，但越是挣扎可能越是混乱，现在最好放宽心态静观其变。利用这段时间检查自己的消费习惯，重新树立对金钱的价值观。';

  @override
  String get tarotSuccessMeaning12 => '事情可能不会按计划进行，会出现延迟。';

  @override
  String get tarotSuccessDetail12 =>
      '项目中断或业务延迟可能会给你带来压力，但这并非失败，而是“暂停”的信号。不要强行推进，退后一步重新规划大局。打破固定观念时，你会产生别人想不到的奇思妙想，当前的试炼将带给你新的觉醒。';

  @override
  String get tarotKeywords13 => '终结, 变化, 重生, 离别, 新开始';

  @override
  String get tarotDesc13 =>
      '象征着旧事物的完全终结以及由此产生的新开始，表现了痛苦但不可避免的变化过程。死神骑马而来，为新道路的开启而清扫旧物。';

  @override
  String get tarotLoveMeaning13 => '意味着关系的终结或巨大的变化。';

  @override
  String get tarotLoveDetail13 =>
      '现在的关系可能已达极限。比起强求，更需要顺其自然放手的勇气。虽然离别是痛苦的，但在那尽头一定会有更好的新开始在等着你。请记住，只有完全摆脱过去的留恋或伤痛，才会有新的人进入你的生活空间。';

  @override
  String get tarotWealthMeaning13 => '可能会出现金钱损失或投资失败等艰难处境。';

  @override
  String get tarotWealthDetail13 =>
      '预计财务上会有巨大变化。你信任的投资处可能出现损失，或者因预料之外的支出而陷入困境，但这是改变以往低效资产管理方式的信号。请以此为契机，清理债务并彻底切断不必要的支出，为建立更健康、更稳定的财务结构打下基础。';

  @override
  String get tarotSuccessMeaning13 => '进行中的工作可能中断或失败。';

  @override
  String get tarotSuccessDetail13 =>
      '苦心经营的项目可能化为乌有，或在职场经历巨变。虽然眼下挫折感很大，但这是命运的启示，让你整理不适合自己的工作，寻找通往更大成功的道路。抛弃旧方式，以全新的心态开始，人生更精彩的下一章就会开启。';

  @override
  String get tarotKeywords14 => '平衡, 节制, 和谐, 治愈, 中道';

  @override
  String get tarotDesc14 => '一位天使在两个圣杯之间倒水，象征着现实与理想之间的完美平衡与和谐流动。';

  @override
  String get tarotLoveMeaning14 => '这是两个不同的人相遇并达成和谐的过程。';

  @override
  String get tarotLoveDetail14 =>
      '比起热烈的激情，淡淡而持久的爱情更适合这个时期。承认并互补彼此的差异，建立深厚的纽带。即使有争吵，也请用冷静的对话来化解。你温和体贴的态度会让对方感到安心，从而建立起稳定的关系。';

  @override
  String get tarotWealthMeaning14 => '平衡收支非常重要。';

  @override
  String get tarotWealthDetail14 =>
      '财运正处于稳定流向。与其追求横财，不如集中精力有效分配和管理现有资产，随着收入增加也要适度调节支出。投资方面建议进行风险管理的分散投资，持之以恒的管理最终会为你带来财富。';

  @override
  String get tarotSuccessMeaning14 => '调解不同意见并引导和谐的能力非常突出。';

  @override
  String get tarotSuccessDetail14 =>
      '在团队项目中出色地担任调解人角色，解决冲突并提高工作效率。你灵活的思维和适应力将获得周围认可。这是一个在工作与休息间寻找平衡、预防职业倦怠的明智期。统揽全局并循序渐进地推进将带来最佳结果。';

  @override
  String get tarotKeywords15 => '诱惑, 束缚, 执着, 物质主义, 成瘾';

  @override
  String get tarotDesc15 => '象征着自我约束的欲望与执着，以及只要下定决心就能摆脱、却往往深陷其中的物质诱惑。';

  @override
  String get tarotLoveMeaning15 => '意味着被强烈的肉体魅力吸引或产生执着的关系。';

  @override
  String get tarotLoveDetail15 =>
      '你可能会被异性的魅力强烈吸引，以至于难以做出理性判断。虽然一段火热的罗曼史可能开启，但也要注意不要陷入过度的执着与束缚中。请冷静反思自己的感情究竟是真爱还是单纯的占有欲，学会自我调节。';

  @override
  String get tarotWealthMeaning15 => '物质欲望过重，可能进行过激投资或在享乐上花费巨资。';

  @override
  String get tarotWealthDetail15 =>
      '当前是金钱诱惑较多的时期。请警惕被花言巧语蒙蔽而进行高风险投资，或因冲动消费导致财产受损。不要沦为金钱的奴隶而辜负周围人的信任。比起盲目投资，现在更应守护现有资产，克制过度的物欲。';

  @override
  String get tarotSuccessMeaning15 => '为了成功可能不择手段。';

  @override
  String get tarotSuccessDetail15 =>
      '对权力或名誉的渴望增强，可能会将周围同事视为单纯的竞争对手。注意不要为了成果而安排过载日程，甚至陷入损害健康的“工作狂”状态。请放下不劳而获的心态，诚实对待业务，努力从自我束缚中解脱出来。';

  @override
  String get tarotKeywords16 => '崩溃, 冲击, 急剧变化, 解放, 真相大白';

  @override
  String get tarotDesc16 =>
      '落雷直击塔顶，塔身崩塌，人们纷纷坠落。这象征着因突如其来的外部力量导致的旧价值观的破除，以及与新真相的邂逅。';

  @override
  String get tarotLoveMeaning16 => '关系可能面临巨大危机或突然分手。';

  @override
  String get tarotLoveDetail16 =>
      '恋爱战线上可能会发生晴天霹雳般的预料之外的事件。你可能会对信任的人感到失望，或者因无法承受的争吵导致关系彻底动摇，但请不要绝望。这是一个清理不健康关系或误会、面对真相的过程，废墟之上终将迎来建立更稳固爱情的机会。';

  @override
  String get tarotWealthMeaning16 => '需要应对突然的金钱损失或灾难。';

  @override
  String get tarotWealthDetail16 =>
      '财务上非常不稳定的时期。你可能会听到令人震惊的消息，如资金意外流失或投资项目崩溃，因此必须将资产转移到安全的地方并做好防范。然而，这种崩溃也将成为纠正错误经济观念的契机，触底之后将有机会建立不再崩塌的坚实基础。';

  @override
  String get tarotSuccessMeaning16 => '项目可能中断，或职场发生突然的人事变动等冲击性变化。';

  @override
  String get tarotSuccessDetail16 =>
      '你可能会感到苦心经营的高塔崩塌般的挫折感，但这并非因为你能力不足，而是因为不可避免的变化潮流。不要惊慌，冷静把握事态，抛弃旧系统并寻找新道路。如果能将当前的危机转化为机会进行重新整顿，你将能够向着更高处实现跨越。';

  @override
  String get tarotKeywords17 => '希望, 灵感, 治愈, 乐观主义, 愿望实现';

  @override
  String get tarotDesc17 => '在明亮的星光下，一位女子正在倒水。这象征着苦难之后到来的和平，以及对未来的希望与愿景。';

  @override
  String get tarotLoveMeaning17 => '遇到接近理想型的人，或恋爱梦想成真的时期。';

  @override
  String get tarotLoveDetail17 =>
      '像照亮黑夜的星星一样，你的爱情也会迎来闪耀的希望。你可能会遇到梦寐以求的理想型，你纯粹的魅力将深深吸引异性。过去痛苦的记忆现在已得到治愈，你会产生能够再次梦想新爱情的光明能量。';

  @override
  String get tarotWealthMeaning17 => '财运状况正逐渐好转。';

  @override
  String get tarotWealthDetail17 =>
      '财运开始向积极的方向流动。之前的经济困难正在缓解，你将看到一线曙光。通过创意想法可能会获得额外收入的机会。与其追求眼前的巨大利益，不如以长期眼光投资于未来价值高的地方，这种眼光将引导你走向财务稳定。';

  @override
  String get tarotSuccessMeaning17 => '创造性灵感迸发，获得广泛展示才华的机会。';

  @override
  String get tarotSuccessDetail17 =>
      '你的创意将大放异彩并赢得周围赞赏。特别是在艺术感、公关或营销领域，你能脱颖而出。这是一个启动梦寐以求项目的绝佳时机。如果你能自信地表达自我，就有机会获得大众喜爱或赢得名誉，请务必抓住这个好运。';

  @override
  String get tarotKeywords18 => '不安, 幻想, 暧昧, 直觉, 无意识';

  @override
  String get tarotDesc18 => '月光之下不安与暧昧共存，象征着看不见的背后真相与无意识的世界。正如雾气弥漫的夜晚，方向感变得模糊。';

  @override
  String get tarotLoveMeaning18 => '因无法了解对方心意而郁闷，容易产生误解和怀疑。';

  @override
  String get tarotLoveDetail18 =>
      '仿佛置身雾中，无法了解对方真心，这是一个不安的时期。细微的误解可能演变成巨大的怀疑，不安感甚至可能令你彻夜难眠，但与其急于求证，不如静观其变。比起在感情用事下执着于不确定的关系，理性思考并保持内心定力才是首要任务。';

  @override
  String get tarotWealthMeaning18 => '投资前景不明朗，存在诈骗风险。';

  @override
  String get tarotWealthDetail18 =>
      '金钱方面的视野变得模糊，极易被看似不错的投资信息或甜言蜜语所迷惑。看不见的地方可能隐藏着陷阱，因此现在是需要极度谨慎、如履薄冰的时期。与其开启新计划，不如维持现状，彻底的现实验证过程是守护财产的唯一途径。';

  @override
  String get tarotSuccessMeaning18 => '工作方向模糊，可能存在隐藏的敌人，是一个混乱的时期。';

  @override
  String get tarotSuccessDetail18 =>
      '你可能陷入看不见前方的渺茫处境，项目方向发生动摇，或者职场内的流言蜚语可能令你困扰，因此请务必注意言行。现在与其轻举妄动，不如等待形势明朗。不要盲目相信他人的话，默默守护自己的位置并做好心态管理会更好。';

  @override
  String get tarotKeywords19 => '成功, 幸福, 活力, 积极, 祝福';

  @override
  String get tarotDesc19 => '在灿烂的阳光下，小孩骑着白马挥舞旗帜，非常快乐。';

  @override
  String get tarotLoveMeaning19 => '将拥有一段受人祝福的灿烂幸福的恋情。';

  @override
  String get tarotLoveDetail19 => '完美而幸福的爱情与你同在。之前的误解或冲突消融，信任加深。';

  @override
  String get tarotWealthMeaning19 => '财运处于巅峰状态。';

  @override
  String get tarotWealthDetail19 => '守得云开见月明。财运非常强劲，做什么都能转化为收益。事业兴旺，投资大赚。';

  @override
  String get tarotSuccessMeaning19 => '你的能力获得认可并受到关注。';

  @override
  String get tarotSuccessDetail19 => '成功的号角响起。你一直以来的努力大放异彩，展现在世人面前。取得合格、晋升等成果。';

  @override
  String get tarotKeywords20 => '复活, 报偿, 消息, 决断, 重逢';

  @override
  String get tarotDesc20 => '当天使在空中吹响号角，棺木中的人们苏醒并欢呼。这象征着对过去努力的报偿，以及向新生命的觉醒。';

  @override
  String get tarotLoveMeaning20 => '可能会收到前任的消息，或获得重逢的机会。';

  @override
  String get tarotLoveDetail20 =>
      '你苦苦等待的消息即将到来。如果你一直无法忘记前任或渴望重逢，实现的几率非常高；迟迟没有进展的暧昧关系也可能迎来确定关系的果实。你可能会与过去认识的人重新建立联系，请倾听内心的声音，做出无悔的决断。';

  @override
  String get tarotWealthMeaning20 => '过去投资的地方可能产生收益，或者能收回借出的钱。';

  @override
  String get tarotWealthDetail20 =>
      '这是一个获得过去努力报偿的时期。被遗忘的股票可能上涨，或者收回原以为无法拿回的欠款，会有意想不到的横财运。你现在下的决定将极大地影响未来的财运，因此这是一个需要慎重且果断决策的时刻。';

  @override
  String get tarotSuccessMeaning20 => '过去的努力获得认可，有望晋升或获得奖励。';

  @override
  String get tarotSuccessDetail20 =>
      '审判之日已到。你之前流下的汗水将获得公正的评价和报偿，晋升或合格等喜讯将如号角般响起。这是一个摆脱停滞状态、再次飞翔的机会，可能会有猎头邀请或跳槽机会，请不要畏惧变化，抓住机遇开启新篇章。';

  @override
  String get tarotKeywords21 => '完成, 整合, 达成, 完美结局, 完美';

  @override
  String get tarotDesc21 =>
      '象征着在漫长的旅程之后完全达成目标、实现完美和谐的最高结局。四角的圣兽祝福着这个圆满的世界，同时也预示着新旅程的开始。';

  @override
  String get tarotLoveMeaning21 => '意味着爱情的圆满。能与理想的对象结合，迎接最幸福的时刻。';

  @override
  String get tarotLoveDetail21 =>
      '这是为长期的恋爱画上句点、步入婚姻这一新世界的完美时机。你们将确认彼此是最佳伴侣，并在祝福中享受合二为一的幸福。如果是单身，你可能遇到符合所有理想条件的真命天子。这也是一段在海外旅行或异国环境中结缘的运势。';

  @override
  String get tarotWealthMeaning21 => '达成目标金额，开始享受经济自由。';

  @override
  String get tarotWealthDetail21 =>
      '你达成了100%的财务目标，进入了享受经济自由的阶段。在美股或贸易等全球领域有望获得巨大收益，你的投资组合实现了完美和谐并带来稳定收益。现在请在享受富足的同时，向着更广阔的世界拓宽视野。';

  @override
  String get tarotSuccessMeaning21 => '圆满完成项目，获得最高荣誉。';

  @override
  String get tarotSuccessDetail21 =>
      '这是你职业生涯登上顶峰的时期。你完美地完成了受命的项目并获得最高赞誉。你达成了所有预定目标，并准备向更广阔的世界迈进。由于你的活动舞台有望扩展到全球（如留学或海外就业），请以当前的成功为踏板，描绘更远大的梦想并实现飞跃。';

  @override
  String get supplementRecordPrompt => '请服用营养剂并记录！';

  @override
  String get snoozeQuestion => '什么时候再次提醒您？';

  @override
  String get hoursShort => '小时';

  @override
  String get minutesShort => '分';

  @override
  String get after => '后';

  @override
  String snoozeMessage(int minutes) {
    return '闹钟将在 $minutes 分钟后再次响。';
  }

  @override
  String timesTaken(int count) {
    return '已服用 $count 次';
  }

  @override
  String dailyGoalTimes(int goal) {
    return '目标：每天 $goal 次';
  }

  @override
  String get didYouTakeSupplement => '您服用营养剂了吗？';

  @override
  String get viewMissionRecords => '查看任务记录';

  @override
  String get setTakingGoal => '设置摄入目标';

  @override
  String get times => '次';

  @override
  String get dailyTakingGoal => '每日摄入目标';

  @override
  String get howManyTimesADay => '您一天服用几次营养剂？';

  @override
  String get setGoalMl => '设置目标 (ml)';

  @override
  String get sleepAnalysis => '睡眠分析';

  @override
  String get todaysSleep => '今日睡眠';

  @override
  String get sleepDuration => '睡眠时长';

  @override
  String get wakeUpTime => '起床时间';

  @override
  String get weeklySleepPattern => '每周睡眠模式';

  @override
  String get sleepAdvice => '您保持着规律的睡眠习惯。比昨天早睡了30分钟！';

  @override
  String get stopwatch => '秒表';

  @override
  String get lap => '计圈';

  @override
  String get stop => '停止';

  @override
  String lapLabel(int index) {
    return '第 $index 圈';
  }

  @override
  String get monday => '周一';

  @override
  String get tuesday => '周二';

  @override
  String get wednesday => '周三';

  @override
  String get thursday => '周四';

  @override
  String get friday => '周五';

  @override
  String get saturday => '周六';

  @override
  String get sunday => '周日';

  @override
  String get policy => '服务条款和隐私政策';

  @override
  String get support => '客户支持';

  @override
  String get defaultAlarmBehavior => '默认闹钟行为';

  @override
  String get defaultAlarmVolume => '默认闹钟音量';

  @override
  String get defaultAlarmVolumeDescription => '创建新闹钟时应用的默认音量。';

  @override
  String get gradualVolumeDescription => '设置闹钟声音逐渐增大。';

  @override
  String get defaultVibration => '默认振动';

  @override
  String get defaultVibrationDescription => '创建新闹钟时默认启用振动。';

  @override
  String get defaultInterval => '默认间隔';

  @override
  String get maxSnoozeCountLabel => '最大重复次数';

  @override
  String get minutes => '分钟';

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
  String get selectionComplete => '选择完成';

  @override
  String get selectVibration => '选择震动模式';

  @override
  String get cameraMissionSequentialImageError => '请按顺序设置任务图片。';

  @override
  String get copyEmailAction => '复制电子邮件地址';

  @override
  String get addMissionTitle => '添加新任务';

  @override
  String get recommendedMissionList => '推荐任务';

  @override
  String get recommendedMissionDesc => '为健康一天准备的推荐任务。';

  @override
  String get all => '全部';

  @override
  String get allMissions => '全部任务';

  @override
  String categoryMissions(String category) {
    return '$category 任务';
  }

  @override
  String get deselectAll => '取消全选';

  @override
  String get selectAll => '全选';

  @override
  String get myCustomMissions => '我的自定义任务';

  @override
  String get myCustomMissionsDesc => '添加你之前创建过的任务。';

  @override
  String get createYourOwnMission => '创建自己的任务';

  @override
  String get createYourOwnMissionDesc => '没有想要的任务时，可以自己新增一个。';

  @override
  String get missionNameHint => '输入任务名称（例：去健身房）';

  @override
  String get selectCategory => '选择分类';

  @override
  String get getNotification => '接收通知';

  @override
  String get missionCategoryHealth => '健康';

  @override
  String get missionCategoryStudy => '学习';

  @override
  String get missionCategoryRoutine => '日常';

  @override
  String get missionCategoryHobby => '兴趣';

  @override
  String get missionCategoryOther => '其他';

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
  String get weatherSource => '气象数据来源：权威气象机构';

  @override
  String get locationPermissionTitle => '允许位置权限';

  @override
  String get locationPermissionDesc => '显示天气信息所必需。';

  @override
  String get hourlyForecast => '逐小时预报';

  @override
  String get weeklyForecast => '一周预报';

  @override
  String hourFormat(String hour) {
    return '$hour 时';
  }

  @override
  String get noNotifications => '暂无新通知。';

  @override
  String get adLoadFailed => '广告加载失败';

  @override
  String get adLoading => '广告加载中…';

  @override
  String get removeAds => '移除广告';

  @override
  String get close => '关闭';

  @override
  String get exitQuestion => '要退出应用吗？';

  @override
  String get exitApp => '退出';

  @override
  String get shareResultDescription => '这是 Fortune Alarm 分析出的运势结果。';

  @override
  String get shareResultButton => '分享结果';

  @override
  String get unknownTime => '时间未知';

  @override
  String get adLoadError => '无法加载广告，请稍后重试。';

  @override
  String get adShowError => '无法展示广告，请稍后重试。';

  @override
  String earnCookies(int count) {
    return '获得 $count 个幸运饼干！ 🎉';
  }

  @override
  String get freePassAfterTimeout => '广告超时，本次免费为你展示结果！ 🎉';

  @override
  String get adLoadDelay => '广告加载较慢，请稍等…';

  @override
  String get fortuneAccessTitle => '查看运势';

  @override
  String get fortuneAccessSubtitle => '查看你的运势结果\n领取隐藏惊喜！';

  @override
  String get watchAdButtonText => '看广告免费查看';

  @override
  String useCookiesButtonText(int count) {
    return '使用 $count 个幸运饼干';
  }

  @override
  String get adFailFreePass => '广告失败，本次直接免费解锁。';

  @override
  String get luckyNumberTitle => '我的幸运数字';

  @override
  String get luckyNumberSubtitle => 'AI 为你生成的今日幸运数字';

  @override
  String get luckyNumberGenerateButton => '生成幸运数字';

  @override
  String get luckyNumberGuideText => '通过 Fortune Alarm 的 AI 算法\n发现属于你的幸运数字';

  @override
  String get luckyNumberAnalysisStep1 => '正在收集运势数据…';

  @override
  String get luckyNumberAnalysisStep2 => '分析近期数字规律…';

  @override
  String get luckyNumberAnalysisStep3 => '评估出现概率…';

  @override
  String get luckyNumberAnalysisStep4 => '研究几何序列…';

  @override
  String get luckyNumberAnalysisStep5 => '应用 AI 权重预测…';

  @override
  String get luckyNumberAnalysisStep6 => '计算最优组合…';

  @override
  String get luckyNumberAnalysisStep7 => '分析完成，正在生成数字…';

  @override
  String get luckyNumberAnalysisFinal => '正在处理最终数据…';

  @override
  String get luckyNumberAnalyzing => '能量分析中...';

  @override
  String get luckyNumberGeometric => '几何分析...';

  @override
  String get luckyNumberPatterns => '模式匹配...';

  @override
  String get luckyNumberEnergy => '能量协调中...';

  @override
  String get luckyNumberCompleted => '分析完成！';

  @override
  String get luckyNumberShare => '分享结果';

  @override
  String get luckyNumberRestart => '重试';

  @override
  String get luckyNumberGenerating => '生成中…';

  @override
  String get luckyNumberResultTitle => '你的幸运数字已出炉';

  @override
  String get luckyNumberResultSubtitle => '把好运带走吧';

  @override
  String get luckyNumberDisclaimer => '＊本服务仅供娱乐。数字由 AI 算法生成，仅供参考，不保证中奖。';

  @override
  String get luckyNumberShareTitle => '分享幸运数字';

  @override
  String get luckyNumberShareDescription => 'Fortune Alarm 分析出的幸运数字。';

  @override
  String luckyNumberSetLabel(String label) {
    return '第 $label 组';
  }

  @override
  String get luckyNumberRegenerateButton => '重新生成';

  @override
  String get luckyNumberFeatureAiTitle => 'AI 分析';

  @override
  String get luckyNumberFeatureAiDesc => '综合你的信息与当日能量，生成专属数字。';

  @override
  String get luckyNumberFeatureSmartTitle => '更聪明的筛选';

  @override
  String get luckyNumberFeatureSmartDesc => '结合概率与规律，避开重复与噪声。';

  @override
  String get luckyNumberFeatureDataTitle => '数据与直觉结合';

  @override
  String get luckyNumberFeatureDataDesc => '用数据做底，用直觉点睛。';

  @override
  String get fortunePassTitle => 'Fortune Pass Premium';

  @override
  String get fortunePassTabFree => '免费';

  @override
  String get fortunePassTabPremium => '高级';

  @override
  String get fortunePassFreeChargeTitle => '免费补充饼干';

  @override
  String get fortunePassFreeChargeButton => '去免费补充';

  @override
  String get fortunePassActivePlan => '当前套餐';

  @override
  String get fortunePassNoSubscription => '未订阅';

  @override
  String get fortunePassRestore => '恢复购买';

  @override
  String get fortunePassMonth1Title => '1 个月';

  @override
  String get fortunePassMonth1Desc => '适合短期体验';

  @override
  String get fortunePassMonth6Title => '6 个月';

  @override
  String get fortunePassMonth6Desc => '更划算的半年计划';

  @override
  String get fortunePassYear1Title => '1 年';

  @override
  String get fortunePassYear1Desc => '年度最优选择';

  @override
  String get fortunePassBestPlan => '最受欢迎';

  @override
  String fortunePassTimeSaleLabel(int percent) {
    return '$percent% 限时特惠！';
  }

  @override
  String fortunePassOffLabel(int percent) {
    return '$percent% OFF';
  }

  @override
  String get fortunePassPerMonth => ' /月';

  @override
  String fortunePassTotalPrice(String price, String unit) {
    return '总计 $price$unit';
  }

  @override
  String get fortunePassUnitMonth => '月';

  @override
  String get fortunePassUnit6Months => '6 个月';

  @override
  String get fortunePassUnitYear => '年';

  @override
  String get fortunePassMyCookies => '我的饼干';

  @override
  String get fortunePassCurrentStatus => '当前状态';

  @override
  String get fortunePassStatusPremium => '高级';

  @override
  String get fortunePassStatusFree => '免费';

  @override
  String get fortunePassStoreErrorTitle => '商店错误';

  @override
  String get fortunePassStoreErrorContent => '暂时无法连接商店，请稍后重试。';

  @override
  String fortunePassSubscribeSale(int percent) {
    return '订阅享 $percent% 优惠';
  }

  @override
  String get fortunePassSubscribeNow => '立即订阅';

  @override
  String get fortunePassApplied => '已生效';

  @override
  String get fortunePassApplyFailed => '应用失败';

  @override
  String get fortunePassRestored => '已恢复购买';

  @override
  String get fortunePassRestoreFailed => '恢复失败';

  @override
  String get fortunePassTimeSaleTitle => '限时特惠';

  @override
  String fortunePassTimeSalePriceOriginal(String price) {
    return '原价 $price';
  }

  @override
  String fortunePassTimeSalePriceDiscount(String price) {
    return '特惠 $price';
  }

  @override
  String get fortunePassTimeSaleBadge => '限时';

  @override
  String get fortunePassTimeSaleButton => '去订阅';

  @override
  String get fortunePassTimeSaleCancel => '稍后再说';

  @override
  String get fortunePassTimeSaleStartMessage => '3 分钟限时优惠已开始！请查看顶部横幅。';

  @override
  String get fortunePassSubscribeButton => '订阅';

  @override
  String get fortunePassSubscribeDiscountButton => '订阅（优惠）';

  @override
  String get fortunePassCookieBalance => '饼干余额';

  @override
  String fortunePassCookieCount(int count) {
    return '$count';
  }

  @override
  String get fortunePassActive => '已激活';

  @override
  String fortunePassTotalFormat(String price, String unit) {
    return '总计 ₩$price / $unit';
  }

  @override
  String get fortunePassPopularPlan => '热门套餐';

  @override
  String get fortunePassPricePerMonth => ' /月';

  @override
  String get fortunePassPaymentFailed => '支付失败';

  @override
  String get fortunePassSubscriptionFailed => '订阅失败';

  @override
  String get fortunePassSubscriptionSuccess => '订阅成功';

  @override
  String get fortunePassCannotSubscribeTitle => '无法订阅';

  @override
  String get fortunePassCannotSubscribeMessage => '当前状态下无法订阅，请稍后重试或检查商店登录状态。';

  @override
  String get year => '年';

  @override
  String get month => '月';

  @override
  String get day => '日';

  @override
  String get sajuProfileTitle => '四柱资料';

  @override
  String get sajuNameLabel => '姓名';

  @override
  String get sajuNameHint => '请输入姓名';

  @override
  String get sajuNameHelper => '用于保存与展示结果';

  @override
  String get sajuGenderLabel => '性别';

  @override
  String get sajuGenderMale => '男';

  @override
  String get sajuGenderFemale => '女';

  @override
  String get sajuBirthDateLabel => '出生日期';

  @override
  String get sajuBirthTimeLabel => '出生时间';

  @override
  String get sajuUnknownTime => '时间未知';

  @override
  String get sajuEditComplete => '保存完成';

  @override
  String get sajuSolar => '阳历';

  @override
  String get sajuLunar => '农历';

  @override
  String get sajuSelectBirthDate => '选择出生日期';

  @override
  String get sajuSelectBirthTime => '选择出生时间';

  @override
  String get compatibilityTitle => '合盘/相性';

  @override
  String get compatibilityInputHeader => '输入信息';

  @override
  String get compatibilityInputSubtitle => '看看你们的缘分与契合度';

  @override
  String get compatibilityMyInfo => '我的信息';

  @override
  String get compatibilityInputMyNameGuide => '请输入你的名字';

  @override
  String get compatibilityInputPartnerNameGuide => '请输入对方的名字';

  @override
  String get compatibilityPartnerInfo => '对方信息';

  @override
  String get compatibilityLoadSaved => '读取已保存';

  @override
  String get compatibilityTitleBest => '天作之合';

  @override
  String get compatibilityDescBest => '默契十足，相处自然，彼此成就。';

  @override
  String get compatibilityDescBest_Youth =>
      '你们两位是分享青涩且热情的爱情的最佳伙伴。看到你们支持彼此的梦想并共同成长的样子真的很美！你们是通过分享学习或职业方面的烦恼，给彼此带来积极影响的关系。如果能像现在这样珍惜和爱护对方，你们就是可以共同克服任何困难的天作之合。';

  @override
  String get compatibilityDescBest_Mature =>
      '这是在人生的重要阶段成为彼此坚实后盾的最佳契合。你们可以建立在信任基础上的稳定且深厚的爱情。在共同解决现实问题的过程中，你们会更强烈地感受到彼此的珍贵，由于价值观一致，你们是规划未来时最好的伴侣。';

  @override
  String get compatibilityDescBest_Senior =>
      '作为人生伴侣，你们是成为彼此温暖安慰和避风港的最佳缘分。即使不言语，心也能相通，有着深厚的情感交流。这是在照顾彼此健康和平静的同时，享受悠闲生活的成熟关系。你们尊重并包容彼此人生智慧的样子，是周围人学习的典范。';

  @override
  String get compatibilityTitleGreat => '非常合拍';

  @override
  String get compatibilityDescGreat => '互补又能理解，越相处越舒服。';

  @override
  String get compatibilityDescGreat_Youth =>
      '你们是给彼此带来积极能量的非常好的缘分。在一起时会感到非常愉快和幸福，甚至感觉不到时间的流逝。虽然有时会因为各自的个性而产生冲突，但你们有着充满活力的关系，可以通过对话迅速和好并发展成更深厚的关系。';

  @override
  String get compatibilityDescGreat_Mature =>
      '你们是可以共同明智地应对现实问题的优秀伙伴。这是一种通过填补彼此不足来产生协同效应的关系。作为在平衡工作、爱情和家庭的同时支持彼此成长的成熟情侣，你们有着稳定的契合度，在一起的时间越长，协同效应就越明显。';

  @override
  String get compatibilityDescGreat_Senior =>
      '你们是非常好的伙伴，可以在照顾彼此健康和平静的同时享受悠闲的生活。彼此的存在本身就是巨大的力量和安慰。这是一种通过分享爱好或散步等微小的日常生活来建立深厚情感纽带的关系。你们是细心照顾彼此健康的温暖情分。';

  @override
  String get compatibilityTitleGood => '不错的缘分';

  @override
  String get compatibilityDescGood => '只要多沟通，就能很稳定地走下去。';

  @override
  String get compatibilityDescGood_Youth =>
      '你们是品味和价值观非常契合的一对。虽然有时会斗嘴，但这个过程甚至也会成为更深入了解彼此的宝贵时间。如果能发挥将彼此的差异视为个性并稍微让步的美德，你们就有着足以持续幸福恋爱的良好契合度。';

  @override
  String get compatibilityDescGood_Mature =>
      '你们是在尊重彼此价值观的同时和谐相处的一对。你们可以在现实和理想之间保持良好平衡的同时培养爱情。虽然有时会因为各自的固执而产生矛盾，但由于对彼此的信任深厚，你们有着可以毫无大碍地克服这些问题的稳固关系。';

  @override
  String get compatibilityDescGood_Senior =>
      '你们是基于长期的经验和智慧包容彼此的和谐一对。通过分享微小的日常生活，你们可以享受平静的幸福。这是一种在尊重和体谅彼此生活习惯的同时，像朋友一样舒适相处的关系。只要可靠地守护在彼此身边，就是足够令人满意的纽带。';

  @override
  String get compatibilityTitleEffort => '需要用心';

  @override
  String get compatibilityDescEffort => '需要磨合，但也有成长的空间。';

  @override
  String get compatibilityDescEffort_Youth =>
      '由于在不同的环境中成长，有很多需要磨合的地方。需要努力先理解对方的心情，而不是只坚持自己的主张。坦率地表达情感并增加对话时间，以免微小的误会变大，这将对维持关系有很大帮助。';

  @override
  String get compatibilityDescEffort_Mature =>
      '由于各自的主见都很明确，可能会产生冲突点。尊重彼此的生活方式并稍微让步是维持关系的关键。当因为现实问题产生矛盾时，这个时期需要冷静地整理彼此立场，而不是感情用事。';

  @override
  String get compatibilityDescEffort_Senior =>
      '由于长期固定的生活习惯差异，可能会感到不便。认可彼此的领域并保持体谅的心，是建立舒适关系的捷径。不要只坚持自己的方式，需要一颗首先考虑对方舒适度的温暖的心。请尝试集中精力提高共同度过的时光的质量。';

  @override
  String get compatibilityTitleDifficult => '挑战较多';

  @override
  String get compatibilityDescDifficult => '容易误会与摩擦，建议放慢节奏好好沟通。';

  @override
  String get compatibilityDescDifficult_Youth =>
      '性格或生活方式的差异可能会让人感觉很明显。需要学会通过冷静的对话来认可彼此的差异，而不是感情用事。比起试图改变对方，接受对方原本样子的耐心将是关系的钥匙。';

  @override
  String get compatibilityDescDifficult_Mature =>
      '由于价值观差异或现实问题，烦恼可能会加深。需要深刻的理解和耐心，认可彼此差异的意志很重要。不要对彼此期待过高，尝试从微小的事情开始感恩。改变沟通方式也可能是一个很好的解决方案。';

  @override
  String get compatibilityDescDifficult_Senior =>
      '由于彼此都很固执，沟通可能会遇到困难。接受对方现在的样子而不是被过去的经历所束缚是很重要的。一句温暖的话语而不是沉默可能是改善关系的开始。在尊重彼此独立性的同时保持最低限度礼貌的态度是必要的。';

  @override
  String get compatibilityAdvice_Youth =>
      '多花时间分享和支持彼此的梦想。共同积累多样化的经验，如开始新的爱好或去旅行，将为关系注入巨大的活力。对话时，请先共情而不是指责。';

  @override
  String get compatibilityAdvice_Mature =>
      '即使在忙碌的日常生活中，确保只有两个人的时间也很重要。认可彼此的辛劳并说一句温暖的话。需要保持一种不忘记恋爱初期悸动的态度，比如庆祝纪念日或定期约会。';

  @override
  String get compatibilityAdvice_Senior =>
      '在共同照顾健康的同时，享受散步或轻旅行。分享彼此的人生智慧并建立情感纽带是很好的。增加可以共同舒适休息的时间，而不是过度的活动。细心检查并关心彼此的健康状况非常重要。';

  @override
  String get compatibilityLuck_Youth =>
      '你们的能量相结合，创造了可以在学业或事业上取得巨大成就的运势。彼此成为对方的幸运符，计划的事情进展顺利，充满良好的气息。';

  @override
  String get compatibilityLuck_Mature =>
      '这是一种在共同管理资产或规划未来时会有好运随之而来的契合。协同效应非常好，有很强的财运和成功运，经济稳定和社会地位可以共同提升。';

  @override
  String get compatibilityLuck_Senior =>
      '这是一种情感稳定和平静常驻的运势。彼此成为对方最好的健康补充剂，气运中充满了长寿和健康度过平静晚年的福分。这是一种对后代也有积极影响的有德缘分。';

  @override
  String get tarotLoveMeaning0_Senior => '与其寻找新的刺激，不如在日常生活的微小变化中寻找乐趣。';

  @override
  String get tarotLoveDetail0_Senior =>
      '与其制定宏伟的计划，不如向周围的人分享你长期积累的知识和才华。在帮助或建议他人的过程中，你会感受到巨大的成就感和深厚的纽带。';

  @override
  String get tarotLoveMeaning1_Senior => '睿智而冷静的谈话会让关系更加深厚。';

  @override
  String get tarotLoveDetail1_Senior =>
      '倾听并共情对方就足够了。如果不急躁地慢慢分享心声，即使不用言语，也能感受到相通的深厚纽带。花点时间修身养性。';

  @override
  String get tarotLoveMeaning2_Senior => '宽容的心会让周围的人感到幸福。';

  @override
  String get tarotLoveDetail2_Senior =>
      '温暖的母亲般的心照顾周围的人。对配偶或家人的一句温暖的话语会成为巨大的力量回到你身边。家中充满平安，所以请以轻松的心情享受日常生活。';

  @override
  String get tarotLoveMeaning3_Senior => '负责任的态度守护着家庭的和谐。';

  @override
  String get tarotLoveDetail3_Senior =>
      '在家庭中站稳脚跟并领导。有时可能需要严厉，但最终，这必须基于对家人深厚的爱。你的奉献和努力会给家人带来安全感。';

  @override
  String get tarotLoveMeaning4_Senior => '重视传统和礼仪，保持稳定的关系。';

  @override
  String get tarotLoveDetail4_Senior =>
      '长期坚持的价值观或规则给关系带来稳定性。倾听周围人的建议，但不要失去你的信念。礼貌和尊重的态度会给对方深厚的信任感。';

  @override
  String get tarotLoveMeaning5_Senior => '在选择的十字路口需要谨慎。';

  @override
  String get tarotLoveDetail5_Senior =>
      '专注于你现在珍贵的关系，而不是周围的诱惑或新的变化。当你的心动摇时，反思你丰富的人生经验会有所帮助。正确的选择最终会带来和平的未来。';

  @override
  String get tarotLoveMeaning6_Senior => '以坚强的意志克服困难，实现和谐。';

  @override
  String get tarotLoveDetail6_Senior =>
      '即使产生冲突，也不要放弃，通过谈话来解决。你坚定的意志和耐心最终会结出硕果。在设定目标并共同努力的过程中，会建立起更牢固的纽带。';

  @override
  String get tarotLoveMeaning7_Senior => '用耐心和仁慈让关系变得顺滑。';

  @override
  String get tarotLoveDetail7_Senior =>
      '需要温和的劝说和理解而不是强迫。你成熟的态度会打动对方的心。与其生气，不如多一点微笑的余暇。';

  @override
  String get tarotLoveMeaning8_Senior => '在孤独中发现真正的自我并获得智慧。';

  @override
  String get tarotLoveDetail8_Senior =>
      '花点时间独处并回顾过去的人生也是好的。在寂静中获得的感悟会让未来的关系更加丰富。不要急躁，慢慢面对自己。';

  @override
  String get tarotLoveMeaning9_Senior => '顺应命运的流动，接受改变。';

  @override
  String get tarotLoveDetail9_Senior =>
      '即使发生意想不到的变化，也不要慌张。这可能是为了更好的未来而进行的过程。如果你以积极的心态接受改变，新的运气会找到你的关系。';

  @override
  String get tarotLoveMeaning10_Senior => '冷静的判断和公正的态度建立信任。';

  @override
  String get tarotLoveDetail10_Senior =>
      '以客观的视角看待情况，而不是偏向情感。公正诚实的态度会让你受到周围人的尊重。明辨是非，但不要忘记温暖的关怀。';

  @override
  String get tarotLoveMeaning11_Senior => '耐心和牺牲会换来更大的爱。';

  @override
  String get tarotLoveDetail11_Senior =>
      '默默守护你的位置并奉献自己而不是期待立即回报。你的诚意最终会传达给对方并给人留下深刻印象。如果你明智地度过困难局面，最终会看到光明。';

  @override
  String get tarotLoveMeaning12_Senior => '倒空不必要的东西，准备新的开始。';

  @override
  String get tarotLoveDetail12_Senior =>
      '放下过去的执着或旧习惯。新的希望和能量会填满倒空的地方。不要害怕改变，勇敢地迈出一步。';

  @override
  String get tarotLoveMeaning13_Senior => '通过节制和和谐保持和平的关系。';

  @override
  String get tarotLoveDetail13_Senior =>
      '重要的是控制你的心并保持平衡，不要做得太过分。当你承认彼此的差异并努力实现和谐时，真正的和平就会到来。在简单的日常生活中寻找幸福。';

  @override
  String get tarotLoveMeaning14_Senior => '需要理性控制而不是本能欲望。';

  @override
  String get tarotLoveDetail14_Senior =>
      '追求自由舒适的关系，而不是执着或束缚。你应该努力拨开你心中的阴影，走向光明的地方。爱自己是改善关系的开始。';

  @override
  String get tarotLoveMeaning15_Senior => '即使在突然的变化中也要保持坚定的中心。';

  @override
  String get tarotLoveDetail15_Senior =>
      '可能会产生意想不到的冲突，但这反而是重新整理关系的机会。如果你不慌不忙地冷静应对，你将能够建立更牢固的纽带。';

  @override
  String get tarotLoveMeaning16_Senior => '希望的星光灿烂地照耀着你的关系。';

  @override
  String get tarotLoveDetail16_Senior =>
      '艰难时期过后和平与安息到来。梦想积极的未来并共同规划。你开朗的能量会给周围的人带来巨大的喜悦。';

  @override
  String get tarotLoveMeaning17_Senior => '摆脱焦虑，相信你的直觉前进。';

  @override
  String get tarotLoveDetail17_Senior =>
      '首先考虑对彼此的信任，而不是心中的疑虑。就像雾散后的晴空一样，随着时间的推移，真相会显露出来。需要冷静等待而不急躁的智慧。';

  @override
  String get tarotLoveMeaning18_Senior => '在灿烂的阳光下充满喜悦和祝福。';

  @override
  String get tarotLoveDetail18_Senior =>
      '充满活力和积极能量。与家人或熟人度过愉快的时光，享受幸福。你开朗的微笑会融化所有的冲突。';

  @override
  String get tarotLoveMeaning19_Senior => '看到你努力的成果，准备新的飞跃。';

  @override
  String get tarotLoveDetail19_Senior =>
      '随着你的努力得到认可而感到收获。可能会听到好消息，所以请以开放的心态接受。是时候整理过去，走向新的希望了。';

  @override
  String get tarotLoveMeaning20_Senior => '实现圆满与和谐，享受最好的幸福。';

  @override
  String get tarotLoveDetail20_Senior =>
      '长途跋涉结束时获得的平安和满足感满溢。在实现完美和谐的同时享受日常的幸福，不再有更多奢求。你的智慧将是照亮周围的光。';

  @override
  String get tarotLoveMeaning21_Senior => '以自由纯洁的心享受日常的乐趣。';

  @override
  String get tarotLoveDetail21_Senior =>
      '尝试以不受束缚的自由精神与周围的人相处。新的邂逅或经历会给你的生活注入活力。拥有一颗以轻松心情看世界的余暇。';

  @override
  String get tarotWealthMeaning0_Senior => '这是一个需要稳定资产管理和分享智慧的时期。';

  @override
  String get tarotWealthDetail0_Senior =>
      '与其进行新的投资，不如专注于守护和管理现有资产。基于你的经验，为家人或周围的人提供经济帮助或建议，也将是非常有意义的。';

  @override
  String get tarotWealthMeaning1_Senior => '有望通过利用知识和经验创造收益。';

  @override
  String get tarotWealthDetail1_Senior =>
      '你积累已久的专业知识或技能可能会转化为经济价值。不要急躁，冷静地等待机会，将会取得丰硕的成果。';

  @override
  String get tarotWealthMeaning2_Senior => '享受与家人分享丰饶成果的喜悦。';

  @override
  String get tarotWealthDetail2_Senior =>
      '这是财富聚集在家庭中并寻求稳定的时期。你宽广的心胸会让周围感到温暖，这份福气也会回到你身边。请以悠闲的心情享受日常生活。';

  @override
  String get tarotSuccessMeaning0_Senior => '与其追求新的挑战，不如追求圆满的收尾，这更为重要。';

  @override
  String get tarotSuccessDetail0_Senior =>
      '专注于整理和总结一直以来取得的成果。你的成功不在于结果，而在于过程中展现的诚实与智慧。请向周围传播正能量。';

  @override
  String get tarotSuccessMeaning1_Senior => '内心的平静和精神上的成长是真正的成功。';

  @override
  String get tarotSuccessDetail1_Senior =>
      '与其追求社会地位或名誉，不如关注你内心的平静。通过冥想或阅读等方式，抽出时间修身养性。深刻的洞察力将使你更加闪耀。';

  @override
  String get tarotSuccessMeaning2_Senior => '家庭的和谐与健康是最高的成就。';

  @override
  String get tarotSuccessDetail2_Senior =>
      '能与家人和谐相处并保持健康，就已经是足够成功的人生了。在琐碎的日常中寻找幸福，并心存感激。你的存在本身就是家人的巨大力量。';

  @override
  String get tarotWealthMeaning3_Senior => '负责任的资产运营将带来家族的繁荣。';

  @override
  String get tarotWealthDetail3_Senior =>
      '通过稳定的收入来源和计划性的消费，保持家庭财务的稳定。你的经济智慧将成为子女们的重要教训。';

  @override
  String get tarotWealthMeaning4_Senior => '这是采用传统储蓄和管理方式更有利的时期。';

  @override
  String get tarotWealthDetail4_Senior =>
      '建议采用经过验证的资产管理方式，而不是复杂的金融产品。谨慎而保守的态度是守护财产的关键。';

  @override
  String get tarotWealthMeaning5_Senior => '在与财富相关的选择中发挥人生智慧。';

  @override
  String get tarotWealthDetail5_Senior => '与其贪心，不如满足于现状并注重内涵。正确的选择将保障晚年的安宁。';

  @override
  String get tarotWealthMeaning6_Senior => '通过耐心可以克服困难的经济状况。';

  @override
  String get tarotWealthDetail6_Senior =>
      '虽然可能会有暂时的资金压力，但如果明智应对，可以将危机转化为机遇。请减少不必要的支出。';

  @override
  String get tarotWealthMeaning7_Senior => '这是一个通过施予获得更大丰饶的时期。';

  @override
  String get tarotWealthDetail7_Senior =>
      '如果在周围积德，财运会从意想不到的地方降临。分享的喜悦将使你的生活更加丰富。';

  @override
  String get tarotWealthMeaning8_Senior => '在简朴的生活中领悟真正财富的意义。';

  @override
  String get tarotWealthDetail8_Senior =>
      '与其追求物质上的丰饶，不如寻找内心的从容。节制的生活反而会带来经济上的稳定。';

  @override
  String get tarotWealthMeaning9_Senior => '财运流转的时期，请灵活应对。';

  @override
  String get tarotWealthDetail9_Senior =>
      '可能会出现意想不到的收益或支出。如果顺应变化并明智地运营资产，就不会有太大问题。';

  @override
  String get tarotWealthMeaning10_Senior => '公正透明的财产管理会提升信任。';

  @override
  String get tarotWealthDetail10_Senior =>
      '在继承或赠与等财产问题上坚持原则非常重要。正直的态度可以防止纠纷并带来和平。';

  @override
  String get tarotWealthMeaning11_Senior => '与其追求眼前利益，不如为未来做出牺牲，这是更有价值的时期。';

  @override
  String get tarotWealthDetail11_Senior =>
      '为子女或后代提供的经济支持将来会成为巨大的欣慰。请保持耐心并维持长期视角。';

  @override
  String get tarotWealthMeaning12_Senior => '放下对财富的执着，寻找内心的平静。';

  @override
  String get tarotWealthDetail12_Senior =>
      '你将体验到通过清空反而获得充实的神秘经历。放下不必要的占有欲，以轻松的心情对待日常生活。';

  @override
  String get tarotWealthMeaning13_Senior => '平衡的消费习惯将带来经济自由。';

  @override
  String get tarotWealthDetail13_Senior =>
      '追求收入与支出的和谐，并警惕过度的贪心。节制的生活将为您带来持续的稳定。';

  @override
  String get tarotWealthMeaning14_Senior => '战胜物质诱惑，进行理性的判断。';

  @override
  String get tarotWealthDetail14_Senior =>
      '应警惕甜蜜的投资建议或盲目的扩张。相信你丰富的经验并慎重决定，是守护财产之路。';

  @override
  String get tarotWealthMeaning15_Senior => '冷静应对突然的经济变化。';

  @override
  String get tarotWealthDetail15_Senior =>
      '越是危机时刻，越需要回归基本的智慧。不要慌张，仔细检查资产状态以尽量减少损失。';

  @override
  String get tarotWealthMeaning16_Senior => '财运的明亮星光照耀着你的前程。';

  @override
  String get tarotWealthDetail16_Senior =>
      '经济困难得到解决，稳定趋势开始的时期。请以积极的心态规划未来并享受安宁。';

  @override
  String get tarotWealthMeaning17_Senior => '不要被不确定的信息迷惑，相信直觉。';

  @override
  String get tarotWealthDetail17_Senior =>
      '需要耐心等待财富相关的迷雾散去、真相显现。比起急于决定，不如留出时间观察。';

  @override
  String get tarotWealthMeaning18_Senior => '在丰饶的财运中充满喜悦的时期。';

  @override
  String get tarotWealthDetail18_Senior =>
      '对努力的充分回报随之而来，经济上变得宽裕。请与周围的人分享幸福，度过受祝福的时光。';

  @override
  String get tarotWealthMeaning19_Senior => '获得应有的回报，并制定新的经济计划。';

  @override
  String get tarotWealthDetail19_Senior =>
      '长期的诚实努力被认可为经济成果的时刻。整理过去，为稳定的未来迈出新的一步。';

  @override
  String get tarotWealthMeaning20_Senior => '财运圆满，享受无以复加的丰饶。';

  @override
  String get tarotWealthDetail20_Senior =>
      '经济稳定达到巅峰，晚年生活得到保障。是你智慧的资产管理发光发热的时刻。';

  @override
  String get tarotWealthMeaning21_Senior => '享受不被金钱束缚的自由丰饶。';

  @override
  String get tarotWealthDetail21_Senior =>
      '与其追求物质占有，不如将价值放在生活乐趣上的时期。以悠闲的心情享受世界，财富自然会随之而来。';

  @override
  String get tarotSuccessMeaning3_Senior => '人生的阅历发光发热，赢得尊重的时期。';

  @override
  String get tarotSuccessDetail3_Senior =>
      '你的领导力和智慧将成为周围人的榜样。与其依靠权威，不如用包容力来引导，这样才能体会到真正的成功。';

  @override
  String get tarotSuccessMeaning4_Senior => '坚守长久以来信念的你，其人生本身就是成功。';

  @override
  String get tarotSuccessDetail4_Senior =>
      '矢志不渝坚守的价值观结出硕果的时刻。你坚持原则的生活将成为指引后辈正确道路的里程碑。';

  @override
  String get tarotSuccessMeaning5_Senior => '确立正确的价值观将决定人生后半程的成功。';

  @override
  String get tarotSuccessDetail5_Senior =>
      '在名誉与利益之间需要做出明智选择的时期。基于你丰富的经验所做的决定将保障平和的未来。';

  @override
  String get tarotSuccessMeaning6_Senior => '坚持不懈的努力最终将带来胜利。';

  @override
  String get tarotSuccessDetail6_Senior =>
      '任何障碍都无法动摇你的意志. 不放弃并不断前进的你，本身就已经是一份巨大的成功。';

  @override
  String get tarotSuccessMeaning7_Senior => '内心的坚韧体现为柔和的人格魅力。';

  @override
  String get tarotSuccessDetail7_Senior =>
      '这是以柔克刚的时期. 当你用耐心和慈爱包容周围时，你的名誉将进一步提升。';

  @override
  String get tarotSuccessMeaning8_Senior => '孤独修行后获得的智慧是最高的成就。';

  @override
  String get tarotSuccessDetail8_Senior =>
      '这是领悟他人无法看到的深奥真理的时刻. 安静的反思时间将使你成为更加成熟、有深度的人。';

  @override
  String get tarotSuccessMeaning9_Senior => '乘着变化的浪潮，抓住新的机遇。';

  @override
  String get tarotSuccessDetail9_Senior =>
      '这是人生开启新篇章的时期. 不要害怕改变，积极地接受它，你将获得意想不到的巨大成果。';

  @override
  String get tarotSuccessMeaning10_Senior => '大公无私的态度让你的名誉更加闪耀。';

  @override
  String get tarotSuccessDetail10_Senior =>
      '比起私利，追求正义的姿态会赢得周围的尊重。你的正直最终将成为开启最大成功的钥匙。';

  @override
  String get tarotSuccessMeaning11_Senior => '不畏牺牲的高尚精神将获得胜利。';

  @override
  String get tarotSuccessDetail11_Senior =>
      '即使现在很辛苦，这也是为了崇高目标而忍耐的时期. 你的奉献将来会作为美丽的成功留在历史和人们的记忆中。';

  @override
  String get tarotSuccessMeaning12_Senior => '放下旧的成功标准，寻找新的价值。';

  @override
  String get tarotSuccessDetail12_Senior =>
      '比起执着于过去的荣光，领悟当下的珍贵更为重要. 通过清空获得的和平才是真正人生的成功。';

  @override
  String get tarotSuccessMeaning13_Senior => '和谐与节制的美学完成的时期。';

  @override
  String get tarotSuccessDetail13_Senior =>
      '不偏不倚、平衡的生活是最高的美德. 你节制的姿态将向周围传播和平与稳定。';

  @override
  String get tarotSuccessMeaning14_Senior => '克服内心的阴影并获得自由才是成功。';

  @override
  String get tarotSuccessDetail14_Senior =>
      '从束缚自己的桎梏中解脱，寻找真正的自我. 在获得内心自由的瞬间，你将成为世界上最成功的人。';

  @override
  String get tarotSuccessMeaning15_Senior => '需要将危机转化为机遇的大胆气魄。';

  @override
  String get tarotSuccessDetail15_Senior =>
      '突然的变化是让你变得更加坚强的过程. 冷静应对并建立新秩序时，会随之而来更大的成就。';

  @override
  String get tarotSuccessMeaning16_Senior => '梦想希望的未来，获得新的灵感。';

  @override
  String get tarotSuccessDetail16_Senior =>
      '疲惫的灵魂得到安息，产生新梦想的时期. 你创造性的能量将照亮周围并结出幸福的果实。';

  @override
  String get tarotSuccessMeaning17_Senior => '相信直觉，默默走你自己的路。';

  @override
  String get tarotSuccessDetail17_Senior =>
      '即使在混乱的情况下，也要倾听内心的声音. 随着时间的推移，你的选择将被证明是正确的。';

  @override
  String get tarotSuccessMeaning18_Senior => '充满生命力的能量带来最高的成就。';

  @override
  String get tarotSuccessDetail18_Senior =>
      '身心健康、充满活力的时期. 与周围分享正能量，享受生命的喜悦，这才是真正的成功。';

  @override
  String get tarotSuccessMeaning19_Senior => '响应召唤，承担新的社会角色。';

  @override
  String get tarotSuccessDetail19_Senior =>
      '会出现需要你的经验和智慧的地方. 带着新的使命感为社会做出贡献时，你会感受到更大的意义和成功。';

  @override
  String get tarotSuccessMeaning20_Senior => '完成人生旅程，实现完美的和谐。';

  @override
  String get tarotSuccessDetail20_Senior =>
      '这是一种无需再追求什么的完美满足和平静状态. 你的生活本身将成为一件作品，给周围的人带来深切的感动。';

  @override
  String get tarotSuccessMeaning21_Senior => '不受束缚的自由生活是最高的成功。';

  @override
  String get tarotSuccessDetail21_Senior =>
      '摆脱世俗的标准，享受你自己的幸福. 像在世间旅行一样以轻松的心情生活的你，才是真正的胜利者。';

  @override
  String get compatibilityResultButton => '查看结果';

  @override
  String get compatibilityDeleteTooltip => '删除';

  @override
  String get compatibilityGenderMale => '男';

  @override
  String get compatibilityGenderFemale => '女';

  @override
  String get compatibilityInputTitle => '输入合婚信息';

  @override
  String get tojeongInputTitle => '土亭秘诀输入';

  @override
  String tojeongCheckFortune(int year) {
    return '查看 $year 年土亭秘诀';
  }

  @override
  String get tojeongInputGuide => '输入姓名与信息，生成当年运势。';

  @override
  String tojeongViewResult(int year) {
    return '查看 $year 年结果';
  }

  @override
  String get tojeongCheckButton => '开始查看';

  @override
  String get tojeongSaveAndCheck => '保存并查看';

  @override
  String get tojeongYearSelect => '选择年份';

  @override
  String tojeongResultTitle(int year) {
    return '$year 年土亭秘诀结果';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return '$name 的 $year 年运势';
  }

  @override
  String tojeongGua(String gua) {
    return '卦 ($gua)';
  }

  @override
  String get tojeongTotalLuck => '总运';

  @override
  String get tojeongProcess => '解析中';

  @override
  String get tojeongResult => '结果';

  @override
  String get tojeongMonthlyLuck => '月运';

  @override
  String get tojeongShareResult => '分享结果';

  @override
  String tojeongShareTitle(int year) {
    return '$year 年土亭秘诀';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return '$name 的土亭秘诀结果：\n\n$desc';
  }

  @override
  String get tojeongShareTargetYear => '目标年份';

  @override
  String get sajuDeleteTitle => '删除确认';

  @override
  String sajuDeleteConfirm(String name) {
    return '确定要删除 $name 的资料吗？';
  }

  @override
  String get sajuProfileSelect => '选择资料';

  @override
  String get add => '添加';

  @override
  String get modify => '修改';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '$title 功能正在准备中';
  }

  @override
  String get fortuneUnderConstructionSubtitle => '我们正在打磨细节，敬请期待。';

  @override
  String get goBack => '返回';

  @override
  String get name => '姓名';

  @override
  String get nameInputGuide => '请输入姓名';

  @override
  String get sajuLunarSolar => '农历/阳历';

  @override
  String sajuBirthDateDisplay(int year, int month, int day) {
    return '$year.$month.$day';
  }

  @override
  String get sajuSelectFortuneYear => '选择运势年份';

  @override
  String sajuYearDisplay(int year) {
    return '$year 年';
  }

  @override
  String get sajuSelectProfile => '选择资料';

  @override
  String get male => '男';

  @override
  String get female => '女';

  @override
  String get newYearFortuneInputTitle => '新年运势输入';

  @override
  String newYearFortuneHeader(int year) {
    return '$year 年新年运势';
  }

  @override
  String get newYearFortuneSubHeader => '为你总结一整年的走向与重点';

  @override
  String newYearFortuneViewButton(int year) {
    return '查看 $year 年运势';
  }

  @override
  String get newYearFortuneCheckButton => '开始查看';

  @override
  String get newYearFortuneSaveAndCheckButton => '保存并查看';

  @override
  String newYearFortuneResultTitle(int year) {
    return '$year 年新年运势结果';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return '$year 年新年运势';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return '$name 的新年运势结果：\n\n$desc';
  }

  @override
  String get sajuChartTitle => '四柱盘';

  @override
  String get sajuHour => '时';

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
    return '你的主导五行：$name（$symbol）';
  }

  @override
  String get ohaengDisclaimer => '＊五行解读仅供娱乐参考。';

  @override
  String yearlyTotalLuck(int year) {
    return '$year 年总运';
  }

  @override
  String get fortuneDisclaimer => '＊运势内容仅供娱乐参考，不保证准确性。';

  @override
  String get compatibilityResultTitle => '合盘结果';

  @override
  String get compatibilityScore => '契合度';

  @override
  String compatibilityScoreDisplay(int score) {
    return '$score';
  }

  @override
  String get compatibilityShareTitle => '我们的相性';

  @override
  String get compatibilityShareResult => '分享结果';

  @override
  String get compatibilityRetryButton => '换个人再测一次';

  @override
  String get compatibilitySummary => '总结';

  @override
  String get compatibilitySectionLuck => '运势协同';

  @override
  String get compatibilitySectionAdvice => '关系建议';

  @override
  String get compatibilitySectionPositive => '积极方面';

  @override
  String get compatibilitySectionCaution => '注意事项';

  @override
  String get compatibilityLunarDisclaimer =>
      '※ 目前阴历生日是按阳历基准分析的。为了更准确的分析，今后将更新阴历转换功能。';

  @override
  String get tojeongSaveAndCheckButton => '保存并查看土亭秘诀年运';

  @override
  String get tojeongSangsuKeyword1 => '需要强大行动力与领导力的时期';

  @override
  String get tojeongSangsuKeyword2 => '人缘活跃、充满欢喜的时期';

  @override
  String get tojeongSangsuKeyword3 => '智慧与热情闪耀的时期';

  @override
  String get tojeongSangsuKeyword4 => '变化迅速、适合新开始的时期';

  @override
  String get tojeongSangsuKeyword5 => '需要灵活与温和沟通的时期';

  @override
  String get tojeongSangsuKeyword6 => '以智慧与耐心度过难关的时期';

  @override
  String get tojeongSangsuKeyword7 => '追求稳定、积蓄内在力量的时期';

  @override
  String get tojeongSangsuKeyword8 => '以包容与温暖累积福德的时期';

  @override
  String get tojeongJungsuKeyword1 => '将遇到贵人指点';

  @override
  String get tojeongJungsuKeyword2 => '合约与协议更容易成功';

  @override
  String get tojeongJungsuKeyword3 => '迎来新鲜又令人兴奋的挑战';

  @override
  String get tojeongJungsuKeyword4 => '事业成就与荣誉可期';

  @override
  String get tojeongJungsuKeyword5 => '需要谨慎理财与节制开销';

  @override
  String get tojeongJungsuKeyword6 => '健康与身心状态要优先照顾';

  @override
  String get tojeongHasuKeyword1 => '你将获得显著的成功。';

  @override
  String get tojeongHasuKeyword2 => '稳扎稳打会迎来回报。';

  @override
  String get tojeongHasuKeyword3 => '耐心能把挑战化为机会。';

  @override
  String tojeongCoreMessage(String sangsu, String jungsu, String hasu) {
    return '今年的旅程：先是 $sangsu，随后 $jungsu，最终走向 $hasu。';
  }

  @override
  String get tojeongSangsuDetail1 =>
      '天时地利相助的一年，决心越坚定，收获越明显。适合主导与开拓，但别忘了谦逊与包容，才能走得更远。';

  @override
  String get tojeongSangsuDetail2 =>
      '社交与喜事增多的一年，人气上升但也要注意言辞，避免口舌。聚会或活动中可能遇到重要缘分。';

  @override
  String get tojeongSangsuDetail3 => '才智与热情最亮眼的一年，学业与创作容易出彩。保持节奏与专注，避免过劳。';

  @override
  String get tojeongSangsuDetail4 => '变化快速的一年，非常适合开启新计划。忙碌中也要坚持收尾，把开始的事做成做稳。';

  @override
  String get tojeongSangsuDetail5 => '以柔克刚的一年，灵活应对能顺利化解阻碍。适合拓展人脉与合作，但关键时刻要果断。';

  @override
  String get tojeongSangsuDetail6 => '需要沉住气的一年，像行舟深水，静中蓄势。避免冒险投资，等待更合适的时机再出手。';

  @override
  String get tojeongSangsuDetail7 =>
      '像翻山越岭的一年，过程辛苦但终点是更广阔的机会。把重心放在稳定与信任，长期会见成果。';

  @override
  String get tojeongSangsuDetail8 => '播种之年，温暖与包容会换来信任与尊重。家庭与长期投入会带来更持久的安稳与富足。';

  @override
  String get tojeongJungsuDetail1 => '贵人出现，带来消息与机会。过往阻碍会逐步化解，合作会成为关键助力。';

  @override
  String get tojeongJungsuDetail2 => '家庭与居所更有喜气，文书、合约与交易更顺利。保持沟通清晰温和，结果会更好。';

  @override
  String get tojeongJungsuDetail3 => '可能迎来出行或新地点的新机会。带着信心去尝试，会收获超出预期的回报。';

  @override
  String get tojeongJungsuDetail4 => '努力被认可，容易有升职或嘉奖。考试与证书也更有利，适合大胆展示实力。';

  @override
  String get tojeongJungsuDetail5 => '财运潜力强，但花钱诱惑也大。做好预算，避免冲动消费，资金往来尽量专业透明。';

  @override
  String get tojeongJungsuDetail6 => '把身心健康放第一位，避免过劳，保证休息。现在的主动保养能减少未来问题。';

  @override
  String get tojeongHasuDetail1 => '最终你会达成目标并收获成功，努力会被看见并得到回报。坚持初心，成果才能更长久。';

  @override
  String get tojeongHasuDetail2 => '路上或有波折，但只要坚持，回报会更甜。成功会在合适的时间自然绽放。';

  @override
  String get tojeongHasuDetail3 => '可能遇到意外阻碍，但你的韧性会把麻烦变成机会。保持冷静专注，转祸为福。';

  @override
  String get tojeongGeneralWealthGood => '财运不错，可能有意外之财或投资回报。但进出都快，建议多存一点。';

  @override
  String get tojeongGeneralWealthBad =>
      '财运起伏较大，减少不必要支出，养成储蓄习惯。投资与借贷要谨慎，必要时咨询专业人士。';

  @override
  String get tojeongGeneralCareerGood => '事业运走强，努力更容易被认可。适合争取机会、扩展职责或挑战更高目标。';

  @override
  String get tojeongGeneralCareerBad => '事业上容易遇到阻碍或误会，建议稳住节奏、做好沟通与复盘，避免冲动换方向。';

  @override
  String get tojeongGeneralLoveGood => '感情运顺畅，关系更容易升温。主动表达与温柔沟通会带来更深的连结。';

  @override
  String get tojeongGeneralLoveBad => '感情上易敏感或误会，建议多沟通、少猜测，给彼此一点空间与时间。';

  @override
  String get optional => '可选';

  @override
  String get sajuSolarHint => '土亭秘诀年运以农历生日分析更准确。';

  @override
  String get yourFortune => '你的运势';

  @override
  String get guaUpper => '上';

  @override
  String get guaMiddle => '中';

  @override
  String get guaLower => '下';

  @override
  String get guaCode => '卦码';

  @override
  String get viewAgain => '再测一次';

  @override
  String get zodiacAries => '白羊座';

  @override
  String get zodiacTaurus => '金牛座';

  @override
  String get zodiacGemini => '双子座';

  @override
  String get zodiacCancer => '巨蟹座';

  @override
  String get zodiacLeo => '狮子座';

  @override
  String get zodiacVirgo => '处女座';

  @override
  String get zodiacLibra => '天秤座';

  @override
  String get zodiacScorpio => '天蝎座';

  @override
  String get zodiacSagittarius => '射手座';

  @override
  String get zodiacCapricorn => '摩羯座';

  @override
  String get zodiacAquarius => '水瓶座';

  @override
  String get zodiacPisces => '双鱼座';

  @override
  String get elementFire => '火';

  @override
  String get elementEarth => '土';

  @override
  String get elementAir => '风';

  @override
  String get elementWater => '水';

  @override
  String get compatibilityCategoryZodiac => '生肖相性';

  @override
  String get compatibilityCategoryInner => '内在相性';

  @override
  String get compatibilityCategoryConstellation => '星座相性';

  @override
  String get compatibilitySummarySamhap => '最佳生肖组合（三合）';

  @override
  String compatibilityDescSamhap(String animal1, String animal2) {
    return '$animal1 与 $animal2 属于天生互补，彼此能补短扬长，在一起更容易形成强大的协同。';
  }

  @override
  String get compatibilitySummaryYukhap => '非常合拍（六合）';

  @override
  String compatibilityDescYukhap(String animal1, String animal2) {
    return '$animal1 与 $animal2 彼此吸引力强，初见就容易产生连结与好感。';
  }

  @override
  String get compatibilitySummaryChung => '需要磨合（冲）';

  @override
  String compatibilityDescChung(String animal1, String animal2) {
    return '$animal1 与 $animal2 气质差异较大，容易起冲突。尊重差异、多体谅会更顺。';
  }

  @override
  String get compatibilitySummaryWonjin => '需要理解（怨嗔）';

  @override
  String get compatibilityDescWonjin => '有时会莫名觉得委屈或难过，建议多沟通，减少误会与猜测。';

  @override
  String get compatibilitySummaryDefaultZodiac => '一般生肖组合';

  @override
  String compatibilityDescDefaultZodiac(String animal1, String animal2) {
    return '$animal1 与 $animal2 大体相处顺畅，没有明显的大冲突。';
  }

  @override
  String get compatibilitySummaryCheonganHap => '命中注定的灵魂伴侣';

  @override
  String get compatibilityDescCheonganHap =>
      '你们的性格和价值观完美契合。你们是那种无需言语就能心领神会的灵魂伴侣。';

  @override
  String get compatibilitySummarySangsaeng => '相辅相成的伙伴关系';

  @override
  String get compatibilityDescSangsaeng => '一种积极的关系，你们会自然地支持彼此，并帮助对方成长。';

  @override
  String get compatibilitySummarySanggeuk => '需要动态平衡的关系';

  @override
  String get compatibilityDescSanggeuk => '虽然可能存在性格差异，但你们拥有独特的潜力，可以互补彼此的优缺点。';

  @override
  String get compatibilitySummaryDefaultInner => '天生的好朋友';

  @override
  String get compatibilityDescDefaultInner =>
      '基于相似倾向和共同兴趣建立的关系，让你们在一起的时光轻松而舒适。';

  @override
  String get compatibilitySummarySameElement => '志同道合的相遇';

  @override
  String compatibilityDescSameElement(String element) {
    return '共有‘$element’倾向意味着你们的价值观和行为方式非常同步。';
  }

  @override
  String get compatibilitySummaryCompatibleElement => '和谐的平衡';

  @override
  String get compatibilityDescCompatibleElement => '一段美妙的关系，你们不同的魅力完美地融合在一起。';

  @override
  String get compatibilitySummaryIncompatibleElement => '迷人的差异';

  @override
  String get compatibilityDescIncompatibleElement =>
      '你们不同的气质起初可能让你们感到陌生，但它们为共同成长和探索提供了无限可能。';

  @override
  String get compatibilitySummaryDefaultConstellation => '中等和谐';

  @override
  String get compatibilityDescDefaultConstellation => '从星座角度看，整 体属于比较合拍的关系。';

  @override
  String get routineMorningTitle => '清爽的早晨！ ☀️';

  @override
  String get routineMorningBody => '您忘记了今天计划的常规任务吗？';

  @override
  String get routineEveningTitle => '今天辛苦了！ ✨';

  @override
  String get routineEveningBody => '您完成今天的任务了吗？结束您的常规流程吧。';

  @override
  String get routineCheckTitle => '检查今天的任务！ 🚀';

  @override
  String get routineCheckBody => '遵守常规任务，度过愉快的一天。';

  @override
  String get supplementNotificationTitle => '营养剂提醒';

  @override
  String get waterNotificationTitle => '喝水提醒';

  @override
  String get routineNotificationTitle => '日常常规通知';

  @override
  String get routineNotificationDescription => '早晚接收通知，跟上您的常规任务。';

  @override
  String get morningRoutineTime => '早间例行时间';

  @override
  String get eveningRoutineTime => '晚间例行时间';

  @override
  String get todaysFortuneNotificationTitle => '今日运势';

  @override
  String get afternoonFortuneNotificationBody => '下午的运势如何？现在就去看看吧！';

  @override
  String get morningFortuneNotificationBody => '查看今日运势，开启元气满满的一天！';

  @override
  String get fortunePassExpiryTitle => '财富通行证今日到期';

  @override
  String get fortunePassExpiryBody => '您的财富通行证会员资格今日到期。请续费以继续享受优惠！';

  @override
  String get takeNow => '现在服用';

  @override
  String get later => '稍后';

  @override
  String get turnOffAlarmAction => '关闭闹钟';

  @override
  String get todaysFortuneNotification => '今日运势通知';

  @override
  String get enableNotification => '启用通知';

  @override
  String get fortuneNotificationDescription => '在指定时间通知您今日的运势。';

  @override
  String get morningNotificationTime => '上午通知时间';

  @override
  String get afternoonNotificationTime => '下午通知时间';

  @override
  String get morningFortuneTitle => '今日运势 (上午)';

  @override
  String get afternoonFortuneTitle => '今日运势 (下午)';

  @override
  String get type => '类型';

  @override
  String get supplementChannelDesc => '营养剂摄入通知频道。';

  @override
  String get waterChannelDesc => '饮水习惯通知频道。';

  @override
  String get waterSummaryTitle => '饮水通知';

  @override
  String get dailyRoutineChannelDesc => '每日任务和习惯养成通知频道。';

  @override
  String get dailyRoutineSummaryTitle => '每日例行通知';

  @override
  String get missionChannelName => '任务通知';

  @override
  String get missionChannelDesc => '一般任务执行通知频道。';

  @override
  String get fortuneChannelName => '运势通知';

  @override
  String get fortuneChannelDesc => '每日早晨运势检查通知频道。';

  @override
  String get subscriptionChannelName => '订阅通知';

  @override
  String get subscriptionChannelDesc => 'Fortune Pass 到期及订阅相关通知频道。';

  @override
  String get alarmChannelName => '闹钟';

  @override
  String get alarmChannelDesc => '起床及任务执行闹钟频道。';

  @override
  String get shareViaKakao => '通过 KakaoTalk 分享';

  @override
  String get shareViaSNS => '通过其他 SNS 分享 (Instagram, Twitter 等)';

  @override
  String get checkDetailResult => '查看详细结果';

  @override
  String get viewMyFortuneResult => '查看我的运势结果';

  @override
  String get takeSupplementNow => '请服用营养剂！';

  @override
  String get takeNowQuestion => '您想现在服用吗？';

  @override
  String get eatNow => '现在服用';

  @override
  String get eatLater => '以后服用';

  @override
  String snoozeMessageGeneric(int minutes) {
    return '我将在 $minutes 分钟后再次提醒您。';
  }

  @override
  String get hours => '小时';

  @override
  String get cheeringMessage4 => '充满活力的早晨，快乐的开始！';

  @override
  String get cheeringMessage5 => '愿您拥有微笑的一天。';

  @override
  String get cheeringMessage6 => '今天也加油吧！';

  @override
  String get cheeringMessage7 => '您今天会足够闪耀的。';

  @override
  String get cheeringMessage8 => '感觉会有好事发生！';

  @override
  String get cheeringMessage9 => '今天也辛苦了。充满活力的开始！';

  @override
  String get cheeringMessage10 => '幸福总是在您身边。';

  @override
  String get cheeringMessage11 => '正在为您今天的梦想加油。';

  @override
  String get cheeringMessage12 => '清爽的早晨，愉快的一天！';

  @override
  String get cheeringMessage13 => '在今天取得胜利吧！';

  @override
  String get cheeringMessage14 => '您的存在本身就是珍贵的。';

  @override
  String get cheeringMessage15 => '愿您度过充满愉快事物的一天。';

  @override
  String get cheeringMessage16 => '愿您今天的一天闪闪发光！';

  @override
  String get cheeringMessage17 => '您的微笑照亮了世界。';

  @override
  String get cheeringMessage18 => '做您自己吧！';

  @override
  String get cheeringMessage19 => '以心动的心情开始今天。';

  @override
  String get cheeringMessage20 => '美好的一天正在等待着您。';

  @override
  String get cheeringMessage21 => '用积极的力量度过今天！';

  @override
  String get cheeringMessage22 => '正在为您前进的道路加油。';

  @override
  String get cheeringMessage23 => '让今天成为您最好的一天！';

  @override
  String get cheeringMessage24 => '愿好运伴随您！';

  @override
  String get cheeringMessage25 => '今天也度过温暖的一天。';

  @override
  String get cheeringMessage26 => '您能做到的！';

  @override
  String get cheeringMessage27 => '带着感恩的心情开始今天。';

  @override
  String get cheeringMessage28 => '您的价值是无限的。';

  @override
  String get cheeringMessage29 => '愿您的一天笑容满面。';

  @override
  String get cheeringMessage30 => '和好人一起度过愉快的时光！';

  @override
  String get cheeringMessage31 => '今天离梦想又近了一步！';

  @override
  String get cheeringMessage32 => '今天的您是最酷的。';

  @override
  String get cheeringMessage33 => '奇迹般的一天将会到来。';

  @override
  String get cheeringMessage34 => '今天请悠闲地享受您的一天。';

  @override
  String get cheeringMessage35 => '您的努力不会背叛您。';

  @override
  String get cheeringMessage36 => '今天也度过健康的一天。';

  @override
  String get cheeringMessage37 => '您生来就是为了被爱！';

  @override
  String get cheeringMessage38 => '今天也要勇敢！';

  @override
  String get cheeringMessage39 => '光明的未来正在等待着您。';

  @override
  String get cheeringMessage40 => '度过充满激情的一天！';

  @override
  String get cheeringMessage41 => '愿您的内心平静。';

  @override
  String get cheeringMessage42 => '今天寻找小小的幸福吧。';

  @override
  String get cheeringMessage43 => '您已经做得很好了。';

  @override
  String get cheeringMessage44 => '带着希望开始今天。';

  @override
  String get cheeringMessage45 => '您的善良对他人的巨大力量。';

  @override
  String get cheeringMessage46 => '今天也度过充实的一天。';

  @override
  String get cheeringMessage47 => '您有改变世界的力量。';

  @override
  String get cheeringMessage48 => '晴朗的一天！';

  @override
  String get cheeringMessage49 => '尽情展现您的魅力吧。';

  @override
  String get cheeringMessage50 => '让今天的一天充满幸福吧！';

  @override
  String get locationServiceDisabled => '位置服务已禁用。';

  @override
  String get locationPermissionDenied => '位置权限被拒绝。';

  @override
  String get locationPermissionPermanentlyDenied => '位置权限被永久拒绝。';

  @override
  String get deleteMissionTitle => '删除任务';

  @override
  String get yesDelete => '是的，删除';

  @override
  String get waterAlarmTitle => '该喝水了！ 💧';

  @override
  String get waterAlarmBody => '为了您的健康，来一杯凉水怎么样？';

  @override
  String get supplementAlarmBody => '别忘了吃今天的营养补充剂。';

  @override
  String get waterHabitChannelDesc => '喝水习惯的通知频道。';

  @override
  String get pleaseSolveMath => '请解决问题。';

  @override
  String detectedLabel(String labels) {
    return '[检测到: $labels]';
  }

  @override
  String get defaultSleepDuration => '7小时30分';

  @override
  String get year2024Name => '甲辰年（青龙年）';

  @override
  String get year2025Name => '乙巳年（青蛇年）';

  @override
  String get year2026Name => '丙午年（红马年）';

  @override
  String supportEmailSubject(String appTitle, String title) {
    return '[$appTitle 咨询] $title';
  }

  @override
  String get summary => '摘要';

  @override
  String get monthlySummary => '月度摘要';

  @override
  String monthlySuccessRate(
      int month, String percentage, int success, int total) {
    return '$month月 成功率: $percentage% ($success/$total)';
  }

  @override
  String noMonthlyRecord(int month) {
    return '$month月 无记录';
  }

  @override
  String get missionRecord => '任务记录';

  @override
  String get supplementRecord => '补充剂记录';

  @override
  String get timeSaleCatchChance => '抓住 50% 的折扣机会！';
}
