// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/features/customer/product_details/data/models/product_details_response.dart';

import '../../../../../core/services/graphql/graphql_queries/customer/product_details_queries.dart';

class ProductDetailsDataSource {
  ApiService graphql;
  ProductDetailsDataSource({
    required this.graphql,
  });

  Future<ProductDetailsResponse> getOneProduct({required int id}) async {
    final response = await graphql.getOneProduct(
      ProductDetailsQueries().queryOfGetOneProduct(id: id),
    );
    return response;
  }
}
