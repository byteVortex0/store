part of 'number_of_products_bloc.dart';

@freezed
class NumberOfProductsEvent with _$NumberOfProductsEvent {
  const factory NumberOfProductsEvent.started() = _Started;
  const factory NumberOfProductsEvent.numberOfProducts() =
      GetNumberOfProductsEvent;
}