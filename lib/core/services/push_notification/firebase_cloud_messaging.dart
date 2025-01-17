import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:store/core/app/env_variables.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/toast/show_toast.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();

  factory FirebaseCloudMessaging() => instance;

  static const String subscribeTopic = "products_topic";

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  ValueNotifier<bool> isNotificationSubscribed = ValueNotifier(true);

  bool isPeremisionNotification = false;

  Future<void> init() async {
    await notificationPermission();
  }

  Future<void> controlerForUserNotification(BuildContext context) async {
    if (isPeremisionNotification == false) {
      await notificationPermission();
    } else {
      if (isNotificationSubscribed.value == false) {
        await subscribeNotification();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.subscribeToNotification),
          seconds: 2,
        );
      } else {
        await unsubscribeNotification();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.unsubscribeToNotification),
          seconds: 2,
        );
      }
    }
  }

  Future<void> notificationPermission() async {
    NotificationSettings settings =
        await firebaseMessaging.requestPermission(badge: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
      isPeremisionNotification = true;
      await subscribeNotification();
    } else {
      log('User declined or has not accepted permission');
      isPeremisionNotification = false;
      isNotificationSubscribed.value = false;
    }
  }

  Future<void> subscribeNotification() async {
    isNotificationSubscribed.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(subscribeTopic);
    log('Notification subscribed');
  }

  Future<void> unsubscribeNotification() async {
    isNotificationSubscribed.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscribeTopic);
    log('Notification unsubscribed');
  }

  // get the API token.
  Future<String?> getApiToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "store-1b454",
      "private_key_id": "5e3d8075b2699fc41fff17eb4e860a7c2bcf3ccf",
      "private_key": EnvVariables.instance.privateKey,
      "client_email":
          "firebase-adminsdk-ictnf@store-1b454.iam.gserviceaccount.com",
      "client_id": "106480677449287618004",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ictnf%40store-1b454.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials accessCredentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

      client.close();

      log(accessCredentials.accessToken.data);

      return accessCredentials.accessToken.data;
    } catch (e) {
      log("Error getting access token: $e");
      return null;
    }
  }

  //send notification
  Future<void> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      // Get the API token
      final token = await getApiToken();

      if (token == null) {
        log('Failed to get API token.');
        return;
      }

      final response = await Dio().post<dynamic>(
        EnvVariables.instance.notificationBaseUrl,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          "message": {
            "topic": subscribeTopic,
            // "token": '/topics/$subscribeTopic',
            "notification": {
              "title": title,
              "body": body,
            },
          },
          // "data": {
          //   "productId": productId,
          // }
        },
      );

      log('Notification sent: ${response.data}');
    } catch (e) {
      log('Error sending notification: $e');
    }
  }
}
