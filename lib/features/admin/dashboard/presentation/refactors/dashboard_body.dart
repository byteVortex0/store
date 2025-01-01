import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/style/images/app_images.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_categories/number_of_categories_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_products/number_of_products_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

import '../blocs/number_of_users/number_of_users_bloc.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          context
              .read<NumberOfProductsBloc>()
              .add(const NumberOfProductsEvent.numberOfProducts());
          context
              .read<NumberOfCategoriesBloc>()
              .add(const NumberOfCategoriesEvent.numberOfCategories());
          context
              .read<NumberOfUsersBloc>()
              .add(const NumberOfUsersEvent.numberOfUsers());
        },
        child: ListView(
          children: [
            BlocBuilder<NumberOfProductsBloc, NumberOfProductsState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Products',
                      number: '',
                      image: AppImages.productsDrawer,
                      isLoading: true,
                    );
                  },
                  success: (numberOfProducts) {
                    return DashboardContainer(
                      title: 'Products',
                      number: numberOfProducts,
                      image: AppImages.productsDrawer,
                      isLoading: false,
                    );
                  },
                  error: (error) {
                    return TextApp(
                      text: errorMassage,
                      theme: context.textStyle.copyWith(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            BlocBuilder<NumberOfCategoriesBloc, NumberOfCategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Categories',
                      number: '',
                      image: AppImages.categoriesDrawer,
                      isLoading: true,
                    );
                  },
                  success: (numberOfCategories) {
                    return DashboardContainer(
                      title: 'Categories',
                      number: numberOfCategories,
                      image: AppImages.categoriesDrawer,
                      isLoading: false,
                    );
                  },
                  error: (error) {
                    return TextApp(
                      text: errorMassage,
                      theme: context.textStyle.copyWith(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            BlocBuilder<NumberOfUsersBloc, NumberOfUsersState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Users',
                      number: '',
                      image: AppImages.usersDrawer,
                      isLoading: true,
                    );
                  },
                  success: (numberOfUsers) {
                    return DashboardContainer(
                      title: 'Users',
                      number: numberOfUsers,
                      image: AppImages.usersDrawer,
                      isLoading: false,
                    );
                  },
                  error: (error) {
                    return TextApp(
                      text: errorMassage,
                      theme: context.textStyle.copyWith(
                        fontSize: 16.sp,
                        color: Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
