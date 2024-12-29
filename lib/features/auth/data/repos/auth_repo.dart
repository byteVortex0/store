import 'package:store/core/language/lang_keys.dart';
import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/features/auth/data/data_source/auth_data_source.dart';
import 'package:store/features/auth/data/models/login_response.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';

import '../models/login_request_body.dart';

class AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepo({required this.authDataSource});

  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody body}) async {
    try {
      final response = await authDataSource.login(body: body);
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }

  Future<UserRoleResponse> userRole({required String token}) async {
    final response = await authDataSource.userRole(token);
    return response;
  }
}
