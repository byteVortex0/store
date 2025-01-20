import 'package:flutter/material.dart';
import 'package:store/core/extensions/context_extension.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.share,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
