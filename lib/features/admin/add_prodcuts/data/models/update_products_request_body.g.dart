// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_products_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductsRequestBody _$UpdateProductsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateProductsRequestBody(
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      categoryId: (json['categoryId'] as num?)?.toDouble(),
      productId: json['productId'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateProductsRequestBodyToJson(
        UpdateProductsRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'productId': instance.productId,
      'image': instance.image,
    };
