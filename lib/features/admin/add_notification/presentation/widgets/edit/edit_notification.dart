import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';

import '../../../../../../core/common/button_sheet/custom_button_sheet.dart';
import '../../blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';
import 'edit_notification_buttom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({
    super.key,
    required this.notificationModel,
  });

  final AddNotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomBottonSheet.showBottomSheet(
          context: context,
          child: EditNotificationButtomSheet(
            notificationModel: notificationModel,
          ),
          whenComplete: () {
            context.read<GetAllNotificationBloc>().add(
                  const GetAllNotificationEvent.getAllNotification(),
                );
          },
        );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.yellow,
        size: 25,
      ),
    );
  }
}
