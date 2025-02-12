import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:softbenz_task/features/product_detail/page/product_detail_view.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void localNotificationInit(
      BuildContext context, RemoteMessage message) async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    if (message.notification == null || message.notification!.title == null) {
      print("Notification data is incomplete");
      return;
    }

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100).toString(),
      "High Importance Notification",
      importance: Importance.max,
      playSound: true,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Description",
      importance: Importance.high,
      playSound: true,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher',
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      NotificationDetails(android: androidNotificationDetails),
    );
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'msg') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductDetailView()));
    }
  }

  Future<void> handleNotificationClickEventOnBackground(
      BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  notificationInit() {
    FirebaseMessaging.onMessage.listen((notification) {
      if (kDebugMode) {
        print(notification.notification!.title);
        print(notification.notification!.body);
        print(notification.data.toString());
        print(notification.data['type']);
        print(notification.data['id']);
      }
      if (Platform.isAndroid) {
        showNotification(notification);
      }
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      provisional: true,
      criticalAlert: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void refreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}
