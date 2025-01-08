part of 'create_products_bloc.dart';

@freezed
class CreateProductsState with _$CreateProductsState {
  const factory CreateProductsState.initial() = _Initial;
  const factory CreateProductsState.loading() = LoadingState;
  const factory CreateProductsState.success() = SuccessState;
  const factory CreateProductsState.error({required String error}) =
      ErrorState;
}
