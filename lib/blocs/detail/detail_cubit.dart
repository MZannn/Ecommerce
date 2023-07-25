import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());

  void addToCart(ProductModel product, int quantityToAdd) {
    int index = listCart
        .indexWhere((cartItem) => cartItem.productModel.id == product.id);
    if (index != -1) {
      listCart[index].quantity += quantityToAdd;
    } else {
      listCart.add(CartModel(productModel: product, quantity: quantityToAdd));
    }
  }
}
