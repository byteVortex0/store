import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_categories/data/repos/categories_admin_repo.dart';

import '../../../data/models/update_category_request.dart';

part 'update_category_event.dart';
part 'update_category_state.dart';
part 'update_category_bloc.freezed.dart';

class UpdateCategoryBloc
    extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  UpdateCategoryBloc(this.repo) : super(const _Initial()) {
    on<EditCategoryEvent>(updateCategory);
  }

  final CategoriesAdminRepo repo;

  FutureOr<void> updateCategory(
    EditCategoryEvent event,
    Emitter<UpdateCategoryState> emit,
  ) async {
    try {
      emit(const UpdateCategoryState.loading());
      final result = await repo.updateCategory(body: event.body);
      result.when(
        success: (id) {
          emit(const UpdateCategoryState.success());
        },
        failure: (error) {
          emit(UpdateCategoryState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const UpdateCategoryState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
