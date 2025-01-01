
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_number_response.g.dart';

@JsonSerializable()
class CategoriesNumberResponse {
  final CategoriesNumberModel data;

  CategoriesNumberResponse({required this.data});

  factory CategoriesNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberResponseFromJson(json);

    String get categorisNumber {
      if (data.listCategories.isEmpty) {
        return '0';
      }
      return data.listCategories.length.toString();
    }
}

@JsonSerializable()
class CategoriesNumberModel {
  @JsonKey(name: 'categories')
  final List<CategoriesModel> listCategories;

  CategoriesNumberModel({required this.listCategories});

  factory CategoriesNumberModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberModelFromJson(json);
}

@JsonSerializable()
class CategoriesModel {
  final String? name;

  CategoriesModel({required this.name});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
