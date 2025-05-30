part of 'add_notification_bloc.dart';

@freezed
class AddNotificationEvent with _$AddNotificationEvent {
  const factory AddNotificationEvent.started() = _Started;
  const factory AddNotificationEvent.addNotification(
      {required AddNotificationModel notification}) = CreateNotificationEvent;
  const factory AddNotificationEvent.deleteNotification(
          {required AddNotificationModel notificationModel}) =
      DeleteNotificationEvent;
}
