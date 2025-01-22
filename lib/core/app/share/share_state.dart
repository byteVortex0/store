part of 'share_cubit.dart';

@freezed
class ShareState with _$ShareState {
  const factory ShareState.initial() = _Initial;
  const factory ShareState.loading({required String productId}) = LoadingState;
  const factory ShareState.success() = SuccessState;
}
