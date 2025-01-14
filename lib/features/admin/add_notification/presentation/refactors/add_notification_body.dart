import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/create/create_notification.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../widgets/add_notification_item.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateNotification(),
          SizedBox(height: 10.h),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {},
              color: ColorsDark.blueLight,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20.h),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) =>
                          const AddNotificationItem(),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 20.h),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
