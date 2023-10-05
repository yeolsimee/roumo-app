import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final notificationProvider = FutureProvider((ref) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await _configureLocalTimeZone();
  await _initializeNotification(flutterLocalNotificationsPlugin);
  return flutterLocalNotificationsPlugin;
});


Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  // get local time zone
  final timeZoneName = Intl.defaultLocale ?? 'Asia/Seoul';
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

Future<void> _initializeNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    ) async {
  const initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const initializationSettingsAndroid =
  AndroidInitializationSettings('ic_notification');

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
