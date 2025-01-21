import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';
import '../../../data/models/search_request_body.dart';
import '../../../data/repos/search_repo.dart';

part 'search_for_products_event.dart';
part 'search_for_products_state.dart';
part 'search_for_products_bloc.freezed.dart';

class SearchForProductsBloc
    extends Bloc<SearchForProductsEvent, SearchForProductsState> {
  SearchForProductsBloc(this.repo)
      : super(const SearchForProductsState.initial()) {
    on<FilterProductsByTitleEvent>(searchForProductsByTitle);
    on<FilterProductsByPriceEvent>(searchForProductsByPrice);
    on<ResetSearchEvent>(resetSearch);
  }

  final SearchRepo repo;

  FutureOr<void> searchForProductsByTitle(
    FilterProductsByTitleEvent event,
    Emitter<SearchForProductsState> emit,
  ) async {
    try {
      emit(const SearchForProductsState.loading());
      final result = await repo.searchForProductsByTitle(title: event.title);
      result.when(
        success: (data) {
          if (data.getProductsList.isEmpty) {
            emit(const SearchForProductsState.empty());
          } else {
            emit(SearchForProductsState.success(data: data.getProductsList));
          }
        },
        failure: (error) {
          emit(SearchForProductsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Search failed: $e\n$stackTrace');
      emit(const SearchForProductsState.error(
          error: 'An unexpected error occurred'));
    }
  }

  FutureOr<void> searchForProductsByPrice(
    FilterProductsByPriceEvent event,
    Emitter<SearchForProductsState> emit,
  ) async {
    try {
      emit(const SearchForProductsState.loading());
      final result = await repo.searchForProductsByPrice(body: event.body);
      result.when(
        success: (data) {
          if (data.getProductsList.isEmpty) {
            emit(const SearchForProductsState.empty());
          } else {
            emit(SearchForProductsState.success(data: data.getProductsList));
          }
        },
        failure: (error) {
          emit(SearchForProductsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Search failed: $e\n$stackTrace');
      emit(const SearchForProductsState.error(
          error: 'An unexpected error occurred'));
    }
  }

  FutureOr<void> resetSearch(
    ResetSearchEvent event,
    Emitter<SearchForProductsState> emit,
  ) async {
    emit(const SearchForProductsState.initial());
  }
}
