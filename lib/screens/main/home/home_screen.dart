import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 28.w, top: 16.h, right: 28.w),
                    child: Assets.images.homeLogo.image(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.h,
            right: 28.w,
            child: GestureDetector(
              onTap: () => context.go(Routes.routineAdd),
              child: SvgPicture.asset(
                Assets.images.btnAdd,
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
