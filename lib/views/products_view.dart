import 'package:ecom_app/classes/product.dart';
import 'package:ecom_app/models/cart_model.dart';
import 'package:ecom_app/utils/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  final List<Product> products;
  const ProductsView({super.key, required this.products});

  // List<Product> get products => [
  //       Product(
  //         title: 'Product 1',
  //         thumbnail: 'https://picsum.photos/200',
  //         description: 'Product Description',
  //         stock: 10,
  //         price: 100.0,
  //       ),
  //       Product(
  //         title: 'Product 2',
  //         thumbnail: 'https://picsum.photos/201',
  //         description: 'Product Description',
  //         stock: 10,
  //         price: 200.0,
  //       )
  //     ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HeaderWidget(),
      appBar: appBar(context, title: 'Product List'),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ListTile(
            title: Text('Product ${products[index].title}'),
            subtitle: Text('Description: ${products[index].description}'),
            trailing: Text('Price: ${products[index].price}'),
            leading: Image.network(products[index].thumbnail!),
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
