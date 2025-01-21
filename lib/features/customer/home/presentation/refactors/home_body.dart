import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_button.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/loading/loading_shimmer.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/customer/home/presentation/widgets/banners/banner_sliders.dart';
import 'package:store/features/customer/home/presentation/widgets/categories/categories_list.dart';
import 'package:store/features/customer/home/presentation/widgets/products/products_list.dart';
import 'package:store/features/customer/home/presentation/widgets/products/products_shimmer.dart';

import '../blocs/get_banners/get_banners_bloc.dart';
import '../blocs/get_categories/get_categories_bloc.dart';
import '../blocs/get_products/get_products_bloc.dart';
import '../widgets/categories/categories_shimmer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<GetBannersBloc>().add(const GetBannersEvent.getBanners());
        context
            .read<GetCategoriesBloc>()
            .add(const GetCategoriesEvent.getCategories());
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                return state.when(
                  loading: () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: LoadingShimmer(
                      height: 160.h,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  success: (imagesList) => BannerSliders(
                    images: imagesList,
                  ),
                  empty: () => const SizedBox.shrink(),
                  error: Text.new,
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const CategoriesShimmer(),
                  success: (categories) =>
                      CategoriesList(categories: categories),
                  empty: () => SizedBox(
                    height: 10.h,
                  ),
                  error: Text.new,
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: BlocBuilder<GetProductsBloc, GetProductsState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const ProductsShimmer(),
                  success: (products) => ProductsList(products: products),
                  empty: () => SizedBox(height: 10.h),
                  error: Text.new,
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: BlocBuilder<GetProductsBloc, GetProductsState>(
              builder: (context, state) {
                if (context.read<GetProductsBloc>().isLessTenItem) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: CustomButton(
                      onPressed: () {
                        context.pushName(AppRoutes.productsViewAll);
                      },
                      text: context.translate(LangKeys.viewAll),
                      lastRadius: 10.r,
                      threeRadius: 10.r,
                      backgroundColor: context.color.bluePinkDark,
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60.h)),
        ],
      ),
    );
  }
}
