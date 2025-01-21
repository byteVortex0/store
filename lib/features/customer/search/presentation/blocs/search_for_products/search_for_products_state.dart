part of 'search_for_products_bloc.dart';

@freezed
class SearchForProductsState with _$SearchForProductsState {
  const factory SearchForProductsState.initial() = InitialState;
  const factory SearchForProductsState.loading() = LoadingState;
  const factory SearchForProductsState.success(
      {required List<GetAllProducts> data}) = SuccessState;
  const factory SearchForProductsState.empty() = EmptyState;
  const factory SearchForProductsState.error({required String error}) =
      ErrorState;
}
