import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/common/animations/animate_do.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/customer/home/presentation/blocs/get_products/get_products_bloc.dart';
import 'package:store/features/customer/home/presentation/refactors/home_body.dart';

import '../../../../../core/di/injection_container.dart';
import '../blocs/get_banners/get_banners_bloc.dart';
import '../blocs/get_categories/get_categories_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<GetBannersBloc>()..add(const GetBannersEvent.getBanners()),
        ),
        BlocProvider(
          create: (context) => sl<GetCategoriesBloc>()
            ..add(const GetCategoriesEvent.getCategories()),
        ),
        BlocProvider(
          create: (context) =>
              sl<GetProductsBloc>()..add(const GetProductsEvent.getProducts()),
        ),
      ],
      child: Stack(
        children: [
          HomeBody(scrollController: _scrollController),
          CustomFadeInLeft(
            duration: 300,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: FloatingActionButton(
                  onPressed: _scrollToTop,
                  backgroundColor: context.color.bluePinkLight,
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
