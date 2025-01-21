import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_linear_button.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

class SearchFilterButton extends StatelessWidget {
  const SearchFilterButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 300,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: CustomLinearButton(
          onPressed: onTap,
          height: 30.h,
          width: 100.w,
          child: TextApp(
            text: 'Search',
            theme: context.textStyle.copyWith(
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
