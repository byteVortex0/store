import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_linear_button.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';
import 'package:store/core/toast/show_toast.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (userRole) {
              ShowToast.showToastSuccessTop(
                context: context,
                message: context.trenslate(LangKeys.loggedSuccessfully),
              );
              
              if (userRole == 'admin') {
                context.pushNamedAndRemoveUntil(AppRoutes.homeAdminScreen);
              } else {
                context.pushNamedAndRemoveUntil(AppRoutes.homeCustomerScreen);
              }
            },
            
            error: (massage) => ShowToast.showToastErrorTop(
              context: context,
              message: context.trenslate(massage),
            ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                onPressed: () {},
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                onPressed: () {
                  _validateThenDoLogin(context);
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.trenslate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.body,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
