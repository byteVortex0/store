import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/common/screens/under_build_screen.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:store/features/customer/presentation/screens/home_customer_screen.dart';

import '../../features/admin/presentation/screens/home_admin_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static const String loginScreen = '/LoginScreen';
  static const String signUpScreen = '/SignUpScreen';
  static const String homeAdminScreen = '/HomeAdminScreen';
  static const String homeCustomerScreen = '/homecustomerScreen';

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
      case homeAdminScreen:
        return BaseRoute(page: const HomeAdminScreen());
      case homeCustomerScreen:
        return BaseRoute(page: const HomeCustomerScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
