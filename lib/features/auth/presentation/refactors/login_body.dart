import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:store/features/auth/presentation/widgets/dark_and_lang_button.dart';
import 'package:store/features/auth/presentation/widgets/login/login_button.dart';
import 'package:store/features/auth/presentation/widgets/login/login_text_form.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/style/fonts/font_weight_helper.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DarkAndLangButton(),
            SizedBox(height: 50.h),
            AuthTitleInfo(
              title: context.trenslate(LangKeys.login),
              description: context.trenslate(LangKeys.welcome),
            ),
            SizedBox(height: 30.h),
            const LoginTextForm(),
            SizedBox(height: 30.h),
            const LoginButton(),
            SizedBox(height: 30.h),
            TextButton(
              onPressed: () {
                context.pushReplacementNamed(AppRoutes.signUpScreen);
              },
              child: CustomFadeInDown(
                duration: 400,
                child: TextApp(
                  text: context.trenslate(LangKeys.createAccount),
                  theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: context.color.bluePinkLight),
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
