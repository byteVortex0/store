import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/utils/app_regex.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
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
            keyboardType: TextInputType.name,
            hintText: context.trenslate(LangKeys.fullName),
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 4) {
                return context.trenslate(LangKeys.validName);
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20.h),
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
        SizedBox(height: 20.h),
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isVisiable,
            hintText: context.trenslate(LangKeys.password),
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
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
