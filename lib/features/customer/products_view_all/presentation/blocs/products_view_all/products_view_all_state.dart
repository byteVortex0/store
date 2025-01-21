import 'package:equatable/equatable.dart';

import '../../../../../admin/add_prodcuts/data/models/get_all_products_response.dart';

abstract class ProductsViewAllState extends Equatable {
  final List<GetAllProducts> productsList;
  final bool hasMoreData;

  const ProductsViewAllState({
    required this.productsList,
    required this.hasMoreData,
  });

  @override
  List<Object?> get props => [];
}

class ProductsViewAllInitalState extends ProductsViewAllState {
  const ProductsViewAllInitalState({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllLoadingState extends ProductsViewAllState {
  const ProductsViewAllLoadingState({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllSuccessState extends ProductsViewAllState {
  const ProductsViewAllSuccessState({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllErrorState extends ProductsViewAllState {
  const ProductsViewAllErrorState({
    required super.productsList,
    required super.hasMoreData,
    required this.errorMassage,
  });

  final String errorMassage;

  @override
  List<Object?> get props => [errorMassage];
}
