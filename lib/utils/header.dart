import 'package:ecom_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar appBar(BuildContext context, {String? title}) {
  int count = Provider.of<CartModel>(context).count;
  return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title ?? 'Ecom App'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/cart',
            );
          },
          icon: InkWell(
              child: Stack(alignment: Alignment.center, children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 40,
                ),
                const Positioned(
                  top: -5,
                  right: 0,
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: Badge(
                    label: Text(
                      count.toString(),
                    ),
                  ),
                )
              ]),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/cart',
                );
              }),
        )
      ]);
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/home',
            );
          },
        ),
        ListTile(
          title: const Text('Products'),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/products',
            );
          },
        ),
        ListTile(
          title: const Text('About Us'),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/about',
            );
          },
        ),
        ListTile(
          title: const Text('Contact Us'),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/contact',
            );
          },
        ),
      ]),
    );
  }
}
