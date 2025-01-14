import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';

class CreateNotificationButtomSheet extends StatefulWidget {
  const CreateNotificationButtomSheet({super.key});

  @override
  State<CreateNotificationButtomSheet> createState() =>
      _CreateNotificationButtomSheetState();
}

class _CreateNotificationButtomSheetState
    extends State<CreateNotificationButtomSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

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
                text: 'Add Notification',
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
              text: 'Enter the notification title',
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
                  return 'Enter the notification title';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.right,
              text: 'Enter the notification body',
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
                  return 'Enter the notification body';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.right,
              text: 'Enter the notification product id',
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
                if (p0!.isEmpty || p0.length < 4) {
                  return 'Enter the notification product id';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                _validateCreateNotification(context);
              },
              text: 'Add a Notification',
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

  void _validateCreateNotification(BuildContext context) {}
}
