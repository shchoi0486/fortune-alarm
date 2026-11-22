# Flutter 기본 규칙 (flutter_tools/gradle/flutter_proguard_rules.pro 과 동일)
# minifyEnabled=true 일 때 플러그인 클래스 스트리핑 방지용
-dontwarn io.flutter.plugin.**
-dontwarn android.**
-if class * implements io.flutter.embedding.engine.plugins.FlutterPlugin
-keep,allowshrinking,allowobfuscation class <1>

# Unity Ads / AppLovin: SDK AAR에 consumer-rules가 내장되어 있어
# 별도 keep이 불필요하다. 과거의 광범위 -keep(class ** { *; })은
# 난독화 비율을 떨어뜨리는 원인이므로 제거하고 경고만 억제한다.
-dontwarn com.unity3d.**
-dontwarn com.applovin.**
# AppLovin 13.6.x OMID가 참조하는 선택적 Amazon PrivacyPass 의존성 (번들 미포함)
-dontwarn com.amazon.privacypass.**
