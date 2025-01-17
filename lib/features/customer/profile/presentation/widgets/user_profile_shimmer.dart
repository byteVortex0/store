import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/loading/loading_shimmer.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingShimmer(height: 88.h, width: 88.w, borderRadius: 45.r),
        SizedBox(height: 7.h),
        LoadingShimmer(height: 18.h, width: 100.w),
        SizedBox(height: 7.h),
        LoadingShimmer(height: 14.h, width: 150.w),
      ],
    );
  }
}
