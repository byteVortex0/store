import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/graphql_queries/admin/categories_query.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';

class CategoriesAdminDataSource {
  final ApiService graphql;

  const CategoriesAdminDataSource({required this.graphql});

  //Get All Categories
  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await graphql.getAllCategories(CategoriesQuery().queryOfGetAllCategories());
    return response;
  }
  
}