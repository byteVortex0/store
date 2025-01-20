import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:store/features/customer/home/data/repos/home_repo.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';
part 'get_categories_bloc.freezed.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  GetCategoriesBloc(this.repo) : super(const GetCategoriesState.loading()) {
    on<FetchAllCategoriesEvent>(getCategories);
  }

  final HomeRepo repo;

  FutureOr<void> getCategories(
    FetchAllCategoriesEvent event,
    Emitter<GetCategoriesState> emit,
  ) async {
    try {
      emit(const GetCategoriesState.loading());
      final result = await repo.getCategories();
      result.when(
        success: (date) {
          if (date.getCategoriesList.isEmpty) {
            emit(const GetCategoriesState.empty());
          } else {
            emit(GetCategoriesState.success(categories: date));
          }
        },
        failure: (error) {
          emit(GetCategoriesState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Category failed: $e\n$stackTrace');
      emit(const GetCategoriesState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
