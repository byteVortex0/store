import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request_body.g.dart';

@JsonSerializable()
class SearchRequestBody {
  final int? priceMin;
  final int? priceMax;

  SearchRequestBody({
    required this.priceMin,
    required this.priceMax,
  });

  Map<String, dynamic> toJson() => _$SearchRequestBodyToJson(this);
}
