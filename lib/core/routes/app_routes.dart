import 'package:flutter/material.dart';
import 'package:store/core/common/screens/under_build_screen.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/login_screen.dart';

class AppRoutes {
  
  static const String loginScreen = '/LoginScreen';

  Route onGenerateRoutes(RouteSettings settings) {
    //final arg = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return BaseRoute(page: const LoginScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
