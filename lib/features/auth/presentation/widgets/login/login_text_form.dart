import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/utils/app_regex.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isVisiable = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
            hintText: context.trenslate(LangKeys.email),
            validator: (value) {
              if (!AppRegex.isEmailValid('')) {
                return context.trenslate(LangKeys.validEmail);
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 25.h),
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isVisiable,
            hintText: context.trenslate(LangKeys.password),
            validator: (value) {
              //TODO: change thiis in Future
              if (!AppRegex.isPasswordValid('')) {
                return context.trenslate(LangKeys.validPasswrod);
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisiable = !isVisiable;
                });
              },
              icon: Icon(isVisiable ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),
      ],
    ));
  }
}
