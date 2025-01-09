import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_drop_down.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';

import '../../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../../core/toast/show_toast.dart';
import '../../../data/models/update_products_request_body.dart';
import '../../blocs/update_products/update_products_bloc.dart';
import 'update_products_image.dart';

class UpdateProductsButtomSheet extends StatefulWidget {
  const UpdateProductsButtomSheet({
    super.key,
    required this.productId,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.categoryName,
    required this.imageUrl,
    required this.price,
    required this.imagesList,
  });

  final String productId;
  final String categoryId;
  final String title;
  final String description;
  final String categoryName;
  final String imageUrl;
  final String price;
  final List<String> imagesList;

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
  double? categoryId;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    priceController.text = widget.price;
    categoryName = widget.categoryName;
    categoryId = double.parse(widget.categoryId);
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
                UpdateproductsImage(
                  imagesList: widget.imagesList,
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
                BlocBuilder<GetAllAdminCategoriesBloc,
                    GetAllAdminCategoriesState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (categories) => CustomCreateDropDown(
                        items: categories.categoriesDropDownList,
                        hintText: 'Select Category',
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
                        hintText: '',
                        onChanged: (value) {},
                        value: '',
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                BlocConsumer<UpdateProductsBloc, UpdateProductsState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: () {
                        context.pop();
                        ShowToast.showToastSuccessTop(
                          message: '${titleController.text} Updated Success',
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
                        text: 'Update product',
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

  void _validateCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<UpdateProductsBloc>().add(
            UpdateProductsEvent.updateProducts(
              body: UpdateProductsRequestBody(
                title: titleController.text,
                description: descriptionController.text,
                price: processValue(priceController.text.trim()),
                categoryId: categoryId,
                image: context.read<UploadImageCubit>().updateImagesList.isEmpty
                    ? widget.imagesList
                    : context.read<UploadImageCubit>().updateImagesList,
                productId: widget.productId,
              ),
            ),
          );
    }
  }

  double processValue(String value) {
     // إزالة علامة الدولار (إن وجدت)
    String cleanValue = value.replaceAll('\$', '');

     // تحويل القيمة إلى رقم
    double numericValue = double.tryParse(cleanValue)!;

    return numericValue;
  }
}
