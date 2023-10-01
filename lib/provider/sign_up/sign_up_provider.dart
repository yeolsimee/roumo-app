import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/entity/user/api_user.dart';
import 'package:roumo_flutter/provider/login/user_api.dart';

final signUpProvider = StateNotifierProvider<SignUpProvider, Result<ApiUser>>(
  (ref) {
    final userApi = ref.watch(userApiProvider);
    return SignUpProvider(userApi);
  },
);

class SignUpProvider extends StateNotifier<Result<ApiUser>> {
  SignUpProvider(this._userApi) : super(const Result.empty());

  final AsyncValue<UserApi> _userApi;

  void signUp() {
    state = const Result.loading();
    _userApi.when(
      data: (api) async {
        state = await api.signUp();
      },
      loading: () {
        state = const Result.loading();
      },
      error: (error, stackTrace) {
        state = const Result.error('회원가입에 실패했습니다.');
      },
    );
  }
}