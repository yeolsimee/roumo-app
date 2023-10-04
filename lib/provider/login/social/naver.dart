import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:roumo_flutter/utils/logger.dart';

class Naver {
  static Future<bool> login() async {
    final result = await FlutterNaverLogin.logIn();
    return getLoginResultIfStatusIsLoggedIn(result);
  }

  static Future<bool> getLoginResultIfStatusIsLoggedIn(
    NaverLoginResult result,
  ) async {
    if (result.status == NaverLoginStatus.loggedIn) {
      final customToken = await getFirebaseCustomToken();
      final userCredential =
          await getFirebaseUserCredentialByCustomToken(customToken);
      return isFirebaseUserNotNull(userCredential);
    }
    return false;
  }

  static bool isFirebaseUserNotNull(UserCredential userCredential) =>
      userCredential.user != null;

  static Future<UserCredential> getFirebaseUserCredentialByCustomToken(
      String customToken) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithCustomToken(customToken);
    return userCredential;
  }

  static Future<String> getFirebaseCustomToken() async {
    final customToken = await createFirebaseCustomToken(
      accessToken: (await FlutterNaverLogin.currentAccessToken).accessToken,
      loginType: 'naverCustomAuth',
    );
    return customToken;
  }

  static Future<void> logout() async {
    final result = await FlutterNaverLogin.logOutAndDeleteToken();
    if (result.status == NaverLoginStatus.cancelledByUser) {
      Log.i('네이버 로그아웃');
    } else {
      Log.e('네이버 로그아웃 실패: ${result.status.name}');
    }
  }
}

Future<String> createFirebaseCustomToken({
  required String loginType,
  required String accessToken,
}) async {
  final instance = FirebaseFunctions.instanceFor(region: 'asia-northeast1');

  final result =
      await instance.httpsCallable(loginType).call<dynamic>(accessToken);

  return getFirebaseTokenIfResultDataIsMap(result);
}

String getFirebaseTokenIfResultDataIsMap(HttpsCallableResult<dynamic> result) {
  var token = '';

  if (result.data is Map) {
    token = result.data['firebase_token'].toString();
  }
  return token;
}
