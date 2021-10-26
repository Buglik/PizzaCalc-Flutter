import 'package:flutter/material.dart';

class ListData extends ChangeNotifier {
  int _counter;

  int get counter => _counter;

  ListData(this._counter);

  void increment() {
    _counter++;
    notifyListeners();
  }
}
