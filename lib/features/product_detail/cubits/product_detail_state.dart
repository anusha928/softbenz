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

class ProductDetailSuccessState<Type> extends ProductDetailState {
  final Type data;

  ProductDetailSuccessState({required this.data});

  @override
  List<Type?> get props => [data];
}

class ProductDetailNoDataState extends ProductDetailState {
  ProductDetailNoDataState();

  @override
  List<Object?> get props => [];
}
