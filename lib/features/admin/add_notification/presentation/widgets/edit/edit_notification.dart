import 'package:flutter/material.dart';

import '../../../../../../core/common/button_sheet/custom_button_sheet.dart';
import 'edit_notification_buttom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomBottonSheet.showBottomSheet(
          context: context,
          child: const EditNotificationButtomSheet(),
        );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }
}
