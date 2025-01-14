import 'package:hive_flutter/adapters.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';

class HiveDatabase {
  HiveDatabase._();

  static final HiveDatabase instance = HiveDatabase._();

  factory HiveDatabase() => instance;

  Box<AddNotificationModel>? notificationBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AddNotificationModelAdapter());

    notificationBox =
        await Hive.openBox<AddNotificationModel>('notificationBox');
  }

  Future<void> clearAllBoxs() async {
    await notificationBox!.clear();
  }
}
