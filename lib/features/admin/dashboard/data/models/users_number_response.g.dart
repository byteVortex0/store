// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersNumberResponse _$UsersNumberResponseFromJson(Map<String, dynamic> json) =>
    UsersNumberResponse(
      data: UsersNumberModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersNumberResponseToJson(
        UsersNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UsersNumberModel _$UsersNumberModelFromJson(Map<String, dynamic> json) =>
    UsersNumberModel(
      listUsers: (json['users'] as List<dynamic>)
          .map((e) => UsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersNumberModelToJson(UsersNumberModel instance) =>
    <String, dynamic>{
      'users': instance.listUsers,
    };

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
