import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/toast/show_toast.dart';
import '../blocs/delete_user/delete_user_bloc.dart';
import '../blocs/get_all_users/get_all_users_bloc.dart';

class DeletUserWidget extends StatelessWidget {
  const DeletUserWidget({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserBloc, DeleteUserState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllUsersBloc>().add(
                  const GetAllUsersEvent.getAllUsers(isNotLoading: false),
                );
            ShowToast.showToastSuccessTop(
              message: 'Your user has been deleted',
            );
          },
          error: (error) => ShowToast.showToastErrorTop(
            message: error,
          ),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (userId) {
            if (userId == id) {
              return SizedBox(
                height: 30.h,
                width: 30.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else {
              return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
              );
            }
          },
          orElse: () => IconButton(
            onPressed: () {
              context.read<DeleteUserBloc>().add(
                    DeleteUserEvent.deleteUser(id: id),
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
