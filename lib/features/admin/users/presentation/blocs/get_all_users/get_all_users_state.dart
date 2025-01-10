part of 'get_all_users_bloc.dart';

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.loading() = _LoadingState;
  const factory GetAllUsersState.success({
    required List<GetUsers> usersList,
  }) = _SuccessState;
  const factory GetAllUsersState.empty() = _EmptyState;
  const factory GetAllUsersState.search({required List<GetUsers> searchList}) = _SearchState;
  const factory GetAllUsersState.error({required String error}) = _ErrorState;
}
