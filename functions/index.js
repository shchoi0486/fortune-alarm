const crypto = require('crypto');
const admin = require('firebase-admin');
const { google } = require('googleapis');
const { onCall, HttpsError } = require('firebase-functions/v2/https');

const DEFAULT_DATABASE_URL = 'https://fortune-alarm-f1c20-default-rtdb.asia-southeast1.firebasedatabase.app';
const DEFAULT_FUNCTIONS_REGION = 'asia-southeast1';

function getDatabaseUrl() {
  const env = process.env.DATABASE_URL;
  if (env && typeof env === 'string' && env.trim().length > 0) return env.trim();
  return DEFAULT_DATABASE_URL;
}

function getFunctionsRegion() {
  const env = process.env.FUNCTIONS_REGION;
  if (env && typeof env === 'string' && env.trim().length > 0) return env.trim();
  return DEFAULT_FUNCTIONS_REGION;
}

admin.initializeApp({ databaseURL: getDatabaseUrl() });

function base64Url(buffer) {
  return buffer
    .toString('base64')
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=+$/g, '');
}

function sha256Base64Url(input) {
  return base64Url(crypto.createHash('sha256').update(input, 'utf8').digest());
}

function getAndroidPackageName() {
  const env = process.env.ANDROID_PACKAGE_NAME;
  if (env && typeof env === 'string' && env.trim().length > 0) return env.trim();
  return 'com.seriessnap.fortunealarm';
}

async function verifyGooglePlaySubscription({ packageName, subscriptionId, token }) {
  const auth = new google.auth.GoogleAuth({
    scopes: ['https://www.googleapis.com/auth/androidpublisher'],
  });
  const client = await auth.getClient();
  const androidpublisher = google.androidpublisher({ version: 'v3', auth: client });

  const res = await androidpublisher.purchases.subscriptions.get({
    packageName,
    subscriptionId,
    token,
  });

  return res.data;
}

exports.validateFortunePassPurchase = onCall({ region: getFunctionsRegion() }, async (request) => {
  const auth = request.auth;
  if (!auth?.uid) {
    throw new HttpsError('unauthenticated', 'Authentication required.');
  }

  const data = request.data ?? {};
  const productId = typeof data.productId === 'string' ? data.productId.trim() : '';
  const source = typeof data.source === 'string' ? data.source.trim() : '';
  const purchaseToken =
    typeof data.purchaseToken === 'string'
      ? data.purchaseToken.trim()
      : typeof data.serverVerificationData === 'string'
        ? data.serverVerificationData.trim()
        : '';
  const purchaseKey = typeof data.purchaseKey === 'string' ? data.purchaseKey.trim() : '';

  if (!productId) {
    throw new HttpsError('invalid-argument', 'productId is required.');
  }
  if (!purchaseToken) {
    throw new HttpsError('invalid-argument', 'purchaseToken is required.');
  }

  if (source && source !== 'google_play') {
    throw new HttpsError('failed-precondition', 'Unsupported store source.');
  }

  const allowedProducts = new Set(['fortune_pass_monthly', 'fortune_pass_quarterly']);
  if (!allowedProducts.has(productId)) {
    throw new HttpsError('permission-denied', 'Unknown productId.');
  }

  const packageName = getAndroidPackageName();
  let verified;
  try {
    verified = await verifyGooglePlaySubscription({
      packageName,
      subscriptionId: productId,
      token: purchaseToken,
    });
  } catch (e) {
    throw new HttpsError('internal', 'Google Play verification failed.');
  }

  const expiryMillisRaw = verified?.expiryTimeMillis;
  const expiryMillis = typeof expiryMillisRaw === 'string' ? Number(expiryMillisRaw) : Number(expiryMillisRaw);
  if (!Number.isFinite(expiryMillis) || expiryMillis <= 0) {
    throw new HttpsError('internal', 'Invalid expiryTimeMillis.');
  }

  const nowMillis = Date.now();
  if (expiryMillis <= nowMillis) {
    throw new HttpsError('failed-precondition', 'Subscription expired.');
  }

  const uid = auth.uid;
  const key = purchaseKey || sha256Base64Url(`${productId}:${purchaseToken}`);
  const tokenHash = sha256Base64Url(purchaseToken);

  const fortunePassRef = admin.database().ref(`users/${uid}/fortunePass`);
  const result = await fortunePassRef.transaction((current) => {
    const currentObj = current && typeof current === 'object' ? current : {};
    const purchasesObj =
      currentObj.purchases && typeof currentObj.purchases === 'object' ? { ...currentObj.purchases } : {};

    if (purchasesObj[key]) {
      return currentObj;
    }

    const currentActiveUntil = Number(currentObj.activeUntil) || 0;
    const activeUntil = Math.max(currentActiveUntil, expiryMillis);

    purchasesObj[key] = {
      productId,
      source: 'google_play',
      tokenHash,
      expiryTimeMillis: expiryMillis,
      orderId: verified?.orderId ?? null,
      appliedAt: admin.database.ServerValue.TIMESTAMP,
    };

    return {
      ...currentObj,
      activeUntil,
      purchases: purchasesObj,
    };
  });

  const snapshotVal = result.snapshot.val();
  const activeUntil = snapshotVal && typeof snapshotVal === 'object' ? Number(snapshotVal.activeUntil) || 0 : 0;

  return { ok: true, activeUntilMillis: activeUntil, purchaseKey: key };
});
