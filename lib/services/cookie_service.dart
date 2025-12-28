import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CookieService {
  // Firebase가 초기화되지 않았을 때 인스턴스에 접근하면 앱이 크래시되므로
  // getter를 사용하여 실제 사용 시점에 접근하도록 하고, 안전 장치를 추가합니다.
  FirebaseDatabase get _database => FirebaseDatabase.instance;
  FirebaseAuth get _auth => FirebaseAuth.instance;

  bool get _isFirebaseReady => Firebase.apps.isNotEmpty;

  // 현재 사용자 ID 가져오기 (없으면 익명 로그인 시도)
  Future<String> _getUserId() async {
    if (!_isFirebaseReady) return 'offline_user';

    try {
      User? user = _auth.currentUser;
      if (user == null) {
        try {
          UserCredential credential = await _auth.signInAnonymously();
          user = credential.user;
        } catch (e) {
          debugPrint('Anonymous auth failed: $e');
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
    if (!_isFirebaseReady) return 0;
    
    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') return 0;

      final snapshot = await _database.ref('users/$uid/cookies').get();
      if (!snapshot.exists) return 0;
      return (snapshot.value as int?) ?? 0;
    } catch (e) {
      debugPrint('Failed to get cookies: $e');
      return 0;
    }
  }

  // 쿠키 개수 스트림 (실시간 업데이트)
  Stream<int> get cookieCountStream async* {
    if (!_isFirebaseReady) {
      yield 0;
      return;
    }

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') {
        yield 0;
        return;
      }
      
      yield* _database.ref('users/$uid/cookies').onValue.map((event) {
        final snapshot = event.snapshot;
        if (!snapshot.exists) return 0;
        return (snapshot.value as int?) ?? 0;
      });
    } catch (e) {
      debugPrint('Stream error: $e');
      yield 0;
    }
  }

  // 쿠키 추가 (광고 보상 등)
  Future<void> addCookies(int amount) async {
    if (!_isFirebaseReady) return;

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') return;

      final cookieRef = _database.ref('users/$uid/cookies');
      
      await cookieRef.runTransaction((currentData) {
        if (currentData == null) {
          return Transaction.success(amount);
        }
        final int currentCookies = (currentData as int?) ?? 0;
        return Transaction.success(currentCookies + amount);
      });
    } catch (e) {
      debugPrint('Failed to add cookies: $e');
    }
  }

  // 쿠키 사용 (운세 보기 등)
  Future<bool> useCookies(int amount) async {
    if (!_isFirebaseReady) return false;

    try {
      final uid = await _getUserId();
      if (uid == 'offline_user') return false;

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

      return result.committed;
    } catch (e) {
      debugPrint('Cookie transaction failed: $e');
      return false;
    }
  }
}
