import 'package:equatable/equatable.dart';

abstract class ProductDetailState extends Equatable {}

class ProductDetailInitialState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoadingState extends ProductDetailState {
  final bool showLoading;

  ProductDetailLoadingState({this.showLoading = true});

  @override
  List<Object?> get props => [];
}

class ProductDetailErrorState extends ProductDetailState {
  final String message;

  ProductDetailErrorState({required this.message});

  @override
  List<String> get props => [message];
}

class ProductDetailSuccessState<ProductDetailEntity>
    extends ProductDetailState {
  final ProductDetailEntity product;

  ProductDetailSuccessState({required this.product});

  @override
  List<ProductDetailEntity?> get props => [product];
}

class ProductDetailNoDataState extends ProductDetailState {
  ProductDetailNoDataState();

  @override
  List<Object?> get props => [];
}

class ProductColorVarientState extends ProductDetailState {
  final String id;
  ProductColorVarientState({required this.id});
  @override
  List<String?> get props => [id];
}
