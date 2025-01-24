import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/core/services/shared_pref/pref_keys.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/customer/notifications/data/models/notifications_model.dart';

class NotificationsController {
  NotificationsController();

  final notificationsDatabase = FirebaseFirestore.instance
      .collection(usersCollection)
      .doc(SharedPref().getInt(PrefKeys.userId).toString())
      .collection(notificationsCollection)
      .orderBy('created_at', descending: true);

  Stream<List<NotificationsModel>> getNotifications() {
    return notificationsDatabase.snapshots().map(
          (event) => event.docs
              .map((doc) => NotificationsModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
