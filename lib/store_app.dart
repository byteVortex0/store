import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/app/connectivity_controller.dart';
import 'package:store/core/common/screens/no_network_screen.dart';

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
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
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
              child: Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          : ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Store App',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: child,
                );
              },
              child: const NoNetworkScreen(),
            ),
    );
  }
}
