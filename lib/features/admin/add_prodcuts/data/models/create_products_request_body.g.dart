// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_products_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductsRequestBody _$CreateProductsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateProductsRequestBody(
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateProductsRequestBodyToJson(
        CreateProductsRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'image': instance.image,
    };
