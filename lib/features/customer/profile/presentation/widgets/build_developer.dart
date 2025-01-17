import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/env_variables.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../core/style/images/app_images.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildDeveloper,
          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.buildDeveloper),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            context.pushName(
              AppRoutes.customWebView,
              arg: EnvVariables.instance.buildDeveloper,
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.translate(LangKeys.appName),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: context.color.textColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
