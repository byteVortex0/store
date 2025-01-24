import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../di/injection_container.dart';
import '../../routes/app_routes.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static void onTap(NotificationResponse details) {
    if (int.parse(details.payload.toString()) == -1) return;
    sl<GlobalKey<NavigatorState>>().currentState!.context.pushName(
          AppRoutes.productDetails,
          arg: int.parse(details.payload.toString()),
        );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      payload: payload,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'store_id',
          'store_name',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}
