import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_products_request_body.g.dart';

@JsonSerializable()
class UpdateProductsRequestBody {
  final String? title;
  final double? price;
  final String? description;
  final double? categoryId;
  final String? productId;
  final List<String>? image;

  UpdateProductsRequestBody({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.productId,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$UpdateProductsRequestBodyToJson(this);
}
