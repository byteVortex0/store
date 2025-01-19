import 'package:store/core/services/graphql/graphql_queries/admin/categories_queries.dart';
import 'package:store/core/services/graphql/graphql_queries/admin/products_queries.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:store/features/customer/home/data/models/banner_response.dart';

import '../../../../../core/services/graphql/api_service.dart';
import '../../../../../core/services/graphql/graphql_queries/customer/home_queries.dart';
import '../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';

class HomeDataSource {
  final ApiService graphql;

  const HomeDataSource({required this.graphql});

  //Get Banners
  Future<BannerResponse> getBanners() async {
    final response = await graphql.getBanners(
      HomeQueries().queryOfGetAllBanners(),
    );
    return response;
  }

  //Get Categories
  Future<GetAllCategoriesResponse> getCategories() async {
    final response = await graphql.getAllCategories(
      CategoriesQuery().queryOfGetAllCategories(),
    );
    return response;
  }

  //Get Products
  Future<GetAllProductsResponse> getProducts() async {
    final response = await graphql.getAllProducts(
      ProductsQueries().queryOfGetAllProducts(),
    );
    return response;
  }
}
