part of 'number_of_users_bloc.dart';

@freezed
class NumberOfUsersEvent with _$NumberOfUsersEvent {
  const factory NumberOfUsersEvent.started() = _Started;
  const factory NumberOfUsersEvent.numberOfUsers() =
      GetNumberOfUsersEvent;
}