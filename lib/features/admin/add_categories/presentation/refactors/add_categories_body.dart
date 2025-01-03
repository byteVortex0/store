import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/loading/empty_screen.dart';
import 'package:store/core/loading/loading_shimmer.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
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
                onRefresh: () async {
                  context.read<GetAllAdminCategoriesBloc>().add(
                        const GetAllAdminCategoriesEvent.fetchAllCategories(
                            isNotLoading: true),
                      );
                },
                color: ColorsDark.blueLight,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20.h),
                    ),
                    SliverToBoxAdapter(
                      child: BlocBuilder<GetAllAdminCategoriesBloc,
                          GetAllAdminCategoriesState>(
                        builder: (context, state) {
                          return state.when(
                            loading: () => ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  const LoadingShimmer(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15.h),
                              itemCount: 4,
                            ),
                            success: (categories) => ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => AddCategoryItem(
                                name: shortenText(
                                    categories.getCategoriesList[index].name ??
                                        ''),
                                categoryId:
                                    categories.getCategoriesList[index].id ??
                                        '',
                                image:
                                    categories.getCategoriesList[index].image ??
                                        '',
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15.h),
                              itemCount: categories.getCategoriesList.length,
                            ),
                            empty: EmptyScreen.new,
                            error: Text.new,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  String shortenText(String text) {
    if (text.length > 15) {
      return '${text.substring(0, 15)}...';
    }
    return text;
  }
}
