import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roumo_flutter/entity/result.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/provider/login/login_provider.dart';
import 'package:roumo_flutter/routes.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(Routes.login);
      ref.read(loginProvider.notifier).autoLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginProvider, (previous, next) {
      if (next is Success) {
        context.go(Routes.main);
      } else {
        context.go(Routes.login);
      }
    });

    return Scaffold(
      body: Center(
        child: Assets.icon.icon.image(
          fit: BoxFit.cover,
          width: 300.w,
          height: 300.w,
        ),
      ),
    );
  }
}
