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
              ? const Text('Cart is Empty')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(1),
                          },
                          border: TableBorder.all(),
                          children: [
                            TableRow(
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
                                ]),
                            ...cart.products
                                .map((product) => TableRow(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(product.name),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(product.price.toString()),
                                        ),
                                      ),
                                    ])),
                            TableRow(children: [
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
                            ])
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
                );
        },
      ),
    );
  }
}
