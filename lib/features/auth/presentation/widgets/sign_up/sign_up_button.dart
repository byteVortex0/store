import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/custom_linear_button.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/toast/show_toast.dart';
import '../../bloc/auth_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.loggedSuccessfully),
              );

              context.pushNamedAndRemoveUntil(AppRoutes.mainCustomerScreen);
            },
            error: (massage) => ShowToast.showToastErrorTop(
              message: context.translate(massage),
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
                  _validateThenDoSignUp(context);
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.translate(LangKeys.signUp),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final uploadCubit = context.read<UploadImageCubit>();

    if (!authBloc.formKey.currentState!.validate() ||
        uploadCubit.imageUrl.isEmpty) {
      if (uploadCubit.imageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      }
    } else {
      context
          .read<AuthBloc>()
          .add(AuthEvent.signUp(avater: uploadCubit.imageUrl));
    }
  }
}
