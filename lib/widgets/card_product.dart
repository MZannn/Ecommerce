import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: productModel,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 0.1,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200 / 2.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(productModel.image!),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  productModel.title!,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "\$${productModel.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    RatingStars(rate: productModel.rating!.rate!),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('${productModel.rating!.rate}'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
