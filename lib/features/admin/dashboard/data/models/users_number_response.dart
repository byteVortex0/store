
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_number_response.g.dart';

@JsonSerializable()
class UsersNumberResponse {
  final UsersNumberModel data;

  UsersNumberResponse({required this.data});

  factory UsersNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberResponseFromJson(json);

    String get usersNumber {
      if (data.listUsers.isEmpty) {
        return '0';
      }
      return data.listUsers.length.toString();
    }
}

@JsonSerializable()
class UsersNumberModel {
  @JsonKey(name: 'users')
  final List<UsersModel> listUsers;

  UsersNumberModel({required this.listUsers});

  factory UsersNumberModel.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberModelFromJson(json);
}

@JsonSerializable()
class UsersModel {
  final String? name;

  UsersModel({required this.name});

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}
