// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesNumberResponse _$CategoriesNumberResponseFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberResponse(
      data:
          CategoriesNumberModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesNumberResponseToJson(
        CategoriesNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesNumberModel _$CategoriesNumberModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberModel(
      listCategories: (json['categories'] as List<dynamic>)
          .map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesNumberModelToJson(
        CategoriesNumberModel instance) =>
    <String, dynamic>{
      'categories': instance.listCategories,
    };

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
