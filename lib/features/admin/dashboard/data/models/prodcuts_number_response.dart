import 'package:freezed_annotation/freezed_annotation.dart';

part 'prodcuts_number_response.g.dart';

@JsonSerializable()
class ProdcutsNumberResponse {
  final ProdcutsNumberModel data;

  ProdcutsNumberResponse({required this.data});

  factory ProdcutsNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ProdcutsNumberResponseFromJson(json);

    String get prodcutsNumber {
      if (data.listProducts.isEmpty) {
        return '0';
      }
      return data.listProducts.length.toString();
    }
}

@JsonSerializable()
class ProdcutsNumberModel {
  @JsonKey(name: 'products')
  final List<ProdcutsModel> listProducts;

  ProdcutsNumberModel({required this.listProducts});

  factory ProdcutsNumberModel.fromJson(Map<String, dynamic> json) =>
      _$ProdcutsNumberModelFromJson(json);
}

@JsonSerializable()
class ProdcutsModel {
  final String? title;

  ProdcutsModel({required this.title});

  factory ProdcutsModel.fromJson(Map<String, dynamic> json) =>
      _$ProdcutsModelFromJson(json);
}
