import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/admin/users/data/models/get_all_users_response.dart';

import '../../../data/repos/get_all_users_repo.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this.repo) : super(const GetAllUsersState.loading()) {
    on<FetchAllUsersEvent>(getAllUsers);
    on<SearchForUsersEvent>(searchForUsers);
  }

  final GetAllUsersRepo repo;
  TextEditingController searchController = TextEditingController();

  List<GetUsers> usersList = [];

  FutureOr<void> getAllUsers(
    FetchAllUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    try {
      if (event.isNotLoading) {
        emit(const GetAllUsersState.loading());
      }
      final result = await repo.getAllUsers();

      result.when(
        success: (data) {
          if (data.usersList.isEmpty) {
            emit(const GetAllUsersState.empty());
          } else {
            usersList = data.usersList;
            emit(
              GetAllUsersState.success(usersList: usersList),
            );
          }
        },
        failure: (error) {
          emit(GetAllUsersState.error(error: error));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Fetch Categories failed: $e\n$stackTrace');
      emit(const GetAllUsersState.error(error: 'An unexpected error occurred'));
    }
  }

  FutureOr<void> searchForUsers(
    SearchForUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    final searchResult = usersList
        .where(
          (element) => (element.name!
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              (element.email!
                  .toLowerCase()
                  .startsWith(searchController.text.toLowerCase().trim()))),
        )
        .toList();

    emit(GetAllUsersState.search(searchList: searchResult));
  }
}
