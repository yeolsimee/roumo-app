import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> getFirebaseToken() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  return await currentUser?.getIdToken() ?? '';
}