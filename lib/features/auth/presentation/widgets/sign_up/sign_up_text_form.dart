import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/utils/app_regex.dart';

import '../../bloc/auth_bloc.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isVisiable = true;

  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _bloc.nameController.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _bloc.formKey,
        child: Column(
          children: [
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: _bloc.nameController,
                keyboardType: TextInputType.name,
                hintText: context.translate(LangKeys.fullName),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 4) {
                    return context.translate(LangKeys.validName);
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: _bloc.emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: context.translate(LangKeys.email),
                validator: (value) {
                  if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                    return context.translate(LangKeys.validEmail);
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: _bloc.passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isVisiable,
                hintText: context.translate(LangKeys.password),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return context.translate(LangKeys.validPasswrod);
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisiable = !isVisiable;
                    });
                  },
                  icon: Icon(
                      isVisiable ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
          ],
        ));
  }
}
