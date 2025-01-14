import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/edit/edit_notification.dart';

import '../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const NotificationInfo(
              title: 'Title:',
              body: 'hiiiiiiiiii',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Body:',
              body: 'hiiiiiiiiii',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Create At:',
              body: '1-14-2024',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 40.w),
                const EditNotification(),
                SizedBox(width: 40.w),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: Colors.white,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(width: 8.w),
        TextApp(
          text: body,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: ColorsDark.blueLight,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ],
    );
  }
}
