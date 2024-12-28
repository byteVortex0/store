import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/common/screens/under_build_screen.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:store/features/auth/presentation/screens/sign_up_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static const String loginScreen = '/LoginScreen';
  static const String signUpScreen = '/SignUpScreen';

  Route onGenerateRoutes(RouteSettings settings) {
    //final arg = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case signUpScreen:
        return BaseRoute(page: const SignUpScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
