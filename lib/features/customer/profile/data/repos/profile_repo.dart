import 'package:store/core/services/graphql/api_result.dart';
import 'package:store/core/utils/app_strings.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';
import 'package:store/features/customer/profile/data/data_source/profile_data_source.dart';

class ProfileRepo {
  final ProfileDataSource dataSource;

  const ProfileRepo({required this.dataSource});

  Future<ApiResult<UserRoleResponse>> getUserInfo() async {
    try {
      final response = await dataSource.getUserInfo();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMassage);
    }
  }
}
