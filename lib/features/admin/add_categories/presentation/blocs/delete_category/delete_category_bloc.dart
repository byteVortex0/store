import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_categories/data/repos/categories_admin_repo.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';
part 'delete_category_bloc.freezed.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this.repo) : super(const _Initial()) {
    on<RemoveCategoryEvent>(deleteCategory);
  }
  final CategoriesAdminRepo repo;

  FutureOr<void> deleteCategory(
    RemoveCategoryEvent event,
    Emitter<DeleteCategoryState> emit,
  ) async {
    try {
      emit(DeleteCategoryState.loading(id: event.id));
      final result = await repo.deleteCategory(
        id: event.id,
      );
      result.when(
        success: (id) {
          emit(const DeleteCategoryState.success());
        },
        failure: (error) {
          emit(DeleteCategoryState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const DeleteCategoryState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
