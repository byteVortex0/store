import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/services/shared_pref/pref_keys.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';
import 'package:store/features/auth/data/models/login_request_body.dart';
import 'package:store/features/auth/data/models/sign_up_request_body.dart';
import 'package:store/features/auth/data/repos/auth_repo.dart';

import '../../../../core/utils/app_strings.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo) : super(const _Initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }

  final AuthRepo authRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      //Loading
      emit(const AuthState.loading());

      //you get data from repoooooo
      final result = await authRepo.login(
        body: LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );

      //finaly we get dataaaaaa, play by data hhhhhhhhhhhhh
      //Don't forget Do emit
      await result.when(
        success: (loginData) async {
          //
          final token = loginData.data.login.accessToken ?? '';
          await SharedPref().setString(PrefKeys.accessToken, token);

          //
          final user = await authRepo.userRole(token: token);
          await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
          await SharedPref()
              .setString(PrefKeys.userRole, user.userRole ?? 'customer');

          //
          await authRepo.addUserIdFirebase(userId: user.userId.toString());

          emit(AuthState.success(userRole: user.userRole ?? 'customer'));
        },
        failure: (errorHandler) {
          emit(const AuthState.error(errorMassage: errorMassage));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('Login failed: $e\n$stackTrace');
      emit(const AuthState.error(errorMassage: 'An unexpected error occurred'));
    }
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      //Loading
      emit(const AuthState.loading());

      //you get data from repoooooo
      final result = await authRepo.signUp(
        body: SignUpRequestBody(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          avatar: event.avater,
        ),
      );

      result.when(
        success: (loginData) {
          add(const AuthEvent.login());
        },
        failure: (errorHandler) {
          emit(const AuthState.error(errorMassage: errorMassage));
        },
      );
    } catch (e, stackTrace) {
      // Handle unexpected exceptions
      log('SignUp failed: $e\n$stackTrace');
      emit(const AuthState.error(errorMassage: 'An unexpected error occurred'));
    }
  }
}
