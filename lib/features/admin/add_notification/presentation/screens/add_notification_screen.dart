import 'package:flutter/material.dart';
import 'package:store/features/admin/add_notification/presentation/refactors/add_notification_body.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Notification',
      ),
      body: AddNotificationBody(),
    );
  }
}
