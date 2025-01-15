import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../data/models/add_notification_model.dart';

class EditNotificationButtomSheet extends StatefulWidget {
  const EditNotificationButtomSheet({
    super.key,
    required this.notificationModel,
  });

  final AddNotificationModel notificationModel;

  @override
  State<EditNotificationButtomSheet> createState() =>
      _EditNotificationButtomSheetState();
}

class _EditNotificationButtomSheetState
    extends State<EditNotificationButtomSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.notificationModel.title;
    bodyController.text = widget.notificationModel.body;
    productIdController.text = widget.notificationModel.productId.toString();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: TextApp(
                text: 'Edit Notification',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.right,
              text: 'Edit the notification title',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
              validator: (p0) {
                if (p0!.isEmpty || p0.length < 4) {
                  return 'At least enter the  4 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.right,
              text: 'Edit the notification body',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: bodyController,
              hintText: 'Body',
              validator: (p0) {
                if (p0!.isEmpty || p0.length < 4) {
                  return 'At least enter the  4 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.right,
              text: 'Edit the notification product id',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: productIdController,
              hintText: 'Product id',
              keyboardType: TextInputType.number,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'At least enter the 1 number';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                _validateEditNotification(context);
              },
              text: 'Edit a Notification',
              textColor: ColorsDark.blueDark,
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              lastRadius: 20.r,
              threeRadius: 20.r,
              backgroundColor: ColorsDark.white,
            ),
          ],
        ),
      ),
    );
  }

  void _validateEditNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      widget.notificationModel.title = titleController.text.isEmpty
          ? widget.notificationModel.title
          : titleController.text.trim();
      widget.notificationModel.body = bodyController.text.isEmpty
          ? widget.notificationModel.body
          : bodyController.text.trim();
      widget.notificationModel.productId = productIdController.text.isEmpty
          ? widget.notificationModel.productId
          : int.parse(productIdController.text.trim());

      widget.notificationModel.save();
      context.pop();
    }
  }
}
