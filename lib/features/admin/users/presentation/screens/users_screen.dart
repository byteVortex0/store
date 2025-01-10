import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/features/admin/users/presentation/blocs/delete_user/delete_user_bloc.dart';
import 'package:store/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';
import 'package:store/features/admin/users/presentation/refactors/users_body.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllUsersBloc>()
            ..add(const GetAllUsersEvent.getAllUsers(isNotLoading: true)),
        ),
        BlocProvider(
          create: (context) => sl<DeleteUserBloc>(),
        ),
      ],
      child: const Scaffold(
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Users',
        ),
        body: UsersBody(),
      ),
    );
  }
}
