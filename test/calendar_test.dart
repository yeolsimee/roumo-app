import 'package:flutter_test/flutter_test.dart';
import 'package:roumo_flutter/provider/calendar/calendar_utils.dart';

void main() {
  test('test list', () {
    final days = getDayListOfMonthWithFirstWeekAndLastWeek(DateTime(2023, 10));
    final first = DateTime(2023, 9, 25);
    final last = DateTime(2023, 11, 5);
    // selected datetime list from first to last
    final selected = getDateTimeList(first, last);
    expect(selected, days);
  });
}
