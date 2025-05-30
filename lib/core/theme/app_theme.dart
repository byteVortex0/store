import 'package:flutter/material.dart';
import 'package:store/core/colors/colors_dark.dart';
import 'package:store/core/colors/colors_light.dart';
import 'package:store/core/style/fonts/font_family_helper.dart';
import 'package:store/core/theme/colors_extension.dart';
import 'assets_extension.dart';

class AppTheme {

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: const <ThemeExtension<dynamic>>[
        MyColors.light,
        MyAssets.light,
      ],
      textTheme: TextTheme(
        displaySmall: TextStyle(
          fontSize: 14,
          color: ColorsLight.black,
          fontFamily: FontFamilyHelper.getlocalozedFontFamily()
        ),
      ),
      //useMaterial3: true,
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      extensions: <ThemeExtension<dynamic>>[
        MyColors.dark,
        MyAssets.dark,
      ],
      textTheme: TextTheme(
        displaySmall: TextStyle(
          fontSize: 14,
          color: ColorsDark.white,
          fontFamily: FontFamilyHelper.getlocalozedFontFamily() 
        ),
      ),
      //useMaterial3: true
    );
  }
}
