import 'package:flutter/material.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Categories',
      ),
      body: Center(
        child: Text(
          'Categories Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}