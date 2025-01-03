import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:store/features/admin/add_categories/data/repos/categories_admin_repo.dart';

import '../../../data/models/create_category_response.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';
part 'create_category_bloc.freezed.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this.repo) : super(const _Initial()) {
    on<AddCategoryEvent>(_addCategory);
  }

  final CategoriesAdminRepo repo;

  FutureOr<void> _addCategory(
    AddCategoryEvent event,
    Emitter<CreateCategoryState> emit,
  ) async {
    try {
      
      emit(const CreateCategoryState.loading());
      final result = await repo.createCategory(
        body: event.categoryRequest,
      );
      result.when(
        success: (category) {
          emit(CreateCategoryState.success(category: category));
        },
        failure: (error) {
          emit(CreateCategoryState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Create Category failed: $e\n$stackTrace');
      emit(const CreateCategoryState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
