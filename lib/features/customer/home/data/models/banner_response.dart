import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/utils/app_strings.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  GetAllBannersData data;
  BannerResponse({
    required this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);

  List<String> get getBannersList {
    final list =
        data.products.where((e) => e.title!.contains(bannerTitle)).toList();
    if (list.isEmpty) {
      return [];
    }
    return list.first.images!;
  }
}

@JsonSerializable()
class GetAllBannersData {
  List<GetAllBanners> products;
  GetAllBannersData({
    required this.products,
  });

  factory GetAllBannersData.fromJson(Map<String, dynamic> json) =>
      _$GetAllBannersDataFromJson(json);
}

@JsonSerializable()
class GetAllBanners {
  final String? title;
  final List<String>? images;

  GetAllBanners({
    required this.title,
    required this.images,
  });

  factory GetAllBanners.fromJson(Map<String, dynamic> json) =>
      _$GetAllBannersFromJson(json);
}
