import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/string_extension.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:store/features/admin/add_prodcuts/presentation/widgets/update/update_products_buttom_sheet.dart';

import '../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../core/common/button_sheet/custom_button_sheet.dart';
import '../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import '../blocs/update_products/update_products_bloc.dart';
import 'delete/delete_products_widget.dart';

class ProductsAdminItem extends StatelessWidget {
  const ProductsAdminItem({
    super.key,
    required this.title,
    required this.productId,
    required this.categoryId,
    required this.description,
    required this.categoryName,
    required this.imageUrl,
    required this.price,
    required this.imagesList,
  });

  final String title;
  final String productId;
  final String categoryId;
  final String description;
  final String categoryName;
  final String imageUrl;
  final List<String> imagesList;
  final String price;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DeleteProductsWidget(productId: productId),
                IconButton(
                  onPressed: () {
                    CustomBottonSheet.showBottomSheet(
                      context: context,
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => sl<UpdateProductsBloc>(),
                          ),
                          BlocProvider(
                            create: (context) => sl<UploadImageCubit>(),
                          ),
                          BlocProvider(
                            create: (context) => sl<GetAllAdminCategoriesBloc>()
                              ..add(
                                const GetAllAdminCategoriesEvent
                                    .fetchAllCategories(isNotLoading: false),
                              ),
                          ),
                        ],
                        child: UpdateProductsButtomSheet(
                          productId: productId,
                          title: title,
                          description: description,
                          imagesList: imagesList,
                          imageUrl: imageUrl,
                          price: '\$ $price',
                          categoryName: categoryName,
                          categoryId: categoryId,
                        ),
                      ),
                      whenComplete: () {
                        context.read<GetAllAdminProductsBloc>().add(
                              const GetAllAdminProductsEvent.getAllProducts(
                                  isNotLoading: false),
                            );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                imageUrl: imageUrl.imageProductFormate(),
                height: 200.h,
                width: 120.w,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TextApp(
              text: title,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              theme: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 5.h),
            TextApp(
              text: categoryName,
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 5.h),
            TextApp(
              text: '\$ $price',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
