import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_container_linear_admin.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class AddCategoryItem extends StatelessWidget {
  const AddCategoryItem({
    super.key,
    required this.name,
    required this.categoryId,
    required this.image,
  });

  final String name;
  final String categoryId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextApp(
                  text: name,
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                imageUrl: image,
                height: 90.h,
                width: 120.w,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
