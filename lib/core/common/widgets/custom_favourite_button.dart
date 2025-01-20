import 'package:flutter/material.dart';
import 'package:store/core/extensions/context_extension.dart';

class CustomFavouriteButton extends StatelessWidget {
  const CustomFavouriteButton({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.favorite_outline,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
