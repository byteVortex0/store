import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_products_request_body.g.dart';

@JsonSerializable()
class CreateProductsRequestBody {
  final String? title;
  final double? price;
  final String? description;
  final double? categoryId;
  final List<String>? image;

  CreateProductsRequestBody({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$CreateProductsRequestBodyToJson(this);

}
