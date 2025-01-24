import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../core/style/images/app_images.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.isSeen,
    required this.onTapSelected,
    required this.onTapRemoved,
  });

  final String title;
  final String description;
  final String createdAt;
  final bool isSeen;
  final VoidCallback onTapSelected;
  final VoidCallback onTapRemoved;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTapSelected,
      leading: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.notificationIcon,
            height: 30.h,
            // ignore: deprecated_member_use
            color: Colors.pink,
          ),
        ),
      ),
      title: TextApp(
        text: title,
        theme: context.textStyle.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeightHelper.regular,
            ),
          ),
          SizedBox(height: 5.h),
          TextApp(
            text: createdAt,
            theme: context.textStyle.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeightHelper.regular,
            ),
          ),
          Divider(color: isSeen ? Colors.grey : Colors.white),
        ],
      ),
      trailing: IconButton(
        onPressed: onTapRemoved,
        icon: Icon(
          Icons.close,
          color: Colors.yellow,
          size: 25.sp,
        ),
      ),
    );
  }
}
