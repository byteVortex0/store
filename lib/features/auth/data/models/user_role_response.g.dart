// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleResponse _$UserRoleResponseFromJson(Map<String, dynamic> json) =>
    UserRoleResponse(
      userId: (json['id'] as num?)?.toInt(),
      userRole: json['role'] as String?,
      userEmail: json['email'] as String?,
      userName: json['name'] as String?,
      userAvatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserRoleResponseToJson(UserRoleResponse instance) =>
    <String, dynamic>{
      'role': instance.userRole,
      'id': instance.userId,
      'email': instance.userEmail,
      'name': instance.userName,
      'avatar': instance.userAvatar,
    };
