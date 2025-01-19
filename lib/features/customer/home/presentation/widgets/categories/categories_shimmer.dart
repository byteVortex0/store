import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/loading/loading_shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          itemCount: 7,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              LoadingShimmer(
                height: 71.h,
                width: 71.w,
                borderRadius: 15.r,
              ),
              SizedBox(height: 10.h),
              LoadingShimmer(
                height: 35.h,
                width: 75.w,
                borderRadius: 15.r,
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
        ),
      ),
    );
  }
}
