import 'package:flutter/material.dart';

import 'package:store/core/style/images/app_images.dart';

@immutable
class MyImages extends ThemeExtension<MyImages> {
  const MyImages({required this.image});

  final String? image;

  @override
  ThemeExtension<MyImages> copyWith({Color? mainColor}) {
    return MyImages(image: image);
  }

  @override
  ThemeExtension<MyImages> lerp(
      covariant ThemeExtension<MyImages>? other, double t) {
    if (other is! MyImages) {
      return this;
    }

    return MyImages(
      image: image,
    );
  }

  static const MyImages light = MyImages(image: AppImages.lightTestImage);
  static const MyImages dark = MyImages(image: AppImages.darkTestImage);
}
