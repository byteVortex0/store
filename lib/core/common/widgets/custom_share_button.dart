import 'package:flutter/material.dart';
import 'package:store/core/extensions/context_extension.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({
    super.key,
    required this.size,
    required this.onTap,
  });

  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.share,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
