import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:store/features/customer/home/data/data_source/home_data_source.dart';
import 'package:store/features/customer/home/data/models/banner_response.dart';

import '../../../../../core/services/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';

class HomeRepo {
  final HomeDataSource dataSource;

  const HomeRepo({required this.dataSource});

  //Get Banners
  Future<ApiResult<BannerResponse>> getBanners() async {
    try {
      final response = await dataSource.getBanners();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }

  //Get Categories
  Future<ApiResult<GetAllCategoriesResponse>> getCategories() async {
    try {
      final response = await dataSource.getCategories();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }

  //Get Products
  Future<ApiResult<GetAllProductsResponse>> getProducts() async {
    try {
      final response = await dataSource.getProducts();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
