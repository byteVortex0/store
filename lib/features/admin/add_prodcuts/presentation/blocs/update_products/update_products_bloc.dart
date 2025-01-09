import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/update_products_request_body.dart';
import '../../../data/repos/products_admin_repo.dart';

part 'update_products_event.dart';
part 'update_products_state.dart';
part 'update_products_bloc.freezed.dart';

class UpdateProductsBloc extends Bloc<UpdateProductsEvent, UpdateProductsState> {
  UpdateProductsBloc(this.repo) : super(const _Initial()) {
    on<EditProductEvent>(updateProducts);
  }

  final ProductsAdminRepo repo;

  FutureOr<void> updateProducts(
    EditProductEvent event,
    Emitter<UpdateProductsState> emit,
  ) async {
    try {
      emit(const UpdateProductsState.loading());

      final result = await repo.updateProducts(body: event.body);

      result.when(
        success: (data) {
          emit(const UpdateProductsState.success());
        },
        failure: (error) {
          emit(UpdateProductsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const UpdateProductsState.error(
          error: 'An unexpected error occurred'));
    }
  }
  
}
