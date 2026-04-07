package com.seriessnap.fortunealarm

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class DialogNativeAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(nativeAd: NativeAd, customOptions: Map<String, Any>?): NativeAdView {
        val isDark = customOptions?.get("theme") == "dark"
        
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.dialog_native_ad, null) as NativeAdView

        with(nativeAdView) {
            // Apply colors based on Flutter theme
            val bgColor = if (isDark) android.graphics.Color.parseColor("#1C1C1E") else android.graphics.Color.parseColor("#FFFFFF")
            val headlineColor = if (isDark) android.graphics.Color.parseColor("#FFFFFF") else android.graphics.Color.parseColor("#000000")
            val bodyColor = if (isDark) android.graphics.Color.parseColor("#CCCCCC") else android.graphics.Color.parseColor("#666666")

            setBackgroundColor(bgColor)

            val mediaView = findViewById<MediaView>(R.id.ad_media)
            this.mediaView = mediaView

            val iconView = findViewById<ImageView>(R.id.ad_app_icon)
            
            // 1. 미디어 콘텐츠(영상/큰 이미지) 우선 확인
            if (nativeAd.mediaContent != null && (nativeAd.mediaContent!!.hasVideoContent() || nativeAd.mediaContent!!.mainImage != null)) {
                mediaView.visibility = View.VISIBLE
                iconView.visibility = View.GONE // 미디어가 있으면 아이콘은 숨김 (중복 방지)
            } else {
                mediaView.visibility = View.GONE
                // 2. 미디어가 없으면 아이콘 표시 시도
                val icon = nativeAd.icon
                if (icon != null) {
                    iconView.setImageDrawable(icon.drawable)
                    this.iconView = iconView
                    iconView.visibility = View.VISIBLE
                } else {
                    iconView.visibility = View.GONE
                }
            }

            val headlineView = findViewById<TextView>(R.id.ad_headline)
            headlineView.text = nativeAd.headline
            headlineView.setTextColor(headlineColor)
            this.headlineView = headlineView

            val bodyView = findViewById<TextView>(R.id.ad_body)
            with(bodyView) {
                text = nativeAd.body
                setTextColor(bodyColor)
                visibility = if (nativeAd.body.isNullOrEmpty()) View.INVISIBLE else View.VISIBLE
            }
            this.bodyView = bodyView

            val callToActionView = findViewById<Button>(R.id.ad_call_to_action)
            with(callToActionView) {
                text = nativeAd.callToAction
                visibility = if (nativeAd.callToAction.isNullOrEmpty()) View.INVISIBLE else View.VISIBLE
            }
            this.callToActionView = callToActionView

            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}
