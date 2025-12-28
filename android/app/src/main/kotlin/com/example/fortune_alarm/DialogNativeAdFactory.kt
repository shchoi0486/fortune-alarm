package com.example.fortune_alarm

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
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.dialog_native_ad, null) as NativeAdView

        with(nativeAdView) {
            val mediaView = findViewById<MediaView>(R.id.ad_media)
            this.mediaView = mediaView

            val iconView = findViewById<ImageView>(R.id.ad_app_icon)
            val icon = nativeAd.icon
            if (icon != null) {
                iconView.setImageDrawable(icon.drawable)
                this.iconView = iconView
                iconView.visibility = View.VISIBLE
            } else {
                iconView.visibility = View.GONE
            }

            val headlineView = findViewById<TextView>(R.id.ad_headline)
            headlineView.text = nativeAd.headline
            this.headlineView = headlineView

            val bodyView = findViewById<TextView>(R.id.ad_body)
            with(bodyView) {
                text = nativeAd.body
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
