import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:token_signal_app/src/notification.local.dart';

void listenToFCM() {
  FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  FirebaseMessaging.onMessage.listen(_onMessage);
}

/// When the app is in the background
/// *(not visible on screen but not terminated either)*
void _onMessageOpenedApp(RemoteMessage event) {}

/// When the app is in the foreground *(visible on screen).*
void _onMessage(RemoteMessage event) {
  try {
    // When the app is in the foreground, FCM will never show a notification.
    // The package called `flutter_local_notification` is needed for this.
    showLocalNotification(event);
  } catch (e, trace) {
    if (kDebugMode) {
      print(e.toString());
      print(trace.toString());
    }
  }
}
