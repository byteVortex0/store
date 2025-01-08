import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_drop_down.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import 'update_products_image.dart';

class UpdateProductsButtomSheet extends StatefulWidget {
  const UpdateProductsButtomSheet({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String price;

  @override
  State<UpdateProductsButtomSheet> createState() =>
      _UpdateProductsButtomSheetState();
}

class _UpdateProductsButtomSheetState extends State<UpdateProductsButtomSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String? categoryName;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    priceController.text = widget.price;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: SizedBox(
          height: 600.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: TextApp(
                    text: 'Update Products',
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
                const UpdateproductsImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1719937206667-ac87c15ad3e9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                SizedBox(height: 20.h),
                TextApp(
                  textAlign: TextAlign.right,
                  text: 'Title',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: titleController,
                  hintText: 'Title',
                  validator: (p0) {
                    if (p0!.isEmpty || p0.length < 4) {
                      return 'Enter Product Title';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10.h),
                TextApp(
                  textAlign: TextAlign.right,
                  text: 'Price',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  hintText: 'Price',
                  validator: (p0) {
                    if (p0!.isEmpty || p0.length < 4) {
                      return 'Enter Product Price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                TextApp(
                  textAlign: TextAlign.right,
                  text: 'Description',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  validator: (p0) {
                    if (p0!.isEmpty || p0.length < 4) {
                      return 'Enter Description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                TextApp(
                  textAlign: TextAlign.right,
                  text: 'Category',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomCreateDropDown(
                  items: const ['Mac', 'Air', 'lap'],
                  hintText: 'Mac Book',
                  onChanged: (value) {
                    setState(() {
                      categoryName = value;
                    });
                  },
                  value: categoryName,
                ),
                SizedBox(height: 20.h),
                /*BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
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
                      orElse: () => */
                CustomButton(
                  onPressed: () {
                    // _validateCreateCategory(context);
                  },
                  text: 'Update product',
                  textColor: ColorsDark.blueDark,
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  lastRadius: 20.r,
                  threeRadius: 20.r,
                  backgroundColor: ColorsDark.white,
                ),
                // ) ;
                //},
                // ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
