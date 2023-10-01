import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roumo_flutter/provider/login/login_provider.dart';
import 'package:roumo_flutter/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Text('Home'),
            ElevatedButton(
              onPressed: () {
                // firebase logout
                ref.read(loginProvider.notifier).logout(
                  callback: () {
                    // go to login screen
                    context.go(Routes.login);
                  },
                );
              },
              child: Text('logout'),
            ),
          ],
        )),
      ),
    );
  }
}
