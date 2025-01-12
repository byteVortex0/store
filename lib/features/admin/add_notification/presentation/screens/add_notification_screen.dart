import 'package:flutter/material.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/services/push_notification/firebase_cloud_messaging.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Notification',
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            FirebaseCloudMessaging().sendNotification(
              title: 'hiiiiii',
              body: 'hiiiiiiii',
              productId: -1,
            );
          },
          child: const Text(
            'Send Notification',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
