import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:svg_flutter/svg.dart';

class IconTabNavBar extends StatelessWidget {
  const IconTabNavBar({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        icon,
        height: 25.h,
        color: isSelected ? context.color.navBarSelectedTab : Colors.grey,
      ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
    );
  }
}
