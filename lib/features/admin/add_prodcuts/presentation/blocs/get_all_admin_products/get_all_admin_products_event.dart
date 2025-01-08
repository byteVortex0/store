part of 'get_all_admin_products_bloc.dart';

@freezed
class GetAllAdminProductsEvent with _$GetAllAdminProductsEvent {
  const factory GetAllAdminProductsEvent.started() = _Started;
  const factory GetAllAdminProductsEvent.getAllProducts(
      {required bool isNotLoading}) = GetAllProductsEvent;
}
