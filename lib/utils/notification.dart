import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roumo_flutter/provider/notification/notification_provider.dart';

Future<void> cancelNotification(WidgetRef ref) async {
  ref
      .read(notificationProvider)
      .whenData((notification) => notification.cancelAll());
}

Future<bool> requestPermissions(WidgetRef ref) async {
  final state = ref.read(notificationProvider).whenData((notification) async {
    var result = false;

    if (Platform.isIOS) {
      result = await notification
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    } else {
      result = await notification
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestPermission() ??
          false;
    }
    return result;
  });
  return (await state.value) ?? false;
}
