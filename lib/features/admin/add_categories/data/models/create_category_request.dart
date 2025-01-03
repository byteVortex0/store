
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_request.g.dart';

@JsonSerializable()
class CreateCategoryRequest {
  final String? name;
  final String? image;

  CreateCategoryRequest({required this.name, required this.image});

  Map<String, dynamic> toJson() => _$CreateCategoryRequestToJson(this);

}