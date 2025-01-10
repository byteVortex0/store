

import '../../../../../core/services/graphql/api_service.dart';
import '../../../../../core/services/graphql/graphql_queries/admin/users_queries.dart';
import '../models/get_all_users_response.dart';

class GetAllUsersDataSource {

  final ApiService graphql;

  GetAllUsersDataSource({required this.graphql});


  Future<GetAllUsersResponse> getAllUsers() async {
    final response = await graphql.getAllUsers(
      UsersQuery().queryOfGetAllUsers(),
    );
    return response;
  }
  
   Future<void> deleteUsers({required String id}) async {
    final response = await graphql.deleteUsers(
      UsersQuery().queryOfDeleteUsers(id: id),
    );
    return response;
  }

}