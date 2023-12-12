import 'package:ecom_app/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Simple2View extends StatelessWidget {
  const Simple2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(builder: (_, model, __) {
      return Material(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Counter Value: ${model.counter}',
            style: const TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  model.increment();
                },
                child: const Text('Increments'),
              ),
              TextButton(
                onPressed: () {
                  model.decrement();
                },
                child: const Text('Decrements'),
              ),
              TextButton(
                onPressed: () {
                  model.reset();
                },
                child: const Text('Reset'),
              )
            ],
          ),
        ]),
      );
    });
  }
}
