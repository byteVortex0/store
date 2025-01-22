// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  final ProductDetailsData data;

  ProductDetailsResponse({
    required this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}

@JsonSerializable()
class ProductDetailsData {
  final ProductData product;

  ProductDetailsData({
    required this.product,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);
}

@JsonSerializable()
class ProductData {
  final String? id;
  final String? title;
  final double? price;
  final List<String>? images;
  final String? description;
  final CategoryDataModel? category;

  ProductData({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.images,
    required this.description,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

@JsonSerializable()
class CategoryDataModel {
  final String? id;
  final String? name;

  CategoryDataModel({
    required this.id,
    required this.name,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataModelFromJson(json);
}
