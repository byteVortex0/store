import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/add_notification/add_notification_bloc.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../../core/toast/show_toast.dart';

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
                  return 'At least enter the  4 characters';
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
                  return 'At least enter the  4 characters';
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
                if (p0!.isEmpty) {
                  return 'At least enter the  1 number';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            BlocConsumer<AddNotificationBloc, AddNotificationState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: 'Notification added successfully',
                    );
                  },
                  error: (error) => ShowToast.showToastErrorTop(
                    message: error,
                  ),
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: ColorsDark.white,
                    ),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: ColorsDark.blueDark,
                    ),
                  ),
                  orElse: () => CustomButton(
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validateCreateNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AddNotificationBloc>().add(
            AddNotificationEvent.addNotification(
              notification: AddNotificationModel(
                title: titleController.text.trim(),
                body: bodyController.text.trim(),
                productId: int.parse(productIdController.text.trim()),
                createdAt: DateTime.now(),
              ),
            ),
          );
    }
  }
}
