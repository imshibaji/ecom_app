import 'package:ecom_app/classes/product.dart';
import 'package:ecom_app/models/cart_model.dart';
import 'package:ecom_app/utils/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  List<Product> get products => [
        Product('Product 1', 'https://picsum.photos/200', 'Product Description',
            10, 100.0),
        Product('Product 2', 'https://picsum.photos/201', 'Product Description',
            20, 200.0),
        Product('Product 3', 'https://picsum.photos/202', 'Product Description',
            30, 300.0),
        Product('Product 4', 'https://picsum.photos/203', 'Product Description',
            40, 400.0),
        Product('Product 5', 'https://picsum.photos/204', 'Product Description',
            50, 500.0),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HeaderWidget(),
      appBar: appBar(context, title: 'Product List'),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ListTile(
            title: Text('Product ${products[index].name}'),
            subtitle: Text('Description: ${products[index].description}'),
            trailing: Text('Price: ${products[index].price}'),
            leading: Image.network(products[index].image),
            enabled: true,
            onTap: () {
              Provider.of<CartModel>(context, listen: false).addProduct(
                products[index],
              );
            }),
      ),
    );
  }
}
