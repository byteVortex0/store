part of 'get_products_bloc.dart';

@freezed
class GetProductsState with _$GetProductsState {
  const factory GetProductsState.loading() = LoadingState;
  const factory GetProductsState.success(
      {required GetAllProductsResponse products}) = SuccessState;
  const factory GetProductsState.empty() = EmptyState;
  const factory GetProductsState.error({required String error}) = ErrorState;
}
