part of 'number_of_products_bloc.dart';

@freezed
class NumberOfProductsState with _$NumberOfProductsState {
  const factory NumberOfProductsState.loading() = LoadingState;
  const factory NumberOfProductsState.success(
      {required String numberOfProducts}) = SuccessState;
  const factory NumberOfProductsState.error({required String error}) =
      ErrorState;
}
