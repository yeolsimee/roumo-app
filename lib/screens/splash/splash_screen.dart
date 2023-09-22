import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roumo_flutter/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go(Routes.login);
          },
          child: const Text('go to login'),
        ),
      ),
    );
  }
}
