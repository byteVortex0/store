import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/extensions/string_extension.dart';
import 'package:store/core/style/fonts/font_weight_helper.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    required this.userInfo,
    super.key,
  });

  final UserRoleResponse userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45.r),
          child: CachedNetworkImage(
            height: 88.h,
            width: 88.w,
            fit: BoxFit.fill,
            imageUrl: userInfo.userAvatar!,
          ),
        ),
        SizedBox(height: 7.h),
        TextApp(
          text: userInfo.userName!.toLowerCase().toCapitalized(),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 7.h),
        TextApp(
          text: userInfo.userEmail!,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ],
    );
  }
}
