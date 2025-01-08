import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_category_buttom_sheet.dart';

import '../../../../../../core/colors/colors_dark.dart';
import '../../../../../../core/common/button_sheet/custom_button_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../../../core/style/fonts/font_family_helper.dart';
import '../../../../../../core/style/fonts/font_weight_helper.dart';
import '../../blocs/create_category/create_category_bloc.dart';
import '../../blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottonSheet.showBottomSheet(
              context: context,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<CreateCategoryBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<UploadImageCubit>(),
                  ),
                ],
                child: const CreateCategoryButtomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllAdminCategoriesBloc>().add(
                      const GetAllAdminCategoriesEvent.fetchAllCategories(
                          isNotLoading: false),
                    );
              },
            );
          },
          text: 'Add',
          width: 90.w,
          height: 35.h,
          lastRadius: 10.r,
          threeRadius: 10.r,
          backgroundColor: ColorsDark.blueDark,
        ),
      ],
    );
  }
}
