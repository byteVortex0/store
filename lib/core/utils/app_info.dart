import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store/core/language/app_localizations.dart';

class AppInfo {
  AppInfo._();

  static Future<String> getAppVersion(BuildContext context) async {
    var appVersion = '';

    if (AppLocalizations.of(context)!.isEnLocale) {
      final result = await PackageInfo.fromPlatform();
      appVersion = '${result.version} (${result.buildNumber})';
    } else {
      final result = await PackageInfo.fromPlatform();
      appVersion = '(${result.buildNumber}) ${result.version}';
    }

    return appVersion;
  }
}
