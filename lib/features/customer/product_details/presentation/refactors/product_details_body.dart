import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/common/widgets/custom_favourite_button.dart';
import '../../../../../core/common/widgets/custom_share_button.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShareButton(size: 30),
                CustomFavouriteButton(size: 30),
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
