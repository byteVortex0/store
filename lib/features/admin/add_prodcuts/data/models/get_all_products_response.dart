// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  GetAllDataProducts data;
  GetAllProductsResponse({
    required this.data,
  });

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);

  List<GetAllProducts> get getProductsList{
    if (data.products.isEmpty) {
      return [];
    }
    return data.products;
  }

}

@JsonSerializable()
class GetAllDataProducts {
  List<GetAllProducts> products;
  GetAllDataProducts({
    required this.products,
  });

  factory GetAllDataProducts.fromJson(Map<String, dynamic> json) =>
      _$GetAllDataProductsFromJson(json);
}

@JsonSerializable()
class GetAllProducts {
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String>? images;
  final GetCategory? category;

  GetAllProducts({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  factory GetAllProducts.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsFromJson(json);
}

@JsonSerializable()
class GetCategory {
  final String? id;
  final String? name;

  GetCategory({required this.id, required this.name});

  factory GetCategory.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryFromJson(json);
}
