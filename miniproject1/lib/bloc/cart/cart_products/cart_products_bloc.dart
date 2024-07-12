import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/cart/cart_product_repository.dart';
import 'cart_products_event.dart';
import 'cart_products_state.dart';

class CartProductsBloc extends Bloc<CartProductsEvent, CartProductsState> {
  final CartProductRepository _cartProductRepository;

  CartProductsBloc(this._cartProductRepository)
      : super(CartProductsLoadingState()) {
    on<LoadCartProductsEvent>((event, emit) async {
      emit(CartProductsLoadingState());
      try {
        final products = await _cartProductRepository.getProducts();
        emit(CartProductsLoadedState(products));
      } catch (e) {
        emit(CartProductsErrorState(e.toString()));
      }
    });
  }
}
