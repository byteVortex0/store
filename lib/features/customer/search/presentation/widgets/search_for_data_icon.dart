import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class SearchForDataIcon extends StatelessWidget {
  const SearchForDataIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search_sharp,
          size: 120.sp,
          color: context.color.textColor,
        ),
        SizedBox(height: 10.h),
        TextApp(
          text: 'Search For Products',
          theme: context.textStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        )
      ],
    );
  }
}
