
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_response.g.dart';

@JsonSerializable()
class UserRoleResponse {
  @JsonKey(name: 'role')
  final String? userRole;

  UserRoleResponse({required this.userRole});

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);
}