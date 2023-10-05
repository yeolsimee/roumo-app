import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/const/url_consts.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/gen/colors.gen.dart';
import 'package:roumo_flutter/provider/login/login_provider.dart';
import 'package:roumo_flutter/provider/notification/alarm_provider.dart';
import 'package:roumo_flutter/routes.dart';
import 'package:roumo_flutter/ui/dialog/delete_user_dialog.dart';
import 'package:roumo_flutter/ui/dialog/logout_dialog.dart';
import 'package:roumo_flutter/ui/text_style.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarmState = ref.watch(alarmProvider);
    final notifier = ref.read(loginProvider.notifier);

    return SafeArea(
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
            AlarmItem(
              alarmState: alarmState,
              onTap: () {
                ref.read(alarmProvider.notifier).toggleAlarm();
              },
            ),
            28.verticalSpace,
            ServiceItem(
              onTap: () => launchUrlString(UrlConsts.agreementUrl),
            ),
            28.verticalSpace,
            PrivacyItem(
              onTap: () => launchUrlString(UrlConsts.privacyUrl),
            ),
            28.verticalSpace,
            LogoutButton(() {
              showLogoutDialog(
                context,
                () => notifier.logout().then((_) => context.go(Routes.login)),
              );
            }),
            28.verticalSpace,
            MemberLeaveButton(() {
              showMemberLeaveDialog(
                context,
                () => notifier.deleteUser(() => context.go(Routes.login)),
              );
            }),
          ],
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

  Widget LogoutButton(void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 24.5.h,
        color: Colors.transparent,
        child: Text(
          Intl.message('logout'),
          style: styleOfMyPageText,
        ),
      ),
    );
  }

  Widget MemberLeaveButton(void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 24.5.h,
        color: Colors.transparent,
        child: Text(
          Intl.message('memberLeave'),
          style: styleOfMyPageText.copyWith(color: ColorName.error),
        ),
      ),
    );
  }
}
