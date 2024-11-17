import 'package:flutter/material.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/colors/colors_light.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.mainColor});

  final Color? mainColor;

  @override
  ThemeExtension<MyColors> copyWith({Color? mainColor}) {
    return MyColors(mainColor: mainColor ?? this.mainColor);
  }

  @override
  ThemeExtension<MyColors> lerp(
      covariant ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }

    return MyColors(mainColor: Color.lerp(mainColor, other.mainColor, t));
    
  }

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
  );
  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
  );
}
