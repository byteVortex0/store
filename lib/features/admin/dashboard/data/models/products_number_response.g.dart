// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsNumberResponse _$ProductsNumberResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsNumberResponse(
      data: ProductsNumberModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsNumberResponseToJson(
        ProductsNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductsNumberModel _$ProductsNumberModelFromJson(Map<String, dynamic> json) =>
    ProductsNumberModel(
      listProducts: (json['products'] as List<dynamic>)
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsNumberModelToJson(
        ProductsNumberModel instance) =>
    <String, dynamic>{
      'products': instance.listProducts,
    };

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
