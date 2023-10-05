import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final alarmProvider =
    StateNotifierProvider<AlarmProvider, bool>((ref) => AlarmProvider());

class AlarmProvider extends StateNotifier<bool> {
  AlarmProvider() : super(false) {
    loadAlarm();
  }

  Future<void> loadAlarm() async {
    final prefs = await SharedPreferences.getInstance();
    final alarm = prefs.getBool('alarm') ?? false;
    state = alarm;
  }

  Future<void> toggleAlarm() async {
    final prefs = await SharedPreferences.getInstance();
    final alarm = prefs.getBool('alarm') ?? false;
    await prefs.setBool('alarm', !alarm);
    state = !alarm;
  }
}
