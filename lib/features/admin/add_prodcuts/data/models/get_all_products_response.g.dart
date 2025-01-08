// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProductsResponse(
      data: GetAllDataProducts.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductsResponseToJson(
        GetAllProductsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllDataProducts _$GetAllDataProductsFromJson(Map<String, dynamic> json) =>
    GetAllDataProducts(
      products: (json['products'] as List<dynamic>)
          .map((e) => GetAllProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDataProductsToJson(GetAllDataProducts instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

GetAllProducts _$GetAllProductsFromJson(Map<String, dynamic> json) =>
    GetAllProducts(
      id: json['id'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => GetCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductsToJson(GetAllProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'category': instance.category,
    };

GetCategory _$GetCategoryFromJson(Map<String, dynamic> json) => GetCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GetCategoryToJson(GetCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
