import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';

import '../../../../../core/colors/colors_dark.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../refactors/add_categories_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllAdminCategoriesBloc>()
            ..add(const FetchAllCategoriesEvent(isLoading: true)),
        ),
        
      ],
      child: const Scaffold(
        appBar: AdminAppBar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Categories',
        ),
        body: AddCategoriesBody(),
      ),
    );
  }
}
