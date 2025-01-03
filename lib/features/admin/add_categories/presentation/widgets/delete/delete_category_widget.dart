import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/toast/show_toast.dart';
import '../../blocs/delete_category/delete_category_bloc.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryBloc, DeleteCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllAdminCategoriesBloc>().add(
                  const GetAllAdminCategoriesEvent.fetchAllCategories(
                    isNotLoading: false,
                  ),
                );
            ShowToast.showToastSuccessTop(
              message: 'Your category has been deleted',
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(
              message: error,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (categoryId) {
            if (categoryId == id) {
              return SizedBox(
                height: 15.h,
                width: 15.w,
                child: const CircularProgressIndicator(
                  color: ColorsDark.white,
                ),
              );
            } else {
              return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              );
            }
          },
          orElse: () => IconButton(
            onPressed: () {
              context.read<DeleteCategoryBloc>().add(
                    DeleteCategoryEvent.removeCategory(id: id),
                  );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
