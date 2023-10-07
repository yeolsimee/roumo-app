import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roumo_flutter/gen/assets.gen.dart';
import 'package:roumo_flutter/provider/calendar/selected_month_provider.dart';
import 'package:roumo_flutter/routes.dart';
import 'package:roumo_flutter/screens/main/home/calendar_view.dart';
import 'package:roumo_flutter/ui/text_style.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(selectedMonthProvider.notifier).getYearMonthText();

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.w, top: 16.h, right: 28.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Assets.images.homeLogo.image(),
                      ),
                      20.verticalSpace,
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.images.iconCalendar),
                            4.horizontalSpace,
                            Text(dateTime, style: style15Bold),
                            6.horizontalSpace,
                            SvgPicture.asset(Assets.images.iconExtend),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                CalendarView(dateTime),
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
