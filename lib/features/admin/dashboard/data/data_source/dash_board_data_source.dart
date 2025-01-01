import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/graphql_queries/admin/dash_board_queries.dart';
import 'package:store/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:store/features/admin/dashboard/data/models/products_number_response.dart';

import '../models/users_number_response.dart';

class DashBoardDataSource {
  final ApiService graphql;

  const DashBoardDataSource({required this.graphql});

  Future<ProductsNumberResponse> numberOfProducts() async {
    final response =
        await graphql.numberOfProducts(DashBoardQueries().queryOfProducts());
    return response;
  }

  Future<CategoriesNumberResponse> numberOfCategories() async {
    final response = await graphql
        .numberOfCategories(DashBoardQueries().queryOfCategories());
    return response;
  }

  Future<UsersNumberResponse> numberOfUsers() async {
    final response =
        await graphql.numberOfUsers(DashBoardQueries().queryOfUsers());
    return response;
  }
}
