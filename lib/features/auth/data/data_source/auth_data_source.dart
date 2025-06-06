// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/core/services/graphql/graphql_queries/auth/auth_queries.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/auth/data/models/login_response.dart';
import 'package:store/features/auth/data/models/sign_up_request_body.dart';
import 'package:store/features/auth/data/models/sign_up_response.dart';
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
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    return response;
  }

  //SignUp
  Future<SignUpResponse> signUp({required SignUpRequestBody body}) async {
    final response = await graphql.signUp(
      AuthQueries().signUpMapQuery(body: body),
    );
    return response;
  }

  //AddUserId
  Future<void> addUserIdFirebase({required String userId}) async {
    await FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(userId)
        .set({});
  }
}
