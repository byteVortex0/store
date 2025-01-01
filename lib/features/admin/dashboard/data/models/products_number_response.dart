import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_number_response.g.dart';

@JsonSerializable()
class ProductsNumberResponse {
  final ProductsNumberModel data;

  ProductsNumberResponse({required this.data});

  factory ProductsNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberResponseFromJson(json);

    String get productsNumber {
      if (data.listProducts.isEmpty) {
        return '0';
      }
      return data.listProducts.length.toString();
    }
}

@JsonSerializable()
class ProductsNumberModel {
  @JsonKey(name: 'products')
  final List<ProductsModel> listProducts;

  ProductsNumberModel({required this.listProducts});

  factory ProductsNumberModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberModelFromJson(json);
}

@JsonSerializable()
class ProductsModel {
  final String? title;

  ProductsModel({required this.title});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
}
