import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/common/widgets/custom_button.dart';
import 'package:store/core/common/widgets/custom_container_linear_admin.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/category_upload_image.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../../core/toast/show_toast.dart';
import '../../blocs/create_category/create_category_bloc.dart';

class CreateCategoryButtomSheet extends StatefulWidget {
  const CreateCategoryButtomSheet({super.key});

  @override
  State<CreateCategoryButtomSheet> createState() =>
      _CreateCategoryButtomSheetState();
}

class _CreateCategoryButtomSheetState extends State<CreateCategoryButtomSheet> {
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
            Align(
              child: TextApp(
                text: 'Create Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.bold,
                ),
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
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    if (context.read<UploadImageCubit>().imageUrl.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return CustomButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      text: 'Remove',
                      width: 120.w,
                      height: 35.h,
                      lastRadius: 10.r,
                      threeRadius: 10.r,
                      backgroundColor: Colors.red,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const CategoryUploadImage(),
            SizedBox(height: 20.h),
            TextApp(
              textAlign: TextAlign.right,
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
            BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (category) {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: '${nameController.text} Created Success',
                      seconds: 2,
                    );
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
                      _validateCreateCategory(context);
                    },
                    text: 'Create a new category',
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

  void _validateCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().imageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().imageUrl.isEmpty) {
        return ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      }
      context.read<CreateCategoryBloc>().add(
            AddCategoryEvent(
              categoryRequest: CreateCategoryRequest(
                  name: nameController.text.trim(),
                  image: context.read<UploadImageCubit>().imageUrl),
            ),
          );
    }
  }
}
