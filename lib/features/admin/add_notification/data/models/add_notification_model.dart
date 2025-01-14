// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'add_notification_model.g.dart';

@HiveType(typeId: 0)
class AddNotificationModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String body;
  @HiveField(2)
  int productId;
  @HiveField(3)
  final DateTime createdAt;

  AddNotificationModel({
    required this.title,
    required this.body,
    required this.productId,
    required this.createdAt,
  });
}
