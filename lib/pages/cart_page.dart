import 'package:ecommerce/blocs/cart/cart_cubit.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/widgets/list_product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as List<CartModel>;
    final textTheme = Theme.of(context).textTheme;
    final CartCubit cartcubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Cart',
          style: textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: arguments
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                                return ListProduct(
                                  cartModel: e,
                                  removePressed: () async {
                                    if (e.quantity == 1) {
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            title: const Text('Warning'),
                                            content: const Text(
                                                'Are you sure want to remove this item?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  cartcubit.removeItem(e);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      cartcubit.minusItem(e);
                                    }
                                  },
                                  addPressed: () {
                                    cartcubit.plusItem(e);
                                  },
                                );
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  height: 130,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          arguments.map((e) => e.productModel.price!).toList();
                          return Text(
                            'Total: \$${arguments.isNotEmpty ? arguments.map((e) => (e.productModel.price! * e.quantity)).toList().reduce((value, element) => value + element) : 0}',
                            style: textTheme.titleLarge,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (listCart.isNotEmpty) {
                            cartcubit.clearCart();
                            Navigator.pushNamed(context, '/checkout');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cart is empty'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          minimumSize: const Size(
                            double.infinity,
                            50,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Checkout',
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
