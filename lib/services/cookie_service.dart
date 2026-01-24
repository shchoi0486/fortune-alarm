import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'notification_service.dart';

class CookieService {
  // Firebase가 초기화되지 않았을 때 인스턴스에 접근하면 앱이 크래시되므로
  // getter를 사용하여 실제 사용 시점에 접근하도록 하고, 안전 장치를 추가합니다.
  static const String _realtimeDatabaseUrl = 'https://fortune-alarm-f1c20-default-rtdb.asia-southeast1.firebasedatabase.app';
  static const String _functionsRegion = 'asia-southeast1';

  FirebaseDatabase get _database => FirebaseDatabase.instanceFor(app: Firebase.app(), databaseURL: _realtimeDatabaseUrl);
  FirebaseAuth get _auth => FirebaseAuth.instance;

  bool get _isFirebaseReady => Firebase.apps.isNotEmpty;

  static const String _localBoxName = 'fortune';
  static const String _localCookieKey = 'cookies';
  static const String _localFortunePassActiveUntilKey = 'fortune_pass_active_until';
  static const String _localProcessedPurchasePrefix = 'processed_purchase_';

  Future<int> _getLocalCookieCount() async {
    try {
      final box = await Hive.openBox(_localBoxName);
      return (box.get(_localCookieKey, defaultValue: 0) as int?) ?? 0;
    } catch (_) {
      return 0;
    }
  }

  // Discount Timer related
  static const String _localDiscountEndTimeKey = 'discount_end_time';
  
  final _discountTimerController = StreamController<int>.broadcast();
  Stream<int> get discountTimerStream => _discountTimerController.stream;

  void startDiscountTimer(Duration duration) async {
    final box = await Hive.openBox(_localBoxName);
    final endTime = DateTime.now().add(duration).millisecondsSinceEpoch;
    await box.put(_localDiscountEndTimeKey, endTime);
    _tickDiscountTimer();
  }

  void _tickDiscountTimer() async {
    final endTime = await getDiscountEndTime();
    if (endTime == null) {
      _discountTimerController.add(0);
      return;
    }

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final now = DateTime.now();
      if (now.isAfter(endTime)) {
        _discountTimerController.add(0);
        timer.cancel();
        final box = await Hive.openBox(_localBoxName);
        await box.delete(_localDiscountEndTimeKey);
      } else {
        _discountTimerController.add(endTime.difference(now).inSeconds);
      }
    });
  }

  Future<DateTime?> getDiscountEndTime() async {
    final box = await Hive.openBox(_localBoxName);
    final endTimeMillis = box.get(_localDiscountEndTimeKey) as int?;
    if (endTimeMillis == null) return null;
    
    final endTime = DateTime.fromMillisecondsSinceEpoch(endTimeMillis);
    if (endTime.isBefore(DateTime.now())) {
      await box.delete(_localDiscountEndTimeKey);
      return null;
    }
    return endTime;
  }

  Future<void> _setLocalCookieCount(int value) async {
    try {
      final box = await Hive.openBox(_localBoxName);
      await box.put(_localCookieKey, value);
    } catch (_) {}
  }

  // 현재 사용자 ID 가져오기 (없으면 익명 로그인 시도)
  Future<String> _getUserId() async {
    if (!_isFirebaseReady) return 'offline_user';

    try {
      User? user = _auth.currentUser;
      if (user == null) {
        try {
          // 익명 로그인에 2초 타임아웃 추가 (설정 오류 시 무한 대기 방지)
          UserCredential credential = await _auth.signInAnonymously().timeout(
            const Duration(seconds: 2),
            onTimeout: () => throw TimeoutException('Firebase Auth timeout'),
          );
          user = credential.user;
        } catch (e) {
          debugPrint('Anonymous auth failed or timed out: $e');
          return 'offline_user';
        }
      }
      return user!.uid;
    } catch (e) {
      debugPrint('Auth error: $e');
      return 'offline_user';
    }
  }

  // 쿠키 개수 가져오기 (1회성)
  Future<int> getCookieCount() async {
    if (!_isFirebaseReady) {
      return _getLocalCookieCount();
    }
    
    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') {
        return _getLocalCookieCount();
      }

      final local = await _getLocalCookieCount();
      final ref = _database.ref('users/$uid/cookies');
      final snapshot = await ref.get();
      if (!snapshot.exists) {
        if (local > 0) {
          await ref.set(local);
          return local;
        }
        await _setLocalCookieCount(0);
        return 0;
      }
      final remote = (snapshot.value as int?) ?? 0;
      if (local > remote) {
        await ref.set(local);
        return local;
      }
      await _setLocalCookieCount(remote);
      return remote;
    } catch (e) {
      debugPrint('Failed to get cookies: $e');
      return _getLocalCookieCount();
    }
  }

  Future<DateTime?> getFortunePassActiveUntil() async {
    // 1. 로컬 캐시 먼저 확인 (오프라인/빠른 응답 대응)
    DateTime? cachedUntil;
    try {
      final box = await Hive.openBox(_localBoxName);
      final cachedMillis = box.get(_localFortunePassActiveUntilKey) as int?;
      if (cachedMillis != null) {
        cachedUntil = DateTime.fromMillisecondsSinceEpoch(cachedMillis, isUtc: true).toLocal();
      }
    } catch (_) {}

    if (!_isFirebaseReady) return cachedUntil;

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') return cachedUntil;

      // 2. 서버에서 최신 정보 가져오기 (타임아웃 2초로 단축하여 UI 프리징 방지)
      final snapshot = await _database.ref('users/$uid/fortunePass/activeUntil').get().timeout(
        const Duration(seconds: 2),
      );
      
      if (!snapshot.exists) {
        // 서버에 데이터가 없으면 로컬 캐시도 삭제 (동기화)
        if (cachedUntil != null) {
          final box = await Hive.openBox(_localBoxName);
          await box.delete(_localFortunePassActiveUntilKey);
        }
        return null;
      }

      final raw = snapshot.value;
      final millis = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
      if (millis == null) return cachedUntil;

      final until = DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
      
      // 3. 로컬 캐시 업데이트
      if (cachedUntil == null || cachedUntil.millisecondsSinceEpoch != until.millisecondsSinceEpoch) {
        final box = await Hive.openBox(_localBoxName);
        await box.put(_localFortunePassActiveUntilKey, until.millisecondsSinceEpoch);
      }

      await NotificationService().scheduleFortunePassExpiryReminder(activeUntilLocal: until);
      return until;
    } catch (e) {
      debugPrint('Failed to get fortune pass from server: $e');
      return cachedUntil; // 실패 시 캐시된 정보라도 반환
    }
  }

  Future<bool> hasActiveFortunePassSubscription() async {
    final until = await getFortunePassActiveUntil();
    if (until == null) return false;
    return until.isAfter(DateTime.now());
  }

  Stream<bool> get fortunePassActiveStream async* {
    if (!_isFirebaseReady) {
      yield false;
      return;
    }

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') {
        yield false;
        return;
      }

      yield* _database.ref('users/$uid/fortunePass/activeUntil').onValue.map((event) {
        final snapshot = event.snapshot;
        if (!snapshot.exists) return false;
        final raw = snapshot.value;
        final millis = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
        if (millis == null) return false;
        final until = DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
        return until.isAfter(DateTime.now());
      });
    } catch (e) {
      debugPrint('Fortune pass stream error: $e');
      yield false;
    }
  }

  Future<void> extendFortunePass(Duration duration) async {
    if (!_isFirebaseReady) return;

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') return;

      final ref = _database.ref('users/$uid/fortunePass/activeUntil');
      final result = await ref.runTransaction((currentData) {
        final now = DateTime.now().toUtc();
        final currentMillis = currentData is int ? currentData : int.tryParse(currentData?.toString() ?? '');
        final currentUntil = currentMillis == null
            ? now
            : DateTime.fromMillisecondsSinceEpoch(currentMillis, isUtc: true);
        final base = currentUntil.isAfter(now) ? currentUntil : now;
        final next = base.add(duration);
        return Transaction.success(next.millisecondsSinceEpoch);
      });

      if (result.committed) {
        final raw = result.snapshot.value;
        final millis = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
        if (millis != null) {
          final until = DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
          
          // 로컬 캐시 업데이트
          final box = await Hive.openBox(_localBoxName);
          await box.put(_localFortunePassActiveUntilKey, millis);
          
          await NotificationService().scheduleFortunePassExpiryReminder(activeUntilLocal: until);
        }
      }
    } catch (e) {
      debugPrint('Failed to extend fortune pass: $e');
    }
  }

  // 쿠키 개수 스트림 (실시간 업데이트)
  Stream<int> get cookieCountStream async* {
    if (!_isFirebaseReady) {
      final local = await _getLocalCookieCount();
      yield local;
      try {
        final box = await Hive.openBox(_localBoxName);
        yield* box.watch(key: _localCookieKey).map((event) {
          return (event.value as int?) ?? 0;
        });
      } catch (_) {}
      return;
    }

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') {
        final local = await _getLocalCookieCount();
        yield local;
        try {
          final box = await Hive.openBox(_localBoxName);
          yield* box.watch(key: _localCookieKey).map((event) {
            return (event.value as int?) ?? 0;
          });
        } catch (_) {}
        return;
      }

      final ref = _database.ref('users/$uid/cookies');
      try {
        final local = await _getLocalCookieCount();
        final snapshot = await ref.get();
        if (!snapshot.exists) {
          if (local > 0) {
            await ref.set(local);
          }
        } else {
          final remote = (snapshot.value as int?) ?? 0;
          if (local > remote) {
            await ref.set(local);
          }
        }
      } catch (_) {}

      yield* ref.onValue.map((event) {
        final snapshot = event.snapshot;
        if (!snapshot.exists) {
          _setLocalCookieCount(0);
          return 0;
        }
        final value = (snapshot.value as int?) ?? 0;
        _setLocalCookieCount(value);
        return value;
      });
    } catch (e) {
      debugPrint('Stream error: $e');
      yield await _getLocalCookieCount();
    }
  }

  // 쿠키 추가 (광고 보상 등)
  Future<void> addCookies(int amount) async {
    if (!_isFirebaseReady) {
      final current = await _getLocalCookieCount();
      await _setLocalCookieCount(current + amount);
      return;
    }

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') {
        final current = await _getLocalCookieCount();
        await _setLocalCookieCount(current + amount);
        return;
      }

      final cookieRef = _database.ref('users/$uid/cookies');
      
      final result = await cookieRef.runTransaction((currentData) {
        if (currentData == null) {
          return Transaction.success(amount);
        }
        final int currentCookies = (currentData as int?) ?? 0;
        return Transaction.success(currentCookies + amount);
      });

      if (result.committed) {
        final raw = result.snapshot.value;
        final value = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
        if (value != null) {
          await _setLocalCookieCount(value);
          return;
        }
      }

      final current = await _getLocalCookieCount();
      await _setLocalCookieCount(current + amount);
    } catch (e) {
      debugPrint('Failed to add cookies: $e');
      final current = await _getLocalCookieCount();
      await _setLocalCookieCount(current + amount);
    }
  }

  String makePurchaseKey(String raw) {
    final bytes = utf8.encode(raw);
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  Future<bool> applyFortunePassPurchase({
    required String purchaseKey,
    required String productId,
    String? source,
    String? purchaseToken,
    String? serverVerificationData,
    String? localVerificationData,
    String? purchaseId,
    String? transactionDate,
  }) async {
    if (!_isFirebaseReady) return false;

    final uid = await _getUserId();
    if (uid == 'offline_user') return false;

    final localBox = await Hive.openBox(_localBoxName);
    final localKey = '$_localProcessedPurchasePrefix$purchaseKey';
    final alreadyProcessed = (localBox.get(localKey, defaultValue: false) as bool?) ?? false;
    if (alreadyProcessed) return true;

    try {
      final token = (purchaseToken?.trim().isNotEmpty ?? false)
          ? purchaseToken!.trim()
          : (serverVerificationData?.trim().isNotEmpty ?? false)
              ? serverVerificationData!.trim()
              : '';
      if (token.isEmpty) return false;

      final callable = FirebaseFunctions.instanceFor(region: _functionsRegion).httpsCallable('validateFortunePassPurchase');
      final response = await callable.call(<String, dynamic>{
        'purchaseKey': purchaseKey,
        'productId': productId,
        'source': source,
        'purchaseToken': token,
        'serverVerificationData': serverVerificationData,
        'localVerificationData': localVerificationData,
        'purchaseId': purchaseId,
        'transactionDate': transactionDate,
      });

      final raw = response.data;
      if (raw is! Map) return false;
      final ok = raw['ok'] == true;
      if (!ok) return false;

      final activeUntilMillis = raw['activeUntilMillis'];
      final millis = activeUntilMillis is int ? activeUntilMillis : int.tryParse(activeUntilMillis?.toString() ?? '');
      if (millis != null && millis > 0) {
        final until = DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
        
        // 로컬 캐시 업데이트 (getFortunePassActiveUntil에서 사용됨)
        await localBox.put(_localFortunePassActiveUntilKey, millis);
        
        await NotificationService().scheduleFortunePassExpiryReminder(activeUntilLocal: until);
      } else {
        // Fallback to local duration calculation if server doesn't return activeUntil
        Duration duration;
        if (productId == 'fortune_pass_yearly') {
          duration = const Duration(days: 365);
        } else if (productId == 'fortune_pass_6months') {
          duration = const Duration(days: 180);
        } else {
          duration = const Duration(days: 30);
        }
        await extendFortunePass(duration);
      }
    } catch (e) {
      debugPrint('Failed to validate purchase: $e');
      return false;
    }

    await localBox.put(localKey, true);
    return true;
  }

  // 쿠키 사용 (운세 보기 등)
  Future<bool> useCookies(int amount) async {
    if (!_isFirebaseReady) {
      final current = await _getLocalCookieCount();
      if (current < amount) return false;
      await _setLocalCookieCount(current - amount);
      return true;
    }

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') {
        final current = await _getLocalCookieCount();
        if (current < amount) return false;
        await _setLocalCookieCount(current - amount);
        return true;
      }

      final cookieRef = _database.ref('users/$uid/cookies');
      
      final result = await cookieRef.runTransaction((currentData) {
        if (currentData == null) {
          return Transaction.abort();
        }
        final int currentCookies = (currentData as int?) ?? 0;
        if (currentCookies < amount) {
          return Transaction.abort();
        }
        return Transaction.success(currentCookies - amount);
      });

      if (result.committed) {
        final raw = result.snapshot.value;
        final value = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
        if (value != null) {
          await _setLocalCookieCount(value);
        }
      }

      return result.committed;
    } catch (e) {
      debugPrint('Cookie transaction failed: $e');
      return false;
    }
  }
}
