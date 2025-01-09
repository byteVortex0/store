import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_prodcuts/data/repos/products_admin_repo.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';
part 'delete_product_bloc.freezed.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc(this.repo) : super(const _Initial()) {
    on<RemoveProductEvent>(deleteProduct);
  }
  final ProductsAdminRepo repo;
  FutureOr<void> deleteProduct(
    RemoveProductEvent event,
    Emitter<DeleteProductState> emit,
  ) async {
    try {
      emit(DeleteProductState.loading(id: event.id));

      final result = await repo.deleteProducts(id: event.id);

      result.when(
        success: (data) {
          emit(const DeleteProductState.success());
        },
        failure: (error) {
          emit(DeleteProductState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const DeleteProductState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
