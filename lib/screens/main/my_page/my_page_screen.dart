import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/gen/colors.gen.dart';
import 'package:roumo_flutter/ui/text_style.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var alarmState = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 28.w, top: 16.h, right: 28.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Assets.images.homeLogo.image(),
              ),
              6.verticalSpace,
              28.verticalSpace,
              AlarmItem(alarmState: alarmState, onTap: () {}),
              28.verticalSpace,
              ServiceItem(
                onTap: () {},
              ),
              28.verticalSpace,
              PrivacyItem(
                onTap: () {},
              ),
              28.verticalSpace,
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget AlarmItem({required bool alarmState, required void Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Intl.message('notice'),
          style: styleOfMyPageText,
        ),
        GestureDetector(
          onTap: onTap,
          child: alarmState == true
              ? SvgPicture.asset(Assets.images.toggleOn)
              : SvgPicture.asset(Assets.images.toggleOff),
        ),
      ],
    );
  }

  Widget ServiceItem({required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Intl.message('terms_of_service'),
            style: styleOfMyPageText,
          ),
          Assets.images.smallRightArrow.image(),
        ],
      ),
    );
  }

  Widget PrivacyItem({required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Intl.message('privacy_policy'),
            style: styleOfMyPageText,
          ),
          Assets.images.smallRightArrow.image(),
        ],
      ),
    );
  }

  Widget LogoutButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 24.5.h,
        color: Colors.transparent,
        child: Center(
          child: Text(
            Intl.message('logout'),
            style: styleOfMyPageText,
          ),
        ),
      ),
    );
  }
}
