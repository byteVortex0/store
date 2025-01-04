import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/graphql_queries/admin/categories_query.dart';
import 'package:store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:store/features/admin/add_categories/data/models/update_category_request.dart';

import '../models/create_category_response.dart';
import '../models/create_category_request.dart';

class CategoriesAdminDataSource {
  final ApiService graphql;

  const CategoriesAdminDataSource({required this.graphql});

  //Get All Categories
  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await graphql.getAllCategories(
      CategoriesQuery().queryOfGetAllCategories(),
    );
    return response;
  }

  //Create Categories
  Future<CreateCategoryResponse> createCategory(
      {required CreateCategoryRequest body}) async {
    final response = await graphql.createCategory(
      CategoriesQuery().queryOfCreateCategory(body: body),
    );
    return response;
  }

  //Delete Categories
  Future<void> deleteCategory({required String id}) async {
    final response = await graphql.deleteCategory(
      CategoriesQuery().queryOfDeleteCategory(id: id),
    );
    return response;
  }
  
  //Delete Categories
  Future<void> updateCategory({required UpdateCategoryRequest body}) async {
    final response = await graphql.updateCategory(
      CategoriesQuery().queryOfUpdateCategory(body: body),
    );
    return response;
  }
}
