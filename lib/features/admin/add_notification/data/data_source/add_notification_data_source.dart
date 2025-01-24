import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/core/extensions/string_extension.dart';
import 'package:store/core/services/push_notification/firebase_cloud_messaging.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/core/utils/app_values.dart';
import 'package:store/features/customer/notifications/data/models/notifications_model.dart';

class AddNotificationDataSource {
  Future<void> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    final response = await FirebaseCloudMessaging().sendNotification(
      title: title,
      body: body,
      productId: productId,
    );
    return response;
  }

  Future<void> addNotificationForAllUsers({
    required String title,
    required String body,
    required String productId,
  }) async {
    final users = FirebaseFirestore.instance.collection(usersCollection);

    final notificationId = AppValues.randomStringId;
    String createAt = '';

    final usersGet = await users.get();

    for (final doc in usersGet.docs) {
      await users
          .doc(doc.id)
          .collection(notificationsCollection)
          .doc(notificationId)
          .set(NotificationsModel(
            notificationId: notificationId,
            title: title,
            body: body,
            createdAt: createAt.convertDataFormate(),
            productId: productId,
            isSeen: false,
          ).toJson());
    }
  }
}
