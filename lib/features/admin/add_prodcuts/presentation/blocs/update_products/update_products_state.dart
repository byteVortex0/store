part of 'update_products_bloc.dart';

@freezed
class UpdateProductsState with _$UpdateProductsState {
  const factory UpdateProductsState.initial() = _Initial;
  const factory UpdateProductsState.loading() = LoadingState;
  const factory UpdateProductsState.success() = SuccessState;
  const factory UpdateProductsState.error({required String error}) =
      ErrorState;
}
