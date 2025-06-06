// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      data: ProductDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseToJson(
        ProductDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailsData _$ProductDetailsDataFromJson(Map<String, dynamic> json) =>
    ProductDetailsData(
      product: ProductData.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsDataToJson(ProductDetailsData instance) =>
    <String, dynamic>{
      'product': instance.product,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      category: json['category'] == null
          ? null
          : CategoryDataModel.fromJson(
              json['category'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
      'description': instance.description,
      'category': instance.category,
    };

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) =>
    CategoryDataModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryDataModelToJson(CategoryDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
