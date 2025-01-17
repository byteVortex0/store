import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/app/app_cubit/app_cubit.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../core/style/images/app_images.dart';

class ChangeDarkMode extends StatelessWidget {
  const ChangeDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.darkMode,
          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.darkMode),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: .75,
          child: Switch.adaptive(
            value: !cubit.isDark,
            inactiveTrackColor: const Color(0xff262626),
            activeColor: const Color.fromARGB(255, 0, 255, 8),
            onChanged: (value) => cubit.changeAppThemeMode(),
          ),
        ),
      ],
    );
  }
}
