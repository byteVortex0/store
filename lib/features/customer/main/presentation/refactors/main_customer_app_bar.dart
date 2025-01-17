import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_linear_button.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/style/images/app_images.dart';
import 'package:store/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/enums/nav_bar_enum.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class MainCustomerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainCustomerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return AppBar(
      elevation: 0,
      backgroundColor: context.color.mainColor,
      automaticallyImplyLeading: false,
      title: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.navBarEnum == NavBarEnum.home) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: context.translate(LangKeys.chooseProducts),
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: context.color.textColor,
                    ),
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: CustomLinearButton(
                    onPressed: () {},
                    child: Center(
                      child: SvgPicture.asset(AppImages.search),
                    ),
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
