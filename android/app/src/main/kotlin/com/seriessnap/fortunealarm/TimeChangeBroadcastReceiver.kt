package com.seriessnap.fortunealarm

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import dev.fluttercommunity.plus.androidalarmmanager.AlarmService
import org.json.JSONObject
import java.util.TimeZone

/**
 * 타임존 변경 / 시스템 시간 변경에 맞춰 예약된 알람을 다시 계산한다.
 *
 * ## 왜 필요한가
 * `AndroidAlarmManager` 는 **절대 epoch millis** 로 `AlarmManager` 에 등록한다.
 * 따라서 사용자가 시선을 옮기거나(DST, 해외 여행) 시계를 바꾸면 등록된 알람이
 * "사용자가 입력한 벽시계 시간" 과 어긋난当地 시각에 울린다.
 * 플러그인 제공 [AlarmService.reschedulePersistentAlarms] 는 저장된 millis 를
 * 그대로 재등록하므로 이 문제를 해결하지 못한다.
 *
 * ## 동작
 * Dart 쪽이 알람을 예약할 때마다 현재 UTC offset 을 SharedPreferences 에 기록한다
 * ([OFFSET_PREF_NAME] / [OFFSET_PREF_KEY]). 이 리시버는
 *
 *   delta = 새 UTC offset - 예약 시점 UTC offset
 *
 * 을 계산해 모든 예약 시각을 `delta` 만큼 이동시킨 뒤 재등록한다.
 * 덕분에 "07:00 알람"은 어느 타임존으로 이동해도 계속当地 07:00에 울린다.
 */
class TimeChangeBroadcastReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action
        if (action != Intent.ACTION_TIMEZONE_CHANGED && action != Intent.ACTION_TIME_CHANGED) {
            return
        }
        try {
            val newOffset = TimeZone.getDefault().getOffset(System.currentTimeMillis()).toLong()
            val prefs = context.getSharedPreferences(FLUTTER_PREFS_NAME, Context.MODE_PRIVATE)
            val previousOffset = prefs.getLong(OFFSET_PREF_KEY, newOffset)
            val deltaMillis = newOffset - previousOffset

            if (deltaMillis == 0L) {
                Log.i(TAG, "UTC offset unchanged ($newOffset). Nothing to do.")
                return
            }
            Log.i(TAG, "UTC offset changed: $previousOffset -> $newOffset (delta=$deltaMillis ms)")

            val shiftedCount = shiftStoredAlarms(context, deltaMillis)

            // 재등록. 이 함수는 이미 만료된 알람은 건너뛰고 미래 알람만 다시 등록한다.
            AlarmService.reschedulePersistentAlarms(context)

            prefs.edit().putLong(OFFSET_PREF_KEY, newOffset).apply()
            Log.i(TAG, "Rescheduled $shiftedCount alarm(s) after $action")
        } catch (e: Exception) {
            // 리시버는 절대 크래시되면 안 된다. 실패해도 기존 예약은 그대로 유지된다.
            Log.e(TAG, "Failed to reschedule alarms after $action: ${e.message}")
        }
    }

    /**
     * 플러그인이 SharedPreferences 에 저장해둔 예약 시각을 offset 차이만큼 이동시킨다.
     * @return 실제로 이동시킨 알람 개수
     */
    private fun shiftStoredAlarms(context: Context, deltaMillis: Long): Int {
        val prefs = context.getSharedPreferences(PLUGIN_PREFS_NAME, Context.MODE_PRIVATE)
        val ids = prefs.getStringSet(PLUGIN_PERSISTENT_IDS_KEY, null) ?: return 0

        val editor = prefs.edit()
        val now = System.currentTimeMillis()
        var shifted = 0

        for (rawId in ids) {
            val requestCode = rawId.toIntOrNull() ?: continue
            val key = "$PLUGIN_ALARM_KEY_PREFIX$requestCode"
            val json = prefs.getString(key, null) ?: continue
            try {
                val alarm = JSONObject(json)
                val oldMillis = alarm.getLong("startMillis")
                val newMillis = oldMillis + deltaMillis

                // 이미 지난 시각으로 밀려난 알람은 그대로 둔다.
                // (정확 알람이 과거 시각으로는 예약되지 않으며, 앱 실행 시
                //  AlarmSchedulerService._rescheduleExistingAlarms 가 정리한다)
                if (newMillis <= now) {
                    continue
                }
                alarm.put("startMillis", newMillis)
                editor.putString(key, alarm.toString())
                shifted++
            } catch (e: Exception) {
                Log.e(TAG, "Failed to shift alarm $requestCode: ${e.message}")
            }
        }

        if (shifted > 0) {
            editor.apply()
        }
        return shifted
    }

    companion object {
        private const val TAG = "TimeChangeReceiver"

        /**
         * Dart(AlarmSchedulerService)가 UTC offset 을 기록하는 SharedPreferences.
         *
         * shared_preferences 플러그인의 레거시 API 는 모든 값을
         * "FlutterSharedPreferences" 라는 단일 파일에 저장하므로 이름이 이 값이어야 한다.
         */
        const val FLUTTER_PREFS_NAME = "FlutterSharedPreferences"
        const val OFFSET_PREF_KEY = "com.seriessnap.fortunealarm.utc_offset_millis"

        // 아래 상수는 android_alarm_manager_plus 의 AlarmService 내부 상수와 동일한 값이다.
        private const val PLUGIN_PREFS_NAME = "dev.fluttercommunity.plus.android_alarm_manager_plugin"
        private const val PLUGIN_PERSISTENT_IDS_KEY = "persistent_alarm_ids"
        private const val PLUGIN_ALARM_KEY_PREFIX = "android_alarm_manager/persistent_alarm_"
    }
}
