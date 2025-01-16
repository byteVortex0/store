import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/app_cubit/app_cubit.dart';
import 'package:store/core/app/connectivity_controller.dart';
import 'package:store/core/common/screens/no_network_screen.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/language/app_localizations_setup.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/services/shared_pref/pref_keys.dart';
import 'package:store/core/services/shared_pref/shared_pref.dart';
import 'package:store/core/theme/app_theme.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) => value
          ? BlocProvider(
              create: (context) => sl<AppCubit>()
                ..changeAppThemeMode(
                    sharedMode: SharedPref().getBoolean(PrefKeys.themeMode))
                ..savedLanguage(),
              child: ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                child: BlocBuilder<AppCubit, AppState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    final cubit = context.read<AppCubit>();

                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Store App',

                      //**Theme */
                      theme: AppTheme().lightTheme(),
                      darkTheme: AppTheme().darkTheme(),
                      themeMode:
                          cubit.isDark ? ThemeMode.light : ThemeMode.dark,

                      //**Language */
                      locale: Locale(cubit.currentLang),
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
                      supportedLocales: AppLocalizationsSetup.supportedLocales,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,

                      //**Check NetWorks */
                      builder: (context, child) => GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnectivityController.instance.init();
                              return child!;
                            },
                          ),
                        ),
                      ),

                      //**Routes */
                      onGenerateRoute: AppRoutes.onGenerateRoutes,
                      initialRoute: SharedPref()
                                  .getString(PrefKeys.accessToken) !=
                              null
                          ? SharedPref().getString(PrefKeys.userRole) == 'admin'
                              ? AppRoutes.homeAdminScreen
                              : AppRoutes.mainCustomerScreen
                          : AppRoutes.loginScreen,
                      navigatorKey: sl<GlobalKey<NavigatorState>>(),
                    );
                  },
                ),
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
