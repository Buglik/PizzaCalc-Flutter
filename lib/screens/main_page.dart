import 'package:flutter/material.dart';
import 'package:pizza_calc/models/list_data.dart';
import 'package:pizza_calc/screens/calculator.dart';
import 'package:pizza_calc/screens/list.dart';
import 'package:provider/provider.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListData(0),
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: const [PizzaCalculatorPage(), PizzaListPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.money), label: 'Calculator'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
          ],
          currentIndex: _selectedIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
