[OPEN] alarm-permission-schedule

# Debug Session: alarm-permission-schedule

## Scope
- Fix Flutter localization build failure caused by locale mismatch.
- Investigate why exact alarm permission flow opens generic app settings instead of the direct schedule/reminder settings page.
- Verify alarm reliability risks around exact timing, reboot recovery, and enable/disable toggle rescheduling.

## Falsifiable Hypotheses
1. `lib/l10n/app_pt.arb` contains `@@locale: pt-BR`, which causes `gen_localizations` to fail because the filename implies `pt`.
2. Android permission navigation uses a generic app settings intent or catches/falls back too early, so the app never reaches the exact alarm settings page on supported devices.
3. Exact alarm permission checking/requesting is implemented in one screen flow but not enforced consistently from the initial onboarding/start screen.
4. Alarm schedules are not fully re-registered after reboot or after toggling enabled state because receiver/service reschedule paths are incomplete.
5. Manifest declarations or platform-channel/native Android integration for exact alarms, boot completed, or reminder permissions are missing or partially mismatched with runtime code.

## Evidence Plan
- Inspect ARB locale declarations and localization config.
- Inspect Android manifest, permission helper, settings navigation, onboarding/start screen, and alarm scheduling/reschedule flows.
- Reproduce build/static diagnostics before touching business logic.

## Evidence Collected
- `lib/l10n/app_pt.arb` had `@@locale: pt-BR` while the file name was `app_pt.arb`, matching the Flutter build error exactly.
- Alarm save flow and optimization UI were using `Permission.*.request()` followed by `openAppSettings()`, which matches the observed behavior of landing on generic app info instead of exact target settings.
- `AndroidManifest.xml` already declares `RECEIVE_BOOT_COMPLETED`, `USE_EXACT_ALARM`, `SCHEDULE_EXACT_ALARM`, and the plugin reboot receiver, so reboot recovery plumbing exists.
- `alarm_list_provider.dart` already reschedules on toggle-on and cancels on toggle-off, so the primary UX gap is permission/settings routing rather than missing toggle hooks.
- `flutter build apk --debug` succeeds after correcting the locale mismatch.

## Applied Fixes
- Corrected `app_pt.arb` locale from `pt-BR` to `pt`.
- Added native Android settings intents for exact alarm, overlay, battery optimization, and notification settings in `MainActivity.kt`.
- Added Dart wrappers in `AlarmSchedulerService` so UI flows can jump directly to the correct Android settings pages.
- Updated alarm save flow and optimization UIs to use direct settings navigation instead of generic app settings fallback.
- Added first-start permission setup entry on `FirstAlarmStepScreen` and auto-opened the permission dialog when critical permissions are missing.

## Current Status
- Build verification: PASS
- Runtime permission navigation: pending user/device verification
- Alarm reliability review:
  - Reboot restore path exists via manifest receiver and `rescheduleOnReboot: true`
  - App-start self-healing reschedule path exists in `AlarmSchedulerService.init()`
  - Toggle on/off reschedule path exists in `alarm_list_provider.dart`

## Additional Evidence
- `AndroidManifest.xml` already contains `android.permission.INTERNET`, so the weather failure is not caused by a missing internet permission.
- Direct requests to `https://api.open-meteo.com/v1/forecast` returned `502 Bad Gateway` in the current environment, while the air-quality endpoint still returned `200`.
- The weather UI was correctly reflecting a server-side forecast failure rather than a location-permission failure after recent UI fixes.
- Banner ads could remain slow or never appear because `AdBannerWidget` kept `_isAdRequestPending=true` after a failed load, preventing retry.
- Fortune reveal cards lost the previous cookie/pass bypass because the flow was changed to call `showRewardedAd()` directly instead of the full access dialog.
- One-time alarms could be lost after reboot or toggle-on when their restored target time was already slightly in the past.

## Additional Fixes
- Added forecast fallback from Open-Meteo to MET Norway (`api.met.no`) while keeping the existing air-quality source.
- Kept the correct server error message in the weather UI instead of mislabeling it as a permission problem.
- Fixed banner-ad retry logic and removed an artificial rendering delay so ads appear sooner on fortune/mission/settings tabs.
- Restored fortune card access through the full pass/cookie/ad decision flow.
- Fixed one-time alarm recovery after reboot by rescheduling recently missed alarms a few seconds into the future.
- Fixed one-time alarm toggle-on behavior so a past-time alarm moves to the next valid future time instead of silently failing.
