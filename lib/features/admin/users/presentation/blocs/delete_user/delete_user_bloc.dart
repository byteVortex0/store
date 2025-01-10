import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/users/data/repos/get_all_users_repo.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';
part 'delete_user_bloc.freezed.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  DeleteUserBloc(this.repo) : super(const _Initial()) {
    on<RemoveUserEvent>(deleteUser);
  }

  final GetAllUsersRepo repo;

  FutureOr<void> deleteUser(
    RemoveUserEvent event,
    Emitter<DeleteUserState> emit,
  ) async {
    try {
      emit(DeleteUserState.loading(id: event.id));
      final result = await repo.deleteUser(id: event.id);
      result.when(
        success: (data) {
          emit(const DeleteUserState.success());
        },
        failure: (error) {
          emit(DeleteUserState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const DeleteUserState.error(error: 'An unexpected error occurred'));
    }
  }
}
