import 'package:flutter/material.dart';
import 'package:store/core/app/connectivity_controller.dart';
import 'package:store/core/common/screens/no_network_screen.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) => value
          ? MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Store App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
              home: Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          : const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Store App',
              home: Scaffold(
                body: NoNetworkScreen(),
              ),
            ),
    );
  }
}
