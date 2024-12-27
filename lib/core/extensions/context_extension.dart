import 'package:flutter/material.dart';
import 'package:store/core/language/app_localizations.dart';
import 'package:store/core/theme/colors_extension.dart';

import '../theme/assets_extension.dart';

extension ContextExtension on BuildContext {

  //Color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  //Images
  MyAssets get asset => Theme.of(this).extension<MyAssets>()!;

  //style
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  //language
  String trenslate(String langKey){
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

  //pages
  Future<dynamic> pushName(String routeName, {Object? arg}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arg);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arg}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arg);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arg}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (routes) => false);

  void pop() => Navigator.of(this).pop();
}
