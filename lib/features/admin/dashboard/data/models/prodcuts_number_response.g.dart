// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prodcuts_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdcutsNumberResponse _$ProdcutsNumberResponseFromJson(
        Map<String, dynamic> json) =>
    ProdcutsNumberResponse(
      data: ProdcutsNumberModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProdcutsNumberResponseToJson(
        ProdcutsNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProdcutsNumberModel _$ProdcutsNumberModelFromJson(Map<String, dynamic> json) =>
    ProdcutsNumberModel(
      listProducts: (json['products'] as List<dynamic>)
          .map((e) => ProdcutsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProdcutsNumberModelToJson(
        ProdcutsNumberModel instance) =>
    <String, dynamic>{
      'products': instance.listProducts,
    };

ProdcutsModel _$ProdcutsModelFromJson(Map<String, dynamic> json) =>
    ProdcutsModel(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ProdcutsModelToJson(ProdcutsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
