import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
const MacOSInitializationSettings initializationSettingsMacOS = MacOSInitializationSettings();
const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, macOS: initializationSettingsMacOS);

Future<void> initLocalNotification() async {
  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
}

Future<void> showLocalNotification(RemoteMessage? message) async {
  if (message != null) {
    final random = Random();
    int next(int min, int max) => min + random.nextInt(max - min);

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel',
      'TokenSignal Notifications',
      channelDescription: 'Notifications for new token listings.',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      next(10000000, 99999999),
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: '{}',
    );
  }
}

Future onSelectNotification(String? event) async {}
