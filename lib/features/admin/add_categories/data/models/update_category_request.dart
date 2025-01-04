
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_request.g.dart';

@JsonSerializable()
class UpdateCategoryRequest {
  final String? id;
  final String? name;
  final String? image;

  UpdateCategoryRequest({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$UpdateCategoryRequestToJson(this);

}
