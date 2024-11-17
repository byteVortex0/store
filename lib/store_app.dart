import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/connectivity_controller.dart';
import 'package:store/core/common/screens/no_network_screen.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/theme/app_theme.dart';
import 'package:store/login_screen.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) => value
          ? ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Store App',
                  theme: AppTheme().lightTheme(),
                  darkTheme: AppTheme().darkTheme(),
                  themeMode: ThemeMode.dark,
                  onGenerateRoute: (settings) => AppRoutes().onGenerateRoutes(settings),
                  builder: (context, child) => Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return child!;
                      },
                    ),
                  ),
                  home: child,
                );
              },
              child: const LoginScreen(),
            )
          : ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Store App',
                  theme: AppTheme().lightTheme(),
                  darkTheme: AppTheme().darkTheme(),
                  themeMode: ThemeMode.dark,
                  home: child,
                );
              },
              child: const NoNetworkScreen(),
            ),
    );
  }
}
