import 'package:ecommerce/blocs/cart/cart_cubit.dart';
import 'package:ecommerce/blocs/detail/detail_cubit.dart';
import 'package:ecommerce/blocs/home/home_cubit.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/detail_page.dart';
import 'package:ecommerce/pages/success_checkout_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class Routes {
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit()..getProduct(),
            child: const HomePage(),
          ),
        );
      case '/detail':
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          builder: (context) => BlocProvider(
            create: (context) => DetailCubit(),
            child: const DetailPage(),
          ),
        );
      case '/cart':
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          builder: (context) => BlocProvider(
            create: (context) =>
                CartCubit()..item(settings.arguments as List<CartModel>),
            child: const CartPage(),
          ),
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (context) => const SuccessCheckoutPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
