import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/data_extension.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/delete/delete_notification.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/edit/edit_notification.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/send/send_notification.dart';

import '../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({
    super.key,
    required this.notificationModel,
    required this.indexId,
  });

  final AddNotificationModel notificationModel;
  final int indexId;

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
            NotificationInfo(
              title: 'Title:',
              body: notificationModel.title,
            ),
            const Spacer(),
            NotificationInfo(
              title: 'Body:',
              body: notificationModel.body,
            ),
            const Spacer(),
            NotificationInfo(
              title: 'Create At:',
              body: notificationModel.createdAt.formattedDate,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DeleteNotification(
                  notificationModel: notificationModel,
                ),
                SizedBox(width: 40.w),
                EditNotification(
                  notificationModel: notificationModel,
                ),
                SizedBox(width: 40.w),
                SendNotification(
                  notificationModel: notificationModel,
                  indexId: indexId,
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
