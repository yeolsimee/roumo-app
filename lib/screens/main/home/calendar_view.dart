import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roumo_flutter/provider/calendar/calendar_utils.dart';
import 'package:roumo_flutter/provider/calendar/selected_month_provider.dart';

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
          return Center(
            child: Text(
              days[index].day.toString(),
            ),
          );
        },
      ),
    );
  }


}
