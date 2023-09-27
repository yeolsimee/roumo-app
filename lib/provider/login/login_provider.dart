import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/entity/user/roumo_user.dart';
import 'package:roumo_flutter/provider/login/login_type.dart';
import 'package:roumo_flutter/provider/login/social/google.dart';
import 'package:roumo_flutter/provider/login/user_api.dart';
import 'package:roumo_flutter/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginProvider =
    StateNotifierProvider<LoginProvider, Result<RoumoUser>>((ref) {
  final userApi = ref.watch(userApiProvider);
  return LoginProvider(userApi);
});

class LoginProvider extends StateNotifier<Result<RoumoUser>> {
  LoginProvider(this.userApi) : super(const Result.empty());

  final AsyncValue<UserApi> userApi;

  void login(LoginType loginType) {
    state = const Result.loading();
    saveLoginInfo(loginType);
    loginByLoginType(loginType);
  }

  void loginByLoginType(LoginType loginType) {
    switch (loginType) {
      case LoginType.google:
        Google.login().then(sendResult);
      case LoginType.apple:
        break;
      case LoginType.naver:
        break;
    }
  }

  // shared_preferences를 사용하여 로그인 정보를 저장하고, 로그인 상태를 유지하도록 구현
  Future<void> saveLoginInfo(LoginType loginType) {
    return SharedPreferences.getInstance().then(
      (prefs) => prefs.setString('loginType', loginType.name),
    );
  }

  void logout() {
    state = const Result.empty();
  }

  // ignore: avoid_positional_boolean_parameters
  void sendResult(bool isSuccess) {
    if (isSuccess) {
      userApi.when(
        data: (api) async {
          state = await api.login();
        },
        loading: () {
          state = const Result.loading();
        },
        error: (e, s) {
          state = const Result.error('로그인 실패');
        },
      );
    } else {
      Log.e('login fail');
      state = const Result.error('login fail');
    }
  }

  void autoLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      sendResult(true);
    } else {
      state = const Result.empty();
    }
  }
}
