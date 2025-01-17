import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';
import 'package:store/features/customer/profile/presentation/widgets/build_developer.dart';
import 'package:store/features/customer/profile/presentation/widgets/build_version.dart';
import 'package:store/features/customer/profile/presentation/widgets/change_dark_mode.dart';
import 'package:store/features/customer/profile/presentation/widgets/change_language.dart';
import 'package:store/features/customer/profile/presentation/widgets/change_notification.dart';
import 'package:store/features/customer/profile/presentation/widgets/logout_widget.dart';
import 'package:store/features/customer/profile/presentation/widgets/user_profile_info.dart';
import 'package:store/features/customer/profile/presentation/widgets/user_profile_shimmer.dart';

import '../blocs/profile_bloc/profile_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.when(
                  loading: UserProfileShimmer.new,
                  success: (userinfo) => UserProfileInfo(userInfo: userinfo),
                  error: Text.new,
                );
              },
            )),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 400,
              child: TextApp(
                text: context.translate(LangKeys.applicationFeatures),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            const CustomFadeInRight(
              duration: 400,
              child: ChangeLanguage(),
            ),
            SizedBox(height: 20.h),
            const CustomFadeInRight(
              duration: 400,
              child: ChangeDarkMode(),
            ),
            SizedBox(height: 20.h),
            const CustomFadeInRight(
              duration: 400,
              child: BuildDeveloper(),
            ),
            SizedBox(height: 20.h),
            const CustomFadeInRight(
              duration: 400,
              child: ChangeNotification(),
            ),
            SizedBox(height: 20.h),
            const CustomFadeInRight(
              duration: 400,
              child: BuildVersion(),
            ),
            SizedBox(height: 20.h),
            const CustomFadeInRight(
              duration: 400,
              child: LogoutWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
