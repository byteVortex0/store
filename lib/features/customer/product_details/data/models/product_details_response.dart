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
  final String? title;
  final double? price;
  final List<String>? images;
  final String? description;

  ProductData({
    required this.title,
    required this.price,
    required this.images,
    required this.description,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
