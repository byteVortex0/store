import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_category.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            const CreateCategory(),
            Expanded(
              child: RefreshIndicator.adaptive(
                  color: ColorsDark.blueLight,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),
                      SliverToBoxAdapter(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              const AddCategoryItem(
                            name: 'Mac Book',
                            categoryId: '1',
                            image:
                                'https://images.unsplash.com/photo-1595675024853-0f3ec9098ac7?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.h),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                  onRefresh: () async {}),
            ),
          ],
        ));
  }
}
