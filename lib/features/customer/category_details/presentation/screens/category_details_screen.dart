import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/common/widgets/customer_app_bar.dart';

import '../../../../../core/di/injection_container.dart';
import '../blocs/get_category_details/get_category_details_bloc.dart';
import '../refactors/category_details_body.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.categoryInfo});

  final ({String categoryName, int categoryId}) categoryInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCategoryDetailsBloc>()
        ..add(GetCategoryDetailsEvent.getCategoryDetails(
            id: categoryInfo.categoryId)),
      child: Scaffold(
        appBar: CustomAppBar(title: categoryInfo.categoryName),
        body: const CategoryDetailsBody(),
      ),
    );
  }
}
