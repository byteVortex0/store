import 'package:hive_flutter/adapters.dart';

part 'favourite_model.g.dart';

@HiveType(typeId: 1)
class FavouriteModel extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final List<String>? image;
  @HiveField(3)
  final double? price;
  @HiveField(4)
  final String? categoryName;

  FavouriteModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.categoryName,
  });
}
