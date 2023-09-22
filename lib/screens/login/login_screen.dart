import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/gen/colors.gen.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(child: Assets.images.loginImage.image()),
            85.verticalSpace,
            NaverButton(onClick: () {}),
            8.verticalSpace,
            GoogleButon(onClick: () {

            }),
            8.verticalSpace,
            SizedBox(
              width: 319.w,
              child: SignInWithAppleButton(
                text: Intl.message('loginWithApple'),
                height: 48,
                iconAlignment: IconAlignment.left,
                onPressed: () {},
              ),
            ),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget NaverButton({required Null Function() onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 319.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: ColorName.naverGreen,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 21.w),
                child: SvgPicture.asset(Assets.images.naver),
              ),
            ),
            Center(
              child: Text(
                Intl.message('loginWithNaver'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget GoogleButon({required Null Function() onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 319.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: ColorName.googleGray,
            width: 1.w,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: SvgPicture.asset(Assets.images.google),
              ),
            ),
            Center(
              child: Text(
                Intl.message('loginWithGoogle'),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}