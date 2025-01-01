// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/features/admin/dashboard/data/data_source/dash_board_data_source.dart';

import '../models/categories_number_response.dart';
import '../models/products_number_response.dart';
import '../models/users_number_response.dart';

class DashBoardRepo {
  final DashBoardDataSource dataSource;
  const DashBoardRepo({
    required this.dataSource,
  });

  Future<ApiResult<ProductsNumberResponse>> numberOfProducts() async {
    try {
      final response = await dataSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please try agian');
    }
  }

  Future<ApiResult<CategoriesNumberResponse>> numberOfCategories() async {
    try {
      final response = await dataSource.numberOfCategories();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please try agian');
    }
  }

  Future<ApiResult<UsersNumberResponse>> numberOfUsers() async {
    try {
      final response = await dataSource.numberOfUsers();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please try agian');
    }
  }
}
