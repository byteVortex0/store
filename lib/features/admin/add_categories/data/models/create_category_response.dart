import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_response.g.dart';

@JsonSerializable()
class CreateCategoryResponse {
  final CategoryListModel data;

  CreateCategoryResponse({required this.data});

  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);
}

@JsonSerializable()
class CategoryListModel {
  @JsonKey(name: 'addCategory')
  final CategoryModel addCategories;

  CategoryListModel({required this.addCategories});

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryListModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final String? id;
  final String? name;
  final String? image;

  CategoryModel({
    required this.name,
    required this.id,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
