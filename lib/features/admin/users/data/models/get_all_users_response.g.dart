// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersResponse _$GetAllUsersResponseFromJson(Map<String, dynamic> json) =>
    GetAllUsersResponse(
      data: GetUsersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllUsersResponseToJson(
        GetAllUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetUsersData _$GetUsersDataFromJson(Map<String, dynamic> json) => GetUsersData(
      users: (json['users'] as List<dynamic>)
          .map((e) => GetUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersDataToJson(GetUsersData instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

GetUsers _$GetUsersFromJson(Map<String, dynamic> json) => GetUsers(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$GetUsersToJson(GetUsers instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
