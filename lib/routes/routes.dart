import 'package:ecom_app/controllers/about_controller.dart';
import 'package:ecom_app/controllers/cart_controller.dart';
import 'package:ecom_app/controllers/contact_controller.dart';
import 'package:ecom_app/controllers/home_controller.dart';
import 'package:ecom_app/controllers/login_controller.dart';
import 'package:ecom_app/controllers/products_controller.dart';
import 'package:ecom_app/controllers/register_controller.dart';
import 'package:flutter/widgets.dart';

const initialPage = '/home';

/// Routes
Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeCotroller(),
  '/about': (context) => const AboutCotroller(),
  '/contact': (context) => const ContactCotroller(),
  '/products': (context) => const ProductsCotroller(),
  '/cart': (context) => const CartCotroller(),
  '/login': (context) => const LoginCotroller(),
  '/register': (context) => const RegisterCotroller(),
};
