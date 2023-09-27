import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/const/secret_consts.dart';

final dioProvider = FutureProvider<Dio>((ref) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return Dio(
      BaseOptions(
        baseUrl: apiServerBaseUrl,
      ),
    );
  }
  final firebaseToken = await currentUser.getIdToken();
  unawaited(Clipboard.setData(ClipboardData(text: firebaseToken ?? '')));

  final dio = Dio(
    BaseOptions(
      baseUrl: apiServerBaseUrl,
      headers: {'x-auth': firebaseToken, 'Content-Type': 'application/json'},
    ),
  )..interceptors.add(InterceptorsWrapper(
    onError: (error, handler) {
      if (error.response?.statusCode == 401) {
        FirebaseAuth.instance.signOut();
      }
      return handler.next(error);
    },
    onResponse: (response, handler) {
      if (response.statusCode == 401) {
        FirebaseAuth.instance.signOut();
      }
      return handler.next(response);
    },
  ));
  return dio;
});
