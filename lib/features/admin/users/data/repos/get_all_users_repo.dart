import 'package:store/core/utils/app_strings.dart';

import '../../../../../core/services/graphql/api_result.dart';
import '../data_source/get_all_users_data_source.dart';
import '../models/get_all_users_response.dart';

class GetAllUsersRepo {
  final GetAllUsersDataSource dataSource;

  GetAllUsersRepo({required this.dataSource});

  Future<ApiResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final response = await dataSource.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
  
  Future<ApiResult<void>> deleteUser({required String id}) async {
    try {
      final response = await dataSource.deleteUsers(id: id);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
