package com.example.fortune_alarm

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

            // Call To Action (Optional, hiding it but setting it to make ad clickable if needed)
            // For Native Ads, setting the view registers the click listener.
            // We can make the whole view clickable by not setting specific clickables or by setting the root as clickable?
            // Actually, just setting headline and body is enough for those to be clickable.
            // To make the whole area clickable, we usually set callToActionView to a view that covers everything or rely on the NativeAdView container.
            
            // Let's bind callToAction anyway to be safe, even if invisible
            val callToActionView = findViewById<Button>(R.id.ad_call_to_action)
            with(callToActionView) {
                text = nativeAd.callToAction
                // We keep it gone as per "text only" requirement, but binding it might be good practice.
                // However, if we want the TEXT to be clickable, binding headline/body is key.
                visibility = View.GONE 
            }
            this.callToActionView = callToActionView

            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}