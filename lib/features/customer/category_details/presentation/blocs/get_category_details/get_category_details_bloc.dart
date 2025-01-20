import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_prodcuts/data/models/get_all_products_response.dart';

import '../../../data/repos/category_details_repo.dart';

part 'get_category_details_event.dart';
part 'get_category_details_state.dart';
part 'get_category_details_bloc.freezed.dart';

class GetCategoryDetailsBloc
    extends Bloc<GetCategoryDetailsEvent, GetCategoryDetailsState> {
  GetCategoryDetailsBloc(this.repo)
      : super(const GetCategoryDetailsState.loading()) {
    on<FetchCategoryDetailsEvent>(getCategoryDetails);
  }

  final CategoryDetailsRepo repo;

  FutureOr<void> getCategoryDetails(
    FetchCategoryDetailsEvent event,
    Emitter<GetCategoryDetailsState> emit,
  ) async {
    try {
      emit(const GetCategoryDetailsState.loading());
      final result = await repo.getCategoryDetails(id: event.id);
      result.when(
        success: (date) {
          if (date.getProductsList.isEmpty) {
            emit(const GetCategoryDetailsState.empty());
          } else {
            emit(GetCategoryDetailsState.success(data: date));
          }
        },
        failure: (error) {
          emit(GetCategoryDetailsState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Category Details failed: $e\n$stackTrace');
      emit(const GetCategoryDetailsState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
