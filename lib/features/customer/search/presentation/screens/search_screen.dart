import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/customer/search/presentation/blocs/search_for_products/search_for_products_bloc.dart';

import '../../../../../core/common/widgets/customer_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchForProductsBloc>(),
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Search'),
        body: SearchBody(),
      ),
    );
  }
}
