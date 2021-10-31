import 'package:flutter/material.dart';
import 'package:pizza_calc/models/list_data.dart';
import 'package:pizza_calc/models/pizza.dart';
import 'package:provider/src/provider.dart';

class PizzaCalculatorPage extends StatefulWidget {
  const PizzaCalculatorPage({Key? key}) : super(key: key);

  @override
  PizzaCalculatorPageState createState() {
    return PizzaCalculatorPageState();
  }
}

@override
class PizzaCalculatorPageState extends State<PizzaCalculatorPage> {
  int? _diameter = 0;
  int? _width = 0;
  int? _height = 0;
  int? _price = 0;
  int _result = 0;
  String? _pizzeriaName;
  String? _name;

  List<bool> _selections = [true, false];

  void _getResult() {
    print('resulting');
    if (_selections[0]) {
      if (_diameter == null || _price == null || _price == 0) {
        print('sth null');
        setState(() {
          _result = 0;
        });
      } else {
        setState(() {
          _result =
              (((_diameter! / 2) * (_diameter! / 2) * 3.14) / _price!).round();
        });
      }
    } else {
      if (_width == null || _height == null || _price == null || _price == 0) {
        setState(() {
          _result = 0;
        });
      } else {
        setState(() {
          _result = (_width! * _height! / _price!).round();
        });
      }
    }
    print(_result.toString());
  }

  Widget _DimensionWidget() {
    if (_selections[0]) {
      return TextFormField(
        onChanged: (String? val) {
          _diameter = int.tryParse(val!) ?? 0;
          _getResult();
        },
        keyboardType: TextInputType.number,
        initialValue: '',
        decoration: const InputDecoration(
          filled: true,
          labelText: 'Diameter (cm)',
          labelStyle: TextStyle(
            color: Color(0xFF716979),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF716979)),
          ),
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 150,
            child: TextFormField(
              onChanged: (String? val) {
                _width = int.tryParse(val!) ?? 0;
                _getResult();
              },
              keyboardType: TextInputType.number,
              initialValue: '',
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Width (cm)',
                labelStyle: TextStyle(
                  color: Color(0xFF716979),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF716979)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: TextFormField(
              onChanged: (String? val) {
                _height = int.tryParse(val!) ?? 0;
                _getResult();
              },
              keyboardType: TextInputType.number,
              initialValue: '',
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Height (cm)',
                labelStyle: TextStyle(
                  color: Color(0xFF716979),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF716979)),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final listData = context.watch<ListData>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Pizza calculator',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (String? val) {
                _price = int.tryParse(val!) ?? 0;
                _getResult();
              },
              keyboardType: TextInputType.number,
              initialValue: '',
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Price (zł)',
                labelStyle: TextStyle(
                  color: Color(0xFF716979),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF716979)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text('Pizza shape')),
                ToggleButtons(
                  children: const <Widget>[
                    Icon(Icons.circle),
                    Icon(Icons.check_box_outline_blank),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < _selections.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          _selections[buttonIndex] = true;
                        } else {
                          _selections[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: _selections,
                ),
              ]),
            ),
            _DimensionWidget(),
            Container(
              width: 125,
              height: 125,
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle),
              child: Text(_result.toString() + 'cmkw/zł'),
            ),
            Container(
              // margin: const EdgeInsets.only(top: 10),
              child: TextFormField(
                onChanged: (String? val) {
                  _pizzeriaName = val;
                },
                initialValue: '',
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Pizzeria',
                  labelStyle: TextStyle(
                    color: Color(0xFF716979),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF716979)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextFormField(
                onChanged: (String? val) {
                  _name = val;
                },
                initialValue: '',
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Pizza name',
                  labelStyle: TextStyle(
                    color: Color(0xFF716979),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF716979)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  print(_result);
                  Pizza newPizza = Pizza(
                      _name!,
                      _price!,
                      _result,
                      _pizzeriaName!,
                      _selections[0] ? Shape.round : Shape.rectangle,
                      _selections[0]
                          ? Dimensions(_diameter, null, null)
                          : Dimensions(null, _width, _height));
                  listData.addPizza(newPizza);
                  print(_result);
                },
                child: const Text('Add to list'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
