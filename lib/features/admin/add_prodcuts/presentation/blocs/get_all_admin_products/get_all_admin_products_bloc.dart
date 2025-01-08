import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_prodcuts/data/models/get_all_products_response.dart';
import 'package:store/features/admin/add_prodcuts/data/repos/products_admin_repo.dart';

part 'get_all_admin_products_event.dart';
part 'get_all_admin_products_state.dart';
part 'get_all_admin_products_bloc.freezed.dart';

class GetAllAdminProductsBloc
    extends Bloc<GetAllAdminProductsEvent, GetAllAdminProductsState> {
  GetAllAdminProductsBloc(this.repo)
      : super(const GetAllAdminProductsState.loading()) {
    on<GetAllProductsEvent>(getAllProducts);
  }

  final ProductsAdminRepo repo;

  FutureOr<void> getAllProducts(
    GetAllProductsEvent event,
    Emitter<GetAllAdminProductsState> emit,
  ) async {
    try {
      if (event.isNotLoading) {
        emit(const GetAllAdminProductsState.loading());
      }
      final result = await repo.getAllProducts();

      result.when(
        success: (data) {
          if (data.getProductsList.isEmpty) {
            emit(const GetAllAdminProductsState.empty());
          } else {
            emit(
              GetAllAdminProductsState.success(
                  productsList: data.getProductsList),
            );
          }
        },
        failure: (error) {
          emit(GetAllAdminProductsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const GetAllAdminProductsState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
