import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/admin/dashboard/data/repos/dash_board_repo.dart';

part 'number_of_categories_event.dart';
part 'number_of_categories_state.dart';
part 'number_of_categories_bloc.freezed.dart';

class NumberOfCategoriesBloc
    extends Bloc<NumberOfCategoriesEvent, NumberOfCategoriesState> {
  NumberOfCategoriesBloc(this._repo)
      : super(const NumberOfCategoriesState.loading()) {
    on<GetNumberOfCategoriesEvent>(_numberOfCategories);
  }

  final DashBoardRepo _repo;

  FutureOr<void> _numberOfCategories(
    GetNumberOfCategoriesEvent event,
    Emitter<NumberOfCategoriesState> emit,
  ) async {
    try {
      emit(const NumberOfCategoriesState.loading());
      final result = await _repo.numberOfCategories();

      result.when(
        success: (data) {
          emit(NumberOfCategoriesState.success(
              numberOfCategories: data.categorisNumber));
        },
        failure: (errorHandler) {
          emit(const NumberOfCategoriesState.error(error: errorMassage));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Number Of Categories failed: $e\n$stackTrace');
      emit(const NumberOfCategoriesState.error(
          error: 'An unexpected error occurred'));
    }
  }
}
