import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CartProductsEvent extends Equatable {
  const CartProductsEvent();
}

class LoadCartProductsEvent extends CartProductsEvent {
  @override
  List<Object?> get props => [];
}
