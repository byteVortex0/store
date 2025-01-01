import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:store/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:store/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/fonts/font_weight_helper.dart';
import '../widgets/dark_and_lang_button.dart';
import '../widgets/sign_up/sign_up_button.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DarkAndLangButton(),
            SizedBox(height: 30.h),
            AuthTitleInfo(
              title: context.trenslate(LangKeys.signUp),
              description: context.trenslate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.h),
            const UserAvatarImage(),
            SizedBox(height: 20.h),
            const SignUpTextForm(),
            SizedBox(height: 20.h),
            const SignUpButton(),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () { 
                context.pushReplacementNamed(AppRoutes.loginScreen);
               },
              child: CustomFadeInDown(
                duration: 400,
                child: TextApp(
                  text: context.trenslate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}