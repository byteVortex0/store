

import 'dart:developer';

import 'package:store/features/auth/data/models/login_request_body.dart';

class AuthQueries {
  const AuthQueries._();

  static const AuthQueries instance = AuthQueries._();

  factory AuthQueries() {
    return instance;
  }

  Map<String, dynamic> loginMapQuery({required LoginRequestBody body}){
    return {
      'query': r'''
          mutation Login($email: String!, $password: String!){
            login(email: $email, password: $password) {
              access_token
              refresh_token
            }
          }
        ''',
        'variables': {
          'email': body.email,
          'password': body.password,
        }
    };
  }
}
