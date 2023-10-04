import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final firebaseToken = await currentUser.getIdToken(true);

  return Dio(
    BaseOptions(
      baseUrl: apiServerBaseUrl,
      headers: {'x-auth': firebaseToken, 'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 30),
    ),
  );
});
