import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/dialogs/custom_dialogs.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/utils/app_logout.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../../../core/style/images/app_images.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.logout,
          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.logOut),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: context.translate(LangKeys.logOutFromApp),
              textButton1: context.translate(LangKeys.yes),
              textButton2: context.translate(LangKeys.no),
              isLoading: false,
              onPressed: () async {
                await AppLogout().logout();
              },
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.translate(LangKeys.logOut),
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
        ),
      ],
    );
  }
}
