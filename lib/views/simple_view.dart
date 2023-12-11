import 'package:ecom_app/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleView extends StatelessWidget {
  const SimpleView({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<CounterModel>(context).counter;
    CounterModel cm = Provider.of<CounterModel>(context, listen: false);
    return Material(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Counter Value: $counter',
          style: const TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                cm.increment();
              },
              child: const Text('Increments'),
            ),
            TextButton(
              onPressed: () {
                cm.decrement();
              },
              child: const Text('Decrements'),
            ),
            TextButton(
              onPressed: () {
                cm.reset();
              },
              child: const Text('Reset'),
            )
          ],
        ),
      ]),
    );
  }
}
