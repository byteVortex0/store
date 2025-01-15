import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';

import '../../../../../../core/toast/show_toast.dart';
import '../../blocs/send_notification/send_notification_bloc.dart';

class SendNotification extends StatelessWidget {
  const SendNotification({
    super.key,
    required this.notificationModel,
    required this.indexId,
  });

  final AddNotificationModel notificationModel;
  final int indexId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllNotificationBloc>().add(
                  const GetAllNotificationEvent.getAllNotification(),
                );

            ShowToast.showToastSuccessTop(
              message: 'Your notification has been sent',
            );
          },
          error: (error) => ShowToast.showToastErrorTop(
            message: error,
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == indexId) {
              return SizedBox(
                height: 25.h,
                width: 25.w,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            } else {
              return const Icon(
                Icons.send,
                color: Colors.green,
                size: 25,
              );
            }
          },
          orElse: () => IconButton(
            onPressed: () {
              context.read<SendNotificationBloc>().add(
                    SendNotificationEvent.sendNotification(
                      title: notificationModel.title,
                      body: notificationModel.body,
                      productId: notificationModel.productId,
                      indexId: indexId,
                    ),
                  );
            },
            icon: const Icon(
              Icons.send,
              color: Colors.green,
              size: 25,
            ),
          ),
        );
      },
    );
  }
}
