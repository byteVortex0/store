import 'package:hive_flutter/adapters.dart';
import 'package:store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:store/features/customer/favourites/data/models/favourite_model.dart';

class HiveDatabase {
  HiveDatabase._();

  static final HiveDatabase instance = HiveDatabase._();

  factory HiveDatabase() => instance;

  Box<AddNotificationModel>? notificationBox;
  Box<FavouriteModel>? favouriteBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(AddNotificationModelAdapter())
      ..registerAdapter(FavouriteModelAdapter());

    notificationBox =
        await Hive.openBox<AddNotificationModel>('notificationBox');

    favouriteBox = await Hive.openBox<FavouriteModel>('favouriteBox');
  }

  Future<void> clearAllBoxs() async {
    await notificationBox!.clear();
    await favouriteBox!.clear();
  }
}
