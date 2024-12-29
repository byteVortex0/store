import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_text_field.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/utils/app_regex.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isVisiable = true;

  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
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
            controller: _bloc.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: context.trenslate(LangKeys.email),
            validator: (value) {
              if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
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
            controller: _bloc.passwordController,
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
