// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponse _$CreateCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryResponse(
      data: CategoryListModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryResponseToJson(
        CreateCategoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoryListModel _$CategoryListModelFromJson(Map<String, dynamic> json) =>
    CategoryListModel(
      addCategories:
          CategoryModel.fromJson(json['addCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryListModelToJson(CategoryListModel instance) =>
    <String, dynamic>{
      'addCategory': instance.addCategories,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
