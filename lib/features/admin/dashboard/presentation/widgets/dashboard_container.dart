import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_container_linear_admin.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/loading/loading_shimmer.dart';
import 'package:store/core/style/fonts/font_family_helper.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
  });

  final String title;
  final String number;
  final String image;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                const Spacer(),
                isLoading
                    ? LoadingShimmer(height: 30.h, width: 100.w)
                    : TextApp(
                        text: number,
                        theme: context.textStyle.copyWith(
                          fontSize: 18.sp,
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 90.h,
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
