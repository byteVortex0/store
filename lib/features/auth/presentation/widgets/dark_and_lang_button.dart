import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_linear_button.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';

class DarkAndLangButton extends StatelessWidget {
  const DarkAndLangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* Dark & Light
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            child: const Icon(
              Icons.light_mode_rounded,
              color: Colors.white,
            ),
          ),
        ),
        //* Language
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            height: 44.h,
            width: 100.w,
            onPressed: () {},
            child: TextApp(
              text: context.trenslate(LangKeys.language),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.body,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
