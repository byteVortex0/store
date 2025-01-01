import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/style/images/app_images.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: RefreshIndicator.adaptive(
        onRefresh: () async {},
        child: ListView(
          children: [
            const DashboardContainer(
              title: 'Products',
              number: '0',
              image: AppImages.productsDrawer,
              isLoading: false,
            ),
            SizedBox(height: 20.h),
            const DashboardContainer(
              title: 'Categories',
              number: '10',
              image: AppImages.categoriesDrawer,
              isLoading: false,
            ),
            SizedBox(height: 20.h),
            const DashboardContainer(
              title: 'Users',
              number: '1000',
              image: AppImages.usersDrawer,
              isLoading: false,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
