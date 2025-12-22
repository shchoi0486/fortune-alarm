import 'package:flutter/material.dart';

enum Ohaeng {
  wood("목", "나무", Color(0xFF4CAF50)),
  fire("화", "불", Color(0xFFE53935)),
  earth("토", "흙", Color(0xFFFFCA28)),
  metal("금", "쇠", Color(0xFF9E9E9E)),
  water("수", "물", Color(0xFF2196F3));

  final String koreanName;
  final String symbol;
  final Color color;
  const Ohaeng(this.koreanName, this.symbol, this.color);
}

enum Cheongan {
  gap("갑", "甲", Ohaeng.wood, true),
  eul("을", "乙", Ohaeng.wood, false),
  byeong("병", "丙", Ohaeng.fire, true),
  jeong("정", "丁", Ohaeng.fire, false),
  mu("무", "戊", Ohaeng.earth, true),
  gi("기", "己", Ohaeng.earth, false),
  gyeong("경", "庚", Ohaeng.metal, true),
  sin("신", "辛", Ohaeng.metal, false),
  im("임", "壬", Ohaeng.water, true),
  gye("계", "癸", Ohaeng.water, false);

  final String koreanName;
  final String hanja;
  final Ohaeng ohaeng;
  final bool isYang;
  const Cheongan(this.koreanName, this.hanja, this.ohaeng, this.isYang);
}

enum Jiji {
  ja("자", "子", Ohaeng.water, "쥐"),
  chuk("축", "丑", Ohaeng.earth, "소"),
  in_("인", "寅", Ohaeng.wood, "호랑이"), // in is a keyword, so using in_
  myo("묘", "卯", Ohaeng.wood, "토끼"),
  jin("진", "辰", Ohaeng.earth, "용"),
  sa("사", "巳", Ohaeng.fire, "뱀"),
  o("오", "午", Ohaeng.fire, "말"),
  mi("미", "未", Ohaeng.earth, "양"),
  sin("신", "申", Ohaeng.metal, "원숭이"),
  yu("유", "酉", Ohaeng.metal, "닭"),
  sul("술", "戌", Ohaeng.earth, "개"),
  hae("해", "亥", Ohaeng.water, "돼지");

  final String koreanName;
  final String hanja;
  final Ohaeng ohaeng;
  final String animal;
  const Jiji(this.koreanName, this.hanja, this.ohaeng, this.animal);
}

class Ganji {
  final Cheongan cheongan;
  final Jiji jiji;

  const Ganji(this.cheongan, this.jiji);

  String get name => "${cheongan.koreanName}${jiji.koreanName}";
  String get hanja => "${cheongan.hanja}${jiji.hanja}";
}
