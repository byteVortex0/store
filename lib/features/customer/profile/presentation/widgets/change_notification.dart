import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/services/push_notification/firebase_cloud_messaging.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class ChangeNotification extends StatelessWidget {
  const ChangeNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.notifications_active,
        color: context.color.textColor,
      ),
      SizedBox(width: 10.w),
      TextApp(
        text: context.translate(LangKeys.notification),
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.regular,
        ),
      ),
      const Spacer(),
      ValueListenableBuilder(
        valueListenable: FirebaseCloudMessaging().isNotificationSubscribed,
        builder: (_, value, __) {
          return Transform.scale(
            scale: .75,
            child: Switch.adaptive(
              value: value,
              inactiveTrackColor: const Color(0xff262626),
              activeColor: const Color.fromARGB(255, 0, 255, 8),
              onChanged: (value) async {
                await FirebaseCloudMessaging()
                    .controlerForUserNotification(context);
              },
            ),
          );
        },
      ),
    ]);
  }
}
