package com.seriessnap.fortunealarm

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.TextView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class TextBannerNativeAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(nativeAd: NativeAd, customOptions: Map<String, Any>?): NativeAdView {
        val isDark = customOptions?.get("theme") == "dark"
        
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.text_banner_native_ad, null) as NativeAdView

        with(nativeAdView) {
            // Apply colors based on Flutter theme
            val bgColor = if (isDark) android.graphics.Color.parseColor("#1C1C1E") else android.graphics.Color.parseColor("#FFFFFF")
            val headlineColor = if (isDark) android.graphics.Color.parseColor("#FFFFFF") else android.graphics.Color.parseColor("#000000")
            val bodyColor = if (isDark) android.graphics.Color.parseColor("#CCCCCC") else android.graphics.Color.parseColor("#666666")

            setBackgroundColor(bgColor)

            // Headline
            val headlineView = findViewById<TextView>(R.id.ad_headline)
            headlineView.text = nativeAd.headline
            headlineView.setTextColor(headlineColor)
            this.headlineView = headlineView

            // Body
            val bodyView = findViewById<TextView>(R.id.ad_body)
            with(bodyView) {
                text = nativeAd.body
                setTextColor(bodyColor)
                visibility = if (nativeAd.body.isNullOrEmpty()) View.GONE else View.VISIBLE
            }
            this.bodyView = bodyView

            // Let's bind callToAction anyway to be safe, even if invisible
            val callToActionView = findViewById<Button>(R.id.ad_call_to_action)
            with(callToActionView) {
                text = nativeAd.callToAction
                visibility = View.GONE 
            }
            this.callToActionView = callToActionView

            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}
