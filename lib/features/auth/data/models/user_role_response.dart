import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_response.g.dart';

@JsonSerializable()
class UserRoleResponse {
  @JsonKey(name: 'role')
  final String? userRole;
  @JsonKey(name: 'id')
  final int? userId;

  @JsonKey(name: 'email')
  final String? userEmail;
  @JsonKey(name: 'name')
  final String? userName;
  @JsonKey(name: 'avatar')
  final String? userAvatar;

  UserRoleResponse({
    required this.userId,
    required this.userRole,
    required this.userEmail,
    required this.userName,
    required this.userAvatar,
  });

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);
}
