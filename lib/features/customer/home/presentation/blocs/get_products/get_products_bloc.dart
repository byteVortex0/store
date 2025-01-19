import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/customer/home/data/repos/home_repo.dart';

import '../../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';
part 'get_products_bloc.freezed.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  GetProductsBloc(this.repo) : super(const GetProductsState.loading()) {
    on<FetchProductsEvent>(getProducts);
  }

  final HomeRepo repo;
  bool isLessTenItem = false;

  FutureOr<void> getProducts(
    FetchProductsEvent event,
    Emitter<GetProductsState> emit,
  ) async {
    try {
      emit(const GetProductsState.loading());
      final result = await repo.getProducts();
      result.when(
        success: (date) {
          isLessTenItem = date.getProductsList.length >= 10;
          if (date.getProductsList.isEmpty) {
            emit(const GetProductsState.empty());
          } else {
            emit(GetProductsState.success(products: date));
          }
        },
        failure: (error) {
          emit(GetProductsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const GetProductsState.error(error: 'An unexpected error occurred'));
    }
  }
}
