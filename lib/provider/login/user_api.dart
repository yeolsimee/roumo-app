import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/entity/api_response.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/entity/user/api_user.dart';
import 'package:roumo_flutter/entity/user/roumo_user.dart';
import 'package:roumo_flutter/provider/api_provider.dart';
import 'package:roumo_flutter/provider/firebase/firebase_provider.dart';
import 'package:roumo_flutter/utils/logger.dart';

final userApiProvider = FutureProvider<UserApi>((ref) async {
  final dio = await ref.read(dioProvider.future);
  return UserApi(dio);
});

class UserApi {

  UserApi(this._dio);

  final Dio _dio;

  Future<Result<RoumoUser>> firstLogin() async {
    final firebaseToken = await getFirebaseToken();

    try {
      final response = await _dio.post<dynamic>(
        '/login',
        options: Options(headers: {'x-auth': firebaseToken})
      );
      if (response.statusCode == 200) {
        final body = response.data;
        final data = ApiResponse.fromDynamic(body).data;
        Log.i(data);
        return Result.success(RoumoUser.fromJson(data));
      }
      Log.e(response);
      return const Result.error('로그인에 실패했습니다.');
    } catch (error) {
      Log.e(error);
      return const Result.error('로그인에 실패했습니다.');
    }
  }

  Future<Result<RoumoUser>> login() async {
    try {
      final response = await _dio.post<dynamic>(
        '/login',
      );
      if (response.statusCode == 200) {
        final body = response.data;
        final data = ApiResponse.fromDynamic(body).data;
        final roumoUser = RoumoUser.fromJson(data);
        if (roumoUser.isNewUser == 'N') {
          return Result.success(roumoUser);
        }
      }
      Log.e(response);
      return const Result.error('로그인에 실패했습니다.');
    } catch (error) {
      Log.e(error);
      return const Result.error('로그인에 실패했습니다.');
    }
  }

  Future<Result<ApiUser>> signUp() async {
    final response = await _dio.post<dynamic>(
      '/isnewuser/update',
      data: {'isNewUser': 'N'},
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
