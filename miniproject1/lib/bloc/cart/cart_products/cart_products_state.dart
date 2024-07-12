import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/cart/product_cart_model.dart';

@immutable
abstract class CartProductsState extends Equatable {}

class CartProductsLoadingState extends CartProductsState {
  @override
  List<Object?> get props => [];
}

class CartProductsLoadedState extends CartProductsState {
  final List<ProductCartModel> products;

  CartProductsLoadedState(this.products);

  @override
  List<Object?> get props => [products];
}

class CartProductsErrorState extends CartProductsState {
  final String error;

  CartProductsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
