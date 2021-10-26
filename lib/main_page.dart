import 'package:flutter/material.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Pizza calculator'),
      // ),
      body: PageView(
        controller: pageController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.blue)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
        ],
        currentIndex: _selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
