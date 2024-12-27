import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/connectivity_controller.dart';
import 'package:store/core/common/screens/no_network_screen.dart';
import 'package:store/core/language/app_localizations_setup.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/theme/app_theme.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) => value
          ? ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Store App',

                //**Theme */
                theme: AppTheme().lightTheme(),
                darkTheme: AppTheme().darkTheme(),
                themeMode: ThemeMode.dark,

                //**Language */
                locale: const Locale('en'),
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,

                //**Check NetWorks */
                builder: (context, child) => Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return child!;
                    },
                  ),
                ),

                //**Routes */
                onGenerateRoute: (settings) =>
                    AppRoutes().onGenerateRoutes(settings),
                initialRoute: AppRoutes.loginScreen,
              ),
            )
          : ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              //Second way for assing MaterialApp
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
