import 'package:flutter/material.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/colors/colors_light.dart';
import 'package:store/core/theme/colors_extension.dart';
import 'package:store/core/theme/images_extension.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
      MyImages.light,
    ],
    useMaterial3: true,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
      MyImages.dark,
    ],
    useMaterial3: true,
  );
}
