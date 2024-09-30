import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  Future<void> init() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    isInternetConnected(connectivityResult);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false;
    } else if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    } else {
      isConnected.value = false;
      return false;
    }
  }
}
