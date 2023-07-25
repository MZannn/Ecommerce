import 'package:ecommerce/models/cart_model.dart';

import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct(
      {super.key,
      required this.cartModel,
      this.removePressed,
      this.addPressed});
  final CartModel cartModel;
  final void Function()? removePressed;
  final void Function()? addPressed;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(cartModel.productModel.image!),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      cartModel.productModel.title!,
                      style: textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    '\$${cartModel.productModel.price!}',
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: removePressed,
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              Text(
                cartModel.quantity.toString(),
                style: textTheme.bodyMedium,
              ),
              IconButton(
                onPressed: addPressed,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
