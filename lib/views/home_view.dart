import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String title;
  const HomeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
    );
  }
}
