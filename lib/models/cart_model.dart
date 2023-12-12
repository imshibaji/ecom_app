import 'package:ecom_app/classes/product.dart';
import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  List<Product> orders = [];

  List<Product> get products => orders;

  int get count => orders.length;

  double get totalPrice =>
      orders.fold(0.00, (total, current) => total + current.price!);

  void addProduct(Product product) {
    orders.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    orders.remove(product);
    notifyListeners();
  }

  void clearCart() {
    orders.clear();
    notifyListeners();
  }
}
