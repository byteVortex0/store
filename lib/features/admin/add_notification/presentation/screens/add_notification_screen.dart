import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/send_notification/send_notification_bloc.dart';
import 'package:store/features/admin/add_notification/presentation/refactors/add_notification_body.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../blocs/add_notification/add_notification_bloc.dart';
import '../blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllNotificationBloc>()
            ..add(
              const GetAllNotificationEvent.getAllNotification(),
            ),
        ),
        BlocProvider(
          create: (context) => sl<AddNotificationBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SendNotificationBloc>(),
        ),
      ],
      child: const Scaffold(
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Notification',
        ),
        body: AddNotificationBody(),
      ),
    );
  }
}
