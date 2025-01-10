import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget(
      {super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20.sp,
          ),
          SizedBox(width: 5.w),
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontFamily: FontFamilyHelper.poppinsEnglish,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ],
      ),
    );
  }
}
