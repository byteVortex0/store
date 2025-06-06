import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:store/features/admin/add_categories/data/models/update_category_request.dart';

import '../models/create_category_response.dart';
import '../models/create_category_request.dart';
import '../models/get_all_categories_response.dart';

class CategoriesAdminRepo {
  final CategoriesAdminDataSource dataSource;

  const CategoriesAdminRepo({required this.dataSource}); 

  //Get All Categories
  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await dataSource.getAllCategories();
      return ApiResult.success(response);
    }catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
  
  //Create Categories
  Future<ApiResult<CreateCategoryResponse>> createCategory(
    {required CreateCategoryRequest body}
  ) async {
    try {
      final response = await dataSource.createCategory(body: body);
      return ApiResult.success(response);
    }catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
  
  //Delete Categories
  Future<ApiResult<void>> deleteCategory(
    {required String id}
  ) async {
    try {
      final response = await dataSource.deleteCategory(id: id);
      return ApiResult.success(response);
    }catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
  
  //Update Categories
  Future<ApiResult<void>> updateCategory(
    {required UpdateCategoryRequest body}
  ) async {
    try {
      final response = await dataSource.updateCategory(body: body);
      return ApiResult.success(response);
    }catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }

}