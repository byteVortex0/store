import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/common/widgets/custom_favourite_button.dart';
import '../../../../../core/common/widgets/custom_share_button.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../favourites/presentation/cubit/favourite_cubit.dart';
import '../../data/models/product_details_response.dart';
import '../widgets/product_details_image_slider.dart';

class ProductDetialsBody extends StatelessWidget {
  const ProductDetialsBody({
    super.key,
    required this.data,
  });

  final ProductData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 10.h, left: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BlocBuilder<ShareCubit, ShareState>(
                //   builder: (context, state) {
                //     return state.when(
                //       initial: () => CustomShareButton(
                //         size: 30,
                //         onTap: () {
                //           context.read<ShareCubit>().sendDynamicLinkProduct(
                //                 productId: data.id.toString(),
                //                 title: data.title!,
                //                 image: data.images![0],
                //               );
                //         },
                //       ),
                //       loading: (id) {
                //         if (id == data.id.toString()) {
                //           return Padding(
                //             padding: EdgeInsets.symmetric(
                //               horizontal: 20.w,
                //               vertical: 15.h,
                //             ),
                //             child: SizedBox(
                //               height: 25.h,
                //               width: 25.w,
                //               child: CircularProgressIndicator.adaptive(
                //                 backgroundColor: context.color.bluePinkLight,
                //               ),
                //             ),
                //           );
                //         }
                //         return CustomShareButton(
                //           size: 30,
                //           onTap: () {},
                //         );
                //       },
                //       success: () => CustomShareButton(
                //         size: 30,
                //         onTap: () {
                //           context.read<ShareCubit>().sendDynamicLinkProduct(
                //                 productId: data.id.toString(),
                //                 title: data.title!,
                //                 image: data.images![0],
                //               );
                //         },
                //       ),
                //     );
                //   },
                // ),

                CustomShareButton(
                  size: 30,
                  onTap: () {
                    Share.share(
                        'https://70f1-154-182-49-229.ngrok-free.app/product/${data.id}');
                  },
                ),

                BlocBuilder<FavouriteCubit, FavouriteState>(
                  builder: (context, state) {
                    return CustomFavouriteButton(
                      size: 30,
                      isFavourite: context
                          .read<FavouriteCubit>()
                          .isFavourite(data.id.toString()),
                      onTap: () async {
                        await context.read<FavouriteCubit>().manageAddAndRemove(
                              productId: data.id.toString(),
                              title: data.title!,
                              image: data.images!,
                              price: data.price!,
                              categoryName: data.category!.name!,
                            );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            ProductDetailsImageSlider(
              images: data.images!,
              // [
              //   'https://images.unsplash.com/photo-1737233347389-24bc3f3fe3a1?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              //   'https://images.unsplash.com/photo-1737233504527-c5033f0f1430?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              // ],
            ),
            SizedBox(height: 30.h),
            TextApp(
              text: data.title!,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 15.h),
            TextApp(
              text: data.description!,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                height: 1.5,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
