import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/entity/api_response.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/entity/user/roumo_user.dart';
import 'package:roumo_flutter/provider/api_provider.dart';
import 'package:roumo_flutter/utils/logger.dart';

final userApiProvider = FutureProvider<UserApi>((ref) async {
  final dio = await ref.read(dioProvider.future);
  return UserApi(dio);
});

class UserApi {

  UserApi(this._dio);

  final Dio _dio;

  Future<bool> signUp(String nickname) async {
    try {
      final result = await _dio.post<dynamic>(
        '/signup',
        data: {
          'nickname': nickname, // TODO api 문서 확인 필요
        },
      );

      if (result.statusCode == 200) {
        return true;
      }
      Log.e(result);
      return false;
    } catch (e) {
      Log.e(e);
      return false;
    }
  }

  Future<Result<RoumoUser>> login() async {
    final response = await _dio.post<dynamic>(
      '/login',
    );
    if (response.statusCode == 200) {
      final body = response.data;
      final data = ApiResponse.fromDynamic(body).data;
      Log.i(data);
      return Result.success(RoumoUser.fromJson(data));
    }
    Log.e(response);
    return const Result.error('로그인에 실패했습니다.');
  }
}
