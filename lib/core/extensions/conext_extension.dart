import 'package:flutter/material.dart';

extension ConextExtension on BuildContext {

  //Color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  //Images
  MyImages get image => Theme.of(this).extension<MyImages>()!;

  //pages
  Future<dynamic> pushName(String routeName, {Object? arg}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arg);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arg}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arg);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arg}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (routes) => false);

  void pop() => Navigator.of(this).pop();
}
