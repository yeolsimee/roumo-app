import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final selectedMonthProvider =
    ChangeNotifierProvider<SelectedMonthProvider>((ref) {
  return SelectedMonthProvider();
});

class SelectedMonthProvider extends ChangeNotifier {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  // get year month text from DateTime
  String getYearMonthText() {
    return '${dateTime.year}${Intl.message('year')}'
        ' ${dateTime.month}${Intl.message('month')}';
  }

}
