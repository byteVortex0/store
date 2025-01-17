import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/dialogs/custom_dialogs.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/app_localizations.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';
import 'package:store/core/style/images/app_images.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/app/app_cubit/app_cubit.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(
              AppImages.language,
              // ignore: deprecated_member_use
              color: context.color.textColor,
            ),
            SizedBox(width: 10.w),
            TextApp(
              text: context.translate(LangKeys.languageTilte),
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
                  textBody: context.translate(LangKeys.changeToTheLanguage),
                  textButton1: context.translate(LangKeys.sure),
                  textButton2: context.translate(LangKeys.cancel),
                  isLoading: false,
                  onPressed: () {
                    selectLangaugeButton(context: context, cubit: cubit);
                  },
                );
              },
              child: Row(
                children: [
                  TextApp(
                    text: context.translate(LangKeys.langCode),
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
      },
    );
  }

  void selectLangaugeButton({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (AppLocalizations.of(context)!.isEnLocale) {
      cubit.toArabic();
    } else {
      cubit.toEnglish();
    }
    context.pop();
  }
}
