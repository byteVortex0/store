// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store/core/services/graphql/api_service.dart';
import 'package:store/features/auth/data/models/user_role_response.dart';

class ProfileDataSource {
  final ApiService graphql;
  const ProfileDataSource({
    required this.graphql,
  });

  Future<UserRoleResponse> getUserInfo() {
    final response = graphql.userRole();
    return response;
  }
}
