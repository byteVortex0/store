import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/loading/empty_screen.dart';
import 'package:store/core/loading/loading_shimmer.dart';
import 'package:store/features/customer/category_details/presentation/blocs/get_category_details/get_category_details_bloc.dart';

import '../../../../../core/common/widgets/custom_product_item.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<GetCategoryDetailsBloc, GetCategoryDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 165 / 250,
              ),
              itemBuilder: (context, index) => LoadingShimmer(
                height: 250.h,
                width: 165.w,
              ),
            ),
            success: (data) => GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: data.getProductsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 165 / 250,
              ),
              itemBuilder: (context, index) => CustomProductsItem(
                imageUrl: data.getProductsList[index].images!,
                title: data.getProductsList[index].title ?? '',
                price: data.getProductsList[index].price ?? 0.0,
                categoryName: data.getProductsList[index].category!.name ?? '',
                productId: int.parse(data.getProductsList[index].id ?? '0'),
              ),
            ),
            empty: EmptyScreen.new,
            error: Text.new,
          );
        },
      ),
    );
  }
}
