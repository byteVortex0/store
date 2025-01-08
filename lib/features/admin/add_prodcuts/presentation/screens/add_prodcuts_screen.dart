import 'package:flutter/material.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../refactors/add_products_body.dart';

class AddProdcutsScreen extends StatelessWidget {
  const AddProdcutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Products',
      ),
      body: AddProductsBody(),
    );
  }
}