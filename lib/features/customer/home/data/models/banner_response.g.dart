// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      data: GetAllBannersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllBannersData _$GetAllBannersDataFromJson(Map<String, dynamic> json) =>
    GetAllBannersData(
      products: (json['products'] as List<dynamic>)
          .map((e) => GetAllBanners.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBannersDataToJson(GetAllBannersData instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

GetAllBanners _$GetAllBannersFromJson(Map<String, dynamic> json) =>
    GetAllBanners(
      title: json['title'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetAllBannersToJson(GetAllBanners instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
    };
