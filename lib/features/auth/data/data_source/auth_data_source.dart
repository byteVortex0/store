// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/graphql_queries/auth_queries.dart';
import 'package:store/features/auth/data/models/login_response.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';

import '../models/login_request_body.dart';

class AuthDataSource {
  final ApiService graphql;
  const AuthDataSource({
    required this.graphql,
  });

  //Login
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response = await graphql.login(
      AuthQueries().loginMapQuery(body: body),
    );
    return response;
  }

  // Role
  Future<UserRoleResponse> userRole(String token) async {
    final Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer + $token';
    final client = ApiService(dio);
    final response = await client.userRole(token);
    return response;
  }
}
