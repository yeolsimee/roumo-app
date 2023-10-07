import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roumo_flutter/provider/calendar/calendar_utils.dart';
import 'package:roumo_flutter/provider/calendar/selected_month_provider.dart';
import 'package:roumo_flutter/ui/text_style.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView(this.dateTime, {super.key});

  final String dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(selectedMonthProvider.notifier).dateTime;
    final days = getDayListOfMonthWithFirstWeekAndLastWeek(dateTime);
    return SizedBox(
      width: double.infinity,
      height: 300.h,
      child: GridView.builder(
        itemCount: days.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Text(
            days[index].day.toString(),
          );
        },
      ),
    );
  }

  Widget DayOfWeeks() {
    const key = 'day_of_week';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          7,
          (index) => DayOfWeek(Intl.message('${key}_${index + 1}')),
        ),
      ),
    );
  }

  Widget DayOfWeek(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Text(text, style: style12Normal),
    );
  }
}
