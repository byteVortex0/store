import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store/core/app/app_cubit/app_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/dio_factory.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:store/features/admin/add_categories/data/repos/categories_admin_repo.dart';
import 'package:store/features/admin/dashboard/data/data_source/dash_board_data_source.dart';
import 'package:store/features/admin/dashboard/data/repos/dash_board_repo.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_categories/number_of_categories_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_products/number_of_products_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_users/number_of_users_bloc.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';

import '../../features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import '../../features/admin/add_categories/presentation/blocs/create_category/create_category_bloc.dart';
import '../../features/admin/add_categories/presentation/blocs/delete_category/delete_category_bloc.dart';
import '../../features/admin/add_categories/presentation/blocs/update_category/update_category_bloc.dart';
import '../../features/admin/add_prodcuts/data/data_source/products_admin_data_source.dart';
import '../../features/admin/add_prodcuts/data/repos/products_admin_repo.dart';
import '../../features/admin/add_prodcuts/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../app/upload_image/data_source/upload_image_data_source.dart';
import '../app/upload_image/repo/upload_image_repo.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashBoard();
  await _initCategory();
  await _initProducts();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(uploadImageDataSource: sl()))
    ..registerLazySingleton(() => UploadImageDataSource(apiService: sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepo(authDataSource: sl()))
    ..registerLazySingleton(() => AuthDataSource(graphql: sl()));
}

Future<void> _initDashBoard() async{
  sl
    ..registerFactory(() => NumberOfCategoriesBloc(sl()))
    ..registerFactory(() => NumberOfProductsBloc(sl()))
    ..registerFactory(() => NumberOfUsersBloc(sl()))
    ..registerLazySingleton(() => DashBoardDataSource(graphql: sl()))
    ..registerLazySingleton(() => DashBoardRepo(dataSource: sl()));
}

Future<void> _initCategory() async{
  sl
    ..registerFactory(() => GetAllAdminCategoriesBloc(sl()))
    ..registerFactory(() => CreateCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerFactory(() => UpdateCategoryBloc(sl()))
    ..registerLazySingleton(() => CategoriesAdminDataSource(graphql: sl()))
    ..registerLazySingleton(() => CategoriesAdminRepo(dataSource: sl()));
}

Future<void> _initProducts() async{
  sl
    ..registerFactory(() => GetAllAdminProductsBloc(sl()))
    ..registerLazySingleton(() => ProductsAdminDataSource(graphql: sl()))
    ..registerLazySingleton(() => ProductsAdminRepo(dataSource: sl()));
}
