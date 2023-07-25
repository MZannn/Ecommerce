import 'package:ecommerce/models/product_model.dart';

class CartModel {
  ProductModel productModel;
  int quantity;
  CartModel({required this.productModel, required this.quantity});
}

List<CartModel> listCart = [];
