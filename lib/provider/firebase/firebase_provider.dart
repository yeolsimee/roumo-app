import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

Future<String> getFirebaseToken() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  final firebaseToken = await currentUser?.getIdToken() ?? '';
  unawaited(Clipboard.setData(ClipboardData(text: firebaseToken ?? '')));
  return firebaseToken;
}