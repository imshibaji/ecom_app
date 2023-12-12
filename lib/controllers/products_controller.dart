import 'package:ecom_app/classes/product.dart';
import 'package:ecom_app/services/product_service.dart';
import 'package:ecom_app/views/products_view.dart';
import 'package:flutter/material.dart';

class ProductsCotroller extends StatelessWidget {
  const ProductsCotroller({super.key});

  @override
  Widget build(BuildContext context) {
    final ps = ProductService();

    return FutureBuilder(
      future: ps.getAllProducts(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return ProductsView(products: snapshot.data as List<Product>);
        }
        return const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
