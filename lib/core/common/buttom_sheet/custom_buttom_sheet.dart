import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/colors/colors_dark.dart';

class CustomBottomSheet {
  const CustomBottomSheet._();

  static void showBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) {
    showModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: backgroundColor ?? ColorsDark.blueDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ),
        );
      },
    ).whenComplete(whenComplete ?? () {});
  }
}
