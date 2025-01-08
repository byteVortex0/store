
import 'package:store/core/services/graphql/graphql_queries/admin/products_queries.dart';
import 'package:store/features/admin/add_prodcuts/data/models/get_all_products_response.dart';

import '../../../../../core/services/graphql/api_service.dart';

class ProductsAdminDataSource {
  final ApiService graphql;

  const ProductsAdminDataSource({required this.graphql});

  //Get All Products
  Future<GetAllProductsResponse> getAllProducts() async {
    final response = await graphql.getAllProducts(
      ProductsQueries().queryOfGetAllProducts(),
    );
    return response;
  }
}
