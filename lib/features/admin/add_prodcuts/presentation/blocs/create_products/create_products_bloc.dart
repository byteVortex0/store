import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_prodcuts/data/models/create_products_request_body.dart';
import 'package:store/features/admin/add_prodcuts/data/repos/products_admin_repo.dart';

part 'create_products_event.dart';
part 'create_products_state.dart';
part 'create_products_bloc.freezed.dart';

class CreateProductsBloc
    extends Bloc<CreateProductsEvent, CreateProductsState> {
  CreateProductsBloc(this.repo) : super(const _Initial()) {
    on<NewProductEvent>(createProducts);
  }

  final ProductsAdminRepo repo;

  FutureOr<void> createProducts(
    NewProductEvent event,
    Emitter<CreateProductsState> emit,
  ) async {
    try {
      emit(const CreateProductsState.loading());

      final result = await repo.createProducts(body: event.body);

      result.when(
        success: (data) {
          emit(const CreateProductsState.success());
        },
        failure: (error) {
          emit(CreateProductsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const CreateProductsState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
