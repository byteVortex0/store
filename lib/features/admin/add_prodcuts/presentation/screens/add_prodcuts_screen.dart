import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/features/admin/add_prodcuts/presentation/blocs/delete_product/delete_product_bloc.dart';
import 'package:store/features/admin/add_prodcuts/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../refactors/add_products_body.dart';

class AddProdcutsScreen extends StatelessWidget {
  const AddProdcutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllAdminProductsBloc>()
            ..add(
              const GetAllAdminProductsEvent.getAllProducts(isNotLoading: true),
            ),
        ),
        BlocProvider(
          create: (context) => sl<DeleteProductBloc>(),
        ),
      ],
      child: const Scaffold(
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Products',
        ),
        body: AddProductsBody(),
      ),
    );
  }
}
