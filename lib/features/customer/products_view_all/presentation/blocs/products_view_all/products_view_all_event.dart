import 'package:equatable/equatable.dart';

abstract class ProductsViewAllEvent extends Equatable {
  const ProductsViewAllEvent();

  @override
  List<Object?> get props => [];
}

class ViewAllEvent extends ProductsViewAllEvent {
  const ViewAllEvent();
}

class LoadMoreEvent extends ProductsViewAllEvent {
  const LoadMoreEvent();
}
