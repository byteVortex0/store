import 'package:store/core/services/push_notification/firebase_cloud_messaging.dart';

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
}
