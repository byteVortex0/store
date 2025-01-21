import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/customer/products_view_all/data/repos/products_view_all_repo.dart';

import 'products_view_all_event.dart';
import 'products_view_all_state.dart';

class ProductsViewAllBloc
    extends Bloc<ProductsViewAllEvent, ProductsViewAllState> {
  ProductsViewAllBloc(this.repo)
      : super(const ProductsViewAllInitalState(
          productsList: [],
          hasMoreData: true,
        )) {
    on<ViewAllEvent>(viewAllProducts);
    on<LoadMoreEvent>(loadMoreProducts, transformer: droppable());
  }

  final ProductsViewAllRepo repo;
  int offset = 0;

  FutureOr<void> viewAllProducts(
    ViewAllEvent event,
    Emitter<ProductsViewAllState> emit,
  ) async {
    try {
      emit(const ProductsViewAllLoadingState(
        productsList: [],
        hasMoreData: true,
      ));
      final result = await repo.getProductsViewAll(offset: offset);
      result.when(
        success: (data) {
          emit(ProductsViewAllSuccessState(
            productsList: data.getProductsList,
            hasMoreData: true,
          ));
        },
        failure: (error) {
          emit(ProductsViewAllErrorState(
            errorMassage: error,
            productsList: state.productsList,
            hasMoreData: true,
          ));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('View All failed: $e\n$stackTrace');
      emit(ProductsViewAllErrorState(
        errorMassage: 'An unexpected error occurred',
        productsList: state.productsList,
        hasMoreData: true,
      ));
    }
  }

  FutureOr<void> loadMoreProducts(
    LoadMoreEvent event,
    Emitter<ProductsViewAllState> emit,
  ) async {
    try {
      if (!state.hasMoreData) return;

      offset += 6;

      emit(ProductsViewAllLoadingState(
        productsList: state.productsList,
        hasMoreData: state.hasMoreData,
      ));
      final result = await repo.getProductsViewAll(offset: offset);
      result.when(
        success: (data) {
          final newlist = [...state.productsList, ...data.getProductsList];
          emit(ProductsViewAllSuccessState(
            productsList: newlist,
            hasMoreData: !(data.getProductsList.length < 6),
          ));
        },
        failure: (error) {
          emit(ProductsViewAllErrorState(
            errorMassage: error,
            productsList: state.productsList,
            hasMoreData: state.hasMoreData,
          ));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('View All failed: $e\n$stackTrace');
      emit(ProductsViewAllErrorState(
        errorMassage: 'An unexpected error occurred',
        productsList: state.productsList,
        hasMoreData: state.hasMoreData,
      ));
    }
  }

  void handlerPosition({
    required ScrollController controller,
    required double loadingMorePosition,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final offset = controller.offset;
      final maxExtent = controller.position.maxScrollExtent;

      if (offset >= maxExtent - loadingMorePosition) {
        add(const LoadMoreEvent());
      }
    });
  }
}
