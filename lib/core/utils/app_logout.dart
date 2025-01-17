import 'package:flutter/material.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/core/services/hive/hive_database.dart';

import '../routes/app_routes.dart';
import '../services/shared_pref/pref_keys.dart';
import '../services/shared_pref/shared_pref.dart';

class AppLogout {
  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  factory AppLogout() => _instance;

  Future<void> logout() async {
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;
    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);
    await SharedPref().removePreference(PrefKeys.userRole);
    await HiveDatabase().clearAllBoxs();
    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
    );
  }
}
