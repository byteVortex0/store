import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';

import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../../core/toast/show_toast.dart';
import '../../../data/models/create_products_request_body.dart';
import '../../blocs/create_products/create_products_bloc.dart';
import 'products_upload_image.dart';

class CreateProductsButtomSheet extends StatefulWidget {
  const CreateProductsButtomSheet({super.key});

  @override
  State<CreateProductsButtomSheet> createState() =>
      _CreateProductsButtomSheetState();
}

class _CreateProductsButtomSheetState extends State<CreateProductsButtomSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String? categoryName;
  double? categoryId;

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
                    text: 'Create Products',
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextApp(
                  text: 'Add a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                SizedBox(height: 10.h),
                const ProductsUploadImage(),
                SizedBox(height: 20.h),
                TextApp(
                  textAlign: TextAlign.right,
                  text: 'Enter the product title',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: titleController,
                  hintText: 'Product Title',
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
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  hintText: 'Description',
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
                BlocBuilder<GetAllAdminCategoriesBloc,
                    GetAllAdminCategoriesState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (categories) => CustomCreateDropDown(
                        items: categories.categoriesDropDownList,
                        hintText: 'Select a category',
                        onChanged: (value) {
                          setState(() {
                            categoryName = value;
                            final categoryIdString = categories
                                .getCategoriesList
                                .firstWhere((element) => element.name == value)
                                .id!;
                            categoryId = double.parse(categoryIdString);
                          });
                        },
                        value: categoryName,
                      ),
                      orElse: () => CustomCreateDropDown(
                        items: const [''],
                        hintText: 'Select a category',
                        onChanged: (value) {},
                        value: '',
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                BlocConsumer<CreateProductsBloc, CreateProductsState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: () {
                        context.pop();
                        ShowToast.showToastSuccessTop(
                          message: '${titleController.text} Created Success',
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
                          _validateCreateProducts(context);
                        },
                        text: 'Create product',
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
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateCreateProducts(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().imageList.isNotEmpty) {
      if (context.read<UploadImageCubit>().imageList.isEmpty) {
        ShowToast.showToastErrorTop(
          message: 'Pick at least one image',
        );
      }
      context.read<CreateProductsBloc>().add(
            CreateProductsEvent.createProducts(
              body: CreateProductsRequestBody(
                title: titleController.text,
                description: descriptionController.text,
                price: double.parse(priceController.text.trim()),
                categoryId: categoryId ?? 0.0,
                image: context.read<UploadImageCubit>().imageList,
              ),
            ),
          );
    }
  }
}
