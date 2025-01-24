import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/services/push_notification/local_notification.dart';

import '../../routes/app_routes.dart';

class FirebaseMessagingNavigate {
  //forground
  static Future<void> forGroundHandler(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotification.showNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data['productId'].toString(),
      );
    }
  }

  //background
  static void backGroundHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  //terminate
  static void terminateHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  static void _navigate(RemoteMessage message) {
    if (int.parse(message.data['productId'].toString()) == -1) return;
    sl<GlobalKey<NavigatorState>>().currentState!.context.pushName(
          AppRoutes.productDetails,
          arg: int.parse(message.data['productId'].toString()),
        );
  }
}
