import 'package:flutter/material.dart';
import 'package:store/core/extensions/context_extension.dart';

class CustomFavouriteButton extends StatelessWidget {
  const CustomFavouriteButton({
    super.key,
    required this.size,
    required this.isFavourite,
    required this.onTap,
  });

  final double size;
  final bool isFavourite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: isFavourite
          ? Icon(
              Icons.favorite,
              color: Colors.red,
              size: size,
            )
          : Icon(
              Icons.favorite_outline,
              color: context.color.textColor,
              size: size,
            ),
    );
  }
}
