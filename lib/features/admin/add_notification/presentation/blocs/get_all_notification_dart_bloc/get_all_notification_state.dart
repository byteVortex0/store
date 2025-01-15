part of 'get_all_notification_bloc.dart';

@freezed
class GetAllNotificationState with _$GetAllNotificationState {
  const factory GetAllNotificationState.loading() = LoadingState;
  const factory GetAllNotificationState.success(
      {required List<AddNotificationModel> notifications}) = SuccessState;
  const factory GetAllNotificationState.empty() = EmptyState;
  const factory GetAllNotificationState.error({required String error}) =
      ErrorState;
}
