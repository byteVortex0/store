import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/loading/empty_screen.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';
import 'package:store/features/admin/add_notification/presentation/widgets/create/create_notification.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/loading/loading_shimmer.dart';
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
              onRefresh: () async {
                context.read<GetAllNotificationBloc>().add(
                      const GetAllNotificationEvent.getAllNotification(),
                    );
              },
              color: ColorsDark.blueLight,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20.h),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllNotificationBloc,
                        GetAllNotificationState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () => ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                const LoadingShimmer(),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 15.h),
                            itemCount: 4,
                          ),
                          success: (notificationsList) => ListView.separated(
                            itemCount: notificationsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) =>
                                AddNotificationItem(
                              notificationModel: notificationsList[index],
                              indexId: index,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 20.h),
                          ),
                          empty: EmptyScreen.new,
                          error: Text.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20.h),
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
