import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_button.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/category_upload_image.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';

class CreatCategoryButtomSheet extends StatefulWidget {
  const CreatCategoryButtomSheet({super.key});

  @override
  State<CreatCategoryButtomSheet> createState() =>
      _CreatCategoryButtomSheetState();
}

class _CreatCategoryButtomSheetState extends State<CreatCategoryButtomSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
            TextApp(
              text: 'Create Category',
              theme: context.textStyle.copyWith(
                fontSize: 20.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Add a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Remove',
                  width: 120.w,
                  height: 35.h,
                  lastRadius: 10.r,
                  threeRadius: 10.r,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const CategoryUploadImage(),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Enter the category name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: nameController,
              hintText: 'Category Name',
              validator: (p0) {
                if (p0!.isEmpty || p0.length < 4) {
                  return 'Enter Category Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {},
              text: 'Create a new category',
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
}
