import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/di/injection_container.dart';
import 'package:store/core/extensions/context_extension.dart';
import 'package:store/features/customer/categories/presentation/screens/categories_screen.dart';
import 'package:store/features/customer/favourites/presentation/screens/favourites_screen.dart';
import 'package:store/features/customer/home/presentation/screens/home_screen.dart';
import 'package:store/features/customer/profile/presentation/screens/profile_screen.dart';

import '../../../../../core/enums/nav_bar_enum.dart';
import '../cubit/main_cubit.dart';
import '../refactors/main_bottom_nav_bar.dart';
import '../refactors/main_customer_app_bar.dart';

class MainCustomerScreen extends StatelessWidget {
  const MainCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showBackDialog(context) ?? false;
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: BlocProvider(
        create: (context) => sl<MainCubit>(),
        child: Scaffold(
          appBar: const MainCustomerAppBar(),
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(context.asset.homeBg!),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<MainCubit, MainState>(
                    builder: (context, state) {
                      final cubit = context.read<MainCubit>();
                      if (cubit.navBarEnum == NavBarEnum.categories) {
                        return const CategoriesScreen();
                      } else if (cubit.navBarEnum == NavBarEnum.profile) {
                        return const ProfileScreen();
                      } else if (cubit.navBarEnum == NavBarEnum.favourites) {
                        return const FavouritesScreen();
                      }
                      return const HomeScreen();
                    },
                  ),
                ),
                const MainBottomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
