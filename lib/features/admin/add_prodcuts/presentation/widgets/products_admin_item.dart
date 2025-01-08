import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/string_extension.dart';
import 'package:store/features/admin/add_prodcuts/presentation/widgets/update/update_products_buttom_sheet.dart';

import '../../../../../core/common/button_sheet/custom_button_sheet.dart';
import '../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class ProductsAdminItem extends StatelessWidget {
  const ProductsAdminItem({
    super.key,
    required this.title,
    required this.categoryName,
    required this.imageUrl,
    required this.price,
  });

  final String title;
  final String categoryName;
  final String imageUrl;
  final String price;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    //TODO:
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    CustomBottonSheet.showBottomSheet(
                      context: context,
                      child: const UpdateProductsButtomSheet(
                        id: '1',
                        title: 'title',
                        description: 'categoryName',
                        imageUrl:
                            'https://images.unsplash.com/photo-1719937206667-ac87c15ad3e9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        price: '\$ 1200',
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                imageUrl: imageUrl.imageProductFormate(),
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
              theme: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 5.h),
            TextApp(
              text: categoryName,
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 5.h),
            TextApp(
              text: '\$ $price',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
