import 'package:flutter/material.dart';
import 'package:pizza_calc/models/list_data.dart';
import 'package:provider/src/provider.dart';

class PizzaListPage extends StatelessWidget {
  const PizzaListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listData = context.watch<ListData>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pizza list'),
        ),
        body: Column(
          children: <Widget>[
            Text(listData.pizzas.toString())],
        ),
    );
  }
}
