import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store/core/app/app_cubit/app_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/dio_factory.dart';
import 'package:store/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:store/features/admin/add_categories/data/repos/categories_admin_repo.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/add_notification/add_notification_bloc.dart';
import 'package:store/features/admin/add_notification/presentation/blocs/send_notification/send_notification_bloc.dart';
import 'package:store/features/admin/add_prodcuts/presentation/blocs/create_products/create_products_bloc.dart';
import 'package:store/features/admin/dashboard/data/data_source/dash_board_data_source.dart';
import 'package:store/features/admin/dashboard/data/repos/dash_board_repo.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_categories/number_of_categories_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_products/number_of_products_bloc.dart';
import 'package:store/features/admin/dashboard/presentation/blocs/number_of_users/number_of_users_bloc.dart';
import 'package:store/features/admin/users/data/data_source/get_all_users_data_source.dart';
import 'package:store/features/admin/users/data/repos/get_all_users_repo.dart';
import 'package:store/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';
import 'package:store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:store/features/customer/favourites/presentation/cubit/favourite_cubit.dart';
import 'package:store/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:store/features/customer/product_details/presentation/blocs/product_details/product_details_bloc.dart';
import 'package:store/features/customer/products_view_all/presentation/blocs/products_view_all/products_view_all_bloc.dart';
import 'package:store/features/customer/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:store/features/customer/search/presentation/blocs/search_for_products/search_for_products_bloc.dart';

import '../../features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import '../../features/admin/add_categories/presentation/blocs/create_category/create_category_bloc.dart';
import '../../features/admin/add_categories/presentation/blocs/delete_category/delete_category_bloc.dart';
import '../../features/admin/add_categories/presentation/blocs/update_category/update_category_bloc.dart';
import '../../features/admin/add_notification/data/data_source/add_notification_data_source.dart';
import '../../features/admin/add_notification/data/repos/add_notification_repo.dart';
import '../../features/admin/add_notification/presentation/blocs/get_all_notification_dart_bloc/get_all_notification_bloc.dart';
import '../../features/admin/add_prodcuts/data/data_source/products_admin_data_source.dart';
import '../../features/admin/add_prodcuts/data/repos/products_admin_repo.dart';
import '../../features/admin/add_prodcuts/presentation/blocs/delete_product/delete_product_bloc.dart';
import '../../features/admin/add_prodcuts/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import '../../features/admin/add_prodcuts/presentation/blocs/update_products/update_products_bloc.dart';
import '../../features/admin/users/presentation/blocs/delete_user/delete_user_bloc.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/customer/category_details/data/data_source/category_details_data_source.dart';
import '../../features/customer/category_details/data/repos/category_details_repo.dart';
import '../../features/customer/category_details/presentation/blocs/get_category_details/get_category_details_bloc.dart';
import '../../features/customer/home/data/data_source/home_data_source.dart';
import '../../features/customer/home/data/repos/home_repo.dart';
import '../../features/customer/home/presentation/blocs/get_banners/get_banners_bloc.dart';
import '../../features/customer/home/presentation/blocs/get_categories/get_categories_bloc.dart';
import '../../features/customer/home/presentation/blocs/get_products/get_products_bloc.dart';
import '../../features/customer/product_details/data/data_source/product_details_data_source.dart';
import '../../features/customer/product_details/data/repos/product_details_repo.dart';
import '../../features/customer/products_view_all/data/data_source/products_view_all_data_source.dart';
import '../../features/customer/products_view_all/data/repos/products_view_all_repo.dart';
import '../../features/customer/profile/data/data_source/profile_data_source.dart';
import '../../features/customer/profile/data/repos/profile_repo.dart';
import '../../features/customer/search/data/data_source/search_data_source.dart';
import '../../features/customer/search/data/repos/search_repo.dart';
import '../app/share/share_cubit.dart';
import '../app/upload_image/data_source/upload_image_data_source.dart';
import '../app/upload_image/repo/upload_image_repo.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashBoardAdminPage();
  await _initCategoryAdminPage();
  await _initProductsAdminPage();
  await _initUsersAdminPage();
  await _initNotificationAdminPage();
  await _initMainCusromerPage();
  await _initProfileCusromerPage();
  await _initHomeCusromerPage();
  await _initProductDetailsCusromerPage();
  await _initCategoryDetailsCusromerPage();
  await _initViewAllProductsCusromerPage();
  await _initSearchCusromerPage();
  await _initFavouriteCusromerPage();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerFactory(ShareCubit.new)
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

Future<void> _initDashBoardAdminPage() async {
  sl
    ..registerFactory(() => NumberOfCategoriesBloc(sl()))
    ..registerFactory(() => NumberOfProductsBloc(sl()))
    ..registerFactory(() => NumberOfUsersBloc(sl()))
    ..registerLazySingleton(() => DashBoardDataSource(graphql: sl()))
    ..registerLazySingleton(() => DashBoardRepo(dataSource: sl()));
}

Future<void> _initCategoryAdminPage() async {
  sl
    ..registerFactory(() => GetAllAdminCategoriesBloc(sl()))
    ..registerFactory(() => CreateCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerFactory(() => UpdateCategoryBloc(sl()))
    ..registerLazySingleton(() => CategoriesAdminDataSource(graphql: sl()))
    ..registerLazySingleton(() => CategoriesAdminRepo(dataSource: sl()));
}

Future<void> _initProductsAdminPage() async {
  sl
    ..registerFactory(() => GetAllAdminProductsBloc(sl()))
    ..registerFactory(() => CreateProductsBloc(sl()))
    ..registerFactory(() => DeleteProductBloc(sl()))
    ..registerFactory(() => UpdateProductsBloc(sl()))
    ..registerLazySingleton(() => ProductsAdminDataSource(graphql: sl()))
    ..registerLazySingleton(() => ProductsAdminRepo(dataSource: sl()));
}

Future<void> _initUsersAdminPage() async {
  sl
    ..registerFactory(() => GetAllUsersBloc(sl()))
    ..registerFactory(() => DeleteUserBloc(sl()))
    ..registerLazySingleton(() => GetAllUsersDataSource(graphql: sl()))
    ..registerLazySingleton(() => GetAllUsersRepo(dataSource: sl()));
}

Future<void> _initNotificationAdminPage() async {
  sl
    ..registerFactory(() => AddNotificationBloc())
    ..registerFactory(() => GetAllNotificationBloc())
    ..registerFactory(() => SendNotificationBloc(sl()))
    ..registerLazySingleton(() => AddNotificationRepo(dataSource: sl()))
    ..registerLazySingleton(() => AddNotificationDataSource());
}

Future<void> _initMainCusromerPage() async {
  sl.registerFactory(MainCubit.new);
}

Future<void> _initProfileCusromerPage() async {
  sl
    ..registerFactory(() => ProfileBloc(sl()))
    ..registerLazySingleton(() => ProfileRepo(dataSource: sl()))
    ..registerLazySingleton(() => ProfileDataSource(graphql: sl()));
}

Future<void> _initHomeCusromerPage() async {
  sl
    ..registerFactory(() => GetBannersBloc(sl()))
    ..registerFactory(() => GetCategoriesBloc(sl()))
    ..registerFactory(() => GetProductsBloc(sl()))
    ..registerLazySingleton(() => HomeRepo(dataSource: sl()))
    ..registerLazySingleton(() => HomeDataSource(graphql: sl()));
}

Future<void> _initProductDetailsCusromerPage() async {
  sl
    ..registerFactory(() => ProductDetailsBloc(sl()))
    ..registerLazySingleton(() => ProductDetailsRepo(dataSource: sl()))
    ..registerLazySingleton(() => ProductDetailsDataSource(graphql: sl()));
}

Future<void> _initCategoryDetailsCusromerPage() async {
  sl
    ..registerFactory(() => GetCategoryDetailsBloc(sl()))
    ..registerLazySingleton(() => CategoryDetailsRepo(dataSource: sl()))
    ..registerLazySingleton(() => CategoryDetailsDataSource(graphql: sl()));
}

Future<void> _initViewAllProductsCusromerPage() async {
  sl
    ..registerFactory(() => ProductsViewAllBloc(sl()))
    ..registerLazySingleton(() => ProductsViewAllRepo(dataSource: sl()))
    ..registerLazySingleton(() => ProductsViewAllDataSource(graphql: sl()));
}

Future<void> _initSearchCusromerPage() async {
  sl
    ..registerFactory(() => SearchForProductsBloc(sl()))
    ..registerLazySingleton(() => SearchRepo(dataSource: sl()))
    ..registerLazySingleton(() => SearchDataSource(graphql: sl()));
}

Future<void> _initFavouriteCusromerPage() async {
  sl.registerFactory(() => FavouriteCubit());
}
