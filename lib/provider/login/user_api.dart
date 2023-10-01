import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/entity/api_response.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/entity/user/api_user.dart';
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

  Future<Result<ApiUser>> signUp() async {
    final response = await _dio.post<dynamic>(
      '/isnewuser/update',
      data: {'isNewUser': 'Y'},
    );
    if (response.statusCode == 200) {
      final body = response.data;
      final data = ApiResponse.fromDynamic(body).data;
      Log.i(data);
      return Result.success(ApiUser.fromJson(data));
    }
    Log.e(response);
    return const Result.error('회원가입에 실패했습니다.');
  }
}
