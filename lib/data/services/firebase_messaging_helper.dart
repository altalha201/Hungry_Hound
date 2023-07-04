import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import '../data_utils/utils.dart';

class FirebaseMessagingHelper {

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("User Granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("User permission granted provisional");
    } else {
      log("User deny permission");
    }

    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      messageHandler(message);
    }
    FirebaseMessaging.onMessage.listen(messageHandler);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();

    log("Handling a background message: ${message.messageId}");
  }

  Future<void> messageHandler(RemoteMessage message) async {
    log(message.notification?.title ?? 'Null title');
    log(message.notification?.body ?? 'Null body');
  }

  Future<void> sendNotification(
      String title, String message, String token) async {
    try {
      http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          "Content-Type" : "application/json",
          "Authorization" : "key=$securityCode",
        },
        body: jsonEncode({
          'notification' : {
            'title' : title,
            'body' : message
          },
          'priority' : 'high',
          'data' : {
            'click_action' : 'FLUTTER_NOTIFICATION_CLICK',
            'id' : 1,
            'status' : message
          },
          'to' : token
        }),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
