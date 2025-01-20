import 'package:store/core/services/graphql/graphql_queries/customer/category_details_queries.dart';
import 'package:store/features/admin/add_prodcuts/data/models/get_all_products_response.dart';

import '../../../../../core/services/graphql/api_service.dart';

class CategoryDetailsDataSource {
  final ApiService graphql;

  const CategoryDetailsDataSource({required this.graphql});

  Future<GetAllProductsResponse> getCategoryDetails({required int id}) async {
    final response = await graphql.getCategoryDetails(
      CategoryDetailsQueries().queryOfGetCategoryDetails(id: id),
    );
    return response;
  }
}
