import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  // cm.counter = 20
  // print(cm.counter); // Disabled because it's private
  int get counter {
    return _counter;
  }

  // set counter(int value) => _counter = value;
  // set counter(int value) {
  //   _counter = value;
  //   notifyListeners();
  // }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}
