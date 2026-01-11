package com.seriessnap.fortunealarm

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

import android.app.KeyguardManager
import android.content.Context
import android.view.WindowManager

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

import android.os.PowerManager

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.seriessnap.fortunealarm/foreground"
    private var methodChannel: MethodChannel? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        configureWindow()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // 네이티브 광고 팩토리 등록
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, "listTile", ListTileNativeAdFactory(context)
        )
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, "dialogAd", DialogNativeAdFactory(context)
        )
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine, "textBanner", TextBannerNativeAdFactory(context)
        )
        
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel?.setMethodCallHandler { call, result ->
            android.util.Log.d("MainActivity", "Method called: ${call.method}")
            if (call.method == "bringToForeground") {
                bringToForeground()
                result.success(null)
            } else if (call.method == "setMaxAlarmVolume") {
                setMaxAlarmVolume()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun setMaxAlarmVolume() {
        try {
            val audioManager = getSystemService(Context.AUDIO_SERVICE) as android.media.AudioManager
            val maxVolume = audioManager.getStreamMaxVolume(android.media.AudioManager.STREAM_ALARM)
            val minVolume = kotlin.math.ceil(maxVolume * 0.5).toInt().coerceAtLeast(1)
            val currentVolume = audioManager.getStreamVolume(android.media.AudioManager.STREAM_ALARM)
            if (currentVolume < minVolume) {
                audioManager.setStreamVolume(android.media.AudioManager.STREAM_ALARM, minVolume, 0)
                android.util.Log.d("MainActivity", "Alarm volume raised to min: $minVolume (max: $maxVolume)")
            }
        } catch (e: Exception) {
            android.util.Log.e("MainActivity", "Failed to set max alarm volume: ${e.message}")
        }
    }

    override fun onResume() {
        super.onResume()
        configureWindow()
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        super.cleanUpFlutterEngine(flutterEngine)
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "listTile")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "dialogAd")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "textBanner")
    }

    override fun onDestroy() {
        methodChannel?.setMethodCallHandler(null)
        methodChannel = null
        super.onDestroy()
    }

    private fun bringToForeground() {
        android.util.Log.d("MainActivity", "Attempting to bring to foreground...")
        val intent = Intent(this, MainActivity::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        intent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
        intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
        intent.action = Intent.ACTION_MAIN
        intent.addCategory(Intent.CATEGORY_LAUNCHER)
        
        // 화면 켜기 및 잠금 해제 강제 재설정
        configureWindow()
        
        try {
            // 방법 1: 직접 startActivity
            startActivity(intent)
            
            // 방법 2: ActivityManager를 통한 태스크 전면 이동
            val activityManager = getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
            activityManager.moveTaskToFront(taskId, android.app.ActivityManager.MOVE_TASK_WITH_HOME)
            
            android.util.Log.d("MainActivity", "StartActivity and moveTaskToFront executed.")
            
            // 방법 3: PendingIntent를 사용한 강제 실행 (가장 강력함)
            val pendingIntent = android.app.PendingIntent.getActivity(
                this, 
                0, 
                intent, 
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) 
                    android.app.PendingIntent.FLAG_IMMUTABLE or android.app.PendingIntent.FLAG_UPDATE_CURRENT 
                else 
                    android.app.PendingIntent.FLAG_UPDATE_CURRENT
            )
            pendingIntent.send()
            android.util.Log.d("MainActivity", "PendingIntent sent successfully.")
        } catch (e: Exception) {
            android.util.Log.e("MainActivity", "Failed to bring to foreground: ${e.message}")
        }
    }

    private fun configureWindow() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            setShowWhenLocked(true)
            setTurnScreenOn(true)
            window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            // KeyguardManager.requestDismissKeyguard 제거: 패턴 잠금 화면이 알람 화면을 가리는 문제 해결
        } else {
            window.addFlags(
                WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
                WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD or
                WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON or
                WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
            )
        }
    }
}
