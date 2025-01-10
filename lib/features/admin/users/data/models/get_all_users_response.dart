// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_users_response.g.dart';

@JsonSerializable()
class GetAllUsersResponse {
  GetUsersData data;
  GetAllUsersResponse({
    required this.data,
  });

  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersResponseFromJson(json);


  List<GetUsers> get usersList {
    if (data.users.isEmpty) {
      return [];
    }
    return data.users;
  }

}

@JsonSerializable()
class GetUsersData {
  List<GetUsers> users;
  GetUsersData({
    required this.users,
  });

  factory GetUsersData.fromJson(Map<String, dynamic> json) =>
      _$GetUsersDataFromJson(json);

}

@JsonSerializable()
class GetUsers {
  final String? id;
  final String? name;
  final String? email;

  GetUsers({
    required this.id,
    required this.name,
    required this.email,
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) =>
      _$GetUsersFromJson(json);

}
