part of 'create_products_bloc.dart';

@freezed
class CreateProductsEvent with _$CreateProductsEvent {
  const factory CreateProductsEvent.started() = _Started;
  const factory CreateProductsEvent.createProducts({
    required CreateProductsRequestBody body,
  }) = NewProductEvent;
}