import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';

import '../../../data/repos/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.repo) : super(const ProfileState.loading()) {
    on<GetUserInfoEvent>(getUserInfo);
  }

  ProfileRepo repo;

  FutureOr<void> getUserInfo(
    GetUserInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileState.loading());

      final result = await repo.getUserInfo();

      result.when(
        success: (userinfo) => emit(ProfileState.success(userinfo: userinfo)),
        failure: (error) => emit(ProfileState.error(error: error)),
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('User Info failed: $e\n$stackTrace');
      emit(const ProfileState.error(error: 'An unexpected error occurred'));
    }
  }
}
