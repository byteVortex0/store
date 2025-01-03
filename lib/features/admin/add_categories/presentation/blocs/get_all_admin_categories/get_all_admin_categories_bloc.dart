import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';

import '../../../data/repos/categories_admin_repo.dart';

part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';
part 'get_all_admin_categories_bloc.freezed.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  GetAllAdminCategoriesBloc(this.repo)
      : super(const GetAllAdminCategoriesState.loading()) {
    on<FetchAllCategoriesEvent>(_fetchAllCategories);
  }

  final CategoriesAdminRepo repo;

  FutureOr<void> _fetchAllCategories(
    FetchAllCategoriesEvent event,
    Emitter<GetAllAdminCategoriesState> emit,
  ) async {
    try {
      if (event.isNotLoading) {
        emit(const GetAllAdminCategoriesState.loading());
      }
      final result = await repo.getAllCategories();

      result.when(
        success: (categories) {
          if (categories.getCategoriesList.isEmpty) {
            emit(const GetAllAdminCategoriesState.empty());
          } else {
            emit(GetAllAdminCategoriesState.success(categories: categories));
          }
        },
        failure: (error) {
          emit(GetAllAdminCategoriesState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const GetAllAdminCategoriesState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
