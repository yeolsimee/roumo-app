import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/const/url_consts.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/gen/colors.gen.dart';
import 'package:roumo_flutter/screens/agreement/check_state_notifier.dart';
import 'package:roumo_flutter/ui/text_style.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AgreementScreen extends ConsumerWidget {
  const AgreementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                child: SvgPicture.asset(Assets.images.iconBackarrow),
              ),
              28.verticalSpace,
              Text(
                Intl.message('agreementTitle'),
                style: style20Bold,
              ),
              60.verticalSpace,
              CheckBody(ref),
            ],
          ),
        ),
      ),
      bottomSheet: BottomButton(context, ref),
    );
  }

  Column CheckBody(WidgetRef ref) {
    final notifier = ref.read(agreementCheckStateProvider.notifier);
    final provider = ref.watch(agreementCheckStateProvider);

    return Column(
      children: [
        GestureDetector(
          onTap: notifier.checkAllAgree,
          child: Row(
            children: [
              iconByChecked(provider.isAllAgree()),
              8.horizontalSpace,
              Text(
                Intl.message('agreeAll'),
                style: style16Bold,
              ),
            ],
          ),
        ),
        12.verticalSpace,
        Divider(
          color: ColorName.greyF0,
          height: 1.5.h,
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: notifier.checkServiceAgree,
              child: Row(
                children: [
                  iconByChecked(provider.isServiceAgree),
                  6.horizontalSpace,
                  Text(
                    Intl.message('agree1'),
                    style: style15Normal,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => launchUrlString(UrlConsts.agreementUrl),
              child: SvgPicture.asset(Assets.images.iconArrowOpen),
            ),
          ],
        ),
        12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: notifier.checkPrivacyAgree,
              child: Row(
                children: [
                  iconByChecked(provider.isPrivacyAgree),
                  6.horizontalSpace,
                  Text(
                    Intl.message('agree2'),
                    style: style15Normal,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => launchUrlString(UrlConsts.privacyUrl),
              child: SvgPicture.asset(Assets.images.iconArrowOpen),
            ),
          ],
        ),
      ],
    );
  }

  SvgPicture iconByChecked(bool isAllAgree) => isAllAgree
      ? SvgPicture.asset(Assets.images.iconCheck)
      : SvgPicture.asset(Assets.images.iconNonecheck);

  Widget BottomButton(BuildContext context, WidgetRef ref) {
    // get bottom padding
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    final provider = ref.watch(agreementCheckStateProvider);

    final isAllAgree = provider.isAllAgree();

    return Container(
      height: 66.h + bottomPadding,
      color: isAllAgree ? ColorName.black0B : ColorName.grey99,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: double.infinity,
          height: 66.h,
          child: Center(
            child: Text(
              Intl.message('agreeAndContinue'),
              textAlign: TextAlign.center,
              style: style16Bold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
