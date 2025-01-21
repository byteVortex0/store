import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/graphql_queries/customer/search_queries.dart';

import '../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';
import '../models/search_request_body.dart';

class SearchDataSource {
  final ApiService graphql;

  const SearchDataSource({required this.graphql});

  //Search for products
  Future<GetAllProductsResponse> searchForProductsbyTitle(
      {required String title}) async {
    final response = await graphql.searchForProducts(
      SearchQueries().queryOfSearchForProductsbyTitle(title: title),
    );
    return response;
  }

  Future<GetAllProductsResponse> searchForProductsbyPrice(
      {required SearchRequestBody body}) async {
    final response = await graphql.searchForProducts(
      SearchQueries().queryOfSearchForProductsbyPrice(body: body),
    );
    return response;
  }
}
