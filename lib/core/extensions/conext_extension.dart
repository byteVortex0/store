import 'package:flutter/material.dart';

extension ConextExtension on BuildContext {
  Future<dynamic> pushName(String routeName, {Object? arg}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arg);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arg}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arg);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arg}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (routes) => false);

  void pop() => Navigator.of(this).pop();
}
