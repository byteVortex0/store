import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_response.g.dart';

@JsonSerializable()
class GetAllCategoriesResponse {
  final CategoriesListModel data;

  GetAllCategoriesResponse({required this.data});

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);

  List<CategoriesModel> get categorisNumber {
    if (data.listCategories.isEmpty) {
      return [];
    }
    return data.listCategories;
  }
}

@JsonSerializable()
class CategoriesListModel {
  @JsonKey(name: 'categories')
  final List<CategoriesModel> listCategories;

  CategoriesListModel({required this.listCategories});

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesListModelFromJson(json);
}

@JsonSerializable()
class CategoriesModel {
  final String? id;
  final String? name;
  final String? image;

  CategoriesModel({
    required this.name,
    required this.id,
    required this.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
