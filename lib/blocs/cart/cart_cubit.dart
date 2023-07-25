import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void minusItem(CartModel cartItem) {
    emit(CartLoading());
    if (cartItem.quantity > 1) {
      listCart[listCart.indexOf(cartItem)].quantity--;
    }
    emit(CartLoaded(
      listCart: listCart,
    ));
  }

  void plusItem(CartModel cartItem) {
    listCart[listCart.indexOf(cartItem)].quantity++;
    emit(CartLoading());
    emit(CartLoaded(
      listCart: listCart,
    ));
  }

  void removeItem(CartModel cartItem) {
    listCart.remove(cartItem);
    emit(CartLoading());
    emit(CartLoaded(
      listCart: listCart,
    ));
  }

  void clearCart() {
    listCart.clear();
    emit(CartLoading());
    emit(CartLoaded(
      listCart: listCart,
    ));
  }

  void item(List<CartModel> cartModel) {
    emit(CartLoaded(listCart: cartModel));
  }
}
