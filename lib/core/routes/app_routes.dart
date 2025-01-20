import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/common/screens/custom_web_view.dart';
import 'package:store/core/common/screens/under_build_screen.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/routes/base_routes.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:store/features/customer/category_details/presentation/screens/category_details_screen.dart';
import 'package:store/features/customer/main/presentation/screens/main_customer_screen.dart';
import 'package:store/features/customer/product_details/presentation/screens/product_details_screen.dart';

import '../../features/admin/home_admin/presentation/screens/home_admin_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static const String loginScreen = '/LoginScreen';
  static const String signUpScreen = '/SignUpScreen';
  static const String homeAdminScreen = '/HomeAdminScreen';
  static const String mainCustomerScreen = '/maincustomerScreen';
  static const String customWebView = '/CustomWebView';
  static const String productDetails = '/ProductDetails';
  static const String categoryDetails = '/CategoryDetails';

  static Route onGenerateRoutes(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case signUpScreen:
        return BaseRoute(
            page: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => sl<UploadImageCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<AuthBloc>(),
          ),
        ], child: const SignUpScreen()));
      case homeAdminScreen:
        return BaseRoute(page: const HomeAdminScreen());
      case mainCustomerScreen:
        return BaseRoute(page: const MainCustomerScreen());
      case customWebView:
        return BaseRoute(page: CustomWebView(url: arg as String));
      case productDetails:
        return BaseRoute(page: ProductDetialsScreen(productId: arg as int));
      case categoryDetails:
        return BaseRoute(
            page: CategoryDetailsScreen(
                categoryInfo: arg as ({String categoryName, int categoryId})));

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
