import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/add_notification/add_notification_bloc.dart';

import '../../../../../../core/toast/show_toast.dart';
import '../../blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';

class DeleteNotification extends StatelessWidget {
  const DeleteNotification({
    super.key,
    required this.notificationModel,
  });

  final AddNotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationBloc, AddNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllNotificationBloc>().add(
                  const GetAllNotificationEvent.getAllNotification(),
                );
            ShowToast.showToastSuccessTop(
              message: 'Your notification has been deleted',
            );
          },
          error: (error) => ShowToast.showToastErrorTop(
            message: error,
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          orElse: () => IconButton(
            onPressed: () {
              context.read<AddNotificationBloc>().add(
                    AddNotificationEvent.deleteNotification(
                      notificationModel: notificationModel,
                    ),
                  );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 25,
            ),
          ),
        );
      },
    );
  }
}
