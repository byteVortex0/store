part of 'number_of_users_bloc.dart';

@freezed
class NumberOfUsersState with _$NumberOfUsersState {
  const factory NumberOfUsersState.loading() = LoadingState;
  const factory NumberOfUsersState.success({required String numberOfUsers}) =
      SuccessState;
  const factory NumberOfUsersState.error({required String error}) = ErrorState;
}
