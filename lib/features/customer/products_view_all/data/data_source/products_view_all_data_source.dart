import 'package:store/core/services/graphql/graphql_queries/customer/products_view_all_queries.dart';

import '../../../../../core/services/graphql/api_service.dart';
import '../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';

class ProductsViewAllDataSource {
  final ApiService graphql;

  const ProductsViewAllDataSource({required this.graphql});

  //Get products view all
  Future<GetAllProductsResponse> getProductsViewAll(
      {required int offset}) async {
    final response = await graphql.getProductsViewAll(
      ProductsViewAllQueries().queryOfGetProductsViewAll(offset: offset),
    );
    return response;
  }
}
