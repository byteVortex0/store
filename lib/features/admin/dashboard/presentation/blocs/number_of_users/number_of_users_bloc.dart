import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../data/repos/dash_board_repo.dart';

part 'number_of_users_event.dart';
part 'number_of_users_state.dart';
part 'number_of_users_bloc.freezed.dart';

class NumberOfUsersBloc extends Bloc<NumberOfUsersEvent, NumberOfUsersState> {
  NumberOfUsersBloc(this._repo) : super(const NumberOfUsersState.loading()) {
    on<GetNumberOfUsersEvent>(_numberOfUsers);
  }

  final DashBoardRepo _repo;

  FutureOr<void> _numberOfUsers(
    GetNumberOfUsersEvent event,
    Emitter<NumberOfUsersState> emit,
  ) async {

    emit(const NumberOfUsersState.loading());
    final result = await _repo.numberOfUsers();

    result.when(
      success: (data) {
        emit(NumberOfUsersState.success(
            numberOfUsers: data.usersNumber));
      },
      failure: (errorHandler) {
        emit(const NumberOfUsersState.error(error: errorMassage));
      },
    );
  }
}
