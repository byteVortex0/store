import 'dart:developer';

import 'package:app_links/app_links.dart';
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
import 'package:store/features/customer/favourites/presentation/cubit/favourite_cubit.dart';

import 'core/app/share/share_cubit.dart';

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    log('setupDeepLinkHandler');
    _setupDeepLinkHandler();
  }

  void _setupDeepLinkHandler() async {
    // Handle incoming deep links
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        log('Deep link received: $uri');
        _handleDeepLink(uri);
      }
    });

    // Handle initial deep link
    final Uri? initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      log('Initial deep link: $initialLink');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleDeepLink(initialLink);
      });
    }
  }

  void _handleDeepLink(Uri uri) {
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'product') {
      final productId = uri.pathSegments.last;
      if (productId.isNotEmpty) {
        log('Product ID: $productId');
        sl<GlobalKey<NavigatorState>>().currentState?.pushNamed(
              AppRoutes.productDetails,
              arguments: int.parse(productId),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) => value
          ? MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => sl<AppCubit>()
                      ..changeAppThemeMode(
                          sharedMode:
                              SharedPref().getBoolean(PrefKeys.themeMode))
                      ..savedLanguage()),
                BlocProvider(create: (context) => sl<FavouriteCubit>()),
                BlocProvider(create: (context) => sl<ShareCubit>()),
              ],
              child: ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                child: BlocBuilder<AppCubit, AppState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    final cubit = context.read<AppCubit>();
                    log(SharedPref().getString(PrefKeys.accessToken) ??
                        'hiiiiii');

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
