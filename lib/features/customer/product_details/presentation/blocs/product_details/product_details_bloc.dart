import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/customer/product_details/data/repos/product_details_repo.dart';

import '../../../data/models/product_details_response.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this.repo) : super(const ProductDetailsState.loading()) {
    on<getOneProductEvent>(getOneProduct);
  }

  final ProductDetailsRepo repo;

  FutureOr<void> getOneProduct(
    getOneProductEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    try {
      emit(const ProductDetailsState.loading());
      final result = await repo.getOneProduct(id: event.id);
      result.when(
        success: (date) {
          emit(ProductDetailsState.success(data: date.data.product));
        },
        failure: (error) {
          emit(ProductDetailsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const ProductDetailsState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
