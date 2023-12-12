import 'package:ecom_app/models/cart_model.dart';
import 'package:ecom_app/utils/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HeaderWidget(),
      appBar: appBar(context, title: 'Cart'),
      body: Consumer<CartModel>(
        builder: (context, cart, __) {
          return cart.products.isEmpty
              ? empty(context)
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(4),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(1),
                            },
                            border: TableBorder.all(),
                            children: [
                              tableHeader(),
                              ...cart.products.map(
                                (product) => TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(product.title!),
                                        Text(product.description!),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(product.price.toString()),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                        onPressed: () => cart.removeProduct(
                                          product,
                                        ),
                                        icon: const Icon(Icons.delete),
                                      ))
                                ]),
                              ),
                              tableFooter(cart)
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Checkout'),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  SizedBox empty(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Cart is Empty',
            style: TextStyle(fontSize: 30),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                '/products',
              );
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Go to Products'),
          )
        ],
      ),
    );
  }

  TableRow tableFooter(CartModel cart) {
    return TableRow(children: [
      const TableCell(
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Total'),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(cart.totalPrice.toString()),
        ),
      ),
      const TableCell(
        child: Text(''),
      )
    ]);
  }

  TableRow tableHeader() {
    return TableRow(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          border: Border.all(
            color: Colors.blue.shade100,
          ),
        ),
        children: const [
          TableCell(
              child: Center(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Product'),
          ))),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('Price'),
            ),
          )),
          TableCell(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.settings,
              ),
            ),
          )),
        ]);
  }
}
