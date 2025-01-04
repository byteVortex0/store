import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/custom_container_linear_admin.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';

import '../../../../../core/app/upload_image/cubit/upload_image_cubit.dart';
import '../../../../../core/common/buttom_sheet/custom_buttom_sheet.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import '../blocs/update_category/update_category_bloc.dart';
import 'delete/delete_category_widget.dart';
import 'update/update_category_buttom_sheet.dart';

class AddCategoryItem extends StatelessWidget {
  const AddCategoryItem({
    super.key,
    required this.name,
    required this.categoryId,
    required this.image,
  });

  final String name;
  final String categoryId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: name,
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DeleteCategoryWidget(id: categoryId),
                    IconButton(
                      onPressed: () {
                        CustomBottomSheet.showBottomSheet(
                          context: context,
                          child: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => sl<UpdateCategoryBloc>(),
                              ),
                              BlocProvider(
                                create: (context) => sl<UploadImageCubit>(),
                              ),
                            ],
                            child: UpdateCategoryButtomSheet(
                              id: categoryId,
                              name: name,
                              imageUrl: image,
                            ),
                          ),
                          whenComplete: () {
                            context.read<GetAllAdminCategoriesBloc>().add(
                                  const GetAllAdminCategoriesEvent
                                      .fetchAllCategories(
                                    isNotLoading: false,
                                  ),
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
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                imageUrl: image,
                height: 90.h,
                width: 120.w,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
