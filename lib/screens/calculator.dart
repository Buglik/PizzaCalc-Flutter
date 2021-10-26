import 'package:flutter/material.dart';
import 'package:pizza_calc/models/list_data.dart';
import 'package:provider/src/provider.dart';

class PizzaCalculatorPage extends StatelessWidget {
  const PizzaCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listData = context.watch<ListData>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza calculator'),
      ),
      body: Column(
        children: <Widget>[
          Text(listData.counter.toString()),
          ElevatedButton(onPressed: listData.increment, child: Text('Inc'))
        ],
      ),
    );
  }
}
