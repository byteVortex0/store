import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_container_linear_customer.dart';
import 'package:store/core/common/widgets/custom_favourite_button.dart';
import 'package:store/core/common/widgets/custom_share_button.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/string_extension.dart';

import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../features/customer/favourites/presentation/cubit/favourite_cubit.dart';
import '../../app/share/share_cubit.dart';
import '../../routes/app_routes.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
  });

  final List<String> imageUrl;
  final String title;
  final String categoryName;
  final double price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(AppRoutes.productDetails, arg: productId);
      },
      child: CustomContainerLinearCustomer(
        height: 250.h,
        width: 165.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<ShareCubit, ShareState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => CustomShareButton(
                          size: 25,
                          onTap: () {
                            context.read<ShareCubit>().sendDynamicLinkProduct(
                                  productId: productId.toString(),
                                  title: title,
                                  image: imageUrl[0],
                                );
                          },
                        ),
                        loading: (id) {
                          if (id == productId.toString()) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 15.h,
                              ),
                              child: SizedBox(
                                height: 25.h,
                                width: 25.w,
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: context.color.bluePinkLight,
                                ),
                              ),
                            );
                          }
                          return CustomShareButton(
                            size: 25,
                            onTap: () {},
                          );
                        },
                        success: () => CustomShareButton(
                          size: 25,
                          onTap: () {
                            context.read<ShareCubit>().sendDynamicLinkProduct(
                                  productId: productId.toString(),
                                  title: title,
                                  image: imageUrl[0],
                                );
                          },
                        ),
                      );
                    },
                  ),
                  BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      return CustomFavouriteButton(
                        size: 25,
                        isFavourite: context
                            .read<FavouriteCubit>()
                            .isFavourite(productId.toString()),
                        onTap: () async {
                          await context
                              .read<FavouriteCubit>()
                              .manageAddAndRemove(
                                productId: productId.toString(),
                                title: title,
                                image: imageUrl,
                                price: price,
                                categoryName: categoryName,
                              );
                        },
                      );
                    },
                  ),
                ],
              ),
              Flexible(
                child: CachedNetworkImage(
                  imageUrl: imageUrl[0].imageProductFormate(),
                  height: 200.h,
                  width: 120.w,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 70,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextApp(
                text: title,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              SizedBox(height: 5.h),
              TextApp(
                text: categoryName,
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 5.h),
              TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
