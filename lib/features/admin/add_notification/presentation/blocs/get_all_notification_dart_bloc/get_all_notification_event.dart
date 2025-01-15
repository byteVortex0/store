part of 'get_all_notification_bloc.dart';

@freezed
class GetAllNotificationEvent with _$GetAllNotificationEvent {
  const factory GetAllNotificationEvent.started() = _Started;
  const factory GetAllNotificationEvent.getAllNotification() =
      FetchAllNotification;
}
