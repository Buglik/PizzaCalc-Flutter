import 'package:flutter/material.dart';
import 'package:pizza_calc/models/list_data.dart';
import 'package:pizza_calc/models/pizza.dart';
import 'package:provider/src/provider.dart';

class PizzaListPage extends StatelessWidget {
  const PizzaListPage({Key? key}) : super(key: key);

  String dimensionsAndPrice(Pizza pizza) {
    var dimensions = pizza.shape == Shape.round
        ? pizza.dimensions.diameter.toString()
        : pizza.dimensions.width.toString() +
            'x' +
            pizza.dimensions.length.toString();
    return dimensions + ' cm | ' + pizza.cost.toString() + 'zł';
  }

  @override
  Widget build(BuildContext context) {
    final listData = context.watch<ListData>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pizza list',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
          children: listData.pizzas!.keys.map((key) {
        return Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(padding: EdgeInsets.fromLTRB(24,12,0,0),child: Text(key, style: TextStyle(color: Colors.blueGrey),)),
          ),
          ...listData.pizzas![key]!.map((pizza) {
            return ListTile(
              contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
              leading: pizza.shape == Shape.round
                  ? Icon(
                      Icons.circle,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.black,
                    ),
              title: Text(pizza.name),
              subtitle: Text(dimensionsAndPrice(pizza)),
              trailing: Column(
                children: [
                  Text(pizza.result.toString()),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        listData.removePizza(pizza);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ]);
      }).toList()
          // <Widget>[Text(listData.pizzas.toString())],
          ),
    );
  }
}
