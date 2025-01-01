import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../data/repos/dash_board_repo.dart';

part 'number_of_products_event.dart';
part 'number_of_products_state.dart';
part 'number_of_products_bloc.freezed.dart';

class NumberOfProductsBloc
    extends Bloc<NumberOfProductsEvent, NumberOfProductsState> {
  NumberOfProductsBloc(this._repo) : super(const NumberOfProductsState.loading()) {
    on<GetNumberOfProductsEvent>(_numberOfProducts);
  }

  final DashBoardRepo _repo;

  FutureOr<void> _numberOfProducts(
    GetNumberOfProductsEvent event,
    Emitter<NumberOfProductsState> emit,
  ) async {

    emit(const NumberOfProductsState.loading());
    final result = await _repo.numberOfProducts();

    result.when(
      success: (data) {
        emit(NumberOfProductsState.success(
            numberOfProducts: data.productsNumber));
      },
      failure: (errorHandler) {
        emit(const NumberOfProductsState.error(error: errorMassage));
      },
    );
  }
}
