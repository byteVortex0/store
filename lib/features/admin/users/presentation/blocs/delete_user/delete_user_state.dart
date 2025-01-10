part of 'delete_user_bloc.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = _Initial;
    const factory DeleteUserState.loading({required String id}) = _LoadingState;
  const factory DeleteUserState.success() = _SuccessState;
  const factory DeleteUserState.error({required String error}) = _ErrorState;

}
