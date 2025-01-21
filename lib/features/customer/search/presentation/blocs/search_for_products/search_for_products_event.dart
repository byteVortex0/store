part of 'search_for_products_bloc.dart';

@freezed
class SearchForProductsEvent with _$SearchForProductsEvent {
  const factory SearchForProductsEvent.started() = _Started;
  const factory SearchForProductsEvent.searchForProductsbyTitle(
      {required String title}) = FilterProductsByTitleEvent;
  const factory SearchForProductsEvent.searchForProductsbyPrice(
      {required SearchRequestBody body}) = FilterProductsByPriceEvent;
  const factory SearchForProductsEvent.resetSearch() = ResetSearchEvent;
}
