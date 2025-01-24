import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_model.g.dart';

@JsonSerializable()
class NotificationsModel {
  @JsonKey(name: 'notification_id')
  final String? notificationId;
  final String? title;
  final String? body;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'product_id')
  final String? productId;
  final bool? isSeen;

  NotificationsModel({
    required this.notificationId,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.productId,
    required this.isSeen,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);
}
