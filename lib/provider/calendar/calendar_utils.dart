List<DateTime> getDayListOfMonth(DateTime dateTime) {
  final lastDayOfMonth = DateTime(dateTime.year, dateTime.month + 1, 0);
  return List.generate(
    lastDayOfMonth.day,
    (index) => DateTime(dateTime.year, dateTime.month, index + 1),
  );
}

// get Day List of Month with first week and last week
List<DateTime> getDayListOfMonthWithFirstWeekAndLastWeek(DateTime dateTime) {
  final firstDayOfMonth = DateTime(dateTime.year, dateTime.month);
  final lastDayOfMonth = DateTime(dateTime.year, dateTime.month + 1, 0);
  final firstWeekDay = firstDayOfMonth.weekday;
  final lastWeekDay = lastDayOfMonth.weekday;
  final firstDayOfFirstWeek = firstDayOfMonth.subtract(
    Duration(days: firstWeekDay - 1),
  );
  final lastDayOfLastWeek = lastDayOfMonth.add(
    Duration(days: 7 - lastWeekDay),
  );
  final dayList = <DateTime>[];
  for (var i = firstDayOfFirstWeek;
      i.isBefore(lastDayOfLastWeek) || i.isAtSameMomentAs(lastDayOfLastWeek);
      i = i.add(const Duration(days: 1))) {
    dayList.add(i);
  }
  return dayList;
}

// get DateTime List from first DateTime to last DateTime
List<DateTime> getDateTimeList(DateTime first, DateTime last) {
  final list = <DateTime>[];
  for (var i = first;
  i.isBefore(last) || i.isAtSameMomentAs(last);
  i = i.add(const Duration(days: 1))) {
    list.add(i);
  }
  return list;
}

