import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:pizza_calc/models/pizza.dart';

class ListData extends ChangeNotifier {
  final _pizzas = <Pizza>[
    Pizza('pizza1', 10, 15, 'pizzeria1', Shape.round,
        Dimensions(15, null, null)),
    Pizza('pizza2', 15, 30, 'pizzeria2', Shape.rectangle,
        Dimensions(null, 20, 15)),
    Pizza('pizza3', 12, 5, 'pizzeria1', Shape.round,
        Dimensions(15, null, null))
  ];
  int _counter;

  int get counter => _counter;

  Map<String, List<Pizza>>? get pizzas => groupPizzasByPizzeria(_pizzas);

  int sortPizzasByResult (Pizza a, Pizza b) {
    int aInt = a.result;
    int bInt = b.result;
    return aInt - bInt;
  }

  Map<String, List<Pizza>>? groupPizzasByPizzeria(List<Pizza> pizzas) {
    pizzas.sort(sortPizzasByResult);
    return groupBy(pizzas, (Pizza p) {
      return p.pizzeriaName;
    });
  }

  ListData(this._counter);

  void increment() {
    _counter++;
    notifyListeners();
  }

  void addPizza(Pizza pizza) {
    _pizzas.add(pizza);
    notifyListeners();
  }

  void removePizza(Pizza pizza) {
    _pizzas.remove(pizza);
    notifyListeners();
  }
}
