import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/customer/notifications/data/models/notifications_model.dart';
import 'package:store/features/customer/notifications/presentation/controller/notifications_controller.dart';
import 'package:store/features/customer/notifications/presentation/widgets/notification_item.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/style/fonts/font_weight_helper.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      child: StreamBuilder<List<NotificationsModel>>(
        stream: NotificationsController().getNotifications(),
        builder: (BuildContext context,
            AsyncSnapshot<List<NotificationsModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notification_add,
                      color: context.color.textColor,
                      size: 150,
                    ),
                    TextApp(
                      text: 'You Not Has Notifications Now',
                      theme: context.textStyle.copyWith(
                        fontWeight: FontWeightHelper.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ]),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => NotificationItem(
              title: snapshot.data![index].title!,
              description: snapshot.data![index].body!,
              createdAt: snapshot.data![index].createdAt!,
              isSeen: snapshot.data![index].isSeen!,
              onTapSelected: () async {
                await FirebaseFirestore.instance
                    .collection(usersCollection)
                    .doc(SharedPref().getInt(PrefKeys.userId).toString())
                    .collection(notificationsCollection)
                    .doc(snapshot.data![index].notificationId)
                    .update({'isSeen': true});

                if (snapshot.data![index].productId != '-1') {
                  if (!context.mounted) return;
                  context.pushName(
                    AppRoutes.productDetails,
                    arg: int.parse(snapshot.data![index].productId.toString()),
                  );
                }
              },
              onTapRemoved: () async {
                await FirebaseFirestore.instance
                    .collection(usersCollection)
                    .doc(SharedPref().getInt(PrefKeys.userId).toString())
                    .collection(notificationsCollection)
                    .doc(snapshot.data![index].notificationId)
                    .delete();
              },
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
          );
        },
      ),
    );
  }
}
