// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  SingUpDataModel data;
  SignUpResponse({
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class SingUpDataModel {
  AddUserModel addUser;
  SingUpDataModel({
    required this.addUser,
  });

  factory SingUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$SingUpDataModelFromJson(json);
}

@JsonSerializable()
class AddUserModel {
  final String? id;
  final String? name;

  AddUserModel({required this.id, required this.name});

  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
}
