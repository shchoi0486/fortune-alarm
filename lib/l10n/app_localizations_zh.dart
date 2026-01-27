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
  String snoozeInfo(int minutes, int count) {
    return '$interval分钟, $count次';
  }

  @override
  String snoozeInfoUnlimited(int minutes) {
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
    return '今日运势要点';
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
  String get no => '否';

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
  String get mouthExpressionOpen => '坦率的神情预示着诚实，但在敏感场合请注意言辞。';

  @override
  String overallHeadlineSimple(String topKey, String bottomKey) {
    return '今天的重点是 $topKey，需要注意的一点是 $bottomKey。';
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
  String get fortunePass => 'Fortune Pass';

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
  String missionSnoozeMessage(int minutes) {
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
  String get cuckooClock => '布谷钟';

  @override
  String get calmAlarm => '舒缓闹钟';

  @override
  String get doorKnock => '敲门声';

  @override
  String get earlySunrise => '清晨日出';

  @override
  String get goodMorningSound => '早安';

  @override
  String get inAHurry => '匆忙';

  @override
  String get lovingYou => '爱着你';

  @override
  String get sirenSound => '警报声';

  @override
  String get swingingSound => '摇摆';

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
  String snoozeMinutesUnlimited(int minutes) {
    return '$minutes 分钟（不限次数）';
  }

  @override
  String snoozeMinutesCount(int minutes, int current, int total) {
    return '$minutes 分钟（$current/$total）';
  }

  @override
  String get ringtone_fluttering_day => '心动的一天';

  @override
  String get ringtone_cozy_day => '温暖的一天';

  @override
  String get ringtone_sensible_day => '理性的一天';

  @override
  String get ringtone_play_with_me => '和我玩';

  @override
  String get ringtone_refreshing_day => '清爽的一天';

  @override
  String get ringtone_new_beginning => '新的开始';

  @override
  String get ringtone_self_love => '爱自己';

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
  String get tarotName3 => '皇后';

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
  String get tarotKeywords1 => '创造力、意志、能力、实现、灵活';

  @override
  String get tarotDescription1 =>
      '魔术师身披红袍，一手指天、一手指地，象征将灵感落地成现实。桌上摆着权杖、圣杯、宝剑与金币，意味着你早已具备达成目标所需的工具与能力。';

  @override
  String get tarotLoveMeaning1 => '魅力值拉满的一天，更容易被人注意与喜欢。若有心动对象，真诚与机智会推动关系升温。';

  @override
  String get tarotLoveDetail1 =>
      '当你的自信与才华闪光时，机会也会跟着出现。喜欢的人就大胆靠近，轻松幽默的交流会让对方更愿意靠近你。单身者容易迎来邀约；有伴者适合主动规划约会或制造小惊喜，让感情更有温度。';

  @override
  String get tarotWealthMeaning1 => '适合把想法变现的一天。将计划落地，会带来实际的收益回报。';

  @override
  String get tarotWealthDetail1 =>
      '知识、技能与创意都可能转化为金钱。除了固定收入，也可以尝试副业或自由接单。你在判断与规划上更容易命中重点，适合做预算、配置资金或梳理长期理财计划。';

  @override
  String get tarotSuccessMeaning1 => '能力容易被看见与认可。想做的事，今天适合真正开始行动。';

  @override
  String get tarotSuccessDetail1 =>
      '你会更像舞台中央的主角：遇到问题也能用机智与沟通化解。无论是重要汇报、新项目还是考试准备，只要你愿意站出来，就更容易拿到好结果。相信自己，稳稳把事情做完。';

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
  String get defaultVibration => '默认振动';

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
  String categoryMissions(Object category) {
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
  String get notificationTime => '通知时间';

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
  String hourFormat(Object hour) {
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
    return '总计';
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
  String get fortunePassStatusPremium => 'Premium';

  @override
  String get fortunePassStatusFree => 'Free';

  @override
  String get fortunePassStoreErrorTitle => '商店错误';

  @override
  String get fortunePassStoreErrorContent => '暂时无法连接商店，请稍后重试。';

  @override
  String fortunePassSubscribeSale(int percent) {
    return '订阅享优惠';
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
  String get compatibilityTitleGreat => '非常合拍';

  @override
  String get compatibilityDescGreat => '互补又能理解，越相处越舒服。';

  @override
  String get compatibilityTitleGood => '不错的缘分';

  @override
  String get compatibilityDescGood => '只要多沟通，就能很稳定地走下去。';

  @override
  String get compatibilityTitleEffort => '需要用心';

  @override
  String get compatibilityDescEffort => '需要磨合，但也有成长的空间。';

  @override
  String get compatibilityTitleDifficult => '挑战较多';

  @override
  String get compatibilityDescDifficult => '容易误会与摩擦，建议放慢节奏好好沟通。';

  @override
  String get compatibilityResultButton => '查看结果';

  @override
  String get compatibilityDeleteTooltip => '删除';

  @override
  String get compatibilityGenderMale => '男';

  @override
  String get compatibilityGenderFemale => '女';

  @override
  String get tojeongInputTitle => '土亭秘诀输入';

  @override
  String tojeongCheckFortune(int year) {
    return '查看土亭秘诀';
  }

  @override
  String get tojeongInputGuide => '输入姓名与信息，生成当年运势。';

  @override
  String tojeongViewResult(int year) {
    return '查看结果';
  }

  @override
  String get tojeongCheckButton => '开始查看';

  @override
  String get tojeongSaveAndCheck => '保存并查看';

  @override
  String get tojeongYearSelect => '选择年份';

  @override
  String tojeongResultTitle(int year) {
    return '土亭秘诀结果';
  }

  @override
  String tojeongUserFortune(String name, int year) {
    return '你的运势';
  }

  @override
  String tojeongGua(String gua) {
    return '卦';
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
  String tojeongShareTitle(Object year) {
    return '土亭秘诀';
  }

  @override
  String tojeongShareDesc(String name, String desc) {
    return 'Fortune Alarm 生成的土亭秘诀结果。';
  }

  @override
  String get tojeongShareTargetYear => '目标年份';

  @override
  String get sajuDeleteTitle => '删除确认';

  @override
  String sajuDeleteConfirm(String name) {
    return '确定要删除这份资料吗？';
  }

  @override
  String get sajuProfileSelect => '选择资料';

  @override
  String get add => '添加';

  @override
  String get modify => '修改';

  @override
  String fortuneUnderConstructionTitle(String title) {
    return '功能准备中';
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
    return '新年运势';
  }

  @override
  String get newYearFortuneSubHeader => '为你总结一整年的走向与重点';

  @override
  String newYearFortuneViewButton(int year) {
    return '查看新年运势';
  }

  @override
  String get newYearFortuneCheckButton => '开始查看';

  @override
  String get newYearFortuneSaveAndCheckButton => '保存并查看';

  @override
  String newYearFortuneResultTitle(int year) {
    return '新年运势结果';
  }

  @override
  String newYearFortuneShareTitle(int year) {
    return '分享新年运势';
  }

  @override
  String newYearFortuneShareDesc(String name, String desc) {
    return 'Fortune Alarm 生成的新年运势结果。';
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
    return '年度总运';
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
  String tojeongCoreMessage(Object hasu, Object jungsu, Object sangsu) {
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
  String get compatibilityDescDefaultConstellation => '从星座角度看，整体属于比较合拍的关系。';
}
