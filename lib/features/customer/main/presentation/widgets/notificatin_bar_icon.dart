import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/widgets/text_app.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/style/images/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'package:badges/badges.dart' as badge;

import '../../../../../core/style/fonts/font_weight_helper.dart';
import '../../../notifications/data/models/notifications_model.dart';
import '../../../notifications/presentation/controller/notifications_controller.dart';

class NotificatinBarIcon extends StatelessWidget {
  const NotificatinBarIcon({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationsModel>>(
      stream: NotificationsController().getNotifications(),
      builder: (BuildContext context,
          AsyncSnapshot<List<NotificationsModel>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final numberOfNotifications =
            snapshot.data!.where((e) => e.isSeen == false).toList().length;

        return badge.Badge(
          showBadge: numberOfNotifications != 0,
          badgeContent: TextApp(
            text: numberOfNotifications >= 9
                ? '9+'
                : numberOfNotifications.toString(),
            theme: context.textStyle.copyWith(
              fontSize: 11.sp,
              color: Colors.white,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          position: badge.BadgePosition.topEnd(top: -8.h, end: -4.w),
          badgeAnimation: const badge.BadgeAnimation.scale(),
          badgeStyle: badge.BadgeStyle(
            badgeColor: Colors.pink,
            padding: EdgeInsets.all(5.h),
            elevation: 0,
          ),
          child: SvgPicture.asset(
            AppImages.notificationIcon,
            // ignore: deprecated_member_use
            color: isSelected ? context.color.navBarSelectedTab : Colors.grey,
            height: 25.h,
          ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
        );
      },
    );
  }
}
