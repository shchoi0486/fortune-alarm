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
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.text_banner_native_ad, null) as NativeAdView

        with(nativeAdView) {
            // Headline
            val headlineView = findViewById<TextView>(R.id.ad_headline)
            headlineView.text = nativeAd.headline
            this.headlineView = headlineView

            // Body
            val bodyView = findViewById<TextView>(R.id.ad_body)
            with(bodyView) {
                text = nativeAd.body
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
