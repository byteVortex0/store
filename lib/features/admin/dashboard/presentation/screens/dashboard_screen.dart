import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_categories/number_of_categories_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_products/number_of_products_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_users/number_of_users_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NumberOfProductsBloc>()
          ..add(const NumberOfProductsEvent.numberOfProducts()),
        ),
        BlocProvider(
          create: (context) => sl<NumberOfCategoriesBloc>()
          ..add(const NumberOfCategoriesEvent.numberOfCategories()),
        ),
        BlocProvider(
          create: (context) => sl<NumberOfUsersBloc>()
          ..add(const NumberOfUsersEvent.numberOfUsers()),
        ),
      ],
      child: const Scaffold(
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Dashboard',
        ),
        body: DashboardBody(),
      ),
    );
  }
}
