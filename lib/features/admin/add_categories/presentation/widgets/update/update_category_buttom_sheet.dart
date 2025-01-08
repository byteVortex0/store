import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/update/update_upload_image.dart';

import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../../core/toast/show_toast.dart';
import '../../../data/models/update_category_request.dart';
import '../../blocs/update_category/update_category_bloc.dart';

class UpdateCategoryButtomSheet extends StatefulWidget {
  const UpdateCategoryButtomSheet({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  @override
  State<UpdateCategoryButtomSheet> createState() =>
      _UpdateCategoryButtomSheetState();
}

class _UpdateCategoryButtomSheetState extends State<UpdateCategoryButtomSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

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
            Align(
              child: TextApp(
                text: 'Update Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Update a photo',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            SizedBox(height: 10.h),
            UpdateUploadImage(imageUrl: widget.imageUrl),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.start,
              text: 'Update the category name',
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
            BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    ShowToast.showToastSuccessTop(
                      message: '${nameController.text} has been updated',
                    );
                    context.pop();
                  },
                  error: (error) {
                    ShowToast.showToastErrorTop(
                      message: error,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => CustomContainerLinearAdmin(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: ColorsDark.blueDark,
                      ),
                    ),
                  ),
                  orElse: () => CustomButton(
                    onPressed: () {
                      _validateUpdateCategory(context);
                    },
                    text: 'Update a new category',
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

  void _validateUpdateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<UpdateCategoryBloc>().add(
            EditCategoryEvent(
              body: UpdateCategoryRequest(
                id: widget.id,
                name: nameController.text.trim(),
                image: context.read<UploadImageCubit>().imageUrl.isNotEmpty
                    ? context.read<UploadImageCubit>().imageUrl
                    : widget.imageUrl,
              ),
            ),
          );
    }
  }
}
