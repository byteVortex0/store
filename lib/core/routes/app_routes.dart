import 'package:flutter/material.dart';
import 'package:store/core/common/screens/under_build_screen.dart';
import 'package:store/core/routes/base_routes.dart';

class AppRoutes {
  //TODO: add screens 
  static const String testOne = '';
  static const String testTwo = '';

  Route onGenerateRoutes(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case testOne:
        return BaseRoute(page: const PageUnderBuildScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
