import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/services/push_notification/firebase_cloud_messaging.dart';

class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeCustomerScreen'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: FirebaseCloudMessaging().isNotificationSubscribed,
          builder: (_, bool value, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value ? 'Subscribe' : 'Unsubscribe',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 20.h),
                Transform.scale(
                  scale: 1.5,
                  child: Switch.adaptive(
                    value: value,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (value) async {
                      await FirebaseCloudMessaging()
                          .controlerForUserNotification();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
