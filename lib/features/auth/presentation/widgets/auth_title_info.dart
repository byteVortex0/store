import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          Text(
            title,
            style: context.textStyle.copyWith(
              fontSize: 24.sp,
              color: context.color.textColor,
              fontWeight: FontWeightHelper.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            description,
            style: context.textStyle.copyWith(
              fontSize: 16.sp,
              color: context.color.textColor,
              fontWeight: FontWeightHelper.medium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
