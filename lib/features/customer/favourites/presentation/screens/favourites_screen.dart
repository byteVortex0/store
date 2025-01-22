import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/customer/favourites/presentation/cubit/favourite_cubit.dart';

import '../../../../../core/common/widgets/custom_product_item.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          final cubit = context.read<FavouriteCubit>();
          if (cubit.getFavouritesList.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount:
                  context.read<FavouriteCubit>().getFavouritesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 165 / 250,
              ),
              itemBuilder: (context, index) {
                final list = context.read<FavouriteCubit>().getFavouritesList;
                return CustomProductsItem(
                  imageUrl: list[index].image!,
                  title: list[index].title ?? '',
                  price: list[index].price ?? 0.0,
                  categoryName: list[index].categoryName ?? '',
                  productId: int.parse(list[index].id ?? '0'),
                );
              },
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 100.sp,
                ),
                10.verticalSpace,
                TextApp(
                  text: 'No favourites yet',
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
