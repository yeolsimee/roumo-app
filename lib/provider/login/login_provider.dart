import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/entity/user/roumo_user.dart';
import 'package:roumo_flutter/provider/login/login_type.dart';
import 'package:roumo_flutter/provider/login/social/apple.dart';
import 'package:roumo_flutter/provider/login/social/google.dart';
import 'package:roumo_flutter/provider/login/social/naver.dart';
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
        Apple.login().then(sendResult);
      case LoginType.naver:
        Naver.login().then(sendResult);
    }
  }

  // shared_preferences를 사용하여 로그인 정보를 저장하고, 로그인 상태를 유지하도록 구현
  Future<void> saveLoginInfo(LoginType loginType) {
    return SharedPreferences.getInstance().then(
      (prefs) => prefs.setString('loginType', loginType.name),
    );
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final loginType = prefs.getString('loginType') ?? '';
    switch (loginType) {
      case 'google':
        await Google.logout();
      case 'naver':
        await Naver.logout();
      default:
        await firebaseLogout();
    }
    state = const Result.empty();
  }

  // ignore: avoid_positional_boolean_parameters
  void sendResult(bool isSuccess) {
    if (isSuccess) {
      userApi.when(
        data: (api) async {
          state = await api.firstLogin();
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
      state = const Result.error('로그인 정보 없음');
    }
  }

  void deleteUser(void Function() callback) {
    userApi.when(
      data: (api) async {
        final result = await api.withdraw();
        await result.whenOrNull(
          success: (data) async {
            await logout();
            callback();
          },
          error: (e) {
            Log.e(e);
          },
        );
      },
      loading: () {},
      error: (e, s) {},
    );
  }
}
