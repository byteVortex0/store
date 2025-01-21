import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';

class SearchNamePriceButtons extends StatelessWidget {
  const SearchNamePriceButtons({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          color:
              isSelected ? context.color.bluePinkDark : context.color.navBarbg,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Align(
          alignment: Alignment.center,
          child: TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ),
    );
  }
}
