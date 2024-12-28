part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = LoadingState;
  const factory AuthState.success({required String userRole}) = SuccessState;
  const factory AuthState.error({required String errorMassage}) = ErrorState;
}
